Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016D8BFB6BE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 12:34:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147911.1480044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBWAO-0002eR-91; Wed, 22 Oct 2025 10:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147911.1480044; Wed, 22 Oct 2025 10:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBWAO-0002bp-5f; Wed, 22 Oct 2025 10:34:04 +0000
Received: by outflank-mailman (input) for mailman id 1147911;
 Wed, 22 Oct 2025 10:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBWAM-0002bj-T0
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 10:34:02 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f71efbc-af32-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 12:34:00 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso3852019f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 03:34:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c56sm24755939f8f.18.2025.10.22.03.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 03:33:59 -0700 (PDT)
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
X-Inumbo-ID: 9f71efbc-af32-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761129240; x=1761734040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8utPLk7asuwld9WsOdy9VmdP/6Y1z95GdH//i3He3kQ=;
        b=PBNwTz6I7mQ1Bzq/1IOYi5jRm1TgazZJQqeKQ/RB97ShLHoH3n+8GwzrCWZp9Sv1g4
         qR/VDd69EHDxYOuacH6h6teVl9CVFU4NKXBaPZszEyUfiLwdTSBY4UMxfOSXp7bsgnjY
         ROS51x2PS4kg0DBp8/+DkOKwlMW7BIq7tP7NGWmSuwxiYw/KIdCOdwnRIM13Hi7fcS8I
         QaVG3mRvpFAL3Yv4P1szohaO219hIy4jzGZaUERlXMg6oOv+WXb+zjU62rKRIEZJqhvs
         /jyL4fcbgKKoQnj1uhiL++Bm2teeJG0m5ebi2laauK39mSMGgwg6OtWxD3fbQ+z2IX/D
         MhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761129240; x=1761734040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8utPLk7asuwld9WsOdy9VmdP/6Y1z95GdH//i3He3kQ=;
        b=FGi8govCskEOySQAXPCB3Aip79arQXcpmHUcPh9QS5U84xJUz5JKRLK5dPMk5i8Sk/
         A4Wi2yOZ1gynQQTG6EPkMN4GR3wYPovw/EmZ8u+BWIzfsFaliIIQ7SBfkk4AhcFvy+gy
         E1IfYRfLjFZgKZxCzmkq/KVnfkY/OS+1mPF+rVN5/x7fwK9zimZl6XRW2L0klgC4G/T6
         QNHbtnIdKTWAws/rJk/4ura4n3EqcUJwM4Z1ojOVXa4Ul9Gk57kmyEMXYMjOXqHwvbjG
         SuKdgteIe4VDJ37slB8rBKhq965Nv2JRdW0MfFFwISb64xRvHNOj4x1/vzAZzOcnI/sN
         afLA==
X-Forwarded-Encrypted: i=1; AJvYcCWIws72uwRUPmDhniGtXUtwlXfzovjs3yrjCnAEKNj6C6PND3xkZEHQ8NdRvEUreJw5/GKTsZV9WiM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyw4Y5WApoNhuB0sE7vC/x7kCNLP71aX5mEmhROUvAFcMUmFSK1
	jetnKPXJNxZ6ywRuSwm/dB2buSCXT26QR/D8763aFT8eqq3taFut2NpXs351hkw3Wg==
X-Gm-Gg: ASbGnctnDNNvDu+xCTuQ2FHSzhdgSf+Aow3NrERMd3imFU2TqUXc0TALT7tjCvwf9jM
	EID2JD651+cim8FB6W5bTqFxwfJ4z//BA/2H4ngWPHvKR/UmX0waG5iYzDBEUvtE8oVYNb4UXzJ
	MBvhWjxJDfvTaj3lH8y1rqYz3O2YpwJp0NcOWog+Jxi7jx90gtRHi5ECKq8Z6mKel89zk94yy2E
	ZUUgYdx4S8UdVB4NCm/7rdgRgQh0ZiSHC5K2jLuTh6cnoD3Lw0j0k5CNEpFcRPRhE/PPSijS77o
	zO0k8aR0v2smBtDNnv4A82BhoOB/ble9pkn0M0gZG4tV/kDS1OS0WQXNQ/nJNstDDWX+hZWJf/u
	qFJvBGYKkRHVfbi9tSMxayQcSvINI0GeHvPalY4LOaI3SM3Po3maV1cCu3xHvfcZ0vg1qq0e+LY
	315RXmJPUpt6Gh2d8v5dxbfrNB5mYRfLgc3B3v3vQb+rC0T02jfdTcSm3nXGJc73os309H0/w=
X-Google-Smtp-Source: AGHT+IES5ELJLvq2uZ21z6wPNQmZpHLwoKnvsOod5A+eO8BujQudgOiVlu4D7ezSEyLNn2TLDh7WwA==
X-Received: by 2002:a05:6000:3111:b0:427:900:68ac with SMTP id ffacd0b85a97d-4270900694bmr12210762f8f.39.1761129240286;
        Wed, 22 Oct 2025 03:34:00 -0700 (PDT)
Message-ID: <617e5690-b861-45d3-b8c6-e48ceece8c56@suse.com>
Date: Wed, 22 Oct 2025 12:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] vtd: Collapse x86 subdirectory
To: Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1761124632.git.teddy.astie@vates.tech>
 <0b9cda94fc8b69563a5f8783d6bc3ed22b0531d9.1761124632.git.teddy.astie@vates.tech>
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
In-Reply-To: <0b9cda94fc8b69563a5f8783d6bc3ed22b0531d9.1761124632.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.10.2025 11:51, Teddy Astie wrote:
> As VT-d only exists on x86, it doesn't make sense to have a x86-specific
> subdirectory. Moreover, now that vtd.c empty (once we moved the deprecated
> iommu_inclusive_mapping parameter), only ats.c remain which could be moved to
> the upper directory.
> 
> Collapse this directory to make the driver structure clearer.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

On top of what Andrew said, ...

> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -57,6 +57,16 @@ bool __read_mostly iommu_hwdom_passthrough;
>  bool __hwdom_initdata iommu_hwdom_inclusive;
>  int8_t __hwdom_initdata iommu_hwdom_reserved = -1;
>  
> +#ifdef CONFIG_X86
> +/*
> + * Deprecated
> + *
> + * iommu_inclusive_mapping: when set, all memory below 4GB is included in dom0
> + * 1:1 iommu mappings except xen and unusable regions.
> + */
> +boolean_param("iommu_inclusive_mapping", iommu_hwdom_inclusive);
> +#endif

... such arch-specific #ifdef-ary is precisely what we'd like to avoid where
possible. Plus the way it's done you're now re-introducing the option even
to INTEL_IOMMU=n builds.

If we were to drop the option, besides editing the command line doc, a
ChangeLog entry would also be needed.

> --- a/xen/drivers/passthrough/vtd/Makefile
> +++ b/xen/drivers/passthrough/vtd/Makefile
> @@ -1,5 +1,4 @@
> -obj-$(CONFIG_X86) += x86/
> -
> +obj-y += ats.o

Losing the CONFIG_X86 dependency is likely right here (ATS is arch-independent
after all), but would imo want to come with explicit justification. The earlier
use of CONFIG_X86 was here for doc purposes (to somewhat help possible future
re-use for another architecture).

Jan

