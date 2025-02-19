Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9FAA3C1FC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 15:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893032.1301964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkz8-0001bU-VJ; Wed, 19 Feb 2025 14:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893032.1301964; Wed, 19 Feb 2025 14:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkz8-0001ZA-S9; Wed, 19 Feb 2025 14:23:34 +0000
Received: by outflank-mailman (input) for mailman id 893032;
 Wed, 19 Feb 2025 14:23:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVer=VK=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tkkz7-0001Yo-4X
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 14:23:33 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 181adcf4-eecd-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 15:23:31 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-30a36eecb9dso31971841fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 06:23:31 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a2a668ad9sm12666161fa.10.2025.02.19.06.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 06:23:29 -0800 (PST)
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
X-Inumbo-ID: 181adcf4-eecd-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739975011; x=1740579811; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JYx+IQ6WBbanlJBV2Mo8c2gdS/x7/7AbRFKDM6QTTeM=;
        b=YZRDMObfg/hG/iQTXFyw3BMaWAzrc/24OUUilH2ufqSkKuvxysVFbbZqihIatYZCZD
         icVU0GyTJbvM69wzuShDrZOq9k+NTu6wCqp9giMro1PE8RWoOQS0rxQ21YWA8EZ67Z0H
         rN7enSkBQVPpaOQoXEDDlgdGqwV6Zg0ej/UvA6WtpgJNFauNo+vPT8X/fQdcTBdWZD7K
         p5k0Wn0Ps2aSPKyPIwBcg/yurzrj83kk2pPuHdrikYBpM/fNeq4GJGljbSu6yywraocC
         pBsVsFe6U8YoETiantcedfAGY1+tn9onCIkt66z/JiH4e223K6XT3lWsVrbuLWYCPZvw
         zePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739975011; x=1740579811;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYx+IQ6WBbanlJBV2Mo8c2gdS/x7/7AbRFKDM6QTTeM=;
        b=mU5j4nKW79JNMSipKEdRRCqCKQfRQ66bu3Kigw5F/sVEbTpoqMJ1URzaC5lQFTdiee
         pd6HdXsEGtcgMx/1b+CWedQJUhRoOONmV3qoZH8LaCuW4FeN5vkuK+hqz7d5+3mPrpvU
         EqZGAHUEBiyiSiXbSaVrLK+NXOuqxaq8ZELB/3o7Vpiu2B6on1ZZ3K5h+8DDDWm5aYz4
         nwyqYaGEl0141smUGIlUf2Iw/mMOB3gx/S/RJvGojocw/ionMLbJjg5R/IcsJk0wKu0s
         AI3C/EDlM94OgSNi3jM/iSJiuZd1OK+GvxOhkbMGgMAWQ9MLlt5fdUKqg4xQ3t1FDRJA
         72YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVwlZSySwrEva17qlqgmX0FPlyoYz4eaErHEitahBJq6eBXnSPvgvsCQEf7LxKimRakKBl2/li1lc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwG9olard3Z0kQ038iS75Vkn9Hbb6TObW9SWGjK/S9eMKzWPAqA
	3+kFwWttuwWVwNqzJ9Ioni1iuGG1ECr+ervQP7KspPHGDu5SBC/l
X-Gm-Gg: ASbGncswhWveKycEkkXqHAbSusvbh/nQgouWXkbPTGIc6Vls9GXzWYDPCjhEgVKMgqt
	djCScA6CbJ1h4yWfaMAHHr+9rCDpAPzgZ3LnU7rXL5YSU17pJO3gc9m9YSFr+FjRYx9+/6rALLT
	L2Stqagah/n5Y5Drjg5nYcLbOajnh2u2ZeURscJ3p8MmOgr7QfWgdtRPKb0VXBaQ0g+lzsBv7+7
	J6wQhIv0VmIsctoKqD5oZPAHkOjl26+nahoFtY7RYX6VVWWYhYfBEiFyP7DNSkuv45Y8medkf9O
	m3jkhuYdgUdwR6su
X-Google-Smtp-Source: AGHT+IF9gd8j1nTL1wM/zUTfVWebtRHyZtqUxY+DC189ACZzQIOXf3jhaq6UkouLN78xmw6V+o9vPQ==
X-Received: by 2002:a2e:80d8:0:b0:302:5391:3faf with SMTP id 38308e7fff4ca-30927a64bebmr58361941fa.17.1739975010432;
        Wed, 19 Feb 2025 06:23:30 -0800 (PST)
Message-ID: <ced01825-caf5-456f-adc9-2208d3a075aa@gmail.com>
Date: Wed, 19 Feb 2025 16:23:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] code style: Format ns16550 driver
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, Luca.Fancellu@arm.com,
 roger.pau@citrix.com, marmarek@invisiblethingslab.com,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 xen-devel@lists.xenproject.org
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <20250216102108.2665222-2-andr2000@gmail.com>
 <5ed54fcf-d4fd-4ec0-8c40-1e50d9b16ae2@suse.com>
 <6f133e51-17b5-4edf-8db3-5c9b91028898@gmail.com>
Content-Language: en-US
In-Reply-To: <6f133e51-17b5-4edf-8db3-5c9b91028898@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Jan!

On 19.02.25 14:39, Oleksandr Andrushchenko wrote:
> Hello, Jan!
>
> On 17.02.25 12:20, Jan Beulich wrote:
>> On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c
>>> @@ -14,7 +14,7 @@
>>>    * abstracted.
>>>    */
>>>   #if defined(CONFIG_HAS_PCI) && defined(CONFIG_X86)
>>> -# define NS16550_PCI
>>> +#define NS16550_PCI
>>>   #endif
>> Hmm. Either form ought to be okay, so the line would want leaving untouched.
It seems this can actually have 3 forms under IndentPPDirectives control
Please see [1].

I would go with BeforeHash personally

[1] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#indentppdirectives



