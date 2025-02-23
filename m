Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B95A40D48
	for <lists+xen-devel@lfdr.de>; Sun, 23 Feb 2025 08:43:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894860.1303526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tm6d6-0004nI-NL; Sun, 23 Feb 2025 07:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894860.1303526; Sun, 23 Feb 2025 07:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tm6d6-0004kq-KJ; Sun, 23 Feb 2025 07:42:24 +0000
Received: by outflank-mailman (input) for mailman id 894860;
 Sun, 23 Feb 2025 07:42:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=omsT=VO=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tm6d5-0004kk-Py
 for xen-devel@lists.xenproject.org; Sun, 23 Feb 2025 07:42:23 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b722737d-f1b9-11ef-9896-31a8f345e629;
 Sun, 23 Feb 2025 08:42:21 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5452ed5b5b2so3471186e87.0
 for <xen-devel@lists.xenproject.org>; Sat, 22 Feb 2025 23:42:21 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-547bcef2eeesm790997e87.9.2025.02.22.23.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Feb 2025 23:42:19 -0800 (PST)
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
X-Inumbo-ID: b722737d-f1b9-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740296541; x=1740901341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xFWLQFeIdSTFot1VphEeZPJlYoCfgH/VxaTWLOP8tI=;
        b=H/qqT3dHJQQkkwaW/BoAaLrzszJasvzbr5uZ2BaGx03bUyqlcIYjgfbDsTXRKuhujg
         4YmJvSFztM0IVRZXKDiJuu8jsG8ERy5FxzDJNVVNwOvHEfHHaqJCd3KSUfCEithVrls1
         NWs2YM86TIP4MhIvd448OAvk0IhTNSIrsinxk639lYmCfCnmR4tkWFPV6VIEbuvNN0n2
         MP2OeJWy4o+EqtGnfNxJ3YbO6g46rQwUTBcuThXz1ac6WN2LpwIKlu66nfgWCp4MUefM
         4BRn+PPJesvxQvwnBOJ95A9VIlZ6hUXVQhRVsa2+9f4ckl+XuVUqjQhcorCKMUaVkI7f
         kVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740296541; x=1740901341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xFWLQFeIdSTFot1VphEeZPJlYoCfgH/VxaTWLOP8tI=;
        b=tqwgdV8CQI/VKWIlbOWQpTMePht7jbitFsXkcDqWCTFwKnjqP+ELvXtfP23De5n2Wj
         UlSIxNlrii4CYAbPwbqu+DbHWcc+BlBD+R5JGE16pp+OP3YUAUha0RjGN3Vf803ppH9S
         fx7tOYOvXZIgWZMPsm2PSZOKTstQbjHjakciz3gI5A+FNDjadMzLa7ymAG0TWUEGIsSD
         D0Br/e/xHiNkZsLWHgCnOW10ul0YelnHGjNVx1jiys0UyiLHg6Sev24uDuZIIDs0YGT9
         fUgJ3/hCeg7BJMouLIBdVMAtCl0GZLx30w9lCfX7xDGzJnyLExKJmgD+ySeIJtqPUXUn
         LUgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE8XU5C9rwIjJY7ot3E38FE5uAczcm2MaFVKIeaeLf4Ffr76sAxWUyjFpEhveI9RoJTClJ6L2a8R8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4L/99hLESbXaYz9RNgyTKFAA3g4PZvqqr5Ls85NLpQFuV0Rb6
	xJTcH0SQOpybOLpq8Pi8sUCg90yBqBu8SwtO4hAK/ZYg1CgTC2Wb
X-Gm-Gg: ASbGncvPodq8ioXwnSWTHSFY/yMdWwk3K7eE0UpusVsCdUPAjhytxYGzeamjmD/m311
	Qp+5iE6nkNQQuvZF9C1EjTz2n50rqYU9o1bGwpBmIjKe0ava/esbrzsKSEKNHVyZhLq1olY47lT
	xRWSnzn85lSikKOwe+qCYuPzRqALoTo76zoFVrbyU87+z96RMRvDBg4akVq3xcWzU+APAbm2njh
	f9RbOx8/5EtXr7JKjcSwuevFACh7wFhVkhDFLX6SICrZ83K4U6dBbtzXXdenL1UcyARIfLMu0yG
	9yOQr7SOEkxR52TsOPWubgp73GI=
X-Google-Smtp-Source: AGHT+IFLt7eQTTyLBF9rzF3bGPF6QD0Ww75UOpPU4pJiGG8cdsx/VAZADb+zW5Z4YBL94FVlHYV4OQ==
X-Received: by 2002:a05:6512:3f0d:b0:545:bda:f0d with SMTP id 2adb3069b0e04-54838f4e585mr3757359e87.37.1740296540694;
        Sat, 22 Feb 2025 23:42:20 -0800 (PST)
