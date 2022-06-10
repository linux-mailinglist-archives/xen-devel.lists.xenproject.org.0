Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AC3545BEF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 07:54:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345792.571479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXaj-0007Dn-Te; Fri, 10 Jun 2022 05:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345792.571479; Fri, 10 Jun 2022 05:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXaj-0007BF-Mg; Fri, 10 Jun 2022 05:53:53 +0000
Received: by outflank-mailman (input) for mailman id 345792;
 Fri, 10 Jun 2022 05:53:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4Vh=WR=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nzXah-00078y-Sq
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 05:53:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b252cbcc-e881-11ec-8b38-e96605d6a9a5;
 Fri, 10 Jun 2022 07:53:48 +0200 (CEST)
Received: from AS9PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:20b:488::35)
 by AM0PR08MB5155.eurprd08.prod.outlook.com (2603:10a6:208:15f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Fri, 10 Jun
 2022 05:53:45 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::90) by AS9PR05CA0002.outlook.office365.com
 (2603:10a6:20b:488::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:44 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Fri, 10 Jun 2022 05:53:44 +0000
Received: from 68f3d0fdfe0a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F780FB04-C8D7-46D0-98EC-33D5B5BAAEBE.1; 
 Fri, 10 Jun 2022 05:53:37 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 68f3d0fdfe0a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Jun 2022 05:53:37 +0000
Received: from AS9PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:20b:488::28)
 by AM8PR08MB6435.eurprd08.prod.outlook.com (2603:10a6:20b:317::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Fri, 10 Jun
 2022 05:53:32 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::e1) by AS9PR05CA0008.outlook.office365.com
 (2603:10a6:20b:488::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:32 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:31 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 10 Jun
 2022 05:53:25 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:22 +0000
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
X-Inumbo-ID: b252cbcc-e881-11ec-8b38-e96605d6a9a5
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=F+UezYvx7ynEFWPzZKMVLYnkY8ho1BbsxYOeU6jnqWZs5ijTljwbBIG6/pcOsCqiG6SJhjcGOauQBTXmAPsD8ircrngWcHTCzDz3srgSv9DBSKNTKvZopCqrJc7Hth7igpnwxWDEjiRSBlJ/NKQP2fTFcjnO4qob/DhSQ9PLL/K6wsDTwsg+0U9iY6a2qulHihEvvlQ0ptMEHu4AxCX+x8sBAxnQ9EyRG+3GkArbSBU+Kv5M1SHNAsi1EiE5chr4rsIlnrb393tgDAebtTE8BggZ2jmajo/QP9355KfZKZ27so1JS8GJdPYCr07eSIDL5JcjETk5jhVuwvCvNqb24A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1Mk+96NdZCuYCNVMfuYJAf8YYMD5xhqAKxBbA5l6eU=;
 b=Box0C1tXqYBo77Cwteykhnycv/SiTPkA9Dh2UzBSvky7La1DcVdW0o+bBQh5Gg8W67o7JpXdhN9IKogHKSlGp0simasq3ncplDhv5t9emZxkSyYfQpvKiQzXcUg1WPHB/jMaPBEkkMXuCIkHe6NSvRh35IKjK1cIa2csyrt0Eymx1QrdPOzlXwC6on62tzzqCLFpp6xJKJpTSY5XXcBGhj4i8CzP0uFZjfxPXcAkEVZJ/pl75eGEWi7uFNVNgha/iX0HIC+8UBEc6YwZEJe85fuoDsKZn6Jmk3IMGuOGOWTRJ5BmMo9YOi0cI0iH59L/RY0NBLCvqEXrq0BaA2gBsg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1Mk+96NdZCuYCNVMfuYJAf8YYMD5xhqAKxBbA5l6eU=;
 b=hk0LL7BZPrbco/PiUfd8AJb4426z/uNgEwO7nVPPMn8OhFeESDnlHhXRYIija5zeYVf/ZO+0OFQSiadJpW+X1H9R8FFmEniomwfuaa83FSSKQjW8ryE8c893vPWw/gwWehmf6fBAnvEpQ31l1t4UErPV5WcszWLGTzd4u2ks2Xs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6fb21e0bb163feb8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uh9EFywxyJKcGYkOb28UY55GopgAUmI/G8CPP/Bl0mzJgvnzvxAC3YsvH2ow7A/XYJTMIA+e2hSW/WVrCupGNzPJihlakDQhW4ib8WGiHfoL9h3HuCnOq95Dc04eTD8D/qaUPpPbPl8nnJY7xec0z4R9zkeyqGhFpAk1PjB4osoNSAmMAxHIxwrmGXQGjYtjzPejW/87Tr3J2RiV0xJgLLtOYnkJmCNJi9KuPjwsaPQNooAXFw52TRKOVdizHmIbJZJW6eHHilMI89BfnziONzLjoZV2pSbNb5jGWgtuYF2fUBcXBpiUc6yBL1+363w02fcNaMAverKnFF5+7W0RJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1Mk+96NdZCuYCNVMfuYJAf8YYMD5xhqAKxBbA5l6eU=;
 b=f5wVGbRczca9b7iqsquDTyMIjP81AZeNsOa8VciyIxwDojEV6QwlkmQE6QHI9zF8mnT2kWSlazSR39RSmrrEbgfaOMt3mbHuNuTYORqT4t38lFr+RV8EZG5Laxm/FNvSlzO58v+JYXt0xDeVezEaKHEotlVMD11c4YjhXikUEwrCPa0yjmA6/8V+uL/55TFPGY2xmID0u6yeXQ72pnTd9A2uJtuf1N1z++a3CyqF0mHu2Kdgxm0Ed3DkGhAq4X/MHKU0sV3Pxg3mRtCo3ru7pIj4//eeqRnxNKThXmp/kTdttnnaBU0qWRFBZHWZHCh2ZjUMp/uB3Fb3WbAU7KF8LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1Mk+96NdZCuYCNVMfuYJAf8YYMD5xhqAKxBbA5l6eU=;
 b=hk0LL7BZPrbco/PiUfd8AJb4426z/uNgEwO7nVPPMn8OhFeESDnlHhXRYIija5zeYVf/ZO+0OFQSiadJpW+X1H9R8FFmEniomwfuaa83FSSKQjW8ryE8c893vPWw/gwWehmf6fBAnvEpQ31l1t4UErPV5WcszWLGTzd4u2ks2Xs=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Date: Fri, 10 Jun 2022 13:53:09 +0800
Message-ID: <20220610055316.2197571-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610055316.2197571-1-wei.chen@arm.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 463e935d-7839-4355-975e-08da4aa5948a
X-MS-TrafficTypeDiagnostic:
	AM8PR08MB6435:EE_|VE1EUR03FT051:EE_|AM0PR08MB5155:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB515506C237728CA19B50837F9EA69@AM0PR08MB5155.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 X1PKdMnFiLCqt1sXEdQazsDfx4yVraZ/BRTkf7nOFH6HkP+9Vox0tmc9JrfstOa209dXiZWt8zQjW6hKHPPXfEtfYQ467dvejzN9hBEyCt36zwD2SdUkkEO4YzudOUZo9Ax7N/hUcbfgwJaymFmWVPmK/O+mqvmm4JgMfW9APAcuLZr3lNWOreAiSSzpyEWlF2aBahKmj2mOMcqAcgWf2rKY7B4tXSpdL5u0M7azPbbKn7bSfo0RoQsNfR7uwj4ZRsvnix63vVRMiCTfY1+9QxylWVOHN+M+1VdHcr+NDjtrDfYr5fBSFgW3IMm/wHu+iZ6WLv3SY7Qb8H7JJxxEs0KOHTxxxlNW5FxIecaXpGMcQo8M57JuQxkqMytXNrcVAmc0cIcFnxkRUrij3HWNbxPW+PzfIOWOu4Q9pg4JyP9a/WI0/w3D6kLnRfkYt7Sj9OqYUpgqmqTutBJpnTHQ8XLjAVH+/c+UhMCV32O6zAgGW3aIJ/gVU0rhZ3fB+2shDphQUw2/5Jq7Q8Z+5r46IekNtPwQWVS6GTyMIt8Mx15j6TNWScOVXOQXy+dlesbkTDdQktGRaqu0XmlyMUTFhKh+tnnazDzAFeroux9/QxB0SEl0lI8A/AY7buwNvNx8DnuHnaNqcQHjdXVwn/X4u2RSrNLzKzDQHOZXT4OeKJJLmcSuV1F0WhkzaRqkt9FHJroLmdlESRUW+4/vmpJYeIEvJona0y8X+lyTilUDWSs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(316002)(1076003)(44832011)(7696005)(82310400005)(40460700003)(8676002)(4326008)(36860700001)(70206006)(70586007)(26005)(2616005)(54906003)(6916009)(2906002)(426003)(8936002)(47076005)(83380400001)(81166007)(36756003)(86362001)(336012)(356005)(5660300002)(508600001)(186003)(6666004)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6435
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b9e15fb-4f6f-482d-cf6c-08da4aa58cca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AwXtMinKcluzfivA0UI87TetRo+Tw2Pr5KsJsLYP/KvcJOjpkVIo1L4vWLbCzMzsi+okAnQBl/zHWaoH/xaqVR7gblYSYVasJlouhi+rd9DJfU2EyA87pX01u7/DZknv8eGhJmQ3xk6PRl+9iDmgwqUG64pPKNjtl6syLDDru11IYopG/Pn260eMAGNfMEFBhCH0z3S70W6Mnv18u324FNrKtYT7sJ+N5QOcOcWQHmlna0N+VFsCySf1ZOzrGWnwlg8f3owiKhyWGKAXvunKF9sh3HtECuKN+TY5wKoyigCCy9/Emx9IQkRcdju5/LVsUeTI38qaNOGSB+e9rhybBfb6nWvx9+mmAFhQoxYb/f+Yk1syvaXar5dX2MpIwWHoAE35cweRPiQF6cjNUenY4t/J4+aF7Y6nb40IzBtAv7UhPUONQTTs/AzpFyW0CaFcucEqvvwg0oBTObkVCoePQBcMogUqTfc6hxb2eAMW4g4KxBg0FqV4MXeFzfJ+Lr5/zt7PT4XSvn8J64Sahbm50Oz6Xg57TaJT1ak3sJ6UPsU47SRTsp71V2OiP9F7dY+ej6g5P917zjn5N5Yrxvx229okPZahuTnEpz7LWB+AwTJl8QEvCXHdQ9LWESOrAn6Kx2CG2rBoce/5kjtq+f3Lkb9kCafY+o4khVpotWScygmV2hquKg59GuYobI6kLhwKnapSyHCKSGBf3QqjY2xMBw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70206006)(44832011)(26005)(316002)(82310400005)(70586007)(83380400001)(81166007)(86362001)(2616005)(40460700003)(2906002)(1076003)(426003)(186003)(336012)(47076005)(5660300002)(8676002)(36756003)(6666004)(4326008)(508600001)(8936002)(36860700001)(54906003)(7696005)(6916009)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 05:53:44.7422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 463e935d-7839-4355-975e-08da4aa5948a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5155

