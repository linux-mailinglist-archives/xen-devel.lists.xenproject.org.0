Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0A19856C0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 11:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803738.1214506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOlO-0004tc-Uq; Wed, 25 Sep 2024 09:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803738.1214506; Wed, 25 Sep 2024 09:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOlO-0004rG-Qg; Wed, 25 Sep 2024 09:56:50 +0000
Received: by outflank-mailman (input) for mailman id 803738;
 Wed, 25 Sep 2024 09:56:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stOlN-0004qd-B0
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 09:56:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ae804b6-7b24-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 11:56:48 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so1025743466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 02:56:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f54691sm190393866b.85.2024.09.25.02.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 02:56:47 -0700 (PDT)
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
X-Inumbo-ID: 7ae804b6-7b24-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727258208; x=1727863008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WitlP4SI8tcude7ysgitQCt6YWjBEsiX7Dx9nDPXIQo=;
        b=X87Kt5+kO08z1bE6+13TBchWEYt8iYjnHmSVfFIjN7fxIa+ylztiF+1K7ysPvaEE19
         POpU4nP+ROogzDE1/gkcZubJXS9lDbG2jpI93BOtka+SL39uhqd0U17xv4e5cwconfow
         1jnG/E03il54NPZiZoy+clzarRLsWpEKNaa8LKjAIbmMFf3bz3s0kNezt0QszNLUXl1h
         YHfXKw1W4xwp121rykW+s7yPfmUQG4g6kuJ+rDFI9Z/nwW5ZI/DWmrYzO9IDTi2dWw9w
         pYdIHwA1D1SL2Az+sAZk2vGVdAGWBoSIYaQKhUfpeYUPY9g5HIAKqyMKrYobVCXESQZ0
         mv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258208; x=1727863008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WitlP4SI8tcude7ysgitQCt6YWjBEsiX7Dx9nDPXIQo=;
        b=QcD9SREC7FVvCZGjd+9Nnn8glxOHWiqgc+q0E1G/OeTq9eK0eQbazlpmIRDJMHCI18
         j1Ob3vcpKbV29U0Ly7gEFC0ndKAlors8Ytx15OYlPzqAx+gidayoesh1WBHplKDhRqdm
         LILF9ew2vJRr4ZLWR7lLzWWdWK085/us8ogqnS/VOtXGhZoTEb28tqd0z+c+AjnRo7uS
         uthtyEKID2plpZx5Oq/bobvQoikNFDI2JLGo/aGeg+5scFreP8fAVzCzjyY7UhQDzwkg
         1aN79X/iuI0NI1VEu/u1OWkJunf+OZXDO5T2Fw+2sbV0zjxi3D94mWU122Yff2H3cvzr
         W4iw==
X-Forwarded-Encrypted: i=1; AJvYcCVg9lF5enuU09bXaUGYZ4nPiJcApEkWrRkmx3QSmogZ0MTFYWw6ztNQxHRjr9nIDdP1BA3mxZHf59w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzusSY70m0HrluflbUXEGtf8Co/hUgKmrFQABujT0Ld8EOqFLyk
	m/jZ2A7glukWic2P7nvmX/toF6uX11NaK/9izS4aqUsE+4bIDx7wQlk6Zlctkg==
X-Google-Smtp-Source: AGHT+IHsuU0VhMG4IXbv7HI+YdrLD3CYkfTPevABbjrbkF9KupdnPyZgOOLfvg/CJawqSXQcPmmacQ==
X-Received: by 2002:a17:907:60c9:b0:a8d:14e4:f94a with SMTP id a640c23a62f3a-a93a03c41a7mr219649066b.38.1727258207813;
        Wed, 25 Sep 2024 02:56:47 -0700 (PDT)
Message-ID: <a8c16fd6-1bad-49a7-b623-29c31d3ed24a@suse.com>
Date: Wed, 25 Sep 2024 11:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen: introduce common macros for per-CPU sections
 defintion
To: oleksii.kurochko@gmail.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1727185495.git.oleksii.kurochko@gmail.com>
 <27aba3aae7f4a5d4694ab141dca325d7231f2f66.1727185495.git.oleksii.kurochko@gmail.com>
 <7857cbd9-c26d-4d31-97c6-8a1f34dd4559@citrix.com>
 <2b6624d147c0e86bdd3839e113953c282e742d17.camel@gmail.com>
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
In-Reply-To: <2b6624d147c0e86bdd3839e113953c282e742d17.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2024 11:23, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-09-24 at 18:01 +0100, Andrew Cooper wrote:
>> On 24/09/2024 5:42 pm, Oleksii Kurochko wrote:
>>> Introduce PERCPU_BSS macro which manages:
>>>  * Alignment of the section start
>>>  * Insertion of per-CPU data sections
>>>  * Alignment and start/end markers for per-CPU data
>>> This change simplifies the linker script maintenance and ensures a
>>> unified
>>> approach for per-CPU sections across different architectures.
>>>
>>> Refactor the linker scripts for Arm, PPC, and x86 architectures by
>>> using
>>> the common macro PERCPU_BSS defined in xen/xen.lds.h to handle per-
>>> CPU
>>> data sections.
>>>
>>> No functional changes.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Changes in V2:
>>>  - rename PERCPU_SECTION to PERCPU_BSS
>>>  - update the commit message
>>>  - add Acked-by: Julien Grall <jgrall@amazon.com>
>>>  - add Acked-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>>
>>>  xen/arch/arm/xen.lds.S    |  9 +--------
>>>  xen/arch/ppc/xen.lds.S    |  9 +--------
>>>  xen/arch/x86/xen.lds.S    |  9 +--------
>>>  xen/include/xen/xen.lds.h | 10 ++++++++++
>>>  4 files changed, 13 insertions(+), 24 deletions(-)
>>
>> Aren't you missing a hunk in riscv/xen.lds.S ?
> I thought it would be better to add a hunk in riscv when
> percpu_init_areas() will be called in RISC-V's start_xen().

But you have the constructs you're replacing for the other architectures
in RISC-V's xen.lds.S as well. They shouldn't stay around. It was actually
an oversight of mine, so to retain my ack you will need to replace that
too.

Jan

