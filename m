Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2078AD39D3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010962.1389221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzKJ-0001Pk-PN; Tue, 10 Jun 2025 13:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010962.1389221; Tue, 10 Jun 2025 13:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzKJ-0001OM-MR; Tue, 10 Jun 2025 13:47:43 +0000
Received: by outflank-mailman (input) for mailman id 1010962;
 Tue, 10 Jun 2025 13:47:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOzKI-0001OG-1j
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:47:42 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 798239b4-4601-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 15:47:39 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so33047555e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:47:39 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452f8f011c8sm138911695e9.3.2025.06.10.06.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 06:47:39 -0700 (PDT)
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
X-Inumbo-ID: 798239b4-4601-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749563259; x=1750168059; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KrUvU1/a7/BiL6lFTe73Dy6Jg+5VeOIm2pPS/npSqrQ=;
        b=KqO9u9WisrpJZIDHPZYwrxku4gqeMiPlzfaQlUhkp/WWaiNH2DIj02RIzXB05fixD2
         Aqf9CishSqX9hRvuXh1LE36h1jlGsVK7+ZCG6xl7MAAJDhFmvRf+rCxSsfslv2Uu+gKG
         YKoY/MWmBymjO4hhR5ISMqk3Itk9y4l2tpr9HuaY7HyzgJsAy7VN+gJo4AIZetSOHSxH
         mYPBwDsVt2FgHu27y7z0wp096iq9nTUg1H06zsfxtVItR5g2Ue92U9ZtWP5/pUZjYgk3
         C65kr4YpFqqScSrkqVfbo5ZlBhlJxs/YgPjO7FOM7JHp/eH+tKj5D2L6nUTm+TDqKJj0
         N0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563259; x=1750168059;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrUvU1/a7/BiL6lFTe73Dy6Jg+5VeOIm2pPS/npSqrQ=;
        b=A+2ReAvJIY+OkaXz2EQ6d0OiDSKrWUv0jGex8aX34Mfl8Vwq5+8Vi5ZJ7WEAJOeMBJ
         qdVtMCHk5vLExcndG+zzEIV06l2NxWRod15x9G8ZbpuQVEoJdMqcF5gjxJYWUcKRD6AZ
         8AMQQJe9YXY3/WJoGgyVRZqXimgknrKTsNcb+heTNiFxLfk9LALBOq6pWMGq7hr9uSHX
         z/zzaIKzeLm9JmGK8qadgedKOxvKOiAMDFIt6hOGJqCOvC1TnlKu/S3rswyZfPnzD/35
         QgrGXFpjyScOHVvbWY5wrKAH+ECzBMxkOse5pVTUie6pyRXyP63VycPzxkFVhYaNEg+e
         NOvg==
X-Forwarded-Encrypted: i=1; AJvYcCXKyuyKs6/mAof80fJN77yMUDbnHCXEOb29eLZOZR/0blq9ZHXlO42554+GFq8CRovGRHVJ6OlcWIg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7NGZubv96KEWCOnw6N8bgWcEbVh/OB/mKezS3nGXe74Mle6IM
	fM33fOsaO6liKO2xRQXE4hqVKDGwkzCfX9CW3vwNrppScjp5IA3YnmNWzyezas5Xjw==
X-Gm-Gg: ASbGnctJgov6hyQRJ+Tpm7sBl7+3ZcpbHBXPM+PMTWXr57ZfDn5m0IjfLmu7yJbGqd9
	gWo8tZuvaeQ8rYdzRocSPNAdShDkxExTpv9MBgL0jCAnkyoBonVT6JERGvnggAsWgqS9pAT0Aym
	gWAIRfFMclrw9Rqu2moqY/MNEPnFK4UCFBt2lmDYdP8MArJy50fl+LcWch1vZ7ktxouBh26QlbF
	XMI+C33NOnn2iBy93o16W9CkjkeKrhQ+mTmdWCmXT2bVo3vRYRke1hJhDJw0bNFXci7IJcJ6PBq
	5TGO4GtMlris0oB5XtpOhS1NBuu0HjhSUMHvT43sHRQgKl9nh/M/Pqb3esefFlc9TbWgj20BK5u
	E+xfSXzwiq0Kr9xCVxOzQwAmqJoeYaLs/V5L1YsMP0bMXxrm3LNvR2zbX5R0+N3h/9N5Jk4volm
	J/C/4B63IVcIwfFTVWU9De
X-Google-Smtp-Source: AGHT+IET+108RstG7HFcII0VNyG2xCId9F7r3QS4hHGMgYf6p8h4pjeBvZLoGdA2xqR3QEYBssD6mA==
X-Received: by 2002:a05:600c:a10c:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-4531de00a37mr22533885e9.12.1749563259284;
        Tue, 10 Jun 2025 06:47:39 -0700 (PDT)
Message-ID: <9db2daa0-8905-4b21-8161-27b7fb96dfef@suse.com>
Date: Tue, 10 Jun 2025 15:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/20] xen/sysctl: make CONFIG_COVERAGE depend on
 CONFIG_SYSCTL
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-18-Penny.Zheng@amd.com>
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
In-Reply-To: <20250528091708.390767-18-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2025 11:17, Penny Zheng wrote:
> All coverage-related op shall be wrapped around with CONFIG_SYSCTL,
> so we shall make CONFIG_COVERAGE depend on CONFIG_SYSCTL.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v1 -> v2:
> - commit message refactor
> ---
> v3 -> v4:
> - commit message refactor

Despite these efforts the description still fails to say _why_ the
supposed wrapping is needed. And "supposed" because I can't really
see any wrapping. All you do is add a dependency.

And btw ...

> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -37,7 +37,7 @@ config SELF_TESTS
>  
>  config COVERAGE
>  	bool "Code coverage support"
> -	depends on !LIVEPATCH
> +	depends on !LIVEPATCH && SYSCTL

... "depends on SYSCTL && !LIVEPATCH" would feel more naturally to
me.

Jan

