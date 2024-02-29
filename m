Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4031C86C8C0
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686986.1069639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffAY-00078W-Ts; Thu, 29 Feb 2024 12:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686986.1069639; Thu, 29 Feb 2024 12:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffAY-00076h-QN; Thu, 29 Feb 2024 12:05:46 +0000
Received: by outflank-mailman (input) for mailman id 686986;
 Thu, 29 Feb 2024 12:05:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPQN=KG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rffAX-00076b-IB
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:05:45 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcab9feb-d6fa-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 13:05:43 +0100 (CET)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-204235d0913so433753fac.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 04:05:43 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e3-20020ac84e43000000b0042a9d64396esm636220qtw.74.2024.02.29.04.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 04:05:41 -0800 (PST)
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
X-Inumbo-ID: dcab9feb-d6fa-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709208342; x=1709813142; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9JxPPytdh+qLVt/LIrS/j0sQiHi3Cz+7vBE29Vl4fg=;
        b=QnvQxzCYyUuXqJkPj6s4x15U/WQ1Y/SBuT52YYIkTr43TjqtBXEANjfFw7+0WVymyr
         S1Tc5UZpqtmX/K0WSY5p8YRJokve82NGaspDUmmH2iuuZIW37YIAMCRHRafG+ql4DBPZ
         qGPPR7M+JlA32V0Im2ncQnXRceOCRuzBpN1yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208342; x=1709813142;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9JxPPytdh+qLVt/LIrS/j0sQiHi3Cz+7vBE29Vl4fg=;
        b=I5wO/Jivepu/iKWqoLHTgLM0On0q7IMkIa+Q73j689FgF6snsf1jgUNU8qzrD1BC1H
         AIVPnSD9Xoz7PlCZ+9dNvo/9P2iKGWd4jiuCosfJyF8bv8WaDVf3CzHbEBVUrwQ6Rftq
         nVXOI26lugfArw5lgQ9ki1TtYgdHQAo7EZeJBzvNeX/lhXB/ACowTlBN0VfSfrTjJTKp
         GwsAsQrlrFnzv8A5/aoPYLlTmYr/OiWVFc5LJShYhf+UAHrb9mCfEjVh/h2CJNZE2g06
         2YtBy64wFj5MIJBMsRGeqpOyVmalM3nnG9SsqLCFkcj9OYQoWpXTaN4GNCJB73PMWVY6
         RP7g==
X-Forwarded-Encrypted: i=1; AJvYcCVd3/F9rGPuxLbMQxmfHmfcFRLC+tMKPv6olaIy4DJ+uKAt8GnUbB4Alg0hRdcP+m3SjB0cOfzYRlCTSxpWfIyKcptgfuizqspsA+s2/OY=
X-Gm-Message-State: AOJu0YyifIh5rQTLyKitQO0uljqddYHwGrCL449j5Q3I1K2PGUb855yQ
	3c6mPZDqNv27W2yu0rXshMtkHDTdLrThNbNGYgL3i9lHrO0btDJOpqF+vGnRr5o=
X-Google-Smtp-Source: AGHT+IEd9smskYDZOioEk/gETWsOQPv5Mj2T2sHYMXtuob9LdKK8GNnvUgl97N0HnmBoeW9q0I+BNg==
X-Received: by 2002:a05:6871:5828:b0:21f:17b4:3842 with SMTP id oj40-20020a056871582800b0021f17b43842mr1682168oac.45.1709208342195;
        Thu, 29 Feb 2024 04:05:42 -0800 (PST)
Message-ID: <cd52114b-c4f1-4bb9-96a4-d802dc50bade@citrix.com>
Date: Thu, 29 Feb 2024 12:05:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
 <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
 <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
 <889b132b-b92e-465b-94af-4e4133e4c297@suse.com>
 <52188e88-374c-449f-a71c-bfce9b6d07f4@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <52188e88-374c-449f-a71c-bfce9b6d07f4@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/02/2024 10:23 am, Julien Grall wrote:
>>>> IOW it is hard for me to see why RISC-V needs stronger restrictions
>>>> here
>>>> than other architectures. It ought to be possible to determine a
>>>> baseline
>>>> version. Even if taking the desire to have "pause" available as a
>>>> requirement, gas (and presumably gld) 2.36.1 would already suffice.
>>>
>>> I think we want to bump it on Arm. There are zero reasons to try to
>>> keep
>>> a lower versions if nobody tests/use it in production.
>>>
>>> I would suggest to do the same on x86. What's the point of try to
>>> support Xen with a 15+ years old compiler?
>>
>> It could have long been bumped if only a proper scheme to follow for
>> this and future bumping would have been put forward by anyone keen on
>> such bumping, like - see his reply - e.g. Andrew. You may recall that
>> this was discussed more than once on meetings, with no real outcome.
>> I'm personally not meaning to stand in the way of such bumping as long
>> as it's done in a predictable manner, but I'm not keen on doing so and
>> hence I don't view it as my obligation to try to invent a reasonable
>> scheme. (My personal view is that basic functionality should be
>> possible to have virtually everywhere, whereas for advanced stuff it
>> is fine to require a more modern tool chain.)
>
> That's one way to see it. The problem with this statement is a user
> today is mislead to think you can build Xen with any GCC versions
> since 4.1. I don't believe we can guarantee that and we are exposing
> our users to unnecessary risk.
>
> In addition to that, I agree with Andrew. This is preventing us to
> improve our code base and we have to carry hacks for older compilers.

I don't think anyone here is suggesting that we switch to a
bleeding-edge-only policy.  But 15y of support is extreme in the
opposite direction.

Xen ought to be buildable in the contemporary distros of the day, and I
don't think anyone is going to credibly argue otherwise.

But, it's also fine for new things to have newer requirements.

Take CET for example.  I know we have disagreements on exactly how it's
toolchain-conditionalness is implemented, but the basic principle of "If
you want shiny new optional feature $X, you need newer toolchain $Y" is
entirely fine.

A brand new architecture is exactly the same.  Saying "this is the
minimum, because it's what we test" doesn't preclude someone coming
along and saying "can we use $N-1 ?  See here it works, and here's a
change to CI test it".


Anyway, its clear we need to write some policy on this, before making
specific adjustments.  To get started, is there going to be any
objection whatsoever on some principles which begin as follows:

* For established architectures, we expect Xen to be buildable on the
common contemporary distros.  (i.e. minima is not newer than what's
available in contemporary distros, without a good reason)

* Optional features explicitly may have newer minima, generally chosen
by when toolchain support landed and/or was bugfixed suitably to be usable.

* Xen won't expect to update minima "just because".  But updates
across-the-board will be considered periodically where it doesn't
conflict with point 1, and where changing the minima allows us to use a
new feature to have a positive impact on the codebase.

* We always reserve the right to update minima to e.g. avoid crippling
code generation bugs, even if it conflicts with point 1.  Where
workarounds can reasonably be done, they ought to be preferred, but this
is ultimately at the discretion of the relevant architecture maintainers.

?

~Andrew

