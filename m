Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5698AB16C67
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 09:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064900.1430201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNOR-00017B-Qi; Thu, 31 Jul 2025 07:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064900.1430201; Thu, 31 Jul 2025 07:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNOR-00014q-MV; Thu, 31 Jul 2025 07:07:59 +0000
Received: by outflank-mailman (input) for mailman id 1064900;
 Thu, 31 Jul 2025 07:07:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhNOP-00014k-VD
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 07:07:57 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14801a61-6ddd-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 09:07:55 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b7961cf660so431719f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 00:07:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899b4adsm9419765ad.132.2025.07.31.00.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 00:07:53 -0700 (PDT)
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
X-Inumbo-ID: 14801a61-6ddd-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753945674; x=1754550474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VZNAkw1VZgKMkAH1h1X4xE+cGQRnhvXPcGQ4bZdquhQ=;
        b=akmNex84yQS1HvD07pPd8Lm7+a+W3tQsn6c98iX2+VmkU9u5ipHEAU+8/jtV+jomvA
         u+a1DDWZ9ot7MXddFGhE6VR7egRMNFKMoDv1bKKrf85R6etvBpG/9uyXezLeRazEKgMJ
         i5DHoRuZUVTPvexrCWcZpOE/Dk/cKSSlXj303CWr+xEpDR9KR/wxOgbrYhvEtbfo9eGY
         TAVaRX7mUH6MwPjFsIQHJ0hH8Nnb6L2ggyThhoTVzH5eK3YHX032RlWydl0xwmW3vknA
         g0ZwebpNdyh/n8PccwqyuqKS1VeQ5gDB+FaPxFCL+qk/sA2komWMJwErDWyxLEUIeCI1
         EeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753945674; x=1754550474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZNAkw1VZgKMkAH1h1X4xE+cGQRnhvXPcGQ4bZdquhQ=;
        b=e5khlU2jLFWT+AO7av1Zzhlzsr2B+qZfpCBAD9S7o4kbK/2qpFJ3mKHcHVaccze/XB
         NcuhskvulIKRTqvcj9mv2xYYHxJYjOBaEdPaa9IUUXKKAy17S5oFCmE1Uljta6Avah5n
         Ss3cigj73hLbN8wB8fuYWNm9s1xNYkraOrLB6Ov7RY+4q7ZKN65mmeLDJSIJoYbqEvwZ
         DL6tT6pZMj6atUfuclii2u7vYss+ftdfIAVCgArPPfprng1R7sFw+dce+tFRVN56JHPW
         WnCC19q9CNnoQ7Tb50u6a0jok7JxwtbAZw0f1rSzE9/Up+h/wrXvzbwCcnZJWydXFKE5
         AAWA==
X-Forwarded-Encrypted: i=1; AJvYcCW7C7dOFHEM1F9SzidofTNiolbQ746UF1r3+giAkwuuB+YzFr8K/drJyR1MQvv+J4ksFSBRQcixjbg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMYsbluYsaRYsnKY4A32U7yYu8vIODtQfCI0AfR0Ca4iPRHsLL
	U6OrVqfVTBx2c7diBdti+rxlDaVP2FOCkenj1HhLM2gMmm9gW9s4D1NJBPmws9ocnQ==
X-Gm-Gg: ASbGncvKxzSF604xzaXwG1EFXtCkejgsHcyI7S6QspZGUukFVesB4/Q+3gjDGd4D51k
	bCXHZSwe7hWzrhPo23Pw4ciRW4TR/B7L5GylaMeTGZ67ZMmcJctEyG0VQ12IY6QrPFU3KJ1OQ55
	t7/Mf1hbK/Ibbsuy6HIrO1Q2r7zX8HDZskdtglzSj6pbtXuCNTxpZ6YZIuJl/GJkDNtpelKL6TK
	9j2j+iwx+CV44lKLE4nJEjFeo9pw3fV3OkGTJJJsjGl7IXoqf0O/QE/M63pz85EYQNiWshnXNgi
	XRs3ul55G80W4FMJyuygoaO+/e9yeen1eW9A4+RKzYmGhOrEfkuHzgVvC9a13qEej5FcJ4CGnMK
	1Jr9BxPOimYeE+XYWwdk0tHzEYn4T4PO8pRFWilbr84i/subL+LxI7e6CYDUPFkt+14YcRtQdxC
	GHMJ15atA=
