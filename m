Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFmGB5yeu2nmlwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 07:58:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D502C6F8D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 07:58:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256666.1551214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w37KU-0004v4-Jo; Thu, 19 Mar 2026 06:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256666.1551214; Thu, 19 Mar 2026 06:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w37KU-0004oJ-CS; Thu, 19 Mar 2026 06:58:02 +0000
Received: by outflank-mailman (input) for mailman id 1256666;
 Thu, 19 Mar 2026 06:58:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F4ko=BT=huawei.com=fengchengwen@srs-se1.protection.inumbo.net>)
 id 1w37KT-0003m8-39
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 06:58:01 +0000
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com
 [113.46.200.219]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f570148a-2360-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 07:57:58 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.104])
 by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fbxGY46TBz1prKM;
 Thu, 19 Mar 2026 14:52:53 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
 by mail.maildlp.com (Postfix) with ESMTPS id DA7944056A;
 Thu, 19 Mar 2026 14:57:55 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Mar 2026 14:57:53 +0800
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
X-Inumbo-ID: f570148a-2360-11f1-9ccf-f158ae23cfc8
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=deqvN/mz2FJFsKRgusCQZVunNs0GKMrytgWIJYyKC38=;
	b=Q+InHx0t+fgSQtVLerCqnbpWuqjH25g8rq1c9ZrVB+5OCCEDVGxoUto5wjyaX4/Bl04WMbtaJ
	D5pQTQF9XcjGForLBwmJbjk2yPwBl1ETh0zu94i3cxgLe/S/32diWFN4CZVJMw0StBVGyVJ58gg
	PF0KAlLv+2qVOoGAxpaIJP4=
From: Chengwen Feng <fengchengwen@huawei.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>, Sunil V
 L <sunilvl@ventanamicro.com>, Mark Rutland <mark.rutland@arm.com>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, Kees Cook <kees@kernel.org>, Yanteng
 Si <si.yanteng@linux.dev>, Sean Christopherson <seanjc@google.com>, Kai Huang
	<kai.huang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth
	<thuth@redhat.com>, Thorsten Blum <thorsten.blum@linux.dev>, Kevin Loughlin
	<kevinloughlin@google.com>, Zheyun Shen <szy0127@sjtu.edu.cn>, Peter Zijlstra
	<peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Xin
 Li <xin@zytor.com>, "Ahmed S . Darwish" <darwi@linutronix.de>, Sohil Mehta
	<sohil.mehta@intel.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, Robin
 Murphy <robin.murphy@arm.com>, James Clark <james.clark@linaro.org>, Besar
 Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>, Wei Huang
	<wei.huang2@amd.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Somnath Kotur <somnath.kotur@broadcom.com>, <punit.agrawal@oss.qualcomm.com>,
	<guohanjun@huawei.com>, <suzuki.poulose@arm.com>, <ryan.roberts@arm.com>,
	<chenl311@chinatelecom.cn>, <masahiroy@kernel.org>,
	<wangyuquan1236@phytium.com.cn>, <anshuman.khandual@arm.com>,
	<heinrich.schuchardt@canonical.com>, <Eric.VanTassell@amd.com>,
	<wangzhou1@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <fengchengwen@huawei.com>,
	<linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
	<xen-devel@lists.xenproject.org>, <linux-acpi@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <stable@vger.kernel.org>
Subject: [PATCH v9 6/7] ACPI: PPTT: Use acpi_get_cpu_uid() and remove get_acpi_id_for_cpu()
Date: Thu, 19 Mar 2026 14:57:34 +0800
Message-ID: <20260319065735.45954-7-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260319065735.45954-1-fengchengwen@huawei.com>
References: <20260319065735.45954-1-fengchengwen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:lenb@kernel.org,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:jonathan.cameron@huawei.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make24@iscas.ac.cn,m:wei.huang2
 @amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:ryan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy@kernel.org,m:wangyuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:fengchengwen@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:email,huawei.com:mid];
	FROM_NEQ_ENVFROM(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCPT_COUNT_GT_50(0.00)[70];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 71D502C6F8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

- Convert acpi/pptt.c to use acpi_get_cpu_uid() instead of
  get_acpi_id_for_cpu()
- Remove unused get_acpi_id_for_cpu() implementations from
  arm64/loongarch/riscv

This completes the migration to the unified ACPI CPU UID interface for
PPTT code, and cleans up legacy unused functions to reduce technical
debt.

Cc: stable@vger.kernel.org
Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/arm64/include/asm/acpi.h     |  4 ---
 arch/loongarch/include/asm/acpi.h |  5 ----
 arch/riscv/include/asm/acpi.h     |  4 ---
 drivers/acpi/pptt.c               | 50 +++++++++++++++++++++++--------
 4 files changed, 37 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index bdb0ecf95b5c..8a54ca6ba602 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -114,10 +114,6 @@ static inline bool acpi_has_cpu_in_madt(void)
 }
 
 struct acpi_madt_generic_interrupt *acpi_cpu_get_madt_gicc(int cpu);
-static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
-{
-	return	acpi_cpu_get_madt_gicc(cpu)->uid;
-}
 int get_cpu_for_acpi_id(u32 uid);
 
 static inline void arch_fix_phys_package_id(int num, u32 slot) { }
diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
index 7376840fa9f7..eda9d4d0a493 100644
--- a/arch/loongarch/include/asm/acpi.h
+++ b/arch/loongarch/include/asm/acpi.h
@@ -40,11 +40,6 @@ extern struct acpi_madt_core_pic acpi_core_pic[MAX_CORE_PIC];
 
 extern int __init parse_acpi_topology(void);
 
