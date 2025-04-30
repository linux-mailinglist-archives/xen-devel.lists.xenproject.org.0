Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F49AA4377
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 08:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973416.1361549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA1PW-0005LL-OW; Wed, 30 Apr 2025 06:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973416.1361549; Wed, 30 Apr 2025 06:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA1PW-0005J4-Kz; Wed, 30 Apr 2025 06:59:14 +0000
Received: by outflank-mailman (input) for mailman id 973416;
 Wed, 30 Apr 2025 06:59:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZps=XQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uA1PV-0005Iy-Go
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 06:59:13 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20628.outbound.protection.outlook.com
 [2a01:111:f403:2608::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e8ea8f4-2590-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 08:59:12 +0200 (CEST)
Received: from AM0PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:208:ac::44)
 by DBBPR08MB6092.eurprd08.prod.outlook.com (2603:10a6:10:20e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 06:59:07 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:208:ac:cafe::57) by AM0PR07CA0031.outlook.office365.com
 (2603:10a6:208:ac::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Wed,
 30 Apr 2025 06:59:07 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Wed, 30 Apr 2025 06:59:05 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PAVPR08MB9038.eurprd08.prod.outlook.com (2603:10a6:102:32d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33; Wed, 30 Apr 2025 06:58:33 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 06:58:33 +0000
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
X-Inumbo-ID: 9e8ea8f4-2590-11f0-9eb4-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mDHXtxvn4D2lGEfwL/1Zs7lVLWqb0OwBESBHfTyEQWRPpKV8aJ6Prpgs8TYyqs7VP4322ffRIAtY7QYCaTdq/8n2AKl0LljQ6Wb9J7QpctAwhsNSRbJauodR8njOqCjFn6QFWAl7OrHkrlS7kqPzVtA9eISdOm/0RuZaXlYiguz0coEqbSBbfAzaqUQ3N9PiG3cIRmJYSBeTww3PZ6XARQ7CaTUyvGum4f0BhMO52T8sXoBlJ5waiY/XEJC7gxFsXudAfnE3pAcC8sR2m1e7Rdznw6SgrvmvFPloTxNP5p3TXnxi+eu5PLoXUSvu/kgJ8Vg0NtES7H7gffIDTeEGSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ef58SYXk03KkxovSI4AdUOji2JJ1aaqFvyDT547p82o=;
 b=ntwHB9m1o9ToGmPwwLmlhMROaXscIYfQ3VfJ7MG2rWW3E+9OIdADX59bJ1imaMTfIiEAWv2nHdsDmIfXxIVyaJbBqjOviCs6Oy0N+bG23eZySt/SSjGT++km3CswVINAw1escqww7zWd90ANxQWbrZ9DwNEs7zEFT9MW5pCUbZaToXG8xNzH598rbbWXlPq9UpN3Jr6hd1WRfwYw5K8bk+U4royzhvgI006K4w1h9fLj/J24YEtGr2gKT2DkZ2LtWS/eDRBtPfODdFhzPe28ukf7oizaPDhCn/S9hoiHytO0Hj+u+okpOlQXFIMwe3PcWdSoW3uT6Nzg1A+URBrvVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ef58SYXk03KkxovSI4AdUOji2JJ1aaqFvyDT547p82o=;
 b=padJq5XoJF+sSn6gFZyaIS/4sGpib4kafjWd+IO8jBMP8mD7lqVpNaOWw6JVw0l+HC6u9TyjaRXfgLDAGsc9V1pndOSC/lX63HVoWzbFyee4GYB4Oui01rhPVoVDsQndQ7HctW7jbxnLXvTT+vqmk3p7K58ripjoszOp60XhNuQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBQPIK9q6WSbGKCJKLY7TAIqUAudJGBBI61s21f1kw+rZhfXh0Lnym8gRjYvZY/+nidQ3Xelesmfaw44KnllzFHg6cinj0HpShvOIOfxprA9qK7LOve9f3BQM82OMvov+9yM12QHMZJetuFMSc4NwKNe1AtP6CzQ+zDJTgkX5lXlHXbQbwMQMzEMWaYGuI1zwJ0kM8TzE+yQJEPvKTCoRKUZJesDJ1WmUrblS09rQbccMFX4owxJsPpEj8mlfHGOyQ/PBl0rj79eSqysqmHCZTkWjeaRTmBOzr0e5P9y28NnwYdkz6Y0LUawCjHjtXBu6lAXQWmk/PvAlYMBCsU85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ef58SYXk03KkxovSI4AdUOji2JJ1aaqFvyDT547p82o=;
 b=en2MCulMHxrg54TNLd+WZHbYw0mEYWbj/WvbEjagDEThPDpYx27N0fPSBpF3/ss+Ba8KXTfRbOWj5vRSMDgY9ZalBwijBAusQ03rW99gRxNgiY+5uWJSYuCaig/7sLZocVEYwZC0ETrKMjk88ScBLXHOCTrk5IhHO9P9kC5jlji608avJ4nQTWEA7YUyPau2gczbXKjikyCjfW/iVnmeapC46nHEjF7g/9PGpoQQ31xHwsmIOkBsgvJJoRZWB9baTERDqOxihe0Jbn9g4ZvDNoBs7YQQlgCpTCDTN0d1jN9bJt+KxYal3n7dhInJv4bU5B7QlhjMG3bRjORWfKNNzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ef58SYXk03KkxovSI4AdUOji2JJ1aaqFvyDT547p82o=;
 b=padJq5XoJF+sSn6gFZyaIS/4sGpib4kafjWd+IO8jBMP8mD7lqVpNaOWw6JVw0l+HC6u9TyjaRXfgLDAGsc9V1pndOSC/lX63HVoWzbFyee4GYB4Oui01rhPVoVDsQndQ7HctW7jbxnLXvTT+vqmk3p7K58ripjoszOp60XhNuQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on Armv8-R
Thread-Topic: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on
 Armv8-R
Thread-Index: AQHbuRpmN9lJogKQoUiVWa6WakCsQrO7wm+AgAAFy4A=
Date: Wed, 30 Apr 2025 06:58:33 +0000
Message-ID: <BCD1B005-3231-4542-9574-A269F4DDBBF8@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-2-luca.fancellu@arm.com>
 <a78219d3-4872-42ff-9588-53a65a6bba74@amd.com>
In-Reply-To: <a78219d3-4872-42ff-9588-53a65a6bba74@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|PAVPR08MB9038:EE_|AMS0EPF00000199:EE_|DBBPR08MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ceb28b-562d-4c4b-88d6-08dd87b47f3f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?yt+R5xrCSojvAWjYKE/4fvebWH69WY/hTX/fyue/MfyD0RsvaojZlvMSqrkj?=
 =?us-ascii?Q?tsP9pSLIS3TyllP7lZUH7hA3RDOLIwrQspAwlC85SiVqppTLoImsGM+NYmRZ?=
 =?us-ascii?Q?F+nnvioBPdrQkV41F68JAMQ7mHAt+r6iLY7HhUtwISR9VPvEeOBSh6bpWErD?=
 =?us-ascii?Q?Jz612A3NR7mRD81rFnm2uhVBhfiwrqlZTxQYJG2xmrXcPCnzJqHZ3loWJO0U?=
 =?us-ascii?Q?4BQsEsSOeGXWLVGUEoSKbuQQN8vmWU2Pg3A6YrHNiEZHmWQtjWepQcwb5gx5?=
 =?us-ascii?Q?W/8e9kgT+GncPnuZ6HpJ7IUFz8t6x+EYe3EV0axISEPbpV4akWE5lYHSXqwT?=
 =?us-ascii?Q?erIyqJ+dYS9tJhMetS62Jud/0trW2zt9Z/eYjL4hn+vDWYWOv+gFoTWDAfOX?=
 =?us-ascii?Q?IWSk4+lU4Ro0TZP1eWZv0dyaECuVpre+yeAMxnws5CKXYiCe68/XFhKP7kdi?=
 =?us-ascii?Q?1NUy/wnAh/bBOCI6NdOe5xM0LbxXxfPTVOeClAyGjzwSkPlAwUDeF1qaU6if?=
 =?us-ascii?Q?WXEpVUnG4lGhvKlOLlvP0S6IT5MjImPQkQiY2014f5bs8DAzh4etuFrK4qFH?=
 =?us-ascii?Q?wOYYU8lUdKfxH0rRpyskVTl8I6KS0X7AgBHWAZoQihHHyYUpK8UEQes9J8H+?=
 =?us-ascii?Q?LHAlDbcxIU6k6yhTZTP7rDAOELACz6/wIM96FAsnBpXzAbOPBqir8xzJighD?=
 =?us-ascii?Q?quTqeCg7Galqb03hfglRcXmjFejL7gysqqaAEMpfVr+Cl7699ue8drCeEx1C?=
 =?us-ascii?Q?wBVWzqJ8+MotD+eaR2m938rZ58U+AtcHnOCMea2f2jmLyzG9/S1CUgGsF0b4?=
 =?us-ascii?Q?CDJ6rV1PHfMHTs7X0YzzG2IAyuLs7M3gWyn7zriO6ii6gTNLlcrXtTQUfCQ2?=
 =?us-ascii?Q?m3rVCLyiZx4KXs85Y4XcPyNLLr8HpNJ7DI7hX/m0W5F/0ywffr3Nd0PumbrV?=
 =?us-ascii?Q?zbikhLHZt6UGiZiubVT7y4Ybz3RT/VW8R+nCQdiyijwTxw/B2Wn/2easozZY?=
 =?us-ascii?Q?BrCEPyuSlW+wYQ0Pg7uGGKbKaiqTZst2LmT7IFTB5CHp/x8qjaIC8v0obGAy?=
 =?us-ascii?Q?kHQWVah44sSU+8I/6C6R2jdClQoWC1sjdwtQ0vTURBRVqVNtV5NuCgzlFv7d?=
 =?us-ascii?Q?wFusGCv30la2HQ5UctfcyerMPrKQb8UAKA2pbMuiKRN0u8RXgvPSNnDHnGe9?=
 =?us-ascii?Q?9PzNzTbyL/gyMp4PVqSaNW7xkdsK1sZ+vQR1BjfCEhB2FJ+x073V3QzG7M1B?=
 =?us-ascii?Q?1vughvadLNejlmLXYk8qqWXzsDMk5sNcdhiklJp+Y0Y4ht2/CtFRF2ctKfm8?=
 =?us-ascii?Q?9WMQ6LZ0pIRT3sZs1DdBbCkl4XAwL5Y4V2xkeQc6P8PMlWC9Q9V8QZWt8Jkp?=
 =?us-ascii?Q?UvmEPevNllOlt5hJ4NyETk3YmVxmR0B44ZHmpKjb0WGSZei/3hUV5yH8pO/X?=
 =?us-ascii?Q?+AfBlJi/8eMq3NwaEN1os6t1kLvQpnSktkOUOi4d2hRFX7/r67qM4RH3vV+x?=
 =?us-ascii?Q?/vn9u7rAX4fKisA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D66B0985DA4E8B42BB7D256707F95001@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9038
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f834ad66-d968-4b94-91ce-08dd87b46bf1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|376014|1800799024|36860700013|82310400026|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8VxwxV+1N/YILtXDf7z5K/5bALFjdxV7i4tpGWVfVPTvXcUefh5KrknXRFDv?=
 =?us-ascii?Q?pBFDyAuGwZRaGDrVMvgv8eydBhnYGQ1K6GzhvjJox6ZoRl1IG6jil7N9wA5z?=
 =?us-ascii?Q?J9MR4NS0cFm1/PSzLy+W7BxW5bYS9ky5/wJkyi9yCX1i49jceH7xRHSuTEUB?=
 =?us-ascii?Q?nRcdUKBtWzTTlU4j6QaknUMbHdg8+iJoPiCJJejhYetVcb9nnv92UUViRQYm?=
 =?us-ascii?Q?QS25LTybMLE4ObLw1bX9LlMy1UOqqVUzo3z1aNCHxWsJT2XVhrlwpXMIYAgP?=
 =?us-ascii?Q?BREQJAwmVFTWuZb3C9yo0IJ6aMoJsUSlD92A63FlQ3lfFX20Erw9/uvUY5OS?=
 =?us-ascii?Q?R2MLN+G/cuU0mL0pZ+MzIsUUAuXRaA5EQWdmf8keLSz9JPLJjm6Ui6KGTa7F?=
 =?us-ascii?Q?vvQ/JnC3POTn0fEzK28NFrVw/BvUa9YSw6sZLu/D2/jEf0P8ElXGKCEG+Whs?=
 =?us-ascii?Q?M9eaWuRMcz8cthkXoCIa5/VGkcBYZABX2dj3nBxul9egLWUfa1jcVyp9Ob50?=
 =?us-ascii?Q?5E1B63T0DqXUiHMok9ZThZANKRod2tpwISLZI1L4+t3XIIU2tUvoAz+XCouJ?=
 =?us-ascii?Q?kCVNxXwGJvsLWNNpT6ifGBcQNmDIcaKRQGCJs5F6Y3Gs8dVcb4WAKTgoBDti?=
 =?us-ascii?Q?zHldEMK8cf4n7nqx+ZwLXL/KtIDA0ox5GB/SyQ2v+NESkbjsSjXrUmfwWyy6?=
 =?us-ascii?Q?PZzch0JTxmoNX+Bf204XDFioMIMMyb9PlEIsC6rHbEB4qwJ0HgZ4q47JnQIy?=
 =?us-ascii?Q?6M7H+hq4vpDeQQ5z+7uhBiDIJe2kqcfyAHPt6qtxTIgUDHV+822aTREOYuLe?=
 =?us-ascii?Q?nO2KJKq89PlQR94DBo8SmfnhAoj6ZYqMU+gm0TV4gSYcT/Lwz2HA4n17mFXe?=
 =?us-ascii?Q?Ym0szqyikV0rdhP9hrmcleNKDBvNdVCIjGVL0hJY+SQup/aT2WYRzVIoguhn?=
 =?us-ascii?Q?bxrepwfs/7YE77aXwtjBdtY0C9RzRInBn5scoecXDedsK7OYlGgLnY++/kqV?=
 =?us-ascii?Q?qBvlohmCrp1eT7I++ddYD/gEAKZ7HgWkKkvOKg/QDagr8tVnhwBMjIF3lBCb?=
 =?us-ascii?Q?/3BWrJ3SvCC/rcp04wxzAN6N2+6Ikh4BWnfXDDG2STQ02+iorQkzMvZ6NbMZ?=
 =?us-ascii?Q?o5qjssR5hf4ATgJfJc4cBwv6Nvsa0Z618w6ai0e4LDxTgIUe848HF+fHJMui?=
 =?us-ascii?Q?n7dXSydYmRj8pq0X3RFRR06ab6/h+VIQxZMAMIYzccWGf4IKIS3vdmqrPvcv?=
 =?us-ascii?Q?eWerMfpS34H8hTdXfmr3lIEKTSO/iBtTVEsLCUwXPrLewW7W7i0DluqjkESV?=
 =?us-ascii?Q?YS8jeQp10mAtru23lDPU+xn14/4ZfWiy9V0rTJr5EUCPQZKaShRWLbFeCLME?=
 =?us-ascii?Q?GN42f1HWy97K+TCKNdUyN+AR8NXbTJSzwGD+UdzLmHPMa90NvBZafKRYvI8F?=
 =?us-ascii?Q?z0AUEWeqqORU+QxnGaFfe+fEG9/7inoC9r92EVPRtm80bg7LJsW6agbEllxP?=
 =?us-ascii?Q?T/pHGMYxc3AEVy+lW21uNEP79Eb2ZLDajBUXqZNEYxT45DU/bJThUelGiw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(1800799024)(36860700013)(82310400026)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 06:59:05.4389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ceb28b-562d-4c4b-88d6-08dd87b47f3f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6092

Hi Michal,

> On 30 Apr 2025, at 07:37, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>=20
>=20
>=20
> On 29/04/2025 17:20, Luca Fancellu wrote:
>> Document the requirement needed to boot Xen on Armv8-R platforms.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> v4 changes:
>> - New patch
>> ---
>> docs/misc/arm/booting.txt | 8 ++++++++
>> 1 file changed, 8 insertions(+)
>>=20
>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>> index 21ae74837dcc..719af74f1e69 100644
>> --- a/docs/misc/arm/booting.txt
>> +++ b/docs/misc/arm/booting.txt
>> @@ -62,6 +62,14 @@ Xen relies on some settings the firmware has to confi=
gure in EL3 before starting
>>=20
>> * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
>>=20
>> +When Xen runs on Armv8-R, the highest exception level is EL2 and the on=
ly
>> +available state is secure (S) on Arm64 and non secure (NS) on Arm32, he=
nce the
>> +above requirements need to be adjusted to this case:
>> +
>> +* Xen must be entered in S EL2 mode on Arm64 and in NS EL2 mode on Arm3=
2.
>> +
>> +* Xen must be entered with MPU off and data cache disabled (SCTLR_EL2.M=
 bit and
>> +  SCTLR_EL2.C set to 0).
>>=20
>> [1] linux/Documentation/arm/booting.rst
>> Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/lin=
ux.git/tree/Documentation/arch/arm/booting.rst
>=20
> Is the goal of this patch to only write firmware/bootloader requirements =
or
> accommodate booting protocol in general? Asking because in this file ther=
e is a
> requirement that Xen should be loaded below 10TB which afaict does not fi=
t Armv8-R.

Yes you are right, but I think this still holds since we support 1TB on Arm=
v8-R at the moment?

Cheers,
Luca=

