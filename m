Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AFD87A34C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 08:14:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692277.1079229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkIoa-00010E-5H; Wed, 13 Mar 2024 07:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692277.1079229; Wed, 13 Mar 2024 07:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkIoa-0000xr-21; Wed, 13 Mar 2024 07:14:16 +0000
Received: by outflank-mailman (input) for mailman id 692277;
 Wed, 13 Mar 2024 07:14:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dxry=KT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rkIoY-0000xl-Vk
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 07:14:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bc73979-e109-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 08:14:14 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0A64F21B98;
 Wed, 13 Mar 2024 07:14:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BAFCB13977;
 Wed, 13 Mar 2024 07:14:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kyWaK0RS8WWlSAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 13 Mar 2024 07:14:12 +0000
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
X-Inumbo-ID: 4bc73979-e109-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710314053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kxMz5wRYRts6SEKGqAGBVkV0rkhnV3B7oQVvSfAgUd8=;
	b=nj8Bne9hJ+j5/yvQm/rexgklUlFOuMukRu3zd6VSc+1L5d3a/L4osnKJ3W0+g8SaTHiXNH
	Rs7oux9FA9GDxamk3jtETc2hlMzVyZ6gZY31Hs0C/csnKfO5xrkmYdU7vbrVDljMiogmiu
	TPzwDSOY9Q5oJO4d+VI2AVn8pBh6lIw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710314053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kxMz5wRYRts6SEKGqAGBVkV0rkhnV3B7oQVvSfAgUd8=;
	b=nj8Bne9hJ+j5/yvQm/rexgklUlFOuMukRu3zd6VSc+1L5d3a/L4osnKJ3W0+g8SaTHiXNH
	Rs7oux9FA9GDxamk3jtETc2hlMzVyZ6gZY31Hs0C/csnKfO5xrkmYdU7vbrVDljMiogmiu
	TPzwDSOY9Q5oJO4d+VI2AVn8pBh6lIw=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/2] xen: two fixes related to event channels
Date: Wed, 13 Mar 2024 08:14:07 +0100
Message-Id: <20240313071409.25913-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=nj8Bne9h
X-Spamd-Result: default: False [4.66 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.03)[56.12%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 URIBL_BLOCKED(0.00)[suse.com:dkim];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: 4.66
X-Spam-Level: ****
X-Rspamd-Queue-Id: 0A64F21B98
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Two patches fixing one seen problem and another potential one. Both
have been introduced in the 6.7 kernel.

Juergen Gross (2):
  xen/evtchn: avoid WARN() when unbinding an event channel
  xen/events: increment refcnt only if event channel is refcounted

 drivers/xen/events/events_base.c | 22 +++++++++++++---------
 drivers/xen/evtchn.c             |  6 ++++++
 2 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.35.3


