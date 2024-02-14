Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640E6854892
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:38:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680611.1058625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDam-0003DW-Ir; Wed, 14 Feb 2024 11:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680611.1058625; Wed, 14 Feb 2024 11:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDam-0003Bi-FF; Wed, 14 Feb 2024 11:38:20 +0000
Received: by outflank-mailman (input) for mailman id 680611;
 Wed, 14 Feb 2024 11:38:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raDak-0003Bc-Fk
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:38:18 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8afe8940-cb2d-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 12:38:16 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33cd57b86bfso1221597f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:38:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e20-20020adf9bd4000000b0033cee68c31asm1334895wrc.61.2024.02.14.03.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 03:38:15 -0800 (PST)
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
X-Inumbo-ID: 8afe8940-cb2d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707910696; x=1708515496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rdxTMeHXrManeT3nC+19C4mu58aFUrs+icQiSiXCw3c=;
        b=PtVifr+hq7VFaSnvMekFZ1wif23xLDY2Xmnb8uiwO1e4kDxUhbFkVtxhewPQvBny+z
         ugZ2XeS07q3/GQhCDc92IQowpILjsYCoT2YhbYfts+lrKjkc6puH3iVNNBGfHFert2dy
         qBG61yqZzLzXeURv7MRTzR9UBkZ7eUeOUyw1V03RgxlJyAWQ9e+p4lOWPe9/5Ky/lDUr
         vzcYgo1vZYupm8X0U71YjP6Flr/55/WxsIXdGi/YydT4fzK3n8GfKgRr6sTWZ48SXN+X
         kTeKjyd/t9aRPu0t/KKTxuJrYPMSp86nQXTSCB3z0hF1ktVVI6wM9Xt7cwmQfTjcL171
         vsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707910696; x=1708515496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rdxTMeHXrManeT3nC+19C4mu58aFUrs+icQiSiXCw3c=;
        b=OfR9wHCltiAwZfEEuA55vHIZkXelrafuJ4D6zk6/g7n6BPfYv5nh+st2riWJG5Dz2Q
         M6IO+YFT3iwADWOQc1NvEgEIiCxysHhxwYfTwOaBt5Ew6k0dzw+Eq+1osmBAdV90RVjF
         67tblBTqiJ1X3nZ3RrEhfsXJ3V09fVk/iS8q2l+IdX14F4wNN2QU329Gc4Pb/BPScyYm
         sOeVYFQR2Y6R3m2IYKmqKChWafLMBKLkwEU/HNol0jT0wR7AUtyTXHAAsGpIVklSBaI1
         puaoxXemEja0J723cXRQidv5L5EnPM69KRETLi/0i2EbNG5FFoQZRuid5nNBnvcuO1hK
         Wlxg==
X-Forwarded-Encrypted: i=1; AJvYcCU1JGosb2hYihCGGriBtUcwbKF+AY8asBC6BH83i/WpRcxOGDFIdFrCD/ZSdOC63mqQQTnxrJha+iQ0AIEXb0DDw/mckBWr2mQFqRrwRzY=
X-Gm-Message-State: AOJu0YwUcJCeHtZI84vT73xSTGnXmfgTVcMdyuBA/4fy8Um6S37X8QNH
	4CQaSFMD5CeCpC5+T2eEu7cketjazmnm8/wYHLH4+V0RZTOkOkJFveIpFH6ZTA==
X-Google-Smtp-Source: AGHT+IFqfA5CdqS3bvqUK+IQR1iD91ies1WuS2Yd8o8RiqnDYywGhDViQfrSCrJecn3s2aN1pG3gjg==
X-Received: by 2002:a5d:5108:0:b0:33b:8260:ecbf with SMTP id s8-20020a5d5108000000b0033b8260ecbfmr1496488wrt.14.1707910695667;
        Wed, 14 Feb 2024 03:38:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViaO4MGoPO7IZg5plLx5X+U3+toIuqfG1lYuuzj9CUD77LaktBSUtvzhgRLsb5l2NYWUZcjum4gPNPdHEq9hLtZmAdaclXTVYwc64NTXsnjv4sD14/DFjaNchspjRwmo+LmrOnqf8mP49F3/Ua3462HYq8l97ccNp/EgYGQ8LlnrlPHn1+bOXImcUITlcBryu+f5VpD+KNjfq8Awfkpw+u0i9bYCu/WOUy26nNLd5iR0kLimcbIAwuDq29nwEPeP4Hu07mfhrRPq77YVhIJuPi+gAJCX6QYr2/yZop521Cgw5ooA/Wte69ZDq9VFTe8juiPO8wUcpXNIfDBAllj0CDyGmmKrZn5nU3rKcoXlq7Z8clbIJjIzAckTmCxxKgDwCEYEIMjA==
Message-ID: <123f4cc2-8fc7-4e2a-b44c-78a81b3a1a3e@suse.com>
Date: Wed, 14 Feb 2024 12:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240202213321.1920347-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.02.2024 22:33, Stewart Hildebrand wrote:
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
>  
>      case MAP_PIRQ_TYPE_MSI:
>      case MAP_PIRQ_TYPE_MULTI_MSI:
> +        pcidevs_lock();
>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
> +        pcidevs_unlock();
>          break;

I'm afraid I need to come back to this: This is the only place where this
patch retains (moves) use of the global lock. By moving, its scope is
actually extended. It was previously said that conversion doesn't happen
to limit the scope of what is changing. But with allocate_and_map_msi_pirq()
being happy about either lock being held, I'm having a hard time seeing why
here the global lock would continue to need using. To me doing so suggests
uncertainty whether the checking in the function is actually correct.

Jan

