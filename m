Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMP/MKzW4GmwmgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:31:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D48E40E3B4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283322.1565590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDLsF-0007Pj-FL; Thu, 16 Apr 2026 12:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283322.1565590; Thu, 16 Apr 2026 12:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDLsF-0007OB-CR; Thu, 16 Apr 2026 12:31:11 +0000
Received: by outflank-mailman (input) for mailman id 1283322;
 Thu, 16 Apr 2026 12:31:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDLsD-0007Nz-CT
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 12:31:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDLsC-005oDU-M4
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:31:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0d682-2eae-0a2a0a5409dd-0a2a450b9d60-40
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:31:08 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0d68c-212f-0a2a450b0019-d1558036d4f5-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:31:08 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so73374805e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 05:31:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3d5ea9sm13575920f8f.21.2026.04.16.05.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 05:31:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342668; x=1776947468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+z7mr5PegBjzPJmf+gMBWEs27uwRwfeQjYjaEd1CrDc=;
        b=Ta5Ow/EccvmB1/JHgWtO81XuVcX540T22dVaxw3WQbKiZj6go3tF04Igkbx/Y8UwMr
         JkuiVRi9WM9LDRES8VcTv9Sv5AiDn3WOgabJVXRShGknMV3RaFaRM3SDsckqNLqi78vc
         3eTuoaNSzZNqzFvlCPP+uQlaCK8EsJsnyAvmfga5QqFOBfMFgJG3J113SpKcN+dzlbBP
         cxS0I4eF5aeELH/to6UExwmpWpPgqfyOQNhMvwwOWoP6TbVJj/6SxaFJ5PVA7iMGXUZF
         U/o7KTTyW1HcAPcnC60bvzITJIH7p8bOig92wXzM4mxDMpr3l3bGeCss0FK5Udm4kD+V
         E89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342668; x=1776947468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+z7mr5PegBjzPJmf+gMBWEs27uwRwfeQjYjaEd1CrDc=;
        b=GKmGe87UC7n/EMdwN+0wQQNBnW7FVVieTu5cYUFJgT+aNQXr8CWWsu8WYUfwsTgHpS
         s0niD0BgnncRPMq3TOpgj6hMUlajCC3vjLWcmitBNzlpSTlMhlX0Tsxz1WG488bXkOR2
         Gcg5RaoY82LfpYb6tTg/GnJaL2U650bnP21RfaQMw0dtyY8Lcsu2ygksh6QtSMK5+fdv
         2bin8PiYaT389PkCVWl5sJVhZJzX7ocMAzxH5/Oh2LlMLT+h8lTq4nWNxhVlws/iyrSs
         cXGFRa6zVNmUvaTUXhvUQDsONWXyuBKFrARqDDpZ/QP4lLUvq/6p8Z9FdESFWEdnbAUT
         kzBw==
X-Forwarded-Encrypted: i=1; AFNElJ8Xprd7gM+mV3J73Y4AJyTADD7p7QY/g3UFILi2EJG933w5qFGjRorkwe8BCO5RMPvd56mvU8/Ps4Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2Hux+hWSr2/pMsZsSrOAbWG3SiS/8b20GKouC/5ibUjC2iPi5
	ZcrYulEstWAMyaD9Mc6LlpTQd9s5CycTW1lpmYj7iFey+kyF6lgKJtGcZngu5Aq+HA==
X-Gm-Gg: AeBDieuKJDvFX0+WbK6/6ZMqPhdUy+P7pUTtIqwIS+OqKc3Ac7uJaiqGsiCLiPcK/6E
	KgDrcv3fiiSbbqjsNUA8GlKPWB1KDgyzhlfCYnLG0a6QkqK2k0M4N5FCzHNtxDVXrOecZRt5OTL
	5Wiy/8tMaFZJ3VDtEw9Ec+JH50lEfk9k5ZrOWlJ2FlIo5LMPrS3ddCH98as0Egdmiej93QuyOJ5
	2nWkQU0519TkHxN2YFKzDypWXwQ/0rNwVms0TenWIoikFbWSXWoAmTjfIQY5CccvTDZKLMrADQ8
	S/yCXx3lNvHSkHR7PrAeMPVLuj0UlMPGI+qTkPEmyOSCMAzHdaFroALf0B1toA5oifdpbpcihiQ
	hjQUIaoz88ddt7aoDhSyssD8CsqFdI9ZiInAIYdHvK6ZvgrE5MLjPdRXFRRh5sjS/1a/owzHpK0
	J8ylDsGTMhqcx/WDxa/ZNyFcTBjpvAGDN6d5Cw6kmz0mP7OVGMI5N8EHqyyOR/WGIWJq1mVcVFE
	XuBCO6hBHYoanMjG8X+vyryzw==
