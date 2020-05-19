Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E011D90E4
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 09:21:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jawZG-0004xj-Vm; Tue, 19 May 2020 07:21:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aMO8=7B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jawZF-0004wV-OB
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 07:21:37 +0000
X-Inumbo-ID: 51106f6f-99a1-11ea-a8e2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51106f6f-99a1-11ea-a8e2-12813bfff9fa;
 Tue, 19 May 2020 07:21:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EE082B21E;
 Tue, 19 May 2020 07:21:13 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v10 09/12] xen: add runtime parameter access support to hypfs
Date: Tue, 19 May 2020 09:21:03 +0200
Message-Id: <20200519072106.26894-10-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200519072106.26894-1-jgross@suse.com>
References: <20200519072106.26894-1-jgross@suse.com>
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add support to read and modify values of hypervisor runtime parameters
via the hypervisor file system.

As runtime parameters can be modified via a sysctl, too, this path has
to take the hypfs rw_lock as writer.

For custom runtime parameters the connection between the parameter
value and the file system is done via an init function which will set
the initial value (if needed) and the leaf properties.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V3:
- complete rework
- support custom parameters, too
- support parameter writing

V6:
- rewording in docs/misc/hypfs-paths.pandoc (Jan Beulich)
- use memchr() (Jan Beulich)
- use strlcat() (Jan Beulich)
- rework to use a custom parameter init function instead of a reference
  to a content variable, allowing to drop default strings
- style correction (Jan Beulich)
- dropping param_append_str() in favor of a custom function at its only
  use site

V7:
- fine tune some parameter initializations (Jan Beulich)
- call custom_runtime_set_var() after updating the value
- modify alignment in Arm linker script to 4 (Jan Beulich)

V8:
- modify alignment in Arm linker script to 8 (Julien Grall)
- fix ept runtime parameter reporting (Jan Beulich)
- rebase to support CONFIG_HYPFS

V9:
- add empty line in arm linker script (Jan Beulich)
- drop array size enum members (Jan Beulich)
- hide struct param_hypfs completely without CONFIG_HYPFS (Jan Beulich)
- don't write size from hypfs_write_custom() (Jan Beulich)
- drop underscores from macro parameters (Jan Beulich)
- add parantheses around macro parameters (Jan Beulich)
- don't set initial string param size (Jan Beulich)
- move code in vmcs.c in preparation of patch 12 (Jan Beulich)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/hypfs-paths.pandoc |   9 +++
 xen/arch/arm/xen.lds.S       |   8 +++
 xen/arch/x86/hvm/vmx/vmcs.c  |  29 ++++++++-
 xen/arch/x86/pv/domain.c     |  21 ++++++-
 xen/arch/x86/xen.lds.S       |   7 +++
 xen/common/grant_table.c     |  62 ++++++++++++++----
 xen/common/hypfs.c           |  34 +++++++++-
 xen/common/kernel.c          |  29 ++++++++-
 xen/drivers/char/console.c   |  72 +++++++++++++++++++--
 xen/include/xen/hypfs.h      |   7 +++
 xen/include/xen/param.h      | 119 ++++++++++++++++++++++++++++++++++-
 11 files changed, 372 insertions(+), 25 deletions(-)

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index 9a76bc383b..a111c6f25c 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -154,3 +154,12 @@ The major version of Xen.
 #### /buildinfo/version/minor = INTEGER
 
 The minor version of Xen.
+
+#### /params/
+
+A directory of runtime parameters.
+
+#### /params/*
+
+The individual parameters. The description of the different parameters can be
+found in `docs/misc/xen-command-line.pandoc`.
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index a497f6a48d..549ceb9749 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -89,6 +89,14 @@ SECTIONS
        __start_schedulers_array = .;
        *(.data.schedulers)
        __end_schedulers_array = .;
