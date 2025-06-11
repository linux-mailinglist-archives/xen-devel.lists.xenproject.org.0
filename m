Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D697AD5790
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 15:52:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011780.1390299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLrt-0000Gg-D4; Wed, 11 Jun 2025 13:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011780.1390299; Wed, 11 Jun 2025 13:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLrt-0000EP-9q; Wed, 11 Jun 2025 13:51:53 +0000
Received: by outflank-mailman (input) for mailman id 1011780;
 Wed, 11 Jun 2025 13:51:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPLrr-0000Dw-U8
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 13:51:51 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 396c3907-46cb-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 15:51:50 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4f71831abso6185333f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 06:51:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313b20078bfsm1294986a91.11.2025.06.11.06.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 06:51:49 -0700 (PDT)
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
X-Inumbo-ID: 396c3907-46cb-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749649910; x=1750254710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QpQFY/pwPoXJF2v7e0ywE6chQR56OqLPU61IAGY8kCU=;
        b=CmzU9ea6i2cBfdavosm8HSJikw3scobyCgYJOxT5Kxxo8JTRP+1sNYdHalV6M32BeT
         QQUId7WK4inZu+9kVjlWdlxwvKT+iHw6h6oWwkD/hLPlwl792lBeT/Hbq94elQ3Yamb0
         eQZpvUES/uvAjd/l9Cq0PNS5R85sKpa5KF1lFtcP864w58zNU2c2CrAItDwTeDCS/5ol
         2h97H07dSqpDnjkOExyefHgi+jyjNwJ1h1jFCDyqEbeklUeepI+vZ17/+UflScTm6Q/g
         NNg8ByHfIILGgGCWY8OE93w0oPYAezoVP/0QV/SdsY7BnJe6Znl1njN1jLAXiTdvyeU2
         yzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749649910; x=1750254710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpQFY/pwPoXJF2v7e0ywE6chQR56OqLPU61IAGY8kCU=;
        b=q0la51BeZHf/8PtTRERSQ1cArFRamOQZeKCmrixItrHDPZH2k0PuS1CPdGY6tOMPgL
         HmkvcoMo4xXN2PZfq1VR0AHU0cYWtjge1i79tDWIIEs67NxkUMoDgC+HsP7cLeopQa3E
         HeVVLuWqepd4kvU+FU82gFJnMpdw+7Y6iyNKAvE4UEM1eJMFhVPzFdXjAfuHyjwHT0tg
         4h8qI8MxjiChGvtFfRVtWBk20xsgVL1s7HpgQCPGa7rS/I9qJrotVyEghRVyydjsrFuV
         1ion7vYdpTGHzCT1Betz8lYmjnEdNkunTeFWmnVuhPELSIloc12ttAbgrMjsLCeWRviq
         4qBw==
X-Forwarded-Encrypted: i=1; AJvYcCVyqNuFUw5BHc7FVtaCHuz2anUaqg5rV7FIWWEDBL5drombKHOpLTWaDXYW/eDCr66OI+rnk4itIqg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrhZb+sElgaeoSLLV2vjYKIDvNtLQCNCN6SyMk3v9N/46aldat
	Em+2ewlkoRlRUk4i72WeFo+Yh/b8HGkVDcHmVuZ6kNLnZsN1wT4GfYTgw9gtcrzN1w==
X-Gm-Gg: ASbGncsqQ8MXHuzgU9X7AA4yoL3pLCjSgQ0fADDausqZ+O+0DWRNimGktR9tRx0OthT
	TEYv+566ibT0S0ha8BB5Hp9En2WUhE4awZjpbt92ioijhdp9JrYYKDhlSmeTgyDvAImWafRxMb+
	HpFgkhw2TX9TPuMwk+CtmFQRbwbTLWh9mywpmjgq3geheqRmyjakfAm0T+gBNXBGq/S07CPBuqG
	d/knSMq22XOCzrAmp4Mwi49C6rGds5VBMn7WpS/OVeFlm8F7anBzBZpGnbUw1NXPqxAyBDKmR5U
	j95t32q/irJk7SJ6RmYhJBuGiS5A4Mmi4/tjIg5RGF3yfl9z+CjHI6h7jt/AmHLGhKpPQwq4S0k
	V9B0707qGm0boKVavoNXiXtuyBl+DCIri9fwHv8rRbK5zuZQ=
X-Google-Smtp-Source: AGHT+IHE1tVkCkpSQoP4raO7qCpdn1Upb5f2QsFS5rc1qg9rLGBUOKNU7cqGcetpwb5j8+zMbmPNtA==
X-Received: by 2002:a05:6000:2913:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3a558af7c26mr2710871f8f.51.1749649909968;
        Wed, 11 Jun 2025 06:51:49 -0700 (PDT)
Message-ID: <89547519-9c7d-40e1-a5e1-abb9a2612498@suse.com>
Date: Wed, 11 Jun 2025 15:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] xen/page_alloc: Set node affinity when claiming
 pages from an exact node
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-8-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250314172502.53498-8-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 18:24, Alejandro Vallejo wrote:
> Set the domain's node affinity to the claimed node if the claim
> specified an exact node. Do it immediately before making any changes in
> case setting the affinity fails (even though it shouldn't).
> 
> This allows preferentially allocating from the closest NUMA node when
> "exact" is not specified (e.g: p2m tables, etc).
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Toolstacks can just do it themselves, but it's more error prone. If it
> claimed pages from an exact node (and remember we can only hold a single
> claim at a time) it makes no sense for the domain to be intentionally
> allocating from NUMA nodes other than its home node.

I question this as a global, built-in policy: An admin may intentionally
do things in different ways, for whatever reasons they may have. Even in
the toolstack I'd consider such behavior a valid default, but requiring
a way to override.

Jan

