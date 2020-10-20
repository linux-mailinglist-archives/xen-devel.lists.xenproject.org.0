Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07158293FBF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 17:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9705.25550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUtk7-0002e9-CO; Tue, 20 Oct 2020 15:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9705.25550; Tue, 20 Oct 2020 15:40:07 +0000
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
	id 1kUtk7-0002dk-8x; Tue, 20 Oct 2020 15:40:07 +0000
Received: by outflank-mailman (input) for mailman id 9705;
 Tue, 20 Oct 2020 15:40:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8HF=D3=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kUtk5-0002VV-S7
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:40:05 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0852ae2-13c7-4a31-9846-626071fd9619;
 Tue, 20 Oct 2020 15:40:04 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=V8HF=D3=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kUtk5-0002VV-S7
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:40:05 +0000
X-Inumbo-ID: e0852ae2-13c7-4a31-9846-626071fd9619
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e0852ae2-13c7-4a31-9846-626071fd9619;
	Tue, 20 Oct 2020 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603208404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ISmU+JH6ZgpC176exqVC/z/+DWR4Rlaalo9uKhU8Bw=;
  b=ERYbeiK4/fEXAZffRCOO/2HtsL4AlhMJR8nQ1gjKKO+H7wOgTJcN/Z4f
   UxjYraCHppCEKTo+tm20HmOQNAqPKQNcaqcqchtfr58n+ktyLPKmrxqDM
   NHrkYr2PcTDn1HvhZ9F50HVtOBks8LzFtnzw+GDwdI4/fPl9RiPLsobdj
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ty+Xv5mccCX3qSWAgpu110vkMzwbup7wE1qWzSeXT+vIKnmmzjwpV3C1Pa30GbCulyCoJoRiT3
 CGTVI/Vh5uriWlUeGGp0GM/lw9HV/57Tf6obCdTiF10mKWMgQSSi0iaOFtJ4W7CZAq8owe9Wp5
 oMPkllspQrg4C/P4zqnfe9jU3Cuea1t0kRpZ/NHO6BTnqSnojfPe8fMkLkVf0Bn3laC6jxbQkA
 dyfrJHE4ZvBFkEta8WkCyZ8Xb4Z4DMxw8bte4quRNtZOKphHUCYEfFFUQGnOHKx+Dpoxc5/zGX
 tUM=
X-SBRS: None
X-MesageID: 29641228
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,397,1596513600"; 
   d="scan'208";a="29641228"
Date: Tue, 20 Oct 2020 16:39:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [PATCH] libxl: Add suppress-vmdesc to QEMU -machine pc options
Message-ID: <20201020153959.GA2214@perard.uk.xensource.com>
References: <20201019200050.103360-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201019200050.103360-1-jandryuk@gmail.com>

On Mon, Oct 19, 2020 at 04:00:50PM -0400, Jason Andryuk wrote:
> The device model state saved by QMP xen-save-devices-state doesn't
> include the vmdesc json.  When restoring an HVM, xen-load-devices-state
> always triggers "Expected vmdescription section, but got 0".  This is
> not a problem when restore comes from a file.  However, when QEMU runs
> in a linux stubdom and comes over a console, EOF is not received.  This
> causes a delay restoring - though it does restore.
> 
> Setting suppress-vmdesc skips looking for the vmdesc during restore and
> avoids the wait.
> 
> This is a libxl change for the non-xenfv case to match the xenfv change
> made in qemu
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> 
> Should this also add suppress-vmdesc to xenfv for backwards
> compatibility?  In that case, the change in QEMU is redundent.  Since
> this only really matters for the stubdom case, it could be conditioned
> on that.

QEMU doesn't complain about having suppress-vmdesc set on the command
line and as a default for the xenfv machine, so I don't mind adding it
to the xenfv machine in libxl, while keeping the change in QEMU.

The change is already applied to QEMU, so unless there's an issue, I
don't want to revert it. It might be useful for tool stacks that don't
use libxl.

Also, the change matters as well for non-stubdom cases as it removed a
cryptic error message from qemu-dm's logs :-).

Thanks,

-- 
Anthony PERARD

