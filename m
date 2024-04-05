Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3358995BC
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 08:45:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701105.1095239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsdKU-00057x-VR; Fri, 05 Apr 2024 06:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701105.1095239; Fri, 05 Apr 2024 06:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsdKU-00055x-St; Fri, 05 Apr 2024 06:45:38 +0000
Received: by outflank-mailman (input) for mailman id 701105;
 Fri, 05 Apr 2024 06:45:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsdKT-000548-3q
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 06:45:37 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a021b06-f318-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 08:45:33 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d109e82bd0so19915221fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 23:45:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b004156afd6843sm5241026wmq.18.2024.04.04.23.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 23:45:32 -0700 (PDT)
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
X-Inumbo-ID: 1a021b06-f318-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712299533; x=1712904333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mifMJkOKA+Zxcqxx7QG1cYUwwuSMuLBuFvY5KWWUbaM=;
        b=QUIwFOgK/4v07Fzd3NcgnDksesnxoV3kYLEiyunsOwWAqGN/Ax6iBFYwENmk4wXBKF
         rW/obF1s/PRIe8oJSrJ5IT8Xo6KsD/CxVDpBSj4jMozwfBM8TDNXXjk6YOtW5CLJap0M
         RHbR5UFE/QOwkx13jBszAQlDNc14b5t/yRRjevDMjNuyx9fWJC1Qt9cWmRl+/MfszIIb
         C4GK4LNq2ZL9MxuBRYilyFRUo5OSnMUcDJdO5foA8ckL1gpiHNbFNTbqDlgTq6dCcytU
         yraiqd/cbN0TLYc7JMnHXtCaqRVKOpMTVq3PxaJTtlx5HF62mxhabkIJG35jfCNSPXge
         03jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712299533; x=1712904333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mifMJkOKA+Zxcqxx7QG1cYUwwuSMuLBuFvY5KWWUbaM=;
        b=gi07Ujq3D3k2C7jNC7X7KlqxJM/PvKe1/i5WXU9CufFPRUCMtdPaivxUb+j3c6UXFp
         v6AWHvcsl9Bm/Y+YfRKSJsWo1ZvfqA/eMEZSnz1HvwIhXWlqTdvxQtKnvB1hXdqwMte+
         sE2YPCXwOHRAbeLf6D2SJF/A9+baGSe/EpCA91Tb0da6KOJG/Kbk0bhSFtnTeB0Fi5Pq
         oiZXs4bKdOtMDDSOpZ+59+QeTlFPIfDOP40tYAUaIYTatoXJv5M4QH7aA9a610PoZPwn
         jPF02vjh9J7qfmaC7L/T77r38BW2Xn2mv4FbtegoUNPTAhRFFbzzSdXeo77BRZ9sfg4Z
         7xiw==
X-Gm-Message-State: AOJu0YxZBiLufs0n2DwKuaIvQroNxREqPGpl2H4QgtEcZPXd5JoRgjV3
	nbuRKBthH19YN2uvGN6VXEWJUKrLYhNF6fafpjXoa1IGh55Cz+XCnFWnxIjtXQ==
X-Google-Smtp-Source: AGHT+IFH99UdJnYbObQMnzMM3JckK/LuOVKzdsGS+bSCvw7NJ1L+tyaKp7/h4ayReUNsOXLUPvJCXA==
X-Received: by 2002:a2e:240e:0:b0:2d8:3eaf:86d2 with SMTP id k14-20020a2e240e000000b002d83eaf86d2mr392543ljk.47.1712299533168;
        Thu, 04 Apr 2024 23:45:33 -0700 (PDT)
Message-ID: <dbcfdf24-1d6c-4a2e-a8d5-e3d19a700e08@suse.com>
Date: Fri, 5 Apr 2024 08:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 2/2] MISRA C Rule 20.7 states: "The features of
 `<stdarg.h>' shall not be used"
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>
References: <cover.1711621080.git.simone.ballarin@bugseng.com>
 <97008d1b28eb922b3c0041830b09e827396aa0ec.1711621080.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2404041725580.2245130@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404041725580.2245130@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 02:27, Stefano Stabellini wrote:
> On Thu, 28 Mar 2024, Simone Ballarin wrote:
>> The Xen community wants to avoid using variadic functions except for
>> specific circumstances where it feels appropriate by strict code review.
>>
>> Functions hypercall_create_continuation and hypercall_xlat_continuation
>> are internal helper functions made to break long running hypercalls into
>> multiple calls. They take a variable number of arguments depending on the
>> original hypercall they are trying to continue.
>>
>> Add SAF deviations for the aforementioned functions.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I fixed the title on commit

Did you forget to push then? I don't see this change in the tree, yet.

Jan