Message-ID: <020f1294-cd11-4733-a518-f4a42f146a83@gmail.com>
Date: Sun, 23 Feb 2025 09:42:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Artem_Mygaiev@epam.com,
 Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, xen-devel@lists.xenproject.org
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <4f1fcad5-dd6c-471f-9496-023973fa8857@suse.com>
 <alpine.DEB.2.22.394.2502171833370.1085376@ubuntu-linux-20-04-desktop>
 <f6db4e23-8c6e-43a5-a90a-ea3526f88b23@suse.com>
 <26cfd51b-123f-48e7-9911-2c96b48abdfe@gmail.com>
 <f0a4af56-016f-4ea7-92a8-6f6f4a62809a@suse.com>
 <924753a2-8abc-4d49-84f9-6f4677bf76f1@gmail.com>
 <alpine.DEB.2.22.394.2502191725300.1791669@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksandr Andrushchenko <andr2000@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2502191725300.1791669@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Stefano!

On 20.02.25 03:34, Stefano Stabellini wrote:
> On Wed, 19 Feb 2025, Oleksandr Andrushchenko wrote:
>> Yes, I do agree. But only if we talk about having an automated
>> code style check now (which is definitely the goal at some time).
>> Before that we could still use the tool to take all that good that
>> it does and manually prepare a set of patches to fix those
>> code style issues which we like.
> Let's explore this option a bit more. Let's say that we write down our
> coding style in plain English by enhancing CODING_STYLE. This newer
> CODING_STYLE has also a corresponding clang-format configuration.
>
> Now, we cannot use clang-format to reformat everything because, as we
> are discovering with this example, clang-format is overzealous and
> changes too many things. Instead, we take "inspiration" from
> clang-format's output but we manually prepare a patch series to apply
> code style changes to Xen as the coding style today is not uniform
> across the code base and also not always conforming to CODING_STYLE.
>
> At this point, we have already made an improvement to CODING_STYLEe, and
> made the Xen coding style more uniform across the codebase.
>
> But do we also have an automated coding style checker that we can use?
It really depends on what that coding style would look like and
if the rules we impose are supported by clang-format and if we ready
to change ourselves if they are not.
Again, here we are trying to do what we already did, but in the opposite
direction: "diff -p" didn't work as expected(?) and we have changed
*our* coding style to *fit that tool*. So, are we ready to do the same for
another?
Funny, but I checked diffutils and they have a test case for that behavior
of the "diff -p" that we are trying to avoid. So even if we provide a patch
to diffutils we would need a good reasoning why their behavior is
wrong and needs fixing.
> Can we use clang-format to check new patches coming in?
Yes, we can use git-clang-format for that. clang-format is flexible enough
in its configuration. So, it can be used for checking patches with different
coding styles by providing .clang-format files at any folder level, e.g. we may
have something like (just to show an example):
- xen/drivers: Linux style .clang-format
- xen (rest): Xen style .clang-format
- libxl: its own .clang-format
- etc.
We can also disable formatting for the entire folder if need be by putting
a .clang-format with "DisableFormat: true" option in it.
clang-format respects the nested configuration files

So, to answer your question: I think we can use the tool to check incoming
patches.

>   Or would
> clang-format flag too many things as coding style errors?
It really depends on what we decide: if we are ready to change our coding
style Or if we just want to skip entire folders from formatting, etc.
>
> If it is flagging too many things as error, so we cannot use it as
> automated checker, is it still worth going through the exercise? Yes, we
> make some improvement we haven't reached the goal of having an automated
> code style checker.
My impression from all these conversations is that most of the community
can see that there are lots of places where clang-format does the job
right. At the same time there are places which we do not like.
Some of those we don't like can be discussed though as some feel
like "I personally like it" or "don't like", e.g. depend on one's perception.
We would need to accept the fact that if an existing code sample does
conform at the moment, but still clang-format may re-format that code
as well. Just because it will try to improve the code. Or "improve"

So, the bottom line would be: yes, this can turn into a series of patches
which will improve the coding style and fix the obvious. And then we
can see what is left when we try to automatically run .clang-format at that
stage and decide.

We can also wait for "Year, 2034. Coding style, clang-format-AI. Attempt 21"
letter in the future.

We can also claim that "the coding style is perfect as it is, handmade and
no robots allowed".

So, I would love to hear from the community what is the best route here.

Thank you,
Oleksandr

