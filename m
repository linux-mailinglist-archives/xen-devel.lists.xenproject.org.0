Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8724B2A57F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 15:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086111.1444343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo00F-0005um-99; Mon, 18 Aug 2025 13:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086111.1444343; Mon, 18 Aug 2025 13:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo00F-0005se-6X; Mon, 18 Aug 2025 13:34:23 +0000
Received: by outflank-mailman (input) for mailman id 1086111;
 Mon, 18 Aug 2025 13:34:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uo00E-0005sY-FC
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 13:34:22 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b9b63d0-7c38-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 15:34:20 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-618b62dba21so3508068a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 06:34:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53e52sm802605166b.25.2025.08.18.06.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 06:34:19 -0700 (PDT)
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
X-Inumbo-ID: 0b9b63d0-7c38-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755524060; x=1756128860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ziJV7uvnC+kKtjjhxQiMo5MJuHMGdaQJ22bUrgjwyEU=;
        b=OjcMgorcZ7W4oihDtkyofLgU4KRjKGuI+LKJaNg7sRoU8+sP/NZVeLt9S7WnfEWsK7
         kWu0QAb6bTIQbtc0kocBKIxTB1751LtbTCKkDXpqeDyJKiBjG+ClCFve2OeLBocD6nmc
         3SQUkbv82Ze79KQQfyOFPhyDuQM8ttC0Crcy+8WeReKSHfG44/R78jdggFCTFBabBjRf
         hftWVK2zuIdaKtn4z/0q+tYX9H/QYac2MqKhadMwrxNjG7lEVqmNhD+lTPnxyM6STvwO
         ngNxoKpROeNNhLCc2OpO3nkm5hWJHBRjEwr38miqDiMAhCsZClc5Io5tiB9T8/jVOs3Q
         O62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524060; x=1756128860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziJV7uvnC+kKtjjhxQiMo5MJuHMGdaQJ22bUrgjwyEU=;
        b=ltNcW6slXHTEf3bB5N7f30x2S6sypug2z2632ssbwGLD+tfH7zrQ5ie8RJD6VFVyrU
         IEloG2N992Kh0afOfGuIciQisgU/x4HtyPFW6K8LRgJVEThX1Lm6+K8nuDgCnC+bS292
         AqOy+wT7C9HTuu8LlZeGa/BnHzYBxMidqlnbF18d+NjtdM/CuMOs9Fay2NjZFeO9NyOv
         w9pFILvh9LjhlWi7buQodtb7+SrLKl7k+n9uhdr+AeKdLIdLP8D3+BmaWfSPAv6JNEbe
         0xQgUhXfZnljWVxF1x0+YqYlwsBMaZP3sMYhLreNIAKlzk+cd3sLtt4QfPnkDpmww6At
         2oIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAvSLaywUt3vn4ny7we6S0X2V7G6BX3uKbHHFJ4m5XKzv2kbSunzRimO182MkBdXFzMUeTZrnD/Gs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4zqtcjMhrzwJHMuts5inHRwwK5ty+XpKuKCmY66jSeVwg5hD3
	jxYjGeiC/oOlSpWfj8WCGpa+CizaBVjs7A97n7PDWTKfVTVZXD5HYg4cLj3s3McmIw==
X-Gm-Gg: ASbGncsHLFoytu9tTAW9eFMh/8o+2H4I83w3Ft79ILCp8TJms2ogUVEq+3qFXdwApHf
	fruKZgkGLjyy0lbrLtMxhKEVyZ8JZ2HYsnsxd107+/zrD6GrvG1xKfM8RIUlmt1u7grBpkXv9QQ
	TAwGvKkw1UO9Ot+XnENinEAIdLJC0lBRNbJ3mxrZ47u41CKKN+Td4iZOC9vu7PIU2p+k8fbezHL
	BqSQO5xcI5t4fkqQhGjZNhNcdnHbTHOwY1K5a1Ish40ED+9kYP08Q6lrcKLYuBS+5S7Dm1N7pjH
	JEQcAf5/6PGl9ivIwmJUQU/IFK1LtLRyT3tLVQtjH61qNd/iiT/C6A/1Zi+74GiUstXrjbsaaoD
	EEHNf+cibpW3hRJRl2/iUecKUQhXaYQXjyIZS+XEn1P610GQcZHporcPx4IrA2hF8Lr8lYngkc0
	fQW/zQSh03xzq1rgxwBg==
X-Google-Smtp-Source: AGHT+IFG+miXy84MAkmSESonFdJyyR6+0pgOf9dKc1ZpoCX1mpIyq6XAL72MTWidfaxU04nInh2vCw==
X-Received: by 2002:a17:906:f587:b0:afc:a331:ba2e with SMTP id a640c23a62f3a-afceacd90d8mr871673766b.24.1755524059794;
        Mon, 18 Aug 2025 06:34:19 -0700 (PDT)
Message-ID: <2035b14e-3836-4e80-9dad-8a49ca90864a@suse.com>
Date: Mon, 18 Aug 2025 15:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Penny Zheng <Penny.Zheng@amd.com>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com>
 <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com>
 <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com>
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
In-Reply-To: <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.08.2025 15:28, Oleksii Kurochko wrote:
> On 8/18/25 10:31 AM, Jan Beulich wrote:
>> On 15.08.2025 12:27, Penny Zheng wrote:
>>> In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
>>> HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
>>> a few functions, like domctl_lock_acquire/release() undefined, causing linking
>>> to fail.
>>> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
>>> /hypercall-defs section, with this adjustment, we also need to release
>>> redundant vnuma_destroy() stub definition from PV_SHIM_EXCLUSIVE guardian,
>>> to not break compilation
>>> Above change will leave dead code in the shim binary temporarily and will be
>>> fixed with the introduction of domctl-op wrapping.
>> Well, "temporarily" is now getting interesting. While v1 of "Introduce
>> CONFIG_DOMCTL" was submitted in time to still be eligible for taking into
>> 4.21, that - as indicated elsewhere - is moving us further in an unwanted
>> direction.
> 
> Do you mean that specifically this patch or the whole patch series is moving us
> in unwanted direction? (1)

That series. We said we don't want individual CONFIG_SYSCTL, CONFIG_DOMCTL, etc.
Instead a single umbrella option wants introducing. Which means there series
doesn't need re-doing from scratch, but it may end up being a significant re-
work, especially considering that CONFIG_SYSCTL is already in the codebase and
hence now also needs replacing.

>>   Hence I'm not sure this can even be counted as an in-time
>> submission. Plus it looks to be pretty extensive re-work in some areas.
> 
> It doesn't clear based on change log why this patch is sent outside "Introduce
> CONFIG_DOMCTL" (2) as it looks the same as in (2) and it was reverted once with
> the reason "for breaking the x86 build". (I haven't checked what was changed so
> it won't lead to build issue again.)

Before we can even consider further work in the intended direction, the present
randconfig build issue wants sorting. Which supposedly this patch alone does.

Jan

