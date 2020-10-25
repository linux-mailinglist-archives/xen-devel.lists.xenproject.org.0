Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEE929804E
	for <lists+xen-devel@lfdr.de>; Sun, 25 Oct 2020 06:46:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.11731.31035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWYql-0005Ap-N3; Sun, 25 Oct 2020 05:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11731.31035; Sun, 25 Oct 2020 05:45:51 +0000
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
	id 1kWYql-0005AQ-Js; Sun, 25 Oct 2020 05:45:51 +0000
Received: by outflank-mailman (input) for mailman id 11731;
 Sun, 25 Oct 2020 05:45:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hByA=EA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWYqk-0005AL-PV
 for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 05:45:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3acac7c-3b65-4df6-aacf-248b69bc3407;
 Sun, 25 Oct 2020 05:45:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6BA42ABDE;
 Sun, 25 Oct 2020 05:45:47 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hByA=EA=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWYqk-0005AL-PV
	for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 05:45:50 +0000
X-Inumbo-ID: e3acac7c-3b65-4df6-aacf-248b69bc3407
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e3acac7c-3b65-4df6-aacf-248b69bc3407;
	Sun, 25 Oct 2020 05:45:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603604747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YafWDY0sGbBr2Keuon4d1t6Xh6u+lrf5ml2czJnQEh0=;
	b=mUqGjhLHRuoTL5/ToNHHrf5e1cpMlHVytMvei9IstZeNKJJViAGhbrnBHMUxUIq9n6kKSr
	0ZBj3tKFnMZkmr0QhW1hMDxdRzuOQ15cdF1t3IXaRMnrEQu/Xnu3gvmlxqS6i38g5NlMPR
	RAp5euLzWKIwz1XGtNde2ygONy52+5I=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6BA42ABDE;
	Sun, 25 Oct 2020 05:45:47 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/helpers: fix Arm build by excluding init-xenstore-domain
Date: Sun, 25 Oct 2020 06:45:46 +0100
Message-Id: <20201025054546.4960-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The support for PVH xenstore-stubdom has broken the Arm build.

Xenstore stubdom isn't supported on Arm, so there is no need to build
the init-xenstore-domain helper.

Build the helper on x86 only.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/helpers/Makefile | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index f759528322..1bcc97ea8a 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -7,8 +7,10 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 PROGS += xen-init-dom0
 ifeq ($(CONFIG_Linux),y)
+ifeq ($(CONFIG_X86),y)
 PROGS += init-xenstore-domain
 endif
+endif
 
 XEN_INIT_DOM0_OBJS = xen-init-dom0.o init-dom-json.o
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
@@ -37,17 +39,11 @@ init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	$(INSTALL_PROG) xen-init-dom0 $(DESTDIR)$(LIBEXEC_BIN)
-ifeq ($(CONFIG_Linux),y)
-	$(INSTALL_PROG) init-xenstore-domain $(DESTDIR)$(LIBEXEC_BIN)
-endif
+	for i in $(PROGS); do $(INSTALL_PROG) $$i $(DESTDIR)$(LIBEXEC_BIN); done
 
 .PHONY: uninstall
 uninstall:
-ifeq ($(CONFIG_Linux),y)
-	rm -f $(DESTDIR)$(LIBEXEC_BIN)/init-xenstore-domain
-endif
-	rm -f $(DESTDIR)$(LIBEXEC_BIN)/xen-init-dom0
+	for i in $(PROGS); do rm -f $(DESTDIR)$(LIBEXEC_BIN)/$$i; done
 
 .PHONY: clean
 clean:
-- 
2.26.2


