Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206AC8C8A8E
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 19:07:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724367.1129635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s813P-0007tF-O7; Fri, 17 May 2024 17:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724367.1129635; Fri, 17 May 2024 17:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s813P-0007rg-KZ; Fri, 17 May 2024 17:07:35 +0000
Received: by outflank-mailman (input) for mailman id 724367;
 Fri, 17 May 2024 17:07:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KIA2=MU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s813O-0006C6-Ag
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 17:07:34 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2977c4c-146f-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 19:07:32 +0200 (CEST)
Received: from CH0PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:76::23)
 by BL1PR12MB5921.namprd12.prod.outlook.com (2603:10b6:208:398::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 17:07:26 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::19) by CH0PR04CA0018.outlook.office365.com
 (2603:10b6:610:76::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.31 via Frontend
 Transport; Fri, 17 May 2024 17:07:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 17:07:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 12:07:25 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 17 May 2024 12:07:19 -0500
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
X-Inumbo-ID: f2977c4c-146f-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mu3r6ORU84PuX3HDQ7SwzWqlPti1SO9+IBG+NK7Lc6MXrIJH47Owd+6a7a9HtlhdifYm3RMsdUZV3CTt5NGAjjZghczZKzhg5bb5+E8LN1N1iaejzmsq7QPe8pFuFS7D0a//EFswBJ0N1cCndia4KN8n3rpr81N7dUkEugc4+Gg3519U3XvgxzkQkBz6SEtRlkppjhaIL08Y+6qiHsPg4NMtGyH7wQP+IDc9q44XT+SSH4sMuZ7xqK7FKE3ryLe9tXofjLQxI36skZ/70cqhciT7+BF68W6jMegb6ay6RqKCE3nMXIEzdS6RY1Nsf9hHha13I3iMBBU5ohIBsMrN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wg1lIYFsxCkrbMSdoPQQCZQ7ozFKfKSY7zA6PHJCXCc=;
 b=c2QhoeBJ6EdKJXNGkRQGfCTo0BnA+L575RBbWFhAzsr2GuKMbAdQue7Noy5D/+AlH/HjDpr0Bh9bfGv6rIwU5WKcRNgmguTiZqKsnx+aZnArpYRycko5ZrFlc4/Lh5Gcv8RsxEmA/sJwz5C5DQVn8AoUwAbPu6lwt8/BE9sVYYhbYJzp5nXVv0Du0E3aolO7k7pqhJE6RBmIzoNdgFB05Roun1NW29M7R2XHuNfsbcDUAVc8lUqCEUktZs990uOWnuSMmC3Zsf0KASMnXbB4pMnepb5xO6yweIoWxdW7kdn7jPiio6Yvm7+q5Hg4109UxMrPC9Wkda+C0pePnVhx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wg1lIYFsxCkrbMSdoPQQCZQ7ozFKfKSY7zA6PHJCXCc=;
 b=DNQ3978As1te2Q0tl4Hxt8zwQoa3PtLIAPQJE6z9JczMc0Zvm8MH0gAJ8H3OXYgPCEdAmNSGx5t0N1qwtgqXAxAeMvH/dPiVbxN/jXiebG+OAyt9Yv/dKbeN7ZLJt38ZK+Xud550jbx8qLLHBhJOwHmTRTwgP98uBREp+Lv7vC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v15 5/5] xen/arm: account IO handlers for emulated PCI MSI-X
