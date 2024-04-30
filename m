Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5321B8B7B3F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 17:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714992.1116417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1pAV-0001Wg-Gu; Tue, 30 Apr 2024 15:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714992.1116417; Tue, 30 Apr 2024 15:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1pAV-0001VW-Du; Tue, 30 Apr 2024 15:13:19 +0000
Received: by outflank-mailman (input) for mailman id 714992;
 Tue, 30 Apr 2024 15:13:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1pAU-0001VQ-3w
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 15:13:18 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bcf7fac-0704-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 17:13:16 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-34cfd924eaeso1879690f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 08:13:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x8-20020a5d60c8000000b0034cf39c64bdsm6285560wrt.101.2024.04.30.08.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 08:13:15 -0700 (PDT)
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
X-Inumbo-ID: 2bcf7fac-0704-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714489996; x=1715094796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DOlT19xzYnJeZPIgV2cSkXCzh4jtHRkILZVl1/4cVmA=;
        b=OPT7ZfphdP9LUjb96otPY0PCbzh9oBVjEysRZZqWXdRbZAIgTNlZQSGFCEfs4OBloM
         8JCKxHwd4dqRtkxWJm3jQl0h6RD8h8YoV/SdAnKY/32/USF3KKIT+7fMWIQ5guxh8MVf
         b8U8D2rclPlbcCutYosfI4OIo8GKOf8dwiSHde38dPZc6+1GGBtn95qQQiblaUoqENk8
         2dN3zQ3q0EuwajTZnd01MOJxQbCEyHV17fie30QNmVJOG/mcL2m3lJp32fSHy2f5mhIk
         refVzv7pY42kVZ4bgAx8mSdZiYa9gejeWmy5swgOeiPQtfhnj12aZ/Ug2/31uchTJWHX
         EHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714489996; x=1715094796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOlT19xzYnJeZPIgV2cSkXCzh4jtHRkILZVl1/4cVmA=;
        b=eRo2aItcgRvnNCixp5B/J+i4PabB4rHZxORCIbXOarr9DLETvkRiobwE9V4XxUamWq
         6wElEBR2LGzRr5cje68Z6INB09b2udWB8A6xmIY08ltuZ/VeNAQ2e+ARx+2iwfAN3mqY
         /wq2Qbvho9u0368vI7oJULthiiwl5xRD/KfWUhE7rOUSbFThdm4z2HYAwojHgZp9Uj5+
         Vsd2pxYzYXtdKrHaKIlzkx61DM2rrd7a5NhsI6plDS9QKmjKVc4P05mwcdvrHN7Uoy83
         97VsKnHhCBUilhyWBv+D9ah/S8x8DZN5AbwhpdfbdEVOnNxjdP9mU7L/jp0RkGfC/WLg
         nIHg==
X-Forwarded-Encrypted: i=1; AJvYcCXyMRaX9aeCksHFwZ1G1p+G9HJ5pCPmjuqmWAEMb0UJb//l23PmiX6R1k6jlwZ6eEbfLrMVhJ/DIfFvBk3aeyEl2MZam9rIbwJyPvpojZc=
X-Gm-Message-State: AOJu0YxmtEBWQcI28IL6Yy5hBGbtxnPLWqepi3Iw2Coklf8UHBs2Npu7
	RIohakfW5TR3qWEDl43+v+ETll5SlaTKDx653TAaGuyWq2jwo0PUK5vDYXPhMg==
X-Google-Smtp-Source: AGHT+IGJ6lIoHgMVK97SfRdKAmBz0a6RloHl8WtTjBqk7UJ4rqFp4k6sQ7lSBrABIgsor8f9kNbwBA==
X-Received: by 2002:a5d:448b:0:b0:34d:939e:2fef with SMTP id j11-20020a5d448b000000b0034d939e2fefmr1219039wrq.36.1714489996343;
        Tue, 30 Apr 2024 08:13:16 -0700 (PDT)
Message-ID: <a3912e5a-1d97-4df6-8718-0bfdb1189f23@suse.com>
Date: Tue, 30 Apr 2024 17:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] xen/unaligned: address violation of MISRA C
 Rule 20.7
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Anthony PERARD <anthony@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1714487169.git.nicola.vetrini@bugseng.com>
 <ec56516020d15cf20419b8bdf6f01fc365c52126.1714487169.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <ec56516020d15cf20419b8bdf6f01fc365c52126.1714487169.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 16:28, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Somewhat surprisingly, the change in the tools directory is also needed, otherwise
> some CI build jobs fail (see e.g. [1]). This is not undefined behaviour
> as long as the two definitions are kept in sync, following section
> 6.10.3p2 of the C99 standard, but having the definition in common-macros.h
> is still a potential problem.
> 
> [1] https://gitlab.com/xen-project/people/bugseng/xen/-/jobs/6742878558

This is pretty absurd, and the use of the Xen header in
xg_dom_decompress_unsafe_zstd.c should probably have gone away with the
introduction of the unaligned macros into ...

> --- a/tools/include/xen-tools/common-macros.h
> +++ b/tools/include/xen-tools/common-macros.h
> @@ -102,7 +102,7 @@
>  
>  #define put_unaligned_t(type, val, ptr) do {                        \
>      struct { type x; } __packed *ptr_ = (typeof(ptr_))(ptr);        \
> -    ptr_->x = val;                                                  \
> +    ptr_->x = (val);                                                \
>  } while (0)
>  
>  #define get_unaligned(ptr)      get_unaligned_t(typeof(*(ptr)), ptr)

... here. We simply cannot assume the two definitions can indefinitely
be kept in sync.

> --- a/xen/include/xen/unaligned.h
> +++ b/xen/include/xen/unaligned.h
> @@ -19,7 +19,7 @@
>  
>  #define put_unaligned_t(type, val, ptr) do {				\
>  	struct { type x; } __packed *ptr_ = (typeof(ptr_))(ptr);	\
> -	ptr_->x = val;							\
> +	ptr_->x = (val);							\

Nit: One of the padding tabs then wants dropping.

Jan

