Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D540B29EE6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 12:15:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085876.1444146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwtY-0003u6-3c; Mon, 18 Aug 2025 10:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085876.1444146; Mon, 18 Aug 2025 10:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwtX-0003rp-W3; Mon, 18 Aug 2025 10:15:15 +0000
Received: by outflank-mailman (input) for mailman id 1085876;
 Mon, 18 Aug 2025 10:15:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unwtX-0003rj-Gn
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 10:15:15 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a164860-7c1c-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 12:15:12 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad681so5549097a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 03:15:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618b01ae59esm6834537a12.28.2025.08.18.03.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 03:15:11 -0700 (PDT)
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
X-Inumbo-ID: 3a164860-7c1c-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755512112; x=1756116912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VKQj/6TgXb7or6K2qBxCrUpoOiR7kEXd+6VoPBUfrLg=;
        b=RKJLpGLGNQJ/dKEw5LJZOepge27PMxblL0s4mysqfZDY76mNW8CqIyv9kUWchDSgK0
         bN5XoiCxEyLJhlY3mcYPDB2HIhm41WL1hL9tNmhPG6dT0tSoyu6XifQrptLtwx4RoRAn
         6+VhvB6zVfpYcoo7RGQPCHsmBBRjQGUFMRFtwBIzOD0+QE+Ax7i3hCBnl09RhRK7v10H
         2PUVu5alc835fmLwDvtioTFxSrIe2Bb6QgHtt7dieSAKcR+F5DYdav/9EOMn6wMrskif
         i7fCg53TyiJpd4rZXn5/IeKf6c/nqBBhofzJKmyN2gM+W1lC8b+iI9wFIyHcBl1omCY5
         XZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755512112; x=1756116912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKQj/6TgXb7or6K2qBxCrUpoOiR7kEXd+6VoPBUfrLg=;
        b=O2Dj5M7E8sF2xPW3Z/MIyCmYacHbuvD7Hpi2iXIP7pwVhsuGT9pM3LHDvhwPxpN2xR
         gYyIQ8phE5SEOQQpf+h7rTqFse0/su6yJ57Rf4iWiYGDtap1SyAklgmAtS8b+Hs96RVz
         tCVyfAPM84kQUrCRhwVQQZJjC9/qt+piCybDAk5N0jsYgGr/ulTfR31+8t9hvs1NcIcc
         KZsFknSQlKsvopK2KuN2DwZs37oN8ZA3VrtOMGr4YxMCfKf/YgQNSNfgZNPC4T+qkEN+
         3rsBU9/PSBLqLvT74JWUCnQrwWO3MJ5QvxvEZCHn9hq5TpuxYQuICYfTR83FMd0/5BNB
         WUTg==
X-Forwarded-Encrypted: i=1; AJvYcCUJjcDqWl6BkQ5oxm1w2Ghjex/F1ANAyIxkz1uWOvqNFpFzdBYvWW6fkoFJPqMXyfolQnwxe4rYdRA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxI8kb8JgfiSOT1cxGiIddjIaYwT1yrww87N1aEPHNquU0qhhZ7
	/izoM3LemNHJtUSRFkqMzO8h05Xa3ljquZFTiwBeXttJBo+sNjtzJ4dg0kCzCL5IHg==
X-Gm-Gg: ASbGnctMhD0/shoewb4rmMRPvvSGJ/4eEoPSakcU+mwnH9BU8GhkTrNwW/JdVANQIxM
	PY0Y+zpRjdpBWEuunOdbs4S7c4O2/DEZZdYIbcOVCbC+wz+hPVRJPPiPyLt7J1fiRrPDbCeyFrR
	FpUAD6d8SUV8AIjACuOrZNEvJxKAGbPE1SbXELXH0zpLi2dOz4hUFrxnLuPZh1Aq+9H7ib5drhf
	ODqtRiL+bNGfOULzFtMGCtLZdu/C3nkdD4v1TThVS6zZXsY/ms/DlwCaTghBSXzWbcdc8MtAIu5
	G1yvump4bt5hzpfG1JMU++cHO7eBje06Mt9YLnpGaV2Caf/6nkqF/2ynxwD28ziJQ73Bb7BMpLD
	0WBrsu5fbHpQA8GRMQ5UAEjg8qwmHp3eErdwC7yMO9j9iTOIuQ2fxUhC+yqnCjy5GkgjtKHmLBF
	JPW8GaAyP6X1eO4GiENg==
X-Google-Smtp-Source: AGHT+IF/7TPyYT9hXHqYx3LHSLvhY7h19SzI5N7vFKnPB3A4XDN3NU9+6sZyBZ5zPbZ9eGrn0d7WSg==
X-Received: by 2002:a05:6402:274b:b0:618:bc4:5777 with SMTP id 4fb4d7f45d1cf-619b707c46emr6799188a12.9.1755512111911;
        Mon, 18 Aug 2025 03:15:11 -0700 (PDT)
Message-ID: <5bf9b184-70fb-4698-a01e-e8cbcb05935f@suse.com>
Date: Mon, 18 Aug 2025 12:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1755506449.git.mykola_kvach@epam.com>
 <205b2b354ff1d34d0e9ec4777ca3c94492f6d9d1.1755506449.git.mykola_kvach@epam.com>
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
In-Reply-To: <205b2b354ff1d34d0e9ec4777ca3c94492f6d9d1.1755506449.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.08.2025 10:49, Mykola Kvach wrote:
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -90,6 +90,16 @@ static void ctxt_switch_from(struct vcpu *p)
>      if ( is_idle_vcpu(p) )
>          return;
>  
> +    /* Arch timer */
> +    p->arch.cntkctl = READ_SYSREG(CNTKCTL_EL1);
> +    virt_timer_save(p);
> +
> +    /* VGIC */
> +    gic_save_state(p);
> +
> +    if ( test_bit(_VPF_suspended, &p->pause_flags) )
> +        return;

As I had to look at the Arm side uses of the new bit to at least try to
follow the comment further down, I came across this. And now I wonder:
Why would one of the pause flags need special casing here?

> @@ -1360,13 +1357,33 @@ void domain_resume(struct domain *d)
>  
>      for_each_vcpu ( d, v )
>      {
> +        /*
> +         * No need to conditionally clear _VPF_suspended here:
> +         * - This bit is only set on Arm64, and only after a successful suspend.
> +         * - domain_resume_nopause() may also be called from paths other than
> +         *   the suspend/resume flow, such as "soft-reset" actions (e.g.,
> +         *   on_poweroff), as part of the Xenstore control/shutdown protocol.
> +         *   These require guest acknowledgement to complete the operation.
> +         * So clearing the bit unconditionally is safe.
> +         */
> +        clear_bit(_VPF_suspended, &v->pause_flags);

Seeing that you set this bit for a single vCPU in a domain only, I wonder why
it needs to be a per-vCPU flag.

Apart from this, with the comment I still fear I wouldn't feel capable of
ack-ing this, as there's too much Arm-only interaction in here. It's not even
clear whether this could easily be re-used by another port.

Jan

