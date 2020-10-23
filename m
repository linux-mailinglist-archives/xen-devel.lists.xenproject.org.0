Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BFE2973A2
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11206.29779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzto-0001K3-FF; Fri, 23 Oct 2020 16:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11206.29779; Fri, 23 Oct 2020 16:26:40 +0000
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
	id 1kVzto-0001II-3b; Fri, 23 Oct 2020 16:26:40 +0000
Received: by outflank-mailman (input) for mailman id 11206;
 Fri, 23 Oct 2020 16:26:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVztl-0000v3-I5
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d198a79-1aba-45cd-874b-371bd5d50ab7;
 Fri, 23 Oct 2020 16:26:22 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVztV-0008OE-9E; Fri, 23 Oct 2020 16:26:21 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqr-000376-3d; Fri, 23 Oct 2020 16:23:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVztl-0000v3-I5
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:37 +0000
X-Inumbo-ID: 0d198a79-1aba-45cd-874b-371bd5d50ab7
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0d198a79-1aba-45cd-874b-371bd5d50ab7;
	Fri, 23 Oct 2020 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=FS2lsRq/N5rr0lREQKsZJxqwgY3o2rJbmA8WgHHgsnw=; b=2+w1u1cHA7vnNQpXElGGIByv+
	yYiZwwKzcVmCuheAhZgrcCY3UVXQDufQD5+4a0ijPnDc6KGr8N2EksnWk9343oAPveZQAVsLxgIJ9
	5eqVu3WDTzy/FM2dCHnb9BqqiBY0R6wAGm/HIE/tV+Lp8SGIs982y4dHnK+mAohz/r55A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVztV-0008OE-9E; Fri, 23 Oct 2020 16:26:21 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqr-000376-3d; Fri, 23 Oct 2020 16:23:37 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 20/25] libxlu: introduce xlu_pci_parse_spec_string()
Date: Fri, 23 Oct 2020 16:23:09 +0000
Message-Id: <20201023162314.2235-21-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

This patch largely re-writes the code to parse a PCI_SPEC_STRING and enters
it via the newly introduced function. The new parser also deals with 'bdf'
and 'vslot' as non-positional paramaters, as per the documentation in
xl-pci-configuration(5).

The existing xlu_pci_parse_bdf() function remains, but now strictly parses
BDF values. Some existing callers of xlu_pci_parse_bdf() are
modified to call xlu_pci_parse_spec_string() as per the documentation in xl(1).

NOTE: Usage text in xl_cmdtable.c and error messages are also modified
      appropriately.

Fixes: d25cc3ec93eb ("libxl: workaround gcc 10.2 maybe-uninitialized warning")
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/libxlutil.h    |   8 +-
 tools/libs/util/libxlu_pci.c | 354 +++++++++++++++++++++++--------------------
 tools/xl/xl_cmdtable.c       |   4 +-
 tools/xl/xl_parse.c          |   4 +-
 tools/xl/xl_pci.c            |  37 +++--
 5 files changed, 220 insertions(+), 187 deletions(-)