x86 is using compiler feature testing to decide EFI build
enable or not. When EFI build is disabled, x86 will use an
efi/stub.c file to replace efi/runtime.c for build objects.
Following this idea, we introduce a stub file for Arm, but
use CONFIG_ARM_EFI to decide EFI build enable or not.

And the most functions in x86 EFI stub.c can be reused for
other architectures, like Arm. So we move them to common
and keep the x86 specific function in x86/efi/stub.c.

To avoid the symbol link conflict error when linking common
stub files to x86/efi. We add a regular file check in efi
stub files' link script. Depends on this check we can bypass
the link behaviors for existed stub files in x86/efi.

As there is no Arm specific EFI stub function for Arm in
current stage, Arm still can use the existed symbol link
method for EFI stub files.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v4 -> v5:
1. Add acked-by.
v3 -> v4:
1. Add indent to make ln and test to be aligned.
v2 -> v3:
1. Add existed file check, if a regular stub files,
   the common/stub files' link will be ignored.
2. Keep stub.c in x86/efi to include common/efi/stub.c
3. Restore efi_compat_xxx stub functions to x86/efi.c.
   Other architectures will not use efi_compat_xxx.
4. Remove ARM_EFI dependency from ARM_64.
5. Add comment for adding stub.o to EFIOBJ-y.
6. Merge patch#2 and patch#3 to one patch.
v1 -> v2:
1. Drop the copy of stub.c from Arm EFI.
2. Share common codes of x86 EFI stub for other architectures.
3. Use CONFIG_ARM_EFI to replace CONFIG_EFI
4. Remove help text and make CONFIG_ARM_EFI invisible.
5. Merge one following patch:
   xen/arm: introduce a stub file for non-EFI architectures
