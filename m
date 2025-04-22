Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB7A971CA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:59:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963206.1354232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7G1l-0001P2-CY; Tue, 22 Apr 2025 15:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963206.1354232; Tue, 22 Apr 2025 15:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7G1l-0001Mi-9H; Tue, 22 Apr 2025 15:59:17 +0000
Received: by outflank-mailman (input) for mailman id 963206;
 Tue, 22 Apr 2025 15:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7G1k-0001Mc-3p
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:59:16 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd212850-1f92-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 17:59:14 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so40268095e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 08:59:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931c3sm15597193f8f.77.2025.04.22.08.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 08:59:14 -0700 (PDT)
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
X-Inumbo-ID: bd212850-1f92-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745337554; x=1745942354; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f+NtweL+G+1J3ZSnbT2CXDmoz0wL//KyqmqYGIcC2cE=;
        b=gLIh4Tf/AO47iHOpGMZp0BzJF+uYWky6OcLiiM7Er72imJedQJ3opmllq2XHEpb0a4
         YGeBNIzi5Px3fm5ISYVaMdBfA28NvVKd+o1Hz8Tt9Q4hjJ7+QyZm31gwkEmToXgft5IR
         hAJ9QyKN5GHRChln8+kEJr3M6TWxyaqYIuQHkQIWcUED8PmX4Zu27tnO2GYFwTfoKz6S
         08S7Mpp+c2CSJ625Q0LsCL/7Xhts0SV25uso+255UsxjXNg4vpnFL0Pfvwh/7hFVkBYi
         Ye1Fr3puMGvpxVUJHqb+nTuVbAK3UiSDGALJO6vSWYqTwfjYCVEvwH+1CCdnaN64NA/d
         PUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745337554; x=1745942354;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+NtweL+G+1J3ZSnbT2CXDmoz0wL//KyqmqYGIcC2cE=;
        b=KxgyRgF0F/Ii/t0dtOCOJEAWVC269u1xNSnhPorNMsjfEAbkERdKn7fEGasJzPM4lw
         IV4a5GY9jkr+aNjyxYUsuSMMQCSDFZLY1WL9GxJkmEgmfO+6qYNY7MdhLgg/RgPxRxhW
         RSIE7BMTcbTx+Cjik2eJCCNapWYcOl/wfgTgRvulWTrJQVaIUNK3Cxuk0Hj5ufcXlot+
         l+5VJxrxwjl3X8l5/O02EDoHl0URl+iPlWarAUJBy0rYOlJuBT40aaLiEAXWweRtarFn
         4TYfdLkku/dLuVu2Cv3pF0UB5W0w0AJKHKW2rTJ/LxwlNUXne6+wmSo8xVt1tYf5xln+
         M7TQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8vKp/V4NAqschr3TQugYmg81eZHGcUdtH8LjG405jZ4HCO/JXomJxgh9aaKpwCp1odIV5IBTZ/pQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8Lp1jYHYATfNGiK1Kofs1Md79NS6MrmAd7+v2RSSmckm+fQrE
	2JBSoCB+q79WZO8trkTn1eYHUkqsXCTK3RqXGTvNtivFoyzrfNfvBx93Vzt/nw==
X-Gm-Gg: ASbGncupp+Ag1GRndWH+UWpe1C/zErnY1B6RAueyOiNeWpNnHtZS2KVPhOYlwMjrO50
	8dz2LN1723pBHFdcDHn1dEzq69MdGMQ9jg7nbi4s75J3z3oS0Fy98uj36Ak/a96XaNZfkye9nvc
	HF5pMRJjK39r0S+k5Rd11uGnO75hRBncCk5LljBzFyJnOYRSCd9KwVyVjX4LX+zed+OF0/I+iEo
	2oZURQ39nbSuFItcqsTp4/+RdwID9rjjHYeYj8qtqUSmKh5N501tG79F1Li2e6B6vKvYhZP8bd2
	GetijBjMKEVQ97qIh9rJ/+C9KtaIgYgvamPgn3nG6Q1CSRJIto7lW4HaNhm3ueduW3RK8qEL1b6
	dg4Z6siAGtrvmvqsZ7lZPkqnxpg==
X-Google-Smtp-Source: AGHT+IGPFzG8PTSnMf0+eIZMiXBBMLbVhnqhdkIyVuyDC6R8i72HeKvNkgrTiUYyVFOv00umnYCECQ==
X-Received: by 2002:a05:6000:40cd:b0:39a:d32c:fb5e with SMTP id ffacd0b85a97d-39efba3cbe4mr13028827f8f.21.1745337554516;
        Tue, 22 Apr 2025 08:59:14 -0700 (PDT)
Message-ID: <a0ede35c-ca58-4d0f-893c-f498052682b4@suse.com>
Date: Tue, 22 Apr 2025 17:59:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] driver/pci: Get next capability without passing
 caps
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-3-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250421061903.1542652-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.04.2025 08:18, Jiqian Chen wrote:
> Modify function pci_find_next_cap_ttl to support returning position
> of next capability when size "n" is zero.
> 
> That can help caller to get next capability offset if caller just
> has a information of current capability offset.
> 
> That will be used in a follow-on change.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -55,6 +55,9 @@ unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
>  
>          if ( id == 0xff )
>              break;
> +        if ( n == 0 )
> +            return pos;
> +        ASSERT(caps);
>          for ( i = 0; i < n; i++ )
>          {
>              if ( id == caps[i] )

... blank lines around you insertion might have been nice. I may take the
liberty of adding them while committing.

Jan

