Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4AE97E94A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:04:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801811.1211824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfv5-0004OK-3z; Mon, 23 Sep 2024 10:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801811.1211824; Mon, 23 Sep 2024 10:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfv5-0004LW-0P; Mon, 23 Sep 2024 10:03:51 +0000
Received: by outflank-mailman (input) for mailman id 801811;
 Mon, 23 Sep 2024 10:03:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssfv3-0004LQ-V1
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:03:49 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20cc9c5d-7993-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 12:03:49 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so663074766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 03:03:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612dfa54sm1190742466b.161.2024.09.23.03.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 03:03:48 -0700 (PDT)
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
X-Inumbo-ID: 20cc9c5d-7993-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727085828; x=1727690628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6yKzZL3lSiAa3OmbKHBMlj3zX32+coKyQrM6ZWGCBZk=;
        b=YWkJLxis7FXYCQ/zrEaWTjwR1C6v3EsUconhl0cHbJL1zIBqlCtqnECK1Lg5Dr2Ifl
         bBnRUlLnhshlbWUqxWYneN18znv3lQJAL8XNzMI4k25TMBNRvpG7LTuQrPGudYba4KX6
         GWLT5Ik9zujY/xMztV0Y9dSEtBcPS5zu7HR6/vTouH1aTu1z/E391dNoSEFR7oCq54fc
         Zn7GO4O8uFpgAaMUbzZOJ7y9JG9hnqp7o3JYXAMTyVLM9tx+gEEQw2mFGqswIgSfMI8J
         pFvJ4PJ9yLWfNifwHzoR1DcZ6LV0vb4bSLIDH+QwlxLAQcwhWtIFh7ZJhiW4D6RRgmpk
         YUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727085828; x=1727690628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yKzZL3lSiAa3OmbKHBMlj3zX32+coKyQrM6ZWGCBZk=;
        b=jF4/WfOrCvBJC8TXrdHWxyb9jitbAY2MdBMMWJkI9OQ1hzS67vUNgeUojjXZ3tIdMW
         pPSEV5V7CEG+RkTMEtADRHZ5C0HytbHWVZ0LwGAQ0CmkzFzQs4c3Xtz8njCPLFp9fInI
         xhFOaoWVqY56RSt4UOV5RVMjfghcZ28mi310G9ASRctVEHrMJ/HLKJdwY53O2tof1EPq
         PwaL3/LSAotIQo5wvcESldNnB0Oa0nGi1IVPRDU3l8N1KPCROlYUMn3PWB6E90obh29s
         veqhHMVjchImEnS5dxlzt1Y8cl35sDWh7e0LbANexgDJn7WfJ2Xslqc6YQE50UuyZ02Z
         /jZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe/k4N5Vutx9QqKCKJdxHoDLWe8odrifc5+VsR4CwUE/Nmwq4CaaWnHjHmX3S4QWC7n3yGRaxc/bI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOmFdJDv9W3bJHUYwD+oKm6vqwL35tul2EBhQ0HKS4/VnoX6kA
	qpn7o/jnm4JS4FXxssxETXBgwR59Y65VfUBL3uzLkIwjjjz9MeBDCH0Z5lNOiA==
X-Google-Smtp-Source: AGHT+IEK7xWlNQ8ANzUdPrrGFNitsH6H2I9zVZKts4A1CMsovbrGGIB0WZMdQ/za42n/8jY/xs1vqg==
X-Received: by 2002:a17:907:f74b:b0:a8d:3b04:29db with SMTP id a640c23a62f3a-a90d508b709mr1073093466b.39.1727085828432;
        Mon, 23 Sep 2024 03:03:48 -0700 (PDT)
Message-ID: <4f03e2a8-7686-4a2f-9360-036a3edacaa7@suse.com>
Date: Mon, 23 Sep 2024 12:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra: add R17.2 and R18.2
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 michal.orzel@amd.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2409181322070.1417852@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2409181322070.1417852@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.09.2024 22:23, Stefano Stabellini wrote:
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -561,6 +561,13 @@ maintainers if you want to suggest a change.
>       - The features of <stdarg.h> shall not be used
>       -
>  
> +   * - `Rule 17.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_02.c>`_
> +     - Required
> +     - Functions shall not call themselves, either directly or indirectly
> +     - Limited forms of recursion are allowed if the recursion is bound

Nit: Doesn't this want to be "bounded"?

Jan

