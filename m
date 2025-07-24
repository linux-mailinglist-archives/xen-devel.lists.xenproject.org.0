Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F86AB10CE8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:13:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056151.1424317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewhb-0000Bh-QQ; Thu, 24 Jul 2025 14:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056151.1424317; Thu, 24 Jul 2025 14:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewhb-00009e-Nl; Thu, 24 Jul 2025 14:13:43 +0000
Received: by outflank-mailman (input) for mailman id 1056151;
 Thu, 24 Jul 2025 14:13:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uewhZ-00009Y-I7
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:13:41 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6561353a-6898-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 16:13:39 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45555e3317aso5476295e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 07:13:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705779c1sm21563215e9.30.2025.07.24.07.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 07:13:38 -0700 (PDT)
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
X-Inumbo-ID: 6561353a-6898-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753366419; x=1753971219; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l7r/dxGuiW8hX+v3Np3fvN27tZ0EvygbKpqVR1FC/m0=;
        b=gmAycPCUl3VZG/Mci1kJBgd7k2J5fIrmOVU4RqA/qCiBhtBrWWWsNjh71rVIZkLelT
         zRCM3hh4ltrX6jANFYnDbCnGt6KM2PpHTMkVtqbmnJ2tfQzctYkhYUri7Wjb8JB1ShV8
         GsPPjVBaJkA+uik0k+gOldniG5nI+K/zTfzm8BG54jZruoHDX+9/YjJ8n1fz0Mxf8u4Z
         h2BLINcjmvP5jdN6xKVM2hcrEuLpVgRl+lZ/zUlQD78j/fYmT5boMd48LrfSGRXftjap
         UJPyGlLxystv0whRcoQU5i7+cW0DGutxhn/8a43tID0c7LG7dSf+NjvFFEJvTAMAO7pT
         hwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753366419; x=1753971219;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7r/dxGuiW8hX+v3Np3fvN27tZ0EvygbKpqVR1FC/m0=;
        b=QCM9pohFp03NnMkFNhuAQqFb3BMHsk5EgxsgbbqL8ix1cdPg2+zH7SV8rRBB7jfZoB
         m7h2jsbvt5U66H2f3IYiF1xsruF6hjPwSejIY6dYinCIHTIsZFKLa6uYQZambOjuEHOt
         k9JEFl3i5cMbxRHfHHoXdY5wVPk5+Tmne2B1sQKGFLiE19QTz44+ChNSFF4NvCqqgi9e
         jFWuTmMqdjcWbXnc36MLERj9sksyjjHqVEbcQyz1inOPIpiyUySHyqETnqWf2XwWIr5D
         PemD1GEvAMXYUJ5+WrWxj6G1LNxBexaMwC93FS48c+/aK/GW8eJCAEJM/ZawwPo5qZ7q
         Dtmw==
X-Gm-Message-State: AOJu0YyW1trxBa3juuSUssOjjmwLPi4adrNv2LMR1KeC5MtvHUI9H4/c
	vQBXMH0gcZsMRfHpgrKTTCLgCYyQUYMRlad+x23LSVHyOhuzOdr0YJHZJBlST9jr/A==
X-Gm-Gg: ASbGncto+X/Jp3xAfvYCSC+jBeeRmD0dQ9rkf4INmT7RKAsr5swwGsHKl4WDn4ni2Li
	Zw6nCXyXvq8CuKJgKlejBPoDoPuKjjeOl7tsgzO2+BM7zNrGbjJzZUlmWpyr7dlN6CQqAHzwsNP
	2wMHK7I2LyeNaPhSzY/xJPQyL5UlMDrlYmnBsUdwJ8RjvZLaNQGQ9vDNEToN3zuzIk5lV3vyL/r
	bOoLhceJs3fD2f/RMC3K+1M2mPwn633weVu1d5mrZ8wbarSqbXhNoXp+HEjsADAcJLofFY3RWvw
	Iy3Y1TIRDH1WLTF2w8hci9G0n0HBKxOvaOsHItfGJmxpYGIbqfqYcyV36AZf2yDCiF15i4QpchO
	nE2eaF58m1nUq9a/b6LXNHKMVuEhJ0uVXeRrXvfX/J7YMt4alkYP9P/9vspwzQQdoBaFeuVCFS0
	NtfprCjxc=
X-Google-Smtp-Source: AGHT+IFR1wBh2zhcgNY5i7oCY1PuaTFgDyEbGHKxC0ENlwi/pfht75ba7qlwF6+9VpTobkBHmweftg==
X-Received: by 2002:a05:600c:8b55:b0:456:25aa:e9c0 with SMTP id 5b1f17b1804b1-45868c954dfmr72472825e9.14.1753366418958;
        Thu, 24 Jul 2025 07:13:38 -0700 (PDT)
Message-ID: <cc9a74b4-7c2e-4bb5-8c17-3983ae79b4f2@suse.com>
Date: Thu, 24 Jul 2025 16:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video/lfb: switch to xv[mz]alloc*()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <5dce6693-0a04-4cac-8a68-929f9ae2c124@suse.com>
 <aII-rabID-mHw-dA@macbook.local>
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
In-Reply-To: <aII-rabID-mHw-dA@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.07.2025 16:09, Roger Pau Monné wrote:
> On Thu, Jul 24, 2025 at 10:18:37AM +0200, Jan Beulich wrote:
>> Use the more "modern" form, thus doing away with effectively open-coding
>> xmalloc_array() at the same time. While there is a difference in
>> generated code, as xmalloc_bytes() forces SMP_CACHE_BYTES alignment, if
>> code really cared about such higher than default alignment, it should
>> request so explicitly.
>>
>> Also clear the pointers when freeing them.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> v3: Use xv[mz]alloc_array().
> 
> I don't really get this v3 changelog, patch is v1 AFAICT?  Maybe it
> was split from a different series?

Oops, yes, I omitted the v3 by mistake. There was a losely connected set
of similar changes, submitted as v2 at [1]. I decided to rather submit
the v3 patches individually.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2021-04/msg01232.html

