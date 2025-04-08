Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E43CA80816
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 14:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941968.1341331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28H1-0008Si-S6; Tue, 08 Apr 2025 12:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941968.1341331; Tue, 08 Apr 2025 12:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28H1-0008QG-OH; Tue, 08 Apr 2025 12:41:51 +0000
Received: by outflank-mailman (input) for mailman id 941968;
 Tue, 08 Apr 2025 12:41:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ii8P=W2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u28BP-0003x9-Sa
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 12:36:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08a8e265-1476-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 14:36:03 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F8A71F388;
 Tue,  8 Apr 2025 12:36:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0D4713691;
 Tue,  8 Apr 2025 12:36:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Evq+KTIY9WdJIgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 08 Apr 2025 12:36:02 +0000
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
X-Inumbo-ID: 08a8e265-1476-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744115763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z9A+fu0CkA24A42L4jKEcCYh+ApxXI6+jMZ38aW5FWI=;
	b=vR5LiNRu4Rzv2zX1WFu1cihY+gbDn7/3B3vt1TbAZ8ju3jfWc/h95N0zraMXhjH577Wpwx
	QYu20l6YbsnByHB318VWn45l2i3XrbF1jvJnoGCnNRoChhYq5xRsumxekKEvGIcgxGIgXu
	Cn+qxFGQHkQKS24drLAaiCzBAAi7TOs=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744115763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z9A+fu0CkA24A42L4jKEcCYh+ApxXI6+jMZ38aW5FWI=;
	b=vR5LiNRu4Rzv2zX1WFu1cihY+gbDn7/3B3vt1TbAZ8ju3jfWc/h95N0zraMXhjH577Wpwx
	QYu20l6YbsnByHB318VWn45l2i3XrbF1jvJnoGCnNRoChhYq5xRsumxekKEvGIcgxGIgXu
	Cn+qxFGQHkQKS24drLAaiCzBAAi7TOs=
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
Subject: [PATCH v2 6/6] build: don't require full tools build for building stubdoms
Date: Tue,  8 Apr 2025 14:35:24 +0200
Message-ID: <20250408123526.14613-7-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408123526.14613-1-jgross@suse.com>
References: <20250408123526.14613-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLme6mccyyenyxxgt1bwti8hnf)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

With the drop of qemu-traditional "make stubdom" no longer requires
"make tools" to have finished.

It is enough to add "install-tools-public-headers" as a prereq of
"install-stubdom".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c9d80a6dc6..67b71ac3d4 100644
--- a/Makefile
+++ b/Makefile
@@ -147,7 +147,7 @@ install-tools: install-tools-public-headers
 	$(MAKE) -C tools install
 
 .PHONY: install-stubdom
-install-stubdom: mini-os-dir install-tools
+install-stubdom: mini-os-dir install-tools-public-headers
 	$(MAKE) -C stubdom install
 ifeq (x86_64,$(XEN_TARGET_ARCH))
 	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom install-grub-if-enabled
-- 
2.43.0


