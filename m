Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16061B11672
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056823.1424823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Ag-0000k5-NB; Fri, 25 Jul 2025 02:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056823.1424823; Fri, 25 Jul 2025 02:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Ag-0000hc-KE; Fri, 25 Jul 2025 02:28:30 +0000
Received: by outflank-mailman (input) for mailman id 1056823;
 Fri, 25 Jul 2025 02:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf8Ae-0000gR-LA
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:28:28 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:2417::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bc6520e-68ff-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 04:28:27 +0200 (CEST)
Received: from MN2PR15CA0033.namprd15.prod.outlook.com (2603:10b6:208:1b4::46)
 by DM6PR12MB4433.namprd12.prod.outlook.com (2603:10b6:5:2a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 02:28:23 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:1b4:cafe::11) by MN2PR15CA0033.outlook.office365.com
 (2603:10b6:208:1b4::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 02:28:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 02:28:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:21 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 21:28:20 -0500
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
X-Inumbo-ID: 0bc6520e-68ff-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPAEs9wY52PZ7nZq6z1PgyiqXiIDa1DhaEsLKqlkyQJtEAaMpdJ5JLCUPibwkQuzkCOeFKn9TLz8LN9XVZlSxE1GsL5pyB5rdgfpOHnV3l8Cw/P3uwATH2Bw16l/lJFKrVsAW/zByNInqRRpWRqrRC6EKyb+qD+tnzPv+KKl4DrB+6bGDZyEupnUalyF/xSVfe5DdYMVJVZ0w3YmCCMEEWSstNlc29L0OcT7E2x7UgYiB9Hl+6LfxhLw7c8QvWzj1N3tXmrZR9exeEHnJ0mieCGGz+ZPtW2menKFY93MbSMB5HfFgS24D8rxRnbNj2NySFlMpOeIWidOslXUgubXQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4N4fnYrcRCJHqRp+B7ex/dgKqFVie0lY309qbf+hRUM=;
 b=dfaZoSCvwJV1TYwmhhjdZEShiGcw6bmLhSOhKXNl+J+VAxc+54n3Vwoj+ljSOCmhfI3yUax20te6rbf80cZ/805U4BVvBkRVjP6v1ZWAQ3lPZSfi90DQr4oWEZVV3pC2QPvWrSuVw/YlN6m2i3KOjpplAwVXa1SULwT/DPqWTVMsH1LSEtdW0nOM9VBa0tL81LMvwWITQ3JoMdRC9cahTv+6w0fZ4ON7hIaDmS47vLLb8p5tU2K2NKZ9jv5xwAwHhvPhX6wHXOSaHe7gWf3xo9upxE9/EPX6XV7NPR6+PGAACKoguKlw8XqxhU+R56C0S11TzfWLlytK0940iTgWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4N4fnYrcRCJHqRp+B7ex/dgKqFVie0lY309qbf+hRUM=;
 b=ahAOAef3UgLc+NnbnfnVH9c3kMdku1MoA3pGAshbFk2fKSrQ342nXPcpzuKIovbfiyrEqrYXJSCHcA4uAZ+cXJqUsEhuISa6btgC1YcgLgZkbvB+9HO17ObD4epc9Cmke/f5RnhIkphfpPSvaz4cIDqpwdrw4RpBf7Si41/QrQU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Juergen
 Gross" <jgross@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v4 00/12] xenstored patches from split hardware control
Date: Thu, 24 Jul 2025 22:28:00 -0400
Message-ID: <20250725022812.466897-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|DM6PR12MB4433:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a27647-4bce-4656-866d-08ddcb22ecff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kV79nbYBpScvZ22LzTdNv+l66Fsji+fAghVRudRXgAjaa70+9AuIVU03H6rK?=
 =?us-ascii?Q?NN/wosbtiKvK/R6kPcwPGyzINFqY8yyCJPRE0xSQGH2gA2l4X2R+VQ/DI+LG?=
 =?us-ascii?Q?G4UdEGfGCuKzQIr/vBxopyDNzNdx8rUCFy1Dd0yXHYQEKImm5j1S5bLArrqY?=
 =?us-ascii?Q?9NkzrDPffY4opa/UBtRQQeu05zAMFSQ+AoYqi2syNR8UsIG6W+ePpWBvip3r?=
 =?us-ascii?Q?3UclRzwTBRP94PzRlFgcFf3r5RHZkt7FiWF6ASm2bZAR35PTxl+hkRCdiLJa?=
 =?us-ascii?Q?X51H6NbJZh+Y689nuBOykXe5Oe0I/Tjz3tSTSwqPtemp4gCqvGYC236zq6ZP?=
 =?us-ascii?Q?Nu6s6ZoKSI/e39tgb/02AbZCz5Ou2ZKz225fiLZmzUn4wryCncy7zyzcHjiZ?=
 =?us-ascii?Q?XWRAyxvvcjk67bPJORSGU/z+EYGvwbxeWBNFqTEQr9U4rTVGZW0lTlLvXT8V?=
 =?us-ascii?Q?/IfQ5lUYScKZupiB0RIZ+kjVXU5gaYMURIHxBgm6kKhyy3MRu2DDiHrEYwSA?=
 =?us-ascii?Q?9JpzzPsnSO6TRPFde0bWbcTuBIEgeBRGKHi7/2iq+eYenMMCVsx9JLqPA47N?=
 =?us-ascii?Q?uuWugWXXkh5zelVkpZxBNJVP1BDOZw7aUdVfgu6qXFjhm0aA9fisi5pI/Ifh?=
 =?us-ascii?Q?woffLg1NiuCAxfwJ6FYc8WIKY0kjauB4udR4jVm7OOtRCc3RSXR5CfLqzjaN?=
 =?us-ascii?Q?LdZbbylZ6KBfIHSbj/q5AGZaes7byAxmAS5qqFscHQm2UQSFiXAX10XuJsVv?=
 =?us-ascii?Q?9opSAMAUyI9+eI8ibI8bTjFP69PzJ8elHDxFPjBcpnx/kX2jRPw9kw7HGO08?=
 =?us-ascii?Q?wtodO5OFrja58tfjtH0GNlEEut7zQvYJdFSLNhvskUUSIadB9WTyjAtq1Q3L?=
 =?us-ascii?Q?ilPezCsF0QDI6z4oovRxRwISNdueG2Dj0jF0PciLOMP55KRicty14kwWAzpx?=
 =?us-ascii?Q?5Grd7duInguaPoZizu+2lJKn8je3t4Q5M47xhw8ZzLtif08Yv3UedBOkp83B?=
 =?us-ascii?Q?GnpDwGFLTU6zRgSwueweeCLTYM1caWHLbC/ePbPGKIVcb6wtnfS0alWEucCF?=
 =?us-ascii?Q?ygaxXauv+GlmWLz6cGzR4McYEmdAD42WQNjxAVe2NvCH8OQ6NQVGziXLYDK7?=
 =?us-ascii?Q?TBJPXYGzVkYzYAxkgpVJa9h/rrW3cVvOPCfxP4eDRKUZd56END7qVa5WoQzp?=
 =?us-ascii?Q?1jhqbFvlDbAZyKtXEslP1n3Z7Ws5AQtbDpX6x+lNWI8DxB9JanL/xykhnNgf?=
 =?us-ascii?Q?vTj2NmIo8GZbMCO885gicQmexQN8VmfLcK3ddhYQM4eZiNra8DcR/rSZi8tA?=
 =?us-ascii?Q?yCG7cGWbfwK8uezENQ7QpPgsljMc55lUhmscA3sc+s11MNKOP/oc7GLmpZIn?=
 =?us-ascii?Q?yi54IUGZt9x9xh7BDp8zOCPKJRkSIre2ob+g36zs8PCOtugQZWMjQ4GV3fyO?=
 =?us-ascii?Q?bHz55EsFK+radi9rzHPPjLtVSfE6fEkOTNvXoSr7VVcHTbgwyYItQdCtyxmg?=
 =?us-ascii?Q?blMvWtn7+FnoA733K4dIGjmZAcsglDUuXLgd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 02:28:22.1540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a27647-4bce-4656-866d-08ddcb22ecff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4433

This is a subset of patches focusing on xenstored changes from my split
hardware control domain series.

It should address the stubdom breakage from the previous series.  Due to
a lack of x86 test systems, I haven't tested with a stubdom yet :(
I'll try to remedy that.

"tools/xenstored: Use priv_domid for manual nodes and permission" is an
interesting result of looking to rename some internal variables to
better align their purpose.

Any review or guidance on the approach is appreciated.

Jason Andryuk (12):
  xen: Add capabilities to get_domain_state
  tools/manage: Expose domain capabilities
  public/io: xs_wire: Include event channel in interface page
  xen/dom0less: store xenstore event channel in page
  tools/xenstored: Read event channel from xenstored page
  tools/xenstored: Add get_domain_evtchn() to find evtchn
  tools/xenstored: Auto-introduce domains
  tools/xenstored: Remove stubdom special casing
  tools/xenstored: Use priv_domid for manual nodes and permission
  tools/xenstored: Rename dom0_domid to store_domid
  tools/xenstored: Rename xenbus_master_domid -> xenbus_store_domain
  tools/xenstored: Remove hardcoded implicit path

 tools/include/xenmanage.h               |  14 ++-
 tools/libs/manage/core.c                |  21 +++-
 tools/xenstored/core.c                  |  15 ++-
 tools/xenstored/core.h                  |   6 +-
 tools/xenstored/domain.c                | 146 ++++++++++++++++++------
 tools/xenstored/domain.h                |   2 +-
 tools/xenstored/minios.c                |   4 +-
 tools/xenstored/posix.c                 |   2 +-
 xen/common/device-tree/dom0less-build.c |   7 ++
 xen/common/domain.c                     |  10 +-
 xen/include/public/domctl.h             |   7 +-
 xen/include/public/io/xs_wire.h         |   7 ++
 12 files changed, 182 insertions(+), 59 deletions(-)

-- 
2.50.1


