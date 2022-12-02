Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A16640571
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 12:04:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451830.709627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13pf-0008WS-UA; Fri, 02 Dec 2022 11:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451830.709627; Fri, 02 Dec 2022 11:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13pf-0008Ug-Qt; Fri, 02 Dec 2022 11:03:51 +0000
Received: by outflank-mailman (input) for mailman id 451830;
 Fri, 02 Dec 2022 11:03:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Iy3=4A=citrix.com=prvs=3285f5271=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p13jX-0005B6-Vi
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 10:57:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15f668ba-7230-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 11:57:23 +0100 (CET)
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
X-Inumbo-ID: 15f668ba-7230-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669978650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UY5V1ztvLDHDeM6oRGbllgDT8thJsbWRrKuqMI5IDOE=;
  b=aADnUJYBoV5l3PmH4WogsKtAJ2htxGZ8GEfiSHHvipDRUbrQvZPNOUyS
   MZk/skEuW6ywvOdyN4u3NJWpsbAbKIJB3NT9kSd/6XrxxQ48jdO7f7f1Q
   fOzhngvRO+6ZD+pPWTQ/0sUCuUD/k7sGQOYUENZQsI4mI1/MuY5R9EMfy
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88766325
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:h7whramvFpViImZ7eQqQgGbo5gyJJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKD2iOMv/cY2rwKdkjPd7n9RkDuJHRn9YwTQA9pH80HyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kR5AWGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dlGEmkUMzGevd2/xevmFsNLu/4AMNa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrnTzbTxe7k6Sv600y2PS0BZwwP7mN9+9ltmiFZUKwBjD/
 D+uE2LRPzQeNNCx0TO/40mSjMDChTLqBtoLPejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhIVRdd4CeAx7wCJjK3O7G6xGWwsXjNHLts8u6cLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aHHYvdHZfRDI+cgIAuoS/iqYOtDHTUYM2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD3271k5JAVdoKiN2bGKuOGphsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QQM8koJVHep383OCZ8OlwBd2B1wckC1
 WqzK57wXR7294w4pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29EN843K+1Rrlhtsus+VyFm
 +uzwuPWk32zpsWiOHiImWPSRHhWRUUG6Wfe8JMNK77Zf1E4QgnMyZb5mNscRmCspIwN/s+gw
 513chQEkjITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:c3YxjKzE1kqWzBQM45gCKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.96,212,1665460800"; 
   d="scan'208";a="88766325"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 4/4] tools/ocaml: add .clang-format
Date: Fri, 2 Dec 2022 10:55:59 +0000
Message-ID: <d4875eb966303398bf44c168b455b47544eb1edc.1669978356.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669978356.git.edvin.torok@citrix.com>
References: <cover.1669978356.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add a .clang-format configuration that tries to match CODING_STYLE where
possible.

I was not able to express the special casing of braces after 'do'
though, this can only be controlled generally for all control
statements.
It is imperfect, but should be better than the existing bindings, which
do not follow Xen coding style.

Add this to tools/ocaml first because:
* there are relatively few C files here, and it is a good place to start with
* it'd be useful to make these follow Xen's CODING_STYLE
(which they currently do not because they use tabs for example)
* they change relatively infrequently, so shouldn't cause issues with
  backporting security fixes (could either backport the reindentation
  patch too, or use git cherry-pick with `-Xignore-space-change`)

Does not yet reformat any code.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
Changes since v1:
* change commit title to reflect this is for OCaml subtree only
* don't mention stdint.h here, that may be fixed in a different way elsewhere
---
 tools/ocaml/.clang-format | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 tools/ocaml/.clang-format

diff --git a/tools/ocaml/.clang-format b/tools/ocaml/.clang-format
new file mode 100644
index 0000000000..7ff88ee043
--- /dev/null
+++ b/tools/ocaml/.clang-format
@@ -0,0 +1,9 @@
+BasedOnStyle: GNU
+IndentWidth: 4
+
+# override GNU to match Xen ../../CODING_STYLE more closely
+AlwaysBreakAfterDefinitionReturnType: None
+AlwaysBreakAfterReturnType: None
+SpacesInConditionalStatement: true
+SpaceBeforeParens: ControlStatements
+BreakBeforeBraces: Allman
-- 
2.34.1


