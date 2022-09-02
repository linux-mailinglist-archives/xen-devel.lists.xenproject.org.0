Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64AF5AA675
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 05:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397285.637812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxWI-0008Ry-6z; Fri, 02 Sep 2022 03:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397285.637812; Fri, 02 Sep 2022 03:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxWI-0008OL-1u; Fri, 02 Sep 2022 03:39:02 +0000
Received: by outflank-mailman (input) for mailman id 397285;
 Fri, 02 Sep 2022 03:39:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UH2R=ZF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oTxQ2-0004PQ-Ld
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 03:32:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60072.outbound.protection.outlook.com [40.107.6.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e19ca15d-2a6f-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 05:32:33 +0200 (CEST)
Received: from DU2PR04CA0090.eurprd04.prod.outlook.com (2603:10a6:10:232::35)
 by VI1PR08MB5469.eurprd08.prod.outlook.com (2603:10a6:803:132::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 2 Sep
 2022 03:32:18 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::56) by DU2PR04CA0090.outlook.office365.com
 (2603:10a6:10:232::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14 via Frontend
 Transport; Fri, 2 Sep 2022 03:32:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:32:17 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Fri, 02 Sep 2022 03:32:17 +0000
Received: from f51a0cb4c96b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 89DAB0A1-28E9-41C0-813E-F00EDBFF854E.1; 
 Fri, 02 Sep 2022 03:32:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f51a0cb4c96b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 03:32:12 +0000
Received: from FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a8::11)
 by DB8PR08MB5387.eurprd08.prod.outlook.com (2603:10a6:10:115::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 03:32:07 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a8:cafe::a1) by FR0P281CA0112.outlook.office365.com
 (2603:10a6:d10:a8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.5 via Frontend
 Transport; Fri, 2 Sep 2022 03:32:07 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:32:07 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.9; Fri, 2 Sep 2022
 03:32:03 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.9; Fri, 2 Sep
 2022 03:32:02 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:59 +0000
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
X-Inumbo-ID: e19ca15d-2a6f-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TH4O/OSl/GXDZtPZeNzan7mPCNxgqKtSG4HrD1ekN+qX4jDIiKsVrf/i12L3PmdwRx+ZRgWeI8lkICacIdktvxJcQxoU5c64aM6m5Uam5MxOEmGKx8bTIXDcVbxJ6nnGHD8pW6GbU271NnKzZuipaqBqcuoW+yI6RU/a0Sol/nTSbiGNh4qGjuPcpJ7eVJD3mMfyqaQspFZBjjILZM4tRjRYz2c/ibP4yV6AAIwoPj3GDqXY+HydkJpMFTe6Vd1smRmqSaC9No6lDPzBJ0cw+eA/7o0HdCkTJ7tZ4F8VAg9VH14ukE6KzxWSk3TmUd0IAvSfI1kW8+c+LEaidou/aA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c24JNM9CmKKyBmuocLYrIdMPXWfKN3aqMIKpf5afvV4=;
 b=gpPmPgdeccSTZIw3/DbbOgh6DxsDjxoViRjikyq1I3NqzPl7VuBCSRGKd0ld0+V0aOe+YsgWVbS+dDmUCUQpTD7FjYsaSUEm7/SlL4EgjAU4z4CxXeGs+1SDyLH+GpKiLJTclLEfItzcfiDdgqpvMAMOzYAnLa+/fikos0/ZR+JpgMq0c9rXOPS+Mm652VJD8IH2rt262BIsEYtUrKehtIvwGn1Mj3UdMrwO4S5IadaDcukLe10IJMgHfzCRQsxSY1SgB0bqRkUvDr+GUzTQVLYD6EkDrfYTHj7JAD13JT19xQ2LGOnwuVBi+pe3Z4RRmyD0GdzC6oWMeXG6WnK7+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c24JNM9CmKKyBmuocLYrIdMPXWfKN3aqMIKpf5afvV4=;
 b=lbtlvdMlwCTPwrFVphMgQrn8X89rrEyvugz2kckcYvTISZMOZrw6BT38gAvCXJ4N9mux67BoGqi5QQAlDZLjVmiM25f9ny/RPJzx4v4R+TQP4Pb/WXicIysPoZCWGeUxSJ/HD/YXhZznFexmCGzyZb3Rrb4DZOPnz8gPRXjby9k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9a734e8d165181b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiToRe2dz/7nR9uUzYEoDSc1syPLMSUmWrQLbM7hkt6PBxfFaJTz0QbTY2gl2XWWZ3ey6yLyA/m5L5v7+jKecOdV4lZebvvXfL/PJt/G0XMNd5ORlWJzfnVlo5/+j24kD0Qb8nnjiGzatq/0Lss5JHIe0SqiTs6dxuXeXemDcN6GhSu0zZhnqwHdkSFcS2yl53cEKyPsHCt0S8rCO1RMm7JEmxt9gRzoEix1ilpuf5mf24sd21z22lg0Cj/BGvd/XKbsVrRPi94r2HbIILmYNGGODg6wQHiJ6+werwA6I0raKnbTvFYasQAG/KeiNyjnDmlOyw3UVwSe/Ud+YQHRiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c24JNM9CmKKyBmuocLYrIdMPXWfKN3aqMIKpf5afvV4=;
 b=O3Q8KxxGQ09UOX5wqaf9wU9ZDPSUPRU45xPadheJgEeLGt+L2CAj0Unn/Qno+GhwXjm5//8soPq55/cESQ3Cgkc3qP0zbu53P8/P3A96/kP92dic7dbtVM7l3Fqq8qMHImo5Ofj3Kudyr4jmMvtd8vw0sZokhN7LV46+f31fKdCv1DKJw48A3DTFuT3kQZjEtoF+/xpgTZ7uRnPEJ4PfJPBWcvMTCbeOjny8+WhID+KLxoWTH/92NUlq4QtkIo3QXWqVVfwznTxLO1Jr9UgJm7sVakBcx3Ff/t6G33wLkY2RpJTFh9B1jp/0hAQmTVw6Jq5+ivlNX+bUYeHECGjRoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c24JNM9CmKKyBmuocLYrIdMPXWfKN3aqMIKpf5afvV4=;
 b=lbtlvdMlwCTPwrFVphMgQrn8X89rrEyvugz2kckcYvTISZMOZrw6BT38gAvCXJ4N9mux67BoGqi5QQAlDZLjVmiM25f9ny/RPJzx4v4R+TQP4Pb/WXicIysPoZCWGeUxSJ/HD/YXhZznFexmCGzyZb3Rrb4DZOPnz8gPRXjby9k=
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
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 6/6] xen: introduce a Kconfig option to configure NUMA nodes number
Date: Fri, 2 Sep 2022 11:31:21 +0800
Message-ID: <20220902033121.540328-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902033121.540328-1-wei.chen@arm.com>
References: <20220902033121.540328-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: cf474a3e-91b0-4ad4-a9b1-08da8c93bc7c
X-MS-TrafficTypeDiagnostic:
	DB8PR08MB5387:EE_|DBAEUR03FT057:EE_|VI1PR08MB5469:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JGRRDgUUgwq1I29DjGybxxrrOdX+/IkmLKt+W1B+NCp8RgzpPpmV7NVBnkU55qISCs1y9FegLsYHyhDsSF0VYGS8qZPPERgiw9bDpEoAAVrVkebS1UdBozzMaRcIgfyYkOHpKdM1Zs++mxVVFWxsjJVjJECtu1lauw0LVIdZMF9kj8LqFFFj0udJCRCEKE+hHgma7WmqMzm+dnJX0V6pweYYD4ce5YSrjzf5nFjFzAgkYMOGW4JTO52zi/fdMu6Tm0UtsqfCr8ZxP94wtvgm5Hin9kaMN2T+7TPRthzwQ3dcmm9ygojDhJAPp11jDjAoq++nUKd040qFI0HJ4GigWu0KaIu2oq52CrQTq3ZXsSY9KI6rrT0cipMDfUmojMxqo8Xxm+HJMR6tlJY3xyinEqda7eAJFerVJtMF6ZRtLsifHrDL7scTSwFaikwULuEpqididqoX3Z2CiWO157lkKUoY3P2VFda8/crBs58yw+QK4mP5zRP3HBvQrZlSnrscetf27lGxLu6CxAZ81BkdoFe5RVWbHOUzPFxMs0z6H77pxR3jy+Z24cv/ld3h6k4d36q0Sdpul2ME1hTnrQeF0xn4/ewraNP0Sm6CZaUM3SHtQ3uemhUesEhEXLs8Mas/0e3wFjUbFDMT3jVz8a3XRTcQMMTN37LOkKjG8awSGDn7Sl0BKZF31vPlrQQxOZRW4xzY49v0NdDSp/c+u+0xPrIK//kJwgs4PnUWB4JccTwcxBolJT46qSh1slCo8wBleXvhUjJl26bFdGRI3NrxxvIAIC8ugXkMJJBVAunCdE4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(40470700004)(36840700001)(426003)(47076005)(7696005)(26005)(336012)(2616005)(186003)(1076003)(40480700001)(44832011)(8936002)(5660300002)(36756003)(41300700001)(6666004)(86362001)(478600001)(36860700001)(83380400001)(356005)(81166007)(54906003)(6916009)(82310400005)(2906002)(316002)(40460700003)(82740400003)(4326008)(8676002)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5387
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4e9e035f-a40d-49b6-b8c9-08da8c93b651
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fZtLOlQCO853KMU0YKSVrSaS5D94uJW/oE4rv8HJkbMRUMkQpJmNQebYwjUomlBgQM8aPepN2y2DeUQ1JvBLBhoiYl8G5MxphLyoT/KKbDESZDfZJqqeazRxR0FjmlfwMHgJ6Atyy8FYb7FGSM1i0WxbfycwJrvCBWNI4khrh4tplnNh0Ozs92XVB0FcfnySSdlTCI0JXB8iHzluDbsAPGt1fc2scH5qHTLYAwfZ056D+DSRWdTqkPLtrVv1AJJHDrDGYIl6y00pCliHzXLVDM1ScJ9ZgFE2uVhYFjYR8SeAH+nachM/j/aiV7ifwNS54vUjED22BFJmUzD2v/nYqWuMqOk8CEQD2E0nhzz+bxiWZVP+CxV9cYUfcnHR77YB4HfIfT7KvnwYRk7otvOFLi1xqEWa8kV0XiIn4J+/4TB8jS1rvKISWxzmnsTlT8iug9B/4fK5GOGkYDENktxqxdmxgEPl/+WQtFcXL4Ulm8KOOu8DFMhJwdvYjL+EoBEbx2HubPGESh66igjF9tjELi4smAhB9FPRvXLMGE9duQp8ZAzwVCGMlDYAlY++3tAcD0s/Y9KhxuQbLq9IeufTFLYR4I7i8vNyicH7fSOXDw9wD3uRXVyFE6+yrFhSq6xkSGImSpUiQqTbGGSGEMVbFeOdc4nNfXC2LHNkHJke9mlzSA4rbfWBT1pZGLZ71Yid7d4/UJq9gRbVAhOyp+F2BMf/l9y8RSBMd64nv2OTTrBGEA0APX5UB0a7QDloXTwkDl8MzgOTiNNk3cgMO+RHcA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(40470700004)(82310400005)(40480700001)(36860700001)(86362001)(81166007)(70586007)(8676002)(4326008)(41300700001)(5660300002)(478600001)(54906003)(40460700003)(8936002)(70206006)(426003)(6916009)(1076003)(316002)(47076005)(186003)(82740400003)(2616005)(44832011)(336012)(26005)(36756003)(7696005)(6666004)(2906002)(83380400001)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 03:32:17.6714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf474a3e-91b0-4ad4-a9b1-08da8c93bc7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5469

Currently the maximum number of NUMA nodes is a hardcoded value.
This provides little flexibility unless changing the code.

Introduce a new Kconfig option to change the maximum number of
NUMA nodes conveniently. Also considering that not all
architectures support NUMA, this Kconfig option is only visible
on NUMA enabled architectures. Architectures not supporting NUMA
still use 1 for MAX_NUMNODES.

As NODES_SHIFT is currently unused, we're taking this
opportunity to remove it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
1. Update the commit log to follow Jan's suggestion.
2. Add Ack-by.
v2 -> v3:
1. Fix indent.
2. Use 2-64 for node range.
v1 -> v2:
1. Add NODES_SHIFT remove message in commit log
2. Change NR_NUMA_NODES upper bound from 4095 to 255.
---
 xen/arch/Kconfig                | 11 +++++++++++
 xen/arch/x86/include/asm/numa.h |  2 --
 xen/include/xen/numa.h          | 11 ++++++-----
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index f16eb0df43..7028f7b74f 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -17,3 +17,14 @@ config NR_CPUS
 	  For CPU cores which support Simultaneous Multi-Threading or similar
 	  technologies, this the number of logical threads which Xen will
 	  support.
+
+config NR_NUMA_NODES
+	int "Maximum number of NUMA nodes supported"
+	range 2 64
+	default "64"
+	depends on NUMA
+	help
+	  Controls the build-time size of various arrays and bitmaps
+	  associated with multiple-nodes management. It is the upper bound of
+	  the number of NUMA nodes that the scheduler, memory allocation and
+	  other NUMA-aware components can handle.
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 2ca3475271..7866afa408 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -3,8 +3,6 @@
 
 #include <xen/cpumask.h>
 
-#define NODES_SHIFT 6
-
 typedef u8 nodeid_t;
 
 extern int srat_rev;
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index e593115ba2..e16a7c3764 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -3,14 +3,15 @@
 
 #include <asm/numa.h>
 
-#ifndef NODES_SHIFT
-#define NODES_SHIFT     0
-#endif
-
 #define NUMA_NO_NODE     0xFF
 #define NUMA_NO_DISTANCE 0xFF
 
-#define MAX_NUMNODES    (1 << NODES_SHIFT)
+#ifdef CONFIG_NR_NUMA_NODES
+#define MAX_NUMNODES CONFIG_NR_NUMA_NODES
+#else
+#define MAX_NUMNODES 1
+#endif
+
 #define NR_NODE_MEMBLKS (MAX_NUMNODES * 2)
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
-- 
2.25.1


