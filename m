Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0D8A5EEE2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:04:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911567.1317981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseU2-00046x-QW; Thu, 13 Mar 2025 09:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911567.1317981; Thu, 13 Mar 2025 09:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseU2-00043r-ND; Thu, 13 Mar 2025 09:04:06 +0000
Received: by outflank-mailman (input) for mailman id 911567;
 Thu, 13 Mar 2025 09:04:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tseU1-00040S-Pf
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:04:05 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cf72aac-ffea-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 10:04:04 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-394780e98easo435232f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 02:04:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975ae2sm1444798f8f.51.2025.03.13.02.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 02:04:03 -0700 (PDT)
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
X-Inumbo-ID: 1cf72aac-ffea-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741856644; x=1742461444; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QLb9SvDcJYcYI9npm3qVyxvtMdC1ronRdPgBMppdVjI=;
        b=KnV2/3wnMHZka4D+6ujks+1urGw7JRBxMS03KOa+pjud8w9uV72AGuQ2FIKz19bH1V
         QRdF+O7DrvbMkSffLfSla4MYj3BVVFntgo8YwlNvA7GroDyqSfTawABe7+uKpKQnj7iA
         JePhd3st7PQGCaP2ttKi7PD2h4W2C5lbMrZWjutjlR8vhTGTUUlS19kexN3cXuzRFapK
         VkzjMfYWYl2TrSCarLrt0viXC50GCZI+Q56f4gAcBv3tS8s9k71tuz+2lAvIo3B83CXb
         Ln2PGQS1dm0ARgXsfGQapBLUIErTGPixS9pRmXlgFVHflaaCQIQZS9xke8wLbGNyACQg
         qY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741856644; x=1742461444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLb9SvDcJYcYI9npm3qVyxvtMdC1ronRdPgBMppdVjI=;
        b=l0NaX4UUxmKlar5/6x7oLtrmm4dx2orpYSOLtOVgD6VvvF/TsmqAUqSwFS4QGk2dMU
         dyL4J8zq21hR8tjUpnUqOcONFk5embLlKY6Qnwa6RLBJ1aJCkQom8I5UbY5cPyxGpzpP
         X7V0NrGwocv2PdhdO6HULgbbUMEsSyIgoL/q5a08kuriiKPQy1YO2uoEbXneUxV8wcEJ
         tQNuREtf17UyWJAcYii3djW+HEcY6CZ7McJmh9pdYUyF+eVvCeWlwB4e+LP+3FWUwuoF
         3GaNDt0PYub87YQEZ6/F4rHTDieRDzJHn4huuyEQxALVMtqF66XUHHWk7yWF8W4eOtXw
         GQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoB+t3nFA8zvX+qcm9ZSA7CGpC6U9tHPxrXTospyOHjHIydGykvbmurwyYutgVxqnmTN2u0aFTgYw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJxgp+CMfgnxGbJMkwJqwePB1uUOYycg7pGxpZ0nmigrbastO/
	VuXvVXhG8Zutm03B6m5ztIi1PTtOFcLf+tYT3IxUb4jWJd3xE0YxOyNID1KsuQ==
X-Gm-Gg: ASbGncumYceW5VQj8cRM2UhunwwkXhvNA8GJHczXJan5yOPfHoA4HRCLaLeuyjLVcg9
	EhS+0UDJUv5NMBoI4aKCmQMuxAp3ozkhHXYPHGf96C1rRh6pQqVThSUrTDgjnbaWGmTQILSUNwS
	fan7ORn7C+STpg2nDHn156VGtqCNVz8mGbYt+e7rBv6N1PaVkDmS7yJzekTsVrqI+ekoW/p6B5l
	Zum9BHDprjzlZH4ZnYy7lH3EjTCtmRqonBteRuc+V5oU+X2HdCpN3DsKgy9RudDRK/BeSraXa7Z
	1Xl5wiUEykZCwrO9vl3Nbv2/+8xMlhzmMN+BTFHSila+pMrt10/noAHLjcIEERiKhKxyrCEqcYd
	4vZcymI2mCC46gdQ90tq/IBGYawKPqQ==
X-Google-Smtp-Source: AGHT+IGE8hpuITFsDl0yfkhJ26cQ5sdvI55EyWWvJyr/MZA2TjyqWyqPEngIN741pjrCrfktok3gQg==
X-Received: by 2002:a5d:5f8c:0:b0:391:22e2:cd21 with SMTP id ffacd0b85a97d-39132dc547emr16806654f8f.36.1741856644128;
        Thu, 13 Mar 2025 02:04:04 -0700 (PDT)
Message-ID: <59587bc6-a72f-48c1-a6bc-f026bff4c437@suse.com>
Date: Thu, 13 Mar 2025 10:04:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 17/19] xen/sysctl: wrap around XEN_SYSCTL_livepatch_op
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-18-Penny.Zheng@amd.com>
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
In-Reply-To: <20250312040632.2853485-18-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 05:06, Penny Zheng wrote:
> LIVEPATCH mechanism relies on LIVEPATCH_SYSCTL hypercall, so CONFIG_LIVEPATCH
> shall depend on CONFIG_SYSCTL
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  xen/common/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index fbaca097ff..583972f7e3 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -426,7 +426,7 @@ config CRYPTO
>  config LIVEPATCH
>  	bool "Live patching support"
>  	default X86
> -	depends on "$(XEN_HAS_BUILD_ID)" = "y"
> +	depends on "$(XEN_HAS_BUILD_ID)" = "y" && SYSCTL
>  	select CC_SPLIT_SECTIONS
>  	help
>  	  Allows a running Xen hypervisor to be dynamically patched using

Here and in the previous patch the title doesn't really describe what's being
done. Earlier in the series such changes are titled "xen/...: make
CONFIG_... depend on CONFIG_SYSCTL". Whereas "wrap around ..." patches add
#ifdef-ary.

Jan

