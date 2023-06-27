Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF073FBFA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 14:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556118.868371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE7nY-0000j7-P6; Tue, 27 Jun 2023 12:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556118.868371; Tue, 27 Jun 2023 12:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE7nY-0000fm-Lq; Tue, 27 Jun 2023 12:27:56 +0000
Received: by outflank-mailman (input) for mailman id 556118;
 Tue, 27 Jun 2023 12:27:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EZfr=CP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qE7nW-0000fg-Jj
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 12:27:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09c503ce-14e6-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 14:27:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0B9D021887;
 Tue, 27 Jun 2023 12:27:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF44613462;
 Tue, 27 Jun 2023 12:27:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WV4wKcjVmmQiSAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 27 Jun 2023 12:27:52 +0000
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
X-Inumbo-ID: 09c503ce-14e6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687868873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oS+rJ3FtOvnPFrtRuK/7J1djKwFNaiM+bAdUkXGuDiI=;
	b=SCIcUkkHARF49BiLzlPdGPt9aLV9VKNERvlGtAdNvTBFZ0ZAxre2EBWKcrC4B3r6CKuPLf
	1UWth+8pyo0l+AH2//g0ZpABskZ99cQVpjNC1H7tLoKs1YHtPE7rH+QWOO/a8LwVrEneB0
	dh/aYkaaRXrOH0rZ1ctKAzzUogsiq3M=
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
Subject: [PATCH v4 0/5] tools/xenstore: more cleanups
Date: Tue, 27 Jun 2023 14:27:45 +0200
Message-Id: <20230627122750.2007-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some more cleanups of Xenstore.

Changes in V2:
- rebase
- one small modification of patch 10
- added patches 11-13

Changes in V3:
- rebase
- modified patch 4
- added patches 10, 11 and 13

Changes in V4:
- patches 1-11 already committed
- modified patch 3
- rebased patch 4 after modifying patch 3

Juergen Gross (5):
  tools/xenstore: remove no longer needed functions from xs_lib.c
  tools/xenstore: replace xs_lib.c with a header
  tools/xenstore: split out environment specific live update code
  tools/xenstore: split out rest of live update control code
  tools/xenstore: remove unused stuff from list.h

 MAINTAINERS                               |   1 +
 tools/include/xen-tools/xenstore-common.h | 128 +++++
 tools/include/xenstore.h                  |   3 +
 tools/include/xenstore_lib.h              |   3 -
 tools/libs/store/Makefile                 |   4 -
 tools/libs/store/xs.c                     |  71 ++-
 tools/xenstore/COPYING                    | 514 -----------------
 tools/xenstore/Makefile                   |   2 +-
 tools/xenstore/Makefile.common            |  12 +-
 tools/xenstore/list.h                     | 227 --------
 tools/xenstore/xenstore_client.c          | 133 ++++-
 tools/xenstore/xenstored_control.c        | 661 +---------------------
 tools/xenstore/xenstored_control.h        |   8 -
 tools/xenstore/xenstored_core.c           |  19 +-
 tools/xenstore/xenstored_lu.c             | 408 +++++++++++++
 tools/xenstore/xenstored_lu.h             |  81 +++
 tools/xenstore/xenstored_lu_daemon.c      | 130 +++++
 tools/xenstore/xenstored_lu_minios.c      | 118 ++++
 tools/xenstore/xs_lib.c                   | 292 ----------
 tools/xenstore/xs_lib.h                   |  50 --
 20 files changed, 1085 insertions(+), 1780 deletions(-)
 create mode 100644 tools/include/xen-tools/xenstore-common.h
 delete mode 100644 tools/xenstore/COPYING
 create mode 100644 tools/xenstore/xenstored_lu.c
 create mode 100644 tools/xenstore/xenstored_lu.h
 create mode 100644 tools/xenstore/xenstored_lu_daemon.c
 create mode 100644 tools/xenstore/xenstored_lu_minios.c
 delete mode 100644 tools/xenstore/xs_lib.c
 delete mode 100644 tools/xenstore/xs_lib.h

-- 
2.35.3


