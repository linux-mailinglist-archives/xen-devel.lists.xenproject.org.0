Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECE19F5149
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:40:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859510.1271660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNacR-0007Vk-1q; Tue, 17 Dec 2024 16:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859510.1271660; Tue, 17 Dec 2024 16:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNacQ-0007TL-VX; Tue, 17 Dec 2024 16:40:22 +0000
Received: by outflank-mailman (input) for mailman id 859510;
 Tue, 17 Dec 2024 16:40:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNacP-0007Se-As
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:40:21 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a03d5fc-bc95-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 17:40:19 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43635796b48so22655155e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:40:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8016bdfsm11689929f8f.43.2024.12.17.08.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 08:40:18 -0800 (PST)
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
X-Inumbo-ID: 9a03d5fc-bc95-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734453619; x=1735058419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8b9qkerj1ruIrch9AF9tYMgh/cecoysqsxMEc+2yDlI=;
        b=VPTQU0Uwbe3uQffJVH9SwjI9h2RudUiV+6KIIquw2NS1+Q0qQUrjPUV4M0UXczts4t
         Eqd/+eNkrfBwGslDmZHqXu48ckZIfouKtUeO7355MPD3LIamv5dbPZg0aEIBzKwi2skd
         V2fYlJvqv65UMiz7ZUYmY73EIbQCIZk78OVxpoEMOC8wDjmzFStGxIIw379i7+aV7OIz
         2zMCdu9AO0gcFS0xZSDwt88pWesb76iqAuuYLO0XSVYGL5bbbFTVflNgsIvyenurANoh
         dZCuMECrqiubX4Fcy30/ol+9TujeYFBjVSIBck4FUjW328xdC5Qv/oxlm+w4H6mlKMHc
         ZF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453619; x=1735058419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8b9qkerj1ruIrch9AF9tYMgh/cecoysqsxMEc+2yDlI=;
        b=Qn2Xk3TbqOwF3v3T3ZmRDSflV8ejsAPkJcoOEToRjqc5fxX6bPyYIRlqANEP5nJ9uM
         ijyt8QxHpjV0TagyPGi3m5amICNoXXMs7vNkAjsC0A2aUeHPAvyqyCjRtLPSTNk0LR+5
         5EAhqRp98gLZHPNDd4DAkskxJEaYOg/OTWGWJKyasBVbFqI+UTJKya9EK0m5dlNQE0+u
         /3c3Srs2sEZCG6CLoZovTbhFK+vTA8Fpaz87hwcbPxsvrIsPPt13T5tBq6LPB0Gs/p3J
         QS1oha2lJNPJmf9j8OANICuIRE80uJPQwb7O8IBIHRcu/+w6QnxLfW9lVZM6Ljr6FEXK
         8e/A==
X-Forwarded-Encrypted: i=1; AJvYcCWChZ3WaoOcm9vmOU+sV5sjg6V0JMNEKSKpylDh69daViOHQUoyCf3zeTJA2hWb62p/L6kCQ2GezRk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4BdRtA0iMarR/mcGNYsTy6C0j6VsvOKcVmeWVaYy6wKAtYeU8
	9WEuro/b1XuB4x1F7rStoblFqd6+5vDN9B4RstTYN6HTKKzInJYiHxHt8IZ8qw==
X-Gm-Gg: ASbGncvYsDqy4DoFA7eDCjyCitqHtDrquRqGsS0EmzxsjUzZr37UBrsUu8cOrz5jS7e
	3DiSpX2qeiuTN3+MRoEOykGtJ1amg4SXmekuROUKvkG7GhcxeDJt+vV5Dfmg+4xbbenq+Fm7Mqc
	1Rlse1kSq4htMfPtP2ZKic1b723qn0bJ2bkKdMV8QU6r4uAkaM4yyKE7076PfB7pGO9R5tOLT2g
	215rmdygAYVeRjrEQEZzWZCp6xMo2VH7mSTE8YJE3gyrFokrtGQiLjfTblMXqKxbooYLwzZ2x6N
	EHJf3+eODV8D7hopJnC8+1l/UxhOYOVDG2KZ7q05LQ==
X-Google-Smtp-Source: AGHT+IG6xgQgchLIoHEjDkZOrA4F/KplqVc9HWUxW9SVttr2AS0xNKXke0Gzhmmwf+RfTxUukG65Ew==
X-Received: by 2002:a05:600c:3c82:b0:42c:b8c9:16c8 with SMTP id 5b1f17b1804b1-4364817be68mr34382485e9.10.1734453618795;
        Tue, 17 Dec 2024 08:40:18 -0800 (PST)
Message-ID: <c45597af-ce69-41b5-bc73-bd32f2378b76@suse.com>
Date: Tue, 17 Dec 2024 17:40:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] eclair-analysis: Add usage of varargs extension for
 C99
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Andrew Cooper3 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <bb0e1f3d0d4067b597c7cdae5ed9fc3e059d17ae.1734452569.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <bb0e1f3d0d4067b597c7cdae5ed9fc3e059d17ae.1734452569.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 17:24, Nicola Vetrini wrote:
> This extension name is missing from the current list of extension used
> by Xen, therefore is must be added to that configuration in order to
> avoid violations for MISRA C Rule 1.1.

Which extension are we talking about here? I'm afraid ...

> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> @@ -100,8 +100,8 @@
>      ext_enum_value_not_int: non-documented GCC extension.
>      ext_gnu_array_range: see Section \"6.29 Designated Initializers\" of "GCC_MANUAL".
>  "
> --config=STD.diag,behavior+={c99,GCC_ARM64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_forward_ref_enum_def|ext_gnu_array_range)$"}
> --config=STD.diag,behavior+={c99,GCC_X86_64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_flexible_array_in_struct|ext_flexible_array_in_array|ext_enum_value_not_int|ext_gnu_array_range)$"}
> +-config=STD.diag,behavior+={c99,GCC_ARM64,"^(ext_paste_comma|ext_c_missing_varargs_arg|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_forward_ref_enum_def|ext_gnu_array_range)$"}
> +-config=STD.diag,behavior+={c99,GCC_X86_64,"^(ext_paste_comma|ext_c_missing_varargs_arg|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_flexible_array_in_struct|ext_flexible_array_in_array|ext_enum_value_not_int|ext_gnu_array_range)$"}
>  -doc_end

... ext_c_missing_varargs_arg doesn't tell me anything. Without this it's
hard to tell whether C-language-toolchain.rst might also need an edit; a
search for "varargs" in the file yields no hit.

Jan

