Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFB56CC148
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515859.799133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9c6-0008MI-O4; Tue, 28 Mar 2023 13:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515859.799133; Tue, 28 Mar 2023 13:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9c6-0008K0-L1; Tue, 28 Mar 2023 13:43:50 +0000
Received: by outflank-mailman (input) for mailman id 515859;
 Tue, 28 Mar 2023 13:43:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IY7/=7U=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ph9c5-0008Ju-Ku
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:43:49 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91294e64-cd6e-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 15:43:48 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id cn12so49954812edb.4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Mar 2023 06:43:48 -0700 (PDT)
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
X-Inumbo-ID: 91294e64-cd6e-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680011028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMmKS3ch1qD+4oU0IdBcFNRmcoLkHIFo6+MDjVVdc2w=;
        b=fd4MZHQIzbN8W4QYwRjabteV2LNYAXDnbX/zk67gaGM2g49N5tGnBDOgdyQGVs57WW
         6QcyEF401/m9tO3pRzXLavP8FY8mlXdhbmfDkMvD8ht4jSxj2hP4+lBhysKQNe9msLOR
         sfca3BlZQFoKwc8N6adZ+6cbkYGZ1rO4vpJQth44MaMyyKl2QWmLmAzhi+b6+OrR5YrI
         V54ZTNG14N49aGX4Boflmhb+N1P/ogr6KFqIsvsXUaOT1QD45gt2F+PtR9PJ73nH1P33
         b7j+vI+Q8Y/YE0hP04du3aRkvNLUx+N08cKmFI7Z7oSuqIqKz5jT8NBwcAAbvNdCUqDE
         7d0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680011028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMmKS3ch1qD+4oU0IdBcFNRmcoLkHIFo6+MDjVVdc2w=;
        b=DNuIAKCDQdqYOzsZX4/7CMjYTf1Gx30Xxp6NFPcmztwBUOvm9L+zE2FyAOu7dnx0dU
         DwjgcMmom1YdrxdbSBbFFwGzya7x8b+bNsBb+citbdCzmJNL4C9NVtcrTNUIRAToEKGu
         Kwqd6EUQHDHrG+s21IZPcraomfQNmELn+bkWkYEMDUb6eqqzTmsjuuzn9JUU4KN98o+X
         7QEi23FGO3564rVBNQ6Ep+G5XLVaGZ1WBtJ+mAulOldOc8I746LssVwUcSYqTU9g1flS
         4WdXCY2LCXSfTdv5RQxz++C7lIIGLzvEX54ouVC/LUWO2aewVqrLC17A8lU5cRDbzT2T
         uEog==
X-Gm-Message-State: AAQBX9fRDAKtHSNOl5lLE8RntzYCfSFF5cN6VmQDgSxC/RR1kCDWcygV
	gX5mORiODbML//TGVzxKUdqswj74FUkr1GVicxrQnhy95XI=
X-Google-Smtp-Source: AKy350YIh3KZpAulf6SmhkeMYgdNFdg2i6H5mX7sttqubron1D8fwHIsmM8+7O7UTDM8YbDPf1ZQYpgu1RWTO65zFOw=
X-Received: by 2002:a17:907:20bc:b0:92a:581:ac49 with SMTP id
 pw28-20020a17090720bc00b0092a0581ac49mr6960342ejb.3.1680011027952; Tue, 28
 Mar 2023 06:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com> <5cfcfb7a-df50-fbe4-89e6-611a83991790@suse.com>
 <ZCLl3ePLgrmFTViV@mail-itl> <1b530e63-de12-f953-1fb5-4e3c3ea69fea@suse.com>
 <ZCLrX2TmYlg2kMxL@Air-de-Roger> <CAKf6xptXovH5-OwuuJ4cNz4JxG-mw3mcwRBJf4PuTwjBA12fSA@mail.gmail.com>
 <6d4c11c3-31f1-48bc-b7b6-0ad0b73fc09c@suse.com>
In-Reply-To: <6d4c11c3-31f1-48bc-b7b6-0ad0b73fc09c@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 28 Mar 2023 09:43:35 -0400
Message-ID: <CAKf6xptkHRcda5DPs4e2+7sgq8ck4-wKZhTHNC+43XWHZy_2TQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 9:35=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 28.03.2023 15:32, Jason Andryuk wrote:
> > On Tue, Mar 28, 2023 at 9:28=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau=
@citrix.com> wrote:
> >> On Tue, Mar 28, 2023 at 03:23:56PM +0200, Jan Beulich wrote:
> >>> On 28.03.2023 15:04, Marek Marczykowski-G=C3=B3recki wrote:
> >>>> On Tue, Mar 28, 2023 at 02:54:38PM +0200, Jan Beulich wrote:
> >>>>> On 25.03.2023 03:49, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>>> Some firmware/devices are found to not reset MSI-X properly, leavi=
ng
> >>>>>> MASKALL set. Xen relies on initial state being both disabled.
> >>>>>> Especially, pci_reset_msix_state() assumes if MASKALL is set, it w=
as Xen
> >>>>>> setting it due to msix->host_maskall or msix->guest_maskall. Clear=
ing
> >>>>>> just MASKALL might be unsafe if ENABLE is set, so clear them both.
> >>>>>
> >>>>> But pci_reset_msix_state() comes into play only when assigning a de=
vice
> >>>>> to a DomU. If the tool stack doing a reset doesn't properly clear t=
he
> >>>>> bit, how would it be cleared the next time round (i.e. after the gu=
est
> >>>>> stopped and then possibly was started again)? It feels like the iss=
ue
> >>>>> wants dealing with elsewhere, possibly in the tool stack.
> >>>>
> >>>> I may be misremembering some details, but AFAIR Xen intercepts
> >>>> toolstack's (or more generally: accesses from dom0) attempt to clean
> >>>> this up and once it enters an inconsistent state (or rather: starts =
with
> >>>> such at the start of the day), there was no way to clean it up.
> >>>
> >>> Iirc Roger and you already discussed that there needs to be an
> >>> indication of device reset having happened, so that Xen can resync
> >>> from this "behind its back" operation. That would look to be the
> >>> point/place where such inconsistencies should be eliminated.
> >>
> >> I think that was a different conversation with Huang Rui related to
> >> the AMD GPU work, see:
> >>
> >> https://lore.kernel.org/xen-devel/ZBwtaceTNvCYksmR@Air-de-Roger/
> >>
> >> I understood the problem Marek was trying to solve was that some
> >> devices where initialized with the MASKALL bit set (likely by the
> >> firmware?) and that prevented Xen from using them.  But now seeing the
> >> further replies on this patch I'm unsure whether that's the case.
> >
> > In my case, Xen's setting of MASKALL persists through a warm reboot,
>
> And does this get in the way of Dom0 using the device? (Before a DomU
> gets to use it, things should be properly reset anyway.)

Dom0 doesn't have drivers for the device, so I am not sure.  I don't
seem to have the logs around, but I believe when MASKALL is set, the
initial quarantine of the device fails.  Yes, some notes I have
mention:

It's getting -EBUSY from pdev_msix_assign() which means
pci_reset_msix_state() is failing:
    if ( pci_conf_read16(pdev->sbdf, msix_control_reg(pos)) &
         PCI_MSIX_FLAGS_MASKALL )
        return -EBUSY;

Regards,
Jason

