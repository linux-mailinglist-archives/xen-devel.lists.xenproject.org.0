Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0121CB05823
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 12:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043997.1414057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubdC5-0006JR-04; Tue, 15 Jul 2025 10:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043997.1414057; Tue, 15 Jul 2025 10:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubdC4-0006GM-TF; Tue, 15 Jul 2025 10:47:28 +0000
Received: by outflank-mailman (input) for mailman id 1043997;
 Tue, 15 Jul 2025 10:47:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubdC3-0006GG-Ir
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 10:47:27 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 172d50f0-6169-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 12:47:23 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-454ac069223so31894045e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 03:47:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de435bdfdsm107624615ad.231.2025.07.15.03.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 03:47:22 -0700 (PDT)
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
X-Inumbo-ID: 172d50f0-6169-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752576443; x=1753181243; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RYn7eS/5zF73Hyol202Hjx82eXT5W+HCC/KBKDjLfRo=;
        b=B4B7HXJKMZL/xp5qiBwVloTTCfKe1YEreKAoNSGcjO2E3hBCjPRdsC0EMyjESzSow7
         L83dTBLGbI20iQ8t08ta3Myv69LZgqvULJyTlt5PHAgAofakZIL5vxUzasI3hs1CcxQf
         4XtBh8/FVfxG5hAGKf2WbmK1V2mqwlOYERKbMzDjByQH6YZw2c4lJLLTTU0mAB5zelPe
         RY+iqVa4wMr8+QtBletVzRH80yIlioXyDJzx2895TZXNzdqM642e2SegCKoXxVzeUpcC
         aYB+4LqqsmHvmse79snKswi0nRTyUEkPeIXM2ECqx02+BJH5YhVmcjBuPwgzqMLAxFie
         h3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752576443; x=1753181243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYn7eS/5zF73Hyol202Hjx82eXT5W+HCC/KBKDjLfRo=;
        b=hvz84nlGbrC0EUZWjjyt00CRhRBoFPJqN8Fk9mm3EoqY5pO/NmAJl9Lt9UlviyrvSi
         dCazLpsvvSZSEbwu89QdNMLRJw4HN+3m3oyF+x8aLGWEG4Jhfy8RbUFw/jvEOH0GQTLY
         A6Wkkje7XPQuTso6r4MmPFeQrgmoraX5rTUw6OGcDu0otM1PoKhdf5p2AAeDvZK0ubsm
         lmFfMBvPC70UengisFh/mS5mFFymwGlYT4Z2OiCZfw4PBhROUQMPRwM9ks3Z+oSwcFyL
         Y+gOOTbGVKpyPpBHo+r6bSKzZaj2Gv8CHh2TGfWsRSAerPHgZOs9Gb7jwvpk8eI08ePO
         sIVQ==
X-Gm-Message-State: AOJu0YzsZdT19dCwM0KMXuqUbAYnNV0yPWiCOqwcJI8jFTkTMijBIzm3
	NNSkYaLvBkn/2rBl8uummMb4c0RklQ3nSiPV4rP2FZFEWQqoSsM2PzIhBJA0l97/5g==
X-Gm-Gg: ASbGncuk9ULXeH/rLJ+Z+aE5qsGbAPx/+TN4PMqbwds11N6p1zYIA8tw4zQ9GqiunOp
	KiIAsY6fMav7CRFAKbKje0jGbjhDURXWQQ+V61puz0DONEcNzsbgkq2NZp6aJRDO+lYXY5BZfqP
	/TDPUoZPXsMpztAgFWk4ABspFpYr+Ry66QLpEuIUv9mwDLKmGcTaB0vqWHMO7PJ10fIJOt7Y8g6
	Ltq8hrBXH+9AAaAHFiN9rkf2npmQdmmfwbkyiAiIVHDHdV/H/ZLSGgv+5iY2m+YA+AD90gPzvrU
	kwLXNLPvze/aaUohP4HNfv2XsUZkZUYB3cPCXRb03i42+I0SM56Z/97+rApTUInK59Azak8nmZz
	pZoujPzYOb/pSRdmaqq79Es3TN1KIqPfL0X3gj0Utcolsh86ciALpWm14EXRP6B3+2WkGFE6u5m
	fahD8Dsfw=
X-Google-Smtp-Source: AGHT+IGRnuqAcSDBT2Xr120SHhnEj/tH2RS29YE2sKFk04J4zApJ1MwNtRvxrycBBVaAQd70HtyjKw==
X-Received: by 2002:a05:6000:2089:b0:3a4:cec5:b59c with SMTP id ffacd0b85a97d-3b6095442f1mr2584254f8f.25.1752576443080;
        Tue, 15 Jul 2025 03:47:23 -0700 (PDT)
Message-ID: <01fb45a5-0e5a-4379-8d36-ec8002739b51@suse.com>
Date: Tue, 15 Jul 2025 12:47:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/PVH: modify permission checking in
 hwdom_fixup_p2m()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <8c610e0e-6778-4d94-92c8-35b280d05b46@suse.com>
 <aHYo4kLRj9LpdaTs@macbook.local>
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
In-Reply-To: <aHYo4kLRj9LpdaTs@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.07.2025 12:09, Roger Pau Monné wrote:
> On Mon, Jul 14, 2025 at 06:09:27PM +0200, Jan Beulich wrote:
>> We're generally striving to minimize behavioral differences between PV
>> and PVH Dom0. Using is_memory_hole() in the PVH case looks quite a bit
>> weaker to me, compared to the page ownership check done in the PV case.
>> Change checking accordingly.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Kind of unrelated to this specific patch, but what's our opinion on
> turning on pf-fixup by default before the release?

As far as the patch here goes, the relationship is very tight. I came to
make this patch only while investigating whether we couldn't have Dom0
report the resource (MMIO) ranges early enough for us to not even need
such fixing-up. Sadly, as per [1] that turned out pretty much impossible.
Which means that while I'm still pretty hesitant of us doing something
like this by default, I can't currently see a way around doing so. Hence
perhaps yes, we may want (or even need) to turn this on by default.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-07/msg00446.html

