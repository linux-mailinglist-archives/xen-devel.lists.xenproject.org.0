Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DF4214C81
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 15:01:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1js4Fq-0001xq-1v; Sun, 05 Jul 2020 13:00:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7P7Y=AQ=listes.aquilenet.fr=admin@srs-us1.protection.inumbo.net>)
 id 1js4Fo-0001xl-K3
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 13:00:20 +0000
X-Inumbo-ID: 79d2dfc8-bebf-11ea-bb8b-bc764e2007e4
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79d2dfc8-bebf-11ea-bb8b-bc764e2007e4;
 Sun, 05 Jul 2020 13:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 37469865
 for <xen-devel@lists.xenproject.org>; Sun,  5 Jul 2020 15:00:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7lHGnZwo_YMY for <xen-devel@lists.xenproject.org>;
 Sun,  5 Jul 2020 15:00:14 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 2912C23B6
 for <xen-devel@lists.xenproject.org>; Sun,  5 Jul 2020 15:00:11 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <admin@listes.aquilenet.fr>) id 1js4Fd-004Wmv-1O
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 15:00:09 +0200
Date: Sun, 5 Jul 2020 15:00:08 +0200
From: Samuel Thibault <admin@listes.aquilenet.fr>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Block requests priorities?
Message-ID: <20200705130008.w7z33nz6ue7ly7sx@function>
Mail-Followup-To: Samuel Thibault <admin@listes.aquilenet.fr>,
 xen-devel <xen-devel@lists.xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

Every month, we are getting a RAID check at the same time as VMs backing
up their data. Yes, probably not a good thing to do, but that should
still be working, and what we see is the whole system gets overly
sluggish since we mark all of these idle-prioritized.

The RAID check is happening inside dom0, with the --idle option to make
I/Os deprioritized.

The backups are happening inside domUs, with ionice -c 3 to make I/O
deprioritized as well.

But AIUI, the fact that the backup I/Os should be reprioritized is not
transmitted through the blkif protocol, and thus dom0 considers them
just like other VM I/O requests. Shouldn't we add priorities to the
blkif requests?

Otherwise what I guess is happening is that some large VMs are backing
up a lot of data, and even if *they* prioritize I/O requests inside
the domUs, the flurry of I/O requests are still piling up inside
dom0, at non-idle priority since the idle priority information is not
transmitted. And then I/O requests from other VMs get delayed behind
that flurry of requests. I'm not even sure that bfq happens to have the
proper information in order to correctly establish fair queueing between
domUs?

Samuel

