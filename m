Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D206692CEF7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 12:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756769.1165506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUW4-0003aZ-K8; Wed, 10 Jul 2024 10:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756769.1165506; Wed, 10 Jul 2024 10:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUW4-0003YG-Hc; Wed, 10 Jul 2024 10:25:40 +0000
Received: by outflank-mailman (input) for mailman id 756769;
 Wed, 10 Jul 2024 10:25:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRUW2-0003Xp-Qn
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 10:25:38 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c006ae45-3ea6-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 12:25:38 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ee88c4443eso65067811fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 03:25:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a2bef3sm30486915ad.105.2024.07.10.03.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 03:25:36 -0700 (PDT)
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
X-Inumbo-ID: c006ae45-3ea6-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720607137; x=1721211937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XfFAVwE1AnNZi74uKj6V1t67baMbe7aXEPN55MLloo8=;
        b=JAaGoiCxLoObZFgvB17DZFrct+30LOMquGfchsNbbnn+PhdVEdrc/AcKzf6w7Z2Q+3
         JRg1e2o0CzVQUCyzEB4602P9pyTWJVovcX1t30E1thS8l+uN5ulmiLOeY3HBkHCWfxy8
         mc+gLzdIhocyZrX6l7l1jKVRuKpIvXyBh7qxIuBOpAFWwbV3tRkLPIdTz6ytaqekf4EY
         0UbaFNUFn7yL27LzXteSwr2JlBKt4/k6NSyVEEieqh+3yB0LoDMu8cpo5uF9M1aDb/WB
         oYvsqFkSTU3sBhGcF+CwzdaZngypXW62qRe3mAHZytJtD6kz1J1A2iQ9JfSowRVFB18a
         OkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607137; x=1721211937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfFAVwE1AnNZi74uKj6V1t67baMbe7aXEPN55MLloo8=;
        b=mEt2+rIqekQPX21hHcjLKaiM1+y9w+yTgQMSQ1Z8LHvj+1NPuxLbH+XWW5c+za9S6m
         5trR2vadttWTlZy3s5CyXEgXk24vEOMsbaSTza5RfvC3hhbTSW/JHXldHHNBsm5dh/PZ
         0dERSPNcq2OTX7RihwHl52tJ+TmPl0IxwULqlS6fHufsQoC//aQF72R2xvmzvbvZdzc/
         wGG3giDhKgpPnnwCyfYrymg5St+9FJiXrUn4RbQHaN/JXMwObahbrr6KAdBwmgBPRYve
         8TA4NCqxs4xmg2x30FNv5hgjhdxlavoj9CEF5kOsYuF0HIsRymqxJO544wICw2OMtGEQ
         3CvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRv8ArttCJLq2VES4NQYAW5VRUtLu3FKP8VdeeL4Twz7viGczYcmupxfL/E6+2p2+PoaJMMkZBBvMJyTZmkDOitJXJX+etdK6HtuoKCPs=
X-Gm-Message-State: AOJu0YxpRAl78iVoSsB7aeJR6TfR/pspKr5i3EGxXx5rZzPcwjFN4msx
	K1U2AeWa1wx6tuv4ESRy+yQQzwn0VNViGBzer2GKaaFfxC36rsChyT4PSdvcLg==
X-Google-Smtp-Source: AGHT+IG+7GL3Wt8eL6pJs2AZSHxm59AMcAGcv18CSXvLBvMrOPQoi64oqa2LQ7liFraWQhkPkAWIEw==
X-Received: by 2002:a2e:97d3:0:b0:2ec:558d:4e0a with SMTP id 38308e7fff4ca-2eeb30e39a5mr42816701fa.19.1720607137444;
        Wed, 10 Jul 2024 03:25:37 -0700 (PDT)
Message-ID: <235880b4-de39-440c-90be-815b37a4ae76@suse.com>
Date: Wed, 10 Jul 2024 12:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] xen/riscv: enable CONFIG_HAS_DEVICE_TREE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
 <8861be6624f50c927a8dadbcf056aff2dc0576ab.1720002425.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8861be6624f50c927a8dadbcf056aff2dc0576ab.1720002425.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.07.2024 12:42, Oleksii Kurochko wrote:

> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -5,6 +5,7 @@ config RISCV
>  config RISCV_64
>  	def_bool y
>  	select 64BIT
> +	select HAS_DEVICE_TREE
>  	select GENERIC_BUG_FRAME
>  
>  config ARCH_DEFCONFIG

Same question here as for a change in the earlier series: Why here and not
for RISCV?

Plus, nit: Please keep the list of selects sorted alphabetically.

Jan

