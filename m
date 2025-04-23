Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 961E5A97F65
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 08:39:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963961.1354850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7TlJ-0003ik-UR; Wed, 23 Apr 2025 06:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963961.1354850; Wed, 23 Apr 2025 06:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7TlJ-0003fe-RD; Wed, 23 Apr 2025 06:39:13 +0000
Received: by outflank-mailman (input) for mailman id 963961;
 Wed, 23 Apr 2025 06:39:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7TlI-0003fW-75
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 06:39:12 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a94b50a2-200d-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 08:39:09 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso28218805e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 23:39:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4c0fsm17543023f8f.88.2025.04.22.23.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 23:39:08 -0700 (PDT)
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
X-Inumbo-ID: a94b50a2-200d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745390349; x=1745995149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ue+qqTC36a+FROa5W9mhM9YF8TeGG9QVTvtEIt355A=;
        b=Dh0mEnsUYZnIVWfa5X7s5JZaSap6pIazQouuXtPK3IVqv+UCkNE3zMP5pM9ocR2R9P
         mr3F31oZF7itJMgWs9ERPbghdde9+t7ZosAiKDRueVqPJgkPDU9kdr5WV3EeyMvSlQvG
         yM0MDPnbpWeeaNuT/1yY4+0DFPdJ2c3nFu0/ZTpEMOekgD0tZJBvilo9F0iabb1iaSff
         0nRqufnv+f170mog0uhGk8DQLSeexK40e/Pi1P+BtKk8r8v0xhF+wj1I/Y4tR4hxu9C3
         Z/AMybdjq4GlLMwwl7Rs23kLQ556eNh73fH/jdSmD1PR3yWItpmU3l6Z6ObLqkc8zRpw
         7T9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745390349; x=1745995149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ue+qqTC36a+FROa5W9mhM9YF8TeGG9QVTvtEIt355A=;
        b=SkOU95aYEPVc+gej2oTgbbCJPsnQFppggs6sC6ChXiiwSSi0GR5RiYoP31QEI3DCpP
         GyAN5m4wCIk5Tv77OBuodIrixf+/J89JTYpZwzpArjNeOGomjq+QNfzF9nWMmg1H6r5n
         3yHEdjv0vzFc2L4oILWwzYyQ1no9NR4lmAo1m4yLM5CIVQrOPXo8m7nEOE4i1BjzEp+E
         Ayt8mi2Vs6q1ReDM9jvXGQ6AluK0RkwEMOZwFYkXDHTYsPqPScpDk1amYp0djjr8QQ7+
         Urdnn8Wj9QsltPi3mJm8CNsTNvrxYze8KcJvfxxker7XebU5bUlgEDau2a1OXjCLfl4S
         B+Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV55tKv8bfXABYVLqfx0A7fSKuOW0vuvxjRAL0q3atNORgWJccA5W9BWmWPpZqdtF3zt92MH9ahdyg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXf4gZseS9PjibqPSSZSnFyGlqslfpi5rV1BdNm2w5JrdIlwxM
	bNuVitWhxh5hUtrW5yeI88kNOOWEH68MupYcBRG+2YT+Vt2cDcempUNai5UeAA==
X-Gm-Gg: ASbGncvbE9DedVCEpwTsX8oR0JH0KPYKFG3V+LC1D5uRb5Li4AuIiYB9MNX9XFeXqfB
	3Wl01HPsAqsugz437VqVCVIsx8PC5jb9Nn5QJ/5qEJaABJnXRi+c8PMe1FugJszORmQzqskF99T
	n5wrjREkPse3HVnI73sMa3c9B9ZkfcYeRN/Il9G/QhXGlaACO96ZZsJKLyvWy7UD66gOPOiuuTf
	VBkao06GzeRDQVi6WDyRZj0K/skOIuABRXaAmlPm4VlyYfTXaS5g8XZmsTaQA2iOfBR9BKrShPZ
	MNmOv7BiO3waPj8hWgYrBHsrqbmzKyFWwk7q4mZls/nGCo3uYZAWMq+a7S7wANKhOFeh+RhwarV
	Ajf1AH9FfbuQHrJBsnFrjUepCaQ==
X-Google-Smtp-Source: AGHT+IG8IdX1znkNPKccF0nX6NUSo/2PQl7HdEJu/JSTvq2lR6pko2gZPZXTPNWPSyNQ9mMplMln1A==
X-Received: by 2002:a05:600c:3b8b:b0:43d:fa5d:9314 with SMTP id 5b1f17b1804b1-4406ac272d1mr119102515e9.32.1745390349111;
        Tue, 22 Apr 2025 23:39:09 -0700 (PDT)
