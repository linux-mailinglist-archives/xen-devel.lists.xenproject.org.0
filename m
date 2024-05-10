Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED818C268C
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 16:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719896.1122750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5R3D-0008LN-ED; Fri, 10 May 2024 14:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719896.1122750; Fri, 10 May 2024 14:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5R3D-0008Ig-Ar; Fri, 10 May 2024 14:16:43 +0000
Received: by outflank-mailman (input) for mailman id 719896;
 Fri, 10 May 2024 14:16:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YvKo=MN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s5R3B-0008IT-SM
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 14:16:41 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc649d1-0ed7-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 16:16:41 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C01136723C;
 Fri, 10 May 2024 14:16:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7AC0A1386E;
 Fri, 10 May 2024 14:16:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id blCCHEcsPmZXFQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 10 May 2024 14:16:39 +0000
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
X-Inumbo-ID: ebc649d1-0ed7-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1715350599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=prPdvlgPTP2uaA20U/fjxR/6B0ZmtRktXaxuzxFsYp8=;
	b=CKsjsZVJUZ/SAcbYDZ/1BP7B+D5P2qzcOFzQKNRjwLCynmDtHeoCVkiY7m8NPupa+Fb5n8
	UtydbJe6Uedmsj/f8SC24FXeGILWKOU/cHJ0yyKc5AlrjbA8LAjVIJ0MUlYoseoWai4wg+
	UZF5B8GjnAeN5vqOmvH0JWMD/4OoVA0=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=CKsjsZVJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1715350599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=prPdvlgPTP2uaA20U/fjxR/6B0ZmtRktXaxuzxFsYp8=;
	b=CKsjsZVJUZ/SAcbYDZ/1BP7B+D5P2qzcOFzQKNRjwLCynmDtHeoCVkiY7m8NPupa+Fb5n8
	UtydbJe6Uedmsj/f8SC24FXeGILWKOU/cHJ0yyKc5AlrjbA8LAjVIJ0MUlYoseoWai4wg+
	UZF5B8GjnAeN5vqOmvH0JWMD/4OoVA0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7] xen: allow up to 16383 cpus
Date: Fri, 10 May 2024 16:16:36 +0200
Message-Id: <20240510141636.20543-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: **
X-Spamd-Result: default: False [2.29 / 50.00];
	SEM_URIBL(3.50)[changelog.md:url];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	R_DKIM_ALLOW(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,xenproject.org,citrix.com,xen.org,kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: 2.29
X-Spam-Flag: NO
X-Rspamd-Queue-Id: C01136723C
X-Spamd-Bar: ++

With lock handling now allowing up to 16384 cpus (spinlocks can handle
65535 cpus, rwlocks can handle 16384 cpus), raise the allowed limit for
the number of cpus to be configured to 16383.

The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
QINVAL_MAX_ENTRY_NR required to be larger than 2 * CONFIG_NR_CPUS.

Add a support limit of physical CPUs to SUPPORT.md (4096 on x86, 128
on ARM).

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
V5:
- new patch (Jan Beulich)
V7:
- add SUPPORT.md and CHANGELOG.md entries
---
 CHANGELOG.md     | 2 ++
 SUPPORT.md       | 5 +++++
 xen/arch/Kconfig | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8041cfb7d2..c43c45d8d4 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - HVM PIRQs are disabled by default.
    - Reduce IOMMU setup time for hardware domain.
  - xl/libxl configures vkb=[] for HVM domains with priority over vkb_device.
+ - Increase the maximum number of CPUs Xen can be built for from 4095 to
+   16383.
 
 ### Added
  - On x86:
diff --git a/SUPPORT.md b/SUPPORT.md
index e10d46d924..d5d60c62ec 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -61,6 +61,11 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
 
     Status, x86: Supported
 
+### Physical CPUs
+
+    Status, x86: Supported up to 4096
+    Status, ARM: Supported up to 128
+
 ### Host ACPI (via Domain 0)
 
     Status, x86 PV: Supported
diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 67ba38f32f..308ce129a8 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -6,7 +6,7 @@ config PHYS_ADDR_T_32
 
 config NR_CPUS
 	int "Maximum number of CPUs"
-	range 1 4095
+	range 1 16383
 	default "256" if X86
 	default "8" if ARM && RCAR3
 	default "4" if ARM && QEMU
-- 
2.35.3


