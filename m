Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98763937752
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 13:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761035.1171010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUm9P-0007ZV-Mf; Fri, 19 Jul 2024 11:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761035.1171010; Fri, 19 Jul 2024 11:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUm9P-0007WN-Ju; Fri, 19 Jul 2024 11:51:51 +0000
Received: by outflank-mailman (input) for mailman id 761035;
 Fri, 19 Jul 2024 11:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=17VY=OT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sUm9O-0007WF-9F
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 11:51:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4743ee39-45c5-11ef-8776-851b0ebba9a2;
 Fri, 19 Jul 2024 13:51:48 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FA461F7A2;
 Fri, 19 Jul 2024 11:51:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D98D132CB;
 Fri, 19 Jul 2024 11:51:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id urfSAVNTmmaycQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 19 Jul 2024 11:51:47 +0000
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
X-Inumbo-ID: 4743ee39-45c5-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721389907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FpTczX37OVAfgSdS0MCnHxjXTVgI4wTVfVGCzuAsGD0=;
	b=E9v2vZIlbOUCNyLdK3sUXpo0857aHhmi0hB5Pu4oQi4hG7xNWkDzmm2FbsEBlQbXwLMl4e
	NFEUM4C0MmCTIxYKHzI2zJpYmiajAuPr1NgORoJc9r3TebUdmETXbbnvAtEoY7iBM6rBb8
	l5AuvGbGNF6hz91AGll070fFG//yYCo=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=E9v2vZIl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721389907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FpTczX37OVAfgSdS0MCnHxjXTVgI4wTVfVGCzuAsGD0=;
	b=E9v2vZIlbOUCNyLdK3sUXpo0857aHhmi0hB5Pu4oQi4hG7xNWkDzmm2FbsEBlQbXwLMl4e
	NFEUM4C0MmCTIxYKHzI2zJpYmiajAuPr1NgORoJc9r3TebUdmETXbbnvAtEoY7iBM6rBb8
	l5AuvGbGNF6hz91AGll070fFG//yYCo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] SUPPORT.md: update Xen version
Date: Fri, 19 Jul 2024 13:51:44 +0200
Message-ID: <20240719115144.5301-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 4FA461F7A2

Update the Xen version to 4.20

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 SUPPORT.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 77d2a7a7db..bd4316523d 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.19-rc
+    Xen-Version: 4.20-unstable
     Initial-Release: n/a
     Supported-Until: TBD
     Security-Support-Until: Unreleased - not yet security-supported
-- 
2.43.0


