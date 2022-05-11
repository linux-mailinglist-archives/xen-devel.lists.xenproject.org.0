Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89695522920
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 03:47:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326063.548878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRX-0004J6-GJ; Wed, 11 May 2022 01:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326063.548878; Wed, 11 May 2022 01:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRX-0004Ga-Cb; Wed, 11 May 2022 01:47:11 +0000
Received: by outflank-mailman (input) for mailman id 326063;
 Wed, 11 May 2022 01:47:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMk+=VT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nobRV-0004GM-Gz
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 01:47:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7d00::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43c8d114-d0cc-11ec-a406-831a346695d4;
 Wed, 11 May 2022 03:47:07 +0200 (CEST)
Received: from DB8PR06CA0061.eurprd06.prod.outlook.com (2603:10a6:10:120::35)
 by AM7PR08MB5462.eurprd08.prod.outlook.com (2603:10a6:20b:10b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 01:47:05 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::7) by DB8PR06CA0061.outlook.office365.com
 (2603:10a6:10:120::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21 via Frontend
 Transport; Wed, 11 May 2022 01:47:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:47:05 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Wed, 11 May 2022 01:47:05 +0000
Received: from f914d3d6dba5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FBA35812-C497-46EF-9CD1-C0212CE52194.1; 
 Wed, 11 May 2022 01:46:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f914d3d6dba5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 01:46:58 +0000
Received: from DU2PR04CA0307.eurprd04.prod.outlook.com (2603:10a6:10:2b5::12)
 by PAXPR08MB6399.eurprd08.prod.outlook.com (2603:10a6:102:158::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 01:46:56 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::a7) by DU2PR04CA0307.outlook.office365.com
 (2603:10a6:10:2b5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Wed, 11 May 2022 01:46:51 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:46:51 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 11 May
 2022 01:46:55 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 11 May 2022 01:46:53 +0000
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
X-Inumbo-ID: 43c8d114-d0cc-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SfbBdKz3IRE6rjW6JFl1U//COcGT8GAfrGu38vtSt+uJl+r/Iwpm533jAeFzEYtKzrY4FmBYGI4Rz8mduGNoIpQ11mgRuHW6HoCbfFbq1Wm8zl8o8iqWR0k7X1mRHXggh9DR4GkSG+5NYhRMNt8HXciUsjpU75tDVDZSmTb12vgiHbRj1T6B+tRMZAClL8CAOiOi9pSo919ucWfTsukPy+86RrjVz10KEQ5ul3eGDE2Cl5R9/oQcI1OKpoXfwymK4w+6kYgpVn1TIvN3evX2DTPenU5+FsfdKGKZd2YgJJGZFZXW6o5RXU1A/8xjTjUKz+95xOslrVupa9/Ac1G/VQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCcl6ig9FV6KaPQMsfAvOQCZeEGBSyiayQZl78b6UYE=;
 b=d6hFaQ4ZyvbpHkW8nLJmgAvA8cT20HMU+I9DKe7TB0VwzkbyBjHxi07Cv2NSvi2VMpbC2dxuU/Vdrfgm9O8dkM0EnZlJ58knFLuJLl4Vo3PcKTW9ya3xtAhUVI93AH4Uk+hXtxv9HgwRFePF/K0M5QnixSaO1+VUz87iZ5BQTWPerFEpghygUBJeTHGvoTOAi7HiHZj8mtsH4NICjAVNCjFA9W2upwPHzfjrAfQN4z9FWXjLJ6nZYFS4/JeGCi674zigpaYYn33RQgkWenUk+zWe0hwe9pjlnWKKekNJZFLIrjngq0TYvJYAGLSe7tM4Wt7ut447ZEE7Ozvw9ZaJxA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCcl6ig9FV6KaPQMsfAvOQCZeEGBSyiayQZl78b6UYE=;
 b=SdXmnlBWvFvcmzhXwrLR1AXrud8vtJzyrsoFipvP0CxdlGlL2zRIvKPayXXxEDbJ7td6mFlvDPN9jLGBTem0ZzmAwk5YC5xnu5LvVLoAB4o6Jj01UDSpiwRUlV9idSXPs3nCh6B3H5FB3mSOmyXDTOIuLk4n0pwvR1qR+c1PMq8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1cb33a7f1a580bf6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XY5Ifc8Vn9csJGTepkqMQ+jltFn/NfXb0GOFP07WlOxu7+3xbM/GOX3pSCt2oxoLaMg/zoGD6m5nXhoqHd229x/+yBdXNOFTFNLILq80SArE7DjIU2N3asXgw6eU5YPj62HxhKEg5LLWeREkZ7UVuvavEoiF5JoUKhhRHo+6bBEgpZDjVbj375zBjgEGb/Z9Kkmprv8HojnlEBS5HKcOrhisfBlin1KRkXIDj0Xy3EFL6dPZga+vsc4bOFK9Uaj2eVFy1NnuHQQ0diqC218qvFrgX/qizHYAb6ruYnXVGSSixPAwX0o8uWvF92tGRodK7TQ+pYjVAQjmoWVwHL2Vmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCcl6ig9FV6KaPQMsfAvOQCZeEGBSyiayQZl78b6UYE=;
 b=fBhgomOcv0Xk263qzxrVq3U12U2uYBbyG/sEz66te3dTSySHH+I6gNTBE9f81p37PFFQ7stvNalthPb05bR1KoYOwbGa2ANMxjT7g9C/zyFNOp3y+YahbVB80GV8WCvX7j2lEAaDovXpsMavpPg0YoqTPrHffSmiVS4Uzt8/MaDNxpcCBcYA/OkTSXz6DCDmZcWz+bF1CzFSQSJoCTmkTKM9Ne9H5CqSnOZSG6ZNrlfwSVt7aY5I5Z1xiGmFmbXTVFaLN6FHSvI2adkxG4f9EH3G1w3rfwFRmgDtmBQLpVZ7R/mkHoG6FHXTvEKPozGj0qZugca9F2FhkB4r+wi56g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCcl6ig9FV6KaPQMsfAvOQCZeEGBSyiayQZl78b6UYE=;
 b=SdXmnlBWvFvcmzhXwrLR1AXrud8vtJzyrsoFipvP0CxdlGlL2zRIvKPayXXxEDbJ7td6mFlvDPN9jLGBTem0ZzmAwk5YC5xnu5LvVLoAB4o6Jj01UDSpiwRUlV9idSXPs3nCh6B3H5FB3mSOmyXDTOIuLk4n0pwvR1qR+c1PMq8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiamei Xie <jiamei.xie@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 1/9] xen/arm: Print a 64-bit number in hex from early uart
Date: Wed, 11 May 2022 09:46:31 +0800
Message-ID: <20220511014639.197825-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511014639.197825-1-wei.chen@arm.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 6d4a99ff-c725-4725-e7f8-08da32f026ec
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB6399:EE_|DBAEUR03FT049:EE_|AM7PR08MB5462:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB5462DED8A555F52D72C4F6C99EC89@AM7PR08MB5462.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4Bsc7mjP40KBDCmzc0xKLQZWc53qgO4jV8MqclWCChi5pXLy41Fb4nsV8IACzzfImdTsriluxsWzdZ0HNOALSzmyNV3FAVIv8qWsRpOnICdkQ/SbvrajFp7pkNjEwo1mMR2q85VQKALPMNVGc/pHP17WdavZ7u31tKrR4oMw923265nkX8RDQBmxuRFpFzRWoyZ3m9oFzXE34p00cwYrUqW7u1UctXtltuacOWVsmYXrQHUhUiKMk7uxU3c7eFwu9XFhKvrd/Iw+yR8Ldy9lGRS5gS0b2OgXv+g9MyfpCr4BFWMyXXaIxBWSkdhqEDapk0clKwnzSP8HBCPLFCkBQOlfiqftbDaKyqzLZ7ng0g4mj81DyxAi1Uevs+s2cxDaJImKANCrjFU8uKVKAu0YTWifpOlhMPKBTqlDJ4X9LneCsNNJYzxQZg+f7BbvEoM+0eh2I1SGh9FnVGmRjnzTXJjTkLBCYQCUaFlRvveSqmolL3I2SMCzbyDyg54C4UwsKugTgWKHTmqhjEEIPZqHWqAMl1cFjoKPBp96r4r8hdJytnDfEnQB5GjxY5Ky5WQPHN96O4OeaXE4IvNcNHRcxDSptZh/xFSmpd3a9mqC9TYGKTXbS7vGGcwXqf9nVbvDKgNSYXDRVkLR2DiNlNB9bUUXt+52iIljyQJAd4+vSx/UCtEw8Stl1JPsWumPqHojW+Q5T2qMalypzt8KmuaCqw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(186003)(70206006)(47076005)(36756003)(336012)(426003)(83380400001)(36860700001)(82310400005)(8936002)(44832011)(2616005)(40460700003)(5660300002)(26005)(8676002)(4326008)(1076003)(54906003)(6916009)(508600001)(86362001)(7696005)(2906002)(81166007)(6666004)(316002)(356005)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6399
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f6fd9924-9da6-4cb2-4272-08da32f01e72
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2jPVX77OOQ4D2cb8eh0ju+YxDi2nfrfCUbvWi/rjMtU+EqainR8vCE7h5f88Glt8Mn93Puj8DwoVrb7fVzXHCqeuChUloot83pK2sU9xXF5tw7D8cHStu1Dyt0lb5YaapM3cehe66PlwFQkSEbBvjajrKZPoA3M7J3gTrH12L+LBTpxpG+EAF+yqAzIb6BbAtuYCrMr/zc7x0Byc01jVOXc+fzHXHNLhoJIu/E5xAIvzBFJayfiaMtMxcK9ZhfkEYT2nXVOeFAVgW0S6NxtUYYQ0rIbYqqKG6hnPJk658u8iO+AXoPqvVDf3101B5V+6LSQsV7D6avmS9n5y0LqUymmXtyy/0T2mxlls80MkbcZ2rfV+aBYW5e9ahCQPk7DOE90H2jej2Lh3xf3movUh+74/8SlFQ7GG2YRx45Kw+7tOG5cSg+cbukEFhYrFvTv5E5oRoIjxbk+hC/BT2kXQFOWQoda68LrfG811qEM6Tx1avw63+ZbnRl77JjvyETC51mcb6t2VagLqmsC+u0+YLALi4RWttoMxId/LFPHsLurt+hm/lR9s9RQkOeKf1Es3ra5nvl732RVQ+H8kA6/Z2EmE3OT98AiR2eNsbftSO7XKqGl3SIDv3O7/u6OWIsFMjjkYx6bAdDrE/USd/SZ7vC3ZI1/8OBtsVNBYV4HJwj8qUsDQDl+TprIY1pTLNlYZ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(508600001)(47076005)(426003)(336012)(186003)(8676002)(70586007)(2616005)(107886003)(70206006)(1076003)(4326008)(83380400001)(26005)(8936002)(81166007)(86362001)(6666004)(82310400005)(54906003)(316002)(6916009)(7696005)(40460700003)(36860700001)(36756003)(2906002)(44832011)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 01:47:05.2946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4a99ff-c725-4725-e7f8-08da32f026ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5462

Current putn function that is using for early print
only can print low 32-bit of AArch64 register. This
will lose some important messages while debugging
with early console. For example:
(XEN) Bringing up CPU5
- CPU 0000000100000100 booting -
Will be truncated to
(XEN) Bringing up CPU5
- CPU 00000100 booting -

In this patch, we increased the print loops and shift
bits to make putn print 64-bit number.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v2->v3:
Add Tb from Jiamei.
---
 xen/arch/arm/arm64/head.S | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 1fd35a8390..109ae7de0c 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -872,17 +872,19 @@ puts:
         ret
 ENDPROC(puts)
 
-/* Print a 32-bit number in hex.  Specific to the PL011 UART.
+/*
+ * Print a 64-bit number in hex.
  * x0: Number to print.
  * x23: Early UART base address
- * Clobbers x0-x3 */
+ * Clobbers x0-x3
+ */
 putn:
         adr   x1, hex
-        mov   x3, #8
+        mov   x3, #16
 1:
         early_uart_ready x23, 2
-        and   x2, x0, #0xf0000000    /* Mask off the top nybble */
-        lsr   x2, x2, #28
+        and   x2, x0, #(0xf<<60)     /* Mask off the top nybble */
+        lsr   x2, x2, #60
         ldrb  w2, [x1, x2]           /* Convert to a char */
         early_uart_transmit x23, w2
         lsl   x0, x0, #4             /* Roll it through one nybble at a time */
-- 
2.25.1


