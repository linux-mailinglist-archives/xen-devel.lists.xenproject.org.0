Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6DEABEB07
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 06:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991426.1375293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHbM6-0005n3-DN; Wed, 21 May 2025 04:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991426.1375293; Wed, 21 May 2025 04:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHbM6-0005k1-9a; Wed, 21 May 2025 04:47:02 +0000
Received: by outflank-mailman (input) for mailman id 991426;
 Wed, 21 May 2025 04:47:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+DYs=YF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uHbM4-0005Cf-DK
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 04:47:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1072965-35fe-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 06:46:58 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9479621EEA;
 Wed, 21 May 2025 04:46:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D59613888;
 Wed, 21 May 2025 04:46:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JUHoFcJaLWiYcwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 21 May 2025 04:46:58 +0000
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
X-Inumbo-ID: a1072965-35fe-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1747802818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ePxzSoTo04yiio7HLCHj8Zmu3m88S4vMA+VRjoO6hVM=;
	b=kXSlypViqBzFyUdElnWHCFK4Qg8yVWfpu0eUDkunoJYCPiRF74wGLiCLgPsDRttgbPFDH3
	21m3Ak/WVvykNL4knCFPPI/mxB+XeLKjamwbcDJQKenn5+X8u0IYfRhdLG+a2nAGLl6j4J
	NqJJL40YcdKzDAnpzbjbPKOu3SQvpng=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1747802818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ePxzSoTo04yiio7HLCHj8Zmu3m88S4vMA+VRjoO6hVM=;
	b=kXSlypViqBzFyUdElnWHCFK4Qg8yVWfpu0eUDkunoJYCPiRF74wGLiCLgPsDRttgbPFDH3
	21m3Ak/WVvykNL4knCFPPI/mxB+XeLKjamwbcDJQKenn5+X8u0IYfRhdLG+a2nAGLl6j4J
	NqJJL40YcdKzDAnpzbjbPKOu3SQvpng=
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
Subject: [PATCH 2/2] SUPPORT.md: mark xenstore live update as supported
Date: Wed, 21 May 2025 06:46:34 +0200
Message-ID: <20250521044634.11361-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521044634.11361-1-jgross@suse.com>
References: <20250521044634.11361-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.20
X-Spamd-Result: default: False [0.20 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Live update of xenstored is available since Xen 4.15 and it is tested
on a regular basis since then.

Switch the live update support from "Tech Preview" to "Supported".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 SUPPORT.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 7dbb477765..198dfb4229 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -270,7 +270,7 @@ or itself will not be regarded a security issue.
 ### C xenstored daemon
 
     Status: Supported
-    Status, Liveupdate: Tech Preview
+    Status, Liveupdate: Supported
 
 ### C xenstore stubdom PV
 
-- 
2.43.0


