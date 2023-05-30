Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E47F71591A
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:54:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540869.842943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v7Y-0001ap-U7; Tue, 30 May 2023 08:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540869.842943; Tue, 30 May 2023 08:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v7Y-0001Xl-R3; Tue, 30 May 2023 08:54:24 +0000
Received: by outflank-mailman (input) for mailman id 540869;
 Tue, 30 May 2023 08:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3v7W-0001Xf-Qs
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:54:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91c9383c-fec7-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 10:54:21 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D15B1F8D9;
 Tue, 30 May 2023 08:54:21 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0876A1341B;
 Tue, 30 May 2023 08:54:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id tILCAL25dWQsGwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 08:54:21 +0000
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
X-Inumbo-ID: 91c9383c-fec7-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685436861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BEQ4pJzSljiedlksFG62VfASc5LgFXWw4ihzUYYNrDM=;
	b=QCL/dYFaWd3Q8iy9jsljmWcODukXCN5z4yTKT7GOCpUELIS17R9JtP5EunuOUWPa3Z40j5
	qwgXBHCGDJAEJAMrwCyyFE+3tQmMCEzqocU+VnmMq2B3CEhIPlr97uNfkZ9fb6G93ytP7d
	Nc0uxerEBv7k6Hov/P1gri6blVX19Js=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 00/16] tools/xenstore: more cleanups
Date: Tue, 30 May 2023 10:54:02 +0200
Message-Id: <20230530085418.5417-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some more cleanups of Xenstore.

Based on top of the previous Xenstore series "tools/xenstore: rework
internal accounting".

Changes in V2:
- rebase
- one small modification of patch 10
- added patches 11-13

Changes in V3:
- rebase
- modified patch 4
- added patches 10, 11 and 13

Juergen Gross (16):
  tools/xenstore: verify command line parameters better
  tools/xenstore: do some cleanup of hashtable.c
  tools/xenstore: modify interface of create_hashtable()
  tools/xenstore: rename hashtable_insert() and let it return 0 on
    success
  tools/xenstore: make some write limit functions static
  tools/xenstore: switch write limiting to use millisecond time base
  tools/xenstore: remove stale TODO file
  tools/xenstore: remove unused events list
  tools/xenstore: remove support of file backed data base
  tools/libs/store: use xen_list.h instead of xenstore/list.h
  tools/libs/store: make libxenstore independent of utils.h
  tools/xenstore: remove no longer needed functions from xs_lib.c
  tools/xenstore: replace xs_lib.c with a header
  tools/xenstore: split out environment specific live update code
  tools/xenstore: split out rest of live update control code
  tools/xenstore: remove unused stuff from list.h

 .gitignore                                |   1 -
 MAINTAINERS                               |   1 +
 tools/include/xen-tools/xenstore-common.h | 128 +++++
 tools/include/xenstore.h                  |   3 +
 tools/include/xenstore_lib.h              |   3 -
 tools/libs/store/Makefile                 |   4 -
 tools/libs/store/xs.c                     | 131 +++--
 tools/xenstore/COPYING                    | 514 -----------------
 tools/xenstore/Makefile                   |   7 +-
 tools/xenstore/Makefile.common            |  12 +-
 tools/xenstore/TODO                       |  10 -
 tools/xenstore/hashtable.c                |  98 ++--
 tools/xenstore/hashtable.h                |  22 +-
 tools/xenstore/list.h                     | 227 --------
 tools/xenstore/xenstore_client.c          | 133 ++++-
 tools/xenstore/xenstored_control.c        | 661 +---------------------
 tools/xenstore/xenstored_control.h        |   8 -
 tools/xenstore/xenstored_core.c           |  72 +--
 tools/xenstore/xenstored_core.h           |   7 +-
 tools/xenstore/xenstored_domain.c         | 458 ++++++++-------
 tools/xenstore/xenstored_domain.h         |  24 +-
 tools/xenstore/xenstored_lu.c             | 400 +++++++++++++
 tools/xenstore/xenstored_lu.h             |  81 +++
 tools/xenstore/xenstored_lu_daemon.c      | 133 +++++
 tools/xenstore/xenstored_lu_minios.c      | 121 ++++
 tools/xenstore/xenstored_transaction.c    |   4 +-
 tools/xenstore/xenstored_watch.c          |   5 -
 tools/xenstore/xs_lib.c                   | 292 ----------
 tools/xenstore/xs_lib.h                   |  50 --
 tools/xenstore/xs_tdb_dump.c              |  86 ---
 30 files changed, 1409 insertions(+), 2287 deletions(-)
 create mode 100644 tools/include/xen-tools/xenstore-common.h
 delete mode 100644 tools/xenstore/COPYING
 delete mode 100644 tools/xenstore/TODO
 create mode 100644 tools/xenstore/xenstored_lu.c
 create mode 100644 tools/xenstore/xenstored_lu.h
 create mode 100644 tools/xenstore/xenstored_lu_daemon.c
 create mode 100644 tools/xenstore/xenstored_lu_minios.c
 delete mode 100644 tools/xenstore/xs_lib.c
 delete mode 100644 tools/xenstore/xs_lib.h
 delete mode 100644 tools/xenstore/xs_tdb_dump.c

-- 
2.35.3


