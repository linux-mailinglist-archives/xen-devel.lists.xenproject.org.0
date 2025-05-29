Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE107AC7B72
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 11:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999883.1380410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKZwO-0008Ld-Ui; Thu, 29 May 2025 09:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999883.1380410; Thu, 29 May 2025 09:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKZwO-0008Io-Ru; Thu, 29 May 2025 09:52:48 +0000
Received: by outflank-mailman (input) for mailman id 999883;
 Thu, 29 May 2025 09:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOFz=YN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uKZwN-0008Id-FB
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 09:52:47 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c201::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab709c91-3c72-11f0-a2ff-13f23c93f187;
 Thu, 29 May 2025 11:52:45 +0200 (CEST)
Received: from AM9P193CA0012.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::17)
 by AS8PR08MB9313.eurprd08.prod.outlook.com (2603:10a6:20b:5a4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 29 May
 2025 09:52:43 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::c0) by AM9P193CA0012.outlook.office365.com
 (2603:10a6:20b:21e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Thu,
 29 May 2025 09:52:43 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 29 May 2025 09:52:41 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 VI0PR08MB10655.eurprd08.prod.outlook.com (2603:10a6:800:209::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 09:52:09 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 09:52:09 +0000
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
X-Inumbo-ID: ab709c91-3c72-11f0-a2ff-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=phW8nnMLwwmmnsKZdWj5ZZy6SC5/ZciAQOwVEupb3do/pBlm8twgxJTBgsQ5siABaMhqRfC5F2MuRxOixlmIh3Ba54FbOIroxIgvSk1+Ixli88eUDXmZSj5k7DuMDtGpvkY0DWbTPgVYm5kkBRbPEUytzY4c5fsl0AegeIC1HAmurBw7Z443/AmwK8qQ/mt96CxGVhuH3KNXGb+X3LLoIS4Uv2bhXkxv7f2auGXy6oJWqPDCuP46NvtBdl3mUA2yd8DIADPrDD6y6lsj5+yk9hz5EadN7XOXndczIrhDMYpmISWxqTUAYdvjL9E/6sXgcOGBIuAHX1w8Tp0SZ4HhxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4Wqg/9BaQM7DwHOXybQRwdg93j8pb3GCJXjudbx8j8=;
 b=Bf5rVk5wxT+ZX3k5K47bw5S14DR7jB/dANA7NByLbnxxc7B5it5LeP+tVCtjDBjKYCmjOgbcUInCBeXjTmgcxf0zlk9dYfjYjm4vVKkAHKnwdecxgAr2ppYmHdyVMvEO8+9p9ineIH15HnNWAgLMICX9WaZgavEP58c827yFYszbG0/P6NNrfVK2csys98xVaHE4ikI5mAmJBoS8WqiVFIjPNZVucOIjFst8Kv4ENPALXwexdg2nvW0r9oRCR/jVMhRH9beRQIzF7UzWGC/Di9TA9nEWhru35qkLTsgZTmSzA6NuEFZuqNJ039uv+3qlW1Qk+2sI3LFTj1dqFX/04g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4Wqg/9BaQM7DwHOXybQRwdg93j8pb3GCJXjudbx8j8=;
 b=Y1kt8beJfYqGGZU0DoJoj9A49jx5acJFH5tfk/lv8Cim8fpZyf/qoH+oTe1ug2HCn0w2TgptaRAiqJ91hiys2LM9OhgZs5jz3/lmfZRzfKpP0t9L08xaE1PH9jlJxjhc+NFeRZT84DQO50quCQnrNhYP1VpBxK0IMxjwX4ejes8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKvB2UfDMjycxSEDZst/oPdo9BejQ7hv+Ar8XtlEUIAhwGG7118not03oVLjphoOouVJZCm4N4Bp2dsbpvbgxvxVCNw2fsubbZu5IjMMDOhdvtxy9E5MMLFuu/C9tYL+ROgfJXsfZa/Wp1PyWQDajbf5KyykOlFgdVQ+0hHvh6rt8H15ySKvegnCyK1JFgnbbR4Y1RwW+Ryu+Kbh+D4Ll9Ggamv9dNTZ8abimxq4TM2ofEcuWlSDKEsttJYQUXVXTx9858Tpenoke43wNU979LGcYbuGuNnp50HPFB9PKTVbWDoNwwhphP/I6NGlJAOtQ6oF5qCD4JhI3jS2KsRIHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4Wqg/9BaQM7DwHOXybQRwdg93j8pb3GCJXjudbx8j8=;
 b=TunxOZxe5w8oXKYwyk/bTWuC15BekOYd4z/IdtDFGzsBt7e49T4v0UwCS6OhjM+9ZINjxg3Wvazu5Au29VPtLnpkIUiCL94LUDwSnKIhYo/SjPU757XxuwHrx4Ci+360fvbQLSKll0S7+eg2bDff5OgSENZBNauiXzCAb5xsU+cwJwFPXt8BBzBkpcHDcia96EhgCGnhO79fMwpkRU8CKF4VkwqI0JmFdFc2C7wNZI+75LNYuEzHKxEfW0CDhKG31QWnQAUh48zdocKonoq29Etzq09YtR0BKzF62B7P6TMc1j4kf7X+BAHyt0Jc18FcLPk7T9K8Z8f6MaM7GUd1HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4Wqg/9BaQM7DwHOXybQRwdg93j8pb3GCJXjudbx8j8=;
 b=Y1kt8beJfYqGGZU0DoJoj9A49jx5acJFH5tfk/lv8Cim8fpZyf/qoH+oTe1ug2HCn0w2TgptaRAiqJ91hiys2LM9OhgZs5jz3/lmfZRzfKpP0t9L08xaE1PH9jlJxjhc+NFeRZT84DQO50quCQnrNhYP1VpBxK0IMxjwX4ejes8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 3/6] arm/mpu: Provide and populate MPU C data
 structures
Thread-Topic: [PATCH v6 3/6] arm/mpu: Provide and populate MPU C data
 structures
Thread-Index: AQHby6+RibcK1nTrN0C974oHFjnUh7PpZYGAgAABq4A=
Date: Thu, 29 May 2025 09:52:09 +0000
Message-ID: <4546F0C7-28B8-41F9-9442-0CC2E4F42B78@arm.com>
References: <20250523065406.3795420-1-luca.fancellu@arm.com>
 <20250523065406.3795420-4-luca.fancellu@arm.com>
 <bcd974cd-8513-4069-82de-c553da3175f5@xen.org>
In-Reply-To: <bcd974cd-8513-4069-82de-c553da3175f5@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|VI0PR08MB10655:EE_|AMS0EPF000001AB:EE_|AS8PR08MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 09460527-9931-4e19-b375-08dd9e968ddd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?dRuS/gYKRH8v2MphLwjMlIYLj/T8zmLSZmKXhfMQ1nhirIhi9kVfPUD4IF3a?=
 =?us-ascii?Q?mGvcXzISyRzBko3GEyrVhDuSoeZnmeeobKMz69xZ30B4HstH7tR+YoF0pMZm?=
 =?us-ascii?Q?Cu2zh/IzFk9Gr4v0uVc7Ieuh1X0zh2c26EzfQRArmPjnG2eg6qfKXuXpsW9o?=
 =?us-ascii?Q?HwSSu2MVMYxGulb/uS0KuW3+zPHNJuEAbiWp/VDstEGhn/JTehYSVQqxgniM?=
 =?us-ascii?Q?r+Pkhy1z0rqw1GlJiZ+pxmasC/zTSU5ygJsL1OuG2bub5VCEndTay2M2phJ0?=
 =?us-ascii?Q?DzRBDfJ+a3G03iAdeYU4qsAVqQqcQxRlaAeZfMOQW6wrh+8iBKJxu21xsQTX?=
 =?us-ascii?Q?FLdj/0K34t0zHF2r6ScC0wNT17ycB0Sm2U3sFmZ7uTfR4XqYPoFcz/IK8H9P?=
 =?us-ascii?Q?fqMPZrga3nL/JXvPCJpWU50uEvR7ynys2zY5la47CDYpyjT0pzhPvXKRantN?=
 =?us-ascii?Q?q7yBHjsr6gm9mAtrybnA8ytAGmYF0hJyz9AExDH+q1QtegiyedZuB19x1mSK?=
 =?us-ascii?Q?qlzN9dSOyTUd0QLGAJoysaaPMIXZygEgchL4OuQX+bgUlcHt39KFsfY1RjTE?=
 =?us-ascii?Q?OAxBzxYQzxmU3L0gegzC6ke1DLrtevTDlPk8Ha39X4PnpO9nRGgV+EVWC8vJ?=
 =?us-ascii?Q?/IXL6pvCfbKEQszDT9yuxQ/bqkJNN9uW1LfWvavzBRUaLPdhsc5f32MZ+VaK?=
 =?us-ascii?Q?SV430mLCl0WdXZfIRLINK+k3M8v6Z1Kf0GDavY1rZqZJEXE0IsGwZ0brxhyU?=
 =?us-ascii?Q?W/ZBZDTpApPsdR0HugGaqnqeCJK/qdoGohA6D9pogh0TGlNO+2DjiTtFfbYX?=
 =?us-ascii?Q?wMa3GfzXwd+voApR5SeM/x5Hwdzmok/lHSBgKGqffk3WwQQOilnD3CiMASXA?=
 =?us-ascii?Q?IdZTK/E/WxMIVaEceKBZnOSaemY7wcQjhRHepEJ1bH8ytTmOwYCoK/BzTNSJ?=
 =?us-ascii?Q?KC5NE0iP54MRFUmMSI6zk6pFoukJCrNCytpHs76cvUQdMpkZooKzNqkOPOj/?=
 =?us-ascii?Q?7FIcX4V23a9ZnBcqv3bELfQyZ8SKF40nfjbZBJ7Qm4i53FG9zIAYQQXmLVrZ?=
 =?us-ascii?Q?cDVu1yNnYXy1IUw7VShXEO79QMajIWGaKnXZLt2dXqxXkjXZs+0r4FFHz13I?=
 =?us-ascii?Q?elyzkXEdiiPmLKdUiQ1TjvF4SfoM9tJ9fGdCr5JI75zcY77xwjwNW70j8PAU?=
 =?us-ascii?Q?Bvd/Hi0OykN9M06fgDGFh6z6ilPauAzrttJS9qg4m8gpqOl5Ty+iHlvCUVYa?=
 =?us-ascii?Q?ayKMGfVWl+1bQzChp/KOrgYNJkwZW9X0XLMTtjOoSj6pDgLPpr+LijEcEmj5?=
 =?us-ascii?Q?dkOlRDXwUvkrdo1w1KDTHTlRp5ZWdh1XPMas3fdGLXOeUM/Le8WwKF5TkT4H?=
 =?us-ascii?Q?3sbeLd8x3HshYkpB4EuGbHEkLspabzolNbe1pSlHuCZxv/LOclIi//IIWTG4?=
 =?us-ascii?Q?duR8HV/YJlDbePUmm7dLSzfWiLjA2SUk9EIS6qmxjezIh0roloLh9oNb7Kuk?=
 =?us-ascii?Q?/P+GqGFPYLOvLys=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0F3EF0DD168EA84988F9AEA3F867B8D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10655
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31914c95-a6fb-4a28-7603-08dd9e967a80
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vcbQWpM4+xDjGisOPTop8BpkDaf0zfrbRiLd9VLh5JsdAYMf130zmuJ0wtIy?=
 =?us-ascii?Q?DZlAGfpIm/vph+EYZyFBhw/hOQcELGAU++tcsG4KAwq8Vyxh+RwLhvwSqmeM?=
 =?us-ascii?Q?iOQ77LZwzp7z0YTPB4l9YZyGGfZU2kBNLCIWx3NbZGaBdzklQ1L2f/aJVl/I?=
 =?us-ascii?Q?INTXZaqB0aWzAUq6I57g1T8cLbVhNh42U2TA8bDQM338rTzroIU5uUhTfxot?=
 =?us-ascii?Q?3qARhSoAB0aGczY6CWHEFpdWI4IbdtLtKOunbeA1ITj3va8fbkWe2xizvbWJ?=
 =?us-ascii?Q?+C4LbMNZ+nFiwnxYqgLB83Xm8jUYZvWoBVGMUxR7M1IxX/84zUw03FUDcUN4?=
 =?us-ascii?Q?oLfdd/xXYlC+h+o7rkn7mVzQQF4MN9ssBXCtHpKs2IZN7ViXZdaNSiw03xa3?=
 =?us-ascii?Q?va6cXW9sb3VKpWBRAwrK0KFcv7wNc/xYgL1y+KAvECTIMDlv04BQdK8yt3GT?=
 =?us-ascii?Q?ZuG19vWVSNUG5rrsCLhhO934bTlVVklzyaBDIDolPBcsb/LKc6efe/Rxb809?=
 =?us-ascii?Q?T9BityzNux4sTsKa+6XXBCNXvsqvkZi54UG1gU8hLJzCBLa46eFIKrODhKEn?=
 =?us-ascii?Q?zd2yTav/1f/8ktSPw35noR5kbVe+3s3XChLRbabV4YKepWSviX+zvmBMB3OE?=
 =?us-ascii?Q?ME2xLbIdDPxRlPVXrcQO0p1egaYQhLGK+A8D/ZNR98aqFjh1sjF3uf+Rm7Oa?=
 =?us-ascii?Q?yhYITPUF4dyy3LZVBcUvUI4xqSFzmlAHcOa9T18ECERoR6LWpx1oeO/qPKR6?=
 =?us-ascii?Q?7OFEhB0fk9Cdym0KNSDXg+4F8rV8R1MuAagB08U6DhTVn1fHqk2nZ4oNNV/W?=
 =?us-ascii?Q?CIemYvOeh31Wk1NOjwVzlNWHiEyF48w1uGsagOx9+1MSoTu8yfUHZdHGqpK4?=
 =?us-ascii?Q?wwKWJuy35WuFXv7m2Iu3DYLeUNNWVkeP2JAi5et8Z0rs4bckP88TtC1PemzG?=
 =?us-ascii?Q?j18A6lNEdlgNkGwGTe85/95ofCKvtQ8OzaGeNOUimZJj8bqalXu2gu2ISavC?=
 =?us-ascii?Q?DSUJW+flinYkifqXJrTyIDRkt0lNk+DJMK2piusoOnvLm7XqepGEEJgQ5Xe7?=
 =?us-ascii?Q?7e9k2f0BvPx0IE1XZLuGuiirG/YRMkeGv9scmL/KjM+WAKh/GbE+ikThEqb5?=
 =?us-ascii?Q?lDvw0VZEpkBxRkFiQnJBahTuHsdcVypSi2F3EfN6wqWftpzgQgMajLEo8voL?=
 =?us-ascii?Q?swh+OIg4nlwP/vUc6PcA+tKbyu7rrZyjgERVq2Gq5tdqwHvXwzAsRjx3LtAt?=
 =?us-ascii?Q?+Amuzcvz8K3bNsCthmawAcIRQr9m3B6XmCAg6Zna4eHwvniE9oDLzCkF8H5V?=
 =?us-ascii?Q?nV8/dD1YP5LNEC7zIev3OJ0/27KEArCP3itjGWBcjToudskPeK/ubDYHfRDF?=
 =?us-ascii?Q?ZMlEkPIiimKSmpQTmA7+Tl+SFduae7uUvOO0s6V3genGTIb/8it6fGmfQpjg?=
 =?us-ascii?Q?w7K0TZIyXJ30gL+hVsVBw+pfzLJ2v3s1pJkfBroRKrqY8lNgqeBTJA8EwT/9?=
 =?us-ascii?Q?fr3kuuBuE2freu12wFryt48I2lQdwduO9FFw?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 09:52:41.7996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09460527-9931-4e19-b375-08dd9e968ddd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9313

Hi Julien,

> On 29 May 2025, at 10:45, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 23/05/2025 07:54, Luca Fancellu wrote:
>>  /*
>>   * Macro to prepare and set a EL2 MPU memory region.
>>   * We will also create an according MPU memory region entry, which
>> @@ -59,6 +79,24 @@
>>      dsb   sy
>>      isb
>>  +    /* Load pair into xen_mpumap and invalidate cache */
>=20
> AFAICT, you don't invalidate the cache below. What did I miss?

oh right I forgot to update this comment, Should I respin the serie or coul=
d it be addressed
on commit?

I would amend the comment as:
/* Load pair into xen_mpumap */

Cheers,
Luca