+
+#ifdef CONFIG_HYPFS
+       . = ALIGN(8);
+       __paramhypfs_start = .;
+       *(.data.paramhypfs)
+       __paramhypfs_end = .;
+#endif
+
        *(.data.rel)
        *(.data.rel.*)
        CONSTRUCTORS
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 221af9737a..3410bc5f6d 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -97,6 +97,30 @@ static int __init parse_ept_param(const char *s)
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
+#else
+static void update_ept_param(void)
+{
+}
+#endif
+
+static int parse_ept_param_runtime(const char *s);
+custom_runtime_only_param("ept", parse_ept_param_runtime, init_ept_param);
+
 static int parse_ept_param_runtime(const char *s)
 {
     struct domain *d;
@@ -115,6 +139,10 @@ static int parse_ept_param_runtime(const char *s)
 
     opt_ept_exec_sp = val;
 
+    update_ept_param();
+    custom_runtime_set_var(param_2_parfs(parse_ept_param_runtime),
+                           opt_ept_setting);
+
     rcu_read_lock(&domlist_read_lock);
     for_each_domain ( d )
     {
@@ -144,7 +172,6 @@ static int parse_ept_param_runtime(const char *s)
 
     return 0;
 }
-custom_runtime_only_param("ept", parse_ept_param_runtime);
 
 /* Dynamic (run-time adjusted) execution control flags. */
 u32 vmx_pin_based_exec_control __read_mostly;
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 0a4a5bd001..f4e863a410 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -55,6 +55,23 @@ static __read_mostly enum {
     PCID_NOXPTI
 } opt_pcid = PCID_XPTI;
 
+#ifdef CONFIG_HYPFS
+static const char opt_pcid_2_string[][7] = {
+    [PCID_OFF] = "off",
+    [PCID_ALL] = "on",
+    [PCID_XPTI] = "xpti",
+    [PCID_NOXPTI] = "noxpti",
+};
+
+static void __init opt_pcid_init(struct param_hypfs *par)
+{
+    custom_runtime_set_var(par, opt_pcid_2_string[opt_pcid]);
+}
+#endif
+
+static int parse_pcid(const char *s);
+custom_runtime_param("pcid", parse_pcid, opt_pcid_init);
+
 static int parse_pcid(const char *s)
 {
     int rc = 0;
@@ -87,9 +104,11 @@ static int parse_pcid(const char *s)
         break;
     }
 
+    custom_runtime_set_var(param_2_parfs(parse_pcid),
+                           opt_pcid_2_string[opt_pcid]);
+
     return rc;
 }
