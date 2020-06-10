Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEA41F5DDB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 23:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj8Yb-0002NT-9R; Wed, 10 Jun 2020 21:46:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onEK=7X=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jj8Ya-0002NO-1Z
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 21:46:48 +0000
X-Inumbo-ID: e20bf666-ab63-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e20bf666-ab63-11ea-b7bb-bc764e2007e4;
 Wed, 10 Jun 2020 21:46:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id x6so3957558wrm.13
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 14:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4LvjtnXYz/vAAHcoM1v81G9wuMx8OKexAw8K4dEHhjI=;
 b=N89ITOlfSoqB52s+j1djJcFwDByZlBDCrELEP448Ymu2k1ZMDyJtRjZ/vnYdUUYBBA
 pARqKNUCrj9ZBFHoW1CtEW6cA60w0Ss8O19NgeGjVRarNuVBmEkLnKl62ApI0KUAGuPB
 1xEwtZ4gJWUGvczOWSVgUZxt2EcsKMI1T4wu2+4hr00mMqMpblhnHcXWfruY+NBjnox3
 DiChTjoOsbf1urdhqlI8oJA/I46s1Z57c3FkqybJTeAwlVDKZ5b+6NMIIMXeLz/6N8/v
 +2+2pfCWqtf4XcYZAednJFZvSjEzbJnc0yTg4d+kB66QxAS39sNJMobTFiCeLDWGbYHs
 LY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4LvjtnXYz/vAAHcoM1v81G9wuMx8OKexAw8K4dEHhjI=;
 b=JxyH63McU3xxIFM3wrJJ/SkfMxqrF8pwLAXwnn6GBKktBVpZRBZZDSBdBBVqT1CJh9
 5qHHmnpm0nZ7FSVKKcBwYYk1GRrEsIcvkvckLB6rLJ2kCP1haaxBMoejCBHbQ9blSf8x
 gBq2XqMpanLlkP6mcL6yXbCdBheX4tRjYqepjT6DPFNPohKvTvyYwFmP/+zAlzBKhI5E
 de0Bp980FOg0WnTekAwpL6vQJO9fHyrgRYpmHImfTl8+HQmWzUPssQR4sV64ZFkM0Y6i
 aFf61I01kPaIYAkU9S6S+QNZQ9xo0sdbsz9qlz9UYogU0+xEXuJjkm/+7pqZ+EqjPx4V
 Flgw==
X-Gm-Message-State: AOAM5330GF3HHB1QOe6X33Z425+Qr9G8PJYjpdPZdq/enFD2yH5MGVKO
 qgvg1BdUrXdCoGdO+p7RtFO7FmjZN9u5JDQAqvk=
X-Google-Smtp-Source: ABdhPJwRBuI2fBGS49fA55Sc1KYBPPCO+mTLNqCjm6VdOL4S+K5cLgU6W63pthyHuqb3zLDS7/fP1Cc+yPCfn4b/Vxg=
X-Received: by 2002:adf:f64e:: with SMTP id x14mr6084618wrp.426.1591825606742; 
 Wed, 10 Jun 2020 14:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
 <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
 <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
 <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
 <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
 <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
 <CALYbLDh8F0JuGmRY0C1Nhp_b4FP041KMa14pOmyoSBtHcz=A2A@mail.gmail.com>
 <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
 <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
 <03607739-A4FF-486A-899A-F5F36870225A@arm.com>
 <2ec6255c-9d28-92e7-bd0a-59edb9fc078a@xen.org>
 <6033f9cecbf10f50f4a713ce52105426@kernel.org>
In-Reply-To: <6033f9cecbf10f50f4a713ce52105426@kernel.org>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 10 Jun 2020 22:46:35 +0100
Message-ID: <CAJ=z9a1k606A+sA467eY8iPuHnptMUFzxEFithpe=JKHogjt0g@mail.gmail.com>
Subject: Re: Keystone Issue
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 CodeWiz2280 <codewiz2280@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Marc,

On Tue, 9 Jun 2020 at 18:45, Marc Zyngier <maz@kernel.org> wrote:
> > I was wondering if you heard about any potential issue with guest EOI
> > not forwarded to the host. This is on TI Keystone (Cortex A-15).
>
> Not that I know of. A-15 definitely works (TC2, Tegra-K1, Calxeda Midway
> all run just fine with guest EOI), and GIC-400 is a pretty solid piece
> of kit (it is just sloooooow...).
>
> Thinking of it, you would see something like that if the GIC was seeing
> the writes coming from the guest as secure instead of NS (cue the early
> firmware on XGene that exposed the wrong side of GIC-400).

Ah, I remember that one.  We used to carry an hack in Xen [1] for
X-Gene. Thankfully they fixed the firmware!

If it is a similar issue, then the firmware path would definitely be
my preference.

Thank you for the input!

Cheers,

[1] http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=50dcb3de603927db2fd87ba09e29c817415aaa44

