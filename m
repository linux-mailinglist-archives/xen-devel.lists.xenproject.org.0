Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33952621864
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440123.694222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQch-0002gk-Cf; Tue, 08 Nov 2022 15:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440123.694222; Tue, 08 Nov 2022 15:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQch-0002Z6-52; Tue, 08 Nov 2022 15:34:47 +0000
Received: by outflank-mailman (input) for mailman id 440123;
 Tue, 08 Nov 2022 15:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQcf-0001RY-DW
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:34:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de6dd23c-5f7a-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:34:44 +0100 (CET)
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
X-Inumbo-ID: de6dd23c-5f7a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hFwOQ0qz0r8WVELNrCnoJk/t1j0zykfo+WnLiqOMwyw=;
  b=Klv7V+3Qx1XW93rPVSgJcUaA/Xe61wt0hWQx9Q/r3aX4oYHUle/odHJb
   pMYtfKjIsXIPtI5niHf5Oiug7UA29hUXm1ilFln2HCMDBUfMJ/F/uePxG
   qMpSYVT45XWHZcQmpI7MnAxSEKT10WNG1JwcaouU+MdV3WnhjMbSTFYl0
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84828538
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6JTXyKJ3uP2D3kF3FE+R3ZUlxSXFcZb7ZxGr2PjKsXjdYENSgTBSz
 TEdUG+Oa62IM2qgfdglPd++8xsAu5+Dn4BkHQZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wRuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4qMFpn/
 9YhJQkPVR6c2L+Jmp6cG9Nz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLozkPmpgD/jdCdfq3qepLYt4niVxwt0uFToGIqJKobaGJ4F9qqej
 iXv03mmLEgcD8KS72a361n1utDKmgquDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Ua5QeX2+zr6gCWLmEeS3hKb9lOnMM/WzECz
 FKCmNLtQzt1v9WopWm1r+nO62noYG5McDFENXRsoRY5D8fL/bAIpxjld9taEpW7kYKoJmvc5
 GGws31r71kMtvIj26K+9FHBpjujoJnVUwI4jjnqsnKZAhBRP9D8OdHxgbTPxbMZddvCEAHd1
 JQRs5LGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuLGpxaEdMKS
 BWJ0e+02HO0FCrCUEOPS9jtY/nGNIC5fTklP9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9hZ
 sfHL5/0VSxEWcyLKQZaoM9Ej9cWKt0WnzuPFfgXMTz7uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikn1ivSyXSne/zLP/2nhTfCVkX8ut85wOHgNBSyI/cFwc5zbq6etJU+RYc259zI8kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:fp48/6sAKgVmYzN+f0e2iV/A7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84828538"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 05/15] tools/ocaml/Makefile.rules: do not run ocamldep on distclean
Date: Tue, 8 Nov 2022 15:33:57 +0000
Message-ID: <62e88f2badd7bb3cfb709254258dc6af40c87a45.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fixes: 2f2b76d47c5bcd9 ("tools/ocaml: do not run ocamldep during make clean")

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Reason for inclusion in 4.17:
- addresses review comments received post commit

Changes since v2:
- add Fixes line
- add 4.17 reason
---
 tools/ocaml/Makefile.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index 0d3c6ac839..e0b9de34e4 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -44,7 +44,7 @@ META: META.in
 
 ALL_OCAML_OBJ_SOURCES=$(addsuffix .ml, $(ALL_OCAML_OBJS))
 
-ifneq ($(MAKECMDGOALS),clean)
+ifeq (,$(findstring clean,$(MAKECMDGOALS)))
 .ocamldep.make: $(ALL_OCAML_OBJ_SOURCES) Makefile $(OCAML_TOPLEVEL)/Makefile.rules
 	$(call quiet-command, $(OCAMLDEP) $(ALL_OCAML_OBJ_SOURCES) *.mli $o,MLDEP,)
 endif
-- 
2.34.1


