Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3A574F404
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 17:47:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561792.878326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJFZx-0001oF-L5; Tue, 11 Jul 2023 15:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561792.878326; Tue, 11 Jul 2023 15:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJFZx-0001mI-I4; Tue, 11 Jul 2023 15:47:05 +0000
Received: by outflank-mailman (input) for mailman id 561792;
 Tue, 11 Jul 2023 15:47:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e9Pp=C5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qJFZw-0001mC-Tt
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 15:47:04 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e1abbee-2002-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 17:47:03 +0200 (CEST)
Received: from MWH0EPF00056D0F.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:11) by CY8PR12MB7731.namprd12.prod.outlook.com
 (2603:10b6:930:86::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Tue, 11 Jul
 2023 15:47:00 +0000
Received: from CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::203) by MWH0EPF00056D0F.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.5 via Frontend
 Transport; Tue, 11 Jul 2023 15:46:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT090.mail.protection.outlook.com (10.13.175.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Tue, 11 Jul 2023 15:46:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Jul
 2023 10:46:58 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 11 Jul 2023 10:46:56 -0500
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
X-Inumbo-ID: 2e1abbee-2002-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuwP71lsQ8G3P/KMgRtEhku2J+hxPMVUwyyRHdDHJmi6CGMdH1FM2SB1fMcA77eGickuZmEaCtcIV6WtGDwZjFbUudVomC89NMSOFXUGnYdAwo1ml+iRWSZUYJfJCoJy17XKc2hEkrP0/a07ufaW7bvr2yZOrIbdWL8Pp8YID1+MHt0aCEVbLnMNQNbjxNk2jJ2dw5nNXdkfhLVu/zUBEU9FtUuinM6apszXRCgIKsKcEl846PhsQqpQwJHprvGE4/sMvGOh/qqcDMh7hdGcT2nbYM5NbB9EERYsGA5BzrkN5K0WxCv4M5SbCXLXpe6fVwfRyeKpZkVY0QUdSLzp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDDZwL1ASjyPqenwXuqG6HJNX/FSDxegFg/UU6wCrVA=;
 b=WQ+M8AZCBaYfniOrxEwJGcIYuI/2skWBTYFQmga0ZU0k9OkMkuT70iq1COR8EKCZrGon0XGekj8CP1yoT4ycyRbut8asygDFeDK6IZwy3SbZ7yYh1d1wRjvnAGUWdqjWrBq0gv7ygMFKbJzpV8WKKPlhXH0ue4TQPjrhcA6gE3u99wuLpp9vYR8o57yVlTzTzZu4WJDSmO4WbTe2uuT62zXGwRNeU9oLzweZXjdwSbpfr11MMyqJwvosx1EO020QLfEr4dF3UXhc7wTyrCSP85/zeM5hRFa4BEPTbin84+AfZMJLWmVZx1VDlEEKO3wHB5hxMocNHtEmQFSQUcOV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDDZwL1ASjyPqenwXuqG6HJNX/FSDxegFg/UU6wCrVA=;
 b=JCWVfZk0Sr/rQ+Jt+Aa5OkSuPOgxW+LdKxuOFSUW5VzOw0oP4khlPBPJq1mhqCMQm6u56jpRH26wY3Otv6brxG/7+gWR7F9f7FPmFT/Nm+8rIPnICM8XENvFeg7uK1MeAGx+rOTXoy7dzAhkX7VHcsiZCEXxTNL7szkjdtKkHFo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH] xen/arm: pci: fix check in pci_check_bar()
