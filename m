Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49123960027
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 06:01:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783648.1192919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sinMu-0004IT-Uo; Tue, 27 Aug 2024 03:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783648.1192919; Tue, 27 Aug 2024 03:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sinMu-0004Fi-RB; Tue, 27 Aug 2024 03:59:44 +0000
Received: by outflank-mailman (input) for mailman id 783648;
 Tue, 27 Aug 2024 03:59:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CTq=P2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sinMt-0004Fc-78
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 03:59:43 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20630.outbound.protection.outlook.com
 [2a01:111:f403:2408::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c898783f-6428-11ef-a50b-bb4a2ccca743;
 Tue, 27 Aug 2024 05:59:40 +0200 (CEST)
Received: from SJ0PR03CA0105.namprd03.prod.outlook.com (2603:10b6:a03:333::20)
 by LV3PR12MB9402.namprd12.prod.outlook.com (2603:10b6:408:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 03:59:35 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::25) by SJ0PR03CA0105.outlook.office365.com
 (2603:10b6:a03:333::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Tue, 27 Aug 2024 03:59:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 27 Aug 2024 03:59:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 Aug
 2024 22:59:31 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 26 Aug 2024 22:59:30 -0500
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
X-Inumbo-ID: c898783f-6428-11ef-a50b-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuN+rw9jYy+MEwQQ2+1OXqI4sAeJrb7frlxQdFeFG+E9fAFgHz5bU7J9Omk6cyM9dIyuBIsIcpbv75F9OP2qse1PFqgtrdGtjWC3gPRKM0GmIWrkajmL3j8MPpmNAai9/Jy2SDb2QQqTzTRec9X5dcm3T2loi1l4BaNA3cn1JoYP1iaKqF03kYi5YQHUhmK4VJ3429FFaNMxCK3KwAR0hjsMPp7gjidk20dRPxITJVDsQlrcGYjFOtPIr8syvKGLPv3lqA/mWj9Um8yryFDGt0+v29tLwKLJWGqz3uda4r/R+m86vYXkxn1AIoW7oS4efF+eJPNQHoo4r5Nd3vw3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IqMMfnIc5ecUpspmlAb1DkocqqVnbAC5PoQJDH2z7Y=;
 b=WePohI+AXwC9F+bIhhZaAXuHqWBpenbXzZ3sJo6XS3VFnRAQdWPDD6qq+UFUO1xQQI8ckP1fziwc+7PxzE9RkioRgmQOJaF6LmAAk/W+X4iIhfZ2uZQqKoZSXt/m6D1MdvPD1TIBr43cv/vf5Bn/1OuihwBIpbelIcwJ4yUmbft2ayEodiyc8B/xTvG9SkninQRb9wznaAhHYyX11R9m3YpgYM8NPH2eMs6sr89JJNEFnDxNNvfB6zADQd1ZWDegP5SBbl9T2e5c2Am3JaRfZMtt0x5k6kVjiKpQTMj1A4DWZGcRABEg+FcBgm+nM2vqQ5RAJ25n2NNJPP/WekiTQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IqMMfnIc5ecUpspmlAb1DkocqqVnbAC5PoQJDH2z7Y=;
 b=vDkY3xgo7wLCo549m5YI5rm0bLHr1PW0hyHZi2Ybu7XSgzDcli0aVr1RqPfn1vBs7f58NFqIT8ifMu6Nbq9Im7sL29eIS4/KJcmtWMLuV2NtBaBRjOIY3LAMIDztufPoImrwh70c3BuTyN4apW0Ni9bxo0ZKZZvMCJjPVPQmOJU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v4] x86/msi: fix locking for SR-IOV devices
Date: Mon, 26 Aug 2024 23:59:28 -0400
Message-ID: <20240827035929.118003-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|LV3PR12MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: 2256a0ee-b7dc-4b14-8cfb-08dcc64ca910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R7uUuYI1LhwYAL1EBBK0EJSbmuY3zSDixThkKd35/2ptCLoMwPub4Hf6OIzX?=
 =?us-ascii?Q?6R1/3SsqawjWfRX/FCP4Ohb/56fGUo3LEkXdBxqq62wvyaFHivPsxRZqLLrh?=
 =?us-ascii?Q?3rn653W1mUfECw2Pb5OIzwQb2HLjBlxaMBriD0QmOExGAF6ZUjAy7Sxm7G1G?=
 =?us-ascii?Q?fT0YdlaWn/e0zvIT/j2xEDGzIwtCPZAs9zfRqIkQHxzRScHGYvbdtMlqjzjB?=
 =?us-ascii?Q?TMrqKeZ3IZfumi5XFj5mC/zzKpCLJatXScnDAdU0ChGHOYhS9ZEMiuyM3Lw2?=
 =?us-ascii?Q?kJ8futsMuGSMh/rXFCHvju+Z0F8BS/c3USZ6YnX+9IdTDR1lVpL6OPrNjony?=
 =?us-ascii?Q?1uMlEOz0fkOS3l+jtfFmL+IV9BNGkuV8zR3Y8YNsgsAX+bEukqGc931UK97r?=
 =?us-ascii?Q?b2F6bZX7y7dPKkK9mQ5Vq9580/xhsW5iW5AV+3F3WNEnGq7VvbrZuhVV5lbm?=
 =?us-ascii?Q?Gpfullok2OTtv0gTS2udcuDIbmkB7sUGC0qU12zqU+wXZWhulG15EETM4i0j?=
 =?us-ascii?Q?EvXDox4Ob18s/wqsYTE+/i4+Jgq43i8jpjy5vVKSGceRURFdjwOPoS9wBFbw?=
 =?us-ascii?Q?bHlR2NX/qAMpZdsjrwVNqDdF18zwZHdZRBQP8yOOKJeSEt0fNHUNI11q+fjf?=
 =?us-ascii?Q?J543esEJ+P8UNWuQK47LLj1S1CWjG3ttaOW75pBW2XaIH7aIERjT3sO8XCkm?=
 =?us-ascii?Q?+3wOTz4SUyXLx4hRVHhT5wWGMh4t6+sKH0Y9aYR8+5M1f4+lhs7DV35b9eHs?=
 =?us-ascii?Q?dE/xW6DLtj6BpJiNt2Ju+NvrhV0ka1nZeJIYWgDk6SY/9ocKofyOCY/3c5HQ?=
 =?us-ascii?Q?kfgDUxldgSq1yuIWXv0KJbrb7BrM5SgWGF2l8fNeCFfq2sidlnKthY3DA2/Y?=
 =?us-ascii?Q?RNWXLJZJ34fIfAq7G2G3/9Cow2BIzcQkNGO1pD7Vbl+T07HSLH3jkb8r+jxe?=
 =?us-ascii?Q?IgkITtxhK+ALcj/Ja8tpQw2cfZVwq0G/h7MqWZM1VXKV5lq1M+4Blky10PQu?=
 =?us-ascii?Q?LH8b0ixND0DxaGY3qDFTDetfBctZNTPCETWTluKSEdimdChg1rHzXzSsuEM7?=
 =?us-ascii?Q?02vSDMbuZ0/n0V25+aZMXECwiHkJ8vDlA/N/vU7MQ0P9Zsezh8+SbQNsDLWZ?=
 =?us-ascii?Q?BbHZ7ZGj+qiPrlKMVI2lFOpT9Gz95+GstgQgYSlriUoxAJ/AZfcBnHdaw/F9?=
 =?us-ascii?Q?y64KdWKeDZd6uKQnGD9QHzNtnZjAt3IzTYbVZcPZILahXeKzyefZwspbTvBr?=
 =?us-ascii?Q?RqeXMu5O2OUReyo0RklbXuS+RZMSAoxngz6EeuwAjRBSbKxxSPYyiSQMGQIJ?=
 =?us-ascii?Q?wwClJIVGX42LVVqdTyWViRO2RXmQolApka25RHPOPOU/uMYuhiXCQxKlmpV+?=
 =?us-ascii?Q?1RMUMJn16jvWJoWAqQl5Rke3UlpeVwCY2FS/veQTze3e9wFPykjEoSEdS2NB?=
 =?us-ascii?Q?yMXzSbANm/8KmWuIUKq2wcAguHVFI2cf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 03:59:33.4453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2256a0ee-b7dc-4b14-8cfb-08dcc64ca910
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9402

In commit 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci
structure") a lock moved from allocate_and_map_msi_pirq() to the caller
and changed from pcidevs_lock() to read_lock(&d->pci_lock). However, one
call path wasn't updated to reflect the change, leading to a failed
assertion observed under the following conditions:

* PV dom0
* Debug build (debug=y) of Xen
* There is an SR-IOV device in the system with one or more VFs enabled
* Dom0 has loaded the driver for the VF and enabled MSI-X

(XEN) Assertion 'd || pcidevs_locked()' failed at drivers/passthrough/pci.c:535
(XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Not tainted ]----
...
(XEN) Xen call trace:
(XEN)    [<ffff82d040284da8>] R pci_get_pdev+0x4c/0xab
(XEN)    [<ffff82d040344f5c>] F arch/x86/msi.c#read_pci_mem_bar+0x58/0x272
(XEN)    [<ffff82d04034530e>] F arch/x86/msi.c#msix_capability_init+0x198/0x755
(XEN)    [<ffff82d040345dad>] F arch/x86/msi.c#__pci_enable_msix+0x82/0xe8
(XEN)    [<ffff82d0403463e5>] F pci_enable_msi+0x3f/0x78
(XEN)    [<ffff82d04034be2b>] F map_domain_pirq+0x2a4/0x6dc
(XEN)    [<ffff82d04034d4d5>] F allocate_and_map_msi_pirq+0x103/0x262
(XEN)    [<ffff82d04035da5d>] F physdev_map_pirq+0x210/0x259
(XEN)    [<ffff82d04035e798>] F do_physdev_op+0x9c3/0x1454
(XEN)    [<ffff82d040329475>] F pv_hypercall+0x5ac/0x6af
(XEN)    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150

In read_pci_mem_bar(), the VF obtains the struct pci_dev pointer for its
associated PF to access the vf_rlen array. This array is initialized in
pci_add_device() and is only populated in the associated PF's struct
pci_dev.

Add links between the VF's struct pci_dev and associated PF struct
pci_dev, ensuring the PF's struct doesn't get deallocated until all its
VFs have been removed. Access the vf_rlen array via the new link to the
PF, and remove the troublesome call to pci_get_pdev().

Add a call to pci_get_pdev() inside the pcidevs_lock()-locked section of
pci_add_device() to set up the link from VF to PF. In case the new
pci_get_pdev() invocation fails to find the associated PF (returning
NULL), return an error.

In pci_remove_device(), handle an issue with a corner case when a PF is
removed with VFs enabled, then re-added with VFs disabled. During PF
removal, a buggy PF driver may fail to disable SR-IOV, leaving stale
dangling VFs. At least Linux warns in this case:

[  106.500334]  0000:01:00.0: driver left SR-IOV enabled after remove

If the PF is subsequently re-added with VFs disabled, the previously
associated VFs in Xen would not be backed by a device. Any attempt to
access the config space of the stale VF would be invalid. Avoid issues
in this case by removing the VFs right away when removing the PF. This
also happens to simplify the maintenance of the PF<->VF links since the
associated PF will always exist during the lifetime of a VF. Note,
however, if a PF is removed before the VFs, Xen will return an error
for the VF removals since they were already removed.

Fixes: 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci structure")
Reported-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Candidate for backport to 4.19

v3->v4:
* handle case when PF is removed with VFs enabled, then re-added with
  VFs disabled

v2->v3:
* link from VF to PF's struct pci_dev *

v1->v2:
* remove call to pci_get_pdev()
---
When I tested removing a PF with VFs enabled, then re-adding with VFs
disabled, I observed the following Xen crash when dom0 attempted to
access the config space of a stale VF:

(XEN) Assertion 'pos' failed at arch/x86/msi.c:1275
(XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Tainted:   C    ]----
...
(XEN) Xen call trace:
(XEN)    [<ffff82d040346834>] R pci_msi_conf_write_intercept+0xa2/0x1de
(XEN)    [<ffff82d04035d6b4>] F pci_conf_write_intercept+0x68/0x78
(XEN)    [<ffff82d0403264e5>] F arch/x86/pv/emul-priv-op.c#pci_cfg_ok+0xa0/0x114
(XEN)    [<ffff82d04032660e>] F arch/x86/pv/emul-priv-op.c#guest_io_write+0xb5/0x1c8
(XEN)    [<ffff82d0403267bb>] F arch/x86/pv/emul-priv-op.c#write_io+0x9a/0xe0
(XEN)    [<ffff82d04037c77a>] F x86_emulate+0x100e5/0x25f1e
(XEN)    [<ffff82d0403941a8>] F x86_emulate_wrapper+0x29/0x64
(XEN)    [<ffff82d04032802b>] F pv_emulate_privileged_op+0x12e/0x217
(XEN)    [<ffff82d040369f12>] F do_general_protection+0xc2/0x1b8
(XEN)    [<ffff82d040201aa7>] F x86_64/entry.S#handle_exception_saved+0x2b/0x8c

This crash is avoided by removing the VFs right away with the PF.
---
 xen/arch/x86/msi.c            | 33 +++++++++++----------
 xen/drivers/passthrough/pci.c | 55 ++++++++++++++++++++++++++++++++---
 xen/include/xen/pci.h         | 13 ++++++++-
 3 files changed, 80 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 0c97fbb3fc03..8d54f268dbbf 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -662,34 +662,31 @@ static int msi_capability_init(struct pci_dev *dev,
     return 0;
 }
 
-static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
+static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf,
+                            const struct pf_info *pf_info)
 {
+    pci_sbdf_t sbdf = PCI_SBDF(seg, bus, slot, func);
     u8 limit;
     u32 addr, base = PCI_BASE_ADDRESS_0;
     u64 disp = 0;
 
     if ( vf >= 0 )
     {
-        struct pci_dev *pdev = pci_get_pdev(NULL,
-                                            PCI_SBDF(seg, bus, slot, func));
         unsigned int pos;
         uint16_t ctrl, num_vf, offset, stride;
 
-        if ( !pdev )
-            return 0;
-
-        pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
-        ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
-        num_vf = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_NUM_VF);
-        offset = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_OFFSET);
-        stride = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_STRIDE);
+        pos = pci_find_ext_capability(sbdf, PCI_EXT_CAP_ID_SRIOV);
+        ctrl = pci_conf_read16(sbdf, pos + PCI_SRIOV_CTRL);
+        num_vf = pci_conf_read16(sbdf, pos + PCI_SRIOV_NUM_VF);
+        offset = pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_OFFSET);
+        stride = pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_STRIDE);
 
         if ( !pos ||
              !(ctrl & PCI_SRIOV_CTRL_VFE) ||
              !(ctrl & PCI_SRIOV_CTRL_MSE) ||
              !num_vf || !offset || (num_vf > 1 && !stride) ||
              bir >= PCI_SRIOV_NUM_BARS ||
-             !pdev->vf_rlen[bir] )
+             !pf_info->vf_rlen[bir] )
             return 0;
         base = pos + PCI_SRIOV_BAR;
         vf -= PCI_BDF(bus, slot, func) + offset;
