Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF896B07F77
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045771.1415968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9Zx-0007Gm-Ox; Wed, 16 Jul 2025 21:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045771.1415968; Wed, 16 Jul 2025 21:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9Zx-0007FE-Ka; Wed, 16 Jul 2025 21:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1045771;
 Wed, 16 Jul 2025 21:22:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9Zv-0007F2-Mh
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:16 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [2a01:111:f403:2416::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef31ac8b-628a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 23:22:12 +0200 (CEST)
Received: from CH0PR03CA0265.namprd03.prod.outlook.com (2603:10b6:610:e5::30)
 by SJ5PPF09E5F035B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::988) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 16 Jul
 2025 21:22:07 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::a) by CH0PR03CA0265.outlook.office365.com
 (2603:10b6:610:e5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via Frontend Transport; Wed,
 16 Jul 2025 21:22:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 21:22:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:03 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:02 -0500
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
X-Inumbo-ID: ef31ac8b-628a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKGftOvDFXHg9NVuDq8kOa3pbAdcp/csOQjACsH1qzBz0ru84HjthD+VTtDH5pkHy1ply28Pwl/48viIQi+exLNqvqqapxOppc9zVUT/wJNK+x/Iew5HdOrUIICYQNNohB2+gBXwBCkIneQxDq+5/xceOUn8bRP2vQcncJAQcCPqqg5B4PhXB8jGqjIswDCwcUWX/4Z2TjWnWSwhkzYK8FnaGtOyZygTJd0GRUjafPaIdVfk7QfW/n0E6Tn7vmfJ5c5GOykTfQSBCPXOzf5LBsrz/oeGAAQ3OyJLzuEdEllbjgnjJ5ShxL0Ba5CCLmEl/PNsMFN6VBt0qZcM/80+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3zaUKuZ2JZMAJkglbfMNQ+huV44ZBBTUcAVJjiLang=;
 b=n8zStnHyIwGY9AxIuwynl5dVp0G2W6THW4V7xXANKRRa46zK3ebKipadO6X3MTciFED2oV4kQFICZ8L58e9J4dVP4hlkmnOy07faMMXinbxI+WiV6VkTljZB05vQtwip5VU9TTFsJJCMuom4S7l98XD5uIjgrtzymsIw2O9TenwTZsoIyYx+ZicXuEeR/eLu5CKylH48WCGg2g88AJGvSOKObdyrUNLahzThBXzcqfUrGGRHcoO2TZjGaEMAlAytmyoGuerG7mBr73QtukoXi4/C0QjeSzhsOxCxeaI0tnb+njgjbJVMACPs9qchnWRMEdwc1oVUcy6BUgcFI6mwTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3zaUKuZ2JZMAJkglbfMNQ+huV44ZBBTUcAVJjiLang=;
 b=fh5Gj6zQds/kDuEyhO6r+/OKjMNtbuyccssEAM2vyKtYZubnWwLJCyzcpAS+UyOkTDT5C8B07QfSFBqSn1eD/UShZ7IQlyTyBBkyZ2njjE0U8PpPXW3vLEWRWgF88hW2qO7PB47qPZpReT2+pCl3aWmH4T8TUOnIZBjq+fecJvM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 00/17] XSM changes for split hardware / control domain
