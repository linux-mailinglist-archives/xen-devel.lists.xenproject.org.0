Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794B664F0F0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 19:26:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464888.723475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FPB-0008PL-BJ; Fri, 16 Dec 2022 18:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464888.723475; Fri, 16 Dec 2022 18:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FPB-0008MI-7j; Fri, 16 Dec 2022 18:25:57 +0000
Received: by outflank-mailman (input) for mailman id 464888;
 Fri, 16 Dec 2022 18:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjE=4O=citrix.com=prvs=342889366=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p6FP9-0008JE-LL
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 18:25:55 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12969fd6-7d6f-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 19:25:54 +0100 (CET)
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
X-Inumbo-ID: 12969fd6-7d6f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671215154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pkx+gUPbV7RhTA8lMVSEQj8qou0HNc5ehSj2n3VmU4U=;
  b=aL3oKlGV2aUXZJP0cm771zHVKp+EHH4Xnt8njYXTpvgRjBOOdUTc4jn/
   cWpF4SmhALE+vWqHNnxZtzErcCj4J50AZHsxMosDdPy5DAXIth946yMld
   Jdj04WzKaP1PEW0geNSdd1h2cev/z3LPboRZqz82+twUXocJ95IQe2Yym
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91288385
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6ZjQqKPytWnkEOHvrR2Vl8FynXyQoLVcMsEvi/4bfWQNrUpzgmEAy
 zcdW23VaP7camf1KI10a4vloB5X6J7Un95nGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vdzOWISq
 tcWFDQccCCEvL/u+rKjZuY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTIJ8yguauwGX4aTpbgFmUubA28y7YywkZPL3FYYOPKozRFZg9ckCwv
 FDf4UrzLTAgCdGm9CO6ynfzl8LWgnauMG4VPOLhraM76LGJ/UQMDDUGWF39puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQkqcs3SDoCx
 lKP2dTzClRHq6aJQHiQ8rOVqzKaOiUPK2IGIygeQmM4D8LL+d9pyEiVF5A6TfDz3oad9SzML
 y6ivSwGhOlMpsA307SlzVf83mqWpoDlQVtgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJbHsr1XZX2ZvGnUGbhWQun1jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9jpYyjJ5fK6fTgAahwzRoQmX3SJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTpHr5HgOZ6lnhimws/oKwXKDz+gdKjiIO9E+9ZYDNikMhnhE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuwaMidBAG6WTNg5UPLIare1M2cFzN/teNmdvNjaQ5xfUK/goJl
 1nhMnJlJK3X2SWWdFjWNy48ONsCn/9X9BoGAMDlBn7ws1BLXGplxP53m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:lEDr6qh5QXh6sPpeooaslsXzt3BQXj0ji2hC6mlwRA09TyXPrb
 HJoB1773DJYVMqMk3I9urtBEDtewKmyXcx2/hoAV7AZmfbUQmTXeZfBNDZsl/d8kTFn4ZgPO
 VbAstD4bvLfD1HZK3BkXCF+rgbreWvweSBmOKb92tgUQ1LRshbnn1EIzfeOlByTBNdBZI/UL
 6V5s8Cgza7Y3wYYoCaCxA+PtTrlpniiZfvewQHDxlizAGPiHeU87b8CRCTwxcZVHduzN4ZkV
 QsnWTCl8GeWqGAoSPh6w==
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="91288385"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>
Subject: [PATCH v4 05/11] CODING-STYLE(tools/ocaml): add .editorconfig to clarify indentation uses spaces
Date: Fri, 16 Dec 2022 18:25:14 +0000
Message-ID: <bc7f3ab700525288938b84c9fbcc0f4ac6bd804c.1671214525.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671214525.git.edwin.torok@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add an .editorconfig to make it easier to keep patches compatible with
Xen's coding style, and to reemphasize what Xen's coding style is.

I thought that Xen demands tabs rather than spaces (which is more
difficult with OCaml because indentation tools use spaces,
and the use of tabs requires changing editor settings),
however CODING-STYLE says it is spaces.

Document this explicitly by adding a .editorconfig file (see editorconfig.org),
which is an editor agnostic format for specifying basic style properties like
indentation, either with native support in editors or via plugins.

It is safer than modelines because it only supports controlling a
restricted set of editor properties and not arbitrary commands as Vim
modelines would have, and works with editors other than Vim too.
(Vim has a deny list for modeline sandboxing, which is error-prone
because every time a new command gets added it needs to be added to the
deny list, which has been the source of a few CVEs in the past
and I disable Vim modelines everywhere as a precaution).

This file is added as a convenience for those who might have an editor
that supports it, and its presence should have no impact on those that
do not (want to) use it.
It also won't cause re-indentation of existing files when edited, only
newly added lines would follow the convention.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Cc: Christian Lindig <christian.lindig@citrix.com>
---
 .editorconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 .editorconfig

diff --git a/.editorconfig b/.editorconfig
new file mode 100644
index 0000000000..cb2f27c581
--- /dev/null
+++ b/.editorconfig
@@ -0,0 +1,20 @@
+# See ./CODING_STYLE
+root = true
+
+[*]
+end_of_line = lf
+indent_style = space
+charset = utf-8
+max_line_length = 79
+trim_trailing_whitespace = true
+insert_final_newline = true
+
+# Makefiles must use tabs, otherwise they don't work
+[{Makefile,*.mk,Makefile.rules}]
+indent_style = tabs
+
+[*.{c,h}]
+indent_size = 4
+
+[*.{ml,mli}]
+indent_size = 2
-- 
2.34.1


