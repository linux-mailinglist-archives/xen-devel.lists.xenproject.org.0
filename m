Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035308B0C9A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 16:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711485.1111482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzdfH-0007TH-60; Wed, 24 Apr 2024 14:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711485.1111482; Wed, 24 Apr 2024 14:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzdfH-0007Qs-2T; Wed, 24 Apr 2024 14:32:03 +0000
Received: by outflank-mailman (input) for mailman id 711485;
 Wed, 24 Apr 2024 14:32:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzdfF-0007Qm-Dc
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 14:32:01 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68661b9d-0247-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 16:31:59 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4196c62bb4eso40835235e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 07:31:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c4fc300b00418f7605249sm21928157wmq.24.2024.04.24.07.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 07:31:58 -0700 (PDT)
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
X-Inumbo-ID: 68661b9d-0247-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713969118; x=1714573918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=87wjHftih3QXzAfKs2aqDQQEj4PuoX9exVdz3dCnOdI=;
        b=aXuyeFpmBq1cYQkKXJmwE+aNSDg65rPOaVCE70deqv5+7vlXyFsbQsogw+imwIq3HR
         4WypgttEWj97jnU8tSQZtUtLRYlFqhyoDBN2Djg6HkYXdOULTtgjl2l74GRnSUM4U3gU
         7831ZousxU1XswhGrqZSDyaDy75IFBz8smz5pUw6s3E92gNgFLFbmFGMzgGBtMFp5apq
         JogouSlth9NJ9a/o/xbpcGdryjviRS9GonG5tXBGLH6MkwjGX4lIfkH9ngD7qEptCSno
         /bC91KuDCODsD4RW2jKN9J2G36uwCWm1irZtKz7d9Z/+KJP2smRPLnYQp6WGjS1vGHY/
         VV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713969118; x=1714573918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87wjHftih3QXzAfKs2aqDQQEj4PuoX9exVdz3dCnOdI=;
        b=PtK3Dry66ZYuWNXd8v27Cbi5RJTONQKpwsxmV5IUvXuTB7KqOv8xwbfycTtJOlFHiP
         KMxKe1qfu3Q3wl0wMQU8ZhNcnjULsU7XsjvBTlVqQcv9M3WT1Q2RrKXn29DkVxpHAwnm
         eg3UPiARTMLkTaocbx/VaCPKOLmclL5o/ljBQbiw5tmArrQnP6TKV2Y9hDHTveWY93Ae
         hbjZPm0D77oHaf3ifwbgU57UfwvMiOnnOazxKFASXIXQdhCCGR5v7G1G63rRNRxmNhyr
         F0lmsLTE1c7tFp+ZfuBIJCyYHgE2oXpkDpfagN89n6wV0pT3IcbI6GYAPcpQ/MAwjF8Y
         tghg==
X-Forwarded-Encrypted: i=1; AJvYcCUKkJViLMX+L+8DIqz9Hm2LisCx9OXXzNvfvgKKzWC8elg3CERbPg5vTeqPTWrAM9h0HsA/mp48z7nJFsV50eGzq/7kaE19teg+NP2CQ0I=
X-Gm-Message-State: AOJu0YyBrz4/a2Q8kLm9nmCPaudf6ozZbu6m8XCyQJW2b4Ac/Fm1qaZu
	U1uRHuEzCjvVKTKtRvoxZT7LiGGK0lMAzInEfwqCq/+G7ur0P6rT2gLVXG6yAA==
X-Google-Smtp-Source: AGHT+IGAfh2s91WnxbM6n6o3QkWIDAwJn3tPvCm68YN32bxEy0+267wvF5TI9yZs+KOQRY6TLoabyw==
X-Received: by 2002:a05:600c:470b:b0:418:e0cf:dbfe with SMTP id v11-20020a05600c470b00b00418e0cfdbfemr2165027wmo.15.1713969118557;
        Wed, 24 Apr 2024 07:31:58 -0700 (PDT)
Message-ID: <728372dd-eacb-4c13-9f75-4acc6f3e1d0f@suse.com>
Date: Wed, 24 Apr 2024 16:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 3/3] x86/iommu: Disable intrerrupt remapping if
 cx16 is not supported
Content-Language: en-US
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713433029.git.teddy.astie@vates.tech>
 <1623ac82177790d57c6acce3b88ba2960ac11837.1713433029.git.teddy.astie@vates.tech>
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
In-Reply-To: <1623ac82177790d57c6acce3b88ba2960ac11837.1713433029.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.04.2024 13:57, Teddy Astie wrote:
> All hardware with VT-d/AMD-Vi has CMPXCHG16B support.  Check this at
> initialisation time, and remove the effectively-dead logic for the non-cx16
> case.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Hmm, so this looks to be the code that I commented on as missing in patch 1.
I don't think this can be two separate patches. If you want to keep things
in small chunks, move the removal of "the effectively-dead logic" to a
separate, follow-on patch.

Jan

