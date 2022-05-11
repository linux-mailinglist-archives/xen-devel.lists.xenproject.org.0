Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257D152291F
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 03:47:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326066.548911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRa-00054t-Rg; Wed, 11 May 2022 01:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326066.548911; Wed, 11 May 2022 01:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRa-00052E-La; Wed, 11 May 2022 01:47:14 +0000
Received: by outflank-mailman (input) for mailman id 326066;
 Wed, 11 May 2022 01:47:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMk+=VT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nobRY-0004GU-Dk
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 01:47:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4558f126-d0cc-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 03:47:10 +0200 (CEST)
Received: from AS9PR06CA0480.eurprd06.prod.outlook.com (2603:10a6:20b:49a::30)
 by PR3PR08MB5866.eurprd08.prod.outlook.com (2603:10a6:102:85::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Wed, 11 May
 2022 01:47:06 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49a:cafe::44) by AS9PR06CA0480.outlook.office365.com
 (2603:10a6:20b:49a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 01:47:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 11 May 2022 01:47:06 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Wed, 11 May 2022 01:47:06 +0000
Received: from 8986669a2072.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 23BF4FED-3FF9-40EB-8E54-CC7DBF7E8E6D.1; 
 Wed, 11 May 2022 01:46:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8986669a2072.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 01:46:59 +0000
Received: from DU2PR04CA0318.eurprd04.prod.outlook.com (2603:10a6:10:2b5::23)
 by DBBPR08MB6203.eurprd08.prod.outlook.com (2603:10a6:10:201::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Wed, 11 May
 2022 01:46:57 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::9a) by DU2PR04CA0318.outlook.office365.com
 (2603:10a6:10:2b5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Wed, 11 May 2022 01:46:57 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:46:57 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 11 May
 2022 01:46:59 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 11 May 2022 01:46:56 +0000
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
X-Inumbo-ID: 4558f126-d0cc-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MZbuMh0vyvP5CkXOm5Ih3G7ad1NGvgZ1mh5MQ2l4AyQNuSHgf9R+gQRjFNf3bO3krux5HOw/sL3+6Ge9upS9D6aLIxLLXCh0TA2NgbquGfnpmD7d7S0Sv2OEejwdKzBOLH0FqTwKuQZRMGhHesHrEEkksm5DQluIB3R8F+IeCRa0jF4ADBgBXMQ2nv2ZQnORePF9YXBCKAGntez54A/qPcK5G0iIkMXTIr2Hgt+FUyQp6La+SwLNAEdvXz2CtSIi17hhBPxbACUdWoMkUmwL7w/nh1XrFu7EQbpeE104dUtNjH7H6bvWzgeDilNQAvdbpG5ygCcQQVVq/tYAujcUhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQIxNpG9XWjS8jCouYiFG25ZvC/mZVVFrI47a1AK6HQ=;
 b=HASPY2BDwff5AOzjDPlUd/HfORdbhNdWb2Nd5sbZEEAdK+L6OHsuT1AuNb0YH3ywbA1KF3+E1ayYdpM6ML3dHVOtvlMXLiW+cZ2XeK1bd/VT/b9jC2IdCwNRdpsmQFfrReyaDJjKxISZTsiXoOinDMods0G15bvTwGR3g464WR6mkXqALIxe4+G6nN/tNwXRGr6DeNs8E43tUqiTz7GZfmiTtIL6tnWsSSmNFanG9Iny6TDmBKGQPDpPQMjjUM1YsF8/4EpDGP18cZZ/r8oANCf/Iehp4QndqHO1zJPZI8wl6B6/dBt5yfAaqKd3OUQbYIy+6LGotailyNnPT80cPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQIxNpG9XWjS8jCouYiFG25ZvC/mZVVFrI47a1AK6HQ=;
 b=WRdGgamaNKVDYkE/jSutLIMrm2hRPTAGJsvW5mnm5fCwSi+VEanVmllHlV0qDx3d0wrFauDGSbKGndp7+MyOzeX8yTtlZAUvDUXvKeuhFAWLki+cV3pOHhkjFT2YD6ZxDZEvL9Eg30Q0K4Jx4Adh8uwodgqljxpn6aoHVwSAGtA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 67f312fc754eb527
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIwsCpiec2gf+aCo2fsD52e/Lg/+XIALZPTbHfSa4y199ZlBUn2HEVkMfFToi5JiGh9vbKLohQQNh0BhMHzPiaJeDd+zqpsXm7ZpokxhDlBZ2NGioFSv2H+wu5zW+oGmD8pvBOAVkWnHyMPioROUoY3qmmQvHX52xoq1BQ0vEFg885Hpn4Jh6yUNOKvNw0M5xkO2YR4A1twQ8do9ENpI6s5lvziB9muxPi07nJ+f+BVuzkAAUC4S7sGVkR4XlBUQw3WOiEVDseJZAwZFHmWqfQjChz7b1eyO+Ruuu5tuTm2LVBmVN9wf/iB4a8xZyGlZXmQHYtNo3jCSnw/U9XTvHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQIxNpG9XWjS8jCouYiFG25ZvC/mZVVFrI47a1AK6HQ=;
 b=E2E+7mna1QxEsOZjQD8FrAwSXXmWVpzigyPLylHJ9rVQwvRXBfbjq/UfK0x7KkDa+c/4Cj1j9W1BpBDNhLXGOqywn9aXGm97PPUVOuDLkNc6/jVBLiEgEEzcz3KIwXIAM04FzTrsDhSpR7GZyrVu/8tPeS/s8nVWcvg3WvoDv05zf105cPG9MXhh4bDJ373FemgIWr26735Fv+IVR3N1Wg3guLgVNDdqEFwd3U9uMg82IgFO6vT4qhTj0WVI49JZNaYueG2idkLcnf8pH9T7aksdJ9Ih8dvRoxKFLLpaHt48J6H2Gl1mUjWe6o95+d2aJU9dMuZeuXTKck58PcSB5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQIxNpG9XWjS8jCouYiFG25ZvC/mZVVFrI47a1AK6HQ=;
 b=WRdGgamaNKVDYkE/jSutLIMrm2hRPTAGJsvW5mnm5fCwSi+VEanVmllHlV0qDx3d0wrFauDGSbKGndp7+MyOzeX8yTtlZAUvDUXvKeuhFAWLki+cV3pOHhkjFT2YD6ZxDZEvL9Eg30Q0K4Jx4Adh8uwodgqljxpn6aoHVwSAGtA=
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
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v3 2/9] xen: reuse x86 EFI stub functions for Arm
Date: Wed, 11 May 2022 09:46:32 +0800
Message-ID: <20220511014639.197825-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511014639.197825-1-wei.chen@arm.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 5f039a43-4a20-4e15-0904-08da32f027c5
X-MS-TrafficTypeDiagnostic:
	DBBPR08MB6203:EE_|AM5EUR03FT059:EE_|PR3PR08MB5866:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB5866E16551160384CB20C44C9EC89@PR3PR08MB5866.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7So8BBdlnXGEl/8g6QbJfC2E8/k+qckcWxMwj7f4pkgfRFW9LMPgf1gF9divqJM36uhHjFP1kOVG3cyqjqvXTy1i3pT5NNs90im6AmgiMaOLE0ESNakQFVKn3aOHfdLQ3Vs4mDO9i4NVVinfFhJiMCp8YfDoJnAaOwNPDcrBsEG1xmaWrgKNDskUARVx1KZZwXQDHt2CDsP0MMqoLGuyYRtdzZOcYMJm1+9AKG8NFuBioIAg35dUPYdBKU0I0PNBI6V8auOw6nF8XynqzX85MV8S4lKoXAi0Me9PdOCKJTh6Y//gTyNhb3zRUWe4uFUXUTtygdm71EgkaaPCYMlfMjWppzlaW0YIbYmmt/n1h4kTJVl+G2Hi062wElu2UT2Fxh72qgV8zZJg71SopmmrOYtqxBzBiBFelyw8+6l34gkToBkZ5rICiNADPS6uqUi2fsUoOcZKXSAp9ukvKBtOdcqhfzCG/hv+y+BI29t8rclPtcQYm82X/0mJKYCBHYSDnaXcLNHhnFBIIpwV6iXgy7YnYUqBGsfMuBC41kwnle5FI49JWBAvh08nvfhaexd+nT8lnonIBDzvpvHJCAvnlakLSOYFnv7LljTqEIhRqzZnvKyklkS4OFFoTpQ0AbRDkkBwjFSBBWpb7r46RxHG72VTygI+zbXIMa2InwOYWwcJLSsZjkj6hSEvE80xjEp2KWLFAvp6Ps7gE+nFbGmcC1fbohu24NDx7316TggRNMs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(81166007)(316002)(8936002)(6916009)(36860700001)(54906003)(356005)(8676002)(4326008)(70206006)(70586007)(86362001)(6666004)(83380400001)(40460700003)(44832011)(26005)(7696005)(1076003)(2616005)(186003)(426003)(82310400005)(2906002)(47076005)(336012)(5660300002)(36756003)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6203
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2e0cfc15-621b-4862-79eb-08da32f02267
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	spppZHQF2dANpQblLsphI3LwiBl2dtY6EIGuLvSx3s3ZCe3QhgV/y2UT+Wl7JTeYVO65xftgfJZw3zNDV3GYgYa++dxqUrqqha6yH0XUFLzFLebVgn+mDQxJZu8bhYxHMDgWI77R/DPMcw9pd8PK80OVsfQ7Kvt4y37sGKq1/beq4y+1rLg740k4vaM0+0aO1SMogruH68g4djdsXIptt+8ZKZcAwQqX5oBo1Cu8XeyJ3IHxnpxc4QE27MfODAUqkYmNf2LprFYXOOOReBoltG07iM6yNdegS7HYGQISQIX5oNUF7Vmr+8Z22gbLe28GKnVcsmLTE85Y2YApwl13iQKA9lBTD7DD4Lf4Zx2GD0z8+JTsaarg7tp4eJLfxEHfpekAxT08cJ7iTvv5BPdh+gAUgd8sBXHrW/ppIzdmiTUuE0HYLBbWusPrtGO/wp9cIiQtOGi6Un64IaarkIUshkuP4xLfmDfInDYPWf9jnPCpYqTVujKwZInX6LxKm2OrdLnuzXE35N8emFd0JTS5c1mdLQ/UYJXtx6Ev+Aj5M2ZShA6np9VauMTamZd5jzUVvIH2nbnsnL+5oeTPgr4r2B2/4b7AywTREp/S7OqlNXDcmqYKbXL9YkG35KDiRioHYPjCCtgRGf7vLkcyj1CdQjMQ5tw+UEXy5IU+WMv3t/h0aBNKihCTtSrtlo8so6TecUQCo1t2TLI5fTzlXp/0xg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(8676002)(2906002)(83380400001)(426003)(1076003)(336012)(86362001)(186003)(4326008)(47076005)(36860700001)(70586007)(44832011)(70206006)(40460700003)(316002)(5660300002)(82310400005)(508600001)(54906003)(6916009)(81166007)(36756003)(7696005)(8936002)(2616005)(6666004)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 01:47:06.6485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f039a43-4a20-4e15-0904-08da32f027c5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5866

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
---
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
index 4298ceaee7..3a5b9958b3 100644
--- a/xen/common/efi/efi-common.mk
+++ b/xen/common/efi/efi-common.mk
@@ -9,7 +9,8 @@ CFLAGS-y += -iquote $(srcdir)
 # e.g.: It transforms "dir/foo/bar" into successively
 #       "dir foo bar", ".. .. ..", "../../.."
 $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
-	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
+	$(Q)test -f $@ || \
+	ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
 
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


