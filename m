Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CE6B16DCE
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 10:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065073.1430403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOsV-0006jy-Gx; Thu, 31 Jul 2025 08:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065073.1430403; Thu, 31 Jul 2025 08:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOsV-0006h8-CQ; Thu, 31 Jul 2025 08:43:07 +0000
Received: by outflank-mailman (input) for mailman id 1065073;
 Thu, 31 Jul 2025 08:43:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3v3Z=2M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uhOsT-0006gC-TB
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 08:43:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f5d1fcd-6dea-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 10:43:04 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9ACC61F7BE;
 Thu, 31 Jul 2025 08:43:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69E7113AB4;
 Thu, 31 Jul 2025 08:43:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HskJGJYsi2jMDAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 31 Jul 2025 08:43:02 +0000
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
X-Inumbo-ID: 5f5d1fcd-6dea-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753951383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uSyQelwkAxmw7kyKn2rf/XibX90/X1XS9gD+6+Tbeuk=;
	b=l3z3WlTuzdq5s2VMGAuJQkMkRGhJLtvsIumi6e0PorKe2T3Iaqmd1vIH/UbTAM1uwsNF1C
	Exx0gVOD72bgbw1Nj7VAN5qo28BO4TJSIrk0TDDFlx49m6Uj9A/pbr82t7abzm+VKPqkdo
	af0CGIeO6H0ojQts7PEl59o6we2Xsds=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=tnyMA29K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753951382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uSyQelwkAxmw7kyKn2rf/XibX90/X1XS9gD+6+Tbeuk=;
	b=tnyMA29KW8msoGIUwbi1ARB0PULK6TQrySOaOC318h+PL9z7/ZPKojiCMxwPQZYysy2LYd
	V6CuGb9TXH38nUi2vYxstiK82jSNB3PZatctdmpehEaHWBoH/AnpLKPVOfGk2QYJHLuBBE
	oC+YKGx1Y3Nl3QKe8Ma7OfGG1v05W0E=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 1/2] tools/xl: add available Xenstore features to xl info output
Date: Thu, 31 Jul 2025 10:42:53 +0200
Message-ID: <20250731084254.25591-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731084254.25591-1-jgross@suse.com>
References: <20250731084254.25591-1-jgross@suse.com>
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
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,amd.com:email,suse.com:mid,suse.com:dkim,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 9ACC61F7BE
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Add the Xenstore feature value to the output of "xl info" in order to
prepare for a future capability to limit Xenstore features visible by
a guest.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/xl/Makefile  |  3 ++-
 tools/xl/xl_info.c | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index d742e96a5b..ad577cdd70 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -13,6 +13,7 @@ LDFLAGS += $(PTHREAD_LDFLAGS)
 
 CFLAGS_XL += $(CFLAGS_libxenlight)
 CFLAGS_XL += $(CFLAGS_libxenutil)
+CFLAGS_XL += $(CFLAGS_libxenstore)
 CFLAGS_XL += -Wshadow
 
 XL_OBJS-$(CONFIG_X86) = xl_psr.o
@@ -32,7 +33,7 @@ $(XL_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h # libxl_json.h needs i
 all: xl
 
 xl: $(XL_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) -lyajl $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 72e87eac46..eb019e3ee9 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -28,6 +28,7 @@
 #include <libxl_utils.h>
 #include <libxlutil.h>
 #include <xen-tools/arm-arch-capabilities.h>
+#include <xenstore.h>
 
 #include "xl.h"
 #include "xl_utils.h"
@@ -333,6 +334,25 @@ static void output_topologyinfo(void)
     return;
 }
 
+static void output_xenstore_info(void)
+{
+    struct xs_handle *xsh;
+    unsigned int features = 0;
+
+    xsh = xs_open(0);
+    if (!xsh) {
+        fprintf(stderr, "xs_open failed.\n");
+        return;
+    }
+
+    /* Ignore error, default to "0" for features. */
+    xs_get_features_supported(xsh, &features);
+
+    maybe_printf("xenstore_features      : 0x%08x\n", features);
+
+    xs_close(xsh);
+}
+
 static void print_info(int numa)
 {
     output_nodeinfo();
@@ -345,6 +365,8 @@ static void print_info(int numa)
     }
     output_xeninfo();
 
+    output_xenstore_info();
+
     maybe_printf("xend_config_format     : 4\n");
 
     return;
-- 
2.43.0


