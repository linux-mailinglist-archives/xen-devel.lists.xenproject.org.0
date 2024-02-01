Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCD88455D8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 11:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674335.1049200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUkp-00065F-Kn; Thu, 01 Feb 2024 10:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674335.1049200; Thu, 01 Feb 2024 10:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUkp-00062P-I8; Thu, 01 Feb 2024 10:57:11 +0000
Received: by outflank-mailman (input) for mailman id 674335;
 Thu, 01 Feb 2024 10:57:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVUko-00062J-9f
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 10:57:10 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4759ebf-c0f0-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 11:57:08 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33b1117bbe4so468501f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 02:57:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600016cf00b0033aedfc5581sm10506517wrf.32.2024.02.01.02.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 02:57:07 -0800 (PST)
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
X-Inumbo-ID: a4759ebf-c0f0-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706785027; x=1707389827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wHfXA9CWPeygkYwIqkcdbd05IHnuqGa1RECkAr53WVo=;
        b=asFPrVO7b0QjErlBxkbHr6Y6E3/6ovF/W2NHKSt31VKjFD3aiw4LlUxdJsLE4s5ZVH
         4cNAuRwcnSUoQfrZZS6NLDgiJlgYiuQVuasNKQBgGW3xHhRsPu4PgHO3R+T1YmoJItFs
         EXyKYVm9jEG5lXYHW+9N/bv1BAiXtOCqjg3le0qMQBfon2NLZ+rKkEsYcR7yznOgn+yD
         EIrZSBVikXvYcUnK3a/JUjrMX6j1qG+rWPxHWQ9U5GI8x7fGwtj1WqBMNx6qZmK9ya4I
         BzuzRs1r1gmEOhOHVR9X0ZxjUdwE7nQRXLcm7DnLXt/NsdENKLltIGIKu90nsgP//60P
         Ar6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706785027; x=1707389827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wHfXA9CWPeygkYwIqkcdbd05IHnuqGa1RECkAr53WVo=;
        b=UFdpmo3QfsiBcFpYTUo6o2eyVIyiQinXGfE4u5acHW3us9PzgQX0gnb4cbs811+GzT
         aSgwBc00ViGmc6LZmUfsu6QAhZEieQM7DNfCBtWwbnK3ym3QRbdT96zT7MrM53hNBFn6
         FHOuuRUcXlyoF5S8caJZaYbm+hdV0o4iach6VZAJDs2YpmvO0LCv2w1gYVd2Rt7ElrA/
         qgWfwqHpTXgLESx/AY7J2eDiYBDDEDQVF3+DdhvEcud4m7rOwKxvxYL+51RGO2IMLc17
         iQDHWhqefSBI5bxz99+rPKzD3GlyQcDxEIll5C0FwLYhBKOkuYjJaXoaJklgkTxgx6ta
         X3Gw==
X-Gm-Message-State: AOJu0Yys7yFUsV6a9VKF9iZY5XJmxuQsDEfWsRSqcG+1NwApytmZ0k+I
	zVnLv9F03Budn4+PtiA2fQ5qmWfkqA3g3xUiOveBKNiI0V0QzH1z+0KCoauFVw==
X-Google-Smtp-Source: AGHT+IFanJa09jb1jj3FfMdUHrewWqzuq4tYduICl2RdJ1jrJaEwQgKLGHt9+Y7Xjaxk4/vTfBTB4Q==
X-Received: by 2002:a05:6000:18ad:b0:33a:f3dd:97e9 with SMTP id b13-20020a05600018ad00b0033af3dd97e9mr3796510wri.40.1706785027455;
        Thu, 01 Feb 2024 02:57:07 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUuDNLxcpFtX35VuilYbBCDQl1DrMo5MLB0ykN0JZyRDKlwIC7hZBaFo2S9UEEDblvWSIQ05zpvYiHc9Rz4I1k5VEbIp9+nuYOjhy/KFsM=
Message-ID: <5cda514b-4b6f-4259-9dbc-bb1462eec13e@suse.com>
Date: Thu, 1 Feb 2024 11:57:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issue iommu unrecognized on amd computer
Content-Language: en-US
To: oxjo@proton.me
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <qTUd8Z_TU2_jJzz9kTj2DJK54p4wECUT072VD_1nomh-d8Ej6hC-QNzY6BW6G9bQVdcDJuQbapJ7NlqqOAKd49Iu8rgkyt4E9qdnN_SyZj8=@proton.me>
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
In-Reply-To: <qTUd8Z_TU2_jJzz9kTj2DJK54p4wECUT072VD_1nomh-d8Ej6hC-QNzY6BW6G9bQVdcDJuQbapJ7NlqqOAKd49Iu8rgkyt4E9qdnN_SyZj8=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.02.2024 09:16, oxjo@proton.me wrote:
> Following our interaction on matrix, I send you the boot log `xl dmesg` output of my computer, booting with `iommu=debug` options on linux 6.6.13-200.fc39.

There's no "iommu=debug" anywhere in sight:

(XEN) Command line: placeholder no-real-mode edd=off

Did you mistakenly put it on the Linux command line?

Nevertheless there are relevant messages already without the extra
verbosity (and without you using a debug build of Xen, which would
be preferable):

(XEN) AMD-Vi: Warning: IVMD: [c9f1c000,c9f42000) is not (entirely) in reserved memory
(XEN) AMD-Vi: Error: IVMD: page at c9f1c000 can't be converted
(XEN) AMD-Vi: Error initialization

Quoting the respective entry from the memory map:

(XEN)  [00000000c8f58000, 00000000c9f57fff] (ACPI NVS)

Both Roger and I look to agree that this condition we have

            if ( !(type & (RAM_TYPE_RESERVED | RAM_TYPE_ACPI |
                           RAM_TYPE_UNUSABLE)) )

is inverted in some way. We merely need to agree in which way it
wants adjusting.

Jan

