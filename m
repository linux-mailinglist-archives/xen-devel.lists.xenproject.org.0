Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E6AE36C7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 09:29:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022058.1397773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbbw-0000Lg-MJ; Mon, 23 Jun 2025 07:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022058.1397773; Mon, 23 Jun 2025 07:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbbw-0000It-Ix; Mon, 23 Jun 2025 07:29:00 +0000
Received: by outflank-mailman (input) for mailman id 1022058;
 Mon, 23 Jun 2025 07:28:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTbbv-0000IR-Rf
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 07:28:59 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba336759-5003-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 09:28:58 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so22030835e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 00:28:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d866b000sm75748105ad.162.2025.06.23.00.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 00:28:57 -0700 (PDT)
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
X-Inumbo-ID: ba336759-5003-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750663738; x=1751268538; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FKprFUdM6IgTUjz1r6uxx+U1WT7rXdRqVRpmno0Jr3Y=;
        b=Nzg58kop9syWXmQMgxHi+xX3fiyfY0jtt6J3Z++iGnDzMyy8OYhXTTXKoDnOZB8gM9
         WlZ9vI4qkGEDy3pv+rLCksHK9ZHcBYgULkTxPo8djNosp8A4C4wdEoe64lBUuB4hZVni
         UW1VnhRksRZlkQe4Jbro/vSqXIDQD/ZcjAke7fdFCWcHbRf4iHFuW/B34M29yF/7OqP6
         gEELl3MCjrLD6WMF+vlKOfq4EshSCNMo5t9q1eZTDK7QkjUnCF2kD73do34TKW+bVNdJ
         OUI89HqYaORSSEtA2vwBUUjeaS4Xh782y71zvpI5pJP7c/bDEkAY2/v4L2kJXtr+2uRv
         1TQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663738; x=1751268538;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKprFUdM6IgTUjz1r6uxx+U1WT7rXdRqVRpmno0Jr3Y=;
        b=n/NleP5+/0YV8AXjAYlBzTMVUByMgakYDOeKIFy6aQy8SXfs6XooZ87YTUnjAqQtDp
         PewpNaUXDOo/bxKC3C1ukJneg2l1nkClHiYVcou4Kb0ssB6dHUEGv6R/Aco698dkQ2qN
         aNAYVtzw9xHjnTojOp7yMSYTZdEVeS+OlD54elimxva3aBHMMKspK44OMYVxWIFAhPEm
         j+IUjqZCrLmKMxBRQaZGUfuTlM/2D56dO8tDrmHD1YE+JEOQ0V4mqtiq/0j6+j7gnJFZ
         gMHFCfRKCGv8muvToYGf9bD6eLHw74qAQOYleT1Iuxkqdptu1eSFDxjGcaiN6mCrfae4
         e4yQ==
X-Gm-Message-State: AOJu0YxSZSaqGmbh9zbr2rbWBWXjRn/JYGKuWlG6uqRfRFaNLCtJmR1Y
	I0hfE2V+dZIJHtgZ6Tu72ewhRhLFS13euMmLJo6IXO43VQGI3lq7iCmcjn8J8SsexQ==
X-Gm-Gg: ASbGncvlwlnLFb/dsZtXeI5i/4IPrSGdel+AZmfNIBL6VVpB1DNI3msJPtrUm/mivaU
	RE/wCUPgEzrGAB9bgyD6KAdTrT5rNQKbihiPmy4tt2iulTjKHUuYv8fAE6+bmXoXd7dLozC9esQ
	CabG+aFP5sNu2GqYuR6M2pLGsNtqxUskGlj+miUu83FPoQ2Vxw4Bp+NDdiGN5iaOum1lnIdbeXC
	Wx1oXouypPXDM1p5ySic2KNW7tZt4SBqWcucursI2bUC5sEuK+BQAucln/6jtAP91yrJgqeTeCw
	ZJ2eRCtskKVEZg4G8y1loM9Z1DYudMdir0f0xgmxrK89EssmecGCGT35k2ru1Y8FepJ/vY/ysL2
	wjL0+8w2gVvBtQ/iM6FKWGxAJhLyj1oFk1GDaZfq57VdCTvk=
X-Google-Smtp-Source: AGHT+IE5jmjLiBDOIwcw9q8r7r0ttaD3T+WkcSIJ7OJEJFFmHqPbbY8gHmI+KtifPXlvoTl6r0Zh/w==
X-Received: by 2002:a05:6000:2004:b0:3a4:f50b:ca2 with SMTP id ffacd0b85a97d-3a6d12fae98mr7976206f8f.8.1750663738269;
        Mon, 23 Jun 2025 00:28:58 -0700 (PDT)
Message-ID: <21e3389a-dfcc-43a6-858f-ea1da4321655@suse.com>
Date: Mon, 23 Jun 2025 09:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] crypto: Add RSA support
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-4-ross.lagerwall@citrix.com>
 <aFUvtMeBDEIc8njk@macbook.local>
 <CAG7k0Er_a_19gaATvS3ycygBuGaZ9ZRrPG-iLdfUvcwfM8ne=Q@mail.gmail.com>
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
In-Reply-To: <CAG7k0Er_a_19gaATvS3ycygBuGaZ9ZRrPG-iLdfUvcwfM8ne=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.06.2025 18:11, Ross Lagerwall wrote:
> On Fri, Jun 20, 2025 at 10:53 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>
>> On Mon, Jun 02, 2025 at 02:36:35PM +0100, Ross Lagerwall wrote:
>>> In preparation for adding support for livepatch signing, add support for
>>> RSA crypto.
>>>
>>> The RSA code is extracted from Nettle at tag nettle_3.2_release_20160128
>>> (https://git.lysator.liu.se/nettle/nettle).
>>>
>>> The MPI code is extracted from Linux at commit eef0df6a5953 (lib/mpi/*).
>>>
>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>> ---
>>>
>>> In v3:
>>>
>>> * Move mpi.c to lib
>>> * Fix header guard name
>>>
>>>  xen/crypto/Makefile   |    1 +
>>>  xen/crypto/rsa.c      |  196 +++++
>>>  xen/include/xen/mpi.h |   68 ++
>>>  xen/include/xen/rsa.h |   74 ++
>>>  xen/lib/Makefile      |    1 +
>>>  xen/lib/mpi.c         | 1729 +++++++++++++++++++++++++++++++++++++++++
>>
>> Just FTAOD: all the functions imported in mpi.c are used I think?  So
>> that we don't introduce unreachable code.
> 
> Yes, everything included here is used by the end of the patch series.

What about intermediate state? It's conceivable that such a series might go
in piecemeal ...

Jan

