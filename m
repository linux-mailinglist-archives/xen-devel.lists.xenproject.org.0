Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0038AAB61
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 11:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708880.1108051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxkR4-0000Pe-8F; Fri, 19 Apr 2024 09:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708880.1108051; Fri, 19 Apr 2024 09:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxkR4-0000Nl-5c; Fri, 19 Apr 2024 09:21:34 +0000
Received: by outflank-mailman (input) for mailman id 708880;
 Fri, 19 Apr 2024 09:21:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxkR2-0000Nf-Kt
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 09:21:32 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3328410b-fe2e-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 11:21:27 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-418c0d83e61so19169655e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 02:21:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 he5-20020a05600c540500b00418e3c5bc8esm5170814wmb.18.2024.04.19.02.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 02:21:26 -0700 (PDT)
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
X-Inumbo-ID: 3328410b-fe2e-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713518487; x=1714123287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yun9w9oveyJskhWACTr7deBaPxj/PJd0s95DG8t6v+0=;
        b=MCJhqKcNXvjkEKlOsdDMuaGVcAJBecv30K/zI383ds9smuM7xArJ565a7RhLs9ZRG6
         KYLtgXQG3OAKe30h6s3xlN58EkHkhhVTFRp9FPfXaELRIQnj0p/WfufAxVnty5PIMh4v
         +VZmZ6didz7qb3KhEPtHgihCezn7InXNaCCdySQkNY62s8384zIK0b7pgWVUjxIaxnti
         DHgIJKUXn2FwjBek3LkUuz5vjtqjwJBXr4oN1uVOF/5h6TesKLPata360hzWX6NbYdvV
         7xx3y8R8ypSn5tFSDTvGqGZciG+w8h8QrPE2ciN1XegUmNvGTXZaW+lzfagDFU/UTRsD
         sprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713518487; x=1714123287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yun9w9oveyJskhWACTr7deBaPxj/PJd0s95DG8t6v+0=;
        b=OC4iOTjV21P2yCxX3uIQUDjfNzBwE66CAmdkOjH1VoFEDScleiaqmu5W0CtG+3JpNF
         BTQLDyRs5TYKnqn7wPfLIsBncwPlPsLP6rC0cC8rygsvcjBYwzF+aTIqsOk0pDiihZoQ
         fSn8/tsa124mgbSTj1z7kILGp8jTB5Gf8vyOXrGADNusyCLCq2++K+bOfu0YCVSsLGPe
         qc3+vGVsKUNkKB1uLoCX1AP7tjM058LpTqWRSW9S/L8flMr1SF7SkPfTwzFvrPt5YjN6
         EcifW/w/csO+zAqj8BXI6IOEXTShIpSr9rgJVhvRkvpDQl//5NMegDIlpqhFMqKiBZ5A
         SCxA==
X-Forwarded-Encrypted: i=1; AJvYcCV2Om22D3pb9DdfL1e7gGaWYbD5HYH6kUT780dqX8AiXm1TRRooRQ1pbP78ikhF+accDvg7qHql0nWxVk+pMBVk6+z4eWEjxS6UZoKeeW8=
X-Gm-Message-State: AOJu0YyaAd5umP5cDYLD1do0OBl2JB5Y1wQfiDG7aFc2HHS7l/hSqmcJ
	qJ4fs/BgreYmncs/J575Ecc5lmmJDbewM1cdZC+EhfaSHg1xxrafVD9J8je3Kw==
X-Google-Smtp-Source: AGHT+IE5Oe6SA/0FfOVQGmXLc4jLipQuKcrQA38Qv1rQnuCttnoUxnSbKSdsGf0SnYygrITH5FaLNQ==
X-Received: by 2002:a05:600c:46cb:b0:418:e3d5:5c28 with SMTP id q11-20020a05600c46cb00b00418e3d55c28mr1346749wmo.10.1713518487084;
        Fri, 19 Apr 2024 02:21:27 -0700 (PDT)
Message-ID: <3c6e3fa1-a312-4872-9b7f-9e6935490bcb@suse.com>
Date: Fri, 19 Apr 2024 11:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair_analysis: substitute deprecated
 service STD.emptrecd
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <7b60faa6e627b3a4df298f2ef4d9ba4d72e5e206.1713510915.git.nicola.vetrini@bugseng.com>
 <c94d739e-0517-487f-8ba9-d9b19fe8f916@suse.com>
 <58ed38830469a027b9cedd9d5f68cfae@bugseng.com>
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
In-Reply-To: <58ed38830469a027b9cedd9d5f68cfae@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.04.2024 09:49, Nicola Vetrini wrote:
> On 2024-04-19 09:35, Jan Beulich wrote:
>> On 19.04.2024 09:16, Nicola Vetrini wrote:
>>> The ECLAIR service STD.emptrecd is being deprecated; hence, as a 
>>> preventive
>>> measure, STD.anonstct is used here, which for Xen's purposes has 
>>> equivalent
>>> functionality.
>>
>> I'm sorry, but no, this still does not clarify things enough. It is 
>> still
>> entirely unclear how "empty record" can reasonably be substituted by
>> "anonymous struct". Even the expansion of the respective abbreviations
>> continues to be just a guess.
> 
> anonstct checks for structs with no named members,

So "anonstct" != "anonymous structures". As indicated, part of the
description wants to be de-ciphering of these acronyms, so they can
make sense to readers.

Jan

> hence also empty 
> structs, but only the former is an undefined behaviour for C99.
> 


