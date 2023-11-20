Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E9E7F20B0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 23:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637327.993076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D59-0005yD-NA; Mon, 20 Nov 2023 22:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637327.993076; Mon, 20 Nov 2023 22:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D59-0005vD-Fm; Mon, 20 Nov 2023 22:49:31 +0000
Received: by outflank-mailman (input) for mailman id 637327;
 Mon, 20 Nov 2023 22:49:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5D57-0005pp-BF
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 22:49:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cdfd9a8-87f7-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 23:49:26 +0100 (CET)
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
X-Inumbo-ID: 0cdfd9a8-87f7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700520566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fXKH+lmodmLPygRsUw8ADaKchTw1j5k6JR9llmINrLo=;
  b=XhzxsYNbETJpZqQHJyRyLACtcZ0P7u4YMUVE7MSv0peB4hAmu0IEUuu5
   RVa5Zmf6LbM6/BUkmPKDj7Y/qh0UsKgMPXK06rzGrXdxS774qmjawUZaQ
   CAshBu6EsepUIhGZWEpZFL6WCbAc/vrCuQ87l1HPSVKaVvY7gxw4eEsdD
   w=;
X-CSE-ConnectionGUID: LtYo8xJLRvC+jqiF6E23hw==
X-CSE-MsgGUID: bUpW3/HoQGi4hHSN83IxsA==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127436304
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:NRCWsKPWwwIoxHjvrR2ll8FynXyQoLVcMsEvi/4bfWQNrUpx0jAHm
 2AcUDzXafaNN2LyLttzbduy8BkA75LXx9ZjSwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/7rRC9H5qyo42pB5ARmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sJrMGYe5
 d48Ei4mLRKahszo7ejgSvY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEOHwwNHwsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4bVGZ4LxR7Ez
 o7A127EGi5Bc/yY8BWErnKMvcmfxgLrQ6tHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceQz0h0
 VuA2c3kGSZutry9Q2+S7bqSonW5Pi19BXUFbyIeUQxD6dDspogphzrFU9l4Hai6yNbyHFnNL
 yui9XZkwe9J1IhSivT9ogivby+QSobhahIE4VXHfEaf8Cg6ZpekSdKFswPb8qMVRGqGdWVtr
 EToiuDHs7hWUcDTznXTKNjhCo1F8BpsDdE9vbKMN8N4n9hV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPAvO9/pVp52lPG/S7wJs8w4iPIUOvCdkyfdpElTibO4hTixwCDAb4ljU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HPjGI+Cc+ePGPha9EO5VWGZim8hltMtoVi2Jq
 YcAXyZLoj0DONDDjt7/qN9PdA1SdCBkVPgbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:/82i1aPMKG9BnsBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-Talos-CUID: 9a23:4OQ3wW7pNSFkW19Rmtss0FIlHZA1UFnn0lyTIVa5JzhEEuaVVgrF
X-Talos-MUID: 9a23:fvtYYQWPqreOFqPq/DXRnA45c+dv2ouvVEAtqrNW4OiULgUlbg==
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="127436304"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>
Subject: [PATCH 1/6] x86/setup: Make the loader variable const
Date: Mon, 20 Nov 2023 22:49:07 +0000
Message-ID: <20231120224912.1421916-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It is never written to, but has a string literal assigned, and needs to be
const to support -Wwrite-strings

Suggested-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/setup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a3d3f797bb1e..c41dfdb2bdf8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -971,8 +971,8 @@ static struct domain *__init create_dom0(const module_t *image,
 /* SAF-1-safe */
 void __init noreturn __start_xen(unsigned long mbi_p)
 {
-    const char *memmap_type = NULL;
-    char *cmdline, *kextra, *loader;
+    const char *memmap_type = NULL, *loader;
+    char *cmdline, *kextra;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
     unsigned int initrdidx, num_parked = 0;
@@ -1023,8 +1023,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         mod = __va(mbi->mods_addr);
     }
 
-    loader = (mbi->flags & MBI_LOADERNAME)
-        ? (char *)__va(mbi->boot_loader_name) : "unknown";
+    loader = (mbi->flags & MBI_LOADERNAME) ? __va(mbi->boot_loader_name)
+                                           : "unknown";
 
     /* Parse the command-line options. */
     cmdline = cmdline_cook((mbi->flags & MBI_CMDLINE) ?
-- 
2.30.2