Message-ID: <20989ef0-a906-4ad2-818b-e52dd49b868d@suse.com>
Date: Wed, 23 Apr 2025 08:39:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] misra: add deviation for rules 21.1 and 21.2
To: victorm.lira@amd.com
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <790f9cae9a75b9f29554943c08abb6537647644e.1745364478.git.victorm.lira@amd.com>
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
In-Reply-To: <790f9cae9a75b9f29554943c08abb6537647644e.1745364478.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2025 01:43, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
> reserved identifier or reserved macro name") and R21.2 ("A reserved
> identifier or reserved macro name shall not be declared") violations
> are not problematic for Xen, as it does not use the C or POSIX
> libraries.

In the course of all the Misra discussions it was pointed out more than
once that it's not just the titles which matter, but also the
"Amplification" text. While the latter two of the three bullet points
applying to both rules clearly are library-centric, the first one isn't.
In that light it's entirely unclear to me how ...

> Xen uses -fno-builtin and -nostdinc to ensure this, but there are still
> __builtin_* functions from the compiler that are available so
> a deviation is formulated for all identifiers not starting with
> "__builtin_".
> 
> The missing text of a deviation for Rule 21.2 is added to
> docs/misra/deviations.rst.
> 
> To avoid regressions, tag both rules as clean and add them to the
> monitored set.

... our code base could be anywhere near clean towards these two rules.

(Unlike I would normally do, I'm leaving the entire patch in context, so
on the list - lacking the submission - it'll be visible in its entirety.)

Jan

> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Roger Pau Monné <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Cc: Federico Serafini <federico.serafini@bugseng.com>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl     |  9 ++++++-
>  .../eclair_analysis/ECLAIR/monitored.ecl      |  2 ++
>  automation/eclair_analysis/ECLAIR/tagging.ecl |  2 ++
>  docs/misra/deviations.rst                     | 26 ++++++++++++++++++-
>  4 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 2c8fb92713..ffa23b53b7 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -639,8 +639,15 @@ in the expansion."
>  # Series 21.
>  #
> 
> +-doc_begin="Xen does not use C and POSIX libraries:
> +identifiers reserved by these libraries can be used safely, except for those
> +beginning with '__builtin_'."
> +-config=MC3A2.R21.1,macros={safe, "!^__builtin_.*$"}
> +-config=MC3A2.R21.2,declarations={safe, "!^__builtin_.*$"}
> +-doc_end
> +
>  -doc_begin="or, and and xor are reserved identifiers because they constitute alternate
> -spellings for the corresponding operators (they are defined as macros by iso646.h).
> +spellings for the corresponding logical operators (as defined in header 'iso646.h').
>  However, Xen doesn't use standard library headers, so there is no risk of overlap."
>  -config=MC3A2.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor|not)$)))"}
>  -doc_end
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index 8351996ec8..da229a0d84 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -79,6 +79,8 @@
>  -enable=MC3A2.R20.12
>  -enable=MC3A2.R20.13
>  -enable=MC3A2.R20.14
> +-enable=MC3A2.R21.1
> +-enable=MC3A2.R21.2
>  -enable=MC3A2.R21.3
>  -enable=MC3A2.R21.4
>  -enable=MC3A2.R21.5
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 1d078d8905..3292bf751e 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -88,6 +88,8 @@ MC3A2.R20.11||
>  MC3A2.R20.12||
>  MC3A2.R20.13||
>  MC3A2.R20.14||
> +MC3A2.R21.1||
> +MC3A2.R21.2||
>  MC3A2.R21.3||
>  MC3A2.R21.4||
>  MC3A2.R21.5||
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index fe0b1e10a2..d116aca7b9 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
>         construct is deviated only in Translation Units that present a violation
>         of the Rule due to uses of this macro.
>       - Tagged as `deliberate` for ECLAIR.
> -
> +
> +   * - R21.1
> +     - Rule 21.1 reports identifiers reserved for the C and POSIX standard
> +       libraries. Xen does not use such libraries and all translation units
> +       are compiled with option `-nostdinc`, therefore there is no reason to
> +       avoid to use `#define` or `#undef` on such identifiers except for those
> +       beginning with `__builtin_` for which compilers may perform (wrong)
> +       optimizations.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R21.2
> +     - Rule 21.2 reports identifiers reserved for the C and POSIX standard
> +       libraries. Xen does not use such libraries and all translation units
> +       are compiled with option `-nostdinc`, therefore there is no reason to
> +       avoid declaring such identifiers except for those beginning with
> +       `__builtin_` for which compilers may perform (wrong) optimizations.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R21.2
> +     - `or`, `and` and `xor` are reserved identifiers because they constitute
> +       alternate spellings for the corresponding logical operators
> +       (as defined in Standard Library header `\<iso646.h\>`). Xen does not use
> +       Standard library headers, so there is no risk of overlap.
> +     - Tagged as `safe` for ECLAIR.
> +
>     * - R21.9
>       - Xen does not use the `bsearch` and `qsort` functions provided by the C
>         Standard Library, but provides in source form its own implementation,
> --
> 2.47.0


