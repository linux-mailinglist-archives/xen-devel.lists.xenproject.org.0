Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B14829090B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 18:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8169.21742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTSB8-0005q1-Eu; Fri, 16 Oct 2020 16:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8169.21742; Fri, 16 Oct 2020 16:02:02 +0000
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
	id 1kTSB8-0005pc-Bj; Fri, 16 Oct 2020 16:02:02 +0000
Received: by outflank-mailman (input) for mailman id 8169;
 Fri, 16 Oct 2020 16:02:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eysm=DX=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kTSB6-0005pX-OC
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:02:00 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aefc59d2-601b-4f5c-88ba-a066e09496af;
 Fri, 16 Oct 2020 16:01:59 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y16so3064386ljk.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 09:01:59 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eysm=DX=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kTSB6-0005pX-OC
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:02:00 +0000
X-Inumbo-ID: aefc59d2-601b-4f5c-88ba-a066e09496af
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id aefc59d2-601b-4f5c-88ba-a066e09496af;
	Fri, 16 Oct 2020 16:01:59 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y16so3064386ljk.1
        for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 09:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cIjxEXi6/1Ci8HAZ985Gw92uP+12htILEakXToNiOhE=;
        b=E5+mJAlEFFRHn0PU1cWH2W8SIGpD5Eb5gb18yAkdIvqMPEAhLMThWiSU9xHFkUgYlr
         1juAUTeSJmWgjQpz7CmH9HA/cpDbEj4cyAKqFbPBkjJzzqHrp3M15Q0PlKdTPHtAAZ8x
         qPN4Tlhumd8wik+mOGPkpddWbra3MnoF4th1OmpWgBsqfAKhi3yYF/OtVbnC+JveaPBj
         M8oUE1DiOiZpIRjAX+zPeLqu6nJ/nkj5sCWFsTVVD1/2S+cOhh2uD0t/QaxwHGsB3Iu5
         Ge7qNMjZtGMaGtXRbBlfJo7G47jMSGyJ/qTxoo8iv+VB3wF1WUk6tf/QgL2LwSDkpwUK
         wIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cIjxEXi6/1Ci8HAZ985Gw92uP+12htILEakXToNiOhE=;
        b=iCVyX4AW9Yzo7bY2YoLlohlQHLmUltPAp9y3MKJLF2W/XtY26mzjQcy4p3DK/0HDkX
         kaIZi6mwnNmET/mW0BB7ih1CEixcsiAW/2A5TeaDMdkephHLb0mIk/hrquNcnjV4eg4Q
         jgrIgkwuogNzs981eyBw2B/8eao3zWjtVpQ6SiwtpmvP4KblDv/ymDXSH1oBKHXBh/iS
         dJpIT1qgz7C6mmZDBKhaHT/oTQGa9gvBRcVXQaVVuw05wTrdyEXTBYAqkprayu9EXgXe
         o1B5NL/nffBXijSVwFTVViTlGo/Yf3uqaXqLZ3p6q+A45/s2Nxb38x5G3wAt9icWYhJu
         oCfQ==
X-Gm-Message-State: AOAM532K0cL1dwSnUdO99sXUZOfH1G66VwZxBrqvoYCeNlwnELQrJVf8
	SEl19eVJSGHEwPKYErvfXnfg0HPSz+unA+zyIl4=
X-Google-Smtp-Source: ABdhPJzIMzwsUUc/O+9gITsdj67uq8SXf6e4S58oij+r74HezAGqEHNkHgyPbrj7SW5anw+QvlgpBGfQnlwH/m0ONoM=
X-Received: by 2002:a2e:96d2:: with SMTP id d18mr1777036ljj.407.1602864118597;
 Fri, 16 Oct 2020 09:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201013190506.3325-1-jandryuk@gmail.com> <20201016153708.GB3105841@perard.uk.xensource.com>
In-Reply-To: <20201016153708.GB3105841@perard.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 16 Oct 2020 12:01:47 -0400
Message-ID: <CAKf6xpssB-FGwiEhLqV8OFjBGuP4LKYh+9Pj_Bj7p5U2CJSw=g@mail.gmail.com>
Subject: Re: [PATCH] hw/xen: Set suppress-vmdesc for Xen machines
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: QEMU <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 16, 2020 at 11:38 AM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Tue, Oct 13, 2020 at 03:05:06PM -0400, Jason Andryuk wrote:
> > xen-save-devices-state doesn't currently generate a vmdesc, so restore
> > always triggers "Expected vmdescription section, but got 0".  This is
> > not a problem when restore comes from a file.  However, when QEMU runs
> > in a linux stubdom and comes over a console, EOF is not received.  This
> > causes a delay restoring - though it does restore.
> >
> > Setting suppress-vmdesc skips looking for the vmdesc during restore and
> > avoids the wait.
>
> suppress-vmdesc is only used during restore, right? So starting a guest
> without it, saving the guest and restoring the guest with
> suppress-vmdesc=on added will work as intended? (I'm checking that migration
> across update of QEMU will work.)

vmdesc is a json description of the migration stream that comes after
the QEMU migration stream.  For our purposes, <migration
stream><vmdesc json blob>.  Normal QEMU savevm will generate it,
unless suppress-vmdesc is set.  QEMU restore will read it because:
"Try to read in the VMDESC section as well, so that dumping tools that
intercept our migration stream have the chance to see it."

Xen save does not go through savevm, but instead
xen-save-devices-state, which is a subset of the QEMU savevm.  It
skips RAM since that is read out through Xen interfaces.  Xen uses
xen-load-devices-state to restore device state.  That goes through the
common qemu_loadvm_state which tries to read the vmdesc stream.

For Xen, yes, suppress-vmdesc only matters for the restore case, and
it suppresses the attempt to read the vmdesc.  I think every Xen
restore currently has "Expected vmdescription section, but got -1" in
the -dm.log since the vmdesc is missing.  I have not tested restoring
across this change, but since it just controls reading and discarding
the vmdesc stream, I don't think it will break migration across
update.

Regards,
Jason

