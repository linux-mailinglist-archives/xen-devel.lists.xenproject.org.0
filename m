Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB626ED2B9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 18:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525554.816831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqzH1-0002ER-V6; Mon, 24 Apr 2023 16:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525554.816831; Mon, 24 Apr 2023 16:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqzH1-0002CZ-Rt; Mon, 24 Apr 2023 16:42:43 +0000
Received: by outflank-mailman (input) for mailman id 525554;
 Mon, 24 Apr 2023 16:42:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zAuZ=AP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pqzGz-0002CT-Vi
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 16:42:42 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06a482e6-e2bf-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 18:42:39 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5055141a8fdso6798517a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Apr 2023 09:42:39 -0700 (PDT)
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
X-Inumbo-ID: 06a482e6-e2bf-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682354559; x=1684946559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxfJ7PXp6Ka4kQy3f5Kbc6uM9GAl3Q7uoq/tXeCesYc=;
        b=CCFlJU5L61AcW9mGIxLgclBWO9Tq9H4hfwk+n+GSTwBtaXG4VMJJO63UPFY16YAwnA
         IzDy9kCPZJUfFF+7TLKicB8K3VFNDWeH6X776nGEVelcGXMaiVnbtCgug/40VdQCeG4o
         Ts5eH5c5rC+qTy1kkQZAZfoAmFm4xw3ZJOJy7dMN8kNv8V4o97ub8sor8FJh5UB/ZrCe
         4IjV800l8twen3XqGS/ZXpk++igrOaE/y6g8c2r4iwiAg+r8PKtjsMwHlRMqSlakJ+pE
         Yugiz5udB95mhMyeyOVMkIpNp6ZpTVJuqiFqvHhSRL6zYslPlFC0DJbI00BQRAqSSmPW
         ILkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682354559; x=1684946559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxfJ7PXp6Ka4kQy3f5Kbc6uM9GAl3Q7uoq/tXeCesYc=;
        b=BeXNFvdw56cRVyGO8waghUPW0SZ+4y7gpb4+Uv635Qp29c7fT9YTOxMubM73oITKlD
         Yyo1LZiIWu/2Oizp5JMXQMyKznJ/Fc4r/yxPmIQIUWF6qbuUNH5rYlqBEYmrCiR3W3sU
         jAuyBB3WHpmS0LNuYze9j1kNS/3cHoCqwKEZ8mOTi9r58T7Mh8bIn1x6pCQVKGxPnCFm
         X3aE8p9/gKCsPiXamghaVqE64l5MnQFIjgyL7pVPqlzHo5IVRcDICwFAY4b1T23sDzFH
         +rBNzfAbFq1njLx/6ivsGS3MBAOyFq8j+tlry6FbCQp+bD2aszEpNCY7kycS7BauzaKG
         n7vQ==
X-Gm-Message-State: AAQBX9fOv8HHwCQRL4CMqqq7I9LPcNwvn61ccCv96rC0cUgDAWnjFHM/
	Tx8tzzM5OR0IuW9z0iVzB0hf6eJr7iHabLxTGFg=
X-Google-Smtp-Source: AKy350aFHfq1BQDh8mDjW8ADJ9SKpwkE+6vwXksE8DDkLzrKKKewt3J1pYje+gp2oZg93dWnvcjIq8muRVUr6GiHO+8=
X-Received: by 2002:aa7:d796:0:b0:506:b8ca:e07e with SMTP id
 s22-20020aa7d796000000b00506b8cae07emr11220329edq.11.1682354559115; Mon, 24
 Apr 2023 09:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
 <6984a8571dac35d04c85117834d99b00fe1c4184.1680752649.git-series.marmarek@invisiblethingslab.com>
 <4eb45940-5615-2398-633d-e5f59dc6987d@suse.com> <CAKf6xps2nVoYL6LtOqW2UBHadNSQzkb1XAe7WRxXmLzyN3kAGQ@mail.gmail.com>
 <50a0883c-efb8-9456-7dac-a01cca3a17cf@suse.com>
In-Reply-To: <50a0883c-efb8-9456-7dac-a01cca3a17cf@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 24 Apr 2023 12:42:26 -0400
Message-ID: <CAKf6xpuWfFojO7_CX=uZoJGwRmiPe06DDNyhu4tqFvd8D+WzLg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] x86/msi: clear initial MSI-X state on boot
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 11:30=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 24.04.2023 17:25, Jason Andryuk wrote:
> > On Mon, Apr 24, 2023 at 10:19=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >> Jason - any chance of getting a Tested-by: from you?
> >
> > I'm building v3 now.  v2  worked for clearing MASKALL on initial boot.
> >
> > I posted in these two messages - a summary is below.
> > https://lore.kernel.org/xen-devel/CAKf6xpto87QRSKT2qc1yApNfaw2SrLLxPoyt=
YJv_jEbYTAbjCg@mail.gmail.com/
> > https://lore.kernel.org/xen-devel/CAKf6xptHALLR-Qjf=3Dp5y0o9Ud2V7eFMJuB=
8Ap-PLjv-N7PAJVQ@mail.gmail.com/
> >
> > OpenXT has a patch that performs an extra reset after domain shutdown,
> > and that causes Xen to set MASKALL.  I confirmed by removing it.  So
> > this patch helps with clearing MASKALL on host boot, but with the
> > OpenXT patch, rebooting a domain fails.  MASKALL gets set on VM
> > shutdown and then the subsequent boot can't assign the device.
> >
> > So this patch is helpful in some scenarios, but it was also an issue
> > caused by the OpenXT patch.  Does that make it unsuitable for
> > inclusion?
>
> What is "it" here? If I get your reply right, there is a similar issue
> left unaddressed by this version of the change (and as was said before,
> a device reset changing state that Xen tracks or otherwise cares about
> needs to be reported to Xen). Yet that doesn't really fit with the
> question, at least the way I read it ...

"So this patch is helpful in some scenarios, but setting MASKALL in
the first place is an issue caused by the OpenXT patch.  Does that
make this patch unsuitable for inclusion?"

I think Marek's response that "Xen IMO should deal with the state it
gets on boot, regardless of what was running previously" makes sense
and means this is worthy of inclusion.

And I tested it.  Without the OpenXT libxl-fix-flr.patch:
(XEN) 0000:00:14.3: unexpected initial MSI-X state (MASKALL=3D0, ENABLE=3D1=
), fixing
With the OpenXT patch:
(XEN) 0000:00:14.3: unexpected initial MSI-X state (MASKALL=3D1, ENABLE=3D1=
), fixing

Tested-by: Jason Andryuk <jandryuk@gmail.com>

The patch is here if anyone want to look:
https://github.com/OpenXT/xenclient-oe/blob/master/recipes-extended/xen/fil=
es/libxl-fix-flr.patch

It's calling libxl__device_pci_reset() from destroy_finish_check(), so
it's not trying to do anything behind Xen's back.  It's just that Xen
sees memory decoding disabled, and then sets MASKALL.

Regards,
Jason

