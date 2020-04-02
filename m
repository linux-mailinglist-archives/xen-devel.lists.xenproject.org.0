Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F7819C64C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 17:47:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK23R-00043s-65; Thu, 02 Apr 2020 15:46:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jjwm=5S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jK23Q-00043W-Hk
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 15:46:52 +0000
X-Inumbo-ID: 1aed7d02-74f9-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1aed7d02-74f9-11ea-9e09-bc764e2007e4;
 Thu, 02 Apr 2020 15:46:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB6CBAEA2;
 Thu,  2 Apr 2020 15:46:21 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 12/12] xen: remove XEN_SYSCTL_set_parameter support
Date: Thu,  2 Apr 2020 17:46:16 +0200
Message-Id: <20200402154616.16927-13-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200402154616.16927-1-jgross@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The functionality of XEN_SYSCTL_set_parameter is available via hypfs
now, so it can be removed.

This allows to remove the kernel_param structure for runtime parameters
by putting the now only used structure element into the hypfs node
structure of the runtime parameters.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
V6:
- new patch

V7:
- only comment out definition of XEN_SYSCTL_set_parameter (Jan Beulich)
---
 tools/flask/policy/modules/dom0.te  |  2 +-
 xen/arch/arm/xen.lds.S              |  5 ----
 xen/arch/x86/xen.lds.S              |  5 ----
 xen/common/hypfs.c                  | 12 +--------
 xen/common/kernel.c                 | 11 --------
 xen/common/sysctl.c                 | 36 --------------------------
 xen/include/public/sysctl.h         | 19 +-------------
 xen/include/xen/hypfs.h             |  2 --
 xen/include/xen/lib.h               |  1 -
 xen/include/xen/param.h             | 50 +++++++------------------------------
 xen/xsm/flask/hooks.c               |  3 ---
 xen/xsm/flask/policy/access_vectors |  2 --
 12 files changed, 12 insertions(+), 136 deletions(-)

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index 20925e38a2..0a63ce15b6 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -16,7 +16,7 @@ allow dom0_t xen_t:xen {
 allow dom0_t xen_t:xen2 {
 	resource_op psr_cmt_op psr_alloc pmu_ctrl get_symbol
 	get_cpu_levelling_caps get_cpu_featureset livepatch_op
-	coverage_op set_parameter
+	coverage_op
 };
 
 # Allow dom0 to use all XENVER_ subops that have checks.
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index d31bed580d..9a535ca316 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -54,11 +54,6 @@ SECTIONS
        *(.data.rel.ro)
        *(.data.rel.ro.*)
 
-       . = ALIGN(POINTER_ALIGN);
-       __param_start = .;
-       *(.data.param)
-       __param_end = .;
-
        __proc_info_start = .;
        *(.proc.info)
        __proc_info_end = .;
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 21a37f0f57..88f14e5e59 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -128,11 +128,6 @@ SECTIONS
        *(.ex_table.pre)
        __stop___pre_ex_table = .;
 
-       . = ALIGN(POINTER_ALIGN);
-       __param_start = .;
-       *(.data.param)
-       __param_end = .;
-
 #if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
        . = ALIGN(POINTER_ALIGN);
        __start_vpci_array = .;
diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index df951526db..00eb180998 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -300,7 +300,7 @@ int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
         goto out;
 
     p = container_of(leaf, struct param_hypfs, hypfs);
-    ret = p->param->par.func(buf);
+    ret = p->func(buf);
 
     if ( !ret )
         leaf->e.size = ulen;
@@ -379,13 +379,3 @@ long do_hypfs_op(unsigned int cmd,
 
     return ret;
 }
-
-void hypfs_write_lock(void)
-{
-    write_lock(&hypfs_lock);
-}
-
-void hypfs_write_unlock(void)
-{
-    write_unlock(&hypfs_lock);
-}
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 7516242337..876830f5fa 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -196,17 +196,6 @@ static void __init _cmdline_parse(const char *cmdline)
     parse_params(cmdline, __setup_start, __setup_end);
 }
 
