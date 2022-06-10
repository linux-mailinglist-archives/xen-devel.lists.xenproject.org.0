Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193F05467F5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 16:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346471.572270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzfCN-0000ZB-RK; Fri, 10 Jun 2022 14:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346471.572270; Fri, 10 Jun 2022 14:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzfCN-0000WO-O0; Fri, 10 Jun 2022 14:01:15 +0000
Received: by outflank-mailman (input) for mailman id 346471;
 Fri, 10 Jun 2022 14:01:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaZi=WR=citrix.com=prvs=15310cb4b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nzfCM-0000WI-5K
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 14:01:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8733a92-e8c5-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 16:01:12 +0200 (CEST)
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
X-Inumbo-ID: c8733a92-e8c5-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654869672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3c6CS2ZBnzD1lIFKytgX/aAl7KGBQiyYw4coSz1P0mQ=;
  b=gXZB/XYyp/+0j3W35VdDy4sRLQy2xmpE7tftNVALEXrtZP8gcfmrBFIH
   v+hvZpa5fP+u5wcfT51VbBfGlO+DQ9c1bB1Yp8b57cQourndlslPwCGGD
   ouht/BsGze4ILxdT0+yHswFbrdP0W9Bw8/qbzBieaP06VLDlKgUXfJqAb
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73168632
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:efWMv6BOAnJjYBVW/3/jw5YqxClBgxIJ4kV8jS/XYbTApD920WcBn
 GtOXT+PPvuNa2P2L9AgPdi18k4Bv5bcyNJiQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Bg2tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhyl
 I9ti9uzET0gYKOQo/kgcyQBVCJxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp8VRKiOO
 ZFDAdZpRAvbbyxDKltGNLsZzPr5qienaXpSmXvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWexmEWSw0bU3O+/OH/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYfB4BwLao5sDuElKSI2BukJlVdCT1OPYlOWNANedA66
 rOYt4q3WGA/6uDOFSz1GqS89m3rZ3VMRYMWTWpdFFZevYG+yG0mpkiXJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk0djj8hu+BTNT5D7FEEHCChRq6EK6XT0Oao
 F8PkNWE4eYFAPmlzXLQHLpcTe/2va3fblUwZGKD+LFwnwlBBlb5JdwAiN2ADBwB3jk4lc/BP
 xaI5FI5CG57N3q2d65nC7+M5zAR5fG4T7zND6mMBvIXO8QZXFLWp0lGOB/Pt10BZWBxyMnTz
 7/AKZbyZZvbYIw6pAeLqxA1i+Z2nn5vnD2KH/gWDX2PiNKjWZJccp9dWHPmUwzzxP7sTNn9m
 zqHC/a39g==
IronPort-HdrOrdr: A9a23:l/c1qqgAaopj5joIAMn/r3kQ6XBQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.91,290,1647316800"; 
   d="scan'208";a="73168632"
Date: Fri, 10 Jun 2022 15:00:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/3] tools/xl: Allow specifying JSON for domain
 configuration file format
Message-ID: <YqNOmkeap+zzg3C5@perard.uk.xensource.com>
References: <cover.1651285313.git.ehem+xen@m5p.com>
 <9aa6160b2664a52ff778fad67c366d67d3a0f8ab.1651285313.git.ehem+xen@m5p.com>
 <Yoeh3nMNW0AfcHr/@perard.uk.xensource.com>
 <Ypa/+X7FQT2WaX12@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Ypa/+X7FQT2WaX12@mattapan.m5p.com>

On Tue, May 31, 2022 at 06:25:13PM -0700, Elliott Mitchell wrote:
> On Fri, May 20, 2022 at 03:12:46PM +0100, Anthony PERARD wrote:
> > On Tue, Apr 19, 2022 at 06:23:41PM -0700, Elliott Mitchell wrote:
> > > JSON is currently used when saving domains to mass storage.  Being able
> > > to use JSON as the normal input to `xl create` has potential to be
> > > valuable.  Add the functionality.
> > > 
> > > Move the memset() earlier so to allow use of the structure sooner.
> > > 
> > > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> > 
> > So, I gave this a try and creating a guest from a json config, and that
> > fails very early with "Unknown guest type".
> > 
> > Have you actually tried to create a guest from config file written in
> > json?
> > 
> > Also, this would need documentation about the new option, about the
> > format. The man page need to be edited.
> > 
> > An example of a config file written in json would be nice as well.
> 
> I'll be trying for these at some point, but no timeframe yet.  This was
> an idea which occurred to me when looking at things.  I'm wavering on
> whether this is the way to go...
> 
> Real goal is I would like to generate a replacement for the `xendomains`
> init script.  While functional the script is woefully inadaquate for
> anything other than the tiniest installation.
> 
> Notably there can be ordering constraints for start/shutdown (worse,
> those could be distinct).  One might also wish different strategies for
> different domains (some get saved to disk on reboot, some might get
> shutdown/restarted).

Is this that something like `libvirt` or some other toolstacks could help
with? Or maybe you are looking for something that as a small footprint
on the system and just run once at boot and at shutdown.

> For some of the configuration for this, adding to domain.cfg files makes
> sense.  This though ends up with the issue of what should the extra data
> look like?

Maybe `xl` could be taught to ignore some options that have a prefix
like "xendomain_", even if at the moment it ignore everything it doesn't
know I think.

> I'm oscillating between adding a section in something libxl's parser
> takes as a comment, versus adding a configuration option to domain.cfg

A comment section could work too I guess, like there's one for `sysv`
init system which describe dependency as comments.

> (libxl's parser ignores unknown sections which is not entirely good!).
> JSON's structure would be good for an addition, but JSON comes with its
> own downsides.
> 
> Most likely such a thing would be implemented in Python.  Needs a bit
> more math than shell is good for.

If you plan to convert the `xendomains` init script to python, I don't
think that would be a good idea, as it is probably better to not add a
dependency for a init script that has been a shell script for a while.
But introducing a new utility in python or other language might be fine.

Cheers,

-- 
Anthony PERARD

