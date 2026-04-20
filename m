Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FD5GxFA5mlutgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:02:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2417E42DBD1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:02:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286192.1567297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEq8m-0007lP-07; Mon, 20 Apr 2026 15:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286192.1567297; Mon, 20 Apr 2026 15:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEq8l-0007j2-Sw; Mon, 20 Apr 2026 15:02:23 +0000
Received: by outflank-mailman (input) for mailman id 1286192;
 Mon, 20 Apr 2026 15:02:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEq8j-0007it-Pt
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:02:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEq8j-004GeX-2f
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:02:21 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e63ffb-bab6-0a2a0a5309dd-0a2a4509a048-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:02:20 +0200
Received: from [209.85.208.182] (helo=mail-lj1-f182.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e63ffc-2497-0a2a45090019-d155d0b6a9e5-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:02:20 +0200
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-38dd575bca3so40155251fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 08:02:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187e7a62sm2971869e87.56.2026.04.20.08.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 08:02:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776697340; x=1777302140; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9pHylE/WjW6XUQ0m8ic5aY3Qs3biYzaa9JkC4on7POw=;
        b=apvWCjkwE9jbp91JZl3HQMo4AqZCNK/Sales5jjQQBJDAJQ3N2qkIz0QUkyEP+B480
         I1PMlTfV09+BO3EWd56ls6LfnaOV+k42Xkb7fYTYFRLjPRWcA6AeENe1mVFRlGR6eEgt
         OOc4PTSHqNYzNLXch6Dx8bvGbGs3OTw2bEq5mHi0nbOcr7xxs1eMeBAMbtY6q08Ka1ys
         nQdA7fnxYlC7xb81Oh+Ubk1ekXLoySm9VNtUqA+W5kh7nxpQg/JslM1kErg8SK9JgSRK
         TfuKnxYKXRv8YLNNIWus39nDPvDvFXHV6PBf+fD+979kekpN3zlJvyPmiC8z6VdcAqXX
         IALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776697340; x=1777302140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pHylE/WjW6XUQ0m8ic5aY3Qs3biYzaa9JkC4on7POw=;
        b=ldu8dth95pdtHtB5x/4cQX+hDhrrhCpsVhDOannUW46b7Evs/9hGRZTumU6TObb7H9
         930uxU33cv2kVISI6WWsqy8Ad+ZPNSu1pEzmn03x8Z//S2XC/2ZUXmAce8XaLmGfzU2/
         vRbaS5FyX5LAJ6hSUEiNnB+8wPyH3QjohB4iJu7hbd4ujinGwsapRBzB9uaiZ717jxCI
         uZduWIuy5FDQ/lc2wmi5V6kX35icKrUz+fo7ocrgIQAkfEuXZE6vlt420NRUxpb3xPLx
         AtYnkQnJyyWeRJTsc26a0hTU1FVqzssCE/HsHt78A3I363cm/TEonsHE2C1c/osJhuw8
         jSvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lpZRysqU7+TO3kg/OJg6iOW8QCfZnBoTB5tGOu7Fm3On423frALcQwztbJjUEhgaBonxNMPpgnHk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPK/s3+nA8/EOPsh/vlHOLcMRtSlYhbArC9YWc5mU+B8R4pbCi
	PZdsod7BhFirw11eQ6253t8N6QG+3QpJUgjf1nPqK9Nl0SD/RdPqnfm5
X-Gm-Gg: AeBDietNKeChb5VdR2FmFZ3GXOPXDfKdIYrj3q3GX3Cdc4IbNc+ZQxyrbq0BE2tI9Qo
	5jBE7JB3QOS5M5ebx8+3M0o+rHbScMCXtc/B4VQ8G6Zkm2Tj6dWJNZ2GZTLGcR3Mp8z3GX+D58j
	YNupDe6bx2Q05ku8E5+uLXkHBCDI/BruM/+8LALmroFHmsjBUYr3Um/UfpUni+wUkcdxWqK+Eg7
	+4azhtDenCDqLGSvkZFbWRdLi7Qk9qfn1QjXFf777nxd1peB774CMzcNEbQvUIJh0pxuZ1XTv0Z
	daZaLJooPgZIHB+5F8FTmH9mjB73Qn+H0NAnun2nqoxW5Y9crLCeKMNJYtMR2vdAsLlNzn9MDL3
	h5RrG6+93cntrkDx6TIyDDxOGzh2X07lHpJpGoZDNr5ToQ3uZfRYCU9CzhJlAC2Z7epI68YfOVz
	kiHX3Bh2taqxqA2CnFBHsZGSglJtpMfNY0AfTAE/WKzhmxmWLIfBim25ZPHIX92aXTCnU/vBK4Z
	NSl7MTbGHQpmA==
X-Received: by 2002:a05:6512:3c91:b0:5a2:b514:4fbb with SMTP id 2adb3069b0e04-5a4172999c9mr4096567e87.11.1776697337906;
        Mon, 20 Apr 2026 08:02:17 -0700 (PDT)
Message-ID: <276c68cb-51c0-4775-8b70-3af80d0d0f27@gmail.com>
Date: Mon, 20 Apr 2026 17:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 19/27] xen/riscv: emulate guest writes to virtual APLIC
 MMIO
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <e29eace5006929e61da347814b9759896d179e28.1773157782.git.oleksii.kurochko@gmail.com>
 <2bff40f5-2eef-4e72-8191-b3442607e0e4@suse.com>
 <76ea5954-89cd-47a4-872a-239bbc08b785@gmail.com>
 <910f0720-1e83-4b0d-a1bd-09799d6f8264@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <910f0720-1e83-4b0d-a1bd-09799d6f8264@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1776697340-4216DA53-B1A4962F/10/73395122804
