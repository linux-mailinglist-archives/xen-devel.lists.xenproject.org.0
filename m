Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360FF31A1DE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 16:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84311.158089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYk-00012f-8S; Fri, 12 Feb 2021 15:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84311.158089; Fri, 12 Feb 2021 15:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYk-00011o-3s; Fri, 12 Feb 2021 15:40:42 +0000
Received: by outflank-mailman (input) for mailman id 84311;
 Fri, 12 Feb 2021 15:40:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAaYi-0000ix-OA
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:40:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a48c940c-c2a4-4e10-b77d-e5dc69be1924;
 Fri, 12 Feb 2021 15:40:17 +0000 (UTC)
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
X-Inumbo-ID: a48c940c-c2a4-4e10-b77d-e5dc69be1924
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613144417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=d2FNP0eIgRtKpMK8y8WPj0QMRGu85RJJU+Z7e2YOdHA=;
  b=Cinlk9HDiCvq3Z9iFMvpRfsXcbNp5c0TJ35xGP08Z7SsPnmIA0O1G9AY
   6QaTQxP52OReibXY5EUW++M6dBhQsVq+LBl8TXNs2lX77GS9hhV1E/vbD
   3v3tcCVPHXRbpr4ismX9N710M11zAhxgTnmPPdZKRk9f3CbpRLvG6F/pp
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +3kB8HBQiTyA76xd0+qDZKlRG1tgbdPr5WmecmHMH9p0eflak7dFXBsNRNKf0YpyOBw/ab8LZU
 F/3isO+RAzyYQxC5H/zOoTDy9X8JlkzPpEfXSOdWO3eiyeZFxvwREPxKdYu9R/17l7RregcuU8
 DhhRcATOjEHz83jU3MYZ/OibaGmZgsRg5W/a8RwAGFLxTQ7sCXHDbpAtfRrh8XpyT7qK4q4Q0X
 W+qKAVXl/ZvGfy8bULV4x9F7d9WnUIYpglids200kwapbW9k1x8R+HMf5hI2rQzubnu8MGnKda
 CPU=
X-SBRS: 5.2
X-MesageID: 37518634
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="37518634"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 09/10] tools/libs: Add rule to generate headers.lst
Date: Fri, 12 Feb 2021 15:39:52 +0000
Message-ID: <20210212153953.4582-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-1-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

abi-dumper needs a list of the public header files for shared objects, and
only accepts this in the form of a file.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/.gitignore | 1 +
 tools/libs/libs.mk    | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 tools/libs/.gitignore

diff --git a/tools/libs/.gitignore b/tools/libs/.gitignore
new file mode 100644
index 0000000000..4a13126144
--- /dev/null
+++ b/tools/libs/.gitignore
@@ -0,0 +1 @@
+*/headers.lst
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 0b3381755a..ac68996ab2 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -76,6 +76,10 @@ endif
 
 headers.chk: $(AUTOINCS)
 
+headers.lst: FORCE
+	@{ $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
+	@$(call move-if-changed,$@.tmp,$@)
+
 libxen$(LIBNAME).map:
 	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >$@
 
@@ -118,9 +122,12 @@ TAGS:
 clean:
 	rm -rf *.rpm $(LIB) *~ $(DEPS_RM) $(LIB_OBJS) $(PIC_OBJS)
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
-	rm -f headers.chk
+	rm -f headers.chk headers.lst
 	rm -f $(PKG_CONFIG)
 	rm -f _paths.h
 
 .PHONY: distclean
 distclean: clean
+
+.PHONY: FORCE
+FORCE:
-- 
2.11.0


