Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9796CFCAAE
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 09:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196573.1514354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdPBY-0003yy-Nc; Wed, 07 Jan 2026 08:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196573.1514354; Wed, 07 Jan 2026 08:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdPBY-0003xE-KZ; Wed, 07 Jan 2026 08:46:32 +0000
Received: by outflank-mailman (input) for mailman id 1196573;
 Wed, 07 Jan 2026 08:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdPBW-0003x8-OA
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 08:46:30 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 535c11de-eba5-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 09:46:15 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47d63594f7eso10854175e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 00:46:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8384646fsm50965975e9.15.2026.01.07.00.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 00:46:14 -0800 (PST)
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
X-Inumbo-ID: 535c11de-eba5-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767775574; x=1768380374; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zAVbi728WuF7QBuMeLZiS48gck7F1ciPMFRLqn+3jLk=;
        b=FQQ1/KgeWQ2xj2NEsJAsJvSguumtKljKIvmbIHUq99BFZ3cIiOwKrXqy04tx/2tppD
         RMfz5KrtRaB0vVjQkFAYyG58KJjOjnWBE4V/3G3Qw36LOQTkrEi1tImLHDBDeoqOqsuJ
         2DsBkVgFdeEWROTX53f6ZY/C0ecqBDWkhXVtSr1NqgiwH+DnMg3Yyf/JSqQT2mpXtlpv
         aJ88Kan1RzOSAdLOHhHvwxD1bzaiAV6mUlJO/Miv0tiKQ7hJuPyAaTBjeAUoS8Cpkaz4
         N23MN9rwBTiAAVXD57bPGshvThdNcGfPg8xAbb/KPQBoBbqCTKRtosigbXkG+h81i5Ty
         5a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767775574; x=1768380374;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAVbi728WuF7QBuMeLZiS48gck7F1ciPMFRLqn+3jLk=;
        b=CDw7zVCgivyQ7Xy7b7Lh8Qo+HxXMRegK42c8DzLxpyPeHKaO8nTyA46zw96y0O5cq9
         xoT0tfEF07NSqMoR1SgYQcokZDU7osGLjiXWoCovSZY+IV6VwufE2zpZP7PGaiK/dHxK
         Jdz0+hbQhbF6xR06bvAY7kH4xjUPJjW1QBqnqOWxrasdkWaWoN/pm0Yeihbq6k52lGcb
         fDLk0wH9scNHRbwYBBzya8xydwfPTEVuhkeZLYqwZ/K6Zj3CPmkau4LHQaCAFY52IrFT
         R6Wjre5rux9ZiTfI1l2eDooh+HeY1YN6OMenZnKfvEuARJzUbIxWWj8+0PWSFRYE2qbQ
         xhxA==
X-Forwarded-Encrypted: i=1; AJvYcCXPgAcixq3XjWir08MPyMJeUqTbx6pejxhQQH6qvQRHr3Rq2UbGbnUpjRnVRDr4So7nHsr0jTq8Kt0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNsqpqKuL0E6HVsZ9n88xjL82SxsUiYqx/2sJuy0Vlj58tKMb9
	i8XtQrUqwYlXjPAlyC3ERtQQbe+e8WXbKZtzWdHJzvXOCDFsCS/5Qvaw28/xE11BSw==
X-Gm-Gg: AY/fxX6WBiXthMK95yQWFzc7mIcHpJ8lRWjuq3q29V0odWN879gGzyoEzzB46tDI8qM
	61xC1Ks/6AGiqoZ16135EGfjmwXoWoGfvVSXG8gErQpVf6q6mRWAlYxg7i5lktZqwvIp5M6/cox
	Sun52IDyCG5SS8jnVrDoeUNdT3WNV+Agy/CbRPSU7CLfzGb9r7xR+rTRn/2ieA6ykPkTs62SEG/
	o/v7TJFaQzU6VVFJF236lwj2nUOXbXE7jWErvZYCTigfY6xCfvA+XpAy/hF3Mr/zJ10ACtaEMtC
	Df44AEkehfJP5ZIctqkrINAICbZA/AwdtcUJUa29f9ogHARQ9TN7asQR3fNsU3ACpJglFdBVeaD
	fw4cyIwX05g9unnf3Foo0NjvK7fTPSP3MD1CXAPFL+b/BLJjFjNFo5fiSyNTVkGuqb1zc3KPSGC
	X6Xr/k2s1w53V5RrHLwGOYE//HQGjJ2zcLlFza9pHZ2bpefKsO0pvzh03iT5pSFlHXFyYU9y2uv
	HFyEs+Ijpg5pg==
X-Google-Smtp-Source: AGHT+IGq4J7r5weGwOCqe3LFFQpjnwuwFOqWHoNVZsv1J76WUXsJk08j08085mNsc/nRT2y/gZYhEg==
X-Received: by 2002:a05:600c:4447:b0:477:3e0b:c0e3 with SMTP id 5b1f17b1804b1-47d84b3b8b9mr17239285e9.32.1767775574450;
        Wed, 07 Jan 2026 00:46:14 -0800 (PST)
