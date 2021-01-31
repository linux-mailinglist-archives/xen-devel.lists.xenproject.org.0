Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD63E309F95
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 00:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79479.144649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6MUv-0007WR-SM; Sun, 31 Jan 2021 23:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79479.144649; Sun, 31 Jan 2021 23:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6MUv-0007W2-PH; Sun, 31 Jan 2021 23:51:17 +0000
Received: by outflank-mailman (input) for mailman id 79479;
 Sun, 31 Jan 2021 23:51:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQWc=HC=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1l6MUu-0007Vu-2c
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 23:51:16 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd6b0531-ba0a-4d12-b218-62af7dd94cc4;
 Sun, 31 Jan 2021 23:51:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m13so14698977wro.12
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 15:51:15 -0800 (PST)
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
X-Inumbo-ID: dd6b0531-ba0a-4d12-b218-62af7dd94cc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R1q9yOxuiE0eryS7wY5Arsu3O9rEt9kvYw/wpacYCv0=;
        b=k/V/wu8lR5vJw86rOXDrr8YG8jpg++oZ/lnlK3FAIqU+RnJQ8uJEFrg0HqT84ShUZs
         Vf255ioZg41KTqn/LGXqnWvcHGMsZtla22GIKq/N/gwH6R/rQvcmyY156Kbn4jES7wEo
         gu9yAUYy7qWg31F8P93mHorMAZoZGnHMezaIfR8u98hV8Ll65dnuXh1TBS+oNAWVVBpP
         p3ZZ6aG9dTuX0gthJjM2SL4Ldv+ui1OE3XPSzN5BzcTqemWx6a2k+Sla/PqxwmhKzs5m
         6mvXgrkIlFhWaFZeTjvpgcTVf02mpxwfUrCqPPjY2aau4DFR7/TNzQcQsfF3r2JWOhgl
         kXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R1q9yOxuiE0eryS7wY5Arsu3O9rEt9kvYw/wpacYCv0=;
        b=MzA4FDwTNRq5VRy4SslYfBFFVZ6gsIebKYpdeKokTv3Gpx3mVrtRUYTmRJbGeQIDpa
         V1O7lQo8aeQlYY0Q/wVVsC6CTBJcn+2M37fw+VMruPab5R1rINEh28Imk8TgkwCVNdZP
         nA/+SzTbQMzCLhCQT4sUhXQMBu6mU1VoymB07DkFl6AAUAO2eql3FfXe5gcGKDUod+g8
         K64XLeb8knHvPV4GBbHsY2Xf8cG2epBlEfvFFbpiV2yzHjTk7NeP8QIpa4i3PuHoTBXm
         c4JlWFje0PYB9x10tF/OzYufafJyzvKFZLkwn1HPKftVbVMMgSK9SdzK7eQNpyCGKCr+
         pP2w==
X-Gm-Message-State: AOAM530yQ8MyIQRdNWhltiXJ2KAKefZELRkkwNIgcj39g1rcQBfdFNIa
	ZaBkkTBDCrlDI79int2sPaVdRR3BO4OBEoePAPU=
X-Google-Smtp-Source: ABdhPJzjnOjZyR5NxvmXwTOuvY9RJp0fzCRLFOD63Tx3AB+8BvAss/MPoNyiO4j+dUJK2G3qmTGgJvvblDXYjkacQBY=
X-Received: by 2002:adf:fc88:: with SMTP id g8mr14854571wrr.259.1612137074249;
 Sun, 31 Jan 2021 15:51:14 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
 <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com>
In-Reply-To: <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Sun, 31 Jan 2021 18:50:36 -0500
Message-ID: <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
To: Elliott Mitchell <ehem+undef@m5p.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 31, 2021 at 6:33 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
>
> On Sun, Jan 31, 2021 at 02:06:17PM -0500, Tamas K Lengyel wrote:
> > (XEN) Unable to retrieve address 0 for /scb/pcie@7d500000/pci@1,0/usb@1,0
> > (XEN) Device tree generation failed (-22).
>
> > Does anyone have an idea what might be going wrong here? I tried
> > building the dtb without using the dtb overlay but it didn't seem to
> > do anything.
>
> If you go to line 1412 of the file xen/arch/arm/domain_build.c and
> replace the "return res;" with "continue;" that will bypass the issue.
> The 3 people I'm copying on this message though may wish to ask questions
> about the state of your build tree.

I'll try that but it's a pretty hacky work-around ;)

>
> Presently the rpixen script is grabbing the RPF's 4.19 branch, dates
> point to that last being touched last year.  Their tree is at
> cc39f1c9f82f6fe5a437836811d906c709e0661c.

I've moved the Linux branch up to 5.10 because there had been a fair
amount of work that went into fixing Xen on RPI4, which got merged
into 5.9 and I would like to be able to build upstream everything
without the custom patches coming with the rpixen script repo.

Tamas

