Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFDB8CC299
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727721.1132359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mT1-0000cq-0T; Wed, 22 May 2024 13:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727721.1132359; Wed, 22 May 2024 13:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mT0-0000ax-Tz; Wed, 22 May 2024 13:57:18 +0000
Received: by outflank-mailman (input) for mailman id 727721;
 Wed, 22 May 2024 13:57:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9mT0-0000ap-78
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:57:18 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3323db46-1843-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 15:57:17 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5755fafa5a7so5379760a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:57:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bebb57asm18261602a12.26.2024.05.22.06.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 06:57:16 -0700 (PDT)
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
X-Inumbo-ID: 3323db46-1843-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716386237; x=1716991037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngfdMziJ+Dx9wHG0ZYXBe50zw9kBBFnqoLdJEWbjR/g=;
        b=IE+Cgk+7b3wWkgG0ftip+hg2hRWW7qtYFcLln3oGaSNUuljY1olUhd9JD/i7J5KLLc
         fSGFX9G13wJcu/z40nNSiRn482MmyacccYjrUEcovYjabkg8JJ96X1si54iS2mHFXyuP
         O2GFk6Y/CBEiWyeMXRYpvhuYj3aVzORdlO5M1Z3dujyGv3r316ihiMTld0bF2jbpnUzZ
         4fqpaZWZE6cokrZNpkZPSp9QamRZMES2NzHztdGH931lDabz8Yk8Qcxeeo2m3llT6Ke5
         1gyl1+IujfnbZxnFuAmCtKBpI0pJ5GhMgAjxFKiNiQXEHlLjzNmJoEs2NpY/MHRxDEXr
         rp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716386237; x=1716991037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngfdMziJ+Dx9wHG0ZYXBe50zw9kBBFnqoLdJEWbjR/g=;
        b=SzCWFDScNWVIWvX2iOvaO7f+5VUgh9Tmd9Fxu2MjDJamhLCLWbehojdbLuoEcFslMZ
         2gRLPi9M/k5HKnOgwueDWAfEGCJsr8Q2VlRTjGON5WkIkeGidIeGgWay9sY2huvh/M72
         C96CBC4xgkLSllWiYxzO++Cgx+p9PFXDjjQ3rrrjHJZZEU1ZVXKi/Hi2YRwaT3z4xBUT
         LmlygTQM3Yb/MOBd58nHxyIacfu4N8QDpEmMo++eVynkDWxNARqdOgLAFgYE5Xav7wCe
         Yy9yG3EFBySZdUjLvbrJFBqTfl+G2XX9G1Dxitqzkn8bbfrCNjgI+bLqpjpKu24dxr6m
         f7dA==
X-Forwarded-Encrypted: i=1; AJvYcCVMTOYq2aCvzWNrxbYErCkWagTzS4bbog5WFl2081iWcCKjYJ37pwbqhSVbaf6gq2lzJE4U3nj/hkPlzqHfmmfeO5fSvDRxw6inruUZ7H4=
X-Gm-Message-State: AOJu0Yyp5Gre99FSaZ5jld6/6ss5zVa3fSKO+AcfCXIz/46M9UnqjSks
	nWJynlc5zcYTDAMl7eY8GMWPXnrOe8bcmDc5oAMSRxosr391V+5VBEwTocSsbA==
X-Google-Smtp-Source: AGHT+IGeHZiI15urXAyHaMK8vbQw9kySUZV5oEAnLNvgSeCIoBAdhNDe5rLkLFxQzzkbUCdA44vktw==
X-Received: by 2002:a50:d55c:0:b0:572:9bd2:9a90 with SMTP id 4fb4d7f45d1cf-57832c5112dmr1349307a12.31.1716386236720;
        Wed, 22 May 2024 06:57:16 -0700 (PDT)
Message-ID: <5aab89b4-1171-42e9-aefb-02f914eb982f@suse.com>
Date: Wed, 22 May 2024 15:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] x86/shadow: Don't leave trace record field
 uninitialized
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240522131703.30839-1-andrew.cooper3@citrix.com>
 <20240522131703.30839-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240522131703.30839-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2024 15:17, Andrew Cooper wrote:
> From: Jan Beulich <jbeulich@suse.com>
> 
> The emulation_count field is set only conditionally right now. Convert
> all field setting to an initializer, thus guaranteeing that field to be
> set to 0 (default initialized) when GUEST_PAGING_LEVELS != 3.
> 
> Rework trace_shadow_emulate() to be consistent with the other trace helpers.
> 
> Coverity-ID: 1598430
> Fixes: 9a86ac1aa3d2 ("xentrace 5/7: Additional tracing for the shadow code")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Your additional changes look pretty much independent of what my original
patch did. I don't mind the folding though, yet I think you need to add
your own S-o-b as well. Then in turn
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

