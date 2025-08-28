Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A76B39590
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 09:40:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097718.1451944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urXFJ-00039N-5B; Thu, 28 Aug 2025 07:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097718.1451944; Thu, 28 Aug 2025 07:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urXFJ-00036z-20; Thu, 28 Aug 2025 07:40:33 +0000
Received: by outflank-mailman (input) for mailman id 1097718;
 Thu, 28 Aug 2025 07:40:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urXFG-00036r-R9
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 07:40:30 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44a5f33e-83e2-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 09:40:28 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-61cb4370e7bso992549a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 00:40:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c877af155sm5826108a12.49.2025.08.28.00.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 00:40:27 -0700 (PDT)
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
X-Inumbo-ID: 44a5f33e-83e2-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756366828; x=1756971628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e9pt9kkdReGExvhV9Mq8jmKVRYRzcK3A97jhjVAoMNg=;
        b=PllehoSLJuLoxMlPahEjc+W4ai1Gl7BGLbvpgb7EWWxJA0HTYc9pR6PAUljQgxaCVC
         xv8n2moag6uS8fha27XsMMUV8EhVmQVCnXX9/HywgNTUTk8R6fgxwIXVVySGsPTREJXl
         GazHRt80gecUXXQf7X1TRH+hYpK3J2A2PvSVp+trOF8yQ0X4nkhf4o0hY4kx2leg7npY
         FXGlV2QMJyEUGEtYYkrCuAVkjuepqNiQnESF7nkbXTzQr1FF7f5ksTUhv/Db+jRjSWsM
         Kanaxt6QgG9jzvt30aFJBJWLC4MyWc6J72LEKpXQxuiGamGzVuNkMUTDF8v6evpCW5KU
         0a/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756366828; x=1756971628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9pt9kkdReGExvhV9Mq8jmKVRYRzcK3A97jhjVAoMNg=;
        b=wliSeGK1wwVq9QKFjKYc3ovEJTa69cUUWPEuAoo9it8JSSjUztwijyHgY18ukVCN7Q
         z0ttVBr7TY3tVk+BrFQjkcBlCTjeYiP1QJaIArcTRJpGZuTUL0cpXhOyh/Bh27AW3Vux
         M5d1+pmGICoZRtjliPCbwW855gt7QIDysqhWQnWBbO3eqXZX1Ayt86xXyh4JDPZ+93Xc
         QInqDKul5eqbmb9cCughbU4WhPM99uLYtFARbgujgMEU15ZrpRgthzEpDzRYygiY/BL+
         2b9sLn3F5HoP86VEIBYruElQPVt+l+OmqoIx10ilKBKjsBEN3h4cWEq4QpwHajYynEng
         rvsw==
X-Forwarded-Encrypted: i=1; AJvYcCVBiE7WhKVMFI6dwf54qRxoC4Ly42YtyxPWdTj90al21RB7N/q8sF2F/sxdIhcgUwPY6S3vIxpKcPc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytFXETBl/ruuZG2qvZXl1BWcExmL2RblMG0Ygx5AhSmpKYx0KG
	i0cfR/rFPaLcowB9Pt+JH8NpJhrL86qHXmWbLk5nOF4QjYwylRYpx8tVpwJcujIROA==
X-Gm-Gg: ASbGncvm/UQ4Lqy74obBQKgnpAhFpjg0OcTMGCKdrw2vf0vexZ2Yw5Ztg+e+SOIK8kv
	bO9u2OFx/oWWliWK2OmGLvqSQXPJFE8G/cdQdtjaK+sdS0ofWfNa4KJun6cs09T304UxPzJcPgv
	lsNWw2Fw8wOF8LsF/y+OPys9DBHsbs+L4ySWdu12HIa+WZqx+V+YGkgvNU4XYj1gFjh7/c1UgNt
	sEOGBhySGt9rG0NliQS31/BagYoEIhlngAMAgRe/wjnrqp2Bnd4MSJe5LO1p/YSv0LxPm4p99FV
	ul3sNHFcPlYV13JcfcKKd1eYNbv8uJg/xBEn1CnWVI64dj6ZUK3poV+bgJhXbnNpN3NkBrlNRF4
	0TqkcgbhLo+tRLKecY8GtiC13Ut3Hms/S2HqOLBaMfcBh1X8USjubMpP9ES8k5yDpw5/Uh46ni9
	SA+nqWquznkxbk/LoNYQ==
