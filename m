Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49237261031
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 12:45:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFb7L-00005V-PG; Tue, 08 Sep 2020 10:44:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j1cc=CR=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kFb7K-00005Q-Ay
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 10:44:50 +0000
X-Inumbo-ID: 8fc7ee9c-f349-4c98-bdfc-94075d432fbf
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fc7ee9c-f349-4c98-bdfc-94075d432fbf;
 Tue, 08 Sep 2020 10:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599561888;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Wr+Hv/V8opVNIWQyxA0Q8W5ooBvjPkAmx6xjH5kPsl4=;
 b=BxMmeY+NHOEpnA0GnD0+2ceGn8EZOpzkKiib+0rmmECmMywHk5bdiZLi
 ZZqDRcnVkSBdIcn0MoTMQjr41XhMKDl6wnjX/j6eOGbCo9DaJC72eoufY
 Ds7yWjKcNgI7qtfFStvQ+K4qz5cYvvCIZY+YUGNj8/BwNK8CIDukxiZjI M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ukL8Oz6PtMR6IvNyxPFajUisJc/vLclrTzIEJDg+vuYevAGhwNb+IkQx71pIWh0OtNz9kAzOf8
 W5b1pYRa5jaFCR7yvrtLeZBp4xhvR0+TqYYMKQ7mxdvSEUuTm5Km+p6KUkUkvju5IrSBkzoVZ+
 Un2Q/Kb9+PTV5jVI/erBMFim9e1y88augY/yT/b6UA9GAl4sUb1E3AbqxsPt7bZE6cP5QW44DU
 AY7GOIaVVfjGpcq6B4YBJanpGPdbsbCAiWlxz8ffuXkeuZAvOvG9OM3ipBOcP5JQqb+o4tK2IR
 YdM=
X-SBRS: 2.7
X-MesageID: 27140155
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,405,1592884800"; d="scan'208";a="27140155"
Subject: Re: [PATCH v3] hvmloader: indicate ACPI tables with "ACPI data" type
 in e820
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
 <roger.pau@citrix.com>, <wl@xen.org>, <iwj@xenproject.org>
References: <1599522163-21992-1-git-send-email-igor.druzhinin@citrix.com>
 <376039c8-41d7-2216-36e8-1a226b0af499@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <01346ec8-ece4-200a-d108-bd65aab23d47@citrix.com>
Date: Tue, 8 Sep 2020 11:44:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <376039c8-41d7-2216-36e8-1a226b0af499@suse.com>
Content-Type: text/plain; charset="utf-8"
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

On 08/09/2020 10:15, Jan Beulich wrote:
> On 08.09.2020 01:42, Igor Druzhinin wrote:
>> Changes in v3:
>> - switched from NVS to regular "ACPI data" type by separating ACPI allocations
>>   into their own region
>> - gave more information on particular kexec usecase that requires this change
> 
> Thanks a lot for doing both of these.
> 
>> --- a/tools/firmware/hvmloader/e820.c
>> +++ b/tools/firmware/hvmloader/e820.c
>> @@ -155,6 +155,8 @@ int build_e820_table(struct e820entry *e820,
>>  {
>>      unsigned int nr = 0, i, j;
>>      uint32_t low_mem_end = hvm_info->low_mem_pgend << PAGE_SHIFT;
>> +    unsigned long acpi_mem_end =
>> +        ACPI_MEMORY_DYNAMIC_START + (acpi_pages_allocated() << PAGE_SHIFT);
>>  
>>      if ( !lowmem_reserved_base )
>>              lowmem_reserved_base = 0xA0000;
>> @@ -199,8 +201,19 @@ int build_e820_table(struct e820entry *e820,
>>      nr++;
>>  
>>      /*
>> +     * Mark populated reserved memory that contains ACPI tables as ACPI data.
>> +     * That should help the guest to treat it correctly later: e.g. pass to
>> +     * the next kernel on kexec or reclaim if necessary.
>> +     */
>> +
>> +    e820[nr].addr = RESERVED_MEMBASE;
>> +    e820[nr].size = acpi_mem_end - RESERVED_MEMBASE;
>> +    e820[nr].type = E820_ACPI;
>> +    nr++;
> 
> This region may be empty (afaict), when !acpi_enabled. Imo we'd better
> avoid adding empty ranges.

Thanks, will gate creation of this region on acpi_enabled.

>> @@ -210,8 +223,8 @@ int build_e820_table(struct e820entry *e820,
>>      {
>>          uint32_t igd_opregion_base = igd_opregion_pgbase << PAGE_SHIFT;
>>  
>> -        e820[nr].addr = RESERVED_MEMBASE;
>> -        e820[nr].size = (uint32_t) igd_opregion_base - RESERVED_MEMBASE;
>> +        e820[nr].addr = acpi_mem_end;
>> +        e820[nr].size = igd_opregion_base - acpi_mem_end;
>>          e820[nr].type = E820_RESERVED;
>>          nr++;
>>  
>> @@ -227,7 +240,7 @@ int build_e820_table(struct e820entry *e820,
>>      }
>>      else
>>      {
>> -        e820[nr].addr = RESERVED_MEMBASE;
>> +        e820[nr].addr = acpi_mem_end;
>>          e820[nr].size = (uint32_t)-e820[nr].addr;
>>          e820[nr].type = E820_RESERVED;
>>          nr++;
> 
> In both cases - why not RESERVED_MEMORY_DYNAMIC_START? I.e. why
> mark reserved space that isn't in use for anything?

I think it's better to reserve space that a) isn't suppose to be in use for anything - 
we don't really want some MMIO being accidentally mapped there and confusing whatever in
our fragile model, b) that wasn't a hole before so it'd be dangerous to make it that
way here. Overall, I think it's better to keep this space as reserved as possible as
before.

Igor