diff --git a/tools/include/libxlutil.h b/tools/include/libxlutil.h
index 92e35c5462..cdd6aab4f8 100644
--- a/tools/include/libxlutil.h
+++ b/tools/include/libxlutil.h
@@ -109,9 +109,15 @@ int xlu_disk_parse(XLU_Config *cfg, int nspecs, const char *const *specs,
    */
 
 /*
+ * PCI BDF
+ */
+int xlu_pci_parse_bdf(XLU_Config *cfg, libxl_pci_bdf *bdf, const char *str);
+
+/*
  * PCI specification parsing
  */
-int xlu_pci_parse_bdf(XLU_Config *cfg, libxl_device_pci *pcidev, const char *str);
+int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pci,
+                              const char *str);
 
 /*
  * RDM parsing
diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index 5c107f2642..a8b6ce5427 100644
--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -1,5 +1,7 @@
 #define _GNU_SOURCE
 
+#include <ctype.h>
+
 #include "libxlu_internal.h"
 #include "libxlu_disk_l.h"
 #include "libxlu_disk_i.h"
@@ -9,185 +11,213 @@
 #define XLU__PCI_ERR(_c, _x, _a...) \
     if((_c) && (_c)->report) fprintf((_c)->report, _x, ##_a)
 
-static int hex_convert(const char *str, unsigned int *val, unsigned int mask)
+static int parse_bdf(libxl_pci_bdf *bdfp, uint32_t *vfunc_maskp,
+                     const char *str, const char **endp)
 {
-    unsigned long ret;
-    char *end;
-
-    ret = strtoul(str, &end, 16);
-    if ( end == str || *end != '\0' )
-        return -1;
-    if ( ret & ~mask )
-        return -1;
-    *val = (unsigned int)ret & mask;
+    const char *ptr = str;
+    unsigned int colons = 0;
+    unsigned int domain, bus, dev, func;
+    int n;
+
+    /* Count occurrences of ':' to detrmine presence/absence of the 'domain' */
+    while (isxdigit(*ptr) || *ptr == ':') {
+        if (*ptr == ':')
+            colons++;
+        ptr++;
+    }
+
+    ptr = str;
+    switch (colons) {
+    case 1:
+        domain = 0;
+        if (sscanf(ptr, "%x:%x.%n", &bus, &dev, &n) != 2)
+            return ERROR_INVAL;
+        break;
+    case 2:
+        if (sscanf(ptr, "%x:%x:%x.%n", &domain, &bus, &dev, &n) != 3)
+            return ERROR_INVAL;
+        break;
+    default:
+        return ERROR_INVAL;
+    }
+
+    if (domain > 0xffff || bus > 0xff || dev > 0x1f)
+        return ERROR_INVAL;
+
+    ptr += n;
+    if (*ptr == '*') {
+        if (!vfunc_maskp)
+            return ERROR_INVAL;
+        *vfunc_maskp = LIBXL_PCI_FUNC_ALL;
+        func = 0;
+        ptr++;
+    } else {
+        if (sscanf(ptr, "%x%n", &func, &n) != 1)
+            return ERROR_INVAL;
+        if (func > 7)
+            return ERROR_INVAL;
+        if (vfunc_maskp)
+            *vfunc_maskp = 1;
+        ptr += n;
+    }
+
+    bdfp->domain = domain;
+    bdfp->bus = bus;
+    bdfp->dev = dev;
+    bdfp->func = func;
+
+    if (endp)
+        *endp = ptr;
+
     return 0;
 }
 
-static int pci_struct_fill(libxl_device_pci *pci, unsigned int domain,
-                           unsigned int bus, unsigned int dev,
-                           unsigned int func, unsigned int vdevfn)
+static int parse_vslot(uint32_t *vdevfnp, const char *str, const char **endp)
 {
-    pci->bdf.domain = domain;
-    pci->bdf.bus = bus;
-    pci->bdf.dev = dev;
-    pci->bdf.func = func;
-    pci->vdevfn = vdevfn;
+    const char *ptr = str;
+    unsigned int val;
+    int n;
+
+    if (sscanf(ptr, "%x%n", &val, &n) != 1)
+        return ERROR_INVAL;
+
+    if (val > 0x1f)
+        return ERROR_INVAL;
+
+    ptr += n;
+
+    *vdevfnp = val << 3;
+
+    if (endp)
+        *endp = ptr;
+
     return 0;
 }
 
