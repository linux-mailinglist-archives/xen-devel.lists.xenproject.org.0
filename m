Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B663A84336
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945615.1343784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2r7D-0007UZ-V3; Thu, 10 Apr 2025 12:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945615.1343784; Thu, 10 Apr 2025 12:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2r7D-0007RQ-R7; Thu, 10 Apr 2025 12:34:43 +0000
Received: by outflank-mailman (input) for mailman id 945615;
 Thu, 10 Apr 2025 12:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2r7C-0007RK-AC
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:34:42 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2be321d1-1608-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:34:40 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso7788805e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 05:34:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8936129dsm4744963f8f.18.2025.04.10.05.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 05:34:39 -0700 (PDT)
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
X-Inumbo-ID: 2be321d1-1608-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744288479; x=1744893279; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PpSHCRho24KPDS5uDi7c0ZV8GF02LgeuJu5uaKizLoc=;
        b=MZYN3jTND6WDZsQyQ519fFJBmVh/Rt5b5FLO9Wrn+wl/5AVICv7krhi3YkdPzkBY1z
         iuy1hL+aREavfZKiEhVlV/RN5qMz6suOXlc4bBiAaj4+lMM/Wj8i8PHS/bGepbvAzKy/
         lC5DIuQN8wpWq6W8uMS2b1Uor6Ml37dkfuczTsWZaf8DQXzLndtVD5Pu3X80T7OCEjUV
         tVvrHLGCvdPW8XWVmcdXQPGBwvpWPBsNzvL2TnAVHUhmXNOA65B1+3n3ca+iDowUVBOS
         phb+jUvPNbdkivkHJz16Se0Isw9ZL94stLoB096pH2Nne1Y27Il9V1f3cIpeU2zSvBbD
         R2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288479; x=1744893279;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpSHCRho24KPDS5uDi7c0ZV8GF02LgeuJu5uaKizLoc=;
        b=rHGs35J62dzuuFrvvGW+0Tzn7kCaeG+gPw2MzBIq6vdyWocGm2e1lNDvJKkKrQvcjh
         dJ3IQN6eZQPB6Li7iiSs+ctSZBqEzERJXChxfroKQ1PbRcVBGqLgYKaU5WWDpWzYBlxe
         f2PZgFfAWMrZTIiyaAwNljunzOjPETYaWLZHDhXci8yPsGX6oBvxprWETVpG2Cf9L75P
         UV8ejMLXMt2Xf24oaPxBjh50Oppi5JVqttfKEcli0rdyMCfycpJn4BBtcQcnXfeAt+5a
         zKzHpHiXDJkXLR6xS50DOO/8pMcFP1w/ERCXYo7BH1+f82aCJ/HKWxRcJhAuWPyzZVIr
         zryA==
X-Forwarded-Encrypted: i=1; AJvYcCXfHH3FNKJp0cRsdsxoVIEm25CvRBSdILxEvG34sKrGXwA2ojmHLTJC8r26WV3QhE8esQ9wDSuz33A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWqPdOIqAE0mIK8zzoYApcdHx4PoSzo/GqpDTl9zIrbgWwkERZ
	Yx5bWfYbaD23Qvnknx0QMPmZY3j9PVkKTtWTz76zoY3jGARuhKVarSCIBhUr4Q==
X-Gm-Gg: ASbGncvuYaObGx6ziEnEP+RY8QNxp590hp5vBvjf3wjb8qYiGMMAsvJ0JXjpsKsdFCO
	VAZ7irKYZenmZteKeizf0hKg5djPlJ4iF8OwK1HCwGOdH8sG3k8Vl19P1OHzDAcNbU9VDTWGAbS
	RUVAikmEehX4j6NZc0PJwfrb9nNRVZ5+QWKdYAbWv/ciaL7iNzAkLbVe1xmlHLtuPO/50SEcmuV
	r6PC4c++3GwMOAHNCBcbC7CmqJCYVwxq1YECLqEMpstqtDYQGUR8vpchlKZ0lOgkdJZejypwn5E
	R0V7u9Au6gNbPYdQwR6G3/6/2XdDce+nstlL8/cXY6G8c75yqC5E0bZlXLDKbc+1d9gAXIHngGt
	9XTxytHPZ2CbsGV3SFeZQcHrAAQ==
X-Google-Smtp-Source: AGHT+IHeU3Y93PZfHnGncFC1YzIUxkvmNw+tc7eMNQoZ62aQL8WGP1I5J59Cqpbp8E6jMSWzlCeIPw==
X-Received: by 2002:a05:600c:4e09:b0:43d:db5:7b21 with SMTP id 5b1f17b1804b1-43f2ffa3bd8mr19047175e9.28.1744288479618;
        Thu, 10 Apr 2025 05:34:39 -0700 (PDT)
Message-ID: <5a18ae61-3ffa-41d1-aa1d-dce4d3ca0381@suse.com>
Date: Thu, 10 Apr 2025 14:34:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] driver/pci: Get next capability without passing
 caps
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-2-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250409064528.405573-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2025 08:45, Jiqian Chen wrote:
> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -40,7 +40,7 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
>  }
>  
>  unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
> -                                   const unsigned int caps[], unsigned int n,
> +                                   const unsigned int *caps, unsigned int n,

I don't follow the need for this change.

> @@ -55,6 +55,10 @@ unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
>  
>          if ( id == 0xff )
>              break;
> +
> +        if ( !caps || n == 0 )
> +            return pos;

Checking n to be zero ought to suffice here? In that case it doesn't matter
what caps is. Plus if n is non-zero, it clearly is an error if caps was NULL.

Jan

