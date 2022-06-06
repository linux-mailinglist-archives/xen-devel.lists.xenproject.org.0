Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3037053E03D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 06:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342285.567386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny43q-0008OG-IS; Mon, 06 Jun 2022 04:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342285.567386; Mon, 06 Jun 2022 04:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny43q-0008Kt-FO; Mon, 06 Jun 2022 04:09:50 +0000
Received: by outflank-mailman (input) for mailman id 342285;
 Mon, 06 Jun 2022 04:09:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aNt7=WN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ny43o-0007op-J4
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 04:09:48 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe05::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8090972d-e54e-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 06:09:47 +0200 (CEST)
Received: from AM5PR0701CA0055.eurprd07.prod.outlook.com (2603:10a6:203:2::17)
 by AM7PR08MB5431.eurprd08.prod.outlook.com (2603:10a6:20b:10c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 04:09:44 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::5d) by AM5PR0701CA0055.outlook.office365.com
 (2603:10a6:203:2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.9 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:43 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Mon, 06 Jun 2022 04:09:43 +0000
Received: from 164833bb9af9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 75AA96CA-C5D1-4716-85C6-A99FC37081BC.1; 
 Mon, 06 Jun 2022 04:09:36 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 164833bb9af9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Jun 2022 04:09:36 +0000
Received: from AM5PR0701CA0019.eurprd07.prod.outlook.com
 (2603:10a6:203:51::29) by DU0PR08MB7761.eurprd08.prod.outlook.com
 (2603:10a6:10:3bb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.18; Mon, 6 Jun
 2022 04:09:35 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::52) by AM5PR0701CA0019.outlook.office365.com
 (2603:10a6:203:51::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.9 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:35 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:34 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Mon, 6 Jun
 2022 04:09:36 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Mon, 6
 Jun 2022 04:09:33 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:32 +0000
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
X-Inumbo-ID: 8090972d-e54e-11ec-b605-df0040e90b76
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Rw4YCyc3kplTi0dy0J9sE2MdXGplsaHNaDGQ1DRVaBzbHFTA27zvi6lZvxugqn2WEaR88o2VOd9U2SiCOC2V/PX89LtiNWXGyX+VgcEcLUV2QvyQwWYUbays+kJP3EitWkuqwl+iD/Rd/2hkd4sO/zrFg1LUerfRhQUNLYZgIvy5G2JYZnLh0K33pnsYZ5emmB+MZD3b1v42jmED3G0HwCBrLRJkPpOPUoROndrzUTnLNnGgHtILR6Jwgk3l4Ga+JFSL049yFJ99bU4pHKMT0gxAMB7GjR1Ip7S0I4bcjkwgliHc9XZAnGt5fjWfic3GL4y9erJHPGPa9ATnNU+ePQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV9BPdeAndxQ7scfKxz8oRzzRCdsj7R5+H/m4APAu1s=;
 b=BSk0r40Ul5Di9UWLMU0mPTASjblIR4xtTM7WXFGafB6NCYka3ZhaSDT+2B3O4liXCADhddupwtOjG2Vl7YpGzRKsvlo0+tk3PGWNiwqpraLe/2JpKr+u9A4NVNPOSajkrv9e6xHrduDuH2AVm9EFpoqAyXCnVHyME1w+LnnCcimgl3vA2KM2bYgwFyyHhr1bDbUB9GQdP2ICJBHUFwWtVf7AZBy44HiZaoEmpMBr1eZWQONCkrxfEzshSfSVvf6R+qcWbFOwuGdfO/lQv1XKE2gOUpgkZDXfup2AULaj9sj/8YoW1IOLntCdPb2kKGB71Z8vzmGr4ocNXalg91v5QA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV9BPdeAndxQ7scfKxz8oRzzRCdsj7R5+H/m4APAu1s=;
 b=LUgz2Xj5TEJfM2/hdPvibXP6XPMKn376Wz6Aa/VgnUm5dQh5vfRnt++CBMZEkLng4M0BHQuxYxSMSSDOO9/+brnK81rCW0rXte0miG49JOtFyC6gTrfwtY8BHgc1iSRnfd27vch+zov+UK8sWQdnxDYLZYPnRKb1uTe/7RYvjkk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ab51ead58236c1aa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7zrYHEOZWdptqK6uM8V7TGdX5QvWrCeeMU1XVr2edHrFzDm9VG+t2z3Bt2A2UIDYElk/Ptk1cdHtpUNDQRs3x1ejOCOzndQ/K8lgKATwq/FtD831HEcOAawCaRzBlhZgW+WaVJ0zejgYGr9GaPDFoBRQ47ceF/Ui+g0ROZ95QQcOKecX1lpFGdLb86F7Hw1efWChynFhxFNohR5MPP/b11w1uLjiQk/gUg78Vih/ZnfVu8HkUmdVepBrbY4nQ9L0l/oQcQSBxf4fwo2ejGin1X+RL+M3f+nx46Ft5vIRyuricfRlOaPCdtHIWC9ADSI16XENRuU8raG9UfXhf6LGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV9BPdeAndxQ7scfKxz8oRzzRCdsj7R5+H/m4APAu1s=;
 b=mKcKsXHA+4sRVb8MJqxmMVdNNk8LqADOh3womIJ63rNs+oAEQFTncDAe+Ka/x1IBDLHvftanIJsyL3ysUFJb+noTzNoypRHlkIrhhrSH9OhPcSL+Jd89ZnZ7xkanwr5Hi1LoLe6ZT0XCNHOqzUCVqeoVjGaMLhxhPvrJVLqQaBFxtySoFR4z0X2nUJmemLIowMzxpRkKN7dmjXKo0ga/Dow5gtXW5F4RJN72XOW2YcOCHKzV0izQJaWq/ljpMYFBpER2gbIbIw0mpYkBDv5jRETTJ1WEXwPH6Ch2QhO657PY0lzITmZrZBPPialskBujGMVtRQHu15QmKe31wt2YRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV9BPdeAndxQ7scfKxz8oRzzRCdsj7R5+H/m4APAu1s=;
 b=LUgz2Xj5TEJfM2/hdPvibXP6XPMKn376Wz6Aa/VgnUm5dQh5vfRnt++CBMZEkLng4M0BHQuxYxSMSSDOO9/+brnK81rCW0rXte0miG49JOtFyC6gTrfwtY8BHgc1iSRnfd27vch+zov+UK8sWQdnxDYLZYPnRKb1uTe/7RYvjkk=
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
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v5 3/8] xen: introduce an arch helper for default dma zone status
Date: Mon, 6 Jun 2022 12:09:11 +0800
Message-ID: <20220606040916.122184-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606040916.122184-1-wei.chen@arm.com>
References: <20220606040916.122184-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 4a4a9bcd-d268-49d8-fcae-08da477262e7
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB7761:EE_|AM5EUR03FT003:EE_|AM7PR08MB5431:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB54314B12A3DD8F5A872B997A9EA29@AM7PR08MB5431.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0voF7hWhQyKGPp/Aia+w9JJERbQIWLdPYZXsOOcek9d55j5lEIJZP220vtJP+N6qwz6AVqY1OfrYM3XG4SIuWsXODfMM/MD/n0S2VFnjhf7D9hRG8LXlMZv3KS7q2fg6RzLm5Y+X5OFW84kjIVg2clEIolN5JLxJsZGJT1ZHW2T5w+hOOKJ4Go6IlUANMpFKc/N8wVarYqlbzlgxcGTmN5r6ZN+BpdUm7FPTU3OLCnDPHy+wqaPzwsaUs63CUOUxUDrD1+Xqg3Fm9JKiRMq63qfPgIHVBja3YQdaOwIN6FnxTSYNE9dAXuUG6OA/0ORNcAOqSDkoxD36iwXxkMEjzUA0RGaZfKS9jy7QNEl8eoxviU+h5tOkbl84vXeyTDEgLph5golsIi5MUp1Fjka1lHhoSbxHRBek2+zU2QZVh3syHHveiSDv/PgvNbiwZg8ZfSOcFWEvYSPCdxX+ytlgm5/2dZtJzkkKyoVHH8N3ZGqC+vy0FcGceC5FTjrVRbyrSXMg67jrD3rq1rK1BAdaM/TjAu3UK23BqRACU7ZuuDv8zPQGxKFGvr7rz6tZYEcJLv2+fHiw9NoZlmYAtftk2tX2zrFGFmO2aE0I83WgPp5bYiAQxxvwF+xzhqN9plAxSM1bIJPaP3u6DcxWCM+K4x1VGXxv7hO50qaOmZSfm2DFFyu/ceh4XcjzYwQ8//98Xj33eIsbkmyTxitp4AHAtQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(186003)(1076003)(426003)(47076005)(336012)(36860700001)(82310400005)(2616005)(86362001)(316002)(54906003)(36756003)(6916009)(70586007)(70206006)(4326008)(8676002)(44832011)(5660300002)(508600001)(8936002)(26005)(81166007)(7696005)(40460700003)(2906002)(6666004)(83380400001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7761
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	06bf1fe2-53e7-43fe-53cd-08da47725d84
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UbCWdCCvzKmReqAe8wtB1ZY2ofrH4zL7wlgZRiIZGabmCcENtXDUReq4WFo1TYa8RP4d/yiSFVpqWpn1elXQwv79/8csuvT7k5ins3MckuXBfpPfaeFRS6Z9B12LpNEMr8caKPG2w3DcwX22VSz4f/5pxAbmv2cGXBmnV/qY6s/dvnL1E+PfaB0E/iJF+xSfbKDB37rLC1l5N/FzWnJ2kH5kGWTJKQ0VzZ+Vrqz9V6wbpwDxK9t0V4QTd+jVg8DEzSDWauGjDYR8e/KdGMHyGEcsoLtwUTuPO0N130STRPA0Up0oRO038bgOrOprhVR+93JvLBimtWBsKFemODNGiR2G34q0dYY79ETU8fw8vbMwCG2jvKIvQlQ+A+uyBDJXC3k43uYZEn/CfwEkDzDQXJE1lkTgAkGwL6DFvU1orzQOIepakxdIAWk2YM4JNluPU6gZiEbUSKJdWKetXfmDusUkxgftzklmXdiV7VxD37BMsIDbxuBaampkp+SV1Z+9Lxf6X/aKINnq/E2FVeLgPCXpe10Xl54jbkKPXcvBGgeoxzSV0gwu4MsRYfndk1ZzFRT6nfynqIatGXLJ4eybEuhLc7tOUDSDxSDeuB8dfHhYBGLhXNVeOurnu4LVIC0qwcxrfzUhT/kHbXX+zzHs9w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(426003)(336012)(82310400005)(70206006)(70586007)(8936002)(47076005)(5660300002)(186003)(508600001)(4326008)(2616005)(8676002)(1076003)(7696005)(54906003)(81166007)(26005)(6666004)(2906002)(6916009)(36756003)(316002)(83380400001)(36860700001)(86362001)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 04:09:43.6936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4a9bcd-d268-49d8-fcae-08da477262e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5431

In current code, when Xen is running in a multiple nodes
NUMA system, it will set dma_bitsize in end_boot_allocator
to reserve some low address memory as DMA zone.

There are some x86 implications in the implementation.
Because on x86, memory starts from 0. On a multiple-nodes
NUMA system, if a single node contains the majority or all
of the DMA memory, x86 prefers to give out memory from
non-local allocations rather than exhausting the DMA memory
ranges. Hence x86 uses dma_bitsize to set aside some largely
arbitrary amount of memory for DMA zone. The allocations
from DMA zone would happen only after exhausting all other
nodes' memory.

But the implications are not shared across all architectures.
For example, Arm cannot guarantee the availability of memory
below a certain boundary for DMA limited-capability devices
either. But currently, Arm doesn't need a reserved DMA zone
in Xen. Because there is no DMA device in Xen. And for guests,
Xen Arm only allows Dom0 to have DMA operations without IOMMU.
Xen will try to allocate memory under 4GB or memory range that
is limited by dma_bitsize for Dom0 in boot time. For DomU, even
Xen can passthrough devices to DomU without IOMMU, but Xen Arm
doesn't guarantee their DMA operations. So, Xen Arm doesn't
need a reserved DMA zone to provide DMA memory for guests.

In this patch, we introduce an arch_want_default_dmazone helper
for different architectures to determine whether they need to
set dma_bitsize for DMA zone reservation or not.

At the same time, when x86 Xen is built with CONFIG_PV=n could
probably leverage this new helper to actually not trigger DMA
zone reservation.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
1. Add Acked-by.
v2 -> v3:
1. Add Tb.
2. Rename arch_have_default_dmazone to arch_want_default_dmazone.
v1 -> v2:
1. Extend the description of Arm's workaround for reserve DMA
   allocations to avoid the same discussion every time.
2. Use a macro to define arch_have_default_dmazone, because
   it's little hard to make x86 version to static inline.
   Use a macro will also avoid add __init for this function.
3. Change arch_have_default_dmazone return value from
   unsigned int to bool.
4. Un-addressed comment: make arch_have_default_dmazone
   of x86 to be static inline. Because, if we move
   arch_have_default_dmazone to x86/asm/numa.h, it depends
   on nodemask.h to provide num_online_nodes. But nodemask.h
   needs numa.h to provide MAX_NUMANODES. This will cause a
   loop dependency. And this function can only be used in
   end_boot_allocator, in Xen initialization. So I think,
   compared to the changes introduced by inline, it doesn't
   mean much.
---
 xen/arch/arm/include/asm/numa.h | 1 +
 xen/arch/x86/include/asm/numa.h | 1 +
 xen/common/page_alloc.c         | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 31a6de4e23..e4c4d89192 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -24,6 +24,7 @@ extern mfn_t first_valid_mfn;
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
+#define arch_want_default_dmazone() (false)
 
 #endif /* __ARCH_ARM_NUMA_H */
 /*
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index bada2c0bb9..5d8385f2e1 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -74,6 +74,7 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 #define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
 				 NODE_DATA(nid)->node_spanned_pages)
+#define arch_want_default_dmazone() (num_online_nodes() > 1)
 
 extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 319029140f..b3bddc719b 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1889,7 +1889,7 @@ void __init end_boot_allocator(void)
     }
     nr_bootmem_regions = 0;
 
-    if ( !dma_bitsize && (num_online_nodes() > 1) )
+    if ( !dma_bitsize && arch_want_default_dmazone() )
         dma_bitsize = arch_get_dma_bitsize();
 
     printk("Domain heap initialised");
-- 
2.25.1


