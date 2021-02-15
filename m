Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A062131B469
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 04:29:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85038.159381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBUYO-0003HS-KC; Mon, 15 Feb 2021 03:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85038.159381; Mon, 15 Feb 2021 03:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBUYO-0003HA-Dm; Mon, 15 Feb 2021 03:28:04 +0000
Received: by outflank-mailman (input) for mailman id 85038;
 Mon, 15 Feb 2021 03:28:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VQg6=HR=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lBUYM-0003H5-PJ
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 03:28:02 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2c302b4-af6d-40b3-a4bd-ea374c696290;
 Mon, 15 Feb 2021 03:28:01 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 11F3Rll6003347
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 14 Feb 2021 22:27:53 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 11F3RkkO003346;
 Sun, 14 Feb 2021 19:27:46 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: f2c302b4-af6d-40b3-a4bd-ea374c696290
Date: Sun, 14 Feb 2021 19:27:46 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Maximilian Engelhardt <maxi@daemonizer.de>
Cc: xen-devel@lists.xenproject.org, pkg-xen-devel@lists.alioth.debian.org
Subject: Re: [BUG] Linux pvh vm not getting destroyed on shutdown
Message-ID: <YCnqMh+YB2ZDsMUl@mattapan.m5p.com>
References: <2195346.r5JaYcbZso@localhost>
 <YCgYxOxXwitkFB0T@mattapan.m5p.com>
 <22128555.Kfurr2TIWe@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22128555.Kfurr2TIWe@localhost>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Sun, Feb 14, 2021 at 11:45:47PM +0100, Maximilian Engelhardt wrote:
> On Samstag, 13. Februar 2021 19:21:56 CET Elliott Mitchell wrote:
> > On Sat, Feb 13, 2021 at 04:36:24PM +0100, Maximilian Engelhardt wrote:
> > > * The issue started with Debian kernel 5.8.3+1~exp1 running in the vm,
> > > Debian kernel 5.7.17-1 does not show the issue.
> > 
> > I think the first kernel update during which I saw the issue was around
> > linux-image-4.19.0-12-amd64 or linux-image-4.19.0-13-amd64.  I think
> > the last security update to the Xen packages was in a similar timeframe
> > though.  Rate this portion as unreliable though.  I can definitely state
> > this occurs with Debian's linux-image-4.19.0-13-amd64 and kernels built
> > from corresponding source, this may have shown earlier.
> 
> We don't see any issues with the current Debian buster (Debian stable) kernel 
> (4.19.0-14-amd64 #1 SMP Debian 4.19.171-2 (2021-01-30) x86_64 GNU/Linux) and 
> also did not notice any issues with the older kernel packages in buster. Also 
> the security update of xen in buster did not cause any behavior change for us. 
> In our case everything in buster is working as we expect it to work (using 
> latest updates and security updates).

I can't really say much here.  I keep up to date and I cannot point to a
key ingredient as the one which caused this breakage.


> > Fresh observation.  During a similar timeframe I started noticing VM
> > creation leaving a `xl create` process behind.  I had discovered this
> > process could be freely killed without appearing to effect the VM and had
> > thus been doing so (memory in a lean Dom0 is precious).
> > 
> > While typing this I realized there was another scenario I needed to try.
> > Turns out if I boot PV GRUB and get to its command-line (press 'c'), then
> > get away from the VM console, kill the `xl create` process, return to
> > the console and type "halt".  This results in a hung VM.
> > 
> > Are you perhaps either killing the `xl create` process for effected VMs,
> > or migrating the VM and thus splitting the `xl create` process from the
> > effected VMs?
> > 
> > This seems more a Debian issue than a Xen Project issue right now.
> 
> We don't migrate the vms, we don't kill any processes running on the dom0 and 
> I don't see anything in our logs indicating something gets killed on the dom0. 
> On our systems the running 'xl create' processes only use very little memory.
> 
> Have you tried if you still observer your hangs if you don't kill the xl 
> processes?

That is exactly what I pointed to above.  On stable killing the
mysterious left behind `xl create` process causes the problem to
manifest, while leaving it undisturbed appears to makes the problem not
manifest.

After a save/restore instead it is a `xl restore` process left behind.
I /suspect/ this plays a similar role, I'm unsure how far this goes
though.  Might you try telling a VM to reboot, then do a save followed
by a restore of it?

I'm curious whether respawning the `xl restore` could work around what is
occuring.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



