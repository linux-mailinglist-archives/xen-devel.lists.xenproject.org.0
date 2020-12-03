Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DDE2CD923
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 15:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43593.78354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpdA-0002Rx-EU; Thu, 03 Dec 2020 14:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43593.78354; Thu, 03 Dec 2020 14:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpdA-0002QO-1V; Thu, 03 Dec 2020 14:30:48 +0000
Received: by outflank-mailman (input) for mailman id 43593;
 Thu, 03 Dec 2020 14:30:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kkpd7-0002Nt-Rs
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:30:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpd7-0006UH-71; Thu, 03 Dec 2020 14:30:45 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpYQ-00015c-EA; Thu, 03 Dec 2020 14:25:54 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=y1RGS4HyjvmtOi0l/sT6C5YNGct5R5yiMakE1fxQSLM=; b=qCdHUe7bwa6t546DotfSo4/C/9
	2SA1DBe/Q7yn4jaq0ySqZ8hTkA3ocvGwumCTWgr3p+UAbAwYl5NjlAulEZM9Qb8BuQiE2WaPAwCnH
	4uzHE4fu0z/Fihhge138+cJo0KANefXH9acDlA4rhKIVZwj+P/GluBxn4gpKDlesKwGY=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 18/23] libxlu: introduce xlu_pci_parse_spec_string()
Date: Thu,  3 Dec 2020 14:25:29 +0000
Message-Id: <20201203142534.4017-19-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203142534.4017-1-paul@xen.org>
References: <20201203142534.4017-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 tools/libs/util/libxlu_pci.c | 374 +++++++++++++++++++----------------
 tools/xl/xl_cmdtable.c       |   4 +-
 tools/xl/xl_parse.c          |   4 +-
 tools/xl/xl_pci.c            |  37 ++--
 5 files changed, 230 insertions(+), 197 deletions(-)

diff --git a/tools/include/libxlutil.h b/tools/include/libxlutil.h
index 92e35c546278..cdd6aab4f816 100644
--- a/tools/include/libxlutil.h
+++ b/tools/include/libxlutil.h
@@ -108,10 +108,16 @@ int xlu_disk_parse(XLU_Config *cfg, int nspecs, const char *const *specs,
    * resulting disk struct is used with libxl.
    */
 
+/*
+ * PCI BDF
+ */
+int xlu_pci_parse_bdf(XLU_Config *cfg, libxl_pci_bdf *bdf, const char *str);
+
 /*
  * PCI specification parsing
  */
-int xlu_pci_parse_bdf(XLU_Config *cfg, libxl_device_pci *pcidev, const char *str);
+int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pci,
+                              const char *str);
 
 /*
  * RDM parsing
diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index 5c107f264260..a8b6ce542736 100644
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
+    const char *ptr = str;
+    unsigned int colons = 0;
+    unsigned int domain, bus, dev, func;
+    int n;
 
-    ret = strtoul(str, &end, 16);
-    if ( end == str || *end != '\0' )
-        return -1;
-    if ( ret & ~mask )
-        return -1;
-    *val = (unsigned int)ret & mask;
-    return 0;
-}
-
-static int pci_struct_fill(libxl_device_pci *pci, unsigned int domain,
-                           unsigned int bus, unsigned int dev,
-                           unsigned int func, unsigned int vdevfn)
-{
-    pci->bdf.domain = domain;
-    pci->bdf.bus = bus;
-    pci->bdf.dev = dev;
-    pci->bdf.func = func;
-    pci->vdevfn = vdevfn;
-    return 0;
-}
-
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
-{
-    unsigned state = STATE_DOMAIN;
-    unsigned dom = INVALID, bus = INVALID, dev = INVALID, func = INVALID, vslot = 0;
-    char *buf2, *tok, *ptr, *end, *optkey = NULL;
-
-    if ( NULL == (buf2 = ptr = strdup(str)) )
-        return ERROR_NOMEM;
-
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
-        }
+    /* Count occurrences of ':' to detrmine presence/absence of the 'domain' */
+    while (isxdigit(*ptr) || *ptr == ':') {
+        if (*ptr == ':')
+            colons++;
+        ptr++;
     }
 
-    if ( tok != ptr || state != STATE_TERMINAL )
-        goto parse_error;
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
 
-    assert(dom != INVALID && bus != INVALID && dev != INVALID && func != INVALID);
+    if (domain > 0xffff || bus > 0xff || dev > 0x1f)
+        return ERROR_INVAL;
 
-    /* Just a pretty way to fill in the values */
-    pci_struct_fill(pci, dom, bus, dev, func, vslot << 3);
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
 
-    free(buf2);
+    bdfp->domain = domain;
+    bdfp->bus = bus;
+    bdfp->dev = dev;
+    bdfp->func = func;
+
+    if (endp)
+        *endp = ptr;
 
     return 0;
+}
 
-parse_error:
-    free(buf2);
-    return ERROR_INVAL;
+static int parse_vslot(uint32_t *vdevfnp, const char *str, const char **endp)
+{
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
+    return 0;
+}
+
+static int parse_key_val(char **keyp, char**valp, const char *str,
+                         const char **endp)
+{
+    const char *ptr = str;
+    char *key, *val;
+
+    while (*ptr != '=' && *ptr != '\0')
+        ptr++;
+
+    if (*ptr == '\0')
+        return ERROR_INVAL;
+
+    key = strndup(str, ptr - str);
+    if (!key)
+        return ERROR_NOMEM;
+
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
+        }
+        if (*ptr == ',')
+            ptr++;
+        else if (*ptr != '\0')
+            return ERROR_INVAL;
+    }
+
+    /* Parse the rest as 'key=val' pairs */
+    while (*ptr != '\0') {
+        char *key, *val;
+
+        ret = parse_key_val(&key, &val, ptr, &ptr);
+        if (ret)
+            return ret;
+
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
+
+        free(key);
+        free(val);
+
+        if (ret)
+            return ret;
+    }
+
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
index 7da6c1b927bb..2ee0c4967334 100644
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
index 0765780d9f0a..6a4703e745c9 100644
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
index b6dc7c28401c..9c24496cb2dd 100644
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
+    spec_string = argv[optind + 1];
 
-    if (optind + 1 < argc)
-        vs = argv[optind + 2];
-
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
2.20.1


