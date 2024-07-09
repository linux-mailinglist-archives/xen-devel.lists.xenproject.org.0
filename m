Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A14392B0ED
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 09:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755912.1164445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR54v-0000oB-FO; Tue, 09 Jul 2024 07:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755912.1164445; Tue, 09 Jul 2024 07:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR54v-0000lS-As; Tue, 09 Jul 2024 07:15:57 +0000
Received: by outflank-mailman (input) for mailman id 755912;
 Tue, 09 Jul 2024 07:15:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR54u-0000lK-1Y
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 07:15:56 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14442bed-3dc3-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 09:15:54 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so69318421fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 00:15:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a11cc9sm9440875ad.42.2024.07.09.00.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 00:15:53 -0700 (PDT)
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
X-Inumbo-ID: 14442bed-3dc3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720509353; x=1721114153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fAX4vBa1qp6KH0nUEHX4salbu7iaiDu5iHBJpEYadnA=;
        b=GPn/0U/b2zdm+TUL3JV/HAk697AYO77vDx/3uK0cuS/sZlkoax+REF2ziVjRfmEA89
         6Q2G/r+Vsjo07wu28976ES78V7X/6SP/K2H9zTzh/ILmS9ay3VZXZAT3ct9VTYPaM0C9
         nwyKjoyUMZMVtU7vLg7Y2SrfDQurTqcDqOUgjMfqw0LUNLDxPvV18jNEm4/NFWP8WCLO
         6C0kl258cUoUgwBtuK9SvF6xQLVIrBv9r2+bdV6cWaA074pPLzAralWYC/tscDzm7Bh0
         nWe1ptlsSmsJVXNbdeKljxwTHg1PIUn0XwksbiXtO8xpQ9W3d+4VV0j8vkc65cBiJlgD
         2pSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509353; x=1721114153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAX4vBa1qp6KH0nUEHX4salbu7iaiDu5iHBJpEYadnA=;
        b=BgVnOK4dFXkk8xJaixOI3HXFQ90xx8IWzNU2RjIzT7w8PNj2UWnDzrolytPL3NEGYP
         iPJi3Qnc2epIJLMqWw7NGufpmQxRYuJKibJPutFe2Ud7L0mhPmjGtYymYnk3SYwW45BF
         zQau4ud6B/YlYQO4awI7HVBc6ZNbnYWIV/3/zcQVfqSNaPhFrJaTu4KToBY/Mb3VklWv
         L6OTvV8zzPO9PefVQ1jCODggJ3nH9GfCdP0hNPPZGWs5H3Uer7TtAKHaNsA5NdOulQTb
         7YuHsefJ5+y3eYqVxIUYUGkdcR8RqI6NLNRx7/ZDTJtKSUgraEdmAodFjmIt/HKmncYz
         SuTg==
X-Forwarded-Encrypted: i=1; AJvYcCWCL/RpTwmuzCaenGCCnZlCfeS8nV0o0CVCFg/21cP9gwVvRC4ka4+M58+abhLkcvATpJ5YGbm+2YJ5KjBXr5gp03Zr1oYkxffIDxJEpug=
X-Gm-Message-State: AOJu0YxhUep7knJrutvJYoOQODW6VZ+yrVCdcAMlym9ROvxBEIScJp+a
	CvFIMtJOCXpWqHaOsh94NjjrVnHAUKgFHmzPP9A9pUc0EU+LeFJqUz3jjQlDBw==
X-Google-Smtp-Source: AGHT+IEWvT+IFk9r/M2kgSqoNkLrwrnS6TxoMTwPrJ22vRZXK89AYEG4ydNtEiGMB0asCMBJhg1nEA==
X-Received: by 2002:a05:651c:102f:b0:2ee:87e9:3194 with SMTP id 38308e7fff4ca-2eeb3189212mr12873181fa.47.1720509353684;
        Tue, 09 Jul 2024 00:15:53 -0700 (PDT)
Message-ID: <87607815-86bb-4d21-8473-e3c5ca42a746@suse.com>
Date: Tue, 9 Jul 2024 09:15:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 05/14] x86: introduce using_{svm,vmx}() helpers
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <d730b06b851d5c502850509d4cf868ed618d10d8.1720501197.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <d730b06b851d5c502850509d4cf868ed618d10d8.1720501197.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 07:54, Sergiy Kibrik wrote:
> As we now have SVM/VMX config options for enabling/disabling these features
> completely in the build, we need some build-time checks to ensure that vmx/svm
> code can be used and things compile. Macros cpu_has_{svm,vmx} used to be doing
> such checks at runtime, however they do not check if SVM/VMX support is
> enabled in the build.
> 
> Also cpu_has_{svm,vmx} can potentially be called from non-{VMX,SVM} build
> yet running on {VMX,SVM}-enabled CPU, so would correctly indicate that VMX/SVM
> is indeed supported by CPU, but code to drive it can't be used.
> 
> New routines using_{vmx,svm}() indicate that both CPU _and_ build provide
> corresponding technology support, while cpu_has_{vmx,svm} still remains for
> informational runtime purpose, just as their naming suggests.
> 
> These new helpers are used right away in several sites, namely guard calls to
> start_nested_{svm,vmx} and start_{svm,vmx} to fix a build when VMX=n or SVM=n.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



