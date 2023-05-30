Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DCB7159A2
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540958.843153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vQA-0006uF-IW; Tue, 30 May 2023 09:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540958.843153; Tue, 30 May 2023 09:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vQA-0006rk-F4; Tue, 30 May 2023 09:13:38 +0000
Received: by outflank-mailman (input) for mailman id 540958;
 Tue, 30 May 2023 09:13:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3vQ9-0006nv-Ea
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:13:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41f66420-feca-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 11:13:36 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 014D221AC5;
 Tue, 30 May 2023 09:13:36 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C5D131341B;
 Tue, 30 May 2023 09:13:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 1hfbLj++dWS+IgAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 09:13:35 +0000
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
X-Inumbo-ID: 41f66420-feca-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685438016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mn65uEelHtTfjq/hMbF7r3S9j3iWMNwjFkqnoEoOaTA=;
	b=oqZQt4tfc2gqo1/66UrJp6T5y06BuWYUZ5t+70WtONLk69XC4wBswFwdi8uFrgvIfYJ1hg
	OmW1HZEKxVc1Mkff6QCnbosJJywVTJobniazxphvRAqeesSklxovpYVV/kuSb96+vgdkm2
	7ENx2tFsMxej6gCdvnGX9pLcUapuw8c=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 00/11] tools/xenstore: drop TDB
Date: Tue, 30 May 2023 11:13:22 +0200
Message-Id: <20230530091333.7678-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using TDB for storing the Xenstore nodes is adding more complexity
instead of removing it. With keeping the data in memory only, the main
reason for using TDB has disappeared.

This series is replacing TDB with a hashlist referencing directly
individually allocated Xenstore nodes.

The series is based on:
- V6 of my "tools/xenstore: rework internal accounting" series
- V3 of my "tools/xenstore: more cleanups" series

Juergen Gross (11):
  tools/xenstore: explicitly specify create or modify for tdb_store()
  tools/xenstore: replace key in struct node with data base name
  tools/xenstore: let transaction_prepend() return the name for access
  tools/xenstore: rename do_tdb_delete() and change parameter type
  tools/xenstore: rename do_tdb_write() and change parameter type
  tools/xenstore: switch get_acc_data() to use name instead of key
  tools/xenstore: add wrapper for tdb_fetch()
  tools/xenstore: make hashtable key and value parameters const
  tools/xenstore: add hashtable_replace() function
  tools/xenstore: drop use of tdb
  tools/xenstore: remove tdb code

 tools/xenstore/Makefile.common         |    2 +-
 tools/xenstore/hashtable.c             |   57 +-
 tools/xenstore/hashtable.h             |   20 +-
 tools/xenstore/tdb.c                   | 1748 ------------------------
 tools/xenstore/tdb.h                   |  132 --
 tools/xenstore/xenstored_core.c        |  274 ++--
 tools/xenstore/xenstored_core.h        |   28 +-
 tools/xenstore/xenstored_domain.c      |    4 +-
 tools/xenstore/xenstored_transaction.c |   80 +-
 tools/xenstore/xenstored_transaction.h |    5 +-
 10 files changed, 250 insertions(+), 2100 deletions(-)
 delete mode 100644 tools/xenstore/tdb.c
 delete mode 100644 tools/xenstore/tdb.h

-- 
2.35.3


