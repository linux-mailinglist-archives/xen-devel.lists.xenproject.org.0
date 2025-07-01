Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7D3AEFD5B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 16:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029801.1403548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWcQa-0001qp-3F; Tue, 01 Jul 2025 14:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029801.1403548; Tue, 01 Jul 2025 14:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWcQZ-0001nn-Vw; Tue, 01 Jul 2025 14:57:43 +0000
Received: by outflank-mailman (input) for mailman id 1029801;
 Tue, 01 Jul 2025 14:57:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIF5=ZO=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1uWcQY-0001nh-0C
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 14:57:42 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9b58554-568b-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 16:57:36 +0200 (CEST)
Received: from DU7P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::20)
 by DB4PR08MB8128.eurprd08.prod.outlook.com (2603:10a6:10:381::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.28; Tue, 1 Jul
 2025 14:57:33 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::ff) by DU7P190CA0024.outlook.office365.com
 (2603:10a6:10:550::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 14:57:32 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 14:57:32 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by DBBPR08MB10508.eurprd08.prod.outlook.com (2603:10a6:10:53c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 14:57:00 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 14:57:00 +0000
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
X-Inumbo-ID: b9b58554-568b-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nB44as3b5s4DHQW3Yql0qJM4saEsCIyrtTbr6pdE9rFsFQKlXjbofFSJ5P2xXDNSXP1cWt7v1gsbAwHmuhl6ciSFVyzISQl9gP2oLv+u9KxpBe5r0gmyFCt8khwMeMCXLkkeJbmvT+ahaao1t6aVLKlsOBWIMUadBB+F23PH1vzEU1PsmETQUPqUp0Fompk1XRylAERJ35lJ4MKmUn62yc0xzQtTJkxfmOLCSJMDFutzwMM+glYpW9hLaWwzD9BajHHb+5p8n8JTxQSAYm5xsqc/NevFHfH0dL4u+tS0Lfz1asXnBv1NoSxPfqJ3LnWhMFmGO+b2NzgFOIz/t3JQzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz+QEb/G87ujIIx2xds1kFR41edd5uI5Eoqgm5rvbds=;
 b=aZX4+KNGEKIjDscDOvN0ZFLx5Pb/BnMkGgqVpriZpTkd5e7lx96yFzZJXxG8G1eH1R0HZ3v7CG8HDGl8TMPkYPRvoh/QZYhJRa6tnVHaOgEEITufJ7PMpgw8iSPOOUQGRWcGYPYxiXmMcg0zEfkTgMYXZQXsvfCwm+TkfH85OaEclm2NaTeLU++TvR47HWpaVTBf93+9oDA4sUpC52Qxm0Fiil18nreItO5RVfmIBtDmpY1PRBqwC+OdBDxfa3m+XqVXFF8FtuKeaOv5OXpxaeftZx5StnB3Bs0uLBsfdu3GL3JHulGzJnHu9opmjYq5nMHVD8Vx10TAQgIolMOAow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jz+QEb/G87ujIIx2xds1kFR41edd5uI5Eoqgm5rvbds=;
 b=P7EJ4rMJ+c/Y5STbE3BtQRusHghNGRIwmDCFTetEfJ0N6yf6z1AS+K7gfh5veYbKcAuk4xIpNVbRt7VwJ5xTppkCYZruziW4FUeoQTtsJtfSeN27xA1y206JxYkl/xUt26VYM3MpzY3hvl0nU6SuHoUM2bRj9F77oUQWC/ba2l0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3xIizWcnup2ibW1Uno4XrmTlpWZE9k+pmUuSMgIGzcUkw100RuW9Xg2DtX0bGW3dYLdsyXab9XvAF9w0gLTqDUq1pfuUMHCI2STu6cmvcj8LZOYfEdQVAWjRW5ODb2+Wbeas4JkJp7PvG1L4SlWc3Z3rwyjgxm7/mYI/3RJeCIuio4Cy6ig4kGZI/7LpGvKTeBGZyO1M3WrnyFddUdB3yfy4w5lrlL9TqmQwJTbH5RG+CvJdKfaTk3+w5t0/xzJV9H5xW5qA5QfKiO6ii0kNMQZXZDcLASezPhRORKAMG9Fyn5AEwMFEbxX4ciGQOpA3feBGHuqKdU4cATAMOJsbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz+QEb/G87ujIIx2xds1kFR41edd5uI5Eoqgm5rvbds=;
 b=USQLq/zdQo3iAHoD1ybrZnDpMORRdqxUcgKHwLZHHC0UNNiPLdFC6FlTMJ9EPQzBgbbcDHg6TpmWVLasLqZFvO1Yo8R1lXGwASXDejkMaIuJeF04Bsy2sjxlYYZophNPx1BQNJA/SpfCUNMZpmCdAQg1ajbTzf6c71tce64wlbZf1HKun6sdtxLIF+peallhZJ0BqZLs48Q1BocNVtVDvyuRxyfXTEC1qlzWcG/A+gW9LIpomvzxhnQBINi8vuaExjISphmapeDe/1TumkL6dsC+IK4DD3l8AiY+m17AKVTJ0iLv6DbMioDmLx2FEaJe7jZXmpdkC5ZGGGUq3BftSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jz+QEb/G87ujIIx2xds1kFR41edd5uI5Eoqgm5rvbds=;
 b=P7EJ4rMJ+c/Y5STbE3BtQRusHghNGRIwmDCFTetEfJ0N6yf6z1AS+K7gfh5veYbKcAuk4xIpNVbRt7VwJ5xTppkCYZruziW4FUeoQTtsJtfSeN27xA1y206JxYkl/xUt26VYM3MpzY3hvl0nU6SuHoUM2bRj9F77oUQWC/ba2l0=
From: Hari Limaye <Hari.Limaye@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei
 Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH 4/6] arm/mpu: Destroy an existing entry in Xen MPU memory
 mapping table
Thread-Topic: [PATCH 4/6] arm/mpu: Destroy an existing entry in Xen MPU memory
 mapping table
Thread-Index: AQHb4cpciV/6CvSAB0CHD6KSA8R6qrQUHtAAgAlF/Zk=
Date: Tue, 1 Jul 2025 14:56:59 +0000
Message-ID:
 <AS2PR08MB874501E9A5853A529FE6BA11E241A@AS2PR08MB8745.eurprd08.prod.outlook.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <95cc28af74339ea617081f3935123e38a53cc657.1750411205.git.hari.limaye@arm.com>
 <e3d28537-b531-4cc5-b875-4afa0437ece5@amd.com>
In-Reply-To: <e3d28537-b531-4cc5-b875-4afa0437ece5@amd.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|DBBPR08MB10508:EE_|DB5PEPF00014B8B:EE_|DB4PR08MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f3436f-1af1-47ff-4701-08ddb8af9b8b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?wUA13ssp4W1rOMEclhekpINhwh2iZfSFn/adSnxrPHMRFYhu1IhwW3ddCpg+?=
 =?us-ascii?Q?P7yvTmHz7ghqSL/0wZnGxrfo+AnB49eUKfGr8l5Xzd56j/vYGcE1VI5zJXqX?=
 =?us-ascii?Q?KjAL/zFVlh5k89FC2Yb810xNM3dgMj/K+q8d4e5i06IdrDghwZlXZtrqeO0f?=
 =?us-ascii?Q?TCgQ5ExWNJqK2bxQoPNruXytXcbGaXV5/I0OuJ+sysSmNJUEbTHZuomCa4R2?=
 =?us-ascii?Q?EUFDsDaRMSpwoh9VpZ0xbH+aCkqNSg309Jh9ry/OUeW4tbbSkqytWycqWLyD?=
 =?us-ascii?Q?2ejLIdoVgatxs7mFrnEplnUnBzeEKjAk+ZCSJYku8jVaSsJBtTL0QpVN2BY7?=
 =?us-ascii?Q?3eDBs0d3mJx8K31AFG0qSx/F7EKBpWYxRmoFpqZ+V4p3Hcb8SUaZAoLcY4XP?=
 =?us-ascii?Q?L7u14dNA8JXqAwiB6yHowShGZ5r4PM85/AUF6fjuZhT+Qmr57vTnxDVnhpfd?=
 =?us-ascii?Q?c9QlwvOVZPwXLX8OFdOgMh7QOpjIN+02KJK2GTC7HNmKHLbFcZAUFKy09642?=
 =?us-ascii?Q?fvaqJcnvlQyhqVT4gZnkvs7tX12lp+S045fVzL5PFwZQX/Mtdpdymq0E5oKe?=
 =?us-ascii?Q?smRwQ/iFFIuP2x+ROKKNFrw+ahBcZ5i32YwFfigx9AV0VA/+qiElqmVvqCOM?=
 =?us-ascii?Q?45/aEg62/h4kCEUrnKGdNE8cFRBUFES/U4fqZvfL5lLZnreTlmeqoHFltwKF?=
 =?us-ascii?Q?UBQb7+HV8dk1jlhI1EN619vfpA81fKffEKfWJG8Pie56y1HSerhDI9rpcJAi?=
 =?us-ascii?Q?oJgnd9WtRbOiYJvNtxaBdCPG2YOoYWfWOeQT+FIWYdxqTmzs2RRrIBGGxL/e?=
 =?us-ascii?Q?npHjNhv5wqf5KBxuI/bqBA8vst1Dh+Qyj5oeh1wmIGs9vIbBGlO8KXft7CE5?=
 =?us-ascii?Q?/V83GQ05klxN8A3GxuQ6IAyO5q0mglEPEngudqfsC5UNO951xfHS/DRnwagU?=
 =?us-ascii?Q?Uac/G/vvHNtNrWI2t/265CZjQfNAOJSVmJKuJM8OTX+lvbNG8dvFQ9NsYkLp?=
 =?us-ascii?Q?8OFdV2ijpErJxhBUy6Gx9kMo+LnEpQ/ZcfIoTC10rTDmEivX1FY2tDWslXtP?=
 =?us-ascii?Q?+BKIgGPnayGfzn7zp0ZPf50XVBNZgTNDGxbFwaNd3YvHA4a/giVdqBHFzI51?=
 =?us-ascii?Q?tIiuDJJm5Op2XgVMaC+rOPY7rkfi6VE68P4eD4zSPtnupwYxP1YBoHEAGHiq?=
 =?us-ascii?Q?oGAhY+yDB6OlODu8X3vluuUgBWJ/zcqa24zObDneEQFVkWu0E4iAZMAAcq61?=
 =?us-ascii?Q?2EO5CTMfne1W9zuMFRUkb5J1nL8h+kcnBRuBZCKI7XZayl6Q971s68buoB1V?=
 =?us-ascii?Q?fg0MhGhgZVHhSNVy6F/+ZWhcBTZZJSumBVduV6AYclFA4EvCO3ryz2Pble9m?=
 =?us-ascii?Q?9MLXcXhx7YWuj4gNMEVL3r0Jb5yQtZisV1eTmzo6b8ooUQPl/EX7+oJJK/sM?=
 =?us-ascii?Q?aHdeLneGdfSyhPhN0+9HGIVf3xFKxYijByCXYaMC3k0LHZjIp9LEgHlLpvUK?=
 =?us-ascii?Q?X4dejHFJwOI8bjI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS2PR08MB874501E9A5853A529FE6BA11E241AAS2PR08MB8745eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10508
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6cae47f-0b7e-4112-ed76-08ddb8af882f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|376014|1800799024|36860700013|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?Windows-1252?Q?V08OhkiErVNwrp+/wy6bvmlITxP+4c65ESyBLoJSPfdxsXHkIzhHD7Nd?=
 =?Windows-1252?Q?uc0H1rVkyOYkJ2ITRKZhwAJ67EshPEFreL1s+VD8wFIHdWHostwcbKqk?=
 =?Windows-1252?Q?q4+6w8jfis2EZCsgdyrIetixxjzc7c33pKLVyAVkz984xjSEhSdXuluO?=
 =?Windows-1252?Q?PW8I6/PGXRwEakAyEVXbwuVYW8VAon8wFah5IhuTA8BSUJ11VLNdBZUk?=
 =?Windows-1252?Q?ktTnZZdlwUquBSYtFg7eZTVpmhQ/w2wE+W2hHuT4UItKaSuH8aYzCMs2?=
 =?Windows-1252?Q?2EJaessGnmMIDbN8qk6oBcL0s0lKGosLRUdI0lvWzQSbY0OsE/rpOVeK?=
 =?Windows-1252?Q?jUCjc1NAJVAeFfM2VyhA2lXnzp7JbNtjLlDTV+QVlC/wpMMmW9oNlJhp?=
 =?Windows-1252?Q?MxsOy5ASArdaR81W8BAXOmHHd54BVscQuD0QII4Stm244pOhYMQtPY2n?=
 =?Windows-1252?Q?Cc2Mo6AOoS1RcDDdQuguZjEb53DeNRRkW4Y0LkSSUU6sSgaSImL3+nLM?=
 =?Windows-1252?Q?IUdzp7WBmQCT63D16+UcgkEdNeSgCCU9euCv1pNbpYsOFYryimQCeBRj?=
 =?Windows-1252?Q?xZgTJZO1tRpRkF5AewwNAuVkIibHnbGRhNGSm1BQz1sVdsemGKL5y8fs?=
 =?Windows-1252?Q?L52QUkwsf8qGgw3Lb/SvuxRKwXD8NLXnn0n6be6+GBmr2cMzUgsNEMSL?=
 =?Windows-1252?Q?0+kgdcrnLLRkd74+tAp2DL+PulyBoJ0c5mhJSa1j4LVUKb0pGMdrVMMW?=
 =?Windows-1252?Q?n4acoMiL0b8g9aZZtMSviQ0b76eEhRvZuFM2pT2Ykh/joRQ747nRSjkF?=
 =?Windows-1252?Q?rWQfOo2JSZsxgFp/GhX6+B8iHaVXFxsySY5Dk6S3RMvq7DTKmogrsIxf?=
 =?Windows-1252?Q?snP5EJjAcQpXkcs/dOkFh/K0lJC/+rl4rfIyS83u/KMSi/CtSuh9xH94?=
 =?Windows-1252?Q?fB1DbV/Wl5bCsuoCd6ivk7r/YeFqejtI4smAlaTjkYD5nSltSL3qS3eS?=
 =?Windows-1252?Q?FImwQKspLvI1hExoopL/tGc6LkGPeTcr/qAu//8j+UIZj+4YJAMIMOKi?=
 =?Windows-1252?Q?kVrVMrZrmw5aYOTHxz8m2p3eDnxPzpDJv0dXFI2YoJYPGzq6WsP8MXdL?=
 =?Windows-1252?Q?2HDNZw4mTT3J2izAz0uj7aHZWaeg7pGeHEnuj+iN42blAaSX3fdWJyHI?=
 =?Windows-1252?Q?wsJclpfWSM5b3xAqt4dlKuVEU0kYKTwjc2pU6noLJ4HISbj/+em2x5Yu?=
 =?Windows-1252?Q?tKwMJh4YsLbmceIdIGSUmLEoplZre19/LYojDXCVFa8FTnsMNCsBrAcU?=
 =?Windows-1252?Q?SVxHxVmZqiwPFTbEpdbqPpOu5b0bNF0JmJg8t+Vlb4eilLgD8dzXR/+o?=
 =?Windows-1252?Q?gXM0MaIK2nwX/9qa4OpzrE8cMkfFZiPDpYvurvkj6oxpTpdFZkpJ52+c?=
 =?Windows-1252?Q?0KZlzbfVczCx4w3y7auEmTUGh/qM7tz+K6HidYuTiF6+CuOzB8WVRpGD?=
 =?Windows-1252?Q?jjz/mOty9+zvGcVxIVyxB58F5DFZhMfnwHGlHD5O6z6DqQjvB3OTBrHj?=
 =?Windows-1252?Q?GZQ3av3oE17c4DbpDYfMqJ6Cwvcb+qlF7wIPNF1Ibe/rEhTeB+4dHuy7?=
 =?Windows-1252?Q?ZcRLyFNzh68M3wKoDAer8mqvuT17wPre0nyHLytbhZvZnQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(376014)(1800799024)(36860700013)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 14:57:32.3778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f3436f-1af1-47ff-4701-08ddb8af9b8b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8128

--_000_AS2PR08MB874501E9A5853A529FE6BA11E241AAS2PR08MB8745eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Ayan,

Thank you for the review. I have just a couple of clarifications before I
re-spin the series to address all the comments:

> > -    if ( flags & _PAGE_PRESENT )
> > +    if ( (flags & _PAGE_PRESENT) && (MPUMAP_REGION_NOTFOUND =3D=3D rc)=
 )
>
> Same question in this patch , why do we need to check for _PAGE_PRESENT.
> Can't we just rely on MPUMAP_REGION_XXX ?

The _PAGE_PRESENT flag indicates intent - whether the caller intends to cre=
ate
or remove a region. The MPUMAP_REGION_XXX values only describe the current =
state
of the MPU map - whether the region already exists - not the caller's purpo=
se.

For example, if the function is called to remove a region and it turns out =
to be
MPUMAP_REGION_NOTFOUND, we don't want to accidentally create it.

The flag is passed via the `flags` argument in calls to `map_pages_to_xen()=
`.
In this patch:
https://patchwork.kernel.org/project/xen-devel/patch/deccb1566ced5fa64f6de5=
c988ab968b76dc945a.1750411205.git.hari.limaye@arm.com/
`flags` is set to PAGE_HYPERVISOR_RO, and as defined in
xen/arch/arm/include/asm/page.h, this includes _PAGE_PRESENT.

It is also used in a similar way in `xen_pt_update_entry()` in
xen/arch/arm/mmu/pt.c.

> > +static void disable_mpu_region_from_index(uint8_t index)
> > +{
> > +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> > +    ASSERT(index !=3D INVALID_REGION_IDX);
> > +
> > +    if ( !region_is_valid(&xen_mpumap[index]) )
> > +    {
> > +        printk(XENLOG_WARNING
> > +               "mpu: MPU memory region[%u] is already disabled\n", ind=
ex);
> > +        return;
> > +    }
> > +
> > +    /* Zeroing the region will also zero the region enable */
> > +    memset(&xen_mpumap[index], 0, sizeof(pr_t));
> > +    clear_bit(index, xen_mpumap_mask);
>
> NIT.
>
> These 2 lines we can move before the if { ..}. So that the region is
> zeroed even if the region is disabled. This will add a small overhead,
> but we will be sure that the region is zeroed whenever it is disabled.

Thank you for the suggestion - just to clarify, unless I am missing somethi=
ng
I think that moving those lines above the if block would actually break the
logic.

The memset() call zeroes the region in the xen_mpumap data structure, and t=
his
is what region_is_valid() inspects. So if we zero the region before calling
region_is_valid(), that check will always fail, and we would exit early wit=
hout
updating the hardware.

It=92s the subsequent lines that actually write the region to the MPU regis=
ter. So
if we exit early, the hardware MPU state remains unchanged.

That said, I believe the current logic is sound - the early return path sho=
uld
only be hit if the region is already known to be disabled both in software =
and
hardware. This function assumes it is the sole point of disabling regions, =
so
the check should be reliable.

Many Thanks,
Hari

--_000_AS2PR08MB874501E9A5853A529FE6BA11E241AAS2PR08MB8745eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi Ayan,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thank you for the r=
eview. I have just a couple of clarifications before I<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">re-spin the series =
to address all the comments:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; -&nbsp;&n=
bsp;&nbsp; if ( flags &amp; _PAGE_PRESENT )<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +&nbsp;&n=
bsp;&nbsp; if ( (flags &amp; _PAGE_PRESENT) &amp;&amp; (MPUMAP_REGION_NOTFO=
UND =3D=3D rc) )<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; Same question =
in this patch , why do we need to check for _PAGE_PRESENT.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; Can't we just =
rely on MPUMAP_REGION_XXX ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The _PAGE_PRESENT f=
lag indicates intent - whether the caller intends to create<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">or remove a region.=
 The MPUMAP_REGION_XXX values only describe the current state<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">of the MPU map - wh=
ether the region already exists - not the caller's purpose.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">For example, if the=
 function is called to remove a region and it turns out to be<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">MPUMAP_REGION_NOTFO=
UND, we don't want to accidentally create it.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The flag is passed =
via the `flags` argument in calls to `map_pages_to_xen()`.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">In this patch:<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><a href=3D"https://=
patchwork.kernel.org/project/xen-devel/patch/deccb1566ced5fa64f6de5c988ab96=
8b76dc945a.1750411205.git.hari.limaye@arm.com/">https://patchwork.kernel.or=
g/project/xen-devel/patch/deccb1566ced5fa64f6de5c988ab968b76dc945a.17504112=
05.git.hari.limaye@arm.com/</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">`flags` is set to P=
AGE_HYPERVISOR_RO, and as defined in<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">xen/arch/arm/includ=
e/asm/page.h, this includes _PAGE_PRESENT.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">It is also used in =
a similar way in `xen_pt_update_entry()` in<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">xen/arch/arm/mmu/pt=
.c.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +static v=
oid disable_mpu_region_from_index(uint8_t index)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +{<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +&nbsp;&n=
bsp;&nbsp; ASSERT(spin_is_locked(&amp;xen_mpumap_lock));<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +&nbsp;&n=
bsp;&nbsp; ASSERT(index !=3D INVALID_REGION_IDX);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +&nbsp;&n=
bsp;&nbsp; if ( !region_is_valid(&amp;xen_mpumap[index]) )<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +&nbsp;&n=
bsp;&nbsp; {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printk(XENLOG_WARNING<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;mpu: MPU memory region[%u] is already disabled\n&quot;, index);<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +&nbsp;&n=
bsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +&nbsp;&n=
bsp;&nbsp; /* Zeroing the region will also zero the region enable */<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +&nbsp;&n=
bsp;&nbsp; memset(&amp;xen_mpumap[index], 0, sizeof(pr_t));<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; +&nbsp;&n=
bsp;&nbsp; clear_bit(index, xen_mpumap_mask);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; NIT.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; These 2 lines =
we can move before the if { ..}. So that the region is<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; zeroed even if=
 the region is disabled. This will add a small overhead,<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; but we will be=
 sure that the region is zeroed whenever it is disabled.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thank you for the s=
uggestion - just to clarify, unless I am missing something<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I think that moving=
 those lines above the if block would actually break the<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">logic.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The memset() call z=
eroes the region in the xen_mpumap data structure, and this<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">is what region_is_v=
alid() inspects. So if we zero the region before calling<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">region_is_valid(), =
that check will always fail, and we would exit early without<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">updating the hardwa=
re.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">It=92s the subseque=
nt lines that actually write the region to the MPU register. So<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">if we exit early, t=
he hardware MPU state remains unchanged.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">That said, I believ=
e the current logic is sound - the early return path should<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">only be hit if the =
region is already known to be disabled both in software and<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">hardware. This func=
tion assumes it is the sole point of disabling regions, so<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">the check should be=
 reliable.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Many Thanks,<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hari<o:p></o:p></sp=
an></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AS2PR08MB874501E9A5853A529FE6BA11E241AAS2PR08MB8745eurp_--

