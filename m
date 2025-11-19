Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DEC6D2FF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 08:41:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165570.1492281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLcnv-0005th-VF; Wed, 19 Nov 2025 07:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165570.1492281; Wed, 19 Nov 2025 07:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLcnv-0005qa-S8; Wed, 19 Nov 2025 07:40:39 +0000
Received: by outflank-mailman (input) for mailman id 1165570;
 Wed, 19 Nov 2025 07:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLcnu-0005qE-Mt
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 07:40:38 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08e52d80-c51b-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 08:40:35 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-64162c04f90so10127714a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 23:40:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d82cfsm14462110a12.2.2025.11.18.23.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 23:40:33 -0800 (PST)
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
X-Inumbo-ID: 08e52d80-c51b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763538035; x=1764142835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qfyLvtK0+cQEh3RVeWZ+tqWHVoNUyoODHiQvDK/+9Ew=;
        b=NKIZOe7SBVsPyi5OOdqKaWN/7IXEKeilZjN2FJ8fwTzJ4JQwSs1VXD+FGNK2U+Xrek
         jDLiT/j17JsxKVxzF37rHxCfrEy0Ye5FMFCenGUX3jIkP4ftiiNAfFy0ov40DD6nlVmV
         V6mKIB60KdNt/8SML14oAi1cOrbamLv+7t2Cahm6GbkisU8DxukV9L58zul5nmdrs/7O
         7KMbght0X3VWcuWDa9ylExxD7V2MVuYm4c34xvKLXE9jeLqdQrK129Joo1o0Az0M+FN6
         Map82+/0/AOSAl9FnM4g/p7W/LxYXs1k4yzMFnuGeVVQlBPYCWpQKvB/wTLmp77+pglH
         s06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763538035; x=1764142835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfyLvtK0+cQEh3RVeWZ+tqWHVoNUyoODHiQvDK/+9Ew=;
        b=U7AmW6NwZOSOj0NbugYt2kHsXK3nrs1JG55jw8y/4qtPsJti4l1x6FWzyI2FTFS0A0
         bZWrPR1oMaPI1TzK3/M/fa2Dy7sNYJvCdXKow6lc5ieWf1ojH6nDisTbuVuvre+GjyF9
         zba73p0d/DKk82buDXttZXjDoC/dOBsxbOThJZZroROO0ds7x/k8Zu3OPVhg+IkA6Cfn
         YWlkuuZMbY95qwHbAKFr6LJThb1p+8D6gcxLJFY5YzZKiUjDltYL0nKp/9cKY7Wkn9N8
         7/cy9DIip7QVYPS+HW4uyZotr9jrqKGK/YJ0PMzjNSzYy/0jyEWNQEm2Vq6EqNQqbr+D
         OhOg==
X-Forwarded-Encrypted: i=1; AJvYcCUy0d4SFaPK/UaPByEi8/G+p7xjfh4RPPY6uwWNfjWaIVNABpORnjcJg7U5aoAdlCV/Lp+hEUJC3nw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL7s+O+T8KPmzqlA0+7KuJTe4t/yUXxK/TgwInM4RRo9VSoI7A
	Cy4o2Z1+XsmNrgIo4pcvA47U47qP5RAJmjJ+ydY6G3lH632TxXR8u+wqrHjdmuRqmVvds2dK0l9
	6JuM=
X-Gm-Gg: ASbGncsGsT0fIOzi4RyxnI/IRAamRwKjIkpET3Ld7A5kvDOyC4X6A0r17e8f3uzK+Ko
	xuaHyUbbMrGdX8PseBZCvITtxUrl1kIRtGDC3VhJ7Rl9rGfDJgkUdfDtnYOEWWjFP0qed/KXrUl
	TJP7HGNrVbgKaQOWDJTZ8ypPXqr6SkAk9nBYzS39R5dBg2JC77Q0z0OS8t6KjRfgM0Bx8ww+Bnh
	scAOfpr+6iQOJtI2a3D3AAAiPpQKvmuJE3+KkwFkqPcZeKVqubCy1lb2qKDP81Cz/ojENVyFO95
	IZbVfeA/Kpz5v/BnTAb0Kbk1XckaZgpTaWsc4+fuD8VWXp+u0Sa24wPtB+YQ/64IG/31OXiumsf
	jpwyqUoYSj7ZNsPS9qdyIkPplSM/9y8WupUBhMDEqs+tHlRybAp1e+EaHlSRnZ45pqQ6Jxe9jO0
	ZcYi8JtbcxPzSYNErMMWlfsBpknIUjteM7WQdxvZ1wr8dweDBAhUS7IOBYduPvMCvcqpgODeTpg
	gbWzVFJYZLF2w==
X-Google-Smtp-Source: AGHT+IGFDyXTLdOwndlGsdT6ZFt6tI4wcuy5rmQH+R44R1KL38m2RoBfJ3IKVP/UZ/4s2mFZZAqwKA==
X-Received: by 2002:a05:6402:278f:b0:62f:8274:d6bd with SMTP id 4fb4d7f45d1cf-64350dee90emr17673898a12.8.1763538034681;
        Tue, 18 Nov 2025 23:40:34 -0800 (PST)
Message-ID: <bf617c69-8e51-4e9f-bcfa-9e51f3be7aa8@suse.com>
Date: Wed, 19 Nov 2025 08:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] x86/Intel: use host CPU policy for ARAT checking
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <65cb802c-922d-4bee-9dee-566367bec6ed@suse.com>
 <15a614d7-1646-4ad7-a298-edb77baae279@citrix.com>
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
In-Reply-To: <15a614d7-1646-4ad7-a298-edb77baae279@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.11.2025 20:42, Andrew Cooper wrote:
> On 18/11/2025 3:08 pm, Jan Beulich wrote:
>> There's no need to invoke CPUID yet another time. However, as the host CPU
>> policy is set up only shortly after init_intel() ran on the BSP, defer the
>> logic to a pre-SMP initcall. This can't be (a new) one in cpu/intel.c
>> though, as that's linked after acpi/cpu_idle.c (which is where we already
>> need the feature set). Since opt_arat is local to the cpu/ subtree,
>> introduce a new Intel-specific helper to hold the code needed.
>>
>> Further, as we assume symmetry anyway, use setup_force_cpu_cap() and hence
>> limit the checking to the boot CPU.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The need to move where cpu_has_arat is checked would go away if we did
>> away with opt_arat (as mentioned in the previous patch), and hence could
>> use cpu_has_arat directly where right now XEN_ARAT is checked.
>>
>> --- a/xen/arch/x86/acpi/cpu_idle.c
>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>> @@ -1666,6 +1666,9 @@ static int __init cf_check cpuidle_presm
>>  {
>>      void *cpu = (void *)(long)smp_processor_id();
>>  
>> +    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
>> +        intel_init_arat();
> 
> I really would prefer to avoid the need for this.

So would I, but ...

> Now that microcode loading has moved to the start of day, we can drop
> most of the order-of-init complexity for CPUID/etc, and I expect that
> problems like this will cease to exist as a result.
> 
> Notably, we've now got no relevant difference between early_init() and
> regular init().  That was a complexity we inherited from Linux.

... I don't see how this leads to any concrete suggestion as to better
arrangements. With cpu_has_arat using the host policy now,
setup_force_cpu_cap(X86_FEATURE_XEN_ARAT) being conditional upon that
has to run _after_ calculate_host_policy(), which in turn runs after
intel_init(). We could add a .c_late_init hook to struct cpu_dev, but
doing so felt like overkill for the purpose here. Plus it feels like
that wouldn't really address your concern either.

Jan

