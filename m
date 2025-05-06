Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02561AAC46C
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 14:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977170.1364225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCHc3-000808-Iv; Tue, 06 May 2025 12:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977170.1364225; Tue, 06 May 2025 12:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCHc3-0007xv-Fy; Tue, 06 May 2025 12:41:31 +0000
Received: by outflank-mailman (input) for mailman id 977170;
 Tue, 06 May 2025 12:41:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+p1E=XW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uCHc2-0007xp-4Q
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 12:41:30 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c201::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e706f72-2a77-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 14:41:29 +0200 (CEST)
Received: from AS4P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::11)
 by AS8PR08MB9839.eurprd08.prod.outlook.com (2603:10a6:20b:614::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Tue, 6 May
 2025 12:41:26 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::ad) by AS4P190CA0018.outlook.office365.com
 (2603:10a6:20b:5d0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 12:41:26 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 12:41:25 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 GV1PR08MB7915.eurprd08.prod.outlook.com (2603:10a6:150:8d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.31; Tue, 6 May 2025 12:40:41 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 12:40:41 +0000
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
X-Inumbo-ID: 6e706f72-2a77-11f0-9eb4-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jFzI+PTumRQIb/e1xLLidEUqFziLDR+E1B3LjE5ccGfuPp38EGTN98pLBze5BiAwBNhHojSNm30cRosR7MhKBSvs77D2Gr7QAU+uQw/6EVyAvI5DGsAz8TPcnt5g69TjcAWBaz8iicjqJauDVsbIbDFi/Ua6YC96lDoust3xYAfme4vSfyx02plRZIazUkIvfpYcDf8R6CSQVMmZFRsgztj/3JzShTM3utBPWN2qA866UwIt6P251/p6m8cjE9N5ORnd3Qvpeori004F+cC2sApGPi3F86uSUIPRkQldHpRbdB+kx4OozW8l3AhvuevxqGGYipJely9jewlsSrjMOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqxA7DL/8hKb3eyzF6bkdo41KMSU0BUos4XM8bLohQw=;
 b=Qsow8XggffT2ZiCtNbCYNZ/QBv9pF5r4Mdj+aqChzPWvnqng6SkgWfkzbldNSfoDJisgsaz3+Ku1n71Sz+4ymcRw2Il4uoU1Bw9eVzXzhJUBfwa7cdrSL919pKkhpjvA+VvFjMNgVXtknemH+LtugqYuuddcBQiGfhT6iRWJWq+eb8GCm1VYb+qG/zJqMCllEJ0AUDHZLjkXMTGSeXepkk4p03A9IJWfC/YXazArn8cLCNf9Svj69h6yB0a0icI6VmEPbyXmatLjp9llqAjmgiwTLzvyoLd4QAzdfYzyRs8QM+TY6RM2DwPhVlWkfIm3EDXB9puAbwdd4RkczowAXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqxA7DL/8hKb3eyzF6bkdo41KMSU0BUos4XM8bLohQw=;
 b=M3vqSTBfewHRyw+HDNfBydfT/9mHT3SwZmTe7SB+Q+O2KwuXgKQrgaG86y/ZnmQR4185+WwxLnxIj/i59wSnT5S/J2wMpigsM5KL6gJhzPCjzvOlzNo1NYGihC0csKCceMGHJRLlF0vdvLlQJWm2mkvvIYNjqv+QvWIH31nzCyQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmtQlWW5R3TkbD0pd3TmPPj8eK/QGuKYeTAx+olVFX1IIeO8YBvhTL5M291ZBOLb037FsQA6vIu2A8X8yCDU+CNlWBWBPPyNIZ+tV7ZStIXIAsmfXS9r2N/6V/X9/8WfKVhXxujwhdAMVVchKAdwo47CsiSTzQfvV97C0S3O6BkbsECUsJTlN5Mbuz2Y4+EL1Ni9GALOvLLhkSN4/e5rHoy5cGoX2Mgdy0CWKNtDrS1OsbRNRr8QktcVGr6XD1jYsTliGUejg4bPnzCNMINbvRZ9ojq7rTwQVjqrCJduePY+nAXhmBi2IhJU81J0OYGKamNlxoLZ29xM7/L7rEz0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqxA7DL/8hKb3eyzF6bkdo41KMSU0BUos4XM8bLohQw=;
 b=f7wH1iNSY6Teb7XKnt8Z/ZAzNGT2g9XCFjcpJWKQVNJNVOu0pMdj14t07BOSi9Sm/AzWLaaggCEHIEutzP3MJS+7pl/PfVXG55L7i4jpZGSspJDnK5YOjB8ibCCIziMTc5JbZhCTEBitqft3Bxu2yYH7cNkNfbNYva5LXCxp0SVWTu4Uef8zaih+QvCfok7hH+YsvxCsYwhwA3zufg3l3370+1wgT1WsOmJiJ74Lr2iWJTQEXD3X24bt+MfoNTRkvpUOvJHPBHZm2jVz7y50e/8KDxWASmw+zlnUe5KLoYzmFi6jqn6O3dvlzJbCrMIdp7SiXuhv+wrEA2v/AoZ0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqxA7DL/8hKb3eyzF6bkdo41KMSU0BUos4XM8bLohQw=;
 b=M3vqSTBfewHRyw+HDNfBydfT/9mHT3SwZmTe7SB+Q+O2KwuXgKQrgaG86y/ZnmQR4185+WwxLnxIj/i59wSnT5S/J2wMpigsM5KL6gJhzPCjzvOlzNo1NYGihC0csKCceMGHJRLlF0vdvLlQJWm2mkvvIYNjqv+QvWIH31nzCyQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: Re: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on Armv8-R
Thread-Topic: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on
 Armv8-R
Thread-Index: AQHbuRpmN9lJogKQoUiVWa6WakCsQrPFhjEAgAALLQCAAAF7AIAAAvWA
Date: Tue, 6 May 2025 12:40:41 +0000
Message-ID: <2FBFEDB5-C33D-4262-8D1D-C3B3174057DE@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-2-luca.fancellu@arm.com>
 <a96a2e51-7b00-45a3-9f75-0a062c8defd8@xen.org>
 <FB60F408-6ECE-4396-BAE4-E9D70F9E9DA6@arm.com>
 <df5d09ae-ba1f-43c5-8d96-fd363597e799@xen.org>
In-Reply-To: <df5d09ae-ba1f-43c5-8d96-fd363597e799@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|GV1PR08MB7915:EE_|AMS0EPF000001A4:EE_|AS8PR08MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ccf2d3a-de4e-4908-4537-08dd8c9b50a9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Ni0AcWHct4geOTXn5qYGYDKIf/xFcLlJ75ScR5Jg966CFm1dDehP5UF5ok7+?=
 =?us-ascii?Q?V7XUys1jkZGXRHIC0D4pr9HTdDf5z5RL2OcJBlclpvJKwfgazwG+gg4HaUAj?=
 =?us-ascii?Q?Y8etrb1fYC7cWm3+Pc6/EAG8G36QtWQWGGNbhJragc8M8ZhIJUqKuNwH+otj?=
 =?us-ascii?Q?itK0NemxVq1z9D13fVN4i/xa4NnIm81oqZjh/3SQtzpjqiwBy3pqe+J4x+7L?=
 =?us-ascii?Q?FjZ8TeQqD0AZWlqONDzUAEE4I1GZ4JwEUUa7EFMsableQXhBDxLPbFzz4pXf?=
 =?us-ascii?Q?FlB+cmtCRTnwvlpPHLkWu4igKv4NUAoCTOck2yx6bd/YiZ9bByMV4WREkc2d?=
 =?us-ascii?Q?80jjLIkCHjt4j8pMKTlreEm+omF9Ll9Dj/0o1tlB3L1J8IFTxrgAyTN9pkGN?=
 =?us-ascii?Q?Vkpjq1kltD6G4BOHRGwCFLF8V9ATstkiDU2OvMQFv5LNJ1sxssOHKuUVlcpM?=
 =?us-ascii?Q?+AuywB4W7SfMnALitxg1BU2E+b3SaW/bypIG3UU6KZSeG/FHlenQbZiI9h3D?=
 =?us-ascii?Q?2/u/hkMIShCa8/n1kHHoiA1OLfXc+voSvOl51il1ak2Mhqa8UpAfhNrHDZ8l?=
 =?us-ascii?Q?jQUKq3gfdV8o/R8W6MXLPMOM6TP3Wx0huFaeQtBNhogW3YfSKSP1y2Q3nU4A?=
 =?us-ascii?Q?Gl05nzCZkA4953P+JP9oBmnY1pjWa6jPeH+KSrvbE/CjYP2YcvifU0etdZcl?=
 =?us-ascii?Q?+cmGoa2YCb90ncij1PnD/Pk1Yd7zFsYO/MowZhs1PY++rZJo4CAiXRZAx9Ff?=
 =?us-ascii?Q?xttGFzcY0RNuFtyG0ADZdXURNVweh1eSaGhqxBUz6D7EGxbVI+XLGUNnKCBS?=
 =?us-ascii?Q?9ZU6ab+1+rtU8OGSH3NaJpGFRfN10KXH8qczKQIHmNrSfjZD+s00CEoX25n1?=
 =?us-ascii?Q?GdDD4Qb7QtkNihn5cOVHVm+3JG6GXi3qokcS6gZWGCQlgCy1NrLMpoC+NiKV?=
 =?us-ascii?Q?dIdzqs1R2muBzD3rNdmXxvj5pgvYBtMQV02eadrYSLknBb5jYVPdK0FE7Xme?=
 =?us-ascii?Q?RlZAM4xAaKXjpf1l70rHH3EPtQk3n1Alufpr+REALwJ7sTU9NvGxHoXpE5R6?=
 =?us-ascii?Q?qhR9fHRkO0U7nd/BapBw6ADFduujmAq0jtJ1nqGfcI8MmOu7KqQaGwb2Nck+?=
 =?us-ascii?Q?vBm/bsIDE+cybeoCkB/1HbmzpdiqnsPag2git+sCTiibyoQunALLbDdQUrTZ?=
 =?us-ascii?Q?b3q7K92QAxdzsTlwnIWJA0auJPBtuJ9FxBWn7E4zWBaDwu7AvH51+IWV8PqT?=
 =?us-ascii?Q?8D5XRqDFe+Vr9n4dpx3WQi2D6A7mthFRUVH+gSc7h4sQ0Jdzu9/kv904fYEe?=
 =?us-ascii?Q?I2g1ccX//zWBaQwFwptnFQz0tBsbTRGD/ZTxQMi+OuE4bZYvpBlbehnRa9lA?=
 =?us-ascii?Q?AllR3wD6hJ9dKYM0/Wy9HcbapzlWQCDXu67y3yBk8QPvOL8+Y/nHKZ6Awl3w?=
 =?us-ascii?Q?3VbSpwGputc+eCvkEPF0QiCKHWWWYaQxdaRXBnyq1doiLWywYc4Mh6p04lTY?=
 =?us-ascii?Q?Ue2O8U3JmV2QtNA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <01483794C69DD54BB7A0B935DEE95F10@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7915
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45c29f11-e642-42c3-99a7-08dd8c9b3638
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GL+q6M3XjtGKg9CmHcO04wrsqFE9YJL2RT3432o4LOJYHxZXXAOIOQDn6i1g?=
 =?us-ascii?Q?MQXjbIa1jyxTwamaOaWUz2PITlPQzPShzjy03egDhvszq5rbFE0F2XqUSely?=
 =?us-ascii?Q?no5zSt4rg2mN2UJeYpcVC3rHS2artCrg5KLhXg5p/Izz2Z8Hz0gJejkiuDLO?=
 =?us-ascii?Q?OEEOJYJu6XvNuoKduoFK7OZvISNUnE3CdzEQPp8zjOYm7ghZJsaeB+MX8tNH?=
 =?us-ascii?Q?p4BtBkzKaZNZDKhEpCYSKYqjuu0FSyDDe+sJEXcujbSNGGZYHXVzO+vYtNOt?=
 =?us-ascii?Q?5q3mVaPRc6e6D5i2B3woCgyW758PDzGs2sX4UXbjqmwXQ3U+lyi34f0GbTid?=
 =?us-ascii?Q?r7BAvima+J/OR9OkI0yVZIohyS4ioElyx2rwkL2EIzsI31aD0eLP25TCAAVq?=
 =?us-ascii?Q?7hrofi+Gf7cRszHA1X8CD2xwbtaxvSdAxkJbtkCu8KEDKP881Lep09S4ehqb?=
 =?us-ascii?Q?+wqqwb8ZEdHziwhKStoN4ASVTHOzFuZJHnQD96PbcEyzVkbY1eIBdcBWscXM?=
 =?us-ascii?Q?aJKI/8yS28S/e4ZkkhfudqylxLUpEqZQbJ3DenrngmBM12tE/s9/BrzkDDLb?=
 =?us-ascii?Q?ItQa7cbVAl3H32St348mJMDoeBy4KvI8FJn10p8F1BRpgOe6duWll4WYF1sc?=
 =?us-ascii?Q?nl6eGJFsdmU/CpKuH7KBcR4/Kcf3JfI+Zxp8AF4hOw0XbWjFtFg8a/AmzOhO?=
 =?us-ascii?Q?x3A07Pfe7+67JTVxfmT5E6iPWvOo6+0pWUJuqofwzkofajS1rbjhYWXe9svT?=
 =?us-ascii?Q?4tBK6KpjogsrlZBWvAp4Z9haGNH0T+j1QAkl5Rkt1yM86tbA14B+EeiRPRBR?=
 =?us-ascii?Q?yldYQkHn0FZFsMU2nZ5mToiFzPfIgKnNzpXAWpRBudMNXMMagORe5HsxlCLz?=
 =?us-ascii?Q?oTP3sAFtlvjiEwvIyCQspPHCiH6PHw22Kc/WaFKf3q7p7Lek6eXKyLMxQW0r?=
 =?us-ascii?Q?og0R3zzZIGP7jTJGYcttKTLcIYVMydPqcbzIuadNBkwcxFP8AglkUxHzzJCG?=
 =?us-ascii?Q?9CyTva+UhT+jYFZeTQcMhKTg4s2XaXBbWm8YoqNotdnZMoLjfbcFZynTbRW8?=
 =?us-ascii?Q?F/YyRErHN02lHIRv6UeeJX0iNidIPDQ2hpnBBvV8a80LRSLmN2McDfnJhRq2?=
 =?us-ascii?Q?wny34I1VZIOLk3w+sExuQu9iAp1fmfbzwU6kKFI2iKRkX3DyH55W5oq0v1E1?=
 =?us-ascii?Q?Ajwjsc1LQo6lbNDOPXqslOhSPg0FVl2HdS5boaReVI788WFfUQWERITk9g6e?=
 =?us-ascii?Q?d9EG/1nlEsV8UfyhQFiR3+7M1DI54NHkEqDTm/8obyBlddJozrx+tN/FFUlm?=
 =?us-ascii?Q?sI3fqKnFnyJquwM0A8dwKGv6YaLJBY1Ni+6wsapHBJPIPTjk7kTtqXaPB9ub?=
 =?us-ascii?Q?TzuXvL9tkVH16x/2tYR9/CqpJiApEC4eiKRJrLUPWbjsVVsqVQIWm2Bp0tI6?=
 =?us-ascii?Q?kVyRciDrCx2qh9fTy1rsnabFCOTaZ0ZdjilAN1dc08oh38Z0tg813b30ZZCv?=
 =?us-ascii?Q?DeEjxG0rNuhT+DQzpEqXDmbr6Op5BMYVV8KmaFV4+LNHva71UzGoxxQ05Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 12:41:25.6700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ccf2d3a-de4e-4908-4537-08dd8c9b50a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9839

Hi Julien,

>> Just to be sure to be on the same page, are you suggesting these changes=
 on the original file?
>=20
> Yes with one tweak.
>=20
> > > diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>> index 21ae74837dcc..c00c651805d7 100644
>> --- a/docs/misc/arm/booting.txt
>> +++ b/docs/misc/arm/booting.txt
>> @@ -58,10 +58,14 @@ Firmware/bootloader requirements
>>    Xen relies on some settings the firmware has to configure in EL3 befo=
re starting Xen.
>=20
> I think you want to update this sentence to remove the reference to EL3. =
Even on A-profile EL3 is not mandatory (I vaguely remember one of the platf=
orm I worked on had no EL3).
>=20
>>  -* Xen must be entered in NS EL2 mode
>> +* Xen must be entered in:
>> +  * Non-Secure EL2 mode for Armv8-A Arm64 and Arm32, Armv8-R Arm32.
>> +  * Secure EL2 mode for Armv8-R Arm64.
>>    * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1=
.
>=20
> And then here: "When EL3 is supported, ...". This would also cover the R-=
profile change.
>=20

Thanks for the clarification, @Michal, @Ayan, are you ok if I retain your R=
-by with these changes or
should I drop it?


> Cheers,
>=20
>>  +* Xen must be entered with MMU/MPU off and data cache disabled (SCTLR_=
EL2.M bit
>> +  and SCTLR_EL2.C set to 0).
>>    [1] linux/Documentation/arm/booting.rst
>>  Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/li=
nux.git/tree/Documentation/arch/arm/booting.rst

Cheers,
Luca



