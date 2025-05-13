Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE89AB590D
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 17:48:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983079.1369437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uErrz-0005ZN-A7; Tue, 13 May 2025 15:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983079.1369437; Tue, 13 May 2025 15:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uErrz-0005Wg-76; Tue, 13 May 2025 15:48:39 +0000
Received: by outflank-mailman (input) for mailman id 983079;
 Tue, 13 May 2025 15:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uErrx-0005Wa-Pw
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 15:48:37 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bafbeb3b-3011-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 17:48:35 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5fbeadf2275so10086361a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 08:48:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad4d5ea7689sm158996366b.135.2025.05.13.08.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 08:48:35 -0700 (PDT)
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
X-Inumbo-ID: bafbeb3b-3011-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747151315; x=1747756115; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yY6cvG7meK4Ko8EN8Av8RTqs+rI7iIF9429FCUD1FCM=;
        b=eMZyMkTP+ZB2MMOktCWJolSkHDl8ak6dYi6jwUFOhHoccnDpxeyB8FryWNCEdtvPUw
         Lgc7VvsG8gF7a2AzSfSJ5rqt1EN78rZNkIXruHAYAPH+pXAg2pbeYr/DCF9822NJ2/iL
         WNUXgFpokFIoPOX5FiXJV8BM2yKx5F0jJWftEBcw3Gy8YvbLbCntEDqFQUl0e/FzP+Vm
         aKO4LFe1af1d57bqsjml9FoXKlO0Sd3i5fOlsLL9t8WhBCGr4AI1VqPOFPZXssiE1joa
         BbgIFUozL2RTtEawhKFcHMjH0UKQNlovFow1ekRTyRi95TABQZdvmdJpdu0pPxBHSc9E
         O0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151315; x=1747756115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yY6cvG7meK4Ko8EN8Av8RTqs+rI7iIF9429FCUD1FCM=;
        b=DFVh6vNoB8jb1spjuvWS3a9b/eaTF4hiG2n50XC/vrxMrQABySD9hN1RBVUmgInxTa
         9i7NbvGgLHScMTyMau2HqAo6MGtMLLmjrxvYSsyv5nSYX3KyYL8VQQM/6/2p7GYS7eh1
         c2Y3UsX6pHF8rof/uPYjaZ2ystwYAz/PufySWlq4ZDoqZpq+4odmK5XuYAnn/T+jkKZo
         TpydB3nxv4jnIZbrTy8s44ZonAEL1ZE9lVvPQ99WEH0jWypGDSJ2ywMCU9qySKNP1AKr
         2PYCMJgLFOf2lpriYmDh7SYyEIdcANuLV+EktJXlfNoS7XSAHaUWuVsaIUta7l6B2T80
         sbRA==
X-Forwarded-Encrypted: i=1; AJvYcCUoutVo7GZC0gQAhZMO9cnrpItGi/UNeR1Q612fuOKBexMKiqKVZwn9hOpWjFFebaG2vgR3CivpyhM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyH+5Yp+rItArb+Cu6yyqQuIlmMx3Wbr8dTDfQJTRUwyzmqCBmy
	L7mz8g64UyGxO7HeCQrI3ZvQHVAhfKvwOqenAw+nxxY70aTp+8ePADxJt3tZCQ==
X-Gm-Gg: ASbGncuWa9PjHAYJynwmkHptS86cYtbWEl3T2G+Z9ObKYiFYKFYdz/BYQPfPAypKvNT
	AOvp0Q7UKNErhjckN+RiF650aUfnKPEwsnIYr1DB6e5Dsjhuwi/8gVZY4FW/GOCI+PFx56TNkyq
	jKCnvWx7QPuWHEQpmS20pcSTECXuMSYK8pskFyT6ZBZWGF5fWMCyPHfkK2Cgj9zi4MtzMuOSsYY
	UEqLIwEZo8jzciN47lNdO5xoNurXRDzToWWzAwqJmbf7p5KkbgB94opdS7YiT73MlKDgNej+Nwx
	u4F8X+QFe977M7GASpuR6TFXnR11pynzVwBhEwDktbzipluL5jilYJL+8iU+JvDYBUg92FU1Fjz
	O0k3QC7rGW9HYw1+yu3xZlzjwsaRe0rqM7JL/
X-Google-Smtp-Source: AGHT+IGz7r+fZ1F+13teVQErU9GMk0fNVa+608FrDSxZsL8Tmpc2FsHGab+u5HRuAwrpPjjWrZUQgg==
X-Received: by 2002:a17:907:cf8e:b0:ad2:1cba:cf85 with SMTP id a640c23a62f3a-ad4f74c7dfemr3504266b.39.1747151315359;
        Tue, 13 May 2025 08:48:35 -0700 (PDT)
Message-ID: <3e849625-582a-4e5e-b2c2-b3eb16aae857@suse.com>
Date: Tue, 13 May 2025 17:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] xen/riscv: introduce smp_prepare_boot_cpu()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <704550ffbb34c94bfe85be928b2fcc0105552e82.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <704550ffbb34c94bfe85be928b2fcc0105552e82.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> @@ -72,6 +72,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      remove_identity_mapping();
>  
> +    smp_prepare_boot_cpu();
> +
>      set_processor_id(0);
>  
>      set_cpuid_to_hartid(0, bootcpu_id);

Is this a good placement? I'd think that smp_prepare_boot_cpu() ought to be
permitted to rely on set_processor_id() already having run, for example (even
if right now there's no such dependency). Alternatively the set_processor_id()
call may want to move into the new function?

Jan