-#define STATE_DOMAIN    0
-#define STATE_BUS       1
-#define STATE_DEV       2
-#define STATE_FUNC      3
-#define STATE_VSLOT     4
-#define STATE_OPTIONS_K 6
-#define STATE_OPTIONS_V 7
-#define STATE_TERMINAL  8
-#define STATE_TYPE      9
-#define STATE_RDM_STRATEGY      10
-#define STATE_RESERVE_POLICY    11
-#define INVALID         0xffffffff
-int xlu_pci_parse_bdf(XLU_Config *cfg, libxl_device_pci *pci, const char *str)
+static int parse_key_val(char **keyp, char**valp, const char *str,
+                         const char **endp)
 {
-    unsigned state = STATE_DOMAIN;
-    unsigned dom = INVALID, bus = INVALID, dev = INVALID, func = INVALID, vslot = 0;
-    char *buf2, *tok, *ptr, *end, *optkey = NULL;
+    const char *ptr = str;
+    char *key, *val;
+
+    while (*ptr != '=' && *ptr != '\0')
+        ptr++;
 
-    if ( NULL == (buf2 = ptr = strdup(str)) )
+    if (*ptr == '\0')
+        return ERROR_INVAL;
+
+    key = strndup(str, ptr - str);
+    if (!key)
         return ERROR_NOMEM;
 
-    for(tok = ptr, end = ptr + strlen(ptr) + 1; ptr < end; ptr++) {
-        switch(state) {
-        case STATE_DOMAIN:
-            if ( *ptr == ':' ) {
-                state = STATE_BUS;
-                *ptr = '\0';
-                if ( hex_convert(tok, &dom, 0xffff) )
-                    goto parse_error;
-                tok = ptr + 1;
-            }
-            break;
-        case STATE_BUS:
-            if ( *ptr == ':' ) {
-                state = STATE_DEV;
-                *ptr = '\0';
-                if ( hex_convert(tok, &bus, 0xff) )
-                    goto parse_error;
-                tok = ptr + 1;
-            }else if ( *ptr == '.' ) {
-                state = STATE_FUNC;
-                *ptr = '\0';
-                if ( dom & ~0xff )
-                    goto parse_error;
-                bus = dom;
-                dom = 0;
-                if ( hex_convert(tok, &dev, 0xff) )
-                    goto parse_error;
-                tok = ptr + 1;
-            }
-            break;
-        case STATE_DEV:
-            if ( *ptr == '.' ) {
-                state = STATE_FUNC;
-                *ptr = '\0';
-                if ( hex_convert(tok, &dev, 0xff) )
-                    goto parse_error;
-                tok = ptr + 1;
-            }
-            break;
-        case STATE_FUNC:
-            if ( *ptr == '\0' || *ptr == '@' || *ptr == ',' ) {
-                switch( *ptr ) {
-                case '\0':
-                    state = STATE_TERMINAL;
-                    break;
-                case '@':
-                    state = STATE_VSLOT;
-                    break;
-                case ',':
-                    state = STATE_OPTIONS_K;
-                    break;
-                }
-                *ptr = '\0';
-                if ( !strcmp(tok, "*") ) {
-                    pci->vfunc_mask = LIBXL_PCI_FUNC_ALL;
-                }else{
-                    if ( hex_convert(tok, &func, 0x7) )
-                        goto parse_error;
-                    pci->vfunc_mask = (1 << 0);
-                }
-                tok = ptr + 1;
-            }
-            break;
-        case STATE_VSLOT:
-            if ( *ptr == '\0' || *ptr == ',' ) {
-                state = ( *ptr == ',' ) ? STATE_OPTIONS_K : STATE_TERMINAL;
-                *ptr = '\0';
-                if ( hex_convert(tok, &vslot, 0xff) )
-                    goto parse_error;
-                tok = ptr + 1;
-            }
-            break;
-        case STATE_OPTIONS_K:
-            if ( *ptr == '=' ) {
-                state = STATE_OPTIONS_V;
-                *ptr = '\0';
-                optkey = tok;
-                tok = ptr + 1;
-            }
-            break;
-        case STATE_OPTIONS_V:
-            if ( *ptr == ',' || *ptr == '\0' ) {
-                state = (*ptr == ',') ? STATE_OPTIONS_K : STATE_TERMINAL;
-                *ptr = '\0';
-                if ( !strcmp(optkey, "msitranslate") ) {
-                    pci->msitranslate = atoi(tok);
-                }else if ( !strcmp(optkey, "power_mgmt") ) {
-                    pci->power_mgmt = atoi(tok);
-                }else if ( !strcmp(optkey, "permissive") ) {
-                    pci->permissive = atoi(tok);
-                }else if ( !strcmp(optkey, "seize") ) {
-                    pci->seize = atoi(tok);
-                } else if (!strcmp(optkey, "rdm_policy")) {
-                    if (!strcmp(tok, "strict")) {
-                        pci->rdm_policy = LIBXL_RDM_RESERVE_POLICY_STRICT;
-                    } else if (!strcmp(tok, "relaxed")) {
-                        pci->rdm_policy = LIBXL_RDM_RESERVE_POLICY_RELAXED;
-                    } else {
-                        XLU__PCI_ERR(cfg, "%s is not an valid PCI RDM property"
-                                          " policy: 'strict' or 'relaxed'.",
-                                     tok);
-                        goto parse_error;
-                    }
-                } else {
-                    XLU__PCI_ERR(cfg, "Unknown PCI BDF option: %s", optkey);
-                }
-                tok = ptr + 1;
-            }
-        default:
-            break;
+    str = ++ptr; /* skip '=' */
+    while (*ptr != ',' && *ptr != '\0')
+        ptr++;
+
+    val = strndup(str, ptr - str);
+    if (!val) {
+        free(key);
+        return ERROR_NOMEM;
+    }
+
+    if (*ptr == ',')
+        ptr++;
+
+    *keyp = key;
+    *valp = val;
+    *endp = ptr;
+
+    return 0;
+}
+
+static int parse_rdm_policy(XLU_Config *cfg, libxl_rdm_reserve_policy *policy,
+                            const char *str)
+{
+    int ret = libxl_rdm_reserve_policy_from_string(str, policy);
+
+    if (ret)
+        XLU__PCI_ERR(cfg, "Unknown RDM policy: %s", str);
+
+    return ret;
+}
+
+int xlu_pci_parse_bdf(XLU_Config *cfg, libxl_pci_bdf *bdf, const char *str)
+{
+    return parse_bdf(bdf, NULL, str, NULL);
+}
+
+int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pcidev,
+                              const char *str)
+{
+    const char *ptr = str;
+    bool bdf_present = false;
+    int ret;
+
+    /* Attempt to parse 'bdf' as positional parameter */
+    ret = parse_bdf(&pcidev->bdf, &pcidev->vfunc_mask, ptr, &ptr);
+    if (!ret) {
+        bdf_present = true;
+
+        /* Check whether 'vslot' if present */
+        if (*ptr == '@') {
+            ret = parse_vslot(&pcidev->vdevfn, ++ptr, &ptr);
+            if (ret)
+                return ret;
         }
+        if (*ptr == ',')
+            ptr++;
+        else if (*ptr != '\0')
+            return ERROR_INVAL;
     }
 
-    if ( tok != ptr || state != STATE_TERMINAL )
-        goto parse_error;
+    /* Parse the rest as 'key=val' pairs */
+    while (*ptr != '\0') {
+        char *key, *val;
 
-    assert(dom != INVALID && bus != INVALID && dev != INVALID && func != INVALID);
+        ret = parse_key_val(&key, &val, ptr, &ptr);
+        if (ret)
+            return ret;
 
-    /* Just a pretty way to fill in the values */
-    pci_struct_fill(pci, dom, bus, dev, func, vslot << 3);
+        if (!strcmp(key, "bdf")) {
+            ret = parse_bdf(&pcidev->bdf, &pcidev->vfunc_mask, val, NULL);
+            bdf_present = !ret;
+        } else if (!strcmp(key, "vslot")) {
+            ret = parse_vslot(&pcidev->vdevfn, val, NULL);
+        } else if (!strcmp(key, "permissive")) {
+            pcidev->permissive = atoi(val);
+        } else if (!strcmp(key, "msitranslate")) {
+            pcidev->msitranslate = atoi(val);
+        } else if (!strcmp(key, "seize")) {
+            pcidev->seize= atoi(val);
+        } else if (!strcmp(key, "power_mgmt")) {
+            pcidev->power_mgmt = atoi(val);
+        } else if (!strcmp(key, "rdm_policy")) {
+            ret = parse_rdm_policy(cfg, &pcidev->rdm_policy, val);
+        } else {
+            XLU__PCI_ERR(cfg, "Unknown PCI_SPEC_STRING option: %s", key);
+            ret = ERROR_INVAL;
+        }
 
-    free(buf2);
+        free(key);
+        free(val);
 
-    return 0;
+        if (ret)
+            return ret;
+    }
 
-parse_error:
-    free(buf2);
-    return ERROR_INVAL;
+    if (!bdf_present)
+        return ERROR_INVAL;
+
+    return 0;
 }
 
 int xlu_rdm_parse(XLU_Config *cfg, libxl_rdm_reserve *rdm, const char *str)
 {
+#define STATE_TYPE           0
+#define STATE_RDM_STRATEGY   1
+#define STATE_RESERVE_POLICY 2
+#define STATE_TERMINAL       3
+
     unsigned state = STATE_TYPE;
     char *buf2, *tok, *ptr, *end;
 
@@ -227,15 +257,8 @@ int xlu_rdm_parse(XLU_Config *cfg, libxl_rdm_reserve *rdm, const char *str)
             if (*ptr == ',' || *ptr == '\0') {
                 state = *ptr == ',' ? STATE_TYPE : STATE_TERMINAL;
                 *ptr = '\0';
-                if (!strcmp(tok, "strict")) {
-                    rdm->policy = LIBXL_RDM_RESERVE_POLICY_STRICT;
-                } else if (!strcmp(tok, "relaxed")) {
-                    rdm->policy = LIBXL_RDM_RESERVE_POLICY_RELAXED;
-                } else {
-                    XLU__PCI_ERR(cfg, "Unknown RDM property policy value: %s",
-                                 tok);
+                if (!parse_rdm_policy(cfg, &rdm->policy, tok))
                     goto parse_error;
-                }
                 tok = ptr + 1;
             }
         default:
@@ -253,6 +276,11 @@ int xlu_rdm_parse(XLU_Config *cfg, libxl_rdm_reserve *rdm, const char *str)
 parse_error:
     free(buf2);
     return ERROR_INVAL;
+
+#undef STATE_TYPE
+#undef STATE_RDM_STRATEGY
+#undef STATE_RESERVE_POLICY
+#undef STATE_TERMINAL
 }
 
 /*
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 7da6c1b927..2ee0c49673 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -90,12 +90,12 @@ struct cmd_spec cmd_table[] = {
     { "pci-attach",
       &main_pciattach, 0, 1,
       "Insert a new pass-through pci device",
-      "<Domain> <BDF> [Virtual Slot]",
+      "<Domain> <PCI_SPEC_STRING>",
     },
     { "pci-detach",
       &main_pcidetach, 0, 1,
       "Remove a domain's pass-through pci device",
-      "<Domain> <BDF>",
+      "<Domain> <PCI_SPEC_STRING>",
     },
     { "pci-list",
       &main_pcilist, 0, 0,
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 0765780d9f..6a4703e745 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1487,10 +1487,10 @@ void parse_config_data(const char *config_source,
              * the global policy by default.
              */
             pci->rdm_policy = b_info->u.hvm.rdm.policy;
-            e = xlu_pci_parse_bdf(config, pci, buf);
+            e = xlu_pci_parse_spec_string(config, pci, buf);
             if (e) {
                 fprintf(stderr,
-                        "unable to parse PCI BDF `%s' for passthrough\n",
+                        "unable to parse PCI_SPEC_STRING `%s' for passthrough\n",
                         buf);
                 exit(-e);
             }
diff --git a/tools/xl/xl_pci.c b/tools/xl/xl_pci.c
index b6dc7c2840..9c24496cb2 100644
--- a/tools/xl/xl_pci.c
+++ b/tools/xl/xl_pci.c
@@ -55,7 +55,7 @@ int main_pcilist(int argc, char **argv)
     return 0;
 }
 
