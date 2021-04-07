Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AE2357BAF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 07:06:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106925.204556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUMrA-0003GD-DX; Thu, 08 Apr 2021 05:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106925.204556; Thu, 08 Apr 2021 05:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUMrA-0003Fo-9m; Thu, 08 Apr 2021 05:05:28 +0000
Received: by outflank-mailman (input) for mailman id 106925;
 Wed, 07 Apr 2021 20:50:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DVea=JE=efficientek.com=development@srs-us1.protection.inumbo.net>)
 id 1lUF8J-0003AY-Vf
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 20:50:40 +0000
Received: from mail-oo1-xc2a.google.com (unknown [2607:f8b0:4864:20::c2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba73f379-9494-47f4-923b-244f5917b86e;
 Wed, 07 Apr 2021 20:50:39 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 p2-20020a4aa8420000b02901bc7a7148c4so4858904oom.11
 for <xen-devel@lists.xenproject.org>; Wed, 07 Apr 2021 13:50:39 -0700 (PDT)
Received: from crass-HP-ZBook-15-G2 ([2605:a601:ab16:db00:8318:3d36:3347:eb95])
 by smtp.gmail.com with ESMTPSA id z17sm5645511ote.77.2021.04.07.13.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 13:50:38 -0700 (PDT)
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
X-Inumbo-ID: ba73f379-9494-47f4-923b-244f5917b86e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=efficientek-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references:reply-to
         :mime-version:content-transfer-encoding;
        bh=ChINn1Q9RhQdEt3XMQ9k5f2V28S3yNcE1R7bx8iCIOI=;
        b=JikbZSPt78h7m0dgIM/Lu8u5bNwDgR5RmrcPFcpDHKtiTCVgKvKEPddWPKJH7l9a53
         Y5VorZD9V33/AulXpN5P9Kz5norpmWvu4/hywLzIjFjCD8IUmIdC8Hknqfmsw1rJyjEM
         UrdTwjIs68y21AqpiJvQ+21Mc/Utuye7h5Q/1SOr3PW8qmYT4iCgtd37IrYfajgZmGHV
         il3SwSOT3eq+5xPYmOaXhrQGNFRE7xGrTVW9jU1yUvlfO7ACy37+3tz7oyQU+Rtb5Bwc
         fWeUzz4s8kyL2ufI/neH8XDpBwXcwgrKpeiaa9pLaffpuf/QOw8YSuejgzj548TKPWsO
         WkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:reply-to:mime-version:content-transfer-encoding;
        bh=ChINn1Q9RhQdEt3XMQ9k5f2V28S3yNcE1R7bx8iCIOI=;
        b=LxHyRITGLtHnkytLMgoO1Ty+IvoOxnfBNwapfBUGUlG8/aKFz6g4rxofqT31CqQ5dP
         bS/M8lguLqxgN88NDlRbrlwZybtYYACVhH/Hcg69FmJbklJ9LNS0rc/xF+ZskiAvtqnW
         RBXsGendVBV5S8wBCIVGizerzptcGbz4eE48DfF4jjVHRhUfmFW85kr9MqhvtyJ8pQWA
         1V5dfuLbmcy0u2fHlR6dUM/xwpzBbN3B+B9l5+zshqu1G8q0iew6xUAlivewLtuIMMbZ
         T7HU0+7alcrKJ0ABZHZ3NiMnzwEAAClaNediRjO4EtHWieCASidmK+Q568KOr5YwtCd7
         gNbQ==
X-Gm-Message-State: AOAM531BWlmp/BzpGW5pA4xYP8Li1zkYy5/R1V7NG1qZRXSZI2pW488L
	oGU+RkxzIEQT4N6aCt+oipr8nw==
X-Google-Smtp-Source: ABdhPJw3LluzUGGzh0aIjj1w7lge3T8E6E5taFNiGxzgNiZ3+yIZDyTosnvKGjNg9tjf+UsibTajSg==
X-Received: by 2002:a4a:e615:: with SMTP id f21mr4433293oot.91.1617828638712;
        Wed, 07 Apr 2021 13:50:38 -0700 (PDT)
Date: Wed, 7 Apr 2021 15:50:32 -0500
From: Glenn Washburn <development@efficientek.com>
To: Andrew Cooper via Grub-devel <grub-devel@gnu.org>
Cc: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Roman
 Shaposhnik <roman@zededa.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: multiboot2 and module2 boot issues via GRUB2
Message-ID: <20210407155032.6a83d0cb@crass-HP-ZBook-15-G2>
In-Reply-To: <a8c7fb60-7a95-1a99-4005-b04bcac4c2be@citrix.com>
References: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
	<23baec07-a3ae-949a-a1fb-09100efd53e5@citrix.com>
	<CAMmSBy96=FwR0zZy199e0YhFefgZj_PFOMiaB2nKjqdQvKufow@mail.gmail.com>
	<b5ed3a53-5152-aba1-820d-ccab72a82c61@suse.com>
	<YGWH89ubVe104Tnl@Air-de-Roger>
	<a8c7fb60-7a95-1a99-4005-b04bcac4c2be@citrix.com>
Reply-To: development@efficientek.com
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Apr 2021 20:43:46 +0100
Andrew Cooper via Grub-devel <grub-devel@gnu.org> wrote:

> On 01/04/2021 09:44, Roger Pau Monn=C3=A9 wrote:
> > On Thu, Apr 01, 2021 at 09:31:07AM +0200, Jan Beulich wrote:
> >> On 01.04.2021 03:06, Roman Shaposhnik wrote:
> >>> And the obvious next question: is my EVE usecase esoteric enough
> >>> that I should just go ahead and do a custom GRUB patch or is
> >>> there a more general interest in this?
> >> Not sure if it ought to be a grub patch - the issue could as well
> >> be dealt with in Xen, by concatenating modules to form a monolithic
> >> initrd.
> > I would rather have it done in the loader than Xen, mostly because
> > it's a Linux boot specific format, and hence I don't think Xen
> > should have any knowledge about it.
> >
> > If it turns out to be impossible to implement on the loader side we
> > should consider doing it in Xen, but that's not my first option.
>=20
> Concatenating random things which may or may not be initrds is
> absolutely not something Xen should do.=C2=A0 We don't have enough context
> to do it safely/sensibly.
>=20
> Honestly, I like the idea of supporting something like this generally
> in grub.=C2=A0 Linux already commonly has initrd preparation prepending an
> uncompressed microcode CPIO archive, and I can see a usability
> advantage from maintaining the initrd fragments separately.
>=20
> Looking at the grub manual, this behaviour of the `initrd` command
> isn't even documented.=C2=A0 Perhaps that should be fixed first, and then
> maybe `module2_multi` added too?

If you mean that the concatenation of multiple initrds by the `initrd`
command isn't documented (not sure that's the behavior your'r referring
to), it actually has been recently documented (by me) and is in master.
You're probably looking at the last release (2.04) documentation, in
which it is indeed not documented. This should change soon after
release and the documentation gets updated accordingly.

Glenn

