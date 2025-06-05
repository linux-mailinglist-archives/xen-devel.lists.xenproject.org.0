Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0EACF251
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 16:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006995.1386265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBuy-00029O-PB; Thu, 05 Jun 2025 14:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006995.1386265; Thu, 05 Jun 2025 14:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBuy-000272-MA; Thu, 05 Jun 2025 14:50:08 +0000
Received: by outflank-mailman (input) for mailman id 1006995;
 Thu, 05 Jun 2025 14:50:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNBux-00026v-LN
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 14:50:07 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e29203c-421c-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 16:50:05 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-604f26055c6so4431923a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 07:50:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d7ff08bsm1282987266b.17.2025.06.05.07.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 07:50:04 -0700 (PDT)
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
X-Inumbo-ID: 5e29203c-421c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749135005; x=1749739805; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UPn8W6WrtLPVEY1yzLklS5GkBy2VKRHwBirs54XXYso=;
        b=W85AYLiPaasz8Pyv3LRcFwTDltR3I1OBujL4BAUZUlkemlHP8f83/ITrFwMRV8+Fj+
         DNvKfhA+xoE9edVsKkc5HZNdKtAjjSqOLVFsXiWr7ZgIEulwawFvRKCpVOuTYjbPI/K6
         J6Y7bsFzgqgrk6KulSpBsdqkFfwBiqcVGmIzj6zK7y7GJmwhhcvuzWfb8ILP7vogoso2
         x4EBGtzsogTHeFSztQ2OWJpHiPNSkKSH4Tu8+hpMAsreUsLaV93DF21p50I93prwh4OT
         AyLAPfl86u7ul2boDIc9Pfx50ROaRbLluwKids/whN6Z1o9TUD4qcj/n/9t6sjMJRByx
         bZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135005; x=1749739805;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPn8W6WrtLPVEY1yzLklS5GkBy2VKRHwBirs54XXYso=;
        b=fRjdrKpAKMZJJr2Tu6AFfq1CEEoDCzmbHM2tRdqCaZXm+ktkVXtTWEG2VDI9OsTqn4
         2XvblzbOFiiGmdTSmrSxJ2uHf5z23Myj5JHVTzALJ5VBny91Po2KS4JnPrwWbtZSn73i
         7htWC/JkJEsmrlCdFQgZ2s0Nx+7P33wxsMH1kBSnE4OaQDWCZxY8NuIVXISAjt6cw/wa
         RG8UenqrCXFLMAPDUfPSK6/WuilC5YiW3z9o0+bhPEsKEX0+xGBL6MerIajJiMjaRNMs
         SlY7E0Ie+6q4ivIghuk5Xt8wWLfa+6vA7KjdavxilUFoNZ0810nctb3zg9C71tEv0Mwm
         R92A==
X-Forwarded-Encrypted: i=1; AJvYcCWJnR+mWnRJcd+5ppksqhNUKY4Vk+pQeLg5S0nXfqXslOYp8TV7LCY+XXJ5QsXZxI0MlvUZjF4Gois=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtEz1EpDpCPz7Ovlj9jtF5Zw11g+bHuJPgJyoosb7egcgIXINC
	NEcIok4vz5nGyyQUr08gL/Tvl3DGOmjSF4DOgnMj8Wr7IcEWM2zs/gI0CzFnTORf3OIDRZR6vzi
	b3XA=
X-Gm-Gg: ASbGncsM0o/eHy/gmMaoLgzL63PhkVbA8U5OWbGXDKb0/m28lcy/+puVh4w+R39mkBn
	HJnogPW5gafs2jXZwZlGW4tEzWvQSoSzBWNaM4KAFibPfpBvhRxPhKlvx7H2si7CNfF9WEH04oL
	gznF3Y/qY6svdyRZm2W8/YxxoPsZWqqxIn3hC6e6j4t8yKnSn07CB9qfg0Mzn0ijvrJKQPnkoHO
	RJONYQcuWqGhkEVbtygLN5hDxyzZ79clqQ6Uyp5r1Uw0CG96zJN1HquOxSexlD50eKe0x0PeGO8
	TB7VU15uc05OilDmLE4pYLRktZAOTMN6kmVIDxuanwGp4TzgCildLlP+QZCF2HXPHF7ToxoXB9J
	WYKn2dG1N7tHhzZtuTOzYoa5bP6i6ZpHU7ZaI
X-Google-Smtp-Source: AGHT+IFvdt07i7uoSVz4j/cerryx8WdmIT9dO8j0lAJ58MYL8dlhUyydVFbTzvLJByaHi5VlKBUV+w==
X-Received: by 2002:a17:907:3dac:b0:ad2:2fdb:b0ab with SMTP id a640c23a62f3a-ade07901184mr407296066b.29.1749135005014;
        Thu, 05 Jun 2025 07:50:05 -0700 (PDT)
Message-ID: <4ed9d6ce-5634-4dd9-86e9-5d1f84a43e10@suse.com>
Date: Thu, 5 Jun 2025 16:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vmx: Introduce vcpu single context VPID invalidation
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <83d0e7dfc076e9453fb6537e5948c03d90e947da.1748594036.git.teddy.astie@vates.tech>
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
In-Reply-To: <83d0e7dfc076e9453fb6537e5948c03d90e947da.1748594036.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 10:48, Teddy Astie wrote:
> Introduce vpid_sync_vcpu_context to do a single-context invalidation
> on the vpid attached to the vcpu as a alternative to per-gva and all-contexts
> invlidations.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Extracted from SEV series.
> This will be used for instance in fixed-ASID patches (in SEV series).

I think it should be in that series, which may still be some long way out.
Until then we'd carry dead/unreachable code (disliked by Misra), and we'd
risk that this bit-rots because of being unused.

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -451,6 +451,23 @@ static inline void ept_sync_all(void)
>  
>  void ept_sync_domain(struct p2m_domain *p2m);
>  
> +static inline void vpid_sync_vcpu_context(struct vcpu *v)

pointer-to-const?

> +{
> +    int type = INVVPID_SINGLE_CONTEXT;

Please don't use plain int when all values possibly held in a variable are
non-negative.

> +    /*
> +     * If single context invalidation is not supported, we escalate to
> +     * use all context invalidation.
> +     */
> +    if ( likely(cpu_has_vmx_vpid_invvpid_single_context) )
> +        goto execute_invvpid;
> +
> +    type = INVVPID_ALL_CONTEXT;
> +
> +execute_invvpid:

There no reason at all to use "goto" here (and with that replaced there's
then also no style issue with the label placement).

Jan

> +    __invvpid(type, v->arch.hvm.n1asid.asid, 0);
> +}
> +
>  static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
>  {
>      int type = INVVPID_INDIVIDUAL_ADDR;


