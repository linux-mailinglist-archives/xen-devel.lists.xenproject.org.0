Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8423C607AC5
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427743.677152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0S-0002DR-St; Fri, 21 Oct 2022 15:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427743.677152; Fri, 21 Oct 2022 15:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0S-00029b-NU; Fri, 21 Oct 2022 15:32:20 +0000
Received: by outflank-mailman (input) for mailman id 427743;
 Fri, 21 Oct 2022 15:32:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2K=2W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olu0R-0000nK-2V
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 15:32:19 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b8a4905-5155-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 17:32:18 +0200 (CEST)
Received: from DM6PR13CA0027.namprd13.prod.outlook.com (2603:10b6:5:bc::40) by
 CY5PR12MB6180.namprd12.prod.outlook.com (2603:10b6:930:23::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.21; Fri, 21 Oct 2022 15:32:15 +0000
Received: from CY4PEPF0000B8EF.namprd05.prod.outlook.com
 (2603:10b6:5:bc:cafe::1c) by DM6PR13CA0027.outlook.office365.com
 (2603:10b6:5:bc::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 15:32:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EF.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Fri, 21 Oct 2022 15:32:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:32:13 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 10:32:12 -0500
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
X-Inumbo-ID: 8b8a4905-5155-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9UYVDfYKLN7hUjEzZdFXyB5fc48PmkoSwhgjhT3vz05q8JOvXGAsEseA7c3xJbcl481KHAj+YTLCRj7lOakU7oGCWeZz9jsgz6kRPI349iWq20oQ+NctiIbMKE6dihza3v444V8CkHTr7GXtrE80CQlY+Ej3gJDQvzg7OawlpkVtPjhZ7P6HLyKNsxKoGb1Z10tH4u54wWzipmfT9A9YW7D/Qwy2PwjZvjtpJS/0qJ5MuuAnyieIlk89WlnPOnYLZPxilJ7liwswzfXIr8fds89ehr8hE29EXzj4DXgSodc/YYhE9ubTB+UqvWN3QC8nFfbrRlORFTlYiw01AVEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLgWVOt1DQu03UMiS7oEpaPHJ6p9hu7nypVok0V2YKI=;
 b=lWnw82peHetD5cfrEB8KlJaRMnQjUv8TTLPe7HxWmVIsY7IF0vbrFy7x4bR3O5Ik02R0lBLlcRMjXM2ILdGPO10JTQqmDzqzu/VqMQMvNnijZemcY3rHxD+njLIhf7PAdQlzuX7nDxP1/1mBtXnUuAIEcJphtA7qff/tCVWy+m/u4q8W3VScdgIUXwNFsz5FuBFtL7N1rn2D/K8tOW3PR9tF+EhM6y5UubLA3yFq24w8iyvgrlst9b9U3IRx8jOwioC4iH68TcXuILkjNOKXh3Qk3WVgTu+HZCui+zOLADLieOj4Fx/s/5my3BeeO7ohWCZdmRCIR924V7mTQEOpdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLgWVOt1DQu03UMiS7oEpaPHJ6p9hu7nypVok0V2YKI=;
 b=CqaEY6X15ctal43GnekMmBOuPCw/Zq1DAGH0wIqoQs6LvRocH3YdiPcJCVajo5uw/cOWFxECRlsLoc4ps5Pq8jXOAuymG0jaz/9lFL7OlhhhecleuZ9ZcCui42HG9kXVVaUOGWdFm56ZBb9sLz0XQ3vTy6iX5hqm6OnaCGGKTbc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [RFC PATCH v1 06/12] Arm: GICv3: Emulate of ICC_SGI1R on AArch32
Date: Fri, 21 Oct 2022 16:31:22 +0100
Message-ID: <20221021153128.44226-7-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021153128.44226-1-ayankuma@amd.com>
References: <20221021153128.44226-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EF:EE_|CY5PR12MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b442ed-71db-4171-2304-08dab3796e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	459vLuwI9rmjAhrpJ7NdCx/Z+zqYT1q+tAqLpmwWg1eNWNBENpOW8oF007w2TbqUdHEtgPAqmibqnrNO8SlLelC4ln/K7mnO31o5B8ZjcxpIvhaxG7UeoKRXWBrRUhjneDyG9V4nN2NKl+E/e9I/Grbnuts/64styNr/OsKmh2M/yYbxLKFASSRGoSlI/1lldHTaVXzOQXcY2OT0/XNJ6JHkB+fhWDolQdrY3VUs1urydq542ZLOYj7U/I/q+jfw4cjhbrfQtz3yY/6/7gj2EIpCmaQsDtJf8lOUYi20FmIzLXXM9jzXvR3hFdfDKsxJ2sXayfM5GgTBJJqcYDytiGb+jcuFawG/oqHkrgiUExV9GA640oYeA97kfNRE00UdwGkoSTZSbXA3RlJH/4w4ylwe3i0ciGYuTeEeKunobzFtauYOXiDaNtYKoabDEcNGosPy7A6cTfYyf75OqpCecXGZLuUYVXI7yaU4MN81k9PXdSuiM1F/eFK//jfagUNlMNday/PYClsNrBYd2KAmfQ4z9TeXJ0m98KDcvmOWI84OeZ6uMOFuQNzaE5SlhhLjt9HfTh77gVhQvgsIG2JHNBy0YO+kE1D+vz4enmRLQWr9FNe5023YjLGHgzAibCkdSv3Zg0E46dYOx1VNmSd+oK2bJpKrCOrZolqtDqcN/wi1wFLE4qz3AOFNwLl6A5JGf+sPVrMlsLLkDwDW/YSjLuEYjhDQ1Q1k2ZROIYNJpKpQI/D67ovE7VexsjDk9HlAOecTuYLCOhVA5mTZ64/N0p5ftRHYaoP1o4ijMk7gslg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(46966006)(36840700001)(40470700004)(6916009)(54906003)(70586007)(83380400001)(5660300002)(8676002)(4326008)(2616005)(70206006)(4744005)(1076003)(186003)(40460700003)(26005)(41300700001)(36756003)(8936002)(316002)(336012)(6666004)(2906002)(47076005)(426003)(40480700001)(82310400005)(81166007)(82740400003)(356005)(36860700001)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:32:14.5660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b442ed-71db-4171-2304-08dab3796e26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6180

Refer Arm IHI 0069H ID020922, 12.5.23, ICC_SGI1R is a 64 bit register on
Aarch32 systems. Thus, the prototype needs to change to reflect this.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/vgic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 9f31360f56..48e8ef95d2 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1482,7 +1482,7 @@ write_reserved:
     return 1;
 }
 
-static bool vgic_v3_to_sgi(struct vcpu *v, register_t sgir)
+static bool vgic_v3_to_sgi(struct vcpu *v, uint64_t sgir)
 {
     int virq;
     int irqmode;
-- 
2.17.1


