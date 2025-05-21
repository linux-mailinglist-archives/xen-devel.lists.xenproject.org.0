Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93AEABEB06
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 06:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991425.1375284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHbLy-0005Tj-1z; Wed, 21 May 2025 04:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991425.1375284; Wed, 21 May 2025 04:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHbLx-0005QY-UA; Wed, 21 May 2025 04:46:53 +0000
Received: by outflank-mailman (input) for mailman id 991425;
 Wed, 21 May 2025 04:46:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+DYs=YF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uHbLw-0005Cf-L8
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 04:46:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c5479cf-35fe-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 06:46:51 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 24B821F80D;
 Wed, 21 May 2025 04:46:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7A9913888;
 Wed, 21 May 2025 04:46:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mMLcN7haLWiPcwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 21 May 2025 04:46:48 +0000
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
X-Inumbo-ID: 9c5479cf-35fe-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1747802809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+vioX0lqVonxN27pMsCAjA7/xj/gI/V9EHfXjJsTPB0=;
	b=ocYYdf8oQlopwlTDrjqhqg3yeGr5Ut6/0Av5Bb5q10EgT8hQh/D4vDmtyrbQIvUUOTzZj+
	K9QrA4Wt65zfXGkHT+e262bRoIGtcKHNZMzr3NZzq5VeXCzTnTnxywYAHoBNn01Ctlllyw
	q/FbmHfvlr5/h2zEy1HPWI+m4Myw5pk=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1747802809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+vioX0lqVonxN27pMsCAjA7/xj/gI/V9EHfXjJsTPB0=;
	b=ocYYdf8oQlopwlTDrjqhqg3yeGr5Ut6/0Av5Bb5q10EgT8hQh/D4vDmtyrbQIvUUOTzZj+
	K9QrA4Wt65zfXGkHT+e262bRoIGtcKHNZMzr3NZzq5VeXCzTnTnxywYAHoBNn01Ctlllyw
	q/FbmHfvlr5/h2zEy1HPWI+m4Myw5pk=
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
Subject: [PATCH 1/2] SUPPORT.md: add xenstore stubdom as supported
Date: Wed, 21 May 2025 06:46:33 +0200
Message-ID: <20250521044634.11361-2-jgross@suse.com>
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

SUPPORT.md is missing a suupport statement for Xenstore stubdom.

As SUSE is using it in production since several years now, it should
be added as "supported". This covers the PV and the PVH variant.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 SUPPORT.md | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index e8fd0c251e..7dbb477765 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -272,6 +272,16 @@ or itself will not be regarded a security issue.
     Status: Supported
     Status, Liveupdate: Tech Preview
 
+### C xenstore stubdom PV
+
+    Status: Supported
+    Status, Liveupdate: Not implemented
+
+### C xenstore stubdom PVH
+
+    Status: Supported
+    Status, Liveupdate: Not implemented
+
 ### OCaml xenstored daemon
 
     Status: Supported
-- 
2.43.0