Message-ID: <dc24a8ea-9041-4097-bbe2-459c668e9e64@suse.com>
Date: Wed, 7 Jan 2026 09:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/15] xen/riscv: implement vcpu_csr_init()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <bf617d77bb9e75bbd2930614bb86ff83b80adcfc.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <bf617d77bb9e75bbd2930614bb86ff83b80adcfc.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> Implement function to initialize VCPU's CSR registers to delegate handling
> of some traps to VS-mode ( guest ), enable vstimecmp for VS-mode, and
> allow some AIA-related register (thier vs* copies ) for VS-mode.

The henvcfg setting isn't covered here at all, unless I'm failing to make the
respective association. Nor is the setting of SMSTATEEN0_HSENVCFG in hstateen0.

Overall it feels like the description here is too terse anyway, as the bits
set (or not) are a pretty crucial thing for running guests. Then again maybe
this is just me, for not being a RISC-V person ...

> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -3,6 +3,67 @@
>  #include <xen/mm.h>
>  #include <xen/sched.h>
>  
> +#include <asm/cpufeature.h>
> +#include <asm/csr.h>
> +#include <asm/riscv_encoding.h>
> +
> +static void vcpu_csr_init(struct vcpu *v)
> +{
> +    unsigned long hedeleg, hideleg, hstatus;
> +
> +    hedeleg = 0;
> +    hedeleg |= (1U << CAUSE_MISALIGNED_FETCH);
> +    hedeleg |= (1U << CAUSE_FETCH_ACCESS);
> +    hedeleg |= (1U << CAUSE_ILLEGAL_INSTRUCTION);
> +    hedeleg |= (1U << CAUSE_MISALIGNED_LOAD);
> +    hedeleg |= (1U << CAUSE_LOAD_ACCESS);
> +    hedeleg |= (1U << CAUSE_MISALIGNED_STORE);
> +    hedeleg |= (1U << CAUSE_STORE_ACCESS);
> +    hedeleg |= (1U << CAUSE_BREAKPOINT);
> +    hedeleg |= (1U << CAUSE_USER_ECALL);
> +    hedeleg |= (1U << CAUSE_FETCH_PAGE_FAULT);
> +    hedeleg |= (1U << CAUSE_LOAD_PAGE_FAULT);
> +    hedeleg |= (1U << CAUSE_STORE_PAGE_FAULT);
> +    v->arch.hedeleg = hedeleg;

Wouldn't you better start from setting all of the non-reserved bits, to then
clear the few that you mean to not delegate? Then again I'm not quite sure
whether the set of CAUSE_* in the header file is actually complete: MCAUSE
also can hold the values 16, 18, and 19. (Otoh you have CAUSE_MACHINE_ECALL,
which I don't think can ever be observed outside of M-mode.)

Also, while it may seem to not matter much, sorting the above by their numeric
values would ease comparison against the full set.

> +    hstatus = HSTATUS_SPV | HSTATUS_SPVP;
> +    v->arch.hstatus = hstatus;

Why would these (or in fact any) bits need setting here? Isn't hstatus written
upon exit from guest context?

> +    hideleg = MIP_VSTIP |  MIP_VSEIP | MIP_VSSIP;
> +    v->arch.hideleg = hideleg;

Again I think having MIP_VSTIP in the middle (to establish numeric sorting)
would be slightly better.

Also there's a stray blank after the first |.

> +    /*
> +     * VS should access only the time counter directly.
> +     * Everything else should trap.
> +     */
> +    v->arch.hcounteren |= HCOUNTEREN_TM;

Why are this and ...

> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
> +        v->arch.henvcfg |= ENVCFG_PBMTE;

... this using |= but the earlier ones simply = ? Unless there is a specific
reason, consistency is likely preferable.

> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +    {
> +        /*
> +         * If the hypervisor extension is implemented, the same three bitsare
> +         * defined also in hypervisor CSR hstateen0 but concern only the state
> +         * potentially accessible to a virtual machine executing in privilege
> +         * modes VS and VU:
> +         *      bit 60 CSRs siselect and sireg (really vsiselect and vsireg)
> +         *      bit 59 CSRs siph and sieh (RV32 only) and stopi (really vsiph,
> +         *             vsieh, and vstopi)
> +         *      bit 58 all state of IMSIC guest interrupt files, including CSR
> +         *             stopei (really vstopei)
> +         * If one of these bits is zero in hstateen0, and the same bit is one
> +         * in mstateen0, then an attempt to access the corresponding state from
> +         * VS or VU-mode raises a virtual instruction exception.
> +        */
> +        v->arch.hstateen0 = SMSTATEEN0_AIA | SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT;

What is SVSLCT? Bit 60 is named CSRIND in the spec I'm looking at, and the
commentary above looks to confirm this.

Also, wouldn't you better keep internal state in line with what hardware
actually supports? CSRIND may be read-only-zero in the real register, in
which case having the bit set in the "cached" copy can be misleading.
(This may similarly apply to at least hedeleg and hideleg, btw.)

As to consistency: Further up you use local helper variables (for imo no real
reason), when here you don't. Instead this line ends up being too long.

Jan

