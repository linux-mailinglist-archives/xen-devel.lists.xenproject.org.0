Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6124378F7BB
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 06:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594195.927428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwFA-0008Sw-06; Fri, 01 Sep 2023 04:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594195.927428; Fri, 01 Sep 2023 04:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwF9-0008Qx-Te; Fri, 01 Sep 2023 04:58:51 +0000
Received: by outflank-mailman (input) for mailman id 594195;
 Fri, 01 Sep 2023 04:58:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=am4h=ER=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qbwF8-0008Qn-0v
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 04:58:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e89::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bd819c1-4884-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 06:58:47 +0200 (CEST)
Received: from MW4PR03CA0284.namprd03.prod.outlook.com (2603:10b6:303:b5::19)
 by DM6PR12MB4154.namprd12.prod.outlook.com (2603:10b6:5:21d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 04:58:41 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::57) by MW4PR03CA0284.outlook.office365.com
 (2603:10b6:303:b5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21 via Frontend
 Transport; Fri, 1 Sep 2023 04:58:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Fri, 1 Sep 2023 04:58:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 23:58:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 23:58:39 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 23:58:37 -0500
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
X-Inumbo-ID: 3bd819c1-4884-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ws0gXHjfhEZFyh53YRtVITL4wmMFZj7IomdcGqV+CQ8ygzWF2bL9zEwDklm1+pU+5C9alqhb6xmLvNTslwYdZ2ahqcnTZ7nCb/BqDvbBWUi+REuke3jtwmPImPIqExEG+cAQcMZxiNp674LpPSrSvtPvrLvSNqJe8DA2tPMbK+F6r4uX2gOwS5428l6moOT8ARdHt1L3hdUrTwBplUkJNmzB9IbbCi0kpEJnx3N16lheLy/47am2sG9h2kVoGADw3UeSo4vIv8vz4qYmyOgr8jwWPzZ7lSWR4d+2aXyC96mJfUAxHQOP53fvIGTyKSRvIaPaZMl0WCkMhoFOFWDnTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+C51D0xK4gKlj0FHSjdsmIYag0hca3KTphOGv1GNRoo=;
 b=Wl4+J33TGdaJoVnlJC3q5wBy2d3Brj+gm3hLYwWz4k3XNaVCnVw1agxghDtuTKHQAVPHSjypC0OXzA+CQITr8aTw1h1MvUGJBfdoZuJG7DsRKiH0Zn9fD2SU+1hu1lig+Je4Wqu0JQukbGXVMZT369j7wUgwiUewWGPLo0kIxrzZBevTGdfDcS/nIi7nwk+1hHUrgmRd4C0ep9Agx7/MFaystP9pkOK12ZI8agZPx+Da0z9I5M30buwceH+dkKEyE8zeSA/1frKX3eQbHw/IKvuxRtzCnaHzij02Ad7YjO0hxzeejJ3SNdM0R9jAeTzDidAINEsNzRHeiZwaO8L/3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+C51D0xK4gKlj0FHSjdsmIYag0hca3KTphOGv1GNRoo=;
 b=sRAftn0EPOlykcO3DIF9wBELkuLa2G3jVRp97sX5nzf4N81G2kTYj7Cfto7+jRnyhzttwQ0qRKRDWnIgr7VM7FeG3yzcBTBNSEULMpoUxTMK9k/33Dfiak31cIU9jm6e1qLZL2Y2MPEhhxpq6MBqplZe34vxC8XH+CSDFq+0EYQ=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v5 0/5] vPCI capabilities filtering
