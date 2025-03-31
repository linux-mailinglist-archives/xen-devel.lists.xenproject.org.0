Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B95A76710
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 15:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932500.1334607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFRz-0002Zu-AJ; Mon, 31 Mar 2025 13:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932500.1334607; Mon, 31 Mar 2025 13:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFRz-0002YR-60; Mon, 31 Mar 2025 13:45:15 +0000
Received: by outflank-mailman (input) for mailman id 932500;
 Mon, 31 Mar 2025 13:45:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCWu=WS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzFRx-0002YK-3J
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 13:45:13 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b93fd5a-0e36-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 15:45:07 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so3830858f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 06:45:07 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b6588dbsm11161373f8f.2.2025.03.31.06.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 06:45:06 -0700 (PDT)
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
X-Inumbo-ID: 5b93fd5a-0e36-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743428707; x=1744033507; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zihNNNleaj78ZkGzQ6qdvrLKWIsG+qZcCQ9d6PezgKw=;
        b=H9Rz4wu8B0iHvANpNlpFYmIYsmrSQPNI0jdHcznfet31DqXGkGfAKPEhCRADXC7tY3
         XqCb6LWZG7WkSCcIqULpVwssKSvTpkLphrNXaVx8ebQnfoDSDO+cgmGaqg7pVI4QIlqr
         o6XqGs0/hUz0O0YtLzV5yZmobEbyKESbSDsbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743428707; x=1744033507;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zihNNNleaj78ZkGzQ6qdvrLKWIsG+qZcCQ9d6PezgKw=;
        b=osCXgKmcjciy3EYhJeHade6K2xB0YzYEB3e649La+zn4KhGdd8OF2poBDaq+2wcdfd
         U6bv/CEnyB0Vz1voGYWrEFFTQnt8xpn89aJRbilAS/f6Xr/ZX3wY4ZmmsmMMCGywXmbZ
         7oz27TplOp2zJmHcdCkAIqgMaPYWSlvQMt3S93jySToxlME1SHKYqjhfKlGCBEEO2IV4
         tsiGYexa5uXAYfCODYt9AmEmz9HblSkQonEHZnorrDwZnWQrp1JcJArjFRmln7PWS3UI
         9jXQYkCCAjBSeYHfLVQPllsnOpedHVqtTL8lQp8RFmKmcuSzlfuJ7S4yWBjx9T88PcJN
         8xpA==
X-Gm-Message-State: AOJu0Yx6tphSxvARqU63hsUNSZgsTqBP7W5PLeR7F4bMxpcVtgogRbci
	5NwehJgzoWnbRxsiNxn2fv+6UpyAGS3g33dDc4NO7S7nAm17fQokd7StPHfxxo8=
X-Gm-Gg: ASbGncs5QRgZIaX7AMx1/XYHCBFJ6MaeA7i6BKv2dDjsGV2KVrE6O/sW+5nJ3jz/Ddc
	NQHVk4bs6dYZyjOEoS86LlYJclqnN88xUYfzsJaZvq1LyNr3cJP6cjVHyE1SNJ8EthzKdC8E2un
	AOZElfqyxW159lmorUraNR1g7rEytH1k9UAUKpx7XdR67Skqfi/VfLtVJrxpshU6z71hwmmX/vS
	Vr0M09OFsBjMh7yTKT26cOxJk+D6f20NdHVZq1yIJ1kQB+0adR8Nxw/xtRHhFzlcKnBorKG8rHo
	mnjgZMDOb4dnBkRdN9ilym/P4+6K//nivjxR8Y2fgz/mH5MGt+Ep2bTp7qBZK+1HWGug2jXg0f2
	F3NOUL2lrrhaLPBu+2dkc
X-Google-Smtp-Source: AGHT+IE6RK+/4xuuWzJNq4u4HSYWUZVrE4NjcjWY58cs4jLR5F5uow+To5fkSMH/q06fBBztrFZd9g==
X-Received: by 2002:a5d:5f90:0:b0:390:e9e0:5cb3 with SMTP id ffacd0b85a97d-39c120de3c7mr7199043f8f.12.1743428707141;
        Mon, 31 Mar 2025 06:45:07 -0700 (PDT)
Message-ID: <655f5f07-ebbb-46ca-9c56-e7ad4c6e5cdd@citrix.com>
Date: Mon, 31 Mar 2025 14:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ci: add yet another HW runner
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Doug Goldstein <cardoe@cardoe.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
 <Z-qVyLPnEllLKR7B@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z-qVyLPnEllLKR7B@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/03/2025 2:16 pm, Marek Marczykowski-Górecki wrote:
> On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wrote:
>> On Fri, 14 Mar 2025, Marek Marczykowski-Górecki wrote:
>>> This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.
>>>
>>> This one has working S3, so add a test for it here.
>>>
>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>> ---
>>> Cc: Jan Beulich <jbeulich@suse.com>
>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>>
>>> The suspend test added here currently fails on staging[1], but passes on
>>> staging-4.19[2]. So the regression wants fixing before committing this
>>> patch.
>> We could commit the patch now without the s3 test.
>>
>> I don't know what the x86 maintainers think about fixing the suspend
>> bug, but one idea would be to run a bisection between 4.20 and 4.19.
> This passes on staging now:
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1744682789
>
> So, the patch is good to commit as is.

adl and zen3p both have SUT_ADDR.  zen2 inherits test-2.testnet from adl.

Presumably it wants to be test-1.testnet to match it's qubes-hw tag ?

~Andrew

