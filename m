Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46280614E4D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 16:29:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434828.687449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optC7-0007E0-1W; Tue, 01 Nov 2022 15:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434828.687449; Tue, 01 Nov 2022 15:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optC6-0007CS-TM; Tue, 01 Nov 2022 15:28:50 +0000
Received: by outflank-mailman (input) for mailman id 434828;
 Tue, 01 Nov 2022 15:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optC5-0007Bd-I5
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 15:28:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e05594c4-59f9-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 16:28:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 314A31F8CA;
 Tue,  1 Nov 2022 15:28:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D2E571346F;
 Tue,  1 Nov 2022 15:28:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ThsDMi07YWN1YAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 15:28:45 +0000
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
X-Inumbo-ID: e05594c4-59f9-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667316526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=c13kZx4t7oIwcvFXUwofop8wzkLiv8F8bFXwr4LDykE=;
	b=ZwU7LG4N0W8RZv4f67SQM9jYKLhE6wUiUdYJNo1l6uJz8lCATPDnBn5YASf2sVPZqd4ows
	9+AFckU0uZiQUXRSYHJ9lOd7Gt9RYY7sTa/y/ewUfPtEkFpK8FnZkHTm1gVGqGONe1vRsV
	/KSRxSneA+NV9vhd73BdUjFrzRdTVGQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 00/20] tools/xenstore: do some cleanup and fixes
Date: Tue,  1 Nov 2022 16:28:22 +0100
Message-Id: <20221101152842.4257-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a first run of post-XSA patches which piled up during the
development phase of all the recent Xenstore related XSA patches.

At least the first 7 patches are completely independent from each
other. After those the dependencies are starting to be more complex.

This is a mixture of small fixes, enhancements and cleanups. Patch 2
was initially part of the XSA patches, which is the reason for having
a "Reviewed-by:" tag already. Even with fixing a previous commit it is
not urgent to put this patch in, so I don't think this is 4.17
material.

Juergen Gross (20):
  tools/xenstore: remove XEN_LIB_STORED and XENSTORED_ROOTDIR
  tools/xenstore: call remove_domid_from_perm() for special nodes
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

 config/Paths.mk.in                            |   1 -
 configure                                     |   4 -
 docs/configure                                |   4 -
 docs/misc/xenstore.txt                        |  18 +-
 m4/paths.m4                                   |   3 -
 tools/configure                               |   7 +-
 tools/configure.ac                            |   1 -
 tools/hotplug/FreeBSD/rc.d/xencommons.in      |   6 -
 tools/hotplug/Linux/systemd/Makefile          |   1 -
 .../Linux/systemd/var-lib-xenstored.mount.in  |  12 -
 tools/libs/store/Makefile                     |   1 -
 tools/xenstore/.gdbinit                       |   4 -
 tools/xenstore/Makefile                       |   4 -
 tools/xenstore/Makefile.common                |   1 -
 tools/xenstore/hashtable.c                    | 134 ++--
 tools/xenstore/hashtable.h                    |  38 +-
 tools/xenstore/talloc.c                       |  25 +-
 tools/xenstore/xenstored_control.c            |  44 +-
 tools/xenstore/xenstored_core.c               | 223 ++++---
 tools/xenstore/xenstored_core.h               |  31 +
 tools/xenstore/xenstored_domain.c             | 596 ++++++++++--------
 tools/xenstore/xenstored_domain.h             |  21 +-
 tools/xenstore/xenstored_transaction.c        |  76 +--
 tools/xenstore/xenstored_transaction.h        |   7 +-
 tools/xenstore/xenstored_watch.c              |  43 +-
 tools/xenstore/xs_lib.c                       |  11 +-
 26 files changed, 707 insertions(+), 609 deletions(-)
 delete mode 100644 tools/hotplug/Linux/systemd/var-lib-xenstored.mount.in
 delete mode 100644 tools/xenstore/.gdbinit

-- 
2.35.3


