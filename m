Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA71ACAB34
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:15:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003035.1382471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1GF-0007UU-GB; Mon, 02 Jun 2025 09:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003035.1382471; Mon, 02 Jun 2025 09:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1GF-0007Sq-Bt; Mon, 02 Jun 2025 09:15:15 +0000
Received: by outflank-mailman (input) for mailman id 1003035;
 Mon, 02 Jun 2025 09:15:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM1GE-0007SZ-AY
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:15:14 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14907edb-3f92-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 11:15:09 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so44355865e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:15:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afe9681asm7396382b3a.12.2025.06.02.02.15.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 02:15:08 -0700 (PDT)
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
X-Inumbo-ID: 14907edb-3f92-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748855708; x=1749460508; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lPySZfbm9D5ca0VETYqleubXSTJeG2xriOZGDql9+Vo=;
        b=BEKNLNJi63/ElCUYQr64d5LYemsBIKF4P4zrqssV7Qk4b7ID9dgaTir6XersW/hhJZ
         6kv0q1HrAfQEaGxJwOlamDFJHUgNhci8ui6oYvY6odOxjssojolvwoVoZtrp2lA5i8Iw
         ZL6EYVU64oCQohJd3i8sNz5Rzwo7wiDOc6nVWvv+wqnwRfeVMLFotYjqaie1U0nWb4O8
         OiHhsRpDAWII0yYd1ZXCl0pwFOguW0xiyxtrySndha0JrllcJOrVK9jea/iYK4iMSD8T
         h4qTZCjofr2iT/rqDMDCWHsQG/QxAk6NXDcvmCfeomui+vNd5xCS1uTHLlbGis0WSVXd
         09fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855708; x=1749460508;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPySZfbm9D5ca0VETYqleubXSTJeG2xriOZGDql9+Vo=;
        b=MtXn7Qh1KzDLkcXLfTibVc+Ab7y4v2FgkqtuopljzqoRipX4f1kXcuV67J9lxK7GTQ
         fQYIgAbkUxtzuTG/KcuJx0U0fNXfpcCT9d2vDYwqhEYxPRigSciFLqPeF9WjIplyMjIO
         6E67r4eC90qkvoZ9xMwHu9D+4Ye9nDSTKgTTO7njcL5gQMf5g0A7pdwAjNHozvg7ctHE
         qOpIl9p65jwcLMUbrmZistEfGCNKp5Tu52scuHXzKXokqSFY0ZI2qQFtDd9mV+BCsLMM
         H43L0IE3kKwMEabcF7rpHhfcQ8OnsBGNSMRAPeGuJZaUAnPZ3+IpJpbKOTB/m9EkN3QH
         wwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd5AurHEP7XN2YthIUCz6FjUN4t3hVsNPonv3ruF+n+iWPw40B6AUvX0pyXQWWtxm4C/ITyJxwuag=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvjrF3Gar771kCQJc6z8VDfMy1/MAQONV6YvpYGdbDdEayXBsv
	x9exKUV+VpaEoDKLFmYhjbH5FSBmjyekygPoM6slUP9GwuUqxsW5/cI1u03HZ3OkZQ==
X-Gm-Gg: ASbGncs1596GOUsjHnGW89EL5fiKWKkyR66m6hOkwZRoqP3w73Ckv8b2pk7K5WXiqrS
	LBVLqSiPmqZqmPV8gldStp/YkWjawqQIisc3lXIci/cJsh8QB6WA+ndEYnpHOXhGy4yeTNFgi8R
	/W0cRWvGkR2XOBgu0dufs41fXCTPPNtWOhQRc7atJXcJ+tIWY60cinoI4Qf6GcLCOt/3yvVmEZt
	HyOSZIS26Ecaz1AMZfm5RUfaCqTEQUrd0tFePlEbiBnk/rizRxJ+CvXDjGnxihh2mMGng8uFbxQ
	vvhPMJ8EAzqDsCcXv0Kiolom3PCtBV7LOmdakiNz30C5obY6cbn3PsymOM6ojDWPYNGDH8fagQ5
	B0x61Mz4cqCv8f6ggLnZX7xcd9559wYkfRYmo
X-Google-Smtp-Source: AGHT+IGZySKSZr/f1ttYZPglStKrSY8vsfwajd2hmSjJQa2zJ1RpCIsq24MLqKzl/bbV32vC8x2kvw==
X-Received: by 2002:a05:6000:2303:b0:3a4:deb9:8964 with SMTP id ffacd0b85a97d-3a4f7a4d340mr9190816f8f.17.1748855708550;
        Mon, 02 Jun 2025 02:15:08 -0700 (PDT)
Message-ID: <66ec1282-808b-49c0-872e-e440a9b9384b@suse.com>
Date: Mon, 2 Jun 2025 11:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] xen/domain: introduce CONFIG_MAX_DOMID
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250528225030.2652166-1-dmukhin@ford.com>
 <20250528225030.2652166-4-dmukhin@ford.com>
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
In-Reply-To: <20250528225030.2652166-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.05.2025 00:50, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmkhn@proton.me>
> 
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Embedded deployments of Xen do not need to have support for more than dozen of
> domains.
> 
> Introduce build-time configuration option to limit the number of domains during
> run-time.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v8:
> - dropped hunk w/ compile-time check for DOMID_FIRST_RESERVED
> - updated CONFIG_MAX_DOMID explanation
> - dropped public header file changes
> ---
>  xen/arch/x86/cpu/mcheck/mce.c       |  2 +-
>  xen/arch/x86/cpu/vpmu.c             |  2 +-
>  xen/common/Kconfig                  |  8 ++++++++
>  xen/common/domain.c                 | 20 +++++++++++---------
>  xen/common/sched/core.c             |  4 ++--
>  xen/drivers/passthrough/vtd/iommu.c |  2 +-
>  6 files changed, 24 insertions(+), 14 deletions(-)

What about checks against DOMID_FIRST_RESERVED in common/domctl.c? Indeed they
must not be changed, but when not changing them, how are several of the checks
you actually change going to be correct? (I'm sorry for noticing this only now;
it should have occurred to me earlier on.)

Jan

