Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA65C72FC2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 09:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166603.1493088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0TL-00073z-3c; Thu, 20 Nov 2025 08:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166603.1493088; Thu, 20 Nov 2025 08:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0TL-00072S-0g; Thu, 20 Nov 2025 08:56:59 +0000
Received: by outflank-mailman (input) for mailman id 1166603;
 Thu, 20 Nov 2025 08:56:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM0TJ-00072L-II
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 08:56:57 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dca6f18e-c5ee-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 09:56:54 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-64088c6b309so1042900a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 00:56:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64536459e61sm1598966a12.32.2025.11.20.00.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 00:56:53 -0800 (PST)
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
X-Inumbo-ID: dca6f18e-c5ee-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763629014; x=1764233814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wfeZAr65VZxMafVFo2X5gcWWKYJLoRBZ6L7Vh9YvTxs=;
        b=HcDoAsCUA0ThTnpAR53hmRkr4iBn/mNPvmKreODQTAAk5JF5xDJhr3y6c203mS5DYE
         KTgCAFsRso3qFPwGnc2d1CspF5OqrZX1Ei+wUuwm7FzOc9fhXamWgZ9joinCd6O7B1xt
         MbucWa+mJE0OA+O713MUsAjmmnEk1clTAcsdBDi7bv4OD0SaC0GWmZrg5gMA4x+XvP3u
         8oJPFbGyfyXvELrASV1+NS2SPzexAEtKubiaTlkEulKnyi+CNiPLjj9pGIJ5omlz3b8w
         ZSoiC2LcQXyAiCdxX0ttmUZZsyD0iVtLIXf98MgAU5m7uUKcmMzFIAKh+5HQLMDMNyBi
         yerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763629014; x=1764233814;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfeZAr65VZxMafVFo2X5gcWWKYJLoRBZ6L7Vh9YvTxs=;
        b=hI1KkcGNHzcJyWCSK+vDj14ShiSPBwzwu5GfaGQr1DjA+D8sBC0i7y4oZ3211p+wT5
         hcy9stf20PiGLsfxmEUpr2i2pu8lbRExMzfKzQT9WUMFeHYLFLwhpuZmdkJIzlHlzRRD
         P2rA/M+qtuxw0zuziLvsgmLWz5f0JaoXDE7l+G0MUf7KuFFJwV57/zpxRKzlZs9ghW7V
         w3c9UZpn2/vsupZk/QYtYMK90d60np4/UwVU8jWuWrXAhlFk2vkEcA1g83kzygSI2Il0
         76p/v+d56gueeoRkrWDWOdc0Mp7AnGVfBHXAonZdEBDit1JMkzDGIVeBsezTuiDab66R
         NbWA==
X-Forwarded-Encrypted: i=1; AJvYcCWjzfRJOM/Za81vRDRm65L3EyB2QAVPDltR7wXWn4HbC2gGATghajqA1DJIiXcBz2ZIooKmXYrrf78=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMHfZWO9o6nxc0zyGcqrcQ/eFooEqYQ+xHKcGNXHoT9yRk6voR
	pHheR78h4wcVXJf4OvXOzU1oPC2Qqtsv509x7hELZvXkVnL+eOLp8uIanVf+S6OwJQ==
X-Gm-Gg: ASbGncvRJ7JzR3zx7c/Rm4mtJmgFlrkrmSGXI2D8p6mkr9m0pghDsNvmR16wwRhJ2/M
	0Ev98GFwEMviUN51agI77Ht9F4L+CObwpoNr5QOCxkDC3/fOuZUyQdbWpwm0PgzWplUgfaO7EvQ
	xjpvTm34t0/0/0YSy8/WZRY8hWHaLVb/Q4n7jQB6EDPEFL/XHjsrp/TYY8QPgkniIJJ+NpqAGmi
	dg6oLC2sQOMyqEi6A9Lm/EiNoijaWj8C6dbveGVgEk2VitKr513DRxUzPFx6lxmbHadhUwLzE/d
	1juSC4CRmRIf1TOG0L3nCcgRNP3KEJeFotKBMfHHDMWqfjGHaV3D+pEDhcgeDMnVCiwvpMIm0Gn
	f3HXvyBCPeKIpHquR+UdOBcPL00acYaEb8DrStXxy0UM5vGoRZZ5tpFTedaZMr90ETvws0nZQ6X
	TJB/SGEs1AIQzyJt76jtx9qqAHMsWG6dc62p8JjmzAb3Wf/4JzYABmhSnTPKD1hqsJAbjFdGjhq
	os=
X-Google-Smtp-Source: AGHT+IEvQPdJKs+WD2+KJxdxEY1NXrKWP24JRsL2Q708W6N3Rr/05FAL8UL8XPMjLdjjvMMYdZ17Yw==
X-Received: by 2002:a05:6402:5247:b0:643:129f:9d8e with SMTP id 4fb4d7f45d1cf-645363e41d7mr2001856a12.8.1763629013835;
        Thu, 20 Nov 2025 00:56:53 -0800 (PST)
Message-ID: <f354c1cd-c46e-4bd2-98d6-a614029991f7@suse.com>
Date: Thu, 20 Nov 2025 09:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v4] xen: make VMTRACE support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Teddy Astie <teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251119193120.1011448-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251119193120.1011448-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2025 20:31, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The VMTRACE feature is depends on Platform/Arch HW and code support and now
> can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.
> This makes VMTRACE support optional by introducing HVM Kconfig option:
> - CONFIG_VMTRACE to enable/disable the feature.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v4:
> - format changes

Just partly, ...

> @@ -772,13 +775,24 @@ static inline int hvm_vmtrace_get_option(
>  
>      return -EOPNOTSUPP;
>  }
> +#else
> +/*
> + * Function declaration(s) here are used without definition(s) to make compiler
> + * happy when VMTRACE=n, compiler DCE will eliminate unused code.
> + */
> +int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos);
> +#endif
>  
>  static inline int hvm_vmtrace_reset(struct vcpu *v)
>  {
> +#ifdef CONFIG_VMTRACE
>      if ( hvm_funcs.vmtrace_reset )
>          return alternative_call(hvm_funcs.vmtrace_reset, v);
>  
>      return -EOPNOTSUPP;
> +#else
> +    return -EOPNOTSUPP;
> +#endif
>  }

... the #else wasn't dropped from here. If no need for a v5 arises, I guess
I can make the adjustment while committing. But it would be really nice if
all earlier comments were taken care of (one way or another) when submitting
a new version.

With the adjustment:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

