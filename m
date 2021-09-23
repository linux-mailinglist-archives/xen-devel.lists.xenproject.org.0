Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB870415DC7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193820.345323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSE-0007FF-GX; Thu, 23 Sep 2021 12:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193820.345323; Thu, 23 Sep 2021 12:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSE-00075r-7C; Thu, 23 Sep 2021 12:03:54 +0000
Received: by outflank-mailman (input) for mailman id 193820;
 Thu, 23 Sep 2021 12:03:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNSC-0006xV-8h
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:03:52 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.87]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5095996a-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:03:51 +0000 (UTC)
Received: from DU2PR04CA0162.eurprd04.prod.outlook.com (2603:10a6:10:2b0::17)
 by VI1PR08MB4158.eurprd08.prod.outlook.com (2603:10a6:803:e6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:03:49 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::9d) by DU2PR04CA0162.outlook.office365.com
 (2603:10a6:10:2b0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:49 +0000
Received: ("Tessian outbound a492f2284909:v103");
 Thu, 23 Sep 2021 12:03:48 +0000
Received: from a328cebf5fe4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 52144751-B383-4D99-A1E9-13435DC9C057.1; 
 Thu, 23 Sep 2021 12:03:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a328cebf5fe4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:36 +0000
Received: from AM6PR0202CA0059.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::36) by DB6PR0802MB2375.eurprd08.prod.outlook.com
 (2603:10a6:4:87::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:03:28 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::ac) by AM6PR0202CA0059.outlook.office365.com
 (2603:10a6:20b:3a::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:28 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:28 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:21 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:19 +0000
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
X-Inumbo-ID: 5095996a-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcILUNZkNyOp7caaG1E8DDdtnvtY8zrWXypkM6x7c0E=;
 b=yTWwiwJFNWT7FbZnbCIXO3KF02rJVoinulqD4DyfnWLhZRg2t+u19F8f42gTE94xTBeTwgimq/gOVTbJOlm6WTmWN7mwc9O10oR1vdqF6GrfblYAVfhihfKMyx3VqhmCwCL3gVI4dcHQOXU1k9gW95oc419xR0bLwuiiOP1Ba14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ff5c38518d203d8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUxJnp4KkB22S450kfX906L/zN8PU/Nn4NrXnjcRgsFCyn4DnZUE+aj99WTW3GTRz4dLMhibkf7V0jRW0ouOex2ZaBZf8a0XNvAPp4oQT31RASAjFtcajgQypzRMAWxZoEjZFWKUfc9EzqcB8uPJfiFTrPyBrK6QM9r3F4VuWPYaujrQLTvzdCRSRZAi+WjGnhGoNCHCmsNnAtyhBAs5RTkGM95BQXpx0n6qiAg8fDBKGniui2b2JBrvWHYbD4lp8CuANecF+kFsMmnMwaHR3K8G+V9asM+kbzHDJeJ61pjdzquciNCWfHYQlOmIeGS2PPIT0xQs+v4R8EPLdWxeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GcILUNZkNyOp7caaG1E8DDdtnvtY8zrWXypkM6x7c0E=;
 b=O6lWhgrMBq+jFAp3hZ3UZFzzQ8hjXpFkWrEAkf1avrJ5jxnIarpFQeO12n5JC8nm54bDyys2FycIR9a9j+WLVXS68LYxOOcB08l7oI0M+HdntUNyehLS1Gs+XgXSlFXSNDWVqO8WSger31mV54c1loQUNcAeh6YJBTHXjbDKPPEJvnpz4dfpacXD+4poZQxV7A7f1oSjYw483dwpTIXnsmfxDK0W1GHtW4yhyf5RNVkUmqCCzPtx4EEPOaJjDgJYw4xifBmZsquVkaLOdFNwsHb5Ds2gQ+l5xOqB38rkpmKmMQAFCMN6a4+r41YhCsr6KgQ1rW7Xn6qgrG+douvV2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcILUNZkNyOp7caaG1E8DDdtnvtY8zrWXypkM6x7c0E=;
 b=yTWwiwJFNWT7FbZnbCIXO3KF02rJVoinulqD4DyfnWLhZRg2t+u19F8f42gTE94xTBeTwgimq/gOVTbJOlm6WTmWN7mwc9O10oR1vdqF6GrfblYAVfhihfKMyx3VqhmCwCL3gVI4dcHQOXU1k9gW95oc419xR0bLwuiiOP1Ba14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 06/37] xen/arm: use !CONFIG_NUMA to keep fake NUMA API
