Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626ED79EB39
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 16:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601456.937449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQyy-0000tr-PE; Wed, 13 Sep 2023 14:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601456.937449; Wed, 13 Sep 2023 14:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQyy-0000qg-LO; Wed, 13 Sep 2023 14:36:44 +0000
Received: by outflank-mailman (input) for mailman id 601456;
 Wed, 13 Sep 2023 14:36:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUH4=E5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qgQyw-0000pR-Js
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 14:36:42 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e83::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f29b236f-5242-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 16:36:38 +0200 (CEST)
Received: from MN2PR17CA0005.namprd17.prod.outlook.com (2603:10b6:208:15e::18)
 by MW4PR12MB6975.namprd12.prod.outlook.com (2603:10b6:303:20a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Wed, 13 Sep
 2023 14:36:34 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::ac) by MN2PR17CA0005.outlook.office365.com
 (2603:10b6:208:15e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19 via Frontend
 Transport; Wed, 13 Sep 2023 14:36:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Wed, 13 Sep 2023 14:36:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 09:36:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 09:36:33 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 13 Sep 2023 09:36:32 -0500
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
X-Inumbo-ID: f29b236f-5242-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpFKm68HuMJuNfdF5dPEp6PosngznQNBKD9l128cyhOP2wZPWGZhxeyQ/2cDpVq7OQjju+hlLlJ+YM87ECSWlTiARNLoI2MaND471TN5KcEdd+/Azxgu6nj8c2UvY7DavAcNlN4hKtkif5lbHDmPdb5OxEFOWrOBHi7dQVbHPuwZqAGqD+jUnR6SIcYMnD5g9xXMTimUL/xxjGr94L0yhkvqzLNvTsV27XrNEYSzNsccDmom+AEPsrCZZ7ASLrkHGs0dJJoJFGgVr1v+xY0pd5plLQL3haPiIZGewsN4c+X/GNiqmeXUWGbCj8J3EwgNVMCKDp/lqIQfk3Z5q0b3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HndlCYoQWyPa6ab9cSwVvMxSi5SWH3VjeAwFgDmY+Bk=;
 b=ezmcWrYIZH5xkGdfs+4bPGGP3E/lmF218uuIZDCDFR8W7SSW7iCqCOX4y4cdyG0wlCPgF3MqbRQ6YvXNzx8tyWWt4zpN8+zeWFbF+MK9ir7fGg/CblKVw2wO5UA+oBI+LE67J2LUtgb9Wpz7+KAPL84THqO4nzx6MQYMFeEA/6Tqxz6hgd3G+XnrXEtfeKay7Bae1IaubmVZipCQpk8M7CbzAdqSf76L2UYRXuQEIRd7NWD6XulM/FZIxe3C++l6JfzixxT+1eQz5r+t2g6SP7KiEvr8JIYXG+XNHONA2vtWDUrPkAHGpONT2dqYsGW+tGbEzmsGEa9hGuFhcqzdVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HndlCYoQWyPa6ab9cSwVvMxSi5SWH3VjeAwFgDmY+Bk=;
 b=ikVQ/EiI4Or4KAsmycIYXgy9CpAvvHB8tlwPIeSm5xF22MOHjh3UYM1ce/2nDVf/SEzzDxs7jjqrRmnwfQnL92fpZFq6Q/ePozWgjqXBA35OPY3cTh5ikP1wNO+HIm+xcNMSU2RjlnwlmTjSDvsO1BI4LAVtbCr9xA/HcwJUMhg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v7 0/2] vPCI capabilities filtering
Date: Wed, 13 Sep 2023 10:35:45 -0400
Message-ID: <20230913143550.14565-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|MW4PR12MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d492ac3-827b-4cff-9b8a-08dbb466d409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Ex+Lwmt/LW2hcmSrSosj1rpsaNapspj6BeByH8R5GWlPtTBXMC3lOZNZ4NO2hez8CbMQ/hjHvmaAx38od3HphaV/9iDn/m66lFw8YG9iwQ2+k+85mKG3iQDRxTXRzbM/zQxdw4VXkBVvW54ZsBbAamHuhpLl8xUHUmOtkbju+G+c6V3/8GsaBdf6VLAxw3YhmLGgGOYhbl4dPSAlnURvZ+aExQaz3Bk3wW95OWmDmmgxQfih0XTEIylnUor+yeWWbdqmV0AOLJG8nusI6VRByMDIIXKieQ4j5kr1Ddkf2Y5mCg0ct9tEzKhJCj9c6r23BAfnta3gbp8NBLlgPJD7Se5Ux7RIdw24EBOeHXwko/UZcU8U+9YQ0Y1Y7dGLK4BuFMpINRFe37I4zZMG04JM6Hn5u4pnzwSl4Sp+Tl+nW8NSYSjY4wc4tM0Fihe4R/EQhWYsVa3y1qOVsD7XnY3Q4DiTztSOyrUG7CTxUGRiM5R8NVPeb85FJBnkbmu4MYSaUaC5WIABxHrLM+CeJL+qpHn1Wk0Y8o/RpCjUY/Ghmu4eP7mS0rLrgqQUND3EqdxWmRgS4g2B7/oFhyehoEwQXFSELO9Qf2YqpoAVGNF6L6ue2iwSditxq5ed1+h5WdmPeKPRDs9zfACYl/+ZBby1gdnoKEcEGU7aZLS81jd7+N4IjObN/LOS8PeEqrhgDSMaXggAzCv6ryZ8bdXVPkHknAIGhxREQhImcrmbdzrMD9fIlFv5w6sYYggBZJylTG9kdgTsZ98BkuUydNivcUa9w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199024)(82310400011)(186009)(1800799009)(36840700001)(46966006)(40470700004)(4326008)(8936002)(8676002)(26005)(5660300002)(83380400001)(1076003)(2616005)(336012)(47076005)(40480700001)(44832011)(36860700001)(426003)(66899024)(41300700001)(40460700003)(2906002)(6666004)(70206006)(70586007)(6916009)(54906003)(316002)(82740400003)(86362001)(966005)(81166007)(478600001)(356005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 14:36:33.9651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d492ac3-827b-4cff-9b8a-08dbb466d409
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6975

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

 xen/drivers/pci/pci.c      | 26 +++++++----
 xen/drivers/vpci/header.c  | 92 ++++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c    | 67 ++++++++++++++++++++++-----
 xen/include/xen/pci.h      |  3 ++
 xen/include/xen/pci_regs.h |  9 ++++
 xen/include/xen/vpci.h     | 13 ++++++
 6 files changed, 189 insertions(+), 21 deletions(-)


base-commit: 6aa25c32180ab59081c73bae4c568367d9133a1f
-- 
2.42.0


