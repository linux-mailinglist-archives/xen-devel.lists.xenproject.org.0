Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99BF824F34
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 08:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662020.1031925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLei4-0002TC-C7; Fri, 05 Jan 2024 07:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662020.1031925; Fri, 05 Jan 2024 07:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLei4-0002Qs-91; Fri, 05 Jan 2024 07:33:40 +0000
Received: by outflank-mailman (input) for mailman id 662020;
 Fri, 05 Jan 2024 07:33:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nS5B=IP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLei2-0002Qc-KT
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 07:33:38 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc26970a-ab9c-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 08:33:35 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cd1eac006eso14085131fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 23:33:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l22-20020a02ccf6000000b0046cd8bac20dsm282558jaq.12.2024.01.04.23.33.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 23:33:35 -0800 (PST)
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
X-Inumbo-ID: bc26970a-ab9c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704440015; x=1705044815; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=43C2VMZ7ZAef5DrhPf+e+832iGWRVsljEjo0BGopKRA=;
        b=dGQmBOZlg5x9inouGfcJzolZOR1/r+DeXSy3rJfR2PFdPdV65IuguX9SlZyOKyhJaV
         i6HSHBwbQ6/D7qInsB24WXQnMoTdFrPVm7612BegIUwX+z95U4G19oue5PGf5EQdyN9o
         1ELtxdyyaaUusCqydJJPhDPeoztnvopzChdDUQZt0Ag1T5DECCNm+fz2njJhn6DzYVAr
         C+TxEHDgFBnlDy/sOzZg8C67IB5CdzgeJiO/haoGSkUkIR3r0j7Ha8EjqcYXfYgrKBBf
         r4MlF1aJQIYH9LqomshU2ZPkoNekgEJPAI9Kl961Ig23AfxgTMy1bvMIXwQqMtsZPZx2
         X+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704440015; x=1705044815;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43C2VMZ7ZAef5DrhPf+e+832iGWRVsljEjo0BGopKRA=;
        b=TjB7jOoNsS4euIhhdIY9egr90MnkzbkXv3/bEeA2nCUNCSTzyi/teUWLfG6g/gppnw
         8/bdOi2CuP60AgvN0pXJ0KPwhgiFQcrU5lXA3v/8nzWJV32R/nmSHPBK2jWwTKnuARhw
         Cl/opng8lD3fBOoXkBdXJDm35Q7koHaqg78azEwSNxAIiT8i6EVkS9hLmOcFIHsJa73L
         aspFcJhQCu/KP8B0VZiz4pkYIWcvLLISp8dFJacsr50Ot9K05/Otk9OW4IPWbf+YYW76
         H0CRTNjUCObDBuPJBN9JrmvrVqL2+wEfh17UA3PhbdrAyvbgzUQb4QkyMVlFnwHOl6Cn
         9wgw==
X-Gm-Message-State: AOJu0YwqLyVJpGQt4Dx3dg/2Rbhj8CKVlck8EEc7D/oYjsZ8mEdaGvCB
	lc3ECx37k4jLdA3UqkaodDooIHsw4ga5
X-Google-Smtp-Source: AGHT+IEej+bw87r008nXU4E5tGcezvoPLbvJxqyqpEyoWZb41RLFuk0SeIl97RHqr+SkSfZtKkG0yg==
X-Received: by 2002:a05:6512:220f:b0:50e:76b2:6c6a with SMTP id h15-20020a056512220f00b0050e76b26c6amr709701lfu.148.1704440015566;
        Thu, 04 Jan 2024 23:33:35 -0800 (PST)
Message-ID: <ba53053f-a2c6-4e4f-a805-4d60970bae39@suse.com>
Date: Fri, 5 Jan 2024 08:33:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mwait-idle: fix ubsan warning
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <f0ac3890b5e2e1e98bfd3fe5fffcf3c3c031e12c.1704388276.git.tamas.lengyel@intel.com>
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
In-Reply-To: <f0ac3890b5e2e1e98bfd3fe5fffcf3c3c031e12c.1704388276.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2024 18:13, Tamas K Lengyel wrote:
> Fix warning:
> (XEN) UBSAN: Undefined behaviour in arch/x86/cpu/mwait-idle.c:1300:44
> (XEN) left shift of 15 by 28 places cannot be represented in type 'int'
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> Fixes: 5a211704e88 ("mwait-idle: prevent SKL-H boot failure when C8+C9+C10 enabled")

No matter that I appreciate the change, I think this wants fixing by a
patch to the (Linux) original, which we'd then import (like we do for
other changes, including the one referenced by the Fixes: tag).

Jan


