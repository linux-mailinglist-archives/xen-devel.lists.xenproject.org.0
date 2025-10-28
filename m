Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A916C13C59
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 10:23:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152008.1482549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDfuk-0004V9-T8; Tue, 28 Oct 2025 09:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152008.1482549; Tue, 28 Oct 2025 09:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDfuk-0004Sl-Pv; Tue, 28 Oct 2025 09:22:50 +0000
Received: by outflank-mailman (input) for mailman id 1152008;
 Tue, 28 Oct 2025 09:22:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDfui-0004Sf-MA
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 09:22:48 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa334b12-b3df-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 10:22:46 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso71043895e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 02:22:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952da12dsm19507772f8f.29.2025.10.28.02.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 02:22:45 -0700 (PDT)
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
X-Inumbo-ID: aa334b12-b3df-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761643366; x=1762248166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ruw/LQ2mFawwvVukuxuxFGTtixkuOI8AbP7IwzV6JjY=;
        b=YzV3LwzBB1gq8PFNaFusN8Yi+iDvbWJyljgxO1frIhYHeQyF4mM7BA2zfPKKm5kxFK
         BIO5WqZZksaAuA1kpTk2Ha1SJHgn+zGhrA8FMPXyJcRVBOtFif4h9BJo8p/yblYZNZ/G
         irV2bPRrRBeqjXymxh35/wE4eE0XQuBKI0jPolfiVGk9YZ3t7auI45NS+E3YMdBA0Z1G
         tmLO4O7/P4oGF+KRIsEoK/VcRHQfY1a+fh8iWekSQjUwyY6Yid7OPZv/tJStAhJmHw7Z
         3xbY3hVmV0ow87dlDQ0oWzbWG2Kmg3HgHcmN5xDseZxiVpt/9ldk6jT1hkquQvuimbuN
         +weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643366; x=1762248166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ruw/LQ2mFawwvVukuxuxFGTtixkuOI8AbP7IwzV6JjY=;
        b=NCXlWbMTdyPxhxWynKaNx1LZgybGBjiE9KSV1hKMVye8U+mTF1WGDxCUNjTwTzalXk
         a2fz7bRo7mATUNU3C9kyoBX5Arv0RBecjD6vEY6zLirsdnyPYNUYNQ2IRf8qhZxYfsWG
         Hg8jSJE4H5eZWRU/ex5JyT5VjRt4K9EKxFREGMIFCNdK75kFjPIMZ0TyCdzeedbGSGZ8
         D5eyXcaT/hrUA0nA4a8BEQlsfmey5tV/PcvflsiAEOeCYSpHnyu0depyAw6jruLKO3f8
         R31m+bAOsXRek5cv0kVv88OXVEFMXywwejhBbBcej91ALuG9PGHoqSisudAAGaLPXojI
         /b5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWndwqY43yURxnOcRCfGlu1/0IwXDJhSpCzKQEcKNyR8YgUbQiWMD4IyUj6AY9o+h5pIMVUTCmIa2c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXOmRxxqN4x12ejZcFI+0GDUfua25fyw95BgTXdc7/PULUi/J0
	Wgv3UNTpVTVydf2sSAZ9B4l0aqvK6uW5edfRdCdIo+oycLglg2ETUUC40PsA6xpdsQ==
X-Gm-Gg: ASbGnctJmKFpSJGoAS9Yyz2T1CL6395KVsHmpaGRGemsvPWyyqpy6MjzFOKwRcDhWcG
	Qwe0XSDw/saNtbi8uMqgDW+60l17RNSr8HElxZHNQINf+J+ySJXRVd6sDKASARvKB3bIDHa6roJ
	yzsICFENKy/YvMiEqOrs7dS2GPZ/LBvJ3dIf5px+mQbm9Vnd8+IG14ibEpGCm1E3Vspoi71G7gF
	vLoSgcnIyVL+GEwD6Eq3QGHMh36DZGNN+GX3BHTbJJgpBJvRBsRSMGvXTHNf4iidXCxi+56OGv4
	BNWJYdx/rgKi32JeuuRlOmmOtVUZ/9ExdFcgr1nuNzNk/xQFd12JMHun26WDdN5uePa58LLe+Wt
	q3xH60Or/yp2iY5NBpjaWYGTXoYBfBpsOd9vmUa17+DIOiYHWK67gBuo9T+9Jb9BD22EgSH1612
	BXC/2ADojpNPpefQeADLTGz6Yy5IRTYjpygrv9w2UqIiggysVRhzAzf+UCk6To
X-Google-Smtp-Source: AGHT+IFqhK15hfJzpNL9PD83XJCsLFyVlenjJAQc2Fi7GJKGVUjfKRODYoD7PoQHQ+6kCdpFKN/BVg==
X-Received: by 2002:a05:600c:190d:b0:477:e66:4077 with SMTP id 5b1f17b1804b1-47717e67befmr21866355e9.29.1761643365832;
        Tue, 28 Oct 2025 02:22:45 -0700 (PDT)
Message-ID: <30131a50-d4fb-4c42-915a-be44b62752fa@suse.com>
Date: Tue, 28 Oct 2025 10:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22 1/2] x86/platform: Expose DTS sensors MSR
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1761585640.git.teddy.astie@vates.tech>
 <48b15617f248852560a0e0674eea65d25330c605.1761585640.git.teddy.astie@vates.tech>
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
In-Reply-To: <48b15617f248852560a0e0674eea65d25330c605.1761585640.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.10.2025 18:26, Teddy Astie wrote:
> Intel provide CPU sensors through "DTS" MSRs. As there MSR are core-specific
> (or package-specific), we can't reliably fetch them from Dom0 directly.
> Expose these MSR (if supported) through XENPF_resource_op so that it is
> accessible through hypercall.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> I'm not a fan of doing a inline cpuid check here, but I don't have a
> better approach in mind.
> 
>  xen/arch/x86/include/asm/msr-index.h | 2 ++
>  xen/arch/x86/platform_hypercall.c    | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
> index df52587c85..98dda629e5 100644
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -510,6 +510,8 @@
>  #define MSR_IA32_THERM_INTERRUPT	0x0000019b
>  #define MSR_IA32_THERM_STATUS		0x0000019c
>  #define MSR_IA32_MISC_ENABLE		0x000001a0
> +#define MSR_IA32_TEMPERATURE_TARGET   0x000001a2
> +#define MSR_IA32_PACKAGE_THERM_STATUS 0x000001b1
>  #define MSR_IA32_MISC_ENABLE_FAST_STRING  (1<<0)
>  #define MSR_IA32_MISC_ENABLE_PERF_AVAIL   (1<<7)
>  #define MSR_IA32_MISC_ENABLE_BTS_UNAVAIL  (1<<11)

Now new additions like this to this file please (and even less so ones
disagreeing in padding with adjacent lines). Please go find this comment
in the file:

/*
 * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
 */

Jan

