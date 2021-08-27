Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 674A63F9917
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 14:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173636.316785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJb8x-0001sL-Jg; Fri, 27 Aug 2021 12:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173636.316785; Fri, 27 Aug 2021 12:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJb8x-0001qC-Gh; Fri, 27 Aug 2021 12:39:35 +0000
Received: by outflank-mailman (input) for mailman id 173636;
 Fri, 27 Aug 2021 12:39:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OW94=NS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mJb8w-0001q2-2L
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 12:39:34 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d09bd03-ba72-49c4-b3c4-56676f9c5e35;
 Fri, 27 Aug 2021 12:39:33 +0000 (UTC)
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
X-Inumbo-ID: 5d09bd03-ba72-49c4-b3c4-56676f9c5e35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630067972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JKZQsjN7ju7Me1IUvRh5OReB4tNtVugl2ImK3Tp92k0=;
  b=iPXwO20VS+NzVyZFETDs9MYvNPSenIuAvos4yTfplqcg9H/J5QI3qCqp
   2NRcNCEie4phvDFGygf0VpTf+H/wzJgtTc2mp0VwQGuLsZVXbtDp9/SNU
   I2veqY0OwTWZcsSByGGH+A98PNdFOF9DfWAuFb5grCmcAdofIB+pK1evF
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cSuv7s1/V6AL/lsoTeijC4tfUux0hD0BlrHsDyfkDHS84dq3wFekXgy0ZvreG6RDj3Fci+/Wj7
 Pjd30cu9WF0J1kxbGRBcu2DInPqLQzEHKesEq3E+NMO8IFWK/6HGek1tLvCOfaeQdw91HWH7Ff
 gv3gF/C+wnAXfGfHmffRw749G5ranm8hTa1kMAD8UvEIHCn1O5/teIN5HzIfShUQt/GolVn3o2
 ExjJtZStRg5PQ+S5e7V8Y3YFH7bsRy+ZOrjmpXJWngM9ic83E0Ww81Kfx21DM8fc4fRLST0EAx
 qV1pJI3v0ouXVWhPbMdeGtxJ
X-SBRS: 5.1
X-MesageID: 51071069
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:OyGKc64WUb+NEtzTAwPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.84,356,1620705600"; 
   d="scan'208";a="51071069"
Date: Fri, 27 Aug 2021 13:39:28 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Olaf Hering <olaf@aepfle.de>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
Subject: Re: QEMU 6.0+ in 4.15 and 4.14 (Re: preparations for 4.15.1 and
 4.13.4)
Message-ID: <YSjdAC98JqOXj5pn@perard>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
 <YO/5lPNSjjY0NQZx@perard>
 <24862.34174.101215.640300@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <24862.34174.101215.640300@mariner.uk.xensource.com>

On Thu, Aug 19, 2021 at 05:23:26PM +0100, Ian Jackson wrote:
> Anthony PERARD writes ("Re: preparations for 4.15.1 and 4.13.4"):
> > Can we backport support of QEMU 6.0 to Xen 4.15? I'm pretty sure
> > distributions are going to want to use the latest QEMU and latest Xen,
> > without needed to build two different QEMU binaries.
> 
> I think this is appropriate.  Xen 4.15 is still now, and there was an
> unfortunate interaction between release dates.  Your argument makes
> sense.
> 
> > [XEN PATCH v2 0/8] Fix libxl with QEMU 6.0 + remove some more deprecated usages.
> > <20210511092810.13759-1-anthony.perard@citrix.com>
> > Commits: d5f54009db^..fe6630ddc4
> > 
> > Some more QEMU 6.0 fixes
> > <20210628100157.5010-1-anthony.perard@citrix.com>
> > Commits: 217eef30f7  3bc3be978f
> 
> So I have queued all these.
> 
> > Also, Olaf want them to be backported to 4.14, see
> >     <20210629095952.7b0b94c1.olaf@aepfle.de>
> 
> I'm unsure about this.  The diff seems moderately large.  Also, are we
> sure that it wouldn't break anything other than very old qemu ?  OTOH
> compat problems with newer qemu are indeed a problem especially for
> distros.

I've check all commits, beside two commits they all have a fallback
mechanism so we still are compatible with old qemus.
There is these two commits
    libxl: Fix QEMU cmdline for scsi device
    libxl: Use -device for cd-rom drives
which replace command line arguments, but it is to use something that
has been available since QEMU 0.15, so before the first version that
libxl as evert supported.

So overall, I don't think we break compatibility with very old qemus. It
would take a couple more QMP command to run some feature as libxl would
try the new command first before falling back to previous ones.

> I'm currently leaning towards "no" but I am very open to being
> convinced this is a good idea.

I don't know if it is a good idea, but at least it doesn't seems to be a
bad one.

-- 
Anthony PERARD

