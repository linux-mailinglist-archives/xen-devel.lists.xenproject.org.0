Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1658B9BFB31
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 02:11:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831491.1246814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8r3Q-0003bg-Ha; Thu, 07 Nov 2024 01:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831491.1246814; Thu, 07 Nov 2024 01:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8r3Q-0003ZE-Ep; Thu, 07 Nov 2024 01:11:20 +0000
Received: by outflank-mailman (input) for mailman id 831491;
 Thu, 07 Nov 2024 01:11:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PMW=SC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8r3P-0003Z8-2X
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 01:11:19 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f0cf6c9-9ca5-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 02:11:15 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173094187001415.199790424614548;
 Wed, 6 Nov 2024 17:11:10 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2f0cf6c9-9ca5-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJmMGNmNmM5LTljYTUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTQxODc2LjEzNzY0LCJzZW5kZXIiOiJkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; t=1730941871; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HFOLFFMxxVVusp8mjjeYdYVZYzVBi1a/MYQbk8Y2JY0QO6kgxZGSk2i1I6TWLcj2JM+DV7+1JnC1s8gZNBKX0ZSCDwmlau5uSQG+gdjb1TGy3T5SaQpYd8UGziScf+ua8359S2tIQzxWXaV11JhkCZKaq9TXLL0rH98Dh050Qec=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730941871; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eH7aAfbG1KG3/E0hO1jW3zLi6HI2ZqZgpiDCerskCYw=; 
	b=gSBD4kenIejjy8foDpVeOmLhlatf4f5vFKXVVzSiPEQ9F8rdfEqsJUrgVlomZKIwz+UYl0EsK6Wk+LR8ITulx8q3Mf+8joSil9PiWAXba2aAiD7MnITwC8IZ9imrfVpVEyW0qycZIJLIZ86eik9L+LbkxGOvLUGi8ktlOhxjgd4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730941871;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eH7aAfbG1KG3/E0hO1jW3zLi6HI2ZqZgpiDCerskCYw=;
	b=sEcJ3xGIiHLfV+ikurXEExvZTQlGrXVKVswA6xy15pHlCUGhuS4rPQ7t0eq2Y27I
	SMEp9G/lcIrGrpbKXgNogtRZ9AmRBVixBJW5TrnP9iRPHks9R7tu18xAHlrxj6KBioy
	TI79T4v7VUt1t6SwTQMgwtVjL3FIXsh0S2TeHIss=
Message-ID: <b1e6b6c3-4b38-4f56-bcd6-147ed0dc9a2b@apertussolutions.com>
Date: Wed, 6 Nov 2024 20:11:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] x86/boot: convert domain construction to use boot
 info
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-9-dpsmith@apertussolutions.com>
 <990c8955-ae4a-449f-a40c-7c15faf61154@amd.com>
 <53590a98-f4cc-42cb-b85b-9820fcedecf3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <53590a98-f4cc-42cb-b85b-9820fcedecf3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/6/24 19:14, Andrew Cooper wrote:
> On 06/11/2024 11:06 pm, Jason Andryuk wrote:
>> On 2024-11-02 13:25, Daniel P. Smith wrote:
>>> With all the components used to construct dom0 encapsulated in struct
>>> boot_info
>>> and struct boot_module, it is no longer necessary to pass all them as
>>> parameters down the domain construction call chain. Change the
>>> parameter list
>>> to pass the struct boot_info instance and the struct domain reference.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> ---
>>> Changes since v5:
>>> - renamed from "x86/boot: convert create_dom0 to use boot info"
>>>
>>> Changes since v5:
>>> - change headroom back to unsigned long
>>> - make mod_idx unsigned int
>>> ---
>>>    xen/arch/x86/dom0_build.c             |  9 ++--
>>>    xen/arch/x86/hvm/dom0_build.c         | 49 +++++++++++++---------
>>>    xen/arch/x86/include/asm/dom0_build.h | 13 ++----
>>>    xen/arch/x86/include/asm/setup.h      |  7 ++--
>>>    xen/arch/x86/pv/dom0_build.c          | 59 ++++++++++++++++-----------
>>>    xen/arch/x86/setup.c                  | 33 ++++++++-------
>>>    6 files changed, 95 insertions(+), 75 deletions(-)
>>>
>>
>>> diff --git a/xen/arch/x86/hvm/dom0_build.c
>>> b/xen/arch/x86/hvm/dom0_build.c
>>> index a4ac262db463..cd97f94a168a 100644
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>
>>> @@ -1301,16 +1302,25 @@ static void __hwdom_init
>>> pvh_setup_mmcfg(struct domain *d)
>>>        }
>>>    }
>>>    -int __init dom0_construct_pvh(struct domain *d, const module_t
>>> *image,
>>> -                              unsigned long image_headroom,
>>> -                              module_t *initrd,
>>> -                              const char *cmdline)
>>> +int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
>>>    {
>>>        paddr_t entry, start_info;
>>> +    struct boot_module *image;
>>> +    struct boot_module *initrd = NULL;
>>>        int rc;
>>>          printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n",
>>> d->domain_id);
>>>    +    rc = first_boot_module_index(bi, BOOTMOD_KERNEL);
>>> +    if ( unlikely(rc < 0 || rc > bi->nr_modules) )
>>
>> Here and ...
>>
>>> +        panic("Missing kernel boot module for %pd construction\n", d);
>>> +
>>> +    image = &bi->mods[rc];
>>> +
>>> +    rc = first_boot_module_index(bi, BOOTMOD_RAMDISK);
>>> +    if ( rc > 0 || rc < bi->nr_modules )
>>
>> ... here.  Can we just check rc < bi->nr_modules for validity?
> 
> You could, but eventually MISRA will say no and I suspect it will then
> be made your problem to fix.
> 
> In this case, we ought to have an `unsigned int idx` and not (re)use rc.

