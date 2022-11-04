Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CBE61942F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:08:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437421.691801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtck-0002Fi-FG; Fri, 04 Nov 2022 10:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437421.691801; Fri, 04 Nov 2022 10:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtck-0002Bw-B5; Fri, 04 Nov 2022 10:08:30 +0000
Received: by outflank-mailman (input) for mailman id 437421;
 Fri, 04 Nov 2022 10:08:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/tm=3E=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oqtcj-0001vd-85
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:08:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60084.outbound.protection.outlook.com [40.107.6.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0a1bbd4-5c28-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 11:08:28 +0100 (CET)
Received: from FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:97::19)
 by DB9PR08MB9441.eurprd08.prod.outlook.com (2603:10a6:10:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 4 Nov
 2022 10:08:25 +0000
Received: from VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:97:cafe::88) by FR0P281CA0121.outlook.office365.com
 (2603:10a6:d10:97::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT021.mail.protection.outlook.com (100.127.144.91) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:24 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Fri, 04 Nov 2022 10:08:24 +0000
Received: from 07872d1abef2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CBA8DF80-5084-49F2-9505-EF33C838FFA8.1; 
 Fri, 04 Nov 2022 10:08:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 07872d1abef2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 10:08:17 +0000
Received: from AS9PR07CA0056.eurprd07.prod.outlook.com (2603:10a6:20b:46b::32)
 by DB9PR08MB9636.eurprd08.prod.outlook.com (2603:10a6:10:45c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 10:08:16 +0000
Received: from AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::27) by AS9PR07CA0056.outlook.office365.com
 (2603:10a6:20b:46b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:15 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT058.mail.protection.outlook.com (100.127.140.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:15 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:14 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:14 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:11 +0000
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
X-Inumbo-ID: a0a1bbd4-5c28-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ocRIxqAe0rTYDLZ7vGYC2mCseq2tMleYk83Sahdkv5Ixj44lpL0Px7bdgazygnt7tGP6eqImPVQNuK5NgxXqcxTmOnzHmBIiedwXME+pYzur9wM+ZS2noYbZORki1j5CXJXMZrWzpjDvuRHzDy4+19mqLTuSuhU0cc3H395sQb//xnfIYOh8mEteP75YaIldsBnAIdteiMhdIsiLQh2bgDTHEylwZjgViJdn/YFnJoG5MAx4q0b11oIOeyMMoN8pKDotQnoWPQBQcAzGHcBtqwH37kr4ZZI8ORCx85wrfTAC0kH6OzVxOs90ZVRRyDE9+mHFtoBH4E6zr9Q3gCCjTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnPM1xFo4l+7IWvKEJmJLFxA1jz0PVO8B+lteuoaFGI=;
 b=U38r1RTUs+fkOCVGUhaqoUHto9ycd7HEdSfNbmKW8bsmKsV2rSlztX2WAnLC3e13GhjZ10llGsWbpXi7l4bBMEN2dDiutKn3dxixN9ejf+/iu5VXq55jr6HNAMg1kSoqp+r5FU0TaEtSAAP72Xc/mStg82HuGOIr+9esT2ai/96+Km9B4BjvI6m5wWlkOglMiZhvygaNgeYDmG7MR1aoRzKwVOnz/m2oyGgowshAYWcfmraRwpYMJIpxpGmQVBdXrMMYluZt4iSyb7IUsdt2xDBscLCkMI/f84xCoMT/1HFmj4HFOcyci+dx+iTi41Is24aWcdJkq3eXaPeA/nUUkA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnPM1xFo4l+7IWvKEJmJLFxA1jz0PVO8B+lteuoaFGI=;
 b=4jhgRmhxNKxQgHFQsSHNivGfdYSf2EDi+BG8VHhYwjAd3UGilovWjmCGdpUaB/Y0V4pN1EkjYGyAstXuRGLo1Od5bhyVM5mbJ4NpOTe8JRqf9C+Sy7YJZWuTvyTW2D6VjpddFF7FN9FrR85xdvP6CUwRlpxJ6J6w3+miwiE/6JI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee05a032046f179a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLGVoQKsIoS9nfq+l6xtfc591eudryOlvFdqbdrT0+m/henrC5SqEYonMfPVOIlP3dLT+xhzZU6t8bHo5hu3+QrBh32v/18bI5DI4tgA1mD2VKZ0FGO7RiTpzOnkKDQcdNesvWVFJyoJ0HwOO+eb+xmakTFw9ziIa5mf186TuZ2xTVK0XWEo73YC9w66cap3od91nd9/tmX7udvcvYpfIq3hXDnms7m635zE/84AOjqnQC6pLusvtjb7/SbyRcDvl4VlzwBcBDQ3cmZ3/m9BMywm3aOig37aDvmuAtF9oEHiV+54pf4SMUyVYJdmRbBXrTFZwFYI3jLhMFgKe0Qntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnPM1xFo4l+7IWvKEJmJLFxA1jz0PVO8B+lteuoaFGI=;
 b=d5iDv055lkPfwavtOhaZWMYZd3+7/I6Lw8YEQlOPiyddWUPZd9KmW+JmFVZby1GiR4V3d2Bi/KdntVNqFc8xTXiYTJ1MAV4l+7IuhZPqA4osWMIvnPsPwDFTSXgi6j8RfTcWF2kPQBZwYYxh97buljxHK5bsH5W9BG6KCPgIfSjqFD0GiIXeTe8v1l1YGCZwK88gQcvDt9S21P94TJPmYq/irXtYVCfuMPb/zOajI7oVR+HMh3sZP62fObR2j+DfOC+qb34gI2hugb++80HnkCif7qvv006gceHTJD/8LpaUuDg5mBZwGHsxGJUB/47j30dA9N+PCfp/MR88/bCH4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnPM1xFo4l+7IWvKEJmJLFxA1jz0PVO8B+lteuoaFGI=;
 b=4jhgRmhxNKxQgHFQsSHNivGfdYSf2EDi+BG8VHhYwjAd3UGilovWjmCGdpUaB/Y0V4pN1EkjYGyAstXuRGLo1Od5bhyVM5mbJ4NpOTe8JRqf9C+Sy7YJZWuTvyTW2D6VjpddFF7FN9FrR85xdvP6CUwRlpxJ6J6w3+miwiE/6JI=
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
Subject: [PATCH v6 02/11] xen/arm: add iounmap after initrd has been loaded in domain_build
Date: Fri, 4 Nov 2022 18:07:32 +0800
Message-ID: <20221104100741.2176307-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104100741.2176307-1-wei.chen@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT058:EE_|DB9PR08MB9636:EE_|VI1EUR03FT021:EE_|DB9PR08MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: 49cba82c-d5a0-4d74-0d69-08dabe4c82c0
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3kkhQZZ9G+0mMV5jEY8nCWSAVJV4xNMb4rtVT0pSxQbHUn0FNr61CKezU628+3sPLdd607ljOLaIE5OoKb8CJLjysDcCfrhwoImwLV9fWVORSF8fflDNQ2+hxFOScLrk8wYEekUWWER4ms8TGAcussUtheL1bA0G1P4UHiTR6IC+DbYtWrNa+jtAaLHZEupv8/mezLBGgwcUzEhoHdNa1F0fkujmoFkNYeFJPjpRRXeL8hDJJXdaqpb+Vb02S3e1DgqWKTnC0BfKfz5W2OMQratBvZuXuTDfChEWY/ldlLo9anFEg7caBXJ832r7WB8j0DHz3luIi31Oo8FU7T++aWQ25Gnwv4c21HI18Qx1QX7gak2XHS5F+on5bcmUvIWkqL4mHr4GmYNfVHDTvjQ9R5x4I7yeivkxugrv83YNojIKPyyvGpgkRUVzwskNVeHyQd34oOFX4XSSWgoilXPttBX1BRovmP2YoAFZVMhpLGCD//IzkYZi+m/W5z2j4yM9HCBa94nGpo+ApINKaXcImuQyhimA5vm4Rc5s6qrFfyGVtiYb1QUppS3lMQ0bJ3pV+CqPsolkrkIFWEvjQ+uxlIfRMmbO0ZVWAznsoDMOamCnzMnA1WCQAKoHphe4phfzPcpg+yWiTF3VyLwqJUk57PCCm+hIHGI/UB8pA1g+hU+s3+tL2vLwAecFXpslSs/vKSpiQLJeuDrqZPMhYAYs7rwVZaRxMwZGL1K+BxyEm70DGF5ZomBUyMVvaVbTejVtOxxraPKPk1M4iHNS9GFwr5wiiliP/WR2vYtXyeLQr8sP9QY37P2xBpdciTm1EpO5
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(4744005)(2906002)(44832011)(36756003)(40480700001)(70206006)(6916009)(81166007)(356005)(4326008)(41300700001)(54906003)(8676002)(8936002)(70586007)(36860700001)(5660300002)(478600001)(47076005)(26005)(426003)(1076003)(336012)(186003)(40460700003)(316002)(2616005)(86362001)(6666004)(7696005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9636
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22b3b432-17e4-4971-eff0-08dabe4c7d61
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7BF/UgCwIzR89avK+tb6fvqT0AkrrwZq59Xm9oUCBUmyqJM9PuQ5aMbqt1SgcVLEJaGfDxZC9KjnE/fL6TyO8CD6CcHLH0m8leYLYn/RY0In/JNx/s4esQprtB1KhTNO3FqvZuVQUaLvpgaSZKI3IE9t+x/WpDRZOPm9PM9B9hL+BIBmEb2sZe8Ms5HfKlKgr0Xxn1hBBw0XGuyWNmgldynz5lVEVXUcBxeEYOe5KRn2rKOh/jBW3zalT/1iwGsO8tRQwEOP9UWNq+XrBVW5znOFZBJrPDFOFvNbP7y82aU1EHJYaprVD4k5NQ6VfiltyS7eLcR0IC4f7BPZYOlhiStlJnJg4lTfxhkvCPSHN5XJwqIhtHbWXOQjwUC+VOT/Y7mocfqv17lLt1/yP/2SnVUtI+qJs8rdorevBwH9v4r2EmgjZC1KyOMd6Pw/dCvOGhhLbvFqYgvBUFnMlhJBUTl2nGUut0nVy3RgjK4JWDDIqQw5uq40BqEezbKdeOvbX7X9m4w/28UarE0Kc5tHnRY1h2IJOi+yTqUpl2cuwge4iJCg+wQF7hoUoCbXNpRj10gH9FTvlPqQK0HW1ouujZbH21duJOJK4bgekjEfWLmlACk7ED6o4qBdoH0jQT4//9PCxVPzw4dhz+7l6cFpZ4aW0K+V/cc9fM/J1aGCVaIr4xCRmobE/z228yMsVZqM2MAaW7L3XVghPCSSVilBD/PSlAwjQQfVs+Ks+s/46OBHc60Q3zkokLYFHaiUFI2BbwzKR9852E267cAdg3WwXA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(54906003)(6916009)(36860700001)(70586007)(41300700001)(4744005)(40460700003)(4326008)(316002)(8676002)(81166007)(40480700001)(70206006)(8936002)(5660300002)(2616005)(26005)(6666004)(107886003)(336012)(1076003)(7696005)(47076005)(86362001)(82740400003)(426003)(478600001)(44832011)(186003)(36756003)(82310400005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:08:24.5669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cba82c-d5a0-4d74-0d69-08dabe4c82c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9441

domain_build use ioremap_wc to map a new non-cacheable virtual
address for initrd. After Xen copy initrd from this address to
guest, this new allocated virtual address has not been unmapped.

So in this patch, we add an iounmap to the end of domain_build,
after Xen loaded initrd to guest memory.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/domain_build.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4fb5c20b13..bd30d3798c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3418,6 +3418,8 @@ static void __init initrd_load(struct kernel_info *kinfo)
                                           initrd, len);
     if ( res != 0 )
         panic("Unable to copy the initrd in the hwdom memory\n");
+
+    iounmap(initrd);
 }
 
 /*
-- 
2.25.1


