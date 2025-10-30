Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC9DC2063A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 14:54:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153729.1484016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vET6g-0003by-2Q; Thu, 30 Oct 2025 13:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153729.1484016; Thu, 30 Oct 2025 13:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vET6f-0003Yq-UL; Thu, 30 Oct 2025 13:54:25 +0000
Received: by outflank-mailman (input) for mailman id 1153729;
 Thu, 30 Oct 2025 13:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vET6e-0003Yk-9H
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 13:54:24 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eff16729-b597-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 14:54:22 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-475de184058so3712765e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 06:54:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429b9b436efsm2934518f8f.23.2025.10.30.06.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 06:54:21 -0700 (PDT)
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
X-Inumbo-ID: eff16729-b597-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761832461; x=1762437261; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iB4P3jhLn75o2el8MXxVF2nUKWejU/SggJzas3bR+lk=;
        b=cQlgq7i1v/MvYMukGCID4mPDKLlMLMvNZrvpryTc4B7stVfxDYDnxx4nLfNJdwCdzp
         y0j1gvk+Y2jS+djb4NbdNJ4bK51lLR10X/7Bgn43RFVtBrD4CnoKl4anLtYg3Zq+RoV0
         zLL/VW3qJmDW/yE9WR6YePWIiVrEo/XlkCKUKaOjDulILjW9X4dKkyf3Y5WoipXtNJey
         WdO3uHYE3Paq4QoxVJWB3N8Br26EtCd3gMh15mbiIY/3VOGVk5vcLQ+rNzKr79t+JQBf
         Aj936Ja22mMM6tO9WatMvqKvq00mjXRsFmG0rCfFl6tOvIQzwSxLgrpYlAenaVBCMGKY
         ShAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761832461; x=1762437261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iB4P3jhLn75o2el8MXxVF2nUKWejU/SggJzas3bR+lk=;
        b=CZqMOxjdCB5sJhsKBRrYiZ50J+W5pfif/7VaPlnQeYvF7Ate9YaBSM62EsxFlIdSW6
         OZoYxyKdqoTVw8TavoY9vlFCrJ5z1/hzaf44LySOUYDony0DQ4jKMlXvxpm2rXz4DJ6O
         3I11k04EWAfyRIV8lb+MAqHDZkCZPwsKbXkOgIDZnlfXBVUJbPRE9gDTkD6FMPyYpv7r
         KIn7duf9gYg1VKvO2udcuu42kPDYa/5ugeSIQbmXdlEmEZHa9EzPcyyr2krhYCXyluIC
         DAw/rcdUms9/5Mn4EPVx110Vks5PO4OAoDxFFwb0g0qFXPFJFkKD1q3O/IL57dTdTQhN
         WsWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/ftDGrVp6Q9YbDQm4533G+aiYq3GzE8oaENfudEPMS8I3X9KMAWk56MoGFPIGT5D5j29cqUU5UD0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQQaRBthkfE1kkGbgaTuyYyDMeBUA2kCjhLHBPyuPCmSOAc0Rb
	/KsUnwfVubluBH3VOZ1rYwFeyLhBNQ4XrQoE5FoqpC2GYB8S5ObVDD6MBcm96Ob45g==
X-Gm-Gg: ASbGnctP7ssKtjSLkTWacGO/MGZDRp8NOXyZPP1pRrwj02nYec2c8LUy7iWjZ3JVIG4
	DyUgzwLhQEibUSk1Smlvk6i3ncWkop8grcwNvpG+adDeY9tolBY9JmUnzlmdzEXCQ/jXCjpyiel
	IFO1nk4rko4dM6gIevqk2+xIBT8s9s4zB2758ysg09cOXd8a/q3fqjQ6FjF3Q+yQrdEWw0Gf36v
	Mx9Iat24pcxW21m2gGe/S4/qbiZ73wNA8ty3YCR31ZTNROjJa6bXb3nBiDEJ9GeP16IDeMH0Z44
	pfvgmEBdFT13eLKdJ5lca47+7lBIdWqkHsuZARudGZz5v7eWdBy6fZiY3xVMH1Zr7tih1tyIfdr
	VK9JO/Xa4MK7LgD+Aw6gHbz+VF+7y841r6EFVzNFwF4aScKvu9qpLBV07Kho0nAzxHt1loECzSZ
	BHaCNae9uSTpPJ+ZAmR5KfERlefRszAmDta37ZzJxrhsbk7642+YKwuhWWpDoU9AMzeGFBoHo=
X-Google-Smtp-Source: AGHT+IFJn0FcAdpK7rV2JNFMbrqIUTOnmEh0k4qwvD3x8lJmaZLsq2JG4RtBJN12twjcBnVVsfppIw==
X-Received: by 2002:a05:6000:716:b0:429:b9a1:5bb with SMTP id ffacd0b85a97d-429b9a10776mr1183456f8f.9.1761832461330;
        Thu, 30 Oct 2025 06:54:21 -0700 (PDT)
Message-ID: <22e53531-73e4-40e9-a45e-2c5f59852ce4@suse.com>
Date: Thu, 30 Oct 2025 14:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22 v2 2/3] x86/platform: Expose DTS sensors MSR
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1761752801.git.teddy.astie@vates.tech>
 <1001287258cf9652c749c66c6565478085a8657c.1761752801.git.teddy.astie@vates.tech>
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
In-Reply-To: <1001287258cf9652c749c66c6565478085a8657c.1761752801.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2025 16:59, Teddy Astie wrote:
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -115,6 +115,9 @@
>  #define  MCU_OPT_CTRL_GDS_MIT_DIS           (_AC(1, ULL) <<  4)
>  #define  MCU_OPT_CTRL_GDS_MIT_LOCK          (_AC(1, ULL) <<  5)
>  
> +#define MSR_DTS_TEMPERATURE_TARGET          0x000001a2
> +#define MSR_DTS_PACKAGE_THERM_STATUS        0x000001b1

Where are the DTS infixes coming from? The SDM doesn't have such. We try to
stay as close as reasonable to the SDM / PM names, with the exception that
typically we omit IA32 infixes.

I'd also like to note that unlike the two THERM_STATUS, MSR_TEMPERATURE_TARGET
(as per the absence if an IA32 infix in the SDM) isn't an architectural MSR,
and hence I'm not entirely convinced we can "blindly" expose it. (Interestingly
in Linux code there is an IA32 infix.)

> @@ -86,6 +87,11 @@ static bool msr_read_allowed(unsigned int msr)
>  
>      case MSR_MCU_OPT_CTRL:
>          return cpu_has_srbds_ctrl;
> +    
> +    case MSR_IA32_THERM_STATUS:
> +    case MSR_DTS_TEMPERATURE_TARGET:
> +    case MSR_DTS_PACKAGE_THERM_STATUS:
> +        return raw_cpu_policy.basic.pm.dts;

This, aiui (and according to related comments I got from Andrew on remotely
similar changes I was doing) wants to use host_policy. Hence why that other
prereq change is needed that I talked about (and that iirc I reproduced on
the other sub-thread).

Jan

