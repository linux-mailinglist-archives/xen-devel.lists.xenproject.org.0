Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977A191DEAE
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 14:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751525.1159510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOFkZ-0003MX-3V; Mon, 01 Jul 2024 12:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751525.1159510; Mon, 01 Jul 2024 12:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOFkZ-0003Kh-0m; Mon, 01 Jul 2024 12:03:15 +0000
Received: by outflank-mailman (input) for mailman id 751525;
 Mon, 01 Jul 2024 12:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1OIh=OB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sOFkX-0003Jy-Lw
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 12:03:13 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2b1f911-37a1-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 14:03:11 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id CA95E28AAD;
 Mon,  1 Jul 2024 08:03:09 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id C1CAE28AAC;
 Mon,  1 Jul 2024 08:03:09 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [46.211.3.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id BE31A28AAB;
 Mon,  1 Jul 2024 08:03:07 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: e2b1f911-37a1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=qkU0yxHmSOO39KkkibZBAXr0v
	HgOxT78WcDDzQyzrDQ=; b=FcGuJkmFBLPFoqO9GufsGYMoA8s+39cYkHxgpPH75
	jhhWJfykhdogaiY0PPmaJV1Qc84/kCDa44WOuQBud4Ua6I7NVqhag5vFFKc2osL2
	z0Ujvya029vGfOvYUFQtplM1ymGZHYjwHJsSWr1xA5zCo66Y9glSTQVjrvHSv6mJ
	AY=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 1/2] x86/cpufreq: move ACPI cpufreq driver into separate file
Date: Mon,  1 Jul 2024 15:03:05 +0300
Message-Id: <d8a13eb8c53d8cde99d7fa1d8e4fce2a597f02fd.1719832871.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1719832871.git.Sergiy_Kibrik@epam.com>
References: <cover.1719832871.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 E11F87B2-37A1-11EF-98E2-965B910A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Separate ACPI driver from generic initialization cpufreq code.
This way acpi-cpufreq can become optional in the future and be disabled
from non-Intel builds.

Other than acpi_register_driver() helper added and clean up a list of
included headers no changes to code were introduced.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/acpi/cpufreq/Makefile  |   1 +
 xen/arch/x86/acpi/cpufreq/acpi.c    | 622 ++++++++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 592 +-------------------------
 xen/include/acpi/cpufreq/cpufreq.h  |   1 +
 4 files changed, 625 insertions(+), 591 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/acpi.c

diff --git a/xen/arch/x86/acpi/cpufreq/Makefile b/xen/arch/x86/acpi/cpufr=
eq/Makefile
index db83aa6b14..44d4c0b497 100644
--- a/xen/arch/x86/acpi/cpufreq/Makefile
+++ b/xen/arch/x86/acpi/cpufreq/Makefile
@@ -1,3 +1,4 @@
+obj-y +=3D acpi.o
 obj-y +=3D cpufreq.o
 obj-y +=3D hwp.o
 obj-y +=3D powernow.o
diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq=
/acpi.c
new file mode 100644
index 0000000000..bf4e964377
--- /dev/null
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -0,0 +1,622 @@
+/*
+ *  cpufreq.c - ACPI Processor P-States Driver ($Revision: 1.4 $)
+ *
+ *  Copyright (C) 2001, 2002 Andy Grover <andrew.grover@intel.com>
+ *  Copyright (C) 2001, 2002 Paul Diefenbaugh <paul.s.diefenbaugh@intel.=
com>
+ *  Copyright (C) 2002 - 2004 Dominik Brodowski <linux@brodo.de>
+ *  Copyright (C) 2006        Denis Sadykov <denis.m.sadykov@intel.com>
+ *
+ *  Feb 2008 - Liu Jinsong <jinsong.liu@intel.com>
+ *      porting acpi-cpufreq.c from Linux 2.6.23 to Xen hypervisor
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or (a=
t
+ *  your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful, but
+ *  WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License al=
ong
+ *  with this program; If not, see <http://www.gnu.org/licenses/>.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
+ */
+
+#include <xen/types.h>
+#include <xen/errno.h>
+#include <xen/delay.h>
+#include <xen/param.h>
+#include <acpi/acpi.h>
+#include <acpi/cpufreq/cpufreq.h>
+
+
+enum {
+    UNDEFINED_CAPABLE =3D 0,
+    SYSTEM_INTEL_MSR_CAPABLE,
+    SYSTEM_IO_CAPABLE,
+};
+
+#define INTEL_MSR_RANGE         (0xffffull)
+
+static bool __read_mostly acpi_pstate_strict;
+boolean_param("acpi_pstate_strict", acpi_pstate_strict);
+
+static unsigned extract_io(u32 value, struct acpi_cpufreq_data *data)
+{
+    struct processor_performance *perf;
+    int i;
+
+    perf =3D data->acpi_data;
+
+    for (i=3D0; i<perf->state_count; i++) {
+        if (value =3D=3D perf->states[i].status)
+            return data->freq_table[i].frequency;
+    }
+    return 0;
+}
+
+static unsigned extract_msr(u32 msr, struct acpi_cpufreq_data *data)
+{
+    int i;
+    struct processor_performance *perf;
+
+    msr &=3D INTEL_MSR_RANGE;
+    perf =3D data->acpi_data;
+
+    for (i=3D0; data->freq_table[i].frequency !=3D CPUFREQ_TABLE_END; i+=
+) {
+        if (msr =3D=3D perf->states[data->freq_table[i].index].status)
+            return data->freq_table[i].frequency;
+    }
+    return data->freq_table[0].frequency;
+}
+
+static unsigned extract_freq(u32 val, struct acpi_cpufreq_data *data)
+{
+    switch (data->arch_cpu_flags) {
+    case SYSTEM_INTEL_MSR_CAPABLE:
+        return extract_msr(val, data);
+    case SYSTEM_IO_CAPABLE:
+        return extract_io(val, data);
+    default:
+        return 0;
+    }
+}
+
+struct msr_addr {
+    u32 reg;
+};
+
+struct io_addr {
+    u16 port;
+    u8 bit_width;
+};
+
+typedef union {
+    struct msr_addr msr;
+    struct io_addr io;
+} drv_addr_union;
+
+struct drv_cmd {
+    unsigned int type;
+    const cpumask_t *mask;
+    drv_addr_union addr;
+    u32 val;
+};
+
+static void cf_check do_drv_read(void *drvcmd)
+{
+    struct drv_cmd *cmd;
+
+    cmd =3D (struct drv_cmd *)drvcmd;
+
+    switch (cmd->type) {
+    case SYSTEM_INTEL_MSR_CAPABLE:
+        rdmsrl(cmd->addr.msr.reg, cmd->val);
+        break;
+    case SYSTEM_IO_CAPABLE:
+        acpi_os_read_port((acpi_io_address)cmd->addr.io.port,
+            &cmd->val, (u32)cmd->addr.io.bit_width);
+        break;
+    default:
+        break;
+    }
+}
+
+static void cf_check do_drv_write(void *drvcmd)
+{
+    struct drv_cmd *cmd;
+    uint64_t msr_content;
+
+    cmd =3D (struct drv_cmd *)drvcmd;
+
+    switch (cmd->type) {
+    case SYSTEM_INTEL_MSR_CAPABLE:
+        rdmsrl(cmd->addr.msr.reg, msr_content);
+        msr_content =3D (msr_content & ~INTEL_MSR_RANGE)
+            | (cmd->val & INTEL_MSR_RANGE);
+        wrmsrl(cmd->addr.msr.reg, msr_content);
+        break;
+    case SYSTEM_IO_CAPABLE:
+        acpi_os_write_port((acpi_io_address)cmd->addr.io.port,
+            cmd->val, (u32)cmd->addr.io.bit_width);
+        break;
+    default:
+        break;
+    }
+}
+
+static void drv_read(struct drv_cmd *cmd)
+{
+    cmd->val =3D 0;
+
+    ASSERT(cpumask_weight(cmd->mask) =3D=3D 1);
+
+    /* to reduce IPI for the sake of performance */
+    if (likely(cpumask_test_cpu(smp_processor_id(), cmd->mask)))
+        do_drv_read((void *)cmd);
+    else
+        on_selected_cpus(cmd->mask, do_drv_read, cmd, 1);
+}
+
+static void drv_write(struct drv_cmd *cmd)
+{
+    if (cpumask_equal(cmd->mask, cpumask_of(smp_processor_id())))
+        do_drv_write((void *)cmd);
+    else
+        on_selected_cpus(cmd->mask, do_drv_write, cmd, 1);
+}
+
+static u32 get_cur_val(const cpumask_t *mask)
+{
+    struct cpufreq_policy *policy;
+    struct processor_performance *perf;
+    struct drv_cmd cmd;
+    unsigned int cpu =3D smp_processor_id();
+
+    if (unlikely(cpumask_empty(mask)))
+        return 0;
+
+    if (!cpumask_test_cpu(cpu, mask))
+        cpu =3D cpumask_first(mask);
+    if (cpu >=3D nr_cpu_ids || !cpu_online(cpu))
+        return 0;
+
+    policy =3D per_cpu(cpufreq_cpu_policy, cpu);
+    if (!policy || !cpufreq_drv_data[policy->cpu])
+        return 0;
+
+    switch (cpufreq_drv_data[policy->cpu]->arch_cpu_flags) {
+    case SYSTEM_INTEL_MSR_CAPABLE:
+        cmd.type =3D SYSTEM_INTEL_MSR_CAPABLE;
+        cmd.addr.msr.reg =3D MSR_IA32_PERF_STATUS;
+        break;
+    case SYSTEM_IO_CAPABLE:
+        cmd.type =3D SYSTEM_IO_CAPABLE;
+        perf =3D cpufreq_drv_data[policy->cpu]->acpi_data;
+        cmd.addr.io.port =3D perf->control_register.address;
+        cmd.addr.io.bit_width =3D perf->control_register.bit_width;
+        break;
+    default:
+        return 0;
+    }
+
+    cmd.mask =3D cpumask_of(cpu);
+
+    drv_read(&cmd);
+    return cmd.val;
+}
+
+struct perf_pair {
+    union {
+        struct {
+            uint32_t lo;
+            uint32_t hi;
+        } split;
+        uint64_t whole;
+    } aperf, mperf;
+};
+static DEFINE_PER_CPU(struct perf_pair, gov_perf_pair);
+static DEFINE_PER_CPU(struct perf_pair, usr_perf_pair);
+
+static void cf_check read_measured_perf_ctrs(void *_readin)
+{
+    struct perf_pair *readin =3D _readin;
+
+    rdmsrl(MSR_IA32_APERF, readin->aperf.whole);
+    rdmsrl(MSR_IA32_MPERF, readin->mperf.whole);
+}
+
+/*
+ * Return the measured active (C0) frequency on this CPU since last call
+ * to this function.
+ * Input: cpu number
+ * Return: Average CPU frequency in terms of max frequency (zero on erro=
r)
+ *
+ * We use IA32_MPERF and IA32_APERF MSRs to get the measured performance
+ * over a period of time, while CPU is in C0 state.
+ * IA32_MPERF counts at the rate of max advertised frequency
+ * IA32_APERF counts at the rate of actual CPU frequency
+ * Only IA32_APERF/IA32_MPERF ratio is architecturally defined and
+ * no meaning should be associated with absolute values of these MSRs.
+ */
+unsigned int get_measured_perf(unsigned int cpu, unsigned int flag)
+{
+    struct cpufreq_policy *policy;
+    struct perf_pair readin, cur, *saved;
+    unsigned int perf_percent;
+
+    if (!cpu_online(cpu))
+        return 0;
+
+    policy =3D per_cpu(cpufreq_cpu_policy, cpu);
+    if ( !policy || !cpu_has_aperfmperf )
+        return 0;
+
+    switch (flag)
+    {
+    case GOV_GETAVG:
+    {
+        saved =3D &per_cpu(gov_perf_pair, cpu);
+        break;
+    }
+    case USR_GETAVG:
+    {
+        saved =3D &per_cpu(usr_perf_pair, cpu);
+        break;
+    }
+    default:
+        return 0;
+    }
+
+    if (cpu =3D=3D smp_processor_id()) {
+        read_measured_perf_ctrs((void *)&readin);
+    } else {
+        on_selected_cpus(cpumask_of(cpu), read_measured_perf_ctrs,
+                        &readin, 1);
+    }
+
+    cur.aperf.whole =3D readin.aperf.whole - saved->aperf.whole;
+    cur.mperf.whole =3D readin.mperf.whole - saved->mperf.whole;
+    saved->aperf.whole =3D readin.aperf.whole;
+    saved->mperf.whole =3D readin.mperf.whole;
+
+    if (unlikely(((unsigned long)(-1) / 100) < cur.aperf.whole)) {
+        int shift_count =3D 7;
+        cur.aperf.whole >>=3D shift_count;
+        cur.mperf.whole >>=3D shift_count;
+    }
+
+    if (cur.aperf.whole && cur.mperf.whole)
+        perf_percent =3D (cur.aperf.whole * 100) / cur.mperf.whole;
+    else
+        perf_percent =3D 0;
+
+    return policy->cpuinfo.perf_freq * perf_percent / 100;
+}
+
+static unsigned int cf_check get_cur_freq_on_cpu(unsigned int cpu)
+{
+    struct cpufreq_policy *policy;
+    struct acpi_cpufreq_data *data;
+
+    if (!cpu_online(cpu))
+        return 0;
+
+    policy =3D per_cpu(cpufreq_cpu_policy, cpu);
+    if (!policy)
+        return 0;
+
+    data =3D cpufreq_drv_data[policy->cpu];
+    if (unlikely(data =3D=3D NULL ||
+        data->acpi_data =3D=3D NULL || data->freq_table =3D=3D NULL))
+        return 0;
+
+    return extract_freq(get_cur_val(cpumask_of(cpu)), data);
+}
+
+void intel_feature_detect(struct cpufreq_policy *policy)
+{
+    unsigned int eax;
+
+    eax =3D cpuid_eax(6);
+    if (eax & 0x2) {
+        policy->turbo =3D CPUFREQ_TURBO_ENABLED;
+        if (cpufreq_verbose)
+            printk(XENLOG_INFO "CPU%u: Turbo Mode detected and enabled\n=
",
+                   smp_processor_id());
+    }
+}
+
+static void cf_check feature_detect(void *info)
+{
+    intel_feature_detect(info);
+}
+
+static unsigned int check_freqs(const cpumask_t *mask, unsigned int freq=
,
+                                struct acpi_cpufreq_data *data)
+{
+    unsigned int cur_freq;
+    unsigned int i;
+
+    for (i=3D0; i<100; i++) {
+        cur_freq =3D extract_freq(get_cur_val(mask), data);
+        if (cur_freq =3D=3D freq)
+            return 1;
+        udelay(10);
+    }
+    return 0;
+}
+
+static int cf_check acpi_cpufreq_target(
+    struct cpufreq_policy *policy,
+    unsigned int target_freq, unsigned int relation)
+{
+    struct acpi_cpufreq_data *data =3D cpufreq_drv_data[policy->cpu];
+    struct processor_performance *perf;
+    struct cpufreq_freqs freqs;
+    cpumask_t online_policy_cpus;
+    struct drv_cmd cmd;
+    unsigned int next_state =3D 0; /* Index into freq_table */
+    unsigned int next_perf_state =3D 0; /* Index into perf table */
+    unsigned int j;
+    int result =3D 0;
+
+    if (unlikely(data =3D=3D NULL ||
+        data->acpi_data =3D=3D NULL || data->freq_table =3D=3D NULL)) {
+        return -ENODEV;
+    }
+
+    if (policy->turbo =3D=3D CPUFREQ_TURBO_DISABLED)
+        if (target_freq > policy->cpuinfo.second_max_freq)
+            target_freq =3D policy->cpuinfo.second_max_freq;
+
+    perf =3D data->acpi_data;
+    result =3D cpufreq_frequency_table_target(policy,
+                                            data->freq_table,
+                                            target_freq,
+                                            relation, &next_state);
+    if (unlikely(result))
+        return -ENODEV;
+
+    cpumask_and(&online_policy_cpus, &cpu_online_map, policy->cpus);
+
+    next_perf_state =3D data->freq_table[next_state].index;
+    if (perf->state =3D=3D next_perf_state) {
+        if (unlikely(policy->resume))
+            policy->resume =3D 0;
+        else
+            return 0;
+    }
+
+    switch (data->arch_cpu_flags) {
+    case SYSTEM_INTEL_MSR_CAPABLE:
+        cmd.type =3D SYSTEM_INTEL_MSR_CAPABLE;
+        cmd.addr.msr.reg =3D MSR_IA32_PERF_CTL;
+        cmd.val =3D (u32) perf->states[next_perf_state].control;
+        break;
+    case SYSTEM_IO_CAPABLE:
+        cmd.type =3D SYSTEM_IO_CAPABLE;
+        cmd.addr.io.port =3D perf->control_register.address;
+        cmd.addr.io.bit_width =3D perf->control_register.bit_width;
+        cmd.val =3D (u32) perf->states[next_perf_state].control;
+        break;
+    default:
+        return -ENODEV;
+    }
+
+    if (policy->shared_type !=3D CPUFREQ_SHARED_TYPE_ANY)
+        cmd.mask =3D &online_policy_cpus;
+    else
+        cmd.mask =3D cpumask_of(policy->cpu);
+
+    freqs.old =3D perf->states[perf->state].core_frequency * 1000;
+    freqs.new =3D data->freq_table[next_state].frequency;
+
+    drv_write(&cmd);
+
+    if (acpi_pstate_strict && !check_freqs(cmd.mask, freqs.new, data)) {
+        printk(KERN_WARNING "Fail transfer to new freq %d\n", freqs.new)=
;
+        return -EAGAIN;
+    }
+
+    for_each_cpu(j, &online_policy_cpus)
+        cpufreq_statistic_update(j, perf->state, next_perf_state);
+
+    perf->state =3D next_perf_state;
+    policy->cur =3D freqs.new;
+
+    return result;
+}
+
+static int cf_check acpi_cpufreq_verify(struct cpufreq_policy *policy)
+{
+    struct acpi_cpufreq_data *data;
+    struct processor_performance *perf;
+
+    if (!policy || !(data =3D cpufreq_drv_data[policy->cpu]) ||
+        !processor_pminfo[policy->cpu])
+        return -EINVAL;
+
+    perf =3D &processor_pminfo[policy->cpu]->perf;
+
+    cpufreq_verify_within_limits(policy, 0,
+        perf->states[perf->platform_limit].core_frequency * 1000);
+
+    return cpufreq_frequency_table_verify(policy, data->freq_table);
+}
+
+static unsigned long
+acpi_cpufreq_guess_freq(struct acpi_cpufreq_data *data, unsigned int cpu=
)
+{
+    struct processor_performance *perf =3D data->acpi_data;
+
+    if (cpu_khz) {
+        /* search the closest match to cpu_khz */
+        unsigned int i;
+        unsigned long freq;
+        unsigned long freqn =3D perf->states[0].core_frequency * 1000;
+
+        for (i=3D0; i<(perf->state_count-1); i++) {
+            freq =3D freqn;
+            freqn =3D perf->states[i+1].core_frequency * 1000;
+            if ((2 * cpu_khz) > (freqn + freq)) {
+                perf->state =3D i;
+                return freq;
+            }
+        }
+        perf->state =3D perf->state_count-1;
+        return freqn;
+    } else {
+        /* assume CPU is at P0... */
+        perf->state =3D 0;
+        return perf->states[0].core_frequency * 1000;
+    }
+}
+
+static int cf_check acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+    unsigned int i;
+    unsigned int valid_states =3D 0;
+    unsigned int cpu =3D policy->cpu;
+    struct acpi_cpufreq_data *data;
+    unsigned int result =3D 0;
+    struct cpuinfo_x86 *c =3D &cpu_data[policy->cpu];
+    struct processor_performance *perf;
+
+    data =3D xzalloc(struct acpi_cpufreq_data);
+    if (!data)
+        return -ENOMEM;
+
+    cpufreq_drv_data[cpu] =3D data;
+
+    data->acpi_data =3D &processor_pminfo[cpu]->perf;
+
+    perf =3D data->acpi_data;
+    policy->shared_type =3D perf->shared_type;
+
+    switch (perf->control_register.space_id) {
+    case ACPI_ADR_SPACE_SYSTEM_IO:
+        if (cpufreq_verbose)
+            printk("xen_pminfo: @acpi_cpufreq_cpu_init,"
+                   "SYSTEM IO addr space\n");
+        data->arch_cpu_flags =3D SYSTEM_IO_CAPABLE;
+        break;
+    case ACPI_ADR_SPACE_FIXED_HARDWARE:
+        if (cpufreq_verbose)
+            printk("xen_pminfo: @acpi_cpufreq_cpu_init,"
+                   "HARDWARE addr space\n");
+        if (!cpu_has(c, X86_FEATURE_EIST)) {
+            result =3D -ENODEV;
+            goto err_unreg;
+        }
+        data->arch_cpu_flags =3D SYSTEM_INTEL_MSR_CAPABLE;
+        break;
+    default:
+        result =3D -ENODEV;
+        goto err_unreg;
+    }
+
+    data->freq_table =3D xmalloc_array(struct cpufreq_frequency_table,
+                                    (perf->state_count+1));
+    if (!data->freq_table) {
+        result =3D -ENOMEM;
+        goto err_unreg;
+    }
+
+    /* detect transition latency */
+    policy->cpuinfo.transition_latency =3D 0;
+    for (i=3D0; i<perf->state_count; i++) {
+        if ((perf->states[i].transition_latency * 1000) >
+            policy->cpuinfo.transition_latency)
+            policy->cpuinfo.transition_latency =3D
+                perf->states[i].transition_latency * 1000;
+    }
+
+    policy->governor =3D cpufreq_opt_governor ? : CPUFREQ_DEFAULT_GOVERN=
OR;
+
+    /* table init */
+    for (i=3D0; i<perf->state_count; i++) {
+        if (i>0 && perf->states[i].core_frequency >=3D
+            data->freq_table[valid_states-1].frequency / 1000)
+            continue;
+
+        data->freq_table[valid_states].index =3D i;
+        data->freq_table[valid_states].frequency =3D
+            perf->states[i].core_frequency * 1000;
+        valid_states++;
+    }
+    data->freq_table[valid_states].frequency =3D CPUFREQ_TABLE_END;
+    perf->state =3D 0;
+
+    result =3D cpufreq_frequency_table_cpuinfo(policy, data->freq_table)=
;
+    if (result)
+        goto err_freqfree;
+
+    switch (perf->control_register.space_id) {
+    case ACPI_ADR_SPACE_SYSTEM_IO:
+        /* Current speed is unknown and not detectable by IO port */
+        policy->cur =3D acpi_cpufreq_guess_freq(data, policy->cpu);
+        break;
+    case ACPI_ADR_SPACE_FIXED_HARDWARE:
+        cpufreq_driver.get =3D get_cur_freq_on_cpu;
+        policy->cur =3D get_cur_freq_on_cpu(cpu);
+        break;
+    default:
+        break;
+    }
+
+    /* Check for APERF/MPERF support in hardware
+     * also check for boost support */
+    if (c->x86_vendor =3D=3D X86_VENDOR_INTEL && c->cpuid_level >=3D 6)
+        on_selected_cpus(cpumask_of(cpu), feature_detect, policy, 1);
+
+    /*
+     * the first call to ->target() should result in us actually
+     * writing something to the appropriate registers.
+     */
+    policy->resume =3D 1;
+
+    return result;
+
+err_freqfree:
+    xfree(data->freq_table);
+err_unreg:
+    xfree(data);
+    cpufreq_drv_data[cpu] =3D NULL;
+
+    return result;
+}
+
+static int cf_check acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+{
+    struct acpi_cpufreq_data *data =3D cpufreq_drv_data[policy->cpu];
+
+    if (data) {
+        cpufreq_drv_data[policy->cpu] =3D NULL;
+        xfree(data->freq_table);
+        xfree(data);
+    }
+
+    return 0;
+}
+
+static const struct cpufreq_driver __initconst_cf_clobber
+acpi_cpufreq_driver =3D {
+    .name   =3D "acpi-cpufreq",
+    .verify =3D acpi_cpufreq_verify,
+    .target =3D acpi_cpufreq_target,
+    .init   =3D acpi_cpufreq_cpu_init,
+    .exit   =3D acpi_cpufreq_cpu_exit,
+    .get    =3D get_cur_freq_on_cpu,
+};
+
+
+int __init acpi_register_driver(void)
+{
+    return cpufreq_register_driver(&acpi_cpufreq_driver);
+}
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpuf=
req/cpufreq.c
index a341f2f020..c1a842e959 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -26,604 +26,14 @@
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
  */
