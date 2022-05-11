Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F16A522924
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 03:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326070.548945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRk-0006Co-Hy; Wed, 11 May 2022 01:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326070.548945; Wed, 11 May 2022 01:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRk-0006AO-AD; Wed, 11 May 2022 01:47:24 +0000
Received: by outflank-mailman (input) for mailman id 326070;
 Wed, 11 May 2022 01:47:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMk+=VT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nobRj-0004GU-A7
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 01:47:23 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c37f1e0-d0cc-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 03:47:21 +0200 (CEST)
Received: from AS9PR06CA0093.eurprd06.prod.outlook.com (2603:10a6:20b:465::22)
 by DB7PR08MB3338.eurprd08.prod.outlook.com (2603:10a6:5:1b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Wed, 11 May
 2022 01:47:18 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::6e) by AS9PR06CA0093.outlook.office365.com
 (2603:10a6:20b:465::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Wed, 11 May 2022 01:47:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:47:17 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Wed, 11 May 2022 01:47:16 +0000
Received: from e30a62ea6a80.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 812680A7-73AB-4567-BD49-9B4567C87BB6.1; 
 Wed, 11 May 2022 01:47:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e30a62ea6a80.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 01:47:10 +0000
Received: from DB6PR07CA0199.eurprd07.prod.outlook.com (2603:10a6:6:42::29) by
 DB6PR0802MB2229.eurprd08.prod.outlook.com (2603:10a6:4:86::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13; Wed, 11 May 2022 01:47:09 +0000
Received: from DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::c7) by DB6PR07CA0199.outlook.office365.com
 (2603:10a6:6:42::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 01:47:08 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT042.mail.protection.outlook.com (100.127.142.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:47:08 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 11 May
 2022 01:47:13 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 11 May 2022 01:47:10 +0000
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
X-Inumbo-ID: 4c37f1e0-d0cc-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nFgckatpi8HMp7xL18QeFgsgCYfBzihroVPbCE7DKdw9fqcxWQ6Xdgw/fKqvbDIRwyYtBUfJPBnK+vSrqUVxPuVH24OF4GTUTeEFN3bH8aXM2lGspXlNON5Yxf/1UkcajhG95gWf4+jM32X/iWEZ4olD5hGEiz9UsR6zc8L6PXA3qtd6JTmMXMS3Y+9LBZMi2sE+T1Eo6mLlCxvtEIGlrISZfSgEl9W3ATOyLjeJ2oIlALRiMPl9fWSEt3igx3NdUwLMZpssjg5JwcqWimy+8H6EQ0yxjXittnV0wqJ0CNuCbKAsZdU6ocuw6ENugxcEyOMS5zlq+/AceHNvYobnkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dvL/r4EM4eeNImD1eMM3sRpfk54sjZJGAM76OFEuNA=;
 b=i7tNrIAfqgIcwh9GHZoJucbWylmL3e41QzPzlg2jlW3RPTzeMcrepMAvbH2BUUCc7ateZQRLXauiCqH4zEQkET/pZ5RcT6zkHfZ0wB0BZ6ZrvWa+qlbaCgAm+SfXK1cX8th0mJOrXFAYN07LweDN16R2Orxa6eJpXx2ghDjxNZ1lHHf5bYBLoxuhXMqb9mryfzu6RUWWfhjZ/IEBmYSZv3mQICC9MAe2+Hc/BXHqEcgwtLj8L2ogJfIgQ5jvrTuwsIMF3UW0YQyshh8KwLwC901yWZ7wmWw5ClvvBBtVBRbT0QPUDSOS1AkM3yANK8UlB0OCkhEW8O1Fl/SgDdsRIw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dvL/r4EM4eeNImD1eMM3sRpfk54sjZJGAM76OFEuNA=;
 b=8fO1+7AhbcmeziHj2h7coAb4KGdZALo2cgG5MA1aTMwL7jxXFkMgHSgk3ZP4ziGIQf2WQtoJ/dZGucu1CfCxzaVhH24Kym+1ZRR89vVCgBzYVnI9yvvvpMwXRPIWSyp5FiTYrkunp3ixqOb6cJanb904wncJlh6pHAl9EPMIgzA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9c5b5116c570484b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZB08KEKptHywyDf63P/4lGE40rkdsszz8y1Jks4dw3Ztm3eBWTVZiD/+gN3VpfIqauRWalERUZYsW82yG9wv9M/PjOCE6Lj64pokGb5fYnmX0PjqxHKsmNtsGKDzjMOnsD+b2QW4f0JNu37KXys7rXtuykIj4h9TXHt/mmk9CD3x+riD8orqdRonqkVqnZMpUPVkkeR1FY+YOjLgY07mj4W2LKF7DFSpJ4pRh9QqBFuB+lac7rXps9ZGtRaAS3I9B//5bBqE7dEM9pOWpwLWHDrDYf5k4W+0kFJjxmTgSK0eGxPEtZi8GJkWX0nHhHJ9WDDTpBdwPCp9QQ7qh8ROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dvL/r4EM4eeNImD1eMM3sRpfk54sjZJGAM76OFEuNA=;
 b=HCSU3SbIuo67Sc5xSvD/5ZoHrQd5pITodLJbZyO4wX1npDzRwcBkAxAVTVYoMJlTPXBgrKzJHiWkGsyQBUuoQAo77qG3KIrZUh3S9J1ATe3gslTe8BkmTnvv5i5vyJsN1c5Q5aoL/iQVrW5jODMHxfqNqxztO0CYZX9l8QkfM/ixdz4KFy/KkECT+O9O4MtUDhk5KMpDrBKfqFnrQYJd2U0WY8Kbvg3igYDa+ye9L8VlqVQcOXdf7GPbVg7VF7bKMgT8kflcuSyvWIDqR6Aoq9J5g66AxARC/PABuhE4OgRB3QhFBx9BcUVnp7taijtZQU77rSFk6u26NFL/KIgGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dvL/r4EM4eeNImD1eMM3sRpfk54sjZJGAM76OFEuNA=;
 b=8fO1+7AhbcmeziHj2h7coAb4KGdZALo2cgG5MA1aTMwL7jxXFkMgHSgk3ZP4ziGIQf2WQtoJ/dZGucu1CfCxzaVhH24Kym+1ZRR89vVCgBzYVnI9yvvvpMwXRPIWSyp5FiTYrkunp3ixqOb6cJanb904wncJlh6pHAl9EPMIgzA=
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
	Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v3 6/9] xen/arm: use !CONFIG_NUMA to keep fake NUMA API
Date: Wed, 11 May 2022 09:46:36 +0800
Message-ID: <20220511014639.197825-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511014639.197825-1-wei.chen@arm.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: ce30710d-8e6e-498b-64e8-08da32f02e2b
X-MS-TrafficTypeDiagnostic:
	DB6PR0802MB2229:EE_|VE1EUR03FT034:EE_|DB7PR08MB3338:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB333877308F3825A619D582EB9EC89@DB7PR08MB3338.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tnIEojpHqKnkd2FCZUzsobMG02OEaai8pYwKSJ8ewE2lwJzoJ98m0gZlOYhTNyDg9oPRdHQX6poOpelyi4hIGxPsif7zXHL1TvNeRip05kVGeg8+86jdlRcQjgvtx6St2b6uh1NZqsfeE6h8BaPwPMWUT5ogh/QC39MFRTbuWuVJxcqC42imwBVMiuIT+fjwt5me+/W62NUWIeaLFrhFth0gsxKKf8/3QtQ4NkDax2qDdKXL2+NHxZuUmfPAySj02kT0wJHC0ldxywjKzmjocHKkNVBPmAOavo+MS4KhWedKjj+k2KNKy37VeKsw+35FaxmOldE0RRCfpNsibGJiPF1y28Q34kBWvONA/hRg44Xo0EpT5o7DMcV5zBLRZdXn8Ya+2GYMHz8PCwVOiQNh4hzsyNHHg3YDEupGAmvMDAH7Gnv2cON2x6yJwNg3C/JEOFxHmoG5inAx/tgTMPNetTedKdYECL8o+uES5MLRjVRlpPrAYaxzAQXwgSCmUWpp+s6811Pc1JnayKMer1R3Xt11eXyXFlKN2etaYmWLg4gSeOxBmDwQDk0aPpfgnjp7j94NlRC07QDXmcu28TrTXjapBzH8B098dEQB0Ktbklc0qk/Lm3P53miPGXwPPE5CvWTepVBb32DY7fzkgGrDJZlD3u+zWE8Y8BPZKq1MkCE8nPUnHc43/gQPR37Qb9+DwJhX2pkWwC3xd1eSGF+zZA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70206006)(70586007)(2906002)(36860700001)(508600001)(36756003)(86362001)(316002)(44832011)(8676002)(4326008)(336012)(83380400001)(356005)(81166007)(426003)(40460700003)(26005)(5660300002)(8936002)(1076003)(186003)(2616005)(82310400005)(47076005)(7696005)(6916009)(54906003)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2229
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6492d488-f4b9-461a-a3ac-08da32f028e7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VUHHToToUjcAPCACIRCM4CJCqOSDNTn2ZOXW4TDjgvQyKa17CDFDOs63cdA8r3Vlc7TKAGg05Yep/w0YhQc6CAeuyNLKQ1RlJ+yd5nQbDMnhLk80i0mdhKJlQcf3DqrKRMDjzm6EarCrq49iWOyTKoNqzj3ssatj91PvcDOK1gi0D0sQtVKvm+XXTFsfcHbgeAQHO2qjXbOJ1g+gUuhyAXAxpLEEzi+OtRQVBJBobAphGz4S699rfC14rqSPkvfxXJ4ITQvRaF5tiSvVXSplvKJcS7EZCIdfSQbeVC4elqSEWfq210rhSVdZ4rzr0+muJkNMb1vf/sVKsE+LpFEWcKHE9OWEnXuTMxQ+jl41iHErA/Kj8xIJz9Kl8S7b+PDCKHLLc+bmN6XtCYUwd41q1LHvw8vcp4c0iVZP3a+W+iPpPoqwxwI63ZQ33W9gJ0flRICignEZTza3ltXQDGKTOIda9hfZo7FuYrfi6l4oeUSAAjuOr+F0ewE9ZP/d6JBA86pgyQNa6b/Ne9NVxgx+X2/JAj7e2V/NfxsyyqQo5ENn+tCAQVB4A6YhrezJb9uzuGjMbJ+vHZdlWRwbI3wxTv5gGxody61FgRf0PdsioWXNe8M838KOdnNnVAac3XG2rQHEX8ztaqK8mcXFU2F28Oo/wr/XrLC7o/ONSH30qO6vUx/NsVMXWekJdklMLkVK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(86362001)(8936002)(26005)(70206006)(4326008)(8676002)(81166007)(70586007)(5660300002)(44832011)(508600001)(7696005)(2906002)(1076003)(6916009)(36860700001)(6666004)(2616005)(54906003)(316002)(36756003)(336012)(40460700003)(82310400005)(426003)(186003)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 01:47:17.3388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce30710d-8e6e-498b-64e8-08da32f02e2b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3338

We have introduced CONFIG_NUMA in a previous patch. And this
option is enabled only on x86 at the current stage. In a follow
up patch, we will enable this option for Arm. But we still
want users to be able to disable the CONFIG_NUMA via Kconfig. In
this case, keep the fake NUMA API, will make Arm code still
able to work with NUMA aware memory allocation and scheduler.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
Add Tb.
v1 -> v2:
No change.
---
 xen/arch/arm/include/asm/numa.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index e4c4d89192..268a9db055 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -5,6 +5,8 @@
 
 typedef u8 nodeid_t;
 
+#ifndef CONFIG_NUMA
+
 /* Fake one node for now. See also node_online_map. */
 #define cpu_to_node(cpu) 0
 #define node_to_cpumask(node)   (cpu_online_map)
@@ -24,6 +26,9 @@ extern mfn_t first_valid_mfn;
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
+
+#endif
+
 #define arch_want_default_dmazone() (false)
 
 #endif /* __ARCH_ARM_NUMA_H */
-- 
2.25.1


