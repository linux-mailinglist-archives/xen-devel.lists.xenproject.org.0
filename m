Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E624996CA8A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 00:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790808.1200572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slybO-0005P1-JM; Wed, 04 Sep 2024 22:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790808.1200572; Wed, 04 Sep 2024 22:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slybO-0005ML-GN; Wed, 04 Sep 2024 22:35:50 +0000
Received: by outflank-mailman (input) for mailman id 790808;
 Wed, 04 Sep 2024 22:35:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slybN-0005MF-LC
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 22:35:49 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0797f2ae-6b0e-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 00:35:47 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-374c4c6cb29so37641f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 15:35:47 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a623a9aa6sm47014666b.149.2024.09.04.15.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 15:35:45 -0700 (PDT)
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
X-Inumbo-ID: 0797f2ae-6b0e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725489347; x=1726094147; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GB/HNtH4EuFvvcN/gECue2pWoXzh0Xs5e2/OBajVI9g=;
        b=mJKlRWvv0VzocHZT9JeFiTqksIHoy3qCWlFWOacZZ5rgkjEFfvswwKhX3kTqb2Zgbi
         wL9smPSdKY6c5B9d6eplrGPjGCISSocEsdNhybvKQFmGP3f+ykItLukIAzH6JWcYkOuv
         R6N6qPC+CKLelL0NNaVi9AW37YFgoyEUHR4Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725489347; x=1726094147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GB/HNtH4EuFvvcN/gECue2pWoXzh0Xs5e2/OBajVI9g=;
        b=UGpKKgiX4ryw9hIRsnJ/wh6Wnyf9Jbwxaj/1DTskCLGw5eFXC20p7kCI3FIN05AFPP
         wbN8cGraBdH41vTrwVogxC885rTfKHXeyzbgBLrP5cM5+/iOPixv+wPPTyC1T9pPfiI2
         WgaaiVWob4z9QaQGVAFj1hOa9YWaWqlohw4gVdztrrbwuTdKZAOEd9lsZ15HQa8neuGh
         Hqm5Wv6/RGRnPs53ZSZomfdm25QNG/oZhZwRSJ7E0dkcOBVl0Xbu73WwTH42O0/Uasiv
         pHmfpzJSq3vHbc9M98EoJtPMV5e2FndMPz6smPi2dj2x545Lz5/zi7bOVjWrU90A7f1y
         B49A==
X-Forwarded-Encrypted: i=1; AJvYcCU0SKYoiCLAQVpmowC+Ek4995rb7YvJKbq74h1kdEYL9wtB6NU+C/4kyLxw/m2axeBEtSGnYDy+zfg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywgnb+8lN6CpoHWa83IBMml460IgNyE5ZtJLRmNN1R9o1tnprMn
	l6EAwIYWoFAwlR1WEVft13DOof4NXE8Y8TcxSzN34fZESBg442cBXRxsluzOPR8=
X-Google-Smtp-Source: AGHT+IHwiePSR3+pnQGc9FqTDul/g7l2al670Gz9SVm/Aif/mCeo9lq/M/b1bDxMgfhBP7FTBUijGQ==
X-Received: by 2002:a5d:668a:0:b0:374:c11c:c5ca with SMTP id ffacd0b85a97d-374c11cc70cmr11230084f8f.46.1725489346341;
        Wed, 04 Sep 2024 15:35:46 -0700 (PDT)
Message-ID: <44dff12e-2fb8-45e9-b416-1c82cc90df20@citrix.com>
Date: Wed, 4 Sep 2024 23:35:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] x86/bitops: Use the POPCNT instruction when
 available
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
 <20240828220351.2686408-12-andrew.cooper3@citrix.com>
 <48377e77-2458-439c-b594-21bde610ffbb@suse.com>
 <f661dca1-0583-4a83-89db-662473749df8@citrix.com>
 <1cab3807-706b-44fc-a074-d44dfd9fd446@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1cab3807-706b-44fc-a074-d44dfd9fd446@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2024 9:06 am, Jan Beulich wrote:
> On 30.08.2024 22:03, Andrew Cooper wrote:
>> On 29/08/2024 3:36 pm, Jan Beulich wrote:
>>> On 29.08.2024 00:03, Andrew Cooper wrote:
>>>> It has existed in x86 CPUs since 2008, so we're only 16 years late adding
>>>> support.  With all the other scafolding in place, implement arch_hweightl()
>>>> for x86.
>>>>
>>>> The only complication is that the call to arch_generic_hweightl() is behind
>>>> the compilers back.  Address this by writing it in ASM and ensure that it
>>>> preserves all registers.
>>>>
>>>> Copy the code generation from generic_hweightl().  It's not a complicated
>>>> algorithm, and is easy to regenerate if needs be, but cover it with the same
>>>> unit tests as test_generic_hweightl() just for piece of mind.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> v2:
>>>>  * Fix MISRA 8.2 (parameter name) and 8.5 (single declaration) regressions.
>>>>  * Rename {arch->x86}-generic-hweightl.{S->c}
>>>>  * Adjust ASM formating
>>>>
>>>> The __constructor trick to cause any reference to $foo() to pull in
>>>> test_$foo() only works when both are in the same TU.  i.e. what I did in
>>>> v1 (putting test_arch_generic_hweightl() in the regular generic-hweightl.c)
>>>> didn't work.
>>> I'm afraid I don't understand this. What exactly didn't work, breaking in which
>>> way? Presumably as much as you, I don't really like the global asm() in a C
>>> file, when ideally the same could be written with less clutter in an assembly
>>> one.
>> We have lib-y because we wish to not include arch_generic_hweightl() if
>> it isn't referenced.
>>
>> But, test_arch_generic_hweightl() unconditionally references
>> arch_generic_hweightl() (in CONFIG_SELF_TESTS builds).
> Which I assumed was intentional: Always have the tests, to make sure the code
> doesn't go stale (or even break).

Come to think of it, we already have two subtlety different things.

common/bitops.c is SELF_TESTS only, and does both compile time
(constant-folding) and runtime (non-folded) tests on the top-level APIs.

This checks that the compiler agrees with the test parameters that I (or
hopefully in the future, others) have chosen, and that every arch_$foo()
override agrees with the compiler version.

It has already found bugs.  Both __builtin foo() vs fool() mismatches
and I dread to think how long a bugs like that could have gone
unnoticed.  I caught ppc's arch_hweightl() before posting v1, but noone
noticed ARM's arch_flsl() snafu when it was on the list (I found it when
retrofitting SELF_TESTS around the series).


Separately, anything that causes any {arch_,}generic_$foo()'s to be
included also pulls in the SELF_TEST for that specific function. 
They're runtime only tests (no constant folding in an intentionally
out-of-line function).

But, it was intentional to try and make CONFIG_SELF_TESTS not blindly
pull in the unused generic_$foo()'s.  They'll get tested if they are
referenced in a build, but the tests are only liable to break are during
bitops development or a new/weird arch/environments.

Furthermore, I expect (/hope) that we'll get to the point where we're
being conservative with selftests.  It's part of why I'm trying to keep
the current ones pretty lean.


> Looking at the v2 code again I notice that while now you're running the tests
> only when the to-be-tested function is referenced from elsewhere, the testing
> has become independent of CONFIG_SELF_TESTS. I don't think that was intended?

Correct - that was an oversight.  The CONFIG_SELF_TESTS guard wants to
go back in.

~Andrew

