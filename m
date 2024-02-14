Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08461854A5F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 14:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680755.1058855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFDJ-0002yS-Oh; Wed, 14 Feb 2024 13:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680755.1058855; Wed, 14 Feb 2024 13:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFDJ-0002wZ-M7; Wed, 14 Feb 2024 13:22:13 +0000
Received: by outflank-mailman (input) for mailman id 680755;
 Wed, 14 Feb 2024 13:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raFDJ-0002wT-0p
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 13:22:13 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f0ff012-cb3c-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 14:22:10 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41102f140b4so15212975e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 05:22:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c294900b00410cc2f5550sm1912910wmd.19.2024.02.14.05.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 05:22:09 -0800 (PST)
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
X-Inumbo-ID: 0f0ff012-cb3c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707916930; x=1708521730; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Za8dYxhmQv5z0d1hW7+w4ZKDD4wdXQ+pZGwuqrALwhE=;
        b=RFrYuHBNprrJusHQtb35S50UoHul1BdBFFq2asEf2+c93jYKOR3BYeHcR9SkhH8Ri1
         VRlrGh04Rf4dK1wKiofmbB9P+Jb+mbqtnHAvKj5SS5DUBKf5YO05IcXkpK1PGpglbeq4
         aWJgcmquP4l8lXMtHlGRuhhAgV9i+xxwRD/DP7PxYB420FxM3LHAMF45Ef2I3VvFuP8s
         wFbWdqeMoBiMqmMqzCeZAk5dxCLrxASuNozgva8/xIrllFHMwaWnjjXPqTyN/edMmXKT
         g90Ai85XGSzcw0nhDDSvbiLHvvndDBwqz07+dqVKCN+zBNNZM0+nWa/hJXzNdqfOdwib
         Quig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707916930; x=1708521730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Za8dYxhmQv5z0d1hW7+w4ZKDD4wdXQ+pZGwuqrALwhE=;
        b=GYcaqjqSXwaD/1k4ErOceOi12plxFoqfo/QVzkG56SyrRcrGeNNdrVrWVO6Jq6EhcO
         8SOa1YcA+irhZCbZcx+m9qCdtJpD3WSR7N9U5pKdHePYnbsErdPwqQwk+jirvCUYO6bF
         sUEMkdT3gmRKRl64kdYcviTmw7JrdB+CB1G5ir+bpyOx1OabbsM0hIIipB8+qgZNw9aP
         W5Vpw2ZXu8Jcbi8HcPaqpFpsMMTTofz9/lIsvBsyNwtGHPMSrVMjVrI+ksuzcDoTaPIq
         MvO5/l9NtD1edkTW5Pl3xaCkfxbEXPTTTSRfIoxorvSefFiw1q2eP5H7GlIs4Me7OX+r
         WaoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE7bQLD+KeZcPFDEiIGY74kMoPYwwHV1PPE442sKvC4YSRaeJLh7PHeg2TWKxjtL2XXnBTFgU+amKd7XECNaEcsu+aX5mNUmrbgBPZkHE=
X-Gm-Message-State: AOJu0YzmrN1cJajYtft3l0mhP3nAoREuwlDMicxjrrwosEHdmCH0xfbg
	kurP6U5JJTu6ow8uMXQ0eblgRcAOCy6/1StN28O1p5BvbBbpVYpLCUXPWbyjCQ==
X-Google-Smtp-Source: AGHT+IEIEbq2klUpJohxXfOhdp9gJ2tr+ijQD1FJ9Iec9F35vHtTYaF8uBWf8ishWFtWSTYNEESZsw==
X-Received: by 2002:a05:600c:1da3:b0:411:c390:ea43 with SMTP id p35-20020a05600c1da300b00411c390ea43mr2020263wms.10.1707916930246;
        Wed, 14 Feb 2024 05:22:10 -0800 (PST)
Message-ID: <2416e41e-0b59-4e63-a9c2-550983b71c1c@suse.com>
Date: Wed, 14 Feb 2024 14:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] iommu/x86: print RMRR/IVMD ranges using full
 addresses
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20240214103741.16189-1-roger.pau@citrix.com>
 <20240214103741.16189-3-roger.pau@citrix.com>
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
In-Reply-To: <20240214103741.16189-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2024 11:37, Roger Pau Monne wrote:
> It's easier to correlate with the physical memory map if the addresses are
> fully printed, instead of using frame numbers.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

In principle
Reviewed-by: Jan Beulich <jbeulich@suse.com>
I'm not sure though that this fully matches Andrew's intentions:

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -801,8 +801,8 @@ bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
>          return true;
>  
>      printk(XENLOG_WARNING
> -           "%s: [%#" PRI_mfn " ,%#" PRI_mfn "] is not (entirely) in reserved memory\n",
> -           prefix, mfn_x(start), mfn_x(end));
> +           "%s: [%#lx, %#lx] is not (entirely) in reserved memory\n",
> +           prefix, mfn_to_maddr(start), mfn_to_maddr(end));

e820.c uses [%016Lx, %016Lx] instead, i.e. full 16-digit numbers. For
easiest cross matching it may be desirable to do the same here. Then
of course the 0x prefixes may also better disappear.

Jan

