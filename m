Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3D3441D4D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 16:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219241.379962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ6q-0000Mg-HV; Mon, 01 Nov 2021 15:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219241.379962; Mon, 01 Nov 2021 15:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ6q-0000KS-B1; Mon, 01 Nov 2021 15:20:28 +0000
Received: by outflank-mailman (input) for mailman id 219241;
 Mon, 01 Nov 2021 15:20:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rWtG=PU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhZ6o-0008DA-LO
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 15:20:26 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9a6435f-a2f2-4df9-bd89-32b3e9a66203;
 Mon, 01 Nov 2021 15:20:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4938C21968;
 Mon,  1 Nov 2021 15:20:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 032AB13A4A;
 Mon,  1 Nov 2021 15:20:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MG8WO7QFgGFzNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Nov 2021 15:20:20 +0000
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
X-Inumbo-ID: e9a6435f-a2f2-4df9-bd89-32b3e9a66203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635780021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4r4R0Hldxyr3k06NPdh8DilHAZLAJfd+KTXBp1flBk=;
	b=UvpfJ9JgaE+a3GdxPs3NQf52WRPBSZpV/Gp4F4NAwNP3+mlTnrtiL9FcKOefRo58PwmCFy
	L/Wf/by+NvBmHoo4uJ6CPSR9r9yoz/NIGKqLFvzVHB7HnEelrGkwJmhnExrvPU6KD7+/IN
	FiZU1rcRvICAXKrk8gCgVnA7n9yyIOY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 07/15] xen: generate hypercall interface related code
Date: Mon,  1 Nov 2021 16:20:07 +0100
Message-Id: <20211101152015.28488-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211101152015.28488-1-jgross@suse.com>
References: <20211101152015.28488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of repeating similar data multiple times use a single source
file and a generator script for producing prototypes and call sequences
of the hypercalls.

As the script already knows the number of parameters used add generating
a macro for populating an array with the number of parameters per
hypercall.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- split platform_op for doe and compat prefixes (Jan Beulich)
- add "addline:" directive
- add priorities to handlers (Jan Beulich)
---
 .gitignore                    |   1 +
 xen/Makefile                  |  10 ++
 xen/include/hypercall-defs.c  | 285 +++++++++++++++++++++++++++++++
 xen/scripts/gen_hypercall.awk | 306 ++++++++++++++++++++++++++++++++++
 4 files changed, 602 insertions(+)
 create mode 100644 xen/include/hypercall-defs.c
 create mode 100644 xen/scripts/gen_hypercall.awk

diff --git a/.gitignore b/.gitignore
index 9513506dd9..753a602e29 100644
--- a/.gitignore
+++ b/.gitignore
@@ -336,6 +336,7 @@ xen/include/public/public
 xen/include/xen/*.new
 xen/include/xen/acm_policy.h
 xen/include/xen/compile.h
+xen/include/xen/hypercall-defs.h
 xen/include/xen/lib/x86/cpuid-autogen.h
 xen/test/livepatch/config.h
 xen/test/livepatch/expect_config.h
diff --git a/xen/Makefile b/xen/Makefile
index a3189eb47c..dfdae47e74 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -383,6 +383,7 @@ _clean: delete-unfresh-files
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
 	rm -f asm-offsets.s include/asm-*/asm-offsets.h
+	rm -f include/xen/hypercall-defs.h include/hypercall-defs.i
 	rm -f .banner .allconfig.tmp
 
 .PHONY: _distclean
@@ -405,6 +406,7 @@ $(TARGET): delete-unfresh-files
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
 	$(MAKE) -f $(BASEDIR)/Rules.mk include/asm-$(TARGET_ARCH)/asm-offsets.h
+	$(MAKE) -f $(BASEDIR)/Rules.mk include/xen/hypercall-defs.h
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
 
 # drivers/char/console.o contains static banner/compile info. Blow it away.
