Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112B6A8073A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 14:35:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941912.1341302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28B0-0004Tr-GW; Tue, 08 Apr 2025 12:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941912.1341302; Tue, 08 Apr 2025 12:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28B0-0004SJ-Dh; Tue, 08 Apr 2025 12:35:38 +0000
Received: by outflank-mailman (input) for mailman id 941912;
 Tue, 08 Apr 2025 12:35:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ii8P=W2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u28Ay-0003hd-Ds
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 12:35:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7a6772c-1475-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 14:35:34 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F6EB1F452;
 Tue,  8 Apr 2025 12:35:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 064B013A84;
 Tue,  8 Apr 2025 12:35:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id h6EbABYY9WcEIgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 08 Apr 2025 12:35:34 +0000
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
X-Inumbo-ID: f7a6772c-1475-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744115734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NwwBq4WbUldlcLFAl4DtSUZ57BV3JO4VtgUASkd/5Hg=;
	b=eIW5nNCEWDvggtvyO3h8Doij3riwIWTMF4iNvrzwG6Yyyorc8iMvgl5TqtthjwJZYkd6z9
	40jIzUe1gd8+MS5G/Ap8+nU+runKsCG/p3ENbhwzdZIP3eIC5f82KA0Hz2QYEvtPzOcw8D
	bWOc8naJ6Oic4xO0SBbNvvj0h9UfZxU=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744115734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NwwBq4WbUldlcLFAl4DtSUZ57BV3JO4VtgUASkd/5Hg=;
	b=eIW5nNCEWDvggtvyO3h8Doij3riwIWTMF4iNvrzwG6Yyyorc8iMvgl5TqtthjwJZYkd6z9
	40jIzUe1gd8+MS5G/Ap8+nU+runKsCG/p3ENbhwzdZIP3eIC5f82KA0Hz2QYEvtPzOcw8D
	bWOc8naJ6Oic4xO0SBbNvvj0h9UfZxU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/6] SUPPORT.md: make Linux based stubdom fully supported
Date: Tue,  8 Apr 2025 14:35:19 +0200
Message-ID: <20250408123526.14613-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408123526.14613-1-jgross@suse.com>
References: <20250408123526.14613-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -5.30
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,xenproject.org,citrix.com,vates.tech,amd.com,xen.org,kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

All patches needed for running with a Linux stubdom device model are
in the tree and QubesOS is using and testing Linux stubdoms nowadays.

Switch support from "Tech Preview" to "Supported, with caveats".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- switch to "Supported, with caveats" (security team)
---
 CHANGELOG.md | 1 +
 SUPPORT.md   | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8f6afa5c85..ce4fcf2feb 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -10,6 +10,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - The minimum toolchain requirements have increased for some architectures:
    - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
    - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
+ - Linux based device model stubdomains are now fully supported.
 
 ### Added
  - On x86:
diff --git a/SUPPORT.md b/SUPPORT.md
index 91cb6f8ed2..e8fd0c251e 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -260,7 +260,10 @@ Go (golang) bindings for libxl
 
 Support for running qemu-xen device model in a linux stubdomain.
 
-    Status: Tech Preview
+    Status: Supported, with caveats
+
+Any issue in the stubdomain affecting only the guest it is servicing
+or itself will not be regarded a security issue.
 
 ## Xenstore
 
-- 
2.43.0


