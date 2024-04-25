Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71788B25AE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 17:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712167.1112639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s01OE-0007w7-Jl; Thu, 25 Apr 2024 15:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712167.1112639; Thu, 25 Apr 2024 15:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s01OE-0007st-Gw; Thu, 25 Apr 2024 15:52:02 +0000
Received: by outflank-mailman (input) for mailman id 712167;
 Thu, 25 Apr 2024 15:52:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s01OC-0007sn-VF
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 15:52:00 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfcf81d1-031b-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 17:51:59 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-572250b7704so1133336a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 08:51:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k14-20020a170906128e00b00a525609ae30sm9664775ejb.169.2024.04.25.08.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 08:51:58 -0700 (PDT)
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
X-Inumbo-ID: bfcf81d1-031b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714060318; x=1714665118; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiBRG55UQFpm4FGw786bebYB43hpqFwwBtHv6EPYkbw=;
        b=D1RqaMnZ+OEfY8nrfkki1Mxfen8ubBiWgvs23hWy4IfmkR00OgnSb7cECpGsqAAH9v
         r51Ee5d20bpxYSp7JpiGwD9Sr+t1PQ2TDWE7o0oHAK9DTIuHXsc7L7riStFSRSOTwDpt
         o/Xo+Jpa+lSVVNIEYPWF4HpNWOE451TkzCxUFidrV2vSIcl9lfaoPNP+InzrlUuBF5mW
         ddIe8vsG6JOrARrUzVwxMthB494U4ynZKwfs/vOCxEq8dLR2fCW3pb/hCQ8bvo9IdADi
         f9sXAvK43Qt4bLTW4uu9g//a2JvLSvmDiVyt1WY41RbvBz92kCSBVkCH1Kh8AiTQAU3n
         VACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714060318; x=1714665118;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UiBRG55UQFpm4FGw786bebYB43hpqFwwBtHv6EPYkbw=;
        b=QrTK9/qwgKUB0K4hmyAQS+Y3gXUr1DC8CzfC2qc9zZUnodGJFVoyfmHktux8xpPQyx
         R/BTWhf7ju5fqmwnMhQtzJoLuSLxXS0gjHqY/AEMSaKRaySRojk+2629lfiC39Txeje+
         N6r0T6ds+wZcO96mNRo0smTy+1YNFtN0JuU0cY6gNdNhnrL7ipSqFNcJ2XOcYum3kRHv
         LUYAJV88oYgwONRnm5aWF8iSD+MCXqgvecLUPsWntzB5/dWLJJaRzI/k3QH4KT7k0HNx
         Wkm/k3jfOElvUlot4UsE5rsa8iO0xj4+8HQEg/aZEjSW1JTjHmjJR7i+5ArhYVOS48eu
         iEGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8XfXDtdSkoRuSD+eXGCQjmotgHWm59jwMa74gXcVa2DXiyNULpGN44iXrQGSwQWbkpkxO3DthmvD7Oz3w7DZlKrzNK+DmJQso7XI7cow=
X-Gm-Message-State: AOJu0Yzw96+FPUe6PAE33sP/WUR5V2PeFuCidF3miNeYYycDhh4BY9+0
	voj2A1PNKi+Me/nxMGAi++mUsoSMIHh5AKmfsVafH6Q1cbbuIiPCxVyt/3V7lg==
X-Google-Smtp-Source: AGHT+IGlYOVf5CkwBwervgbRORfiA9s6FsSt8hqZYiLMpcP3LiZINbQRgA5mKn7Cz7aPUvKE91uOWg==
X-Received: by 2002:a17:907:7890:b0:a55:b345:63ec with SMTP id ku16-20020a170907789000b00a55b34563ecmr104509ejc.15.1714060318515;
        Thu, 25 Apr 2024 08:51:58 -0700 (PDT)
Message-ID: <6a32fdd7-d698-448b-8360-3c672d5f5a90@suse.com>
Date: Thu, 25 Apr 2024 17:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/17] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
 <c3a9dfadbc6465eb9362c7823d7d2800e98218eb.1713347222.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c3a9dfadbc6465eb9362c7823d7d2800e98218eb.1713347222.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2024 12:04, Oleksii Kurochko wrote:
> Taken from Linux-6.4.0-rc1
> 
> Xen's bitops.h consists of several Linux's headers:
> * linux/arch/include/asm/bitops.h:
>   * The following function were removed as they aren't used in Xen:
>         * test_and_set_bit_lock
>         * clear_bit_unlock
>         * __clear_bit_unlock
>   * The following functions were renamed in the way how they are
>     used by common code:
>         * __test_and_set_bit
>         * __test_and_clear_bit
>   * The declaration and implementation of the following functios
>     were updated to make Xen build happy:
>         * clear_bit
>         * set_bit
>         * __test_and_clear_bit
>         * __test_and_set_bit
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



