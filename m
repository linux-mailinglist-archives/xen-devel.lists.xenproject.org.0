Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F942521ED4
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 17:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325808.548565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noRqT-0003M4-0q; Tue, 10 May 2022 15:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325808.548565; Tue, 10 May 2022 15:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noRqS-0003Jf-SD; Tue, 10 May 2022 15:32:16 +0000
Received: by outflank-mailman (input) for mailman id 325808;
 Tue, 10 May 2022 15:32:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BK8O=VS=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1noRqQ-0002KR-KO
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 15:32:14 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d67d189-d076-11ec-a406-831a346695d4;
 Tue, 10 May 2022 17:32:13 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id m20so33700667ejj.10
 for <xen-devel@lists.xenproject.org>; Tue, 10 May 2022 08:32:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 hx3-20020a170906846300b006f3ef214e7asm6236050ejc.224.2022.05.10.08.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 08:32:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5B9B21FFB7;
 Tue, 10 May 2022 16:32:11 +0100 (BST)
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
X-Inumbo-ID: 5d67d189-d076-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=yWy4+v4Ieubc1HaVClCWgFcuV1I81g9ohGvVvx+/5r4=;
        b=Q6Lf0yyp1Hjkc3d57B9RztlMOOLTC8j3FJAwzHiOtNwD9v0rsjYf5GHZIjB+n3aotH
         4qC3vyn5BpIzGvxwMf6s4FsCLU5bv9yYbtKO1caEDM8/d4t8EVlW7El8SlbZ+iaSi8bW
         2iLS/xu/ut+WLnH5xHu7hdaHBVjfERiQq/WBfw1ojH+G566VkY18Lttqgfy837RrjqZU
         2PR0ioKCRb9fWvQLC9xxLSc+QzRZBA4HsAsnjrWIlraZWn5y6p5JCEscG8gd7pKKnM7n
         UWedwR78KHnvukJGMMK76mUefXEUukvkn71jqFlXx6SWFh2ZlxRUwanG6qk9otoSoNGQ
         fwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=yWy4+v4Ieubc1HaVClCWgFcuV1I81g9ohGvVvx+/5r4=;
        b=1rfDyfeENtL8ZaQi69Hgsm/2nNHydLkW1D5O76OkvB4V+0eVcQOTJ2gNrGe4+R9c8r
         +e3LFw0rP0/829fP376QpfIuVvS2cufiPtf1kMceLYtwHo8kK2nrwWaVYg4d/a7rAhbP
         iuOytsBXc/QF9Nn2IWWuweJ10lsuCLrkpe7JZNTwQpnrCK+oLAj8DZAd5b0rAan0TjDa
         QTXWTKfyuivkDI+QQyucr+Tq0/XCdIbIXe2RF+UtM5oazh8Ow33hhgJiSFt6vAiU9vjw
         g7z8IKrghBeu2EtKxuUme8FJrapiefbGfT+E+gSG+GzZUe1ov/HZeUG1s8K7JBkg7SsM
         XLoA==
X-Gm-Message-State: AOAM533U5mHfH1yt08FdL/QUt2XbJPx1dcknlCrDwHN68MqqR6yQrppK
	ApD5UO/ng1WZ+fWySWNDPb2fmQ==
X-Google-Smtp-Source: ABdhPJxrGRXa4fqHwJaRCUG2enRm9eucZkvXQo3dtOP77deNSjgFMNTN0h601Aw+Zz13wqGvBbls9Q==
X-Received: by 2002:a17:907:1c20:b0:6f4:639e:9400 with SMTP id nc32-20020a1709071c2000b006f4639e9400mr19678215ejc.485.1652196733032;
        Tue, 10 May 2022 08:32:13 -0700 (PDT)
References: <20220428103410.2723837-1-alex.bennee@linaro.org>
 <64d47797-3789-694b-0eb5-08fc7527ff5b@xen.org> <8735hhtrfd.fsf@linaro.org>
 <191159cc-f26d-f161-3f44-431507a6c270@xen.org> <87y1z9sauw.fsf@linaro.org>
 <e782b10c-55f4-3d1d-3a2e-12034c0e1cd4@xen.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, stratos-dev@op-lists.linaro.org, Richard
 Henderson <richard.henderson@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2] xen/arm: p2m don't fall over on FEAT_LPA enabled hw
Date: Tue, 10 May 2022 16:31:26 +0100
In-reply-to: <e782b10c-55f4-3d1d-3a2e-12034c0e1cd4@xen.org>
Message-ID: <87tu9xs8sk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Julien Grall <julien@xen.org> writes:

> Hi Alex,
>
> On 10/05/2022 15:47, Alex Benn=C3=A9e wrote:
>> Julien Grall <julien@xen.org> writes:
>>> On 10/05/2022 15:03, Alex Benn=C3=A9e wrote:
>>>> Julien Grall <julien@xen.org> writes:
>>>>
>>>>> Hi Alex,
>>>>>
>>>>> On 28/04/2022 11:34, Alex Benn=C3=A9e wrote:
>>>>>> When we introduced FEAT_LPA to QEMU's -cpu max we discovered older
>>>>>> kernels had a bug where the physical address was copied directly from
>>>>>> ID_AA64MMFR0_EL1.PARange field. The early cpu_init code of Xen commi=
ts
>>>>>> the same error by blindly copying across the max supported range.
>>>>>> Unsurprisingly when the page tables aren't set up for these greater
>>>>>> ranges hilarity ensues and the hypervisor crashes fairly early on in
>>>>>> the boot-up sequence. This happens when we write to the control
>>>>>> register in enable_mmu().
>>>>>> Attempt to fix this the same way as the Linux kernel does by gating
>>>>>> PARange to the maximum the hypervisor can handle. I also had to fix =
up
>>>>>> code in p2m which panics when it sees an "invalid" entry in PARange.
>>>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>>>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>>>>> Cc: Julien Grall <julien@xen.org>
>>>>>> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>>>>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>>
>>>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>>> Will you pick this up via your tree or do I need to do something
>>>> else to
>>>> get it upstreamed? I guess it needs to go on master and last stable?
>>>
>>> We only have one tree in Xen where committers (such as Stefano and I)
>>> will commit patches regularly to staging. Osstest will then push to
>>> master once the testing passed.
>>>
>>> I have done that now. Interestingly, git am wasn't able to apply this
>>> patch. I had to do with:
>>>
>>> 42sh> git am --show-current-patch=3Ddiff | patch -p1
>>> patching file xen/arch/arm/arm64/head.S
>>> Hunk #1 succeeded at 474 (offset 1 line).
>>> patching file xen/arch/arm/p2m.c
>>> Hunk #1 succeeded at 32 with fuzz 2.
>>> Hunk #2 succeeded at 2023 (offset -7 lines).
>>> Hunk #3 succeeded at 2031 (offset -7 lines).
>>> Hunk #4 succeeded at 2062 (offset -7 lines).
>>>
>>> Which branch did you use for sending the patch?
>> 0941d6cb23 from RELEASE-4.16.0
>
> This would explain why. Patch sent to xen-devel should be based on
> staging (or master).

Ahh at the time I wasn't sure if there was another regression in master
so I was basing of stable. I'll re-base of master next time ;-)

--=20
Alex Benn=C3=A9e

