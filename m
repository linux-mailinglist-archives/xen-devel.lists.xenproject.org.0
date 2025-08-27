Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513CFB37A9D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 08:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095560.1450516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur9t6-0005Jl-MD; Wed, 27 Aug 2025 06:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095560.1450516; Wed, 27 Aug 2025 06:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur9t6-0005I2-JV; Wed, 27 Aug 2025 06:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1095560;
 Wed, 27 Aug 2025 06:44:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ur9t4-0005Hw-Jd
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 06:44:02 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3610f611-8311-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 08:43:59 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61c24250b38so6359992a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 23:43:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61caeb5e786sm1208340a12.32.2025.08.26.23.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 23:43:58 -0700 (PDT)
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
X-Inumbo-ID: 3610f611-8311-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756277039; x=1756881839; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kva50/iuKuh3vScpyXnXEKsr/F93KQaLdAcN22zL2h0=;
        b=S4r8cHYuTVYbUnt2oG02N1yzFBseXtqrbtKWDohiQ0kW8p64M6Gvbb5judGt7Ug/vR
         ZZvzakh9O9lD0keA7rm+daf7qNudtuBtpKgVCVCRMwiCxI1+Cpw4gBziGLU1XjvWxTvN
         Ld8ghfW7ga9l0HSJ/ITqWbtG0baklGTjxVgH6kUxdiPbg1ywnGxZ4eOlAvvAZK4gC9vu
         GJghFS7hc+zHPa5MDHfz5zu4bkssv1srd2gpM2ZlYBGwqTcN+qzo0ynw40tEqvkf3OVX
         7ZvSQ+YTvNCO93STmlmyohpVzA3tKqWtOxDpt6I08kJ6yX3/mAOAd8lQysLFiCr8p2bL
         bD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756277039; x=1756881839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kva50/iuKuh3vScpyXnXEKsr/F93KQaLdAcN22zL2h0=;
        b=sIXTPEKN84Gsv3SuSKnnkrwldv6zYPuj4eLrg5DYw+8VyI1iMF+8lobV1TLiSd6n4B
         KO1MdzA2R6Dp+pJ0SgxMBPpssF0YeqtWR00BavvrUaBqEM5Lk5l7H/MhlfqYNgeR+hPU
         8jn0zxrcrSubUOodIGoqbG+TJ3n2RYCoxGM4+JJBuOMs+YF3HWF2kDCfSt2AoxK+i4se
         x678Og9s5GYzERPmzG4wMK9cHmd9r2pgoN7PAu1A4drDWkT930wNm8dEnjPYbPGqmkPY
         agHv9eo23JSr6ZFfv4yHtosx5xy45qHchw9HixWdNisLOx1e9CcIpCQyRNfzph6as+wd
         3D3g==
X-Forwarded-Encrypted: i=1; AJvYcCXaqyHMUEKvyhMhubqakVLEdJyqyImUr5iZwg+JMW88Uvj34nKjYLuFMALQYNzU4KkPiNDTlkBEdPU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxB51BMVJLEVWGdoCdNuPI6xPdHO7//TWiiiEviUcUo4pjatvKC
	h+aM9KP1F5DIuJqlQMXDdV/G/YGbFBKFvkHVNYNKFK2pneYMEYnmdMipR7P26ssbCQ==
X-Gm-Gg: ASbGncsMKhdvVBv/VVXQQ1bnjuQ4dr3rdMmGm4aXiRdOYWYhZoCAJb+A5aCaJ1imOUs
	NDavmK00kqWa0RkjXQCbtwDFxl85Z0ALlMn/iZcdZYcjsFyz8ZaCnXBAwITNkt/QczbQqGOVXGu
	TDrMgtPxtOKPVnF87/kOk2uUu1nE79SkJ37c8VoGDCOJAWZ97+c1pm30Wpz23YCUP4xtqNeiV8t
	kl6+x1DIH8fdtSy6QMSmHBt5vVmuh3L0Uu8iM+AfsWDImmk+EBM5q+mWyWyGSNDZO0j8nMP9hmb
	P63Fv49Mn9u2lO7sYjYUKmlP01Zhdk2eZ4I1Vl1adAwli96THUhAYgJueA2kOCyjVTergSJUcy0
	e4avsNwAXLQcdFCf2t2t1GEU6QBS+MooFzAYPwyU+6EGZmeFW0zFQn620ukctx4L1WoFlaSvh0l
	iUEZ0GJXaqzKK97JE2cQ==
X-Google-Smtp-Source: AGHT+IEn6NjPes3SnlemxBQoWfFsYjcgIUM2dbjHSO2XdLjnPyfYwfBs84QsFiE/qbSSYyTHEiAeYw==
X-Received: by 2002:a05:6402:278f:b0:61c:8c63:a942 with SMTP id 4fb4d7f45d1cf-61c8c63adafmr4990822a12.23.1756277039008;
        Tue, 26 Aug 2025 23:43:59 -0700 (PDT)
Message-ID: <ab709d2a-ea06-452a-a3f7-a93065b39835@suse.com>
Date: Wed, 27 Aug 2025 08:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <f7b4112aad84162c25f96a9d6db43a0c2ba85daa.1756046023.git.dmytro_prokopchuk1@epam.com>
 <60022d5c-1a9f-4a6d-8df2-bca57cefcf59@suse.com>
 <d9e9deaa-fa3e-4f4a-aa70-772af4bc1371@epam.com>
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
In-Reply-To: <d9e9deaa-fa3e-4f4a-aa70-772af4bc1371@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.08.2025 20:07, Dmytro Prokopchuk1 wrote:
> The situation with functions gicv3_do_LPI(), 
> gicv3_its_setup_collection() and config CONFIG_HAS_ITS is little bit 
> different.
> The compiler can do DCE in case when config CONFIG_HAS_ITS is "y", and 
> Misra R2.1 violation related to these functions also can be resolved.
> Actually, no changes in source code need for that.
> But Eclair detects these violations because config CONFIG_HAS_ITS is 
> "n", and source code is really compiled with inline stub functions (with 
> BUG() macro).
> This is because config CONFIG_HAS_ITS is "experimental/unsupported"
> 
>      config HAS_ITS
>              bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if 
>   UNSUPPORTED
>          depends on GICV3 && !NEW_VGIC && !ARM_32
> 
> and to enable it need to set additional config: "CONFIG_UNSUPPORTED=y".
> 
> I tried to test it (added "CONFIG_UNSUPPORTED=y" into 
> automation/gitlab-ci/analyze.yaml file). You can see my CI pipeline:
> https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/rule_2.1_gicv3_its_host_has_its_v2/ARM64/11144854092/PROJECT.ecd;/by_service.html#service&kind
> 
> Unfortunately, I observed +6 new violations with that additional config 
> "CONFIG_UNSUPPORTED=y".
> 
> I don't know how and why these EXTRA_XEN_CONFIG were selected in the 
> file 'automation/gitlab-ci/analyze.yaml'. And are we able to add new 
> configs here ?....

This has been a repeated source for discussion. The present selection,
afaict, is pretty arbitrary. However, in your considerations on how to
address an issue, imo you should not look at the present config. Whatever
the solution would better fit all possible settings.

Jan