-int runtime_parse(const char *line)
-{
-    int ret;
-
-    hypfs_write_lock();
-    ret = parse_params(line, __param_start, __param_end);
-    hypfs_write_unlock();
-
-    return ret;
-}
-
 /**
  *    cmdline_parse -- parses the xen command line.
  * If CONFIG_CMDLINE is set, it would be parsed prior to @cmdline.
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 1c6a817476..ec916424e5 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -471,42 +471,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
             copyback = 1;
         break;
 
-    case XEN_SYSCTL_set_parameter:
-    {
-#define XEN_SET_PARAMETER_MAX_SIZE 1023
-        char *params;
-
-        if ( op->u.set_parameter.pad[0] || op->u.set_parameter.pad[1] ||
-             op->u.set_parameter.pad[2] )
-        {
-            ret = -EINVAL;
-            break;
-        }
-        if ( op->u.set_parameter.size > XEN_SET_PARAMETER_MAX_SIZE )
-        {
-            ret = -E2BIG;
-            break;
-        }
-        params = xmalloc_bytes(op->u.set_parameter.size + 1);
-        if ( !params )
-        {
-            ret = -ENOMEM;
-            break;
-        }
-        if ( copy_from_guest(params, op->u.set_parameter.params,
-                             op->u.set_parameter.size) )
-            ret = -EFAULT;
-        else
-        {
-            params[op->u.set_parameter.size] = 0;
-            ret = runtime_parse(params);
-        }
-
-        xfree(params);
-
-        break;
-    }
-
     default:
         ret = arch_do_sysctl(op, u_sysctl);
         copyback = 0;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 3a08c512e8..f635c0c2db 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1026,22 +1026,6 @@ struct xen_sysctl_livepatch_op {
     } u;
 };
 
-/*
- * XEN_SYSCTL_set_parameter
- *
- * Change hypervisor parameters at runtime.
- * The input string is parsed similar to the boot parameters.
- * Parameters are a single string terminated by a NUL byte of max. size
- * characters. Multiple settings can be specified by separating them
- * with blanks.
- */
-
-struct xen_sysctl_set_parameter {
-    XEN_GUEST_HANDLE_64(const_char) params; /* IN: pointer to parameters. */
-    uint16_t size;                          /* IN: size of parameters. */
-    uint16_t pad[3];                        /* IN: MUST be zero. */
-};
-
 #if defined(__i386__) || defined(__x86_64__)
 /*
  * XEN_SYSCTL_get_cpu_policy (x86 specific)
@@ -1106,7 +1090,7 @@ struct xen_sysctl {
 #define XEN_SYSCTL_get_cpu_levelling_caps        25
 #define XEN_SYSCTL_get_cpu_featureset            26
 #define XEN_SYSCTL_livepatch_op                  27
-#define XEN_SYSCTL_set_parameter                 28
+/* #define XEN_SYSCTL_set_parameter                 28 */
 #define XEN_SYSCTL_get_cpu_policy                29
     uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
     union {
@@ -1135,7 +1119,6 @@ struct xen_sysctl {
         struct xen_sysctl_cpu_levelling_caps cpu_levelling_caps;
         struct xen_sysctl_cpu_featureset    cpu_featureset;
         struct xen_sysctl_livepatch_op      livepatch;
-        struct xen_sysctl_set_parameter     set_parameter;
 #if defined(__i386__) || defined(__x86_64__)
         struct xen_sysctl_cpu_policy        cpu_policy;
 #endif
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index 3c3b1b056d..c0ab26b02e 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -114,7 +114,5 @@ int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
                      XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen);
 int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
                        XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen);
-void hypfs_write_lock(void);
-void hypfs_write_unlock(void);
 
 #endif /* __XEN_HYPFS_H__ */
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 5d718bbdba..7e425e28cd 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -75,7 +75,6 @@
 struct domain;
 
 void cmdline_parse(const char *cmdline);
-int runtime_parse(const char *line);
 int parse_bool(const char *s, const char *e);
 
 /**
diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index 5cf2149279..980528e417 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -27,16 +27,14 @@ struct kernel_param {
 };
 
 struct param_hypfs {
-    const struct kernel_param *param;
     struct hypfs_entry_leaf hypfs;
     void (*init_leaf)(struct param_hypfs *par);
+    int (*func)(const char *);
 };
 
 extern const struct kernel_param __setup_start[], __setup_end[];
-extern const struct kernel_param __param_start[], __param_end[];
 extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
 
-#define __dataparam       __used_section(".data.param")
 #define __paramhypfs      __used_section(".data.paramhypfs")
 
 #define __param(att)      static const att \
@@ -87,7 +85,6 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
         { .name = setup_str_ign,            \
           .type = OPT_IGNORE }
 
-#define __rtparam         __param(__dataparam)
 #define __paramfs         static __paramhypfs \
     __attribute__((__aligned__(sizeof(void *)))) struct param_hypfs
 
@@ -104,28 +101,17 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
 
 /* initfunc needs to set size and content, e.g. via custom_runtime_set_var(). */
 #define custom_runtime_only_param(_name, _var, initfunc) \
