Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13C3A885B9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 16:51:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950534.1346820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4L9u-0001Ze-70; Mon, 14 Apr 2025 14:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950534.1346820; Mon, 14 Apr 2025 14:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4L9u-0001WW-3H; Mon, 14 Apr 2025 14:51:38 +0000
Received: by outflank-mailman (input) for mailman id 950534;
 Mon, 14 Apr 2025 14:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bm2T=XA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u4L9s-0007Vp-GS
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 14:51:36 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061b.outbound.protection.outlook.com
 [2a01:111:f403:260d::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f522c8ba-193f-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 16:51:33 +0200 (CEST)
Received: from PAZP264CA0096.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fb::11)
 by AS8PR08MB6472.eurprd08.prod.outlook.com (2603:10a6:20b:336::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 14:51:30 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:102:1fb:cafe::cb) by PAZP264CA0096.outlook.office365.com
 (2603:10a6:102:1fb::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 14:51:30 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.4
 via Frontend Transport; Mon, 14 Apr 2025 14:51:30 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 GV1PR08MB8741.eurprd08.prod.outlook.com (2603:10a6:150:85::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.27; Mon, 14 Apr 2025 14:50:55 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 14:50:55 +0000
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
X-Inumbo-ID: f522c8ba-193f-11f0-9eae-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aIrgXBIqxKO4U1vPOPDhh01aw5EBgFX5/hZKutzV+rVhCsJbJtO2Vb5W7HiBzU1Py56HwoWwa+sUvqjbIfojkdjACzMSoVYSQzAbQEyS2ZPMiiJYNE86GjKcVVn8FgIa7hTWo0BSZCemtv42A6bU8brbbNXru7kXx+4n/Q0fl7i/oAuFiNCiBWgf49TSS98tnSuPfld788klIlqZswCuzJ8b+FTgL6UrUEYpNDcALMsqolghAAH+0ObFJ8XaQA9eYo2NfVOQtEDxaMeoKp4rtQvD09aWeHljvHkSAIpGia10zma0/g4jgnXfXpafyTZao4NxI4tN0WLiivZRc2RM/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZ9JwRmV2mBzMtx9v9RYjZunck0Kd8DU6/udbxMQ77s=;
 b=cqqPYO2qebtApw3M+kQSOP4OT1Ln+e/jpz4aRb/urKVwc/LxbcVDyAAGFdzVBD1TlnwBnreKz+DfiZc0uG4itRLfnjd5F37515M1PVQBpDz4MiOQ2dQxolYvvW9evEcT4/N+l0RGs1Hf6cWkd3+u0UbDgX/g4W0zRreVw8ioeBKuXb/WNRDL0sftFUgvXjV02EysgT7I4Rxga9pUpai138HdHEb00l+Dvde1wwJ9WIunrXiQ8YZtGixFtET2uy0ssJ88ISlApTybuXQUb+mubYhS2cK7d4ztPnwoQbMts8QuaXCXqQkAV76kmvZ2/w94mIj2s40N7tMwOe380M3x8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZ9JwRmV2mBzMtx9v9RYjZunck0Kd8DU6/udbxMQ77s=;
 b=rI6+OSFNMWWOA4yZcYgu42lzWvUm7z9QHyGGVgD+Z3+aSrMXFRU8GXzy3R9fws11y1yxT7n1VJHT0NqcWpsDpC7nnaEZuWIJielD7RX3VZx9TFuEKIt0RRvzJDjg8KmZyqpp0z1ilgmqyHsw3Lq+xWuZ/yxOcmgOiRTNZgBj+18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eA0J4ybIqdup5ZAv2R1c/6OxBsoZHxk3u2VytZoJyXi43G9R6smTHbN/0JeU6cg80FbxjPwJe+GwaUpvxlUeXTYWry2otroNCHNfCRj26VrhLkoL54EXT0Om+1l2CEM/jdtRxBqhh1ya7q/FD7E2TsxobaeMIx+xgwfDWKrUZ6WUck9mzykHGTTVvVaGQtxa762Zhr4t86BRGP0XCbPgCTJzLtvcbmv8SZJ7sX6GC5U9Kh7nUTxE4JCFv+9WqpSHKv/DrhjaFs/gel+fveXZ6fzGWbQUnGxiiTs3EeagHf9wq1TuIzvIldIXPi7avdOBR1ukNCEglmB8avynGiXcVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZ9JwRmV2mBzMtx9v9RYjZunck0Kd8DU6/udbxMQ77s=;
 b=vApjAEu3uNtgqLAJsK7SA9pTJkzwXin0VkjcveToZlHHpHN6hr/xLVH6kw/DSKrjGQPyXZm5uBlNf9z0ZbQu6Y5pYmP4HFOA9tT4QgSeL5iuwDaVcLF/oqH7/y3z/vRmrMG9yoWfZRuNe4Ao2mURnlRfQ3564Du+Ulfr8hLx96uPdhNyvlISAC6EbtAhQmglui7OczgA/w3tpEKQ+5RpXPCXI/Zw/fOn2JDn8rj2dPnDmgFv/3RONdqOdpvbBm2sNQ9z7PWHclOjxgaXEBk+1bz6mQd7A3VLZGqAqTfF3ouWC0qj1U9PiMcsteTdd9hzyD2EfWOnymOIe/LsekXq7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZ9JwRmV2mBzMtx9v9RYjZunck0Kd8DU6/udbxMQ77s=;
 b=rI6+OSFNMWWOA4yZcYgu42lzWvUm7z9QHyGGVgD+Z3+aSrMXFRU8GXzy3R9fws11y1yxT7n1VJHT0NqcWpsDpC7nnaEZuWIJielD7RX3VZx9TFuEKIt0RRvzJDjg8KmZyqpp0z1ilgmqyHsw3Lq+xWuZ/yxOcmgOiRTNZgBj+18=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v3 1/7] arm/mpu: Introduce MPU memory region map structure
Thread-Topic: [PATCH v3 1/7] arm/mpu: Introduce MPU memory region map
 structure
Thread-Index: AQHbqvIQP3h8YyZqYkSDv4tGWZWI7LOi9uCAgABMVgA=
Date: Mon, 14 Apr 2025 14:50:54 +0000
Message-ID: <FCB86533-FFE9-4A79-AC8F-E2DBA2B1F553@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-2-luca.fancellu@arm.com>
 <d323425d-b266-49d6-95d4-0e1acb5e489e@amd.com>
In-Reply-To: <d323425d-b266-49d6-95d4-0e1acb5e489e@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|GV1PR08MB8741:EE_|AM4PEPF00025F9B:EE_|AS8PR08MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: b526f507-0bbf-4c0b-7934-08dd7b63d763
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ZQoDSMnIRHUSwAEBPi3kqlocaCwureBePocm4jfxqrvA/9ZDWaxUJ6qwoVSB?=
 =?us-ascii?Q?LA/rVBJlZdsAVKNuRxJtRmEEGU4KFLW+31UaDKJMSnvxijHsRWbhLw/ZD0i8?=
 =?us-ascii?Q?EW00NLURb3loVpnJ4eGkj9MBQP6waHcg1Gk+l1N982APbEIVy5pLPQVtq0dR?=
 =?us-ascii?Q?sganJly5FkgnIj5nwh7IXvI3TayuCHB6yNSnkrp/lou7YeC4EQ/jHN25XX+i?=
 =?us-ascii?Q?ceQF5UHNULz7pCJiFyxVEyTCS/xOoKycEg0mgLFWaAAd2qpd6OhLEcMtr2tQ?=
 =?us-ascii?Q?5+h0vRGFEBDtfMxbv8hkwuBbZDLc3Z/wXvNZRaC4FzRC1+Duyjm1tDjQfREB?=
 =?us-ascii?Q?u3Sxw5+y/C4ggLAN/MJfyLlamX00bSEVxKaYfdY6DyXCZP1EIzAnk8Ns7lre?=
 =?us-ascii?Q?COqVQl9Yd4nuuLKzVK/T7U8GErN4A1oM27buNdu6cx+2HL5Vwrx05b7tXsKs?=
 =?us-ascii?Q?ygpx2jkbGgTk9D5VekHJmBt6vRNiuxZgIuofK2yYMlpEYTcfyUjDICZnVBKX?=
 =?us-ascii?Q?PhxEO4RDEbZvCZSsyQOJB+vawt9uMHeWZyFwkgXVfUHq9CX14Uf5sXGKsHKJ?=
 =?us-ascii?Q?Q6rQu6zQT5K5we2LCyXmhV0nfYRFi1ZncR8v0ypTKvsUnXOs7MVsJbsSb+s0?=
 =?us-ascii?Q?LjnrXdjAR+oG6ILlJ1LO9Y6Pu/bmO8qDPpJnU7vKL8HhWgHzyVdnRctK4mH7?=
 =?us-ascii?Q?t0Bxnq1M8vnOB65p/nqHB+EQD9tyMkE1jVsPCOACa47d8dx4QCDSS2Bg36Sv?=
 =?us-ascii?Q?LLb/+Ud+hwPNvW36eR7QP9ABE4lcUZaAXHuEWE7bOAD2N9nRsEROhImMUo0P?=
 =?us-ascii?Q?WdvHDvQAhMkuKEJAsVt0qTcaePTJI5q17KhONzx02xInM3plU0FYYKi/TpcY?=
 =?us-ascii?Q?rvwDLantjZNZbF6l5eeVQ5w8ksi7Gho8dlKs3BFCvgRbY1iGD2B2pNjNzMFr?=
 =?us-ascii?Q?GONeqRSqdrHt4MLTmxxwwOgRThsX7x3TorRKKzhDyNLP0NJRJF4eB93qNC72?=
 =?us-ascii?Q?G4bq6JFBA5DPdo5G+f9OC+fMhOkfJ261a2szuXGgRUNhF8sOin+p2Yk/EWLN?=
 =?us-ascii?Q?ppMYE2e3/J2fDFFCSSqTZpxxVBZxfe4jQcc80xnTy1n0pxjW8paigiLdWDt3?=
 =?us-ascii?Q?g+Rzm23OMl0Kj0fqd5NCWoX72OrkwpuBGviyWvXOQzY0Jjq7qKv6rc9H99uy?=
 =?us-ascii?Q?bGmb5ZAZ3IOt3n/z5xAO8U3TBPIcjNg6WnUWUtHc+hH7/kmsAh/FESfMTBhI?=
 =?us-ascii?Q?eXI29rnaip+EkaMGoJWQVJNj1KsG9P/DIBzECiJ6rhLVeF+5A2FSdgr3w4ZE?=
 =?us-ascii?Q?yvH4qV5RQuAl/EUHQDoJ3xtxiJAo4ELeqRlkmgcPoqMMTU9omEsXW7ReGqMJ?=
 =?us-ascii?Q?arVwmvQR/E3e9piaucaWKlYvK3h9r9JbwUnLNhOF60EhD+Lh+s6VYGiBDz+V?=
 =?us-ascii?Q?0kKw8ObToIY7Zj5w42+Al4xX3d/E961IowuLFPqdppRX4cFAFUh+2w=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1CDE58025A897C40BFBC4654EF04AD90@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8741
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47f0ce16-8edd-4231-3796-08dd7b63c26a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|35042699022|14060799003|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TmwA+eTPFtzhuFTIam5eiHEbHIT+U7IbNuRK02lu2IMCaZHYZkXz16VQMyXG?=
 =?us-ascii?Q?uk39TJQrrIuWR3oaR56K5fECPST67cOafkLKHlM4vVareGMDz3p2qoYjcv5m?=
 =?us-ascii?Q?95Wdy3uIhvyOjeUiEANyzuyu0oafCeOXY9P0Iik7Qet5HSEq5LG0JE71BIH0?=
 =?us-ascii?Q?21KrLg8o+WxKK54OV0tYmQCX4Cz+xDYLxSDujXo2Mm8dyKUWDtD7u/xmMRGk?=
 =?us-ascii?Q?WOw9TMTJxmgxk7OmsVssHufTwgfzWHuiDrC1cFiOeq83+DZ7g+stmy+e5iEC?=
 =?us-ascii?Q?HcM8Jc2Az2+XGavAwz5kEIrz4rXeOYmqqG89eo+AHWNSHvDjXBdHBSDg2YM8?=
 =?us-ascii?Q?fdoa65ss5OaN9HcNhUN6oRahCxraVbrDqGTk23URgkABMXHg4D8TLYDpsOMX?=
 =?us-ascii?Q?yTZA8hby11f0aBBNduw2QM1vjrX8Y9DCmGZTBgxDytyKX7tyBytpWRsyvfQH?=
 =?us-ascii?Q?jkoKxx/vse+pNSlgLQPv8vRlBiPDyADljgoSqFnbeflRIKd5kobdJprGzj7Z?=
 =?us-ascii?Q?BoKkc5PhsaR3Qtdau8UmKb2wJRRqASQ0Ot47P4CyUjssz/4S2K8v4/6rlSEL?=
 =?us-ascii?Q?4gZUs39Klj/FYo+PphV/eiRkDOLvTL0nsC3bP+vzHsu2BA1E/D36f1Kh+Meo?=
 =?us-ascii?Q?2sL1yE5B6l/9S/RuBVsz9YmuyY2wuq85W5XcY7WuCt7iK62x50CPQTVqrFUN?=
 =?us-ascii?Q?O7ri8lXJbsuzFSLiEjEOK4IXWNolbRAC9vTBmrF6H2xLdZFnM9vG8IhctNFj?=
 =?us-ascii?Q?rBXGc5C6R533c8SJ9u2sFa5beYpbwaf/YAxNm+5EeQpM5D5dccIduWRNGvF/?=
 =?us-ascii?Q?RyCZ88dLJ4i2Z4sEKn+dzj3ywPbQQ3MJxf+h0cPtvDH9h6u5OfXbcAJgL0j1?=
 =?us-ascii?Q?o39w/DN+i26fyoRGAZPjrsW+8jHJouTGV4ZgT8vog86viIy7iTjtFRsiaopt?=
 =?us-ascii?Q?1+4hE3Y1oenRE1FBVk4YiTQYJjNX8iwDwnNCvfQeIrqYuiGRlloEsa4TUyz+?=
 =?us-ascii?Q?UX9n40nsuCxeMZaClHl4Q0w5ofHKwFBMAS0ScH0n/5oo4cCasJCXmfH8LpXr?=
 =?us-ascii?Q?Goebg4EQ/pmPhIZPTNX3eqbUKIv5G7iCyTTvPii8dC/4bbmUC++VZXLZSnxo?=
 =?us-ascii?Q?XI7//6TN0GQmXLrTZppx5rWPPamVTqQT7g2B/otyASqsEvi5RGheQTL0iaZl?=
 =?us-ascii?Q?QrMIdF0KXXY0lWrrCgc/erxWehR7Cag1nAqQUBaP89zsAWyg6ga9tqOg9Z0A?=
 =?us-ascii?Q?+gocNhKT9k8AoC/Y//8EcJe83z7hU3KB1UKDMA+nZCBREbcFo/lHYnu/+f6b?=
 =?us-ascii?Q?zDxxGGBdG2O0lKWqin+ld624IE1zShQ6jqQ7TmUntuGl+GfH0kaIVtV2f2Fg?=
 =?us-ascii?Q?q/9tVoemedibAPYHdT3UI9usurBhNXNcsEDFapY98Db68tqg0zI6LhDSVPL5?=
 =?us-ascii?Q?dT8M43qqn16+i/KWPL1yGy9G3bEV2E86R3+XDfBsZcaJA2Hgp+VvOKfiIElH?=
 =?us-ascii?Q?nMlmzkrv3F1VL2XKMlGEXvZVRe/eBBhNoNp1?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(14060799003)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 14:51:30.1219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b526f507-0bbf-4c0b-7934-08dd7b63d763
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6472

Hi Michal,

> On 14 Apr 2025, at 11:17, Orzel, Michal <michal.orzel@amd.com> wrote:
>=20
>=20
>=20
> On 11/04/2025 16:56, Luca Fancellu wrote:
>> From: Penny Zheng <Penny.Zheng@arm.com>
>>=20
>> Introduce pr_t typedef which is a structure having the prbar
>> and prlar members, each being structured as the registers of
>> the aarch64 armv8-r architecture.
>>=20
>> Introduce the array 'xen_mpumap' that will store a view of
>> the content of the MPU regions.
>>=20
>> Introduce MAX_MPU_REGIONS macro that uses the value of
>> NUM_MPU_REGIONS_MASK just for clarity, because using the
>> latter as number of elements of the xen_mpumap array might
>> be misleading.
> What should be the size of this array? I thought NUM_MPU_REGIONS indicate=
s how
> many regions there can be (i.e. 256) and this should be the size. Yet you=
 use
> MASK for size which is odd.

So the maximum number of regions for aarch64 armv8-r are 255, MPUIR_EL2.REG=
ION is an
8 bit field advertising the number of region supported.

Is it better if I use just the below?

#define MAX_MPU_REGIONS 255

>=20
>>=20
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> xen/arch/arm/include/asm/arm64/mpu.h | 44 ++++++++++++++++++++++++++++
>> xen/arch/arm/include/asm/mpu.h       |  5 ++++
>> xen/arch/arm/mpu/mm.c                |  4 +++
>> 3 files changed, 53 insertions(+)
>> create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
>>=20
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include=
/asm/arm64/mpu.h
>> new file mode 100644
>> index 000000000000..4d2bd7d7877f
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * mpu.h: Arm Memory Protection Unit definitions for aarch64.
> NIT: Do we really see the benefit in having such generic comments? What i=
f you
> add a prototype of some function here. Will it fit into a definition scop=
e?

I can remove the comment, but I would say that if I put some function proto=
type here
it should be related to arm64, being this file under arm64.

>=20
>> + */
>> +
>> +#ifndef __ARM_ARM64_MPU_H__
>> +#define __ARM_ARM64_MPU_H__
>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +/* Protection Region Base Address Register */
>> +typedef union {
>> +    struct __packed {
>> +        unsigned long xn:2;       /* Execute-Never */
>> +        unsigned long ap:2;       /* Acess Permission */
> s/Acess/Access/
>=20
>> +        unsigned long sh:2;       /* Sharebility */
> s/Sharebility/Shareability/
>=20
>> +        unsigned long base:46;    /* Base Address */
>> +        unsigned long pad:12;
> If you describe the register 1:1, why "pad" and not "res" or "res0"?
>=20
>> +    } reg;
>> +    uint64_t bits;
>> +} prbar_t;
>> +
>> +/* Protection Region Limit Address Register */
>> +typedef union {
>> +    struct __packed {
>> +        unsigned long en:1;     /* Region enable */
>> +        unsigned long ai:3;     /* Memory Attribute Index */
>> +        unsigned long ns:1;     /* Not-Secure */
>> +        unsigned long res:1;    /* Reserved 0 by hardware */
> res0 /* RES0 */
>=20
>> +        unsigned long limit:46; /* Limit Address */
>> +        unsigned long pad:12;
> res1 /* RES0 */
>=20
>> +    } reg;
>> +    uint64_t bits;
>> +} prlar_t;
>> +
>> +/* MPU Protection Region */
>> +typedef struct {
>> +    prbar_t prbar;
>> +    prlar_t prlar;
>> +} pr_t;
>> +
>> +#endif /* __ASSEMBLY__ */
>> +
>> +#endif /* __ARM_ARM64_MPU_H__ */
>> \ No newline at end of file
> Please add a new line at the end
>=20
> Also, EMACS comment is missing.

Thanks I will fix all these findings

Cheers,
Luca