@@ -703,8 +700,8 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
         }
         if ( vf >= num_vf )
             return 0;
-        BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
-        disp = vf * pdev->vf_rlen[bir];
+        BUILD_BUG_ON(ARRAY_SIZE(pf_info->vf_rlen) != PCI_SRIOV_NUM_BARS);
+        disp = vf * pf_info->vf_rlen[bir];
         limit = PCI_SRIOV_NUM_BARS;
     }
     else switch ( pci_conf_read8(PCI_SBDF(seg, bus, slot, func),
@@ -813,6 +810,7 @@ static int msix_capability_init(struct pci_dev *dev,
         int vf;
         paddr_t pba_paddr;
         unsigned int pba_offset;
+        const struct pf_info *pf_info;
 
         if ( !dev->info.is_virtfn )
         {
@@ -820,6 +818,7 @@ static int msix_capability_init(struct pci_dev *dev,
             pslot = slot;
             pfunc = func;
             vf = -1;
+            pf_info = NULL;
         }
         else
         {
@@ -827,9 +826,11 @@ static int msix_capability_init(struct pci_dev *dev,
             pslot = PCI_SLOT(dev->info.physfn.devfn);
             pfunc = PCI_FUNC(dev->info.physfn.devfn);
             vf = dev->sbdf.bdf;
+            pf_info = &dev->virtfn.pf_pdev->physfn;
         }
 
-        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf,
+                                       pf_info);
         WARN_ON(msi && msi->table_base != table_paddr);
         if ( !table_paddr )
         {
@@ -852,7 +853,7 @@ static int msix_capability_init(struct pci_dev *dev,
 
         pba_offset = pci_conf_read32(dev->sbdf, msix_pba_offset_reg(pos));
         bir = (u8)(pba_offset & PCI_MSIX_BIRMASK);
-        pba_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
+        pba_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf, pf_info);
         WARN_ON(!pba_paddr);
         pba_paddr += pba_offset & ~PCI_MSIX_BIRMASK;
 
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 5a446d3dcee0..97b3417252f7 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -341,6 +341,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
 
     list_add(&pdev->alldevs_list, &pseg->alldevs_list);
 
+    INIT_LIST_HEAD(&pdev->physfn.vf_list);
+
     /* update bus2bridge */
     switch ( pdev->type = pdev_type(pseg->nr, bus, devfn) )
     {
@@ -446,6 +448,10 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
 
     list_del(&pdev->alldevs_list);
     pdev_msi_deinit(pdev);
+
+    if ( pdev->info.is_virtfn )
+        list_del(&pdev->virtfn.entry);
+
     xfree(pdev);
 }
 
@@ -700,10 +706,31 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
          * extended function.
          */
         if ( pdev->info.is_virtfn )
+        {
+            struct pci_dev *pf_pdev;
+
             pdev->info.is_extfn = pf_is_extfn;
+            pf_pdev = pci_get_pdev(NULL,
+                                   PCI_SBDF(seg, info->physfn.bus,
+                                            info->physfn.devfn));
+            if ( pf_pdev )
+            {
+                pdev->virtfn.pf_pdev = pf_pdev;
+                list_add(&pdev->virtfn.entry, &pf_pdev->physfn.vf_list);
+            }
+            else
+            {
+                printk(XENLOG_WARNING "Failed to add SR-IOV device PF %pp for VF %pp\n",
+                       &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
+                       &pdev->sbdf);
+                free_pdev(pseg, pdev);
+                ret = -ENODEV;
+                goto out;
+            }
+        }
     }
 
-    if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
+    if ( !pdev->info.is_virtfn && !pdev->physfn.vf_rlen[0] )
     {
         unsigned int pos = pci_find_ext_capability(pdev->sbdf,
                                                    PCI_EXT_CAP_ID_SRIOV);
@@ -715,7 +742,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         {
             unsigned int i;
 
-            BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
+            BUILD_BUG_ON(ARRAY_SIZE(pdev->physfn.vf_rlen) !=
+                                    PCI_SRIOV_NUM_BARS);
+
             for ( i = 0; i < PCI_SRIOV_NUM_BARS; )
             {
                 unsigned int idx = pos + PCI_SRIOV_BAR + i * 4;
@@ -730,7 +759,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
                     continue;
                 }
                 ret = pci_size_mem_bar(pdev->sbdf, idx, NULL,
-                                       &pdev->vf_rlen[i],
+                                       &pdev->physfn.vf_rlen[i],
                                        PCI_BAR_VF |
                                        ((i == PCI_SRIOV_NUM_BARS - 1) ?
                                         PCI_BAR_LAST : 0));
@@ -818,6 +847,24 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
         {
+            ret = 0;
+
+            if ( !pdev->info.is_virtfn )
+            {
+                struct pci_dev *vf_pdev, *tmp;
+
+                /*
+                 * If a PF with VFs enabled is removed, then re-added without
+                 * VFs enabled, the previously associated VFs would no longer be
+                 * backed by a device. Remove the associated VFs right away.
+                 */
+                list_for_each_entry_safe(vf_pdev, tmp, &pdev->physfn.vf_list,
+                                         virtfn.entry)
+                    ret = pci_remove_device(vf_pdev->sbdf.seg,
+                                            vf_pdev->sbdf.bus,
+                                            vf_pdev->sbdf.devfn) ?: ret;
+            }
+
             if ( pdev->domain )
             {
                 write_lock(&pdev->domain->pci_lock);
@@ -826,7 +873,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
                 write_unlock(&pdev->domain->pci_lock);
             }
             pci_cleanup_msi(pdev);
-            ret = iommu_remove_device(pdev);
+            ret = iommu_remove_device(pdev) ?: ret;
             printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
             free_pdev(pseg, pdev);
             break;
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 63e49f0117e9..a24026d25148 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -150,7 +150,18 @@ struct pci_dev {
         unsigned int count;
 #define PT_FAULT_THRESHOLD 10
     } fault;
-    u64 vf_rlen[6];
+    union {
+        struct pf_info {
+            /* Only populated for PFs (info.is_virtfn == false) */
+            struct list_head vf_list;             /* List head */
+            uint64_t vf_rlen[PCI_SRIOV_NUM_BARS];
+        } physfn;
+        struct {
+            /* Only populated for VFs (info.is_virtfn == true) */
+            struct list_head entry;               /* Entry in vf_list */
+            struct pci_dev *pf_pdev;              /* Link from VF to PF */
+        } virtfn;
+    };
 
     /* Data for vPCI. */
     struct vpci *vpci;

base-commit: b8cdfac2be38c98dd3ad0e911a3f7f787f5bcf6b
-- 
2.46.0


