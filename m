Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B72B62F2EA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 11:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445564.700810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysX-00079Y-P6; Fri, 18 Nov 2022 10:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445564.700810; Fri, 18 Nov 2022 10:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysX-00076M-Le; Fri, 18 Nov 2022 10:45:49 +0000
Received: by outflank-mailman (input) for mailman id 445564;
 Fri, 18 Nov 2022 10:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nf+F=3S=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ovysW-0006Il-1F
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 10:45:48 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28bb13a9-672e-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 11:45:47 +0100 (CET)
Received: from DB6PR0301CA0088.eurprd03.prod.outlook.com (2603:10a6:6:30::35)
 by AM7PR08MB5429.eurprd08.prod.outlook.com (2603:10a6:20b:107::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 10:45:40 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::b) by DB6PR0301CA0088.outlook.office365.com
 (2603:10a6:6:30::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:40 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Fri, 18 Nov 2022 10:45:40 +0000
Received: from e3a20634adf0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA6E12D7-70B0-4910-B3C3-49F863636645.1; 
 Fri, 18 Nov 2022 10:45:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3a20634adf0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Nov 2022 10:45:33 +0000
Received: from FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::8) by
 AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 10:45:31 +0000
Received: from VI1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::e2) by FR3P281CA0145.outlook.office365.com
 (2603:10a6:d10:95::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:31 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT015.mail.protection.outlook.com (100.127.144.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:31 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 18 Nov
 2022 10:45:24 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 18 Nov
 2022 10:45:24 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:21 +0000
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
X-Inumbo-ID: 28bb13a9-672e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZdzCTYPCRdEijtzlPbxujpvQi5i4DcA5OYYtuNHtTA=;
 b=36KCODnxdQIUd6vS/M5g5EvmQUhnOkHBhWp1gz5em/Qt2fJZGdA4bIG44xf8Do7kQCYQdsLeuwXRdQ10JSqjliTFUaHQw2PNG7nr32imrIIsOf6JTeTE6FszvsxRqjKoRiCtp2BXYloEmHRt6jSagS24L7mpttz1df6+VcS/Bxw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 68940c93ce4c54ac
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOhPf3MiTjcAS4jEqV0YfupikNa2uTomaapC7QayCvCirsBR/VK7TqpLGweO26fAEOybIrMr1sQCGktkqgsQhTS7IDxILNU03K8HYLhusUIjZiLrKczznOfw9x7pATGZ/voP2OabsvtW1NR8xYoudvam2Exi34G3aYeunbnS4ZFwu+2BGw+CVHTc1plAakUqFZq0tnV6uTgVs40ESjQ34qCbh2jtwGQlObFTIkSV483oDxiZAd9xi1wqhYEDWll4ttuCWls2xMC7sSvMkez3Wo4efZB7o++nv68y0uk3zt4uWnD+vC+bjqrQ9lCr59InQIsk9p9i32wmKbR7WLI9oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZdzCTYPCRdEijtzlPbxujpvQi5i4DcA5OYYtuNHtTA=;
 b=Xi5oZyIgVWjGLqPYYPUUsM9FCXf1qVZ8HUWVaXVv592NTCDpxgyGjtIqu2RF+aCKwqLQaZIQiEyePNo680JZv3eYueSA+6fSTB3DJl4mUsfczrAlUgzakjVbEyRtf/AsQ10WJQr6MQyMbB5wqW9omw+1gb99tFxhM4rk+0Liy5MLydwgmyB1FsKQ8OvRlXFQSW754uji4tOeRdqoWvR/hAxTt5Vhx6zu42uzYh5fDhqhj/c2ukGez63r5v+D7kmINXdZZ1zvjcy9j6vK7Y8Q8jem5juf6X9XmAUHvEYPfxVpDPOLn7DH7DvGmXKIXxH3l7yHRDLDO8Zit/YwrvpOhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZdzCTYPCRdEijtzlPbxujpvQi5i4DcA5OYYtuNHtTA=;
 b=36KCODnxdQIUd6vS/M5g5EvmQUhnOkHBhWp1gz5em/Qt2fJZGdA4bIG44xf8Do7kQCYQdsLeuwXRdQ10JSqjliTFUaHQw2PNG7nr32imrIIsOf6JTeTE6FszvsxRqjKoRiCtp2BXYloEmHRt6jSagS24L7mpttz1df6+VcS/Bxw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Jiamei Xie
	<jiamei.xie@arm.com>
Subject: [PATCH v9 3/6] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
Date: Fri, 18 Nov 2022 18:45:05 +0800
Message-ID: <20221118104508.768274-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118104508.768274-1-wei.chen@arm.com>
References: <20221118104508.768274-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT015:EE_|AM9PR08MB6258:EE_|DBAEUR03FT040:EE_|AM7PR08MB5429:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e28034-a03a-4168-02a9-08dac9520915
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 E5xqWbLvAnn3Vd2pP0lTxuXaIuhCakLKm1XGAHYGj8VFbaQkh/c01f9SxL9zqO8rCpRWQP1pChaLHXuVWOW7Duh/33iOlqHEn7QjO2Ph8e0WQtNfjmybYMLbzfJwF1YJ1kuu4bH4orCAPbPIoYoxkL2ts3euoIwUI198VI1/n13IJf3rphIDInq8cTdT4fh4AF/Xw2o8fX/MN1xxGEOVPGLwBa1JX6q1f9I1v4vYR2XF6gYM4zXYDFap65KuHM0/SvxxPhPNokOoCf8PDUM6sGi/uLjFsi8KfS5BLF1RPwwuHvJvhB9DWGJ4OnqZXaWiOMqosFZOGowFvoeGa3RSEbCNs6gLGsLLcR0JKlNCvuOnebTsQXYTlO6YedhPzXaYxV/9Z0Bw6c4vk0KKwu06p+h45NN0TDTX9Q6tr+BH7O8ABZmbzupKfug7osoA8FbAFDwucdiHBrcuOVPAKZmjPGqh4Ax1Jti0dpSnK5MDPpGeNDP0NKgb0J35xciQPH2AsTnTGhYKSVyMI1O+R1gnIPyVtu4rnE2Cldfuo75KyPCW1n3jGWO3fMsrq4c9Rog3g2vkNEOIKiBhVIAkk141rNIrCoyyU8k+eLTAIhi8l1+y8QQld8IAxg/zInfrD26vY3RYG+Ik+sCNj2RTkfUqwrRmcOYqedIpoZn4voPDxx+Fuyoo7YKn06L/ZISbBBYz2KBkqCREBS/CxngSyII84hFGFkAJbLuW5XMb67VFawg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(6916009)(356005)(82310400005)(44832011)(316002)(82740400003)(47076005)(426003)(36756003)(40480700001)(54906003)(186003)(36860700001)(8936002)(2906002)(1076003)(8676002)(83380400001)(70206006)(5660300002)(41300700001)(70586007)(4326008)(336012)(86362001)(2616005)(40460700003)(6666004)(7696005)(26005)(81166007)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6258
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8721e258-1031-40d2-8ba0-08dac95203ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pAbFxshUfxsJ2ofJjy7KQhwxrBPChiInqhsL3B33EnhicnpHzcRgskMGRiLmKcagvhdHzliZf62z0FCBZTFDVxQ/5CZr9i/E+RSFX0wwQq1YQVVjN2B3Xc9kF0i4kNyP3barzj/2LaiT7dcXrHsZf3OgLFHvspIW+qu5FkyEyjea/07RxE9YJkRHbIQmUdTe0L5p9FceCu725GrOWa4CDrR/t3irqUS2dwUv1G2nPgxFp1l7xQBVybROWW4tpNJbK3OpHkwSvrDEevN+s9drBvBSqUllNanTWCzsAAuN8Di/d1u6ed5cEHd60rxofzAnou8oe5I9PSptiNBw/tA+RmYVsvYd3DNTWVftCqiVu59RrG9V5apUd0Z2w53WHRgadcVcN+cb2gr1vyxeqdwO+zCDmoU9i04v65h1G6QCupjC4medjhXTD/VIXtiJjdJZ7PE9GMSqcGDcsHW1shF+1K2kJq9wXky3WjUKTpy4zUxXglDCMIbhtzVij2sYPZH8cHy4ov4YBXoJFibUrxjDvnYdrDFG1eNWWLGAdkmhjv+7x6o3Muj3nh50Lpx2jEi+cR+i4qrzgdxhtxcz474TpIDxEcvWcmiFoow8U9uoiGjboygH+h3dg7u5BQqshr/vLzkF/EAFpOL6ABKF8YJ9x0vuE6vId650XRd1gqCLcA9DhazalJlXUA3Kh86Xc8LwKojVAA7WFFO/97ZkLFfO4A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39850400004)(451199015)(40470700004)(36840700001)(46966006)(81166007)(41300700001)(82310400005)(4326008)(40480700001)(8676002)(70586007)(44832011)(36860700001)(83380400001)(8936002)(316002)(7696005)(6666004)(6916009)(478600001)(86362001)(26005)(54906003)(47076005)(186003)(336012)(2906002)(2616005)(426003)(1076003)(5660300002)(36756003)(82740400003)(70206006)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 10:45:40.3219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e28034-a03a-4168-02a9-08dac9520915
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5429

VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
results in two lines of error-checking code in phys_to_nid
that is not actually working and causing two compilation
errors:
1. error: "MAX_NUMNODES" undeclared (first use in this function).
   This is because in the common header file, "MAX_NUMNODES" is
   defined after the common header file includes the ARCH header
   file, where phys_to_nid has attempted to use "MAX_NUMNODES".
   This error was resolved after we moved the phys_to_nid from
   x86 ARCH header file to common header file.
2. error: wrong type argument to unary exclamation mark.
   This is because, the error-checking code contains !node_data[nid].
   But node_data is a data structure variable, it's not a pointer.

So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
enable the two lines of error-checking code. And fix the left
compilation errors by replacing !node_data[nid] to
!node_data[nid].node_spanned_pages. Although NUMA allows one node
can only have CPUs but without any memory. And node with 0 bytes
of memory might have an entry in memnodemap[] theoretically. But
that doesn't mean phys_to_nid can find any valid address from a
node with 0 bytes memory.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v8 -> v9:
1. No change.
v7 -> v8:
1. No change.
v6 -> v7:
1. No change.
v5 -> v6:
1. No change.
v4 -> v5:
1. No change.
v3 -> v4:
1. No change.
v2 -> v3:
1. Remove unnecessary change items in history.
2. Add Acked-by.
v1 -> v2:
1. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
2. Adjust the conditional express for ASSERT.
3. Refine the justification of using !node_data[nid].node_spanned_pages.
---
 xen/include/xen/numa.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 5b3877344b..04556f3a6f 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -35,8 +35,6 @@ struct node {
 extern int compute_hash_shift(const struct node *nodes,
                               unsigned int numnodes, const nodeid_t *nodeids);
 
-#define VIRTUAL_BUG_ON(x)
-
 extern bool numa_off;
 
 extern void numa_add_cpu(unsigned int cpu);
@@ -69,9 +67,9 @@ extern struct node_data node_data[];
 static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
 {
     nodeid_t nid;
-    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+    ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
     nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
-    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+    ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);
     return nid;
 }
 
-- 
2.25.1


