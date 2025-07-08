Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA809AFCC4F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:38:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036546.1408801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8WJ-0007mQ-Up; Tue, 08 Jul 2025 13:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036546.1408801; Tue, 08 Jul 2025 13:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8WJ-0007kL-Rh; Tue, 08 Jul 2025 13:38:03 +0000
Received: by outflank-mailman (input) for mailman id 1036546;
 Tue, 08 Jul 2025 13:38:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ8WI-0007kF-LP
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:38:02 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3f3a5e6-5c00-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 15:38:00 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so2809266f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:38:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce417dd7esm12767524b3a.97.2025.07.08.06.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:37:59 -0700 (PDT)
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
X-Inumbo-ID: c3f3a5e6-5c00-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751981880; x=1752586680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X6s9LgJcSWDgbs4mfcGpdivO0032ln0tcOQEVSslWIQ=;
        b=N/Asgc80GshbzElqgHKv6flA7Q8QOVRQJa9Laxt0MCW8FUxDHm+Xn9A+jpgKr33sTV
         V9Pl3PXbLF71rF8cRENJ6KpoyDM2/9GKU+ugRSTbRIw9n57wXZ9ibRZLImQDThNpsASy
         wz4e/sZO1EfT8jBg1QG3C9aeN8VROfyFWJyyOg9r9z0U/GbBULVrCp6KutBdiFpkYA0k
         UQjeVTZMvvZxeqhAUmjuObaf9v2JenPh7LsPYAIE0v7A7DTpW3Ydo8y3yxGu3ALa1SgD
         N2IYu8CYq88indAKtCSJXw2rX+gVI3WusW8O4ZM0AfLOQnZS8Z5+Rn/jKc3tu1Etd6kF
         XRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751981880; x=1752586680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6s9LgJcSWDgbs4mfcGpdivO0032ln0tcOQEVSslWIQ=;
        b=lAm03+k4y0Bn4Cmf+HuEnMGbCOVWK1oKrPgCwgLvjzkooqPHnBg1+KQJzW3IsPp9t2
         bUmZPKuWy/pZ5V1eWIm0/zQbOEzGLUlX6zj87RSELlL9SoUnrws7ppoOSKiaeqq/bol4
         EXDuLwdGyTz3xnqv+K8jtyik7GOj8a1uJgPawDYmh9SUnId8EEk3Q78ltpAMXtl0ydsL
         IN87fcFzhNPX1AGPMJjKWqTutv+HOIaLyKPhgMoMDaERhT0c2C4RZiPPEbyabIi4V3fr
         S1DkB2mXlPaxQkDEGhtnFIYX5G8qimYn33ZH3/IBhgDXh9IMYuvXNRi5OEtpDClltM8I
         ZUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2LgJqcxxy9cN5Fl3jIQYqOBFjuxBXKJy+xchF/FcHT783ySp3IHHZ5EFCTz2HMastNmduiGIyFVQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUsTrJFoYrUoODqB/hR8kmHpCQx8JFRuwVo9syil4waY8pYSdy
	YIVtteXiH2A+l1rxNpTqEec/XrN2NvMfZFGYg6ItubGGGfmiZsRCTXdoaa9ybpK4iA==
X-Gm-Gg: ASbGncvWIagUoWwv6Kc4p6Bhi8Yul62Msr6eDyT1D5QL2huCGfJzO4ygDV7Kf1nHqQY
	uMpyDR8CteIy0cVGX0g8HASdh9qAzkU8oRbq3nbEIH6XjGd/0pAv5RATObg9Bk4hAdXq5Gc2feA
	A1TTdf0KeK7wW1JmMdmQwNNnjRgghiSKYAmKgH0lJhTbgebk+CtgpK8kZXsGd+KyFaZFF/FHVP4
	659rcfVcPLMoUM+PMe3Ht1mnxnkqUfFJNRUqJ1ImMf7EEl9fdKKBKR5A9afyCIt/kKFDWq4dDOa
	HIrtNVpXjCoG28SxgQUJPmj+xMaPiAa2hfg7exgKAa0dEhpM7LnSiPbREcAPaTw3O2W1VC0SsZi
	mOP49FwZKGL14pqTKC4nQ7/x8ipJEOCqgGYB5F0m37Ou33Qg=
X-Google-Smtp-Source: AGHT+IG8b0PTuhSaesT2IQoXkptjWAisraG2aiuMSB69uCRr+PcSZboxFuZcDMj9JKlxhrW4menGMQ==
X-Received: by 2002:a05:6000:2886:b0:3a5:39be:c926 with SMTP id ffacd0b85a97d-3b5ddeccfebmr2348016f8f.32.1751981879968;
        Tue, 08 Jul 2025 06:37:59 -0700 (PDT)
Message-ID: <925e44c5-95fd-4c7f-a860-ddb5fb6d9371@suse.com>
Date: Tue, 8 Jul 2025 15:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] xen/pmstat: introduce CONFIG_PM_OP
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250707031346.901567-1-Penny.Zheng@amd.com>
 <20250707031346.901567-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20250707031346.901567-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.07.2025 05:13, Penny Zheng wrote:
> We move the following functions into a new file drivers/acpi/pm-op.c, as
> they are all more fitting in performance controling and only called by
> do_pm_op():
>  - get_cpufreq_para()
>  - set_cpufreq_para()
>  - set_cpufreq_gov()
>  - set_cpufreq_cppc()
>  - cpufreq_driver_getavg()
>  - cpufreq_update_turbo()
>  - cpufreq_get_turbo_status()
> We introduce a new Kconfig CONFIG_PM_OP to wrap the new file.
> 
> Also, although the following helpers are only called by do_pm_op(), they have
> dependency on local variable, we wrap them with CONFIG_PM_OP in place:
>  - write_userspace_scaling_setspeed()
>  - write_ondemand_sampling_rate()
>  - write_ondemand_up_threshold()
>  - get_cpufreq_ondemand_para()
>  - cpufreq_driver.update()
>  - get_hwp_para()
> Various style corrections shall be applied at the same time while moving these
> functions, including:
>  - add extra space before and after bracket of if() and switch()
>  - fix indentation
>  - drop all the unnecessary inner figure braces
> 
> We shall also provide "# CONFIG_PM_OP is not set" in preset configs for
> PV shim on x86.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2 -> v3
> - new commit
> ---
> v3 -> v4:
> - rename the file to pm-op.c
> - drop all the unnecessary inner figure braces
> - be consistent with the comment on the #endif
> ---
> v4 -> v5:
> - add blank line before endmenu
> ---
> v5 -> v6:
> - rebase changes from "xen/cpufreq: normalize hwp driver check with hwp_active()"
> and "xen/cpufreq: move "init" flag into common structure"
> - add "# CONFIG_PM_OP is not set" in preset configs for PV shim on x86

Correct here (and in the next patch), but both additions will want undoing then
in the last patch, as their dependency on SYSCTL thus covers what we want.

Jan

