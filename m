Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C138CAB16
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 11:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726710.1131053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9M4u-0001SL-VL; Tue, 21 May 2024 09:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726710.1131053; Tue, 21 May 2024 09:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9M4u-0001Q1-S0; Tue, 21 May 2024 09:46:40 +0000
Received: by outflank-mailman (input) for mailman id 726710;
 Tue, 21 May 2024 09:46:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9M4t-0001PK-EI
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 09:46:39 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05080783-1757-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 11:46:38 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-572a93890d1so9354719a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 02:46:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5ce2eabad1sm704481566b.202.2024.05.21.02.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 02:46:37 -0700 (PDT)
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
X-Inumbo-ID: 05080783-1757-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716284798; x=1716889598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R96BCP96vO92VytP1iz3Eh8vWoYjjxBtd2vJWaEMbis=;
        b=HHhPr+gWcRtypbzsqWtp4nYU14mGqNJ59BkyoiUC0it3yzqLFpwp7ThcZSk9EucFM8
         s6sQ7t9+ap6A9Rm6en3whsDWhhebFm/4MMV5C4ja1Phqnq4VrPG8vD8G2T2uWC0cMTrC
         zGiMQIGsveRDWKdW4eFmoQYAGfvz2lFE5N1Sx5u2UV27EpGmDlWiPeQtadKpRRVniZAp
         l/c74yKSmXtbmhDuklIFirxv6VPjfThaXynfu9AoNTqtQvdZGCaCldp/eehAx4yVYHsI
         bLDEL5f2c9Q36C585ozGviEyCj9zgi6h4qiqe7D361EJudNgPEJzYHQqz9F+pQvEemVy
         AkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716284798; x=1716889598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R96BCP96vO92VytP1iz3Eh8vWoYjjxBtd2vJWaEMbis=;
        b=UQ5qWa9kt3i4uBGq26Of3g8dHuwU+Mt2mTNMZkSXsasaOBvl4mUhGK9+YYJ/oVTcoe
         yswrQYtdriBVXOOeOBHhHAjPi1qVGitngUJ1ZSxK1C4pX9TipP5YemXWrSKbyjdM3TNR
         LanIZpfOEUCzrDnesUOp1lH5sRI1yg34da+W/qONsSJeip7wQq2r4tRNGmutpTdbtES7
         cbYYZxIes1WP4h/j1abZl1q/yMU3dwNVjsiWc99nbAC2T50euibAZAQz8Pt6xv5PHEsz
         XajX9lTGKUFGUuqJdi3xlWXmJb4JwBz+DmLUsZRE8vePWvGDZM2SyR13FrrfI0HrLLMw
         Uz3g==
X-Forwarded-Encrypted: i=1; AJvYcCUJzBCNZaJXaEqwM/NgJV/tppzABrhtfDmy+d9Njc/YpStym2wLOPzDuxJP1he3rNkeMPffAqDNnFuLoLQ40H705FHkOW8oeTAo09ZZWcI=
X-Gm-Message-State: AOJu0Yw26lQKgPxW4qsXLolnZqJrLYRVNzCtoCG1FH25o6D+2IevL4+/
	xsO3aUNEWrbwp8ZSdSrdiKjxTrrNudWMyf5JIC6szoQllCG/hd2BcFYAEBNGbA==
X-Google-Smtp-Source: AGHT+IGJB5qyQ7Mihd9HkcvgJJztPSgMI2ahnLqs+4l9UlSRyQVcdAe5qF2uyEJvdmw2GXRPVpt4xQ==
X-Received: by 2002:a17:907:747:b0:a59:a3ef:21f5 with SMTP id a640c23a62f3a-a5a2d65ed16mr3935973566b.57.1716284798003;
        Tue, 21 May 2024 02:46:38 -0700 (PDT)
Message-ID: <43000c85-169e-4a39-8559-de2eada6bcbb@suse.com>
Date: Tue, 21 May 2024 11:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/x86: limit interrupt movement done by
 fixup_irqs()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20240516132224.86005-1-roger.pau@citrix.com>
 <449c7562-18a5-4f5b-a7a6-36fbf0383517@suse.com> <ZkYstvGkdffWMn2z@macbook>
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
In-Reply-To: <ZkYstvGkdffWMn2z@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2024 17:56, Roger Pau Monné wrote:
> On Thu, May 16, 2024 at 05:00:54PM +0200, Jan Beulich wrote:
>> On 16.05.2024 15:22, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/irq.c
>>> +++ b/xen/arch/x86/irq.c
>>> @@ -2527,7 +2527,7 @@ static int __init cf_check setup_dump_irqs(void)
>>>  }
>>>  __initcall(setup_dump_irqs);
>>>  
>>> -/* Reset irq affinities to match the given CPU mask. */
>>> +/* Evacuate interrupts assigned to CPUs not present in the input CPU mask. */
>>>  void fixup_irqs(const cpumask_t *mask, bool verbose)
>>>  {
>>
>> Evacuating is one purpose. Updating affinity, if need be, is another. I've
>> been wondering more than once though whether it is actually correct /
>> necessary for ->affinity to be updated by the function. As it stands you
>> don't remove the respective code, though.
> 
> Yeah, I didn't want to get into updating ->affinity in this patch, so
> decided to leave that as-is.
> 
> Note however that if we shuffle the interrupt around we should update
> ->affinity, so that the new destination is part of ->affinity?

I would put it differently: If we shuffle the IRQ around, we want to
respect ->affinity if at all possible. Only if that's impossible (all CPUs
in ->affinity offline) we may need to update ->affinity as well. Issue is
that ...

> Otherwise we could end up with the interrupt assigned to CPU(s) that
> are not part of the ->affinity mask.  Maybe that's OK, TBH I'm not
> sure I understand the purpose of the ->affinity mask, hence why I've
> decided to leave it alone in this patch.

..., as you say, it's not entirely clear what ->affinity's purpose is, and
hence whether it might be okay(ish) to leave it without any intersection
with online CPUs. If we were to permit that, I'm relatively sure though
that then other code may need updating (it'll at least need auditing).

>>> @@ -2576,7 +2576,12 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>>>                  release_old_vec(desc);
>>>          }
>>>  
>>> -        if ( !desc->action || cpumask_subset(desc->affinity, mask) )
>>> +        /*
>>> +         * Avoid shuffling the interrupt around if it's assigned to a CPU set
>>> +         * that's all covered by the requested affinity mask.
>>> +         */
>>> +        cpumask_and(affinity, desc->arch.cpu_mask, &cpu_online_map);
>>> +        if ( !desc->action || cpumask_subset(affinity, mask) )
>>>          {
>>>              spin_unlock(&desc->lock);
>>>              continue;
>>
>> First my understanding of how the two CPU sets are used: ->affinity is
>> merely a representation of where the IRQ is permitted to be handled.
>> ->arch.cpu_mask describes all CPUs where the assigned vector is valid
>> (and would thus need cleaning up when a new vector is assigned). Neither
>> of the two needs to be a strict subset of the other.
> 
> Oh, so it's allowed to have the interrupt target a CPU
> (->arch.cpu_mask) that's not set in the affinity mask?

To be honest I'm not quite sure whether it's "allowed" or merely "happens
to".

Jan

