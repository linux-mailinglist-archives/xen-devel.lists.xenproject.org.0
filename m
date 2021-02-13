Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFBD31AD8C
	for <lists+xen-devel@lfdr.de>; Sat, 13 Feb 2021 19:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84690.158777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAzYb-0004QN-MT; Sat, 13 Feb 2021 18:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84690.158777; Sat, 13 Feb 2021 18:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAzYb-0004Py-JH; Sat, 13 Feb 2021 18:22:13 +0000
Received: by outflank-mailman (input) for mailman id 84690;
 Sat, 13 Feb 2021 18:22:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3Bv=HP=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lAzYa-0004Pt-L0
 for xen-devel@lists.xenproject.org; Sat, 13 Feb 2021 18:22:12 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0840c19-aaf9-4ba0-9d37-cb3a1ed926bf;
 Sat, 13 Feb 2021 18:22:11 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 11DILu80096894
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 13 Feb 2021 13:22:02 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 11DILuWU096893;
 Sat, 13 Feb 2021 10:21:56 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: f0840c19-aaf9-4ba0-9d37-cb3a1ed926bf
Date: Sat, 13 Feb 2021 10:21:56 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Maximilian Engelhardt <maxi@daemonizer.de>
Cc: xen-devel@lists.xenproject.org, pkg-xen-devel@lists.alioth.debian.org
Subject: Re: [BUG] Linux pvh vm not getting destroyed on shutdown
Message-ID: <YCgYxOxXwitkFB0T@mattapan.m5p.com>
References: <2195346.r5JaYcbZso@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2195346.r5JaYcbZso@localhost>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Sat, Feb 13, 2021 at 04:36:24PM +0100, Maximilian Engelhardt wrote:
> after a recent upgrade of one of our test systems to Debian Bullseye we 
> noticed an issue where on shutdown of a pvh vm the vm was not destroyed by xen 
> automatically. It could still be destroyed by manually issuing a 'xl destroy 
> $vm' command.

Usually I would expect such an issue to show on the Debian bug database
before xen-devel.  In particular as this is a behavior change with
security updates, there is a good chance this isn't attributable to the
Xen Project.  Additionally the Xen Project's support window is rather
narrow.  I've been observing the same (or similar) issue for a bit too.


> Here are some things I noticed while trying to debug this issue:
> 
> * It happens on a Debian buster dom0 as well as on a bullseye dom0

I stick with stable on non-development machines, so I can't say anything
to this.

> * It seems to only affect pvh vms.

I've observed it with pv and hvm VMs as well.

> * shutdown from the pvgrub menu ("c" -> "halt") does work

Woah!  That is quite the observation.  Since I had a handy opportunity
I tried this and this reproduces for me.

> * the vm seems to shut down normal, the last lines in the console are:

I agree with this.  Everything appears typical until the last moment.

> * issuing a reboot instead of a shutdown does work fine.

I disagree with this.  I'm seeing the issue occur with restart attempts
too.

> * The issue started with Debian kernel 5.8.3+1~exp1 running in the vm, Debian 
> kernel 5.7.17-1 does not show the issue.

I think the first kernel update during which I saw the issue was around
linux-image-4.19.0-12-amd64 or linux-image-4.19.0-13-amd64.  I think
the last security update to the Xen packages was in a similar timeframe
though.  Rate this portion as unreliable though.  I can definitely state
this occurs with Debian's linux-image-4.19.0-13-amd64 and kernels built
from corresponding source, this may have shown earlier.

> * setting vcpus equal to maxvcpus does *not* show the hang.

I haven't tried things related to this, so I can't comment on this
part.


Fresh observation.  During a similar timeframe I started noticing VM
creation leaving a `xl create` process behind.  I had discovered this
process could be freely killed without appearing to effect the VM and had
thus been doing so (memory in a lean Dom0 is precious).

While typing this I realized there was another scenario I needed to try.
Turns out if I boot PV GRUB and get to its command-line (press 'c'), then
get away from the VM console, kill the `xl create` process, return to
the console and type "halt".  This results in a hung VM.

Are you perhaps either killing the `xl create` process for effected VMs,
or migrating the VM and thus splitting the `xl create` process from the
effected VMs?

This seems more a Debian issue than a Xen Project issue right now.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



