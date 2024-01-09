Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7884828F3C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 22:52:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665013.1035194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK1K-00088x-Qc; Tue, 09 Jan 2024 21:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665013.1035194; Tue, 09 Jan 2024 21:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK1K-000878-Me; Tue, 09 Jan 2024 21:52:26 +0000
Received: by outflank-mailman (input) for mailman id 665013;
 Tue, 09 Jan 2024 21:52:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK1J-0007gG-Ls
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:52:25 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ecfc8e2-af39-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 22:52:23 +0100 (CET)
Received: from SJ0PR05CA0083.namprd05.prod.outlook.com (2603:10b6:a03:332::28)
 by PH0PR12MB8049.namprd12.prod.outlook.com (2603:10b6:510:28f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 21:52:20 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::4f) by SJ0PR05CA0083.outlook.office365.com
 (2603:10b6:a03:332::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.15 via Frontend
 Transport; Tue, 9 Jan 2024 21:52:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:52:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:52:19 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:52:18 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:52:17 -0600
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
X-Inumbo-ID: 5ecfc8e2-af39-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9l3UghIyVCk+1hN3vH0tk526Pob2VuTeo94lsGNFBtDSSwSK7DFc5g9/ol4gtLiZOe1+VqOM18gQpm+4uU5XaljF03RXYzTJJBY8L8FUKo9ofq4duBDKZHA5cfEConNZbdeGD+i9LSjcdgjqVdSoYvrEIFsFqRzseWd579o0gpO/4II82TnU30oOjr9qunayZHXend9D5uKTg4mxbqk0VOIeyAQ9W+Cq9CjEiK7EFT9ANOZCjTlt++3vfpYPFa8r3WPBUUnnlKnfgLDZvKMoCGzkIvMaYpBTcLeTNlZC+JF6Q6bxJgtWt/gfiRINYqDi1MAdeWO6N1DUiHJXimvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XB9PkT1l9t41YyMel2hU6TA5dMUGiXDLX5RX/vyOjHw=;
 b=VplYJ5P2tEeLBuOC12g+mizsei1kldMX4XbxIaYezuSKi45cJp6fGLlClfMZf03wY9tJ4crvD9Nhdj/pY08RooYp4e5lFDAzX+kxtplLB5WZZfZncLQnWF2UKRNiBwHVF+9vSylKcZ7r8n3b6GWu6fnESMQ9ymCmXzyGvJ29A0dgv0F/POcJPk8oBbl1Y3I2Ll2Q3i1yf5esdn3lOfc48ZSl8UVgJQeCSK5S36eCoCoOYCMURXQXtarfDlz8i0WI7Vq2ixhuAxTadCoAABVQahqhl/FIwzF7o5fIMUXHuLAbrsrFiX1RnGMiZ6ZDG/2ANYBtOCPAJvBAaJek+wtpGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XB9PkT1l9t41YyMel2hU6TA5dMUGiXDLX5RX/vyOjHw=;
 b=AJxgA/DpUp5i2xH+4coEsrkxA9s2y2wPhbWPM5vqekBj9HT4LRhxHl03E5B2WLJjoATaW9qDUp4wp+eQ7cOqttz+V5t+Wp/HEhfxjTBwul2m+LDDPQIt2kLFqJyPljeqsULfr7gqErY3K51F02KoKUJlANgLJt6w2MRFC9lfP+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v12 02/15] vpci: restrict unhandled read/write operations for guests
Date: Tue, 9 Jan 2024 16:51:17 -0500
Message-ID: <20240109215145.430207-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|PH0PR12MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1f000d-31b2-46cc-7f96-08dc115d40ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TweVXBUv8JtOkDCyh0xJ7XapFlUQKNLX26/pESydd7yWJocdiF3Ca0vuU+NRApmXIjsXAPAYj1VW94zwwLdZEiZfg4R4x6n2d4gqbDNGom6exdLuKRt3pOkrPPKVh/l7nv/ePME1xYnCilo+PWjinCCzABcgH5koivVYAFiBgaBBm8B/95YOA3qCs+iZVhI/UrNavV5/YMs3Jok53NInh9lFzE1f1E86cbVkESeyjYWR7CiTThqYqJhLRI90gZY0wi1cgITdr8Xj6x8KcxDcZUIc6iYon1lpTyw5iuW5EriwbepEasNVOlAYkdkKqRHTIgOcjtb+XvRRtOEDnIRD49DTdB40JgojdnOh2NweuEm66dRK1P36AnKGYuPZAKBndWIPRnmjXhcFQZGzsb9i7/ms10u8Rbpy3oXyyI+KXtHZRZn8KTOut+132fzUtnSIZtyeuCD4IG+Ty6Gt+bmckWLbB8hUnqJC4SvHO9XWdbEttYvesHaFJNyroREhcyBIl2TrONIMCwmqcWt5A0vG1ockRkuFc/epOCgEYMqLxH1O+0bT2AFtKu/t4aYGTYL/yF5LqRnIL6FIhXCqhAL3/UidCNywjq/OKwQmrnQVmKjgO0pkuliZuTTBfzcMyqg/KJQQlM5UoYwQZ0Anvotf7c44ng+6BZ5OyQ8McqbZOv3QBrRKQ21VGn3Q6vwSbKjzf7Mp4p3AuyDQo45kfpzsTPX+ZSb9lti84rb9YXg4/HE5DIKQ3tsSgVZV5gWwGjcRtXBExqN3xnHwSMdE+OcFGQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(82310400011)(40470700004)(36840700001)(46966006)(36860700001)(478600001)(82740400003)(47076005)(40460700003)(40480700001)(81166007)(356005)(83380400001)(426003)(336012)(8676002)(26005)(2616005)(2906002)(316002)(5660300002)(44832011)(54906003)(8936002)(6916009)(36756003)(70206006)(86362001)(1076003)(4326008)(70586007)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:52:19.7545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1f000d-31b2-46cc-7f96-08dc115d40ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8049

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

A guest would be able to read and write those registers which are not
emulated and have no respective vPCI handlers, so it will be possible
for it to access the hardware directly.
In order to prevent a guest from reads and writes from/to the unhandled
registers make sure only hardware domain can access the hardware directly
and restrict guests from doing so.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Since v9:
- removed stray formatting change
- added Roger's R-b tag
Since v6:
- do not use is_hwdom parameter for vpci_{read|write}_hw and use
  current->domain internally
- update commit message
New in v6
---
 xen/drivers/vpci/vpci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index a1a004460491..e98693e1dc3e 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -268,6 +268,10 @@ static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
 {
     uint32_t data;
 
+    /* Guest domains are not allowed to read real hardware. */
+    if ( !is_hardware_domain(current->domain) )
+        return ~(uint32_t)0;
+
     switch ( size )
     {
     case 4:
@@ -311,6 +315,10 @@ static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
 static void vpci_write_hw(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                           uint32_t data)
 {
+    /* Guest domains are not allowed to write real hardware. */
+    if ( !is_hardware_domain(current->domain) )
+        return;
+
     switch ( size )
     {
     case 4:
-- 
2.43.0


