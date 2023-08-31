Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E2F78E9CC
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593692.926744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeMK-0002Rv-Nu; Thu, 31 Aug 2023 09:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593692.926744; Thu, 31 Aug 2023 09:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeMK-0002Q7-Ky; Thu, 31 Aug 2023 09:53:04 +0000
Received: by outflank-mailman (input) for mailman id 593692;
 Thu, 31 Aug 2023 09:53:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bdNS=EQ=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1qbeMJ-0002Or-4e
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:53:03 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c594015-47e4-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 11:53:01 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-401d80f4ef8so5926525e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 02:53:01 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c22d900b003fe2b6d64c8sm4636032wmg.21.2023.08.31.02.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 02:53:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 904EA1FFBB;
 Thu, 31 Aug 2023 10:53:00 +0100 (BST)
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
X-Inumbo-ID: 2c594015-47e4-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693475581; x=1694080381; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KQEJpUTSLCIJkZRuR1n6Y0QrKahsCjCpNkHfDrCi9A=;
        b=GpDOO2Be45F3z28jtLqVOHghDyQEH3pcKM10Y/lOc9y8Bb9YGTGulg7IdAH6M+GmHC
         Tl1mneOK+u5uauF1rVTRmxkk7PHYKz3v4Pm0k7VKlntt6ddg1qC3JMdxDUBP7Bkj5UQJ
         6S6SgMpKHslqJOZCa6SMCy4sGB/UlCaUMrHJ3sG0U1SampsJrKTtd5RWeilcUUSNePP1
         kVOw7bXcp2ZWUSpT41QOY+WB0WWb6O+jbnqt0LmreXSaw6fM8OvRHpj7kyN//dGy8CT8
         frUup1f0B4NUwSXxgDrHIpZzFwEGXtY50wrB4Q4roO+rOzT6klq3HSew/3KHvQFZcHWZ
         mkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693475581; x=1694080381;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1KQEJpUTSLCIJkZRuR1n6Y0QrKahsCjCpNkHfDrCi9A=;
        b=EltwPVnTTJkJLDQxub+Kk9A66emb7V3eFKEVFA1waGdzpJyrkEusEa87abWEYhYWNB
         5i/+WtY8YmcHitujq1i4k5drsj/AJsAIfW4vZKHw7uUfo5O1YV+Oc3eDcWPIFFxju1SV
         xRIjzmsdyWTIjRQpkBomQN0UAR/eyDxVErMgCFjBwt7mKN/VWZu33IwKeBUfkMDbB6kp
         aSNXY+ar5qEtVJCeggQh9fLWkXEXyUzB9jsKkKW7QgDt4KrZ2rLCn4fTT6Pf1gX0y0tF
         bxLBbuIgiehp7Dqd8QS8cwinKKYgfuV/l8Zd768WeBaUSezNiOTYAmd9EWShQ6HYt+PX
         /STQ==
X-Gm-Message-State: AOJu0YxCLilBT6zHNSOVW75FU6uGQdI1oC+7OnQN/t3lxe+UKweONTBk
	3oYRSQmA9Mhx8Q1/kskvTEg7/Q==
X-Google-Smtp-Source: AGHT+IH07XYi9G/V7ZKDKpvNx67oTeZV0bcaqcY1+01w/ToDCzJQPEXO+uS/9PRFrQigGwORJtC3rQ==
X-Received: by 2002:a05:600c:2159:b0:400:c0e8:18c6 with SMTP id v25-20020a05600c215900b00400c0e818c6mr3980512wml.18.1693475581348;
        Thu, 31 Aug 2023 02:53:01 -0700 (PDT)
References: <87y1hspiyh.fsf@linaro.org>
 <alpine.DEB.2.22.394.2308301745530.6458@ubuntu-linux-20-04-desktop>
 <CAFEAcA8Ziov9vA9dW+4vzFE=KkSUqfMNNMZOtvQhqCXyjRytzQ@mail.gmail.com>
User-agent: mu4e 1.11.16; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, Stewart Hildebrand
 <stewart.hildebrand@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Sergiy Kibrik
 <Sergiy_Kibrik@epam.com>, QEMU Developers <qemu-devel@nongnu.org>, Vikram
 Garhwal <vikram.garhwal@amd.com>, Stefano Stabellini
 <stefano.stabellini@amd.com>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
Subject: Re: QEMU features useful for Xen development?
Date: Thu, 31 Aug 2023 10:37:45 +0100
In-reply-to: <CAFEAcA8Ziov9vA9dW+4vzFE=KkSUqfMNNMZOtvQhqCXyjRytzQ@mail.gmail.com>
Message-ID: <87cyz3pmgz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 31 Aug 2023 at 01:57, Stefano Stabellini <sstabellini@kernel.org>=
 wrote:
>> As Xen is gaining R52 and R82 support, it would be great to be able to
>> use QEMU for development and testing there as well, but I don't think
>> QEMU can emulate EL2 properly for the Cortex-R architecture. We would
>> need EL2 support in the GIC/timer for R52/R82 as well.
>
> We do actually have a Cortex-R52 model which at least in theory
> should include EL2 support, though as usual with newer QEMU
> stuff it quite likely has lurking bugs; I'm not sure how much
> testing it's had. Also there is currently no board model which
> will work with the Cortex-R52 so it's a bit tricky to use in practice.
> (What sort of board model would Xen want to use it with?)

We already model a bunch of the mps2/mps3 images so I'm assuming adding
the mps3-an536 would be a fairly simple step to do (mps2tz.c is mostly
tweaking config values). The question is would it be a useful target for
Xen?

  https://developer.arm.com/documentation/dai0536/latest/

> The Cortex-R82 would be more work, because (unlike the R52) it's
> AArch64, and we don't have Armv8-R AArch64 support yet, only the AArch32.
>
> I haven't looked at whether GIC on R-profile requires any changes
> from the A-profile GIC; on A-profile obviously we emulate the
> virtualization support already.
>
>> On Cortex-As, in addition to a PCI root complex and an arbitrary PCI
>> device, SMMUv3 emulation (both stages) and GICv3 ITS are needed to be
>> able to test PCI Passthrough.

We have ITS emulation support and it was recently plumbed into the
"sbsa-ref" board as it is needed for higher level SBSA compliance.

>> However, if I recall correctly SMMUv3
>> emulation in QEMU might not be complete enough to enable us to use it.
>
> Yeah, at the moment the SMMU emulation supports stage 1 and stage 2,
> but not both at the same time. This is good enough for PCI passthrough
> with a Linux guest using KVM to pass a device through to a nested
> Linux guest.

Is this a missing feature for SMMUv3 or something introduced in the
later revisions?

We have sketched out the tasks for SMMUv3.2
(https://linaro.atlassian.net/browse/QEMU-558) with a view to whats
needed for RME guests to access hardware. However I think there is a lot
of other stuff needed specifically for RME including what we do about
modelling things like TDISP. Realistically it will be awhile before we
get to completing all of that.


>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