-
 #include <xen/types.h>
 #include <xen/errno.h>
-#include <xen/delay.h>
-#include <xen/cpumask.h>
 #include <xen/param.h>
 #include <xen/sched.h>
-#include <xen/timer.h>
-#include <xen/xmalloc.h>
-#include <asm/msr.h>
-#include <asm/io.h>
-#include <asm/processor.h>
-#include <asm/cpufeature.h>
-#include <acpi/acpi.h>
 #include <acpi/cpufreq/cpufreq.h>
=20
-enum {
-    UNDEFINED_CAPABLE =3D 0,
-    SYSTEM_INTEL_MSR_CAPABLE,
-    SYSTEM_IO_CAPABLE,
-};
-
-#define INTEL_MSR_RANGE         (0xffffull)
-
 struct acpi_cpufreq_data *cpufreq_drv_data[NR_CPUS];
=20
-static bool __read_mostly acpi_pstate_strict;
-boolean_param("acpi_pstate_strict", acpi_pstate_strict);
-
-static unsigned extract_io(u32 value, struct acpi_cpufreq_data *data)
-{
-    struct processor_performance *perf;
-    int i;
-
-    perf =3D data->acpi_data;
-
-    for (i=3D0; i<perf->state_count; i++) {
-        if (value =3D=3D perf->states[i].status)
-            return data->freq_table[i].frequency;
-    }
-    return 0;
-}
-
-static unsigned extract_msr(u32 msr, struct acpi_cpufreq_data *data)
-{
-    int i;
-    struct processor_performance *perf;
-
-    msr &=3D INTEL_MSR_RANGE;
-    perf =3D data->acpi_data;
-
-    for (i=3D0; data->freq_table[i].frequency !=3D CPUFREQ_TABLE_END; i+=
+) {
-        if (msr =3D=3D perf->states[data->freq_table[i].index].status)
-            return data->freq_table[i].frequency;
-    }
-    return data->freq_table[0].frequency;
-}
-
-static unsigned extract_freq(u32 val, struct acpi_cpufreq_data *data)
-{
-    switch (data->arch_cpu_flags) {
-    case SYSTEM_INTEL_MSR_CAPABLE:
-        return extract_msr(val, data);
-    case SYSTEM_IO_CAPABLE:
-        return extract_io(val, data);
-    default:
-        return 0;
-    }
-}
-
-struct msr_addr {
-    u32 reg;
-};
-
-struct io_addr {
-    u16 port;
-    u8 bit_width;
-};
-
-typedef union {
-    struct msr_addr msr;
-    struct io_addr io;
-} drv_addr_union;
-
-struct drv_cmd {
-    unsigned int type;
-    const cpumask_t *mask;
-    drv_addr_union addr;
-    u32 val;
-};
-
-static void cf_check do_drv_read(void *drvcmd)
-{
-    struct drv_cmd *cmd;
-
-    cmd =3D (struct drv_cmd *)drvcmd;
-
-    switch (cmd->type) {
-    case SYSTEM_INTEL_MSR_CAPABLE:
-        rdmsrl(cmd->addr.msr.reg, cmd->val);
-        break;
-    case SYSTEM_IO_CAPABLE:
-        acpi_os_read_port((acpi_io_address)cmd->addr.io.port,
-            &cmd->val, (u32)cmd->addr.io.bit_width);
-        break;
-    default:
-        break;
-    }
-}
-
-static void cf_check do_drv_write(void *drvcmd)
-{
-    struct drv_cmd *cmd;
-    uint64_t msr_content;
-
-    cmd =3D (struct drv_cmd *)drvcmd;
-
-    switch (cmd->type) {
-    case SYSTEM_INTEL_MSR_CAPABLE:
-        rdmsrl(cmd->addr.msr.reg, msr_content);
-        msr_content =3D (msr_content & ~INTEL_MSR_RANGE)
-            | (cmd->val & INTEL_MSR_RANGE);
-        wrmsrl(cmd->addr.msr.reg, msr_content);
-        break;
-    case SYSTEM_IO_CAPABLE:
-        acpi_os_write_port((acpi_io_address)cmd->addr.io.port,
-            cmd->val, (u32)cmd->addr.io.bit_width);
-        break;
-    default:
-        break;
-    }
-}
-
-static void drv_read(struct drv_cmd *cmd)
-{
-    cmd->val =3D 0;
-
-    ASSERT(cpumask_weight(cmd->mask) =3D=3D 1);
-
-    /* to reduce IPI for the sake of performance */
-    if (likely(cpumask_test_cpu(smp_processor_id(), cmd->mask)))
-        do_drv_read((void *)cmd);
-    else
-        on_selected_cpus(cmd->mask, do_drv_read, cmd, 1);
-}
-
-static void drv_write(struct drv_cmd *cmd)
-{
-    if (cpumask_equal(cmd->mask, cpumask_of(smp_processor_id())))
-        do_drv_write((void *)cmd);
-    else
-        on_selected_cpus(cmd->mask, do_drv_write, cmd, 1);
-}
-
-static u32 get_cur_val(const cpumask_t *mask)
-{
-    struct cpufreq_policy *policy;
-    struct processor_performance *perf;
-    struct drv_cmd cmd;
-    unsigned int cpu =3D smp_processor_id();
-
-    if (unlikely(cpumask_empty(mask)))
-        return 0;
-
-    if (!cpumask_test_cpu(cpu, mask))
-        cpu =3D cpumask_first(mask);
-    if (cpu >=3D nr_cpu_ids || !cpu_online(cpu))
-        return 0;
-
-    policy =3D per_cpu(cpufreq_cpu_policy, cpu);
-    if (!policy || !cpufreq_drv_data[policy->cpu])
-        return 0;   =20
-
-    switch (cpufreq_drv_data[policy->cpu]->arch_cpu_flags) {
-    case SYSTEM_INTEL_MSR_CAPABLE:
-        cmd.type =3D SYSTEM_INTEL_MSR_CAPABLE;
-        cmd.addr.msr.reg =3D MSR_IA32_PERF_STATUS;
-        break;
-    case SYSTEM_IO_CAPABLE:
-        cmd.type =3D SYSTEM_IO_CAPABLE;
-        perf =3D cpufreq_drv_data[policy->cpu]->acpi_data;
-        cmd.addr.io.port =3D perf->control_register.address;
-        cmd.addr.io.bit_width =3D perf->control_register.bit_width;
-        break;
-    default:
-        return 0;
-    }
-
-    cmd.mask =3D cpumask_of(cpu);
-
-    drv_read(&cmd);
-    return cmd.val;
-}
-
-struct perf_pair {
-    union {
-        struct {
-            uint32_t lo;
-            uint32_t hi;
-        } split;
-        uint64_t whole;
-    } aperf, mperf;
-};
-static DEFINE_PER_CPU(struct perf_pair, gov_perf_pair);
-static DEFINE_PER_CPU(struct perf_pair, usr_perf_pair);
-
-static void cf_check read_measured_perf_ctrs(void *_readin)
-{
-    struct perf_pair *readin =3D _readin;
-
-    rdmsrl(MSR_IA32_APERF, readin->aperf.whole);
-    rdmsrl(MSR_IA32_MPERF, readin->mperf.whole);
-}
-
-/*
- * Return the measured active (C0) frequency on this CPU since last call
- * to this function.
- * Input: cpu number
- * Return: Average CPU frequency in terms of max frequency (zero on erro=
r)
- *
- * We use IA32_MPERF and IA32_APERF MSRs to get the measured performance
- * over a period of time, while CPU is in C0 state.
- * IA32_MPERF counts at the rate of max advertised frequency
- * IA32_APERF counts at the rate of actual CPU frequency
- * Only IA32_APERF/IA32_MPERF ratio is architecturally defined and
- * no meaning should be associated with absolute values of these MSRs.
- */
-unsigned int get_measured_perf(unsigned int cpu, unsigned int flag)
-{
-    struct cpufreq_policy *policy;   =20
-    struct perf_pair readin, cur, *saved;
-    unsigned int perf_percent;
-
-    if (!cpu_online(cpu))
-        return 0;
-
-    policy =3D per_cpu(cpufreq_cpu_policy, cpu);
-    if ( !policy || !cpu_has_aperfmperf )
-        return 0;
-
-    switch (flag)
-    {
-    case GOV_GETAVG:
-    {
-        saved =3D &per_cpu(gov_perf_pair, cpu);
-        break;
-    }
-    case USR_GETAVG:
-    {
-        saved =3D &per_cpu(usr_perf_pair, cpu);
-        break;
-    }
-    default:
-        return 0;
-    }
-
-    if (cpu =3D=3D smp_processor_id()) {
-        read_measured_perf_ctrs((void *)&readin);
-    } else {
-        on_selected_cpus(cpumask_of(cpu), read_measured_perf_ctrs,
-                        &readin, 1);
-    }
-
-    cur.aperf.whole =3D readin.aperf.whole - saved->aperf.whole;
-    cur.mperf.whole =3D readin.mperf.whole - saved->mperf.whole;
-    saved->aperf.whole =3D readin.aperf.whole;
-    saved->mperf.whole =3D readin.mperf.whole;
-
-    if (unlikely(((unsigned long)(-1) / 100) < cur.aperf.whole)) {
-        int shift_count =3D 7;
-        cur.aperf.whole >>=3D shift_count;
-        cur.mperf.whole >>=3D shift_count;
-    }
-
-    if (cur.aperf.whole && cur.mperf.whole)
-        perf_percent =3D (cur.aperf.whole * 100) / cur.mperf.whole;
-    else
-        perf_percent =3D 0;
-
-    return policy->cpuinfo.perf_freq * perf_percent / 100;
-}
-
-static unsigned int cf_check get_cur_freq_on_cpu(unsigned int cpu)
-{
-    struct cpufreq_policy *policy;
-    struct acpi_cpufreq_data *data;
-
-    if (!cpu_online(cpu))
-        return 0;
-
-    policy =3D per_cpu(cpufreq_cpu_policy, cpu);
-    if (!policy)
-        return 0;
-
-    data =3D cpufreq_drv_data[policy->cpu];
-    if (unlikely(data =3D=3D NULL ||
-        data->acpi_data =3D=3D NULL || data->freq_table =3D=3D NULL))
-        return 0;
-
-    return extract_freq(get_cur_val(cpumask_of(cpu)), data);
-}
-
-void intel_feature_detect(struct cpufreq_policy *policy)
-{
-    unsigned int eax;
-
-    eax =3D cpuid_eax(6);
-    if (eax & 0x2) {
-        policy->turbo =3D CPUFREQ_TURBO_ENABLED;
-        if (cpufreq_verbose)
-            printk(XENLOG_INFO "CPU%u: Turbo Mode detected and enabled\n=
",
-                   smp_processor_id());
-    }
-}
-
-static void cf_check feature_detect(void *info)
-{
-    intel_feature_detect(info);
-}
-
-static unsigned int check_freqs(const cpumask_t *mask, unsigned int freq=
,
-                                struct acpi_cpufreq_data *data)
-{
-    unsigned int cur_freq;
-    unsigned int i;
-
-    for (i=3D0; i<100; i++) {
-        cur_freq =3D extract_freq(get_cur_val(mask), data);
-        if (cur_freq =3D=3D freq)
-            return 1;
-        udelay(10);
-    }
-    return 0;
-}
-
-static int cf_check acpi_cpufreq_target(
-    struct cpufreq_policy *policy,
-    unsigned int target_freq, unsigned int relation)
-{
-    struct acpi_cpufreq_data *data =3D cpufreq_drv_data[policy->cpu];
-    struct processor_performance *perf;
-    struct cpufreq_freqs freqs;
-    cpumask_t online_policy_cpus;
-    struct drv_cmd cmd;
-    unsigned int next_state =3D 0; /* Index into freq_table */
-    unsigned int next_perf_state =3D 0; /* Index into perf table */
-    unsigned int j;
-    int result =3D 0;
-
-    if (unlikely(data =3D=3D NULL ||
-        data->acpi_data =3D=3D NULL || data->freq_table =3D=3D NULL)) {
-        return -ENODEV;
-    }
-
-    if (policy->turbo =3D=3D CPUFREQ_TURBO_DISABLED)
-        if (target_freq > policy->cpuinfo.second_max_freq)
-            target_freq =3D policy->cpuinfo.second_max_freq;
-
-    perf =3D data->acpi_data;
-    result =3D cpufreq_frequency_table_target(policy,
-                                            data->freq_table,
-                                            target_freq,
-                                            relation, &next_state);
-    if (unlikely(result))
-        return -ENODEV;
-
-    cpumask_and(&online_policy_cpus, &cpu_online_map, policy->cpus);
-
-    next_perf_state =3D data->freq_table[next_state].index;
-    if (perf->state =3D=3D next_perf_state) {
-        if (unlikely(policy->resume))
-            policy->resume =3D 0;
-        else
-            return 0;
-    }
-
-    switch (data->arch_cpu_flags) {
-    case SYSTEM_INTEL_MSR_CAPABLE:
-        cmd.type =3D SYSTEM_INTEL_MSR_CAPABLE;
-        cmd.addr.msr.reg =3D MSR_IA32_PERF_CTL;
-        cmd.val =3D (u32) perf->states[next_perf_state].control;
-        break;
-    case SYSTEM_IO_CAPABLE:
-        cmd.type =3D SYSTEM_IO_CAPABLE;
-        cmd.addr.io.port =3D perf->control_register.address;
-        cmd.addr.io.bit_width =3D perf->control_register.bit_width;
-        cmd.val =3D (u32) perf->states[next_perf_state].control;
-        break;
-    default:
-        return -ENODEV;
-    }
-
-    if (policy->shared_type !=3D CPUFREQ_SHARED_TYPE_ANY)
-        cmd.mask =3D &online_policy_cpus;
-    else
-        cmd.mask =3D cpumask_of(policy->cpu);
-
-    freqs.old =3D perf->states[perf->state].core_frequency * 1000;
-    freqs.new =3D data->freq_table[next_state].frequency;
-
-    drv_write(&cmd);
-
-    if (acpi_pstate_strict && !check_freqs(cmd.mask, freqs.new, data)) {
-        printk(KERN_WARNING "Fail transfer to new freq %d\n", freqs.new)=
;
-        return -EAGAIN;
-    }
-
-    for_each_cpu(j, &online_policy_cpus)
-        cpufreq_statistic_update(j, perf->state, next_perf_state);
-
-    perf->state =3D next_perf_state;
-    policy->cur =3D freqs.new;
-
-    return result;
-}
-
-static int cf_check acpi_cpufreq_verify(struct cpufreq_policy *policy)
-{
-    struct acpi_cpufreq_data *data;
-    struct processor_performance *perf;
-
-    if (!policy || !(data =3D cpufreq_drv_data[policy->cpu]) ||
-        !processor_pminfo[policy->cpu])
-        return -EINVAL;
-
-    perf =3D &processor_pminfo[policy->cpu]->perf;
-
-    cpufreq_verify_within_limits(policy, 0,=20
-        perf->states[perf->platform_limit].core_frequency * 1000);
-
-    return cpufreq_frequency_table_verify(policy, data->freq_table);
-}
-
-static unsigned long
-acpi_cpufreq_guess_freq(struct acpi_cpufreq_data *data, unsigned int cpu=
)
-{
-    struct processor_performance *perf =3D data->acpi_data;
-
-    if (cpu_khz) {
-        /* search the closest match to cpu_khz */
-        unsigned int i;
-        unsigned long freq;
-        unsigned long freqn =3D perf->states[0].core_frequency * 1000;
-
-        for (i=3D0; i<(perf->state_count-1); i++) {
-            freq =3D freqn;
-            freqn =3D perf->states[i+1].core_frequency * 1000;
-            if ((2 * cpu_khz) > (freqn + freq)) {
-                perf->state =3D i;
-                return freq;
-            }
-        }
-        perf->state =3D perf->state_count-1;
-        return freqn;
-    } else {
-        /* assume CPU is at P0... */
-        perf->state =3D 0;
-        return perf->states[0].core_frequency * 1000;
-    }
-}
-
-static int cf_check acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
-{
-    unsigned int i;
-    unsigned int valid_states =3D 0;
-    unsigned int cpu =3D policy->cpu;
-    struct acpi_cpufreq_data *data;
-    unsigned int result =3D 0;
-    struct cpuinfo_x86 *c =3D &cpu_data[policy->cpu];
-    struct processor_performance *perf;
-
-    data =3D xzalloc(struct acpi_cpufreq_data);
-    if (!data)
-        return -ENOMEM;
-
-    cpufreq_drv_data[cpu] =3D data;
-
-    data->acpi_data =3D &processor_pminfo[cpu]->perf;
-
-    perf =3D data->acpi_data;
-    policy->shared_type =3D perf->shared_type;
-
-    switch (perf->control_register.space_id) {
-    case ACPI_ADR_SPACE_SYSTEM_IO:
-        if (cpufreq_verbose)
-            printk("xen_pminfo: @acpi_cpufreq_cpu_init,"
-                   "SYSTEM IO addr space\n");
-        data->arch_cpu_flags =3D SYSTEM_IO_CAPABLE;
-        break;
-    case ACPI_ADR_SPACE_FIXED_HARDWARE:
-        if (cpufreq_verbose)
-            printk("xen_pminfo: @acpi_cpufreq_cpu_init,"
-                   "HARDWARE addr space\n");
-        if (!cpu_has(c, X86_FEATURE_EIST)) {
-            result =3D -ENODEV;
-            goto err_unreg;
-        }
-        data->arch_cpu_flags =3D SYSTEM_INTEL_MSR_CAPABLE;
-        break;
-    default:
-        result =3D -ENODEV;
-        goto err_unreg;
-    }
-
-    data->freq_table =3D xmalloc_array(struct cpufreq_frequency_table,=20
-                                    (perf->state_count+1));
-    if (!data->freq_table) {
-        result =3D -ENOMEM;
-        goto err_unreg;
-    }
-
-    /* detect transition latency */
-    policy->cpuinfo.transition_latency =3D 0;
-    for (i=3D0; i<perf->state_count; i++) {
-        if ((perf->states[i].transition_latency * 1000) >
-            policy->cpuinfo.transition_latency)
-            policy->cpuinfo.transition_latency =3D
-                perf->states[i].transition_latency * 1000;
-    }
-
-    policy->governor =3D cpufreq_opt_governor ? : CPUFREQ_DEFAULT_GOVERN=
OR;
-
-    /* table init */
-    for (i=3D0; i<perf->state_count; i++) {
-        if (i>0 && perf->states[i].core_frequency >=3D
-            data->freq_table[valid_states-1].frequency / 1000)
-            continue;
-
-        data->freq_table[valid_states].index =3D i;
-        data->freq_table[valid_states].frequency =3D
-            perf->states[i].core_frequency * 1000;
-        valid_states++;
-    }
-    data->freq_table[valid_states].frequency =3D CPUFREQ_TABLE_END;
-    perf->state =3D 0;
-
-    result =3D cpufreq_frequency_table_cpuinfo(policy, data->freq_table)=
;
-    if (result)
-        goto err_freqfree;
-
-    switch (perf->control_register.space_id) {
-    case ACPI_ADR_SPACE_SYSTEM_IO:
-        /* Current speed is unknown and not detectable by IO port */
-        policy->cur =3D acpi_cpufreq_guess_freq(data, policy->cpu);
-        break;
-    case ACPI_ADR_SPACE_FIXED_HARDWARE:
-        cpufreq_driver.get =3D get_cur_freq_on_cpu;
-        policy->cur =3D get_cur_freq_on_cpu(cpu);
-        break;
-    default:
-        break;
-    }
-
-    /* Check for APERF/MPERF support in hardware
-     * also check for boost support */
-    if (c->x86_vendor =3D=3D X86_VENDOR_INTEL && c->cpuid_level >=3D 6)
-        on_selected_cpus(cpumask_of(cpu), feature_detect, policy, 1);
-
-    /*
-     * the first call to ->target() should result in us actually
-     * writing something to the appropriate registers.
-     */
-    policy->resume =3D 1;
-
-    return result;
-
-err_freqfree:
-    xfree(data->freq_table);
-err_unreg:
-    xfree(data);
-    cpufreq_drv_data[cpu] =3D NULL;
-
-    return result;
-}
-
-static int cf_check acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
-{
-    struct acpi_cpufreq_data *data =3D cpufreq_drv_data[policy->cpu];
-
-    if (data) {
-        cpufreq_drv_data[policy->cpu] =3D NULL;
-        xfree(data->freq_table);
-        xfree(data);
-    }
-
-    return 0;
-}
-
-static const struct cpufreq_driver __initconst_cf_clobber
-acpi_cpufreq_driver =3D {
-    .name   =3D "acpi-cpufreq",
-    .verify =3D acpi_cpufreq_verify,
-    .target =3D acpi_cpufreq_target,
-    .init   =3D acpi_cpufreq_cpu_init,
-    .exit   =3D acpi_cpufreq_cpu_exit,
-    .get    =3D get_cur_freq_on_cpu,
-};
-
 static int __init cf_check cpufreq_driver_init(void)
 {
     int ret =3D 0;
@@ -640,7 +50,7 @@ static int __init cf_check cpufreq_driver_init(void)
                 switch ( cpufreq_xen_opts[i] )
                 {
                 case CPUFREQ_xen:
-                    ret =3D cpufreq_register_driver(&acpi_cpufreq_driver=
);
+                    ret =3D acpi_register_driver();
                     break;
                 case CPUFREQ_hwp:
                     ret =3D hwp_register_driver();
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufre=
q/cpufreq.h
index 443427153b..1a8ba3756c 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -260,4 +260,5 @@ int get_hwp_para(unsigned int cpu,
 int set_hwp_para(struct cpufreq_policy *policy,
                  struct xen_set_cppc_para *set_cppc);
=20
+int acpi_register_driver(void);
 #endif /* __XEN_CPUFREQ_PM_H__ */
--=20
2.25.1


