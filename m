Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CB7A463CE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896806.1305559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIml-00034N-G9; Wed, 26 Feb 2025 14:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896806.1305559; Wed, 26 Feb 2025 14:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIml-00032s-Cx; Wed, 26 Feb 2025 14:53:19 +0000
Received: by outflank-mailman (input) for mailman id 896806;
 Wed, 26 Feb 2025 14:53:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnImk-00032k-Cy
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:53:18 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 674b701a-f451-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 15:53:13 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso70788035e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:53:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5871f4sm24906685e9.39.2025.02.26.06.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 06:53:12 -0800 (PST)
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
X-Inumbo-ID: 674b701a-f451-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740581593; x=1741186393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NfQApDMPyUXEsEa/Ps+o/xhygtpezVFvb2dZXRdAuss=;
        b=RqH+M6R5tRVxT2xHiqFYB6u1TgK4rvU198gMJJlINjmDwhJuz0QlXrmGFTEvIM8TVY
         5XkEr6Em4D8cSezFuNQ2Y4WKdpuORP0cud09tEkKOsikK8OzTuybB/yWh91swRwW4Zit
         UX1fCs18iwfBNixujUX4gE8dDezpyXSGBTU2mdXp+R+6lsxuuKLsJZY3/1ZxCLUOXoSZ
         uI1FOZIqrhMHKcajsxkxSyPhaDILtWOmJLNz6SBBW0QTYA0/uyokfHFADr3qKG1PAvs5
         pV+IgxVwqM38R44nvFnHiKWxkltEpUEpBMBEX/5GwRiqaiX5IJEEnXnncRc6BjdRSiyN
         qUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740581593; x=1741186393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfQApDMPyUXEsEa/Ps+o/xhygtpezVFvb2dZXRdAuss=;
        b=cY0W1atjAoE43wOfoCa9yLGdUYlLsvbPInT1/P/WDJCXFmIm2iMTXd743OIY2zlSAC
         2SDtwn83Xm8pEVLThxVAhtmQJy55xRz14nEH1Zq04jZllj7ej1ouGQPyeV4wPcHmRI6V
         z7Ozna7UtHL3RYgL8q1bIJFvnI+2x19RTrs7d7Qw2FVWVwFanYNzQ8uOGcmQfF9oRh1l
         rWPJaYiJs+FYOg2Z76quF34/5928mUuDcTSeYAHeCaIRfjl892kEkeicn2qSo15gq/oO
         NZjLXUS7zoIx4cqhOTTkSGgd3L/rKv2/qaNk59/mKEbFfkUuyorLiZeDUlk+FUrikUwx
         Wiqg==
X-Forwarded-Encrypted: i=1; AJvYcCWTjegZC/x8F+VeR/pLmy3XGY4NzC9RMr1AVoeDASsjta63JGVOv8uwG/+gFl/2oHdkyfilsfEpnes=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkLooags8UHx6tqGn3SXGHCwEDL+6WotqcNc5jhVOWSFmEStvA
	ha7xgpBgt9kpQYR4dVvOmrvlwiGu5Y3eKb1jcHD0kwh6Ic7nMU07vPAwVJ6dew==
X-Gm-Gg: ASbGncvS5nJKJSVZXlJB2Fx1EQLWBJe7QIdK7r8vZhms1trO26sNqs25gRaIw5OZtRo
	fghivKJ+1EiUjCxrC/1RMUWCFGpN3TZtpdFL/XgCJ6LXFG0clVXCh59PgnpgFaFOV0B39Y4Zsst
	8jzCBXau6JeZBsp/3kkznidsaxldt5nhdBR74X2bK5y8qvZ/PN/pUmKF7wpuRcZ2vaJsA53vkEf
	Jk5jcwegTBFnwlEWwWNvALdyncqn7p7Zaw10sPl7vql6FdDSx5FW/CZTRIYGPE9QIW3s+wRHIq/
	1lzC8YL5JFQTOozzvSj5mk4BYy4vkUK33DrRy4POsXBau6t7o0Ly4HF/WuLSmjiAlRD0JV7jBFW
	1IOe+YxvB4j4=
X-Google-Smtp-Source: AGHT+IEuDr4+DcWsiYkcpmrGA+jYtTyf5vis/8ol2h+ihIKkKvzBzsYbdkGDq6F2FrG2XsI6y0UCNQ==
X-Received: by 2002:a05:600c:3c9c:b0:439:96aa:e502 with SMTP id 5b1f17b1804b1-43ab0f312bcmr81416375e9.12.1740581592955;
        Wed, 26 Feb 2025 06:53:12 -0800 (PST)
Message-ID: <d84d452b-61f3-4870-b404-35efe08c5994@suse.com>
Date: Wed, 26 Feb 2025 15:53:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/consoled: clean up console handling for PV shim
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250226003519.1203748-1-dmukhin@ford.com>
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
In-Reply-To: <20250226003519.1203748-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 01:50, dmkhn@proton.me wrote:
> --- a/xen/include/xen/consoled.h
> +++ b/xen/include/xen/consoled.h
> @@ -1,12 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef __XEN_CONSOLED_H__
>  #define __XEN_CONSOLED_H__
>  
>  #include <public/io/console.h>
>  
> +#ifdef CONFIG_PV_SHIM
> +
>  void consoled_set_ring_addr(struct xencons_interface *ring);
>  struct xencons_interface *consoled_get_ring_addr(void);
> -void consoled_guest_rx(void);
> -void consoled_guest_tx(char c);
> +int consoled_guest_rx(void);
> +int consoled_guest_tx(char c);
> +bool consoled_is_enabled(void);
> +
> +#else
> +
> +static inline int consoled_guest_rx(void)
> +{
> +    ASSERT_UNREACHABLE();
> +    return -ENODEV;
> +}

Why is this stub needed? The sole caller - afaics - is in xen/arch/x86/pv/shim.c,
which won't be built when PV_SHIM=n.

Jan

