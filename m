Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B116CC0FC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515841.799093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9RH-00054B-Rw; Tue, 28 Mar 2023 13:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515841.799093; Tue, 28 Mar 2023 13:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9RH-00051j-OY; Tue, 28 Mar 2023 13:32:39 +0000
Received: by outflank-mailman (input) for mailman id 515841;
 Tue, 28 Mar 2023 13:32:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IY7/=7U=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ph9RG-00051b-KX
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:32:38 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00ba43ff-cd6d-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 15:32:36 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id i5so50001192eda.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Mar 2023 06:32:36 -0700 (PDT)
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
X-Inumbo-ID: 00ba43ff-cd6d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680010356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avRdTBxIRXTiqbYNmx6BA/a4fa3mHTMXauIWBufhyO4=;
        b=TfJs0zypfELqSJHvH9hleNj8oLr73pRrVYtYd3TjdHX31fwaNOb7UuOvhtkjTOW7yK
         BKEnR/Qn7EUIMRcLRbvLx3OCqJWNMwX57lpy2z+0w2U7w0JXdTAXWiH/YlHBtlBQVk4D
         Nb1GFsNe/rxVnVEwxuYrP+Lmd5Yf1D5ucYBP0ZDqoxX5j6oJs+wCb+r06+5XlcgH9tve
         HxKmZX4FybklHh2CP01s7l6wXrgHcbBDya8dd/pGV7kjVYJ54AcMxdcYWDY8TK3894QF
         ulbNNEH45LpHdt2Hvlj1NmADaA2LvcwxKlHfQy07ryQjfLqMjpMzCfSY/+A/nn1NWufX
         TSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680010356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avRdTBxIRXTiqbYNmx6BA/a4fa3mHTMXauIWBufhyO4=;
        b=LQ6OQaYX6dNO6QM65o9yMJcttHIrPgSvnNsvURywS+d5HscP1Ue8TFE8ZNy5j99yp9
         g+443YWgav36grVXUegJTjGMV5eiDz1l1J8sJthPh4+nI9RSzTDnnBBcGNSBY/VsuYSQ
         jl3ych1Fc1TPs88ovaBD18dt8qb1bhevqDklzmwmj1BF5MEk/m093qQS7x2gFUtHnbvS
         8+OZFRmDH9I367+cDK0uNVDnO33jp9VRsvRMmDTq9eoAkg/+gFlNwL0vGGaG/Ks46KTw
         DXZ6DLpCEpbb0WIo6IoK1bAozPU1v51Ua7iHYnNawlivZWdeSTQbq0Kxe6ALhLM06Fxq
         HtIA==
X-Gm-Message-State: AAQBX9fnjJ0nxsyMI7Grj5XQQ1HutavAPtIMHdMAJ38iLeroqIRN5hF5
	5IC6cbDwSNBo7UxKqTbNDbBpo90+6qw5ZPn12Y4=
X-Google-Smtp-Source: AKy350bho/1fNnsajXNRLFQXT3x5+9j9GIVjkAti6HPujy3hz4TN4V9KaH/latPG7kIOcYv9T0Bzz6AGenY0SzP73sw=
X-Received: by 2002:a17:907:b60b:b0:8ae:9f1e:a1c5 with SMTP id
 vl11-20020a170907b60b00b008ae9f1ea1c5mr7618068ejc.3.1680010356177; Tue, 28
 Mar 2023 06:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com> <5cfcfb7a-df50-fbe4-89e6-611a83991790@suse.com>
 <ZCLl3ePLgrmFTViV@mail-itl> <1b530e63-de12-f953-1fb5-4e3c3ea69fea@suse.com> <ZCLrX2TmYlg2kMxL@Air-de-Roger>
In-Reply-To: <ZCLrX2TmYlg2kMxL@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 28 Mar 2023 09:32:24 -0400
Message-ID: <CAKf6xptXovH5-OwuuJ4cNz4JxG-mw3mcwRBJf4PuTwjBA12fSA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 9:28=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com> wrote:
>
> On Tue, Mar 28, 2023 at 03:23:56PM +0200, Jan Beulich wrote:
> > On 28.03.2023 15:04, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Tue, Mar 28, 2023 at 02:54:38PM +0200, Jan Beulich wrote:
> > >> On 25.03.2023 03:49, Marek Marczykowski-G=C3=B3recki wrote:
> > >>> Some firmware/devices are found to not reset MSI-X properly, leavin=
g
> > >>> MASKALL set. Xen relies on initial state being both disabled.
> > >>> Especially, pci_reset_msix_state() assumes if MASKALL is set, it wa=
s Xen
> > >>> setting it due to msix->host_maskall or msix->guest_maskall. Cleari=
ng
> > >>> just MASKALL might be unsafe if ENABLE is set, so clear them both.
> > >>
> > >> But pci_reset_msix_state() comes into play only when assigning a dev=
ice
> > >> to a DomU. If the tool stack doing a reset doesn't properly clear th=
e
> > >> bit, how would it be cleared the next time round (i.e. after the gue=
st
> > >> stopped and then possibly was started again)? It feels like the issu=
e
> > >> wants dealing with elsewhere, possibly in the tool stack.
> > >
> > > I may be misremembering some details, but AFAIR Xen intercepts
> > > toolstack's (or more generally: accesses from dom0) attempt to clean
> > > this up and once it enters an inconsistent state (or rather: starts w=
ith
> > > such at the start of the day), there was no way to clean it up.
> >
> > Iirc Roger and you already discussed that there needs to be an
> > indication of device reset having happened, so that Xen can resync
> > from this "behind its back" operation. That would look to be the
> > point/place where such inconsistencies should be eliminated.
>
> I think that was a different conversation with Huang Rui related to
> the AMD GPU work, see:
>
> https://lore.kernel.org/xen-devel/ZBwtaceTNvCYksmR@Air-de-Roger/
>
> I understood the problem Marek was trying to solve was that some
> devices where initialized with the MASKALL bit set (likely by the
> firmware?) and that prevented Xen from using them.  But now seeing the
> further replies on this patch I'm unsure whether that's the case.

In my case, Xen's setting of MASKALL persists through a warm reboot,
so Xen sees it set when booting.  On a cold boot, MASKALL is not set.

Regards,
Jason

