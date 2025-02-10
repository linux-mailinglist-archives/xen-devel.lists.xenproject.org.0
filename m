Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD04A2E6A7
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 09:42:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884409.1294111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPMW-00051C-TK; Mon, 10 Feb 2025 08:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884409.1294111; Mon, 10 Feb 2025 08:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPMW-0004yQ-QS; Mon, 10 Feb 2025 08:41:52 +0000
Received: by outflank-mailman (input) for mailman id 884409;
 Mon, 10 Feb 2025 08:41:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thPMW-0004yK-0e
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 08:41:52 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de53dc93-e78a-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 09:41:49 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5de594e2555so3755311a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 00:41:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7736439bbsm817609066b.162.2025.02.10.00.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 00:41:48 -0800 (PST)
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
X-Inumbo-ID: de53dc93-e78a-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739176909; x=1739781709; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dWVHDGoytW9K5vecFap0KgCNwFDnPipAUxCtH1Ke5tg=;
        b=D0PpoLpdUkbTPLqXEUVNRhRA1BIjxzt8xRwaLYzDphkY/Nh1l9GcVNkQMuRXvlS7vX
         /Ug1PBOV7mdOhs8HqSzh5svDeMm9rgdrvS2hbZ2VkkK/nKh4jdPUBFNCf7k9BYQVpXdU
         k4ai8VIAq1ixeg6FPUiHMnQuSe6KFYMFZCIOL/rANbS7MRELPhKFlc6Uay9IueKlrBQ1
         iRonqX+fEIxAETFrsU1m86HrRkW1g0fKy1/Rv+o2bqArmUMbwbS6vXmzsE1hhH7XOgMZ
         ssVJgAld4xGGz7jbgvb0KI7XRHjenjwKZOVjCg+Z7MIZQDXRfwWLyXqC8Fb9oXVQCs1k
         S98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739176909; x=1739781709;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWVHDGoytW9K5vecFap0KgCNwFDnPipAUxCtH1Ke5tg=;
        b=OU7qWEJppuTdPr1VjMmZIJecUg6D74bCYlgoQD141qutx5TTwucv3Gt/8I6Jn9tlCP
         2WJvUkBRTkIrtJ9wDQ3EKbt7uBouVlpyVVXjWz+glHahJEfayXSLa4m0GE+5q9kJ2ysa
         mW2bci8ZjXsdUiYXZhDPBGkEHf/awgByzvxsUWI1wvWAB4dnzBrima0grKWfS+EeUV6p
         6EIQjenEKM0DpI4rDIPlBJNxaaQh8bNTIg2tN5DB1cYqpzrnlwZP+UUyyMuGLuZYzP4a
         5pvKkvXLP7p16HaDSF19mD4kiUx5O3XI3kr4ZrEeA88kMpV3Bowh8rgkXnaVLEWUKFI/
         UpXg==
X-Forwarded-Encrypted: i=1; AJvYcCXpGnRcikS8+3UsGKrBsMhprHomgc/4csyEJW9DLPo75B1ogoN3EaKVzyvGASI798rw6PY7/R9/Hsk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEh5ToWbf5ba0y8yjkY1WBcdUUlXxRifyvenyVoHLIOvMEmQ2w
	F+BDReC86Fp4SUEUepa6ZKBlJMFUURnkzt10CKGUyf0eiJJ/gaLl/llRX8yvzA==
X-Gm-Gg: ASbGnctFKzl5BevDqqXSxciIcCjhIsdZjqvRaTpKKmAda229MUHxipt2VaSuF7ezFDU
	NQKMeX//uJKuhCX2gA14bDzo38YxsZC8phKfbf2UDFMekpRsd7q1EJpt5sA0pS9KSZqbnOkL794
	EkejGxJPkrdemg5Q6hL1iWU4LR+0430A8P4wGSZxqqlOv17JVzq8S7rEJLLpokMrWNZMqMpQD52
	hY61Iaztdvvwod5qFVhh4kTY9eqnj1BrDDQxFyGekTGnE9nEHygnILLeyB0mcWJF00Go0pEuJN4
	1qkxSQIqC3h53n9T7APUy6OX3g/60pKJWWniyBzmKusjtMcZClfjMjSO474RVPLJnsjIYLiNUXS
	6
X-Google-Smtp-Source: AGHT+IHwssZ1cfc0ngnAMdM51Mr5nVkaZfdzKkESx+lcL/YpqVixtaA9tS8yOiAwJrXsDLt+LHKxBA==
X-Received: by 2002:a17:907:3e8d:b0:ab7:6fa9:b0a9 with SMTP id a640c23a62f3a-ab789a9d819mr1270859966b.11.1739176908830;
        Mon, 10 Feb 2025 00:41:48 -0800 (PST)
Message-ID: <32de25f6-6c73-4a70-8844-e387d83c2528@suse.com>
Date: Mon, 10 Feb 2025 09:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/console: introduce is_console_printable()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, dmukhin@ford.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <20250207005532.345746-1-dmkhn@proton.me>
 <fed6f1dd-8c32-47d7-b879-e38b372bf4eb@suse.com>
 <20250207213320.2253618-1-dmukhin@ford.com>
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
In-Reply-To: <20250207213320.2253618-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2025 22:33, dmkhn@proton.me wrote:
> Add is_console_printable() to implement a common check for printable characters
> in the UART emulation and guest logging code.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/arm/vuart.c       | 5 ++---
>  xen/arch/x86/hvm/hvm.c     | 5 ++---
>  xen/drivers/char/console.c | 3 +--
>  xen/include/xen/console.h  | 6 ++++++
>  4 files changed, 11 insertions(+), 8 deletions(-)

Hmm, there being no revision log (nor a version number, btw), I can only guess
that this addresses my earlier whitespace comment. You've also lost Stefano's
R-b. Further please send patches To: the list, not individuals; maintainers want
Cc-ing as appropriate.

Jan

