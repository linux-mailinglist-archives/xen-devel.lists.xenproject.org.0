Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0934CA6D983
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 12:52:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925409.1328272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twgM1-0007Eo-Vv; Mon, 24 Mar 2025 11:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925409.1328272; Mon, 24 Mar 2025 11:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twgM1-0007C7-Sd; Mon, 24 Mar 2025 11:52:29 +0000
Received: by outflank-mailman (input) for mailman id 925409;
 Mon, 24 Mar 2025 11:52:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twgM0-0007C0-NY
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 11:52:28 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 748f0c2d-08a6-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 12:52:26 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so2253168f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 04:52:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9956b4sm10672553f8f.7.2025.03.24.04.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 04:52:25 -0700 (PDT)
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
X-Inumbo-ID: 748f0c2d-08a6-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742817146; x=1743421946; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K+khXC4DZhNYN5D1bIj/akz9YGOYUUX0IhWq9rqeBbg=;
        b=fuDvJrh/JsLrkvvxf1mvQeDGcuZZyFD32aXalE/DT3JdTCLpEO4KA8p7A59OXOw3Yc
         bIC2iXx5XVW24oOu6kFQtZIW1wKlTszLs2E3bUg+HWQAC2PtRX61EdR8qpfjOf3NK8xZ
         0mZspnP5ohawqhWq6lZbtu+24gVCtcTiYkyQZv+DkcZMndDxhK6k8hqrV6MH5bEVz41o
         YCOmkE/c2ql2KdiMjTLETpeFN9viU1zXSIjKlQvVijm0oYW7ZTqpljikfscmm02f1daO
         RQuAbwhAgmWB9raPWdaStm2V9TWItcPyx37UDNuf+d4dV2uF6FS1lWkna3pZBVKCpiGh
         ogAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742817146; x=1743421946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+khXC4DZhNYN5D1bIj/akz9YGOYUUX0IhWq9rqeBbg=;
        b=dt8fuBBeHa6a4yXJisMG7oMGQx0LSEvKLergsOKESU0nGbShL36cr8I14KzDO4AsJm
         9E34/8ZDbOx6v1kZbvpN8a5nGOhy6VImo4S3UbilJ29Mw/ztmZb5k8ngZtP4NYGUPVpM
         gjDb+v6aIvUzt+QAVWitG28RpxfY6INxbxK5pbExzna800TUcCJ2n0Aff1C/5bXDE4/G
         CzeIwRCaITfB8t9l0aSmmoxcQpdiR1ynB78zcI5GvcxdIPv3zZyaoSbxp+5NkNGxrg5n
         prRHyi5PmxZRrxmc7RJ1Wfuu/sFC9JU8861KM2D1jh0mck1h6Cy51T61ToupuFAnIjbt
         dJmg==
X-Forwarded-Encrypted: i=1; AJvYcCWhXlJ+pMMw2qtzikitYeh824CDI1PkbB7V/yp+wMACzC5QG7OKWugOQrviDEveJmti4LE3mHlc4WU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYRE7InXD3FJKM+OSuh06WL1CRY+vXHAzOCxq91UuxnmnYERkw
	6cObOwlI5ET/tfrF9FzhQaFPJ3Cb3Kt0TrrXOt7XQDH/rosQ7IeOcbBsKkwEUQ==
X-Gm-Gg: ASbGncuCIN467qJvWEcZis3bt+9QMkgE2KamrDoJdYRsTnuxTix4K8nX/e5nICPX/WR
	gzWPBe7i+qwwJU2aPyXZs89ZUqQXkv0tikisBX/eLOv1qxZy7iA4/d13NrsEkFWwacvBPTcKqvr
	q6/SyrO8AM9Y4ur0kd47UGC9n2u/H81ryhFbzrpm6G4/sDQJc9MwLBXMc8785ZtmEP+BHT0mbD1
	JhMWh9nmr3N7x9RJh6xd0YdBv2hK9IGRt+/ldTq0XnMIed8L5PLRoKZOaUldmHlVpdE+YTHuyio
	C9uMUVgvQ8yoI0MgNiOeu7a6pl5rG86ZFYYpbNjIu0Wd+/u6dNqzMT9jVoyeA4DgffbHTpOYFM/
	AWuQPeVVctU4cfUPOQkrFu2aNtf7NBg==
X-Google-Smtp-Source: AGHT+IHy3FkcGEm+U2gQnDBTa5rTR/TuMczIX2jictzauxDeFwAtcboHnCqPNHjnI6AfECiARBY1eQ==
X-Received: by 2002:a5d:5885:0:b0:391:23e7:968d with SMTP id ffacd0b85a97d-3997f959582mr11574142f8f.47.1742817145611;
        Mon, 24 Mar 2025 04:52:25 -0700 (PDT)
Message-ID: <c188d46e-d600-4ab2-91e2-0bb27430c4f5@suse.com>
Date: Mon, 24 Mar 2025 12:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: make Viridian support optional
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20250321092633.3982645-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20250321092633.3982645-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2025 10:26, Sergiy Kibrik wrote:
> Add config option HVM_VIRIDIAN that covers viridian code within HVM.
> Calls to viridian functions guarded by is_viridian_domain() and related macros.
> Having this option may be beneficial by reducing code footprint for systems
> that are not using Hyper-V.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
> changes in v2:
>  - changed title in Kconfig & add help text
>  - moved Kconfig changes to arch/x86/hvm/Kconfig
>  - address review comments
> ---
>  xen/arch/x86/hvm/Kconfig              | 10 ++++++++++
>  xen/arch/x86/hvm/Makefile             |  2 +-
>  xen/arch/x86/hvm/hvm.c                | 27 ++++++++++++++++++---------
>  xen/arch/x86/hvm/vlapic.c             | 11 +++++++----
>  xen/arch/x86/include/asm/hvm/domain.h |  2 ++
>  xen/arch/x86/include/asm/hvm/hvm.h    |  3 ++-
>  xen/arch/x86/include/asm/hvm/vcpu.h   |  2 ++
>  7 files changed, 42 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index 2def0f98e2..9cdcc0d3cd 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -63,6 +63,16 @@ config ALTP2M
>  
>  	  If unsure, stay with defaults.
>  
> +config HVM_VIRIDIAN
> +	bool "Hyper-V enlighnments for guests" if EXPERT

Nit: "enlightenments"

> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -507,7 +507,8 @@ hvm_get_cpl(struct vcpu *v)
>      (has_hvm_params(d) ? (d)->arch.hvm.params[HVM_PARAM_VIRIDIAN] : 0)
>  
>  #define is_viridian_domain(d) \
> -    (is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
> +    (IS_ENABLED(CONFIG_HVM_VIRIDIAN) && \
> +    is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))

Nit: Missing an indenting blank on the latter line.

Will adjust while committing.

Jan

