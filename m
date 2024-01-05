Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781CB824EDE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 07:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661972.1031825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLe87-0006Zc-Gm; Fri, 05 Jan 2024 06:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661972.1031825; Fri, 05 Jan 2024 06:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLe87-0006Xf-Dn; Fri, 05 Jan 2024 06:56:31 +0000
Received: by outflank-mailman (input) for mailman id 661972;
 Fri, 05 Jan 2024 06:56:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nS5B=IP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLe85-0006XZ-Lt
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 06:56:29 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b72ba18-ab97-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 07:56:27 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cd1232a2c7so16091261fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 22:56:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dn14-20020a056638090e00b0046d17aff31bsm268399jab.157.2024.01.04.22.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 22:56:25 -0800 (PST)
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
X-Inumbo-ID: 8b72ba18-ab97-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704437786; x=1705042586; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MoYyhbl17X5DmfZhtUwBK45nI8GPL7Lj1OThPNob6Qc=;
        b=NiX9JFTKKjJjGQ1cN6+AiETyrUJclMkBfaOZQ6AHSDZa8mTp7y0SYfwb7qvuvj65ZM
         j8DHEnBhoF2lRF2p5lJDp/SBTao9JzejZuwNJNfg3+xZU2Hqvyyp1jDTPmx+tYc6UIN6
         TU0/tJKmYs9OudoSNRPfXLS0RLm7RzzsAUsfXHBu8DO7CXxAojfZMPDEMSXGrT6oW+Zk
         8uFCa45z7iXg+tDKRehOSejNXbiFFy3IVmdddnCRehqycy9YDBAPpgcc2WYJGv6EiaAc
         W/Hw+nrvPwLD6V34qjtlPXNcGxpzruBpgd24QJmkK6BHft0Dy52Ec66Q3dZkhOlwFthI
         /stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704437786; x=1705042586;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MoYyhbl17X5DmfZhtUwBK45nI8GPL7Lj1OThPNob6Qc=;
        b=wghOz0t4S10qAQa6DMhL6pHXasVa5pjSC2/wBFNGi3/EYwDGlCurOcfz+NSc/5o1B+
         Z+1iEiJQBK60Cke8/imILmr2Eypc4GLcJ3JJpNYVxdvGT4frh9KHDPSGxX85YvJ04bjG
         obaBr29c4M/Rdqn4yh+gUgDJIOLjOe0YaEQYKmf0AlV63Ficy9N5VlhG3KfqVeLz/SZp
         YtFJfcz8SECIl4wh4q0hqb6KsXIm67vpVTJB1YHl0ARHkpe1RC2dMjj+VC+JuK+Pk8s9
         j77YPAmPiObZAHCEHRI5DBUGLBgd0MfYS+8Sltf8yOrtslE6nYweSMIfLQrrPshFoBhd
         SPqA==
X-Gm-Message-State: AOJu0YwkyJSUZHVIfxh4vsdM+Y/x2hiMOs3vxVjJR/AU+Y6Z+hTdJsKh
	qPOvqa80uqlgxG1WdtYyq19pqjzHyqdo
X-Google-Smtp-Source: AGHT+IHtwM4QvlqPq3n973MigLexWEmYlnPqD2Q6asl36qjLd6vePFmDu5S4ksb+N8OTRB6SFRdM4Q==
X-Received: by 2002:a2e:a583:0:b0:2cd:16fe:da17 with SMTP id m3-20020a2ea583000000b002cd16feda17mr1082702ljp.71.1704437785869;
        Thu, 04 Jan 2024 22:56:25 -0800 (PST)
Message-ID: <6406b9d4-b5e2-41eb-9cce-93a27086fb8a@suse.com>
Date: Fri, 5 Jan 2024 07:56:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use -Wuninitialized and -Winit-self
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20231228193907.3052681-1-andrew.cooper3@citrix.com>
 <1248487f-4852-41f5-9ffd-d4d12897a622@suse.com>
 <7d35a648-a69b-4dfb-bf4f-d30272df5e9b@citrix.com>
 <d1d43877-912c-4f83-aa9b-bc28be418a0c@bugseng.com>
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
In-Reply-To: <d1d43877-912c-4f83-aa9b-bc28be418a0c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.01.2024 21:43, Roberto Bagnara wrote:
> On 2024-01-04 15:33, Andrew Cooper wrote:
>> On 04/01/2024 1:41 pm, Jan Beulich wrote:
>>> On 28.12.2023 20:39, Andrew Cooper wrote:
>>>> The use of uninitialised data is undefined behaviour.  At -O2 with trivial
>>>> examples, both Clang and GCC delete the variable, and in the case of a
>>>> function return, the caller gets whatever was stale in %rax prior to the call.
>>>>
>>>> Clang includes -Wuninitialized within -Wall, but GCC only includes it in
>>>> -Wextra, which is not used by Xen at this time.
>>>>
>>>> Furthermore, the specific pattern of assigning a variable to itself in its
>>>> declaration is only diagnosed by GCC with -Winit-self.  Clang does diagnoise
>>>> simple forms of this pattern with a plain -Wuninitialized, but it fails to
>>>> diagnose the instances in Xen that GCC manages to find.
>>>>
>>>> GCC, with -Wuninitialized and -Winit-self notices:
>>>>
>>>>    arch/x86/time.c: In function ‘read_pt_and_tsc’:
>>>>    arch/x86/time.c:297:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
>>>>      297 |     uint32_t best = best;
>>>>          |              ^~~~
>>>>    arch/x86/time.c: In function ‘read_pt_and_tmcct’:
>>>>    arch/x86/time.c:1022:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
>>>>     1022 |     uint64_t best = best;
>>>>          |              ^~~~
>>>>
>>>> and both have logic paths where best can be returned while uninitalised.
>>> I disagree. In both cases the variables are reliably set during the first
>>> loop iteration.
>>
>> I suggest you pay attention to the precision of the integers.
>>
>> It is hard (likely prohibitively hard) to avoid entering the if(), but
>> it is not impossible.
>>
>> The compiler really has emitted logic paths where stack rubble is returned.
>>
>>> Furthermore this initialize-to-self is a well known pattern to suppress the
>>> -Wuninitialized induced warnings, originally used by Linux'es
>>> uninitialized_var().
>>
>> I'm glad you cited this, because it proves my point.
>>
>> Notice how it was purged from Linux slowly over the course of 8 years
>> because it had been shown to create real bugs, by hiding real uses of
>> uninitialised variables.
> 
> There is a worse problem for initialize-to-self: it is undefined behavior
> per se.  If this is done to suppress a warning, then what happens is
> paradoxical: in order to suppress a warning about a potential undefined
> behavior (the variable might indeed be always written before being read)
> one introduces a definite undefined behavior.

I don't think so - aiui this is another of the many gcc extensions to the
language (no code is generated for this type of initialization, iirc).

Jan