Date: Wed, 16 Jul 2025 17:14:47 -0400
Message-ID: <20250716211504.291104-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|SJ5PPF09E5F035B:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8277ad-a1cc-4a6f-fb0e-08ddc4aed13e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zmmDAFe16Io/fz9UU1dp+4Kv6kBTO++moL/odFWYbuzfEUuCFZz1rrfq3GWU?=
 =?us-ascii?Q?BXajYNGXn5CSmZsoGBHVDxtVMwgJxekzp0ttBylgswgx4E0P2FnOAv111IDA?=
 =?us-ascii?Q?r6r0iIW/e6QZ8pCdmH9adkdoNKKjReBBCabEasSELqwlhKjKpsVen1FDjosS?=
 =?us-ascii?Q?E8gjAtJRWIE/TuARgZej6LgeE3jCQrjJOKL6MdjYKfSFgh0xNziUm5tPMu/N?=
 =?us-ascii?Q?xqmK1pWv5F65/Ilr+nQyeUcwzWf3LNVy5YlqPHjBuHUd2d1Oo0k5CLs2GyxK?=
 =?us-ascii?Q?b/bIbuA8p9E78kjWBu4f0nfaLiHyzf/0SUoowhx4U3LY1W3VS8ZLWHaqvnL2?=
 =?us-ascii?Q?7sG0ZEar+mlAj4mIO4RQVqVicbiryt6h7ta2u1G4s4ujeplcbxcK6EkiOrY8?=
 =?us-ascii?Q?GYd9sqnFLXAs2sjzpcrXOTtvYtc4jIvihr+KTtPMyvqBT2trfmdVyIqPQbfr?=
 =?us-ascii?Q?UDi4yXfZFg/ZYfaaFKMJr4zxEbjGsvJW/s1FaDk+S789hRbCoSWALtfEuDid?=
 =?us-ascii?Q?y4LakuZ/96HKcYzgCKXC+KVy+dCpX64D8LmL9q+RRM6I+D67lCj6Ije8JG1M?=
 =?us-ascii?Q?XlYN+czNWIdRWA3XGfENTVErUtngVrHcBjyp/HW4sWwYOIF148w6Lm0cqe6g?=
 =?us-ascii?Q?jt9mUE70sLt9hwvqD3QVvaR5E8fx9y8d/BmKvnhC2ipRLN2Q/IzOMrX9uCCy?=
 =?us-ascii?Q?vigasbZC08Hu/RcMcqQkZxKThdwicdrJvC4Qbi3+xoCUKWiFAZWjAf0TgPB/?=
 =?us-ascii?Q?qscjbDZ77d7csKzuXJPJugCJeCxljJP7N+N/OMaNngpWwrDF8Ny6+CVQ9Pje?=
 =?us-ascii?Q?NkAzzlObfWtQrYG/haoXVAMNuoXSyHYKRwMHjoXVA7zqUIZ+OS28SvXiXWpp?=
 =?us-ascii?Q?opjdODglON1uLlT1/ME8WmogSarF5HwwAE50QXcj7IrzwijeO7r2Itaf3uut?=
 =?us-ascii?Q?5BAQu1Zl0fE3o8+ZjSMoVMLzV1vqg35ZXd03w1x39y5cFWG+yv2DpCX4H0bD?=
 =?us-ascii?Q?+ILHIKInF2diGwAh9wjaD7zb7Di8Rm/tFrAo0O4bmk7TdV32hfblfTMYcxHj?=
 =?us-ascii?Q?npBZ25sV34Ee3kSlkqHFzfaqeTAwmLw7j6rDc1sIxsNlZYBQ54VaKZWxy9S7?=
 =?us-ascii?Q?3+cj0Rb5QHHg5hrPxPg7Qq0I6F/Bo95CSmf8n636qlusVfZEkloyI9xm59xx?=
 =?us-ascii?Q?Ykmh4+5b+FYAiDyK7dLbx3NhQ4DOr34B6qCwuLub12oc9doyT9sv5bZqfBeA?=
 =?us-ascii?Q?uiEGqdsruPbgNI/sxaMFGQG0fpkhPcZ03HEbdpUoFRR2XjMYTbGKIvICu9G8?=
 =?us-ascii?Q?yBDdFjSYnVADMevyu9zSVYG99C2s7ejt0eWeSos+Dj679FZ3HA1gcUOyj5m8?=
 =?us-ascii?Q?80+1cK7j0f2THRw7CJFsi4g7VDOwMPs0J/4Bta7kGwEAqowVdAmQfeIbhG7O?=
 =?us-ascii?Q?EQpyFFRAazuxJY/WE2W7Am9gVxUq9UVoxZ7mHxxpbGMq61ZQXgt8kolweD8e?=
 =?us-ascii?Q?ZKeU7Z0pEmSQpRsJWI2XEEdMRXTTQKqAQKPj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:06.9605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8277ad-a1cc-4a6f-fb0e-08ddc4aed13e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF09E5F035B

Theses are the broad changes needed for a split hardware / control
domain.  I'm mainly focused on the XSM changes, but there are additional
xenstored and init-dom0less changes to make things work.

