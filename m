Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F0D63DC0E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 18:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450098.707288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QxV-0005cT-BT; Wed, 30 Nov 2022 17:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450098.707288; Wed, 30 Nov 2022 17:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QxV-0005Yu-76; Wed, 30 Nov 2022 17:33:21 +0000
Received: by outflank-mailman (input) for mailman id 450098;
 Wed, 30 Nov 2022 17:33:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pd0=36=citrix.com=prvs=3269fc642=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0QxT-00053d-7P
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 17:33:19 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12ca3d45-70d5-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 18:33:17 +0100 (CET)
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
X-Inumbo-ID: 12ca3d45-70d5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669829597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R8tS9VgTmZCKkVg8mid7m3tdzdgd3LVHFCyxaU4xcZE=;
  b=FjvBuq5NbV1i4ABe7mZQ3MtfUW7glSdeysPyITmSFAksVJgPbf5BvIT7
   EMmqN7V8No+ebD5WZ4VqjPgJ4cE/WEd3iwCwc0cN/NRQ/EPd68cMdBGf3
   ZTAzUnAwARkO7BTYIKvLp+UKfmbNMLFXEuiBtEqMYyBIJdROpLInrRS5t
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 85454980
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CghTFam5DW/h/esGzeJ12fHo5gyVJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMUDyEa/yOYmejKdtzPduwphlVsZeDzNBlHgQ4rC9kQSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5weGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eRJGTlSU0ynvMX12bGZVe5ulMAKCNa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrnTzbTxe7k6Sv600y2PS0BZwwP7mN9+9ltmiFZgJwxrJ9
 jquE2LRAxAdbdq17CW/8nf2uNbdmXv1WsEWC+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhIVRdd4CeAx7wCJjK3O7G6xGWwsXjNHLts8u6cLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aIXkkJDA/OQs/akgc4Pv8p4MhijvrUYM2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD3271k5JAVdoKiN2bGKuOGphsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QQM8ctKlHaon0yOyZ8OlwBdmB2ycnT3
 r/CIa6R4YsyU/w7nFJauc9CuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimN4gEAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/Fqmhmre1E3Qjh+W6KJmNvMueVNxsxoqwsBx
 VnlMmcw9bY1rSevxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:qeUwlqE+62/8kLzupLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="85454980"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 5/5] CODING_STYLE: add .clang-format
Date: Wed, 30 Nov 2022 17:32:37 +0000
Message-ID: <bf4013cdb5f3e66693551b5e45b3f975b5a48795.1669829264.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669829264.git.edvin.torok@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
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

Once this is used it'll need inserting some '#include <stdint.h>', otherwise xs_wire.h
fails to compile due to the missing uint32_t define.

Does not yet reformat any code.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
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