Date: Fri, 1 Sep 2023 00:57:27 -0400
Message-ID: <20230901045742.235975-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|DM6PR12MB4154:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e2a0d1-d148-4729-52b8-08dbaaa81c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jGnP8c/JylRTOyxh0MgvWdWRXf2TgSt0OzohCTf+xhYlH+LrC/pQtEk1XoCwAZ5lUyaI+LpDZTLeMeqZyY29KDcZpCjw83hwSqAeM2JF1zMuNL2ksvM8U/Z3HxHhOC0E1Qar6iM6XL61pct0GBZ/n15MEtnEenZffObXH8Gq1jCn9BKYm+D1BUKelBInH0wqoPljF5EJHdmsXNV6XjkMx2IYuu25NmrX3g1lE29GBmgBHOoZymE6F68+vZxwmr+8/LcR5okHgLCcno1+eQ3zI5CTLLbu7aCNg7tmD+1fYuWqvd6qT0wR/j0MMd2LoJDKQAQTGOxirMSrN9nchsEhEmfv0F5u/CKln2d9xi92qYGIPKEQThyNZukWZTcf3Q0q1XSuI67GCtCDza3OlkZpz8ZjYOaohfj/sMy70nlPe5W/yxUhpNlvhKMcpe+WKdSHSHGW8DPkVmUwypqoIpE/xR2pg+fzx9HxSCgiWw5K2auW6t9VsS3VorPkReFhlzTTZRk5H4iSHrOjtEDV8SPVbsh4zvnTuuAASNSuEJEpZ4LMhveLWcFBLqiiEUoYMl8qbnVKQHkXOUgvdBnA0U5BGKfZpL3+sVsty4sRFkRLNmbA8kNcF6PzmdRYZZc7ezaTsKzKlzLrvrKjDDSMHhINO3xJMHvcCUZeUqM+Ou4iah2m07hWFzUViZhcZ5wYFtVRWDZTfVUQEtWFZyyLc9R7RQ9Jas4IZTtY4CCXeQyPoltA7Ow+w3r2UutpJkzHjrfd+yF/gORCy7h5JVzNwLduBA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(1800799009)(186009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(40480700001)(7416002)(66899024)(2906002)(6916009)(316002)(41300700001)(5660300002)(44832011)(40460700003)(8676002)(4326008)(8936002)(36756003)(86362001)(356005)(6666004)(966005)(81166007)(478600001)(82740400003)(1076003)(2616005)(426003)(336012)(83380400001)(26005)(70586007)(70206006)(36860700001)(47076005)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 04:58:40.6069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e2a0d1-d148-4729-52b8-08dbaaa81c34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4154

This small series enables vPCI to filter which PCI capabilities we expose to a
domU. This series adds vPCI register handlers within
xen/drivers/vpci/header.c:init_bars(), along with some supporting functions.

Note there are minor rebase conflicts with the in-progress vPCI series [1].
These conflicts fall into the category of functions and code being added
adjacent to one another, so are easily resolved. I did not identify any
dependency on the vPCI locking work, and the two series deal with different
aspects of emulating the PCI header.

Future work may involve adding handlers for more registers in the vPCI header,
such as VID/DID, etc. Future work may also involve exposing additional
capabilities to the guest for broader device/driver support.

v4->v5:
* drop ("x86/msi: remove some unused-but-set-variables") as it has been
  committed
* add ("xen/pci: update PCI_STATUS_* constants")
* squash ro_mask patch

v3->v4:
* drop "xen/pci: address a violation of MISRA C:2012 Rule 8.3" as it has been
  committed
* re-order status register handler and capabilities filtering patches
* split an unrelated change from ("xen/pci: convert pci_find_*cap* to pci_sbdf_t")
  into its own patch
* add new patch ("x86/msi: rearrange read_pci_mem_bar slightly") based on
  feedback
* add new RFC patch ("xen/vpci: support ro mask")

v2->v3:
* drop RFC "xen/vpci: header: avoid cast for value passed to vpci_read_val"
* minor misra C violation fixup in preparatory patch
* switch to pci_sbdf_t in preparatory patch
* introduce status handler

v1->v2:
* squash helper functions into the patch where they are used to avoid transient
  dead code situation
* add new RFC patch, possibly throwaway, to get an idea of what it would look
  like to get rid of the (void *)(uintptr_t) cast by introducing a new memory
  allocation

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg01281.html

Stewart Hildebrand (5):
  xen/pci: convert pci_find_*cap* to pci_sbdf_t
  x86/msi: rearrange read_pci_mem_bar slightly
  xen/pci: update PCI_STATUS_* constants
  xen/vpci: header: status register handler
  xen/vpci: header: filter PCI capabilities

 xen/arch/x86/msi.c                         | 62 +++++---------
 xen/drivers/char/ehci-dbgp.c               |  3 +-
 xen/drivers/passthrough/amd/iommu_detect.c |  2 +-
 xen/drivers/passthrough/ats.c              |  4 +-
 xen/drivers/passthrough/ats.h              |  6 +-
 xen/drivers/passthrough/msi.c              |  6 +-
 xen/drivers/passthrough/pci.c              | 21 ++---
 xen/drivers/passthrough/vtd/quirks.c       | 10 +--
 xen/drivers/passthrough/vtd/x86/ats.c      |  3 +-
 xen/drivers/pci/pci.c                      | 52 +++++++-----
 xen/drivers/vpci/header.c                  | 94 ++++++++++++++++++++++
 xen/drivers/vpci/msi.c                     |  4 +-
 xen/drivers/vpci/msix.c                    |  4 +-
 xen/drivers/vpci/vpci.c                    | 58 +++++++++++--
 xen/include/xen/pci.h                      | 14 ++--
 xen/include/xen/pci_regs.h                 | 10 +++
 xen/include/xen/vpci.h                     | 15 ++++
 17 files changed, 255 insertions(+), 113 deletions(-)


base-commit: 6621932264e3e86df3913db4249ecd3eb100b13f
-- 
2.42.0


