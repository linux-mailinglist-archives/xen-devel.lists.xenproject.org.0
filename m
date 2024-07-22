Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ECB938EF8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 14:17:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761812.1171853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVryF-0005wf-Cj; Mon, 22 Jul 2024 12:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761812.1171853; Mon, 22 Jul 2024 12:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVryF-0005sh-9m; Mon, 22 Jul 2024 12:16:51 +0000
Received: by outflank-mailman (input) for mailman id 761812;
 Mon, 22 Jul 2024 12:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JAiy=OW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sVryD-0005pO-K5
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 12:16:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 448aced4-4824-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 14:16:48 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 34A7321843;
 Mon, 22 Jul 2024 12:16:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC4FB138A7;
 Mon, 22 Jul 2024 12:16:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vDMyOK5NnmYTIQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 22 Jul 2024 12:16:46 +0000
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
X-Inumbo-ID: 448aced4-4824-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721650607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AmTH1bdtVrV51iovoJz8Exw121j4vBzhMUgVftZpBis=;
	b=QT405tGcNsMbcngREX5lFOuaz4Ak0YgpfDPkoDVkBeqGdFUuVhGGEiuJFr1jbTd2aZLf7U
	QcauGptgjwbqwRBzDI99VeLcocynRXkVBCzBqd+hQrLia8+F5BtoIbkkkQW5k2wVtk5P8k
	UejZr9Dzu317WJjbYDIiOTW1pjxklMI=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=QT405tGc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721650607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AmTH1bdtVrV51iovoJz8Exw121j4vBzhMUgVftZpBis=;
	b=QT405tGcNsMbcngREX5lFOuaz4Ak0YgpfDPkoDVkBeqGdFUuVhGGEiuJFr1jbTd2aZLf7U
	QcauGptgjwbqwRBzDI99VeLcocynRXkVBCzBqd+hQrLia8+F5BtoIbkkkQW5k2wVtk5P8k
	UejZr9Dzu317WJjbYDIiOTW1pjxklMI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/3] Mini-OS: tidy up arch/x86/time.c
Date: Mon, 22 Jul 2024 14:16:40 +0200
Message-ID: <20240722121643.18116-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.81 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.com:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 34A7321843
X-Spam-Score: -0.81
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Bar: /

Make arch/x86/time.c coding style compliant, remove some unneeded cruft
and simplify the time keeping logic.

Juergen Gross (3):
  mini-os: apply coding style to arch/x86/time.c
  mini-os: remove some not needed stuff from arch/x86/time.c
  mini-os: simplify monotonic_clock()

 arch/x86/time.c | 188 ++++++++++++++++++------------------------------
 1 file changed, 69 insertions(+), 119 deletions(-)

-- 
2.43.0


