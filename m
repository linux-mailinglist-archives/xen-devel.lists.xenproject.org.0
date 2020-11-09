Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E212AC110
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 17:39:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22718.49109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcABc-0000vh-RR; Mon, 09 Nov 2020 16:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22718.49109; Mon, 09 Nov 2020 16:38:32 +0000
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
	id 1kcABc-0000vI-Nc; Mon, 09 Nov 2020 16:38:32 +0000
Received: by outflank-mailman (input) for mailman id 22718;
 Mon, 09 Nov 2020 16:38:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kcABb-0000v8-2G
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 16:38:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b4ea960-041b-44e3-96b3-3216b006e393;
 Mon, 09 Nov 2020 16:38:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 10915AC23;
 Mon,  9 Nov 2020 16:38:29 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kcABb-0000v8-2G
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 16:38:31 +0000
X-Inumbo-ID: 7b4ea960-041b-44e3-96b3-3216b006e393
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7b4ea960-041b-44e3-96b3-3216b006e393;
	Mon, 09 Nov 2020 16:38:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604939909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QU7Z3Z0bBjMIFarM5iEftjQYoXJqTzDIt0wRsAEwtIo=;
	b=e8UAv2S+dcrq+HObe5o8R9YRbIM7bntu3ww9Qwm6FODAhPXWvzaMJYfOcTTOB3V6YpJd1q
	jqwkqyaf9LIrj/6oGIKLBrE4jzkhpWzozAFDE1DSeI1XOeSwqfaFVv+cEEoi8pK9Iry2b6
	CAtgkgihAUT1v9DRu8lygSlkLFd/h1g=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 10915AC23;
	Mon,  9 Nov 2020 16:38:29 +0000 (UTC)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v6 0/3] XSA-343 followup patches
Date: Mon,  9 Nov 2020 17:38:23 +0100
Message-Id: <20201109163826.13035-1-jgross@suse.com>
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

Changes in V6:
- added patch 3 (Jan Beulich)
- switched some more read_trylock() cases to read_lock() (Jan Beulich)

Changes in V5:
- moved evtchn_write_[un]lock() to event_channel.c (Jan Beulich)
- used normal read_lock() in some cases (Jan Beulich)

Changes in V4:
- switched to real rwlock

Changes in V3:
- addressed comments

Juergen Gross (3):
  xen/events: access last_priority and last_vcpu_id together
  xen/evtchn: rework per event channel lock
  xen/evtchn: revert 52e1fc47abc3a0123

 xen/arch/x86/irq.c          |   6 +-
 xen/arch/x86/pv/shim.c      |   9 ++-
 xen/common/event_channel.c  | 144 +++++++++++++++++++-----------------
 xen/common/event_fifo.c     |  25 +++++--
 xen/include/xen/event.h     |  29 ++++++--
 xen/include/xen/sched.h     |   8 +-
 xen/include/xsm/xsm.h       |   1 -
 xen/xsm/flask/avc.c         |  78 ++-----------------
 xen/xsm/flask/hooks.c       |  10 ---
 xen/xsm/flask/include/avc.h |   2 -
 10 files changed, 139 insertions(+), 173 deletions(-)

-- 
2.26.2


