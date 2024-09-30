Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC8398A3FC
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 15:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807393.1218816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svG84-0004uR-6L; Mon, 30 Sep 2024 13:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807393.1218816; Mon, 30 Sep 2024 13:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svG84-0004sb-31; Mon, 30 Sep 2024 13:07:56 +0000
Received: by outflank-mailman (input) for mailman id 807393;
 Mon, 30 Sep 2024 13:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svG82-0004r4-BU
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 13:07:54 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0095dcde-7f2d-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 15:07:53 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5398e33155fso1959309e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 06:07:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2947296sm524491566b.114.2024.09.30.06.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 06:07:52 -0700 (PDT)
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
X-Inumbo-ID: 0095dcde-7f2d-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727701673; x=1728306473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cO1C0l5lZ3TN1tctLVjVAcWUZL3MKzvQKhTj070Lc80=;
        b=G8iEEc7flc+uvav/xdIdQjNHGaxrmYY38EQf9PwdgFP0aZasfHi94LEMqc4HOjUCoU
         R5MzryOcaToLNcdEQ0Lq6Hm/7VaFmO/CLWX1/v0tkS+B4jeZJCr0y2iCTVpzh5m79tE6
         SW1p6ctq6VH3j8LnbqyvBSOC9xX17lLGotvLyhXxl7QGTtvSDazeyH0eDQp5bR48Zk1p
         2nZp23jIHi+iOcdBaAhc1tHsVmWsy1kavREmzVnaGyerb0U5D03gO0PqUlurMJDyEiJe
         RAnhL90qY2mf8sl2Dq2NUuYcWW1LOY8D5ITpaA9G1T/joucoSiU5iSTnmzT2hOuiek5W
         1otQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727701673; x=1728306473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cO1C0l5lZ3TN1tctLVjVAcWUZL3MKzvQKhTj070Lc80=;
        b=PLL3lh7uYw40ddJSA6S/STrbC73M357cetTYb5TyboC/RcKh0686lbqV3a+zBazjzz
         hzC5Cc4Rd5+sjKXGLCtNoah8nw1HmE9cSHm90UR1MRET3lN02APspJ2IT2OnHg/gtdLL
         5wR56Hs/IDBGA+x6GWMIWI1X7yxuoYgiEAUHuP1VGWZxrSdaO45bq5cV12kZqMM8YSMw
         Ip+sZ84U/NU7u0NtNi13N5MluqDauIeOB0QEIELZjbgv+XsrYwG92scI/+AaTdLEbYa9
         ueFZqMMw0Y61O21BwV3FBnH5kMAhYH9ijqchyi6Sh1y8qahXaKa+PEwiNrxK6Mkoc/Dk
         fkZA==
X-Forwarded-Encrypted: i=1; AJvYcCWHse0LKR8I/6a5zD8IO44IOVm1g3Eu8PzeXDSLXzAgeghUAhvWUQQcr14oNhCanlFeqHrfvWm6D/M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeWR6N8pqSSiWselVIbiJsixBN/1nfn0BCB027iSsQy+q7XSwG
	PUfORSuKaGF8buVX3KWX8v+Orc9/vw3M30wrH6r0boE/p04oxyGQA2HS+Cajbg==
X-Google-Smtp-Source: AGHT+IFsSSmM/H4I8qQuQhzQ7ONX1+J4/g4q4zT2HhKtbvZziPvhXaQ1VPpWwZa0G5iati5+kYMAww==
X-Received: by 2002:ac2:5693:0:b0:539:8cbf:516e with SMTP id 2adb3069b0e04-5398cbf5256mr3719366e87.36.1727701672731;
        Mon, 30 Sep 2024 06:07:52 -0700 (PDT)
Message-ID: <b4fafd2c-d71a-4336-b009-07f3474f5a04@suse.com>
Date: Mon, 30 Sep 2024 15:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/3] EFI: address a violation of MISRA C Rule 13.6
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1727690180.git.federico.serafini@bugseng.com>
 <c447f9faf0283bc6b83bbfbf05acd7acca00762d.1727690180.git.federico.serafini@bugseng.com>
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
In-Reply-To: <c447f9faf0283bc6b83bbfbf05acd7acca00762d.1727690180.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 14:49, Federico Serafini wrote:
> guest_handle_ok()'s expansion contains a sizeof() involving its
> first argument which is guest_handle_cast().
> The expansion of the latter, in turn, contains a variable
> initialization.
> 
> Since MISRA considers the initialization (even of a local variable)
> a side effect, the chain of expansions mentioned above violates
> MISRA C:2012 Rule 13.6 (The operand of the `sizeof' operator shall not
> contain any expression which has potential side effect).

I'm afraid I need to ask for clarification of terminology and alike here.
While the Misra doc has a section on Persistent Side Effects in its
Glossary appendix, what constitutes a side effect from its pov isn't
really spelled out anywhere. Which in turn raises the question whether it
is indeed Misra (and not just Eclair) which deems initialization a side
effect. This is even more so relevant as 13.6 talks of only expressions,
yet initializers fall under declarations (in turn involving an expression
on the rhs of the equal sign).

All the same of course affects patch 2 then, too.

Jan