X-Google-Smtp-Source: AGHT+IGWdNFwwBpkq+v/Gndzf0SxwMi1IyeAHvhT9iynrgAZu7Rc1eh1YBLIcNsnD7avvLQVzMKVcQ==
X-Received: by 2002:a05:6402:280c:b0:618:4a41:80b2 with SMTP id 4fb4d7f45d1cf-61c1b70a459mr17840140a12.33.1756366828046;
        Thu, 28 Aug 2025 00:40:28 -0700 (PDT)
Message-ID: <a132f2fe-124b-45ec-9444-42c1840cc29c@suse.com>
Date: Thu, 28 Aug 2025 09:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
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
References: <cover.1756329091.git.mykola_kvach@epam.com>
 <55ff99acd69f9eaf20f077e6b453b54931b541d4.1756329091.git.mykola_kvach@epam.com>
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
In-Reply-To: <55ff99acd69f9eaf20f077e6b453b54931b541d4.1756329091.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2025 23:21, Mykola Kvach wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1349,16 +1349,10 @@ int domain_shutdown(struct domain *d, u8 reason)
>      return 0;
>  }
>  
> -void domain_resume(struct domain *d)
> +static void domain_resume_nopause(struct domain *d)
>  {
>      struct vcpu *v;
>  
> -    /*
> -     * Some code paths assume that shutdown status does not get reset under
> -     * their feet (e.g., some assertions make this assumption).
> -     */
> -    domain_pause(d);
> -
>      spin_lock(&d->shutdown_lock);
>  
>      d->is_shutting_down = d->is_shut_down = 0;
> @@ -1366,13 +1360,40 @@ void domain_resume(struct domain *d)
>  
>      for_each_vcpu ( d, v )
>      {
> +        /*
> +         * No need to conditionally clear _VPF_suspended here:
> +         * - This bit is only set on Arm, and only after a successful suspend.

How likely do you think it is that, if e.g. RISC-V or PPC clone Arm's
code, this comment would then be updated accordingly? IOW I don't think
a justification like this one should be written in such terms.

> +         * - domain_resume_nopause() may also be called from paths other than
> +         *   the suspend/resume flow, such as "soft-reset" actions (e.g.,
> +         *   on_poweroff), as part of the Xenstore control/shutdown protocol.
> +         *   These require guest acknowledgement to complete the operation.

I'm having trouble connecting "require guest acknowledgement" to ...

> +         * So clearing the bit unconditionally is safe.

... the safety of the unconditional clearing.

> +         */
> +        clear_bit(_VPF_suspended, &v->pause_flags);
> +
>          if ( v->paused_for_shutdown )
>              vcpu_unpause(v);
>          v->paused_for_shutdown = 0;
>      }
>  
>      spin_unlock(&d->shutdown_lock);
> +}
>  
> +#ifdef CONFIG_ARM
> +void domain_resume_nopause_helper(struct domain *d)

This is an odd name to use from code meaning to invoke domain_resume_nopause().
Why isn't this called domain_resume_nopause(), and ...

> +{
> +    domain_resume_nopause(d);

... the static function simply _domain_resume_nopause() (in full accordance
to the C standard's naming rules)?

> +}
> +#endif
> +
> +void domain_resume(struct domain *d)
> +{
> +    /*
> +     * Some code paths assume that shutdown status does not get reset under
> +     * their feet (e.g., some assertions make this assumption).
> +     */
> +    domain_pause(d);

As you move the comment - no such assumptions exist when the code path
through domain_resume_nopause_helper() is taken?

Jan

