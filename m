Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C1E7F63F3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 17:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639883.997551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Cb5-0002WP-69; Thu, 23 Nov 2023 16:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639883.997551; Thu, 23 Nov 2023 16:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Cb5-0002UP-3Y; Thu, 23 Nov 2023 16:30:35 +0000
Received: by outflank-mailman (input) for mailman id 639883;
 Thu, 23 Nov 2023 16:30:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UBXZ=HE=citrix.com=prvs=684edd595=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r6Cb2-0002UI-RY
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 16:30:32 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cf3c7d6-8a1d-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 17:30:31 +0100 (CET)
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
X-Inumbo-ID: 9cf3c7d6-8a1d-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700757030;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6IGAMxUev0jGFF7TusdxfbC7/iyps+jv4/BEpzUcIzU=;
  b=CWXvqZJ4JOcFm4LXQbYKBv8FFMcsGHuQyenkZ6tf6C9Lf1KpiroeS8Q/
   YWW4uPYb/dfn0BTGkvoAFbP4HGFT0XXsEzvOWDMLsIhTHCL0YhumLMMFS
   YJHUm2SgTg5djeQzNqcywIexoF3PLUM+xsh5IQ54Vbkbmij9Rw3d2HtYw
   c=;
X-CSE-ConnectionGUID: m7wgX8r3TtyojGXzaG31EQ==
X-CSE-MsgGUID: iUoI4izfRKGAZjCmIJCB+Q==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 126871068
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:RwYDPqq0VJoJ7foGhoGzKsxFO2JeBmJuZRIvgKrLsJaIsI4StFCzt
 garIBmAaKzfZWr3Ld9zPtvn8ktVvpfcx941TQZl+Cs1EikapZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04G9wUmAWP6gR5waHzSJNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADVScR+z1/jt/K6qTetDttYqA5KyEbpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSaxFIUPrSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 ziYrzugWk9KXDCZ4Tu49VPwh/3BpwDUcbAQP7iZ1NVAw2TGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOr9QqTDYn0
 luImdLBBjF1trCRD3WH+d+8sjeaKSUTa2gYakcsTxYB4tTliJE+iFTIVNkLLUKupoSrQ3eqm
 WnM9XVvwepL5SIW60ml1VWYnD2c9oKSchIk4Qf4bnCswVggSbfwMuRE9mPnAeZ8wJexFwbZ5
 CdZxpPBs4gz4YexeDthqdjh/Y1FBN7faVUweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoOvMcNYyT6PPQoPd3Z5yEWIU7IT4+Nuhf8N4omX3SMXFXfoHEGibC4gwgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eZD+8zK/kuKHcqT503+gdKjiIu9Fe9t3K2mMrpos8tpYWz9r
 75iCid940QFAb2uMniNqeb+7zkidBAGOHw/kOQPHsbrH+asMDhJ5yP5qV/5R7FYog==
IronPort-HdrOrdr: A9a23:yOaFRKEYBQw6+qs9pLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 STdZUgpHnJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qE/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-Talos-CUID: 9a23:0kECvmG+3+vpWzVjqmJiq1EbKpA/KUHB3XDSDH+qAEkyEZCsHAo=
X-Talos-MUID: 9a23:trecuAhKG1ueNL8YUUlUjsMpNfpvwvivGk43srovicuvMA1SEB3etWHi
X-IronPort-AV: E=Sophos;i="6.04,222,1695700800"; 
   d="scan'208";a="126871068"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH] tools/pygrub: Drop compatibility symlink
Date: Thu, 23 Nov 2023 16:30:23 +0000
Message-ID: <20231123163023.2158134-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This was declared deprecated in commit 10c88f1c18b7 ("tools: Install pv
bootloaders in libexec rather than /usr/bin") in 2012

Take it out fully now, 11 years later.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 CHANGELOG.md          | 3 +++
 tools/pygrub/Makefile | 6 ------
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 4ecebb9f686a..36a8ef89d8e4 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Removed
 - caml-stubdom.  It hasn't built since 2014, was pinned to Ocaml 4.02, and has
   been superseded by the MirageOS/SOLO5 projects.
+- /usr/bin/pygrub symlink.  This was deprecated in Xen 4.2 (2012) but left for
+  compatibility reasons.  VMs configured with bootloader="/usr/bin/pygrub"
+  should be updated to just bootloader="pygrub".
 
 ## [4.18.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-11-16
 
diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
index 4963bc89c6ed..d5e291ea0619 100644
--- a/tools/pygrub/Makefile
+++ b/tools/pygrub/Makefile
@@ -22,15 +22,9 @@ install: all
 	$(setup.py) install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
 		--root="$(DESTDIR)" --force
 	$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
-	set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
-	             "`readlink -f $(DESTDIR)/$(bindir)`" != \
-	             "`readlink -f $(LIBEXEC_BIN)`" ]; then \
-	    ln -sf $(LIBEXEC_BIN)/pygrub $(DESTDIR)/$(bindir); \
-	fi
 
 .PHONY: uninstall
 uninstall:
-	rm -f $(DESTDIR)/$(bindir)/pygrub
 	if [ -e $(INSTALL_LOG) ]; then \
 		cat $(INSTALL_LOG) | xargs -i rm -f $(DESTDIR)/{}; \
 	fi

base-commit: f96e2f64576cdbb147391c7cb399d393385719a9
-- 
2.30.2


