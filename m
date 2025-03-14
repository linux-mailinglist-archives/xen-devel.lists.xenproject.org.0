Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A66A60B44
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:24:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913953.1319792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0L8-0004pN-1m; Fri, 14 Mar 2025 08:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913953.1319792; Fri, 14 Mar 2025 08:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0L7-0004mF-VB; Fri, 14 Mar 2025 08:24:21 +0000
Received: by outflank-mailman (input) for mailman id 913953;
 Fri, 14 Mar 2025 08:24:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt0L6-0004m9-QV
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:24:20 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b363b4fc-00ad-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 09:24:08 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so11962615e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:24:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d2010e0bfsm9156875e9.36.2025.03.14.01.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 01:24:09 -0700 (PDT)
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
X-Inumbo-ID: b363b4fc-00ad-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741940650; x=1742545450; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jwsBmNW/8kfrYzUlhKaC61M0iEjDzrCkrpi4vsxyy7s=;
        b=Wd2paPCmk83AYtBDpCOmZEHIRSFn5fR26cf+vK+tYKbxPwbOgXx2QWS7NxcT5FjXae
         0RY28g9gbH7SJiMsj39ScV8YXX5B0TZJwgTY2VGPm1t2IHuvtB36dgsdForyJRCpJKr3
         hVqqy6hzVKMhElpntPz7JqnrvJWHWUMcQ2fd/mRRkYNQkxoUt8Kfc7tVbt2/o1eIz7aJ
         F5+6KbqM2hQkJ9aNrDel5zvwm1VzHViP5tf2mkwmVUvHxs9kFolLWy9fweKDivWs2qJp
         DfndA3dW+bVlXpE5YBEQH5O8+EsFgFQBcq9dcyHFz4bSkhAatJV8k31MO/zh5kXmbrSS
         wNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940650; x=1742545450;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwsBmNW/8kfrYzUlhKaC61M0iEjDzrCkrpi4vsxyy7s=;
        b=VkVU/m0BLVrc6gMqhvhXRMhT3G9zgGogMHBjTXaSuPFrgvnX5xetF/5KiIGqiZPkp8
         AkM+9qVEsu2QHu90Hoax8wEtX5Be4Z0ZW/NxTRdANRltSizdV3od/aIn68sxyCPfWaVX
         VLiKRNcn24nwU8Es3tAcRnAUfBbtJLS4kloy0HS+9vtag2Sm3uzklyMMbxMx6dLLfMwi
         gpwoPt4LrGe7L2Qp8sBMg9WrZO6izRnI46zkl8vjmwx10UyWzaXY7O/C/omrpfepISpK
         00MFo7LK6JfsEGU0YGJOkIGLHH62crPLIowxpYvR5X4UeYbT7LcnufgGiyBFkQNt1ay6
         9Gcg==
X-Forwarded-Encrypted: i=1; AJvYcCWsXO/YqSw8+30/MRCsj3nvBZ+9AsylBh4ZxQGYsN1p+B0nrWVfMP+4RHYfwus6J9FxkD2QD8xIMOo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyE4LblURYZQpnN6ftpA/IiQ4zdlRrSRHqDe7JM71Vjkm1PVpQz
	rPqJP1uGTLt9BvT3BX6jDA2bsUh9I3ukH3GeC4AuGf+2nC/8xTi3BL5oOvSIog==
X-Gm-Gg: ASbGnct7S8T/1wDDzlCONgF1o73ASgm0dTgkrb/w71VxAHJ8MM5LcN++LryfiIH0fhC
	3vCRHOm/tPCrgqXraMUmAV/yywKa1+97scdEHO1rNZj0fMTvP0Li0sxNh/NENfV6h7eIcaE9j1k
	UQXqZ74Eay5/h59GfgGz09U+rifuRKgCED/LYX45ch7kGsHzf2eVDmLVVySgkg+8DLPwvBx+Sqk
	JgY9Zs9UCh9ZtP952pSxmRk+0yVqZUhF/lxWwTV8yb8SPvCfARdej62eeBc+bhnjK7+6lTSGTQZ
	jIlV2wPIVUlxcIJjEXRHaJraIxjVB0sB/pTFwMlrQtqlDQoYjif6aBPdonIGbRxgNwU0hZnqWWR
	WkLKpHNbwhxmW2Ciu6wClpUtV2SDdpQ==
X-Google-Smtp-Source: AGHT+IHMJ0v90zEE/6k2/m4k3QhOxuKYO16QxY8K5baR8X8ghcqPy44jMuPxfi7k7D5YRl0mzW7Hdg==
X-Received: by 2002:a05:600c:3c9e:b0:439:9737:675b with SMTP id 5b1f17b1804b1-43d1f1f3fccmr17802375e9.7.1741940650162;
        Fri, 14 Mar 2025 01:24:10 -0700 (PDT)
Message-ID: <8c58e1d6-b591-4211-9364-fa586a5c6d2e@suse.com>
Date: Fri, 14 Mar 2025 09:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/wait: prevent duplicated assembly labels
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-3-roger.pau@citrix.com>
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
In-Reply-To: <20250313153029.93347-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 16:30, Roger Pau Monne wrote:
> When enabling UBSAN with clang, the following error is triggered during the
> build:
> 
> common/wait.c:154:9: error: symbol '.L_wq_resume' is already defined
>   154 |         "push %%rbx; push %%rbp; push %%r12;"
>       |         ^
> <inline asm>:1:121: note: instantiated into assembly here
>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
>       |                                                                                                                                ^
> common/wait.c:154:9: error: symbol '.L_skip' is already defined
>   154 |         "push %%rbx; push %%rbp; push %%r12;"
>       |         ^
> <inline asm>:1:159: note: instantiated into assembly here
>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
>       |                                                                                                                                                                      ^
> 2 errors generated.
> 
> The inline assembly block in __prepare_to_wait() is duplicated, thus
> leading to multiple definitions of the otherwise unique labels inside the
> assembly block.  GCC extended-asm documentation notes the possibility of
> duplicating asm blocks:
> 
>> Under certain circumstances, GCC may duplicate (or remove duplicates of)
>> your assembly code when optimizing. This can lead to unexpected duplicate
>> symbol errors during compilation if your asm code defines symbols or
>> labels. Using ‘%=’ (see AssemblerTemplate) may help resolve this problem.
> 
> Move the assembly blocks that deal with saving and restoring the current
> CPU context into it's own explicitly non-inline functions.  This prevents
> clang from duplicating the assembly blocks.  Just using noinline attribute
> seems to be enough to prevent assembly duplication, in the future noclone
> might also be required if asm block duplication issues arise again.

Wouldn't it be a far easier / less intrusive change to simply append %= to
the label names?

Jan

