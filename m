Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAktGavW4GmwmgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:31:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B806140E3A6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283323.1565596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDLsF-0007YQ-US; Thu, 16 Apr 2026 12:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283323.1565596; Thu, 16 Apr 2026 12:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDLsF-0007Ua-Qq; Thu, 16 Apr 2026 12:31:11 +0000
Received: by outflank-mailman (input) for mailman id 1283323;
 Thu, 16 Apr 2026 12:31:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDLsE-0007O5-OP
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 12:31:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDLsE-00DuOX-5C
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:31:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0d67d-bab6-0a2a0a5309dd-0a2a450ac818-40
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:31:10 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0d68d-56b3-0a2a450a0019-d155da2fe486-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:31:10 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b8d7f22d405so1296842066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 05:31:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3d5ea9sm13575920f8f.21.2026.04.16.05.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 05:31:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1776342669; x=1776947469; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+z7mr5PegBjzPJmf+gMBWEs27uwRwfeQjYjaEd1CrDc=;
        b=ckZbMshm5n3OtYDlqqtFAzInedn3+6fULq5DOI4HicyKilvil6ak/cr0D2LokYCQ43
         jbccL1hLwcHJG12v0MMSWe0OrccLSMSvF8xEtUZeQEL6PbCxNtY1VaK2SHA8mmvs4Vh9
         NSwLuWRRL5K57nj2LqpBF3i95p2VBdG9i0EmzwqycyiwAVOumwNPmvQ+74I77cS2fTEu
         bNpS7nhILNXbEANfLhAmJbJs6ND3CuwENCdSw4aKjwCCmK/7VbQQaiKKXeauB48wAZXB
         iTEofTGn/Vsx7KVnlhZa9lESYpRPi9UVOqItkvTFuEY+4A3L2ceNekA9/2yBQklI/v/f
         tpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342669; x=1776947469;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+z7mr5PegBjzPJmf+gMBWEs27uwRwfeQjYjaEd1CrDc=;
        b=MQ12pNHkf4KM+H1b8KSQYarShserIRalHjCTqP1BTtsPPwYhRQwAnhqmszzsgM7+ES
         O8CdFh2tnamsVoFiynbf+ZKrtzhT36C+h071dQFgu+75xeQn45Jtjsm6lHTWu6XJJCER
         rHZxC9mnhVQoEQD1q73ng84rhdGUawSqDm1aeYE657aJPO94ANT2RUAHU9OLf6wh74qr
         //xan9RFuaVFYYyqNXFJQ23h4O28241gcvO2n39Xi1J++ggjyBH24vGVcUVWEaYpo8l5
         y16JNfIRsIl/Ghi5yWRP0v3mLKWKD9wNN+fbIbz0Jp1N0Iz9ZkcPc85ZeMLK3rtj5r/N
         Yhsw==
X-Forwarded-Encrypted: i=1; AFNElJ9oyYaN8iGJI626/WmWy6wTW0SMAJJzC+RP6WhQj9JdUKDZ+UdOLiDrlOA5yJZaiB/3luspyIotqGc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx16KbZ+b+HUd0PIGIkJOX4cKydRZ3pXfz15UBy6tYonR9dFO2I
	jVxrY85HxmfKC+L8cuR/5ivUG+Flh9XP4ZFBw9ub8kCsmo/l1Q0b5jQy313WxgQ+Qw==
X-Gm-Gg: AeBDiesvkwFmNe6LgMUBxrXY0xAknop5Obk/S0P9tB9lFdz/pCuraxsGOx6qFHSW7Df
	05a2ljAobVcuG7LxjehJWctTXlYk2n2oPmswnN/rKcLO9MJQbf/5ICFXmGcvPPpZXOczSq5dzQr
	nc7tGWExLCDny0wlftv5neJT07EMnK1I50Vh20La5WF4AmBMAq7G9kKXfhFH4K0nFZQUATWoeH5
	Qcz11ALwOct07VHV2AL4NGy+UAfqRYWyHEi4Yh3EH5Yp7yp7YAyV7d8XDITDFX8U+Io+Ttw8bV1
	WRXLRWJEZoFg43WFNmfvY1r91dpYn9m4Pjd2CcvdhxGfaqqS1T7aMRlDM1PQI/bY7Y0dYnczc9j
	R1dBPMd8ZLg94LUztWdoxQsjU9EFurORxDb/bnVHVO8uVr+6zPUfREgmZzK5zwUO0i2Nwy3jknq
	Dv0bM96fQS1dtvQuPAuEk/x4erPtatIiheLLeo5mpnLgGV4FBOAE7KHv5znbiC8cjkss/RhlP6/
	7rtLEd4CgQYpgCs7W64sgQXLQ==
X-Received: by 2002:a17:907:3e88:b0:b97:c684:57db with SMTP id a640c23a62f3a-b9d72792a5dmr1567254566b.12.1776342668917;
        Thu, 16 Apr 2026 05:31:08 -0700 (PDT)
Message-ID: <bd50afd3-6399-4c6b-b05d-d86ee4b8643e@suse.com>
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
X-purgate-ID: tlsNG-4011c0/1776342670-45B6F8B7-D94EC8C3/0/0
X-purgate-type: clean
X-purgate-size: 3751
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.997];
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
X-Rspamd-Queue-Id: B806140E3A6
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

