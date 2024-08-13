Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518059506D7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 15:42:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776266.1186399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdrmo-00052H-Gn; Tue, 13 Aug 2024 13:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776266.1186399; Tue, 13 Aug 2024 13:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdrmo-00050H-Dw; Tue, 13 Aug 2024 13:42:06 +0000
Received: by outflank-mailman (input) for mailman id 776266;
 Tue, 13 Aug 2024 13:42:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k7wN=PM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sdrmm-0004yQ-N1
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 13:42:04 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1972db3-5979-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 15:42:03 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E2046203BA;
 Tue, 13 Aug 2024 13:42:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A01B013ABD;
 Tue, 13 Aug 2024 13:42:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4sCUJahiu2bCGQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 13 Aug 2024 13:42:00 +0000
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
X-Inumbo-ID: d1972db3-5979-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1723556521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hF+OGWJrQJvuR+qcRSbi6yy6oljPmXgdG1p+2bNu0eg=;
	b=GlUkpc+SDQ8DoviphByThx8I8B2T1hO1mCT76kq7+K7bLQpoyJn4pmoEsB17n7srnT+YSB
	a+/0QieDUpXNfjPX4eUlZJ8Ff25buIi58r4deV52FtxV+joqmUsngnwe2s4IaOxD0S/qXe
	ZiOzUaC/UCStSWEnCRpNMD47y809yMA=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Ub51uOEJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1723556520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hF+OGWJrQJvuR+qcRSbi6yy6oljPmXgdG1p+2bNu0eg=;
	b=Ub51uOEJtCDkXW8U4f1enhb5aNfKJFBW7MzbiECWmBv5h+6N3mEvSKkBLkuaD05I5E1r9s
	+hZ3O78PTPt9/19atlxE/oYPFUGj5qt8AddaTIjCYqTfLmdfIMc6ZyILANYR2lV45NEQxT
	uJNZARn4E22UWDIAKtimA0sGhbiVyrA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/3] mini-os: mm: use a generic page table walker
Date: Tue, 13 Aug 2024 15:41:55 +0200
Message-ID: <20240813134158.580-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: E2046203BA
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO

Instead of open coding a page table walk multiple times, use a generic
page table walker instead.

This new page table walker will be used later for kexec support, too.

Changes in V2:
- addressed comments

Juergen Gross (3):
  mini-os: mm: introduce generic page table walk function
  mini-os: mm: switch need_pgt() to use walk_pt()
  mini-os: mm: convert set_readonly() to use walk_pt()

 arch/x86/mm.c | 353 +++++++++++++++++++++++++++++---------------------
 1 file changed, 204 insertions(+), 149 deletions(-)

-- 
2.43.0


