Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGuQNIy8vGlc2gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 04:18:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701352D56B8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 04:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257692.1552046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3QNE-0006BM-2N; Fri, 20 Mar 2026 03:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257692.1552046; Fri, 20 Mar 2026 03:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3QND-00068N-Ub; Fri, 20 Mar 2026 03:18:07 +0000
Received: by outflank-mailman (input) for mailman id 1257692;
 Fri, 20 Mar 2026 03:18:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4NFT=BU=huawei.com=fengchengwen@srs-se1.protection.inumbo.net>)
 id 1w3QNC-00049n-Fc
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 03:18:06 +0000
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 679fcf2e-240b-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 04:18:05 +0100 (CET)
Received: from canpmsgout03.his.huawei.com (unknown [172.19.92.159])
 by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fcSR32T8kz1BFlp
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2026 11:17:03 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.19.162.140])
 by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fcSKh4nPxzpStY;
 Fri, 20 Mar 2026 11:12:24 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
 by mail.maildlp.com (Postfix) with ESMTPS id 571B82012A;
 Fri, 20 Mar 2026 11:17:51 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Mar 2026 11:17:49 +0800
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
X-Inumbo-ID: 679fcf2e-240b-11f1-b164-2bf370ae4941
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/bDHT0vostLWviBcH0LGnrUXN/7+wtQhJKC8xvlaZ1w=;
	b=I76d5QkgB06G/X/wos41vVtgRQepXQMzc5bCmZUjG61rsMvqBqMxjyiWV13dSj/N0vARfMR+I
	TIpo+e0ZZ/G2PYTKyAK+od5BAX4GJxZnIIHvWHRL80Tl9ySzHsM4ReaK/m6QcwIZU7CfdK4/sr4
	hK45B5FTc4PW95z2AIDDxVc=
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/bDHT0vostLWviBcH0LGnrUXN/7+wtQhJKC8xvlaZ1w=;
	b=I76d5QkgB06G/X/wos41vVtgRQepXQMzc5bCmZUjG61rsMvqBqMxjyiWV13dSj/N0vARfMR+I
	TIpo+e0ZZ/G2PYTKyAK+od5BAX4GJxZnIIHvWHRL80Tl9ySzHsM4ReaK/m6QcwIZU7CfdK4/sr4
	hK45B5FTc4PW95z2AIDDxVc=
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
Subject: [PATCH v10 4/8] x86/acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
Date: Fri, 20 Mar 2026 11:17:33 +0800
Message-ID: <20260320031737.35048-5-fengchengwen@huawei.com>
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
	FORGED_SENDER(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:palmer@dabbelt.com,m:bp@alien8.de,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:lenb@kernel.org,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:jonathan.cameron@huawei.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make24@iscas.ac.cn,m:wei.huang2@amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:ryan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy
 @kernel.org,m:wangyuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:fengchengwen@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCPT_COUNT_GT_50(0.00)[60];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 701352D56B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As a step towards unifying the interface for retrieving ACPI CPU UID
across architectures, introduce a new function acpi_get_cpu_uid() for
x86. While at it, add input validation to make the code more robust.

Update Xen-related code to use acpi_get_cpu_uid() instead of the legacy
cpu_acpi_id() function, and remove the now-unused cpu_acpi_id() to clean
up redundant code.

Cc: stable@vger.kernel.org
Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/acpi.h  |  2 ++
 arch/x86/include/asm/cpu.h   |  1 -
 arch/x86/include/asm/smp.h   |  1 -
 arch/x86/kernel/acpi/boot.c  | 20 ++++++++++++++++++++
 arch/x86/xen/enlighten_hvm.c |  5 +++--
 5 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
index a03aa6f999d1..92b5c27c4fea 100644
--- a/arch/x86/include/asm/acpi.h
+++ b/arch/x86/include/asm/acpi.h
@@ -157,6 +157,8 @@ static inline bool acpi_has_cpu_in_madt(void)
 	return !!acpi_lapic;
 }
 
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
+
 #define ACPI_HAVE_ARCH_SET_ROOT_POINTER
 static __always_inline void acpi_arch_set_root_pointer(u64 addr)
 {
diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
index ad235dda1ded..57a0786dfd75 100644
--- a/arch/x86/include/asm/cpu.h
+++ b/arch/x86/include/asm/cpu.h
@@ -11,7 +11,6 @@
 
 #ifndef CONFIG_SMP
 #define cpu_physical_id(cpu)			boot_cpu_physical_apicid
-#define cpu_acpi_id(cpu)			0
 #endif /* CONFIG_SMP */
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index 84951572ab81..05d1d479b4cf 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -130,7 +130,6 @@ __visible void smp_call_function_interrupt(struct pt_regs *regs);
 __visible void smp_call_function_single_interrupt(struct pt_regs *r);
 
 #define cpu_physical_id(cpu)	per_cpu(x86_cpu_to_apicid, cpu)
-#define cpu_acpi_id(cpu)	per_cpu(x86_cpu_to_acpiid, cpu)
 
 /*
  * This function is needed by all SMP systems. It must _always_ be valid
diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
index a3f2fb1fea1b..ceba24f65ae3 100644
--- a/arch/x86/kernel/acpi/boot.c
+++ b/arch/x86/kernel/acpi/boot.c
@@ -1848,3 +1848,23 @@ void __iomem * (*acpi_os_ioremap)(acpi_physical_address phys, acpi_size size) =
 	x86_acpi_os_ioremap;
 EXPORT_SYMBOL_GPL(acpi_os_ioremap);
 #endif
+
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
+{
+	u32 acpi_id;
+
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+#ifdef CONFIG_SMP
+	acpi_id = per_cpu(x86_cpu_to_acpiid, cpu);
+	if (acpi_id == CPU_ACPIID_INVALID)
+		return -ENODEV;
+#else
+	acpi_id = 0;
+#endif
+
+	*uid = acpi_id;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index fe57ff85d004..2f9fa27e5a3c 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -151,6 +151,7 @@ static void xen_hvm_crash_shutdown(struct pt_regs *regs)
 
 static int xen_cpu_up_prepare_hvm(unsigned int cpu)
 {
+	u32 cpu_uid;
 	int rc = 0;
 
 	/*
@@ -161,8 +162,8 @@ static int xen_cpu_up_prepare_hvm(unsigned int cpu)
 	 */
 	xen_uninit_lock_cpu(cpu);
 
-	if (cpu_acpi_id(cpu) != CPU_ACPIID_INVALID)
-		per_cpu(xen_vcpu_id, cpu) = cpu_acpi_id(cpu);
+	if (acpi_get_cpu_uid(cpu, &cpu_uid) == 0)
+		per_cpu(xen_vcpu_id, cpu) = cpu_uid;
 	else
 		per_cpu(xen_vcpu_id, cpu) = cpu;
 	xen_vcpu_setup(cpu);
-- 
2.17.1