@@ -466,6 +468,14 @@ include/asm-$(TARGET_ARCH)/asm-offsets.h: asm-offsets.s
 	  echo ""; \
 	  echo "#endif") <$< >$@
 
+quiet_cmd_genhyp = GEN     $@
+define cmd_genhyp
+    awk -f scripts/gen_hypercall.awk <$< >$@
+endef
+
+include/xen/hypercall-defs.h: include/hypercall-defs.i scripts/gen_hypercall.awk FORCE
+	$(call if_changed,genhyp)
+
 SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
 define all_sources
     ( find include/asm-$(TARGET_ARCH) -name '*.h' -print; \
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
new file mode 100644
index 0000000000..67f6081558
--- /dev/null
+++ b/xen/include/hypercall-defs.c
@@ -0,0 +1,285 @@
+/*
+ * Hypercall interface description:
+ * Used by scripts/gen_hypercall.awk to generate hypercall prototypes and call
+ * sequences.
+ *
+ * Syntax is like a prototype, but without return type and without the ";" at
+ * the end. Pointer types will be automatically converted to use the
+ * XEN_GUEST_HANDLE_PARAM() macro. Handlers with no parameters just use a
+ * definition like "fn()".
+ * Hypercall/function names are without the leading "__HYPERVISOR_"/"do_"
+ * strings.
+ *
+ * The return type of a class of prototypes using the same prefix is set via:
+ * rettype: <prefix> <type>
+ * Default return type is "long". A return type for a prefix can be set only
+ * once and it needs to be set before that prefix is being used via the
+ * "prefix:" directive.
+ *
+ * The prefix of the prototypes is set via a line:
+ * prefix: <prefix> ...
+ * Multiple prefixes are possible (restriction see below). Prefixes are without
+ * a trailing "_". The current prefix settings are active until a new "prefix:"
+ * line.
+ *
+ * Caller macros are suffixed with a selectable name via lines like:
+ * caller: <suffix>
+ * When a caller suffix is active, there is only one active prefix allowed.
+ *
+ * With a "defhandle:" line it is possible to add a DEFINE_XEN_GUEST_HANDLE()
+ * to the generated header:
+ * defhandle: <handle-type> [<type>]
+ * Without specifying <type> only a DEFINE_XEN_GUEST_HANDLE(<handle-type>)
+ * will be generated, otherwise it will be a
+ * __DEFINE_XEN_GUEST_HANDLE(<handle-type>, <type>) being generated. Note that
+ * the latter will include the related "const" handle "const_<handle-type>".
+ *
+ * In order to support using coding style compliant pointers in the
+ * prototypes it is possible to add translation entries to generate the correct
+ * handle types:
+ * handle: <handle-type> <type>
+ * This will result in the prototype translation from "<type> *" to
+ * "XEN_GUEST_HANDLE_PARAM(<handle-type>)".
+ *
+ * A verbatim line can be added via:
+ * addline: <line-contents>
+ * Its position is kept in regard of other "handle:" and "defhandle:" lines.
+ *
+ * The hypercall handler calling code will be generated from a final table in
+ * the source file, which is started via the line:
+ * table: <caller> <caller> ...
+ * with the <caller>s specifying the designated caller macro of each column of
+ * the table. Any column of a <caller> not having been set via a "caller:"
+ * line will be ignored.
+ * The first column of the table contains the hypercall/prototype, each
+ * <caller> column contains the prefix for the function to use for that caller.
+ * A function prefix can be annotated with a priority by adding ":<prio>" to it
+ * ("1" being the highest priority, higher numbers mean lower priority, no
+ * priority specified is the lowest priority). The generated code will try to
+ * achieve better performance for calling high priority handlers.
+ * A column not being supported by a <caller> is marked with "-". Lines with all
+ * entries being "-" after removal of inactive <caller> columns are ignored.
+ *
+ * This file is being preprocessed using $(CPP), so #ifdef CONFIG_* conditionals
+ * are possible.
+ */
+
+#ifdef CONFIG_HVM
+#define PREFIX_hvm hvm
+#else
+#define PREFIX_hvm
+#endif
+
+#ifdef CONFIG_COMPAT
+#define PREFIX_compat compat
+rettype: compat int
+#else
+#define PREFIX_compat
+#endif
+
+#ifdef CONFIG_ARM
+#define PREFIX_dep dep
+#else
+#define PREFIX_dep
+#endif
+
+handle: uint unsigned int
+handle: const_void const void
+handle: const_char const char
+
+#ifdef CONFIG_COMPAT
+defhandle: multicall_entry_compat_t
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+addline: typedef struct compat_platform_op compat_platform_op_t;
+defhandle: compat_platform_op_t
+#endif
+#endif
+#ifdef CONFIG_PV32
+defhandle: trap_info_compat_t
+defhandle: physdev_op_compat_t
+#endif
+
+prefix: do PREFIX_hvm PREFIX_compat
+physdev_op(int cmd, void *arg)
+#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
+grant_table_op(unsigned int cmd, void *uop, unsigned int count)
+#endif
+
+prefix: do PREFIX_hvm
+memory_op(unsigned long cmd, void *arg)
+
+prefix: do PREFIX_compat
+xen_version(int cmd, void *arg)
+vcpu_op(int cmd, unsigned int vcpuid, void *arg)
+sched_op(int cmd, void *arg)
+xsm_op(void *op)
+callback_op(int cmd, const void *arg)
+#ifdef CONFIG_ARGO
+argo_op(unsigned int cmd, void *arg1, void *arg2, unsigned long arg3, unsigned long arg4)
+#endif
+#ifdef CONFIG_KEXEC
+kexec_op(unsigned int op, void *uarg)
+#endif
+#ifdef CONFIG_PV
+iret()
+nmi_op(unsigned int cmd, void *arg)
+#ifdef CONFIG_XENOPROF
+xenoprof_op(int op, void *arg)
+#endif
+#endif /* CONFIG_PV */
+
+#ifdef CONFIG_COMPAT
+prefix: compat
+set_timer_op(uint32_t lo, int32_t hi)
+multicall(multicall_entry_compat_t *call_list, uint32_t nr_calls)
+memory_op(unsigned int cmd, void *arg)
+#ifdef CONFIG_IOREQ_SERVER
+dm_op(domid_t domid, unsigned int nr_bufs, void *bufs)
+#endif
+mmuext_op(void *arg, unsigned int count, uint *pdone, unsigned int foreigndom)
+#ifdef CONFIG_PV32
+set_trap_table(trap_info_compat_t *traps)
+set_gdt(unsigned int *frame_list, unsigned int entries)
+set_callbacks(unsigned long event_selector, unsigned long event_address, unsigned long failsafe_selector, unsigned long failsafe_address)
+update_descriptor(uint32_t pa_lo, uint32_t pa_hi, uint32_t desc_lo, uint32_t desc_hi)
+update_va_mapping(unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags)
+physdev_op_compat(physdev_op_compat_t *uop)
+update_va_mapping_otherdomain(unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags, domid_t domid)
+#endif
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+platform_op(compat_platform_op_t *u_xenpf_op)
+#endif
+#endif /* CONFIG_COMPAT */
+
+#if defined(CONFIG_PV) || defined(CONFIG_ARM)
+prefix: do PREFIX_dep
+event_channel_op_compat(evtchn_op_t *uop)
+physdev_op_compat(physdev_op_t *uop)
+/* Legacy hypercall (as of 0x00030101). */
+sched_op_compat(int cmd, unsigned long arg)
+#endif
+
+prefix: do
+set_timer_op(s_time_t timeout)
+console_io(unsigned int cmd, unsigned int count, char *buffer)
+vm_assist(unsigned int cmd, unsigned int type)
+event_channel_op(int cmd, void *arg)
+mmuext_op(mmuext_op_t *uops, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
+multicall(multicall_entry_t *call_list, unsigned int nr_calls)
+#ifdef CONFIG_PV
+mmu_update(mmu_update_t *ureqs, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
+stack_switch(unsigned long ss, unsigned long esp)
+fpu_taskswitch(int set)
+set_debugreg(int reg, unsigned long value)
+get_debugreg(int reg)
+set_segment_base(unsigned int which, unsigned long base)
+mca(xen_mc_t *u_xen_mc)
+set_trap_table(const_trap_info_t *traps)
+set_gdt(xen_ulong_t *frame_list, unsigned int entries)
+set_callbacks(unsigned long event_address, unsigned long failsafe_address, unsigned long syscall_address)
+update_descriptor(uint64_t gaddr, seg_desc_t desc)
+update_va_mapping(unsigned long va, uint64_t val64, unsigned long flags)
+update_va_mapping_otherdomain(unsigned long va, uint64_t val64, unsigned long flags, domid_t domid)
+#endif
+#ifdef CONFIG_IOREQ_SERVER
+dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
+#endif
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+sysctl(xen_sysctl_t *u_sysctl)
+domctl(xen_domctl_t *u_domctl)
+paging_domctl_cont(xen_domctl_t *u_domctl)
+platform_op(xen_platform_op_t *u_xenpf_op)
+#endif
+#ifdef CONFIG_HVM
+hvm_op(unsigned long op, void *arg)
+#endif
+#ifdef CONFIG_HYPFS
+hypfs_op(unsigned int cmd, const char *arg1, unsigned long arg2, void *arg3, unsigned long arg4)
+#endif
+#ifdef CONFIG_X86
+xenpmu_op(unsigned int op, xen_pmu_params_t *arg)
+#endif
+
+#ifdef CONFIG_PV
+caller: pv64
+#ifdef CONFIG_PV32
+caller: pv32
+#endif
+#endif
+#if defined(CONFIG_HVM) && defined(CONFIG_X86)
+caller: hvm64
+#ifdef CONFIG_COMPAT
+caller: hvm32
+#endif
+#endif
+#ifdef CONFIG_ARM
+caller: arm
+#endif
+
+table:                             pv32     pv64     hvm32    hvm64    arm
+set_trap_table                     compat   do       -        -        -
+mmu_update                         do:1     do:1     -        -        -
+set_gdt                            compat   do       -        -        -
+stack_switch                       do:2     do:2     -        -        -
+set_callbacks                      compat   do       -        -        -
+fpu_taskswitch                     do       do       -        -        -
+sched_op_compat                    do       do       -        -        dep
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+platform_op                        compat   do       compat   do       do
+#endif
+set_debugreg                       do       do       -        -        -
+get_debugreg                       do       do       -        -        -
+update_descriptor                  compat   do       -        -        -
+memory_op                          compat   do       hvm      hvm      do
+multicall                          compat:2 do:2     compat   do       do
+update_va_mapping                  compat   do       -        -        -
+set_timer_op                       compat   do       compat   do       -
+event_channel_op_compat            do       do       -        -        dep
+xen_version                        compat   do       compat   do       do
+console_io                         do       do       do       do       do
+physdev_op_compat                  compat   do       -        -        dep
+#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
+grant_table_op                     compat   do       hvm      hvm      do
+#endif
+vm_assist                          do       do       do       do       do
+update_va_mapping_otherdomain      compat   do       -        -        -
+iret                               compat:1 do:1     -        -        -
+vcpu_op                            compat   do       compat:1 do:1     do
+set_segment_base                   do:2     do:2     -        -        -
+#ifdef CONFIG_PV
+mmuext_op                          compat:2 do:2     compat   do       -
+#endif
+xsm_op                             compat   do       compat   do       do
+nmi_op                             compat   do       -        -        -
+sched_op                           compat   do       compat   do       do
+callback_op                        compat   do       -        -        -
+#ifdef CONFIG_XENOPROF
+xenoprof_op                        compat   do       -        -        -
+#endif
+event_channel_op                   do       do       do:1     do:1     do
+physdev_op                         compat   do       hvm      hvm      do
+#ifdef CONFIG_HVM
+hvm_op                             do       do       do       do       do
+#endif
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+sysctl                             do       do       do       do       do
+domctl                             do       do       do       do       do
+#endif
+#ifdef CONFIG_KEXEC
+kexec_op                           compat   do       -        -        -
+#endif
+tmem_op                            -        -        -        -        -
+#ifdef CONFIG_ARGO
+argo_op                            compat   do       compat   do       do
+#endif
+xenpmu_op                          do       do       do       do       -
+#ifdef CONFIG_IOREQ_SERVER
+dm_op                              compat   do       compat   do       do
+#endif
+#ifdef CONFIG_HYPFS
+hypfs_op                           do       do       do       do       do
+#endif
+mca                                do       do       -        -        -
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+paging_domctl_cont                 do       do       do       do       -
+#endif
diff --git a/xen/scripts/gen_hypercall.awk b/xen/scripts/gen_hypercall.awk
new file mode 100644
index 0000000000..26017c0900
--- /dev/null
+++ b/xen/scripts/gen_hypercall.awk
@@ -0,0 +1,306 @@
+# awk script to generate hypercall handler prototypes and a macro for doing
+# the calls of the handlers inside a switch() statement.
+
+BEGIN {
+    printf("/* Generated file, do not edit! */\n\n");
+    e = 0;
+    n = 0;
+    p = 0;
+    nc = 0;
+}
+
+# Issue error to stderr
+function do_err(msg) {
+    print "Error: "msg": "$0 >"/dev/stderr";
+    exit 1;
+}
+
+# Generate handler call
+function do_call(f, p,    i) {
+    printf("            ret = %s_%s(", pre[f, p], fn[f]);
+    for (i = 1; i <= n_args[f]; i++) {
+        if (i > 1)
+            printf(", ");
+        if (ptr[f, i])
+            printf("(XEN_GUEST_HANDLE_PARAM(%s)){ _p(a%d) }", typ[f, i], i);
+        else
+            printf("(%s)(a%d)", typ[f, i], i);
+    }
+    printf("); \\\n");
+}
+
+# Generate case statement for call
+function do_case(f, p) {
+    printf("        case __HYPERVISOR_%s: \\\n", fn[f]);
+    do_call(f, p);
+    printf("            break; \\\n");
+}
+
+# Generate switch statement for calling handlers
+function do_switch(ca, p,    i) {
+    printf("        switch ( num ) \\\n");
+    printf("        { \\\n");
+    for (i = 1; i <= nc; i++)
+        if (call[i] == ca && call_prio[i] == p)
+            do_case(call_fn[i], call_p[i]);
+    printf("        default: \\\n");
+    printf("            ret = -ENOSYS; \\\n");
+    printf("            break; \\\n");
+    printf("        } \\\n");
+}
+
+function rest_of_line(par,    i, val) {
+    val = $(par);
+    for (i = par + 1; i <= NF; i++)
+        val = val " " $(i);
+    return val;
+}
+
+# Handle comments (multi- and single line)
+$1 == "/*" {
+    comment = 1;
+}
+comment == 1 {
+    if ($(NF) == "*/") comment = 0;
+    next;
+}
+
+# Skip preprocessing artefacts
+$1 == "extern" {
+    next;
+}
+/^#/ {
+    next;
+}
+
+# Drop empty lines
+NF == 0 {
+    next;
+}
+
+# Handle "handle:" line
+$1 == "handle:" {
+    if (NF < 3)
+        do_err("\"handle:\" requires at least two parameters");
+    val = rest_of_line(3);
+    xlate[val] = $2;
+    next;
+}
+
+# Handle "defhandle:" line
+$1 == "defhandle:" {
+    if (NF < 2)
+        do_err("\"defhandle:\" requires at least one parameter");
+    e++;
+    if (NF == 2) {
+        emit[e] = sprintf("DEFINE_XEN_GUEST_HANDLE(%s);", $2);
+    } else {
+        val = rest_of_line(3);
+        emit[e] = sprintf("__DEFINE_XEN_GUEST_HANDLE(%s, %s);", $2, val);
+        xlate[val] = $2;
+    }
+    next;
+}
+
+# Handle "addline:" line
+$1 == "addline:" {
+    if (NF < 2)
+        do_err("\"addline:\" requires at least one parameter");
+    e++;
+    emit[e] = rest_of_line(2);
+    next;
+}
+
+# Handle "rettype:" line
+$1 == "rettype:" {
+    if (NF < 3)
+        do_err("\"rettype:\" requires at least two parameters");
+    if ($2 in rettype)
+        do_err("rettype can be set only once for each prefix");
+    rettype[$2] = rest_of_line(3);
+    next;
+}
+
+# Handle "caller:" line
+$1 == "caller:" {
+    caller[$2] = 1;
+    next;
+}
+
+# Handle "prefix:" line
+$1 == "prefix:" {
+    p = NF - 1;
+    for (i = 2; i <= NF; i++) {
+        prefix[i - 1] = $(i);
+        if (!(prefix[i - 1] in rettype))
+            rettype[prefix[i - 1]] = "long";
+    }
+    next;
+}
+
+# Handle "table:" line
+$1 == "table:" {
+    table = 1;
+    for (i = 2; i <= NF; i++)
+        col[i - 1] = $(i);
+    n_cols = NF - 1;
+    next;
+}
+
+# Handle table definition line
+table == 1 {
+    if (NF != n_cols + 1)
+        do_err("Table definition line has wrong number of fields");
+    for (c = 1; c <= n_cols; c++) {
+        if (caller[col[c]] != 1)
+            continue;
+        if ($(c + 1) == "-")
+            continue;
+        pref = $(c + 1);
+        idx = index(pref, ":");
+        if (idx == 0)
+            prio = 100;
+        else {
+            prio = substr(pref, idx + 1) + 0;
+            pref = substr(pref, 1, idx - 1);
+            if (prio >= 100 || prio < 1)
+                do_err("Priority must be in the range 1..99");
+        }
+        fnd = 0;
+        for (i = 1; i <= n; i++) {
+            if (fn[i] != $1)
+                continue;
+            for (j = 1; j <= n_pre[i]; j++) {
+                if (pre[i, j] == pref) {
+                    prios[col[c], prio]++;
+                    if (prios[col[c], prio] == 1) {
+                        n_prios[col[c]]++;
+                        prio_list[col[c], n_prios[col[c]]] = prio;
+                        prio_mask[col[c], prio] = "(1ULL << __HYPERVISOR_"$1")";
+                    } else
+                        prio_mask[col[c], prio] = prio_mask[col[c], prio] " | (1ULL << __HYPERVISOR_"$1")";
+                    nc++;
+                    call[nc] = col[c];
+                    call_fn[nc] = i;
+                    call_p[nc] = j;
+                    call_prio[nc] = prio;
+                    fnd = 1;
+                }
+            }
+        }
+        if (fnd == 0)
+            do_err("No prototype for prefix/hypercall combination");
+    }
+    next;
+}
+
+# Prototype line
+{
+    bro = index($0, "(");
+    brc = index($0, ")");
+    if (bro < 2 || brc < bro)
+        do_err("No valid prototype line");
+    n++;
+    fn[n] = substr($0, 1, bro - 1);
+    n_pre[n] = p;
+    for (i = 1; i <= p; i++)
+        pre[n, i] = prefix[i];
+    args = substr($0, bro + 1, brc - bro - 1);
+    n_args[n] = split(args, a, ",");
+    if (n_args[n] > 5)
+        do_err("Too many parameters");
+    for (i = 1; i <= n_args[n]; i++) {
+        sub("^ *", "", a[i]);         # Remove leading white space
+        sub(" +", " ", a[i]);         # Replace multiple spaces with single ones
+        sub(" *$", "", a[i]);         # Remove trailing white space
+        ptr[n, i] = index(a[i], "*"); # Is it a pointer type?
+        sub("[*]", "", a[i]);         # Remove "*"
+        if (index(a[i], " ") == 0)
+            do_err("Parameter with no type or no name");
+        typ[n, i] = a[i];
+        sub(" [^ ]+$", "", typ[n, i]);    # Remove parameter name
+        if (ptr[n, i] && (typ[n, i] in xlate))
+            typ[n, i] = xlate[typ[n, i]];
+        arg[n, i] = a[i];
+        sub("^([^ ]+ )+", "", arg[n, i]); # Remove parameter type
+    }
+}
+
+# Generate the output
+END {
+    # Verbatim generated lines
+    for (i = 1; i <= e; i++)
+        printf("%s\n", emit[i]);
+    printf("\n");
+    # Generate prototypes
+    for (i = 1; i <= n; i++) {
+        for (p = 1; p <= n_pre[i]; p++) {
+            printf("%s %s_%s(", rettype[pre[i, p]], pre[i, p], fn[i]);
+            if (n_args[i] == 0)
+                printf("void");
+            else
+                for (j = 1; j <= n_args[i]; j++) {
+                    if (j > 1)
+                        printf(", ");
+                    if (ptr[i, j])
+                        printf("XEN_GUEST_HANDLE_PARAM(%s)", typ[i, j]);
+                    else
+                        printf("%s", typ[i, j]);
+                    printf(" %s", arg[i, j]);
+                }
+            printf(");\n");
+        }
+    }
+    # Generate call sequences and args array contents
+    for (ca in caller) {
+        if (caller[ca] != 1)
+            continue;
+        for (pl = 1; pl <= n_prios[ca]; pl++)
+            p_list[pl] = prio_list[ca, pl];
+        asort(p_list, p_list, "@val_num_asc");
+        need_mask = 0;
+        # If any prio but the default one has more than 1 entry we need "mask"
+        for (pl = 1; pl < n_prios[ca]; pl++) {
+            if (prios[ca, p_list[pl]] > 1)
+                need_mask = 1;
+        }
+        printf("\n");
+        printf("#define call_handlers_%s(num, ret, a1, a2, a3, a4, a5) \\\n", ca);
+        printf("{ \\\n");
+        if (need_mask)
+            printf("    uint64_t mask = 1ULL << num; \\\n");
+        for (pl = 1; pl <= n_prios[ca]; pl++) {
+            if (prios[ca, p_list[pl]] > 1) {
+                if (pl < n_prios[ca]) {
+                    printf("if ( likely(mask & (%s)) ) \\\n", prio_mask[ca, p_list[pl]]);
+                    printf("    { \\\n");
+                }
+                do_switch(ca, p_list[pl]);
+                if (pl < n_prios[ca])
+                    printf("    } \\\n");
+            } else {
+                for (i = 1; i <= nc; i++)
+                    if (call[i] == ca && call_prio[i] == p_list[pl]) {
+                        printf("if ( likely(num == __HYPERVISOR_%s) ) \\\n", fn[call_fn[i]]);
+                        printf("    { \\\n");
+                        do_call(call_fn[i], call_p[i]);
+                        printf("    } \\\n");
+                    }
+            }
+            if (pl < n_prios[ca] || prios[ca, pl] == 1)
+                printf("    else ");
+        }
+        if (prios[ca, p_list[n_prios[ca]]] == 1) {
+            printf("\\\n");
+            printf("        ret = -ENOSYS; \\\n");
+        }
+        printf("}\n");
+        printf("\n");
+        printf("#define hypercall_args_%s \\\n", ca);
+        printf("{ \\\n");
+        for (i = 1; i <= nc; i++)
+            if (call[i] == ca)
+                printf("[__HYPERVISOR_%s] = %d, \\\n", fn[call_fn[i]], n_args[call_fn[i]]);
+        printf("}\n");
+    }
+}
-- 
2.26.2