6. Use the common stub.c instead of creating new one.
---
 xen/arch/arm/Kconfig         |  4 ++++
 xen/arch/arm/Makefile        |  2 +-
 xen/arch/arm/efi/Makefile    |  8 ++++++++
 xen/arch/x86/efi/stub.c      | 32 +-------------------------------
 xen/common/efi/efi-common.mk |  3 ++-
 xen/common/efi/stub.c        | 32 ++++++++++++++++++++++++++++++++
 6 files changed, 48 insertions(+), 33 deletions(-)
 create mode 100644 xen/common/efi/stub.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..8a16d43bd5 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -6,6 +6,7 @@ config ARM_64
 	def_bool y
 	depends on !ARM_32
 	select 64BIT
+	select ARM_EFI
 	select HAS_FAST_MULTIPLY
 
 config ARM
@@ -33,6 +34,9 @@ config ACPI
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
 	  an alternative to device tree on ARM64.
 
+config ARM_EFI
+	bool
+
 config GICV3
 	bool "GICv3 driver"
 	depends on ARM_64 && !NEW_VGIC
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 1d862351d1..bb7a6151c1 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -1,6 +1,5 @@
 obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
-obj-$(CONFIG_ARM_64) += efi/
 obj-$(CONFIG_ACPI) += acpi/
 obj-$(CONFIG_HAS_PCI) += pci/
 ifneq ($(CONFIG_NO_PLAT),y)
