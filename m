Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD8A614EEE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435064.688100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optuo-0000km-V9; Tue, 01 Nov 2022 16:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435064.688100; Tue, 01 Nov 2022 16:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optuo-0000iB-SB; Tue, 01 Nov 2022 16:15:02 +0000
Received: by outflank-mailman (input) for mailman id 435064;
 Tue, 01 Nov 2022 16:15:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optun-0000i5-EW
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:15:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55b01a07-5a00-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 17:15:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0596D1F8CA;
 Tue,  1 Nov 2022 16:15:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA3621346F;
 Tue,  1 Nov 2022 16:14:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c2X4LwNGYWPndgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:14:59 +0000
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
X-Inumbo-ID: 55b01a07-5a00-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667319300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3vvEwjmy3y2freXdh/Vxr98T44RB5swrhH94wA9YUTQ=;
	b=WEt0KZ68IRo5Lo00mV0sHSFbbeOhYgJsrJvmrKer9qNjr12hHIYf5mrhVtgCP1NvJIqWP+
	VF4sEQFkK5C7+/9eDjd66o6dgXk/Zsr9gtsmlgSz6nrt5pSTjewC30JMQPetzYIm9AV3LT
	srxsWGCWMvoPoiILYurVA4RezMahSQ8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 00/10] tools/xenstore: more cleanups
Date: Tue,  1 Nov 2022 17:14:47 +0100
Message-Id: <20221101161457.8470-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some more cleanups of Xenstore.

Based on top of the previous 2 Xenstore series "tools/xenstore: do some
cleanup and fixes" and the accounting rework series (sorry for the
cut off series header).

Juergen Gross (10):
  tools/xenstore: verify command line parameters better
  tools/xenstore: do some cleanup of hashtable.c
  tools/xenstore: modify interface of create_hashtable()
  tools/xenstore: let hashtable_insert() return 0 on success
  tools/xenstore: make some write limit functions static
  tools/xenstore: switch write limiting to use millisecond time base
  tools/xenstore: remove stale TODO file
  tools/xenstore: remove unused events list
  tools/xenstore: remove support of file backed data base
  tools/xenstore: remove no longer needed functions from xs_lib.c

 tools/libs/store/xs.c                  |  20 ++
 tools/xenstore/Makefile                |   5 +-
 tools/xenstore/TODO                    |  10 -
 tools/xenstore/hashtable.c             | 101 +++---
 tools/xenstore/hashtable.h             |  16 +-
 tools/xenstore/xenstore_client.c       | 129 +++++++
 tools/xenstore/xenstored_core.c        |  51 +--
 tools/xenstore/xenstored_core.h        |   7 +-
 tools/xenstore/xenstored_domain.c      | 458 ++++++++++++-------------
 tools/xenstore/xenstored_domain.h      |  24 +-
 tools/xenstore/xenstored_transaction.c |   4 +-
 tools/xenstore/xenstored_watch.c       |   5 -
 tools/xenstore/xs_lib.c                | 138 --------
 tools/xenstore/xs_lib.h                |  17 -
 tools/xenstore/xs_tdb_dump.c           |  86 -----
 15 files changed, 442 insertions(+), 629 deletions(-)
 delete mode 100644 tools/xenstore/TODO
 delete mode 100644 tools/xenstore/xs_tdb_dump.c

-- 
2.35.3


