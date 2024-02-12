Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3534851713
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 15:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679607.1057116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXOi-00037n-1C; Mon, 12 Feb 2024 14:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679607.1057116; Mon, 12 Feb 2024 14:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXOh-00035h-Us; Mon, 12 Feb 2024 14:35:03 +0000
Received: by outflank-mailman (input) for mailman id 679607;
 Mon, 12 Feb 2024 14:35:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZXOh-00035b-Dn
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 14:35:03 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e755cb15-c9b3-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 15:35:01 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51168addef1so6051704e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 06:35:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b004103e15441dsm9030017wmq.6.2024.02.12.06.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 06:35:00 -0800 (PST)
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
X-Inumbo-ID: e755cb15-c9b3-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707748501; x=1708353301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6gEYb1jxsMWXtKwF6u0NDJaCWqocr8nDIy4nudqDl5o=;
        b=QCwWLs3SYK1hacYmpOTRmKg3ve5s4PPbWTakRIldQFSsmhXPgJksaC6y1rZuM/Yu1n
         WV25Byosr8u4AVGCayWeHZBxjnQRaJXQfh43JRGS119AgPixZbPpb5GHoNSkdapHBlns
         sT3hoN8Cg+itMDpg1pXem3dDpT51zL4RlvV5+GeiRYti2yhzOGUibDjSmjZhUE83DcSo
         caOeUtFBceLJsurnA+R82PmdFLNUm2WVPc2L8HjWs3kyIM7ASEv8CyJOaTLAeux4ORNv
         Om2C91/F2yp9FiJQk0it7QfA+zIMEoThibXkVkg2HR5kQole7JTb5VBEIOWmkj3jQFS7
         H+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707748501; x=1708353301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6gEYb1jxsMWXtKwF6u0NDJaCWqocr8nDIy4nudqDl5o=;
        b=ju2yKGQQUsI5AMaRg5cTOsfQsKO/QXhAJdX6G6q7UORXyc+PvWJqquHzwC1xBCvKq1
         aXifo788SbTeAINVPKZ/95954TxLFt36yHPIrw030QArD8tJWvo1a7Xz3x2hrcz1dbxD
         EK1o9931PGXi1LjvgcN3zQ6+2czfKZ5Yl2cf8QFCkzMuDMTOoLm3h8OLEmdUTKOYhUtQ
         KuJ98KkzGGMurDp4odiYm1S3huiNgqJMgtD3Vf+nHdqMzhL/ECABuZY9ulESrbCHLDnK
         kElWhjQvbYj7TFSgS8x6bJRkrmjT4njxNMT6JFpkn3tILjU7o9avtKL9KGgA4UUIB4qW
         8tSQ==
X-Gm-Message-State: AOJu0YzRdyvc7+e/ViERL84K8CZc6kmTriR27fNR9hYOeTCtdJpsJsp3
	BEpP9hBX8vAN7JKhJeY9WWshtL/kWVCOraw5QJ4N/rLPgIz6ZW6+vDeV4Dr2Fw==
X-Google-Smtp-Source: AGHT+IFk6QGSFeMFijkPxDn5Z+1qmzUQp12IRBkVxhoA/KxuR8U066Oq17YtzYPGOQznQ8bCYa9Qfw==
X-Received: by 2002:a05:6512:2806:b0:511:5482:398c with SMTP id cf6-20020a056512280600b005115482398cmr6114520lfb.17.1707748500923;
        Mon, 12 Feb 2024 06:35:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7ImEJEN58yuvB/XCHbfcR3WQbJ79EmNJdB+NKIqVwCup7XbgbvYuXLlPM0ZkG3dbtq/XM4zMH6t7IEzBoQnjZ1lqa7cUpm20XXGXtD/QYZYNEMJHChrH/GUCbacUs6y7RUfNMNBhQhg==
Message-ID: <ee4b4d25-e6db-4265-adc4-4080784495cf@suse.com>
Date: Mon, 12 Feb 2024 15:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] iommu/x86: introduce a generic IVMD/RMRR range
 validity helper
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20240207153417.89975-1-roger.pau@citrix.com>
 <20240207153417.89975-2-roger.pau@citrix.com>
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
In-Reply-To: <20240207153417.89975-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.02.2024 16:34, Roger Pau Monne wrote:
> IVMD and RMRR ranges are functionally equivalent, and as so could use the same
> validity checker.
> 
> Move the IVMD to x86 common IOMMU code and adjust the function to take a pair
> of [start, end] mfn parameters.
> 
> So far only the AMD-Vi side is adjusted to use the newly introduced helper, the
> VT-d side will be adjusted in a further change.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one minor remark:

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -792,6 +792,52 @@ static int __init cf_check adjust_irq_affinities(void)
>  }
>  __initcall(adjust_irq_affinities);
>  
> +bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
> +{
> +    mfn_t addr;
> +
> +    if ( e820_all_mapped(mfn_to_maddr(start), mfn_to_maddr(end) + PAGE_SIZE,
> +                         E820_RESERVED) )
> +        return true;
> +
> +    printk(XENLOG_WARNING "%s: [%#" PRI_mfn " ,%#" PRI_mfn
> +           "] is not (entirely) in reserved memory\n",

Would you mind if I re-flowed this to

    printk(XENLOG_WARNING
           "%s: [%#" PRI_mfn " ,%#" PRI_mfn "] is not (entirely) in reserved memory\n",

while committing?

Jan

