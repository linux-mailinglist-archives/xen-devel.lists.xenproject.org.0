Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0466D7B01
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 13:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518469.805076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk19p-0003WE-MB; Wed, 05 Apr 2023 11:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518469.805076; Wed, 05 Apr 2023 11:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk19p-0003TA-H3; Wed, 05 Apr 2023 11:18:29 +0000
Received: by outflank-mailman (input) for mailman id 518469;
 Wed, 05 Apr 2023 11:18:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=btvB=74=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pk19n-0003OA-2Z
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 11:18:27 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e88::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93a97213-d3a3-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 13:18:24 +0200 (CEST)
Received: from DS7P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::25) by
 IA1PR12MB7734.namprd12.prod.outlook.com (2603:10b6:208:422::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 11:18:20 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::2f) by DS7P222CA0022.outlook.office365.com
 (2603:10b6:8:2e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.37 via Frontend
 Transport; Wed, 5 Apr 2023 11:18:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.28 via Frontend Transport; Wed, 5 Apr 2023 11:18:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 5 Apr
 2023 06:18:19 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 5 Apr 2023 06:18:18 -0500
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
X-Inumbo-ID: 93a97213-d3a3-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHh3tRuCS0Lg5C3Tq6P6x0xOB0FnbYQVfh4OfOuKxKw3t3a+PTDKaebTimcA2ee2m4MqTeUVlbqQbg5cnhOjC0Bmu5VAzxucmSa841KW+S1wfRDXjvDVtYxUCcjPCcZRTh5SG7jhVI5RUuMjerVOJGqvUVn782ESYZKZ7wuaKmbCSFwjZ4mHfnD4e+hBHgHAVhNIyGAuHO6CmIQwk4cznwLUBNcBDN5cmEQFO+ie73yjrwkFezyx3K4kLkQ2qa5ZB0RYr/uMmhCV/toVY8p95UiyG2DxqSXGcF4dXZ7a1Qjl9x09/2LqJb58YaBrUzWsUuzwRy1cvjW/HbuYE6DMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4oUaq7lN8GdxSqirWE6VLLbTs/fytDNa65dm3uA6/s=;
 b=mug+DyJJAZSjAG0UIkT8KjUfmhoWC6M965ZyxpF/CHnPOoTSHVuuNcQCzTqrMzXiu31/qbUpqnngH5eSEw4UsPwGJo30bnnytVsoHZ3UlUhkMLuoJ4dMjEEM+4pUUlafB8t8PM1djhU970gHPSMdgsSwdVFk/S7C3jdk9Il3GqlpuXN2sZhwOho/Z5U/G67nmMEG3uPe56R1rE4UIh1leuwauPjcWioHmhFetyGT068OIaXOv78YP5m9FbjB87yQQty/QQrka+VPBT+I0Gmyj2Y/aBuALCcIUojIicGcdGeVge7HBTAq8j5vzy0FYWv1pb2W757Dk6Erh3H4CGE1TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4oUaq7lN8GdxSqirWE6VLLbTs/fytDNa65dm3uA6/s=;
 b=GGPjY6Sk8EY31upxf3pvXMKjvhmR5OWXEIsSh3IwDq9BwOXDEDLGF86X7BQh3y5CIUBjLlrlqt+TsC1EdMBtXvHkKfq7lHp8yBy2RtKO00CPZAqsiBlIrC+DqWV52YftIpby/bregZ9ExP9/gTPyBto3Tx+XuCFXJvEkMMdEaAc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] xen/arm: vpl011: Do not try to handle TX FIFO status when backend in Xen
