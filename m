Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B33B1605E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 14:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063925.1429685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5y0-0001wy-Tx; Wed, 30 Jul 2025 12:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063925.1429685; Wed, 30 Jul 2025 12:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5y0-0001tv-Pn; Wed, 30 Jul 2025 12:31:32 +0000
Received: by outflank-mailman (input) for mailman id 1063925;
 Wed, 30 Jul 2025 12:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txka=2L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uh5qh-0004Wg-JQ
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 12:23:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11a21181-6d40-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 14:23:59 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C0A641F809;
 Wed, 30 Jul 2025 12:23:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8568E1388B;
 Wed, 30 Jul 2025 12:23:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BQjkHt4OimjYJAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 30 Jul 2025 12:23:58 +0000
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
X-Inumbo-ID: 11a21181-6d40-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753878238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nbSw2XSXTnRBMBHQqo318I/HhCGPQCpy7irgifrRtPY=;
	b=loKg8UEjzTdm3AXg/uc6IXjCMFDZEpOIUNyA1efidDvjZoLhDNDcQyo+YmcNPlF6ghBmIE
	q8db9Y6outtFRQbx1BUSeUOIs32jRTk4O7yZMRYwVai+WqFqHcehFnwZvZ3712gqCW6iFf
	kD6LgojmLW+ndowNgpQLppGNzWeOp3M=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753878238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nbSw2XSXTnRBMBHQqo318I/HhCGPQCpy7irgifrRtPY=;
	b=loKg8UEjzTdm3AXg/uc6IXjCMFDZEpOIUNyA1efidDvjZoLhDNDcQyo+YmcNPlF6ghBmIE
	q8db9Y6outtFRQbx1BUSeUOIs32jRTk4O7yZMRYwVai+WqFqHcehFnwZvZ3712gqCW6iFf
	kD6LgojmLW+ndowNgpQLppGNzWeOp3M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v3 9/9] CHANGELOG.md: add xenstorepvh-stubdom live update
Date: Wed, 30 Jul 2025 14:23:05 +0200
Message-ID: <20250730122305.4050-10-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730122305.4050-1-jgross@suse.com>
References: <20250730122305.4050-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.29 / 50.00];
	BAYES_HAM(-2.99)[99.95%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,changelog.md:url,suse.com:email,suse.com:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,xenproject.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.29

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..d118bb1c8c 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -26,6 +26,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Support PCI passthrough for HVM domUs when dom0 is PVH (note SR-IOV
      capability usage is not yet supported on PVH dom0).
    - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
+   - PVH xenstore-stubdom now supports Live Update.
 
  - On Arm:
     - Ability to enable stack protector
-- 
2.43.0