-static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
-{
-	return acpi_core_pic[cpu_logical_map(cpu)].processor_id;
-}
-
 #endif /* !CONFIG_ACPI */
 
 #define ACPI_TABLE_UPGRADE_MAX_PHYS ARCH_LOW_ADDRESS_LIMIT
diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 6e13695120bc..26ab37c171bc 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -61,10 +61,6 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
 
 void acpi_init_rintc_map(void);
 struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
-static inline u32 get_acpi_id_for_cpu(int cpu)
-{
-	return acpi_cpu_get_madt_rintc(cpu)->uid;
-}
 
 int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index de5f8c018333..7bd5bc1f225a 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -459,11 +459,14 @@ static void cache_setup_acpi_cpu(struct acpi_table_header *table,
 {
 	struct acpi_pptt_cache *found_cache;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
-	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+	u32 acpi_cpu_id;
 	struct cacheinfo *this_leaf;
 	unsigned int index = 0;
 	struct acpi_pptt_processor *cpu_node = NULL;
 
+	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
+		return;
+
 	while (index < get_cpu_cacheinfo(cpu)->num_leaves) {
 		this_leaf = this_cpu_ci->info_list + index;
 		found_cache = acpi_find_cache_node(table, acpi_cpu_id,
@@ -546,7 +549,10 @@ static int topology_get_acpi_cpu_tag(struct acpi_table_header *table,
 				     unsigned int cpu, int level, int flag)
 {
 	struct acpi_pptt_processor *cpu_node;
-	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+	u32 acpi_cpu_id;
+
+	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
+		return -ENOENT;
 
 	cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
 	if (cpu_node) {
@@ -614,18 +620,22 @@ static int find_acpi_cpu_topology_tag(unsigned int cpu, int level, int flag)
  *
  * Check the node representing a CPU for a given flag.
  *
- * Return: -ENOENT if the PPTT doesn't exist, the CPU cannot be found or
- *	   the table revision isn't new enough.
+ * Return: -ENOENT if can't get CPU's ACPI Processor UID, the PPTT doesn't
+ *	   exist, the CPU cannot be found or the table revision isn't new
+ *	   enough.
  *	   1, any passed flag set
  *	   0, flag unset
  */
 static int check_acpi_cpu_flag(unsigned int cpu, int rev, u32 flag)
 {
 	struct acpi_table_header *table;
-	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+	u32 acpi_cpu_id;
 	struct acpi_pptt_processor *cpu_node = NULL;
 	int ret = -ENOENT;
 
+	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
+		return -ENOENT;
+
 	table = acpi_get_pptt();
 	if (!table)
 		return -ENOENT;
@@ -651,7 +661,8 @@ static int check_acpi_cpu_flag(unsigned int cpu, int rev, u32 flag)
  * in the PPTT. Errors caused by lack of a PPTT table, or otherwise, return 0
  * indicating we didn't find any cache levels.
  *
- * Return: -ENOENT if no PPTT table or no PPTT processor struct found.
+ * Return: -ENOENT if no PPTT table, can't get CPU's ACPI Process UID or no PPTT
+ *	   processor struct found.
  *	   0 on success.
  */
 int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
@@ -671,7 +682,9 @@ int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
 
 	pr_debug("Cache Setup: find cache levels for CPU=%d\n", cpu);
 
-	acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id))
+		return -ENOENT;
+
 	cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
 	if (!cpu_node)
 		return -ENOENT;
@@ -780,8 +793,9 @@ int find_acpi_cpu_topology_package(unsigned int cpu)
  * It may not exist in single CPU systems. In simple multi-CPU systems,
  * it may be equal to the package topology level.
  *
- * Return: -ENOENT if the PPTT doesn't exist, the CPU cannot be found
- * or there is no toplogy level above the CPU..
+ * Return: -ENOENT if the PPTT doesn't exist, can't get CPU's ACPI
+ * Processor UID, the CPU cannot be found or there is no toplogy level
+ * above the CPU.
  * Otherwise returns a value which represents the package for this CPU.
  */
 
@@ -797,7 +811,9 @@ int find_acpi_cpu_topology_cluster(unsigned int cpu)
 	if (!table)
 		return -ENOENT;
 
-	acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
+		return -ENOENT;
+
 	cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
 	if (!cpu_node || !cpu_node->parent)
 		return -ENOENT;
@@ -872,7 +888,9 @@ static void acpi_pptt_get_child_cpus(struct acpi_table_header *table_hdr,
 	cpumask_clear(cpus);
 
 	for_each_possible_cpu(cpu) {
-		acpi_id = get_acpi_id_for_cpu(cpu);
+		if (acpi_get_cpu_uid(cpu, &acpi_id) != 0)
+			continue;
+
 		cpu_node = acpi_find_processor_node(table_hdr, acpi_id);
 
 		while (cpu_node) {
@@ -966,10 +984,13 @@ int find_acpi_cache_level_from_id(u32 cache_id)
 	for_each_possible_cpu(cpu) {
 		bool empty;
 		int level = 1;
-		u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+		u32 acpi_cpu_id;
 		struct acpi_pptt_cache *cache;
 		struct acpi_pptt_processor *cpu_node;
 
+		if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
+			continue;
+
 		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
 		if (!cpu_node)
 			continue;
@@ -1030,10 +1051,13 @@ int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus)
 	for_each_possible_cpu(cpu) {
 		bool empty;
 		int level = 1;
-		u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+		u32 acpi_cpu_id;
 		struct acpi_pptt_cache *cache;
 		struct acpi_pptt_processor *cpu_node;
 
+		if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
+			continue;
+
 		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
 		if (!cpu_node)
 			continue;
-- 
2.17.1


