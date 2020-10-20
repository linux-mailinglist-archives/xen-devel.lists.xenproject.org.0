Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D067D293BEA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 14:40:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9520.24964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUqvY-0006zd-Id; Tue, 20 Oct 2020 12:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9520.24964; Tue, 20 Oct 2020 12:39:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUqvY-0006zE-FK; Tue, 20 Oct 2020 12:39:44 +0000
Received: by outflank-mailman (input) for mailman id 9520;
 Tue, 20 Oct 2020 12:39:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ryym=D3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kUqvV-0006z8-QS
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 12:39:42 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8ba0917-daaa-427c-ab01-3ca72fc8b542;
 Tue, 20 Oct 2020 12:39:40 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.1 DYNA|AUTH)
 with ESMTPSA id e003b5w9KCdVCCA
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 20 Oct 2020 14:39:31 +0200 (CEST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ryym=D3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kUqvV-0006z8-QS
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 12:39:42 +0000
X-Inumbo-ID: f8ba0917-daaa-427c-ab01-3ca72fc8b542
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f8ba0917-daaa-427c-ab01-3ca72fc8b542;
	Tue, 20 Oct 2020 12:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603197579;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=PqavFAEZ5cTdGstAdYlAd/8S+6nO+Bcr5/jInWJ/Ous=;
	b=MCvXTRAfywO92g61wBRufXFveVHulBBCifhqliheJ5J279JxxqpTp1xzd0KApIiMDy
	Pn7c9R7ELpwW/eoHjjOWpXU8eq3oNlOE9STVbMAQuPVj0VW8Tn0EaQkrSjdWetj1o1T6
	lJryZsq9jFA14fsJ1kqk62ueH5VM25cGi+3i+gzFmlnmyfRmsn+vQjHUzNCQr4aH1CCt
	BkwBcRksw42ar2SCeP6VoZRTM7OnzXvxtyIAkaC14Y34RouEV7Q4D4sJXw3zakUmyDMg
	Nm7JJ/Y/sfd79XmdBuFDzJPoJaBfDvru9VMP4jL67ODLDzjoBnoSad3wbHBA4OzoWEiU
	C9tg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.1 DYNA|AUTH)
	with ESMTPSA id e003b5w9KCdVCCA
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Tue, 20 Oct 2020 14:39:31 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] xl: use proper name for bash_completion file
Date: Tue, 20 Oct 2020 14:39:28 +0200
Message-Id: <20201020123928.27099-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
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