-custom_runtime_param("pcid", parse_pcid);
 
 static void noreturn continue_nonidle_domain(struct vcpu *v)
 {
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 0e3a733cab..3ed020e26b 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -279,6 +279,13 @@ SECTIONS
        __start_schedulers_array = .;
        *(.data.schedulers)
        __end_schedulers_array = .;
+
+#ifdef CONFIG_HYPFS
+       . = ALIGN(8);
+       __paramhypfs_start = .;
+       *(.data.paramhypfs)
+       __paramhypfs_end = .;
+#endif
   } :text
 
   DECL_SECTION(.data) {
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 5ef7ff940d..ece670e484 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -85,8 +85,43 @@ struct grant_table {
     struct grant_table_arch arch;
 };
 
-static int parse_gnttab_limit(const char *param, const char *arg,
-                              unsigned int *valp)
+unsigned int __read_mostly opt_max_grant_frames = 64;
+static unsigned int __read_mostly opt_max_maptrack_frames = 1024;
+
+#ifdef CONFIG_HYPFS
+#define GRANT_CUSTOM_VAL_SZ  12
+static char __read_mostly opt_max_grant_frames_val[GRANT_CUSTOM_VAL_SZ];
+static char __read_mostly opt_max_maptrack_frames_val[GRANT_CUSTOM_VAL_SZ];
+
+static void update_gnttab_par(unsigned int val, struct param_hypfs *par,
+                              char *parval)
+{
+    snprintf(parval, GRANT_CUSTOM_VAL_SZ, "%u", val);
+    custom_runtime_set_var_sz(par, parval, GRANT_CUSTOM_VAL_SZ);
+}
+
+static void __init gnttab_max_frames_init(struct param_hypfs *par)
+{
+    update_gnttab_par(opt_max_grant_frames, par, opt_max_grant_frames_val);
+}
+
+static void __init max_maptrack_frames_init(struct param_hypfs *par)
+{
+    update_gnttab_par(opt_max_maptrack_frames, par,
+                      opt_max_maptrack_frames_val);
+}
+#else
+#define update_gnttab_par(v, unused1, unused2)     update_gnttab_par(v)
+#define parse_gnttab_limit(a, v, unused1, unused2) parse_gnttab_limit(a, v)
+
+static void update_gnttab_par(unsigned int val, struct param_hypfs *par,
+                              char *parval)
+{
+}
+#endif
+
+static int parse_gnttab_limit(const char *arg, unsigned int *valp,
+                              struct param_hypfs *par, char *parval)
 {
     const char *e;
     unsigned long val;
@@ -99,28 +134,33 @@ static int parse_gnttab_limit(const char *param, const char *arg,
         return -ERANGE;
 
     *valp = val;
+    update_gnttab_par(val, par, parval);
 
     return 0;
 }
 
-unsigned int __read_mostly opt_max_grant_frames = 64;
+static int parse_gnttab_max_frames(const char *arg);
+custom_runtime_param("gnttab_max_frames", parse_gnttab_max_frames,
+                     gnttab_max_frames_init);
 
 static int parse_gnttab_max_frames(const char *arg)
 {
-    return parse_gnttab_limit("gnttab_max_frames", arg,
-                              &opt_max_grant_frames);
+    return parse_gnttab_limit(arg, &opt_max_grant_frames,
+                              param_2_parfs(parse_gnttab_max_frames),
+                              opt_max_grant_frames_val);
 }
-custom_runtime_param("gnttab_max_frames", parse_gnttab_max_frames);
 
-static unsigned int __read_mostly opt_max_maptrack_frames = 1024;
+static int parse_gnttab_max_maptrack_frames(const char *arg);
+custom_runtime_param("gnttab_max_maptrack_frames",
+                     parse_gnttab_max_maptrack_frames,
+                     max_maptrack_frames_init);
 
 static int parse_gnttab_max_maptrack_frames(const char *arg)
 {
-    return parse_gnttab_limit("gnttab_max_maptrack_frames", arg,
-                              &opt_max_maptrack_frames);
+    return parse_gnttab_limit(arg, &opt_max_maptrack_frames,
+                              param_2_parfs(parse_gnttab_max_maptrack_frames),
+                              opt_max_maptrack_frames_val);
 }
-custom_runtime_param("gnttab_max_maptrack_frames",
-                     parse_gnttab_max_maptrack_frames);
 
 #ifndef GNTTAB_MAX_VERSION
 #define GNTTAB_MAX_VERSION 2
diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 9c2213a068..4aed6ae182 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -10,6 +10,7 @@
 #include <xen/hypercall.h>
 #include <xen/hypfs.h>
 #include <xen/lib.h>
+#include <xen/param.h>
 #include <xen/rwlock.h>
 #include <public/hypfs.h>
 
@@ -41,7 +42,7 @@ static void hypfs_read_lock(void)
     this_cpu(hypfs_locked) = hypfs_read_locked;
 }
 
-static void hypfs_write_lock(void)
+void hypfs_write_lock(void)
 {
     ASSERT(this_cpu(hypfs_locked) == hypfs_unlocked);
 
@@ -49,7 +50,7 @@ static void hypfs_write_lock(void)
     this_cpu(hypfs_locked) = hypfs_write_locked;
 }
 
-static void hypfs_unlock(void)
+void hypfs_unlock(void)
 {
     enum hypfs_lock_state locked = this_cpu(hypfs_locked);
 
@@ -346,6 +347,35 @@ int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
     return 0;
 }
 
+int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
+                       XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen)
+{
+    struct param_hypfs *p;
+    char *buf;
+    int ret;
+
+    ASSERT(this_cpu(hypfs_locked) == hypfs_write_locked);
+
+    buf = xzalloc_array(char, ulen);
+    if ( !buf )
+        return -ENOMEM;
+
+    ret = -EFAULT;
+    if ( copy_from_guest(buf, uaddr, ulen) )
+        goto out;
+
+    ret = -EDOM;
+    if ( memchr(buf, 0, ulen) != (buf + ulen - 1) )
+        goto out;
+
+    p = container_of(leaf, struct param_hypfs, hypfs);
+    ret = p->param->par.func(buf);
+
+ out:
+    xfree(buf);
+    return ret;
+}
+
 static int hypfs_write(struct hypfs_entry *entry,
                        XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
 {
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index f464fe02ed..d1381d6900 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -198,7 +198,13 @@ static void __init _cmdline_parse(const char *cmdline)
 
 int runtime_parse(const char *line)
 {
-    return parse_params(line, __param_start, __param_end);
+    int ret;
+
+    hypfs_write_lock();
+    ret = parse_params(line, __param_start, __param_end);
+    hypfs_unlock();
+
+    return ret;
 }
 
 /**
@@ -429,6 +435,27 @@ static int __init buildinfo_init(void)
     return 0;
 }
 __initcall(buildinfo_init);
+
+static HYPFS_DIR_INIT(params, "params");
+
+static int __init param_init(void)
+{
+    struct param_hypfs *param;
+
+    hypfs_add_dir(&hypfs_root, &params, true);
+
+    for ( param = __paramhypfs_start; param < __paramhypfs_end; param++ )
+    {
+        if ( param->init_leaf )
+            param->init_leaf(param);
+        else if ( param->hypfs.e.type == XEN_HYPFS_TYPE_STRING )
+            param->hypfs.e.size = strlen(param->hypfs.content) + 1;
+        hypfs_add_leaf(&params, &param->hypfs, true);
+    }
+
+    return 0;
+}
+__initcall(param_init);
 #endif
 
 # define DO(fn) long do_##fn
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 913ae1b66a..56e24821b2 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -79,8 +79,28 @@ enum con_timestamp_mode
 
 static enum con_timestamp_mode __read_mostly opt_con_timestamp_mode = TSM_NONE;
 
+#ifdef CONFIG_HYPFS
+static const char con_timestamp_mode_2_string[][7] = {
+    [TSM_NONE] = "none",
+    [TSM_DATE] = "date",
+    [TSM_DATE_MS] = "datems",
+    [TSM_BOOT] = "boot",
+    [TSM_RAW] = "raw",
+};
+
+static void con_timestamp_mode_upd(struct param_hypfs *par)
+{
+    const char *val = con_timestamp_mode_2_string[opt_con_timestamp_mode];
+
+    custom_runtime_set_var_sz(par, val, 7);
+}
+#else
+#define con_timestamp_mode_upd(par)
+#endif
+
 static int parse_console_timestamps(const char *s);
-custom_runtime_param("console_timestamps", parse_console_timestamps);
+custom_runtime_param("console_timestamps", parse_console_timestamps,
+                     con_timestamp_mode_upd);
 
 /* conring_size: allows a large console ring than default (16kB). */
 static uint32_t __initdata opt_conring_size;
@@ -143,6 +163,39 @@ static int __read_mostly xenlog_guest_lower_thresh =
 static int parse_loglvl(const char *s);
 static int parse_guest_loglvl(const char *s);
 
+#ifdef CONFIG_HYPFS
+#define LOGLVL_VAL_SZ 16
+static char xenlog_val[LOGLVL_VAL_SZ];
+static char xenlog_guest_val[LOGLVL_VAL_SZ];
+
+static char *lvl2opt[] = { "none", "error", "warning", "info", "all" };
+
+static void xenlog_update_val(int lower, int upper, char *val)
+{
+    snprintf(val, LOGLVL_VAL_SZ, "%s/%s", lvl2opt[lower], lvl2opt[upper]);
+}
+
+static void __init xenlog_init(struct param_hypfs *par)
+{
+    xenlog_update_val(xenlog_lower_thresh, xenlog_upper_thresh, xenlog_val);
+    custom_runtime_set_var(par, xenlog_val);
+}
+
+static void __init xenlog_guest_init(struct param_hypfs *par)
+{
+    xenlog_update_val(xenlog_guest_lower_thresh, xenlog_guest_upper_thresh,
+                      xenlog_guest_val);
+    custom_runtime_set_var(par, xenlog_guest_val);
+}
+#else
+#define xenlog_val       NULL
+#define xenlog_guest_val NULL
+
+static void xenlog_update_val(int lower, int upper, char *val)
+{
+}
+#endif
+
 /*
  * <lvl> := none|error|warning|info|debug|all
  * loglvl=<lvl_print_always>[/<lvl_print_ratelimit>]
@@ -151,8 +204,8 @@ static int parse_guest_loglvl(const char *s);
  * Similar definitions for guest_loglvl, but applies to guest tracing.
  * Defaults: loglvl=warning ; guest_loglvl=none/warning
  */
-custom_runtime_param("loglvl", parse_loglvl);
-custom_runtime_param("guest_loglvl", parse_guest_loglvl);
+custom_runtime_param("loglvl", parse_loglvl, xenlog_init);
+custom_runtime_param("guest_loglvl", parse_guest_loglvl, xenlog_guest_init);
 
 static atomic_t print_everything = ATOMIC_INIT(0);
 
@@ -173,7 +226,7 @@ static int __parse_loglvl(const char *s, const char **ps)
     return 2; /* sane fallback */
 }
 
-static int _parse_loglvl(const char *s, int *lower, int *upper)
+static int _parse_loglvl(const char *s, int *lower, int *upper, char *val)
 {
     *lower = *upper = __parse_loglvl(s, &s);
     if ( *s == '/' )
@@ -181,18 +234,21 @@ static int _parse_loglvl(const char *s, int *lower, int *upper)
     if ( *upper < *lower )
         *upper = *lower;
 
+    xenlog_update_val(*lower, *upper, val);
+
     return *s ? -EINVAL : 0;
 }
 
 static int parse_loglvl(const char *s)
 {
-    return _parse_loglvl(s, &xenlog_lower_thresh, &xenlog_upper_thresh);
+    return _parse_loglvl(s, &xenlog_lower_thresh, &xenlog_upper_thresh,
+                         xenlog_val);
 }
 
 static int parse_guest_loglvl(const char *s)
 {
     return _parse_loglvl(s, &xenlog_guest_lower_thresh,
-                         &xenlog_guest_upper_thresh);
+                         &xenlog_guest_upper_thresh, xenlog_guest_val);
 }
 
 static char *loglvl_str(int lvl)
