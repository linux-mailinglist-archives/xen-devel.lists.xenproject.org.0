Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4E9917A7
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 17:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810959.1223664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx6Vw-00078a-Pi; Sat, 05 Oct 2024 15:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810959.1223664; Sat, 05 Oct 2024 15:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx6Vw-00076B-MC; Sat, 05 Oct 2024 15:16:12 +0000
Received: by outflank-mailman (input) for mailman id 810959;
 Sat, 05 Oct 2024 15:16:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=edRR=RB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sx6Vv-0006E7-Ie
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2024 15:16:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c03215f7-832c-11ef-99a2-01e77a169b0f;
 Sat, 05 Oct 2024 17:16:10 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C05021E1D;
 Sat,  5 Oct 2024 15:16:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7746513A8F;
 Sat,  5 Oct 2024 15:16:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7ZSkGzlYAWf+CAAAD6G6ig
 (envelope-from <jgross@suse.com>); Sat, 05 Oct 2024 15:16:09 +0000
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
X-Inumbo-ID: c03215f7-832c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728141369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qa1gW4DnBfzxqPMf4tD8MwJ65mRwo8BvZFHY8vU0Kx8=;
	b=N8rRKyv8Cg3c26WTDtn0+GMJ3bJl/tXLKuGUO+2oDMZUdO2P/ky7iwCSdwAcViNl0NunHB
	CD677e2i8jKUzAwq44uasGIYYD2svFLaPbpK23Y17ALfGhe7JYV+LIWgs+j8qk/OcY8OfB
	imPJ/GYgEHS/8QPNgEpSP1xhJwJ4tAM=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728141369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qa1gW4DnBfzxqPMf4tD8MwJ65mRwo8BvZFHY8vU0Kx8=;
	b=N8rRKyv8Cg3c26WTDtn0+GMJ3bJl/tXLKuGUO+2oDMZUdO2P/ky7iwCSdwAcViNl0NunHB
	CD677e2i8jKUzAwq44uasGIYYD2svFLaPbpK23Y17ALfGhe7JYV+LIWgs+j8qk/OcY8OfB
	imPJ/GYgEHS/8QPNgEpSP1xhJwJ4tAM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/4] build: move xenlibs-dependencies make definition to uselibs.mk
Date: Sat,  5 Oct 2024 17:15:47 +0200
Message-ID: <20241005151548.29184-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005151548.29184-1-jgross@suse.com>
References: <20241005151548.29184-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.77 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.17)[-0.833];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.77
X-Spam-Flag: NO

In order to be able to use the xenlibs-dependencies macro from stubdom
build, move it to tools/libs/uselibs.mk, which is included from
current users and stubdom/Makefile.

No functional change intended.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/Rules.mk        | 7 -------
 tools/libs/uselibs.mk | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index e2289c25b4..6bd636709f 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -81,13 +81,6 @@ endif
 # include any CFLAGS or LDLIBS relating to libbar or libbaz unless
 # they use those libraries directly (not via libfoo) too.
 
-# Give the list of Xen library that the libraries in $(1) are linked against,
-# directly or indirectly.
-define xenlibs-dependencies
-    $(sort $(foreach lib,$(1), \
-        $(USELIBS_$(lib)) $(call xenlibs-dependencies,$(USELIBS_$(lib)))))
-endef
-
 # Flags for linking recursive dependencies of Xen libraries in $(1)
 define xenlibs-rpath
     $(addprefix -Wl$(comma)-rpath-link=$(XEN_ROOT)/tools/libs/,$(call xenlibs-dependencies,$(1)))
diff --git a/tools/libs/uselibs.mk b/tools/libs/uselibs.mk
index efd7a475ba..7aa8d83e06 100644
--- a/tools/libs/uselibs.mk
+++ b/tools/libs/uselibs.mk
@@ -31,3 +31,10 @@ USELIBS_light := toollog evtchn toolcore ctrl store hypfs guest
 LIBS_LIBS += util
 USELIBS_util := light
 FILENAME_util := xlutil
+
+# Give the list of Xen library that the libraries in $(1) are linked against,
+# directly or indirectly.
+define xenlibs-dependencies
+    $(sort $(foreach lib,$(1), \
+        $(USELIBS_$(lib)) $(call xenlibs-dependencies,$(USELIBS_$(lib)))))
+endef
-- 
2.43.0


