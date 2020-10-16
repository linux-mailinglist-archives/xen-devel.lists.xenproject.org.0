Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98C42909E3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 18:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8196.21844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTSqK-0001s2-HA; Fri, 16 Oct 2020 16:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8196.21844; Fri, 16 Oct 2020 16:44:36 +0000
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
	id 1kTSqK-0001rd-E4; Fri, 16 Oct 2020 16:44:36 +0000
Received: by outflank-mailman (input) for mailman id 8196;
 Fri, 16 Oct 2020 16:44:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Q1u=DX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kTSqI-0001rY-T1
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:44:34 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95cc54da-0b1f-4c1d-ac4d-d416ebacf78e;
 Fri, 16 Oct 2020 16:44:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0Q1u=DX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kTSqI-0001rY-T1
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:44:34 +0000
X-Inumbo-ID: 95cc54da-0b1f-4c1d-ac4d-d416ebacf78e
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 95cc54da-0b1f-4c1d-ac4d-d416ebacf78e;
	Fri, 16 Oct 2020 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602866674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u08QdlcJJBMJaElC7SvikJOEk5yIS2EAg8zpnJLFXd4=;
  b=Pa5LffuZ6Y9WogFvP7swaJFHnqtQY1x3RfGfGwIeiRO6CkVG8sKsIiQQ
   8WDPeks8xBPCcOgMTXORyqXBcwneQNh+EiIU9xhuJDVeeHcGnKxzzbKdO
   RQKlS4/ODkMEDLk0Bx/XvfdtQoqbnAxnmYbydxfNmPai5K/puMeCCxqJr
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WgHsbEoe6SMytCQFC/Bb7MyLDZKoBfgiml7Myu5P3GO8+SSZCVv9f94vxxL//Uz0ahMvORq8ej
 Xbw4/AibDK5n9lB1lJSvb8c7uXs5624j+XV0ygdCMQEXg4cn84fzeJGIyQGz9FsCKORxxOGAeP
 RgWH6EZk7i7rysmc5JhwdkX3v4V+D5aaWt5XFG8fz836GGlZ8J2lnY8u4BAbElY1Zk1rCRZN8K
 cuoyuL4oaOifOkpc+m274eyZldmn/N1vhlPEb8dcAap055OFe3EjwII5QWRXQTf6ajsDDUxh+f
 saQ=
X-SBRS: 2.5
X-MesageID: 29522942
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,383,1596513600"; 
   d="scan'208";a="29522942"
Date: Fri, 16 Oct 2020 17:44:28 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: QEMU <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert"
	<dgilbert@redhat.com>, xen-devel <xen-devel@lists.xenproject.org>, "Paul
 Durrant" <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Marek
 =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] hw/xen: Set suppress-vmdesc for Xen machines
Message-ID: <20201016164428.GC3105841@perard.uk.xensource.com>
References: <20201013190506.3325-1-jandryuk@gmail.com>
 <20201016153708.GB3105841@perard.uk.xensource.com>
 <CAKf6xpssB-FGwiEhLqV8OFjBGuP4LKYh+9Pj_Bj7p5U2CJSw=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKf6xpssB-FGwiEhLqV8OFjBGuP4LKYh+9Pj_Bj7p5U2CJSw=g@mail.gmail.com>

On Fri, Oct 16, 2020 at 12:01:47PM -0400, Jason Andryuk wrote:
> On Fri, Oct 16, 2020 at 11:38 AM Anthony PERARD
> <anthony.perard@citrix.com> wrote:
> >
> > On Tue, Oct 13, 2020 at 03:05:06PM -0400, Jason Andryuk wrote:
> > > xen-save-devices-state doesn't currently generate a vmdesc, so restore
> > > always triggers "Expected vmdescription section, but got 0".  This is
> > > not a problem when restore comes from a file.  However, when QEMU runs
> > > in a linux stubdom and comes over a console, EOF is not received.  This
> > > causes a delay restoring - though it does restore.
> > >
> > > Setting suppress-vmdesc skips looking for the vmdesc during restore and
> > > avoids the wait.
> >
> > suppress-vmdesc is only used during restore, right? So starting a guest
> > without it, saving the guest and restoring the guest with
> > suppress-vmdesc=on added will work as intended? (I'm checking that migration
> > across update of QEMU will work.)
> 
> vmdesc is a json description of the migration stream that comes after
> the QEMU migration stream.  For our purposes, <migration
> stream><vmdesc json blob>.  Normal QEMU savevm will generate it,
> unless suppress-vmdesc is set.  QEMU restore will read it because:
> "Try to read in the VMDESC section as well, so that dumping tools that
> intercept our migration stream have the chance to see it."
> 
> Xen save does not go through savevm, but instead
> xen-save-devices-state, which is a subset of the QEMU savevm.  It
> skips RAM since that is read out through Xen interfaces.  Xen uses
> xen-load-devices-state to restore device state.  That goes through the
> common qemu_loadvm_state which tries to read the vmdesc stream.
> 
> For Xen, yes, suppress-vmdesc only matters for the restore case, and
> it suppresses the attempt to read the vmdesc.  I think every Xen
> restore currently has "Expected vmdescription section, but got -1" in
> the -dm.log since the vmdesc is missing.  I have not tested restoring
> across this change, but since it just controls reading and discarding
> the vmdesc stream, I don't think it will break migration across
> update.

Thanks for the explanation.

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Do you think you could send a patch for libxl as well? Since libxl in
some cases may use the "pc machine instead of "xenfv". I can send the
patch otherwise.

Cheers,

-- 
Anthony PERARD

