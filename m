Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D06956AF7
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 14:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779640.1189352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1cr-0005Ce-Tq; Mon, 19 Aug 2024 12:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779640.1189352; Mon, 19 Aug 2024 12:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1cr-0005B9-R8; Mon, 19 Aug 2024 12:36:45 +0000
Received: by outflank-mailman (input) for mailman id 779640;
 Mon, 19 Aug 2024 12:36:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sg1cq-00050u-82
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 12:36:44 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b05b81eb-5e27-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 14:36:42 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5becfd14353so2974869a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 05:36:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838396bc50sm628134966b.198.2024.08.19.05.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 05:36:40 -0700 (PDT)
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
X-Inumbo-ID: b05b81eb-5e27-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724071002; x=1724675802; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/sNJW+D9JttMU+LFQe6BNRSUs+MACejWDdGl22/raSg=;
        b=Yman7Kqi0mwPh79O914InVdnj1KypIuMHQVjEpwXFEHFyexRVHvnRZw/yQs+MDgDNB
         XOREO0ZkWULHIOK3BD0TQUqMBwvj7/kVwEqytF3macxFtxGAQ5O8V3UUKNJm3Kq4kSX6
         HfTxQmKthbw8jOjMQ9I+Sf9sKSFLxgFgs7VtzNsIqNw+mAuh6stgYTyP62OkvfWNyjt1
         S2FFp5LQTWmJXP9ksdjLzYYfh4odKGQMR6JEkBwtTwVdWNa4OcicCA5A8lrRI/WRzuGl
         rHvzgyal3BUfgYTniSPnC6oI1vampnu5+B4rio8OakAPRaIoW/WpXV6uBY3xeRIPWqXy
         5KbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724071002; x=1724675802;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sNJW+D9JttMU+LFQe6BNRSUs+MACejWDdGl22/raSg=;
        b=Ylwm7e1dapKY07ACBinfntNX4hCOhKp+H6HVfbQl0GsRqKVYOn+oqGVlBeIkE2QnP7
         II7M0nJ84YseWxQO0ntuFraa9YFmsK0e1qRN/ki25qdcxzIc9fA97LdP2WH0FMV0PJwn
         ylkkfvMHY3akSMBXibeK4LcGtJpet1UyKGrEUfXfbpu12PTAko5jvjtELWl4sRcqYSJF
         fWI+aWCztZOJ4PqpECK/El6TFZbPqlF4aMiYZKINtpYiT7kB1UICjavqmLXW6sh3YEC8
         x7XiBfhC6PQN5D+JDw7wVZDvqSvG4Cr05lDWW9YrF5X4rIrro3+J26bJdbIig71jsp+i
         NIzw==
X-Forwarded-Encrypted: i=1; AJvYcCXacdchTvnGV5aijJZ0z2l4DMPnhzWO1ntclLfAI6ZqHy2t7oQ61PdWuI55BXpZOVh/3nCqsbw7xFAJOjBpXlGcDaHThrIiSGyhhxVGKU0=
X-Gm-Message-State: AOJu0YxS3r+NeybrMmm37i0kEAcj+Ocpar57gik0wX/I4brYF6zyjrr2
	gz5LJTDOhZO3ctmdFoR9a34av6g0Mb7troRRI1pctOe8GgYWuvQ8yBs/UoiVqQ==
X-Google-Smtp-Source: AGHT+IFe1OGkA1m6FcrKoVEH8lpj0UvluNDFJxpKYNwS4cReiMu/LsdDkUj861Cg1fZjAZNCK31ObA==
X-Received: by 2002:a17:907:9686:b0:a7d:30d2:28f8 with SMTP id a640c23a62f3a-a8392a3923bmr612783766b.68.1724071001184;
        Mon, 19 Aug 2024 05:36:41 -0700 (PDT)
Message-ID: <5675ea5a-0c14-42e2-b817-d9576a1f64b7@suse.com>
Date: Mon, 19 Aug 2024 14:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 5/5] x86/amd: optional build of amd.c
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
 <3c641433fa7cfe1f7fdc918ab32086835a2e13eb.1723806405.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <3c641433fa7cfe1f7fdc918ab32086835a2e13eb.1723806405.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2024 13:19, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -919,7 +919,8 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
>       * Possibly clear previous guest selection of SSBD if set.  Note that
>       * SPEC_CTRL.SSBD is already handled by svm_vmexit_spec_ctrl.
>       */
> -    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> +    if ( IS_ENABLED(CONFIG_AMD) &&
> +         v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>      {
>          ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
>          amd_set_legacy_ssbd(false);
> @@ -953,7 +954,8 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
>          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
>  
>      /* Load SSBD if set by the guest. */
> -    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> +    if ( IS_ENABLED(CONFIG_AMD) &&
> +         v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>      {
>          ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
>          amd_set_legacy_ssbd(true);

Instead of these changes, shouldn't AMD_SVM become dependent upon AMD in
Kconfig?

> +#ifdef CONFIG_AMD
> +extern bool amd_acpi_c1e_quirk;
> +extern bool amd_virt_spec_ctrl;
> +#else
> +
> +#define amd_acpi_c1e_quirk (false)
> +#define amd_virt_spec_ctrl (false)

As a remark, while there's nothing wrong with parenthesizing "false" here,
it also isn't really necessary. Omitting unnecessary parentheses generally
aids readability imo.

Jan

