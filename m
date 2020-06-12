Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9362D1F76F2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 12:56:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjhLh-0004RF-Tb; Fri, 12 Jun 2020 10:55:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4JN/=7Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jjhLg-0004R8-Tc
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 10:55:48 +0000
X-Inumbo-ID: 44e14b14-ac9b-11ea-8496-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44e14b14-ac9b-11ea-8496-bc764e2007e4;
 Fri, 12 Jun 2020 10:55:46 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: oyqfG7pWJjfrdc3HHfqcE7uu2ZRzS4OEvBC5OiKvK+DKMxFY8l9GwV3BnR4jtkWkwQAbnGKrdD
 Vxz+ZLh1eiMCaFV/6m/DjR2MCX9s7aVEVHPOCz9BQOP2+uzO5t161H2eSoUZ7JrDzbSQHWoVH8
 FQ/Re/9wsbw40qWLCKITEw0sGC4TSD0ZqfDon0NBS5gA0P9UzRK/mWc10ZhIrMlnK8V2MLHiUU
 z140UHgUbTAAZOoG7lkI74MLsn755D14X/leGplUymLH9IEhHE5qsi7QyXi88mhCBv+6wWzu7/
 aN8=
X-SBRS: 2.7
X-MesageID: 20186911
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20186911"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] tools/libxc: Drop config_transformed parameter from
 xc_cpuid_set()
Date: Fri, 12 Jun 2020 11:55:19 +0100
Message-ID: <20200612105519.18728-1-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

libxl is now the sole caller of xc_cpuid_set().  The config_transformed output
is ignored, and this patch trivially highlights the resulting memory leak.

"transformed" config is now properly forwarded on migrate as part of the
general VM state, so delete the transformation logic completely, rather than
trying to adjust just libxl to avoid leaking memory.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>

For 4.14 for hopefully obvious reasons.

Ian: for backport to 4.13 and earlier, there are a number of options.  The
reasoning we used to delete the other callers of xc_cpuid_set() is still
valid, but probably not backport material.

OTOH, moding libxl_cpuid_set() (as it was back then) to loop over cpuid_res[]
and free them all should work.
---
 tools/libxc/include/xenctrl.h |  3 +--
 tools/libxc/xc_cpuid_x86.c    | 25 +------------------------
 tools/libxl/libxl_cpuid.c     |  3 +--
 3 files changed, 3 insertions(+), 28 deletions(-)

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index f9e17ae424..113ddd935d 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -1795,8 +1795,7 @@ int xc_domain_debug_control(xc_interface *xch,
 int xc_cpuid_set(xc_interface *xch,
                  uint32_t domid,
                  const unsigned int *input,
-                 const char **config,
-                 char **config_transformed);
+                 const char **config);
 
 /*
  * Make adjustments to the CPUID settings for a domain.
diff --git a/tools/libxc/xc_cpuid_x86.c b/tools/libxc/xc_cpuid_x86.c
index 89d2ecdad2..b42edd6457 100644
--- a/tools/libxc/xc_cpuid_x86.c
+++ b/tools/libxc/xc_cpuid_x86.c
@@ -279,7 +279,7 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
  */
 int xc_cpuid_set(
     xc_interface *xch, uint32_t domid, const unsigned int *input,
-    const char **config, char **config_transformed)
+    const char **config)
 {
     int rc;
     unsigned int i, j, regs[4] = {}, polregs[4] = {};
@@ -288,9 +288,6 @@ int xc_cpuid_set(
     unsigned int nr_leaves, policy_leaves, nr_msrs;
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
 
-    for ( i = 0; i < 4; ++i )
-        config_transformed[i] = NULL;
-
     if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
          di.domid != domid )
     {
@@ -365,13 +362,6 @@ int xc_cpuid_set(
             continue;
         }
 
-        config_transformed[i] = calloc(33, 1); /* 32 bits, NUL terminator. */
-        if ( config_transformed[i] == NULL )
-        {
-            rc = -ENOMEM;
-            goto fail;
-        }
-
         /*
          * Notes for following this algorithm:
          *
@@ -399,11 +389,6 @@ int xc_cpuid_set(
                 set_feature(31 - j, regs[i]);
             else
                 clear_feature(31 - j, regs[i]);
-
-            config_transformed[i][j] = config[i][j];
-            /* All non 0/1 values get overwritten. */
-            if ( (config[i][j] & ~1) != '0' )
-                config_transformed[i][j] = '0' + val;
         }
     }
 
@@ -421,16 +406,8 @@ int xc_cpuid_set(
     }
 
     /* Success! */
-    goto out;
 
  fail:
-    for ( i = 0; i < 4; i++ )
-    {
-        free(config_transformed[i]);
-        config_transformed[i] = NULL;
-    }
-
- out:
     free(leaves);
 
     return rc;
diff --git a/tools/libxl/libxl_cpuid.c b/tools/libxl/libxl_cpuid.c
index 4e4852ddeb..796ec4f2d9 100644
--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -421,7 +421,6 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
 {
     libxl_cpuid_policy_list cpuid = info->cpuid;
     int i;
-    char *cpuid_res[4];
     bool pae = true;
 
     /*
@@ -444,7 +443,7 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
 
     for (i = 0; cpuid[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++)
         xc_cpuid_set(ctx->xch, domid, cpuid[i].input,
-                     (const char**)(cpuid[i].policy), cpuid_res);
+                     (const char**)cpuid[i].policy);
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
-- 
2.11.0


