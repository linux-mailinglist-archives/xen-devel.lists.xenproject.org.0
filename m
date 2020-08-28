Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F8255E36
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:51:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBgeK-0003xh-Nt; Fri, 28 Aug 2020 15:50:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8pf4=CG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBgeJ-0003xc-Ne
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:50:43 +0000
X-Inumbo-ID: 1b15cd91-be1c-4719-a34f-d2ab11ed7414
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b15cd91-be1c-4719-a34f-d2ab11ed7414;
 Fri, 28 Aug 2020 15:50:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6E03AE33;
 Fri, 28 Aug 2020 15:51:14 +0000 (UTC)
Subject: Re: [PATCH] hvmloader: indicate firmware tables as ACPI NVS in e820
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, iwj@xenproject.org
References: <1598573599-23792-1-git-send-email-igor.druzhinin@citrix.com>
 <4f3a5ac9-06aa-65f5-b4e0-1d9ab01adb5a@suse.com>
 <2f1f937a-81f2-2aa3-f414-3bf8467715bd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f7936a44-9ed9-811e-a54a-6b6d2d16a142@suse.com>
Date: Fri, 28 Aug 2020 17:50:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2f1f937a-81f2-2aa3-f414-3bf8467715bd@citrix.com>
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

On 28.08.2020 16:45, Igor Druzhinin wrote:
> On 28/08/2020 08:51, Jan Beulich wrote:
>> On 28.08.2020 02:13, Igor Druzhinin wrote:
>>> Guest kernel does need to know in some cases where the tables are located
>>> to treat these regions properly. One example is kexec process where
>>> the first kernel needs to pass firmware region locations to the second
>>> kernel which is now a requirement after 02a3e3cdb7f12 ("x86/boot: Parse SRAT
>>> table and count immovable memory regions").
>>>
>>> The memory that hvmloader allocates in the reserved region mostly contains
>>> these useful tables and could be safely indicated as ACPI without the need
>>> to designate a sub-region specially for that. Making it non-reclaimable
>>> (ACPI NVS) would avoid potential reuse of this memory by the guest.
>>> Swtiching from Reserved to ACPI NVS type for this memory would also mean
>>> its content is preserved across S4 (which is true for any ACPI type according
>>> to the spec).
>>
>> Marking the range as ACPI is certainly fine, but why did you choose NVS?
>> There's nothing non-volatile there afaict. And the part of the last
>> sentence in parentheses suggests to me that the "normal" ACPI type is as
>> suitable for the purpose you're after.
> 
> The problem with normal ACPI type is that according to the spec it's reclaimable
> by the OS:
> "This range is available RAM usable by the OS after it reads the ACPI tables."
> while NVS type is specifically designated as non-reclaimable. The spec is also
> denotes that both normal and NVS types should be preserved across S4 - that sounds
> ambiguous to me. But it might mean that non-NVS preservation is not OS
> responsibility as it's assumed to be static.

I've taken a random system and found that all of its "real" ACPI
tables, in particular the DSDT, live in "ACPI data", not "ACPI NVS".
The DSDT includes AML, which I understand is needed at runtime. So
"after it reads the ACPI tables" is even more ambiguous than just
wrt S4 as you say.

> Our region also contains VM86 TSS which we certainly need at runtime (although that
> could be allocated from the reserved region above if desirable).
> 
> To stay on the safe side and do not rely on perceived sensible OS behavior NVS type
> was chosen which OS shouldn't touch under any circumstances.

Can you at the very least emphasize this in the description?

>>> --- a/tools/firmware/hvmloader/e820.c
>>> +++ b/tools/firmware/hvmloader/e820.c
>>> @@ -155,6 +155,8 @@ int build_e820_table(struct e820entry *e820,
>>>  {
>>>      unsigned int nr = 0, i, j;
>>>      uint32_t low_mem_end = hvm_info->low_mem_pgend << PAGE_SHIFT;
>>> +    uint32_t firmware_mem_end =
>>> +        RESERVED_MEMORY_DYNAMIC_START + (mem_mfns_allocated() << PAGE_SHIFT);
>>
>> Here and elsewhere - please avoid uint32_t and friends when a plain
>> C type (unsigned int or unsigned long in this case) will do.
> 
> Ok, should I also take a chance and convert some of the surroundings?

In general I'd recommend only adjusting code which gets touched
anyway; in a few cases adjacent code better also gets adjusted
so everything together looks reasonably consistent afterwards.
But I didn't think this was necessary here. IOW - I'd suggest
you don't, but in the end it's up to you (at the risk of needing
to undo parts if you end up going too far).

Jan

