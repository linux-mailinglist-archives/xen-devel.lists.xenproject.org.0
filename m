Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52E519C64D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 17:47:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK23W-000492-MH; Thu, 02 Apr 2020 15:46:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jjwm=5S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jK23V-00048U-I8
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 15:46:57 +0000
X-Inumbo-ID: 1aed8482-74f9-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1aed8482-74f9-11ea-9e09-bc764e2007e4;
 Thu, 02 Apr 2020 15:46:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3777FAE57;
 Thu,  2 Apr 2020 15:46:21 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 09/12] xen: add runtime parameter access support to hypfs
Date: Thu,  2 Apr 2020 17:46:13 +0200
Message-Id: <20200402154616.16927-10-jgross@suse.com>
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
---
 docs/misc/hypfs-paths.pandoc |  9 +++++
 xen/arch/arm/xen.lds.S       |  5 +++
 xen/arch/x86/hvm/vmx/vmcs.c  | 32 +++++++++++++++-
 xen/arch/x86/pv/domain.c     | 21 ++++++++++-
 xen/arch/x86/xen.lds.S       |  5 +++
 xen/common/grant_table.c     | 49 ++++++++++++++++++++-----
 xen/common/hypfs.c           | 41 +++++++++++++++++++++
 xen/common/kernel.c          | 27 +++++++++++++-
 xen/drivers/char/console.c   | 61 ++++++++++++++++++++++++++++---
 xen/include/xen/hypfs.h      |  4 ++
 xen/include/xen/param.h      | 87 ++++++++++++++++++++++++++++++++++++++++----
 11 files changed, 314 insertions(+), 27 deletions(-)

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index f134c505d6..9d46e7e44a 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -152,3 +152,12 @@ The major version of Xen.
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
index a497f6a48d..d31bed580d 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -89,6 +89,11 @@ SECTIONS
        __start_schedulers_array = .;
        *(.data.schedulers)
        __end_schedulers_array = .;
+
+       . = ALIGN(4);
+       __paramhypfs_start = .;
+       *(.data.paramhypfs)
+       __paramhypfs_end = .;
        *(.data.rel)
        *(.data.rel.*)
        CONSTRUCTORS
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 24f2bd6e43..859c753a14 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -70,6 +70,30 @@ integer_param("ple_window", ple_window);
 static bool __read_mostly opt_ept_pml = true;
 static s8 __read_mostly opt_ept_ad = -1;
 int8_t __read_mostly opt_ept_exec_sp = -1;
+static char opt_ept_setting[24];
+
+static void update_ept_param_append(const char *str, int val)
+{
+    char *pos = opt_ept_setting + strlen(opt_ept_setting);
+
+    snprintf(pos, sizeof(opt_ept_setting) - (pos - opt_ept_setting),
+             ",%s=%d", str, val);
+}
+
+static void update_ept_param(void)
+{
+    snprintf(opt_ept_setting, sizeof(opt_ept_setting), "pml=%d", opt_ept_pml);
+    if ( opt_ept_ad >= 0 )
+        update_ept_param_append("ad", opt_ept_ad);
+    if ( opt_ept_exec_sp >= 0 )
+        update_ept_param_append("exec-sp", opt_ept_exec_sp);
+}
+
+static void __init init_ept_param(struct param_hypfs *par)
+{
+    update_ept_param();
+    custom_runtime_set_var(par, opt_ept_setting);
+}
 
 static int __init parse_ept_param(const char *s)
 {
@@ -97,6 +121,9 @@ static int __init parse_ept_param(const char *s)
 }
 custom_param("ept", parse_ept_param);
 
