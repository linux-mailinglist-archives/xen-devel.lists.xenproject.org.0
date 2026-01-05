Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D970CF4DA2
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 17:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195673.1513601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnum-0000US-W7; Mon, 05 Jan 2026 16:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195673.1513601; Mon, 05 Jan 2026 16:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnum-0000RL-SL; Mon, 05 Jan 2026 16:58:44 +0000
Received: by outflank-mailman (input) for mailman id 1195673;
 Mon, 05 Jan 2026 16:58:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcnul-0000RF-BH
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 16:58:43 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c47f6c20-ea57-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 17:58:33 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-432777da980so54698f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 08:58:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bca2fabcsm530355f8f.16.2026.01.05.08.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 08:58:32 -0800 (PST)
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
X-Inumbo-ID: c47f6c20-ea57-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767632312; x=1768237112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=03e/fx0aBaqngeNND1sOQn6a5hcabBfkxB+SMXmaLcU=;
        b=VZR/HMrNmO8F7IF3bNLTVfhKEXTRpHwtqd6H36jS/AGt5XbMnHUdu8OYXX6coxus5O
         UlOVbvIKZNpFdRQtcGGCTlx1aCXsQJJS/oQV8hu/H2u8d2QMbcgE+oU3JUovbnZNONFq
         woTMdb5+DCskYADyoR+vc7Q1P0x4M1ocaTQ9t/PEnrdlomnmWSXuU59UgDNaAAOdN9pU
         kxzNpXBgVYh6tLE7MMKBReEXBXWCWqVhy+6HVnTBPMThbvrn+v9xlfY7jEh4Mmdmc7Lt
         C5y0DmR081i4kVCcdiMyZWEzFHPF45pQMNDlBI2qYXkWQxzgoZDPQYlBKofiHcEAZITL
         ZFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767632312; x=1768237112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03e/fx0aBaqngeNND1sOQn6a5hcabBfkxB+SMXmaLcU=;
        b=Cfs5TG7qsbzK8tiDaRn7ZtROuiCpFEzHcGpSjik4H//k/Ignk0VZt9d+A4YNiTinFT
         kEss6UEnYM1WzPFbH+BpV/fpS1KJz/yttmnq1EqIy/72VbP/7ZRZ679NzJRc2zCN04z6
         doLZ5GSrftr5G8lK6Ql3XmdkND05/QlerNt4VXMuk0Dtpbv6LTsQFwcWiQ8eiOgHhOjn
         JA9qEAJZIWYQjppI9rnbcbC0nSdFTaIGb3eLDoyWEFxQ2RsCto1cBlxOLkc5PSu+zgV6
         I7pIh7EsX5OKNLKS4n5N4qkmQz6Y68xAlXSKsNGlnPF+OZIUdeIzdwPgW3Pd9qHJznQ8
         IKRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/xXRZF2mqKiDlDtaG7SgoCnf6/Fz5akDjkjd+o6uPvRGoNbQigmVrr4RqaL1T1bh/8d98tzESuc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3gWLqK/62owdoNe0dAjsu703qyrKb+kXsht7snuYb+JcZmHdV
	N0hknPd2H0Zaf7SYsLu6O6XggZoARH16j4UFg2hJqmnXsTaz2ZgNpLNfO3Gg7luPiw==
