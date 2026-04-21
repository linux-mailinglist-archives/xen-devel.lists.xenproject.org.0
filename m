Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB9iLMlG52mw6AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:43:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBDD43900B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288749.1568982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF7db-00062t-HD; Tue, 21 Apr 2026 09:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288749.1568982; Tue, 21 Apr 2026 09:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF7db-00060M-DC; Tue, 21 Apr 2026 09:43:23 +0000
Received: by outflank-mailman (input) for mailman id 1288749;
 Tue, 21 Apr 2026 09:43:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF7da-000600-5G
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:43:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF7dZ-00DyGL-7Z
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 11:43:21 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e746b9-5cb7-0a2a0a5109dd-0a2a450caee8-0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:43:21 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e746b8-62f1-0a2a450c0019-d1558032c487-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:43:20 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so3843025e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 02:43:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5334cc2bsm24976245e9.19.2026.04.21.02.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 02:43:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1776764600; x=1777369400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QUkBPqWiHrPZq5l8ZgskrutO6l9VglUe8ZMIzpwKSnA=;
        b=azW3kxOCniaU5t1CYKKHOFJV8Qh6Ul+q8wwsByAYArvm6Njo2E9hP2A5Q+ngTJ93TQ
         3ssKrja4LmpiweHKJp5wmCnToWl9Ae3/mc+Z7Ev5NUUnC58L2yHIaFQx2BFmIvVfCRxK
         TkZTeb4kho6h/L31JeOKufXJ6FMGj4vNy8BUwprS1lhy4RfVrPcYD2U9hgu9SrWHNm0m
         /ReV6Zm/XHZK+b24y9uZel7u/KYJhtPf7xTMo6ecY3KXoIltW/kahx4mocT/h57hQyPk
         7RSALHVYre1a4yY1Ut7KE4konR2rz5KfrLtkaqRIvv2IJ7DjCux1Zq60FGLa9E7javZq
         cjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764600; x=1777369400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUkBPqWiHrPZq5l8ZgskrutO6l9VglUe8ZMIzpwKSnA=;
        b=e27sWycuIegGb8yME2vVIDeK+CJR7UIVe15PGJS5mgk9gz6kjFIOwLe7j00TDUtOoy
         F+4BOunSJHyTnQHw1BTr/VptDS69cQaZMooqFGRzt6iwc4Vv5RrsCYCFUsmwfnBd25MP
         gyPpdApf6YlNehn2OTE2VdxdVDwjVeYwkrGBQI8fpuh3Jk1HwuzKJ8Ot27ZFPUyEIAqU
         fAyyXOhbalFZLE0cD0R4hb5ogAQ1j7WFv7LJdluHYMR+abZyBNRYJ9fzSz5Hd+nPGxBL
         H1xFXjqWzJOax4otsP/GrVphqbRJZlUHKiN45FPIB4MkNPJDKrEoVEHco4tqBInE1Ilv
         lCEA==
X-Forwarded-Encrypted: i=1; AFNElJ853oPIBPEKSq8O+bXjP468Popy2Hfj4bIDXFsfBJJZNPr25zWCv6ybueMozTrOHKfo849K3i8ciXU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxyyfh8RAMdrtRQK4yE0GZO8IfrMSoUs5UnOllo05muRY8CmYsi
	DXHfJRAQ4uSBBcrkprYL9IzHUQQ0jJOsoYyND8jAJuq1ETHEXrsTULpxwn7ipmY+SA==
X-Gm-Gg: AeBDieu1sGc3KGaAeYKEpGPWfOtqchTJWIZ11BwzG5GGEGZI3WwTU1olINUGBMx+tC1
	np8MKyCr4kPWss/f4djCawvYsOfe9Vf3+kyxszyDgLnMP0zaim5CYqPE/OcywNw0EVsAiUI/V6m
	VF9X0dtnS78bC/hpquk7i4Ryugbux6jeH9xJclW3L0VPofDn5LLC6NcC6oTFJRLfWRk4i/H/5hD
	jZG40pymUdawZv8gmylAuWe2IRfQS0qbY1k/4Ar9479EuokS8D2fN9cnj4/0Y5FD1/KFRoVgIVr
	Hluolw3Cw/gDOF3trLc73+TUbrE4NkEqP4f/2v24vK0VUrN0QvByof/3ipTkEPPWDhb2/zUkcHm
	Lu4z1ITSkZvkxxcMpDOs7XIi/LrQTTpugbwCaBdDwgFEQTIx38010jScPsITC9sNlC3rEGSb1Er
	57aW9hCiBzMdlIX5WJjBha1Ck0kWMpqef5HTwxXiP5+jDsNsSkNWnTUQIdfhag8e8u2eUjr5a8G
	TAD0uM2aQMBb14/2bWRcoBbFiK9PQcbs4k4