+static int parse_ept_param_runtime(const char *s);
+custom_runtime_only_param("ept", parse_ept_param_runtime, init_ept_param);
+
 static int parse_ept_param_runtime(const char *s)
 {
     struct domain *d;
@@ -115,6 +142,10 @@ static int parse_ept_param_runtime(const char *s)
 
     opt_ept_exec_sp = val;
 
+    update_ept_param();
+    custom_runtime_set_var(param_2_parfs(parse_ept_param_runtime),
+                           opt_ept_setting);
+
     rcu_read_lock(&domlist_read_lock);
     for_each_domain ( d )
     {
@@ -144,7 +175,6 @@ static int parse_ept_param_runtime(const char *s)
 
     return 0;
 }
-custom_runtime_only_param("ept", parse_ept_param_runtime);
 
 /* Dynamic (run-time adjusted) execution control flags. */
 u32 vmx_pin_based_exec_control __read_mostly;
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 70fae43965..7bec22e810 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -20,8 +20,23 @@ static __read_mostly enum {
     PCID_OFF,
     PCID_ALL,
     PCID_XPTI,
-    PCID_NOXPTI
+    PCID_NOXPTI,
+    PCID_END
 } opt_pcid = PCID_XPTI;
+static const char opt_pcid_2_string[PCID_END][7] = {
+    [PCID_OFF] = "off",
+    [PCID_ALL] = "on",
+    [PCID_XPTI] = "xpti",
+    [PCID_NOXPTI] = "noxpti"
+};
+
+static void __init opt_pcid_init(struct param_hypfs *par)
+{
+    custom_runtime_set_var(par, opt_pcid_2_string[opt_pcid]);
+}
+
+static int parse_pcid(const char *s);
+custom_runtime_param("pcid", parse_pcid, opt_pcid_init);
 
 static int parse_pcid(const char *s)
 {
@@ -55,9 +70,11 @@ static int parse_pcid(const char *s)
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
index 7f9459d683..21a37f0f57 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -279,6 +279,11 @@ SECTIONS
        __start_schedulers_array = .;
        *(.data.schedulers)
        __end_schedulers_array = .;
+
+       . = ALIGN(8);
+       __paramhypfs_start = .;
+       *(.data.paramhypfs)
+       __paramhypfs_end = .;
   } :text
 
   DECL_SECTION(.data) {
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 9fd6e60416..7a63bdd772 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -85,8 +85,17 @@ struct grant_table {
     struct grant_table_arch arch;
 };
 
-static int parse_gnttab_limit(const char *param, const char *arg,
-                              unsigned int *valp)
+#define GRANT_CUSTOM_VAL_SZ  12
+
+static void update_gnttab_par(struct param_hypfs *par, unsigned int val,
+                              char *parval)
+{
+    snprintf(parval, GRANT_CUSTOM_VAL_SZ, "%u", val);
+    custom_runtime_set_var(par, parval);
+}
+
+static int parse_gnttab_limit(struct param_hypfs *par, const char *arg,
+                              unsigned int *valp, char *parval)
 {
     const char *e;
     unsigned long val;
@@ -99,28 +108,50 @@ static int parse_gnttab_limit(const char *param, const char *arg,
         return -ERANGE;
 
     *valp = val;
+    update_gnttab_par(par, val, parval);
 
     return 0;
 }
 
 unsigned int __read_mostly opt_max_grant_frames = 64;
+static char __read_mostly opt_max_grant_frames_val[GRANT_CUSTOM_VAL_SZ];
+
+static void __init gnttab_max_frames_init(struct param_hypfs *par)
+{
+    update_gnttab_par(par, opt_max_grant_frames, opt_max_grant_frames_val);
+}
+
+static int parse_gnttab_max_frames(const char *arg);
+custom_runtime_param("gnttab_max_frames", parse_gnttab_max_frames,
+                     gnttab_max_frames_init);
 
 static int parse_gnttab_max_frames(const char *arg)
 {
-    return parse_gnttab_limit("gnttab_max_frames", arg,
-                              &opt_max_grant_frames);
+    return parse_gnttab_limit(param_2_parfs(parse_gnttab_max_frames),
+                              arg, &opt_max_grant_frames,
+                              opt_max_grant_frames_val);
 }
-custom_runtime_param("gnttab_max_frames", parse_gnttab_max_frames);
 
 static unsigned int __read_mostly opt_max_maptrack_frames = 1024;
+static char __read_mostly opt_max_maptrack_frames_val[GRANT_CUSTOM_VAL_SZ];
 
-static int parse_gnttab_max_maptrack_frames(const char *arg)
+static void __init max_maptrack_frames_init(struct param_hypfs *par)
 {
-    return parse_gnttab_limit("gnttab_max_maptrack_frames", arg,
-                              &opt_max_maptrack_frames);
+    update_gnttab_par(par, opt_max_maptrack_frames,
+                      opt_max_maptrack_frames_val);
 }
+
+static int parse_gnttab_max_maptrack_frames(const char *arg);
 custom_runtime_param("gnttab_max_maptrack_frames",
-                     parse_gnttab_max_maptrack_frames);
+                     parse_gnttab_max_maptrack_frames,
+                     max_maptrack_frames_init);
+
+static int parse_gnttab_max_maptrack_frames(const char *arg)
+{
+    return parse_gnttab_limit(param_2_parfs(parse_gnttab_max_maptrack_frames),
+                              arg, &opt_max_maptrack_frames,
+                              opt_max_maptrack_frames_val);
+}
 
 #ifndef GNTTAB_MAX_VERSION
 #define GNTTAB_MAX_VERSION 2
diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 986b829934..df951526db 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -10,6 +10,7 @@
 #include <xen/hypercall.h>
 #include <xen/hypfs.h>
 #include <xen/lib.h>
+#include <xen/param.h>
 #include <xen/rwlock.h>
 #include <public/hypfs.h>
 
@@ -279,6 +280,36 @@ int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
     return 0;
 }
 
+int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
+                       XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
+{
+    struct param_hypfs *p;
+    char *buf;
+    int ret;
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
+    if ( !ret )
+        leaf->e.size = ulen;
+
+ out:
+    xfree(buf);
+    return ret;
+}
+
 static int hypfs_write(struct hypfs_entry *entry,
                        XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
 {
@@ -348,3 +379,13 @@ long do_hypfs_op(unsigned int cmd,
 
     return ret;
 }
+
+void hypfs_write_lock(void)
+{
+    write_lock(&hypfs_lock);
+}
+
+void hypfs_write_unlock(void)
+{
+    write_unlock(&hypfs_lock);
+}
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 4b7bc28afb..7516242337 100644
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
+    hypfs_write_unlock();
+
+    return ret;
 }
 
 /**
@@ -433,6 +439,25 @@ static int __init buildinfo_init(void)
 }
 __initcall(buildinfo_init);
 
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
+        hypfs_add_leaf(&params, &param->hypfs, true);
+    }
+
+    return 0;
+}
+__initcall(param_init);
+
 # define DO(fn) long do_##fn
 
 #endif
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 913ae1b66a..b18b431fa8 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -75,12 +75,29 @@ enum con_timestamp_mode
     TSM_DATE_MS,       /* [YYYY-MM-DD HH:MM:SS.mmm] */
     TSM_BOOT,          /* [SSSSSS.uuuuuu] */
     TSM_RAW,           /* [XXXXXXXXXXXXXXXX] */
+    TSM_END
+};
+
+static const char con_timestamp_mode_2_string[TSM_END][7] = {
+    [TSM_NONE] = "none",
+    [TSM_DATE] = "date",
+    [TSM_DATE_MS] = "datems",
+    [TSM_BOOT] = "boot",
+    [TSM_RAW] = "raw"
 };
 
 static enum con_timestamp_mode __read_mostly opt_con_timestamp_mode = TSM_NONE;
 
+static void con_timestamp_mode_upd(struct param_hypfs *par)
+{
+    const char *val = con_timestamp_mode_2_string[opt_con_timestamp_mode];
+
+    custom_runtime_set_var_sz(par, val, 7);
+}
+
 static int parse_console_timestamps(const char *s);
-custom_runtime_param("console_timestamps", parse_console_timestamps);
+custom_runtime_param("console_timestamps", parse_console_timestamps,
+                     con_timestamp_mode_upd);
 
 /* conring_size: allows a large console ring than default (16kB). */
 static uint32_t __initdata opt_conring_size;
@@ -133,16 +150,39 @@ static DEFINE_SPINLOCK(console_lock);
 #define XENLOG_DEFAULT       1 /* XENLOG_WARNING */
 #define XENLOG_GUEST_DEFAULT 1 /* XENLOG_WARNING */
 
+#define LOGLVL_VAL_SZ 16
 static int __read_mostly xenlog_upper_thresh = XENLOG_UPPER_THRESHOLD;
 static int __read_mostly xenlog_lower_thresh = XENLOG_LOWER_THRESHOLD;
+static char xenlog_val[LOGLVL_VAL_SZ];
 static int __read_mostly xenlog_guest_upper_thresh =
     XENLOG_GUEST_UPPER_THRESHOLD;
 static int __read_mostly xenlog_guest_lower_thresh =
     XENLOG_GUEST_LOWER_THRESHOLD;
+static char xenlog_guest_val[LOGLVL_VAL_SZ];
 
 static int parse_loglvl(const char *s);
 static int parse_guest_loglvl(const char *s);
 
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
+
 /*
  * <lvl> := none|error|warning|info|debug|all
  * loglvl=<lvl_print_always>[/<lvl_print_ratelimit>]
@@ -151,8 +191,8 @@ static int parse_guest_loglvl(const char *s);
  * Similar definitions for guest_loglvl, but applies to guest tracing.
  * Defaults: loglvl=warning ; guest_loglvl=none/warning
  */
-custom_runtime_param("loglvl", parse_loglvl);
-custom_runtime_param("guest_loglvl", parse_guest_loglvl);
+custom_runtime_param("loglvl", parse_loglvl, xenlog_init);
+custom_runtime_param("guest_loglvl", parse_guest_loglvl, xenlog_guest_init);
 
 static atomic_t print_everything = ATOMIC_INIT(0);
 
@@ -173,7 +213,7 @@ static int __parse_loglvl(const char *s, const char **ps)
     return 2; /* sane fallback */
 }
 
