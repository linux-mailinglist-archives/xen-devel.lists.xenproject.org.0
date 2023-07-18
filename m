Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161A5757A0D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 13:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565118.882993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLiY7-0003my-Ne; Tue, 18 Jul 2023 11:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565118.882993; Tue, 18 Jul 2023 11:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLiY7-0003jd-Kq; Tue, 18 Jul 2023 11:07:23 +0000
Received: by outflank-mailman (input) for mailman id 565118;
 Tue, 18 Jul 2023 11:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju50=DE=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qLiY5-0003jE-IA
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 11:07:21 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41edb092-255b-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 13:07:18 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 60084320091E;
 Tue, 18 Jul 2023 07:07:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 18 Jul 2023 07:07:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jul 2023 07:07:11 -0400 (EDT)
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
X-Inumbo-ID: 41edb092-255b-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689678434; x=1689764834; bh=06VFn0AKXaUmDl0g9lGMmMwV0wNkTJc37cc
	SZ2ARUwc=; b=Nj/JcjwzUHuQv+4at+dqi0CnXtiR2xGlQTOcK0iCSuqTL4Vd/u+
	osEVS1+IWT+Bu6RgebydRctLMGyd45mPBgcDASBqVVS/xhy+W8sHvd2USHncBbBq
	hn0pu9b4MtO+VWKW2Uk1HY8MqlpSHN4Waf46vYwrEWBD7KiHu+CouAGP/NI2QQqs
	rQo5caR8CfKKi+x4kxHk5fbhNdhemXgCRFO0wg/0JRzPs5A8cY6h4T1GT4lHttj8
	pAeq90es7fNyxT84RF+iWBpXxjVKZH3+A8CU9ydiA+kZQUfXhes50ZRgSQb3rkS2
	pRZZyEC8c35r2QYtWZLntESBwhfhbEDdh8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689678434; x=1689764834; bh=06VFn0AKXaUmD
	l0g9lGMmMwV0wNkTJc37ccSZ2ARUwc=; b=C5UhMlWSHsJsSU3QUHmeaMbZBw1hh
	hFXEHvyCTC6RAreynoI+74BiolCG6IBbCyGnIujJS2J44VtVqmKr8O0U0TEuRo8D
	dzIeIEO3ioA/KVMU+Aeqbu1Z9V0wPLiJhLGPr4BexIoA0INsKjq1p49rEgN+8BZ6
	0wFgGS0W/LDJ9gHdSP+twMLTmdikawRLDChc/yUfx29xzJbs1vdgZLAQ+AfoB79O
	tV5/0NJnNFkXb0umbbBZfqtBxxWA0bE5k5qZwjlAkADzh+dLOqS28JFfP0BK/iro
	C2hOpZzk8/YkBkzCYDZ7okivVfVLLM8OWh/peNR5RlToMHSXHPO+GOUog==
X-ME-Sender: <xms:YnK2ZHgDJfY8gDy8XH_MsaY2ZA1MCynPLhm_6vhhRfnAvK0y5IOhZw>
    <xme:YnK2ZEBmdpmYd9JFGzadDApaGJSVUW81Lnmh9_G1KDTl7uBprXZAhpMXcJ7ZdQDau
    Ti0-8DspTvFxtI>
X-ME-Received: <xmr:YnK2ZHFhp3Gnvc1tPB89X9v8qQQrRAZnGcY7HCnCaNd9X97E4E75zJtuGQ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuihhmohhnucfi
    rghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepueevheegtdefgeefuddvfeduueduffffffejveeugeef
    udefiedugedugeevudfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihhmohhnsehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:YnK2ZERv39zovWtIxiVDnI7-y0zKziDrF1dHp2QU38yEyfWFayU6CQ>
    <xmx:YnK2ZEw8DZCYcyM4AdjA1E12xRvpAyehD2DM8Tloe1kQOETxcjlJEQ>
    <xmx:YnK2ZK6QxTgjDWUL1j-WZXO0rr9vN-HvXeZaBWkvFQJIEteNuSH4EA>
    <xmx:YnK2ZOvl76B6zDWD_kR3cnyknJFEwHHK4v9v8zPogCOyF9H0nmpD0w>
Feedback-ID: idc5945a3:Fastmail
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [RFC XEN PATCH] x86/mwait-idle: Use ACPI for CPUs without hardcoded C-state table
Date: Tue, 18 Jul 2023 13:04:53 +0200
Message-Id: <aef138a50aaa769fceb2002dd56de437f1b8c456.1689674757.git.simon@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mwait-idle includes a hardcoded config for many CPUs. But some are
missing, for example Tiger Lake. Linux' driver reads the config from
ACPI in those cases. This adds this to Xen's implementation.

The Linux driver also has a feature to combine the internal table with
the infos from ACPI. This is not implemented here, for CPUs with
internal config nothing is changed.

Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
---

