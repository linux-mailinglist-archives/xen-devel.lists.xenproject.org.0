Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BFF9260CA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 14:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753003.1161252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOzO8-0001yl-Su; Wed, 03 Jul 2024 12:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753003.1161252; Wed, 03 Jul 2024 12:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOzO8-0001wZ-QB; Wed, 03 Jul 2024 12:47:08 +0000
Received: by outflank-mailman (input) for mailman id 753003;
 Wed, 03 Jul 2024 12:47:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOzO7-0001wT-1K
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 12:47:07 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59a324bb-393a-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 14:47:04 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so70673361fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 05:47:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e3832sm105380515ad.91.2024.07.03.05.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 05:47:03 -0700 (PDT)
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
X-Inumbo-ID: 59a324bb-393a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720010824; x=1720615624; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G8etuKWEHdiOjpRweShg+hHTVGpxKEHBN9I0fSPl9GI=;
        b=bHUM5XsgzdCLn1R0hbFogC5XgY/s227IvynZAXg+8Ov7wcu/e07k9nrFragX1p+8wT
         JE/zysfKmdu5ayekgO7ruI20YZRwDpK1IrfBdJKtviYZOi8FDmiPIhpjpJDhp4miDSAU
         5A+m+pmF/xTA1555FwgeEU6D7t2XQP4DRYe929OgGO02D3gaVqi39jd062QrNJNZtP36
         okWSoeepPjZm2WDmkK+oF99yuQAnXzLeVl60pGgBLhaQjLh/sZtl1uURaj8pX1bNiwTg
         MiWFKqUmzz8UTrVrTSo8ZL7DQ7hwvdo+svvccbQeKAZFUhmPw6xPXzA8EOocT18iiVEa
         JoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720010824; x=1720615624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8etuKWEHdiOjpRweShg+hHTVGpxKEHBN9I0fSPl9GI=;
        b=EmRcfPnpI4VUusic2ILxoaETuAyuET5aejsk13DmK6uORmqAPKuY8SpEk4WFeNFiQ0
         Ybjel1fcL5MFfd2dC0w9fW69YTiMub23HyoCU+ba0tUs/6Pj4wNvscRDOueh0PYoRC7z
         PdF7bOegOPKx5dsWxKkigF0NpzwsSrdZzs/QrUS+CFcc9aqSB1YNgeESsCePAToCOE4d
         9U+i6/nJUDZikioEw+nI3On9GnPbyveN0GMBY00dR9ffPAO45rXA+lBQ2wV1Q3MnCGNS
         UUWXvcbQNmcHsPtQMJLyrzQduv/Q/Lk9AiWuoAauO7nK+NfRHW+uwL70/tMTAZpuWSMa
         rMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4ytuFM5yacSoi0lD01JZ6U8XvVQ35Nx+R+o4NdVd3kjbLaLpL5MfZ2hVKEo8K7piHMkCK0FO+60ns8rwVU6loJmbVCpivoWYLyeHDZy0=
X-Gm-Message-State: AOJu0YzjTlWArxq38gq02MXpQAzE7A5gNNa+pprtxiqBkLTJn6KFDCjq
	9X5RUgJg65TfpKG8F59onwfk2e3X7drJnj8A2tE84ygirIip3dR7SrbTmHXbow==
X-Google-Smtp-Source: AGHT+IESFPwtIc6Pj/u24obY3+aN+2gmZjPgl2bJuGN+/MX2zcWrgbsRPLZkVmWsHzg4gUr8xhgRfg==
X-Received: by 2002:a2e:be03:0:b0:2ec:5abf:f3ae with SMTP id 38308e7fff4ca-2ee5e35902bmr95162981fa.19.1720010824178;
        Wed, 03 Jul 2024 05:47:04 -0700 (PDT)
Message-ID: <2d8d87dc-a364-4230-85c4-3aa803d01c71@suse.com>
Date: Wed, 3 Jul 2024 14:46:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] misra: add deviation for headers that explicitly
 avoid guards
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <e7e61b4486c025a1014ad09aa774dfd392f858b8.1719829101.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <e7e61b4486c025a1014ad09aa774dfd392f858b8.1719829101.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 13:10, Alessandro Zucchelli wrote:
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -68,6 +68,14 @@
>          },
>          {
>              "id": "SAF-8-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.D4.10"
> +            },
> +            "name": "Dir 4.10: headers that leave it up to the caller to include them correctly",
> +            "text": "Headers that deliberatively avoid inclusion guards explicitly leaving responsibility to the caller are allowed."
> +        },
> +        {
> +            "id": "SAF-9-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"

Patch 10 adds another entry here, targeted at headers which are intended to be
possible to include more than once. Both headers here also fit that criteria,
even if right now they aren't used that way (iirc). Do we really need two
SAF-* markers for effectively all the same kind of headers?

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -23,6 +23,7 @@
>   * their XEN_CPUFEATURE() being appropriate in the included context.
>   */
>  
> +/* SAF-8-safe omitted inclusion guard */
>  #ifndef XEN_CPUFEATURE
>  
>  /*
> diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
> index 5a78a7607c..ccd5023c3a 100644
> --- a/xen/include/public/errno.h
> +++ b/xen/include/public/errno.h
> @@ -17,6 +17,7 @@
>   * will unilaterally #undef XEN_ERRNO().
>   */
>  
> +/* SAF-8-safe omitted inclusion guard */
>  #ifndef XEN_ERRNO
>  
>  /*

Further both of these headers have guards (to cover the default case), so
"omitted" certainly isn't correct. Much like the "name" line in the SAF
entry also isn't quite correct, as in the common case it's not left to
the use sites.

Jan

