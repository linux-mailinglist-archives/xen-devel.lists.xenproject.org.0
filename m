Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A486ED142
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 17:25:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525498.816751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqy44-0005gf-7Z; Mon, 24 Apr 2023 15:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525498.816751; Mon, 24 Apr 2023 15:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqy44-0005de-3s; Mon, 24 Apr 2023 15:25:16 +0000
Received: by outflank-mailman (input) for mailman id 525498;
 Mon, 24 Apr 2023 15:25:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zAuZ=AP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pqy42-0005MZ-R6
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 15:25:14 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35bbb1c9-e2b4-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 17:25:14 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-504eac2f0b2so7899648a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Apr 2023 08:25:14 -0700 (PDT)
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
X-Inumbo-ID: 35bbb1c9-e2b4-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682349914; x=1684941914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsTK8roHyv7ixQ7OoBOH8UzoFvjwkzAMb1gTGOJ495M=;
        b=C5PkmlkY9r3anzmFWQZTunOhtrkeLWSH0bFKYjAWQPXudqIccZMwAJ56ZpAli2l2eC
         Vd0Y9rDZ+fBW1k4YAPRyrX2KMGNlYYo2Rsz8Gl1Zd0WZ0ztdBxe+if+e+b56jDyFKmIO
         lpGbZ5Ew850/WvJaYnaZkMTr8zDlBtybwq/gQkyYSEcYM2p+VvCTZ6kchtWUZRFc7x5H
         X1UDoDejBfNoN0NAru6o8cVeBLYKNlEQCaXOqAPfpRc9zSoP/xGpt/tnKCo9d7+ZGuZt
         8pkmPe2roOuiXN4vR1XnpjYGcm9sfrToLxU6xmsyJI5inlQOLEcoO1VobIM/Qf0ywv1t
         QlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682349914; x=1684941914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsTK8roHyv7ixQ7OoBOH8UzoFvjwkzAMb1gTGOJ495M=;
        b=NOD0uuX3sJGytcR9AkzuG8QyEIO73vbi9sg7261VV6vGUDvdxtJm9Gk8UOGJ8FzDYL
         Uewqpyc2JsAXP5Drew0HU/qI3hIKnhkXLfQsvI7hEJKzFrNp/24laQlVZ3uukAaGGiDw
         YemV8B22xVPl5imM/rNBrjNw1kRvzIOA+EfL5j1nNB+NMNePe0z25CCfEY9L3nzdeTQg
         mI3K2TL3O3qVFhyAcHKa+7xx/A2D/Px+DOtw8TCtQRDfgCQ+xB7RSVYSzb858t7hM5gT
         D9wkSQtfjTxVOqhK5wIlWE9sgQd7u0eWnZWPSlZ2w/4wHatfu08GHoH4T4ThyoBHTxcA
         mZtw==
X-Gm-Message-State: AAQBX9dS1P+KqonmRY67WctDIJFdNhHPJbfMpb55WLczdrjqwMG5lntm
	AItgOfyqGT/FOfyeVna/OdQeGszmD4tNLd7mQsM=
X-Google-Smtp-Source: AKy350bKPkSNtWaUQZU2/X4cqSiFg8qPRvOm5qSiFA582/nES5VeB55FywDaT+6pz/4B1dg85CqYxHdKpKP5O3pJo+E=
X-Received: by 2002:aa7:d744:0:b0:506:c2b2:72fc with SMTP id
 a4-20020aa7d744000000b00506c2b272fcmr10705022eds.7.1682349913587; Mon, 24 Apr
 2023 08:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
 <6984a8571dac35d04c85117834d99b00fe1c4184.1680752649.git-series.marmarek@invisiblethingslab.com>
 <4eb45940-5615-2398-633d-e5f59dc6987d@suse.com>
