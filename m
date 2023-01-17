Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A9966D964
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:11:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479126.742755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi0A-00074T-Eu; Tue, 17 Jan 2023 09:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479126.742755; Tue, 17 Jan 2023 09:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi0A-00072B-CA; Tue, 17 Jan 2023 09:11:30 +0000
Received: by outflank-mailman (input) for mailman id 479126;
 Tue, 17 Jan 2023 09:11:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uRIs=5O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pHi08-000725-BC
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:11:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec2196dd-9646-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 10:11:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D94C338217;
 Tue, 17 Jan 2023 09:11:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9443E1390C;
 Tue, 17 Jan 2023 09:11:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /2/HIj5mxmPJbwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 17 Jan 2023 09:11:26 +0000
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
X-Inumbo-ID: ec2196dd-9646-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673946686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UxfCHPYnY8JNBlbyj3Vhxrb9ea3aVDnNMLeEgN1l8tQ=;
	b=iddew9XXzsl5iqO9bfkgy3Up85ClX7/1Rd0B6hRWg2LwyXwiAlzLwPUM/z3NSF0uPC1++r
	v/E8hWc+4T3kT71AEsRVXZsJCjk+Fmnxkyo0kxYf5HLuLXG/jd6tv74PCvKkG3WnhXw8g7
	K3UmNdvs9VvW/dOzbwRId5/QuumNpA4=
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
Subject: [PATCH v3 00/17] tools/xenstore: do some cleanup and fixes
Date: Tue, 17 Jan 2023 10:11:07 +0100
Message-Id: <20230117091124.22170-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a first run of post-XSA patches which piled up during the
development phase of all the recent Xenstore related XSA patches.

At least the first 5 patches are completely independent from each
other. After those the dependencies are starting to be more complex.

This is a mixture of small fixes, enhancements and cleanups.

Changes in V3:
- patches 2, 3, and 5 of V2 have been applied already
- new patch 12
- addressed comments

Changes in V2:
- patches 1+2 of V1 have been applied already
- addressed comments
- new patch 19

Juergen Gross (17):
  tools/xenstore: let talloc_free() preserve errno
  tools/xenstore: remove all watches when a domain has stopped
  tools/xenstore: add hashlist for finding struct domain by domid
  tools/xenstore: introduce dummy nodes for special watch paths
  tools/xenstore: replace watch->relative_path with a prefix length
  tools/xenstore: move changed domain handling
  tools/xenstore: change per-domain node accounting interface
  tools/xenstore: don't allow creating too many nodes in a transaction
  tools/xenstore: replace literal domid 0 with dom0_domid
  tools/xenstore: make domain_is_unprivileged() an inline function
  tools/xenstore: let chk_domain_generation() return a bool
  tools/xenstore: don't let hashtable_remove() return the removed value
  tools/xenstore: switch hashtable to use the talloc framework
  tools/xenstore: make log macro globally available
  tools/xenstore: introduce trace classes
  tools/xenstore: let check_store() check the accounting data
  tools/xenstore: make output of "xenstore-control help" more pretty

 docs/misc/xenstore.txt                 |  10 +-
 tools/xenstore/hashtable.c             | 104 ++---
 tools/xenstore/hashtable.h             |   7 +-
 tools/xenstore/talloc.c                |  21 +-
 tools/xenstore/xenstored_control.c     |  36 +-
 tools/xenstore/xenstored_core.c        | 266 +++++++----
 tools/xenstore/xenstored_core.h        |  31 ++
 tools/xenstore/xenstored_domain.c      | 620 +++++++++++++------------
 tools/xenstore/xenstored_domain.h      |  21 +-
 tools/xenstore/xenstored_transaction.c |  76 +--
 tools/xenstore/xenstored_transaction.h |   7 +-
 tools/xenstore/xenstored_watch.c       |  36 +-
 12 files changed, 652 insertions(+), 583 deletions(-)

-- 
2.35.3


