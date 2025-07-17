Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1310EB090AC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 17:35:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047018.1417405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucQcc-0007l3-Ug; Thu, 17 Jul 2025 15:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047018.1417405; Thu, 17 Jul 2025 15:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucQcc-0007iB-RB; Thu, 17 Jul 2025 15:34:10 +0000
Received: by outflank-mailman (input) for mailman id 1047018;
 Thu, 17 Jul 2025 15:34:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucQcb-0007i5-Ea
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 15:34:09 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a63fa83-6323-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 17:34:08 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so732599f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 08:34:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f29e2efsm3529472a91.38.2025.07.17.08.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 08:34:06 -0700 (PDT)
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
X-Inumbo-ID: 7a63fa83-6323-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752766447; x=1753371247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZpaUTY1i6p7eZfxCjpQQq5Fy7fW4479dfbKaqvGBMk=;
        b=eWTURNa2q+eY+1GLnFw2qrxyOV7vdqFPlihHG3/oLg3+PerbnpYw5/W6m9+fRKfjFN
         0459JVm86nJFjFo3lVSHDg0GEh3jTQsu9H9YP6Y0kpIGZK+dLXwLXgy47bAd1SnWWy98
         2Pk+zNAYeng3fRERn5Vrr/llf/Muic6s51ASn7iXlvGUNfxj3TXdvmT+teZ2jzXK0nVO
         CuUxYIFSpC0ON6VcjJ7nFgDJibKlDk7WcC8+7AU9SDHERVDTSQXZo4hB2sFylmlIZsm5
         iqLGM11DQqb80fQPSe7VoInk1mRuNGz6TT74VU23t7hJUvfMoA/l5ySAX2sq6O87emhV
         FM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752766447; x=1753371247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZpaUTY1i6p7eZfxCjpQQq5Fy7fW4479dfbKaqvGBMk=;
        b=G6pGReu8XpUgvj2XJNjJ5sDYsMKzmYtCfW2GF38uS6s3Oq5F0gGn7aELFembLe4VBj
         GcPBnx1AjYAlPxGZ5YXywE7kSFYfLya/OjRjxGi7PBPWMyPitUMONnmBh8q1/4nGKvN7
         erOB0hHnnHa6riYhqg0moXPnA5GIbB91OrDesk6UZ9DCcwHDQQiMz5Dy8XjFTleItygx
         bh7R8h6Yv10wxBMnjN8skSlYqiRO5liTcrsD6nwg5izi4Ao0jjNEnu0+Zix9vo/Tbof3
         5X4UUmp27vEYCIN8HvDFpuNXDaxO+Iu9hhJ2+0hwsgPPdoSbDXzo+9254UuIubo7/MRZ
         H4xw==
X-Forwarded-Encrypted: i=1; AJvYcCWLvSp8ptkNw80DJnCClq0yMtrmAyFwlcRo+LREo6kpNxSfkouhywiuAPZGkW3Lgzm4REMV6ZDlE58=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0ZF+Gb2MZLDIRCXq0I7G1SDwrruTFjydAKPdi3+RkOeaP05qm
	MKKFLQusCbejYicNmXr0cRtg7Eko9EoMrqbe3Le099lwcoe7VLU5Oyz0g4a0dQwQmQ==
X-Gm-Gg: ASbGncvDmUdoK6ThvY2NvP6FD6Nxr0xjK0p0zstsKHr3qxmcEW3cOIZANr9n55Hx8C6
	1Q9Uv/8VQ/k62SPAOsA5rnyxRiFbUw0T4LTmV4Ndl0A+J2202fkw20q9DjTlsuVP+rDryd1wzzJ
	PawvmUDaND4JgcMUbPs8gGv4DK/Qz1O4qmnyNPuu+gsXIkomp1hzFMwsQUHWziZB+08d1WYJO5H
	K9aq+28idYAEgpTqv0ggvYueIzPnv01P7/LINRd7T0WyEhM8a9dctFPFgkrQjMUfqAI0A+I379u
	wGhOTAMYEH4jVqsfDa00R7KmAugYyITmWi1k4P293blWhk6vYSMuI70mub9Ga/rSiH7qpOKaXY9
	4P8Ch4/Q+crYOhjZOPuoE5UkNtk1epypIxclx6YesRf0uZBA8zVDJfPvhcM5PMSSdsD0baYx6+b
	r0rpsRIYA=
