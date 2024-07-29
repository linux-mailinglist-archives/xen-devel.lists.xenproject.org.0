Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E5793F410
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 13:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766624.1177123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOa4-0007j0-UB; Mon, 29 Jul 2024 11:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766624.1177123; Mon, 29 Jul 2024 11:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOa4-0007hV-RI; Mon, 29 Jul 2024 11:30:20 +0000
Received: by outflank-mailman (input) for mailman id 766624;
 Mon, 29 Jul 2024 11:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYOa2-0007hP-RM
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 11:30:18 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee56c934-4d9d-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 13:30:17 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5a10bb7bcd0so5456114a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 04:30:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac6377d005sm5606195a12.38.2024.07.29.04.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 04:30:16 -0700 (PDT)
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
X-Inumbo-ID: ee56c934-4d9d-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722252617; x=1722857417; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IUHCZK6ZvL/Arnra9wTvMAxvHk5mx1RRtZCcQa7O3h0=;
        b=NgES5xovCGdl30g67iXOftZUtOuyIUMQ/h1maq1pRLn+l+tPkZVdgRsiqTOh6czewH
         spN3b/BhPg7wGkQifaWH2OcJR83xz376PeusHFX3Fig2duEw5nG6oMtRM6OOXJZXpFs4
         itljMpeZ4hidnO7o/ND8dC0rTozFxNKjO8KBMU+wlUya95hrAig5SE+nm0AcxCfCq1Pv
         TPwKBcfOKSlguRVJDTLZtiN6rKYqnxfYacilUBMcsaT4yGdN/ba10Xslf282ZyryGzcU
         S0pTeT6A86lbK2lwMGoY5+3mF67Ilj3B1ZNEYH+D19Po3kyAlFiRrbvCQlRWtP6GEmuh
         5kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722252617; x=1722857417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUHCZK6ZvL/Arnra9wTvMAxvHk5mx1RRtZCcQa7O3h0=;
        b=if4NPreqRWc0sDY2+FdBFvx9cW2Ln8aM5ipaS1JMLWeWeZBbf9SV+Rqabai0f35FkU
         0hqRgS43TXmX06loMIS8uTmzfl0HXtsJtQi1aReSoxir0liyd03Iqx+32ZyRzBd9Hq/+
         b430iFTWx/sjhZjH8/JVQjw7Obk3nNQNO7tpfy6jkc1BG2WCgkeUUAfkBJuVny96XpIj
         a12JQ+NLZu7LfbUIjlN/74bDw+mJRhk8S1/LN9kdq+MIdC6mvV2vwgCZHEoA33+iQrAa
         cKIfhh7fmezCMvoz4+Ff5rByhPPYTBwEt2NdipeuIJOcwPd0rjhmRZ+HseOgQw6LHCIz
         ln6g==
X-Forwarded-Encrypted: i=1; AJvYcCV436o+2SIivmhMhtm6cIHY2h7mC/HsnWUyVJzEfKa88n4H70kdwR/juMgw9MzZ/DhR2NCyuTTYYNA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysWr6hxk4fBuy/ROCDevJYPE8PL5XP31WHlfqk9jO2+n9tOg7Z
	crgkmx2s7gR76tSefV40T3faOMQhMU6r4hI4SRNuQaKxVx5LKDA9v/2X6DoiEg==
X-Google-Smtp-Source: AGHT+IGbvyDMbJSBfVnrX/TW2OzdVRnZ3CxczBnMrg9rJk41cISSSWwXWWIoWuZmbdipTID1UxFV+Q==
X-Received: by 2002:a50:8e50:0:b0:5a2:fc48:db27 with SMTP id 4fb4d7f45d1cf-5b02385bb88mr5407915a12.32.1722252617121;
        Mon, 29 Jul 2024 04:30:17 -0700 (PDT)
Message-ID: <f0925d77-db8d-410c-873f-0bf38727aca9@suse.com>
Date: Mon, 29 Jul 2024 13:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] x86/ucode: Utilize ucode_force and remove
 opt_ucode_allow_same
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240725082725.2685481-1-fouad.hilly@cloud.com>
 <20240725082725.2685481-5-fouad.hilly@cloud.com>
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
In-Reply-To: <20240725082725.2685481-5-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.2024 10:27, Fouad Hilly wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2650,7 +2650,7 @@ performance.
>     Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
>  
>  ### ucode
> -> `= List of [ <integer> | scan=<bool>, nmi=<bool>, allow-same=<bool> ]`
> +> `= List of [ <integer> | scan=<bool>, nmi=<bool> ]`
>  
>      Applicability: x86
>      Default: `nmi`
> @@ -2682,11 +2682,6 @@ precedence over `scan`.
>  stop_machine context. In NMI handler, even NMIs are blocked, which is
>  considered safer. The default value is `true`.
>  
> -'allow-same' alters the default acceptance policy for new microcode to permit
> -trying to reload the same version.  Many CPUs will actually reload microcode
> -of the same version, and this allows for easy testing of the late microcode
> -loading path.

The removal of a command line (sub)option should come with a CHANGELOG.md
entry.

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -90,6 +90,11 @@ struct ucode_mod_blob {
>      size_t size;
>  };
>  
> +struct patch_with_flags {
> +    unsigned int flags;
> +    struct microcode_patch *patch;

Pointer-to-const? If the const was omitted here just because of
microcode_free_patch(), then I think the issue should be taken care
of there.

> @@ -237,7 +238,11 @@ static DEFINE_PER_CPU(int, loading_err);
>   */
>  static cpumask_t cpu_callin_map;
>  static atomic_t cpu_out, cpu_updated;
> -static const struct microcode_patch *nmi_patch = ZERO_BLOCK_PTR;
> +static struct patch_with_flags nmi_patch_with_flags =

Could the variable name perhaps continue to be "nmi_patch"? Or be
simply "nmi_arg" or some such?

> +{
> +    .flags  = 0,

Nit: This isn't really needed.

> @@ -379,7 +386,8 @@ static int secondary_nmi_work(void)
>      return wait_for_state(LOADING_EXIT) ? 0 : -EBUSY;
>  }
>  
> -static int primary_thread_work(const struct microcode_patch *patch)
> +static int primary_thread_work(struct microcode_patch *patch,
> +                               unsigned int flags)
>  {

Why is this change needed?

> @@ -446,7 +455,8 @@ static int secondary_thread_fn(void)
>      return this_cpu(loading_err);
>  }
>  
> -static int primary_thread_fn(const struct microcode_patch *patch)
> +static int primary_thread_fn(struct microcode_patch *patch,
> +                             unsigned int flags)

Same here.

Jan

