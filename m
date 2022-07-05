Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22CC56762C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 20:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361499.591057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8mws-0000Za-Bp; Tue, 05 Jul 2022 18:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361499.591057; Tue, 05 Jul 2022 18:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8mws-0000Xo-8m; Tue, 05 Jul 2022 18:06:58 +0000
Received: by outflank-mailman (input) for mailman id 361499;
 Tue, 05 Jul 2022 18:06:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHCC=XK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1o8mwr-0000Xi-1t
 for xen-devel@lists.xen.org; Tue, 05 Jul 2022 18:06:57 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40aa4b69-fc8d-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 20:06:54 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id z13so21838994lfj.13
 for <xen-devel@lists.xen.org>; Tue, 05 Jul 2022 11:06:54 -0700 (PDT)
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
X-Inumbo-ID: 40aa4b69-fc8d-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xm9cRnemvM2twGxx12IaU3wNC0/7wuDcrWZFyp+aCCw=;
        b=P7Wl3YdFag8Abxx4LfcrDjXIKPqHVyRZxnhKH15469ihaLBzSkN3d1h1EZZPlyAW1m
         mrxjd5VpwggHVKaPdBZIo2Lrq6XjTq/sSFiinApZXyteG5a8mT8PyFZwY9hXdb1ArlzN
         lCOj0v/lRWGqZCKR4F+Fj/WoypNAbSOPmWk98ToWLQtUtRnPsSXFVC8+BfKLeYtlXH9P
         w8f/tQ/nbrDIXjTkIe8ts6APK3Zi1zWpl+opmimxdWeAS8jDuFkgjMWMmTmX/jJo3gIQ
         HSVXnYilMyt1/9fzwkqLRaT5c6CCPMj42aItlgkhRPVt/Z/c3S+JxNxoaPECkak+qJst
         qUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xm9cRnemvM2twGxx12IaU3wNC0/7wuDcrWZFyp+aCCw=;
        b=lWoIEn6QPr2iHgNI+MeK/Fop1rqkCVm30BOZ4KmcOKDXHnIx48/ZzdKDiuhYzkirOi
         0ysdO79bXxW3Kn4r8M1tVLBNY7FrQy3SpmMrR+qF+0pNMaqpaIMeYkal8wckZvmPL4SA
         rnckiGgJWjWWwQCbZwgNVQbcqCW8VjWYOZD3nOgpeoCyy48oUZvxoPB2/0uGQGQjxM5Q
         RD3IYGXkFnPI8LhhFFdjBXHJEV+KMjW5PpQAgilaQrEKFrvMkcAkwgNrFJsQKp+j6eMt
         a8uOFKor+eCFCKWTb5htsw5cTkZIqlSg19J3byr8x0YXpi1KTRJfmDdui6RbN/FzBAjk
         jy6Q==
X-Gm-Message-State: AJIora8JblWiMHpqPltRl/r/cH6nsC8KJUwXDViS5z5at2rlBVZSI2Ig
	n+pnp9+9OSL1p1rXSgNo4XqQiRTezY/6Vjs98oKz8DKe8vQ=
X-Google-Smtp-Source: AGRyM1uSn/QH7bfzo5fp8z3n9qjaAvtm9f77xE8UGvbjK4eoo9jdTpV0RPWb6owf4zAnuoiQDx7luEfsq0K4sqS889k=
X-Received: by 2002:a05:6512:11d2:b0:47f:7ca3:c533 with SMTP id
 h18-20020a05651211d200b0047f7ca3c533mr22885472lfr.388.1657044414289; Tue, 05
 Jul 2022 11:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local> <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local> <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <YsMIO3E5/hzFgxSa@MacBook-Air-de-Roger.local> <CAKhsbWY2OwkGQQ-dqjOOr3Ed7dThdiFpAWbdUOnzbnOkYVqF4A@mail.gmail.com>
 <YsMN1dA8RL62vm33@MacBook-Air-de-Roger.local>
In-Reply-To: <YsMN1dA8RL62vm33@MacBook-Air-de-Roger.local>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 5 Jul 2022 14:06:42 -0400
Message-ID: <CAKf6xpuehkkUmr88Q358mHgmEc6YEtXrVjJbeNtDBx2prDfvug@mail.gmail.com>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "G.R." <firemeteor@users.sourceforge.net>, xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 4, 2022 at 11:57 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Mon, Jul 04, 2022 at 11:44:14PM +0800, G.R. wrote:
> > On Mon, Jul 4, 2022 at 11:33 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> > >
> > > Right, so hvmloader attempts to place a BAR from 05:00.0 and a BAR
> > > from 00:17.0 into the same page, which is not that good behavior.  It
> > > might be sensible to attempt to share the page if both BARs belong to
> > > the same device, but not if they belong to different devices.
> > >
> > > I think the following patch:
> > >
> > > https://lore.kernel.org/xen-devel/20200117110811.43321-1-roger.pau@ci=
trix.com/
> > >
> > > Might help with this.
> > >
> > > Thanks, Roger.
> > I suppose this patch has been released in a newer XEN version that I
> > can pick up if I decide to upgrade?
> > Which version would it be?
> >
> > On the other hand, according to the other experiment I did, this may
> > not be the only issue related to this device.
> > Still not sure if the device or the SW stack is faulty this time...
>
> I don't think this patch has been applied to any release, adding Jason
> who I think was also interested in the fix and might provide more
> info.

Roger wrote the above patch after I tried to upstream a Qubes QEMU
patch https://lore.kernel.org/xen-devel/20190311180216.18811-7-jandryuk@gma=
il.com/.
The patch rounded up BAR sizes for passed through devices which
ensured they couldn't share a page.  But Roger rightfully pointed out
that changing the BAR size is incorrect, and hvmloader could just
enforce a minimum alignment.  However, nothing prevents a guest from
relocating the BARs again.

I tested Roger's patch, but Qubes and OpenXT have kept using the QEMU
patch.  When I added the QEMU patch to OpenXT, I wrote in the commit
message that it fixed probing an e1000e nic


Regards,
Jason

