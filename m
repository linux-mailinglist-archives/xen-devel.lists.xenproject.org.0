Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1462773A6F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579860.908058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMfY-00054G-0E; Tue, 08 Aug 2023 13:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579860.908058; Tue, 08 Aug 2023 13:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMfX-00050s-Rp; Tue, 08 Aug 2023 13:22:39 +0000
Received: by outflank-mailman (input) for mailman id 579860;
 Tue, 08 Aug 2023 13:22:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw+Y=DZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qTMfX-0003ij-3a
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:22:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5282306-35ee-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:22:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5B39821CC5;
 Tue,  8 Aug 2023 13:22:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23510139D1;
 Tue,  8 Aug 2023 13:22:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nhv0Bp5B0mSqFAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Aug 2023 13:22:38 +0000
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
X-Inumbo-ID: a5282306-35ee-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691500958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/AHDp091ry1sq7bDUAxHTIgZCYOG8/+0FTmesY5Vjg=;
	b=bWr3s96eU9z2EIZ5poVBpHPjBxsT1bl4L75UlatOE7GePtIEBAN/IdNR7Y4awTLjIjP2jG
	iPC/lSTST3X8whr7mx/habJlmb9N6ljaMNFgIMRS6QH/c4wKlPaRTZucEoVnIb4c4bEsik
	yCHTGz0gx/Ecv18DebFLC/hhRKbfo2A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 3/3] tools/xl: reject bootloader=pygrub in case pygrub is disabled
Date: Tue,  8 Aug 2023 15:22:19 +0200
Message-Id: <20230808132219.6422-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230808132219.6422-1-jgross@suse.com>
References: <20230808132219.6422-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case Xen has been configured with "--disable-pygrub", don't accept
the domain config option "bootloader=pygrub".

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/xl/xl_parse.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1a5556d3bb..0e8c604bbf 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1692,6 +1692,15 @@ void parse_config_data(const char *config_source,
     xlu_cfg_get_defbool(config, "acpi", &b_info->acpi, 0);
 
     xlu_cfg_replace_string (config, "bootloader", &b_info->bootloader, 0);
+#ifndef HAVE_PYGRUB
+    if (b_info->bootloader &&
+        (!strcmp(b_info->bootloader, "pygrub") ||
+	 !strcmp(b_info->bootloader, "/usr/bin/pygrub"))) {
+        fprintf(stderr, "ERROR: this instance of Xen has been built without support of \"pygrub\".\n");
+        exit(-ERROR_FAIL);
+    }
+#endif
+
     switch (xlu_cfg_get_list_as_string_list(config, "bootloader_args",
                                             &b_info->bootloader_args, 1)) {
     case 0:
-- 
2.35.3


