Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6042F99C736
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 12:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818600.1231908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0IO6-0001et-Nn; Mon, 14 Oct 2024 10:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818600.1231908; Mon, 14 Oct 2024 10:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0IO6-0001cy-JC; Mon, 14 Oct 2024 10:33:18 +0000
Received: by outflank-mailman (input) for mailman id 818600;
 Mon, 14 Oct 2024 10:33:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pOqc=RK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t0IO4-0001cp-Dg
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 10:33:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b78566ed-8a17-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 12:33:14 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8AB3B21D74;
 Mon, 14 Oct 2024 10:33:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55AB513A42;
 Mon, 14 Oct 2024 10:33:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id K3d8E2nzDGcMHQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 14 Oct 2024 10:33:13 +0000
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
X-Inumbo-ID: b78566ed-8a17-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728901993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F3NcqtA/g5gMvUSBSq5eYxVRbnCj0PZ15XHV5ZXyr6M=;
	b=WbnIGsfEl0nKalA/ZV2NE0E8AA3jaW5ycS2a0zIzojwqWvedamD/SmQmgCyHfG7o+9zBU8
	W6XFXeIti95XlCFxNTx69RtURAMaZoAMe4lrj4MsKzp6RocMSRnkafkjkvGjBud2j+fWoT
	GkSCtAbYSwt5z7n0PqNkxU7aF6Xh4m0=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728901993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F3NcqtA/g5gMvUSBSq5eYxVRbnCj0PZ15XHV5ZXyr6M=;
	b=WbnIGsfEl0nKalA/ZV2NE0E8AA3jaW5ycS2a0zIzojwqWvedamD/SmQmgCyHfG7o+9zBU8
	W6XFXeIti95XlCFxNTx69RtURAMaZoAMe4lrj4MsKzp6RocMSRnkafkjkvGjBud2j+fWoT
	GkSCtAbYSwt5z7n0PqNkxU7aF6Xh4m0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/public: add comments regarding interface version bumps
Date: Mon, 14 Oct 2024 12:33:11 +0200
Message-ID: <20241014103311.31272-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

domctl.h and sysctl.h have an interface version, which needs to be
bumped in case of incompatible modifications of the interface.

In order to avoid misunderstandings, add a comment to both headers
specifying in which cases a bump is needed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/public/domctl.h | 10 ++++++++++
 xen/include/public/sysctl.h | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index e1028fc524..353f831e40 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -21,6 +21,16 @@
 #include "hvm/save.h"
 #include "memory.h"
 
+/*
+ * The interface version needs to be incremented by 1 in case the interface
+ * is modified in an incompatible way AND if the version hasn't been
+ * incremented in the current development cycle already.
+ * Pure additions (e.g. new sub-commands) or compatible interface changes
+ * (e.g. adding semantics to 0-checked input fields or data to zeroed output
+ * fields) don't require a change of the version.
+ *
+ * Last version bump: Xen 4.19
+ */
 #define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
 
 /*
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index b2a5a724db..b0fec271d3 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -18,6 +18,16 @@
 #include "domctl.h"
 #include "physdev.h"
 
+/*
+ * The interface version needs to be incremented by 1 in case the interface
+ * is modified in an incompatible way AND if the version hasn't been
+ * incremented in the current development cycle already.
+ * Pure additions (e.g. new sub-commands) or compatible interface changes
+ * (e.g. adding semantics to 0-checked input fields or data to zeroed output
+ * fields) don't require a change of the version.
+ *
+ * Last version bump: Xen 4.17
+ */
 #define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
 
 /*
-- 
2.43.0


