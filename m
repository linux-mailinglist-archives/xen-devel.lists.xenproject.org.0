Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F6D260E7E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 11:16:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFZij-0008J8-1o; Tue, 08 Sep 2020 09:15:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFZih-0008J3-UT
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 09:15:19 +0000
X-Inumbo-ID: b29b6479-68cb-491c-94af-478208bc36ae
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b29b6479-68cb-491c-94af-478208bc36ae;
 Tue, 08 Sep 2020 09:15:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9AA84B190;
 Tue,  8 Sep 2020 09:15:18 +0000 (UTC)
Subject: Re: [PATCH v3] hvmloader: indicate ACPI tables with "ACPI data" type
 in e820
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, iwj@xenproject.org
References: <1599522163-21992-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <376039c8-41d7-2216-36e8-1a226b0af499@suse.com>
Date: Tue, 8 Sep 2020 11:15:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599522163-21992-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.09.2020 01:42, Igor Druzhinin wrote:
> Changes in v3:
> - switched from NVS to regular "ACPI data" type by separating ACPI allocations
>   into their own region
> - gave more information on particular kexec usecase that requires this change

Thanks a lot for doing both of these.

> --- a/tools/firmware/hvmloader/e820.c
> +++ b/tools/firmware/hvmloader/e820.c
> @@ -155,6 +155,8 @@ int build_e820_table(struct e820entry *e820,
>  {
>      unsigned int nr = 0, i, j;
>      uint32_t low_mem_end = hvm_info->low_mem_pgend << PAGE_SHIFT;
> +    unsigned long acpi_mem_end =
> +        ACPI_MEMORY_DYNAMIC_START + (acpi_pages_allocated() << PAGE_SHIFT);
>  
>      if ( !lowmem_reserved_base )
>              lowmem_reserved_base = 0xA0000;
> @@ -199,8 +201,19 @@ int build_e820_table(struct e820entry *e820,
>      nr++;
>  
>      /*
> +     * Mark populated reserved memory that contains ACPI tables as ACPI data.
> +     * That should help the guest to treat it correctly later: e.g. pass to
> +     * the next kernel on kexec or reclaim if necessary.
> +     */
> +
> +    e820[nr].addr = RESERVED_MEMBASE;
> +    e820[nr].size = acpi_mem_end - RESERVED_MEMBASE;
> +    e820[nr].type = E820_ACPI;
> +    nr++;

This region may be empty (afaict), when !acpi_enabled. Imo we'd better
avoid adding empty ranges.

> @@ -210,8 +223,8 @@ int build_e820_table(struct e820entry *e820,
>      {
>          uint32_t igd_opregion_base = igd_opregion_pgbase << PAGE_SHIFT;
>  
> -        e820[nr].addr = RESERVED_MEMBASE;
> -        e820[nr].size = (uint32_t) igd_opregion_base - RESERVED_MEMBASE;
> +        e820[nr].addr = acpi_mem_end;
> +        e820[nr].size = igd_opregion_base - acpi_mem_end;
>          e820[nr].type = E820_RESERVED;
>          nr++;
>  
> @@ -227,7 +240,7 @@ int build_e820_table(struct e820entry *e820,
>      }
>      else
>      {
> -        e820[nr].addr = RESERVED_MEMBASE;
> +        e820[nr].addr = acpi_mem_end;
>          e820[nr].size = (uint32_t)-e820[nr].addr;
>          e820[nr].type = E820_RESERVED;
>          nr++;

In both cases - why not RESERVED_MEMORY_DYNAMIC_START? I.e. why
mark reserved space that isn't in use for anything?

Jan

