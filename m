Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EFC6E09CD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 11:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520574.808293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmsyB-0002iN-4m; Thu, 13 Apr 2023 09:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520574.808293; Thu, 13 Apr 2023 09:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmsyB-0002fJ-1u; Thu, 13 Apr 2023 09:10:19 +0000
Received: by outflank-mailman (input) for mailman id 520574;
 Thu, 13 Apr 2023 09:10:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ryz=AE=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pmsy9-0002f7-Rl
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 09:10:17 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01591ccf-d9db-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 11:10:16 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id xi5so35699109ejb.13
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 02:10:16 -0700 (PDT)
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
X-Inumbo-ID: 01591ccf-d9db-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681377016; x=1683969016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Do4v+4gSZeDj6LuHJ8qdjlM3TTHlOiF+w4OATSLeFHM=;
        b=wGEP9wcTBajPafFO4L3RzrwQHHWrL+ZU6umu2uZGYSrXLPRSkdnGU1d65GUly6zZRq
         eT5qK00lxgi99YdAnBIOcG/PH83oNEnVkA0xsIOQS+EswUmmr2F+lluejQirkr9aF6N4
         2VDk+Fsz2QFbCWmSmlXB0hYER+MXHNCtOZSolffaY2IJ9owFQPuWjt+cfjsDpAJ6MEmC
         lDlrwyZRtVlkmzOEey5kzjgRgOvUj2wQmWeMy6SyFISVS3qd3YcTRCKgDC79OMf7GZ1T
         S3btuB1ODhmxglf2hpZTVM0MzrYorI2jz7bT8HxaSgYjbXpV79K4SG50b3eyTs1JKthu
         TcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681377016; x=1683969016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Do4v+4gSZeDj6LuHJ8qdjlM3TTHlOiF+w4OATSLeFHM=;
        b=FsdrJvOiKGc/B1buCEauEbEfrjjSgCHI+QtHc8xppLmzWZM+ZfuHRIMzMy0kW3IlvG
         YaGgp1RJ4fTdXKDxMhG/0pEhhR7MaHFwpHVrod2dzJKTOGp4+saFICUTCzpfb/Qa2uwf
         nsKRAPvIUhDASsAQMz1p8Xcsd36UzusoBw7JO/+t1fk13npN7rlLYHqcdFHdF6VIwRax
         4LmywohRk/2KUD2BOTKRM+Gb3ZPj8cgjAAR4D3wKzdbf+rDh43Vb1ARx7vqcuMNHlcrd
         ZiXUh5sHoRIJYN1oo1NPDZnuumpqNBkbpyBob7bevhH/dF8j914uUCQulFF5atX0Lgh5
         Cdtw==
X-Gm-Message-State: AAQBX9daLbb7JlEK9IAsS/8W5rbdCcaam7sPqRV+AWGo12Fa5Lq4vN3t
	WiG7g3YJXT41x29UYr0WYJDCBx8wZFJg5xGikboEbw==
X-Google-Smtp-Source: AKy350byjrmiwhEHWnHNrUEegIDr5idiF0lEE4xD/k/48btffTUnjrwf7orRfE/QIRyTnbVQIaHIDqnClr3J21bxCL0=
X-Received: by 2002:a17:906:3c52:b0:94e:5c27:dc5f with SMTP id
 i18-20020a1709063c5200b0094e5c27dc5fmr883617ejg.6.1681377015834; Thu, 13 Apr
 2023 02:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230412185102.441523-1-dwmw2@infradead.org> <CAFEAcA9G0KpkOivD8fBvEQwGcTsUQz53z5W53YcjcHmZGPHkmQ@mail.gmail.com>
 <ac9417c017a2f1bda399d831b100e9b009f8d4c2.camel@infradead.org>
In-Reply-To: <ac9417c017a2f1bda399d831b100e9b009f8d4c2.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 10:10:04 +0100
Message-ID: <CAFEAcA_UoiM5vFqvyia3tU0Kb9xCMkFUoRiDPrcqX9te33Ot+A@mail.gmail.com>
Subject: Re: [PATCH for-8.0 0/5] Xen emulation build/Coverity fixes
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, no Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Apr 2023 at 20:01, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Wed, 2023-04-12 at 19:55 +0100, Peter Maydell wrote:
> > On Wed, 12 Apr 2023 at 19:52, David Woodhouse <dwmw2@infradead.org> wro=
te:
> > >
> > > Some Coverity fixes and minor cleanups. And most notably, dropping
> > > support for Xen libraries older than 4.7.1.
> > >
> > > I believe there are two issues that remain to be fixed. The x32 build
> > > fails, and I've seen patches which attempt to detect x32 and disable
> > > the Xen emulation. Along with assertions that we just shouldn't care.
> > > I don't have a strong opinion either way but it seems to be in hand.
> > >
> > > The other is the question of what Xen *actually* does if you try to
> > > unmap an IRQ_MSI_EMU PIRQ. I don't think Linux guests try that, and
> > > I'm fairly sure Windows doesn't even use MSI=E2=86=92PIRQ mappings in=
 the
> > > first place, and I doubt any other guests care either. I'd like to
> > > establish the 'correct' behaviour and implement it, ideally before
> > > the 8.0 release, but it's going to take me a few days more.
> > >
> > > David Woodhouse (5):
> > >       hw/xen: Simplify emulated Xen platform init
> > >       hw/xen: Fix memory leak in libxenstore_open() for Xen
> > >       xen: Drop support for Xen versions below 4.7.1
> > >       hw/xen: Fix double-free in xen_console store_con_info()
> > >       hw/xen: Fix broken check for invalid state in xs_be_open()
> > >
> >
> > This is highly unlikely to make 8.0 at this point, FYI.
> > If there's anything in this you think is super-critical we
> > might be able to sneak it in.
>
> Nothing is super-critical except maybe the double-free in
> store_con_info(). That could lead to a crash on startup if the QEMU Xen
> console is being used.

I've cherry-picked that double-free patch to apply for 8.0; thanks.

-- PMM

