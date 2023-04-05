Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA656D7B02
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 13:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518468.805071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk19p-0003TG-E8; Wed, 05 Apr 2023 11:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518468.805071; Wed, 05 Apr 2023 11:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk19p-0003Pu-8j; Wed, 05 Apr 2023 11:18:29 +0000
Received: by outflank-mailman (input) for mailman id 518468;
 Wed, 05 Apr 2023 11:18:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=btvB=74=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pk19m-0003OA-OQ
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 11:18:26 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91da60b8-d3a3-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 13:18:21 +0200 (CEST)
Received: from DM6PR06CA0007.namprd06.prod.outlook.com (2603:10b6:5:120::20)
 by PH0PR12MB7094.namprd12.prod.outlook.com (2603:10b6:510:21d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 11:18:17 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::87) by DM6PR06CA0007.outlook.office365.com
 (2603:10b6:5:120::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Wed, 5 Apr 2023 11:18:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.28 via Frontend Transport; Wed, 5 Apr 2023 11:18:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 5 Apr
 2023 06:18:16 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 5 Apr 2023 06:18:14 -0500
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
X-Inumbo-ID: 91da60b8-d3a3-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7m5NbTPhzb7l3VwIWfMjPF0agHjhvDRI5bjtLX/cGY/YqGVspD8l/HgOc7rheU0HnfO3CrjzYkiYOrHqpAQODmbHfbaWHiG9ILddNkqjOWCR7X9L8/tQsHHdc9nwrISy7ZSkfOKEvAUebAzFOxukXXZFcsmIKPbitVnCglvdEwpl6mwDE0hQiw15v03PL/DMQq50GQVOZbYgen/UHHtnj2MiY90RKeUsyTf7RW4rGx6N7LbihxnNLRlPFf0UCuRsR0MJjhMu6wmP0A9CPPzqmjZkucJPAZyAbJLgKfHeZcaF4GO6eHT/wFyNZSchFqPhBhmA/qOR5fxHdjbW0heZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9H/C1PpC36IRqyjibUsIvzP3hGQMaqzwi6jG5cD2/k=;
 b=LcOD00f4Pwrf/Q9l5/hye4fjRCUSuUfode4Ka8gjlQEMhJsc/4E8M7QcfH7NYuaFLU30b76yQO70tCAjWDUpxjwIzJrI6HKwePMJcMNG8fWhKjftN+/D2kslmBZDPdM+04V+x1CbaK9GUXx8jUOieIJ8/omNZiS2hnQFoIOyABZr53mHKKECVJ5+plWGK97XNNxFZTdV9g7YjV2xnQO78PNe3RKCNehmhjpcoMaW4Dq+zqfsZ167hFYjl5k6DHLJBQBfsCCPAMyzKBai84Ehhsh8YZ8ikuQGhgn4ptdSxmUjml/eBxWwzcgRDEjIQM/sHreLtad//HvjsJJeURTkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9H/C1PpC36IRqyjibUsIvzP3hGQMaqzwi6jG5cD2/k=;
 b=S8u0uFlo56x4SJF28DGuVASrEGaufHrfkZD42Js/oteIoLFAIadIi4lxOxGCdROXvRJ8x+nl4k8FHV4FbfAp8pAAavf43f1O+PXGMO80GMs9E4avFLObGREL5g14kukD116YjGP1yCSYLRRS4LnwkYEbx/hLPsVp/GKjWxOzfZU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/3] xen/arm: vpl011: Fix misleading comments
Date: Wed, 5 Apr 2023 13:17:48 +0200
Message-ID: <20230405111750.12491-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405111750.12491-1-michal.orzel@amd.com>
References: <20230405111750.12491-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT049:EE_|PH0PR12MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 042fd97e-6201-403b-d9f8-08db35c7748c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0RALEhyx4hTMbmn4HT+qB3sV+Icf8kyI862pPtJsaCk9JidOAgy4PZV3O8LitYNCN9bFdqVZLx4p3ZP+er+6w8xs7MgX+EMhh8iuQxCWxNT1e85I274W0QwUurjN4ulrH8Y218TPtRV0QegQBQ2+eqJ9vaIRZW3zqJWkMaR2E5X4GkKtG4P/JnGajP8Z1cFXQmOBaMqenVPJRd1y1y1+nUDiq2oW91TbCuE7Xq4i1IjFOkJ61mCZ4WnzbYuuixxi01NqfQDPo7gvbQx1RP/mFkoQRrUZyYVPbSImOqDj5eh9v9l0VSoFc6ByXpRaXvuskf5rGhr+f7LYsE+NsKZTinzNURUvSAb86OfijPa5UaZ+BqTL3LrePiJrAG3HvVsRD95VJgQe90+SIDfVk2r+kXt8YIibBiRk0cLX/dMxV6GO4Fq5bATRsFcFxCKlUNbSwM+C5i4dy6khOjGutBvk9FjIe2p7NO8y/cfGyRoF4UnmS+GQWKIdHbI1aJu1NDJfey0rx2necX9nX6o3/jr3zs5evXyueaV1+MYSRhfm1aYx02NwyDQU6wn1d8bThlVtSs9q9HrViDboFcxFzOLLwd3xmXb7bo2sDAkOFZv7duSem4PComl7rXuji47LGPcwCMvjsXbUGkFkezrOy0YXgD8SwxFc2dkMd2c2Bz4WMU+fuSB2oCLx8eTErmxPQvxXe5pGsMtTcfQfCVZyNQ4SjHUSXcSw40fYaejnS7YVpko=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199021)(40470700004)(46966006)(36840700001)(86362001)(2906002)(36756003)(82310400005)(40480700001)(6666004)(2616005)(47076005)(186003)(83380400001)(426003)(336012)(1076003)(26005)(8676002)(4326008)(478600001)(70206006)(36860700001)(41300700001)(40460700003)(70586007)(5660300002)(6916009)(82740400003)(316002)(81166007)(356005)(8936002)(44832011)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 11:18:17.2427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 042fd97e-6201-403b-d9f8-08db35c7748c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7094

In both vpl011_read_data() and vpl011_read_data_xen(), there is a comment
stating that the guest is expected to read the DR register only if the
TXFE bit of FR register is not set. This is obviously logically wrong and
it should be RXFE (i.e. RX FIFO empty bit set -> nothing to read).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/vpl011.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 2fa80bc15ac4..0186d8a31834 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -143,8 +143,8 @@ static uint8_t vpl011_read_data_xen(struct domain *d)
     /*
      * It is expected that there will be data in the ring buffer when this
      * function is called since the guest is expected to read the data register
-     * only if the TXFE flag is not set.
-     * If the guest still does read when TXFE bit is set then 0 will be returned.
+     * only if the RXFE flag is not set.
+     * If the guest still does read when RXFE bit is set then 0 will be returned.
      */
     if ( xencons_queued(in_prod, in_cons, sizeof(intf->in)) > 0 )
     {
@@ -202,8 +202,8 @@ static uint8_t vpl011_read_data(struct domain *d)
     /*
      * It is expected that there will be data in the ring buffer when this
      * function is called since the guest is expected to read the data register
-     * only if the TXFE flag is not set.
-     * If the guest still does read when TXFE bit is set then 0 will be returned.
+     * only if the RXFE flag is not set.
+     * If the guest still does read when RXFE bit is set then 0 will be returned.
      */
     if ( xencons_queued(in_prod, in_cons, sizeof(intf->in)) > 0 )
     {
-- 
2.25.1


