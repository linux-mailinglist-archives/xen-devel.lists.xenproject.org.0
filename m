Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE7678E9DE
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 12:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593699.926754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeWe-0005NS-Ko; Thu, 31 Aug 2023 10:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593699.926754; Thu, 31 Aug 2023 10:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeWe-0005Ll-I3; Thu, 31 Aug 2023 10:03:44 +0000
Received: by outflank-mailman (input) for mailman id 593699;
 Thu, 31 Aug 2023 10:03:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYAZ=EQ=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1qbeWc-0005Lf-Mc
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 10:03:42 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a994ed38-47e5-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 12:03:41 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50087d47d4dso1266684e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 03:03:41 -0700 (PDT)
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
X-Inumbo-ID: a994ed38-47e5-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693476221; x=1694081021; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hB33pLaPpLvvdt+D2fH747Y5XKVfL/40nfO6Hfng3FQ=;
        b=hDKEzP18rYuE/YQHRiIVzS6LGVDskEg6FBeMOgjVxVtRqapPZEBWNd8hHs+ZkTHlQG
         7OJeN427WZL4wE+ArwqVrn/OI+4vyXOzFkh0eXB6IUoA5nc3MYu+ZsSy1Z0IM0M8doGq
         bTJ49kmCjkkJ01fsH7l+/l6i2L45up5iDuyZ5ryM1sTV0DEh7MZh5Eer7Op+SaQn0WOk
         6L8VM5LJsJL0QN0eozT3GqvXAhrblR/Z5QnNHc0mVVNThPdVt7Yy7lirSiJzdlQlsVhM
         i4nrMdAMjwGWsu8hbxTNVkB/E+C7RCl9KpZlnnnh5Jq18oylMcjBxoIl3HNGNxSetA4N
         28MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693476221; x=1694081021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hB33pLaPpLvvdt+D2fH747Y5XKVfL/40nfO6Hfng3FQ=;
        b=G1+4Zv4uBBvQ1Dso0CW19wLOQJRngUF/zmP7Mq3K/zAAp1Wr0Mmafhfr4jnu8BrQxw
         2Z5RJM8+camFYwHek/jPbvRodfZX9cnXd+DoQIJv9IaEV+aQGBGP9dIn6eeWwqRp+wW3
         xjIklLe5XG2EUcCksrIOMDTTmUvwoNBRcLL2iAFvNuI5qNqpqjN85Qs/IcdA6EM+6rJz
         4/dvePK3Ibc6udNUdRQfr3AQUsbIHkJ5lIkONZyFlwaKHBWQbmg4NatCWAgp52aspzcD
         zYZdLzGMblRl0+dBkCuaBowae8m5jxkFoBJhZE57LuJAcSPImNWbh/uFJRwtHqgp+oBo
         NHQA==
X-Gm-Message-State: AOJu0YyX7xCFUeBXHw7D1cxVHeqeOECaIbzg3DKP5aF6yuc3edTPkyDQ
	eT7zNvUOITlca8W5jikDItOGQLL+coVUT2mXTRn8+A==
X-Google-Smtp-Source: AGHT+IFX/1mT0xBVolLvtKiip3l9RctqLyhOc8k7b+Kx7yXW6Ml6LFMZECJTcU1bzt/3GOP5hwm7DtZPrPFwphsqjfg=
X-Received: by 2002:a19:6914:0:b0:500:b890:fb38 with SMTP id
 e20-20020a196914000000b00500b890fb38mr3118822lfc.24.1693476220885; Thu, 31
 Aug 2023 03:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <87y1hspiyh.fsf@linaro.org> <alpine.DEB.2.22.394.2308301745530.6458@ubuntu-linux-20-04-desktop>
 <CAFEAcA8Ziov9vA9dW+4vzFE=KkSUqfMNNMZOtvQhqCXyjRytzQ@mail.gmail.com> <87cyz3pmgz.fsf@linaro.org>
In-Reply-To: <87cyz3pmgz.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Aug 2023 11:03:29 +0100
Message-ID: <CAFEAcA-m8G1kfTw52kOGPEvQwWPph0NWc0URVY1aQ2WwVeB_OQ@mail.gmail.com>
Subject: Re: QEMU features useful for Xen development?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Vikram Garhwal <vikram.garhwal@amd.com>, 
	Stefano Stabellini <stefano.stabellini@amd.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Aug 2023 at 10:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 31 Aug 2023 at 01:57, Stefano Stabellini <sstabellini@kernel.or=
g> wrote:
> >> As Xen is gaining R52 and R82 support, it would be great to be able to
> >> use QEMU for development and testing there as well, but I don't think
> >> QEMU can emulate EL2 properly for the Cortex-R architecture. We would
> >> need EL2 support in the GIC/timer for R52/R82 as well.
> >
> > We do actually have a Cortex-R52 model which at least in theory
> > should include EL2 support, though as usual with newer QEMU
> > stuff it quite likely has lurking bugs; I'm not sure how much
> > testing it's had. Also there is currently no board model which
> > will work with the Cortex-R52 so it's a bit tricky to use in practice.
> > (What sort of board model would Xen want to use it with?)
>
> We already model a bunch of the mps2/mps3 images so I'm assuming adding
> the mps3-an536 would be a fairly simple step to do (mps2tz.c is mostly
> tweaking config values). The question is would it be a useful target for
> Xen?

All our MPS2/MPS3 boards are M-profile. That means we have the
device models for all the interesting devices on the board, but
it would be simpler to write the an536 board model separately.
(In particular, the M-profile boards are wrappers around an
"ARMSSE" sort-of-like-an-SoC component; there's no equivalent
for the Cortex-R52.)

>   https://developer.arm.com/documentation/dai0536/latest/
>
> > The Cortex-R82 would be more work, because (unlike the R52) it's
> > AArch64, and we don't have Armv8-R AArch64 support yet, only the AArch3=
2.
> >
> > I haven't looked at whether GIC on R-profile requires any changes
> > from the A-profile GIC; on A-profile obviously we emulate the
> > virtualization support already.
> >
> >> On Cortex-As, in addition to a PCI root complex and an arbitrary PCI
> >> device, SMMUv3 emulation (both stages) and GICv3 ITS are needed to be
> >> able to test PCI Passthrough.
>
> We have ITS emulation support and it was recently plumbed into the
> "sbsa-ref" board as it is needed for higher level SBSA compliance.
>
> >> However, if I recall correctly SMMUv3
> >> emulation in QEMU might not be complete enough to enable us to use it.
> >
> > Yeah, at the moment the SMMU emulation supports stage 1 and stage 2,
> > but not both at the same time. This is good enough for PCI passthrough
> > with a Linux guest using KVM to pass a device through to a nested
> > Linux guest.
>
> Is this a missing feature for SMMUv3 or something introduced in the
> later revisions?

It's a missing feature. The SMMUv3 spec allows an implementation
to implement stage 1, stage 2 or both. We started with just a
stage-1-only implementation because Linux doesn't need any more.
Stage-2-only just landed recently. Nobody's looked at both-stages yet.

thanks
-- PMM

