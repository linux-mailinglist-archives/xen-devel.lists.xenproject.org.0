Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1F1800EC5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 16:47:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645607.1007799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r95iT-0005Uj-IB; Fri, 01 Dec 2023 15:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645607.1007799; Fri, 01 Dec 2023 15:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r95iT-0005SB-FD; Fri, 01 Dec 2023 15:46:09 +0000
Received: by outflank-mailman (input) for mailman id 645607;
 Fri, 01 Dec 2023 15:46:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhld=HM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r95iR-0005Rz-KU
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 15:46:07 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc2faaaa-9060-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 16:46:05 +0100 (CET)
Received: from DM6PR02CA0055.namprd02.prod.outlook.com (2603:10b6:5:177::32)
 by BL1PR12MB5189.namprd12.prod.outlook.com (2603:10b6:208:308::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 15:46:01 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:5:177:cafe::b2) by DM6PR02CA0055.outlook.office365.com
 (2603:10b6:5:177::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24 via Frontend
 Transport; Fri, 1 Dec 2023 15:46:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.23 via Frontend Transport; Fri, 1 Dec 2023 15:46:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 1 Dec
 2023 09:46:00 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 1 Dec 2023 09:45:58 -0600
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
X-Inumbo-ID: bc2faaaa-9060-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PM45osBYeXI4xPMgN7dSToHEQcnHCfi8ykAoyjjPLIOv0Rcum/g864XtNgyXEQeGxpuhVapqTlwgUDvkT9uKNxbPSYfg8+XqtkjiCMPNX3+iwXyUewKNu5GaeBbe2hXEPxATUvUhKbhB5oxLfGCDAZQo8wRRLVGmOz8SSEIvD5vZNCzAxY3otjYdj2Wtv51oDPJOclbWwNNxa/tbxE8rjaQi9fwvFC7ZB/tbmFS7mtWRfZ77hmwlXQQWdwW0gU/fNuCIYjDLGvXgLxTm+/O7ao2uqmmGd6V/goulRvWwYILADBUJKENnI/GHswI9ocJe53HLnpR6hT6/NJnej/pvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgpPsDqYxUS2ES1+OmYaJDFxEvc+R2k4fth5ocPNlWU=;
 b=gFiU+kBKWje3TDFO4EdYDaFdX3N2RjW9Xb5uqoneVOM89JTiJ6VMTxPh2hgSV/ZAkdSHMWIm6vp4+V86/YlvUT61IXgPsEcPrRFlWq3PuqP2moyTFauWCOB8K9F/cPgQFeM/bHbJ2eZuNnOmDHl0iJa9V0Ys7WQwOKD7Hol4haBtIa5cFo5oEq5ij8lmEfQyOqoTBO90xvu6Nf1W3/ps9Fqfft78b8w/h64oA1nOr6tKWKj97zKuM+Xw7JdNHUaGhMiWxz94j5c566DgJhJDkhTQPRz1XYSqvFwTX39xvrstCZWSxqnLI6wD8ygSn6Yw2T5bzLn2+IeLTzWX1kCEUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgpPsDqYxUS2ES1+OmYaJDFxEvc+R2k4fth5ocPNlWU=;
 b=JOMBMmscZn0S84wCFpYfBO5jkgCs1ENkOvx0AFFDDlozXzy7XzkvQO3uvVmtTPOiOBshSzVA3CnNtRFNzPJOhLkNTq88ydrZtrQTIPfcHoeOR+3RLYDNfTvljrt8wicHoSJysMTAE2S+5+AnkJT08pncl5hZOjwL5YQDtbjeFIE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v9 0/2] vPCI capabilities filtering
Date: Fri, 1 Dec 2023 10:45:48 -0500
Message-ID: <20231201154552.3066321-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|BL1PR12MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: 403d8fc0-6203-49cc-f24f-08dbf2849e4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0EvF+wk3HrCQ8xww+7otVP8D6EdJFMKWxk2urgVnBigVPp7ZWycHWfOY1xxOMcJ/diLdBl31amX/8ESlxxOvnVH2lgd8D/3e2z0oXXb3Lgjv5Ow5UOCR/dgrdd6Ew+2l9lEeQhKQPWTMZhICkCtRSMlT1gB1kYADS0ndzNczlxCNU4751YdIrNRLWcNQMGYiD45v0cdDl6jA/t97ZLLA1c1sIKJRIwb+CMMZsh6py8+CR3Sto4IFEt29pyBmwMhOvsueTNUXv2cjvkuaXL604jED70GgkefnMaRpEEQCmHxN8/m5WZ/7DueuscrZioQou1u2bEk+iNk19BWrcKmHrKpOU6MqnNqSOpoEdJuVMblKZSApXV/bU8aEt9Tjn+GdTkQGw5u/yC0LVuOrU2hT2WmqYrW+wdiB3SyysEuKo4ntMPu9DWxleecCsq8MQCPRmERFL4PFuyeY0moSQdKA11ok/7rg+wnlGKD52OhyVOctWJToVT/8VR7IpL9D3dYEGZI9j52pSZHwjIHpqDUIRs64ray0AGogYvC0lnv9RL9QhUeZI9Nm9nvUxCBpFQX9CYPASBLatixuNHK6pluBuRyCWzT4q7yE3DPZTo6GU4IuewmXetBb7877WGm5w7TuHeLaqVruE0FaQdqKFe24SJ+P/v4Z/s/yOpkm2vKQ4XG85HvTtplEqddNI/caRpM/yigqaAmDkbOfvx87IS+MBe1SbeQS7A8nHiKNT5S/aEgDXcolxeHVwFY9rrn4vKxT0dprHIyqExtelUiz+YmYuw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(36840700001)(40470700004)(46966006)(40460700003)(66899024)(336012)(426003)(83380400001)(82740400003)(86362001)(36756003)(81166007)(356005)(47076005)(36860700001)(70586007)(70206006)(8936002)(8676002)(54906003)(4326008)(6916009)(316002)(40480700001)(1076003)(5660300002)(2906002)(44832011)(2616005)(478600001)(966005)(26005)(6666004)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 15:46:00.7280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 403d8fc0-6203-49cc-f24f-08dbf2849e4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5189

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

v8->v9:
* address feedback

v7->v8:
* address feedback

v6->v7:
* address feedback in ("xen/vpci: header: status register handler")
* drop ("xen/pci: convert pci_find_*cap* to pci_sbdf_t") and
  ("x86/msi: rearrange read_pci_mem_bar slightly") as they were committed

v5->v6:
* drop ("xen/pci: update PCI_STATUS_* constants") as it has been committed

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

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html

Stewart Hildebrand (2):
  xen/vpci: header: status register handler
  xen/vpci: header: filter PCI capabilities

 tools/tests/vpci/main.c    | 111 +++++++++++++++++++++++++++++++++++++
 xen/drivers/pci/pci.c      |  33 +++++++----
 xen/drivers/vpci/header.c  |  79 +++++++++++++++++++++++++-
 xen/drivers/vpci/vpci.c    |  64 ++++++++++++++++-----
 xen/include/xen/pci.h      |   3 +
 xen/include/xen/pci_regs.h |   9 +++
 xen/include/xen/vpci.h     |  30 ++++++++--
 7 files changed, 297 insertions(+), 32 deletions(-)


base-commit: 1571ff7a987b88b20598a6d49910457f3b2c59f1
-- 
2.43.0


