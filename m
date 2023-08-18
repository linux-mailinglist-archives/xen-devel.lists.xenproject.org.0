Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055F9780CBC
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 15:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586326.917535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzmU-0002xp-UP; Fri, 18 Aug 2023 13:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586326.917535; Fri, 18 Aug 2023 13:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzmU-0002vD-R5; Fri, 18 Aug 2023 13:44:50 +0000
Received: by outflank-mailman (input) for mailman id 586326;
 Fri, 18 Aug 2023 13:44:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWzmT-0002v1-2f
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 13:44:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWzmS-0002F7-QD; Fri, 18 Aug 2023 13:44:48 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWzmS-00023L-Fj; Fri, 18 Aug 2023 13:44:48 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=V4Xe6wLkPxIFPqqCQPAxla8mfybHMGtBMzfkN78uEkA=; b=pPuRQ0
	rtQlo+4IxH4Ls48XsMs1enoV8Qf+w54MDyltVRdigU6rf74R4JXTDqnl8czzE567060MJU1x7vimj
	xJ+bXt9/I1ApGhj2qkF+ryZJnT1hHcs/p/VHYZBfPZzy0Ao+J1WL7bIvc/2714KcAn0B+j2dnc+qv
	uBMhP8uIz2A=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] xen/x86: Optimize timer_irq_works()
Date: Fri, 18 Aug 2023 14:44:39 +0100
Message-Id: <20230818134441.45586-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

At the moment timer_irq_works() will always wait 100ms even with
enough ticks elapsed. This is a bit wasteful when most of the HW
should not be buggy.

The admin may also know that their HW is not buggy so they could
decide to skip the full 100ms. Also, looking at Linux changes, it
was pointed out that the timer_irq_works() may always return false
on when using para-virtualized delay. It is not a problem for Xen,
but still it makes sense to provide an option to disable the timer
check.

Patch #1 of the series will add the command line option while patch
#2 will optimize timer_irq_works() for the good case.

Cheers,

Julien Grall (2):
  xen/x86: io_apic: Introduce a command line option to skip timer check
  xen/x86: ioapic: Bail out from timer_irq_works() as soon as possible

 docs/misc/xen-command-line.pandoc |  7 ++++++
 xen/arch/x86/io_apic.c            | 41 ++++++++++++++++++++++---------
 2 files changed, 37 insertions(+), 11 deletions(-)

-- 
2.40.1


