Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE709EC960
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 10:42:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854209.1267469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJEl-0004s3-09; Wed, 11 Dec 2024 09:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854209.1267469; Wed, 11 Dec 2024 09:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJEk-0004p8-Tl; Wed, 11 Dec 2024 09:42:30 +0000
Received: by outflank-mailman (input) for mailman id 854209;
 Wed, 11 Dec 2024 09:42:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJEk-0004p2-3j
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 09:42:30 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c66c2dc-b7a4-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 10:42:29 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385e2880606so5261402f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 01:42:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21650ccdc7esm47310585ad.133.2024.12.11.01.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 01:42:27 -0800 (PST)
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
X-Inumbo-ID: 3c66c2dc-b7a4-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733910148; x=1734514948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LxfsH0IvaZ6DORJtKTr8c1gGWyqnf4G8nOzb2qvXqbo=;
        b=cgXFZJ0rO4fncbEUvq2gDMNlEg8eKG4+ppmo2dSt2XvKw4W3mthpuZ8hl/bmekuETw
         SP6y79NWrITgK/fa8FpKnCnzo6ZZ8HomZvs6R4Gpq+OQhtFLuZdUQsuBmKWFnpVlPp3S
         GzW4+o/fJXP1h/pTfcbs5E78uEvFR2RJUIvGIf2s6WvllhUMUhcZ7LXCXIAuiP+MtMgE
         uJ8HII67HJXX1lLwf2rYhdKUsZr5gb5HdO20frvBdZuSC28tuxk0vfEW1RWCBl4zp0YE
         bExpjHduViLoYc6rY7A68vd1stUXwCkh060D0NBBPZdQk0cAfz1P3H0okBHwH5Nog5It
         onlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733910148; x=1734514948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxfsH0IvaZ6DORJtKTr8c1gGWyqnf4G8nOzb2qvXqbo=;
        b=xPjFZ5Dp5BR1DuvNFfA9qmDfqev1V1X0UZCD+QEI/HkoI4EO9o2Msf00KqOrJojAPF
         cEIw9NiEKulyuJbFDYwfllIvVmd4x7OaEYaaqNXcSwOeHBnTVAe1rHSeCVeiFriGfVby
         ireHH9zxbG+usn/8JRmamEon0i09ytYqrp5stSgl8pb8srbgJ9jYnSBLCOtZQeX/TM3R
         q/UyYeeTBigeDIW+hDqySdpQC/dgUHyOq5M9Sq8rl3cJTDqbP+c275kp4ZgciHhbBA/2
         Bo6C8OMZOYi+9Lh3nxuAKuQuiw97IlybgFhZlIGB7DD1mVoO1Cw3B5K8US8nSQT7byvT
         ZhDg==
X-Gm-Message-State: AOJu0Ywe0D5qY3uuh0FJBv/8ZEjBPjURUAg4hQYziwojCY1vCykdPv2R
	aiFrlmAnfyH8XlUAQuZkCbez1Xk6av3jdZGTn/LdN0a8deDcdNpVRCdHCNxygiWUsbFEmEdgN+8
	=
X-Gm-Gg: ASbGnctaXYB6mpHfpUTxbjink+8iyEJ7BlwLahuDPVv6Ja838DRUEkiSXGSJos9Xc0B
	yIVxB4DLq7AmQy8MCUgEuxBFzblKcmD9y8X+TUdd2SbffdeuQ99rcYhCsFVxdR65+gBD79hhLb/
	0u1ZTJzDFg/onBp6o1EsqLfyMavTnSvri9+gL79JTS4lc/CtaSpR++gyQT5hzyi6A0dteQqcVZm
	LTDGlJm4nv3vrCa3Hg/+YnSi8low8c+1dw+/0R3FbCRonRcLA4TU6Tflg4pWJjLJsk5dgYA2ru0
	nhnefu6sBR/mM0grjsxSW2m7mQdKDa6AZZ/uFGo=
X-Google-Smtp-Source: AGHT+IF2Bab2kHi3b3WcHH/j4ZuggAGFrG5FDmLjqeDhVuPwUUjj9RZEGfR8U2RCLzzJlgOXki47Fg==
X-Received: by 2002:a05:6000:1882:b0:385:eb17:cd18 with SMTP id ffacd0b85a97d-3864cec7423mr1884699f8f.45.1733910148341;
        Wed, 11 Dec 2024 01:42:28 -0800 (PST)
Message-ID: <bf6b476b-ea70-4a73-b1a4-07f4b3714b6b@suse.com>
Date: Wed, 11 Dec 2024 10:42:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86: Add Intel architectural LBR featureset bits
To: ngoc-tu.dinh@vates.tech
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
 <20241118084914.22268-2-ngoc-tu.dinh@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20241118084914.22268-2-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2024 09:49, ngoc-tu.dinh@vates.tech wrote:
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -656,7 +656,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>              p->policy.feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
>          }
>  
> -        p->policy.basic.max_leaf = min(p->policy.basic.max_leaf, 0xdu);
> +        p->policy.basic.max_leaf = min(p->policy.basic.max_leaf, 0x1cu);
>          p->policy.feat.max_subleaf = 0;
>          p->policy.extd.max_leaf = min(p->policy.extd.max_leaf, 0x8000001c);
>      }

When I saw this change I took note of there being an omission in the AVX10
series I'm carrying. Yet now that I wanted to make the adjustment there, I
found that this code needs leaving alone (also in your case). Please see
the comment at the top of the enclosing if().

Jan