@@ -20,6 +19,7 @@ obj-y += domain.o
 obj-y += domain_build.init.o
 obj-y += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
+obj-y += efi/
 obj-y += gic.o
 obj-y += gic-v2.o
 obj-$(CONFIG_GICV3) += gic-v3.o
diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index 4313c39066..dffe72e589 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -1,4 +1,12 @@
 include $(srctree)/common/efi/efi-common.mk
 
+ifeq ($(CONFIG_ARM_EFI),y)
 obj-y += $(EFIOBJ-y)
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
+else
+# Add stub.o to EFIOBJ-y to re-use the clean-files in
+# efi-common.mk. Otherwise the link of stub.c in arm/efi
+# will not be cleaned in "make clean".
+EFIOBJ-y += stub.o
+obj-y += stub.o
+endif
diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub.c
index 9984932626..f2365bc041 100644
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub.c
@@ -1,7 +1,5 @@
 #include <xen/efi.h>
-#include <xen/errno.h>
 #include <xen/init.h>
-#include <xen/lib.h>
 #include <asm/asm_defns.h>
 #include <asm/efibind.h>
 #include <asm/page.h>
@@ -10,6 +8,7 @@
 #include <efi/eficon.h>
 #include <efi/efidevp.h>
 #include <efi/efiapi.h>
+#include "../../../common/efi/stub.c"
 
 /*
  * Here we are in EFI stub. EFI calls are not supported due to lack
@@ -45,11 +44,6 @@ void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
     unreachable();
 }
 
-bool efi_enabled(unsigned int feature)
-{
-    return false;
-}
-
 void __init efi_init_memory(void) { }
 
 bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
@@ -62,32 +56,8 @@ bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
 
 void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e) { }
 
-bool efi_rs_using_pgtables(void)
-{
-    return false;
-}
-
-unsigned long efi_get_time(void)
-{
-    BUG();
-    return 0;
-}
-
-void efi_halt_system(void) { }
-void efi_reset_system(bool warm) { }
-
-int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
-{
-    return -ENOSYS;
-}
-
 int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
     __attribute__((__alias__("efi_get_info")));
 
-int efi_runtime_call(struct xenpf_efi_runtime_call *op)
-{
-    return -ENOSYS;
-}
-
 int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
     __attribute__((__alias__("efi_runtime_call")));
diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
index 4298ceaee7..ec2c34f198 100644
--- a/xen/common/efi/efi-common.mk
+++ b/xen/common/efi/efi-common.mk
@@ -9,7 +9,8 @@ CFLAGS-y += -iquote $(srcdir)
 # e.g.: It transforms "dir/foo/bar" into successively
 #       "dir foo bar", ".. .. ..", "../../.."
 $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
-	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
+	$(Q)test -f $@ || \
+	    ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
 
 clean-files += $(patsubst %.o, %.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
 
diff --git a/xen/common/efi/stub.c b/xen/common/efi/stub.c
new file mode 100644
index 0000000000..15694632c2
--- /dev/null
+++ b/xen/common/efi/stub.c
@@ -0,0 +1,32 @@
+#include <xen/efi.h>
+#include <xen/errno.h>
+#include <xen/lib.h>
+
+bool efi_enabled(unsigned int feature)
+{
+    return false;
+}
+
+bool efi_rs_using_pgtables(void)
+{
+    return false;
+}
+
+unsigned long efi_get_time(void)
+{
+    BUG();
+    return 0;
+}
+
+void efi_halt_system(void) { }
+void efi_reset_system(bool warm) { }
+
+int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
+{
+    return -ENOSYS;
+}
+
+int efi_runtime_call(struct xenpf_efi_runtime_call *op)
+{
+    return -ENOSYS;
+}
-- 
2.25.1


