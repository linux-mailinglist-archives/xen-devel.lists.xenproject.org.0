Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5602B33C24
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 12:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092880.1448489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqU6h-0002ky-PK; Mon, 25 Aug 2025 10:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092880.1448489; Mon, 25 Aug 2025 10:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqU6h-0002ij-ME; Mon, 25 Aug 2025 10:07:19 +0000
Received: by outflank-mailman (input) for mailman id 1092880;
 Mon, 25 Aug 2025 10:07:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqU6g-0002id-Lg
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 10:07:18 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47206259-819b-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 12:07:16 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7a0442bso678058366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 03:07:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe49379ff9sm530776966b.116.2025.08.25.03.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 03:07:13 -0700 (PDT)
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
X-Inumbo-ID: 47206259-819b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756116436; x=1756721236; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V3CitqTDuAeG6gG5hX3Frju10e6F4ZZ/zKw4aozPcwo=;
        b=gv/4xZeaSuA9ASveNgEoEOoTywldUQShzEWn0kEV2onOBg9k70Xf/4RIWZBP2D/jw/
         o61ZTzVIluvVfDOXQGKURUnVtbJf83LLVeTgZ3fw3Sn2Cx0uXDpCmypZdIyppLZdedqW
         ZU7BNwvm9Ejn3mKaCZ9WbNx+AhXwGTpHojSn3Fh8qHdDXQad61Hu7c/IcevJGwc1ztQm
         xcVyiUj1bUBv7fVOHGmx7AbK/TEMbWx6xty7cmA2AUlGcnhEwlAhtAxt9mvF9zS4G7oK
         Jr0IL/8eqBpJ7HemvjnGzUDYhjCy/UB0BFuSDLqCee/65VYO0oYgBYNJbUS6df7gOdp+
         BlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116436; x=1756721236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3CitqTDuAeG6gG5hX3Frju10e6F4ZZ/zKw4aozPcwo=;
        b=DBWb4R6MZbagMSNMXkF4KPYgpfx86JxXmuP2dyCArnf0AGNUCnAUTZ7/btt9PbqyBq
         SuQu+XVFrdbWsWnjMeDnTh5/55aLk/PHF6BdrAP7PE+jj2mahBgIyYl9uMO9d6YUX1NN
         2HnWXxvKYeVH2i7B/oFcNqNApfMVEUto80/scEEt36bR67HZTbV1wm47Ec+w9+nhUyC6
         YrLwsrdBSiPf6dKle14VqdIZdGXimh8bbRKwR5Ppb4i8wy0al2sDwhNP7sD+Ps1LduY/
         MuocYB1grB/032Fa4UPnxVJZLw0csiyz7rDknlCbkO4rF6cZYrwP11rhTziOuLY1HUe6
         vf0A==
X-Forwarded-Encrypted: i=1; AJvYcCW/6gd2nz6ZImWdnHuotJrVxhueHanIx3bP3givBRr3kAsfj1i9CyV96b3SgJ8TacJos/9Aox/dIYI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO7mZxVj7n4+fmsPFBXJGsC7aVA1AIlFH8DbM8+tHuKx8Hu5Qs
	nBNRKB2GBa/qVX4XSIrF1Rme1q5o7aT+N4Rf7zUgpSGyi5wvHY1JJpO3BT8zomT75w==
X-Gm-Gg: ASbGnctIWiQ7AztD2Xeh8pDAVQn2z+ozH1krdjb9j/qi90Ya1hBm2R6rHoFbgpJbynq
	hlh7DFOY15cTogMqr0LjRslKFM691x47OxLVXua3XUKHWrtHRIGyCXNT5a5LflvSL7qeCK0gmLP
	C06/kj2vhnPDiFjCm6oK6XkklhnmI0upUYEtt19+Dl77gU79fuO2CkPr2cYqSfbV0lC1+kcjzfk
	eCZSQt6g7TO5Uqjj7YYmkHZV9IdqQ3jsmO/a4ZXc9Cmm1Jdr/To0vi52SdDm3DkhJdTQeRJnTmP
	ubAJBtKiaDfGxa3jCy1AeOp+YI5x2yOcN/NWVDPhe63gDqtLdkd4gPagETENr92Yt9I3KPm+xYQ
	P+UHrGxZpc/xydge6AsMrVt6fNeecpkiI/jIJP8MJRNujCBPImCMVpc5gxlGlw9irBJfanD9DeK
	K2lLAk/Ls=
X-Google-Smtp-Source: AGHT+IHv752wWKxVrSlHOSk1fhBwKMfsgWdykYzlrPmm6DEhHBMhlVTpZbgj9wCPpJWMsIFimg6aVw==
X-Received: by 2002:a17:907:1b1e:b0:af9:10c7:59b6 with SMTP id a640c23a62f3a-afe295d2e67mr1068710366b.32.1756116433423;
        Mon, 25 Aug 2025 03:07:13 -0700 (PDT)
Message-ID: <60022d5c-1a9f-4a6d-8df2-bca57cefcf59@suse.com>
Date: Mon, 25 Aug 2025 12:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f7b4112aad84162c25f96a9d6db43a0c2ba85daa.1756046023.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <f7b4112aad84162c25f96a9d6db43a0c2ba85daa.1756046023.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.08.2025 16:56, Dmytro Prokopchuk1 wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -97,6 +97,19 @@ Deviations related to MISRA C:2012 Rules:
>         Xen expects developers to ensure code remains safe and reliable in builds,
>         even when debug-only assertions like `ASSERT_UNREACHABLE() are removed.
>  
> +   * - R2.1
> +     - The 'BUG()' macro is intentionally used in the 'prepare_acpi()' function
> +       in specific build configuration (when the config CONFIG_ACPI is not
> +       defined) to trigger an error if ACPI-related features are used incorrectly.
> +     - Tagged as `deliberate` for ECLAIR.

With

#define acpi_disabled true

in xen/acpi.h I don't see why we even have that inline stub. When it's dropped
and the declaration left in place without #ifdef CONFIG_ACPI around it, the
compiler will DCE the code (much like we arrange for in many other places). No
deviation needed then.

If such a deviation was to be added, it would need disambiguating. A function
of the given name could appear in x86 as well. That wouldn't be covered by the
Eclair config then, but it would be covered by the text here.

> +   * - R2.1
> +     - The 'BUG()' macro is intentionally used in 'gicv3_do_LPI'() and
> +       'gicv3_its_setup_collection()' functions in specific build configuration
> +       (when the config CONFIG_HAS_ITS is not defined) to catch and prevent any
> +       unintended execution of code that should only run when ITS is available.
> +     - Tagged as `deliberate` for ECLAIR.

I didn't look at this, but I would very much hope that something similar could
be done there as well.

Jan

