Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D73D599C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jul 2021 14:33:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160931.295495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7znd-0003cG-Ky; Mon, 26 Jul 2021 12:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160931.295495; Mon, 26 Jul 2021 12:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7znd-0003aS-Hu; Mon, 26 Jul 2021 12:33:37 +0000
Received: by outflank-mailman (input) for mailman id 160931;
 Mon, 26 Jul 2021 12:33:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+3RU=MS=dingwall.me.uk=james@srs-us1.protection.inumbo.net>)
 id 1m7znc-0003aK-B7
 for xen-devel@lists.xenproject.org; Mon, 26 Jul 2021 12:33:36 +0000
Received: from smarthost01a.ixn.mail.zen.net.uk (unknown [212.23.1.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5d59c13-2d04-44ea-9863-0104b8da0fea;
 Mon, 26 Jul 2021 12:33:34 +0000 (UTC)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01a.ixn.mail.zen.net.uk with esmtpsa
 (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.90_1)
 (envelope-from <james@dingwall.me.uk>)
 id 1m7znZ-0001HW-5k; Mon, 26 Jul 2021 12:33:33 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 5C865F1000;
 Mon, 26 Jul 2021 13:33:32 +0100 (BST)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAngg1ZP-bP1; Mon, 26 Jul 2021 13:33:32 +0100 (BST)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk [192.168.1.200])
 by dingwall.me.uk (Postfix) with ESMTP id 41E90F0FFD;
 Mon, 26 Jul 2021 13:33:32 +0100 (BST)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 36E7E258; Mon, 26 Jul 2021 13:33:32 +0100 (BST)
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
X-Inumbo-ID: f5d59c13-2d04-44ea-9863-0104b8da0fea
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Mon, 26 Jul 2021 13:33:32 +0100
From: James Dingwall <james@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: Re: xen 4.11.4 incorrect (~3x) cpu frequency reported
Message-ID: <20210726123332.GA3844057@dingwall.me.uk>
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
X-Originating-smarthost01a-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

Hi Jan,

Thank you for taking the time to reply.

On Wed, Jul 21, 2021 at 12:59:11PM +0200, Jan Beulich wrote:
> On 21.07.2021 11:29, James Dingwall wrote:
> > We have a system which intermittently starts up and reports an incorrect cpu frequency:
> > 
> > # grep -i mhz /var/log/kern.log 
> > Jul 14 17:47:47 dom0 kernel: [    0.000475] tsc: Detected 2194.846 MHz processor
> > Jul 14 22:03:37 dom0 kernel: [    0.000476] tsc: Detected 2194.878 MHz processor
> > Jul 14 23:05:13 dom0 kernel: [    0.000478] tsc: Detected 2194.848 MHz processor
> > Jul 14 23:20:47 dom0 kernel: [    0.000474] tsc: Detected 2194.856 MHz processor
> > Jul 14 23:57:39 dom0 kernel: [    0.000476] tsc: Detected 2194.906 MHz processor
> > Jul 15 01:04:09 dom0 kernel: [    0.000476] tsc: Detected 2194.858 MHz processor
> > Jul 15 01:27:15 dom0 kernel: [    0.000482] tsc: Detected 2194.870 MHz processor
> > Jul 15 02:00:13 dom0 kernel: [    0.000481] tsc: Detected 2194.924 MHz processor
> > Jul 15 03:09:23 dom0 kernel: [    0.000475] tsc: Detected 2194.892 MHz processor
> > Jul 15 03:32:50 dom0 kernel: [    0.000482] tsc: Detected 2194.856 MHz processor
> > Jul 15 04:05:27 dom0 kernel: [    0.000480] tsc: Detected 2194.886 MHz processor
> > Jul 15 05:00:38 dom0 kernel: [    0.000473] tsc: Detected 2194.914 MHz processor
> > Jul 15 05:59:33 dom0 kernel: [    0.000480] tsc: Detected 2194.924 MHz processor
> > Jul 15 06:22:31 dom0 kernel: [    0.000474] tsc: Detected 2194.910 MHz processor
> > Jul 15 17:52:57 dom0 kernel: [    0.000474] tsc: Detected 2194.854 MHz processor
> > Jul 15 18:51:36 dom0 kernel: [    0.000474] tsc: Detected 2194.900 MHz processor
> > Jul 15 19:07:26 dom0 kernel: [    0.000478] tsc: Detected 2194.902 MHz processor
> > Jul 15 19:43:56 dom0 kernel: [    0.000154] tsc: Detected 6895.384 MHz processor
> 
> Well, this is output from Dom0. What we'd need to see (in addition)
> is the corresponding hypervisor log at maximum verbosity (loglvl=all).

This was just to illustrate that the dom0 usually reports the correct speed.  I'll update the xen boot options with loglvl=all and try to collect the boot messages for each case.

> 
> > The xen 's' debug output:
> > 
> > (XEN) TSC marked as reliable, warp = 0 (count=4)
> > (XEN) dom1: mode=0,ofs=0x1d1ac8bf8e,khz=6895385,inc=1
> > (XEN) dom2: mode=0,ofs=0x28bc24c746,khz=6895385,inc=1
> > (XEN) dom3: mode=0,ofs=0x345696b138,khz=6895385,inc=1
> > (XEN) dom4: mode=0,ofs=0x34f2635f31,khz=6895385,inc=1
> > (XEN) dom5: mode=0,ofs=0x3581618a7d,khz=6895385,inc=1
> > (XEN) dom6: mode=0,ofs=0x3627ca68b2,khz=6895385,inc=1
> > (XEN) dom7: mode=0,ofs=0x36dd491860,khz=6895385,inc=1
> > (XEN) dom8: mode=0,ofs=0x377a57ea1a,khz=6895385,inc=1
> > (XEN) dom9: mode=0,ofs=0x381eb175ce,khz=6895385,inc=1
> > (XEN) dom10: mode=0,ofs=0x38cab2e260,khz=6895385,inc=1
> > (XEN) dom11: mode=0,ofs=0x397fc47387,khz=6895385,inc=1
> > (XEN) dom12: mode=0,ofs=0x3a552762a0,khz=6895385,inc=1
> > 
> > A processor from /proc/cpuinfo in dom0:
> > 
> > processor       : 3
> > vendor_id       : GenuineIntel
> > cpu family      : 6
> > model           : 85
> > model name      : Intel(R) Xeon(R) D-2123IT CPU @ 2.20GHz
> > stepping        : 4
> > microcode       : 0x2000065
> > cpu MHz         : 6895.384
> > [...]
> > 
> > Xen has been built at 310ab79875cb705cc2c7daddff412b5a4899f8c9 from the stable-4.12 branch.
> 
> While this contradicts the title, both 4.11 and 4.12 are out of general
> support. Hence it would be more helpful if you could obtain respective
> logs with a more modern version of Xen - ideally from the master branch,
> or else the most recent stable one (4.15). Provided of course the issue
> continues to exist there in the first place.

That was my error, I meant the stable-4.11 branch.  We have a development environment based around 4.14.2 which I can test.  My assumption had been that xen reads or calculates this frequency and provides it to the dom0 since it is reported in the hypervisor log before dom0 is started.

Regards,
James

