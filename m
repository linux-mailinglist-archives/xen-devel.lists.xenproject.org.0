Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF997F2951
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 10:50:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637625.993600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NOL-00084z-QE; Tue, 21 Nov 2023 09:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637625.993600; Tue, 21 Nov 2023 09:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NOL-0007zd-MT; Tue, 21 Nov 2023 09:50:01 +0000
Received: by outflank-mailman (input) for mailman id 637625;
 Tue, 21 Nov 2023 09:50:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5NOK-0007zB-UZ
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 09:50:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54082444-8853-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 10:49:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4979E1F8A8;
 Tue, 21 Nov 2023 09:49:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 125D8138E3;
 Tue, 21 Nov 2023 09:49:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yl2SAkR9XGVANQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 09:49:56 +0000
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
X-Inumbo-ID: 54082444-8853-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700560196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ylFzla17ZuFkKrStBDr86fu1z6MjOBaS8pzO54PvtZw=;
	b=HaIPAVDr8RG17bKJyvCYWq7J3D6WgQ6SyKtbExR1DrQtsmJgXHtlunw6z3SkZD16ASaY3v
	E+LKUolngUzh9stF/g7xOKiTxiDMqlzta+j+qzzV2aVkY7M/lzs+jJU6sS7bsDJJaTwV3E
	6J3bMuXtMTbIS66GVqta+hGFvntBCnU=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/5] Mini-OS: preparations for 9pfs in xenstore-stubdom
Date: Tue, 21 Nov 2023 10:49:48 +0100
Message-Id: <20231121094953.22430-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: **
X-Spam-Score: 2.51
X-Spamd-Result: default: False [2.51 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.19)[89.10%]
X-Spam-Flag: NO

This small patch series is doing some preparations for being able to
use 9pfs in Xenstore-stubdom.

Changes in V2:
- added patches 2 and 5

Changes in V3:
- rename function to get own domid (patch 2)

Juergen Gross (5):
  Mini-OS: make xenstore_buf externally visible
  Mini-OS: get own domid
  Mini-OS: don't crash if no shutdown node is available
  Mini-OS: fix 9pfs stat receive format
  Mini-OS: fix 9pfs response receiving

 9pfront.c        | 13 ++++++++-----
 events.c         | 33 +++++++++++++++++++++++++++++++++
 include/lib.h    |  3 +++
 include/xenbus.h |  2 ++
 shutdown.c       | 12 ++++--------
 xenbus.c         |  2 +-
 6 files changed, 51 insertions(+), 14 deletions(-)

-- 
2.35.3


