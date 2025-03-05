Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5629A50577
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 17:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902553.1310546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tprsA-0000FV-CH; Wed, 05 Mar 2025 16:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902553.1310546; Wed, 05 Mar 2025 16:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tprsA-0000Dz-9Y; Wed, 05 Mar 2025 16:45:30 +0000
Received: by outflank-mailman (input) for mailman id 902553;
 Wed, 05 Mar 2025 16:45:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tprs9-0000Dt-0N
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 16:45:29 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3db3de94-f9e1-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 17:45:27 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43bcbdf79cdso14929785e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 08:45:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a6739sm21200523f8f.22.2025.03.05.08.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 08:45:26 -0800 (PST)
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
X-Inumbo-ID: 3db3de94-f9e1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741193126; x=1741797926; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YgLI0gPxp40QEzs/R42psTXbg4CFW79beKxgLpNh4bs=;
        b=Cvq1gbgLxTPOUmGJSQfOpoVH7OoH+6AoTUNhmpeDQvrVXtSDy1YrhehbOLPVJeBXwY
         hywegnqZwP9MKwN0ckwOZSPFPF4BPbwuYgeng602yyu3yx2rxnlg5C1BAeQL+azA/Aja
         yluxyOnYWKHM6lbZXsVq9x58YEdd1hHXVfzdooCqlCk/J9KwZQv+5cXF0Q3Snsc2xJy8
         sHY8z3bvAi4TsKiMwTGyP9iK49zzY8zMIoLx0LnXzgcSQnENHH3pX9CpN6/GIskMqd+k
         HeiK1UyAfgY/9bKk1c7mHJTo4y8rOHaKAd54iFRRKVZ2Zyjm3wFdIgVEZvugOX+Lkvbq
         deuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741193126; x=1741797926;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgLI0gPxp40QEzs/R42psTXbg4CFW79beKxgLpNh4bs=;
        b=NfwtngB3g9ja00W6iPxRSdIay9OqjKXKDD9dF82oZO9pzWgABgRS4IDSRhVLVTokfU
         SmUU8wVJZMydEmj0SS6cEnKhWrQjQlZD3hpkkecyo0Y9NrfiuNFXQym41YedU394AseG
         Lp8qq1dJn618EmMl/OYcpuJALJw/F99pf4GMNmDHta4lzpuixyEWaACJHEFBQlumMK+5
         a88kezn229Cx0NKCmqMjFLCED00772rPB8dYvbV1oazqMDe6LHXkr950csSMlk8SoBqp
         /QWQq+oti/01B5Ny4LWXrE0RmxgJg16LkLuYX1GoKVsiyN9ucV6Uuu4yUa3M9ShpGia7
         8ZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrWL0+FrXRviMRZr8JkP5f4KcUzQHlhDeQYz3CIdyNWgt/7sa50zA+M/1EmtZ3S2g29deg2gIHUKQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzs5gZ4PKKj1JTRTrR/sRLbTXxSXUU+FXO1Ygo48MnlPH5ACBsV
	DxXuZwm40g2EHypgtny8GhqBCryE35gacCMpQel6xt0qGs4Sq+hD3xRXqfG8Bg==
X-Gm-Gg: ASbGncsOTpVGLVent0zVEj3pfbc3rU3Kc5jOPHr0KGX6RhABeBYDXMZNovAovgRcOEx
	hWUU9Mp/s3GSSP3T/vjz7C2Z5DNC7T4mrmwuSLtVTJH4dSo3CNaBhzDr+GQbY5I8h6a/5+CUx5g
	MW4jZEQ7I/14JmjwrB7hirFXuy+8KxOMyFRPirt2ABl5S0sZSjTiirji975bedWHPuAZDBkyq+p
	McXfDxVaSd2eUvtUcD0fN+8pBNFg9Uj5kc5I9q0c5xN884LEzSmV46RX1R0i1FR+A0fvJ15mbN5
	eamDP7WkdJZ3G2Zsn5AQsG466OAVlrPzBrStRVoBcHYvoB6kkroTEdMrGExHnEWYQGWeSRKqeMv
	yBw1kdmAxOmATrcd2lZlg76CFE/8Y7g==
X-Google-Smtp-Source: AGHT+IEjypkST0um4vew1e/tKvb2VyVdf/NZGtjma+QVxxXLdjmct16x6xJ/jx0nmcOkNVLK0/lxEQ==
X-Received: by 2002:a05:600c:4fd1:b0:43b:d040:3dfd with SMTP id 5b1f17b1804b1-43bd29c83b5mr26644625e9.24.1741193126541;
        Wed, 05 Mar 2025 08:45:26 -0800 (PST)
Message-ID: <2caf2bc0-d915-413e-ac76-cc70f9010ebe@suse.com>
Date: Wed, 5 Mar 2025 17:45:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] iommu: Add checks before calling iommu
 suspend/resume
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykyta Poturai <mykyta_poturai@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <5694f2b73e808ebdc5d5b60a31cfad2b24f0e9d8.1741164138.git.xakep.amatop@gmail.com>
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
In-Reply-To: <5694f2b73e808ebdc5d5b60a31cfad2b24f0e9d8.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2025 10:11, Mykola Kvach wrote:
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -613,7 +613,7 @@ int __init iommu_setup(void)
>  
>  int iommu_suspend(void)
>  {
> -    if ( iommu_enabled )
> +    if ( iommu_enabled && iommu_get_ops() && iommu_get_ops()->suspend )
>          return iommu_call(iommu_get_ops(), suspend);
>  
>      return 0;
> @@ -621,7 +621,7 @@ int iommu_suspend(void)
>  
>  void iommu_resume(void)
>  {
> -    if ( iommu_enabled )
> +    if ( iommu_enabled && iommu_get_ops() && iommu_get_ops()->resume )
>          iommu_vcall(iommu_get_ops(), resume);
>  }

When iommu_enabled is true, surely iommu_get_ops() is required to return
non-NULL?

Jan

