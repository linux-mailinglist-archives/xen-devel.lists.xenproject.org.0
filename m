Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B062C2F1CBF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65104.115246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DF-0002db-Gh; Mon, 11 Jan 2021 17:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65104.115246; Mon, 11 Jan 2021 17:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DF-0002d2-DN; Mon, 11 Jan 2021 17:42:41 +0000
Received: by outflank-mailman (input) for mailman id 65104;
 Mon, 11 Jan 2021 17:42:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1DD-0002a6-Vw
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:42:40 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.52])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9295fc2-39d0-48f8-ad78-b3ea1c733419;
 Mon, 11 Jan 2021 17:42:36 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgRM3G
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:27 +0100 (CET)
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
X-Inumbo-ID: f9295fc2-39d0-48f8-ad78-b3ea1c733419
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386955;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=PqavFAEZ5cTdGstAdYlAd/8S+6nO+Bcr5/jInWJ/Ous=;
	b=AAXwHNhnQvVF9iCbwVSmN/fYPPNSKybpg4GUuXoOmDgYhelL9S4eVf7GCIVaTMSoeK
	BeEuMVQvqPz3iez+MWGWDeAibXl8dSkzIfST0CyBwTPHvVy+/XHMkbRiDwDqeM8NBILS
	lzIlCH4H3DNDcIgekHUvhVmeWJtclQeMOv06P5yT36i3D86LJnu84AaCzjc9pvyvHyVk
	fTCXLo25kGdvGocR8ezBk9dX8b3FDWikDhcvwzz4lSq7wL939aMvKYnlBwVI4rcgggT2
	KKAs2G/Aq6X0hsoLTQ/A/XHMkzJMTZxQfiw8NS60K7rOLjm/GzxRJKvaGy0sQGYQKSGT
	rJjg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 02/39] xl: use proper name for bash_completion file
Date: Mon, 11 Jan 2021 18:41:47 +0100
Message-Id: <20210111174224.24714-3-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Files in the bash-completion dirs should be named like the commands,
without suffix. Without this change 'xl' will not be recognized as a
command with completion support if BASH_COMPLETION_DIR is set to
/usr/share/bash-completion/completions.

Fixes commit 9136a919b19929ecb242ef327053d55d824397df

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/xl/Makefile        | 4 ++--
 tools/xl/bash-completion | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index bdf67c8464..656b21c7da 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -45,11 +45,11 @@ install: all
 	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
 	$(INSTALL_DIR) $(DESTDIR)$(BASH_COMPLETION_DIR)
 	$(INSTALL_PROG) xl $(DESTDIR)$(sbindir)
-	$(INSTALL_DATA) bash-completion $(DESTDIR)$(BASH_COMPLETION_DIR)/xl.sh
+	$(INSTALL_DATA) bash-completion $(DESTDIR)$(BASH_COMPLETION_DIR)/xl
 
 .PHONY: uninstall
 uninstall:
-	rm -f $(DESTDIR)$(BASH_COMPLETION_DIR)/xl.sh
+	rm -f $(DESTDIR)$(BASH_COMPLETION_DIR)/xl
 	rm -f $(DESTDIR)$(sbindir)/xl
 
 .PHONY: clean
diff --git a/tools/xl/bash-completion b/tools/xl/bash-completion
index b7cd6b3992..7c6ed32f88 100644
--- a/tools/xl/bash-completion
+++ b/tools/xl/bash-completion
@@ -1,4 +1,4 @@
-# Copy this file to /etc/bash_completion.d/xl.sh
+# Copy this file to /etc/bash_completion.d/xl
 
 _xl()
 {

