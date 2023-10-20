Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B2E7D1283
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 17:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619827.965542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtrK3-00046I-4d; Fri, 20 Oct 2023 15:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619827.965542; Fri, 20 Oct 2023 15:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtrK3-00044c-0y; Fri, 20 Oct 2023 15:21:59 +0000
Received: by outflank-mailman (input) for mailman id 619827;
 Fri, 20 Oct 2023 15:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=84aa=GC=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1qtrK1-00044S-H3
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 15:21:57 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 675d0ca6-6f5c-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 17:21:56 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4083f61322fso7565645e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Oct 2023 08:21:56 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a05600c0ad000b004063c9f68f2sm2381004wmr.26.2023.10.20.08.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 08:21:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B1221FFBB;
 Fri, 20 Oct 2023 16:21:54 +0100 (BST)
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
X-Inumbo-ID: 675d0ca6-6f5c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697815315; x=1698420115; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbelIcZTS0juyOFnjn4MTy2vl3K16qAnjzUU98VyDMY=;
        b=qnMTca4aijWMsT5fqn/wVKdqN90y351+KI4ts7Ppm27VVnd/PV1UNTaGfOaaXH3I28
         Pjg6xKvRGR5RLfEbGxHudZcm0yKuyVpdeoSmYd15U+PrQvzX+wPixFwDWrqvsQAXrlLl
         oknRjDZBR3L8LZJnbeZW3CrxcJ2nvL4L8sDq5OvVyEvXhV738egAJ+cB7qcnyvXzwZMM
         W6uclUk/p5C0C2sWFnndagJIJn9nmUms7LSuNN1GGhhaN2pSvzDic068FZ29jKPGkxoT
         u0XW5OI+S0DkJ31l9YKxA7tDQ6CEMh7iqRc/wMavc0+xF6drfTSIHbQWnrvEbEeTEYnI
         IFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697815315; x=1698420115;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jbelIcZTS0juyOFnjn4MTy2vl3K16qAnjzUU98VyDMY=;
        b=gdUvorFsvAKrlYgcE1ELAhn1r90/+2mKikWUhN3CjQLxiy/XZmRB18bWLOaBgnqhG/
         i8yQjBJtPwSc9+RjTB2qudjDwX4Ohy/zI2PFrovKwWKfKL08d8bLvP6+sCIhxMqdrsNV
         TVTVDnst+FpJOsX0LEsq1VSZET83WVhLC04teXwgcItLa/qOYv83E/zHu8UFG/dldZFX
         msHs+c3CpA+4WwZjh65nIVtHTS+X7PiNPjPQ95Q0WjYeT2XERh1aCDGPTUMIYt5SVOfZ
         mCr0yB2/sT1JpEApxv38R8PPJBMdfGG5TXelZux6mei4uv1IZAhw9ClN+o3wfooEzAN2
         QEaA==
X-Gm-Message-State: AOJu0YzU4dUxYoNeMiQEFMD9DnQI7BlfWJBwpNHj+e6rLEXg/qqxhnxN
	Y2dk5Ufm+KALfERi0UNY1Y06hA==
X-Google-Smtp-Source: AGHT+IHRLcFuOS3PeMTohe8jPOVqCX3X8WLS40JtSHcRyp1EElg3mXgLoTxLa68r4F7PYOX7lpzTvg==
X-Received: by 2002:a05:600c:c84:b0:406:8494:f684 with SMTP id fj4-20020a05600c0c8400b004068494f684mr1687044wmb.23.1697815315141;
        Fri, 20 Oct 2023 08:21:55 -0700 (PDT)
References: <87y1hspiyh.fsf@linaro.org>
 <alpine.DEB.2.22.394.2308301745530.6458@ubuntu-linux-20-04-desktop>
 <CAFEAcA8Ziov9vA9dW+4vzFE=KkSUqfMNNMZOtvQhqCXyjRytzQ@mail.gmail.com>
 <87cyz3pmgz.fsf@linaro.org>
 <CAFEAcA-m8G1kfTw52kOGPEvQwWPph0NWc0URVY1aQ2WwVeB_OQ@mail.gmail.com>
 <799b1754-7529-0538-1b5a-d94a362eb74d@amd.com>
User-agent: mu4e 1.11.22; emacs 29.1.50
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
 <jonathan.cameron@huawei.com>
Subject: Re: QEMU features useful for Xen development?
Date: Fri, 20 Oct 2023 16:15:19 +0100
In-reply-to: <799b1754-7529-0538-1b5a-d94a362eb74d@amd.com>
Message-ID: <87r0lp720d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Ayan Kumar Halder <ayankuma@amd.com> writes:

> Hi Peter/Alex,
>
> Appreciate your help. :)
>
> On 31/08/2023 11:03, Peter Maydell wrote:
>> CAUTION: This message has originated from an External Source. Please
>> use proper judgment and caution when opening attachments, clicking
>> links, or responding to this email.
>>
>>
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

We wrote up whats required on our JIRA:

  https://linaro.atlassian.net/browse/QEMU-598

Given we have most of the bits already it shouldn't take long to build a
model for it. However I want to draw every ones attention to the notes:

  The real FPGA image does not have a global monitor that can support
  LDREX/STREX between the two CPUs for accesses in the DDR4 RAM or BRAM.
  This means that effectively guest software will only be able to use
  one CPU (the local monitor within the CPU works fine). This
  restriction won=E2=80=99t apply to the QEMU model, but is important to be
  aware of if you=E2=80=99re writing guest software on the QEMU model that =
you
  also want to be able to run on the FPGA board.

However if that meets the requirements for Xen testing and no one tries
to run SMP loads on real HW then I can try and find space on our roadmap
to do it (rough guess 9.1 or 9.2?).

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