@@ -731,9 +787,11 @@ static int parse_console_timestamps(const char *s)
     {
     case 0:
         opt_con_timestamp_mode = TSM_NONE;
+        con_timestamp_mode_upd(param_2_parfs(parse_console_timestamps));
         return 0;
     case 1:
         opt_con_timestamp_mode = TSM_DATE;
+        con_timestamp_mode_upd(param_2_parfs(parse_console_timestamps));
         return 0;
     }
     if ( *s == '\0' || /* Compat for old booleanparam() */
@@ -750,6 +808,8 @@ static int parse_console_timestamps(const char *s)
     else
         return -EINVAL;
 
+    con_timestamp_mode_upd(param_2_parfs(parse_console_timestamps));
+
     return 0;
 }
 
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index 5c6a0ccece..507ed3ae0b 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -116,6 +116,13 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
                      XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
 int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
                      XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
+                       XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
+void hypfs_write_lock(void);
+void hypfs_unlock(void);
+#else
+static inline void hypfs_write_lock(void) {}
+static inline void hypfs_unlock(void) {}
 #endif
 
 #endif /* __XEN_HYPFS_H__ */
diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index a1dc3ba8f0..3fe1a06a41 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -1,6 +1,7 @@
 #ifndef _XEN_PARAM_H
 #define _XEN_PARAM_H
 
