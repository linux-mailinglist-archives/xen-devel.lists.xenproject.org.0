Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E4619436
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:08:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437429.691854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtd0-0004AP-ES; Fri, 04 Nov 2022 10:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437429.691854; Fri, 04 Nov 2022 10:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtd0-00047h-8k; Fri, 04 Nov 2022 10:08:46 +0000
Received: by outflank-mailman (input) for mailman id 437429;
 Fri, 04 Nov 2022 10:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/tm=3E=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oqtcx-0001vd-Oq
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:08:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70058.outbound.protection.outlook.com [40.107.7.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a948a600-5c28-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 11:08:42 +0100 (CET)
Received: from AS9PR06CA0663.eurprd06.prod.outlook.com (2603:10a6:20b:49c::8)
 by GV1PR08MB8179.eurprd08.prod.outlook.com (2603:10a6:150:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 10:08:40 +0000
Received: from AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49c:cafe::bc) by AS9PR06CA0663.outlook.office365.com
 (2603:10a6:20b:49c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT042.mail.protection.outlook.com (100.127.140.209) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:40 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Fri, 04 Nov 2022 10:08:40 +0000
Received: from 185689500ae9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1384B5F8-3F4A-4727-AA43-A3FE11203BCC.1; 
 Fri, 04 Nov 2022 10:08:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 185689500ae9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 10:08:31 +0000
Received: from DU2PR04CA0271.eurprd04.prod.outlook.com (2603:10a6:10:28c::6)
 by PA4PR08MB7434.eurprd08.prod.outlook.com (2603:10a6:102:2a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 10:08:30 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::80) by DU2PR04CA0271.outlook.office365.com
 (2603:10a6:10:28c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:30 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:30 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:28 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:25 +0000
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
X-Inumbo-ID: a948a600-5c28-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=E3y7J/HMCf1Ejhg7ofXqqSIpbXddQO5zmV4qsmgwTw1dcrkRwi1vm5XdOS5x4i7VY4YlunNEvu7q11boOgFXX8ChErHJSnZk2RY35I8cE/i2vnQPSFsZ8O7t69Fy0o3BNQ5gEI00Tbxq2DO3+ar42+S4pAImiyLcHcSEjCzhODL/yBuv4/WwAcGqTZqtzPEy+pdMA13sbvZ3bbO9UIsJJT+w3GfgJfgoyyfFty1eTzIpzSpgPR3QsbH5aZq7EB8aOfm/MzCCOmgwnmNKfLAbLvgCJxQAx91b7p6Hh6Y71YGC1/9KagJw225sdgNgdA05/a8tGMnUThEiZ/g7dzFFAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBjv5anLZDwEd2jLmxOkcveDVsYBDtYxSedDem5n/0U=;
 b=Vwi8cv6UKtUujdUwbkBDWI0SpqPG0fNX/HdutasVbWit25VhdKuwcF8rAcNfrRxxKJ1P7QUUidscegz/bJj98ORloy3bmMb+4WacN72G1B2pFQS3B1eIRrb+0Z3S1360s2MYUZs1G6ST5FXiRZnFktGbjLqxL1FtUUdsKhvAilxrLPTK9x/fNsGLBv46BeiT+aUqwe3WD251A2LRcEL2myNtiiPgs9kBplTsmRpIH8Mq5Askbm+k8YmjzhMI39QsgYJW3xW3MxzxcEUu/cwTxD+UcwhqdxubWuvpvf6HhnjTF6GDCD+DKARaaNd9Gpw9aSM9a2VZDOHSIT3QLvrBOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBjv5anLZDwEd2jLmxOkcveDVsYBDtYxSedDem5n/0U=;
 b=VEDHnTdP83AiyGDXT57aUiQD+MvpofIu0Ug62d9P3BDpuuMTVBdkaD/pA0n0y2F7muMxnEtD2b40jUHycQmmcc5QPiwsUjZXgSJfVod7xiwghv+Yb/TYD3LB/WXv1Nm+YO7UVbiMSVpZCN8iE+GwmIpwc3XyyqKwxV0ViCaNmDw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 496f1c33cf175052
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KymGxHlErzk+6DPD5M07tYLbuLxHcP9BnZf8DAQb7wBDVGBI/crpSFHNz6FFHJdf2k+xDv7mQH85Ev37rIkyuy3eTkBsPaGT4lAdk4diLODhGnWedO4kWL6K05mh66exWzxSa0aesIBbxEhcHl1jVGPWkKICOlKF0UB1v43x40JD5e7VrHctDEerqZ5iKjV+9wDlXbtTqtVXSvY9VJfpOuZL/1K9hRmtWjXQSegqklWlpxuM7jWzBi0SgUUj+6YXLE5GhJLL5fngrUqQJlIXDCxVIxKiv8L9k4WAanw0hwNsM/OFcy7WRXq6PJLV521C+tE6cIp/av39hkTXTNZyEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBjv5anLZDwEd2jLmxOkcveDVsYBDtYxSedDem5n/0U=;
 b=XsBaiqa8FyEycZ7NNbjt4JVyuuk4nNDrsXPv/B6f9/718sN9/eYO+U79Wdra20A6Q65rbQz/Mgfgtpwux8jr45y5R7bV5oIYSrQdZKAuPmk+P4f65u88w5j6YCHpchqo3uYt57z5rRSI7aZw8/vbpabt5vrbPy12TW2ze1/X0uqvDZ8aQJQ6jZj3IRQV6O5Prn5Du7mUVYpTcjTkWfHtRA3VlmHbQmbSfJTgJOX7ePalohURb2ojGJv1SD0JDflZ5eTS3T3s+DZErY1+TdYrL2SJtOaL3uGMby1M0FaeFhKtv3SyPBk/YhUrck22s5VL66D4HkLWtFPPDXnB1yi3+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBjv5anLZDwEd2jLmxOkcveDVsYBDtYxSedDem5n/0U=;
 b=VEDHnTdP83AiyGDXT57aUiQD+MvpofIu0Ug62d9P3BDpuuMTVBdkaD/pA0n0y2F7muMxnEtD2b40jUHycQmmcc5QPiwsUjZXgSJfVod7xiwghv+Yb/TYD3LB/WXv1Nm+YO7UVbiMSVpZCN8iE+GwmIpwc3XyyqKwxV0ViCaNmDw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 07/11] xen/arm: implement FIXMAP_ADDR for MPU systems
Date: Fri, 4 Nov 2022 18:07:37 +0800
Message-ID: <20221104100741.2176307-8-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104100741.2176307-1-wei.chen@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT052:EE_|PA4PR08MB7434:EE_|AM7EUR03FT042:EE_|GV1PR08MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1f7ead-8183-49c6-8e95-08dabe4c8c09
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SDsgSV5MLhJSMBhVKO/b/g+CH6oIhhIn729JH6MXL6Vphlts7Pqyqe3Gj3hVCaGA2y49170DA0TpEuzdsCkM7YiV8Z4HyFYHQ7QLwuM6qkOA9W/92a7fnM0YMOeku3yYgMOrnlfrQa/EnI3z/1Sc0Kf+LUWLZnySUqkMQCnrNbnOboN30lWeNGKhgUC/D1tzFRHCemzibCdYCdlDP1wQ+iXoBu6YoYBskQD3kjLQfGRsJsA/xXQLLwStZuYwYesc3HO/D9GpkrQUWtcD8veOuGQdCkqP5m32AZNdvXCT0ygaKbE6N718SIxm50d3aH0S2CZaqlXYak8kSKF71n0NNfhe40XWDxHn4jHcQwTGeLDyyVcoQrraK0PxjmmS5Of61v4V/oWwFq7ndd7xH5qqEthq2PuyiKlEuvqVIeqzrS13Zzs6ues0CyjfyS+oPHSlze5dWWDRofqOfd5w1e0NOZch9q9DORBQO2FqjvoNlbTyKL1ouA+Jb488iMxKsT49O31cdTw5ECNSOb8Ot/qejXea/d4ZUwirrKehoXi5AhIMYTh0GC97VPHaIulD7V5O/nn0nAnfO6I6LOWwk4pdjSyrlMyHNNIXubTDhLHuiAqkOlIWPGiSV2ftxON44dTDwbQKESufuS2qJgp5Nuyo/7iTKPg2WHnCp6rrVQOuAnqYYHxivg4nZPj3yBiAly/EmQAq+sW0bDqdlDn7hqW2uhOw9SIU6pBj4bqlQo1P96KACdJE+JwruQ6rn67UWgwWHe9+gJABXm048uOjERa5gwNwZIxAPPziBvYmw8aT2V4BQgXJnAALVJeHq1pGhN0+
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(47076005)(478600001)(426003)(316002)(336012)(44832011)(6666004)(70586007)(1076003)(70206006)(8676002)(40460700003)(2616005)(186003)(5660300002)(4326008)(36860700001)(2906002)(82310400005)(54906003)(6916009)(83380400001)(82740400003)(356005)(36756003)(41300700001)(81166007)(8936002)(7696005)(86362001)(40480700001)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7434
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f5a47cea-336b-440a-247b-08dabe4c864e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g0Y0nXlOqze0vsQNXQSbzs8r0R7alu1FYzYf2C1qNZshUSauyWVeOBhvYBq04vQYId+0rMm5j4a1NT1QkaHuSGJqTog3i23s/NyI2Z5kmp2Gh5NOgNicoI8SKRs1SGgYGEdm8K6F/32VYeJatOV5FggIeiGu8E15FLl7Cya932PhOq86J5UXlE8e6VAimBj/UnsOOiDXTm0KoFJGurSpHGb8TcB49VWoLKi0WaftgV8o/YEAedYsnbN/3p1E1/NuNF3NkzW4dzn4PXP2XhISqZt+8KUdwde0lBOChsDOFJsZz38DBg/QKIfh+ai/jleA2iFNeieMjlmM3cIjzW5JHpgujgEUlAcT5WnCh3cOvl2Wehw2MEyavfwY73cnSPCEkkPSfmk4/xclTXCm3BKLjhjHt290GYb8FJt8bbqZNZCeRD46eaY/DPSKD+g4olPcYH0Wz2RAFlSO4lAvnW4SWsVFHQpKKHh/EcRm58RJHoKtcbfvzVDrIRS7PGOBv63HFwhWNIE8RzDLP0wH85NMMgxTS2Wk8ZCMwyawXJYlxQINWcYG8MmsQ6XxZB36+NPKgSKF92TsZSw492AWfchPrILanhemWYLpqvqGaAAKc4hOMOtc/hWP/40iwD7d30e3d99ljDoTKZEgAFyvfuY4H8gy+5SnQ3nMyfeczFsAHpe2n1sPdv3v5iumOA/ywTZ942wYxz54zOBMmfJXg85izzy2hRIpcnBP2M6PmbEMSfmkuFh9Fgun8PuUyz/C0PVRXk27YUU8zhpabt4CGb30jQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(86362001)(36756003)(81166007)(82740400003)(83380400001)(426003)(1076003)(6916009)(26005)(186003)(7696005)(6666004)(107886003)(478600001)(4326008)(8676002)(70586007)(41300700001)(8936002)(316002)(70206006)(47076005)(54906003)(5660300002)(44832011)(2906002)(40480700001)(336012)(2616005)(82310400005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:08:40.2106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1f7ead-8183-49c6-8e95-08dabe4c8c09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8179

FIXMAP is a special virtual address section for Xen to map some
physical ram or device memory temporarily in initialization for
MMU systems. FIXMAP_ADDR will return a virtual address by index
for special purpose phys-to-virt mapping usage. For example,
FIXMAP_ADDR(FIXMAP_CONSOLE) for early console mapping and
FIXMAP_ADDR(FIXMAP_MISC) for copy_from_paddr.

But in MPU systems, we can't map physical address to any virtual
address. So we want the code that is using FIXMAP_ADDR to return
the input physical address in MPU systems. So in MPU version,
FIXMAP_ADDR will trim physical address to PAGE alignment. This
will return an offset which is similar to MMU version FIXMAP_ADDR.
But it's a physical offset got from input physical address, plus
to an offset inside page (which is also got from physical address
mask with PAGE_MASK). The caller can return the input physical
address directly.

As pmap depends on FIXAMP, so we disable pmap for Arm with MPU
enabled systems.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Kconfig                  |  2 +-
 xen/arch/arm/include/asm/config_mpu.h |  2 ++
 xen/arch/arm/include/asm/fixmap.h     | 25 +++++++++++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ac276307d6..1458ffa777 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -16,7 +16,7 @@ config ARM
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
 	select HAS_PDX
-	select HAS_PMAP
+	select HAS_PMAP if !HAS_MPU
 	select IOMMU_FORCE_PT_SHARE
 
 config ARCH_DEFCONFIG
diff --git a/xen/arch/arm/include/asm/config_mpu.h b/xen/arch/arm/include/asm/config_mpu.h
index 530abb8302..eee60dcffc 100644
--- a/xen/arch/arm/include/asm/config_mpu.h
+++ b/xen/arch/arm/include/asm/config_mpu.h
@@ -24,4 +24,6 @@
 
 #define HYPERVISOR_VIRT_START  XEN_VIRT_START
 
+#define FIXMAP_ADDR(n)         (_AT(paddr_t, n) & (PAGE_MASK))
+
 #endif /* __ARM_CONFIG_MPU_H__ */
diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index d0c9a52c8c..1e338759e9 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -7,6 +7,8 @@
 #include <xen/acpi.h>
 #include <xen/pmap.h>
 
+#ifndef CONFIG_HAS_MPU
+
 /* Fixmap slots */
 #define FIXMAP_CONSOLE  0  /* The primary UART */
 #define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
@@ -45,4 +47,27 @@ static inline unsigned int virt_to_fix(vaddr_t vaddr)
 
 #endif /* __ASSEMBLY__ */
 
+#else
+
+/*
+ * FIXMAP_ADDR will trim physical address to PAGE alignment.
+ * This will return an offset which is similar to MMU version
+ * FIXMAP_ADDR.
+ * For example:
+ * EARLY_UART_VIRTUAL_ADDRESS is defined by:
+ *     (FIXMAP_ADDR(FIXMAP_CONSOLE) + \
+ *     (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
+ * With MPU version FIXMAP_CONSOLE and FIXMAP_ADDR definitions,
+ * EARLY_UART_VIRTUAL_ADDRESS can be restore to
+ * CONFIG_EARLY_UART_BASE_ADDRESS.
+ * In this case, we don't need to use #ifdef MPU in the code
+ * where are using FIXMAP_ADDR to make them to use physical
+ * address explicitily.
+ */
+#ifdef CONFIG_EARLY_UART_BASE_ADDRESS
+#define FIXMAP_CONSOLE         CONFIG_EARLY_UART_BASE_ADDRESS
+#endif
+
+#endif /* CONFIG_HAS_MPU */
+
 #endif /* __ASM_FIXMAP_H */
-- 
2.25.1


