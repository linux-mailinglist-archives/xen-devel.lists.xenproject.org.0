Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D533F9BB478
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 13:17:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829975.1244901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7w0V-0005b6-MX; Mon, 04 Nov 2024 12:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829975.1244901; Mon, 04 Nov 2024 12:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7w0V-0005ZU-Jp; Mon, 04 Nov 2024 12:16:31 +0000
Received: by outflank-mailman (input) for mailman id 829975;
 Mon, 04 Nov 2024 12:16:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0R2G=R7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t7w0U-0005ZO-F1
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 12:16:30 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c0bbe28-9aa6-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 13:16:24 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso681188766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 04:16:24 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e56494145sm546324666b.33.2024.11.04.04.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 04:16:23 -0800 (PST)
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
X-Inumbo-ID: 9c0bbe28-9aa6-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjljMGJiZTI4LTlhYTYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzIyNTg0LjY3NDc5Miwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730722584; x=1731327384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jT27jzhqW/cEth0KT37bEIWHAq4q4ulw2tsXFkqiGJA=;
        b=Xrgaes6EKiGR/9nKXnieMPUryC3n+ODSVEowZqWVRa4OASg6h//vpu1INIcgM7FQDb
         0m/N3Mpv8wAbips2msDH870tzO661/Y5Ejgptu7it3+IswkIlkbf+jfJ1WIYCYI1M2tG
         fk+Q/GaRu+9BollaGvGKKdCzWg47s5fq2Ua7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730722584; x=1731327384;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jT27jzhqW/cEth0KT37bEIWHAq4q4ulw2tsXFkqiGJA=;
        b=ImY4onBl4ETF3P8rf8eE3lkJFzcDRpFj2jLC6C/SXB827oW6ZpGBZFvTueowlLl5L2
         YrDdm+r+29i+VHHeaEOMAt9JbDmEP3hV6Vn0d5kX/r7FTrGdmXzsiqXePRgrwwbDGmdZ
         eQmLhH7xvfXuKmy4IimgGw4KlqvMJ1utNyrsLZGpuHqQWZb8D+z9Mpr20s+6teoQYrKX
         F/0eVsVnQ3t6T1NO2njk8Cyme+kGZSGHCZZgiYq85zHDBujP++XBQDcYIWANOvj/HAdr
         drunYe8MikqSDuyOeF8dRdAPuxH5e6SqYTsMJ0tC/ofKf5+8DZ+ASHa3saQZnaCin2gj
         Z5Yg==
X-Gm-Message-State: AOJu0YyNHhEVahN9XrII5I2XWI8Sp1SxSU5z6J5ANSiFtQEBzvFPU/wX
	IAQ8ovD2qyXdZp+0mbiFxYQVaCDU6V5anCKGBMS3+6zPYYRjgMsmKxPSznU6b+Eg8Y6fyj93pq+
	o
X-Google-Smtp-Source: AGHT+IFQp7TtaLBn8y6kwsYSDyQnlrrsiqO2astaRPGWbBvL3bRK37vU+HJQWQWsEHLNNsi1tPHrZQ==
X-Received: by 2002:a17:907:eaa:b0:a9d:e1d6:4176 with SMTP id a640c23a62f3a-a9de632d19bmr2924843066b.59.1730722583983;
        Mon, 04 Nov 2024 04:16:23 -0800 (PST)
Message-ID: <5b1f97cf-09bd-42d0-a966-ca9d3b6c2e84@citrix.com>
Date: Mon, 4 Nov 2024 12:16:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: Drop alpine-3.18-rootfs-export and use test-artefacts
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 Victor Lira <victorm.lira@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241031190043.3011299-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2410311546170.2525410@ubuntu-linux-20-04-desktop>
 <86a60aec-f259-41be-92a0-ce66ce24f4ae@citrix.com>
 <alpine.DEB.2.22.394.2410311559460.2525410@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2410311559460.2525410@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/10/2024 11:05 pm, Stefano Stabellini wrote:
> On Thu, 31 Oct 2024, Andrew Cooper wrote:
>> On 31/10/2024 10:46 pm, Stefano Stabellini wrote:
>>> On Thu, 31 Oct 2024, Andrew Cooper wrote:
>>>> The Argo work already moved this artefact into the new form.  Reuse that, and
>>>> drop one test job.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> This is good but should we also remove
>>> automation/tests-artifacts/alpine/3.18.dockerfile since we are at it?
>> Well, that's another thing that needs careful consideration.
>>
>> That dockerfile needs updating in tandem with the build container (or
>> lib$FOO.so's don't work when running the test), and it's hard enough to
>> keep track of things when they're all in one repo.
> Uhm, you have a good point. Two things come to mind. First, for this
> patch:
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks.

> Second, I think maybe it would be better for test-artifacts to use the
> build containers from xen.git/automation/build ? So that at least all
> build containers come from the same place?
>
> For instance, we would have to add any missing dependencies to
> automation/build/alpine/3.18.dockerfile, from the list currently in
> images/alpine/x86_64-build.dockerfile. Only a couple of things are
> missing. Then remove images/alpine/x86_64-build.dockerfile, and use
> registry.gitlab.com/xen-project/xen/alpine:3.18 in the test-artifacts
> build jobs?

First, I think it is important that hw/t-a uses main Xen's containers,
rather than its own.  That way, all the dockerfiles are in one place.


As for merging the build and test-artefact dockerfile, I'm not so sure. 
They're almost completely dissimilar, and (amongst other things) we
don't want to be including two full toolchains in the test initrd.

So, I think they do need to remain separate, but the build/test-artefact
split is weird already because build/ is both build and some test, but
not all.  I think things would benefit from relaying out automation/
somewhat.

~Andrew