X-Received: by 2002:a05:600c:42cc:b0:488:ffb1:494c with SMTP id 5b1f17b1804b1-488ffb14a0cmr113171425e9.12.1776764600371;
        Tue, 21 Apr 2026 02:43:20 -0700 (PDT)
Message-ID: <e7ac0111-09a9-4946-abb0-91cac2cd6001@suse.com>
Date: Tue, 21 Apr 2026 11:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: allow Xen to use SSTC while hiding it from
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <5285075f24cd2a2c5566b2a7724198d34aab51c5.1776354739.git.oleksii.kurochko@gmail.com>
 <405b5653-4df9-4ee0-b6e2-ba7c4a5efbba@suse.com>
 <a64c0c52-fe42-42bb-b93c-470ab9c25413@gmail.com>
 <306c8133-0bee-4d07-be34-5d201a232b04@suse.com>
 <8f93b170-da98-4105-ba83-a0f8421e672b@gmail.com>
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
In-Reply-To: <8f93b170-da98-4105-ba83-a0f8421e672b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1776764601-F7612CF5-46202B35/0/0
X-purgate-type: clean
X-purgate-size: 2998
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0CBDD43900B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.04.2026 11:33, Oleksii Kurochko wrote:
> On 4/21/26 11:10 AM, Jan Beulich wrote:
>> On 21.04.2026 11:01, Oleksii Kurochko wrote:
>>> On 4/20/26 9:56 AM, Jan Beulich wrote:
>>>> On 17.04.2026 09:24, Oleksii Kurochko wrote:
>>>>> @@ -279,8 +299,6 @@ static int cf_check sbi_set_timer_v01(uint64_t stime_value)
>>>>>        return sbi_err_map_xen_errno(ret.error);
>>>>>    }
>>>>>    
>>>>> -int (* __ro_after_init sbi_set_timer)(uint64_t stime_value) = sbi_set_timer_v01;
>>>>> -
>>>>>    int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
>>>>>                              size_t size)
>>>>>    {
>>>>> @@ -360,10 +378,9 @@ int __init sbi_init(void)
>>>>>            }
>>>>>    
>>>>>            if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
>>>>> -        {
>>>>> -            sbi_set_timer = sbi_set_timer_v02;
>>>>> -            dprintk(XENLOG_INFO, "SBI v0.2 TIME extension detected\n");
>>>>> -        }
>>>>> +            set_xen_timer = sbi_set_timer_v02;
>>>>> +        else
>>>>> +            set_xen_timer = sbi_set_timer_v01;
>>>>>        }
>>>>
>>>> Sadly this isn't quite equivalent to sbi_set_timer having had an initializer.
>>>> I would have wanted to suggest to use a constructor function, but we call
>>>> init_constructors() even later than do_initcalls() on both Arm and x86 (we
>>>> don't call the latter at all on RISC-V so far). Might it be necessary to
>>>> introduce sbi_early_init(), called very early during boot? Else how do you
>>>> guarantee no accidental use of the variable before it is first set?
>>>
>>> I thought about an introduction of sbi_early_init() but then decided
>>> that set_xen_timer() won't be used earlier than at lest timer_init() +
>>> local_irq_enable().
>>> Also, sbi_init() is executed pretty early.
>>
>> Many more additions to setup.c are to be expected. Are you sure hardly any will
>> go ahead of the call to sbi_init()?
> 
> Looking at the current state, I don't see something new what will added 
> before sbi_init() except percpu_init_areas().
> 
> I am okay to introduce sbi_early_init() if it will be really better:
> 
> --- a/xen/arch/riscv/sbi.c
> +++ b/xen/arch/riscv/sbi.c
> @@ -387,3 +387,8 @@ int __init sbi_init(void)
> 
>       return 0;
>   }
> +
> +void __init sbi_early_init(void)
> +{
> +    set_xen_timer = sbi_set_timer_v01;
> +}
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 56a0907a855f..b187a84cd28d 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -78,6 +78,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>       const char *cmdline;
>       size_t fdt_size;
> 
> +    sbi_early_init();
> 
> But it looks to me that is fine to have what we have now as even someone 
> will try to use set_xen_timer earlier a trap will occur and thereby it 
> will be need to put the code which start to use set_xen_timer after 
> sbi_init().

It's your call really.

Jan

