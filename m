Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FUDLAIy8vGlb2gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 04:18:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8672D569B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 04:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257685.1551991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3QN3-0004c7-0V; Fri, 20 Mar 2026 03:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257685.1551991; Fri, 20 Mar 2026 03:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3QN2-0004Zy-TV; Fri, 20 Mar 2026 03:17:56 +0000
Received: by outflank-mailman (input) for mailman id 1257685;
 Fri, 20 Mar 2026 03:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4NFT=BU=huawei.com=fengchengwen@srs-se1.protection.inumbo.net>)
 id 1w3QN1-00049n-9I
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 03:17:55 +0000
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com
 [113.46.200.223]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 605aab81-240b-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 04:17:53 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.163])
 by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fcSL815VlzmV66;
 Fri, 20 Mar 2026 11:12:48 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
 by mail.maildlp.com (Postfix) with ESMTPS id B24234056B;
 Fri, 20 Mar 2026 11:17:49 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Mar 2026 11:17:47 +0800
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
X-Inumbo-ID: 605aab81-240b-11f1-b164-2bf370ae4941
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BMMryEb1CdnOx2gMiVv+9iHKONhR3XK5c+5CZUibkPo=;
	b=l/7oJpMqJuYSGHZyOqLiw5LD07h+45LWAipYVAvEt9pYxSp4UxJSqwXgX66M8/EZ74aeSBY3M
	qLpVsSs+rpKpxDOoVmFTloYQFQ4DUIG80JTpBOmlHJ7rSI3KUDZxGFyGCXDxs8sVu0UH3BlI+It
	fJwAj4fQtMaqP5gUwirfIBk=
From: Chengwen Feng <fengchengwen@huawei.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Juergen
 Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Len
 Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, Mark Rutland
	<mark.rutland@arm.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, Kees
 Cook <kees@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Sean
 Christopherson <seanjc@google.com>, Kai Huang <kai.huang@intel.com>, Tom
 Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Thorsten
 Blum <thorsten.blum@linux.dev>, Kevin Loughlin <kevinloughlin@google.com>,
	Zheyun Shen <szy0127@sjtu.edu.cn>, Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Xin Li <xin@zytor.com>,
	"Ahmed S . Darwish" <darwi@linutronix.de>, Sohil Mehta
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
Subject: [PATCH v10 3/8] RISC-V: ACPI: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
Date: Fri, 20 Mar 2026 11:17:32 +0800
Message-ID: <20260320031737.35048-4-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260320031737.35048-1-fengchengwen@huawei.com>
References: <20260320031737.35048-1-fengchengwen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:palmer@dabbelt.com,m:bp@alien8.de,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:lenb@kernel.org,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:jonathan.cameron@huawei.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make24@iscas.ac.cn,m:wei.huang2@amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:ryan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy
 @kernel.org,m:wangyuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:fengchengwen@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[60];
	FROM_NEQ_ENVFROM(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 6F8672D569B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As a step towards unifying the interface for retrieving ACPI CPU UID
across architectures, introduce a new function acpi_get_cpu_uid() for
riscv. While at it, add input validation to make the code more robust.

And also update acpi_numa.c and rhct.c to use the new interface instead
of the legacy get_acpi_id_for_cpu().

Cc: stable@vger.kernel.org
Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/riscv/include/asm/acpi.h |  1 +
 arch/riscv/kernel/acpi.c      | 16 ++++++++++++++++
 arch/riscv/kernel/acpi_numa.c |  9 ++++++---
 drivers/acpi/riscv/rhct.c     |  7 ++++++-
 4 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 6e13695120bc..f3520cc85af3 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -65,6 +65,7 @@ static inline u32 get_acpi_id_for_cpu(int cpu)
 {
 	return acpi_cpu_get_madt_rintc(cpu)->uid;
 }
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
 
 int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 71698ee11621..322ea92aa39f 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -337,3 +337,19 @@ int raw_pci_write(unsigned int domain, unsigned int bus,
 }
 
 #endif	/* CONFIG_PCI */
+
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
+{
+	struct acpi_madt_rintc *rintc;
+
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+	rintc = acpi_cpu_get_madt_rintc(cpu);
+	if (!rintc)
+		return -ENODEV;
+
+	*uid = rintc->uid;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
index 130769e3a99c..6a2d4289f806 100644
--- a/arch/riscv/kernel/acpi_numa.c
+++ b/arch/riscv/kernel/acpi_numa.c
@@ -37,11 +37,14 @@ static int __init acpi_numa_get_nid(unsigned int cpu)
 
 static inline int get_cpu_for_acpi_id(u32 uid)
 {
-	int cpu;
+	u32 cpu_uid;
+	int ret;
 
-	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
-		if (uid == get_acpi_id_for_cpu(cpu))
+	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
+		ret = acpi_get_cpu_uid(cpu, &cpu_uid);
+		if (ret == 0 && uid == cpu_uid)
 			return cpu;
+	}
 
 	return -EINVAL;
 }
diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
index caa2c16e1697..8f3f38c64a88 100644
--- a/drivers/acpi/riscv/rhct.c
+++ b/drivers/acpi/riscv/rhct.c
@@ -44,10 +44,15 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
 	struct acpi_rhct_isa_string *isa_node;
 	struct acpi_table_rhct *rhct;
 	u32 *hart_info_node_offset;
-	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+	u32 acpi_cpu_id;
+	int ret;
 
 	BUG_ON(acpi_disabled);
 
+	ret = acpi_get_cpu_uid(cpu, &acpi_cpu_id);
+	if (ret != 0)
+		return ret;
+
 	if (!table) {
 		rhct = acpi_get_rhct();
 		if (!rhct)
-- 
2.17.1


