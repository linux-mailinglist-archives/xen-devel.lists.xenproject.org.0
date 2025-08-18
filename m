Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E497DB2A04F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 13:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085970.1444216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uny1K-0000Rs-PP; Mon, 18 Aug 2025 11:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085970.1444216; Mon, 18 Aug 2025 11:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uny1K-0000QE-LY; Mon, 18 Aug 2025 11:27:22 +0000
Received: by outflank-mailman (input) for mailman id 1085970;
 Mon, 18 Aug 2025 11:27:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uny1I-0000Q8-P1
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 11:27:20 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d55f301-7c26-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 13:27:19 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb7ace3baso690886266b.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 04:27:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72d95sm781147266b.33.2025.08.18.04.27.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 04:27:18 -0700 (PDT)
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
X-Inumbo-ID: 4d55f301-7c26-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755516439; x=1756121239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c6YI6rLDELEMVS9y/+wUGUf6Y17A1nICAA/Vkash6gk=;
        b=LMIOEwO7Edjex+5mCM68s6IaWARpu+Y02SjoL7sfxx0+sCRXp4nb5v3ueO/nYvQKNH
         np+LD0YnkpgBuZD0nPABzUgqXJUuOfozyKca1+VXXakS6u2oJXipE6wowIYVBm0FOG/4
         GO7QlsXmhgv0GLXL8uSvJcqRdZ0gzN0Vsp8l+fOTe482aqfIm/FfijGrWxGM8itgxfPc
         +iMG+r7HQwhuKecY50Al357DJa80lNBHWsv84Dda7vRZn5YzwtNjLVESYUmp+Yx4IqEr
         xVIVib+IYlFS01GMWnh2N9LHpn2zN8qKHETZ7/msvgsK/nIgFaaq6KX0uhELR0NVYLV4
         v02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755516439; x=1756121239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6YI6rLDELEMVS9y/+wUGUf6Y17A1nICAA/Vkash6gk=;
        b=ggxVz8q5581neAYuNC4H3uddS1/aYo4pl/TaKM8nGfklCguG+FE619gGOixhd6hNE3
         CsuJPOlzd/xrYGlYyaWURKTe1zW/qYjNJTP9xCpOy+Nc+SzDfhWlVBjytDWdpvyUTldW
         fZ9IK5gaHse2MrxGyV8OEtrQNKc5Nk+G3BgkBPz8rOQCOxGnlQQ6pWpRdFwdymoDDeDr
         A5N4up49JD6ytqnDZuvVzdLUHv35sauptOvnDWQMrAofLPTor9wwwiIBVKDmZrueKVs/
         lQQmCTV6e1UhQUqklM7lC7REdOVZEPcL0i75yi3uCFsD/hXgljvGJdkHin5SOU07PZg/
         DgLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4bgHHNa2rOP2Qo2db7Lq5a6d/K8HoLFud5vbVsFwusW+oZO/YNXKnXMSk1qDIgfdcitGJgKq2e84=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWLmmU5gh3f0+T6AoechQ0LqNjStnLt46SaRFyVPSw/yu18zfQ
	WdDWc3LrrzRyLNfvFTNhL5Dw5jFyJYtXO423oGe8XRdtvVNDp1X8WrzrhWm0gPcIwQ==
X-Gm-Gg: ASbGncvomeNYJcshI968D6e4juEXZZreIaEL9xMYeigusF0Y4xVc593BwZfFdjEUqbh
	zhK5ZAbFeFwpCGuRNkKUTnscO9nWvyHGlW18rCDBgAjx+PptwOIRaULk9XnlSWDtAIuxk0uldnl
	hULf4yExpoe2sar9sIZird0epdvrDTIOtjdRzIJhNI441kLpoj6rUPHC0yE9YvPbgCi11tNatBL
	GApw15RR2+SRn68JHjfwFOhdo8xLt25tH5dqCnnxXD2D10TvVl3PV3+DaoQH2DH5KL43VkjPIsG
	gqhjHHQAvXRh13i9GexORrQI/7YDkyG8ugZZ0m71rhDiEMXNSybAgKkAaGA8ueiQnneVYsbvV/i
	3bMpFhLn68wvOV2ffxfrSQrBU+bYuZU3esf99/01c6V7YiOpxUsyXzGfbDUTGnaTscS1ynqkrJx
	04QGMyuJY=
X-Google-Smtp-Source: AGHT+IH35MtDGHaQ1rHsPAH+0hxBlxdYuYwuNJ/MaNRCpLrR++yu0jFxM37G9oGk7HGaOCPOjtlHnA==
X-Received: by 2002:a17:907:c28:b0:ae0:ad5c:4185 with SMTP id a640c23a62f3a-afcdc3e9749mr871572066b.57.1755516439158;
        Mon, 18 Aug 2025 04:27:19 -0700 (PDT)
Message-ID: <aa57cc7c-c659-4949-aaed-4484ead54ffc@suse.com>
Date: Mon, 18 Aug 2025 13:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] x86/msr: Rework rdmsr_safe() using asm goto()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> ... on capable toolchains.
> 
> This avoids needing to hold rc in a register across the RDMSR, and in most
> cases removes direct testing and branching based on rc, as the fault label can
> be rearranged to directly land on the out-of-line block.
> 
> There is a subtle difference in behaviour.  The old behaviour would, on fault,
> still produce 0's and write to val.
> 
> The new behaviour only writes val on success, and write_msr() is the only
> place where this matters.  Move temp out of switch() scope and initialise it
> to 0.

But what's the motivation behind making this behavioral change? At least in
the cases where the return value isn't checked, it would feel safer if we
continued clearing the value. Even if in all cases where this could matter
(besides the one you cover here) one can prove correctness by looking at
surrounding code.

> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -55,6 +55,24 @@ static inline void wrmsrns(uint32_t msr, uint64_t val)
>  /* rdmsr with exception handling */
>  static inline int rdmsr_safe(unsigned int msr, uint64_t *val)
>  {
> +#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
> +    uint64_t lo, hi;

Could at least this line move ahead of the #ifdef, to also cover ...

> +    asm_inline goto (
> +        "1: rdmsr\n\t"
> +        _ASM_EXTABLE(1b, %l[fault])
> +        : "=a" (lo), "=d" (hi)
> +        : "c" (msr)
> +        :
> +        : fault );
> +
> +    *val = lo | (hi << 32);
> +
> +    return 0;
> +
> + fault:
> +    return -EFAULT;
> +#else
>      int rc;
>      uint64_t lo, hi;

... the same being needed here?

Jan