X-purgate-type: spam
X-purgate-size: 6531
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2417E42DBD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 3:19 PM, Jan Beulich wrote:
> On 14.04.2026 18:04, Oleksii Kurochko wrote:
>> On 4/2/26 4:18 PM, Jan Beulich wrote:
>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>> +static int cf_check vaplic_emulate_store(const struct vcpu *vcpu,
>>>> +                                         unsigned long addr, uint32_t value)
>>>> +{
>>>> +    struct vaplic *vaplic = to_vaplic(vcpu->domain->arch.vintc);
>>>> +    struct aplic_priv *priv = vaplic->base.info->private;
>>>> +    uint32_t offset = addr & APLIC_REG_OFFSET_MASK;
>>>
>>> See ./CODING_STYLE as to uses of fixed-width types.
>>>
>>>> +    unsigned long aplic_addr = addr - priv->paddr_start;
>>>> +    const uint32_t *auth_irq_bmp = vcpu->domain->arch.vintc->private;
>>>> +
>>>> +    switch ( offset )
>>>> +    {
>>>> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
>>>
>>> And (taking this just as example) any misaligned accesses falling in this range
>>> are fine?
>>
>> Do you mean something like 0x1C02 instead of 0x1C00 or 0x1C04?
> 
> Yes.
> 
>>>> +        /*
>>>> +         * As sourcecfg register starts from 1:
>>>> +         *   0x0000 domaincfg
>>>> +         *   0x0004 sourcecfg[1]
>>>> +         *   0x0008 sourcecfg[2]
>>>> +         *    ...
>>>> +         *   0x0FFC sourcecfg[1023]
>>>> +         * It is necessary to calculate an interrupt number by substracting
>>>
>>> Nit: subtracting
>>>
>>>> +         * of APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
>>>> +         */
>>>> +        if ( !AUTH_IRQ_BIT(regval_to_irqn(offset - APLIC_DOMAINCFG)) )
>>>> +            /* interrupt not enabled, ignore it */
>>>
>>> Throughout the series: Please adhere to ./CODING_STYLE.
>>>
>>>> +            return 0;
>>>> +
>>>> +        break;
>>>
>>> And any value is okay to write?
>>
>> No, it should be in a range
>> [APLIC_SOURCECFG_SM_INACTIVE,APLIC_SOURCECFG_SM_LEVEL_LOW].
>>
>> I will add the check before break:
>>           if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
>>           {
>>               gdprintk(XENLOG_WARNING,
>>                        "value(%u) is incorrect for sourcecfg register\n",
>> value);
>>               value = APLIC_SOURCECFG_SM_INACTIVE;
>>           }
> 
> And why would writing APLIC_SOURCECFG_SM_INACTIVE be any better, when
> that's not what the guest wanted? Simply ignore such writes, unless the
> spec mandates specific behavior for out-of-range avlues?

The spec doesn't mandate specific behavior for out-of-range values but I 
thought it would be better to make irq inactive instead of just ignoring 
so it won't affect somehow potential occurrence of this interrupt.

> 
>>>> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
>>>> +        struct vcpu *target_vcpu = NULL;
>>>> +
>>>> +        /*
>>>> +         * Look at vaplic_emulate_load() for explanation why
>>>> +         * APLIC_GENMSI is substracted.
>>>> +         */
>>>
>>> There's no vaplic_emulate_load() - how can I go look there?
>>
>> It is introduced in the next patch.
> 
> As before - it should be possible to review patch series strictly
> sequentially. Further, what if this patch gets committed, and the other
> gets delayed by several months?

Got you, I will re-order patches.

> 
>>>> +        if ( !AUTH_IRQ_BIT(regval_to_irqn(offset - APLIC_GENMSI)) )
>>>> +            /* interrupt not enabled, ignore it */
>>>> +            return 0;
>>>> +
>>>> +        for ( int i = 0; i < vcpu->domain->max_vcpus; i++ )
>>>
>>> unsigned int
>>>
>>>> +        {
>>>> +            struct vcpu *v = vcpu->domain->vcpu[i];
>>>> +
>>>> +            if ( v->vcpu_id == (value >> APLIC_TARGET_HART_IDX_SHIFT) )
>>>> +            {
>>>> +                target_vcpu = v;
>>>> +                break;
>>>> +            }
>>>> +        }
>>>> +
>>>> +        ASSERT(target_vcpu);
>>>
>>> What guarantees the pointer to be non-NULL? The incoming value can be
>>> arbitrary, afaict.
>>
>> I didn't understand your point. It is just checking that target_vcpu has
>> been found. If after for() loop the value of target_vcpu is still NULL
>> then something wrong in Xen.
> 
> If that's true, then the assertion is fine to have. I can't help the
> impression though that a guest could pick a value such that you can't
> possibly find the target vCPU. Asserting on guest controlled input is
> not okay, as was said several times before.

I will then do domain_crash() that as a value is incorrect in case if 
target_vcpu is NULL, I missed that guest could put wrong value.

> 
>>>> +        if ( !(vaplic->regs.domaincfg & APLIC_DOMAINCFG_DM) )
>>>> +        {
>>>> +            vaplic_dm_update_target(cpuid_to_hartid(target_vcpu->processor),
>>>> +                                    &value);
>>>> +        }
>>>> +        else
>>>> +            vaplic_update_target(priv->imsic_cfg,
>>>> +                                 vcpu_guest_file_id(target_vcpu),
>>>> +                                 cpuid_to_hartid(target_vcpu->processor),
>>>> +                                 &value);
>>>
>>> I'm struggling with the naming here: When DM is clear, a function with "dm"
>>> in the name is called.
>>
>> it means direct (delivery) mode. Maybe it is better to put dm at the end
>> of the function name? Or it is just better to change it to something else?
> 
> Without a better understanding of what is wanted, all I can say is that
> calling something with "dm" in its name when the condition says it's not
> "dm" is confusing.

Basically it should be the following. If domaincfg.DM (here dm is 
delivery mode according to spec) is 0 then it means that APLIC works in 
direct delivery mode, if DM bit is 1 then MSI delivery mode is used.

So just for clarity I will rename:
- vaplic_dm_update_target -> vaplic_ddm_update_target
- vaplic_update_target -> vaplic_mdm_update_target

Or maybe just s/ddm/direct and s/mdm/msi will be just better in the 
function names.

> 
>>>> +    default:
>>>> +        panic("%s: unsupported register offset: %#x\n", __func__, offset);
>>>
>>> Crashing the host for the guest doing something odd? It's odd that the function
>>> only ever returns 0 anyway - it could simply return an error here (if the
>>> itention is to not ignore such writes).
>>
>> But maybe it is a legal offset and we really want to support it?
> 
> Still not a reason to crash the entire host?

Agree, domain crash will be more then enough.

Thanks.

~ Oleksii