Date: Thu, 23 Sep 2021 20:02:05 +0800
Message-ID: <20210923120236.3692135-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 953a3fb4-ef0c-4d47-4e80-08d97e8a33ef
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2375:|VI1PR08MB4158:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4158519935F134F6E99A50179EA39@VI1PR08MB4158.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IYJzVLVHJm9ARQVk3lQE2eMUzEsiFSRl2kZ19AG1hqOiozAcNViMzhbrPLGE174snrq4QcV7XhGtb3qMUzIdfuZZUO0Uze12f2sEG/RfsWytY1SA3gENfaPtnI+C+ZP+teG3ws6s8p6NlTnn89WL+Kwov4XcAAQIkj/tPPghGTHFodVVI4vAyJDZrtgVg45KCQbN/8KToXoFpUDQlq59HYzrazT8MFnuu90r1nUGQiGOoqEm02m3nXdeArEp8NSZfjwEzTpDG/+zUqy/dtTI3oKnrt1uWRMKWIHpwcEYemuDkw95asvLzCqmtY52FhACu1S6bn9S92/uUQFxNaihqMPAlOcoY5qgPuMAH+mee67yP7D9vvyX4/7+PSl/24AUhp/kFG/PmaWAto2tolM7eLwD5+lnCr4XVo9A2vFyrViLcYgKGphF65wC8khBM1w2BXkJ6uFuCu9874nj7NTKwHbKQY24oqrAGp/kMMSpmstuFJbR2VdEv0lR0iYdEiF+WKqZ5a8Veui+f4qHwpji9RT8Mcp6/XYIxAdQf9qJAHo/p+jpboQCFSO+1RV3GrLB9oV7t0J4qhhwOmZVllyNCJvhzZHVw89oYy6UofH8BcvigS2AIvWLPe0x+SRnaeM36fp9AujnHK7QUBT3WOy/wTP25NlrnDpYNewZOHllt9JEOO1wg3u5GjWzCxFGVZ5WHTfKaSBt2AHn5zmCLErl3tNmGUEtU6svKn2f53Ni4eI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(1076003)(7696005)(426003)(86362001)(186003)(508600001)(36756003)(36860700001)(336012)(2616005)(47076005)(83380400001)(4326008)(82310400003)(70206006)(110136005)(70586007)(6666004)(2906002)(8936002)(81166007)(356005)(5660300002)(316002)(8676002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2375
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	92c66c39-fdd7-40be-a709-08d97e8a27a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	85r/UrjY0Bxj2pO3G5DuhAd1UdkRlv6Mj72cOkMjf2Kd3HWvinUncAH+XvV6oniL2bizFGXm1WBzVWlbd67NC/cI25WgEAASw/2zYxWeaEAAM8+816AT4kd349c1FK/qQN3x4Cfy16QtQ6apArBqSgR0pQsRTD7Xnreq6qahV4qVO9d5Ar3vSOxRUw1UR7a2pdexekGFYzlalT6z6TamvzsYDS1DdUi1hK9ERyyJVvabhE/ZeqfxzboGpN3beiuiXuymt4GQ2owtc320RhPZZNTB6ScUwUXJ/BsCcTYIorc2Oa5y/WNSymkGwRPOWshnC7Gh+uCVEz3rv+z0nr3J56fDFikhzuTTvQpeMy34cTFJxqIsR9KhbvNS5VWCxUlUWiaU7QXZwlEgrWOFciK0GjuEPu5qQ1wKaZrknWjXAh4TH7nWJtUyhoFrW95yiUGD2oAMMxxCTGQNeb/Frjddi6pAaS5F7WKc72L57uKLaBrWXqfanLMa7xLMmSqCqhIyZpmM2f7+WgbkuLi5/ftWRZ2rW7Un4wfSHFf3KdJJUyn6vRpogd/LgWAFZxLfPSXqiQE5ksBi3Fx26DWFh92ASjmC0fGhf8WiJIz1KKGLoe2OhsTP+Eejdj8wXV6khVx8rLPYjqoUTSWXVdAcc+cNmxOWPmapkIwsCCZjAjfIstdj6WV2LI5Lv70FT2T1iaQLFsgi0nuFvHplKIXxEOPcWg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(336012)(2616005)(316002)(5660300002)(86362001)(110136005)(426003)(4326008)(36756003)(47076005)(186003)(81166007)(2906002)(44832011)(26005)(8676002)(83380400001)(8936002)(1076003)(82310400003)(36860700001)(7696005)(70586007)(70206006)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:49.1453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 953a3fb4-ef0c-4d47-4e80-08d97e8a33ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4158

We have introduced CONFIG_NUMA in previous patch. And this
option is enabled only on x86 in current stage. In a follow
up patch, we will enable this option for Arm. But we still
want users can disable the CONFIG_NUMA through Kconfig. In
this case, keep current fake NUMA API, will make Arm code
still can work with NUMA aware memory allocation and scheduler.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/include/asm-arm/numa.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 9d5739542d..8f1c67e3eb 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -5,6 +5,8 @@
 
 typedef u8 nodeid_t;
 
+#ifndef CONFIG_NUMA
+
 /* Fake one node for now. See also node_online_map. */
 #define cpu_to_node(cpu) 0
 #define node_to_cpumask(node)   (cpu_online_map)
@@ -25,6 +27,8 @@ extern mfn_t first_valid_mfn;
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
 
+#endif
+
 static inline unsigned int arch_have_default_dmazone(void)
 {
     return 0;
-- 
2.25.1