X-Google-Smtp-Source: AGHT+IHbDDLE/gjGZi9Ghg6zrkPEGXxsg3I2hWbbLH1I7XmEPiQAu3rdK/UQWRt9Igp7HbXcOrtHjw==
X-Received: by 2002:adf:a286:0:b0:3a5:8991:64b7 with SMTP id ffacd0b85a97d-3b619cd1403mr150333f8f.26.1752766447084;
        Thu, 17 Jul 2025 08:34:07 -0700 (PDT)
Message-ID: <10e9c04f-7de8-4aa2-a555-0a5cb975e91f@suse.com>
Date: Thu, 17 Jul 2025 17:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250717130147.2842159-1-grygorii_strashko@epam.com>
 <d8778c57-c934-46d5-a600-dcdb2ca5ec26@suse.com>
 <72a6cd66-e811-4776-ad93-979b65e69a10@epam.com>
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
In-Reply-To: <72a6cd66-e811-4776-ad93-979b65e69a10@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 16:41, Grygorii Strashko wrote:
> 
> 
> On 17.07.25 16:10, Jan Beulich wrote:
>> On 17.07.2025 15:01, Grygorii Strashko wrote:
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -975,6 +975,9 @@ void send_guest_pirq(struct domain *d, const struct pirq *pirq)
>>>       int port;
>>>       struct evtchn *chn;
>>>   
>>> +    if (!IS_ENABLED(CONFIG_HAS_PIRQ))
>>> +        return;
>>> +
>>>       /*
>>>        * PV guests: It should not be possible to race with __evtchn_close(). The
>>>        *     caller of this function must synchronise with pirq_guest_unbind().
>>
>> Isn't this function unreachable on Arm, and hence a Misra rule 2.1 violation,
>> requiring #ifdef around the entire function to address?
> 
> Yes. It's unused on Arm, only x86 is an user.
> I can put it under ifdef.
> 
>>
>>> @@ -1710,10 +1713,15 @@ void evtchn_destroy_final(struct domain *d)
>>>   void evtchn_move_pirqs(struct vcpu *v)
>>>   {
>>>       struct domain *d = v->domain;
>>> -    const cpumask_t *mask = cpumask_of(v->processor);
>>> +    const cpumask_t *mask;
>>
>> This change shouldn't be necessary; compilers ought to be able to DCE the
>> code.
> 
> Unfortunately not, with "-O1" more code is generated as cpumask_of() is complicated inside.
> 
>>
>>>       unsigned int port;
>>>       struct evtchn *chn;
>>>   
>>> +    if (!IS_ENABLED(CONFIG_HAS_PIRQ))
>>
>> Nit (style): Missing blanks (see other nearby if()-s).
>>
>> I wonder though whether we wouldn't better have x86'es arch_move_irqs()
>> invoke this function, and then #ifdef it out here altogether as well.
> 
> Do you mean as in the below diff?

Along these lines, yes. I guess personally I wouldn't convert to an
out-of-line function. If an inline function fails to compile (and that
isn't easily fixable), use a macro instead.

Jan

> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -224,7 +224,7 @@ void cleanup_domain_irq_mapping(struct domain *d);
>   
>   bool cpu_has_pending_apic_eoi(void);
>   
> -static inline void arch_move_irqs(struct vcpu *v) { }
> +void arch_move_irqs(struct vcpu *v);
>   
>   struct msi_info;
>   int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p);
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 556134f85aa0..b8d8f202119d 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -1851,6 +1851,10 @@ void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
>           cleanup_domain_irq_pirq(d, irq, pirq);
>   }
>   
> +void arch_move_irqs(struct vcpu *v) {
> +    evtchn_move_pirqs(v);
> +}
> +
>   static bool pirq_guest_force_unbind(struct domain *d, struct pirq *pirq)
>   {
>       struct irq_desc *desc;
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 13fdf57e57b9..ad6032fb2865 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -642,7 +642,6 @@ int sched_init_vcpu(struct vcpu *v)
>   static void vcpu_move_irqs(struct vcpu *v)
>   {
>       arch_move_irqs(v);
> -    evtchn_move_pirqs(v);
>   }
> 
> 


