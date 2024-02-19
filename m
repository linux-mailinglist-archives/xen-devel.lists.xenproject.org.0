Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F3C85A548
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 15:03:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682880.1062103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4F1-000816-HY; Mon, 19 Feb 2024 14:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682880.1062103; Mon, 19 Feb 2024 14:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4F1-0007zN-Di; Mon, 19 Feb 2024 14:03:31 +0000
Received: by outflank-mailman (input) for mailman id 682880;
 Mon, 19 Feb 2024 14:03:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc4Ez-0007zH-NS
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 14:03:29 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8197e83-cf2f-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 15:03:28 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51294b40a52so2526409e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 06:03:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cf27-20020a056512281b00b00511627e354asm918916lfb.247.2024.02.19.06.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 06:03:27 -0800 (PST)
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
X-Inumbo-ID: a8197e83-cf2f-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708351408; x=1708956208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YQFX/wensL8mgkZH6aTdQKBik1QHwjxBa0z6+1wegc=;
        b=DJB6AyAck7Eagqes2P0Bs5MYSBsTk+3KTkJ37sOK4pIqR4K71gqgFKxtcECPNbtk9f
         FqdxhHINbjDWMCjh286Nhku6eXMWwqqwbpJ1EraroKejD76JSBzerEj3jw3BShNJ8szu
         AqbY7MTrZGEZ2VDRpW3ZkoNKZjw9w8e6z6+n1822KAN7YKOdqQh3/0wFpezGY94nOoPW
         zp7/npauBIs9PiWQCKeYZqqarM1ZJ3sUVGfst8fjJKEVKxjrpl0DhIXMkfqeCXzwVy3C
         gpSW9At++nUjwAlrywWG2MiV8s8clMs+DocW41qlKTu1yIEaqcSZdLyyFm7h/rJWGwGN
         4HSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708351408; x=1708956208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YQFX/wensL8mgkZH6aTdQKBik1QHwjxBa0z6+1wegc=;
        b=AhrgqrRxdjRHfgDZP/dOT1bZ1XneP21g5tA63WNw4zyrAtBSPaG5BTE2jYZrwELsXi
         WoOOoGwMW/nQ/Qh8ccTX918SoPWU0kqvAZrJRl6iUplupNd/u1Xzw3BMgeFSARaUh4WY
         7cJyBxDeIJ4ceiooJy9+KL/qhVeCuxPD2n8NLrRAkiz9X0U1evjXxEvCjD5ffKddvGQe
         LCDBCt6ptKDRtbNH9/YFbYE9CVpa9IwWaD5HH+IODdWKIk1VRMbrScW62vtCbG+JHYwv
         WIFH0nCmrYRYBEBa1bgNu/14NEc5Uqu3xRTIL3IKL/Ecqzk9LKRnxAmVtilB/rvQaSR9
         mq1g==
X-Forwarded-Encrypted: i=1; AJvYcCWMR7VolQw8O9GTB2TxoL4H6P8k/vj5t0qSHslf6flYy3SlWXG9MPUHJshYiRvLY91cC2tQ2i9++kmqhCvwJX7IvIJCtsPSZX3KAdQEG4g=
X-Gm-Message-State: AOJu0YyFQ5pSK/yO5j+HRaQw+t1A7JGEmM1QcJPqVQOc5JiWQEKHhdPm
	MOuVJl9Du8LLcaP7v4rghlYmQEEcQ0/eTf9KcIrxDOUIWQ7JzPpJu9CLHxHFZw==
X-Google-Smtp-Source: AGHT+IGeXJZeH4j1GUgV4gIvY37NH4BKLPw4dZ8g7aGoZsm6zp18qnqol7abtPSdudsNDkB8p1Q9yQ==
X-Received: by 2002:a05:6512:68c:b0:512:bf10:832d with SMTP id t12-20020a056512068c00b00512bf10832dmr51138lfe.17.1708351408209;
        Mon, 19 Feb 2024 06:03:28 -0800 (PST)
Message-ID: <ebc81051-765a-424a-9b30-97d6755e84c3@suse.com>
Date: Mon, 19 Feb 2024 15:03:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] svm: Improve type of cpu_has_svm_feature
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-3-george.dunlap@cloud.com>
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
In-Reply-To: <20240206012051.3564035-3-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2024 02:20, George Dunlap wrote:
> The "effective type" of the cpu_has_svm_feature macro is effectively
> an unsigned log with one bit set (or not); at least one place someone
> felt compelled to do a !! to make sure that they got a boolean out of
> it.
> 
> Ideally the whole of this would be folded into the cpufeature.h
> infrastructure.  But for now, duplicate the more type-safe static
> inlines in that file, and remove the !!.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit preferably with ...

> --- a/xen/arch/x86/include/asm/hvm/svm/svm.h
> +++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
> @@ -38,7 +38,10 @@ extern u32 svm_feature_flags;
>  #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
>  #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
>  
> -#define cpu_has_svm_feature(f) (svm_feature_flags & (1u << (f)))
> +static inline bool cpu_has_svm_feature(unsigned int feat)
> +{
> +    return svm_feature_flags & (1u << (feat));

... the inner pair of parentheses dropped.

Jan

