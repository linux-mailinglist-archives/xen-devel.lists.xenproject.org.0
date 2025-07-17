Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC1B084F6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046186.1416438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIAp-0005t3-3m; Thu, 17 Jul 2025 06:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046186.1416438; Thu, 17 Jul 2025 06:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIAp-0005qb-0f; Thu, 17 Jul 2025 06:32:55 +0000
Received: by outflank-mailman (input) for mailman id 1046186;
 Thu, 17 Jul 2025 06:32:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucIAn-0005qV-FY
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:32:53 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcda8ad1-62d7-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 08:32:51 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so342872f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 23:32:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9dd603asm15796482b3a.12.2025.07.16.23.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 23:32:50 -0700 (PDT)
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
X-Inumbo-ID: dcda8ad1-62d7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752733971; x=1753338771; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d437x+rQqw58o+wv4U6unwmLqUHUgHTpeRxV83qDZxI=;
        b=NrPpzgydGU3YatW+fmZFe+ZT5ZPuOLttmiG7geLk0WuuxWhbojspRcoSt9JpT7XeRS
         +jxAg91NdFPRH1DADzt3ZiqaeKUuOP7q3jJcQcjceCEJUvVMscHZcA2BU29Nee4VBcLC
         I03AL/Si/lXt0Q05aNfATXlVCYQQAAH5GCq8xgbHeoYqbR4nScQxyJcbYx9b7+by3M8J
         ECSNTQeGm1HEWu8+BD6ugEmHftS+9lC0V1GqOIvmUtQ55QBu6vsLidT8qCYaSvCehHSZ
         iGsMKHc3NeKeKF5wEXhVG0dWKKJAcOhqLLa7ZL6R3XulZbWTqPiiJQwrP/eSAAkAmJqF
         cGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752733971; x=1753338771;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d437x+rQqw58o+wv4U6unwmLqUHUgHTpeRxV83qDZxI=;
        b=orRa9zp+XUOXLtBX0ogKLdaDvnmc2GuQo5KrHvqTRHNFx4XKzdR87X3IjturOVB5Ok
         9UjR73Bgoasl1ORJZjaCU8kIZ8/H4GiyGPkhXzAA2dGGStupxCHq0X9TbT1i2IpKKqWe
         wWZn0B/NIknj9x7bBviQv0EQZQROCOsDgfAuERsi2SgRDq/1kVkvmZmpm4xPF+5n/MJ0
         GbtRwLMWIpnL5aQ0075/HFkujFgCx8jm2TEhR1dk/0CRi8HBcDVFx/E0HS4Qi2XNg2C4
         GU5QQbkk4//rUYWAyTRUSeMqKv3UyOiB9kK402lNc/P4Nt601Ru66Pq0lRQHHUPbm1pk
         +QRA==
X-Forwarded-Encrypted: i=1; AJvYcCUFKelIK5s0wrQdo3h5mlrjmkaD6HKCwwfx+aJKe6tqIwhIEk1LV9axjaODEzBfglHZfDQrKFpH120=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxafckMm+YpKCZkw3oWYJ5zX3w7rByDEMWw8cnxqnh/O53rdgBh
	+qnmBS9TcJihIEwRmM1dpa0g6NRjx450l3qK5K4twZdWcBWY4ZUJ1BBPHKQbPHaAuaYPFSTv25z
	9BXc=
X-Gm-Gg: ASbGncud1VNXOXZWA56SNW/6Yrf128oB0tT6hVHvRTdQRkRLQlBYP4DkioYAhJlauzX
	QFuaVo1KuQsbuaWICmYka+V2csCmosGfEvJU5AcX5gz6ge/JTI8G2/0D4OCPpvMZGpcP5ooZPG+
	/1mOO8j3auDXYp4csSQxvTxLJfrmJgi0RffaWdM+D1sMFASb0a9Op3JGj+ya1tkNX0MIH8059dH
	GMbaZTG7Recrsywe/xjQ+IVpUUiIFBmOYizW8jtwo+zQnpum9X34XrCO2OCyFt7Yn0Q3X+Y9xXg
	/tQ0m8YrtqebjSMyKxgyXOFHv9SIuEjD9+0CQe7rceMhnKBNbLm/MdU5awMg+F1Re5wi7tps/0Y
	5z9fKFjPWwzrtn+Ip+VTMh1kZ3M2oKO+mNF5OeH1JOh8+/at6fT2tZd21kkavKnZIa8DeC0Hc+K
	jD9nEgoRk=
X-Google-Smtp-Source: AGHT+IE3Zl82EHkafppAKF872oqyXXJYqYROr4uc4t4gZf5Y5bFOre4V3z0oIbAMR0eyjQS/y4vFLg==
X-Received: by 2002:a05:6000:18af:b0:3a3:67bb:8f46 with SMTP id ffacd0b85a97d-3b60dd918a6mr5787406f8f.57.1752733970704;
        Wed, 16 Jul 2025 23:32:50 -0700 (PDT)
Message-ID: <72ece915-2a95-41f6-b319-03f821feb7a8@suse.com>
Date: Thu, 17 Jul 2025 08:32:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] x86: memcpy() / memset() (non-)ERMS flavors plus
 fallout
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
Content-Language: en-US
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
In-Reply-To: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 14:10, Jan Beulich wrote:
> While the performance varies quite a bit on older (pre-ERMS) and newer
> (ERMS) hardware, so far we've been going with just a single flavor of
> these two functions, and oddly enough with ones not consistent with one
> another. Using plain memcpy() / memset() on MMIO (video frame buffer)
> is generally okay, but the ERMS variant of memcpy() turned out to
> regress (boot) performance in a way easily visible to the human eye
> (meanwhile addressed by using ioremap_wc() there).
> 
> 1: x86: suppress ERMS for internal use when MISC_ENABLE.FAST_STRING is clear
> 2: x86/alternatives: serialize after (self-)modifying code
> 3: x86: re-work memset()
> 4: x86: re-work memcpy()
> 5: x86: control memset() and memcpy() inlining
> 6: x86: introduce "hot" and "cold" page clearing functions
> 7: mm: allow page scrubbing routine(s) to be arch controlled

This series now again having all necessary R-b (Jason - thanks!), I'm
intending to commit it early next week unless I hear substantial arguments
to the contrary.

Jan

