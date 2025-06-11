Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3571CAD4E7F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 10:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011369.1389745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPGtp-0003XQ-Eh; Wed, 11 Jun 2025 08:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011369.1389745; Wed, 11 Jun 2025 08:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPGtp-0003VC-AT; Wed, 11 Jun 2025 08:33:33 +0000
Received: by outflank-mailman (input) for mailman id 1011369;
 Wed, 11 Jun 2025 08:33:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPGtn-0003V4-82
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 08:33:31 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c030e377-469e-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 10:33:29 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a528243636so3831683f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 01:33:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0ea3cdsm8705075b3a.159.2025.06.11.01.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 01:33:28 -0700 (PDT)
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
X-Inumbo-ID: c030e377-469e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749630809; x=1750235609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iCvriiNkBzSZpS5vMPEQuI5NveEm5SIlC9r8udGlOjA=;
        b=JpaQEWD04iMc2Ythgzs+8rHP43AOxCjz/nu2r4LEqo8MLGonA2LGIA4eFEc9U48ii1
         w939ey0tNEYWgYzCPwwkRNu1uw9f3uzT8aVG3of+IXWw2QUZkiAuLjgbz/gUigej4k9Y
         XHz7SmQDuPlA3x3D+RBIrQWfzSQ/UMBGIRqF0AbPycMaRdUxk3sw9RV6luOTrsxEQYTf
         a4GZm2ACCm46jQiUnLK3dRa+yBdusOsVUd6ZHoO+7jFQftVo/EsdMGn00+Keu6/3eZso
         v3NSXUhA0TLz85iZhsMI/mgl6+EfdI9N7pTKc6iZNuJ3DInxwN0U9bjXDOO5o7Emldz+
         AMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630809; x=1750235609;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCvriiNkBzSZpS5vMPEQuI5NveEm5SIlC9r8udGlOjA=;
        b=Nd1S1+kgIgqslocRF4OVNv6dWR0X5wMdodgw+b5Udq2/OWw6fVc/5XerVQHjybic4y
         +xgKLLkLi2cTuxufpvZoDwJIhgwuOfWpLCSangN3ufNeNeWGzYLHH/4vDZ5/lsgzBJhi
         uv2B+zdKJSBXYgeBTcM+xuRnMDG8tkYOTC7tbXceQP2cx9YXWGrCLv+1t6sPjVCH3NDx
         db5+yXNmnxRIsCjf5aKpY36CrMnHHMjAIesxquzSXLaSj7UAmh9wvOx0AN8GA99JMdPF
         98NskrPta9qSkwTtM1/vMY4AWtRq7qGg/kYsLGjU6yn8EAcq//B8pMPydhQTqMidg+Ig
         vB0g==
X-Forwarded-Encrypted: i=1; AJvYcCUSSoMRxa9QQ6/BCAvelXqPGXdPt37asW6mebkDJPrQJRdP4H2NEOSmSEHsK0PJBOXmpODDbsCcE4o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywn2N/x2ZVmFvmPC9ifhA0m9rH9zsUvNyzbn0MO62K23ZUyUrZS
	CdbPnQzPONNHrvK2S32DLLJInPX+0ef5/D9m96N2x91pJVpxSpl8Tqz1zfPsGaRv4A==
X-Gm-Gg: ASbGnct6/jL4Uqm873s22FPd3sJ9MKkwpYqpWuX+1I0GNqdGzfmKrqAChhwUaRT1D/E
	rqcbPkrnM7oisTJfVzrjBokaFdpZdgrtxDuUtXSLfBbmLIM89ReZEw3MnbSY9CJ5wuYsOp/wEku
	e4enjK/JvbxuHwvqsI+vcC/00mp1UFsSItWUG1ctMo50UnJ2b7LotpFmEiwc1IbH3Jius2lHu1v
	bJP2WBXjVFC8krcJNi7XxYtf9BuJb10703E8EWcr5oiypRcBxDUiyIb8s1g+rqL93x2nxXo7yHW
	LBgpLgqo6NVOFBWy0YiX0SujzjXsRjBpBeU63SliN8Ex4lQ4diKyqsDOqFyog310fH4vSjRmCqu
	CICsS5q++jgMXkusjorEU5gMkI349dtR/HgjH3kWRQVwOmAA=
X-Google-Smtp-Source: AGHT+IFPQzE2Hfm5qxibS6/1ek3HrBN6fGQ90K9DGCWi5psZIXl6X3MUTH4sWI/e7CCV4vw8mCvXyw==
X-Received: by 2002:a05:6000:4027:b0:3a4:c909:ce16 with SMTP id ffacd0b85a97d-3a558ae6570mr1466170f8f.49.1749630808695;
        Wed, 11 Jun 2025 01:33:28 -0700 (PDT)
Message-ID: <7fbadeb6-9b7a-4781-90bb-4f54cfd85612@suse.com>
Date: Wed, 11 Jun 2025 10:33:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4][PART 2 01/10] xen/x86: Move freeze/thaw_domains to
 common code
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1748848482.git.mykola_kvach@epam.com>
 <a679ba83fcc0e8387158a218f3af1fa234ea3534.1748848482.git.mykola_kvach@epam.com>
 <4bfe5a9a-6128-4760-9121-46b0d9bd6789@suse.com>
 <CAGeoDV_QJrLM4ySknkNuV+xsg7Sxj+0iDe6bXGJpj+1+9_oYaw@mail.gmail.com>
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
In-Reply-To: <CAGeoDV_QJrLM4ySknkNuV+xsg7Sxj+0iDe6bXGJpj+1+9_oYaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2025 07:55, Mykola Kvach wrote:
> On Mon, Jun 2, 2025 at 12:20 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 02.06.2025 11:04, Mykola Kvach wrote:
>>> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>>>
>>> The freeze_domains and thaw_domains functions are currently defined
>>> in x86-specific suspend code. These functions are also useful on other
>>> architectures, such as ARM, for implementing system-wide suspend and
>>> resume functionality.
>>>
>>> This patch moves these functions to common code so they can be reused
>>> across architectures.
>>>
>>> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
>>> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>
>> On the assumption that the transient Misra violation is okay:
> 
> Perhaps wrapping it with CONFIG_SYSTEM_SUSPEND would be sufficient.

Quite likely, unless another use case for the functions would appear.

Jan

