Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8943764B91D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:01:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460721.718685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57i7-0001gW-MC; Tue, 13 Dec 2022 16:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460721.718685; Tue, 13 Dec 2022 16:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57i7-0001dz-Ip; Tue, 13 Dec 2022 16:00:51 +0000
Received: by outflank-mailman (input) for mailman id 460721;
 Tue, 13 Dec 2022 16:00:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p57i5-0001dt-MT
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:00:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f171b34-7aff-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 17:00:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CC7CF229CF;
 Tue, 13 Dec 2022 16:00:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 89475138EE;
 Tue, 13 Dec 2022 16:00:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Tm8tIK+hmGNMKQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 16:00:47 +0000
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
X-Inumbo-ID: 4f171b34-7aff-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670947247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LeNFgbvb0DVGs4PJBV5NvbNyxzLEE2RrqXxEx521iMk=;
	b=QT9nsQw4DPKeyAx/SSETsMlnbhpUCqVFh0xtdizNH+7qrw1mDuLHniAtmzpU6TZXjICWxx
	y3JZ3ET5vz0v89Q6oCe8p9nlrtvv9OUmmbvIR181yAsoFPnBWBoQSJgc3m6bzq4P5GjaHR
	EFhg37X8Db5nry4+HVIaT5N7MpvtSV8=
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
Subject: [PATCH v2 00/19] tools/xenstore: do some cleanup and fixes
Date: Tue, 13 Dec 2022 17:00:26 +0100
Message-Id: <20221213160045.28170-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a first run of post-XSA patches which piled up during the
development phase of all the recent Xenstore related XSA patches.

At least the first 5 patches are completely independent from each
other. After those the dependencies are starting to be more complex.

This is a mixture of small fixes, enhancements and cleanups.

Changes in V2:
- patches 1+2 of V1 have been applied already
- addressed comments
- new patch 19

Juergen Gross (19):
  tools/xenstore: let talloc_free() preserve errno
  tools/xenstore: let tdb_logger() preserve errno
  tools/xenstore: preserve errno across corrupt()
  tools/xenstore: remove all watches when a domain has stopped
  tools/xenstore: enhance hashtable implementation
  tools/xenstore: add hashlist for finding struct domain by domid
  tools/xenstore: introduce dummy nodes for special watch paths
  tools/xenstore: replace watch->relative_path with a prefix length
  tools/xenstore: move changed domain handling
  tools/xenstore: change per-domain node accounting interface
  tools/xenstore: don't allow creating too many nodes in a transaction
  tools/xenstore: replace literal domid 0 with dom0_domid
  tools/xenstore: make domain_is_unprivileged() an inline function
  tools/xenstore: let chk_domain_generation() return a bool
  tools/xenstore: switch hashtable to use the talloc framework
  tools/xenstore: make log macro globally available
  tools/xenstore: introduce trace classes
  tools/xenstore: let check_store() check the accounting data
  tools/xenstore: make output of "xenstore-control help" more pretty

 docs/misc/xenstore.txt                 |  10 +-
 tools/xenstore/hashtable.c             | 134 +++---
 tools/xenstore/hashtable.h             |  38 +-
 tools/xenstore/talloc.c                |  21 +-
 tools/xenstore/xenstored_control.c     |  36 +-
 tools/xenstore/xenstored_core.c        | 259 +++++++----
 tools/xenstore/xenstored_core.h        |  31 ++
 tools/xenstore/xenstored_domain.c      | 609 +++++++++++++------------
 tools/xenstore/xenstored_domain.h      |  21 +-
 tools/xenstore/xenstored_transaction.c |  76 +--
 tools/xenstore/xenstored_transaction.h |   7 +-
 tools/xenstore/xenstored_watch.c       |  44 +-
 12 files changed, 707 insertions(+), 579 deletions(-)

-- 
2.35.3