-    __rtparam __rtpar_##_var = \
-      { .name = _name, \
-          .type = OPT_CUSTOM, \
-          .par.func = _var }; \
     __paramfs __parfs_##_var = \
-        { .param = &__rtpar_##_var, \
-          .init_leaf = initfunc, \
-          .hypfs.e.type = XEN_HYPFS_TYPE_STRING, \
+        { .hypfs.e.type = XEN_HYPFS_TYPE_STRING, \
           .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
           .hypfs.e.name = _name, \
           .hypfs.e.read = hypfs_read_leaf, \
-          .hypfs.e.write = hypfs_write_custom }
+          .hypfs.e.write = hypfs_write_custom, \
+          .init_leaf = initfunc, \
+          .func = _var }
 #define boolean_runtime_only_param(_name, _var) \
-    __rtparam __rtpar_##_var = \
-        { .name = _name, \
-          .type = OPT_BOOL, \
-          .len = sizeof(_var) + \
-                 BUILD_BUG_ON_ZERO(sizeof(_var) != sizeof(bool)), \
-          .par.var = &_var }; \
     __paramfs __parfs_##_var = \
-        { .param = &__rtpar_##_var, \
-          .hypfs.e.type = XEN_HYPFS_TYPE_BOOL, \
+        { .hypfs.e.type = XEN_HYPFS_TYPE_BOOL, \
           .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
           .hypfs.e.name = _name, \
           .hypfs.e.size = sizeof(_var), \
@@ -134,14 +120,8 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
           .hypfs.e.write = hypfs_write_bool, \
           .hypfs.content = &_var }
 #define integer_runtime_only_param(_name, _var) \
-    __rtparam __rtpar_##_var = \
-        { .name = _name, \
-          .type = OPT_UINT, \
-          .len = sizeof(_var), \
-          .par.var = &_var }; \
     __paramfs __parfs_##_var = \
-        { .param = &__rtpar_##_var, \
-          .hypfs.e.type = XEN_HYPFS_TYPE_UINT, \
+        { .hypfs.e.type = XEN_HYPFS_TYPE_UINT, \
           .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
           .hypfs.e.name = _name, \
           .hypfs.e.size = sizeof(_var), \
@@ -150,14 +130,8 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
           .hypfs.e.write = hypfs_write_leaf, \
           .hypfs.content = &_var }
 #define size_runtime_only_param(_name, _var) \
-    __rtparam __rtpar_##_var = \
-        { .name = _name, \
-          .type = OPT_SIZE, \
-          .len = sizeof(_var), \
-          .par.var = &_var }; \
     __paramfs __parfs_##_var = \
-        { .param = &__rtpar_##_var, \
-          .hypfs.e.type = XEN_HYPFS_TYPE_UINT, \
+        { .hypfs.e.type = XEN_HYPFS_TYPE_UINT, \
           .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
           .hypfs.e.name = _name, \
           .hypfs.e.size = sizeof(_var), \
@@ -166,14 +140,8 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
           .hypfs.e.write = hypfs_write_leaf, \
           .hypfs.content = &_var }
 #define string_runtime_only_param(_name, _var) \
-    __rtparam __rtpar_##_var = \
-        { .name = _name, \
-          .type = OPT_STR, \
-          .len = sizeof(_var), \
-          .par.var = &_var }; \
     __paramfs __parfs_##_var = \
-        { .param = &__rtpar_##_var, \
-          .hypfs.e.type = XEN_HYPFS_TYPE_STRING, \
+        { .hypfs.e.type = XEN_HYPFS_TYPE_STRING, \
           .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
           .hypfs.e.name = _name, \
           .hypfs.e.size = sizeof(_var), \
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 74af7df7d5..11cb8098a9 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -821,9 +821,6 @@ static int flask_sysctl(int cmd)
     case XEN_SYSCTL_coverage_op:
         return avc_current_has_perm(SECINITSID_XEN, SECCLASS_XEN2,
                                     XEN2__COVERAGE_OP, NULL);
-    case XEN_SYSCTL_set_parameter:
-        return avc_current_has_perm(SECINITSID_XEN, SECCLASS_XEN2,
-                                    XEN2__SET_PARAMETER, NULL);
 
     default:
         return avc_unknown_permission("sysctl", cmd);
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index c9e385fb9b..b87c99ea98 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -99,8 +99,6 @@ class xen2
     livepatch_op
 # XEN_SYSCTL_coverage_op
     coverage_op
-# XEN_SYSCTL_set_parameter
-    set_parameter
 }
 
 # Classes domain and domain2 consist of operations that a domain performs on
-- 
2.16.4