Sending this as RFC to get feedback on implementing it this way. I tried
to keep this change small and to avoid changing the existing code path
for CPUs with a config included in the driver. On the other hand this
makes it look a bit hacky.

I'm not quite sure if initializing mwait-idle in set_cx_pminfo this way
is correct. For example set_cx has some smp_wmb call I'm not sure when
it's needed, so might be very well missing something.

What also surprised me is that the existing code in mwait-idle first
calls cpuidle_current_governor->enable(processor_powers[cpu]) and later
setup the C-state config in processor_powers[cpu]. This seems the be the
wrong order (but, I think, current not important since
menu_enable_device doesn't use that part of the struct).

When I brought up the topic of this patch the first time Jan had an
interesting questions [1]:

> It hasn't become clear to me why Linux now has two CPU idle drivers
> consuming ACPI data (intel_idle and the purely ACPI-based one).

I'm not quite sure either. Linux' intel_idle.c states:

    intel_idle is a cpuidle driver that loads on all Intel CPUs with
    MWAIT in lieu of the legacy ACPI processor_idle driver.  The intent
    is to make Linux more efficient on these processors, as intel_idle
    knows more than ACPI, as well as make Linux more immune to ACPI BIOS
    bugs.

The commit that first added ACPI support to the Linux driver [2] says:

    The main functional difference between intel_idle with this change
    and the ACPI processor driver is that the former sets the target
    residency to be equal to the exit latency (provided by _CST) for
    C1-type C-states and to 3 times the exit latency value for the other
    C-state types, whereas the latter obtains the target residency by
    multiplying the exit latency by the same number (2 by default) for
    all C-state types.  Therefore it is expected that in general using
    the former instead of the latter on the same system will lead to
    improved energy-efficiency.

This sounds less impressive and doesn't explain why not to just change
the standard ACPI driver to use the better latency settings. On the
Linux what might play also a role is that the mwait driver also gained
the option to combine the internal settings with what it reads from
ACPI. That would be probably harder to include in the generic ACPI
driver.

This also raises the option to change the latency setting in Xen's
generic ACPI driver for the affected CPUs instead of touching
mwait-idle.

Currently I'm interested in this driver mainly for S0ix support. I did
nearly all my testing while using the mwait-idle driver to keep
differences to Linux as small as possible. (At first by hacking in some
config for the Tiger Lake CPU of my test system. Now with this patch.).
At some point I observed worse S0ix residency with Xen's generic ACPI
idle driver than with mwait-idle. But when I tried to reproduce this for
writing this e-mail I wasn't able to reproduce this measurement and got
the same residency for both idle drivers. So either I did messed up my
previous measurements or I have some unaccounted changes in my test
setup.

[1]: https://lore.kernel.org/xen-devel/f6c27788-bdd9-e5b1-a874-7f48a27c66a9@suse.com
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=18734958e9bfbc055805d110a38dc76307eba742

 xen/arch/x86/acpi/cpu_idle.c       |  58 +++++++++++-----
 xen/arch/x86/cpu/mwait-idle.c      | 108 ++++++++++++++++++++++++-----
 xen/arch/x86/include/asm/cpuidle.h |   2 +-
 3 files changed, 134 insertions(+), 34 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 427c8c89c5..0a357acc58 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -78,6 +78,7 @@
 static void cf_check lapic_timer_nop(void) { }
 void (*__read_mostly lapic_timer_off)(void);
 void (*__read_mostly lapic_timer_on)(void);
+static struct notifier_block cpu_nfb;
 
 bool lapic_timer_init(void)
 {
@@ -1313,6 +1314,26 @@ static void print_cx_pminfo(uint32_t cpu, struct xen_processor_power *power)
 #define print_cx_pminfo(c, p)
 #endif
 
+
+static void repark_cpu(int cpu_id)
+{
+    uint32_t apic_id = x86_cpu_to_apicid[cpu_id];
+
+    /*
+     * If we've just learned of more available C states, wake the CPU if
+     * it's parked, so it can go back to sleep in perhaps a deeper state.
+     */
+    if ( park_offline_cpus && apic_id != BAD_APICID )
+    {
+        unsigned long flags;
+
+        local_irq_save(flags);
+        apic_wait_icr_idle();
+        apic_icr_write(APIC_DM_NMI | APIC_DEST_PHYSICAL, apic_id);
+        local_irq_restore(flags);
+    }
+}
+
 long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power)
 {
     XEN_GUEST_HANDLE(xen_processor_cx_t) states;
@@ -1360,24 +1381,27 @@ long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power)
         set_cx(acpi_power, &xen_cx);
     }
 
