Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495A7921D3
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 12:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595546.929149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdTAW-00076B-DZ; Tue, 05 Sep 2023 10:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595546.929149; Tue, 05 Sep 2023 10:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdTAW-00073f-Ai; Tue, 05 Sep 2023 10:20:24 +0000
Received: by outflank-mailman (input) for mailman id 595546;
 Tue, 05 Sep 2023 10:20:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=10iL=EV=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1qdTAV-00073Z-Af
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 10:20:23 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1543ff3-4bd5-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 12:20:20 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-402d0eda361so15238285e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 03:20:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c219000b003fe2a40d287sm16545398wme.1.2023.09.05.03.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 03:20:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A79C61FFBB;
 Tue,  5 Sep 2023 11:20:18 +0100 (BST)
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
X-Inumbo-ID: d1543ff3-4bd5-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693909220; x=1694514020; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLAvvAZgDqDrAheBxaxmnPyPUu7z5u2uvapTCYrrRso=;
        b=vI5dMc/rbWvWBIqmwFahUHTIkz2bbd/QHMbO4sl39AUAqc8JUOhxE11p7oTbAbTiwJ
         vfJ3iP17legmGAu1adEkzFRiMN13emn/HWVmO93PJND4Qrif+S24TXAZhLCVZB/A/Iza
         wr0AU3TwpiPlAmFmymJAOvmI/8axLNGrzMqGQWRhGsXd40kwuI3m42T9vMzh1t9ZGBKj
         x1IhFIyUS2Xua5U47Y+i5He362d+M0sFHJymWvv4oQCR/OgcSZ3Tx4YzQQWXnf7cg7+V
         eygRSFXBXXha7kWsfbKLcvcM9iA55wXABbI0Qd9uSWIteAq+qHezabT+ZqxRFgRoWN46
         PfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693909220; x=1694514020;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iLAvvAZgDqDrAheBxaxmnPyPUu7z5u2uvapTCYrrRso=;
        b=inQ+L9XGNrJBun68eA6ZF+zNUDq33SRbWi0ZKuQOXUe8JYaguuylGNWVVYNe1Rm6Dr
         8AC6u929FzDjjoazD36pNBZ2kMMICOJgs3ZDKXl+WFnKWZ3rhuXE+kBPmQlOJK2MBQIc
         4ggovO55kNZeQ57mNBk/pI3yIVAvPPIiKY0T9DKr3CtmQ7Bj5aVYJfcZ+5BC6mqZzLb8
         RNvciKiTufsNOEBRucXZ7sf9z4O6+RS9kBYJmrrPB/EalWy6ZMdp1VEzBldDdcKZZJZp
         ioojTu31yR/RGQyCKkcKcDpY6mrAPRaiTf5iY+zdKvoND9Jc0JNfIt9mhxf28V3KihCr
         V3ow==
X-Gm-Message-State: AOJu0YyYNGzup/MreQ1H04jivXA1O1BHlwvWRBwqiYPqH+kRTzrBQw4v
	aRPm+mFrMNHjKfzvol3YTL+6sA==
X-Google-Smtp-Source: AGHT+IFekvr/SFOvIRA6BcCxn5lTVXkbuuY6klPIZwbkqkINlw9lLdBRRyJNKV2x8vEl/9zRIANMtA==
X-Received: by 2002:a05:600c:2981:b0:3fe:1db2:5179 with SMTP id r1-20020a05600c298100b003fe1db25179mr9371957wmd.19.1693909219763;
        Tue, 05 Sep 2023 03:20:19 -0700 (PDT)
References: <87y1hspiyh.fsf@linaro.org>
 <alpine.DEB.2.22.394.2308301745530.6458@ubuntu-linux-20-04-desktop>
 <CAFEAcA8Ziov9vA9dW+4vzFE=KkSUqfMNNMZOtvQhqCXyjRytzQ@mail.gmail.com>
 <87cyz3pmgz.fsf@linaro.org>
 <CAFEAcA-m8G1kfTw52kOGPEvQwWPph0NWc0URVY1aQ2WwVeB_OQ@mail.gmail.com>
 <799b1754-7529-0538-1b5a-d94a362eb74d@amd.com>
User-agent: mu4e 1.11.16; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>, Viresh Kumar
 <viresh.kumar@linaro.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, QEMU Developers
 <qemu-devel@nongnu.org>, Vikram Garhwal <vikram.garhwal@amd.com>, Stefano
 Stabellini <stefano.stabellini@amd.com>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, Jonathan Cameron
 <jonathan.cameron@huawei.com>, Bill Mills <bill.mills@linaro.org>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: QEMU features useful for Xen development?
Date: Tue, 05 Sep 2023 10:55:20 +0100
In-reply-to: <799b1754-7529-0538-1b5a-d94a362eb74d@amd.com>
Message-ID: <87tts8hqfx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Ayan Kumar Halder <ayankuma@amd.com> writes:

> Hi Peter/Alex,
>
> Appreciate your help. :)
>
> On 31/08/2023 11:03, Peter Maydell wrote:
>> On Thu, 31 Aug 2023 at 10:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>>
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> On Thu, 31 Aug 2023 at 01:57, Stefano Stabellini <sstabellini@kernel.o=
rg> wrote:
>>>>> As Xen is gaining R52 and R82 support, it would be great to be able to
>>>>> use QEMU for development and testing there as well, but I don't think
>>>>> QEMU can emulate EL2 properly for the Cortex-R architecture. We would
>>>>> need EL2 support in the GIC/timer for R52/R82 as well.
>>>> We do actually have a Cortex-R52 model which at least in theory
>>>> should include EL2 support, though as usual with newer QEMU
>>>> stuff it quite likely has lurking bugs; I'm not sure how much
>>>> testing it's had. Also there is currently no board model which
>>>> will work with the Cortex-R52 so it's a bit tricky to use in practice.
>>>> (What sort of board model would Xen want to use it with?)
>>> We already model a bunch of the mps2/mps3 images so I'm assuming adding
>>> the mps3-an536 would be a fairly simple step to do (mps2tz.c is mostly
>>> tweaking config values). The question is would it be a useful target for
>>> Xen?
>> All our MPS2/MPS3 boards are M-profile. That means we have the
>> device models for all the interesting devices on the board, but
>> it would be simpler to write the an536 board model separately.
>> (In particular, the M-profile boards are wrappers around an
>> "ARMSSE" sort-of-like-an-SoC component; there's no equivalent
>> for the Cortex-R52.)
>>
>>>    https://developer.arm.com/documentation/dai0536/latest/
>
> Yes, it will be helpful if Qemu can model this board. We have a
> downstream port of Xen on R52 (upstreaming is in progress).
>
> So, we can test the Qemu model with Xen.
>
> Also if all works fine, we might consider adding this to the upstream
> Xen CI docker.
>
> Out of curiosity, are you planning to add Qemu R52 SoC support to Zephyr ?

Generally enabling other software platforms is out of scope for the QEMU
team as we have plenty enough to do in QEMU itself. However its
certainly useful to have images we can test with.

Eyeballing the Zephyr docs it looks like it already supports some
R-profile cores on various boards, including CPU_CORTEX_R52 for the
NXPS32Z/E board. The BSP sections mostly look like config fragments but
I'm not really familiar with how Zephyr goes together.

I can ask our micro-controller experts what might be missing and need
implementing but I can't commit them to work on it ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

