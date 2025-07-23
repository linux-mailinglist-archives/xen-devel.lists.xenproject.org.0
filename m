Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA1BB0F541
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054242.1422966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaRO-0007wX-Sg; Wed, 23 Jul 2025 14:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054242.1422966; Wed, 23 Jul 2025 14:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaRO-0007to-PE; Wed, 23 Jul 2025 14:27:30 +0000
Received: by outflank-mailman (input) for mailman id 1054242;
 Wed, 23 Jul 2025 14:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueaRN-0007TP-29
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:27:29 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28829223-67d1-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 16:27:27 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a528243636so4091009f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 07:27:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e51a19571sm1842038a91.31.2025.07.23.07.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 07:27:26 -0700 (PDT)
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
X-Inumbo-ID: 28829223-67d1-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753280847; x=1753885647; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9mEASbLwwCVE/obmsJeCMMIzPX37DrYnx3yhn/GarWY=;
        b=Y+HAd4gIgN4qeVbUwd2ppP2fsn5IaFYKE31WpGt216gudxALUyMvTeI94g8ROQjgaH
         dLm1ZttkVlqRfqw6RZ0dP5kiMvZq7mciyNmZbwJP3vUQFAxtMs9Tx+yyThgQe9bNDKSv
         UBTEOCU+xcY6WjguSc/Yg03LkJxIEoa2YGHXmnnIYOUnRjT1mpXbs0q5k50XmBhhdvae
         /TZWaCgjgoEiy27xHuT5Rp1hxggyYOMQ3UOvVL9sdf7gGocVj6Gg3SHH8Lioji50fmS3
         gg8nlmEoBsG8kCYvtHwz2odslMKiJd3b8vOvuwBybB/cyHWTGDlzVq6r4AFS2t26+F0P
         7FWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753280847; x=1753885647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mEASbLwwCVE/obmsJeCMMIzPX37DrYnx3yhn/GarWY=;
        b=Wc/XteTMJ4Ofdfx6wD3TI9ScSNEDbxBJ7agj7k5s9iYKrkXuDj1LqMhWOQvEkObYSi
         T2RSHx/EObQ4a4d1nc9b0RKck/u82iSWmyoqWTjR3qk2oCzn4QZfd+bBZUdJBxIE6zOw
         FxhoDpCLBNPZFDB/Mq3oHJwayu3JdqmfVa6nBQ51O8z94RUnDWolsNqp6sxXRytcZz/Y
         YW/om9FijyjC92Ejmb374SCscel64iNuqXYYICTwbqOfzxBuGsCtzH93Z7pp/5s7kcI7
         MFIAWxnnB/ctzxAS31lTVF72HmRzRpFi6Jf79yTISG4Vgv89OgMf4c3/MNCQZuCPtZCP
         z55w==
X-Forwarded-Encrypted: i=1; AJvYcCWDo3nT4oX2sALYtJfsTBpInRipou5jsd4Juv1mmlJ9sW/lrtqSvmQIZldjxszY8nL/RVcsAizb8FQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSj0GT/lCe1HKRhAmeB8qk0drUvjDjCWUCvoKVXTlXocxHd5Mo
	Ldxtw72pNzEIIKj5LDXvgL6Nd8LvxYj/FdPNqKw+vmCueMSpxIZLBi3+or7bFMw1Lg==
X-Gm-Gg: ASbGncsxtwOF3i0b+cupMR2+NsLGABhwPLpATJZMAbnZlImXAxP1JlA4VZWD6SLN2Wn
	JjycqtZcOdd/vIksG/G8IZ19HXR/JDfSSMRY94FGrAv0fSlZ7aK6WSn6yUDFSPiEG9p7YGJ5qkW
	aCIcEZGkkV5XMgIduMRp6KeufJkX99kvxg06PAUCJlvP9GyxfXIp83/9d3vNVseo0b3AwLUcOFX
	qCgh/XHzgEjKjRcwvSdKToMAGGW2EyeWrLl2WPvLq3wULrqcyR6Nn6ZKPQe/lVPaJKSlBCApoa5
	xy1wa83hJQYik+68CqS/7YUpRDZ/Fs+mShogHR6JyEw2xrb1ra45zXLAjgJBivaxKRZcDPxZvCN
	WqF1pi5x266IzL50hIKejOq88Zd/iv3S0vM2AXfhrWnJWPiNU78Ehb/wXaJLWLY4ccbX+D+WnkG
	aV0HA5Oeo=
X-Google-Smtp-Source: AGHT+IGDm4CpV2f5IRaqAYmmNVKEkTXMwOvlBRXDWxuOtGajphD2vpeoRetdet1+9oc7Vd1NBdvE1w==
X-Received: by 2002:a05:6000:288e:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3b768f2e267mr2292122f8f.52.1753280846685;
        Wed, 23 Jul 2025 07:27:26 -0700 (PDT)
Message-ID: <60627444-420d-42a1-b7b6-d74dec2479e0@suse.com>
Date: Wed, 23 Jul 2025 16:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "amd-xen-safety@groups.io" <amd-xen-safety@groups.io>
References: <9c1169345d916cb542bf3f28ddf854f6308a402a.1753279365.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <9c1169345d916cb542bf3f28ddf854f6308a402a.1753279365.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 16:05, Oleksii Moisieiev wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -19,6 +19,7 @@ config ARM
>  	select HAS_ALTERNATIVE if HAS_VMAP
>  	select HAS_DEVICE_TREE
>  	select HAS_DOM0LESS
> +	select HAS_DOM0

This wants to move one line up, for the set to remain sorted. But see below.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -21,6 +21,14 @@ config DOM0LESS_BOOT
>  	  Xen boot without the need of a control domain (Dom0), which could be
>  	  present anyway.
>  
> +config DOM0_BOOT
> +	bool "Dom0 boot support" if EXPERT
> +	depends on HAS_DOM0 && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
> +	default y
> +	help
> +	  Dom0 boot support enables Xen to boot to the control domain (Dom0) and
> +	  manage domU guests using the Xen toolstack with provided configurations.

What about non-Arm? x86 has a Dom0 too, but doesn't select HAS_DOM0. It
actually requires a Dom0 for now, so to me HAS_DOM0 is a misnomer. Maybe
HAS_OPTIONAL_DOM0?

> @@ -92,6 +100,9 @@ config HAS_DEVICE_TREE
>  config HAS_DOM0LESS
>  	bool
>  
> +config HAS_DOM0
> +	bool

Same here as to sorting, no matter that ...

>  config HAS_DIT # Data Independent Timing
>  	bool
>  

... HAS_DOM0LESS and this one are misplaced with one another.

Jan

