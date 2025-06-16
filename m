Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E539ADA897
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016652.1393601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3hZ-0002xr-HV; Mon, 16 Jun 2025 06:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016652.1393601; Mon, 16 Jun 2025 06:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3hZ-0002sz-DG; Mon, 16 Jun 2025 06:52:17 +0000
Received: by outflank-mailman (input) for mailman id 1016652;
 Mon, 16 Jun 2025 06:52:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR3Y7-0008OL-Qs
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:31 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12c37c43-4a7d-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 08:42:29 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-606ddbda275so8168079a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jun 2025 23:42:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4ae4d18sm5401396a12.76.2025.06.15.23.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 23:42:28 -0700 (PDT)
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
X-Inumbo-ID: 12c37c43-4a7d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750056149; x=1750660949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6Ixgi/lQfgC2ZOBDfuYOmHvXWJTuvopOJwaR7ysKb0=;
        b=WX09HKwk1WHW+ACFlQV7hpSEuquKM79vVU6DUge5pUDlIV81C60inV09M7AL13OJJV
         7/PSn8FFF9HXWAcuRO2P/za6R+NloxxBonxm7sBven5jN8vXQXApGFAfgxz9G42565Fe
         uc0Gi+H/5lwgI0nSMNv3egCpuBlo9F+R+05pc9vzO3taaag94yThCzkPK2Urjrv1zTKS
         aEPaqXaHAthV2tnEqNbJqopXLhzldBH2k2pvhcgQq5dRq6cMtFByR2dbICBJ4lXThg9x
         bb34Xsl8zVOhUq5DfzTM2lyUUhVQOMBhspSUdVrksMCjNKL9FrmECT7hnODpi9w889go
         2dFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750056149; x=1750660949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6Ixgi/lQfgC2ZOBDfuYOmHvXWJTuvopOJwaR7ysKb0=;
        b=XyOwAYo68dNT534oXD9iBy1gqdOyDdmghN3p1BqewZnXhctGCYzunaQyo8xAGo0acH
         xSBJUVpgsgsXgpkU8lZ/3vhm9iLwKqVQdpWC3C7RSkxzj7jF1fh0mPcGWtlYzEqMLi9R
         owGNjfJWQOJDjb3iHGYf2/SsxwDqkzjg1oZyzSvRihmRY1HndBPcHiR6NQlj+KhfxlC8
         uLmsJb7AeMx6GO1+Z5+1fCx/s7WX+fZiBTkFuM86yB2Hxv1mZZlpqIrO8AyvNVR01DRY
         ljq4oQ531nv5s6UwaVL/2IqlUJ+abQOvjx9IwrE5d5zjA8dIG1nmpIHn+AocqpkDaulF
         ye5A==
X-Forwarded-Encrypted: i=1; AJvYcCXfmPoDUycfXZI06ZPfrJywG0crnFCtLipp56H6WxISD7ytwg2QyHUVf5t3/ayntgE4EnsjRf66h9s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxzp5wf/H4mD2xPGjlutkhMFK/FYTkgWrSJQ6u9lYA93SVCx8ux
	gDXkimADktkgFjQntKtT29X/7J3+AERtdmUswB+j+WLDbxFZBSWtLZjACFdz2uFG0g==
X-Gm-Gg: ASbGncs7/UXsovUScmx8yPmYZffrOZLcx3XR4mlOP0F+wBAqSGGs+Q6r+Ub+z3g1yPd
	w9xyTnx3Hs6LtLnxEIrRcy9D0SNAQDVAteN+55fFATy3OA9t0P2EhtGI/OiusOJdvUEl1FfMB4b
	q4MDXSHOuZ8EpWSpXHL9NAFd73wgGiOKJU4Rt8SlzhQ6YZtdMNMLFDFMGIEOiA3jlhKIhvIFZ9a
	BCR+1GgzGnkl61ufR5XO+PqNg3EvXaupjl1f8qQfS3bz5wWHXL59kUzInWrVWrHwFQvwyOrs+rj
	pFsUakVOZHE0VRoi2VE3WdAzWMeYZVXhWbRwqL0dP0ebgO1LNpbr8JuWREFBs1at4X3YrdDkFkq
	p9TfQV9XddmZP/m2jf5fowxNhbq4QxWkfQWlC/GgmVZKTiZw=
X-Google-Smtp-Source: AGHT+IH4MjH+3C2i1Lf/yexWSVdTiqU+BK2jLxxtTbw9ny9EgGU3UI/+1v/W6qveSN3ABoVsUcZlNA==
X-Received: by 2002:a05:6402:1d49:b0:607:783e:5970 with SMTP id 4fb4d7f45d1cf-608d0861911mr6934357a12.8.1750056148983;
        Sun, 15 Jun 2025 23:42:28 -0700 (PDT)
Message-ID: <3ecf10e5-5df7-4348-85a1-b8eecb940bf8@suse.com>
Date: Mon, 16 Jun 2025 08:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250613154847.317979-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250613154847.317979-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2025 17:17, Stewart Hildebrand wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -8,6 +8,8 @@ config ARM_64
>  	depends on !ARM_32
>  	select 64BIT
>  	select HAS_FAST_MULTIPLY
> +	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
> +	select HAS_PASSTHROUGH if PCI_PASSTHROUGH

Seeing this, I like this as little as I liked ...

> @@ -258,6 +260,12 @@ config PARTIAL_EMULATION
>  
>  source "arch/arm/firmware/Kconfig"
>  
> +config PCI_PASSTHROUGH
> +	bool "PCI passthrough" if EXPERT
> +	depends on ARM_64

... the form with the select-s put here. I'll (obviously) leave it to the
Arm maintainers to judge, but my recommendation would be to simply drop
this patch. As per the description it's merely "make it easier ...",
which imo doesn't warrant such an abuse of HAS_*.

As a nit: The select-s also would better be sorted alphabetically.

Jan

