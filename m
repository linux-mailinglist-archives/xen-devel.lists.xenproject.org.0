Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39030CD602E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 13:41:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192073.1511422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXfCu-0003SH-G0; Mon, 22 Dec 2025 12:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192073.1511422; Mon, 22 Dec 2025 12:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXfCu-0003QA-D2; Mon, 22 Dec 2025 12:40:12 +0000
Received: by outflank-mailman (input) for mailman id 1192073;
 Mon, 22 Dec 2025 12:40:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vXfCs-0003Q4-QE
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 12:40:10 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 589ee9f3-df33-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 13:40:07 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47798ded6fcso22761945e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 04:40:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be396c909sm94031065e9.0.2025.12.22.04.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 04:40:06 -0800 (PST)
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
X-Inumbo-ID: 589ee9f3-df33-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766407207; x=1767012007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xig+IFvynUIZpO+27KFQTKf8K4uXXN2jGUDgiz6rQos=;
        b=cBUvgfzW73qn+TncIX2EOvzj2mAGThL2PQFlUp2HeBs9nllyh2PqkGqwJQKD72DyYH
         THadlu26wAvMND826NoYom6ArwKAfw+IM8olB1mhtxRnHfcOdKypzoFjNu47M/SvQ4EN
         kVOQuwHlqMB0IGNCCgT0OpoDeh2UWsmBdlsasx4N4R3t4egTv+xgwEj6FYdsNBjdG02i
         2JwaYTVCyR9sNDxxl9o6RW4441yqy2Qxg5qOdhT4bW4HYk7Ms5tr/OOzUg+Uqg3MJSjD
         4eQDQZWRuyxXoecV8+W+o5PehM9yFF0ScEJ27hsUT4ReVdHT2XuNRd/4YCWhh2phSSKq
         5p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766407207; x=1767012007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xig+IFvynUIZpO+27KFQTKf8K4uXXN2jGUDgiz6rQos=;
        b=n1wdEdUuXsl8zhx6786iPHBoGJCIIyML+JCLTuADO0PM0tHmhbwrCwPZxwB1I6A5FE
         pOAJNc1XH8IedFz2VwFHz3HtlEefITjhNr8+hMF6XIfdoCcY6KOE34epDUyOcKGRxbNV
         540prj7l1aNwdQ79Aw3WOlf4ODZPGGiRiCgTcDku2MFdxvXCws1tlu2Jz6GOj+aMDmHd
         Zfs7ii8NYDJhj9HQLj5ZFYjcDaZYdSkzhl2T7TX357jYMMzUhbsISGdAGb29GW1k64Kc
         0G1K4Vkd8aFU1bLyCzZ5qnCX/LXQT/AwXIxZwozR6d29HVRhYtNBmozp5gvhNSuPaJ9s
         UvsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXYc2sIfbGYzSHSL35X/epDrEsQYMAztRjWrZegfidWFa21AuJjtaeuZiJ7Nxqc9vqykwepzc89E8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzq7nd9K+yYIVPJUE7Hxj8Nt17G+7XntKZjaXW6Jre6If11vtnY
	ryBtdO7N7c5bDSMFr1PPAzcgM7zNcPM0bHVjJe8RGlAPVOBkR+/RHBn5k2X4ih8azQ==
X-Gm-Gg: AY/fxX5dqGqp6D/6Zpd0oFeuVonKdygNTQY2wHnYnMTAU8R6eNFBQFIJji4rElGQcD2
	2mD+Ot31hIKAddg4pIgxUwqkwdQE5HfXtnUeebqFvmfiDUJvzkTC+hv2gzOzumwB4sm07ZofwOL
	+hzRO2QOivpnSZsm/qr1AgP8yn7YRCXh7xvd5hB3hnvl3fCbd66kStR6roV/K0w59a0S0797hhI
	Re/Siapg9ju22X+3KUyZvNpfxu8Ly07gK/eWH9gfVix/QS0qVtwqGrs+HJkAtGDk051sSYb8zGk
	FhTyY79ws6kvZDRIUrFiOLth+zs7sY5augtsgLECpVuSdv7faE6fNwQXkhUEzjKtnqaX6lnSa7s
	VHfmDey9hEpHOmBwBmIb6i4KfdfdLt/wO9o9Zb9m46pla0EPbVOVfsRM0Vpg59jbVtUi1xA2AWu
	JQ/xvkta1lH+8jgXk0du64ZL0yxXfuhcPk4PbZPmNN65jVkXI56egBLH/FoNPFBpR+pq7ss5qEZ
	co=
X-Google-Smtp-Source: AGHT+IE+Pk4pFGkbhqkiWhPM/2TGuVQeSKXlhmm0OkTy4ViH+toJ8cYD+wIzdkDDqV6g74QYtujHDg==
X-Received: by 2002:a05:600c:470a:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-47d1958a61fmr110614795e9.31.1766407206655;
        Mon, 22 Dec 2025 04:40:06 -0800 (PST)
Message-ID: <5d48b6ea-6979-4d45-a726-67e25fc25cb7@suse.com>
Date: Mon, 22 Dec 2025 13:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] x86/platform: Expose DTS sensors MSR
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1766158766.git.teddy.astie@vates.tech>
 <829177fefa7b2e2edeb8121357b5b3372ad1c092.1766158766.git.teddy.astie@vates.tech>
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
In-Reply-To: <829177fefa7b2e2edeb8121357b5b3372ad1c092.1766158766.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2025 16:42, Teddy Astie wrote:
> Intel provide CPU sensors through "DTS" MSRs. As these MSR are core-specific
> (or package-specific), we can't reliably fetch them from Dom0 directly.
> Expose these MSR (if supported) through XENPF_resource_op so that it is
> accessible through hypercall.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I wonder though whether ...

> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -123,7 +123,7 @@ struct cpu_policy
>              uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
>  
>              /* Leaf 0x6 - Therm/Perf. */
> -            bool :1,
> +            bool dts:1,

... we really want to go with the acronym here, when for other bits the plan
now is to stay close to the SDM names.

Jan

