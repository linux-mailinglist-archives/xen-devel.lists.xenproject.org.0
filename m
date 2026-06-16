Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wR+fOgkoMWqEcwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:40:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C5F68E62E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:40:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AgwxpyTO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339094.1600219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRCQ-0004GN-5s; Tue, 16 Jun 2026 10:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339094.1600219; Tue, 16 Jun 2026 10:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRCQ-0004Da-39; Tue, 16 Jun 2026 10:39:18 +0000
Received: by outflank-mailman (input) for mailman id 1339094;
 Tue, 16 Jun 2026 10:39:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZRCO-0004DU-Qp
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:39:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZRCN-009GCC-O9
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:39:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3127d2-bab6-0a2a0a5309dd-0a2a45068698-4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:39:15 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3127d3-7371-0a2a45060019-d155802dd877-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:39:15 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490b9318997so31579425e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 03:39:15 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea95c51dsm292949575e9.1.2026.06.16.03.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 03:39:13 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606355; x=1782211155; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LUnQMHQbCEfYks8YHQd0BHX9+6epsRRtpb3zeCBKWIk=;
        b=AgwxpyTOKVD5SIEE6i9OW1136skAiSAn2MgtWcLrWku4l9mjDvbaz07laYtgQJnXOU
         zQ+I2mVpcfBnyzzU+65v1ffGl7g3dYafiMHygHnpCYPn8cNR1woeplMbgfF3YPUH9Cq9
         FctWRusaLGrGb8T83MyRL0KFhXpWwFJ6V3aJYUKA9M516i9SocxWP+IsmXe5dfD+Egcp
         eeDahp9xXXocgIwkETz2vUmVpfRXI8GPUvwyrQigdkpqR1m0zF99Y479C4q2M88fOBPW
         PJ/DihjcpgzuqiBXCHZZm8zLaknvVHYdjav6uVBXABZPOYzT6xjdYY1LHMWLfqkF98tc
         /YyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606355; x=1782211155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUnQMHQbCEfYks8YHQd0BHX9+6epsRRtpb3zeCBKWIk=;
        b=pyj+XmP/9QE9qmGGOVeBCDbNsM5dmEH0vlyRORWDTsDeL8AAYKTADoQYWZ0yGcpPF6
         lDQaosA1/kb6JFojV1M+kFdgGmkzfC8Ses4IH7tHqyQB0fjnz2tRCu9BrxVMX8hgABH+
         y5oXW27GEYg+f+P0bNpXMND9Enjx2ABSMHAd3RR5AMZFQrrarmPPHRyWNNNARKptL2xh
         nQIB/sPx1k/RJpGJRt+lpoIoc16S0npphhC0x9xTRQrVyB1GgCbxC0kB05DymoDY7gB4
         FFnnAqSPBRcCwixwbRegD9C9fnMGiE7gIhSF/TUO99ksBkd4tbnf0FSaQCYzycsSwUD/
         /1Sw==
X-Forwarded-Encrypted: i=1; AFNElJ+ape5Bb0eB6p+cv07XxCuBNSu1RUbRXEu9AO4UKcxCCEa0jfBZLfak1+wbTIMyyAPGYvPZwVGeI54=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQG84b+n7Ds9qAaNFFEw68rJxreozpQ8cYYa0jEQmqhAhkVZ1w
	Dl0U/zoIx/uEudfMY6IopaOP6S9GVAkdahv0RX3Q5PzFUWzjphUmPBRQ
X-Gm-Gg: Acq92OGIAx9b1BbuFnFVnapLYPtQI0u3Lq3tV9Axttha9YFGZgSLHo3A76CTpBWYDS0
	69tOmia1f30XjmQBvGGNrqCjnISjF8R2XJocZgolRo2XJ0l8WEWz264Q2eZxOoW3iLZw/BdIaqH
	gcsv1hrEb0boPZbYBRBXL5ak01IE70hfLszcnKqDOQBglUWDXAQMDTASeXf/gRMgNx21cdE0Dct
	9FdRwEWPyin1V+tdWSjIsI4xWSwh1QqY7Y5HXGWT4pU6RmHuueGyPZJUi+TNKD/EkMWr3tJgYni
	QOE0/O+WNh7DvGB+DnLMJ5ZvZ2+8FTbWshPsj649H75E1smhtcUnaUaK+ey89rtQk2+O5BsH6eu
	4jdbvBUEjsBJ//r5KyzHXbucI8HFnk7lWl6YenDke1Zhd9jwQa+uRLuCX2l8/9+eMsN7S2iWOk7
	AnF/LJ2Gb0hzc2wGf+paBdty0r34j24965lhLlr5SFSjINoua00EN6/iFdKx4GvXzwxvC1FF722
	Wi8VQ==
