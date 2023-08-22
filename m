Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3938C78375E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 03:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587995.919419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGEe-00022K-Vz; Tue, 22 Aug 2023 01:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587995.919419; Tue, 22 Aug 2023 01:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGEe-00021B-Sm; Tue, 22 Aug 2023 01:31:08 +0000
Received: by outflank-mailman (input) for mailman id 587995;
 Tue, 22 Aug 2023 01:31:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MiiM=EH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qYGEd-0000x4-E3
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 01:31:07 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f54285e-408b-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 03:31:05 +0200 (CEST)
Received: from SJ0PR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:33f::34)
 by CY8PR12MB7414.namprd12.prod.outlook.com (2603:10b6:930:5e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 01:31:01 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::b5) by SJ0PR05CA0059.outlook.office365.com
 (2603:10b6:a03:33f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.14 via Frontend
 Transport; Tue, 22 Aug 2023 01:31:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 01:31:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 21 Aug
 2023 20:30:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 21 Aug
 2023 20:30:34 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 21 Aug 2023 20:30:32 -0500
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
X-Inumbo-ID: 8f54285e-408b-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4WdhzEJ06FDB4ekZ+JGQ2ejilZ3m4iTzIFV/aeMTKcj9oDZiLKgWgVX1KcihrirBORH53syIgjXv4eN87MJ2si5MLYvAG6dr2+p13yiIHhZheoxBc6c0Cdrhlt8hHAFAmDSRnFVTvWpNRtfNu8fLxocDmbbV2DEu4fi933hBEprEP1yU44MjCR72iwq1qo2R6nKMjMEJfQILo30IQ4dyTcSyPj8xR5+bPgXQbnYdDnBMv9PD0FVZFamvw+zcoXIAXd8PJD3f4t3pAIDwj6kI/GFf2j/tsr3en4bN/Kfn/t4pmkT4aenIuTjM8QWXHNFwwrzf2BOb/F0WbiOJt+aAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oL8/mLXOI79PD0AEV7EPeuneKGMtclOpYPZNKxydew=;
 b=WfrTgmYedw6X+swMhkiUdPSnXgd7wOAqMa+CsyIL+F2tbohoLFccyKNjh7BrCkq6+1aTo6BRmiuC49ehDq+pR9Z2sa9QC6D5F9KOS9nDgcxPAb4HdV14/QGVtTf8V5aI15htpXOsPyi8DCq2Z4HRbdsIhazb7VEKgIq+1RKBlXT0LCUUyLrGLyTg4P7vtEYM+Zz2AF/9jZxJbPN4XA1sCNg9P2OwGkpA0A/zKxZj058bmuWatMnqzYjk2oHBgW6rleTnWzf/s3pm3Vu6eGTbXa8ZjoDmNW2KpW8+F5uxGAIX8vMNu+cQgzZwfIr9M3yDgQKmoYmMlm4Flb1orCd0XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oL8/mLXOI79PD0AEV7EPeuneKGMtclOpYPZNKxydew=;
 b=xrJiYlomGx1oG5ZCnKJYFl4tsFEZruyhSmBmhbPceZ+GCfWfzYG1gUjYKja6j92IkyrrOqfYTzTDfgCkBovdcMqy1WqoSHHC5O3jNhZosK9Hn3xE+Zx7gw3tBTWXbWkolYyQxonEKQESLEuvob5dKWc9fWbWp4ka1iBx4Ufqq4Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/4] xen/pci: address a violation of MISRA C:2012 Rule 8.3
Date: Mon, 21 Aug 2023 21:29:49 -0400
Message-ID: <20230822012955.312930-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822012955.312930-1-stewart.hildebrand@amd.com>
References: <20230822012955.312930-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|CY8PR12MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7cdd29-a747-4aa5-7240-08dba2af716d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JQaaAb5rIfVljNLCymAZsdvg09nnVBRrV7eHjCXyw/7WfCzcOhbNyzzISmtXBFfc1enZSTOEZ9bjH5mAzW6jUIwPZIOBebanCu+Y20EhDs4YweCy9TUZhlG3rPz0oaJYjCBuUXCeBMGPyQcxalfR7d5HHI8EfRFV9Zq1DKV0owT6BRO/sKp6RiPk9I8JOYlGvNyjyfHcr02NnkHL0AVZP2ilPMdhqbhlp+sPuGy167jFBIFv4k1QRHxXXoqszf51wzy+hATgbhlC+f8FqoSFlVcKveKgMGfgLJMZqu4FrSfGylvYuSDu1Lbs4BKmab2LNtqHAiChJA885HTLP3sU9JIJPP+Kpq1jJe1WL1zX1j+yFnoQ8g3aLPnXfviTs8MHjg0B8lqhYlyhmRrYPcAPlkjV/xlKC5Rnho44swE69gLhvU2QnN/XubDiilRX6NqKCHlUTPv3sxpGZg9jJW7PErftIrL8qANYkb+FrbrqL4ZD79fzQqvlv7Y5yzYsZbT5qn59iEdcTTW8WDu5v3IbQ8WAhH+KnA5tbn5FsrZiZiMjHG43Pi5Sni2WZTSmBqIHAKNKjR5WWO5BzW2G4HUgbJs4kQyByCDF+Ip/xjwOGTg5aG9qC9lrnV/hH8W10DBnnCtmKp4K+IuTBvPW0uInTul8U6cxNUSIqrWSYXrgc4pJmdIA9shrX4ADO7xK7q9W95XaJIKA8iZPX0HLixYfi573B85RXqSau87XObnhrWzrX5x7fstAmd46Rkod1EwNAEPJyFlNSB4dWnEfo8sCEw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(82310400011)(451199024)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(83380400001)(5660300002)(44832011)(336012)(426003)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(70206006)(316002)(70586007)(6916009)(54906003)(478600001)(356005)(82740400003)(81166007)(6666004)(36756003)(41300700001)(40460700003)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 01:31:00.7312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7cdd29-a747-4aa5-7240-08dba2af716d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7414

Make the paramater names of the prototype match the definition. No functional
change.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v2->v3:
* new patch
---
 xen/drivers/pci/pci.c | 2 +-
 xen/include/xen/pci.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index e411876a1518..c73a8c4124af 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -80,7 +80,7 @@ int pci_find_ext_capability(int seg, int bus, int devfn, int cap)
 /**
  * pci_find_next_ext_capability - Find another extended capability
  * @seg/@bus/@devfn: PCI device to query
- * @pos: starting position
+ * @start: starting position
  * @cap: capability code
  *
  * Returns the address of the requested extended capability structure
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 5975ca2f3032..a8c8c4ff11c3 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -196,7 +196,8 @@ int pci_mmcfg_write(unsigned int seg, unsigned int bus,
 int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap);
 int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap);
 int pci_find_ext_capability(int seg, int bus, int devfn, int cap);
-int pci_find_next_ext_capability(int seg, int bus, int devfn, int pos, int cap);
+int pci_find_next_ext_capability(int seg, int bus, int devfn, int start,
+                                 int cap);
 const char *parse_pci(const char *, unsigned int *seg, unsigned int *bus,
                       unsigned int *dev, unsigned int *func);
 const char *parse_pci_seg(const char *, unsigned int *seg, unsigned int *bus,
-- 
2.41.0