-static int _parse_loglvl(const char *s, int *lower, int *upper)
+static int _parse_loglvl(const char *s, int *lower, int *upper, char *val)
 {
     *lower = *upper = __parse_loglvl(s, &s);
     if ( *s == '/' )
@@ -181,18 +221,21 @@ static int _parse_loglvl(const char *s, int *lower, int *upper)
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
@@ -727,13 +770,17 @@ static int printk_prefix_check(char *p, char **pp)
 
 static int parse_console_timestamps(const char *s)
 {
+    struct param_hypfs *par = param_2_parfs(parse_console_timestamps);
+
     switch ( parse_bool(s, NULL) )
     {
     case 0:
         opt_con_timestamp_mode = TSM_NONE;
+        con_timestamp_mode_upd(par);
         return 0;
     case 1:
         opt_con_timestamp_mode = TSM_DATE;
+        con_timestamp_mode_upd(par);
         return 0;
     }
     if ( *s == '\0' || /* Compat for old booleanparam() */
@@ -750,6 +797,8 @@ static int parse_console_timestamps(const char *s)
     else
         return -EINVAL;
 
+    con_timestamp_mode_upd(par);
+
     return 0;
 }
 
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index 85588e2a59..3c3b1b056d 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -112,5 +112,9 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
                      XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen);
 int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
                      XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen);
