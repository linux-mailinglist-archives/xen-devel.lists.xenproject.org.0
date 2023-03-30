Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F446CFF0C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 10:50:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516498.800686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnz9-0005Si-JP; Thu, 30 Mar 2023 08:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516498.800686; Thu, 30 Mar 2023 08:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnz9-0005R1-Gf; Thu, 30 Mar 2023 08:50:19 +0000
Received: by outflank-mailman (input) for mailman id 516498;
 Thu, 30 Mar 2023 08:50:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1phnz7-0005Qp-VF
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 08:50:18 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e335ad5c-ced7-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 10:50:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 28EB51FEA2;
 Thu, 30 Mar 2023 08:50:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3CF4138FF;
 Thu, 30 Mar 2023 08:50:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v97jNUVNJWTGIgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Mar 2023 08:50:13 +0000
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
X-Inumbo-ID: e335ad5c-ced7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680166214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Ogccndl2v1UR67f4S1y8WmCiYTytNq5Lwn9uMMjXMbQ=;
	b=SWY5Eadl14irp9VNfMrTPDKOkwsGV/LwVm54IaGuN/n4Frxs+0sHPj0QybD5D6doUOLXaQ
	wjBnSXMJPCT/+uHEsPrr5yI9MUSIgdMP3fMZJUmViuAJJ/QL1VJIYaukLrhgn64850MXXZ
	NNcw6W7NzvzouOTesK/6jsTTlKqDe6g=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 00/13] tools/xenstore: more cleanups
Date: Thu, 30 Mar 2023 10:49:58 +0200
Message-Id: <20230330085011.9170-1-jgross@suse.com>
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

Juergen Gross (13):
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
  tools/xenstore: split out environment specific live update code
  tools/xenstore: split out rest of live update control code
  tools/xenstore: remove unused stuff from list.h

 tools/include/xenstore.h               |   3 +
 tools/include/xenstore_lib.h           |   3 -
 tools/libs/store/xs.c                  |  38 ++
 tools/xenstore/Makefile                |   5 +-
 tools/xenstore/Makefile.common         |  10 +-
 tools/xenstore/TODO                    |  10 -
 tools/xenstore/hashtable.c             |  98 ++--
 tools/xenstore/hashtable.h             |  16 +-
 tools/xenstore/list.h                  | 227 ---------
 tools/xenstore/xenstore_client.c       | 129 +++++
 tools/xenstore/xenstored_control.c     | 657 +------------------------
 tools/xenstore/xenstored_control.h     |   8 -
 tools/xenstore/xenstored_core.c        |  52 +-
 tools/xenstore/xenstored_core.h        |   7 +-
 tools/xenstore/xenstored_domain.c      | 458 +++++++++--------
 tools/xenstore/xenstored_domain.h      |  24 +-
 tools/xenstore/xenstored_lu.c          | 401 +++++++++++++++
 tools/xenstore/xenstored_lu.h          |  81 +++
 tools/xenstore/xenstored_lu_daemon.c   | 132 +++++
 tools/xenstore/xenstored_lu_minios.c   | 121 +++++
 tools/xenstore/xenstored_transaction.c |   4 +-
 tools/xenstore/xenstored_watch.c       |   5 -
 tools/xenstore/xs_lib.c                | 156 ------
 tools/xenstore/xs_lib.h                |  17 -
 tools/xenstore/xs_tdb_dump.c           |  86 ----
 25 files changed, 1204 insertions(+), 1544 deletions(-)
 delete mode 100644 tools/xenstore/TODO
 create mode 100644 tools/xenstore/xenstored_lu.c
 create mode 100644 tools/xenstore/xenstored_lu.h
 create mode 100644 tools/xenstore/xenstored_lu_daemon.c
 create mode 100644 tools/xenstore/xenstored_lu_minios.c
 delete mode 100644 tools/xenstore/xs_tdb_dump.c

-- 
2.35.3


