Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3073D9B311A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 13:56:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826484.1240778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PHm-0002CL-Iz; Mon, 28 Oct 2024 12:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826484.1240778; Mon, 28 Oct 2024 12:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PHm-00029a-EJ; Mon, 28 Oct 2024 12:55:54 +0000
Received: by outflank-mailman (input) for mailman id 826484;
 Mon, 28 Oct 2024 12:55:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5PHl-00029U-0f
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 12:55:53 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f64b3a39-952b-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 13:55:52 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37ed7eb07a4so3428177f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 05:55:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b70c73sm9545968f8f.72.2024.10.28.05.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 05:55:51 -0700 (PDT)
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
X-Inumbo-ID: f64b3a39-952b-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730120151; x=1730724951; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CRxFDXz4hybOPBRrMmB+OKN4mFWiVQfGxG6AfJxA1AA=;
        b=eOcFIcsWgSOAdNoL87ujbrUwhOw36PmNk8ZvWy4B+CnAJ9zwXVgu7scI43nw/9EpPm
         w37WoQdd2sBIRAoM6aHxzq8sYjlzhIbAYr+crylfSpepQmB0ytl3H6/eACh8XR81DwuJ
         6lPtLa/8zyQLUB3nFQFiWp7/X+hzUHmJc2C/+W0bPJHLCHPkIVonxBfDdaYphtFmj8ZD
         oYsxrceZSEsaa/xJKenZtmAbc6be+iNkTmGSDwu9lVUyzddnaSbQJI/T6gjXFnhwKR1t
         I89V7SXuiBwo159NSftW69Vx+JtpkwLZAYgkNuUzfIVKUbEZcRRzJQgscdr8WoAPOs9P
         aBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730120151; x=1730724951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRxFDXz4hybOPBRrMmB+OKN4mFWiVQfGxG6AfJxA1AA=;
        b=L0O7jQJGGxREIhtTlzXATH6nsJob5EgJurEQIneDJTpAVOX3o4EeJjhekIgrFDRxp3
         +dIi7Q7Dj6vtUUnjY2vGzHPv0F/0AaA0fCuEMP5pr9COph00U1GMbombTDQ9wWtHuqnx
         A5a57U9B6mVjHm/lDkZb0J+p6yOVZa5di2B6y7TL7164Fr5Nuu0IBj7h1DjuI1OvnQD3
         jRjeXiC+vsgF0GWuMobROhHJnmioluTbzUH7hUzhsS7WxgHs+7L26fZ4cIJXejC8EufH
         OQdD7wFqD44NDF26Bm2wo2DY4RjAjpMLrBX68ifFNGXHxfbWJSUJmn/rYu8HBECeS6Qo
         34AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXZffuA6i6dikKG2MdhGSo2zcui+quDZpDlvypACeJcxM+vj6z3abnJQ7t2MgEIfoi+qmNuBq26a8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw90ad7sCMqqXZoTqQI2uZGHcUg5wRHYil7ETMdfT9p7HYyETGu
	r65LgkAOe5rX2FlyhyPLrXoj/fOnwwau739NKq19JMAG6kCf/ImRhdD7raWNHg==
X-Google-Smtp-Source: AGHT+IGQ+sB0o8IA/aR4ASVys67Ou/63xqdsgOxn42gLr7pNJwzb485FSt7ZPQhvt0vDHPSMi7kP5w==
X-Received: by 2002:a05:6000:502:b0:37d:4e74:67c with SMTP id ffacd0b85a97d-3806120091fmr5555834f8f.39.1730120151515;
        Mon, 28 Oct 2024 05:55:51 -0700 (PDT)
Message-ID: <27be8d00-8260-460e-948d-81418b93662a@suse.com>
Date: Mon, 28 Oct 2024 13:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-7-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20241028124547.1371867-7-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 13:45, Ayan Kumar Halder wrote:
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -6,11 +6,13 @@ config PHYS_ADDR_T_32
>  
>  config NR_CPUS
>  	int "Maximum number of CPUs"
> +	range 1 1 if ARM && MPU
>  	range 1 16383
>  	default "256" if X86
>  	default "8" if ARM && RCAR3
>  	default "4" if ARM && QEMU
>  	default "4" if ARM && MPSOC
> +	default "1" if ARM && MPU
>  	default "128" if ARM
>  	help
>  	  Controls the build-time size of various arrays and bitmaps

I'm afraid I can't easily tell whether MPU can be used together with any of
RCAR3, QEMU, or MPSOC. If it can, the new default line would need to move
up, as it's the first one that has a match on its condition which is being
used.

Jan

