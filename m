Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC430B0550E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043819.1413872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbA4-0001hJ-PH; Tue, 15 Jul 2025 08:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043819.1413872; Tue, 15 Jul 2025 08:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbA4-0001f9-ME; Tue, 15 Jul 2025 08:37:16 +0000
Received: by outflank-mailman (input) for mailman id 1043819;
 Tue, 15 Jul 2025 08:37:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCR=Z4=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1ubbA3-0001f3-E2
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:37:15 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5c8792d-6156-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 10:37:10 +0200 (CEST)
Received: from DUZPR01CA0309.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::9) by VI1PR08MB10298.eurprd08.prod.outlook.com
 (2603:10a6:800:1be::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 15 Jul
 2025 08:37:07 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::d2) by DUZPR01CA0309.outlook.office365.com
 (2603:10a6:10:4ba::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 08:37:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Tue, 15 Jul 2025 08:37:04 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by DB9PR08MB9441.eurprd08.prod.outlook.com (2603:10a6:10:457::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 08:36:31 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 08:36:30 +0000
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
X-Inumbo-ID: e5c8792d-6156-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pdl8EJSs1E/aiEXlX6Pcb+dTjSCrKQoXRoSvDl8HVvNKLVRnzRzQ4IttwS0d7sk6fNjZOiWMLZqg/k/Md+NjgxspGDZQzOGGXRJCy042R8pZP7VR8009y3cyfR6uoNnw5sVyk4EV77q5MM53kjDpAEDRXMJBpz/2aSbRaQ1/9j5lJM7G2sqnONDVJSaUfdhqS/05tjVwusgTlbziPvct1EIlQHxi/5VoO8Ql7xSWZDr6DTkoUjiUH+vsT/L5U8XBCF41Sr6aQfkTv6NSh2qYB7BIsQ50DuQ4mcC32lDLQMbisUfPEVnF1A/Spl2lGcQd4K7rcNHzsCl+DPoWF9aktw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JendjDDkuEWu4SrqeNccVu+FdyDtlmhYuOpOgaCGv2s=;
 b=Hc9LeDFK/N7e4HYGbidRbOn9/YhKcTsdYBs4iEQY2Z00gLnmjJwp7aOIUMihdrUhMa3/D2KAeNZ4yj67E+QL3XLIx88QSmpXMuBAL3JZIFxQPj0ZKWHlCd3WGTUBvVXXQ5B4zBnZnKu79pmd/exqDfYEjxSDN2Hz0MHwTEUzlGdIW6TjVcJ3H6v8sCqjQenFECbfdBF9KrRfCEFfYQZF5dqo+vkdWkfx3LcQBf8BbLPnen2njIW91E7CatL+xb9GJW8g5Eo8Ai3WMu5y9WWYoAo5bIslbI4ZTdXxsB7+QEiQ+hBK3VVIpYxSKY0+/+kKCppjFuioJWx2IyYtoK3Efw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JendjDDkuEWu4SrqeNccVu+FdyDtlmhYuOpOgaCGv2s=;
 b=KxwxV6EdzQhfvbbJ/hU7XilppyhrOeSMF0pKWPsWm4hzqEZsPxlQP0b4lgj5DYMwSseB6V7is5hjLTxj0nf7XMHtyb3Nes8pLeduYOJ3JV6or67J1RoyPB8Vxb524lT2prijW291nJ3O5dVmfzfHT8OjQ52hzbe1uQZVtWXRNZc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCAwofDkI/e3WLLe6bo0A+DLz5GG9OVLalTEqsaSOK/ctocPOC+scdqO7xV/GaRY29M60Y7mpuwOn0pBVKrGUGQycFUsl4XDtNavsXIqCue0uv5l2TW9WxJuy1kG2tErFmSXUd+l+1wkOtIyKfrL4HiJASkfKn7xvPmkDGvLNR24DDXqNzUSYrW5QSKmsOnPO5NzoeEl1SeeL6qf9fN+kuAy4GnwmpYnq0m1Sl2S+ZB9Nkcu92EHwpK8npSgoMpQoGCB9L2YUZAoE6FVcBLmw57w7s/Sl6KWkKFdZayPrb68V9JAjKGxS0jlcEomnbCSWSGVaaHVZYPnM+2aMBKs4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JendjDDkuEWu4SrqeNccVu+FdyDtlmhYuOpOgaCGv2s=;
 b=SkK6mnvBqrjU3VhPTNMFbYmSb9qIbzmiOf3WgGXtbmdVe72l+djwq6OGlJYN6Gh3uOl8OhUE0PKV7roO/xN/opT9Dn8Nw6DU3108kqIV4dzDL3typkgzektS1UjjHjQPmpt7+1G9MoLjdM01F+tuMJ+bcfEHYe2gh7er4RJDmNR4T+Fpz+MNPPGbUFJ9zE5xuFwX2nlGrjSdYGTbcHhf3I9cm/ly1j3L06z4HCmOFFyZTgKyCwW8EJ/FWFFdm2IpuPXhCY0gUqGI0q/qnwN8EV5yNkTVnPYelo/MsJNX7NZBuLK2v0BD5V6jqQJw9YTxUjxBadgqi3NNFWDylRUtGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JendjDDkuEWu4SrqeNccVu+FdyDtlmhYuOpOgaCGv2s=;
 b=KxwxV6EdzQhfvbbJ/hU7XilppyhrOeSMF0pKWPsWm4hzqEZsPxlQP0b4lgj5DYMwSseB6V7is5hjLTxj0nf7XMHtyb3Nes8pLeduYOJ3JV6or67J1RoyPB8Vxb524lT2prijW291nJ3O5dVmfzfHT8OjQ52hzbe1uQZVtWXRNZc=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Luca
 Fancellu <Luca.Fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/6] arm/mpu: Find MPU region by range
Thread-Topic: [PATCH v3 1/6] arm/mpu: Find MPU region by range
Thread-Index: AQHb9V+06nIKaACf9UqCxt0klN23X7Qy3E8A
Date: Tue, 15 Jul 2025 08:36:30 +0000
Message-ID: <515DCD17-B77C-4931-9C67-2D890D5B5E00@arm.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <3da52fda916ad2487ede9b193143d06debdcfc88.1752565274.git.hari.limaye@arm.com>
 <03fc835d-7833-4c1f-b061-da22a4ab9b75@amd.com>
In-Reply-To: <03fc835d-7833-4c1f-b061-da22a4ab9b75@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|DB9PR08MB9441:EE_|DB5PEPF00014B9A:EE_|VI1PR08MB10298:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e6c856-35a3-4ce3-0455-08ddc37ac6b9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ZLuCAEPcfoEYGA6VaTpVu15dbpQmwnJzgHeo/BLES6+LCue+1jTAKEvIf9Ar?=
 =?us-ascii?Q?pvhG6MVP1lTd7hStA4zitVomV4IXCiTpTl7z6XwcSDvQgOjX5aL5wS+U2mu/?=
 =?us-ascii?Q?vdsLqBIJ2mw9teNB18ItjPCxR22biWrnR41cZDS4jAOGd0NsgdOJpjOc7ort?=
 =?us-ascii?Q?FXaDwbRWSZh3TazbDYVOr73vxPxMqqDp3RAn0riwV1JOYzDbc392E8sck9Gs?=
 =?us-ascii?Q?SeqjfA3Dj/xS0Lfi6WJMk2fKXaUM+dWFLaftSAAYbN4avtLS6n7960P4Gzza?=
 =?us-ascii?Q?Z4GLvyRkgx7kJ3yqerztSRcalR5wXnFkcdOT8G1VdvVpCVarLa7ES2elIhZn?=
 =?us-ascii?Q?fynoWcc9L+qP2ApvinjSLsDBzcHN4tgrKOfMTj9SEzc61Hq7hphryej8uS9J?=
 =?us-ascii?Q?8gmLT/n8rlRgu48GjjhLy9bHQcQ9xRjVmwi1oIpTHD8FeYbSJTZ96Ea/UHbO?=
 =?us-ascii?Q?s0ffVULNRM/jEr/KNfp95NbLBTZkAlopuOCNdJkaWRkfokt4pM88cRwNZsFN?=
 =?us-ascii?Q?NgNUPW6Zvx+lTVsdxkSklEmO7iLPgPDRfzgrnXywDob/R0pmC7TdyWfwoMyq?=
 =?us-ascii?Q?hoQSHC3Ilocja0u/wpnS+gIVAjjIuS9ZFlQEFt7BQpy4QpX56fanzyn635GG?=
 =?us-ascii?Q?gGVvq0OX3k5GYeeEllg3OxOMS7+SrJyfLazmFWJc55VYqmgDVpzs+IgsnaRD?=
 =?us-ascii?Q?tj4sEZpCkxAKMpivLKI7YWi4gjG22LXrh4mQFoM1h8VQyo5szIHrljg3H4zn?=
 =?us-ascii?Q?eBNaKtqYZ27eYFJ1GO8TAa3gaAkcUz8Qss0aanEzRXMJSFDfyZLOmnZWdI6h?=
 =?us-ascii?Q?kjMJSDne/uGoDTPFu6W9jnRmEo1rMaR/b/TeFLwakZ25shwlpH43P4QuD1Oa?=
 =?us-ascii?Q?gaX7fKThyQwfCnKBx9yFkOtb31tGxHhWhlZIKl9jRvZl4YcFMgy/i2vM7xeJ?=
 =?us-ascii?Q?KooJY17zaVY7eAGIenZMlGznajDrCes8wWx4fk1qoG7pH9enNFlC34SHlm6b?=
 =?us-ascii?Q?qidIDH30U1yD3U8ITcnJd/YrHEKFXg1b16txzQhW1IeKqSISmuQR0rU3HLuY?=
 =?us-ascii?Q?WAjshRbxZEK9Vqzz3z4yi7I7KezCG4mJRLLELDE/X9NWipD1uFri/ejAFNcu?=
 =?us-ascii?Q?T/ZIup5XpKxMwQPYuoiYvm/lB6QKioIHcWcZtnRIVVxeS9sBzwEQSjVAn7kj?=
 =?us-ascii?Q?K2nppJQ9thod8vviimoLEFz8/+YYeH59XSqF6LfHjFeStLOZejgMGTHMkISA?=
 =?us-ascii?Q?ZxUHMTTJAl1p0ra1YzUMGL1sBB64Mb4HNd3Teb/AEmQKe2X7OtIbCt4anAsp?=
 =?us-ascii?Q?yuWd4JD8NkjmaGkFSkcdLYkIuYhZyAPRUsDU5w3ORtmnOCnVgBa6M1tiuhmc?=
 =?us-ascii?Q?lK5QRAUAZngtxraAk8paJwOl/FGhEhXxKcABKcz7Rd2xVXvkPiETtwuKIybs?=
 =?us-ascii?Q?9QhXEbfiVyf/Zxd7n78u/0YiYNnN1iYm+qS7zO4caoe+lCRI0O0RMA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3528FBBC499294488AEC9FADE7C04BEA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9441
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	771a1d4d-17a3-41ec-f72f-08ddc37ab25f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4tWCJkVZh9HdkhQbAMWAR/zZ0pcB7Qw3gLMR43SP3FA7TquyTKmDOn2fgAXV?=
 =?us-ascii?Q?ZQae8lNGoToBLtIqy5p3nCE+bd30IB67EYiqKKKoVBNWvKtdP1fu9co1jAf6?=
 =?us-ascii?Q?QxN/A2m4uKhAvzxXfO2eweJxRcVAnl8fSrfsxq8lmbD1MjbDRtwA7Dp8W3IN?=
 =?us-ascii?Q?6uxBdMJQv/QAAzc7o04VWdjfiEKgThXu4yw543/uGPAKuNj+zSpX77XR5HLH?=
 =?us-ascii?Q?qYVB90Zq497Ohn9rE8ETzGhFqqGTdbvdtY1tTlod56Lf8QeEI4vnoN5Kg5Kn?=
 =?us-ascii?Q?ooLKSPPjUxHIeMmNcZL7cd1If7dusgMes0TaqVVSg1Ta4HDCzl1O/mZp+crL?=
 =?us-ascii?Q?aOEjaVXtioWvofiaT5mNrz87oxfjdvs/1Hubg3hOAnsnEPkD54zgv3KhC4Ds?=
 =?us-ascii?Q?EHDKBstr3zauFq7ikGIPfo6emWeSvbvINsgenvRglL9wzdF8IW7AAZrX9jD3?=
 =?us-ascii?Q?gHCCDANr7FDPdHFXNvsUSkYaocTUW4jGLfSDy7C1KEzS3DD7FmVg0GpFIkVa?=
 =?us-ascii?Q?aZuLyXKbOoPC/rmukZ1QgvnTmrvC5XcOQjMc2hrlUIZoMycCvE4RtXc+ESFn?=
 =?us-ascii?Q?6E94sBN4hdqmYy67lbWQeOP2B7KRD408dK9QcfEcOo/XeTlGP8iHazyAm6Iy?=
 =?us-ascii?Q?0zQeHu4qN/TEBRXZicWWFCJou8kDzUcINWkqCI0xmkKgvbt6v3QQCvY6NjVK?=
 =?us-ascii?Q?ibFZqDkPtAMUG0wnALJh3ZTWWeyoPzkCfm1NBH+gahZlOK8yyuYlXfnjFb/L?=
 =?us-ascii?Q?ehzgVuvkDPsfGiNDS5ZI9iy3KdpyB/Dou/6bBBfMHY6sMddcZSiNlQAGdeLc?=
 =?us-ascii?Q?UmSqKWFSD42iStH56etepha/JPQMWCzavIbNrhj4hH+aGTtsngYTVwyEE3kC?=
 =?us-ascii?Q?2HKC1XVm68wvjnHE3nnOJ7xVc19O8ElWolBSYYid0fQzpNvV3zDzVQEJjbri?=
 =?us-ascii?Q?SkmwXmGGsXPs/A7hnf+jb97xdj5bKJSVTneAhKmgmcHzsoYM7Cp1er/sRUMW?=
 =?us-ascii?Q?ofUWW9nc6fgpOASMZyC5fSsw1Em+Mc1Q+0rQV6OZpk74e6CHAjIKPLZlkioN?=
 =?us-ascii?Q?rPY4DP19Es+ubY3XRD8G6Dv2iO5xpUi91ttY+Yssxtvor7jL2cQ3ni0jUblz?=
 =?us-ascii?Q?ntaVpGZfAuUOPhwmtLUstH+Hen5p/oBbiTdGyOYZQX4SLXlHctaWsknFPfUK?=
 =?us-ascii?Q?XqiTSt+/tUo+Ove/HxKhhTjJE0THhDnRzaIaGHVhAryn1w/GJaR6LDIr3hC/?=
 =?us-ascii?Q?G9tqTgnqd8kWTPxQ6LEByEHRJBg+48plh/7SMOZZXYVPtrG6Sby+aAIKDRDf?=
 =?us-ascii?Q?SuNOnI7dPgP3O6ISXs9XBAppoB8vXX88EQBCmuJK2cqFiq3pBRuky0DdOqPl?=
 =?us-ascii?Q?eQy4kvTHKSzvPgiZs467aYvizKBYpSiZPhxAbEP8jabYdjM9WZu1X9ojmAUe?=
 =?us-ascii?Q?iJpe+sIVl0TGhLhZf51dBTvmGJNQnXcKpVhVAikyTn1LcPsajv4nejGgZyY1?=
 =?us-ascii?Q?FQ2MS0+X2/0b/pMCRfQUBktFik4Dhi0lcyJ/?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(14060799003)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 08:37:04.2943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e6c856-35a3-4ce3-0455-08ddc37ac6b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10298

Hi Michal,

>> +int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t bas=
e,
>> +                           paddr_t limit, uint8_t *index)
>> +{
>> +    ASSERT(index);
>> +    *index =3D INVALID_REGION_IDX;
>> +
>> +    /*
>> +     * The caller supplies a half-open interval [base, limit), i.e. lim=
it is the
>> +     * first byte *after* the region. Require limit strictly greater th=
an base,
>> +     * which is necessarily a non-empty region.
>> +     */
>> +    ASSERT(base < limit);
> Well, that does not guarantee a non-empty region.
> Consider passing [x, x+1). The assert will pass, even though the region i=
s empty.
>=20
> ~Michal
>=20

Apologies, I may well be missing something here! Please could you suggest a=
 code snippet to understand your expectation here / what you would prefer t=
he assert to be?

As I understand it, with a half-open interval [base, limit) as is passed to=
 this function, the size is  `limit - base` and so the region [x, x+1) will=
 have size 1. The empty region starting at the same address would be [x, x)=
. But perhaps I am making the off-by-one error here.

Many thanks,
Hari



