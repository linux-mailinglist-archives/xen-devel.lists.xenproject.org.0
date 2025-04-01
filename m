Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C53A77A20
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 13:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933894.1335734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzaDq-0000xS-F1; Tue, 01 Apr 2025 11:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933894.1335734; Tue, 01 Apr 2025 11:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzaDq-0000vz-CN; Tue, 01 Apr 2025 11:56:02 +0000
Received: by outflank-mailman (input) for mailman id 933894;
 Tue, 01 Apr 2025 11:56:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzaDp-0000vt-Aa
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 11:56:01 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47541fa9-0ef0-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 13:56:00 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso2022445f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 04:56:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e37bsm14134846f8f.61.2025.04.01.04.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 04:55:59 -0700 (PDT)
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
X-Inumbo-ID: 47541fa9-0ef0-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743508559; x=1744113359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5Cp52t05p6c9+E1C9W9DHeiCq8Tol7n5ayhxWb/IgnE=;
        b=PO3sCpr1cs1kvBApYjoabmlhp8cAIHmZsuxGTh6tpC1k+j4xHrdhu0CN8kGEUGNsuc
         XM1TBH3dxIH4yikaukGlkxYW4+en4lvTBDJj+HexFmlt9KS9uXj2/uiENHizLkPPU//k
         8H5VsSD364Q8qOMYzV0lU9oYBR2EUTPm/DSg6tHnzdlDwRLjSyERxcvmfsswYPN6SjDf
         v23lviEaslzgf1U1ncYJmwZDy/bxwOfg1/ypqZR6zUDYjnXwKY1Zy+cfHxSDPNc2QNlg
         u58KhwJ5M79FC4QIMsdmm5JpTnwJgsP6E9o44Nm3yqKO9PU+RPZj+ZAof8+u+V+fT4kX
         oEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743508559; x=1744113359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Cp52t05p6c9+E1C9W9DHeiCq8Tol7n5ayhxWb/IgnE=;
        b=bKMUniD8kYdori0lfjm9JQpOjlq8TfnnVyROjGVLCX+3ewNYnOW9aKymzfG86UixiF
         OMFPiD2GdIzb3zUUggE7B1Tdd1RuU7sXo2ZreiDVxyh1JIF3dM1sbzP8nHOszygw9ipG
         ruFIohZKJKmedE5wH+rps73cj/wZZzYr3/kjHV7J9SjLD992dYzVhAj/k+VFp9mrz7x9
         1Wnl6DHtWaED5qfq+oE8BEwa9rpL6YBjyp8ltC7QmeeEkFblcp30dd0rpuFy49XwdLmu
         hdvppY5FFHzCAz2YOmDG2HMWISlO57wW8KsaEgTVc2mbylY1ZbMpUX+lW5vYi5VOzODA
         gbRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW85DuNcqigkwnuVHrCxRjNmW1chudLTiUun85NgvdVZecUpwgcVspmbff8AfOR/3+6MQ9CKUkcTiE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzS5qRJvIEJQajxj7gXfm7gOvDDLKpMKlr0mUVOKuCUr05DFuBz
	IXhbsJtpJ//v93t20CzI9aDXi1m4KEFUXh0FFXvFMnd77KfyUBu0aFqA6nH8FA==
X-Gm-Gg: ASbGncv7oGdLcrhW0DeYA6pPrJSD4r6ldVMZ5W5g0jyzwFgmQC6bhMFgasoVtm5VYpW
	mkTMz5ctvSmOyWO442dkThwe2KsIyBa4Zj3jpuu+g+wz9tNJxrP/C0IjdrBQYmV8IC6dxJ+NOt2
	R4W+oqJPXQIfJ15+IjQ4EGjIFoIK+Ii81ObX+catU3rwuisjhb3y7gCXoOmagncUL9Oe3UDE631
	wmFvmHMabahYepDEqERqyMSvbYqkgZJLSz7Bt5HaeTD41GHyaWhHSWCDyVzUT6h8/zJWx9EWvel
	+XQ8XA1OBwP06vZT41/tBuYaVTpARZDY/w7hGrczlm4PMxgK5tApYHYMykOdHkqc3mTTs1Nt+E6
	mvsf9inZ9rU7g87s5aSVKN2CiOrw/5g==
X-Google-Smtp-Source: AGHT+IFUn3Ss9iELqvfjjCosozs5UytbBYMIKLZY4y9Mu1QSsRFCGYEj9J3P0zEmb09vMambw/gQdg==
X-Received: by 2002:a5d:59ae:0:b0:391:4389:f36a with SMTP id ffacd0b85a97d-39c1211cf8dmr9665980f8f.48.1743508559557;
        Tue, 01 Apr 2025 04:55:59 -0700 (PDT)
Message-ID: <690122f5-5e11-4d3f-a5a1-55c6c4f2051d@suse.com>
Date: Tue, 1 Apr 2025 13:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 Penny Zheng <Penny.Zheng@amd.com>
References: <20250401085858.2228991-1-luca.fancellu@arm.com>
 <20250401085858.2228991-7-luca.fancellu@arm.com>
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
In-Reply-To: <20250401085858.2228991-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 10:58, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> ARM MPU system doesn't need to use paging memory pool, as MPU memory
> mapping table at most takes only one 4KB page, which is enough to
> manage the maximum 255 MPU memory regions, for all EL2 stage 1
> translation and EL1 stage 2 translation.
> 
> Introduce ARCH_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
> MMU systems and x86. Removed stubs from RISC-V now that the common code
> provide them and the functions are not gonna be used.
> 
> Wrap the code inside 'construct_domU' that deal with p2m paging
> allocation in a new function 'domain_p2m_set_allocation', protected
> by ARCH_PAGING_MEMPOOL, this is done in this way to prevent polluting
> the former function with #ifdefs and improve readability
> 
> Introduce arch_{get,set}_paging_mempool_size stubs for architecture
> with !ARCH_PAGING_MEMPOOL.
> 
> Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
> field is not required.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com> # arm
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # riscv

Acked-by: Jan Beulich <jbeulich@suse.com>

> @@ -114,9 +115,25 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c);
>  int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
>  int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
>  
> +#ifdef CONFIG_ARCH_PAGING_MEMPOOL
> +
>  int arch_get_paging_mempool_size(struct domain *d, uint64_t *size /* bytes */);
>  int arch_set_paging_mempool_size(struct domain *d, uint64_t size /* bytes */);
>  
> +#else /* !CONFIG_ARCH_PAGING_MEMPOOL */
> +
> +static inline int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
> +{
> +    return -EOPNOTSUPP;
> +}

Arguably while "set" will of course need to fail (perhaps unless size was zero),
"get" may be fine to uniformly succeed, reporting back a size of 0. But we can
switch to that alternative model whenever a need arises, I guess.

Jan

