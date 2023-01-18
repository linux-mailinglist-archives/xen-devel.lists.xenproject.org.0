Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462CD671828
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480308.744638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI55L-0001EF-KF; Wed, 18 Jan 2023 09:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480308.744638; Wed, 18 Jan 2023 09:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI55L-0001C3-H3; Wed, 18 Jan 2023 09:50:23 +0000
Received: by outflank-mailman (input) for mailman id 480308;
 Wed, 18 Jan 2023 09:50:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI55J-0001BV-Sd
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:50:21 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 505f5f5d-9715-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 10:48:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43DD620D41;
 Wed, 18 Jan 2023 09:50:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3162139D2;
 Wed, 18 Jan 2023 09:50:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OVEAOtrAx2MNQwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 09:50:18 +0000
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
X-Inumbo-ID: 505f5f5d-9715-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674035419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zW/FbAtyVDZNOpFhbdoNM3G1fhjM/SXTsI3FkBc+OZw=;
	b=O5jeFAdGW+cPyxe0eE8bSUiJf+j7bN8mWBCcmEwjT339SZnV7eftqfLBaG9q8r10eQkY7R
	gUTdwGIJWGU+orWVbrRzvj3okh2GQUDbis1wIwXuZLMxKEm787bkZw5Ci7/MVTBSwYvxJ2
	Hra3no/eeT5ukXNWhm+ziXIap4P1BJQ=
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
Subject: [PATCH v4 00/17] tools/xenstore: do some cleanup and fixes
Date: Wed, 18 Jan 2023 10:49:59 +0100
Message-Id: <20230118095016.13091-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a first run of post-XSA patches which piled up during the
development phase of all the recent Xenstore related XSA patches.

This is a mixture of small fixes, enhancements and cleanups.

Changes in V4:
- reordered the patches a little bit (patch 4 and patch 17 of V4 have
  been moved)
- addressed comments

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
  tools/xenstore: make log macro globally available
  tools/xenstore: introduce dummy nodes for special watch paths
  tools/xenstore: replace watch->relative_path with a prefix length
  tools/xenstore: move changed domain handling
  tools/xenstore: change per-domain node accounting interface
  tools/xenstore: replace literal domid 0 with dom0_domid
  tools/xenstore: make domain_is_unprivileged() an inline function
  tools/xenstore: let chk_domain_generation() return a bool
  tools/xenstore: don't let hashtable_remove() return the removed value
  tools/xenstore: switch hashtable to use the talloc framework
  tools/xenstore: introduce trace classes
  tools/xenstore: let check_store() check the accounting data
  tools/xenstore: make output of "xenstore-control help" more pretty
  tools/xenstore: don't allow creating too many nodes in a transaction

 docs/misc/xenstore.txt                 |  10 +-
 tools/xenstore/hashtable.c             | 103 ++--
 tools/xenstore/hashtable.h             |   6 +-
 tools/xenstore/talloc.c                |  21 +-
 tools/xenstore/xenstored_control.c     |  36 +-
 tools/xenstore/xenstored_core.c        | 261 +++++++----
 tools/xenstore/xenstored_core.h        |  39 ++
 tools/xenstore/xenstored_domain.c      | 620 +++++++++++++------------
 tools/xenstore/xenstored_domain.h      |  21 +-
 tools/xenstore/xenstored_transaction.c |  76 +--
 tools/xenstore/xenstored_transaction.h |   7 +-
 tools/xenstore/xenstored_watch.c       |  36 +-
 12 files changed, 653 insertions(+), 583 deletions(-)

-- 
2.35.3


