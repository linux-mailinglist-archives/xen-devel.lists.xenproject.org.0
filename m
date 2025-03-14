Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D6BA610BE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 13:19:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914507.1320241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt3zu-0006kh-AR; Fri, 14 Mar 2025 12:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914507.1320241; Fri, 14 Mar 2025 12:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt3zu-0006ic-7s; Fri, 14 Mar 2025 12:18:42 +0000
Received: by outflank-mailman (input) for mailman id 914507;
 Fri, 14 Mar 2025 12:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LNZA=WB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tt3zs-0006iW-Jg
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 12:18:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 756b2b07-00ce-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 13:18:38 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F9321F388;
 Fri, 14 Mar 2025 12:18:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2880D13A31;
 Fri, 14 Mar 2025 12:18:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wOdyCJ0e1Ge2CwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 14 Mar 2025 12:18:37 +0000
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
X-Inumbo-ID: 756b2b07-00ce-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741954717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dIoBnEUjssU9tmFGZWOsci8r9U3D2IS7v+YD3geA9sc=;
	b=qUCwLUyI92s7gsBRjaF80S2nw6rcKL/0vfrpvhV8uBLFoJpGK3gPb1hwStt2KOrLr9KWq9
	p28Pjet5VdTFpDTgeNSqXhKvwNP+zfkQ568NDx0g6fmXDVdVWO/DCGgWZAfGp21K9dhNN5
	zo9rpeFmM2L3JJ0gT1/jHT26vGMMgg0=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=qUCwLUyI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741954717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dIoBnEUjssU9tmFGZWOsci8r9U3D2IS7v+YD3geA9sc=;
	b=qUCwLUyI92s7gsBRjaF80S2nw6rcKL/0vfrpvhV8uBLFoJpGK3gPb1hwStt2KOrLr9KWq9
	p28Pjet5VdTFpDTgeNSqXhKvwNP+zfkQ568NDx0g6fmXDVdVWO/DCGgWZAfGp21K9dhNN5
	zo9rpeFmM2L3JJ0gT1/jHT26vGMMgg0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 0/3] xenstored: use new libxenmanage functionality
Date: Fri, 14 Mar 2025 13:18:32 +0100
Message-ID: <20250314121835.1879-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6F9321F388
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

The new libxenmanage interfaces make it possible to:

- detect that a domid has been recycled
- avoid having to query all known domains when one of them has changed
  state

Use those interfaces in xenstored in order to make it more efficient and
failure proof.

Changes in V2:
- new patch 1
- former patch 5 mover earlier, now patch 2 (can go in without the rest
  of the series)
- addressed comments

Changes in V3:
- addressed comments

Changes in V4:
- patches 1 and 3 of V3 dropped, as already committed
- addressed comments

Changes in V5:
- addressed comments

Changes in V6:
- patch 1 of V5 has been committed
- new patches 1-3 for fixing a race and avoiding new races with the
  added functionality (result of a comment by Jan Beulich)
- rework of locking in patch 4 (Jan Beulich)

Changes in V7:
- addressed comments
- rebase

Changes in V8:
- patch 1 of v7 has gone in
- addressed comments
- new patches 7-9 using the new unique_id and xenmanage_poll_changed_domain()

Changes in V9:
- all but the last three patches of v8 have gone in
- addressed comments

Juergen Gross (3):
  docs: update xenstore migration stream definition
  tools/xenstored: use unique_id to identify new domain with same domid
  tools/xenstored: use xenmanage_poll_changed_domain()

 docs/designs/xenstore-migration.md |  18 ++++-
 tools/xenstored/domain.c           | 113 +++++++++++++++++++++++------
 tools/xenstored/xenstore_state.h   |   3 +-
 3 files changed, 110 insertions(+), 24 deletions(-)

-- 
2.43.0


