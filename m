Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080C275F360
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 12:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568716.888516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNssc-00034M-2o; Mon, 24 Jul 2023 10:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568716.888516; Mon, 24 Jul 2023 10:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNssb-00031Y-VN; Mon, 24 Jul 2023 10:33:29 +0000
Received: by outflank-mailman (input) for mailman id 568716;
 Mon, 24 Jul 2023 10:33:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNssa-00031Q-Ht
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 10:33:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86724f93-2a0d-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 12:33:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F0DE620661;
 Mon, 24 Jul 2023 10:33:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C1EAB138E8;
 Mon, 24 Jul 2023 10:33:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /c6gLXZTvmRqUAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 10:33:26 +0000
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
X-Inumbo-ID: 86724f93-2a0d-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690194806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tJyUi4rnxrSoqA2GwW6BZTM1LqtefYMHO98BBC1hqes=;
	b=RLrouWu+recz2dsAvQ7BhTj1G3r818p4LhUH/FRpT6xl6q0x5ognBc6toCO2D9KZ/Bw21R
	hoZC+JBjXoNrXL6hxj+YKt9+9Xs3lUtHwrlOltj8HQW0lnX+OWFw8tB/HcN7yV78YqLOmL
	PTWJU3aJZHd/NNAG+ONakeCyVjxfiJM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 0/2] tools/xenstore: fix get_spec_node()
Date: Mon, 24 Jul 2023 12:33:22 +0200
Message-Id: <20230724103324.4207-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small series to fix a bug in get_spec_node().

Patch 1 is turning several function parameters into const in order to
avoid having to cast away the const attribute in get_spec_node().

Patch 2 is the fix, which is a backport candidate.

Changes in V3:
- add get_strings() conversion to const in patch 1

Changes in V2:
- add patch 1, avoiding the need to cast const away in patch 2

Juergen Gross (2):
  tools/xenstore: add const to the return type of  canonicalize()
  tools/xenstore: fix get_spec_node()

 tools/xenstore/xenstored_control.c   | 33 ++++++++++++++--------------
 tools/xenstore/xenstored_core.c      | 31 +++++++++++++++-----------
 tools/xenstore/xenstored_core.h      |  5 +++--
 tools/xenstore/xenstored_domain.c    |  4 ++--
 tools/xenstore/xenstored_lu.c        |  2 +-
 tools/xenstore/xenstored_lu.h        |  4 ++--
 tools/xenstore/xenstored_lu_daemon.c |  2 +-
 tools/xenstore/xenstored_lu_minios.c |  2 +-
 tools/xenstore/xenstored_watch.c     | 14 +++++++-----
 9 files changed, 53 insertions(+), 44 deletions(-)

-- 
2.35.3


