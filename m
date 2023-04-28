Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F367A6F1DBF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 19:59:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527455.820104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSNJ-0001WF-0m; Fri, 28 Apr 2023 17:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527455.820104; Fri, 28 Apr 2023 17:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSNI-0001QR-Sd; Fri, 28 Apr 2023 17:59:16 +0000
Received: by outflank-mailman (input) for mailman id 527455;
 Fri, 28 Apr 2023 17:59:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG5/=AT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1psSNH-0006vK-J6
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 17:59:15 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e89::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 623c960d-e5ee-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 19:59:14 +0200 (CEST)
Received: from BN9PR03CA0799.namprd03.prod.outlook.com (2603:10b6:408:13f::24)
 by BN9PR12MB5051.namprd12.prod.outlook.com (2603:10b6:408:134::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24; Fri, 28 Apr
 2023 17:59:11 +0000
Received: from BL02EPF000145B8.namprd05.prod.outlook.com
 (2603:10b6:408:13f:cafe::1d) by BN9PR03CA0799.outlook.office365.com
 (2603:10b6:408:13f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 17:59:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF000145B8.mail.protection.outlook.com (10.167.241.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.15 via Frontend Transport; Fri, 28 Apr 2023 17:59:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:59:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:59:10 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 28 Apr 2023 12:59:09 -0500
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
X-Inumbo-ID: 623c960d-e5ee-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6ieHHG+7eRz/D2vOKRn93Ub9PW1l6KtbpVevoYAmKa6uMkfS/n/FhCH1siIMTTgW8yGZbKX6jby71GcnE4wjAD2/MdSMhEzhnZkuXRRP9IrTB6SfEM93sD3/gVaPAaLQZ4WLFRqURWLvsVJCT1INDLa7szAuoOaeu9Na799S8UNAzwB3jqIG+WzQWhncJBKKva9Z9DO0yhvB3c7HHbEq+9piaXblQqZ8YfbKsLvKyDc/9cWEWNEqUqeGtVijNYJ4qMXpdSDEy9j1n53AbQGsRe9fKQB439MeT/mZMt8BbJIqymdUCW2TwLV53j43o9OZ8nvgwyXXSzosWrb0+Kd5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUQ3wxOwdNc9vYtQ3TKA2WsU1jIK+EVT1oaYvAZOlv8=;
 b=eJgWR40tEeRAW7W+aqCGa4Nkd3VQxq9rPOA73le29P7GY9yfCq4J+Mg1Kg3PsqrK3lPatsHMJ/g7njyveHgv5HgVSUvEALy7/mwB0I4h8O0LVV4uIzLjCEb98KwRSs6ZlJyeCUPvGVGtRzVPjAZS7Jrmnid0jSKMUtaJCJLyYbAO82g1Qq0uhrMjP05sI1AsVQqRtAtxd+deKtzYAN5DaSNMeZ6pzQWLONiTUpY4cEe19OVLuDoEv90XnjzAOeiBq61xApqZwjfrqlTpyJ2qk7b9z6//zD3+6IIKgAiW4OakLZygBJKKEJkqXTul6VHuoeqKNz3+xGqrrW3TU/R5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUQ3wxOwdNc9vYtQ3TKA2WsU1jIK+EVT1oaYvAZOlv8=;
 b=el8UuNA7dV42j09VKpbSshjVsgfnbW/nq/FU59mhlk2OExzIvvD62DRsYtBRS5QpeNAXb4F3sK7A9mH5lguJplOU7aiN4gzgebrygRHMO91EXbZwdlz0iqr0zuqIIULNItHQmaFdzReOUAluhraOFRor4D2jOlYYtruUoOXlq7E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v6 10/12] xen/arm: domain_build: Check if the address fits the range of physical address
Date: Fri, 28 Apr 2023 18:55:41 +0100
Message-ID: <20230428175543.11902-11-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145B8:EE_|BN9PR12MB5051:EE_
X-MS-Office365-Filtering-Correlation-Id: f163562c-bc26-436f-d1ba-08db4812453f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uzuj9bnuFMC3N94up0WidahJ6o9QvI4hRGpDGZbIEcsQyyov7mRhhYaabw18pHHC12kngopsssqrdumdyLz3ahckfA0WifffSSyfSMAy2PGeXygwwmPc45mHKtUMo1L7ARKJ5s/vjObWyU9upl3ngkf75Mahb38wqmfz5nsu8QNOYuQzsttE9tqHZTcDN4vzyTaAjmmLsj0vUtWHRrD6pz7pdQG3kqy2d3qbIMCeC4cparLu8ILq9G03nfqHbM0Qd/AGSMhcoIKCsTziTjmH1/KWiwNK6kS2p7Ivi19LAsYKGTNu+sET7B9KGDYcDVsAbCzWzNXhG4a0cdy6UV9faUSxugF0Y3FIDO61jSngbOx5qk0TpokEXb6pwEJQe1xPRiAgxT8HScVPk1lGI1dICc89HGOnn63ZCkvYGRHpfAbAp0bVRoi+x3k8yWE5TG9KvZ0OLJ+HOv3u+MGaPZCuZ0MTkcyBsIhImTsXfbNlsu42iSTEw7g02BmnhjaS0R1jU5e5oWQZgrypQXwot+g4Sr7HOkgHvqpHS0DVutcngYKTZ/hvUkUXGcSmzbB09lj2n2VOP5fA4jDkWovJBtCNMo5ko7P6fYLUBclZPQ7WaSjsaOuR7Sjjh/ofAebv4NWIivx5nkEZufneiE1OGoZd9iwkWQ47iZNc7V5dv/iCnILK+JdXXSkM7kwwn1OttqevKaiomF+pbjlWFRzBn5BFAwPYSNyRQ56FExgbHrHwTts=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(54906003)(478600001)(5660300002)(8936002)(8676002)(36756003)(86362001)(2906002)(103116003)(7416002)(82310400005)(70586007)(70206006)(40480700001)(4326008)(6916009)(316002)(82740400003)(81166007)(41300700001)(356005)(186003)(26005)(1076003)(336012)(36860700001)(47076005)(426003)(83380400001)(2616005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 17:59:11.1009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f163562c-bc26-436f-d1ba-08db4812453f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000145B8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5051

handle_pci_range() and map_range_to_domain() take addr and len as uint64_t
parameters. Then frame numbers are obtained from addr and len by right shifting
with PAGE_SHIFT. The frame numbers are expressed using unsigned long.

Now if 64-bit >> PAGE_SHIFT, the result will have 52-bits as valid. On a 32-bit
system, 'unsigned long' is 32-bits. Thus, there is a potential loss of value
when the result is stored as 'unsigned long'.

To mitigate this issue, we check if the starting and end address can be
contained within the range of physical address supported on the system. If not,
then an appropriate error is returned.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-
v1...v4 - NA. New patch introduced in v5.

v5 - 1. Updated the error message
2. Used "(((paddr_t)~0 - addr) < len)" to check the limit on len.
3. Changes in the prototype of "map_range_to_domain()" has been
addressed by the patch 8.

 xen/arch/arm/domain_build.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9865340eac..719bb09845 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1643,6 +1643,13 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
     paddr_t start, end;
     int res;
 
+    if ( addr != (paddr_t)addr || (((paddr_t)~0 - addr) < len) )
+    {
+        printk(XENLOG_ERR "%s: [0x%"PRIx64", 0x%"PRIx64"] exceeds the maximum allowed PA width (%u bits)",
+               dt_node_full_name(dev), addr, (addr + len), PADDR_BITS);
+        return -ERANGE;
+    }
+
     start = addr & PAGE_MASK;
     end = PAGE_ALIGN(addr + len);
     res = rangeset_remove_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end - 1));
@@ -2337,6 +2344,13 @@ int __init map_range_to_domain(const struct dt_device_node *dev,
     struct domain *d = mr_data->d;
     int res;
 
+    if ( addr != (paddr_t)addr || (((paddr_t)~0 - addr) < len) )
+    {
+        printk(XENLOG_ERR "%s: [0x%"PRIx64", 0x%"PRIx64"] exceeds the maximum allowed PA width (%u bits)",
+               dt_node_full_name(dev), addr, (addr + len), PADDR_BITS);
+        return -ERANGE;
+    }
+
     /*
      * reserved-memory regions are RAM carved out for a special purpose.
      * They are not MMIO and therefore a domain should not be able to
-- 
2.17.1


