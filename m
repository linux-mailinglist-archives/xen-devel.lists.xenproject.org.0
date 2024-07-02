Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885ED923D21
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 14:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752415.1160628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOcDM-0005Bq-FV; Tue, 02 Jul 2024 12:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752415.1160628; Tue, 02 Jul 2024 12:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOcDM-00059H-CE; Tue, 02 Jul 2024 12:02:28 +0000
Received: by outflank-mailman (input) for mailman id 752415;
 Tue, 02 Jul 2024 12:02:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOcDK-00058o-Sh
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 12:02:26 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f20781a8-386a-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 14:02:25 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ed5ac077f5so49034751fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 05:02:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-74a3594c5ffsm2101027a12.35.2024.07.02.05.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 05:02:23 -0700 (PDT)
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
X-Inumbo-ID: f20781a8-386a-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719921744; x=1720526544; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hPN+NgNxGX71qkx6oL/bjsu+a0u+uwKgosyIn7osejE=;
        b=ZlH3ycj2AcbepngGWHP5T3xg0yw8rB95UHG3x4O6MDHneDCjWyTQXRI9U4R3VWsi8I
         pVoGsCKeNjlDR1kp7XwO6IQEqgPoDEpS8/vlppuAFlpxcoBphV9vJA9+wVNM/cfBDa4O
         JbXBF4EZLuuibD9x+09SQpagfMfL9Mz5lh4lxtRFSWQ8gjxtm1My0G11+C7cld31e2Wl
         7+0LU0q7nox9WvghqWF6r+VZro3Q7Q726xfjZDSNuPrdPmNDTVrFdVEb9cGjNCuIyRSQ
         sQx4jMh01WAiUrJCjnVvZGv9y9wJufvS8rtGlG7YiS1KCrtUCQYYxMRS5jWtIWE1ydMM
         T6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719921744; x=1720526544;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPN+NgNxGX71qkx6oL/bjsu+a0u+uwKgosyIn7osejE=;
        b=apD1HzKLvGKMDr7MZ/RkOhxFr2x75ki4uM00YhNKaWqIWtmoM8z4BPk0clNaaDoliO
         bwdH2LSjE0/7okg6/AaLHTLQZlQTpg2k3Alj2gjDXT5MLKqJxAbSxVYpDE5hL1wD7W/L
         rKucvGUXXr2YmwF7oYWm9YXIj+4Wpvex+vSSUcIjDh1HEtlwRjw3tvmjGcEoZifkkGrF
         lVY8oYlKuF87tcl4a6ar9cK8zpkDJbUkR2oqKWH7igRDKGrXnCxFsAyFxpFenEb2SJiU
         1eoNZwuJ2EPletP1j77Si66D9rYIBifyc5iM3wLfxNsPO0ReyIpjf284RoKvVNGcHWJT
         emLA==
X-Forwarded-Encrypted: i=1; AJvYcCXPqrQvetp6gVSolOJ+oD/27doUMt8zLEiCGjAgka+Dk8y7Ykt7TWBTb+mc3npaV2m7iof3W9dEe8MqK7jlKnrS175TRJGEtOYHuooM894=
X-Gm-Message-State: AOJu0YzOdM3Gc9KVNWQ3zyjFHZN+ZN1f63ytZOT/7X9r8lzcHwSi/Aiw
	av3AusEUbCjjLW52mManWb96a8JyCo/sN/Du/h/MEn2VTtrC/1SL/l/NL3sx5g==
X-Google-Smtp-Source: AGHT+IFcxSaN7jQ1+K3mjUw/WtdscYaPDOhB4/lqR4vB4ziQRYSzLUHt38g+I27kTWY5Oy7Z9/rIww==
X-Received: by 2002:a2e:9306:0:b0:2eb:68d0:88be with SMTP id 38308e7fff4ca-2ee5e375c0amr47332191fa.12.1719921744537;
        Tue, 02 Jul 2024 05:02:24 -0700 (PDT)
Message-ID: <51b4aab3-c62f-4365-9b66-12e1d073bc6b@suse.com>
Date: Tue, 2 Jul 2024 14:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 7/9] xen/riscv: use .insn with operands to support the
 older gas
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
 <a64f0de38fe32da9154d1944195ff6b852ae3310.1719917348.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a64f0de38fe32da9154d1944195ff6b852ae3310.1719917348.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2024 13:01, Oleksii Kurochko wrote:
> Support for specifying "raw" insns was added only in 2.38.
> To support older version it would be better switch to .insn
> with operands.
> 
> The following compilation error occurs:
>   ./arch/riscv/include/asm/processor.h: Assembler messages:
>   ./arch/riscv/include/asm/processor.h:70: Error: unrecognized opcode `0x0100000F'
> In case of the following Binutils:
>   $ riscv64-linux-gnu-as --version
>   GNU assembler (GNU Binutils for Debian) 2.35.2
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Andrew,
> 
> Could you please take a look if you are okay with suggested
> changes.
> 
> Thanks in advance.

I won't wait for too long for a reply here (perhaps until EOD tomorrow), as
I expect the change to be pretty uncontroversial. However, to put it in at
this point I'll need a release ack first anyway.

Jan