Date: Tue, 11 Jul 2023 11:46:47 -0400
Message-ID: <20230711154648.729567-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT090:EE_|CY8PR12MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 9617cba2-14c8-44c6-5084-08db82261036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cWnniUDrknxbIpkvY7EhQMRQxHn+LS+cjhD86qbZ1AER0bzccNpeGSsYvOSXxfOHkC35DwEB4oOzIlemTlNUT8Ul22Ip70mpCnJXAHp7VD9r48ofbJLkLZbs4ANdBKjSQ3WsxoROFLCtlWUDr/xR52/rDwizYwCuqBxPmden3lZt5hCi5DgZfCgLF06rqpKCbJHqvrO0PiVsTHdIMqm69M4mrDz4SxxZK/0cnQ/DwCwDEDVaFKYsGxrMghDQfWPo3Pg05qLmuUG0FjjJfVWJZ5qexkaAUkEeKeSoxyEHwCnTOY/eCm4X+y54kQVAIFiJr5hOI64oKd7ibt/g/+fe0ksch/kPkDQgw2PX+CayVFdZyTxAROjUf4KAR8dPzamk8vkqwHOrNmoYkaY3tXMltZBAMsZ9TERauduDe7Io1JnjYH5IiDvyrqMfTOE74qpfbAKfCPynLO/ugNJtLqpK9evXTh/wV/7uEgvrp5ZaqBixl5Hindq3cv3gj4GgUC1PgHWVVcuaOn2wfFCZvtx6XKtLEKnLAoJz3H9kOKsHLDYcNMPGwJoO5hPQb73iAXEMrocFj6KHHWkDOEznYaoKwtZwMlbR6bTHbRgJU7+r2vB+keWxO5uWNWe00A5bfDARmjvDQ34OgREzW5Xru23LOUqQkdaXuYPY6KyqJjWB3mwpq2pqS4hw7hoUNAL/esDwztOL8n9FSFY1C5LvQCaXfPiJs2v9NOl+5LeyAMvtJiOj5kS7QRwqHY9Ikt8TJC2wdOqxv0fSokv5P/nRkHzZug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199021)(36840700001)(40470700004)(46966006)(426003)(8676002)(8936002)(36860700001)(5660300002)(47076005)(2616005)(83380400001)(186003)(26005)(1076003)(86362001)(41300700001)(6666004)(44832011)(82310400005)(336012)(316002)(356005)(36756003)(40460700003)(2906002)(70586007)(70206006)(6916009)(82740400003)(40480700001)(4326008)(81166007)(54906003)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 15:46:59.4014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9617cba2-14c8-44c6-5084-08db82261036
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731

When mapping BARs for vPCI, it's valid for a BAR start address to equal the BAR
end address (i.e. s == e). However, pci_check_bar() currently returns false in
this case, which results in Xen not mapping the BAR. In this example boot log,
Linux has mapped the BARs, but since Xen did not map them, Linux encounters a
data abort and panics:

[    2.593300] pci 0000:00:00.0: BAR 0: assigned [mem 0x50008000-0x50008fff]
[    2.593682] pci 0000:00:00.0: BAR 2: assigned [mem 0x50009000-0x50009fff]
[    2.594066] pci 0000:00:00.0: BAR 4: assigned [mem 0x5000a000-0x5000afff]
...
[    2.810502] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)
(XEN) 0000:00:00.0: not mapping BAR [50008, 50008] invalid position
(XEN) 0000:00:00.0: not mapping BAR [50009, 50009] invalid position
(XEN) 0000:00:00.0: not mapping BAR [5000a, 5000a] invalid position
[    2.817502] virtio-pci 0000:00:00.0: virtio_pci: leaving for legacy driver
[    2.817853] virtio-pci 0000:00:00.0: enabling bus mastering
(XEN) arch/arm/traps.c:1992:d0v0 HSR=0x00000093010045 pc=0xffff8000089507d4 gva=0xffff80000c46d012 gpa=0x00000050008012
[    2.818397] Unable to handle kernel ttbr address size fault at virtual address ffff80000c46d012
...

Fix this by changing the condition in pci_check_bar().

Fixes: cc80e2bab0d0 ("xen/pci: replace call to is_memory_hole to pci_check_bar")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/arch/arm/pci/pci-host-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 7cdfc89e5211..e0ec526f9776 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -406,7 +406,7 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
         .is_valid = false
     };
 
-    if ( s >= e )
+    if ( s > e )
         return false;
 
     dt_node = pci_find_host_bridge_node(pdev);

base-commit: b831326ee2f9ed94523b3d8b0fb2da2a82113e9e
-- 
2.41.0