X-Google-Smtp-Source: AGHT+IEqMn8BRtTA/rtSDGr7Xw0oOmej1OlVTOMf944VH0BTlaXEd5cCclmqMLIjwoaF5ZLAnB+YsQ==
X-Received: by 2002:a05:6000:2288:b0:3b7:9dc1:74a5 with SMTP id ffacd0b85a97d-3b79dc176aamr748639f8f.52.1753945674201;
        Thu, 31 Jul 2025 00:07:54 -0700 (PDT)
Message-ID: <2da75706-9d76-4d89-9282-977bfd5d2a9c@suse.com>
Date: Thu, 31 Jul 2025 09:07:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] automation/eclair: deviate intentionally unreachable
 code
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6e47d071ffdb236642c1e9a70118a86d41487aa0.1753909082.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <6e47d071ffdb236642c1e9a70118a86d41487aa0.1753909082.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2025 23:01, Dmytro Prokopchuk1 wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
> Functions that are non-returning and are not explicitly annotated with
> the `noreturn' attribute are considered a violation of this rule.
> 
> In certain cases, some functions might be non-returning in specific build
> configurations (when assertions are enabled, i.e., when `NDEBUG' is not defined).
> This is due to calls to `__builtin_unreachable()' in the expansion of the
> macro `ASSERT_UNREACHABLE()'.
> 
> Conversely, in builds where `NDEBUG' is defined (assertions are disabled),
> the macro `ASSERT_UNREACHABLE()' expands to an empty construct
> (`do { } while (0)'), which does not affect the execution flow.
> This allows such functions to return normally in such builds,
> avoiding unreachable code.
> 
> To account for that in specific builds, the `noreturn` property of
> `__builtin_unreachable()` is overridden in the ECLAIR configuration
> to deviate these violations.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Wording-wise I'm okay now (one further nit below), but I don't feel
capable of ack-ing. I'd like to remind you though that commit messages
want to be limited to 75(?) chars per line, so "git log" output wouldn't
go beyond 80 chars.

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -86,6 +86,18 @@ Deviations related to MISRA C:2012 Rules:
>         generate definitions for asm modules.
>       - Tagged as `deliberate` for ECLAIR.
>  
> +   * - R2.1
> +     - Calls to the `__builtin_unreachable()` function inside the expansion of
> +       the `ASSERT_UNREACHABLE()` macro may cause a function to be marked as
> +       non-returning. This behavior occurs only in configurations where
> +       assertions are enabled. To address this, the `noreturn` property
> +       for `__builtin_unreachable()` is overridden in these contexts,
> +       resulting in the absence of reports that do not have an impact on
> +       safety, despite being true positives.
> +       Xen expects developers to ensure code remains safe and reliable in
> +       builds, even when debug-only assertions like `ASSERT_UNREACHABLE()
> +       are removed.

Formatting nit: I think it would be nice if lines were wrapped consistently,
such that available space is actually properly used. (Right here this means
the "for" on the 5th line could move up, which likely would call for further
re-wrapping of subsequent text. The "are" on the last line apparently also
would still fit on the earlier line.)

> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -124,6 +124,15 @@ maintainers if you want to suggest a change.
>             they are used to generate definitions for asm modules
>           - Declarations without initializer are safe, as they are not
>             executed
> +         - Functions that are noreturn due to calls to `ASSERT_UNREACHABLE()`
> +           macro in debug build configurations are not deemed as violations::

I'm not a native speaker, but "deemed as" feels wrong to me; I would expect
the "as" wants simply dropping (or replacing by "to be").

Adjustments could likely be done while committing, assuming the necessary
ack appears.

Jan

