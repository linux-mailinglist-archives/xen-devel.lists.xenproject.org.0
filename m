Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B975BFF519
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 08:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148693.1480579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBoed-0003Fs-7f; Thu, 23 Oct 2025 06:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148693.1480579; Thu, 23 Oct 2025 06:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBoed-0003Dl-4k; Thu, 23 Oct 2025 06:18:31 +0000
Received: by outflank-mailman (input) for mailman id 1148693;
 Thu, 23 Oct 2025 06:18:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBoeb-0003Df-VO
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 06:18:29 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14b43696-afd8-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 08:18:24 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4712c6d9495so1933485e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 23:18:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caea0468sm18626745e9.8.2025.10.22.23.18.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 23:18:23 -0700 (PDT)
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
X-Inumbo-ID: 14b43696-afd8-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761200304; x=1761805104; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b3K+l+9u+SrXcW82mEq90i5jarxTBQl+wZeP97TzEx4=;
        b=LV1mxYo7wQbwQsZX3p/xJGTPRxM307pBmuJAsLwXnA77FUSk/G6vzeuCLPLnRFMNpL
         1kcGGTivQpxGJ/IGSnOuq9t6WuLrVNsY3mZ2EdHHZYGUkSkjQBL/fI2KDhM9RoDqMOTt
         My0McPFkjjLAB6BGLaoboDmQRmcVt+NKidJqALuP/FURSFKwHDwk8Edds7bfK+ZDEqXZ
         6dSiCTy8xlKMwAwJc4LThdVsx44YwwR7LFa4BOCKR3fPjB5h1/Z+0sg5SEYeHN9GJLRK
         +LHKuKpoUb8ZWPh3Pt7uTqw9u7IBXTZv0i3cMgIzTFYTMvhBZ0SacimUurfKpZjU+0sA
         KKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761200304; x=1761805104;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3K+l+9u+SrXcW82mEq90i5jarxTBQl+wZeP97TzEx4=;
        b=b05PtWQGn3+WqQHy9y2EtllnyFP08qd2PRLmCCRJk5LrLDJisQaaL7yi9dDbs/T8lC
         x6RHAWUgDmaxVnzXDf7lJw2PqlXvAc58muY14WY7Y6UCfjf9cgTc5ZFcKUDy/K/oayDQ
         +4U+38F4ok1xr2cFTH/a0/2FElgSrNbCWX9oZHlbDK5O+4LrbueB9mj4NT4YsaPS2xy1
         D7KGIGDIaOsRGuvhDpHWHgKlgnrK/H27HnCawkZS4tPn20wTUsA9TudGIKungyXzW7Rj
         fD7VJsHSzh0S1RChpVL5tjzDaSaaUOzcbXH7cFttZ7FVyONQGBHuRgbtzA2CJAIM+oWv
         E3/g==
X-Forwarded-Encrypted: i=1; AJvYcCVQrCHPmXEzDWi0/hPAIECsrhKBt1ZyKgbBBQ3krpD60b5LaMqw2OgTmUfHsCmf54aNbJh2MMQAGZk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxV5bBI/etzzlgJHqczzuKWnhXjWChmVpmAbpz8cwEFS+0Bp4fk
	1X6DeLex9kGb5WDgpU6CxzL4cktZCM2aSWWf9m9venBeo/ySGPIcwUdccvuKhEpEQw==
X-Gm-Gg: ASbGncvP7++ruxfYPRZ69Ja/5s3+zEv9XkjFAjOMbKhmNgKDR55lnnX+VEng4OZWWFm
	+cva3elPnO6w856ZLX79fHvduAUwWVeOYZ7MLtSEpY74c6SM9E7WBlUjEXHFBtlUhk/WRg2FvsF
	O673ogesMMV5puBYmzwb2tlYeWQDk8Eew3+fxnCEo+MIYgYkzmWEqjZ25YwlAzH7dsFLo7F/O/L
	Oe3oODjpvXCivrj8EPs86teef/XcFxVCXMo2GFur+1g18ZUse41PXCEHJHa8X7eJhFBJ4P2HHlY
	7XmMRcKSYBKNa9GRSpB/XZa1VuVy3rNIEDBWJxuFfWw3QC80u9eae1+dmndWwYA+Pb5WLwKGPOj
	UVPbCRAZO2po3Q/StAvzbg8OVykILtwuI2oMHuOtc2NzGLhSEEDl9oGngT9ocphjO4zBy3uF/h/
	Hl61PZvTE7IdoyC4Aq5+uwEXVD+aoPRZswK3ygAXbjAVYNDYaUhTNx7FDqpDCb
X-Google-Smtp-Source: AGHT+IGneg/F+hJVb4EpO2FwlEQ+IX7nKRkqwLYxUt7LviPR5evO0I+fEOJMsYRppFSqRtuDNwWtuw==
X-Received: by 2002:a05:600c:3b03:b0:468:86e0:de40 with SMTP id 5b1f17b1804b1-4711786c6b9mr179458055e9.4.1761200303851;
        Wed, 22 Oct 2025 23:18:23 -0700 (PDT)
Message-ID: <52452f5f-1e1e-4b33-87c5-a93f20925b7b@suse.com>
Date: Thu, 23 Oct 2025 08:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: fix randconfig build problems after introducing
 SYSCTL
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 oleksii.kurochko@gmail.com, Penny.Zheng@amd.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2510221616570.495094@ubuntu-linux-20-04-desktop>
 <20251022232131.1190867-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20251022232131.1190867-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.10.2025 01:21, Stefano Stabellini wrote:
> Fix a few randconfig build breakages that started appearing after the
> SYSCTL patch series.
> 
> First, reintroduce depends on !PV_SHIM_EXCLUSIVE for HVM, as it was
> before 568f806cba4c.
> 
> Also, add depends on !PV_SHIM_EXCLUSIVE for SYSCTL, that way the
> behavior goes back to what it was before 34317c508294.
> 
> Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
> Fixes: 34317c508294 ("xen/sysctl: wrap around sysctl hypercall")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

As before, while ...

> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -1,5 +1,6 @@
>  menuconfig HVM
>  	bool "HVM support"
> +	depends on !PV_SHIM_EXCLUSIVE
>  	default !PV_SHIM
>  	select COMPAT
>  	select IOREQ_SERVER

... this indeed is a straight (partial) revert of one of the two named
commits, ...

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

... this isn't when imo it should be. It has a benefit, though: Despite
being just a partial revert, it prevents sysctl.o from being built into
the shim binary. On that basis:

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

