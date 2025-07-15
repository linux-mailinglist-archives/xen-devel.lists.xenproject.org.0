Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B74B05707
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 11:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043929.1413976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubcHs-0001wQ-67; Tue, 15 Jul 2025 09:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043929.1413976; Tue, 15 Jul 2025 09:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubcHs-0001ur-2l; Tue, 15 Jul 2025 09:49:24 +0000
Received: by outflank-mailman (input) for mailman id 1043929;
 Tue, 15 Jul 2025 09:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCR=Z4=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1ubcHq-0001th-5T
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 09:49:22 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8320b8e-6160-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 11:49:16 +0200 (CEST)
Received: from DUZPR01CA0285.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::23) by DU0PR08MB9630.eurprd08.prod.outlook.com
 (2603:10a6:10:449::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 09:49:13 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::1c) by DUZPR01CA0285.outlook.office365.com
 (2603:10a6:10:4b7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 09:49:32 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Tue, 15 Jul 2025 09:49:13 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by GV1PR08MB10855.eurprd08.prod.outlook.com (2603:10a6:150:161::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 09:48:40 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 09:48:40 +0000
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
X-Inumbo-ID: f8320b8e-6160-11f0-a319-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tmV7bwsWOVWMCkP5oR8nl8lMxX5hROeBbKfLewOTuP5glXhzG8iX4pmOh8/64GU6XQEixmEoHsGpd7N/XnskvUH+QNeQTVlNaYlKJynlnjljT24z/ga6v5Af8B9B6yCe/48zQpQB7p8ndGoN+FOrHQGsSvTna4aFjDXuGFZb1DBsFi1y4iOOFdbQ+iRqqnbHZltsaGhNqTdtBVq0Rh+CQe7uOWo0upBQtvxfP+eh6aUJ0gJuBtpn35CC1hNnj+D+XyIEaTGRWk4xDiJ8eMqg1/2B/Svbag+AXQBv2kDo1OP0yq2EuAbasJ+g0USQ/eF3GilfmHwhxkqJ/CBFf7ByPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hy2Hcz7wJzRftQRSPy7SogHVk+lHuzGM3bY2/SNzvWU=;
 b=IQ4ELKevWhWOCiO4pH/EvkFkVAuTQrW9qMxoJVI178yKHYBfNYWwd/NITXTGOvqGvpPeudPVa7Az70Gop90qdTUV69veGAriT6GP3GEGgxpHHQ7sCNHY34SO1zSX4xthDx2bJx+Yyc7cfCK1Pu3lW/VEdGvipZMCIV1WIDG0tSSRn55cF6GJti5mqq5tGlvAUSnAMqlZ9a16/eeAN8mtKvFSuRoshw8fCPLocjhUzQzOM18m53nZSbCMEkwKTGO9R2IM0VXnlBVt4R2j9d577/on35EtwaMTzwDF/g/GaWy6nOoPVh9IyJ7+Kx+01HCukEqrazgPHkumiUHcyrpYNw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hy2Hcz7wJzRftQRSPy7SogHVk+lHuzGM3bY2/SNzvWU=;
 b=QzTL+qgOVqvSksBiACq/59tYmmIqux6CukxcirgEYOaI3Nauk+qDqq4In6FIDy1HDfgWJLSsNd39xUXxRCQ4kLAZiNHKbl7ORw5FsbOhqQRwRBABtf3Q7hopBjpJY4G8MU/WER0X4I7VaeQRtqqufl0QeI3/twzS/cEmJhKk4jk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgO8J56MaAnQHyrDDtdQb/LQV5+jws53T8yPUI6d6OsY+PZTjwlFa3j1EvuE4F0R/LqG6YwyRRjiQyw4r4yCamMjC1qJi9hdu5M+ZMdjARbAcqcyV7mUuLlEcUeRtrtyC1N1dSgPldfBz/t799dHsCybDvuu5//7ZUEDwpzfdr4uS3COPdxuL3iuv8yc1n6Tf0uGV1b/rjfW9GSxPHJY4kmrSwkyDIs0w+X0jeQT1wneOQEJJJDdH0wHGgkmPO5k2RpXAdG67gXVopEGSH5LOYASCEiMGlUURTBy7Chb4XMi31nf3H93vxPz4aGSc8M1RM7adHG72EHJakSztgisFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hy2Hcz7wJzRftQRSPy7SogHVk+lHuzGM3bY2/SNzvWU=;
 b=lNY9wCjjobWaZs6OEgv4o9Mjz8mxen0U2/BxlL51PikrZKOj86E3T0eGgap3hmJPDBc3PDqTHf+Tolhkj7v+kP8ble6C8n3M1pLjjVc7bKzWgS2k+YV7Ph55XCgp37jxOC+VcTdTXlDk1rldpV380SJrLQ0Gt2h8A1ZTfjHfdKrJnW2y9kCUBNVlJr2gXVFoVCi8OKgVaC+BltjwTXodgyFxDmogK45XL+oaU16lEdCIbuPJb7r/Ioo/WNC3rnS67tw0OMi7SwW8fLVG9mLMjhi0vZpTxaQmNe83kzkelnfJRi1W1eUHd6k2ymJcOp22smyx7i0lkdabLMDrqftdiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hy2Hcz7wJzRftQRSPy7SogHVk+lHuzGM3bY2/SNzvWU=;
 b=QzTL+qgOVqvSksBiACq/59tYmmIqux6CukxcirgEYOaI3Nauk+qDqq4In6FIDy1HDfgWJLSsNd39xUXxRCQ4kLAZiNHKbl7ORw5FsbOhqQRwRBABtf3Q7hopBjpJY4G8MU/WER0X4I7VaeQRtqqufl0QeI3/twzS/cEmJhKk4jk=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Luca
 Fancellu <Luca.Fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/6] arm/mpu: Find MPU region by range
Thread-Topic: [PATCH v3 1/6] arm/mpu: Find MPU region by range
Thread-Index: AQHb9V+06nIKaACf9UqCxt0klN23X7Qy3E8AgAACcQCAABG8gA==
Date: Tue, 15 Jul 2025 09:48:40 +0000
Message-ID: <E4485C65-9A69-4EBA-BC81-04052E6B171E@arm.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <3da52fda916ad2487ede9b193143d06debdcfc88.1752565274.git.hari.limaye@arm.com>
 <03fc835d-7833-4c1f-b061-da22a4ab9b75@amd.com>
 <515DCD17-B77C-4931-9C67-2D890D5B5E00@arm.com>
 <86068832-1403-4468-88ad-9d66066cb687@amd.com>
In-Reply-To: <86068832-1403-4468-88ad-9d66066cb687@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|GV1PR08MB10855:EE_|DB5PEPF00014B93:EE_|DU0PR08MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f8e551-d9f4-45dc-8ce1-08ddc384dae1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?lL8tInHL6dMwuGWWEk+Cx5XVJ5KytpGbIogFyVmXQkdxRYs+CtSBp/ycBPep?=
 =?us-ascii?Q?QTuXxtUrrHJB6T7+E+L6B0nQk0DhZfvmMz6wE2ZZhyVLWPXvLAn3NQ7ryC4f?=
 =?us-ascii?Q?k6/L5VgscPbHi4zV2jXbkAI0kFAiH7O252u10pe0Csc51hxFzozVTxCvQRSd?=
 =?us-ascii?Q?OiWOcoJYnAYDl01nLO/xD4HY+d7Wl1Yilb1QHB/iaXZFGkc8XNQ4sjpWpJRa?=
 =?us-ascii?Q?IfYsIPNVRigjNlWGHp5/6oyglKJ2tsQam52eWLmGxBcuNNmIfYyJ7mI7BB5t?=
 =?us-ascii?Q?pLsGTHN6sIUfTRNMJUEKCyFvV+7nQmhgxaCx6cGhJ9o3PDoXBeh+aOGrvzoG?=
 =?us-ascii?Q?DTMagwNysft2QDSW0o9QlKhPJJaanQJHuKgkgWKTtmxJ0Ez2G4857ig0Wsjc?=
 =?us-ascii?Q?pSnwZCWhyeyHj4ZXkWyfISR3211OqG5/W37mUjt1LUDhQeo8V4hQ/ErXhQyg?=
 =?us-ascii?Q?1Vs1ZLgF1SAvrLzgdV39ikGVJECXlsOZ+PLGHnzWXKJNi1fwtkt+tCaQwkT+?=
 =?us-ascii?Q?Opp0WNNRghHCKmhazLXKx/DnWb03R4Ke0RenXtLArHHMFbsBYToGfRLO1J77?=
 =?us-ascii?Q?T6we4VqUMNyczCWG5NObGOPM0SZuYpJVi0/vqyGeDGxsrVsLGr5/1yFNo6xl?=
 =?us-ascii?Q?2WtjNq7a3oFLPQixeH0ewLAAWC83b7yRofxI/APjFMbVkygsvPQVyrl45vkq?=
 =?us-ascii?Q?u6a12f6UnXNoa9/KHuhsKUvzsZKCX0wk8M5pC+uXo8AaPWy0ece/0cLDO0cQ?=
 =?us-ascii?Q?mg1FsOQr9QXN3/3X6T2q1/hqhYGypDUwNZu23xB3vHJHg1YrIaWe39ncG/jL?=
 =?us-ascii?Q?gc1nyjREmVbOS82kpQXzsn2j+Uuo/BH0nWADqd8L58PgPSrRnClxLZCag4kh?=
 =?us-ascii?Q?NH1LHPLtd0laZc1rNnWhWSV+Ha2sxrXAHjywoQ/KD0JUqUl9EzCDWMdpq2+x?=
 =?us-ascii?Q?50pPbFJIA169hwQd3yEOJZHXUPy2n7PyJfRHony6bauM4o9ci8VpudWGO8JS?=
 =?us-ascii?Q?eAv2nLtAe3qIBAu8HY5neAWQnjbvRdBjGzi59wn6r5vEZQUd9jJ5PIQjUXT7?=
 =?us-ascii?Q?sQSyU600ZCZrkl/75yJ1KhOZcLuyuwgo2/R+ZHWYG3xb9PWZLaPmLbRK+Wu+?=
 =?us-ascii?Q?TwhiGB8vuD+wU2KjhXvEViSsDgO7o9e78a9BoLoIcyr7vtwRvsWhJva+5zC/?=
 =?us-ascii?Q?Dv3znFxYgJEqkTw7JcFdTLndzH0vrBtEuEAxaNWmJzdYga01J0JO5HY3n1hO?=
 =?us-ascii?Q?GREBwwDupwfDFyQyQltNtEo9qYCixe0HF6q9+RO+6rVcr2USnH68kSIfLmrc?=
 =?us-ascii?Q?hsAZeYtXr+bVQFLpItV4v7lRE50EJG2vr3fiswC5PU3bNqbuwPM3CBuLHeus?=
 =?us-ascii?Q?oLLqjy/QL+aVUr+cGoDCFXYzLLLFIvjJv/b3r7wChdI9+NitiaDlWljSouNw?=
 =?us-ascii?Q?CN/XLY7qWKGDJ7CJ8QZLboguzv8NnC+VS0K+A60gBNEZegDRP8Gd2w=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <93392A84E01ACC4DB1E9A945652072F2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10855
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0a144196-ea2f-48f9-259b-08ddc384c767
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UzcjIPwMUBsVdS8OS9/qjta2HWVoo9h+tWRceAHlXZqEToBJU79JaHHzzXr9?=
 =?us-ascii?Q?MUFL9LGUvLB7OrwJlhym+9sAgu4yJUc/+c5iA1EI7So6AOl4LNF/zI6zf1zg?=
 =?us-ascii?Q?/2+3RXc0e67EmRoeToo+4Kim9sOA2r9uvV3Zq5cKlhTsDtQQf7stY8tENTEo?=
 =?us-ascii?Q?KmASUzAZI/U9QF7PlsggOvQUmeEbrf15wHzGX+ye0x//4Knwy23NhmC76Yc/?=
 =?us-ascii?Q?zkFMwN9+QqwRT4+8H3l1oU+ABRgSGbNOD0Jj8m5iWvZjZvT4D4Blps3YvIMw?=
 =?us-ascii?Q?wcjMJCSZSoTfbfCwIxPGYSp3o54zRlT6WSS4WabfevdC+yRNC24GRiWQhZoQ?=
 =?us-ascii?Q?uGm3Lf4DtSkjsXKM8gzZniFwrprNPqGnoRaz2GH9XgZ65+arUOJvj8VZEO3K?=
 =?us-ascii?Q?HTRUq98zMdsMXhGP2RegJwMtu+ktLFMPxmxzAsr56/B0ZLtIsyxgCfO5Jzt/?=
 =?us-ascii?Q?3OHmcKmaFfvjYpVnyoX/t7KNMscAN39YCXT0sAkLWB3C9ErC96PpVx3FbBDK?=
 =?us-ascii?Q?Wnitl95W29YD1hTV26zL+Jo83qoZO/lRDSQ/K61Ycjys/9ahUghKijvU8TEN?=
 =?us-ascii?Q?g5+bUs6YDKpu34BM9jU4hW/R5Tl7s+tgnFZfcZl/aJbRkThoM9JBtEJ/YCHi?=
 =?us-ascii?Q?xu3UYo4EszQ8HXr1Z4ieOMdbQQOSOw2UAorGTHv3qB4oDAWJwwBB0TcSAD+n?=
 =?us-ascii?Q?6za0J+zSIGpGf4UnZM/jvqeUDvOk1+q27NLp+cyDaAHw+BX1gvZpS6JNYmcd?=
 =?us-ascii?Q?N4inoRsULt4PK8xCWBFYapul3pZHr8QoXCtYCdjHmGId4neYhrTTjj76pKOP?=
 =?us-ascii?Q?BX8Fx1JH0EUjcM9lheCBxUTHcKKonJh+nmbuwLJFWJLCrTKS9V1uloIMZX6Y?=
 =?us-ascii?Q?x2E7K96DxEbUfe0E/vN/oWHEgWWXr1coz82xxKceAFUVObi8EqndsKnMjjgQ?=
 =?us-ascii?Q?DYjxWiRO+8hvYkdeWnm/gb6AofCIZLdbfQ1xi+9nMrIdbV8Slp7CveRim6jt?=
 =?us-ascii?Q?TZDZEIN9RSQMnDIfC6nUCcL3qO5lELVi567sTc7hRVwrsXbTa/6wSs8Lcr3U?=
 =?us-ascii?Q?KKfxcze+7k15EzHn0XMdacC1++vKl1oonzKGzzD6s8X4JxYkAU8tY7iQhHoA?=
 =?us-ascii?Q?/EGFUanQylkrY/hDx7RahkEqYmcs+EeASSC1glswCh3uRksM3bXYFvVWEpD0?=
 =?us-ascii?Q?SvLtlYBr7h+HnKLaoSncJpuxQrCudlUve6xCHX4Q+Ep2iqsmkyVsqcz9XHU4?=
 =?us-ascii?Q?O0bVpZWOGw7hsDB2D4SjxXT5l53fVdFRcgnWwZ7Heo5KcGHnZi9589153GUo?=
 =?us-ascii?Q?2OHuuM6xN0SNltMxQLKavuBNd3NtYttt3dFhs/HDcJBsy+TETjKSmz/pik3M?=
 =?us-ascii?Q?m0TB9q9QTeiiBXQ5hVKWWdI5lDJUkWQbgX1vs/pOebiO5pHDlcqQ676gFciv?=
 =?us-ascii?Q?KJIXvSWB3hFE2tXQgl2coCaJ4lhMvYNHIlcZFPvCEF2bGTL6JMjTSRmhOct4?=
 =?us-ascii?Q?Z7QeyJfink1fFBOTot0Kpo8nQB8UNrEyM3Pw?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 09:49:13.0762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f8e551-d9f4-45dc-8ce1-08ddc384dae1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9630

Hi Michal,

> On 15 Jul 2025, at 09:45, Orzel, Michal <michal.orzel@amd.com> wrote:
>=20
>=20
>=20
> On 15/07/2025 10:36, Hari Limaye wrote:
>> Hi Michal,
>>=20
>>>> +int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t b=
ase,
>>>> +                           paddr_t limit, uint8_t *index)
>>>> +{
>>>> +    ASSERT(index);
>>>> +    *index =3D INVALID_REGION_IDX;
>>>> +
>>>> +    /*
>>>> +     * The caller supplies a half-open interval [base, limit), i.e. l=
imit is the
>>>> +     * first byte *after* the region. Require limit strictly greater =
than base,
>>>> +     * which is necessarily a non-empty region.
>>>> +     */
>>>> +    ASSERT(base < limit);
>>> Well, that does not guarantee a non-empty region.
>>> Consider passing [x, x+1). The assert will pass, even though the region=
 is empty.
>>>=20
>>> ~Michal
>>>=20
>>=20
>> Apologies, I may well be missing something here! Please could you sugges=
t a code snippet to understand your expectation here / what you would prefe=
r the assert to be?
>>=20
>> As I understand it, with a half-open interval [base, limit) as is passed=
 to this function, the size is  `limit - base` and so the region [x, x+1) w=
ill have size 1. The empty region starting at the same address would be [x,=
 x). But perhaps I am making the off-by-one error here.
> Hmm, I think I made a mistake here. Region of size 1B would have base =3D=
=3D limit
> in registers. All good then.
>=20
> ~Michal
>=20

Thanks for double checking. I notice you did not add your tag here, I wante=
d to check if you think this patch is reviewed from your perspective?

Many thanks,
Hari=