+int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
+                       XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen);
+void hypfs_write_lock(void);
+void hypfs_write_unlock(void);
 
 #endif /* __XEN_HYPFS_H__ */
diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index d4578cd27f..5cf2149279 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -1,6 +1,7 @@
 #ifndef _XEN_PARAM_H
 #define _XEN_PARAM_H
 
+#include <xen/hypfs.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/stdbool.h>
@@ -25,10 +26,18 @@ struct kernel_param {
     } par;
 };
 
+struct param_hypfs {
+    const struct kernel_param *param;
+    struct hypfs_entry_leaf hypfs;
+    void (*init_leaf)(struct param_hypfs *par);
+};
+
 extern const struct kernel_param __setup_start[], __setup_end[];
 extern const struct kernel_param __param_start[], __param_end[];
+extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
 
 #define __dataparam       __used_section(".data.param")
+#define __paramhypfs      __used_section(".data.paramhypfs")
 
 #define __param(att)      static const att \
     __attribute__((__aligned__(sizeof(void *)))) struct kernel_param
@@ -79,41 +88,103 @@ extern const struct kernel_param __param_start[], __param_end[];
           .type = OPT_IGNORE }
 
 #define __rtparam         __param(__dataparam)
+#define __paramfs         static __paramhypfs \
+    __attribute__((__aligned__(sizeof(void *)))) struct param_hypfs
+
+#define custom_runtime_set_var_sz(parfs, var, sz) \
+    { \
+        (parfs)->hypfs.content = &(var); \
+        (parfs)->hypfs.e.max_size = sz; \
+        (parfs)->hypfs.e.size = strlen(var) + 1; \
+    }
+#define custom_runtime_set_var(parfs, var) \
+    custom_runtime_set_var_sz(parfs, var, sizeof(var))
 