I can move to using an unsigned and ...

> Also, we panic far earlier in __start_xen() if there's no dom0 kernel,
> so I think we can just assert that rather than having a logically dead
> panic() path.

convert it to an ASSERT().

>>    Valid modules are 0...nr_modules and not found is MAX_NR_BOOTMODS +
>> 1.  It eliminates these unecessary double checks.  This would apply to
>> 04/12 "x86/boot: introduce module release" as well.
>>
>>> +        initrd = &bi->mods[rc];
>>> +
>>>        if ( is_hardware_domain(d) )
>>>        {
>>>            /*
>>
>>
>>> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
>>> index c1f44502a1ac..594874cd8d85 100644
>>> --- a/xen/arch/x86/pv/dom0_build.c
>>> +++ b/xen/arch/x86/pv/dom0_build.c
>>
>>> @@ -374,10 +371,13 @@ static int __init dom0_construct(struct domain *d,
>>>        unsigned int flush_flags = 0;
>>>        start_info_t *si;
>>>        struct vcpu *v = d->vcpu[0];
>>> -    void *image_base = bootstrap_map(image);
>>> -    unsigned long image_len = image->mod_end;
>>> -    void *image_start = image_base + image_headroom;
>>> -    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
>>> +    struct boot_module *image;
>>> +    struct boot_module *initrd = NULL;
>>> +    void *image_base;
>>> +    unsigned long image_len;
>>> +    void *image_start;
>>> +    unsigned long initrd_len = 0;
>>> +    const char *cmdline;
>>>        l4_pgentry_t *l4tab = NULL, *l4start = NULL;
>>>        l3_pgentry_t *l3tab = NULL, *l3start = NULL;
>>>        l2_pgentry_t *l2tab = NULL, *l2start = NULL;
>>> @@ -414,6 +414,23 @@ static int __init dom0_construct(struct domain *d,
>>>          printk(XENLOG_INFO "*** Building a PV Dom%d ***\n",
>>> d->domain_id);
>>>    +    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
>>> +    if ( unlikely(i < 0 || i > bi->nr_modules) )
>>
>> Single check here.
> 
> Similar argument.  Except it turns out that i is used for precisely two
> loops in dom0_construct() both of which are from 0 to either 4 or 32.
> 
> So it very much can be converted to being an unsigned variable, and then
> this works nicely.

Ack.

> That said, drop the unlikely().   This is an init function run once, and
> all it is doing is reducing legibility.

Ack.

>>
>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>> index aba9df8620ef..d9785acf89b6 100644
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -977,10 +977,7 @@ static unsigned int __init copy_bios_e820(struct
>>> e820entry *map, unsigned int li
>>>        return n;
>>>    }
>>>    -static struct domain *__init create_dom0(const module_t *image,
>>> -                                         unsigned long headroom,
>>> -                                         module_t *initrd, const
>>> char *kextra,
>>> -                                         const char *loader)
>>> +static struct domain *__init create_dom0(struct boot_info *bi)
>>>    {
>>>        static char __initdata cmdline[MAX_GUEST_CMDLINE];
>>>    @@ -997,6 +994,14 @@ static struct domain *__init create_dom0(const
>>> module_t *image,
>>>        };
>>>        struct domain *d;
>>>        domid_t domid;
>>> +    struct boot_module *image;
>>> +    unsigned int idx;
>>> +
>>> +    idx = first_boot_module_index(bi, BOOTMOD_KERNEL);
>>> +    if ( unlikely(idx < 0 || idx > bi->nr_modules) )
>>
>> Single check here please.
> 
> I'm surprised that the compiler didn't complain about "idx < 0" being
> tautological here.

As above, unsigned and ASSERT.

v/r,
dps


