Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C27429039E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 12:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7888.20815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTNRd-0005sP-2Z; Fri, 16 Oct 2020 10:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7888.20815; Fri, 16 Oct 2020 10:58:45 +0000
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
	id 1kTNRc-0005s0-VO; Fri, 16 Oct 2020 10:58:44 +0000
Received: by outflank-mailman (input) for mailman id 7888;
 Fri, 16 Oct 2020 10:58:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JQTg=DX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kTNRc-0005rq-6n
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 10:58:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fa88072-4dfe-4f75-bb3a-ce319564d7e4;
 Fri, 16 Oct 2020 10:58:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE1B5AB5C;
 Fri, 16 Oct 2020 10:58:42 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JQTg=DX=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kTNRc-0005rq-6n
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 10:58:44 +0000
X-Inumbo-ID: 6fa88072-4dfe-4f75-bb3a-ce319564d7e4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6fa88072-4dfe-4f75-bb3a-ce319564d7e4;
	Fri, 16 Oct 2020 10:58:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602845922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IwanLpIcHzmd1jTJgQsiVGDYfgOQtfWilyCT1REryeg=;
	b=hQtYr5IbceAdXJ9EHBvenVaDqys5gXTxo6VWYp9BbakFbGSGxxZM1NJp0D78LCk8LE+6ac
	ie3gnI+lb0jFd4oYbUWXdWMqAWUK3q8RIwQxvBwgpl95GHzRZM9q87Jm2ivQslWI+Dpg/D
	k6dvPSpzArFgHV2exR8x0vTZedJiaww=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AE1B5AB5C;
	Fri, 16 Oct 2020 10:58:42 +0000 (UTC)
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
Subject: [PATCH v3 0/2] XSA-343 followup patches
Date: Fri, 16 Oct 2020 12:58:37 +0200
Message-Id: <20201016105839.14796-1-jgross@suse.com>
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

Changes in V3:
- addressed comments

Juergen Gross (2):
  xen/events: access last_priority and last_vcpu_id together
  xen/evtchn: rework per event channel lock

 xen/arch/x86/irq.c         |   6 +-
 xen/arch/x86/pv/shim.c     |   9 +--
 xen/common/event_channel.c | 109 +++++++++++++++++--------------------
 xen/common/event_fifo.c    |  25 +++++++--
 xen/include/xen/event.h    |  76 ++++++++++++++++++++++----
 xen/include/xen/sched.h    |   5 +-
 6 files changed, 145 insertions(+), 85 deletions(-)

-- 
2.26.2