An earlier posting gave device_model privileges to hardware domain.  For
this posting, it was split out into a new capability.  This way the
operator can choose where to run the device models without making the
hardware domain have the permissions.

The first patch add XSM_HW_PRIV for the hardware hypercalls.  In this
posting, the control domain cannot call these hypercalls.

There is also a new XEN_DOMCTL_CDF_not_hypercall_target flag.  This is
used to mark a domain that cannot be the target of hypercalls.  This is
useful for ensuring a domain has freedom from interference from control
and device model domains.  The control domain can still issue
XSM_DM_PRIV hypercalls.

SILO is changed to allow hardware and xenstore to service domUs.
Xenstore and hardware will use grants for PV interfaces.

xenstored runs in the xenstore domain.  C xenstored is updated to read
the event channel from the domU's grant.  C xenstored must also be used
since it uses grants instead of foreign mapping.

init-dom0less is run from control domain.  auto-introduction of domains
is needed for this to work.  init-dom0less issues xs_introduce_domain
over the xenbus, so it must be functional for control to issue it.

The special casing in "xsm/dummy: Allow HVMOP_get_param for control
domain" is needed for init-dom0less to know if it should or should not
configure xenstore for dom0less xen.enhanced = "no-xenstore".

There are some cosmetic errors from xl related to SYSCTL_physinfo.
libxl: error: libxl_utils.c:818:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus

Jason Andryuk (17):
  xen/xsm: Add XSM_HW_PRIV
  xsm/silo: Support hardware & xenstore domains
  xen: Add DOMAIN_CAPS_DEVICE_MODEL & XEN_DOMCTL_CDF_device_model
  xen: Introduce XEN_DOMCTL_CDF_not_hypercall_target
  xen/dom0less: Workaround XSM for evtchn_alloc_unbound
  xen/xsm: Expand XSM_XS_PRIV for untargetable domains
  xsm/dummy: Allow HVMOP_get_param for control domain
  public/io: xs_wire: Include event channel in interface page
  xen/dom0less: store xenstore event channel in page
  tools/xenstored: Read event channel from xenstored page
  xen: Add capabilities to get_domain_state
  tools/manage: Expose domain capabilities
  tools/xenstored: Delay firing special watches
  tools/xenstored: Auto-introduce domains
  tools/init-dom0less: Factor out xenstore setup
  tools/init-dom0less: Configure already-introduced domains
  tools/init-dom0less: Continue on error

 docs/misc/arm/device-tree/booting.txt   |  6 ++
 tools/helpers/init-dom0less.c           | 78 +++++++++++++++----------
 tools/include/xenmanage.h               | 14 ++++-
 tools/libs/manage/core.c                | 21 +++++--
 tools/ocaml/libs/xc/xenctrl.ml          |  2 +
 tools/ocaml/libs/xc/xenctrl.mli         |  2 +
 tools/xenstored/core.c                  |  7 ++-
 tools/xenstored/core.h                  |  1 +
 tools/xenstored/domain.c                | 65 ++++++++++++++++-----
 tools/xenstored/domain.h                |  2 +-
 xen/arch/arm/domain.c                   |  4 +-
 xen/arch/arm/platform_hypercall.c       |  2 +-
 xen/arch/x86/msi.c                      |  2 +-
 xen/arch/x86/physdev.c                  | 12 ++--
 xen/arch/x86/platform_hypercall.c       |  2 +-
 xen/common/device-tree/dom0less-build.c | 25 ++++++++
 xen/common/domain.c                     | 11 +++-
 xen/drivers/passthrough/pci.c           |  5 +-
 xen/drivers/pci/physdev.c               |  2 +-
 xen/include/public/bootfdt.h            | 18 +++++-
 xen/include/public/domctl.h             | 13 ++++-
 xen/include/public/io/xs_wire.h         |  7 +++
 xen/include/xen/sched.h                 | 21 +++++++
 xen/include/xsm/dummy.h                 | 34 +++++++----
 xen/include/xsm/xsm.h                   |  1 +
 xen/xsm/silo.c                          | 15 ++++-
 26 files changed, 285 insertions(+), 87 deletions(-)

-- 
2.50.0


