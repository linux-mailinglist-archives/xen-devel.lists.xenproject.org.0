Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7E86B284
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 15:59:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686690.1069012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLOy-0004LF-GR; Wed, 28 Feb 2024 14:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686690.1069012; Wed, 28 Feb 2024 14:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLOy-0004Ir-DV; Wed, 28 Feb 2024 14:59:20 +0000
Received: by outflank-mailman (input) for mailman id 686690;
 Wed, 28 Feb 2024 14:59:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfLOx-0004Il-Le
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 14:59:19 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f237fd0c-d649-11ee-afd8-a90da7624cb6;
 Wed, 28 Feb 2024 15:59:18 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso183180966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 06:59:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m2-20020a1709062b8200b00a3e72a6bf1csm1959326ejg.14.2024.02.28.06.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 06:59:17 -0800 (PST)
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
X-Inumbo-ID: f237fd0c-d649-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709132358; x=1709737158; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1T+kpF3CbFMISAXr63wAGZxjagtLjgT6UxuFBQu/WU=;
        b=UF6THkb5dcZX90Up7/Y2Z2TV9BYWbM9N6wfolqiwQofeuFNxD3ecipa4FNZaPtwkGU
         9gZ7qyHJ32UF5+Soby6WGNvKZruIgi3CgYgfl+dIm7V89INfK0Wb5ZgXv5o73FOTsyz9
         vHvdom3CbBGkWrGbUXO8YNb6SWrZDXOttrHO3OxYPQtSKg07744pU0RLeHmNlJe3W5HT
         oQzWYcrxTq1dUBVAZn+FB+INhHumlD6APYnC68ymlCv0ETlk4rXy3l5lygs9eXhqFDD4
         993qdb+ocqO2lrAp9VsfoDq0sFWSp7USUXXw+QOgR64OpbNtOA65lq5+jD3AECOfBLWb
         tI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709132358; x=1709737158;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1T+kpF3CbFMISAXr63wAGZxjagtLjgT6UxuFBQu/WU=;
        b=HvU4zim9BhPq84OVWx5cvlp5kNJt6RQGXhlL6VmCrzpG7Sy0N2/bTuvBnmyFAGLMwP
         NSAo+x7+IFc1aeWdlEUfMfJ+/XEJb/wlN/bpiuwaT7MIyCF7bD2Ze3AkFPya9FtfjOBU
         LNGLfJO5FfDjrkG246ZA5oTGEFwN3G4xlebX/+EoJULDlD5wyln1TmAPy6ba5Gkj3/TK
         xwN6EiHCdn7NrMMpyrhBcOpJROGI0GX52X1hS4GRluirjjSGHjXpVR+QAMFVibA7rVk+
         Zq5stk5BBfS11lb0CcB5tkSLtFd4i7ZAGLpscRoEm7aTtTqGUEjit7O1WXGvJcZGvY4K
         5Vyg==
X-Forwarded-Encrypted: i=1; AJvYcCX/1RqE5PaHYzNbz99orWaC6307grkjJRQfQpu3j8ONCYvqr3s6N+chtE2U5viEYN7kMJLRXu3LIdri8ejmtVN4XO7ReegzHpL8s7sjfQQ=
X-Gm-Message-State: AOJu0Yw2zr1dqU4Se52WerECyeTqOhG3IEZVbaTPtCNKe3OuGHO2IzHi
	yc/tmlnvgGlxaCcl/wg65iqsE3JayrkrdZllnFXdP956UkKbPAsbPTmAi/RYcA==
X-Google-Smtp-Source: AGHT+IFjX2hJKYVcJCSl97VfJgRz81X5z73sZGIW9iPKstXm7X/S6N930FllUv9NApy7unvJpQU8DQ==
X-Received: by 2002:a17:907:1b10:b0:a3e:57ed:8b93 with SMTP id mp16-20020a1709071b1000b00a3e57ed8b93mr3301857ejc.19.1709132357937;
        Wed, 28 Feb 2024 06:59:17 -0800 (PST)
Message-ID: <5175ecb0-e6d9-418c-a73c-266d325406a4@suse.com>
Date: Wed, 28 Feb 2024 15:59:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] xen/spinlock: rename recursive lock functions
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-5-jgross@suse.com>
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
In-Reply-To: <20231212094725.22184-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 10:47, Juergen Gross wrote:
> Rename the recursive spin_lock() functions by replacing the trailing
> "_recursive" with a leading "r".
> 
> Switch the parameter to be a pointer to rspinlock_t.
> 
> Remove the indirection through a macro, as it is adding only complexity
> without any gain.

Considering we aren't aware of any leveraging of this, doing so is
probably okay. Still I think it was done that way for a reason. Plus
of course if we undo the indirection here, sooner or later we should
also undo similar indirection elsewhere.

> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


