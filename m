Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08AF1F7C83
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 19:33:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjnY3-0008Bm-07; Fri, 12 Jun 2020 17:32:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4JN/=7Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jjnY1-0008Bh-Ra
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 17:32:57 +0000
X-Inumbo-ID: c047611d-acd2-11ea-b5f7-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c047611d-acd2-11ea-b5f7-12813bfff9fa;
 Fri, 12 Jun 2020 17:32:56 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: nMAyqSWmwSEvqO3XGye95m8HDLt9j7syn51Sm9Qxz5iTSSZ7CG9xbzTOUl2OihtrLlC7JtOOW0
 aWdMGvJmTkRECfAbP3njl75jjtNexLEZ7obYJWEBAmGHuziKG0H0fHNChYHhJamjBwCaFrr45G
 i+qhypjFqmrEx/biepor8hPgFdSrOmKuuEmPYrA/XJsP/9kAnUUAxhUhRZVx32d8/1hZeuyRiT
 L1/ztmosGCrAO3A3FiIqpqoHC1HXIKQrBLZeSLN6F0M9bSw1L5nCuA2qWHDm5HKR51/ONLMTzw
 lTo=
X-SBRS: 2.7
X-MesageID: 19927827
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,504,1583211600"; d="scan'208";a="19927827"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.13] tools/libxl: Fix memory leak in libxl_cpuid_set()
Date: Fri, 12 Jun 2020 18:32:27 +0100
Message-ID: <20200612173227.4103-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

xc_cpuid_set() returns allocated memory via cpuid_res, which libxl needs to
free() seeing as it discards the results.

This is logically a backport of c/s b91825f628 "tools/libxc: Drop
config_transformed parameter from xc_cpuid_set()" but rewritten as one caller
of xc_cpuid_set() does use returned values.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <Ian.Jackson@citrix.com>

Applicable for 4.13 and older.

I'm not going to touch the Ocaml bindings - they're wrong in multiple ways
including this memory leak, and we deleted them in 4.14 because they were
totally unused.
---
 tools/libxl/libxl_cpuid.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_cpuid.c b/tools/libxl/libxl_cpuid.c
index a78f08b927..083869dcf4 100644
--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -420,12 +420,17 @@ void libxl_cpuid_apply_policy(libxl_ctx *ctx, uint32_t domid)
 void libxl_cpuid_set(libxl_ctx *ctx, uint32_t domid,
                      libxl_cpuid_policy_list cpuid)
 {
-    int i;
+    int i, j;
     char *cpuid_res[4];
 
     for (i = 0; cpuid[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++)
+    {
         xc_cpuid_set(ctx->xch, domid, cpuid[i].input,
                      (const char**)(cpuid[i].policy), cpuid_res);
+
+        for (j = 0; j < ARRAY_SIZE(cpuid_res); ++j)
+            free(cpuid_res[j]);
+    }
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
-- 
2.11.0


