Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E12AB15D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 07:41:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21983.48324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc0ru-000162-BO; Mon, 09 Nov 2020 06:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21983.48324; Mon, 09 Nov 2020 06:41:34 +0000
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
	id 1kc0ru-00015g-83; Mon, 09 Nov 2020 06:41:34 +0000
Received: by outflank-mailman (input) for mailman id 21983;
 Mon, 09 Nov 2020 06:41:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kc0rs-00015b-LN
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 06:41:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1ce20d0-6b0a-40bf-8a5d-69d88ac86f38;
 Mon, 09 Nov 2020 06:41:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 792DDABAE;
 Mon,  9 Nov 2020 06:41:30 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kc0rs-00015b-LN
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 06:41:32 +0000
X-Inumbo-ID: a1ce20d0-6b0a-40bf-8a5d-69d88ac86f38
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a1ce20d0-6b0a-40bf-8a5d-69d88ac86f38;
	Mon, 09 Nov 2020 06:41:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604904090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LUdlh+zdBKQghkZPV4VxCqV7/PPrlk7RpBaFpPPoy5c=;
	b=LNFAVwcgUR7cRtdS+etbSv+69rjkjfBx/CcigeIujWHbo+cB82ap0K2mj1CabaII7HJfyh
	96wFNbWf5cAC6S59inBfETdfSPJ8pei1+/OD3Z2M5QfzsFCQTLcBoH3mVgT1hW+N5zfuVZ
	Z4OFZSvXSOhqFO79hS5RBSt3TsgaOkc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 792DDABAE;
	Mon,  9 Nov 2020 06:41:30 +0000 (UTC)
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
Subject: [PATCH v5 0/2] XSA-343 followup patches
Date: Mon,  9 Nov 2020 07:41:26 +0100
Message-Id: <20201109064128.3908-1-jgross@suse.com>
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

Changes in V5:
- moved evtchn_write_[un]lock() to event_channel.c (Jan Beulich)
- used normal read_lock() in some cases (Jan Beulich)

Changes in V4:
- switched to real rwlock

Changes in V3:
- addressed comments

Juergen Gross (2):
  xen/events: access last_priority and last_vcpu_id together
  xen/evtchn: rework per event channel lock

 xen/arch/x86/irq.c         |   6 +-
 xen/arch/x86/pv/shim.c     |   9 +--
 xen/common/event_channel.c | 144 +++++++++++++++++++++----------------
 xen/common/event_fifo.c    |  25 +++++--
 xen/include/xen/event.h    |  32 ++++++---
 xen/include/xen/sched.h    |   8 ++-
 6 files changed, 136 insertions(+), 88 deletions(-)

-- 
2.26.2


