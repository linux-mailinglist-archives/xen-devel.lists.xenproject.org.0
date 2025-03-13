Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68309A5EF37
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:12:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911634.1318040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsebd-0008QB-Oy; Thu, 13 Mar 2025 09:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911634.1318040; Thu, 13 Mar 2025 09:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsebd-0008Nu-MI; Thu, 13 Mar 2025 09:11:57 +0000
Received: by outflank-mailman (input) for mailman id 911634;
 Thu, 13 Mar 2025 09:11:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsebc-0007bp-31
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:11:56 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3596a9a1-ffeb-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 10:11:55 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso4111145e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 02:11:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188bb81bsm13575885e9.23.2025.03.13.02.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 02:11:54 -0700 (PDT)
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
X-Inumbo-ID: 3596a9a1-ffeb-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741857115; x=1742461915; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vxDq+DkpYrIwhhbgdQ4G/zV9HPhE8hwM/jJDiycXjZc=;
        b=M9oTBMWcvABNwLIHnMq7CfaKR+187rEJF+MrIu5jFGy8tweYmQStQjQ/JcJQMNWJVB
         L83UptJE32zIRbYCI0MBKjhi9wpcNgK8D1Sh1eaNeCeExjwRPhYl533VG7ipxB1k9LfN
         wtDljuW6mip/ZbSHCDnzltfztMi1zo3McNk7HywBOh6JKlFtLOwb+hm0+MntQjuo6207
         OeJORsktxt+jibVTdVajdS1HXrQxoPSBsSu9/DGhydvOyRmVpju5N1vBhLyLjwWrlYr4
         iBK6ojf162HI0iLgC8J616jY1MKKXjtrmALYTN0Oy4RByilQqArwjZJd5wR42mXnIc3Z
         I0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741857115; x=1742461915;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxDq+DkpYrIwhhbgdQ4G/zV9HPhE8hwM/jJDiycXjZc=;
        b=EdzgeW4Rq5gXne6d1cmmI2ItYSpCl6ynELnaKDfAJOV66u/hZlwnsL7x3XQ8Ul9sFm
         Kwdxwl3PGEuXDF+9Y8ctLytjkNIkz6X2vrY8sJ0jqDsaztaiyWjID1dxPfoDHiL9hgTV
         29vuoadj9DXHi27Pdf+1Wa+DIz9CfRWXRFuyIjrlpaic1qLrWyTgoEyvw8awrbaQhuy+
         evOoMIDFOhGO8N+LUrLxrTvWj0IJhLD64rs3kpvjqfy6dcfstn2r3dX7AzSc+gBPuC2b
         Z+QrvIhcbqkzkeIHypLeGSNpEXo/XSECkKW5AIodpydkoN3prd74G/U8Vv2HBJKCloHB
         s2HA==
X-Forwarded-Encrypted: i=1; AJvYcCVj8JQihWA2OJrOZP1VYEGF1Rg+0FIqJB7GPs3Q5HeElI+G6N0XUkWh2/QX9WZ1AGFOW48FGgcQXpk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSkMcejlPmOkAczB3EKWITJc/1Z+NDpZ25yOXuA/NaJAfoAG+k
	WKUstmvZ+VFW9tIRDicgJ3dou1y8BSwd402R5jsehx5WaNnpkgN6yZHxBfWkbA==
X-Gm-Gg: ASbGncvgPPGiyqA3j02MHwZ4VR0cc4MCFFHa2tkS0oq+BY/OrwRsB+0QcQoVj/5Hbg0
	gX5xXMzudtu83SYZWxE4Die55Ja0HGKO0f1lHnpy711a7f6th7ffkOpoPZLcQqarsI+huAyQbB7
	9GZDl8QZSD7TF8yJ0730dJoPnMkWPutUzGPTKGVjmzRDMqqvQeVwjrdWy8UweeR3lALpMEhAssD
	ANL+zPHfp1y6Jav/iSKj1uWdB78eD4dp2DNgMjYtcS7Nt2mmtu/h/K4q1g+Hz8kQMbyFRygqAzQ
	OsA4zcHW33LHhCyOlp5pQlOBtZj+4UrhHfsDsDmk7Td4flykNeuH1zqZjJVU9RU7uTHLeQMuUb2
	DlzjfDBo/9FQzSJIbHJEX5BxyA0MgXA==
X-Google-Smtp-Source: AGHT+IHBTM73eHHbGaQ+x20DZi7bDxL9C2ltOhwMLMZt8PsiKCqz8uaQjnlp+OC4AEluLjcklfIPaw==
X-Received: by 2002:a05:600c:4ec9:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-43cfe154363mr121172855e9.6.1741857114873;
        Thu, 13 Mar 2025 02:11:54 -0700 (PDT)
Message-ID: <5c9937a8-e6e7-404e-a22c-6a7979ce9c73@suse.com>
Date: Thu, 13 Mar 2025 10:11:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] xen: Sort includes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
 <20250312174513.4075066-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250312174513.4075066-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 18:45, Andrew Cooper wrote:
> ... needing later adjustment.  Drop types.h when it's clearly not needed.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