Date: Fri, 17 May 2024 13:06:15 -0400
Message-ID: <20240517170619.45088-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240517170619.45088-1-stewart.hildebrand@amd.com>
References: <20240517170619.45088-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|BL1PR12MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: b40d0cd0-3024-40b6-df5d-08dc7693d386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y3kuB04l1s5iff60H3ERnvdonr9dL1NtYAX1rH6weVScjRX+6rAUKlRg08Su?=
 =?us-ascii?Q?S+rBsVd1QigYKbhZ3DfXGO+59RNofwDwFPlPAkhEXpHhppXigKRDAGy0H1kW?=
 =?us-ascii?Q?dnjDwzMHcRr+qVqUWAQ5B0/lINZFxPsr0BkMr+vgAyyunsDiA8pXYk0MSOZ2?=
 =?us-ascii?Q?vi29aZbcjYj3G1bZ30GTlcfKZlamiRwutiIpWcMEBKF/ltmjJ2Wa5Sw8JE+l?=
 =?us-ascii?Q?8GRkyjZrOKhpWFUcM/lDM64hRqo5jM46Aj89KTTpiljKcM0nwj1pihYxrtxh?=
 =?us-ascii?Q?TMlQosszQveMhEEy6TlJR/fHmmoCJvQY8H/LAu01CNsTwPdWTSP8dNf+hQuT?=
 =?us-ascii?Q?fvG9+yhXUOvZjKEBRYqbgp1Gv1lk4QtNw0ul8or9ZWp/Z8meW7UWuzfLctTs?=
 =?us-ascii?Q?6LsP7uu1CJcVw8zcY6rx9TT9/yJUaiULz/C7tYc0M9m7DmoFJG/QHJyVxDki?=
 =?us-ascii?Q?+c5G6Yl7VW0/am9jBpefRAR439Q4DmLXFBnjFJ1i9bUvpmpLYjXiOjyDT8aw?=
 =?us-ascii?Q?WlrkT504dKpC+cIgtkHfhgztMYA2dDR2PWkAOclBPGALQX3jVD+uaWM1sLN/?=
 =?us-ascii?Q?99vSkrsJoT+1xKwcCrGq3YfjqaIV+xjfiQdW3pTkjoksPM6fFf66NwZji4j1?=
 =?us-ascii?Q?iDMHzQ2cXOsHk5Tx9yPWH70LaLw0kZOuYDTlUC8yg9r/BGhk03LaaE5KkXVq?=
 =?us-ascii?Q?HlMHwQRaZ6JaxRVPAl9loM4mJhhr4JENqvdIoMNiUAwEJlpgJOBC9GbJtxAc?=
 =?us-ascii?Q?idClDpV61WA1QF57qfhf9SEnK2V69TL1nkdL2+RrhCI18I0rkIKjHi1RqktD?=
 =?us-ascii?Q?sV2dimnfzuRXbLlEiZomqVDZvd2pFi4vj695JW6CJpacfaonMJUMHdcUxpE1?=
 =?us-ascii?Q?iBi/Mp2lMr7ZgGiMhToHRuAejfVoOksGycdOERgx6yqloBnMmjSIwdq0D5HS?=
 =?us-ascii?Q?maWpKZmn5FKQMgj46DTCOK5xfEAJfGg0fUKUkrVfOSnnKpkiYgmaXZ+LQzxw?=
 =?us-ascii?Q?xm3iztD/1p3UOozblh7k40PjP2Z0AnY134a55DGGaPwQYU7Rbr9n3PRPwJy4?=
 =?us-ascii?Q?Ycf/JpWD2+FYBEH2dmbxH86WXMpVvuNfP03QWboVQxJjb9MHewxGUdwX8yF0?=
 =?us-ascii?Q?eDkI7RGP6/HGTGqPmpQwNT3whh8Tp794uwsITNR5iQe79iOyeYz7lcexGqcF?=
 =?us-ascii?Q?thNhfeRK5t8zSHk0eMZ/XmHyCCy3TFxvKYL5Vrd1gVTgHzxbeHdBoN8qJywa?=
 =?us-ascii?Q?weQChhoynw6cKdWaxBnv1YQBDL3BdUur9tHiPFlpBHQHl5VjSbHCz00y9WG8?=
 =?us-ascii?Q?jUBOSKVoCrpZG3qAvxAjtSwJwrLX3AOVozzQuGc/IHXrbdgKC1vjScBD8KQJ?=
 =?us-ascii?Q?c9HMfQXBIWEDPK9qkwKaVmEQudi2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 17:07:25.8838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b40d0cd0-3024-40b6-df5d-08dc7693d386
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5921

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment, we always allocate an extra 16 slots for IO handlers
(see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
MSI-X registers we need to explicitly tell that we have additional IO
handlers, so those are accounted.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
This depends on a constant defined in ("vpci: add initial support for
virtual PCI bus topology"), so cannot be committed without the
dependency.

Since v5:
- optimize with IS_ENABLED(CONFIG_HAS_PCI_MSI) since VPCI_MAX_VIRT_DEV is
  defined unconditionally
New in v5
---
 xen/arch/arm/vpci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 516933bebfb3..4779bbfa9be3 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -132,6 +132,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
 
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
 
@@ -152,7 +154,17 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
      * For guests each host bridge requires one region to cover the
      * configuration space. At the moment, we only expose a single host bridge.
      */
-    return 1;
+    count = 1;
+
+    /*
+     * There's a single MSI-X MMIO handler that deals with both PBA
+     * and MSI-X tables per each PCI device being passed through.
+     * Maximum number of emulated virtual devices is VPCI_MAX_VIRT_DEV.
+     */
+    if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
+        count += VPCI_MAX_VIRT_DEV;
+
+    return count;
 }
 
 /*
-- 
2.45.1


