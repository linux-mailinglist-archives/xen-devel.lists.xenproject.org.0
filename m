Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D908A2F64C7
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67199.119713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hN-0002T4-Pu; Thu, 14 Jan 2021 15:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67199.119713; Thu, 14 Jan 2021 15:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hN-0002Sa-M4; Thu, 14 Jan 2021 15:38:09 +0000
Received: by outflank-mailman (input) for mailman id 67199;
 Thu, 14 Jan 2021 15:38:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04hM-0002SV-NS
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd99a00e-590f-41f4-ac52-5c1d634e83d3;
 Thu, 14 Jan 2021 15:38:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9BA6AC24;
 Thu, 14 Jan 2021 15:38:06 +0000 (UTC)
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
X-Inumbo-ID: fd99a00e-590f-41f4-ac52-5c1d634e83d3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=u39JLnXWgUBBP3kWfUg/W5Q2wSRbyK9fPf+1/OeuVt8=;
	b=fYElX7scLMSwGPj26+wmQlQ4qvkHBBlMaXJHDaTqhRSUy9wqpkz0hk3jL+BCtkb3swAcZy
	gLetl3A2bbwPGrnXJjJaSlYIfvy2efJ5XjBWqlIDbKY4ByNscm5HfK6x6paGsDO0555CBs
	QPuJj454xb5A1exY9KsqegkPpOlQRz8=
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
Subject: [PATCH v11 00/27] tools/xenstore: support live update for xenstored
Date: Thu, 14 Jan 2021 16:37:36 +0100
Message-Id: <20210114153803.2591-1-jgross@suse.com>
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

This patch series has been under (secret) development until V9.
It has been posted to xen-devel only from V10 onwards.

There will be a similar series for oxenstored posted.

Xenstore-stubdom is not yet supported, but I'm planning to start
working on that soon.

Changes in V11:
- dropped patches 1-3 of V10 as already appled
- new patches 1-4 (Andrew Cooper): more libxenevtchn cleanup
- new patch 12 (Edwin Torok): handle timeout of LU completely in
  xenstored instead of split xenstore-control/xenstored. I've kept
  the xenstore-control timeout handling for the case of premature
  LU supporting downstream versions

Changes in V10 (for the members of the security team):
- dropped patch 6 as requested by Andrew

Juergen Gross (26):
  tools/libxenevtchn: switch to standard xen coding style
  tools/libxenevtchn: rename open_flags to flags
  tools/libxenevtchn: check xenevtchn_open() flags for not supported
    bits
  tools/libxenevtchn: propagate xenevtchn_open() flags parameter
  tools/libxenevtchn: add possibility to not close file descriptor on
    exec
  tools/xenstore: refactor XS_CONTROL handling
  tools/xenstore: add live update command to xenstore-control
  tools/xenstore: add basic live-update command parsing
  tools/xenstore: introduce live update status block
  tools/xenstore: save new binary for live update
  tools/xenstore: add command line handling for live update
  tools/xenstore: add support for delaying execution of a xenstore
    request
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
 tools/include/xenevtchn.h               |  18 +-
 tools/libs/evtchn/Makefile              |   2 +-
 tools/libs/evtchn/core.c                |  74 ++-
 tools/libs/evtchn/freebsd.c             |  33 +-
 tools/libs/evtchn/libxenevtchn.map      |   4 +
 tools/libs/evtchn/linux.c               |  12 +-
 tools/libs/evtchn/minios.c              | 104 +++-
 tools/libs/evtchn/netbsd.c              |  24 +-
 tools/libs/evtchn/private.h             |   2 +-
 tools/libs/evtchn/solaris.c             |  14 +-
 tools/xenstore/Makefile                 |   3 +-
 tools/xenstore/include/xenstore_state.h | 131 +++++
 tools/xenstore/utils.c                  |  17 +
 tools/xenstore/utils.h                  |   6 +
 tools/xenstore/xenstore_control.c       | 333 +++++++++++-
 tools/xenstore/xenstored_control.c      | 665 +++++++++++++++++++++++-
 tools/xenstore/xenstored_control.h      |   1 +
 tools/xenstore/xenstored_core.c         | 549 +++++++++++++++++--
 tools/xenstore/xenstored_core.h         |  59 +++
 tools/xenstore/xenstored_domain.c       | 301 ++++++++---
 tools/xenstore/xenstored_domain.h       |  11 +-
 tools/xenstore/xenstored_posix.c        |  13 +-
 tools/xenstore/xenstored_transaction.c  |   5 +
 tools/xenstore/xenstored_watch.c        | 171 ++++--
 tools/xenstore/xenstored_watch.h        |   5 +
 27 files changed, 2354 insertions(+), 243 deletions(-)
 create mode 100644 tools/xenstore/include/xenstore_state.h

-- 
2.26.2


