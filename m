Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E033BA088A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 18:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130663.1470128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1oR2-0001It-Pf; Thu, 25 Sep 2025 16:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130663.1470128; Thu, 25 Sep 2025 16:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1oR2-0001GU-Mc; Thu, 25 Sep 2025 16:03:08 +0000
Received: by outflank-mailman (input) for mailman id 1130663;
 Thu, 25 Sep 2025 16:03:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1oR1-0001GN-AS
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 16:03:07 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f076c44-9a29-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 18:03:05 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-62fc28843ecso1427655a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 09:03:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353e5d0526sm190558666b.12.2025.09.25.09.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 09:03:04 -0700 (PDT)
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
X-Inumbo-ID: 1f076c44-9a29-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758816185; x=1759420985; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WI/J3F9qFL74lFhq4vmgFT3/Ut/PZbcdz415wWjcTPM=;
        b=cUnRtjWniPPHAMeBfK6I2+QYC/N69bwl1cvmv5oCu4PWhnrnx+93EKn4wA5PsD0QF9
         0VntIeFO1Tz9Hq1QboAZ6mzBCi6xczutfJI/sw0lRSZPWaxUuxtIZMKbu6C1HZ+0P7b2
         BWVgEj1JYa0w3X5+Ed+Ar/TWZZN4gwnuyr7YaiywryZA4UvH23cb5rxbtumUjtPtorCI
         xZkgj7Bn0zh12ZW5UKfOClcmEpyxNEOziiWGs5IPspLNgBC8gf7SZidbyOyaFlK44fzg
         Ic3BKDg6/biFo4v/KO7ckLM5TSHZvswjvSqjIdd63TifAPQEQuspwuhfR65LuEOS8A1d
         dHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758816185; x=1759420985;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WI/J3F9qFL74lFhq4vmgFT3/Ut/PZbcdz415wWjcTPM=;
        b=ZZjuXtmIcWdlCkrZZDP1161AVBRMVr7piILj5K6y7z4o8w7e7XLkvb306kSgTPz65u
         unqOPRK6WPBnQ26uLmS9bLUBscjmgQghVmLBb/RahyGtXilstYEyn5QvQi+BphKMA7GD
         yrxAJXwyuSV6m3Tx9W0qWa1LEKO2fcJ+K20elyhXqFEKXI0aflerb1IGeGw/v+iorrzn
         Ly2rrdMNMW2SP8EEAKX6/085zJ+kJzCxGbC5DCpmFTu/pHmtxrcjAM/euvwaFxd4WSkD
         PLjRqalnbTUBEQ0o642LfXKNL9NK3Okygfmx7/rYRQC/C9sRp7wXW3iNx/vaj3GZ0/iw
         oI8w==
X-Forwarded-Encrypted: i=1; AJvYcCXCqhD1+O8mNKnLk5/XVjZNhwlRlY/1OM/q5Z4k+3pgsheQmT+HxvFkcaVlDePl7egXp9eehTQ+W7Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxzNILeBXg9DqUjCcgkzystqMatIp45RXIOg7mVcIkN328oKy3
	NQSp3Eo4bbe+NcCOYkGZ1s3iPOhmmjVDZSOuEEb2TmQDaP/EtDV0ST2vwg42v28s7A==
X-Gm-Gg: ASbGncth9Qf0Xl4MBHRojzobsgkC90kbZi9jYIZxYq64CJI9wkfTm/6i7jWtEKYHxp3
	G3Zqs//zg8twWOtL7oSEO2JYryzFUUPcGUtZ2jjchp7sP906bAvvtsAFUvzcyFeBLgE9uU7+rJI
	MRErNAPTsX+3038DJF77YFh0NFeI2STsqAkTS/GbInRmCygchavW04cXnN+FOtb+TWHOnnW3bkI
	q7xMghvTM/IX4xw+TPisNhkkfEcqQ68rxGJ759rRfHSyl173YYKnu2j/bNdsY6lia/d65odeb7y
	csIA/4Wk0Un/UpbVfT9bts3w1uvrv49louK9KxXkUqgIAts0zl3tDuK++49Hhs3BRtrDWEjAujt
	UcWTPKucn0mj2C1F11+pqSBsPKLE7sxnK//9qVr+dcZaA0XkHN8rBeQS1cRDx/cTOmaZw3X4px4
	dkY8l/FzjJ8LPNTaof1A==
X-Google-Smtp-Source: AGHT+IE1T2E61PW8Q9+coi5XjdCddCAlZgCMc4o8PiMF/2G+xmgD84BUgUXOCdPeJuQ/ASnaukl98A==
X-Received: by 2002:a17:907:7244:b0:b07:6538:4dc5 with SMTP id a640c23a62f3a-b34bd93d0edmr386220666b.64.1758816184767;
        Thu, 25 Sep 2025 09:03:04 -0700 (PDT)
Message-ID: <7cf80206-18da-4eae-b297-d1ab23bc66d0@suse.com>
Date: Thu, 25 Sep 2025 18:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <90d39f2050e6028a2fce494381ad0df76f49e541.1758812103.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <90d39f2050e6028a2fce494381ad0df76f49e541.1758812103.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.09.2025 16:56, Oleksii Moisieiev wrote:
> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
> allow for building Xen without support for booting a regular domain (Dom0).
> This functionality is primarily intended for the ARM architecture.
> 
> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
> default for ARM and X86 architecture. This symbol signifies that an
> architecture has the capability to support a Dom0.
> 
> The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
> expert users, this option can be disabled (`CONFIG_EXPERT=y` and no
> `CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
> creation code on ARM. This is useful for embedded or dom0less-only
> scenarios to reduce binary size and complexity.
> 
> The ARM boot path has been updated to panic if it detects a non-dom0less
> configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an invalid
> boot.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> 
> ---
> 
> Changes in v4:
> - change Misra rule to 2.1 from 2.2 in description
> - remove extra dependencies for ARM architecture from DOM0_BOOT
> - rephrase DOM0_BOOT help by adding hyperlaunch
> - DOM0_BOOT is not mandatory for x86 architecture

Luckily this is merely wrong here ("not" should be dropped), but correct
in the actual Kconfig logic, so:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

