Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C302DB188
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54533.94884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJH-0006Ng-9t; Tue, 15 Dec 2020 16:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54533.94884; Tue, 15 Dec 2020 16:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJH-0006MQ-5m; Tue, 15 Dec 2020 16:36:23 +0000
Received: by outflank-mailman (input) for mailman id 54533;
 Tue, 15 Dec 2020 16:36:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpDJF-00066M-HU
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:36:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cd1ba9f-404d-4d83-925f-64f686129a6d;
 Tue, 15 Dec 2020 16:36:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF608AC7F;
 Tue, 15 Dec 2020 16:36:07 +0000 (UTC)
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
X-Inumbo-ID: 0cd1ba9f-404d-4d83-925f-64f686129a6d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608050167; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kYVC+qKjmu1QH58TZR0/l7X0f2towWcVsvAHjXP8k6o=;
	b=oEofi3aD1RzuCCCnkM7DE40w5NnFiOaY5aVlC6P8XioMkDfign/z1L9h8x+v9zrqK9eEAD
	GdykhfR1mLbO9bxrN0dqZnTC0jB29oeos9EfiX1WBMRxK173cuuSe4AXHnlB+NtB3WyfdS
	d0xsr49SxsRL/N+qhy0slWpg79WA9yU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 00/25] tools/xenstore: support live update for xenstored
Date: Tue, 15 Dec 2020 17:35:38 +0100
Message-Id: <20201215163603.21700-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today Xenstore is not restartable. This means a Xen server needing an
update of xenstored has to be rebooted in order to let this update
become effective.

This patch series is changing that: The internal state of xenstored
(the contents of Xenstore, all connections to various clients like
programs or other domains, and watches) is saved in a defined format
and a new binary is being activated consuming the old state. All
connections are being restored and the new Xenstore binary will
continue where the old one stopped.

This patch series has been under (secret) development for quite some
time. It hasn't been posted to xen-devel until now due to the various
Xenstore related security issues which have become public only today.

There will be a similar series for oxenstored posted.

Xenstore-stubdom is not yet supported, but I'm planning to start
working on that soon.

Changes in V10 (for the members of the security team):
- dropped patch 6 as requested by Andrew

Juergen Gross (24):
  tools/xenstore: switch barf[_perror]() to use syslog()
  tools/xenstore: make set_tdb_key() non-static
  tools/xenstore: remove unused cruft from xenstored_domain.c
  tools/libxenevtchn: add possibility to not close file descriptor on
    exec
  tools/xenstore: refactor XS_CONTROL handling
  tools/xenstore: add live update command to xenstore-control
  tools/xenstore: add basic live-update command parsing
  tools/xenstore: introduce live update status block
  tools/xenstore: save new binary for live update
  tools/xenstore: add command line handling for live update
  tools/xenstore: add the basic framework for doing the live update
  tools/xenstore: allow live update only with no transaction active
  docs: update the xenstore migration stream documentation
  tools/xenstore: add include file for state structure definitions
  tools/xenstore: dump the xenstore state for live update
  tools/xenstore: handle CLOEXEC flag for local files and pipes
  tools/xenstore: split off domain introduction from do_introduce()
  tools/xenstore: evaluate the live update flag when starting
  tools/xenstore: read internal state when doing live upgrade
  tools/xenstore: add reading global state for live update
  tools/xenstore: add read connection state for live update
  tools/xenstore: add read node state for live update
  tools/xenstore: add read watch state for live update
  tools/xenstore: activate new binary for live update

Julien Grall (1):
  tools/xenstore: handle dying domains in live update

 docs/designs/xenstore-migration.md      |  19 +-
 docs/misc/xenstore.txt                  |  21 +
 tools/include/xenevtchn.h               |  16 +-
 tools/libs/evtchn/Makefile              |   2 +-
 tools/libs/evtchn/core.c                |  45 +-
 tools/libs/evtchn/freebsd.c             |   9 +-
 tools/libs/evtchn/libxenevtchn.map      |   4 +
 tools/libs/evtchn/linux.c               |   9 +-
 tools/libs/evtchn/minios.c              |   6 +-
 tools/libs/evtchn/netbsd.c              |   2 +-
 tools/libs/evtchn/private.h             |   2 +-
 tools/libs/evtchn/solaris.c             |   2 +-
 tools/xenstore/Makefile                 |   3 +-
 tools/xenstore/include/xenstore_state.h | 131 +++++
 tools/xenstore/utils.c                  |  20 +
 tools/xenstore/utils.h                  |   6 +
 tools/xenstore/xenstore_control.c       | 332 ++++++++++++-
 tools/xenstore/xenstored_control.c      | 612 +++++++++++++++++++++++-
 tools/xenstore/xenstored_control.h      |   1 +
 tools/xenstore/xenstored_core.c         | 510 ++++++++++++++++++--
 tools/xenstore/xenstored_core.h         |  40 ++
 tools/xenstore/xenstored_domain.c       | 312 +++++++++---
 tools/xenstore/xenstored_domain.h       |  14 +-
 tools/xenstore/xenstored_posix.c        |  13 +-
 tools/xenstore/xenstored_transaction.c  |  11 +-
 tools/xenstore/xenstored_watch.c        | 171 +++++--
 tools/xenstore/xenstored_watch.h        |   5 +
 27 files changed, 2103 insertions(+), 215 deletions(-)
 create mode 100644 tools/xenstore/include/xenstore_state.h

-- 
2.26.2


