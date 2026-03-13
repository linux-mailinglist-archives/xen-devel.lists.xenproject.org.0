Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC1eJfZ0s2loWgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 03:22:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB3D27CAD8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 03:22:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253177.1549491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0sA8-0000Hv-13; Fri, 13 Mar 2026 02:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253177.1549491; Fri, 13 Mar 2026 02:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0sA7-0000Ee-Pi; Fri, 13 Mar 2026 02:22:03 +0000
Received: by outflank-mailman (input) for mailman id 1253177;
 Fri, 13 Mar 2026 02:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OImI=BN=huawei.com=fengchengwen@srs-se1.protection.inumbo.net>)
 id 1w0sA6-0000ET-BE
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 02:22:02 +0000
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com
 [113.46.200.218]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65cd992c-1e83-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 03:21:55 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.162.140])
 by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fX7QX0pcgzpTJ7;
 Fri, 13 Mar 2026 10:16:36 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
 by mail.maildlp.com (Postfix) with ESMTPS id 9A98E2022B;
 Fri, 13 Mar 2026 10:21:50 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 13 Mar 2026 10:21:49 +0800
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
X-Inumbo-ID: 65cd992c-1e83-11f1-9ccf-f158ae23cfc8
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2rcpAa1TtZWLDIvssxD1LEn5AvFd7LlqWNSfVu4tX3w=;
	b=k2FbFqJDheDFD8ZQ1TIKD7MLAMU7NtAmyzZS79wyrByImlG/9Oz+7Ht/PCD+SNciSCiVeFaBq
	3VV/zPoCsVqgcC+m0j9DJ69/4Lo6oVqnv6AFub2EAZnQ3hPUkQ+J/R+M/YieceCx1b3KO4HESDm
	4ZRimNSFXHPkX5qqZZQWUsU=
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
	"H . Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Sohil
 Mehta <sohil.mehta@intel.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Robin Murphy <robin.murphy@arm.com>, James Clark <james.clark@linaro.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>, Wei
 Huang <wei.huang2@amd.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Somnath Kotur <somnath.kotur@broadcom.com>, <kees@kernel.org>,
	<punit.agrawal@oss.qualcomm.com>, <guohanjun@huawei.com>,
	<suzuki.poulose@arm.com>, <ryan.roberts@arm.com>, <chenl311@chinatelecom.cn>,
	<masahiroy@kernel.org>, <wangyuquan1236@phytium.com.cn>,
	<anshuman.khandual@arm.com>, <heinrich.schuchardt@canonical.com>,
	<Eric.VanTassell@amd.com>, <jonathan.cameron@huawei.com>,
	<wangzhou1@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <fengchengwen@huawei.com>,
	<linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
	<xen-devel@lists.xenproject.org>, <linux-acpi@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <stable@vger.kernel.org>
Subject: [PATCH v7 0/3] Fix get cpu steer-tag fail on ARM64 platform
Date: Fri, 13 Mar 2026 10:21:41 +0800
Message-ID: <20260313022144.40942-1-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
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
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make24@iscas.ac.cn,m:wei.huang2@amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:kees@kernel.org,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:ryan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy@kernel.org,m:wangyuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:jonathan.cameron@huawei.com,m:wangzhou1@hisilicon.com,m:wang
 huiqiang@huawei.com,m:liuyonglong@huawei.com,m:fengchengwen@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:mid];
	FROM_NEQ_ENVFROM(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCPT_COUNT_GT_50(0.00)[54];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8EB3D27CAD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patchset fixes the failure of CPU steer tag retrieval on ARM64
platforms. The series is structured as follows:

1. First commit: Refactor the ACPI Processor UID retrieval interface
   (no functional changes when input valid) to align naming conventions
   across arm64/riscv/loongarch architectures;
2. Second commit: Implement acpi_get_cpu_uid() for the x86 platform to
   complete the unified ACPI Processor UID interface across all
   ACPI-enabled architectures;
3. Third commit: Implement the core fix for the CPU steer tag retrieval
   logic on ARM64 (the root cause of the retrieval failure).

The refactor and x86 implementation lay the groundwork for the unified
ACPI interface required by the ARM64 steer tag fix, ensuring consistent
CPU UID retrieval across architectures before addressing the functional
bug.

---
Changes in v7:
- Refine first commit which address Jonathan's reviews
- Fix x86 implement bug (not consider INVALID-ID) which address Peter's
  review
- Fix CI error of x86 implement by moving function to acpi/boot.c

Changes in v6:
- Rename existing get_acpi_id_for_cpu() to acpi_get_cpu_uid()
- Split x86's modify as one commit

Changes in v5:
- Refine commit-log of commit 2/2
- Replace cpu_acpi_id() by acpi_get_cpu_acpi_id() on x86

Changes in v4:
- Split the rename into a separate commit.

Changes in v3:
- Rename existing get_acpi_id_for_cpu() to acpi_get_cpu_acpi_id() other
  than add one new API.

Changes in v2:
- Add ECN _DSM reference doc name and its URL.
- Separate implement acpi_get_cpu_acpi_id() in each arch which supports
  ACPI.
- Refine commit-log

Chengwen Feng (3):
  ACPI: Refactor get_acpi_id_for_cpu() to acpi_get_cpu_uid() on non-x86
  x86: Implement acpi_get_cpu_uid()
  PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform

 Documentation/PCI/tph.rst          |  4 +--
 arch/arm64/include/asm/acpi.h      | 16 +---------
 arch/arm64/kernel/acpi.c           | 16 ++++++++++
 arch/arm64/kernel/acpi_numa.c      | 14 +++++++++
 arch/loongarch/include/asm/acpi.h  |  5 ---
 arch/loongarch/kernel/acpi.c       |  9 ++++++
 arch/riscv/include/asm/acpi.h      |  4 ---
 arch/riscv/kernel/acpi.c           | 16 ++++++++++
 arch/riscv/kernel/acpi_numa.c      |  9 ++++--
 arch/x86/include/asm/cpu.h         |  1 -
 arch/x86/include/asm/smp.h         |  1 -
 arch/x86/kernel/acpi/boot.c        | 20 ++++++++++++
 arch/x86/xen/enlighten_hvm.c       |  5 +--
 drivers/acpi/pptt.c                | 50 ++++++++++++++++++++++--------
 drivers/acpi/riscv/rhct.c          |  7 ++++-
 drivers/pci/tph.c                  | 16 +++++++---
 drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++--
 include/linux/acpi.h               | 11 +++++++
 include/linux/pci-tph.h            |  4 +--
 19 files changed, 158 insertions(+), 56 deletions(-)

-- 
2.17.1


