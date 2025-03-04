Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAAFA4EBAB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 19:31:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901440.1309392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpX3K-0001Js-HZ; Tue, 04 Mar 2025 18:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901440.1309392; Tue, 04 Mar 2025 18:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpX3K-0001IQ-EU; Tue, 04 Mar 2025 18:31:38 +0000
Received: by outflank-mailman (input) for mailman id 901440;
 Tue, 04 Mar 2025 18:31:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6XUS=VX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tpX3I-0001IK-Ns
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 18:31:36 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2412::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4f59d8f-f926-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 19:31:33 +0100 (CET)
Received: from CH0PR04CA0110.namprd04.prod.outlook.com (2603:10b6:610:75::25)
 by PH7PR12MB5975.namprd12.prod.outlook.com (2603:10b6:510:1da::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 18:31:29 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::f4) by CH0PR04CA0110.outlook.office365.com
 (2603:10b6:610:75::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Tue,
 4 Mar 2025 18:31:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Tue, 4 Mar 2025 18:31:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 12:31:27 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 4 Mar 2025 12:31:26 -0600
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
X-Inumbo-ID: e4f59d8f-f926-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLm20TbOhM9BhZFYvPnoNv5mYk6U3WXBiBbqVJj9VvxBDXAmV7rgiv+ZMnE3FHvF/V/IEoWrj6Ey4qe75KMXhjTL2Uu687QfQB7rf1hLR3cfI7VIGclR6W1/B1m81fNw6uMiLwo40Nu7Z5RyVQyF5G/ClOXbfwNIHoJy3TATTuYqrlnoQ0j6RihAMz5dtjIDjLbLJ1wDWqdYY3VjAR8cwcGEnaZ41/FL3wfZ9gCmhp1UELuBIaomg0//sFYKObW4M+/VepjtFP70wchwryGq/kRXLA9P6bxKGD7ehQ7VAHeYHRy7FENU612PIFeVrl96kopQOXbil4SUNHUHE67Bjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sr/exzn/zaGlkOL4251661pAmCBBjUVg1sQ84QhZRNA=;
 b=hRdF5DkblYT0/Q/i9zZ4n5xh/P3DclYNrTpmYlLsRhIlTxJGgIIZlRfXAvOF84k0R8EoU22C+fva+mQClAmOnxiIRggGVdbmQtiHc11nsk3BJqqZ7GBSm1wM/r/qvcoDtcPLRuhjqNvVxAidwi5RVu0rbdssPR0m5uce1zW1T/wRS+x7fDkSkgzfdxwb+MyYeAxozzOlF5Bvfw7M4bxSgNzN1/idFHCKk23uE7cmwEUsyUIjWvrkwddeM5UzEb9lqjOklW1flB3FuKtZ8jebuLxoXH7pjrVbAGfEkKr8es2gdOAW5q+QHpkzqzZed8FY/SRqwzPl6EIdJILkUR6wig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sr/exzn/zaGlkOL4251661pAmCBBjUVg1sQ84QhZRNA=;
 b=V9xQL9KvjJJ7VWr4E9VD4o8q+UwHxnsOCPs/lkopNS7kHlu6MZBx8BvNhUZ8SDVwQoF1PvecvH9+KO3KwfvOgF8hN+ThVS+obk3uwsvykM1BGF263KHZmVu7bEnRkrW45Bv4UomeCOu6Yfxr7nIPlOqbZWtQMlISxz+JZTxwcvY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
Subject: [PATCH v1] xen: fusa: arch_specs: Definition of the Virtual Machines' roles
Date: Tue, 4 Mar 2025 18:31:15 +0000
Message-ID: <20250304183115.2509666-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|PH7PR12MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: e9cf4f15-0a74-4a49-8ee6-08dd5b4ac72f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LwKsgpF7Qzdx3jgm7DPidG7mM4p+PHcxh651BB9WaBfLKkRyzASsnvIXHIMF?=
 =?us-ascii?Q?Lon3BzmSDC4xcmubBP437CpCZDR2vddb4v/Xl0XOxP598PIBMPjPx5Bx2+Ay?=
 =?us-ascii?Q?LJ8xNrh+pT3/uzxSA3T2x8CGsJEfmIAFecxunjc7C56e8jCUDgv63vXIA04U?=
 =?us-ascii?Q?Lyubljk+aBP4EtpfIQWf2XwGW2nttjnjOJz67L70LT3dc3bebWfj8oOKM+8M?=
 =?us-ascii?Q?J438A6RP71v+jtwYLkbJZ2GUO5PjTI06+OCmLFoMbO69ImhAmL30eXGtfvVK?=
 =?us-ascii?Q?h4N6IO14KePNY4iFgf/7Pp0QkMVNC9QOJZEcLMt40zkFTOeA7kCAGDtIjiXT?=
 =?us-ascii?Q?hfbzjvryORWqAG41JmKCtIToguYxpR1iCvc/Re2a9iBB7PpnvrBVIt5uVmYs?=
 =?us-ascii?Q?YXYYkN3Ie4hzQm40lptN/Sb78herI3/HM+bnkbYVMovNg1HdDrCPs/O2IEpy?=
 =?us-ascii?Q?msrNqEa9Y9C9LXbAmc8Uiz6oAcato/eTa424i5bYNs40FA14iFRWH3dIrMzZ?=
 =?us-ascii?Q?SFL5YB5VZuGtMPq8xaCXNBaAPZoGvzE43ElVVLW42jKjKu9iSql207HnRsm0?=
 =?us-ascii?Q?P4UrVhVS0Wwa+B4TOUWe3GH3SQwur6ApA2zqrOpO9pdcKzm++0tqvFqejuxL?=
 =?us-ascii?Q?gtoh2maRbpm4rtNl0JhFSQxckQKa1QPiJWUSAk5sit8A494HKMBv3HvXfkN2?=
 =?us-ascii?Q?n9iCIaxihBcnzqpx6IWiOpaiXVnpHcorGEzf//JrvszshXaNDIxqKjCAwIX+?=
 =?us-ascii?Q?kB3JhZi4TDFb3Oq17zLFMGrHOWdkSArTPIYlAWpgQCO3sdKSKZRtgegtA3eY?=
 =?us-ascii?Q?CfaHq/VnswyIyQQ12AdbQzboQgKziKRIcdmXh4fn3uEVEesuClS6RfCYE8i3?=
 =?us-ascii?Q?9vvfeegwiSWB3XUKnicUmj8/kfzSHq6B9a9zwE2086gRs88Jkf9p6apECczv?=
 =?us-ascii?Q?Rfn+RGvklC0yWW291N1HqxlabAJ6PLBJ1ofn5+0Cp+X55DBgxRALDc1ln5KM?=
 =?us-ascii?Q?zmbsK/yidao2oL5YdS7BoQ0F9egKkeDNx55jZm88hWNmXmLrePX5/LKtva5P?=
 =?us-ascii?Q?v1LCGS2WfOkIuHVF0N+d5LTPO924h7LZ2RIqLycTpZ+VTHJ3xRruaXrSkr4l?=
 =?us-ascii?Q?sZlo1RWhqCSIg4ElFwPFgtVo8a8NkHsNxXEJrF78A160bGizqhsdp1ewy6TH?=
 =?us-ascii?Q?ekIpOfV9wcHmg0wJxwbM7Itj9YAl0+9Nnu4Bf3CAW+JXUYVBoIasmtV02g9d?=
 =?us-ascii?Q?pqQaBp0alfu2sGdglYs2kzp1fE+x3lNFel092rTzDK7vaD7KTfJpRBDzbCPu?=
 =?us-ascii?Q?klczCY9LSKnpxvGZJN79MRNiwULuOlrCsaStv6m+3c9Lp4ybIFZJmD1rFL7n?=
 =?us-ascii?Q?EewnpzTRNu1EmygI3YX86WQFOX4kFptvNxNVs/Vs9CL8qGFWtyttHGwhMXg2?=
 =?us-ascii?Q?+ko3FO44dwqB/D71zm56DjwzyRB1Tdn96j3Z72Hm8ir5P5MS2Uc+/liS4u75?=
 =?us-ascii?Q?ZXCPDUxhydlsUqk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 18:31:28.3343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9cf4f15-0a74-4a49-8ee6-08dd5b4ac72f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5975

From: Stefano Stabellini <stefano.stabellini@amd.com>

Define "Hardware Domain", "Control Domain", "DomUs", "SafeVMs" and
"UnsafeVMs".

Explain the limitations that VirtIO introduces and the way they affect
the defined roles.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 docs/fusa/arch_specs/roles.rst | 200 +++++++++++++++++++++++++++++++++
 docs/fusa/index.rst            |   1 +
 2 files changed, 201 insertions(+)
 create mode 100644 docs/fusa/arch_specs/roles.rst

diff --git a/docs/fusa/arch_specs/roles.rst b/docs/fusa/arch_specs/roles.rst
new file mode 100644
index 0000000000..0b3fe821c3
--- /dev/null
+++ b/docs/fusa/arch_specs/roles.rst
@@ -0,0 +1,200 @@
+===============================
+Xen Domain Roles and Privileges
+===============================
+
+Roles
+=====
+
+We define the following roles that Xen domains can have:
+- Hardware Domain
+- Control Domain
+- DomU
+
+In addition, we classify domains based on the criticality of the tasks
+they perform:
+- SafeVM
+- UnSafeVM
+
+DomU
+----
+
+A DomU is a regular domain without extra privileges to perform
+operations that affect other domains or the entire platform. A DomU is
+therefore unprivileged and can only affect itself.
+
+Hardware Domain
+---------------
+
+The Hardware Domain is a domain that has direct access to all hardware
+peripherals by default, except for those controlled by Xen (CPU, MMU,
+IOMMU, Interrupt Controller, Timers, UART). Hardware resources can be
+directly assigned to other domains ("passthrough"), but the default is
+that they get assigned to the Hardware Domain. As such, there can only
+be one Hardware Domain in the system. The Hardware Domain is not
+privileged: it cannot perform operations that affect other domains or
+the entire platform.
+
+In cases where VirtIO is used to share access to physical devices among
+multiple domains, the Hardware Domain requires some limited privileges
+to run the VirtIO backends.
+
+Control Domain
+--------------
+
+The Control Domain has full privileges over the system. As such, it can
+perform privileged operations, typically implemented as hypercalls, that
+affect other domains and even the entire platform, such as platform
+reboot. There can only be one Control Domain in the system. A
+non-exhaustive list of these operations follows:
+
+- Reboot other domains
+- Reboot and shutdown the platform
+- Suspend/resume other domains
+- Pause/unpause other domains
+
+The Control Domain is optional.
+
+SafeVMs and UnSafeVMs
+---------------------
+
+A SafeVM is a domain running a safety-critical task. An UnsafeVM is a
+domain running non-safety-critical software only. No safety-critical
+tasks are running in the UnsafeVM.
+
+The Control Domain must be a SafeVM because the Control Domain has
+enough privileges to affect the entire system.
+
+Without VirtIO (see below), both the Hardware Domain and DomUs can be
+SafeVMs or UnsafeVMs. There are no restrictions. For example, the
+following configuration is compatible with safety:
+
+- Hardware Domain: UnsafeVM
+- 2x DomU: SafeVMs
+- 2x DomU: UnsafeVMs
+
+Privileges
+==========
+
+Full Privileges
+---------------
+
+A domain with full privileges has unrestricted access to all services
+provided by Xen, including the ability to perform operations that impact
+other VMs and the entire platform. Only one domain holds these full
+privileges: the Control Domain.
+
+Unprivileged
+------------
+
+An Unprivileged domain lacks special access rights, allowing it to
+perform only operations that affect itself without impacting other
+domains. For example, an Unprivileged domain cannot map the memory of
+another domain.
+
+VirtIO Privileges
+-----------------
+
+Domains running VirtIO backends, such as QEMU, require specific
+privileges over domains with VirtIO frontends to enable proper
+functionality. For instance, they need permission to map the memory of
+the domain with the VirtIO frontend. These additional privileges are
+necessary for standard VirtIO operation but can be removed when using
+the VirtIO extensions described in the VirtIO chapter. This is the list
+of VirtIO privileges:
+- mapping memory of VirtIO frontend domains (foreign map hypercall)
+- device model hypercalls targeting VirtIO frontend domains
+
+VirtIO
+======
+
+VirtIO is a specification and set of drivers to share a physical device
+among multiple domains. For example, assuming the Hardware Domain has
+access to an Ethernet device, VirtIO provides a way for the Hardware
+Domain to allow one or more DomUs to access the Ethernet device.
+
+VirtIO is based on a frontend/backend architecture: the frontend is a
+driver similar to a regular Ethernet device driver (using Ethernet as an
+example), running in the DomU. The backend is a "proxy" driver running
+in the same domain as the device driver and have direct access to the
+device. That domain is typically the Hardware Domain because it is the
+default domain for hardware assignment, but it is also possible to run
+VirtIO backends in other domains, provided they have been configured with
+passthrough access to a physical device. These other domains are called
+"Driver Domains," and the limitations discussed in the context of VirtIO
+for the Hardware Domain also apply to Driver Domains.
+
+There are multiple issues in VirtIO that affect freedom from
+interference, so deploying VirtIO introduces limits on the configuration
+regarding what domains can run safety-critical workloads.
+
+It is important to note that VirtIO is not the only way for domains to
+communicate with each other. Specifically, there are other protocols
+such as Argo and plain shared memory that do not have the same
+interference concerns.
+
+FFI: Shared Memory and Interrupts
+---------------------------------
+
+All VirtIO protocols are based on ring buffers over shared memory,
+called "VirtQueues." Although there are well-known methods to set up
+ring buffers over shared memory that are free from interference, in
+practice, the existing VirtIO specification and current frontend/backend
+driver implementations do not follow these best practices. Thus, the
+ring buffers over shared memory can be a source of interference.
+
+Given the current state of the VirtIO specification and drivers, it is
+recommended that both VirtIO frontends and backends run in UnsafeVMs
+only. This way, SafeVMs will not be affected by interference caused by
+VirtIO protocols.
+
+As ring buffers exist over memory shared between domains, it is the
+domains' responsibility to ensure they are safe. This is outside of
+Xen's responsibility, and out of scope for this document.
+
+FFI: Memory Mappings
+--------------------
+
+VirtIO expects the backend to access ("map") arbitrary memory addresses
+passed by the frontend. In other words, the backend needs to map any
+memory of the frontend, which is a privileged operation in Xen.
+
+Xen implements a Xen-specific extension to VirtIO to address this issue:
+"VirtIO with Grants."
+
+Xen has a feature called the "grant table" that guests can use to
+voluntarily share individual memory pages with other domains. This way,
+the backend does not need the privilege to map any memory page of the
+domain running the frontend, as the frontend whitelists pages for the
+backend to access.
+
+Unless "VirtIO with Grants" is used, to enable VirtIO, a domain with
+VirtIO backends (the Hardware Domain or a Driver Domain) is given the
+extra privilege of being able to map any memory of domains with VirtIO
+frontends.  As this is a source of interference, only UnsafeVMs can run
+VirtIO frontends without "VirtIO with Grants".
+
+FFI: Synchronous Emulation
+--------------------------
+
+VirtIO expects certain operations to be synchronous: the frontend
+virtual CPU requesting the operation is fully blocked until the backend
+completes the operation. If the backend does nothing, the frontend vCPU
+remains blocked. This is a source of interference.
+
+When VirtIO is enabled, the domain with the backends (Hardware Domain or
+Driver Domain) implements these synchronous operations for domains
+running VirtIO frontends.
+
+Xen implements a Xen-specific extensions to VirtIO to address this
+issue: "non-blocking VirtIO." Two extra virtio-pci registers are
+provided, allowing the frontend to perform non-blocking operations. By
+using the two Xen-specific non-blocking registers, the frontend virtual
+CPU doesn't have to block while waiting for the backend to complete the
+operations.
+
+Unless "non-blocking VirtIO" is used, to enable VirtIO, a domain with
+VirtIO backends (the Hardware Domain or a Driver Domain) is given the
+extra privilege of being able to implement these synchronous operations
+for domains running VirtIO frontends. As this is a source of
+interference, only UnsafeVMs can run VirtIO frontends without
+"non-blocking VirtIO."
diff --git a/docs/fusa/index.rst b/docs/fusa/index.rst
index 5f1e8acfc4..9d989f5105 100644
--- a/docs/fusa/index.rst
+++ b/docs/fusa/index.rst
@@ -7,3 +7,4 @@ Functional Safety documentation
    :maxdepth: 2
 
    reqs/index
+   arch_specs/roles
-- 
2.25.1


