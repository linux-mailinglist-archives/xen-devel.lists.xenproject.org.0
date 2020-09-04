Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A22D25D3B9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 10:33:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE79c-0005Y6-Ap; Fri, 04 Sep 2020 08:33:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kE79a-0005Y1-OL
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 08:33:02 +0000
X-Inumbo-ID: 93c42969-129f-4ab7-876f-4da77de59f99
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93c42969-129f-4ab7-876f-4da77de59f99;
 Fri, 04 Sep 2020 08:33:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DEF40B655;
 Fri,  4 Sep 2020 08:33:01 +0000 (UTC)
Subject: Re: [PATCH v2.1] hvmloader: indicate dynamically allocated memory as
 ACPI NVS in e820
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, iwj@xenproject.org
References: <1598928634-30849-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b7880132-5e6a-090d-ed9a-b46171803be3@suse.com>
Date: Fri, 4 Sep 2020 10:33:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1598928634-30849-1-git-send-email-igor.druzhinin@citrix.com>
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

On 01.09.2020 04:50, Igor Druzhinin wrote:
> Guest kernel does need to know in some cases where the tables are located
> to treat these regions properly. One example is kexec process where
> the first kernel needs to pass firmware region locations to the second
> kernel which is now a requirement after 02a3e3cdb7f12 ("x86/boot: Parse SRAT
> table and count immovable memory regions").

I'm still struggling with the connection here: Reserved regions
surely are "immovable" too, aren't they? Where's the connection to
the E820 map in the first place - the change cited above is entirely
about SRAT? And I can't imagine kexec getting away with passing on
ACPI NVS regions, but not reserved ones.

> The memory that hvmloader allocates in the reserved region mostly contains
> these useful tables and could be safely indicated as ACPI without the need
> to designate a sub-region specially for that. Making it non-reclaimable
> (ACPI NVS) in contrast with ACPI reclaim (ACPI table) memory would avoid
> potential reuse of this memory by the guest taking into account this region
> may contain runtime structures like VM86 TSS, etc. If necessary, those
> can be moved away later and the region marked as reclaimable.

Some of this may want reflecting also ...

> @@ -199,8 +201,19 @@ int build_e820_table(struct e820entry *e820,
>      nr++;
>  
>      /*
> +     * Mark populated reserved memory that contains ACPI and other tables as
> +     * ACPI NVS (non-reclaimable) space - that should help the guest to treat
> +     * it correctly later (e.g. pass to the next kernel on kexec).
> +     */
> +
> +    e820[nr].addr = RESERVED_MEMBASE;
> +    e820[nr].size = firmware_mem_end - RESERVED_MEMBASE;
> +    e820[nr].type = E820_NVS;
> +    nr++;

... in the comment you introduce here.

Jan

