Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3812A2D91
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 16:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17702.42519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZbNW-0001Ni-2i; Mon, 02 Nov 2020 15:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17702.42519; Mon, 02 Nov 2020 15:04:14 +0000
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
	id 1kZbNV-0001NJ-Vs; Mon, 02 Nov 2020 15:04:13 +0000
Received: by outflank-mailman (input) for mailman id 17702;
 Mon, 02 Nov 2020 15:04:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ZVo=EI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kZbNU-0001N9-6O
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 15:04:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6db869b9-c5c1-488e-aa3f-aee8f2395eb6;
 Mon, 02 Nov 2020 15:04:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD42BAC53;
 Mon,  2 Nov 2020 15:04:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2ZVo=EI=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kZbNU-0001N9-6O
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 15:04:12 +0000
X-Inumbo-ID: 6db869b9-c5c1-488e-aa3f-aee8f2395eb6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 6db869b9-c5c1-488e-aa3f-aee8f2395eb6;
	Mon, 02 Nov 2020 15:04:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604329450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OBSHY70RSdE1JKjBVnT51+G54Dab9ykWCkhn2/kRJ9I=;
	b=YKHpv4kB72+593ck+Bhh8C2jkWOtQS8B8uhzBRjJR6gKP8zNBeaKw8vPE3awmGL2LqXzbo
	3Yv+v55VTQNFw4eaj5X5pfETy7MEW1q9Tfr7Pvsziepd1P3p3NhCWFYyvZFv2AnBnRCUur
	ntMewqi08NpLbTusJ4YYsa5Ybdo32x0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CD42BAC53;
	Mon,  2 Nov 2020 15:04:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 0/2] XSA-343 followup patches
Date: Mon,  2 Nov 2020 16:04:06 +0100
Message-Id: <20201102150408.4954-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patches for XSA-343 produced some fallout, especially the event
channel locking has shown to be problematic.

Patch 1 is targeting fifo event channels for avoiding any races for the
case that the fifo queue has been changed for a specific event channel.

The second patch is modifying the per event channel locking scheme in
order to avoid deadlocks and problems due to the event channel lock
having been changed to require IRQs off by the XSA-343 patches.

Changes in V4:
- switched to real rwlock

Changes in V3:
- addressed comments

*** BLURB HERE ***

Juergen Gross (2):
  xen/events: access last_priority and last_vcpu_id together
  xen/evtchn: rework per event channel lock

 xen/arch/x86/irq.c         |   6 +-
 xen/arch/x86/pv/shim.c     |   9 +--
 xen/common/event_channel.c | 120 ++++++++++++++++++-------------------
 xen/common/event_fifo.c    |  25 ++++++--
 xen/include/xen/event.h    |  55 +++++++++++++----
 xen/include/xen/sched.h    |   6 +-
 6 files changed, 131 insertions(+), 90 deletions(-)

-- 
2.26.2


