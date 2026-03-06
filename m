Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI+7FxevqmluVQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:40:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FBD21EFA4
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:40:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247605.1546163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vySbI-0006Gx-E6; Fri, 06 Mar 2026 10:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247605.1546163; Fri, 06 Mar 2026 10:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vySbI-0006Eg-B6; Fri, 06 Mar 2026 10:40:08 +0000
Received: by outflank-mailman (input) for mailman id 1247605;
 Fri, 06 Mar 2026 10:40:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vySbH-0006Ea-87
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 10:40:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vySbG-008D0L-2l;
 Fri, 06 Mar 2026 10:40:06 +0000
Received: from [2a02:8012:3a1:0:f0b8:207:419e:3d8a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vySbG-001kA1-1y;
 Fri, 06 Mar 2026 10:40:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=W0OhQJULL61N9iDqMbX1ksT7S5t5/3mGGFgX1NczVE8=; b=6j1tiyj7l7GuAUdQvYALMJrsds
	K+3lNYE+tEsWV6zfSGIQ8HFnyUWDq8ZHyWYQmwBYyMnL3HxjRr+ll6BKrAcLTM9ktpQ4lxDk7ZBN6
	Pm31iYm9yZf95YPjZzDOQ+/F/mzICmbUFGDIIo//QuPO+8k4OizgdE56k13Gbeeh8EHE=;
Message-ID: <c075f47f-09f1-443b-949f-936534f75ded@xen.org>
Date: Fri, 6 Mar 2026 10:40:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Content-Language: en-GB
To: "Halder, Ayan Kumar" <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260305194358.2564387-1-ayan.kumar.halder@amd.com>
 <f1a5a509-bc6d-4616-872c-c5bb1ecf9da7@xen.org>
 <f10e2a5e-446c-42f2-b9ce-44498acbfb1e@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f10e2a5e-446c-42f2-b9ce-44498acbfb1e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D5FBD21EFA4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ayankuma@amd.com,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Ayan,

On 06/03/2026 09:51, Halder, Ayan Kumar wrote:
> 
> On 06/03/2026 09:24, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 05/03/2026 19:43, Ayan Kumar Halder wrote:
>>> Set GICV3_NR_LRS as per the number of list registers in the supported
>>> hardware. This ensures:
>>>
>>> 1. In gicv3_save_lrs()/gicv3_restore_lrs(), use the number of list
>>> registers from GICV3_NR_LRS (if defined) instead of gicv3_info.nr_lrs.
>>> This ensures that if the hardware does not support more than 4 LRs
>>> (for example), the code accessing LR 4-15 is never reached. The
>>> compiler can eliminate the unsupported cases as the switch case uses a
>>> constant conditional.
>>>
>>> 2. Similarly In gicv3_ich_read_lr()/gicv3_ich_write_lr() , we can
>>> justify that the unsupported LRs (4-15) will never be reached as Xen
>>> will panic if the runtime value (lr) exceeds GICV3_NR_LRS. Some
>>> compiler can eliminate the code accessing LR 4-15.
>>> In this situation, using panic() is better than accessing a list
>>> register which is not present in the hardware
>>>
>>> 3. Whenever GICV3_NR_LRS is defined, the default condition and the
>>> related BUG() cannot be reached at all.
>>
>> I am not sure how this is better. You will still crash Xen is 'lr' >= 
>> GICV3_NR_LRS. Can you provide some details?
>>
>> > > As part of functional safety effort, we are trying to enable system
>>> integrator to configure Xen for a specific platform with a predefind
>>> set of GICv3 list registers. So that we can minimize the chance of
>>> runtime issues and reduce the codesize that will execute.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>>   xen/arch/arm/Kconfig  |  9 +++++++++
>>>   xen/arch/arm/gic-v3.c | 12 ++++++++++--
>>>   2 files changed, 19 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 2f2b501fda..6540013f97 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -276,6 +276,15 @@ config PCI_PASSTHROUGH
>>>     endmenu
>>>   +config GICV3_NR_LRS
>>> +    int "Number of GICv3 Link Registers supported" if EXPERT
>>> +    depends on GICV3
>>> +    range 0 16
>>> +    default 0
>>> +    help
>>> +      Controls the number of Link registers to be accessed.
>>> +      Keep it set to 0 to use a value obtained from a hardware 
>>> register.
>>> +
>>>   menu "ARM errata workaround via the alternative framework"
>>>       depends on HAS_ALTERNATIVE
>>>   diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>> index bc07f97c16..fb2985fd52 100644
>>> --- a/xen/arch/arm/gic-v3.c
>>> +++ b/xen/arch/arm/gic-v3.c
>>> @@ -51,6 +51,8 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
>>>   #define GICD                   (gicv3.map_dbase)
>>>   #define GICD_RDIST_BASE        (this_cpu(rbase))
>>>   #define GICD_RDIST_SGI_BASE    (GICD_RDIST_BASE + SZ_64K)
>>> +#define lrs                    (CONFIG_GICV3_NR_LRS ?: \
>>> +                                gicv3_info.nr_lrs)
>>
>> We should avoid lowercase define, in particular with generic names 
>> like 'lrs'. I think in this case, I would rather update 
>> gicv3_info.nr_lrs:
>>
>> gicv3_info.nr_lrs = min(gv3_info.nr_lrs, CONFIG_GICV3_NR_LRS);
> 
> But we want to enforce the user to set CONFIG_GICV3_NR_LRS , so that we 
> don't have to rely on gicv3_info.nr_lrs.
> > The only reason to use gicv3_info.nr_lrs is for backward compatibility
> i.e. when the user forgot to set the config and as a result it used the 
> default value as 0. We don't want to allow this for the safety use cases.

Xen upstream has to support various use cases. One of the use-case is 
Linux distributions where they want one Xen binary booting on multiple 
HW. So "gicv3_info.nr_lrs" will have to stay forever.

Now with CONFIG_GICV3_NR_LRS in place, I am concerned that someone will 
try to configure the value to let say 16 but their HW support only 4. I 
can't find any check at boot, so any problem will still occur at runtime.

> 
>>
>> This would solve another problem where you don't sanity check that the 
>> system effectively support CONFIG_GICV3_NR_LRS.
>>
>>> @@ -121,7 +123,7 @@ static inline void gicv3_save_lrs(struct vcpu *v)
>>>   static inline void gicv3_restore_lrs(const struct vcpu *v)
>>>   {
>>>       /* Fall through for all the cases */
>>> -    switch ( gicv3_info.nr_lrs )
>>> +    switch ( lrs )
>>>       {
>>>       case 16:
>>>           WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
>>> @@ -178,6 +180,9 @@ static inline void gicv3_restore_lrs(const struct 
>>> vcpu *v)
>>>     static uint64_t gicv3_ich_read_lr(int lr)
>>>   {
>>> +    if ( lr >= lrs )
>>> +        panic("Unsupported number of LRs\n");
>>
>> Do we really have to panic in production build? Wouldn't it be better 
>> to return '0' and maybe use ASSERT for a crash in debug build? Same 
>> below.
> You are right, we may not need this. One option I am thinking is ...
>>
>>> +
>>>       switch ( lr )
> 
> switch ( lr & (lrs - 1) )
> 
> This ensures that we do not hit the unsupported cases.

What about implementing it as RAZ-WI? This would make any issue more 
reliable/obvious (if you have multiple index accessing the same LR, then 
you could end up overwriting an existing virtual interrupt).

Cheers,

-- 
Julien Grall


