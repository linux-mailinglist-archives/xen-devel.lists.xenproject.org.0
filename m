Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB5F1CB2FC
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 17:35:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX51Z-0002AA-VH; Fri, 08 May 2020 15:34:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JXU2=6W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jX51Y-00028l-B6
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 15:34:52 +0000
X-Inumbo-ID: 679af65c-9141-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 679af65c-9141-11ea-ae69-bc764e2007e4;
 Fri, 08 May 2020 15:34:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 28DAFAF01;
 Fri,  8 May 2020 15:34:30 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v8 12/12] xen: remove XEN_SYSCTL_set_parameter support
Date: Fri,  8 May 2020 17:34:21 +0200
Message-Id: <20200508153421.24525-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200508153421.24525-1-jgross@suse.com>
References: <20200508153421.24525-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
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
---
V6:
- new patch

V7:
- only comment out definition of XEN_SYSCTL_set_parameter (Jan Beulich)

V8:
- rebase to use CONFIG_HYPFS

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/flask/policy/modules/dom0.te  |  2 +-
 xen/arch/arm/xen.lds.S              |  5 --
 xen/arch/x86/hvm/vmx/vmcs.c         | 38 ++++++-------
 xen/arch/x86/xen.lds.S              |  5 --
 xen/common/hypfs.c                  | 12 +---
 xen/common/kernel.c                 | 11 ----
 xen/common/sysctl.c                 | 36 ------------
 xen/include/public/sysctl.h         | 19 +------
 xen/include/xen/hypfs.h             |  5 --
 xen/include/xen/lib.h               |  1 -
 xen/include/xen/param.h             | 87 +++++------------------------
 xen/xsm/flask/hooks.c               |  3 -
 xen/xsm/flask/policy/access_vectors |  2 -
 13 files changed, 34 insertions(+), 192 deletions(-)

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
index 0a6efe96cf..a795497ac8 100644
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
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 1746385d13..ca94c2bedc 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -71,27 +71,6 @@ static bool __read_mostly opt_ept_pml = true;
 static s8 __read_mostly opt_ept_ad = -1;
 int8_t __read_mostly opt_ept_exec_sp = -1;
 
-#ifdef CONFIG_HYPFS
-static char opt_ept_setting[10];
-
-static void update_ept_param(void)
-{
-    if ( opt_ept_exec_sp >= 0 )
-        snprintf(opt_ept_setting, sizeof(opt_ept_setting), "exec-sp=%d",
-                 opt_ept_exec_sp);
-}
-
-static void __init init_ept_param(struct param_hypfs *par)
-{
-    update_ept_param();
-    custom_runtime_set_var(par, opt_ept_setting);
-}
-#else
-static void update_ept_param(void)
-{
-}
-#endif
-
 static int __init parse_ept_param(const char *s)
 {
     const char *ss;
@@ -118,6 +97,22 @@ static int __init parse_ept_param(const char *s)
 }
 custom_param("ept", parse_ept_param);
 
+#ifdef CONFIG_HYPFS
+static char opt_ept_setting[10];
+
+static void update_ept_param(void)
+{
+    if ( opt_ept_exec_sp >= 0 )
+        snprintf(opt_ept_setting, sizeof(opt_ept_setting), "exec-sp=%d",
+                 opt_ept_exec_sp);
+}
+
+static void __init init_ept_param(struct param_hypfs *par)
+{
+    update_ept_param();
+    custom_runtime_set_var(par, opt_ept_setting);
+}
+
 static int parse_ept_param_runtime(const char *s);
 custom_runtime_only_param("ept", parse_ept_param_runtime, init_ept_param);
 
@@ -172,6 +167,7 @@ static int parse_ept_param_runtime(const char *s)
 
     return 0;
 }
+#endif
 
 /* Dynamic (run-time adjusted) execution control flags. */
 u32 vmx_pin_based_exec_control __read_mostly;
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 3ed020e26b..0273f79152 100644
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
index e4de0a9eef..434b6c1308 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -302,7 +302,7 @@ int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
         goto out;
 
     p = container_of(leaf, struct param_hypfs, hypfs);