X-Received: by 2002:a05:600c:6792:b0:492:2e48:81e6 with SMTP id 5b1f17b1804b1-4922e488201mr73809595e9.4.1781606353990;
        Tue, 16 Jun 2026 03:39:13 -0700 (PDT)
Message-ID: <8aa90509-5543-423e-9f74-5163a9179539@gmail.com>
Date: Tue, 16 Jun 2026 12:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/26] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <434e0be590bc0550e143836edff7e8e1e96b28c1.1778250616.git.oleksii.kurochko@gmail.com>
 <133430db-5605-4f3a-8ff7-77f9b57c91ad@suse.com>
 <68a7f2bc-91f5-4a19-afa7-4a9fd065f558@gmail.com>
 <2ba3a921-1927-4f94-b986-ecce59842961@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2ba3a921-1927-4f94-b986-ecce59842961@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1781606355-8DD80D75-687E9EE5/10/73395122804
X-purgate-type: spam
X-purgate-size: 3285
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,gnu.org:url];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54C5F68E62E



On 6/16/26 11:24 AM, Jan Beulich wrote:
> On 16.06.2026 11:07, Oleksii Kurochko wrote:
>> On 6/15/26 5:13 PM, Jan Beulich wrote:
>>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>>> +    spin_lock_irqsave(&aplic.lock, flags);
>>>> +    val = readl((void __iomem *)((uintptr_t)aplic.regs + offset)) & mask;
>>>
>>> Easier as
>>>
>>>       val = readl((volatile void __iomem *)aplic.regs + offset) & mask;
>>>
>>> ? (Note that like const, volatile also shouldn't be cast away.)
>>
>> Is arithmetic on void * pointers correct from the C standard's point of
>> view?
>>
>> It works with GCC (see
>> https://gcc.gnu.org/onlinedocs/gcc/Pointer-Arith.html), but I can't find
>> anything that guarantees the same behavior for other compilers.
>>
>> I'm okay with the suggested change if it's acceptable for Xen to rely on
>> GCC's void * pointer arithmetic extension.
> 
> We use that all over the place. Even docs/misra/C-language-toolchain.rst
> mentions it as explicitly permitted.

Thanks for that. I will then just apply your suggestion.

> 
>>>> --- a/xen/arch/riscv/include/asm/vaplic.h
>>>> +++ b/xen/arch/riscv/include/asm/vaplic.h
>>>> @@ -26,6 +26,9 @@ struct vaplic_regs {
>>>>    struct vaplic {
>>>>        struct vintc vintc;
>>>>        struct vaplic_regs regs;
>>>> +
>>>> +    paddr_t regs_start;
>>>> +    paddr_t regs_size;
>>>
>>> Can regs_size really go beyond 4G?
>>
>> Good question and it depends on an amount of vCPUs:
>>
>> #define APLIC_MIN_SIZE          0x4000
>> #define APLIC_SIZE_ALIGN(x)     ROUNDUP(x, APLIC_MIN_SIZE)
>>
>> #define APLIC_SIZE(nr_cpus)     (APLIC_MIN_SIZE + \
>>                                    APLIC_SIZE_ALIGN(APLIC_IDC_SIZE *
>> (nr_cpus)))
>>
>> paddr_t aplic_size = APLIC_SIZE(d->max_vcpus);
>>
>> With the current limitation of 128 vCPUs max (IIRC) it won't beyond 4G.
> 
> Tying to the overly low limit of 128 isn't very helpful, I guess. With
> APLIC_IDC_SIZE resolving to 32, the limit would be millions of vCPU-s
> aiui, so imo not a concern at all.

Then 'unsigned int' should be more then enough.

>>>> +    default:
>>>> +        gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
>>>> +                 offset);
>>>> +
>>>> +        domain_crash(vcpu->domain);
>>>> +
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    *out = aplic_hw_read_reg(offset, auth_mask);
>>>
>>> You blindly assume a 32-bit access here (and also in the write counterpart).
>>> How do you end up knowing?
>>
>> he APLIC spec requires all register accesses to be 32-bit wide.
>>
>> Also, I have the following at the caller side (yes, it can't be
>> understand from the current patch):
>>
>>       /* Fault address should be aligned to length of MMIO */
>>       if ( fault_addr & (len - 1) )
>>           return -EIO;
>>
>>       if ( vintc->ops->is_access(vcpu, fault_addr) )
>>       {
>>           /* PLIC/APLIC access are always on 32bit */
>>           ASSERT( len == 4 );
> 
> "len" being guest controlled, how can you have such an assertion?

Agree, ASSERT() isn't the best option here. Either rejecting of such 
length should happen or domain_crash() instead. The first one option I 
think is more preferrable.

~ Oleksii

