Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE186A3A215
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891982.1300989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQ6F-0001li-6d; Tue, 18 Feb 2025 16:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891982.1300989; Tue, 18 Feb 2025 16:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQ6F-0001iz-3Z; Tue, 18 Feb 2025 16:05:31 +0000
Received: by outflank-mailman (input) for mailman id 891982;
 Tue, 18 Feb 2025 16:05:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkQ6E-0001it-FV
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:05:30 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c66d196-ee12-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 17:05:29 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e0373c7f55so5870390a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:05:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece287cebsm8866972a12.74.2025.02.18.08.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 08:05:28 -0800 (PST)
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
X-Inumbo-ID: 2c66d196-ee12-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739894729; x=1740499529; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CWR/A5C7DkMRXL1Ow215cWAbsE5uQpfn6tq0Qem0b2M=;
        b=IqTEnclfu1psUrvFj4Nho51eSvu89eoOBeQlT8ujAr5TXC5LiqikbFhE1o83IjGC5j
         wFCrxN3g5ogjOfus16UtokWS439YwN+smN68vrA6+lUP1KcIzLJ5Kc2nj6nXSxUzvP33
         KTrc/DgaW51Xm/vSYUAgQJEkEsOUqsthIY7No3DNpY5epyGqgDi383ACUnyE4G5LkWrn
         VpjE8m00dlwV1WA3H5a5wsBuLlB2Cz5EdwyKEoZPiRe6ByuLzddBsLhHDSmvW7ulxjGB
         uN2SAT33l3KaXn5pakYhY3aVc0lQ44O0MsTDdTUlU3YbgaNjzSHdOu918MXF5xxm55p9
         zymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739894729; x=1740499529;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWR/A5C7DkMRXL1Ow215cWAbsE5uQpfn6tq0Qem0b2M=;
        b=k1g16LDCGRF2+1S/DsdWmo1NjMmOb2R0nTfktNSeVxvdnKxm25id9jh+m2sTFoOgHN
         eBtSJ/XG+D3Mde/G2HfDJLRKEYcfeiSxcO+d51TQ5reKMqaG3jJHcHmtKnHbAToZKspR
         nW6FEAOqrDiujydb1kXLcyqh1P74QjHFuuFXP0+6dwQ8wai7p7elEvxXMMDYWAbC8cVa
         Hp718sJ05IDPGXkMy8JlqA0UvbSM5su3Hq1WtAFrDGjitpL0Uzv/4qo/KPkydc0QPsZ7
         IAW2v5Fit/7Fi9EAbvmd1Io5oCnyIlqK1cTemGpAaWDt7iLuIqlCGCIcFsCjIYY/C9zR
         13Cg==
X-Forwarded-Encrypted: i=1; AJvYcCX/dHr3m/KBpG7HUPx/6UoUiLp/lZoJmCqrNGxY8SLqjDghxGPc9hHUQQOl3aRYagjzZ61URv7QtW8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzobaPmRsEEdKZux6PsBjacZLYmerrwWJuCUr7nPAsywUYXc7fq
	Z/1S233+MrOgaIbq1K04OhQkSvL5bnAyxlaQrkAye8e8DqfgxuYZnA5m4Oqa+A==
X-Gm-Gg: ASbGnctWnqU4netoUs+HEYf6EEmLLF8wLD7ECey9EkIMhsLKfj8Gt96MdM+nWUWbYdf
	cYIR9glB68el1YP//6zb2GFwKi1dYeq7oMuP8lyOaU8/Nmwg7FU5rkKm4ebpRT4SsNRwF86z8pW
	JQZQLYWE4Nbf2ch6zw12oQPOeE9cxKwMoS+NNCrs4x8vxSpiIR0u94Ku9J3mbqooGQjGUPI+Xfb
	67B7nkN146KIEJqdl1K9zErv9Im1bzYnmGtDAX1+VKuuDtGlOiRpp8UhNb3kZWxj6yGEeBmda47
	cplrUgdPNddb/CQDzI9XccJ+B88Yf3KH7DSkYfEZTx1SHO+Xg1ba1vKjavMxge0neEiOY2EGTbj
	r
X-Google-Smtp-Source: AGHT+IG+g7igGr54Yl0Yw6s3+4irdamqTTc/2vEwTuz5Sn+VUGso3+0mpjGKrBKPpdD1XnglJzUpig==
X-Received: by 2002:a05:6402:2399:b0:5e0:4a92:6b34 with SMTP id 4fb4d7f45d1cf-5e04a926cc9mr8233663a12.12.1739894728852;
        Tue, 18 Feb 2025 08:05:28 -0800 (PST)
Message-ID: <4203576f-0b93-4647-9983-e36c15fa1d0c@suse.com>
Date: Tue, 18 Feb 2025 17:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/console: make console buffer size configurable
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250212222157.2974150-1-dmukhin@ford.com>
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
In-Reply-To: <20250212222157.2974150-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2025 23:31, dmkhn@proton.me wrote:
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -96,6 +96,18 @@ config SERIAL_TX_BUFSIZE
>  
>  	  Default value is 32768 (32KiB).
>  
> +config CONRING_SIZE
> +	int "Console buffer size"
> +	default 32768
> +	range 16384 134217728
> +	help
> +	  Select the boot console buffer size (in bytes).

Why in bytes when ...

> +	  Note, the value provided will be rounded down to the nearest power of 2.

... this rounding is done anyway? Why have people type in complicated numbers?
A granularity of 1k would already be an improvement; yet better would be if
this was a power-of-two value altogether.

Jan

