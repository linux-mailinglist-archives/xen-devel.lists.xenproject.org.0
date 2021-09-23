Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F5E415E26
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193990.345673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfk-0002VP-DY; Thu, 23 Sep 2021 12:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193990.345673; Thu, 23 Sep 2021 12:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfj-0002O4-Qb; Thu, 23 Sep 2021 12:17:51 +0000
Received: by outflank-mailman (input) for mailman id 193990;
 Thu, 23 Sep 2021 12:17:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNVE-0006xV-Tj
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:07:00 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.86]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79262836-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:04:59 +0000 (UTC)
Received: from DU2PR04CA0307.eurprd04.prod.outlook.com (2603:10a6:10:2b5::12)
 by AM6PR08MB3399.eurprd08.prod.outlook.com (2603:10a6:20b:47::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:04:57 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::d) by DU2PR04CA0307.outlook.office365.com
 (2603:10a6:10:2b5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:57 +0000
Received: ("Tessian outbound c21c48fbc857:v103");
 Thu, 23 Sep 2021 12:04:56 +0000
Received: from b12015d85945.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 88F0757A-4AA9-40EB-8B84-257C7DA7080B.1; 
 Thu, 23 Sep 2021 12:04:45 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b12015d85945.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:45 +0000
Received: from AM6P191CA0079.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::20)
 by DB8PR08MB3994.eurprd08.prod.outlook.com (2603:10a6:10:a6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Thu, 23 Sep
 2021 12:04:43 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::24) by AM6P191CA0079.outlook.office365.com
 (2603:10a6:209:8a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:43 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:43 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:21 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:20 +0000
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
X-Inumbo-ID: 79262836-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vghFBlrVlMBMFKgAWPXBQGBuhDmWD5Y0b6JI6HLn9ps=;
 b=gN76vXhZxcBv5BscLifO8EYJDthjC2Ft+x3xWoNfXtF1IIuRTh/CaF4drz1j2axlQY9aDWkjul+pZBQxL3dkg0VfpFBK07fX3gf0znAhJWovzv/TUtuRu2ebi3zWTh3EI748J9xyO+kja8x1O5dArRxjN4bfb85da7kkvo5LWa0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3eea9582ea44a5ec
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7h8agbnXbNYy4zQeLPQoCUNaCZYwXUgZClp62C/AMHfzOFeZvETHFOBn5WuvSHCXFGZPXi5HTv6E3wHotq9gT6DkYqhUjIaXAvvxamcg93LSGA3zlCVU+eAHh0DscjI8feCGxyw1hl/922SGDjzaxyxcY+DaT3L5AWNDL4euLyqlCZD83/8GAW+h9VDevNHTGyieimDmeovQzWOkA3Nkq0frh8LHonWMjwWzTnqNeL1O0CugedArEMNzqc//DU0VJ25wLFZQbM79TbjhXzPbuvtle+dFRP9s0LEhT8cGu9ffFyJVcj8l0ip6OQrjGrIx+8+lIb7rSuvhKW21X5GyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vghFBlrVlMBMFKgAWPXBQGBuhDmWD5Y0b6JI6HLn9ps=;
 b=Q8d+573xQL/GxJ8OICSS6kZpomg+vZUa2jtLrUNKLcZqpY142658sjFAwduYdYj/71GckBwFeOEevMQK2zX9BIndUwFSscHcFr9Q/um/xnkvCju8n2GIVIPSK9/QE9qzlWC9Yi3lvC5kjXP45ljAZKfLeLI3y70SOJoNTeahjAANvxQOBJ/FY5/yG6zpfpm+i2AtBTMMvlijLbnkYOwpPzDsZcr6a08TTJ8PjbZubcJ2gTJhQDcPqxxrQ2a2sMy6fH/zYYiyMqZGRQ7XGrrE+hyRawJKU1fth30ZqgbDHISBvHApSoKVeejuaUnqcY3cyg+qGqjH+VSbl4yiNgAbSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vghFBlrVlMBMFKgAWPXBQGBuhDmWD5Y0b6JI6HLn9ps=;
 b=gN76vXhZxcBv5BscLifO8EYJDthjC2Ft+x3xWoNfXtF1IIuRTh/CaF4drz1j2axlQY9aDWkjul+pZBQxL3dkg0VfpFBK07fX3gf0znAhJWovzv/TUtuRu2ebi3zWTh3EI748J9xyO+kja8x1O5dArRxjN4bfb85da7kkvo5LWa0=
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
Subject: [PATCH 33/37] xen/arm: keep guest still be NUMA unware
Date: Thu, 23 Sep 2021 20:02:32 +0800
Message-ID: <20210923120236.3692135-34-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40fcc8c0-593e-48f1-b9c8-08d97e8a5c77
X-MS-TrafficTypeDiagnostic: DB8PR08MB3994:|AM6PR08MB3399:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB33990DC48B8D3B80428CBF749EA39@AM6PR08MB3399.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RRHmHsEYa6UrnyhJlKbWJ58VGEEodjNSu07OgYMtAz7uK78AhzDDR5WgEAT/6AS1nypEwoIZnmIgLfJsT26zQk5qe7Dewvg090gEwJzS7CAU76a9VKvm+XYN01LceWDRLZ2Qyxz4ImU76+qoHp7yqAA5XCo9ruR9mwm+MJOvyphMmrYUBjmFyT1HdMYYrDG7mLvutmxK3wCePMfV7439s4gmVrO06W8kv7X8x+svBkCkiYZDiB2Ye2Hk/m3w4S3ZX18VFSgl7Gwh9DSV1LDfVzGDwZldMEAgnYdrkRcqPeh9yVfnuquFCyimdVxoeJ4el4p2u37Ojm4Y3YzeumuTrCtDizQvxgRmOAJtFuGEmPqZLN7i1d1Y4AP5KeF7T87Ies8+sV29or8P+S/flpF0SO67V4YmKpCb/GJfuf4Cll3z26bflgw9PpcsDs3COkxRaZxUT8MbR49h7CwJ/zy2FjB2fN7FQov4ZxOVZIgMYwyDme8Tbyhbag3/fLvn6fYgD4CkGBLRQXQisKeMcudKIbF0+To50lxva4B+NWUbpdUNZnZaL8w1ea+5nz0LF4/u9VTdl7w31/vLgTsAXB1xWLfEZUePSEnSgkHSThL9AkXJKZyA14hByfGbBMRyi24q0xKaXqg+oZt/b0nMM0El3oW2RI/Q9CDQwTVNPG7h9wsMFNLrnlH5Wnb47pNlj9dLhvW8k231emtpGfIDIoovpZNvwukA8dfHu/un4Phq6+I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(86362001)(2906002)(81166007)(1076003)(6666004)(70586007)(7696005)(316002)(110136005)(356005)(36860700001)(4326008)(5660300002)(36756003)(8936002)(508600001)(426003)(82310400003)(47076005)(336012)(8676002)(44832011)(26005)(2616005)(186003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3994
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51cab88d-6ada-46d5-f08e-08d97e8a5449
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nps67gIzyn2E66UC8brIMXkvgIsfkNn58WoFelcdM6K5GSA09KmdUdkiFLGFdRfh4CxxPoB9SXhgd2RIPENuN4iJ6s9lES2GYUf+QDosFPchygOdtrRO0PgdsPZsCnCnJWUYrxBnOP9e97j3xHM99Cz1rOtSQEISFex7YWfm8sUQeU5YRnVagVCdVAgMpLyBMaPnhOil8pEcXhO332oqdO5Gnv3cj9FfjFdGGCEhnktvQn0iSp2s6Ip/ggRvhuRbWJPz3Z1n0jEk7BKyJxHWZAJYQYqCENRTw6ct2ExB09h4PfmTHrU/2hdFckShHAG3dbpYABUIF478UuZqU1ymcucu6kSlZ+0wseP+dq1WH2Ns/oRxvQlWWp017u8sUEHIQzUvbpb49jQqjr3cgbSGkmyCtBwc3NJKHKMo55jK3ZOlgIuKcFMJxen1pmtekUMuVmJvzEsUFsmavH4t+ZkRkrg37RbeiWkVXRKZWEJ2ZxHGwGpTMgBlenIXPrhvCLSxMIkGPp3n0Dm2JLr5sDjUyjb6XujZPg+k3o5XKSo9pq5vxwn/resNnBckQ+GKNtHRBreHQY1pjce0Tldxlo5MJr7U0E/ku3a4navrVIexeIgEtcYV37Ai+AUHoyCClJBT/R+A3fk7UqqBVul5tXO+/8vLPeFmUT3mqo98hfQs4ZpQxOSShJYbkjUzzZrFbpMVtntbYqCXsLZOG4Rq9qZvUw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36756003)(110136005)(336012)(426003)(2616005)(186003)(82310400003)(8936002)(70586007)(7696005)(2906002)(81166007)(26005)(70206006)(8676002)(6666004)(5660300002)(508600001)(316002)(47076005)(44832011)(4326008)(86362001)(36860700001)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:57.1502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fcc8c0-593e-48f1-b9c8-08d97e8a5c77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3399

The NUMA information provided in the host Device-Tree
are only for Xen. For dom0, we want to hide them as they
may be different (for now, dom0 is still not aware of NUMA)
The CPU and memory nodes are recreated from scratch for the
domain. So we already skip the "numa-node-id" property for
these two types of nodes.

However, some devices like PCIe may have "numa-node-id"
property too. We have to skip them as well.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/domain_build.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d233d634c1..6e94922238 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -737,6 +737,10 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
                 continue;
         }
 
+        /* Guest is numa unaware in current stage */
+        if ( dt_property_name_is_equal(prop, "numa-node-id") )
+            continue;
+
         res = fdt_property(kinfo->fdt, prop->name, prop_data, prop_len);
 
         if ( res )
@@ -1607,6 +1611,8 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         DT_MATCH_TYPE("memory"),
         /* The memory mapped timer is not supported by Xen. */
         DT_MATCH_COMPATIBLE("arm,armv7-timer-mem"),
+        /* Numa info doesn't need to be exposed to Domain-0 */
+        DT_MATCH_COMPATIBLE("numa-distance-map-v1"),
         { /* sentinel */ },
     };
     static const struct dt_device_match timer_matches[] __initconst =
-- 
2.25.1