-#define custom_runtime_only_param(_name, _var) \
+#define param_2_parfs(par) &__parfs_##par
+
+/* initfunc needs to set size and content, e.g. via custom_runtime_set_var(). */
+#define custom_runtime_only_param(_name, _var, initfunc) \
     __rtparam __rtpar_##_var = \
       { .name = _name, \
           .type = OPT_CUSTOM, \
-          .par.func = _var }
+          .par.func = _var }; \
+    __paramfs __parfs_##_var = \
+        { .param = &__rtpar_##_var, \
+          .init_leaf = initfunc, \
+          .hypfs.e.type = XEN_HYPFS_TYPE_STRING, \
+          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
+          .hypfs.e.name = _name, \
+          .hypfs.e.read = hypfs_read_leaf, \
+          .hypfs.e.write = hypfs_write_custom }
 #define boolean_runtime_only_param(_name, _var) \
     __rtparam __rtpar_##_var = \
         { .name = _name, \
           .type = OPT_BOOL, \
           .len = sizeof(_var) + \
                  BUILD_BUG_ON_ZERO(sizeof(_var) != sizeof(bool)), \
-          .par.var = &_var }
+          .par.var = &_var }; \
+    __paramfs __parfs_##_var = \
+        { .param = &__rtpar_##_var, \
+          .hypfs.e.type = XEN_HYPFS_TYPE_BOOL, \
+          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
+          .hypfs.e.name = _name, \
+          .hypfs.e.size = sizeof(_var), \
+          .hypfs.e.max_size = sizeof(_var), \
+          .hypfs.e.read = hypfs_read_leaf, \
+          .hypfs.e.write = hypfs_write_bool, \
+          .hypfs.content = &_var }
 #define integer_runtime_only_param(_name, _var) \
     __rtparam __rtpar_##_var = \
         { .name = _name, \
           .type = OPT_UINT, \
           .len = sizeof(_var), \
-          .par.var = &_var }
+          .par.var = &_var }; \
+    __paramfs __parfs_##_var = \
+        { .param = &__rtpar_##_var, \
+          .hypfs.e.type = XEN_HYPFS_TYPE_UINT, \
+          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
+          .hypfs.e.name = _name, \
+          .hypfs.e.size = sizeof(_var), \
+          .hypfs.e.max_size = sizeof(_var), \
+          .hypfs.e.read = hypfs_read_leaf, \
+          .hypfs.e.write = hypfs_write_leaf, \
+          .hypfs.content = &_var }
 #define size_runtime_only_param(_name, _var) \
     __rtparam __rtpar_##_var = \
         { .name = _name, \
           .type = OPT_SIZE, \
           .len = sizeof(_var), \
-          .par.var = &_var }
+          .par.var = &_var }; \
+    __paramfs __parfs_##_var = \
+        { .param = &__rtpar_##_var, \
+          .hypfs.e.type = XEN_HYPFS_TYPE_UINT, \
+          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
+          .hypfs.e.name = _name, \
+          .hypfs.e.size = sizeof(_var), \
+          .hypfs.e.max_size = sizeof(_var), \
+          .hypfs.e.read = hypfs_read_leaf, \
+          .hypfs.e.write = hypfs_write_leaf, \
+          .hypfs.content = &_var }
 #define string_runtime_only_param(_name, _var) \
     __rtparam __rtpar_##_var = \
         { .name = _name, \
           .type = OPT_STR, \
           .len = sizeof(_var), \
-          .par.var = &_var }
+          .par.var = &_var }; \
+    __paramfs __parfs_##_var = \
+        { .param = &__rtpar_##_var, \
+          .hypfs.e.type = XEN_HYPFS_TYPE_STRING, \
+          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
+          .hypfs.e.name = _name, \
+          .hypfs.e.size = sizeof(_var), \
+          .hypfs.e.max_size = sizeof(_var), \
+          .hypfs.e.read = hypfs_read_leaf, \
+          .hypfs.e.write = hypfs_write_leaf, \
+          .hypfs.content = &_var }
 
-#define custom_runtime_param(_name, _var) \
+#define custom_runtime_param(_name, _var, initfunc) \
     custom_param(_name, _var); \
-    custom_runtime_only_param(_name, _var)
+    custom_runtime_only_param(_name, _var, initfunc)
 #define boolean_runtime_param(_name, _var) \
     boolean_param(_name, _var); \
     boolean_runtime_only_param(_name, _var)
-- 
2.16.4


