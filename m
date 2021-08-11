Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AA03E8E8F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165638.302724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQQ-0004LG-9b; Wed, 11 Aug 2021 10:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165638.302724; Wed, 11 Aug 2021 10:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQQ-0004Hr-4y; Wed, 11 Aug 2021 10:25:30 +0000
Received: by outflank-mailman (input) for mailman id 165638;
 Wed, 11 Aug 2021 10:25:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlQO-0000BQ-CE
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:25:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::607])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a47376d-7980-4979-9aac-45c90a18e58a;
 Wed, 11 Aug 2021 10:25:14 +0000 (UTC)
Received: from AM6P194CA0103.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::44)
 by DBBPR08MB4886.eurprd08.prod.outlook.com (2603:10a6:10:f4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 11 Aug
 2021 10:25:13 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::7) by AM6P194CA0103.outlook.office365.com
 (2603:10a6:209:8f::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:12 +0000
Received: ("Tessian outbound d9f41274f41a:v101");
 Wed, 11 Aug 2021 10:25:11 +0000
Received: from ce4876d35bfe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 893CF637-3F22-4663-ACE3-C33D05646C66.1; 
 Wed, 11 Aug 2021 10:25:03 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce4876d35bfe.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:03 +0000
Received: from AM6P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::25)
 by AM0PR08MB2963.eurprd08.prod.outlook.com (2603:10a6:208:56::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 10:25:01 +0000
Received: from AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::e1) by AM6P191CA0012.outlook.office365.com
 (2603:10a6:209:8b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:01 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT045.mail.protection.outlook.com (10.152.17.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:01 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:24:49 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 11
 Aug 2021 10:24:49 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:46 +0000
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
X-Inumbo-ID: 7a47376d-7980-4979-9aac-45c90a18e58a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qscw3U+NFWcsOhhhUNwOzHkuFBQ4mz07I7kS8fX8DWQ=;
 b=kzcqq/F4H/nQ5f4WWeAewcZLeA8IB0MFpOcHisoXdUtstgejvP3kMYxv1d7SJUotd2beBMytbyXQnvDByhtFtCMdmk8z22On1NiAmW41W5Sw4Tcf/PrCIJ7OCgTNu8WER+Gg8a0RKQDor8f9sA1aBpWiO+lkvpBRaUwJjQKvcdg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 03a2f52b0b86c7d2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOeWnvg/TdnfAJixsahZGMiuRsyGpzxnmQMu0sYNhPMJ9FkclurEGDECsSOMjGONsFygvmwSl1es28E7j4mplqm+5rM6WF5Mmus4Exas03NQYlgNet9v4b9AVUujy90z2nfSgccyqbfY92/F4M7iHtKGvmhtx2i7nw55NecgNcSLKEwHihgS8+J1z9qsTlYZW3o0sOaZ7YMphDS5Tnou4tfJNqBYWTXkkRAzNjSRrn4y4wJPbBOm/WcpstDo7KyZtdT0uWkeRBtbjz2PCJ68E2eftfQfejF6Hm0H/5F1VBXrgs1aN/qa/8rT3vrZtQQROgT3G6U4VLmQ8Jt/huTQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qscw3U+NFWcsOhhhUNwOzHkuFBQ4mz07I7kS8fX8DWQ=;
 b=mqhfG0LaUfPUzlNXZuVnvILbIjkG1DoOmKuzvN3Y2Yd8nPi2h4j9Cr13O8q0L4U0KNpVEIJxOdthO3Korqxjoq+u/4r4Inl7ArwvEVWi3wJdX2Ds6B02oyHKl/jZZ7sGzd8GiyD70cgJLcKPe/+5LpwojXWCECYECwIorQbijNjK6qzgwTw4ToRIUKf4MDNZFHcVUdA9h9+/N2Yqcc2gFazlg2v8Bmla2AbaQ5BGgZ7+RUuF0BjOQmwqrn8wA0U8zgZ9VjduQcRvTd7cnPREG+okaL6FT5lPFcv+tWfhmhv4zi4pXw+qXRZVGbU0KvtTV5RIJGhFkTHzEIfM3RctZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qscw3U+NFWcsOhhhUNwOzHkuFBQ4mz07I7kS8fX8DWQ=;
 b=kzcqq/F4H/nQ5f4WWeAewcZLeA8IB0MFpOcHisoXdUtstgejvP3kMYxv1d7SJUotd2beBMytbyXQnvDByhtFtCMdmk8z22On1NiAmW41W5Sw4Tcf/PrCIJ7OCgTNu8WER+Gg8a0RKQDor8f9sA1aBpWiO+lkvpBRaUwJjQKvcdg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep fake NUMA API
Date: Wed, 11 Aug 2021 18:23:50 +0800
Message-ID: <20210811102423.28908-8-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6df47ce-2890-42cb-2702-08d95cb24d8c
X-MS-TrafficTypeDiagnostic: AM0PR08MB2963:|DBBPR08MB4886:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB488678127C6596636BCB15449EF89@DBBPR08MB4886.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lLVwSVvqTZpELEsnUuFRCbiavzSA85DzYyLNJz2JwpRgJ7uwQmCeqYLnyrm659wouKxt5Q98b/qJBh7ZgeiuTy0ggayvKnJC6v5CB53fIYhNGWy0PTCLnhY7xU0R2tb11GWVuHdDPdH9unjH5qjJ86+59adjK1JJG5Bdz0dvKfficDNVJq3bK0Drsf/6sLmiwM+nMc+vRbc2izEiDJ+8tjrpuz93HKOQsaNaDn8Mv/Vb5UuJG/Ih3bQVkius13OQLAjgiivGsYudT9FsYMUl/1TFkYXxu3NonLi2fk3GkBKbpixzAcP+neVkr5neRuCVhFpgJkQ7Kn5l28kiZX4cGYc1kUSztYANQ0Ngnca9/4OeIUCO8pM4UKyQESuJ5sUKYQr0ijr2sh3sqAueyDO2c7N9GQq4CCgHW6edzSx5Ly0mGwpMFILLR6mXbLfPrOSeJKzaF5ldu25sbDrDk3UxLzpEbOfnW/sA2PF0J2naOf6wy0MfzjVAOYnb3g+8eR1ZzzileWQFjcjCUJ2BMaYhuf44YZEdp7SfpeVxFWSxl9crq/Zs3CacIBLXrwVlKOTfL+iJCcmh18HgJL47zbfyje8bK4HRypG13Z/kgK73jfIaGoDocOgdNTcZsYcGIJeHKK/VMnVBTT0N1Q8VnvLO/dfPh1BHz+vzWV6Y+VpT0nHKT5Fc+4Eqtn0FhmuIMrzDrIy2fshCAG7/ceVgUnPxA/0SXo/rM2Cm/D07lmXBd4igLMrpCch+O+mmjSrMN/9f40v/dDiZ14OCuuLWw7bupOaglKrO7F+05+j92UlXys4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39850400004)(396003)(36840700001)(46966006)(356005)(36860700001)(83380400001)(2616005)(26005)(34070700002)(478600001)(44832011)(82740400003)(5660300002)(316002)(8936002)(70586007)(8676002)(70206006)(1076003)(6666004)(4326008)(36756003)(81166007)(86362001)(186003)(4744005)(82310400003)(336012)(7696005)(426003)(47076005)(2906002)(110136005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2963
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	786e330a-11c5-4e59-2d2d-08d95cb246d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5eOgCvQvkw+U2VCCql7n4ww9RL2z6QAcWe0/ya36iIKKujLrToRWB93etChW8BWd8V35xXS8gxGslHoJzKHDsoakbsci9L8taJDubtd5kHMBYmIwUQd2cekVQDXeZiHLNW32W5n3t/EBVR7iePqlZBFhUJzfuNsYBpWF7biFb37SOgbwN63qEep9e7yPrhLco0k0c3dwdJT6Fd7PCaL7ePKWwF6kJPw9DPh5kwWYR/fVAgKAf5QZpCPRtt2NTUDaI/6TmmYEhfvwyc3KDaqXA4wjNaPiVz/nNZk0SCgvMZDNoU1iEVFuJoIXOOkLVrrCjwtZJ2pW6b8h7+c/NXwuNw3Y6ckR59SysnWTCMqzqsyXPRWhCAT947WoBpyeLyiKBLF3KP8mVXerZdGEl9yWg5+qhfcQnCiiRiBUtWncAGLG7bmimQen8gv3wRbOF7s3uBnR5YwuK6+liHmPBmEFaf4aXVe6Wt5PzL2WElh9nkcocf0feIbn1mSIjPg2DfY4xv89+JTHl2udig0bQvCvikTFgcNZSuBSe/veIOjx/u4BSWutvWWRQSJm5/5rQjp0O2zHVo4aPQnhaywMegKc7++Hd6DwXP+oCuiF9RfZ3UL00FXdloYD4okAt9js+a/Vud6rgUI4C7r2b67M9NNDWhy2ID3ssGuuGlTpcUT15L//Gh4Uu5vVk6G0gU76sXPZGNMLsIQRXHJ8eZjECdz2U6rBcMaZuxkjrJpMmlWQZPk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39850400004)(46966006)(36840700001)(6666004)(36756003)(2616005)(478600001)(81166007)(44832011)(316002)(426003)(2906002)(110136005)(86362001)(26005)(186003)(4326008)(336012)(82310400003)(1076003)(83380400001)(5660300002)(8936002)(8676002)(4744005)(82740400003)(70586007)(70206006)(47076005)(7696005)(36860700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:12.3421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6df47ce-2890-42cb-2702-08d95cb24d8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4886

Only Arm64 supports NUMA, the CONFIG_NUMA could not be
enabled for Arm32. Even in Arm64, users still can disable
the CONFIG_NUMA through Kconfig option. In this case, keep
current fake NUMA API, will make Arm code still can work
with NUMA aware memory allocation and scheduler.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/include/asm-arm/numa.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 31a6de4e23..ab9c4a2448 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -5,6 +5,8 @@
 
 typedef u8 nodeid_t;
 
+#if !defined(CONFIG_NUMA)
+
 /* Fake one node for now. See also node_online_map. */
 #define cpu_to_node(cpu) 0
 #define node_to_cpumask(node)   (cpu_online_map)
@@ -25,6 +27,8 @@ extern mfn_t first_valid_mfn;
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
 
+#endif
+
 #endif /* __ARCH_ARM_NUMA_H */
 /*
  * Local variables:
-- 
2.25.1


