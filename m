Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI5UNTntjmk5GAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:22:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7CB134662
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230378.1535864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpN1-00061G-MR; Fri, 13 Feb 2026 09:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230378.1535864; Fri, 13 Feb 2026 09:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpN1-0005zI-If; Fri, 13 Feb 2026 09:21:51 +0000
Received: by outflank-mailman (input) for mailman id 1230378;
 Fri, 13 Feb 2026 09:21:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jz9v=AR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vqpMz-0005Sy-Kl
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 09:21:49 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69ec65e6-08bd-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 10:21:44 +0100 (CET)
Received: from DB8P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::29)
 by PA6PR08MB10489.eurprd08.prod.outlook.com (2603:10a6:102:3d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 09:21:39 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::8c) by DB8P191CA0019.outlook.office365.com
 (2603:10a6:10:130::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 09:21:17 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 13 Feb 2026 09:21:39 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PA6PR08MB10781.eurprd08.prod.outlook.com (2603:10a6:102:3d5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 09:20:32 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 09:20:32 +0000
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
X-Inumbo-ID: 69ec65e6-08bd-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xUVCZev7D0pETKsy+JqgYATwnH14RIBEnXPHi66hcKmKiYxdPIIsl9t3Z96WBeeIeNZxcQuOOpBiZj1+fboPflW8U6wKczluCzwXs9zSOZxyH4NSHl+ThmjHROYET9d3z0YsWN7egeli29ufQlcEMKYkrmEN5tY2ml7F3mphGisKXJbcC+ubjleG7jaXJu31w7Z8VchTvHfP7Lc8g34x++SXd5nNyp3Gtv88m0xBylSydRn1/2iTulGJfFceJZLGukZn6iBl8yLeryv6TngIbCDNP/iZ7ORqY/3I161RzoK5JiwxAaA1spOJwiTQpJ+jiAODG1U/dwRQLovhZ+M90g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRyEHhgXPdx/hA96R8WguBZRhlnloMR+3gizxrMDMOo=;
 b=xXcMPXWaYvAnzfShtMl15QBRFfE6CShXdfegb88VmZpNSfGFTZW2roWdbPjkg4ZTe5xWs5TAahPz9ZRPleMyDcVd27j/pUEOgrphouoJtrEQA5bMUyDaREpQfK/6mrNoEuZKLkPWh01kLUTcei3FlVO+C/IWJkkrDqno2KilE1M/zse26tm6dOZb+qt6yzpaKoJPDsj73YqUpNNZ+BxPRbUue+AGgq3DsA/T0bcF4WPoYSogHRneQLv/MkJaLjDhqIjd8URxWBktZge5/zvC6+ctJBHDMnNvPFbi8Xxq8XWtRjKerGyS9YQlZuJcxs/iyhMabYS1m+z72BsHhMBIZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRyEHhgXPdx/hA96R8WguBZRhlnloMR+3gizxrMDMOo=;
 b=DmzI0uMfcvgD10eMD/HSZqID1KdCsWsjdlpnEBtC0JeJr+VLFya5A/qreuLaRTGoB4mf2YIvJWbphyyPQBgdMd3YDu4vQE4kT8JTAHPAog4Yizdc6GuX4hD9iezB1qex6AhMpypZXsomx0008WeANghJtx0caxnruhFkRHcCyWY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmnF0R5H02ZIYrtYekH8G3Tb5Ln3+Aqts7tJz5+KflCbuisMkuPdlue+K5Q1I+4SZqoypKuG64G6rg6BNbXwW2Eo5pt6entGn6fw1zfTiZ4uoVMWfHGBQF0hOq7j31q2kMHoR17pbLptHImgv1xhurFHhn2vEmuG//yNWaOaZWXoPERr3YsoB2RA7CDGhrR1zO6ggBQZVgY1FV2rHlki1vGmq8eBFEGktv5lGYxmxVTw/GFL80FiaLB02Q+TvsMAsxteckSi3vppekUcUbkQtZ/ebPAx9Qfk8Ib0/8+3cw6R/X75+lGkSLMDzYuDCV2eaajBQaBq4KpshpVrdArCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRyEHhgXPdx/hA96R8WguBZRhlnloMR+3gizxrMDMOo=;
 b=cgg0Gr8KcrOLVBTBp67SeJnqSlvyfJQkkSiIJpZJ0Q/e9jB2YCzpNumMq+b47eCS4LqAUWoe90/k3jPo/1lNIJFwuGut+usOvVX5gr+0dvzOr0Df6rdSRFdLsJKHw8QH44+40IEmCrpEnRACotcveXdqGZVCA9HdVh4kFFMLpDXK1rMysTyfYHjbee9WNc/IQaiptqt1S7GY7ebXM55yk4Lka1QPtUPc6ZdJltJAi8xpVhWbzFvAMffkWMqnZfmCEYqxRzmG/JmLSKTJe+ZiAgHcSrsw9oUv2SUu12WaSl+4JRd/c5Tc8qxgulAT8Y+NTzSWTuKB7nchCJAznjtnAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRyEHhgXPdx/hA96R8WguBZRhlnloMR+3gizxrMDMOo=;
 b=DmzI0uMfcvgD10eMD/HSZqID1KdCsWsjdlpnEBtC0JeJr+VLFya5A/qreuLaRTGoB4mf2YIvJWbphyyPQBgdMd3YDu4vQE4kT8JTAHPAog4Yizdc6GuX4hD9iezB1qex6AhMpypZXsomx0008WeANghJtx0caxnruhFkRHcCyWY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Halder, Ayan Kumar" <ayankuma@amd.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree property
 for domains
Thread-Topic: [PATCH 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Index: AQHcnEmH5gKbUmHbj02fOzKC30SgIrWAW0iA
Date: Fri, 13 Feb 2026 09:20:32 +0000
Message-ID: <585C8F54-ED56-49CF-A77C-895016182673@arm.com>
References: <20260206090155.68466-1-harry.ramsey@arm.com>
 <20260206090155.68466-3-harry.ramsey@arm.com>
 <a5318e5e-3082-4cd4-96cb-98d8dc27ae65@amd.com>
In-Reply-To: <a5318e5e-3082-4cd4-96cb-98d8dc27ae65@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PA6PR08MB10781:EE_|DB1PEPF00039231:EE_|PA6PR08MB10489:EE_
X-MS-Office365-Filtering-Correlation-Id: fd74df21-0f2d-41cb-2346-08de6ae14b17
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?zv5LLIvclP/CSK64qGCL9TvEN5cdXQHduxQ/g4fX3qCCuv0gk5qHnoPKQ0I/?=
 =?us-ascii?Q?EGyEUrbTU9Wop0Pp6HuWzUw7PvtyMROpGpEk5FgN4aGrEfZCOTTm6Yq57UGp?=
 =?us-ascii?Q?fKpvHFTWCIUZShI97cHJpX2V4r3gumOk7qxE/z9f15EGav8sWS9OqHbtMPkc?=
 =?us-ascii?Q?q5ETJjaMWqi+awqJflCMJI/rVSeWdQb4A+9QxQGlNL6TMmgpO2UdUGCQw0j0?=
 =?us-ascii?Q?ffKu/KyiZo25/cv8SKS67Mu3m+TTsRD6cwRov5jyhKkR3alPz4l1NXSOE2gC?=
 =?us-ascii?Q?p/35b3+uHRomyRuMvCG7IIRusC0qPFlEtKdDzxaevGY0tTj+fAU2oYO2bvr7?=
 =?us-ascii?Q?a0uI14H+IzNm0jxqGMZaM1A/uH/4SHL5at3bwOd7phyfAbkXk0WAldCe56/d?=
 =?us-ascii?Q?YHp66Wz2HPRsiu+NkNkRJEHbSOLGhcRKMEPWzpoWt6WvsCePC9X/svxF5g6Z?=
 =?us-ascii?Q?Jh1yckODqBc7SDMlfz2em1B7P6lCaAHJOnARH4RbpvJiiyVefWCfGUGBbLjY?=
 =?us-ascii?Q?SwW+8PDpKWZiOkY4Q/m+q/3yk3+uoiK545egyTQyiwNgto0WO3vcWwKXVH+I?=
 =?us-ascii?Q?kHMs6O6Yu0E5ts9IlqNyf+xp+DWJQTXdfeOddPFwzO36OTlYjCGDV+Ly0kNX?=
 =?us-ascii?Q?u3g445GFkO821PUC1dcy8s+p2IgJvjpHn9+mDTAC636cBb/0katlSnlOG2G7?=
 =?us-ascii?Q?DOczYR14DEHLChEn6TQKsSIIwFkNcn9eZ1U3s2vA4JLV29QXOJy3/6LplN1P?=
 =?us-ascii?Q?tln0EHxShO1YkgREtmQd/pIkxS2tt4VIX7+U12fZ/qmWXsOIFTj0BY0FMjQP?=
 =?us-ascii?Q?YgOB7bWGslohn1bsWy+wYOSwoU+uIPzT80w4YRUcpTqNy/e87FRJ8USo5C2n?=
 =?us-ascii?Q?Xh0YTt2kqdi2IWpgThKXdmTC3UXB4Fp9BKU2BtzjS14oMtJdHG6fTMeb4RGX?=
 =?us-ascii?Q?V0Hxmydo3cmbnZhkyINJLWEy2Vz5vUBdvTuo4fKWbCpFYCoHejhCuoKcxi6G?=
 =?us-ascii?Q?h6u6UPcC97u2dOCgMohhQXfv3zFfGEFzn1rWno9cdM+Nq7gXFTGwcuHz8MRY?=
 =?us-ascii?Q?l7wFv91PRv83AM9J4BP5YaVyZBKczqICGjgx4o3hP4GZnLHthFIPcapO24A8?=
 =?us-ascii?Q?k4gFNT+fzlQKCL+35p759qZACmAuGKUzTHJvW86u2hvTB50ikd6RcyurBns8?=
 =?us-ascii?Q?iwER/hiTN8IHpl7bItzpgE28ThhDxqBwifiRvb/XzvjYskF3M/4OfDMyk890?=
 =?us-ascii?Q?CLegPF+OgiMDG9G70ScK9kkz/ZX6PqnqUH98wkLRCJgwbhzkEzwgz6XdrTij?=
 =?us-ascii?Q?03JTFb6F6EevNlsI6XFhFhvpzSyzaCN67f1SIA+i343OdXYZFKD+qX/Xi0v9?=
 =?us-ascii?Q?F+sb22m/FDatrJFZGNS22N51JLtMvWGcACb2TzYwD8rt1FwcAV8MNjIwzotE?=
 =?us-ascii?Q?SrlOI1ioThENwCHinNP8Y2NyaxdZQscjU4/DO8/6gc+oYgKMaJxNjzk0qA70?=
 =?us-ascii?Q?cD3FEuj8hxlBQIPHquzuJD0Kc5ja9zIHFREIcGJoNWRQJyxxXdSNUhbaJ+pX?=
 =?us-ascii?Q?iaMr4sVLNYe7WNrCl/j5ZHK6uyJOP3FpvovFXILYk3mfcHr+6Hvr9rMFeVF6?=
 =?us-ascii?Q?e7aozBQwo/nR8WDJCI6SNOM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <88A1A4466A62BD4A9488FBA1253732D2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c5f7f99c-b90e-4a0f-9490-08de6ae1230a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|376014|35042699022|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?twmp00vabLCFxzSKDBYV0W0mxPfPgzPMdLVzPrBUKAsCX5WUES54XqhlkEBx?=
 =?us-ascii?Q?avRF95dYA/rpEKN09E3F7OHBotK4wGy/LUjR7Z/g8WRY2ICOQ2y6wvj9VqEQ?=
 =?us-ascii?Q?462sNH4I0vda8ARo2wmpZ1PmDm38+VbkMp8CX5EYo4oh/srZSX3B3Ypeex/6?=
 =?us-ascii?Q?DdJxxg9DHliA6QivrR5CB9M4h3055CZ0hr9rA9ITEGqcrB9XTakgFTkWwqV1?=
 =?us-ascii?Q?LvAXd/FqBjGK+t5fthX54WvqJCzs/FOoMxprELNFcUPBXOjZ/SNPLAH2v5Rs?=
 =?us-ascii?Q?Kct7ji8MaK3EHmNJlQJfQwhXDop9RoPOKkOCGnJ+r3lRKB7mm2FjLpfn8JBP?=
 =?us-ascii?Q?+Vje6VXYJMSJIIWg4mrcZDiRtRutzwZOxSXvBU+S4SuPDInIY55wfR/u4WFI?=
 =?us-ascii?Q?p0y2tsGrb1MawfFrt9mCvskwDu1Jn0GiTgGuFINksTOlepL9rrMj1l2JZC82?=
 =?us-ascii?Q?99PdwNZTgzcNfrPqd+HzG0LwOQr0/qO+vPUzmHN6LdPyEMXuSU/giYw7nMCI?=
 =?us-ascii?Q?1+/rEWwALRm1+al5ib+2CzZtKrFIOwawJYhWSvoM/rSr0RAfUsTYss2D34g2?=
 =?us-ascii?Q?qwHMZ3u9in63xfkhuuuewNFKfYTTYAayYqViGti8Q+IH9qBN4uEteJFDSkuK?=
 =?us-ascii?Q?GFJThxzZG/DyO7Iixi/gpeKEi3qqasdVu2dzTXuwgUEzWO6SQT/3CSNbYWDE?=
 =?us-ascii?Q?UybgNnYzJ/tp4Kpb5jfuvzDerJzSxgGXRk7+LbgUI7E4bS1n2u8T5voqmzWM?=
 =?us-ascii?Q?Kj+mxPHGPKnqSPjQhzDio2IJ/aZcDmYcnHSGPBAOmAolumN7mXXviV69Zn7g?=
 =?us-ascii?Q?L7FTfwYwsbmrZ5+40hI6gAFk092TKWBKtDzYrykJKC19od+kwKT53Y7ekLuD?=
 =?us-ascii?Q?Fm7Jb9gsz+Xcx5cVsNIUQxbpKqmyavWUVH8bP3OluJQeQkFflRXvNz6QqmIC?=
 =?us-ascii?Q?z6rlhyERJYuhkmxbZnOdfvNLfPkvi4INOyEOC8OB5nlb4o4+mpQq9zY9seLT?=
 =?us-ascii?Q?J5C3k0tcs+ESyFoeDheYIYc0Yu2La+Cr9XoIyJFFH2+d1SkqrzaQRfmJL7o5?=
 =?us-ascii?Q?UJpLurz1EOnS4jq1TIIfFwCvVx9nf+ZZkI1H6SWpKZT3KtR+TgAiH76uQ6oi?=
 =?us-ascii?Q?eL+WkhPD/+yu3w7SJkJJn3boNwMgN4KRLzas8lO2n2LjkFyUlwOAVhC2YyUz?=
 =?us-ascii?Q?laF1BFh+sh8gN5Ymme1ddnrsyoHDWhLZK5hVM91g4HdDGXyGr1B7Gvkg4gup?=
 =?us-ascii?Q?JOXZ19KizG9xzpI9AVw2qQI8/TiKxKoeAKm5H6v7iz9JWJfPQE1tzCtjDiMx?=
 =?us-ascii?Q?+gCUoyZ2Ex0kqHpyiVbyTfCMK3xYGuI4WeRC1Qf/ucSE6hpoDVNHYko2FN0d?=
 =?us-ascii?Q?dEcvwd84taqFnJIlZzqepGJlbL+NtShPVDwEFfBbQA0iueIGXAtyD9Z5Cq5Q?=
 =?us-ascii?Q?OVGZkLQbt5ezVMLxl+woaJ6DpP4GFlreZCW9JMpq/C3pdL9NhUqonr9T2r9i?=
 =?us-ascii?Q?zS9vZCQJ5LvyEuFyoF5NuLWAlbUVQhXVBnasPNgbuaLgyPj0idUyjuxTTalJ?=
 =?us-ascii?Q?uDszb11xpW7Z6NQR9pqoPMUF4WJGx6Hak7soVuqPTAVxGbwFIt2jTfwQUCSI?=
 =?us-ascii?Q?cbgUIP7yBeE8mEWvOfUlGngouZOD0wAKL05iTzt4YoKHW778yIXw/xaK8J6J?=
 =?us-ascii?Q?mxjvew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(35042699022)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ziXe6TQXeOtq11FYvCZThdABBZzcFmiCgg57utx/Gq1CEBrBnsb3FTThnzJzrncF+qMQyppcAeS+gZuW7qTOZgGuR7AV+EtKjknBhjY5x7euvzwhEdoYJk47UfNaIegRk8xmG4WgR1rdY9FetNT4mU73piHL+4PIsd9BzNkCksZhbGEdoFjny9QnyKMZoIUgtO1KrfAO9VOmyLHWCqlSUvZSrwbYg0neW9GS2WlXIkwJpyZNfulBYR9qbhg1oLZvtH9m5mHATrjhCcMBGuYe2wFhCYYBC5XCk2Zi1fX3yGXbO1VpCEIczkS6eeDN4KJYhELQqHnC3fAZPGg/Y9AKJsrkwJ1SKRi/yC919KgfWN1LZH65Mj8V8sHnurgVYg/PgiWWsohfaflTIrXN4yBXxc0BF2Ed0qYyW/9tNsWY0hsue7F+5axFZmj0gY0x5HYA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 09:21:39.2161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd74df21-0f2d-41cb-2346-08de6ae14b17
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10489
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ayankuma@amd.com,m:Harry.Ramsey@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 4F7CB134662
X-Rspamd-Action: no action

Hi Ayan,

>=20
> Further if we can set `v8r_el1_msa =3D mmu` by default for everyone (Armv=
8-A, Armv8-R) , then we can reduce further if-def.
>=20

This was Michal suggestion to have mpu by default, so I would wait for his =
reply before proceeding further on this.

Cheers,
Luca


