Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769A18FDE4D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 07:48:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735891.1141996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF5ye-0006Fk-Vh; Thu, 06 Jun 2024 05:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735891.1141996; Thu, 06 Jun 2024 05:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF5ye-0006DJ-SJ; Thu, 06 Jun 2024 05:47:56 +0000
Received: by outflank-mailman (input) for mailman id 735891;
 Thu, 06 Jun 2024 05:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OoW9=NI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sF5yc-0006DD-V0
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 05:47:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 502ca8ec-23c8-11ef-b4bb-af5377834399;
 Thu, 06 Jun 2024 07:47:52 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3DD591F8A3;
 Thu,  6 Jun 2024 05:47:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8637513A7B;
 Thu,  6 Jun 2024 05:47:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RHutHIZNYWbSMgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 06 Jun 2024 05:47:50 +0000
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
X-Inumbo-ID: 502ca8ec-23c8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1717652871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HJD9NQU4GT2PqKcUt8lgFTWuNUHKLP/7bYpY6Dky8iA=;
	b=Pud4WLzeP7Kt3B/B5ROkKS9x86OXynbB+r8fq6Aq77WBJKnoBHsS+GGLJvkTOh+CMgdU+0
	y+yLR1koUfKl1bQ8LnJDsrVFWxWVY2ZuI6QrLg5kXxLSUtKaFN0ZVKabBTC8P3uEe47V0D
	Z9hpqp2nYuPxnChCO6krWmNYfkBoecQ=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Pud4WLze
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1717652871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HJD9NQU4GT2PqKcUt8lgFTWuNUHKLP/7bYpY6Dky8iA=;
	b=Pud4WLzeP7Kt3B/B5ROkKS9x86OXynbB+r8fq6Aq77WBJKnoBHsS+GGLJvkTOh+CMgdU+0
	y+yLR1koUfKl1bQ8LnJDsrVFWxWVY2ZuI6QrLg5kXxLSUtKaFN0ZVKabBTC8P3uEe47V0D
	Z9hpqp2nYuPxnChCO6krWmNYfkBoecQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: add an entry for tools/9pfsd
Date: Thu,  6 Jun 2024 07:47:44 +0200
Message-Id: <20240606054745.23555-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-0.28 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	BAYES_HAM(-0.27)[74.15%];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -0.28
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 3DD591F8A3
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Add me as the maintainer for the tools/9pfsd directory.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 076cf1e141..28fb35582b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -206,6 +206,12 @@ Maintainers List (try to look for most precise areas first)
 
 		-----------------------------------
 
+9PFSD
+M:	Juergen Gross <jgross@suse.com>
+M:	Anthony PERARD <anthony.perard@citrix.com>
+S:	Supported
+F:	tools/9pfsd
+
 ACPI
 M:	Jan Beulich <jbeulich@suse.com>
 S:	Supported
-- 
2.35.3