-    ret = p->param->par.func(buf);
+    ret = p->func(buf);
 
     if ( !ret )
         leaf->e.size = ulen;
@@ -383,13 +383,3 @@ long do_hypfs_op(unsigned int cmd,
 
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
index 3b8b0d8ca5..bb37c7c9bb 100644
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
index 095a0c9bee..3ba1eb4971 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -119,11 +119,6 @@ int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
                      XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen);
 int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
                        XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen);
-void hypfs_write_lock(void);
-void hypfs_write_unlock(void);
-#else
-static inline void hypfs_write_lock(void) {}
-static inline void hypfs_write_unlock(void) {}
 #endif
 
 #endif /* __XEN_HYPFS_H__ */
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 2d7a054931..e5b0a007b8 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -75,7 +75,6 @@
 struct domain;
 
 void cmdline_parse(const char *cmdline);
-int runtime_parse(const char *line);
 int parse_bool(const char *s, const char *e);
 
 /**
diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index 4893de9bd5..ca032bf4f3 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -27,9 +27,6 @@ struct kernel_param {
 };
 
 extern const struct kernel_param __setup_start[], __setup_end[];
-extern const struct kernel_param __param_start[], __param_end[];
-
-#define __dataparam       __used_section(".data.param")
 
 #define __param(att)      static const att \
     __attribute__((__aligned__(sizeof(void *)))) struct kernel_param
@@ -79,14 +76,12 @@ extern const struct kernel_param __param_start[], __param_end[];
         { .name = setup_str_ign,            \
           .type = OPT_IGNORE }
 
-#define __rtparam         __param(__dataparam)
-
 #ifdef CONFIG_HYPFS
 
 struct param_hypfs {
-    const struct kernel_param *param;
     struct hypfs_entry_leaf hypfs;
     void (*init_leaf)(struct param_hypfs *par);
+    int (*func)(const char *);
 };
 
 extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
@@ -109,28 +104,17 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
 
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
@@ -139,14 +123,8 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
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
@@ -155,14 +133,8 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
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
@@ -171,14 +143,8 @@ extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
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
@@ -194,36 +160,11 @@ struct param_hypfs {
 
 #define param_2_parfs(par)  NULL
 
-#define custom_runtime_only_param(_name, _var, initfunc) \
-    __rtparam __rtpar_##_var = \
-      { .name = _name, \
-          .type = OPT_CUSTOM, \
-          .par.func = _var }
-#define boolean_runtime_only_param(_name, _var) \
-    __rtparam __rtpar_##_var = \
-        { .name = _name, \
-          .type = OPT_BOOL, \
-          .len = sizeof(_var) + \
-                 BUILD_BUG_ON_ZERO(sizeof(_var) != sizeof(bool)), \
-          .par.var = &_var }
-#define integer_runtime_only_param(_name, _var) \
-    __rtparam __rtpar_##_var = \
-        { .name = _name, \
-          .type = OPT_UINT, \
-          .len = sizeof(_var), \
-          .par.var = &_var }
-#define size_runtime_only_param(_name, _var) \
-    __rtparam __rtpar_##_var = \
-        { .name = _name, \
-          .type = OPT_SIZE, \
-          .len = sizeof(_var), \
-          .par.var = &_var }
-#define string_runtime_only_param(_name, _var) \
-    __rtparam __rtpar_##_var = \
-        { .name = _name, \
-          .type = OPT_STR, \
-          .len = sizeof(_var), \
-          .par.var = &_var }
+#define custom_runtime_only_param(_name, _var, initfunc)
+#define boolean_runtime_only_param(_name, _var)
+#define integer_runtime_only_param(_name, _var)
+#define size_runtime_only_param(_name, _var)
+#define string_runtime_only_param(_name, _var)
 
 #define custom_runtime_set_var(parfs, var)
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index a2c78e445c..a314bf85ce 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -822,9 +822,6 @@ static int flask_sysctl(int cmd)
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
2.26.1


