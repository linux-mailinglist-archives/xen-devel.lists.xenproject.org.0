Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3785BB11F49
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 15:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057806.1425545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufILI-0001J7-Fc; Fri, 25 Jul 2025 13:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057806.1425545; Fri, 25 Jul 2025 13:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufILI-0001Fp-A7; Fri, 25 Jul 2025 13:20:08 +0000
Received: by outflank-mailman (input) for mailman id 1057806;
 Fri, 25 Jul 2025 13:20:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufILH-0006ft-1p
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 13:20:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 146d4de8-695a-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 15:20:06 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6DE31F7A7;
 Fri, 25 Jul 2025 13:20:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8DB53134E8;
 Fri, 25 Jul 2025 13:20:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BZJGIYSEg2j+PAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 25 Jul 2025 13:20:04 +0000
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
X-Inumbo-ID: 146d4de8-695a-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J971eGRb4I4rLoEKD9TcIoDmDuQYwQE2ZFSGXoKtYBA=;
	b=S/zCZl7AokZWdEfG+1vVoW8ytE4KSyI7DprVityHer4+bVeDKyyK4cll+kaUQYpI0VmH6o
	f0Ldaf0xFz7b80KxusJ9xL0fK21e0JJQ5Ex/zP89o0K9In2OSM1KtWYSb+njHRdpJ1oOcP
	HkiiNQ14uPa8xDSoTd99BOGOccz/i4I=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=RDmEy3q2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J971eGRb4I4rLoEKD9TcIoDmDuQYwQE2ZFSGXoKtYBA=;
	b=RDmEy3q2XqOyT5/EARf1S7TZlSfx+hFW6nVPzH5hNV+aOT4dkaSCFedl9XJtACVDbjX80b
	3QImRnn563sh0gWy+Y6Arinmnwt+0WAb1962M/vHFNj31xbEeUHg3BedgtGrpRmdfhpxeU
	IGblDPk1ZQ/RjX2zYo5ptPYA9VSv9Xs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 6/7] tools/xl: add available Xenstore features to xl info output
Date: Fri, 25 Jul 2025 15:19:27 +0200
Message-ID: <20250725131928.19286-7-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725131928.19286-1-jgross@suse.com>
References: <20250725131928.19286-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B6DE31F7A7
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01

Add the Xenstore feature value to the output of "xl info" in order to
prepare for a future capability to limit Xenstore features visible by
a guest.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
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


