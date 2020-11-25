Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4152C426F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 15:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37823.70363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khw7J-0006A2-1U; Wed, 25 Nov 2020 14:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37823.70363; Wed, 25 Nov 2020 14:49:57 +0000
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
	id 1khw7I-00069d-UV; Wed, 25 Nov 2020 14:49:56 +0000
Received: by outflank-mailman (input) for mailman id 37823;
 Wed, 25 Nov 2020 14:49:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLmq=E7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1khw7H-00069Y-5V
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 14:49:55 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef133d09-9859-4085-876e-169d35d219f0;
 Wed, 25 Nov 2020 14:49:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=QLmq=E7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1khw7H-00069Y-5V
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 14:49:55 +0000
X-Inumbo-ID: ef133d09-9859-4085-876e-169d35d219f0
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ef133d09-9859-4085-876e-169d35d219f0;
	Wed, 25 Nov 2020 14:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606315793;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=6RjATdOGeRy0lx5OA3+/JVm0+7J35u3rU8nLoBynQik=;
  b=D3U4zCqFIxMnm/xWty+SwsgTW2xnY9ofSA/jr3wbZKL8cwY28EGTsktY
   pjDes68uRsEuDeqGNmfAII8jArfzYSouFz1Ha7welXrs0eyBMPYpKxj8b
   e+MjP9h8lyDnH320tYu59ZOZSElxFxUw4w749b6b9bDu62T0T4ahnPN8h
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EPNlRTuwUZ5o2xYMl0cIlv0NjE+lFPO+mwXCXLZC2PAjzLOGBwezgmRFV/V0H+4ZlSB43jn28R
 7w+qS+ObcGYlkTq/pvD19IuLmYenEEmeeCObuTOssWojjvhrGfoFmrQAUFI06oGBbxAipCbl/k
 mN0gIDGFUx3UEIvRKbcXruVSoWRhcZtulBDlEl5dj6KXuASNDMUzHKKgmkKH8ffWps7Kt+tfdk
 IUTeEywLtG2fPRFdfKxnB1W9Asc3r2rvyGo7qt+YF7RVTuZUrQwWAZ6GqwuGVv4Th7vn7hY6MM
 obo=
X-SBRS: None
X-MesageID: 31895527
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,369,1599537600"; 
   d="scan'208";a="31895527"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libs: Simplify internal *.pc files
Date: Wed, 25 Nov 2020 14:49:28 +0000
Message-ID: <20201125144928.22778-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

The internal package config file for libxenlight reads (reformatted to avoid
exceeding the SMTP 998-character line length):

  Libs: -L${libdir}
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/evtchn
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/call
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/evtchn
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/gnttab
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/foreignmemory
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/call
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/devicemodel
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/ctrl
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/store
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/call
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/hypfs
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/evtchn
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/call
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/evtchn
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/gnttab
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/foreignmemory
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/call
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/devicemodel
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/ctrl
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/guest
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/light
  -lxenlight

Drop duplicate -rpath-link='s to turn it into the slightly-more-manageable:

  Libs: -L${libdir}
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/call
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/ctrl
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/devicemodel
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/evtchn
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/foreignmemory
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/gnttab
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/guest
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/hypfs
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/light
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/store
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toolcore
  -Wl,-rpath-link=/local/security/xen.git/tools/libs/light/../../../tools/libs/toollog
  -lxenlight

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
---
 tools/Rules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index f61da81f4a..5d92ff0699 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -184,7 +184,7 @@ $(PKG_CONFIG_DIR)/%.pc: Makefile $(XEN_ROOT)/tools/Rules.mk $(PKG_CONFIG_DIR)
 	echo "Description: $(PKG_CONFIG_DESC)"; \
 	echo "Version: $(PKG_CONFIG_VERSION)"; \
 	echo "Cflags: -I\$${includedir} $(CFLAGS_xeninclude)"; \
-	echo "Libs: -L\$${libdir} $(PKG_CONFIG_USELIBS) -l$(PKG_CONFIG_LIB)"; \
+	echo "Libs: -L\$${libdir} $(sort $(PKG_CONFIG_USELIBS)) -l$(PKG_CONFIG_LIB)"; \
 	echo "Libs.private: $(PKG_CONFIG_LIBSPRIV)"; \
 	echo "Requires.private: $(PKG_CONFIG_REQPRIV)"; \
 	} > $@
-- 
2.11.0


