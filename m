Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F456CC971
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 19:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516008.799492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phDHF-0002sO-Ff; Tue, 28 Mar 2023 17:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516008.799492; Tue, 28 Mar 2023 17:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phDHF-0002qH-CO; Tue, 28 Mar 2023 17:38:33 +0000
Received: by outflank-mailman (input) for mailman id 516008;
 Tue, 28 Mar 2023 17:38:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IY7/=7U=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1phDHE-0002q9-7F
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 17:38:32 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b2de6c3-cd8f-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 19:38:31 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id w9so52966537edc.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Mar 2023 10:38:31 -0700 (PDT)
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
X-Inumbo-ID: 5b2de6c3-cd8f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680025111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8W8qlPz79ogoa6D6Z1b2Q3RyWIL+9RhPTChdKg42fI=;
        b=Ahdl9iMilksF/aQuGIiraZSaafnx2eZbcwdfbCdMoT8T0nvGfFvrZcKbVSSbqD+euu
         +cvXwQzQlh1UG8ScIHvUcSaRt0IPWW1XNO/87LwLDe8aIZO3+4NIoyA6+P/M/blseq/l
         STkkySh3hrH0qOmpZJxh3jrxlUSED+/rEKXyYW64I8UYRvuvzcGSIGBKyfBYOIfsJdhZ
         09SyxpH01DJJSOidzJGXzvFaZmmaVX8fXbt30981/Kwzq3CpzrMxqLUoKw9rx5e2wHVN
         v2OEd7Zk9YeOrxvUhEeaZYD5LOfqZKz7QLwrQxOIfxT7WeG+RRRfZ0ujzPfhhbzGuvQV
         1pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680025111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8W8qlPz79ogoa6D6Z1b2Q3RyWIL+9RhPTChdKg42fI=;
        b=gGWwlPsN+spQkPJOVCJzdNIbf7EU6cQwUrJ2SsoGIFpDzgK3WZlAemhPCL4GnpbI9h
         3p9n0Xiiknxe52WiokAoVinobw4REQKqh5mH+plo03Ga1F0n21/SGscj9tnPKSUxjEe5
         VP5AmKJr3ARV7z4N+S0z6MsYWW/7kH8/WkmVvfCgHDIo988NFLhGcIjqaxnl7aNyVFW0
         cWvPNA+iS1l7A9KtaqLh/G4cQrHURZS0PCwz+UMRY2KohrK5xZBm0rvxUJBIEOP4AkNk
         /rboIAZ1k3weF0pMSZKbE5GB4nwIXKcqW6ZJ5Cl9KD8RqmS27I2gUgrUjtFcaftA+uid
         iSZw==
X-Gm-Message-State: AAQBX9dsWCm5V+WtDZiqpF1fbn4P8ln+0FBpoVp9JzWFlJGBj+4cl0UG
	6oegTN+tgwdPxWE8/45YxycfEcEZpfxCIXvgjjI=
X-Google-Smtp-Source: AKy350Yd9u9HVIzvN+5I2BYSlO8yCMHotrbdr2IyIq078JhrW9x3R2jKcxe0+9+ezZoYh4KhdvbmK8vj+FGMYhxgLfU=
X-Received: by 2002:a17:907:f90:b0:924:32b2:e3d1 with SMTP id
 kb16-20020a1709070f9000b0092432b2e3d1mr8220585ejc.3.1680025110763; Tue, 28
 Mar 2023 10:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com> <5cfcfb7a-df50-fbe4-89e6-611a83991790@suse.com>
 <ZCLl3ePLgrmFTViV@mail-itl> <CAKf6xpto87QRSKT2qc1yApNfaw2SrLLxPoytYJv_jEbYTAbjCg@mail.gmail.com>
In-Reply-To: <CAKf6xpto87QRSKT2qc1yApNfaw2SrLLxPoytYJv_jEbYTAbjCg@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 28 Mar 2023 13:38:18 -0400
Message-ID: <CAKf6xptHALLR-Qjf=p5y0o9Ud2V7eFMJuB8Ap-PLjv-N7PAJVQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 9:17=E2=80=AFAM Jason Andryuk <jandryuk@gmail.com> =
wrote:
>
> On Tue, Mar 28, 2023 at 9:04=E2=80=AFAM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Tue, Mar 28, 2023 at 02:54:38PM +0200, Jan Beulich wrote:
> > > On 25.03.2023 03:49, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Some firmware/devices are found to not reset MSI-X properly, leavin=
g
> > > > MASKALL set. Xen relies on initial state being both disabled.
> > > > Especially, pci_reset_msix_state() assumes if MASKALL is set, it wa=
s Xen
> > > > setting it due to msix->host_maskall or msix->guest_maskall. Cleari=
ng
> > > > just MASKALL might be unsafe if ENABLE is set, so clear them both.
> > >
> > > But pci_reset_msix_state() comes into play only when assigning a devi=
ce
> > > to a DomU. If the tool stack doing a reset doesn't properly clear the
> > > bit, how would it be cleared the next time round (i.e. after the gues=
t
> > > stopped and then possibly was started again)? It feels like the issue
> > > wants dealing with elsewhere, possibly in the tool stack.
> >
> > I may be misremembering some details, but AFAIR Xen intercepts
> > toolstack's (or more generally: accesses from dom0) attempt to clean
> > this up and once it enters an inconsistent state (or rather: starts wit=
h
> > such at the start of the day), there was no way to clean it up.
> >
> > I have considered changing pci_reset_msix_state() to not choke on
> > MASKALL being set, but I'm a bit afraid of doing it, as there it seems
> > there is a lot of assumptions all over the place and I may miss some.
>
> Hi, Marek and Jan,
>
> Marek, thank you for working on MSI-X support.
>
> As Jan says, the clearing here works during system boot.  However, I
> have found that Xen itself is setting MASKALL in __pci_disable_msix()
> when shutting down a domU.  When that is called, memory_decoded(dev)
> returns false, and Xen prints "cannot disable IRQ 137: masking MSI-X
> on 0000:00:14.3".  That makes the device unavailable for subsequent
> domU assignment.  I haven't investigated where and why memory decoding
> gets disabled for the device.
>
> Testing was with this v2 patchset integrated into OpenXT w/ Xen 4.16.
> We have some device reset changes, so I'll have to look at them again.
> Hmmm, they move the libxl device reseting from pci_remove_detached()
> to libxl__destroy_domid() to ensure all devices are de-assign after
> the domain is destroyed.  A kernel patch implements a "more thorough
> reset" which could do a slot or bus level reset, and the desire is to
> have all devices deassigned before that.  Maybe the shift later is
> throwing off Xen's expectations?

I dropped the OpenXT libxl patch, and Xen is not setting MASKALL.

Regards,
Jason

