Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720F86D4463
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 14:28:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517418.802695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJHW-0001pn-Sh; Mon, 03 Apr 2023 12:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517418.802695; Mon, 03 Apr 2023 12:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJHW-0001o6-Pl; Mon, 03 Apr 2023 12:27:30 +0000
Received: by outflank-mailman (input) for mailman id 517418;
 Mon, 03 Apr 2023 12:27:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmin=72=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pjJHV-0001nw-3Q
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 12:27:29 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e56cc482-d21a-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 14:27:28 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id r11so116629126edd.5
 for <xen-devel@lists.xenproject.org>; Mon, 03 Apr 2023 05:27:27 -0700 (PDT)
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
X-Inumbo-ID: e56cc482-d21a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680524847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiE7fi8L9R9ZN6JJC1ebw86MnpKbIthjLM1TAQ6wdds=;
        b=SLWKoRIjJSc15Z3iJSvUSE+xWKgnWLllIi48RMO+zJuuH7Zh+wfu6mQWj4g/CMbfvm
         LWfIFDCmD3now078RwoRVxGcd8QMPVa+yEXuGB84+ZsddkMy2ELo100vpXSifKl7azhg
         G71yRxDmgpp1CcWAbCQh56I92k7s7x2wSPsH3y0Dt5YrQvWc+cFhTfnwthmTY/O6uIAv
         ISyhl5lRlzuTNHuNdBi+JjIHUTb8vHrXTyHW4xoJCTvMXX1xftq912OTVPjEAFu5wsXj
         l7W7wkKhz8g9ZI8NY7YozGaSM3disnulAoQVpVCB88s5dMMeJb6JWKiQ5BugpfwBvtvR
         jGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680524847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiE7fi8L9R9ZN6JJC1ebw86MnpKbIthjLM1TAQ6wdds=;
        b=aKMCnrmbzJqodlJB1K5kGbrvjSDS2c7Xblt37z5/bitJp6AoVKfPYR5gIKaVQ1B//S
         RjxNtkej100WOGd2zNNukHnD2yoYr53PCq0woROJD6u0WuF6oGqscIJLdKCzfh9huFb1
         x/oLWz7IuLnIMA7nPIjA4czrKp92yV/obhE9WZl399ias3S/sl9OmfiF/CPwPkrS3eEd
         2AlZ2LMc+0VTA/zUVUhaauZCSksKPbfkngAMo5KfrcHxWwbR64HtvnKZKVjSqkQ3VZnB
         Dps9w8GRlVFQVhUYrD5Pjdw0hXeB4mtdtpThRm4erbFqv47trBiob3iQptb04tz3Jw+K
         Xk2g==
X-Gm-Message-State: AAQBX9cVmqtMNPlQtAX/KvD7cSzSkNtduqoOV2GJtsM0sCKk0GLt2Wao
	HjZcfhwWdPgVcVsuGIhGJH+crohUSG4KQnHjPN0=
X-Google-Smtp-Source: AKy350bvj5HIZOXxODdl9HmyUeSupI0oslUbBLSEUl1HB1gkoU4xmW0A4xcnaidpOajdABK2WAs4EAaIQ4xHo6NgWLI=
X-Received: by 2002:a17:907:20bc:b0:92a:581:ac49 with SMTP id
 pw28-20020a17090720bc00b0092a0581ac49mr15671469ejb.3.1680524847399; Mon, 03
 Apr 2023 05:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230312120221.99183-1-shentey@gmail.com> <20230312120221.99183-3-shentey@gmail.com>
 <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard> <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>
 <622b9674-fffd-4634-ac30-d0db3230478e@perard>
In-Reply-To: <622b9674-fffd-4634-ac30-d0db3230478e@perard>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 3 Apr 2023 08:27:14 -0400
Message-ID: <CAKf6xpvxf=F52etJ8o3eLQV4JVD5WM57znGoP3ctONRf7uPisA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] hw/isa/piix3: Reuse piix3_realize() in piix3_xen_realize()
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, Paul Durrant <paul@xen.org>, 
	xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Chuck Zmudzinski <brchuckz@aol.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 5:33=E2=80=AFAM Anthony PERARD <anthony.perard@citri=
x.com> wrote:
>
> On Sat, Apr 01, 2023 at 10:36:45PM +0000, Bernhard Beschow wrote:
> >
> >
> > Am 30. M=C3=A4rz 2023 13:00:25 UTC schrieb Anthony PERARD <anthony.pera=
rd@citrix.com>:
> > >On Sun, Mar 12, 2023 at 01:02:17PM +0100, Bernhard Beschow wrote:
> > >> This is a preparational patch for the next one to make the following
> > >> more obvious:
> > >>
> > >> First, pci_bus_irqs() is now called twice in case of Xen where the
> > >> second call overrides the pci_set_irq_fn with the Xen variant.
> > >
> > >pci_bus_irqs() does allocates pci_bus->irq_count, so the second call i=
n
> > >piix3_xen_realize() will leak `pci_bus->irq_count`. Could you look if
> > >pci_bus_irqs_cleanup() can be called before the second pci_bus_irqs()
> > >call, or maybe some other way to avoid the leak?
> >
> > Thanks for catching this! I'll post a v4.
> >
> > I think the most fool-proof way to fix this is to free irq_count just b=
efore the assignment. pci_bus_irqs_cleanup() would then have to NULL the at=
tribute such that pci_bus_irqs() can be called afterwards.
> >
> > BTW: I tried running qemu-system-x86_64 with PIIX4 rather than PIIX3 as=
 Xen guest with my pc-piix4 branch without success. This branch essentially=
 just provides slightly different PCI IDs for PIIX. Does xl or something el=
se in Xen check these? If not then this means I'm still missing something. =
Under KVM this branch works just fine. Any idea?
>
> Maybe the ACPI tables provided by libxl needs to be updated.
> Or maybe something in the firmware (SeaBIOS or OVMF/OvmfXen) check the
> id (I know that the PCI id of the root bus is checked, but I don't know
> if that's the one that's been changed).

Xen also has hvmloader, which runs before SeaBIOS/OVMF.  Looking at
tools/firmware/hvmloader/pci.c, it has
        ASSERT((devfn !=3D PCI_ISA_DEVFN) ||
               ((vendor_id =3D=3D 0x8086) && (device_id =3D=3D 0x7000)));

From QEMU, it looks like 0x7000 is PCI_DEVICE_ID_INTEL_82371SB_0, but
PIIX4 uses 0x7110 (PCI_DEVICE_ID_INTEL_82371AB_0).  Maybe try removing
that check?

Regards,
Jason