X-Gm-Gg: AY/fxX4Xaz7wyZ10axY/wGBrEGPUYBsEmWJLwTm5MJxcprNL8vOf57rEa/076GHXL00
	sxYfqQt4wnE196Nt4XBi67KrID9REF25Bdym2yFCf4/JAZHas9kREUfT513JPpcWlEEr+fjE5hy
	7QbvZTJOfcuti/cXHvJq2YVqk/RtLjIAs2xLNu6k6TQ5kVT5vRlYMKkTM32y1aeSPNH21kknC5o
	cqnMJOW/YZgqgiqjZcq7aFwau0eERqxPF1K6MJxm/5xpNsBs7PG5aKFlFimeTseByAZfQGADTJY
	A8GV7ExEtu84e7snbNdML11TZpqSKNCB/cO1ighEsZz0qWreA2K94EjZdY7qwpowqjrZ42TPP3W
	PmdpJe5UvtvWDmq85idW9uEmDvBgGcndrKRRyXPjwbxb0kEB6J6E76976byc/aaW4YWglTk3Jht
	VGHivUqoFYUMN7Z6szMgzsxvDbR17n/kWo84Jvjb6aNyrUUi7qU4fjxJDKrpFeCx8NbUi4mx+Wd
	/E=
X-Google-Smtp-Source: AGHT+IEwsGnLHRjMTO+GfgSpgn8WUBCF7iEDmCKcSj3XQBUgu3Yf88JkN5+v9yjNnZoKSuMDcaoxjg==
X-Received: by 2002:a05:6000:1843:b0:42b:3dfb:644c with SMTP id ffacd0b85a97d-432bca18dfdmr541289f8f.10.1767632312348;
        Mon, 05 Jan 2026 08:58:32 -0800 (PST)
Message-ID: <41b7b388-6c10-4cbe-a4af-a25baba64e2a@suse.com>
Date: Mon, 5 Jan 2026 17:58:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/15] xen/riscv: introduce struct arch_vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <3b531dff3755da010664111cf7d936ccba7c1f5d.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3b531dff3755da010664111cf7d936ccba7c1f5d.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> Introduce structure with VCPU's registers which describes its state.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Since none of this is being used for the time being, I think the description
wants to be a little less terse. Coming from the x86 (rather then the Arm)
side, I find the arrangements irritating. And even when comparing to Arm, ...

> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -22,9 +22,63 @@ struct hvm_domain
>  struct arch_vcpu_io {
>  };
>  
> -struct arch_vcpu {
> +struct arch_vcpu
> +{
>      struct vcpu_vmid vmid;
> -};
> +
> +    /* Xen's state: Callee-saved registers and tp, gp, ra */

... I don't think the following structure describes "Xen's state". On Arm
it's guest controlled register values which are being saved afaict. I
would then expect the same to become the case for RISC-V.

> +    struct
> +    {
> +        register_t s0;
> +        register_t s1;
> +        register_t s2;
> +        register_t s3;
> +        register_t s4;
> +        register_t s5;
> +        register_t s6;
> +        register_t s7;
> +        register_t s8;
> +        register_t s9;
> +        register_t s10;
> +        register_t s11;
> +
> +        register_t sp;
> +        register_t gp;
> +
> +        /* ra is used to jump to guest when creating new vcpu */
> +        register_t ra;
> +    } xen_saved_context;

The xen_ prefix here also doesn't exist in Arm code. Nor is there a
similar, partly potentially misleading comment on "pc" there
comparable to the one that you added for "ra". ("Potentially
misleading" because what is being described is, aiui, not the only
and not even the main purpose of the field.)

> +    /* CSRs */
> +    register_t hstatus;
> +    register_t hedeleg;
> +    register_t hideleg;
> +    register_t hvip;
> +    register_t hip;
> +    register_t hie;
> +    register_t hgeie;
> +    register_t henvcfg;
> +    register_t hcounteren;
> +    register_t htimedelta;
> +    register_t htval;
> +    register_t htinst;
> +    register_t hstateen0;
> +#ifdef CONFIG_RISCV_32
> +    register_t henvcfgh;
> +    register_t htimedeltah;
> +#endif
> +
> +    /* VCSRs */
> +    register_t vsstatus;
> +    register_t vsip;
> +    register_t vsie;
> +    register_t vstvec;
> +    register_t vsscratch;
> +    register_t vscause;
> +    register_t vstval;
> +    register_t vsatp;
> +    register_t vsepc;
> +}  __cacheline_aligned;

Why this attribute?

Jan

