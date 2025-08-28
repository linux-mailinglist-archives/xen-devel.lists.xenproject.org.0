Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E63B39819
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097920.1452084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYpT-00078D-G4; Thu, 28 Aug 2025 09:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097920.1452084; Thu, 28 Aug 2025 09:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYpT-00075s-DR; Thu, 28 Aug 2025 09:21:59 +0000
Received: by outflank-mailman (input) for mailman id 1097920;
 Thu, 28 Aug 2025 09:21:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urYpS-00075k-50
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:21:58 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 710952bc-83f0-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 11:21:56 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afeee20b7c0so38829766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 02:21:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe88c76f61sm767852266b.10.2025.08.28.02.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 02:21:55 -0700 (PDT)
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
X-Inumbo-ID: 710952bc-83f0-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756372915; x=1756977715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PhAETet/NUuM0sqs3tNFEUe+QcAOBFWiCNrKqtqFYx0=;
        b=Mdbfd/BaYwjVmNoBAFxQqxiggMF6Sx5+k84rasdDH3EH7XvHUUcatc7ZzJGUpZiQJC
         Uh37RwUIcgckTbQeY1t9cKnA93P51pIEpVztuGK1KV5x0+HLDuxLmXoFmQHv6p5JVVev
         kTzs4lY8/N71nRlLXgeLyZ5ZeDH6l8yA6KYHXAp60aciNkiA45spbM2a+mxpItQ29UzD
         oLi98eGD09BChdilZX8VvrZsCrPasAxlLbkivwlIuFDTPwbetxHRSdmEzcUL3XRgySrW
         dG1usEtdTVMiCdeXJILBnQVaIJ+gguQGJ99pk5QpVjGM3H6uEWwKURAnsqZ4VX35aHgE
         HXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756372915; x=1756977715;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhAETet/NUuM0sqs3tNFEUe+QcAOBFWiCNrKqtqFYx0=;
        b=JiESh66omOERBXi5nAHAUrceTTQbArbuEgNvrzxDttJxI7PWIPyLgF37NXpJZ+Gbv0
         jQptL+Kik/WD8mkkhTSIb7Awv5CRfwfQ45LT6EZSaX/pDkXN8lDX8ebpZlfpvDpSviYH
         fbnnuX9Z7qIrZqxd6lfB3MrDpPNwme3mTg65pIPRmgEL4elhpPTjzsMoT2QoKzydnBld
         xuw64E47KU4b7bRMqje71iYaTtva3hHIhAZhppJ4i0hdgoXxudrinTP1Lpo5glgQKM5n
         RF7uGhT/A+UrvCLeaqIL9nr+1T8oI9uJp0gFcalDm25DR40TPffMO2+vKVJSqikvuJ7X
         ++5Q==
X-Gm-Message-State: AOJu0YzhsF2fOjy1QRYY+PRKkad7xqQzPPhMvs4aJ2BGMzWyx3wFBrqz
	eN/BVCtzwdSUZ5libLt+1YpVk7fnAs6DAyUHLjtg92KBlOPjnzOiple67aZzIZy4r42rx4jNO6F
	d4ZE=
X-Gm-Gg: ASbGnctFLoc1wR/diUZCCed3hcSMJqj4dCDwJwEhJrKfOVrL7BhYIFPdT9J58VWotWs
	zGrwza0pUYYGn+7c4ipUaXu+jGW4D/3kftkFd7fJ9sVO5AtwD6OIUUKkwIKLCaw4QOluR+yeSId
	QnLWNCJA3FqrNCuDwDLEN2GOxUzd5NTugDcs2F1j+1ojIn0LtxMv5c6nXjshVRzTU8rUY/ndNkV
	3L2jwofVupaUNR++pbwtYvLKUWqaHuJCZ59AHZa7C/XLQvAMsGCLYGxwTxqQoDBaXSMLVx3X91p
	/iUhikUM9h+v5p5QTvu6my5581YPnmtlAtJsMuzmlhCXShU/DHkaMk47NDiVNg5G1pGp4KI5vel
	Cx1m9mufvlXKlbAnfDO6uYCLJZaWIUwT5OInh4ylgNXh/+a5CwRXZACEFE7wzbt1lxYwShirU5J
	wMbN1w0iyBBrn2OqymAw==
X-Google-Smtp-Source: AGHT+IFUwVxiNEz1zNG4BZUgHn+fQ+nnNoJpXOs5lXBwUaX0GUd2gePahm2ziEQwUsMAhWwQ7b4nHw==
X-Received: by 2002:a17:907:7b8c:b0:ae0:cadc:e745 with SMTP id a640c23a62f3a-afe295c0671mr1825202466b.40.1756372915530;
        Thu, 28 Aug 2025 02:21:55 -0700 (PDT)
Message-ID: <8e4b3946-f132-464e-8974-7fd6cb2b6619@suse.com>
Date: Thu, 28 Aug 2025 11:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: introduce "hot" and "cold" page copying functions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <1b9e5d46-20a8-4b5f-b938-e28a0429c770@suse.com>
Content-Language: en-US
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
In-Reply-To: <1b9e5d46-20a8-4b5f-b938-e28a0429c770@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 11:17, Jan Beulich wrote:
> The present copy_page_sse2() is useful in case the destination page isn't
> going to get touched again soon, or if we want to limit churn on the
> caches. Just rename it, to fit the corresponding {clear,scrub}_page_*()
> naming scheme.
> 
> For cases where latency is the most important aspect, or when it is
> expected that sufficiently large parts of a destination page will get
> accessed again soon after the copying, introduce a "hot" alternative.
> Again use alternatives patching to select between a "legacy" and an ERMS
> variant.
> 
> Don't switch any callers just yet - this will be the subject of subsequent
> changes.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

The ERMS series had been pending for so long that I had forgotten that this
further change was yet to be done. I think this patch should be considered
part of that earlier series. Yet then it may of course require some more
discussion to get it into final shape. Would be nice though to have a
consistent set in 4.21 ...

Jan

