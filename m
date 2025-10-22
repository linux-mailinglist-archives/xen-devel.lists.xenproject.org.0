Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0194BFB661
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 12:26:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147889.1480025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBW2X-0000A9-9r; Wed, 22 Oct 2025 10:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147889.1480025; Wed, 22 Oct 2025 10:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBW2X-00007m-71; Wed, 22 Oct 2025 10:25:57 +0000
Received: by outflank-mailman (input) for mailman id 1147889;
 Wed, 22 Oct 2025 10:25:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBW2V-00007e-Eb
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 10:25:55 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cf95dbb-af31-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 12:25:53 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso49115785e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 03:25:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3b45sm24744773f8f.11.2025.10.22.03.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 03:25:52 -0700 (PDT)
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
X-Inumbo-ID: 7cf95dbb-af31-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761128753; x=1761733553; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Deo/e7KGWxpx8xCv39w9VAACtJH/7mAMmGKMpExsP4o=;
        b=EJsTD7do++7k8c1ht46fQmYgHi9egE5tGB0wfPYpWnWjT2vgdFBBC4fF/Iyny+Xx4a
         kmpzRWIQkQD8U7bWKU8Sf2e1G5ge2Hui4LgjksfQv53X/R6lsZ+sewjQmj0O6GdLYRc7
         jgpzqqx7NDiJfSLWB+DV4wZ4CEVz8UsFBGcQARiRo3HIuuclXhu4YLXBRpry1ky6uYK7
         TPiPcWG6uxGVdWIChxLaZNFV1c9EaBl6p74MP9nihodMvCVwl9YK+uAFsu8/K3qLucHF
         3NZJ62tRmxaa4jLDnYawVo24FA8VFbCIxe2+UV4WKvUelSo7onFXvwoDTcM/7DKIzkht
         FdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128753; x=1761733553;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Deo/e7KGWxpx8xCv39w9VAACtJH/7mAMmGKMpExsP4o=;
        b=XzeIKuGJ5Kdi1Ng3zTTlb8zI/mKJZSewYsJAcoaFmH6+kty2Jp3QktwvEg2sYX5sdh
         FafGgrD0gpglVaMt3LVlBc3vgQbfoQxMGgTQZphgtJ+0YL1itlexEDtFkmyFJdWAfu8J
         rjBQ1H+O6/kDRKBEKLdjLjuh3Kc0wh1vX5CG9oFaQrOYuYC4D/tk4iZ1TMycbMdLY4FW
         SXQTzCLT7F4llZLMheyFmXR5y+DyKTNF/kg3tTsS5tnNstYZKwCklQ7cU66SPN8v1/8k
         TxUHpZcnkf2bXR+Ua158isU/85XGlwMCYUFm14gZNNv0q17ECwuyvpvQvYG+mlmGOmcS
         IkkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV60YlFszy5WKKDxYass0hqS+wqrYcmSouZ5CpKZPiD9coDj6a2Y94hsP0g+9zCKlh/o7YUlOUdSVs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5b83pdNFDd6bj4Y2XkFO1s+BJRk/CnT0/pApS2VYReMj+sCjF
	ccOIVj3jV7iN/E6fZmKA1cQgC8ibu5lfkETmj/CfhDdjvEXx3gcxnPFJKnR/b3OODA==
X-Gm-Gg: ASbGncuXMKLRzjDjF+/GAqhB48IKgNOuFmUyy3iwlrjB23VvcT0J5WxqalVLP56gxa9
	1g4WdBMNVjOeAJFk9xxZsGAxmqt3GQ+kYidqBWFeV84sMpYBj3Y3oX/qCyK8Vw+VSt99rsN6qkm
	crbLunVOZU9AyV6g01hxw/nlOW1GGPQuNgFXDpbWRzfmPGuNOsk5izvx5u9aN3BM1H818H4jiAQ
	M1Nc5mo7/vJq6NWjmrK76YS1Mi1hkcisd2flvNdgyWGUQGjtzaHNXYGPUzAmjPUxQWLNdZWHoKC
	4QFy4J7ZQB2FSOK15RrIAERjFTZUvD/lhzXtiyU2y4QKKMHDQQzTyJqPBElGxhXryCcY1cYXsTH
	Vm/mph8UV3+AD9MOEywU961hR1FcPLNX9SdNxzk3YRVP+9+rKVvaIr5B1aM4kx20ExBdUPlV/9k
	XoIa2ILF0PJhXn3Fdn8QvyjBLs67uByPEycNGrWA9TL27EPhSee3Fevc8an8E2
X-Google-Smtp-Source: AGHT+IFZtqgtN+IRIcuTxmrbaYwvq6oACJ5EobuaVRCLdiWcMfLkaIFlUwXbNdUD3v3lD5CEiJCK2A==
X-Received: by 2002:a05:6000:26d2:b0:427:a37:ea3e with SMTP id ffacd0b85a97d-4270a37ee98mr11969385f8f.52.1761128752880;
        Wed, 22 Oct 2025 03:25:52 -0700 (PDT)
Message-ID: <8b995718-26b3-4b66-9c0f-84855019366b@suse.com>
Date: Wed, 22 Oct 2025 12:25:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: fix randconfig build problems after introducing
 SYSCTL
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Penny.Zheng@amd.com, xen-devel@lists.xenproject.org
References: <20251022043947.949583-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20251022043947.949583-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.10.2025 06:39, Stefano Stabellini wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -144,8 +144,7 @@ config XEN_IBT
>  
>  config SHADOW_PAGING
>  	bool "Shadow Paging"
> -	default !PV_SHIM_EXCLUSIVE
> -	depends on PV || HVM
> +	depends on (PV || HVM) && !PV_SHIM_EXCLUSIVE
>  	help

On top of what Andrew said, I fear this is an issue I introduced. I just sent
a fix for it. Clearly with the pre-existing issues related to domctl_lock_*()
I failed to realize that some of the randconfig failures were due to a change
of mine rather than Penny's.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -653,6 +653,7 @@ menu "Supported hypercall interfaces"
>  
>  config SYSCTL
>  	bool "Enable sysctl hypercall"
> +	depends on !PV_SHIM_EXCLUSIVE
>  	default y
>  	help
>  	  This option shall only be disabled on some dom0less systems, or

Didn't we say we'd drop the prompt? That would more cleanly be "going back to
what it was before 34317c508294".

Jan

