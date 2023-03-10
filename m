Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1496B520A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 21:38:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508585.783399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pajUg-0007mv-Mt; Fri, 10 Mar 2023 20:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508585.783399; Fri, 10 Mar 2023 20:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pajUg-0007kT-JT; Fri, 10 Mar 2023 20:37:38 +0000
Received: by outflank-mailman (input) for mailman id 508585;
 Fri, 10 Mar 2023 20:37:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cIIN=7C=citrix.com=prvs=426914f36=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pajUf-0007G2-5Y
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 20:37:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62ca3ef9-bf83-11ed-956e-85ef70e17bfa;
 Fri, 10 Mar 2023 21:37:35 +0100 (CET)
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
X-Inumbo-ID: 62ca3ef9-bf83-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678480655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vWKg24kXULjAm/MIBSk16wv0jwgKTvpBpsdeyDx77L0=;
  b=LgzMsFphtFV5qjDfriZSGomjvX7TegV8a8nw77Sf3o6H0ANu14ij9gpX
   mi+hvw5b/I8l4nA5UBCuFgD5UxKSwbjzfeVGxH1LZYrR/uUgB7R5+4moC
   RAGzF1m2HYLxF9E5Xjczf8YF8/35Fq4fX79cBpE/VePwiuZDmFP+bKPx0
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100282288
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:nML/MK6hTN16GX4sYFWVNwxRtCnHchMFZxGqfqrLsTDasY5as4F+v
 mBOWzqGb/fYN2H1fd90YI6+9xhS6sKDm4RqQAdsrSFjHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS5AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 61BBDsPYzG4qvu42Iq8FeBJqOV8FZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx7A/
 DKcpTSpav0cHOG+8DSVzXm9utOV3iXQYqQpJref0tc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+nS9GnpUcQIEYMcTRFVFCcO4dTCm6wqgAr3SYlqNYCU0eSgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKvFmSx28zaK7onAMFh
 2eC0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZo3EyOhXKjj6wzBFEfUQD1
 XCzK5rEMJrnIf4/kGreqxk1i9fHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrlR0U9wmy2Mq
 4w3H5LTm31ivBjWPnG/HXg7cQpbchDWxPne96RqSwJ0ClE9QT1/VaePnetJlk4Mt/09q9okN
 0qVAidwoGcTT1Wdc21mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:SVLPaKFVHK15kswspLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.98,250,1673931600"; 
   d="scan'208";a="100282288"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 2/3] tools/xen-cpuid: Rework the handling of dynamic featuresets
Date: Fri, 10 Mar 2023 20:37:11 +0000
Message-ID: <20230310203712.1431387-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230310203712.1431387-1-andrew.cooper3@citrix.com>
References: <20230310203712.1431387-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

struct fsinfo is the vestigial remnant of an older internal design which
didn't survive very long.

Simplify things by inlining get_featureset() and having a single memory
allocation that gets reused.  This in turn changes featuresets[] to be a
simple list of names, so rename it to fs_names[].

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/misc/xen-cpuid.c | 53 ++++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 361102d8cfb1..227df7352e2b 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -246,16 +246,11 @@ static const struct {
 
 #define COL_ALIGN "18"
 
-static struct fsinfo {
-    const char *name;
-    uint32_t len;
-    uint32_t *fs;
-} featuresets[] =
-{
-    [XEN_SYSCTL_cpu_featureset_host] = { "Host", 0, NULL },
-    [XEN_SYSCTL_cpu_featureset_raw]  = { "Raw",  0, NULL },
-    [XEN_SYSCTL_cpu_featureset_pv]   = { "PV",   0, NULL },
-    [XEN_SYSCTL_cpu_featureset_hvm]  = { "HVM",  0, NULL },
+static const char *const fs_names[] = {
+    [XEN_SYSCTL_cpu_featureset_host] = "Host",
+    [XEN_SYSCTL_cpu_featureset_raw]  = "Raw",
+    [XEN_SYSCTL_cpu_featureset_pv]   = "PV",
+    [XEN_SYSCTL_cpu_featureset_hvm]  = "HVM",
 };
 
 static void dump_leaf(uint32_t leaf, const char *const *strs)
@@ -302,22 +297,10 @@ static void decode_featureset(const uint32_t *features,
     }
 }
 
-static int get_featureset(xc_interface *xch, unsigned int idx)
-{
-    struct fsinfo *f = &featuresets[idx];
-
-    f->len = nr_features;
-    f->fs = calloc(nr_features, sizeof(*f->fs));
-
-    if ( !f->fs )
-        err(1, "calloc(, featureset)");
-
-    return xc_get_cpu_featureset(xch, idx, &f->len, f->fs);
-}
-
 static void dump_info(xc_interface *xch, bool detail)
 {
     unsigned int i;
+    uint32_t *fs;
 
     printf("nr_features: %u\n", nr_features);
 
@@ -348,26 +331,34 @@ static void dump_info(xc_interface *xch, bool detail)
                       nr_features, "HVM Hap Default", detail);
 
     printf("\nDynamic sets:\n");
-    for ( i = 0; i < ARRAY_SIZE(featuresets); ++i )
+
+    fs = malloc(sizeof(*fs) * nr_features);
+    if ( !fs )
+        err(1, "malloc(featureset)");
+
+    for ( i = 0; i < ARRAY_SIZE(fs_names); ++i )
     {
-        if ( get_featureset(xch, i) )
+        uint32_t len = nr_features;
+        int ret;
+
+        memset(fs, 0, sizeof(*fs) * nr_features);
+
+        ret = xc_get_cpu_featureset(xch, i, &len, fs);
+        if ( ret )
         {
             if ( errno == EOPNOTSUPP )
             {
-                printf("%s featureset not supported by Xen\n",
-                       featuresets[i].name);
+                printf("%s featureset not supported by Xen\n", fs_names[i]);
                 continue;
             }
 
             err(1, "xc_get_featureset()");
         }
 
-        decode_featureset(featuresets[i].fs, featuresets[i].len,
-                          featuresets[i].name, detail);
+        decode_featureset(fs, len, fs_names[i], detail);
     }
 
-    for ( i = 0; i < ARRAY_SIZE(featuresets); ++i )
-        free(featuresets[i].fs);
+    free(fs);
 }
 
 static void print_policy(const char *name,
-- 
2.30.2