X-Received: by 2002:a05:600d:d:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-488d67b8da2mr274130685e9.5.1776342667690;
        Thu, 16 Apr 2026 05:31:07 -0700 (PDT)
Message-ID: <e3191a3b-5935-4150-b8fd-d51e7ced9887@suse.com>
Date: Thu, 16 Apr 2026 14:31:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/27] xen/riscv: introduce per-vCPU IMSIC state
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <8196fa8f000e384af697a44cb3d50ece966e82a7.1773157782.git.oleksii.kurochko@gmail.com>
 <1f5e262d-da1f-49a2-8e89-87fb714e51bf@suse.com>
 <2f555a8b-d058-41ca-80f8-ce3dc08edfbe@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <2f555a8b-d058-41ca-80f8-ce3dc08edfbe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1776342668-7E772F3B-9D956A63/0/0
X-purgate-type: clean
X-purgate-size: 3751
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7D48E40E3B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14.04.2026 11:22, Oleksii Kurochko wrote:
> On 4/2/26 1:31 PM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> Each vCPU interacting with the IMSIC requires state to track the
>>> associated guest interrupt file and its backing context.
>>>
>>> Introduce a per-vCPU structure to hold IMSIC-related state, including
>>> the guest interrupt file identifier and the CPU providing the backing
>>> VS-file. Access to the guest file identifier is protected by a lock.
>>>
>>> Initialize this structure during vCPU setup and store it in arch_vcpu.
>>> The initial state marks the VS-file as software-backed until it becomes
>>> associated with a physical CPU.
>>>
>>> Add helpers to retrieve and update the guest interrupt file identifier.
>>
>> Yet again a functions with no callers.
> 
> They will be called in follow-up patches.

In which case please provide some minimal information on the intended use.

>>> --- a/xen/arch/riscv/imsic.c
>>> +++ b/xen/arch/riscv/imsic.c
>>> @@ -59,6 +59,29 @@ do {                            \
>>>       csr_clear(CSR_SIREG, v);    \
>>>   } while (0)
>>>   
>>> +unsigned int vcpu_guest_file_id(const struct vcpu *v)
>>> +{
>>> +    struct imsic_state *imsic_state = v->arch.imsic_state;
>>> +    unsigned long flags;
>>> +    unsigned int vsfile_id;
>>> +
>>> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>> +    vsfile_id = imsic_state->guest_file_id;
>>> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>>
>> What purpose does this locking have? Already ...
>>
>>> +    return vsfile_id;
>>
>> ... here the value can be stale, if indeed there is a chance of races.
>> Did you perhaps mean to use ACCESS_ONCE() here and where the value is
>> set?
> 
> ACCESS_ONCE() isn't guarantee only compiler re-ordering (as basically it 
> is just volatile-related stuff inisde the macros)?
> 
> Generally, I think that that guest_file_id is needed to be updated only 
> during migration of vCPU from one pCPU to another and I expect that 
> during this migration vCPU isn't active, so no one will want to read 
> imsic_state->guest_file_id. But on the other hand, there is:
>    bool imsic_has_interrupt(const struct vcpu *vcpu)
>    {
>    ...
>      /*
>       * The IMSIC SW-file directly injects interrupt via hvip so
>       * only check for interrupt when IMSIC VS-file is being used.
>       */
> 
>      read_lock_irqsave(&imsic_state->vsfile_lock, flags);
>      if ( imsic_state->vsfile_pcpu != NR_CPUS )
>          ret = !!(csr_read(CSR_HGEIP) & BIT(imsic_state->guest_file_id, 
> UL));
>      read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>    ...
>    }
> which I think could be called in parallel with with migration, so then 
> still lock are needed.

None of this addresses my pointing out that the returned value will be
stale by the point the caller gets to look at it. Which in turn raises
said question about the use of a lock. If you read
imsic_state->guest_file_id atomically (i.e. excluding tearing of reads),
the value seen / used will be stale as with the lock in use. Unless of
course there's yet another aspect hidden somewhere in what is not being
explained.

>>> @@ -315,6 +338,25 @@ static int imsic_parse_node(const struct dt_device_node *node,
>>>       return 0;
>>>   }
>>>   
>>> +int __init vcpu_imsic_init(struct vcpu *v)
>>
>> __init for a function involved in setting up a vCPU?
> 
> Yes, it will be used during creationg of a vCPU.

And vCPU-s can be created post-boot, can't they? (Outside of dom0less
of course, but imo you really don't want to tie each and every function
to dom0less being the primary goal right now.)

Jan

