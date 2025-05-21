Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E55ABEB05
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 06:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991424.1375273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHbLu-0005Fk-PQ; Wed, 21 May 2025 04:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991424.1375273; Wed, 21 May 2025 04:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHbLu-0005Cl-Mg; Wed, 21 May 2025 04:46:50 +0000
Received: by outflank-mailman (input) for mailman id 991424;
 Wed, 21 May 2025 04:46:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+DYs=YF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uHbLt-0005Cf-4L
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 04:46:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 985c1c57-35fe-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 06:46:44 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AFF1A1F80D;
 Wed, 21 May 2025 04:46:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FF8D13888;
 Wed, 21 May 2025 04:46:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wbscHrNaLWiFcwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 21 May 2025 04:46:43 +0000
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
X-Inumbo-ID: 985c1c57-35fe-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1747802803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4LD3xUYS24gqoaD7izcrJ/OOVTdERldPlgZ46C6o/Uw=;
	b=EXz1NM9FsC4DftFDJL9USwLAVnGKFehlINXVHTIWVsuYfvaHiC7mPSPg17neAxRzj7EecO
	odrb+Kn10DG0Ksv63nwCT8yfDkBZWQw78Rw7tnOXbibn9d+IMHV5w0RyvjEUg2ADbUbQIb
	OuAlVpGMJ8ewLJWVNeFfgfbJAk8XA+4=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=EXz1NM9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1747802803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4LD3xUYS24gqoaD7izcrJ/OOVTdERldPlgZ46C6o/Uw=;
	b=EXz1NM9FsC4DftFDJL9USwLAVnGKFehlINXVHTIWVsuYfvaHiC7mPSPg17neAxRzj7EecO
	odrb+Kn10DG0Ksv63nwCT8yfDkBZWQw78Rw7tnOXbibn9d+IMHV5w0RyvjEUg2ADbUbQIb
	OuAlVpGMJ8ewLJWVNeFfgfbJAk8XA+4=
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
Subject: [PATCH 0/2] SUPPORT.md: update the xenstore support state
Date: Wed, 21 May 2025 06:46:32 +0200
Message-ID: <20250521044634.11361-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.99 / 50.00];
	BAYES_HAM(-2.98)[99.90%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -2.99
X-Rspamd-Queue-Id: AFF1A1F80D
X-Spam-Level: 
X-Spam-Flag: NO

Two updates regarding C Xenstore support.

Juergen Gross (2):
  SUPPORT.md: add xenstore stubdom as supported
  SUPPORT.md: mark xenstore live update as supported

 SUPPORT.md | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.43.0


