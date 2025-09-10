Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BE8B5183E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 15:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118303.1464141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwLAw-0000Oi-8M; Wed, 10 Sep 2025 13:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118303.1464141; Wed, 10 Sep 2025 13:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwLAw-0000Lp-55; Wed, 10 Sep 2025 13:47:54 +0000
Received: by outflank-mailman (input) for mailman id 1118303;
 Wed, 10 Sep 2025 13:47:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwLAu-0000Lg-FL
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 13:47:52 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdafa676-8e4c-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 15:47:50 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b0785be64f5so126641766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 06:47:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0783047e17sm169786766b.20.2025.09.10.06.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 06:47:49 -0700 (PDT)
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
X-Inumbo-ID: bdafa676-8e4c-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757512069; x=1758116869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KlzZsKgh7DGZHhEv5nXA4wvUDKRfHz4AixNx6MnueCc=;
        b=JGxN3Drgee6QxwkNLy5+1EiZiRI59FWa0AmqHB4g+6eSYLQz6bqkj5jbrrKDRABtuS
         OUCIeE7kIglfhMLB8nnYBNhC7hhOWCvi7ggFycgvVEZT6TSVn8kx/AUTuWHks+dE1HYm
         mM2AIWIKgWE28AeQdeQozgNvjW3ilw4lx2EwzmOM6gpsHsEv0po7wyTjU4RUylVfg3Bq
         wbABCaTluxCVCkGMlGSsn9p5eQVYojg5tUnNrO7gLHus5WE+8es8QqNjm7o9e6Zv5fBX
         nXCfnZ12bIzF2qFUvKyiKkMAv7H5l2Bs5DVwJGujrUzVO2tU7PNwv+3NcgMyM4vJxSPu
         rFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512069; x=1758116869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlzZsKgh7DGZHhEv5nXA4wvUDKRfHz4AixNx6MnueCc=;
        b=ldO9azGoGWbmGII+mxoT02UcJc0goJKNhDWNnZdMGGZM9PecK6lRhsrV+JiIHsfcHJ
         ON33SjZ8vDK0gD/WIys6h7Tco4a/8VuNZ3XS/tu6hSsj95xWz87N1E1NbQKoxgjB7+BS
         WRmEtillRGietuKzt8UNvNKtUh/Lm3xI6UUn5YrnoMLcVsADF/NNedoYkC9Lm/lS9nG9
         CvoW4fC6hscb++BK4jHViRGuqhXXSkGbf6op3fU8FC/Zvs7T0AAVp7Ct71Z4dMQJFb8Y
         pjdxg6438HAl/59UXmfQH/YesIPI/lBHaJalWVU4DKsOSPfLuSwBr72AYm83JHFWSb+2
         GnAw==
X-Forwarded-Encrypted: i=1; AJvYcCXe09NU6HTeIkUHxvlLwha+urGUFJNQT0M4G6lct9rJjnWERmrQWJ8wd6isZHll3EnTewxdO0u3EJc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8lQ5rcfNo76FAZ9yLgp0NGDV1OG+aNocCz/Glq3ROOVnWk5rX
	9Iq+aI8P353gartRUIjUWjxO2BPZ+Dp+VbEvlXSgBKIDBV452iI0jkWeUkSBMsK2TbbiyC+jwPm
	slDk=
X-Gm-Gg: ASbGncswWsy8PrkLml50XRTl1BvfYSiwZs0HJM62AOeY9OCbmjFpf07XNqlZu6+BbEr
	kv7NYSoVWkV3kWy7R5fob5wsmN4f92G85mn1kT6zP9cMjb6tl8jElvNsynrSb5jcdt0DqMiwh42
	GEdItuL8OyhW42T5ret+SpT74F1nhqhGVH3zWkCB81KD2gZ11vT+DKCUBSg7c7QleXHEcB8qIar
	T77WmYnvdCV5bihgHEmZ3n/SisWpfNpzoLSkRxYEsrkVA0tbXNDjkou78O73e0ws94/o4iqOsNg
	kJLgSMZKVA86wll8XG6CslVkXGjJhfuYJqyMqyjWemA4LV2xaGawsx5KBuXTNfwRp8Aq1VvRA5E
	bwnTII0OOKQuXLjVJWKKoO60yw3V5XmoU7UQeHvoRpMS7X2cJNSFBqOUAJ7c5TK3lVBxGyYw5U1
	rKFmfGzJlLrydHnrENNw==
X-Google-Smtp-Source: AGHT+IEyBEthlLoGAq34tX8u8D0luA+Gxjkwk2O4nub313vlmphDQGwz1/eRTqCkkDmaFOd9EBpRGA==
X-Received: by 2002:a17:907:d27:b0:b07:8930:b09e with SMTP id a640c23a62f3a-b078930b81emr258883966b.20.1757512069477;
        Wed, 10 Sep 2025 06:47:49 -0700 (PDT)
Message-ID: <e3fc8565-cc4f-4966-93a1-7e9c7eeb6891@suse.com>
Date: Wed, 10 Sep 2025 15:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/26] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
> HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
> a few functions, like domctl_lock_acquire/release() undefined, causing linking
> to fail.
> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
> /hypercall-defs section, with this adjustment, we also need to release
> redundant vnuma_destroy() stub definition from PV_SHIM_EXCLUSIVE guardian,
> to not break compilation
> Above change will leave dead code in the shim binary temporarily and will be
> fixed with the introduction of "wrap domctl-op with CONFIG_MGMT_HYPERCALLS".
> 
> Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - remove paging_domctl hypercall-defs
> ---
>  xen/arch/x86/Makefile        | 2 +-
>  xen/common/Makefile          | 5 +----
>  xen/include/hypercall-defs.c | 4 +---
>  xen/include/xen/domain.h     | 4 ----
>  4 files changed, 3 insertions(+), 12 deletions(-)

So this is still the same patch as before, still at the front of the series.
While I understand Stefano thinks differently, it was my expectation that
the domctl work would follow the sysctl one in (technical) style: First make
necessary arrangements, then expose the option for people to turn it off if
they feel like doing so.

Jan