Date: Wed, 5 Apr 2023 13:17:50 +0200
Message-ID: <20230405111750.12491-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405111750.12491-1-michal.orzel@amd.com>
References: <20230405111750.12491-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT061:EE_|IA1PR12MB7734:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ddf0363-7b25-4ed1-c010-08db35c7765a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7B7zit89wb63fCYp2LFg+8QgEUB4Nx2tYbry3sdtjGK7YV8f0oZfGcKsRh+tuQduXsx3bx4JdJwl+Zy0BgdWsA5sbFH4M3lkEMh24Z1TZ+SoV289UbyghlO5gzxn352weDtNTvaXaAZlN8kH0G/eulweLK4uNuMNNlwDqnkQhkdX5OIwo41rbbSn8Ljt1EsHJmf5RyKH47BzQ3GUrfnyjNmDsF3gf5q4seflzwxPyOi6dQRwGeoPPfW6MCpxMEQkv4/t0CxsQCM6Tj9ECkSvnx3La2Co0+AdGzYNtY10K/dAumfXeLz6qmmhEWAKNVmXLYyEK0UPp5hhUPWC8JY+4N2n+EXJ9X+HMebRy8TYAMFcnUpXE+P5WNYcugAQ+XUSrmzIfcvXwn5QYVu/DWWtq7g+Cm8RyARoARUvIZCAyMsVzdsF9FKnUb0vISBENWhFEzmehgKiyaqBwJokrjMln82CyhQu2HwikmXO9z22bOgNehpMOllzEdXkBn2eMwpkjTkxM9vlxwLD402KFk/sQIwnwHjp6DoRXaA+76W9hYNFqXFZf9SSSNyK28JuTDipwKGVwOFBupeamnwqd75X9I4J+Uyzxolsjhs/kYV+VkkjG0DBtPPRDuH9yS3e8BoXzH8icqDInjU0A0IPHarKY2JMNNVOvvb1AN5jSwkzt8pH1YsvwOCz49RH0Mxvca5NdGy4LIe8satRfLsyf/Y9OUSjr45yQ9izAVICNn6zqyE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(2616005)(8936002)(186003)(44832011)(5660300002)(2906002)(26005)(81166007)(82740400003)(1076003)(356005)(36860700001)(54906003)(4326008)(8676002)(6916009)(41300700001)(86362001)(40460700003)(426003)(70586007)(336012)(70206006)(478600001)(316002)(40480700001)(82310400005)(36756003)(47076005)(83380400001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 11:18:20.2698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ddf0363-7b25-4ed1-c010-08db35c7765a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7734

From vpl011_rx_char_xen(), we call vpl011_data_avail() that handles both
RX and TX state. Because we are passing 0 as out_fifo_level and
SBSA_UART_FIFO_SIZE as out_size, we end up calling a function
vpl011_update_tx_fifo_status() which performs TXI bit handling
depending on the FIFO trigger level. This does not make sense when backend
is in Xen, as we maintain a single TX state where data can always be
written and as such there is no TX FIFO handling. Furthermore, this
function assumes that the backend is in domain by making use of struct
xencons_interface unconditionally. Fix it by calling this function only
when backend is in domain. Also add an assert for sanity.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/vpl011.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index ff06deeb645c..7856b4b5f5a3 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -261,6 +261,9 @@ static void vpl011_update_tx_fifo_status(struct vpl011 *vpl011,
     struct xencons_interface *intf = vpl011->backend.dom.ring_buf;
     unsigned int fifo_threshold = sizeof(intf->out) - SBSA_UART_FIFO_LEVEL;
 
+    /* No TX FIFO handling when backend is in Xen */
+    ASSERT(vpl011->backend_in_domain);
+
     BUILD_BUG_ON(sizeof(intf->out) < SBSA_UART_FIFO_SIZE);
 
     /*
@@ -547,7 +550,13 @@ static void vpl011_data_avail(struct domain *d,
          */
         vpl011->uartfr &= ~BUSY;
 
-        vpl011_update_tx_fifo_status(vpl011, out_fifo_level);
+        /*
+         * When backend is in Xen, we are always ready for new data to be
+         * written (i.e. no TX FIFO handling), therefore we do not want
+         * to change the TX FIFO status in such case.
+         */
+        if ( vpl011->backend_in_domain )
+            vpl011_update_tx_fifo_status(vpl011, out_fifo_level);
     }
 
     vpl011_update_interrupt_status(d);
-- 
2.25.1


