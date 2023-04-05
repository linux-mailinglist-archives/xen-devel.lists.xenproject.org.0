Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7136D74F1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 09:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518228.804531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxBU-0002Hg-6A; Wed, 05 Apr 2023 07:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518228.804531; Wed, 05 Apr 2023 07:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxBU-0002Ez-2E; Wed, 05 Apr 2023 07:03:56 +0000
Received: by outflank-mailman (input) for mailman id 518228;
 Wed, 05 Apr 2023 07:03:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wAG=74=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pjxBS-0002Et-Ox
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 07:03:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 057a42a7-d380-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 09:03:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 95B26204F8;
 Wed,  5 Apr 2023 07:03:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F8F313A31;
 Wed,  5 Apr 2023 07:03:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e+f0EVcdLWRFEwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Apr 2023 07:03:51 +0000
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
X-Inumbo-ID: 057a42a7-d380-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680678231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/ixJC+7prIJuoskG0EIHqu4CVsVfCk74G0QSnhmZDzM=;
	b=h9rvUgdzBA7Hqu85sjtwMNHuaiHefCCwEO4cBTJl1JOo0xqHAY56pYccr5q6+hL8S8o7l6
	1lq5Psheupci+F6672Sv4aetHL273Mw/3QrfDm17//EKW16oGoVyWR3LdNVWOw/qfYhFsW
	oumo0p1Ov8K5U8/KaUR3sTShX4GUxNM=
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
Subject: [PATCH v4 00/13] tools/xenstore: rework internal accounting
Date: Wed,  5 Apr 2023 09:03:36 +0200
Message-Id: <20230405070349.25293-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series reworks the Xenstore internal accounting to use a uniform
generic framework. It is adding some additional useful diagnostic
information, like accounting trace and max. per-domain and global quota
values seen.

Changes in V2:
- added patch 1 (leftover from previous series)
- rebase

Changes in V3:
- addressed comments

Changes in V4:
- fixed patch 3

Juergen Gross (13):
  tools/xenstore: take transaction internal nodes into account for quota
  tools/xenstore: manage per-transaction domain accounting data in an
    array
  tools/xenstore: introduce accounting data array for per-domain values
  tools/xenstore: add framework to commit accounting data on success
    only
  tools/xenstore: use accounting buffering for node accounting
  tools/xenstore: add current connection to domain_memory_add()
    parameters
  tools/xenstore: use accounting data array for per-domain values
  tools/xenstore: add accounting trace support
  tools/xenstore: add TDB access trace support
  tools/xenstore: switch transaction accounting to generic accounting
  tools/xenstore: remember global and per domain max accounting values
  tools/xenstore: use generic accounting for remaining quotas
  tools/xenstore: switch quota management to be table based

 docs/misc/xenstore.txt                 |   5 +-
 tools/xenstore/xenstored_control.c     |  65 ++--
 tools/xenstore/xenstored_core.c        | 168 +++++-----
 tools/xenstore/xenstored_core.h        |  24 +-
 tools/xenstore/xenstored_domain.c      | 433 ++++++++++++++++++-------
 tools/xenstore/xenstored_domain.h      |  60 +++-
 tools/xenstore/xenstored_transaction.c |  22 +-
 tools/xenstore/xenstored_watch.c       |  15 +-
 8 files changed, 514 insertions(+), 278 deletions(-)

-- 
2.35.3


