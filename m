Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45073ACB160
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003476.1383036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM60U-0008Ee-W9; Mon, 02 Jun 2025 14:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003476.1383036; Mon, 02 Jun 2025 14:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM60U-0008C2-T1; Mon, 02 Jun 2025 14:19:18 +0000
Received: by outflank-mailman (input) for mailman id 1003476;
 Mon, 02 Jun 2025 14:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM60T-0008Bu-Sf
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:19:17 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90f8da46-3fbc-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 16:19:17 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a36748920cso5134224f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 07:19:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affcf9ddsm7953091b3a.148.2025.06.02.07.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 07:19:15 -0700 (PDT)
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
X-Inumbo-ID: 90f8da46-3fbc-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748873956; x=1749478756; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=deZYGG2U5VJ5yOWCKkeDQWSOnCfYxX4f89HMPGryjK4=;
        b=D4XYjuKOHNFdHG+2hLojirZeSG+bhUTJLINHQvEOQwmiKwYTvO0ilHZokX+/n9rWEq
         9sR8ZCANsSMKgn0mEvs9arl50Qut7dUXJpJAE3nast+BmTDdmCLDsaALUtFtFVrmoZGP
         9bkh/dq0oR0RYeIDz8mSI+XkSJyoFYW9q+xYbzBfyhqwwU+wZk1BjlGPBYvVJDtUa8K6
         WDHJVVlgj+zfFF3XBtUL6PlM9R+yRVEKjJYe6XTFEfmFOtN3lCbc5H6ZkcKtIHgLyb92
         8OH4g9XJvVG27G6saBhmgR7UQdJ4u7bhFYpCfeh5D41QEdUchz6GHUAZs/8aBo/9nNq9
         /CxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748873956; x=1749478756;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deZYGG2U5VJ5yOWCKkeDQWSOnCfYxX4f89HMPGryjK4=;
        b=MCsalpul+AnHwor4Yt7b/gxyYQYAKWVlQwk1iYvsPKcYZv45IDK7iOICG3rM3+9cm0
         5pDKqzde8kOMczPOd9XtY6xpFSUtGQwf7Fm7uPrQrEYeaEluRGa/oVzKXQRTuZ2/wLuJ
         ukYGCq1M+ZNFpQ9gTn3P5hb4+XbuM80E686kX+CUKfrLUmKoVF368vvLqtdqxMY/vU2t
         UyJ3WV1EYpX6ajUkeGP5vYBSL5w7Vs0MPivFkMHMm+t0qI28LdmQDdVzhOi1gtW2/oeG
         RIOC9A3OH1APJf/MXYgXbdD/jobZO5odcEq6f5OcJyn/QmKtri2dPujurBJ9u6HGa/Sk
         oDjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy1Iqg9SZUIV0RwkUHudLnxUPmFpGUaJO/7k5B9o+TytLW2t4PgHxIilyjO58xgCnSDk0+881q/4k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDdLFz9xOlvBb18DyTMZGqcbue/EabvNbWZf6DgT+hA9ywoOIX
	fowC63JUQbebFqKYkggS9KaZFE+mR07Ltsg0UlgEaUa9E+tt/ur9yRPvnIXRbQwFuQ==
X-Gm-Gg: ASbGncseV6xgVJtSzmmHYNqAPCunRcKFR+o8AiR3XlJhn3VzLRPH6TP6qJpoKUxqLPA
	byWIFEZj6VN4dCGYi5IzkqIoPkLygg0+Hbpi1Qc36Hqi5XqrZ3N0BoKn1+S4nduEQc35sX2GGMh
	BowjUXgbXEdNZ+ABcZaD00mhmdUb/B3gnavoTFQaskHNDVJFfFexDdGK47Yun8HSG1G9tV8AfqW
	COXyy6oxYz1Pg8YSE+RTiG0goVm7lsHerGmHOiSjBmRA/s4IQ+ok9ojBDqCK71nW88P3w9xsmMp
	6Qul3Ul4ca42no5wtwSJXfV7kTlIGL+kEUxu0iqXeZKHL4GKhOlnsQjYGQFeEi18IzZua4sVssw
	mOVFK0R3nxRmX4PftS9hyICUm83h4uNWnaB1v
X-Google-Smtp-Source: AGHT+IFzBnPwwWT9+jKTRkwzuZTm7jrUqTbVO6E3msnRKNbqnI3CtXn1jR97ntpjOlEZejmeHbB6gg==
X-Received: by 2002:a05:6000:4023:b0:3a4:e7d3:bd9c with SMTP id ffacd0b85a97d-3a4f89a76a3mr10077900f8f.17.1748873956279;
        Mon, 02 Jun 2025 07:19:16 -0700 (PDT)
Message-ID: <7e2f2de4-4a06-4e4a-85e8-e82dcbfa1abf@suse.com>
Date: Mon, 2 Jun 2025 16:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] x86: Add missing pci_dev forward declaration in
 asm/pci.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-3-agarciav@amd.com>
 <680c7ba4-e4f4-4fb9-969d-ecaa206e37c6@suse.com>
 <DAC3P68QEAEJ.1GIQFC7FRHKXE@amd.com>
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
In-Reply-To: <DAC3P68QEAEJ.1GIQFC7FRHKXE@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 16:01, Alejandro Vallejo wrote:
> On Mon Jun 2, 2025 at 9:48 AM CEST, Jan Beulich wrote:
>> On 30.05.2025 14:02, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/include/asm/pci.h
>>> +++ b/xen/arch/x86/include/asm/pci.h
>>> @@ -13,6 +13,8 @@
>>>                          || (id) == 0x01128086 || (id) == 0x01228086 \
>>>                          || (id) == 0x010A8086 )
>>>  
>>> +struct pci_dev;
>>> +
>>>  struct arch_pci_dev {
>>>      vmask_t used_vectors;
>>>      /*
>>
>> Would it perhaps be better to put this ahead of xen/pci.h's #include, thus
>> helping all architectures?
> 
> You mean include asm/pci.h from xen/pci.h ? Seeing how arch_pci_dev is here it
> must already be transitively included. I could replace all asm/pci.h with xen/
> pci.h instead, but this seems strictly better so you can include asm/pci.h when
> that's all you need.

Hmm, I didn't take into account that asm/pci.h is indeed being included all on
its own in a few places. IOW your patch is fine by me as-is.

Jan

