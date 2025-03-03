Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F8FA4CBEB
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 20:20:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900580.1308447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpBKZ-000304-Co; Mon, 03 Mar 2025 19:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900580.1308447; Mon, 03 Mar 2025 19:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpBKZ-0002xt-A3; Mon, 03 Mar 2025 19:19:59 +0000
Received: by outflank-mailman (input) for mailman id 900580;
 Mon, 03 Mar 2025 19:19:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpBKY-0002xn-Ha
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 19:19:58 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e7a6227-f864-11ef-9ab3-95dc52dad729;
 Mon, 03 Mar 2025 20:19:57 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-390effd3e85so3504651f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 11:19:57 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4844a22sm15467213f8f.74.2025.03.03.11.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 11:19:56 -0800 (PST)
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
X-Inumbo-ID: 7e7a6227-f864-11ef-9ab3-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741029597; x=1741634397; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xHzR2ZDLxVKksYckw4Jw1vc5Tj+aiXOQ4HPFz25BPEM=;
        b=m51qLlLY77+YHT0oim6tyzbgWoLoUs1MO6Nh63pmg8DPAktM+FnYNCkteBDGczhCia
         LKeHD1OkGcYwroxPBerDGyiWL4sb/IyxfOoSRIccqnSh6/CdXpU3Otw6xLILQHbtEuRY
         PNs05enFZx/1BZcyanS9K8Aa+ORblxtxlW7/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741029597; x=1741634397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHzR2ZDLxVKksYckw4Jw1vc5Tj+aiXOQ4HPFz25BPEM=;
        b=eO65RxCWgwdG4idXnlLEPZJs7eqxZDOxTSyiH5Uv+Q5pzY9W/7o0esQFpr2wsBQjPU
         kFq+zg/3zoNov62HmD4AG+GE8Zg91GErUSHN9ZQrKFsB9cyh3IFGelfJNgT2rSPlZDdz
         2m7Jq6hGSeMEBRr13KjCrpuXZ6TfheR5JVu6PIipJc27smP+B6d4+2DV/qQ1N4RBj0oY
         oxQ6JewYy5DWPcgxn5E7n06TerQANNtL9K8iUV9SQHBwqVTvm5P5TXuzs5TgbAPCtvIG
         t2pIYS+GsNbVR0w2k1MhONRMVlb46LM109pg5LQ+eoJagp0U5U67+HJG3VNIlYWfZbiT
         V4gw==
X-Forwarded-Encrypted: i=1; AJvYcCWhZVqs90PU8z8mXvKekTgYwiIMLd6NzU7wc2uQgqt7g+YAF3BICB1Nh/3yz8wMJBdO8leg0o144YE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2cDjY2Kgvo6sNWrm9nGauA/2y62HHwR9ODDK6FevxPy1gm7SK
	H2rFhvsndM4OI6Ta8Jq9OxbaVR03oDFBLKZxuViIFvqwlKUvN4xX6fuqlzS03NQ=
X-Gm-Gg: ASbGncviUVT6gfowazK7B5K6iWJ3sAzDZYMfjWZ6okUUaiDLqajTbEJPWJSgOc9xJCv
	3DOK8UpGaqu/g4pKgowPbLFiEbnTiUFH6S33agnE1MRbUAJqQ4lk2FGJro1DY0R+MVkbzdT7TrE
	/GgrPvaugisVs7rH7XppSA3ggwrbhT46IzF2LmNsAEE7iTVT6zAo/Sd6efgJFAkvW8ZyvuN9aZ0
	Xxot9Tal5Byk/Ah9zlzF5t3eZUxhi/i2c5gE1UWkYgvDrttFEbU2KI1uEwCF6B5vrL2inbTRAts
	xz/I3qDXZ1Y2ktVDRgk5g/nwQ4xvguFx/V5HLWAhdfIUzkN3EYqY8jJNWgxWaNcHvQZvU3TKQbw
	WKZHtd8hw
X-Google-Smtp-Source: AGHT+IEGwRIUcCurYRxzkVyDP+FQc2lyz91Ki0UI4kfYka7QXd8T34o9X1ufhgGz6oMa3q28TAzJrw==
X-Received: by 2002:a5d:5f84:0:b0:390:df83:1f5d with SMTP id ffacd0b85a97d-390eca52f6dmr15143331f8f.35.1741029597042;
        Mon, 03 Mar 2025 11:19:57 -0800 (PST)
Message-ID: <7ab6018f-4408-4feb-b3d7-e44bbfc2b095@citrix.com>
Date: Mon, 3 Mar 2025 19:19:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix build with CONFIG_HVM=n and -Og
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250213185055.711703-1-stewart.hildebrand@amd.com>
 <f5deca6a-313f-4daf-b774-cc05223ab034@citrix.com>
 <8278d3e0-cba5-41ff-bdb0-199b3657af30@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8278d3e0-cba5-41ff-bdb0-199b3657af30@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/03/2025 6:59 pm, Stewart Hildebrand wrote:
> On 2/13/25 20:05, Andrew Cooper wrote:
>> On 13/02/2025 6:50 pm, Stewart Hildebrand wrote:
>>> When building with CONFIG_HVM=n and -Og, we encounter:
>>>
>>> prelink.o: in function `pit_set_gate':
>>> xen/xen/arch/x86/emul-i8254.c:195: undefined reference to `destroy_periodic_time'
> <snip>
>
>> Is this the singular failure with -Og, or are there others?  I never got
>> it working, and there were quite a few failures that failed to get a
>> resolution.
> This is the only one that I'm aware of, and it only occurs when
> CONFIG_HVM=n. I only happened to stumble upon this occurrence because
> allyesconfig apparently results in CONFIG_HVM=n.

Yes.  That's a know misbehaviour that doesn't have a resolution that
everyone is happy with.

>  I've been building Xen
> with -Og in my development workflow for a couple of releases now.

We really ought to be using -Og rather than -O1 when available.

If you fix this bug, then change Xen's default, randconfig in CI will
keep it working.

~Andrew