-static int pcidetach(uint32_t domid, const char *bdf, int force)
+static int pcidetach(uint32_t domid, const char *spec_string, int force)
 {
     libxl_device_pci pci;
     XLU_Config *config;
@@ -66,8 +66,9 @@ static int pcidetach(uint32_t domid, const char *bdf, int force)
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_inig"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pci, bdf)) {
-        fprintf(stderr, "pci-detach: malformed BDF specification \"%s\"\n", bdf);
+    if (xlu_pci_parse_spec_string(config, &pci, spec_string)) {
+        fprintf(stderr, "pci-detach: malformed PCI_SPEC_STRING \"%s\"\n",
+                spec_string);
         exit(2);
     }
     if (force) {
@@ -89,7 +90,7 @@ int main_pcidetach(int argc, char **argv)
     uint32_t domid;
     int opt;
     int force = 0;
-    const char *bdf = NULL;
+    const char *spec_string = NULL;
 
     SWITCH_FOREACH_OPT(opt, "f", NULL, "pci-detach", 2) {
     case 'f':
@@ -98,15 +99,15 @@ int main_pcidetach(int argc, char **argv)
     }
 
     domid = find_domain(argv[optind]);
-    bdf = argv[optind + 1];
+    spec_string = argv[optind + 1];
 
-    if (pcidetach(domid, bdf, force))
+    if (pcidetach(domid, spec_string, force))
         return EXIT_FAILURE;
 
     return EXIT_SUCCESS;
 }
 
-static int pciattach(uint32_t domid, const char *bdf, const char *vs)
+static int pciattach(uint32_t domid, const char *spec_string)
 {
     libxl_device_pci pci;
     XLU_Config *config;
@@ -117,8 +118,9 @@ static int pciattach(uint32_t domid, const char *bdf, const char *vs)
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_inig"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pci, bdf)) {
-        fprintf(stderr, "pci-attach: malformed BDF specification \"%s\"\n", bdf);
+    if (xlu_pci_parse_spec_string(config, &pci, spec_string)) {
+        fprintf(stderr, "pci-attach: malformed PCI_SPEC_STRING \"%s\"\n",
+                spec_string);
         exit(2);
     }
 
@@ -135,19 +137,16 @@ int main_pciattach(int argc, char **argv)
 {
     uint32_t domid;
     int opt;
-    const char *bdf = NULL, *vs = NULL;
+    const char *spec_string = NULL;
 
     SWITCH_FOREACH_OPT(opt, "", NULL, "pci-attach", 2) {
         /* No options */
     }
 
     domid = find_domain(argv[optind]);
-    bdf = argv[optind + 1];
-
-    if (optind + 1 < argc)
-        vs = argv[optind + 2];
+    spec_string = argv[optind + 1];
 
-    if (pciattach(domid, bdf, vs))
+    if (pciattach(domid, spec_string))
         return EXIT_FAILURE;
 
     return EXIT_SUCCESS;
@@ -193,8 +192,8 @@ static int pciassignable_add(const char *bdf, int rebind)
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_init"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pci, bdf)) {
-        fprintf(stderr, "pci-assignable-add: malformed BDF specification \"%s\"\n", bdf);
+    if (xlu_pci_parse_bdf(config, &pci.bdf, bdf)) {
+        fprintf(stderr, "pci-assignable-add: malformed BDF \"%s\"\n", bdf);
         exit(2);
     }
 
@@ -235,8 +234,8 @@ static int pciassignable_remove(const char *bdf, int rebind)
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_init"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pci, bdf)) {
-        fprintf(stderr, "pci-assignable-remove: malformed BDF specification \"%s\"\n", bdf);
+    if (xlu_pci_parse_bdf(config, &pci.bdf, bdf)) {
+        fprintf(stderr, "pci-assignable-remove: malformed BDF \"%s\"\n", bdf);
         exit(2);
     }
 
-- 
2.11.0


