Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D660349D028
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 17:58:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261048.451587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCld2-0004Qy-1f; Wed, 26 Jan 2022 16:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261048.451587; Wed, 26 Jan 2022 16:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCld1-0004OB-Uj; Wed, 26 Jan 2022 16:58:39 +0000
Received: by outflank-mailman (input) for mailman id 261048;
 Wed, 26 Jan 2022 16:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MeDS=SK=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nClcz-0004LP-SM
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 16:58:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e89::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32794588-7ec9-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 17:58:35 +0100 (CET)
Received: from SN7P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::6)
 by BYAPR02MB5045.namprd02.prod.outlook.com (2603:10b6:a03:6f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Wed, 26 Jan
 2022 16:58:31 +0000
Received: from SN1NAM02FT0043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:123:cafe::80) by SN7P220CA0001.outlook.office365.com
 (2603:10b6:806:123::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10 via Frontend
 Transport; Wed, 26 Jan 2022 16:58:31 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0043.mail.protection.outlook.com (10.97.5.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Wed, 26 Jan 2022 16:58:31 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 26 Jan 2022 16:58:29 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 26 Jan 2022 16:58:29 +0000
Received: from [10.108.8.223] (port=56852 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nClcr-0005Aw-93; Wed, 26 Jan 2022 16:58:29 +0000
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
X-Inumbo-ID: 32794588-7ec9-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gO5IPAuRt00+dbrrmJMjSSt9ayyp5Q7MJpMxSY4F6VUIaufZAGEg41LkWt9QkmD8fbb9MNdD3G/ieYwht2yCF9DgSBmYSGIFV+9FNvAS9bXNnYtBGbmJfWhaBnQjdUcQSghmqTn+LhSVbz0CJbdi1laY4xL0qx4oJmEMgO1IgGSUDQzbnOvG7OQRO4jJNhJqbYPDcOLHAUAugr1+sBR24TxGLnMVuh9tPuYN5bQU+GCwJ371UaWT9IwsUaKbJvWmXCZW8UH74cJI8M7bBusxCyC8+067xsU3iLDFfoecO2asEAcNrKdJYTzPN6RdrYdMexbilIY1GOmCmDx7zw/9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxTQOVcW7JyWAHFkPGvc7fLMrDWuRmKCeDUTObCeilo=;
 b=azyMwtuKxXhq9iEU8Y2EvMyPhuRlvd9ZSArtBVICedF6ksuGXVXHtbmpx06O7IlbQR+yllzbmpdjAzoKifALKXmHW2ElbY60G9B7BKBjJ1QZVVuJn0VdERmRpb3VPiolemydJAGkcLGCQD1cIadKUcY0TBJWNMZeQ81dNV4jhQD2Cai4Lw58krPNyRMVBY2IlenUXaaYKZh0CmctgYpwWPcBbc1HdPPXr93DInGuRVyjn3XXp1CUgrvaLUzwVYyRnsN4yrFRJwCpTVsa3RnfzFnhV7WjOmXx1wx6QdrQqezGZraRq8WLtjP0/AEXukF0njbfDlUre1BzstZz7kKx8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxTQOVcW7JyWAHFkPGvc7fLMrDWuRmKCeDUTObCeilo=;
 b=kEUhHV4bgvVY4zXxqxnUPH5GVXG4CkCk5UjMhx6lXSiaxvYI7hIZ3u7LxLUiIwbBMlVEXzGa/HKaenqAlEpTNSqAuLg3buuWw/M7vdI54LCpwsWGHfsWElzrlU7iTgpcP1t5GUSEnIDdIBPeUzVCzprLVSpVdXi8nUG98O4gdaI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@xilinx.com>
Subject: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching for a MMIO handler
Date: Wed, 26 Jan 2022 16:58:27 +0000
Message-ID: <20220126165827.61168-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccb0344c-d687-4ce1-7af0-08d9e0ed14f0
X-MS-TrafficTypeDiagnostic: BYAPR02MB5045:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR02MB504535FDCCFFCB6C26939C1EB2209@BYAPR02MB5045.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LSjoucRCeb0DAB6VyuBe4GTfJl0JAcjRZ40zo9xp+IfcpA4GjVWBnbe6eLA+J393/0zsHp7U9N3i0z1bNl+NN9F+I3syyAHUEX7P/T2oTXBVP6oAa7O8qnQvkzRdrHQrjfpwl+kLH3X7x8zg9wgENq4t3GAMesdyERvshbSjwYgIsh0SU62EzwY08Zw5TYGG8fZyrfJO+bmsosAck+1rQOumdEy1VEXv2L3PYTWtLB/4sDUm5RVsEX8/JmVlI1VTioNP5nzZMM3nBXc7RGbNIHYrl7CcFeA80xpPor+EkF2wPuRtAvsInJT7lN6Ow0tE4nt/LaZN8/9gxpct4UGtpJPgopom8Mh/QtEA8+Y/unEFtclBGiUm7MgWBBA4YCE2jsPMaVO/025MvF96LlzG9FEN5k2PKoTJoAOrkyfd7EKhL8ZlBTHQbpWfvBjYQELN11+MvbEUwA/fhEKXVXvq6ghQTJeBt5iH0sx96sagXS1em8iTd4P3iFEIJjIb0PUi9ayNLZ4RHP2cXbhFpbo40iOJY2qYbBJUKwDDWDtfl+hc2XVLnpyrzyuv2i3rBPvEGdiiNdutByjpUlGaH8qifqVpwsmrfN8zf2/3vmkUazDXvnCRTWMVyTijEyK/ptINIZCo5cDHXzTz+pyyEKGwI5w8lg7V1BHWclU5mvNtXsWV7//ev1uyxk3QafBx2bprfv5eya2RHKKRSJCNw5Gfh3U9fYvo/BdQSa2cjiKT55Kgewypjvye1pB15kdH3P2jeqzz1OGt/tMGVX/5jLZuTcdz8o7YqS1+ZGnKgmgeuAQ=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(7636003)(9786002)(54906003)(83380400001)(82310400004)(6916009)(426003)(70206006)(70586007)(8676002)(5660300002)(4326008)(336012)(8936002)(508600001)(316002)(966005)(107886003)(47076005)(36756003)(1076003)(26005)(36860700001)(186003)(356005)(2616005)(2906002)(7696005)(102446001)(51383001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:58:31.0155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb0344c-d687-4ce1-7af0-08d9e0ed14f0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5045

Refer to Armv8 ARM DDI 0487G.b, Page D13-3219 "ISS encoding for an exception
from a Data Abort" :-
ISV - ISS[23:14] holds a valid instruction syndrome

When the ISV is 0, the instruction could not be decoded by the hardware (ie ISS
is invalid). One should immediately return an error to the caller with an
appropriate error message. There is no use of the MMIO handler. This is the
reason why one should check for ISV before attempting to find a MMIO handler.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---

Suggested by Julien Grall in https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01245.html

 xen/arch/arm/io.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 729287e37c..14d39222f2 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -109,6 +109,13 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
 
     ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
 
+    /* All the instructions used on emulated MMIO region should be valid */
+    if ( !dabt.valid )
+    {
+        gprintk(XENLOG_DEBUG, "No valid instruction syndrome for data abort\n");
+        return IO_ABORT;
+    }
+
     handler = find_mmio_handler(v->domain, info.gpa);
     if ( !handler )
     {
@@ -121,10 +128,6 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
         return rc;
     }
 
-    /* All the instructions used on emulated MMIO region should be valid */
-    if ( !dabt.valid )
-        return IO_ABORT;
-
     /*
      * Erratum 766422: Thumb store translation fault to Hypervisor may
      * not have correct HSR Rt value.
-- 
2.17.1


