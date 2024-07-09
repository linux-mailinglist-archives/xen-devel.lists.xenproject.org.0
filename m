Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF0792BF4F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 18:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756419.1165033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRDS3-0001cX-Dy; Tue, 09 Jul 2024 16:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756419.1165033; Tue, 09 Jul 2024 16:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRDS3-0001ZN-BM; Tue, 09 Jul 2024 16:12:23 +0000
Received: by outflank-mailman (input) for mailman id 756419;
 Tue, 09 Jul 2024 16:12:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRDS1-0001ZH-Qg
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 16:12:21 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04ef18e1-3e0e-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 18:12:20 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3678aa359b7so4014179f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 09:12:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a2cf96sm17908675ad.99.2024.07.09.09.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 09:12:19 -0700 (PDT)
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
X-Inumbo-ID: 04ef18e1-3e0e-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720541540; x=1721146340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Od6PZ2Wqs2TFBo9TURKmZCrDDK6jmSZVlmaEiADNI4c=;
        b=RmglPLD+3FlzvJsrjbMnjPv33gNolmITl44kFjZZ7HXI0hHv7k2JkTN8di3K0SYwQm
         UXzfN/3NyDsT+AOW27T8jzYjomBKgmbHHUY+Wovyt6OTCJgug2u9jPwrjXHgVjGyvcln
         8ZzuAX+T/zxkLEPSQnqwM9s12JnXJBRBsEeLMmcSOaVQKcofGCWpKVssc9I5cKhK3xAW
         OPcmmLD0vxPV5P4EF5mpomIhx1qWa9W9vDDrdPAhjZ4AmI1PY3qsZMNxtz/Ip1TychTt
         N36W8j4W9wSYF7pJBQBPJACFCVkZTYmGdn8jymCafblnj2NmK8LKKjRM6ygw9Dzf/4tm
         nBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720541540; x=1721146340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Od6PZ2Wqs2TFBo9TURKmZCrDDK6jmSZVlmaEiADNI4c=;
        b=Q+MCXNIJ2YAcJ1ZVzRdXDlMg0fHTEbCTtkd9I084ia25KL5SAlbbhlr4NoXLsiXB8i
         RzBWRqphxdl6c7+lf4zivvkmmSmg3SgRE9wDFkGLtado0rIHxRvQ/MHilejDO9ML0VLR
         t4i6F8wDCzfeTuvLtp3iFQVgwrpZitU0R52gocYqsHP2O8kfYNHrbNuR9SDe7eCiGz7c
         MDqtKxJWCrwzEuEDSd2GnRf44uH7Dwip7xlj88+fVLP8HELZkqecFQGv+fKcOJx1Dql4
         QpCElpf7KhqQ+VSfeWk3qP1fUx/HLDcEpGdKPYcp2lthtEbAU5A1putHO7UsVi7llVZr
         4GQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlcnWuLR0fgpPmqcbykX0E0CQnMd038vHJnbpHVLu8dhK11GbSVu8LD76AlmJoz0M8hF2/RTfbDMJkutjJMtTllf8nVVrUvVHpcfmLdQs=
X-Gm-Message-State: AOJu0YxzwcqmprAinTzSzzdL18Ruui3DTWKcTM6ny6ird/WOiak9ZJf6
	GcdDE7m+gs8Ve5MkfhS7ZD/eX4zyrm7ZUybT05go/2MBnmM0FaUNXj/IlD4Szg==
X-Google-Smtp-Source: AGHT+IEcp88BTCThgCp0mGxZ+rxHPJ5UxeT4BRun+5by0SsOcKXyzDOwB2ck8rBPBQmmxYX+j3Di9Q==
X-Received: by 2002:a05:6000:1547:b0:360:7856:fa62 with SMTP id ffacd0b85a97d-367d2b52f28mr2793787f8f.15.1720541540202;
        Tue, 09 Jul 2024 09:12:20 -0700 (PDT)
Message-ID: <3c8398d3-7317-46e6-9fb6-ab1dde188caf@suse.com>
Date: Tue, 9 Jul 2024 18:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Add libfuzzer target to
 fuzz/x86_instruction_emulator
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
 <CABfawhmkNrMR5opsFZpyEXDaiLMyo8a5bepXL6A+MGnbwBFvAA@mail.gmail.com>
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
In-Reply-To: <CABfawhmkNrMR5opsFZpyEXDaiLMyo8a5bepXL6A+MGnbwBFvAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.07.2024 17:37, Tamas K Lengyel wrote:
> On Tue, Jun 25, 2024 at 6:47 PM Tamas K Lengyel <tamas@tklengyel.com> wrote:
>>
>> This target enables integration into oss-fuzz. Changing invalid input return
>> to -1 as values other then 0/-1 are reserved by libfuzzer. Also adding the
>> missing __wrap_vsnprintf wrapper which is required for successful oss-fuzz
>> build.
>>
>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> 
> Patch ping.

It's on my list of things to look at, yet even if fully ack-ed it couldn't
go in right now anyway.

Jan

