Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8956521CEB
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 16:48:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325760.548477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noR9H-0001Sl-Mc; Tue, 10 May 2022 14:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325760.548477; Tue, 10 May 2022 14:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noR9H-0001Pw-Il; Tue, 10 May 2022 14:47:39 +0000
Received: by outflank-mailman (input) for mailman id 325760;
 Tue, 10 May 2022 14:47:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BK8O=VS=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1noR9H-0001Pk-1a
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 14:47:39 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22989335-d070-11ec-a406-831a346695d4;
 Tue, 10 May 2022 16:47:37 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id ch13so5015753ejb.12
 for <xen-devel@lists.xenproject.org>; Tue, 10 May 2022 07:47:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 mm8-20020a170906cc4800b006f3ef214e0fsm6154690ejb.117.2022.05.10.07.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 07:47:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A9F3D1FFB7;
 Tue, 10 May 2022 15:47:35 +0100 (BST)
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
X-Inumbo-ID: 22989335-d070-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=W3yGCrbaYFPykUPOkYnuLOD+M3hzMOScuN1dQar5WWM=;
        b=xRetRa+lauzpMF2OsULe+0aNxpjlaERQU2RpXPXZZSauOTIqLOjulWf/bQ5h6awHeS
         6eU2UpZlI7cYZrBOg5l58lx5tB8V/N8j1GpX5EvY3zxHZwSc8lLUfrx7vAid4ABUANNz
         RnJjpMDbsSAMTHy1byc5IHhK4iQsSf8OYgj587G3WZ9yB3KDIIVgqvn5JrZvw4wIsp0m
         AVx7iExnWB7J85DMkpooq/0HyH87kAkqXYzUNVEuhUjJCBF4nUd5dhxQpSSbwxS0bkLl
         u1JkyK103tajA63E8UgYV3JYjjwBg0x8zc4DHePSibCTXYdDa9mf6f3tpAGXqFCWUOzs
         A9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=W3yGCrbaYFPykUPOkYnuLOD+M3hzMOScuN1dQar5WWM=;
        b=uJNizYjScM2Hy94aqBbYiYwAOl8aoCiGuwr7YMjZqiggMWRWqQt4l8Yri2VYC48C5y
         XzNCdKQBrgtAvrV0UIq6HOAWn711rrw5f4xi5jxvOpx2864CyOf6xHpWuUdS9ou81zIa
         NsUmtJKhDniaI3UnkTdvrJ6WX8PFFX533DgDVO8J42/YSV/YCdIxDgtXMTh33cbUVgBP
         jcFEJZd4xQ7v/MkiqwelWrBrXWD9N8SxkRJ5eLqUPRH6s5SKh4LeEtFakOuuyOJakCMn
         Jgksu5feSW6scrp4cnVaxuyk2mJ/NoKphSs7iTaz97TYffB39JENNQsjHhm+LnV5JgOp
         jgAw==
X-Gm-Message-State: AOAM530VE02WoCqG5Jn4zexnydB44qNqlvf3mUo72YQG93ucTiYs57jI
	NEhDQfpzEhUDlTcrNPRbwbMRdg==
X-Google-Smtp-Source: ABdhPJzPjehPR4R3Z5rwxN9u72FxbVjoaFreZPSv3+64ZfMoJWnvEL/2ZfVya31cYzeBT/Y40eYZMw==
X-Received: by 2002:a17:907:3e94:b0:6f4:64ad:1e2 with SMTP id hs20-20020a1709073e9400b006f464ad01e2mr20095469ejc.464.1652194057391;
        Tue, 10 May 2022 07:47:37 -0700 (PDT)
References: <20220428103410.2723837-1-alex.bennee@linaro.org>
 <64d47797-3789-694b-0eb5-08fc7527ff5b@xen.org> <8735hhtrfd.fsf@linaro.org>
 <191159cc-f26d-f161-3f44-431507a6c270@xen.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, stratos-dev@op-lists.linaro.org, Richard
 Henderson <richard.henderson@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2] xen/arm: p2m don't fall over on FEAT_LPA enabled hw
Date: Tue, 10 May 2022 15:47:04 +0100
In-reply-to: <191159cc-f26d-f161-3f44-431507a6c270@xen.org>
Message-ID: <87y1z9sauw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Julien Grall <julien@xen.org> writes:

> Hi Alex,
>
> On 10/05/2022 15:03, Alex Benn=C3=A9e wrote:
>> Julien Grall <julien@xen.org> writes:
>>=20
>>> Hi Alex,
>>>
>>> On 28/04/2022 11:34, Alex Benn=C3=A9e wrote:
>>>> When we introduced FEAT_LPA to QEMU's -cpu max we discovered older
>>>> kernels had a bug where the physical address was copied directly from
>>>> ID_AA64MMFR0_EL1.PARange field. The early cpu_init code of Xen commits
>>>> the same error by blindly copying across the max supported range.
>>>> Unsurprisingly when the page tables aren't set up for these greater
>>>> ranges hilarity ensues and the hypervisor crashes fairly early on in
>>>> the boot-up sequence. This happens when we write to the control
>>>> register in enable_mmu().
>>>> Attempt to fix this the same way as the Linux kernel does by gating
>>>> PARange to the maximum the hypervisor can handle. I also had to fix up
>>>> code in p2m which panics when it sees an "invalid" entry in PARange.
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>>> Cc: Julien Grall <julien@xen.org>
>>>> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>>>
>>> Acked-by: Julien Grall <jgrall@amazon.com>
>> Will you pick this up via your tree or do I need to do something
>> else to
>> get it upstreamed? I guess it needs to go on master and last stable?
>
> We only have one tree in Xen where committers (such as Stefano and I)
> will commit patches regularly to staging. Osstest will then push to
> master once the testing passed.
>
> I have done that now. Interestingly, git am wasn't able to apply this
> patch. I had to do with:
>
> 42sh> git am --show-current-patch=3Ddiff | patch -p1
> patching file xen/arch/arm/arm64/head.S
> Hunk #1 succeeded at 474 (offset 1 line).
> patching file xen/arch/arm/p2m.c
> Hunk #1 succeeded at 32 with fuzz 2.
> Hunk #2 succeeded at 2023 (offset -7 lines).
> Hunk #3 succeeded at 2031 (offset -7 lines).
> Hunk #4 succeeded at 2062 (offset -7 lines).
>
> Which branch did you use for sending the patch?

0941d6cb23 from RELEASE-4.16.0

> Regarding stable, I will add the patch in my backport candidate list
> and send a list to Stefano when we prepare the backports.
>
> Cheers,


--=20
Alex Benn=C3=A9e

