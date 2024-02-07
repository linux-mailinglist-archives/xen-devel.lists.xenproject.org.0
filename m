Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C184CDCF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 16:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677759.1054586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjf8-0006fT-Mm; Wed, 07 Feb 2024 15:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677759.1054586; Wed, 07 Feb 2024 15:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjf8-0006cq-J7; Wed, 07 Feb 2024 15:16:34 +0000
Received: by outflank-mailman (input) for mailman id 677759;
 Wed, 07 Feb 2024 15:16:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7Cu=JQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rXjf7-0006ck-8O
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 15:16:33 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dffd0606-c5cb-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 16:16:32 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a38392b9917so104824066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 07:16:32 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ty20-20020a170907c71400b00a3890e238c2sm390526ejc.49.2024.02.07.07.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 07:16:31 -0800 (PST)
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
X-Inumbo-ID: dffd0606-c5cb-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707318992; x=1707923792; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Az41Ic58DspSSGy3hwXVQtcJeCUrHwtkL7/lJNxi2uQ=;
        b=czyphCbWMc36vQC4+5yFq2uk9J4qBng1RvCmalzuC+U2ZWuM9+he2iIlYyIGmxujIQ
         TVNxdjgZ0Cpt3BxdDVhUWu1Xksn0D1wGVbYVa6fFEeP6W9NYDGlB8UrCDAOnWOldt9y8
         79YisaK/A526ia6hx9Kc6eu2+0ke96D/AWDXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707318992; x=1707923792;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Az41Ic58DspSSGy3hwXVQtcJeCUrHwtkL7/lJNxi2uQ=;
        b=TGBG1gCMLnQDz4byH5UYeDcC0mYII/7icS5rwX5f+Z9dpSmj1YTTop9LsRFwLmBels
         rY6Chn3eYXZX6x0t3t1d3H9jwUBdPrawPsKhPE3skWCgrXTSdd2sk4Ns7cxK7PqTS4t1
         NwEaPs1MxwCQHXxv0V/2mPUG117sfqsxurkwSm7zG8XZtJstcjpeT2hCyFJCGiYEytAw
         hhHRIwVDrBqe9mqmNs0dTz6xw+c6idJXzWxkgXr7HdiCJJci4vOdKkkNvJXAp+xxCByK
         P51fUwpRuJx8Gwy5xeWrvQLhBFe+4yB5ulYXpNwg898f/GHBJl7l8qJSQ8YIdZavcmvV
         xYlA==
X-Gm-Message-State: AOJu0YwCG1BQTu4mOc8c8nq96PCM3hxBX9OuUNcQfpZDWDaUqDnmuz9l
	rKGDG1A1qLUSNMEmQ8A7Sfjyu+8yZAjOSZyQzgdcIMkv2gtLeUDoJMI5TguEuAHoa3tXUfWzz/W
	D
X-Google-Smtp-Source: AGHT+IFBdvYPJCpzBG7wj1ydOARTl+Ioh7VKiMrOKV8YrO9jXEJXuC48GLArUB06hYVZ5GY2qUD5gQ==
X-Received: by 2002:a17:907:784e:b0:a36:f811:44f5 with SMTP id lb14-20020a170907784e00b00a36f81144f5mr3626245ejc.47.1707318991843;
        Wed, 07 Feb 2024 07:16:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzCkHiblwylHKZvOzOcbM8UjS9DldL68rqlXMsc2w6+FXf6LD3aWkZ+JmxjEGeCg8eaOSiYffPvlsL+7d+CTcRrNmxaXWhgLQRe/B6hVg=
Message-ID: <c443cb04-177b-4207-a9a1-3a0dca32fd28@citrix.com>
Date: Wed, 7 Feb 2024 15:16:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | f4519ee8
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65c38d7a7ea07_2d1b5321c96792@gitlab-sidekiq-catchall-v2-779bdffdc8-kp98w.mail>
 <115f10ac-a115-40d1-a444-50e960320557@suse.com>
 <65665f86-cbfc-4352-9d81-67ac0b21b161@citrix.com>
 <CAKoJhMROFw1w679U9xsW6s4p34Zzm6-gaHihUHtU1w5ZH9ViUQ@mail.gmail.com>
 <f1f74e69-8892-4615-8411-f7a1329dd76c@citrix.com>
 <CAKoJhMTaO+LW0Mm3mn+XXgxxM-=T5QwGacG5oGKwF-egEmes0Q@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAKoJhMTaO+LW0Mm3mn+XXgxxM-=T5QwGacG5oGKwF-egEmes0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/02/2024 3:10 pm, Anthony PERARD wrote:
> On Wed, Feb 7, 2024 at 2:55 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 07/02/2024 2:34 pm, Anthony PERARD wrote:
>>> On Wed, Feb 7, 2024 at 2:24 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>>>> Stage: test
>>>>>> Name: qemu-smoke-riscv64-gcc
>>>>> I have to admit that I can't connect what was pushed recently to this job
>>>>> failing.
>>>> The qemu smoke tests for riscv and ppc intermittently fail on the
>>>> OSSTest-lab infrastructure in Gitlab.
>>>>
>>>> We've never got to the bottom of it.
>>> It's maybe because joubertin* and nocera* have more than one NUMA
>>> nodes. It's look like 2 for nocera* and 4 for joubertin*.
>>> Would that be enough of of an explanation about those tests taking a
>>> bit longer than expected?
>> That feels a bit like a blind guess.
> Yes, but I think I did a test earlier, and the riscv test took more
> like 10 seconds, but can also easily finish in less than a second. I
> did the test a while ago, so I could misremember.

Ok - that is a wild variation.  Something wonky is clearly going on.

>
>> What hardware are these?  They're rather old, I seem to recall?
> nocera: http://logs.test-lab.xenproject.org/osstest/results/host/nocera1.examine/

AMD Opteron(tm) Processor 4133

a.k.a. Lisbon uarch from 2010.


> joubertin: http://logs.test-lab.xenproject.org/osstest/results/host/joubertin0.examine/

AMD Opteron(tm) Processor 6376

a.k.a. Abu-Dhabi uarch from 2012.

> nocera have been here for a while, since before 2015. I don't really
> know how to find out how old the machine is. joubertin* have never
> been used with osstest so far, but the first mention of it I can find
> of it is from 2017.

They were ancient when added to OSSTest.

~Andrew

