Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F42AB29AF0
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 09:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085430.1443713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unuRk-0001gE-RF; Mon, 18 Aug 2025 07:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085430.1443713; Mon, 18 Aug 2025 07:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unuRk-0001dy-OV; Mon, 18 Aug 2025 07:38:24 +0000
Received: by outflank-mailman (input) for mailman id 1085430;
 Mon, 18 Aug 2025 07:38:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unuRi-0001ds-GR
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 07:38:22 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e3da4c1-7c06-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 09:38:17 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-618aea78f23so3276675a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 00:38:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618af9da4bdsm6633733a12.17.2025.08.18.00.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 00:38:15 -0700 (PDT)
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
X-Inumbo-ID: 4e3da4c1-7c06-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755502697; x=1756107497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bem4tcqZ6fgCy6luMAU3MbQM+UTYmudC9/uPsrxA6eE=;
        b=VkwSVX2YPM8S/ZP6C+UUkis9cVyUJstXLAUBKVqg+1reYTmjkd6fzPgnYJfxe1gn1x
         5Iv3T7ckhCf74TT4vDMCMEJ9oi+bMeV6D3YvVQILGJVJBJYU1/SEctvCZsgG8e5S+mlw
         4JtCJVLyNpR8voseKd6ppjFpla1oKiBpWuT4Jm+T46f/Ip2vLbIs0YGkZa01GnwzbZxm
         7JQPZKld/QMRuquVNGpn2HIz0LjW3HlwDv24RoMkXffEM2MAQmQ91BJnV7BInb5LxyiX
         krqOZSO/2vOuCVHwWkVLbjegyEVmhPsZMkBE06HdDfLUeje9Z+GR5TAkGtxNecPegEm8
         0e0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755502697; x=1756107497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bem4tcqZ6fgCy6luMAU3MbQM+UTYmudC9/uPsrxA6eE=;
        b=L5Z6/vYMJEwGKiGl/AbhH1dIkNK8+45Pf2z3qdoIJRKCMcCYfmwwkFA8P/xtHIBSCQ
         vwvKyifenSNH0gyUSuxdAzzNQnoMgPBHlmDAZnNF0cl3u+D+PoztNLGkXVbOz/+soy2v
         UXCD5AwOXqECHLPvfFdzrY9cbxMbmFCghnldA+dJAROdailFN9D59KFAoHzQbdzJ0hPM
         YXi39j5br8YTp+mcGZg7rYzFU3M9HyDgfb3fMs9dBBhztlbpQbrV4ce6P21+PFVYroHZ
         zhGuGls8XTk8miWq1p/JcUaFPB30n6V3qWo2TbryqLDOYDbr92irsEMUVGOavXijZ4/A
         LmlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVSj1Vl6k5H04EVPVMq1DUHxA2kBOYbJIMcIj1PwP0UtpYdirzTsNl8I3v9XVHvFgHzptDkJAOrXk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxStk28K5rCmrH6a1M1/dDHTKZFnf/KYYXZfV2cHy07uV/ZgSVv
	qAAUp2TGfCG1c3DsG+E1KCIezeb8OncJqcpekeJoJiRTrA89xHNJPIoBHdEVWy+PzQ==
X-Gm-Gg: ASbGncvA4zim9YlcT5XeAlfGSs8N6YuNf2AIDT1xeapHm/KJ7u7fpq0ATfzHSfUTnby
	k3fPSEPrrW8Wy/ruePVhfpXhIF21WjL7s6SDt1QgkTzHHwdGp/6Xs7HR5EMRoYcPSO4svj8j26L
	65iiItQnTSVVO9cNmXWMf33Mx9Ygwt826QRuOGbqWyGYCq8Xk9kQAoqlifj1p93RDfW2toHxU5Y
	rDFAavGtCfcD6U2gyyOl2ywZ3iAEMSSVNwCokbKynPQv+42dljvy71ROgLbchAhSyuR+uc+aULM
	gtr9WU6ZSaiJsPt9R0RGGr/hFlm9O8dRnUMbpdlmY/s8GPLbhq8NdCodblMV+MElLiz2jUzeh4F
	TkddRnI4Go3GfhG/ZtpstuCTdpuXnkSUsdFiw9BxMlUTOQcHd9HTJV7kTYgwG8ACCpaXJ91wERW
	X7pejMFWw=
X-Google-Smtp-Source: AGHT+IEQlIrEbOyUZPI/mZsm6GdT/7oVV4fKU8PXxvDT9cGKY+5egHnf0ZwPeH2imCp0n29l424p8g==
X-Received: by 2002:a05:6402:1e8a:b0:618:7585:be40 with SMTP id 4fb4d7f45d1cf-618b054b91fmr8712353a12.17.1755502696294;
        Mon, 18 Aug 2025 00:38:16 -0700 (PDT)
Message-ID: <17ab13e4-1fba-4c43-ba32-be512e66621e@suse.com>
Date: Mon, 18 Aug 2025 09:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra: fix sphinx-build issues
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f31b8d62f16bd272114276f53db842101cd53e52.1755266805.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <f31b8d62f16bd272114276f53db842101cd53e52.1755266805.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 16:15, Dmytro Prokopchuk1 wrote:
> Fix the following issues:
> 1. xen/docs/misra/deviations.rst:90: WARNING: Inline interpreted text or
> phrase reference start-string without end-string. [docutils]
> 2. xen/docs/misra/deviations.rst:54: ERROR: Error parsing content block
> for the "list-table" directive: uniform two-level bullet list expected,
> but row 6 does not contain the same number of items as row 1 (2 vs 3).
> * - R2.1
>   - Calls to the `__builtin_unreachable()` function inside the expansion of
>     the `ASSERT_UNREACHABLE()` macro may cause a function to be marked as
>     non-returning. This behavior occurs only in configurations where
>     assertions are enabled. To address this, the `noreturn` property for
>     `__builtin_unreachable()` is overridden in these contexts, resulting in
>     the absence of reports that do not have an impact on safety, despite
>     being true positives.
>     Xen expects developers to ensure code remains safe and reliable in builds,
>     even when debug-only assertions like `ASSERT_UNREACHABLE() are removed.
> 3. xen/docs/misra/rules.rst:127: WARNING: Inline interpreted text or phrase
> reference start-string without end-string. [docutils]
> 4. remove backticks from references to source code in the file rules.rst
> to have a consistent style in this file

I don't understand this: For one, why remove quotation? Personally I
consider such quoting useful. And then ...

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -95,7 +95,8 @@ Deviations related to MISRA C:2012 Rules:
>         the absence of reports that do not have an impact on safety, despite
>         being true positives.
>         Xen expects developers to ensure code remains safe and reliable in builds,
> -       even when debug-only assertions like `ASSERT_UNREACHABLE() are removed.
> +       even when debug-only assertions like `ASSERT_UNREACHABLE()` are removed.
> +     - ECLAIR has been configured to ignore those statements.

... backticks are still kept here (kind of in line with what you say in
4, but still somewhat puzzling). Whereas what you remove ...

> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -119,12 +119,12 @@ maintainers if you want to suggest a change.
>           - Switch with a controlling value statically determined not to
>             match one or more case statements
>           - Functions that are intended to be referenced only from
> -           assembly code (e.g. 'do_trap_fiq')
> +           assembly code (e.g. do_trap_fiq)

... e.g. here are single quotes.

Jan

