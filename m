Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D169293FDA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 17:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9712.25573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUtpf-00033x-8Y; Tue, 20 Oct 2020 15:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9712.25573; Tue, 20 Oct 2020 15:45:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUtpf-00033b-58; Tue, 20 Oct 2020 15:45:51 +0000
Received: by outflank-mailman (input) for mailman id 9712;
 Tue, 20 Oct 2020 15:45:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eGPc=D3=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kUtpd-00033V-Pu
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:45:49 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65e69686-d3ad-4b14-a7e5-396a2c7da8a1;
 Tue, 20 Oct 2020 15:45:48 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id d24so2529122ljg.10
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 08:45:48 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eGPc=D3=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kUtpd-00033V-Pu
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:45:49 +0000
X-Inumbo-ID: 65e69686-d3ad-4b14-a7e5-396a2c7da8a1
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 65e69686-d3ad-4b14-a7e5-396a2c7da8a1;
	Tue, 20 Oct 2020 15:45:48 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id d24so2529122ljg.10
        for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8TPwytybK8AeaSJbvdM4+b3/L13Qn0l/zvc24ImBolw=;
        b=vbegK7uuKxFQyT34ZGZGDoZPnDMvGchrS0YnoWwPQEocg05ivdBqd7epkOnIw31qJh
         cnD1N9D0ZENsEs+Ywyh6ELs5B9SMEFCNBsz+9zU7IKyPNCnj6BX9G2iaIiaLs+XZbhe8
         6jTkQ+omZfrzd7c0S1UJxqkGr1AnBo/kBmzf35ehLLDAILZDyZ804CgFRsLyR6OI57/o
         ntlnM52JsHeGQmz1iqo6UVtWx+zoOdafsb0TWR6I3TQjpBrRRo9u7ULU9qLmDVQKWz2K
         SU01LkIwjJ3xS2Pddx+kiz0zKdZOGMELMaG+8GwO8BzuNNaqGo63XwnKtQtWDvoxtqeM
         vIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8TPwytybK8AeaSJbvdM4+b3/L13Qn0l/zvc24ImBolw=;
        b=MbaTXT+pVCkPGHRxaWM81asXTFj6GlOmNijnN4hVrO0T1ErkRDrYBmR1RtfwTTLM57
         5dTvxXVaapVvoSZlDUcvUnQi/b0VPG9gld4uV1tov/gCIwZjcsBxhSdOeVG1sWm6gG32
         vdR3pmBv8VxQnHIQC5nZKC80DaXCNwAfC7C51ndrB8EGEKTdA7FjeKtcAwAideT4qXxs
         OJifSI5KYgkfZSzB+eduLAHWmYZCNk5+CRC+1oOwXLa58XtCVCfVND+Y6b4+KexJ5KfQ
         blad1RH+PuWmg/DIa0paZrRfywuXA1EvP2FMTo6VcBWlP10GiGjZXXIibAZKNOREbLtl
         0ecg==
X-Gm-Message-State: AOAM5318GhGyOuzwyurcVlpPMF9ajYbp3BobKXmLfUIK+EMduTXuscjl
	Oskt40Z/wAcMU86lQUqxucEmg5jT6AUlnzEGEgo=
X-Google-Smtp-Source: ABdhPJwuakbddeRoFEE2qHUpBtIFVeUn+nbJKtYki2xNQ+ErfbwVXEuvC8E+bVDjTonFmYuzC41NeuGimtvTf5eqTjI=
X-Received: by 2002:a2e:96d2:: with SMTP id d18mr1379344ljj.407.1603208747046;
 Tue, 20 Oct 2020 08:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201019200050.103360-1-jandryuk@gmail.com> <20201020153959.GA2214@perard.uk.xensource.com>
In-Reply-To: <20201020153959.GA2214@perard.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 20 Oct 2020 11:45:33 -0400
Message-ID: <CAKf6xpsL1-7EKU3-dLnR8oki295OAEq-ZQ7hWq9uzuFN5a_F_Q@mail.gmail.com>
Subject: Re: [PATCH] libxl: Add suppress-vmdesc to QEMU -machine pc options
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2020 at 11:40 AM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Mon, Oct 19, 2020 at 04:00:50PM -0400, Jason Andryuk wrote:
> > The device model state saved by QMP xen-save-devices-state doesn't
> > include the vmdesc json.  When restoring an HVM, xen-load-devices-state
> > always triggers "Expected vmdescription section, but got 0".  This is
> > not a problem when restore comes from a file.  However, when QEMU runs
> > in a linux stubdom and comes over a console, EOF is not received.  This
> > causes a delay restoring - though it does restore.
> >
> > Setting suppress-vmdesc skips looking for the vmdesc during restore and
> > avoids the wait.
> >
> > This is a libxl change for the non-xenfv case to match the xenfv change
> > made in qemu
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> >
> > Should this also add suppress-vmdesc to xenfv for backwards
> > compatibility?  In that case, the change in QEMU is redundent.  Since
> > this only really matters for the stubdom case, it could be conditioned
> > on that.
>
> QEMU doesn't complain about having suppress-vmdesc set on the command
> line and as a default for the xenfv machine, so I don't mind adding it
> to the xenfv machine in libxl, while keeping the change in QEMU.

Okay.

> The change is already applied to QEMU, so unless there's an issue, I
> don't want to revert it. It might be useful for tool stacks that don't
> use libxl.

Good point about the alternative toolstacks.

> Also, the change matters as well for non-stubdom cases as it removed a
> cryptic error message from qemu-dm's logs :-).

:)

Yes, as I explained for the QEMU change it is the correct thing to do.
It's just kinda a shame that libxl will need a compatibility change
kept around indefinitely.

Regards,
Jason

