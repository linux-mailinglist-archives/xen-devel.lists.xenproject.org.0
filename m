Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D64D584D72
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 10:37:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377405.610604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHLU2-0008C6-1I; Fri, 29 Jul 2022 08:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377405.610604; Fri, 29 Jul 2022 08:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHLU1-00088k-UQ; Fri, 29 Jul 2022 08:36:33 +0000
Received: by outflank-mailman (input) for mailman id 377405;
 Fri, 29 Jul 2022 08:36:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V5Ro=YC=arm.com=Hongda.Deng@srs-se1.protection.inumbo.net>)
 id 1oHLU0-00086V-NJ
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 08:36:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ad56f45-0f19-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 10:36:30 +0200 (CEST)
Received: from DB6PR0802CA0043.eurprd08.prod.outlook.com (2603:10a6:4:a3::29)
 by DBBPR08MB5548.eurprd08.prod.outlook.com (2603:10a6:10:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 29 Jul
 2022 08:36:22 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::72) by DB6PR0802CA0043.outlook.office365.com
 (2603:10a6:4:a3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Fri, 29 Jul 2022 08:36:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Fri, 29 Jul 2022 08:36:21 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Fri, 29 Jul 2022 08:36:21 +0000
Received: from 9c11fb9761f8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A68878B2-4222-4573-9C75-C973FD5E854F.1; 
 Fri, 29 Jul 2022 08:36:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c11fb9761f8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Jul 2022 08:36:15 +0000
Received: from AS9PR06CA0394.eurprd06.prod.outlook.com (2603:10a6:20b:461::27)
 by VI1PR0801MB2080.eurprd08.prod.outlook.com (2603:10a6:800:88::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Fri, 29 Jul
 2022 08:36:13 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::79) by AS9PR06CA0394.outlook.office365.com
 (2603:10a6:20b:461::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Fri, 29 Jul 2022 08:36:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.12 via Frontend Transport; Fri, 29 Jul 2022 08:36:12 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 08:36:10 +0000
Received: from a015977.shanghai.arm.com (10.169.188.38) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 29 Jul 2022 08:36:08 +0000
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
X-Inumbo-ID: 8ad56f45-0f19-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=a4TAxabySP5nMZfx2td/ADE+pl6gTAFQUDfzJhNxiad2bit6Ti9nrHdTUcnBRTPkZbyqSwQynpYjJmQjkMO48nhfegCIOhVtoRzsBCjrUBvHKlP5O/IKelu0WYBbFs+VrPWxtSEFdGNActskvtiIFib1Kx4soOxTQf5YS37AOxACyhYHRF6z6B3Z5gLCEd7EnBP4NQpMclYk8sQU4i+O6/597JYMLwKz6Ec+jFHK+Oom0ab+F+D4KjHwJCqeFlvT8gsKrS5IdAKKGr3ryF0SmopbVfBj8Gfi42XipSc0lcUznKI8uYbSAd7ytrjr86k+YX8hi6aWf+HGIeo02f4VQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Luj6WGcvC7Id5jsfCrQ8DFeZ6tuRojWkwmRg1mcIZIE=;
 b=gVm478eOuqIubw5u9XoJt9R535+W8cvh95T8e8kzaEe6BSe+oVayDfkMiiaA16RmhNxHEjr8pWLPvGClXrL2irZCXhZqSlY/K4I13J1db99BFKQyfMSaARc6RH96aQrkw4W23NEoZTKPbRt8jPVIXKYan2tY453A9Kqkdql651w1MIgIj2EP7RjiRHGJaivq/kQaR8z91e0z7LqMiBV7TFQlaEClKUnOcRbwg74UGqRhCxtx/gKCW9rzAm2MFsWrH2bBR46di3SroZdAiXtkkYyaIi0o3rkx2mXcHx8jT4OJI3h8tH3nxXJv/3YJFU+TtE8QWbWeyPw4fXQR3TgTtQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Luj6WGcvC7Id5jsfCrQ8DFeZ6tuRojWkwmRg1mcIZIE=;
 b=56VrWsilsnXk98XQO0cnYZNbjc2NJgPyT48HTVhBgcnrUdDSsLM6Itg8Ek2/2qQiFwPf9tOsNaNs2clhQrhW4LHTxc0Ag4VrJfz6qr2ULULwFWR9YXJ7MSPla+9c3Ikht2+RwI3ALdNTauVBZDWKyzxMtWRY8oBxTevd5vo5z/4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 584d6a2357ed8be4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJKZHrqZH0kNDbOzcu0AjjfVySQRXm4BZmhUrH8ezo9YOWAp7mtLYSw7D856WYyGqXWVN12wGWDTfNl3aMir6XJqh/aWe7TlC3uGqt8dFGcluxqCa17J0MJpgDjh3bPEG1l4cqQYRZeDEmTmYwg3kF7PcHctD4HU0793GOsoUa8mHrv/aZrwwuph+J0UNR7xWzTQqIw40h7JGSLqE0KVPQHedHMNtyaW8UMZBkTQ46CMJr5DIz+H9nsqEv10C3kFD1AM3KFrS/qTNkTZCgcxW+wGAj8ipj2FyJ5xS8KnYXVGCFxTEhTyawOQebrXlAcPUxzlmnqdOSKDgwsDPW58eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Luj6WGcvC7Id5jsfCrQ8DFeZ6tuRojWkwmRg1mcIZIE=;
 b=Vq0Kb099bLjI0qid4pG832axX2GJjEQcP0dD7EqJR0C4j2xKv7GL/wvwCnJ0LQrsh+g4QZmhkTd4K/t/U2wew4zkIzvMMhYiR8Gt+L8zxpsWgyRjhjLNQI6ppJHks0T2bMqyPAPP1PI7csTbw5agcbYfefqFhr1Olc1gzho3ki4g0d+/GM4S69SP+Of9kG171+bufVKySRVsdgkKoE43mPL+epfh/O7UNIef9DE///Cxfuga65GA7qTkjJ47R1M2TNg4HMLO3Lk4Ckhmc/4WRicMFDnf6Ckki75uxb69EiLWP3HUbAscTkRMUdgB2SJE/ghk8NsUHL4BaJ/jr5gCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Luj6WGcvC7Id5jsfCrQ8DFeZ6tuRojWkwmRg1mcIZIE=;
 b=56VrWsilsnXk98XQO0cnYZNbjc2NJgPyT48HTVhBgcnrUdDSsLM6Itg8Ek2/2qQiFwPf9tOsNaNs2clhQrhW4LHTxc0Ag4VrJfz6qr2ULULwFWR9YXJ7MSPla+9c3Ikht2+RwI3ALdNTauVBZDWKyzxMtWRY8oBxTevd5vo5z/4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Hongda Deng <Hongda.Deng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <Wei.Chen@arm.com>, Hongda Deng <Hongda.Deng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] arm/vgic-v3: fix virq offset in the rank when storing irouter
Date: Fri, 29 Jul 2022 16:36:02 +0800
Message-ID: <20220729083602.390484-1-Hongda.Deng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 9b5e48d8-fd38-4a95-28ef-08da713d6a60
X-MS-TrafficTypeDiagnostic:
	VI1PR0801MB2080:EE_|DBAEUR03FT021:EE_|DBBPR08MB5548:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lHlnax8MG1szlCenP9KqQ/ynYzIe80ax6ox5PJ+LajlUxX2gu5IpKKD294hpmTqcaRyEEiTu9Fzp2qQlQ1NPj8Us5WKUsEgc1AG07krvci8JrjwORxk0KB1YYwJ80T31KvyMjMIJc+g6nUNr2M8moVnGJONnZXjwiBpLjKlLgfK7xOdmr9uTZUt7+DNm627VtVXJOeWIx5rr+BFJGxORzz3jHAq0VvEFs5JOxkWMuLtq9+PXg6xSYoJ9LV9/Mv9fnxn1I2F/nqiaynFy0Mzt/tzQnw5U0fhhl3xGg1mY4FKDkQhUBySOGBQV93GIKJnVSk4GGWqWvflBPoZP7M8q8ymzvgZe89/rrgVR74blElad2XDAddfyfaCf5l5zEjK3ungIPK/6yst7UXuswAmQHRk89/kTmXTYGhoXN9yvr9jDiBW4vyc6W/lcp+MkGgblPkqOC2KnPWyJldly7POW1fdlGyQi93rkp71iqlWHt8V4hgDrDDBOZpsY6dSQDePJJ/KndVYQDnLnAKsw7iDuDVbAt7r33WEhQ4kf1hOfYlbuZGWHgq4CHOAOD5vs4kleT0mFY91ciOvOl2vX+hUmEjmlW0FmZB6jCerMPk2sKCrv/CavIEC+W42xHsTa9icU8RX3CVpELdqP2xRgpYR2n/Ltn3hewHOnCTOijHINsmzpMQV3/ODsB0SbYDe2O9vbCT2DDnjKT0p4UV1t/yTlBLG2pIp++0cdX7ZpgD9F+1l4hMDjqpe6TWx9ZY3uiK/R8HHFhu8g7yBaPwRFvvKapN5SbiP5dEKCDB7wcf0C3oF9HdkkuQT9Bt/PA4gb9mBZa42iKBQrmD96MYvhKWgO/A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(36840700001)(40470700004)(46966006)(2616005)(1076003)(426003)(81166007)(336012)(186003)(83380400001)(82740400003)(47076005)(356005)(36860700001)(70206006)(70586007)(4326008)(8676002)(316002)(2906002)(5660300002)(8936002)(478600001)(6666004)(41300700001)(26005)(54906003)(6916009)(40460700003)(7696005)(82310400005)(40480700001)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2080
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	118679f6-0326-4388-07f5-08da713d6527
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mZXEXkk6gVDnLjo84soQ+ZHFgyXGlWlOJy4rq0e70UhUMmrL8oRQ+4H5OQeCoQAuUjLJRzTyPx9IOeYG5CWYMUW++UxOGTMO1f6jnqqyz8fQLZrlcTmR4BokZyW4xutHbly7Wn6X1zmzVbNiJzxvQvqimmtXjN9kwrRR0AohZruaiiYOOUHRnsN/i3w3U56AlMc1HG968Ec9TpKeAk+bW/mAUImt+fKtzIu1MXWSJBMYTJJlJBlG5sHTxBMILmnWPTmNhWMDaOIPKizC4WsuQdLDkgVB2avVfPNmipwSqcz93TPDqtNiyWg3IfogZY5C3NtiG5arZ3o8M/aJ5Z70uKhUL16uOQX3xBCi/N7N4bjQo6o2pubQwnU+PCtlf9WUiKtPabyHZLrt1aXatvW4UW2x1dU0MN2NtCL9VvKPlxqXTikoyKmrzec02VzR9DwApX9E7Ynu/6ZsFOaHWlJ3ICjK4zkEGRtqyfExwsMNi/RJpLYfDme7sUVSiUke9NLAoPBkhTfFK4xy/O7hxvg4pHCNAtFxZggaiCwTSxt9lXWm8xiSX83gGyBbWAL7F4zWM8y8FJRMT8JxibeDmFnuuRWMIZFrRPfaGX79beOuaAtdTPlyGMyX0zzX1RW5qGYgbTTpseMkDXMNTmcwn1rFjvf5qv7rbYuUH4S+77Knvw5eWfaDUhA49+p8Bo80Q1aebugFOz/Y4bjjO8XJU7VoqxKcXqTba3nR3ccToYFDV1uq9GvEKCt9Yjx4ve7Dlgjnbmz1hvRfFHgsllAA98jcEQFjqksQ2AW7sh8akZBw6WtpJRLL9EG44zf/GCqVp8vM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(40470700004)(36840700001)(46966006)(47076005)(70206006)(4326008)(426003)(83380400001)(5660300002)(82310400005)(26005)(1076003)(186003)(40480700001)(6666004)(36756003)(8936002)(70586007)(2906002)(54906003)(82740400003)(41300700001)(7696005)(107886003)(6916009)(478600001)(8676002)(2616005)(36860700001)(336012)(81166007)(316002)(40460700003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 08:36:21.7820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5e48d8-fd38-4a95-28ef-08da713d6a60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5548

When vGIC performs irouter registers emulation, to get the target vCPU
via virq conveniently, Xen doesn't store the irouter value directly,
instead it will use the value (affinities) in irouter to calculate the
target vCPU, and then save the target vCPU in irq rank->vcpu[offset].

When vGIC tries to get the target vCPU, it first calculates the target
vCPU index via
  int target = read_atomic(&rank->vcpu[virq & INTERRUPT_RANK_MASK]);
and then it gets the target vCPU via
  v->domain->vcpu[target];

When vGIC tries to store irouter for one virq, the target vCPU index
in the rank is computed as
  offset &= virq & INTERRUPT_RANK_MASK;
finally it gets the target vCPU via
  d->vcpu[read_atomic(&rank->vcpu[offset])];

There is a difference between them while getting the target vCPU index
in the rank. Actually (virq & INTERRUPT_RANK_MASK) would already get
the target vCPU index in the rank, it's wrong to add '&' before '=' when
calculate the offset.

For example, the target vCPU index in the rank should be 6 for virq 38,
but vGIC will get offset=0 when vGIC stores the irouter for this virq,
and finally vGIC will access the wrong target vCPU index in the rank
when updating the irouter.

Fixes: 5d495f4349b5 ("xen/arm: vgic: Optimize the way to store the target vCPU in the rank")
Signed-off-by: Hongda Deng <Hongda.Deng@arm.com>
---
 xen/arch/arm/vgic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index e4ba9a6476..7fb99a9ff2 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -135,7 +135,7 @@ static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *rank,
     ASSERT(virq >= 32);
 
     /* Get the index in the rank */
-    offset &= virq & INTERRUPT_RANK_MASK;
+    offset = virq & INTERRUPT_RANK_MASK;
 
     new_vcpu = vgic_v3_irouter_to_vcpu(d, irouter);
     old_vcpu = d->vcpu[read_atomic(&rank->vcpu[offset])];
-- 
2.25.1


