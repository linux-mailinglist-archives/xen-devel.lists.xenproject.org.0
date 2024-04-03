Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA5C8975F5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 19:10:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700612.1094028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs47O-0002U3-7g; Wed, 03 Apr 2024 17:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700612.1094028; Wed, 03 Apr 2024 17:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs47O-0002RX-4l; Wed, 03 Apr 2024 17:09:46 +0000
Received: by outflank-mailman (input) for mailman id 700612;
 Wed, 03 Apr 2024 17:09:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pg83=LI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rs47N-0002RQ-0X
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 17:09:45 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f64567f8-f1dc-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 19:09:42 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-78c4db9fc7fso1814285a.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 10:09:42 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h29-20020a05620a21dd00b00789f57cadc5sm5226649qka.10.2024.04.03.10.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 10:09:40 -0700 (PDT)
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
X-Inumbo-ID: f64567f8-f1dc-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712164182; x=1712768982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RtCQ3SEZFvFduHxvG7MjzrR+Ao+Pj4RDQo++byLROnk=;
        b=ErFpGTejW+ji3MJxl6Uxk5kJ7EJIWQ1aIv6u8H96mChclY3SinpPHfVLB8te99CAL9
         0dat+1ve0aS3Du252skl0pN30b503T8zHzumNphLpXwZNOtSWCTCkA094VhQeilr8Aki
         miKcKvu4eCm54IVcE8aCewqmysBC1Qd7FHjYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712164182; x=1712768982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtCQ3SEZFvFduHxvG7MjzrR+Ao+Pj4RDQo++byLROnk=;
        b=J7JxC2g6YzRPNLzbWEV8hkGmqke4fytcXuqQm4dIgpM/Z3CdjCm1Mjk05nh3wjzAMF
         xUD9CJP6NimW4RMHGErNqxxmXC8U7vHzQ4cHKQ3oHnuC3cmlkLhXq0Udf+89+qMsMbvU
         qgOzdghWE7mh4LB8hdoB2Skf83rv6tGv5Ol3x6N+e5XlGO/GtHvGrImH2QQFphaLL8zF
         K3+OVlJu7BJM/DwV2jBduX4hohaLsrmlp9YXPTUVytlqVI04dlo5MRpJjcL/97YCXyt5
         lnGso2ZePhGbRxfCRbQMIxoYHkspPohA8f7fGkqC00/j2EYU7zliMTmE66XDiWKu9LgG
         GdYg==
X-Forwarded-Encrypted: i=1; AJvYcCUA7UqAOPQ233apM/FaRMkO18U4irZ3pYVadkmJkW6B7fR3/BPF31DJPyAMNdmgW6UE6etzBVGOrjsMB9aDXZ+j5Wh3GJFWHar7uJJQvn0=
X-Gm-Message-State: AOJu0YwZ3FICk3PdLzv68m+5qMCz5S76eIHoA/TccXmRTnZv0NEL5Wb+
	D8gBBPZLE2Vz8tBXARrx79qW/4y9L+x5I5oil0nZuQDe4RPsmu0W8GOXYAcNARb+hz13uNzgXEn
	AEXc=
X-Google-Smtp-Source: AGHT+IFoa0IJOEDT3d9T5CWpBXNWd4E5ZCNJilfawYhDZBm6oXXNO5tqOk/sS2h1G4hwamcwnpZc2w==
X-Received: by 2002:a05:620a:832f:b0:78a:74b3:a0f6 with SMTP id pa47-20020a05620a832f00b0078a74b3a0f6mr6345qkn.25.1712164181592;
        Wed, 03 Apr 2024 10:09:41 -0700 (PDT)
Message-ID: <72fd90fe-c1fa-431c-9ccb-c68ffb56ff76@citrix.com>
Date: Wed, 3 Apr 2024 18:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: text-tsx fails on Intel core 8th gen system
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <Zg1stUacaDBkyDOn@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zg1stUacaDBkyDOn@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/04/2024 3:50 pm, Marek Marczykowski-Górecki wrote:
> Hi,
>
> I've noticed that tools/tests/tsx/test-tsx fails on a system with Intel
> Core i7-8750H. Specific error I get:
>
>     [user@dom0 tsx]$ ./test-tsx 
>     TSX tests
>       Got 16 CPUs
>     Testing MSR_TSX_FORCE_ABORT consistency
>       CPU0 val 0
>     Testing MSR_TSX_CTRL consistency
>     Testing MSR_MCU_OPT_CTRL consistency
>       CPU0 val 0
>     Testing RTM behaviour
>       Got #UD
>       Host reports RTM, but appears unavailable

Hmm - I should make this failure report more obviously distinguishable
from the general logging.

This is reporting a consistency-check failure, with a mismatch between
actual-behaviour and what's in CPUID (host policy in practice).

This is CoffeeLake, and was one of the CPUs which had TSX taken out, but
something looks wonky.


> When I try it on a newer system (11th gen) then it works fine (exit code
> 0, just "Got #UD", no "Host reports RTM, but appears unavailable" line).

RocketLake was after the decision to remove TSX from the client line, so
will either genuinely not have the silicon, or it should be properly
fused out.

Anyway, back to CoffeeLake.

The Raw policy shows rtm-always-abort and tsx-force-abort.  Test-tsx
says the value in MSR_TSX_FORCE_ABORT is 0, but that shouldn't be the
case seeing as the RTM/HLE bits are hidden in real CPUID, but the
CPUID_HIDE bit is clear.

We do intentionally force RTM_ALWAYS_ABORT in some cases, because it
self-hides in some cases.  I wonder if we've got bug in that path.

From the state in Raw, we then synthesise HLE/RTM in the Host policy
because MSR_TSX_FORCE_ABORT only exists on TSX-capable systems. 
However, if XBEGIN is really #UD-ing, we can't offer it as an opt-in to
guests.

Let me see about putting some debugging together.

~Andrew