-    if ( !cpu_online(cpu_id) )
-    {
-        uint32_t apic_id = x86_cpu_to_apicid[cpu_id];
-
-        /*
-         * If we've just learned of more available C states, wake the CPU if
-         * it's parked, so it can go back to sleep in perhaps a deeper state.
-         */
-        if ( park_offline_cpus && apic_id != BAD_APICID )
-        {
-            unsigned long flags;
-
-            local_irq_save(flags);
-            apic_wait_icr_idle();
-            apic_icr_write(APIC_DM_NMI | APIC_DEST_PHYSICAL, apic_id);
-            local_irq_restore(flags);
+    if ( cpu_id == 0 && pm_idle_save == NULL ) {
+        /* Now that we have the ACPI info from dom0, try again to setup
+         * mwait-idle*/
+        ret = mwait_idle_init(&cpu_nfb, true);
+        if (ret >= 0) {
+            unsigned int cpu;
+            /* mwait-idle took over, call it's initializer for all CPUs*/
+            for_each_present_cpu ( cpu )
+            {
+                cpu_nfb.notifier_call(&cpu_nfb, CPU_UP_PREPARE, (void *)(long)cpu);
+                cpu_nfb.notifier_call(&cpu_nfb, CPU_ONLINE, (void *)(long)cpu);
+                if ( !cpu_online(cpu) ) {
+                    repark_cpu(cpu);
+                }
+            }
+            return 0;
         }
     }
+
+    if ( !cpu_online(cpu_id) )
+        repark_cpu(cpu_id);
     else if ( cpuidle_current_governor->enable )
     {
         ret = cpuidle_current_governor->enable(acpi_power);
@@ -1677,7 +1701,7 @@ static int __init cf_check cpuidle_presmp_init(void)
     if ( !xen_cpuidle )
         return 0;
 
-    mwait_idle_init(&cpu_nfb);
+    mwait_idle_init(&cpu_nfb, false);
     cpu_nfb.notifier_call(&cpu_nfb, CPU_UP_PREPARE, cpu);
     cpu_nfb.notifier_call(&cpu_nfb, CPU_ONLINE, cpu);
     register_cpu_notifier(&cpu_nfb);
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 9e981e7e26..df37224fd9 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -71,13 +71,15 @@
 #undef PREFIX
 #define PREFIX "mwait-idle: "
 
+#define pr_err(fmt...) printk(KERN_ERR fmt)
+
 #ifdef DEBUG
 # define pr_debug(fmt...) printk(KERN_DEBUG fmt)
 #else
 # define pr_debug(fmt...)
 #endif
 
-static __initdata bool opt_mwait_idle = true;
+static bool opt_mwait_idle = true;
 boolean_param("mwait-idle", opt_mwait_idle);
 
 static unsigned int mwait_substates;
@@ -92,7 +94,7 @@ static unsigned int mwait_substates;
  * exclusive C-states, this parameter has no effect.
  */
 static unsigned int __ro_after_init preferred_states_mask;
-static char __initdata preferred_states[64];
+static char preferred_states[64];
 string_param("preferred-cstates", preferred_states);
 
 #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
@@ -1151,6 +1153,9 @@ static const struct idle_cpu idle_cpu_snr = {
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
+static struct idle_cpu __read_mostly idle_cpu_acpi = {
+};
+
 #define ICPU(model, cpu) \
 	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ ## model, X86_FEATURE_ALWAYS, \
 	  &idle_cpu_ ## cpu}
@@ -1436,21 +1441,92 @@ static void __init mwait_idle_state_table_update(void)
 	}
 }
 
-static int __init mwait_idle_probe(void)
+static int mwait_idle_state_table_from_acpi(void) {
+	// Linux tries every CPU until it finds one that declares FFH as entry
+	// method for all C-states in it's ACPI table. It assumes that the
+	// config is identical for all CPUs. So let's just check the first CPU.
+
+	int rc = -EINVAL;
+	struct acpi_processor_power *acpi_power = processor_powers[0];
+	struct cpuidle_state *state_table = xzalloc_array(
+			struct cpuidle_state,
+			acpi_power->count + 1 /* NULL at end */ - 1 /* no C0 */
+			);
+
+	if (state_table == NULL) {
+		pr_err(PREFIX "failed to allocate state table\n");
+		rc = -ENOMEM;
+		goto ret;
+	}
+
+	for (unsigned int cstate = 1; cstate < acpi_power->count; ++cstate) {
+		struct acpi_processor_cx *acpi_cx = &acpi_power->states[cstate];
+		struct cpuidle_state *idle_cx = &state_table[cstate - 1];
+		if (acpi_cx->entry_method != ACPI_CSTATE_EM_FFH) {
+			pr_debug(PREFIX "ACPI based config not usable: Entry method for C-state %u isn't FFH\n", cstate);
+			rc = -ENODEV;
+			goto ret;
+		}
+
+		snprintf(idle_cx->name, sizeof(idle_cx->name), "C%u", cstate);
+
+		idle_cx->flags = MWAIT2flg(acpi_cx->address);
+		if (acpi_cx->type > ACPI_STATE_C2)
+			idle_cx->flags |= CPUIDLE_FLAG_TLB_FLUSHED;
+		// Like Linux we don't set CPUIDLE_FLAG_IBRS
+
+		idle_cx->exit_latency = acpi_cx->latency;
+
+		idle_cx->target_residency = acpi_cx->latency;
+		if (acpi_cx->type > ACPI_STATE_C1)
+			idle_cx->target_residency *= 3;
+	}
+
+	idle_cpu_acpi.state_table = state_table;
+	rc = 0;
+	pr_debug(PREFIX "config read from ACPI\n");
+
+ret:
+	if (rc < 0 && state_table != NULL) {
+		xfree(state_table);
+	}
+	return rc;
+}
+
+static int mwait_idle_probe(bool from_acpi)
 {
 	unsigned int eax, ebx, ecx;
-	const struct x86_cpu_id *id = x86_match_cpu(intel_idle_ids);
 	const char *str;
 
-	if (!id) {
-		pr_debug(PREFIX "does not run on family %d model %d\n",
-			 boot_cpu_data.x86, boot_cpu_data.x86_model);
-		return -ENODEV;
-	}
+	if (from_acpi) {
+		int rc;
 
-	if (!boot_cpu_has(X86_FEATURE_MONITOR)) {
-		pr_debug(PREFIX "Please enable MWAIT in BIOS SETUP\n");
-		return -ENODEV;
+		if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+		    boot_cpu_data.x86 != 6 ||
+		    !boot_cpu_has(X86_FEATURE_MONITOR)) {
+			pr_debug(PREFIX "skipping ACPI check on unsupported CPU\n");
+			return -ENODEV;
+		}
+
+		rc = mwait_idle_state_table_from_acpi();
+		if (rc < 0)
+			return rc;
+
+		icpu = &idle_cpu_acpi;
+	} else {
+		const struct x86_cpu_id *id = x86_match_cpu(intel_idle_ids);
+		if (!id) {
+			pr_debug(PREFIX "no interal config for family %d model %d\n",
+				 boot_cpu_data.x86, boot_cpu_data.x86_model);
+			return -ENODEV;
+		}
+
+		if (!boot_cpu_has(X86_FEATURE_MONITOR)) {
+			pr_debug(PREFIX "Please enable MWAIT in BIOS SETUP\n");
+			return -ENODEV;
+		}
+
+		icpu = id->driver_data;
 	}
 
 	if (boot_cpu_data.cpuid_level < CPUID_MWAIT_LEAF)
@@ -1470,7 +1546,6 @@ static int __init mwait_idle_probe(void)
 
 	pr_debug(PREFIX "MWAIT substates: %#x\n", mwait_substates);
 
-	icpu = id->driver_data;
 	cpuidle_state_table = icpu->state_table;
 
 	if (boot_cpu_has(X86_FEATURE_ARAT))
@@ -1515,7 +1590,8 @@ static int __init mwait_idle_probe(void)
 	if (str[0])
 		printk("unrecognized \"preferred-cstates=%s\"\n", str);
 
-	mwait_idle_state_table_update();
+	if (!from_acpi)
+		mwait_idle_state_table_update();
 
 	return 0;
 }
@@ -1624,14 +1700,14 @@ static int cf_check mwait_idle_cpu_init(
 	return NOTIFY_DONE;
 }
 
-int __init mwait_idle_init(struct notifier_block *nfb)
+int mwait_idle_init(struct notifier_block *nfb, bool from_acpi)
 {
 	int err;
 
 	if (pm_idle_save)
 		return -ENODEV;
 
-	err = mwait_idle_probe();
+	err = mwait_idle_probe(from_acpi);
 	if (!err && !boot_cpu_has(X86_FEATURE_ARAT)) {
 		hpet_broadcast_init();
 		if (xen_cpuidle < 0 && !hpet_broadcast_is_available())
diff --git a/xen/arch/x86/include/asm/cpuidle.h b/xen/arch/x86/include/asm/cpuidle.h
index 3edd7a75d2..f8913c7304 100644
--- a/xen/arch/x86/include/asm/cpuidle.h
+++ b/xen/arch/x86/include/asm/cpuidle.h
@@ -15,7 +15,7 @@ extern void (*lapic_timer_on)(void);
 
 extern uint64_t (*cpuidle_get_tick)(void);
 
-int mwait_idle_init(struct notifier_block *);
+int mwait_idle_init(struct notifier_block *, bool);
 int cpuidle_init_cpu(unsigned int cpu);
 void cf_check default_dead_idle(void);
 void cf_check acpi_dead_idle(void);
-- 
2.40.1