+#include <xen/hypfs.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/stdbool.h>
@@ -80,7 +81,115 @@ extern const struct kernel_param __param_start[], __param_end[];
 
 #define __rtparam         __param(__dataparam)
 
-#define custom_runtime_only_param(_name, _var) \
+#ifdef CONFIG_HYPFS
+
+struct param_hypfs {
+    const struct kernel_param *param;
+    struct hypfs_entry_leaf hypfs;
+    void (*init_leaf)(struct param_hypfs *par);
+};
+
+extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
+
+#define __paramhypfs      __used_section(".data.paramhypfs")
+
+#define __paramfs         static __paramhypfs  \
+    __attribute__((__aligned__(sizeof(void *)))) struct param_hypfs
+
+#define custom_runtime_set_var_sz(parfs, var, sz) \
+    { \
+        (parfs)->hypfs.content = var; \
+        (parfs)->hypfs.e.max_size = sz; \
+        (parfs)->hypfs.e.size = strlen(var) + 1; \
+    }
+#define custom_runtime_set_var(parfs, var) \
+    custom_runtime_set_var_sz(parfs, var, sizeof(var))
+
+#define param_2_parfs(par) &__parfs_##par
+
+/* initfunc needs to set size and content, e.g. via custom_runtime_set_var(). */
+#define custom_runtime_only_param(nam, variable, initfunc) \
+    __rtparam __rtpar_##variable = \
+      { .name = (nam), \
+          .type = OPT_CUSTOM, \
+          .par.func = (variable) }; \
+    __paramfs __parfs_##variable = \
+        { .param = &__rtpar_##variable, \
+          .init_leaf = (initfunc), \
+          .hypfs.e.type = XEN_HYPFS_TYPE_STRING, \
+          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
+          .hypfs.e.name = (nam), \
+          .hypfs.e.read = hypfs_read_leaf, \
+          .hypfs.e.write = hypfs_write_custom }
+#define boolean_runtime_only_param(nam, variable) \
+    __rtparam __rtpar_##variable = \
+        { .name = (nam), \
+          .type = OPT_BOOL, \
+          .len = sizeof(variable) + \
+                 BUILD_BUG_ON_ZERO(sizeof(variable) != sizeof(bool)), \
+          .par.var = &(variable) }; \
+    __paramfs __parfs_##variable = \
+        { .param = &__rtpar_##variable, \
+          .hypfs.e.type = XEN_HYPFS_TYPE_BOOL, \
+          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
+          .hypfs.e.name = (nam), \
+          .hypfs.e.size = sizeof(variable), \
+          .hypfs.e.max_size = sizeof(variable), \
+          .hypfs.e.read = hypfs_read_leaf, \
+          .hypfs.e.write = hypfs_write_bool, \
+          .hypfs.content = &(variable) }
+#define integer_runtime_only_param(nam, variable) \
+    __rtparam __rtpar_##variable = \
+        { .name = (nam), \
+          .type = OPT_UINT, \
+          .len = sizeof(variable), \
+          .par.var = &(variable) }; \
+    __paramfs __parfs_##variable = \
+        { .param = &__rtpar_##variable, \
+          .hypfs.e.type = XEN_HYPFS_TYPE_UINT, \
+          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
+          .hypfs.e.name = (nam), \
+          .hypfs.e.size = sizeof(variable), \
+          .hypfs.e.max_size = sizeof(variable), \
+          .hypfs.e.read = hypfs_read_leaf, \
+          .hypfs.e.write = hypfs_write_leaf, \
+          .hypfs.content = &(variable) }
+#define size_runtime_only_param(nam, variable) \
+    __rtparam __rtpar_##variable = \
+        { .name = (nam), \
+          .type = OPT_SIZE, \
+          .len = sizeof(variable), \
+          .par.var = &(variable) }; \
+    __paramfs __parfs_##variable = \
+        { .param = &__rtpar_##variable, \
+          .hypfs.e.type = XEN_HYPFS_TYPE_UINT, \
+          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
+          .hypfs.e.name = (nam), \
+          .hypfs.e.size = sizeof(variable), \
+          .hypfs.e.max_size = sizeof(variable), \
+          .hypfs.e.read = hypfs_read_leaf, \
+          .hypfs.e.write = hypfs_write_leaf, \
+          .hypfs.content = &(variable) }
+#define string_runtime_only_param(nam, variable) \
+    __rtparam __rtpar_##variable = \
+        { .name = (nam), \
+          .type = OPT_STR, \
+          .len = sizeof(variable), \
+          .par.var = &(variable) }; \
+    __paramfs __parfs_##variable = \
+        { .param = &__rtpar_##variable, \
+          .hypfs.e.type = XEN_HYPFS_TYPE_STRING, \
+          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
+          .hypfs.e.name = (nam), \
+          .hypfs.e.size = 0, \
+          .hypfs.e.max_size = sizeof(variable), \
+          .hypfs.e.read = hypfs_read_leaf, \
+          .hypfs.e.write = hypfs_write_leaf, \
+          .hypfs.content = &(variable) }
+
+#else
+
+#define custom_runtime_only_param(_name, _var, unused) \
     __rtparam __rtpar_##_var = \
       { .name = _name, \
           .type = OPT_CUSTOM, \
@@ -111,9 +220,13 @@ extern const struct kernel_param __param_start[], __param_end[];
           .len = sizeof(_var), \
           .par.var = &_var }
 
-#define custom_runtime_param(_name, _var) \
+#define custom_runtime_set_var(parfs, var)
+
+#endif
+
+#define custom_runtime_param(_name, _var, initfunc) \
     custom_param(_name, _var); \
-    custom_runtime_only_param(_name, _var)
+    custom_runtime_only_param(_name, _var, initfunc)
 #define boolean_runtime_param(_name, _var) \
     boolean_param(_name, _var); \
     boolean_runtime_only_param(_name, _var)
-- 
2.26.1