In-Reply-To: <4eb45940-5615-2398-633d-e5f59dc6987d@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 24 Apr 2023 11:25:01 -0400
Message-ID: <CAKf6xps2nVoYL6LtOqW2UBHadNSQzkb1XAe7WRxXmLzyN3kAGQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] x86/msi: clear initial MSI-X state on boot
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 10:19=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 06.04.2023 05:57, Marek Marczykowski-G=C3=B3recki wrote:
> > Some firmware/devices are found to not reset MSI-X properly, leaving
> > MASKALL set. Jason reports on his machine MASKALL persists through a
> > warm reboot, but is cleared on cold boot. Xen relies on initial state
> > being MASKALL clear. Especially, pci_reset_msix_state() assumes if
> > MASKALL is set, it was Xen setting it due to msix->host_maskall or
> > msix->guest_maskall. Clearing just MASKALL might be unsafe if ENABLE is
> > set, so clear them both.
> >
> > Reported-by: Jason Andryuk <jandryuk@gmail.com>
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit with a couple of nits (which I'd be happy to address while
> committing, so long as you agree). First one being on the last
> sentence above: It's surely not just "might"; if resetting already
> doesn't work right, nothing says that the individual mask bit all
> end up set. Clearing ENABLE as well is only natural imo, if we
> already need to fix up after firmware. So maybe "Even if so far not
> observed to be left set, clear ENABLE as well"?
>
> > --- a/xen/drivers/passthrough/msi.c
> > +++ b/xen/drivers/passthrough/msi.c
> > @@ -46,6 +46,23 @@ int pdev_msi_init(struct pci_dev *pdev)
> >          spin_lock_init(&msix->table_lock);
> >
> >          ctrl =3D pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> > +
> > +        if ( ctrl & (PCI_MSIX_FLAGS_MASKALL|PCI_MSIX_FLAGS_ENABLE) )
>
> Style (missing blanks around |; once more below).
>
> > +        {
> > +            /*
> > +             * pci_reset_msix_state() relies on MASKALL not being set
> > +             * initially, clear it (and ENABLE too - for safety), to m=
eet that
> > +             * expectation.
> > +             */
> > +            printk(XENLOG_WARNING
> > +                   "%pp: unexpected initial MSI-X state (MASKALL=3D%d,=
 ENABLE=3D%d), fixing\n",
> > +                   &pdev->sbdf,
> > +                   (ctrl & PCI_MSIX_FLAGS_MASKALL) ? 1 : 0,
> > +                   (ctrl & PCI_MSIX_FLAGS_ENABLE) ? 1 : 0);
>
> Our "canonical" way of dealing with this is !!(x & y).
>
> > +            ctrl &=3D ~(PCI_MSIX_FLAGS_ENABLE|PCI_MSIX_FLAGS_MASKALL);
> > +            pci_conf_write16(pdev->sbdf, msix_control_reg(pos), ctrl);
> > +        }
> > +
> >          msix->nr_entries =3D msix_table_size(ctrl);
> >
> >          pdev->msix =3D msix;
>
>
> Aiui there's no dependency here on the earlier patches in the series;
> please confirm (or otherwise).
>
> Jason - any chance of getting a Tested-by: from you?

I'm building v3 now.  v2  worked for clearing MASKALL on initial boot.

I posted in these two messages - a summary is below.
https://lore.kernel.org/xen-devel/CAKf6xpto87QRSKT2qc1yApNfaw2SrLLxPoytYJv_=
jEbYTAbjCg@mail.gmail.com/
https://lore.kernel.org/xen-devel/CAKf6xptHALLR-Qjf=3Dp5y0o9Ud2V7eFMJuB8Ap-=
PLjv-N7PAJVQ@mail.gmail.com/

OpenXT has a patch that performs an extra reset after domain shutdown,
and that causes Xen to set MASKALL.  I confirmed by removing it.  So
this patch helps with clearing MASKALL on host boot, but with the
OpenXT patch, rebooting a domain fails.  MASKALL gets set on VM
shutdown and then the subsequent boot can't assign the device.

So this patch is helpful in some scenarios, but it was also an issue
caused by the OpenXT patch.  Does that make it unsuitable for
inclusion?  I assume the OpenXT patch wasn't an issue previously since
MSI-X was never enabled.

Regards,
Jason

