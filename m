Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416422A43B5
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 12:07:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18268.43250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZu96-0006a9-HN; Tue, 03 Nov 2020 11:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18268.43250; Tue, 03 Nov 2020 11:06:36 +0000
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
	id 1kZu96-0006Zk-Dm; Tue, 03 Nov 2020 11:06:36 +0000
Received: by outflank-mailman (input) for mailman id 18268;
 Tue, 03 Nov 2020 11:06:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgX3=EJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kZu95-0006Zf-2k
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 11:06:35 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00046dc7-a81e-4813-9b21-eaffd9bd9dc1;
 Tue, 03 Nov 2020 11:06:33 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wgX3=EJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kZu95-0006Zf-2k
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 11:06:35 +0000
X-Inumbo-ID: 00046dc7-a81e-4813-9b21-eaffd9bd9dc1
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 00046dc7-a81e-4813-9b21-eaffd9bd9dc1;
	Tue, 03 Nov 2020 11:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604401593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FZPXhwelPhnrf+4ehSPMNoGpYrwJNkm/DXpvYHfd2qw=;
  b=Lx5WgpJEhfDe3gIUNrJHkbcL2U4NBGRDU9cQqoTpYAqPl1RZmdHN4Fvj
   6PtJpuAvEXmPzQYUA6GI/JrsuZ0fTPv/Due8rKkjkgPnAlRgy6T6oDyYl
   UQGu3xNAJz7hbmsVF4pPolPq036V7oc0bqP/sAH5ekF7dylnfVdlvZJyY
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wcxy9Q6E0IN2rhwcNQ2fL8Wpaz2P7mTkdsOeh8ZFwAxxT14BZTN4m3PMeIDjywMYXeFN2RN8/T
 0F7u/Duk0fEgagtyudNVfaGmQdzaWt2aWTa9LVtqVClqyGUDjJSWyFEBUZvq5TGSQGENGYgN6a
 +uj2T/bwTBMlF9epg+VFaDbPGwPsqmHurc6uDB6gT0c8KQrWg5S0vekT5lKYOhTyIt7jhbCijz
 1KI7REgaG1Nh2T3WlncHrA3ahyXcTK+j41ytr4ox/NaZKaf73y9PcpQvvRfb2Y2Mn3hk+3BVDB
 TBs=
X-SBRS: None
X-MesageID: 30333882
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,447,1596513600"; 
   d="scan'208";a="30333882"
Date: Tue, 3 Nov 2020 11:06:29 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Wei Liu <wl@xen.org>
CC: Jason Andryuk <jandryuk@gmail.com>, <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>
Subject: Re: [PATCH v2] libxl: Add suppress-vmdesc to QEMU machine
Message-ID: <20201103110629.GH2214@perard.uk.xensource.com>
References: <20201029190332.31161-1-jandryuk@gmail.com>
 <20201103104844.t73k4rukp7jezk7d@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201103104844.t73k4rukp7jezk7d@liuwe-devbox-debian-v2>

On Tue, Nov 03, 2020 at 10:48:44AM +0000, Wei Liu wrote:
> On Thu, Oct 29, 2020 at 03:03:32PM -0400, Jason Andryuk wrote:
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
> > QEMU 5.2 enables suppress-vmdesc by default for xenfv, but this change
> > sets it manually for xenfv and xen_platform_pci=0 when -machine pc is
> > use.
> > 
> > QEMU commit 9850c6047b8b "migration: Allow to suppress vmdesc
> > submission" added suppress-vmdesc in QEMU 2.3.
> > 
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

:-(, sorry, I never received that email.

> > ---
> > QEMU 2.3 came out in 2015, so setting suppress-vmdesc unilaterally
> > should be okay...  Is this okay?


> Anthony, what is your opinion on this?

That it's fine, and I actually asked for the libxl patch. For reference,
QEMU 2.3 is in qemu-xen-4.7.

So,
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

