Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOvgHy7fiWnGCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:20:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB310F955
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:20:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225349.1531831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRBp-0001Ej-8t; Mon, 09 Feb 2026 13:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225349.1531831; Mon, 09 Feb 2026 13:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRBp-0001Co-5l; Mon, 09 Feb 2026 13:20:33 +0000
Received: by outflank-mailman (input) for mailman id 1225349;
 Mon, 09 Feb 2026 13:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpRBn-0001Ci-Fx
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 13:20:31 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a8cb2be-05ba-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 14:20:29 +0100 (CET)
Received: from AS4PR09CA0003.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::6)
 by AS2PR08MB9473.eurprd08.prod.outlook.com (2603:10a6:20b:5ea::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 13:20:25 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::d6) by AS4PR09CA0003.outlook.office365.com
 (2603:10a6:20b:5e0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 13:20:27 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 9 Feb 2026 13:20:24 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAWPR08MB10135.eurprd08.prod.outlook.com (2603:10a6:102:35a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 13:19:21 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 13:19:21 +0000
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
X-Inumbo-ID: 1a8cb2be-05ba-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nFoOcaeYj0tP9wGwjnCF1e/V6i3mL4i2yK+MvjjUXlUjxsCaqXnsjk+YljxwOk3DnGKA25o/cBR9Z/rxgFO6lFOVBG5eVLkr3ZX/nXl6f9EWfMhHE1GYhxhAnH/D0ms17egzY1D95n0xerV8t7c1VzYk3DWA+uRNYl7osAwAzr6HwHRzroyVAudYOLnmKbB1Hz3BBUKtC0Bnut11cpFWE9W/mwvQYoQiKkJYnt4eZatBJjohACtQly1JinTqZhZkfLOstuh5b3+jlE+i5LydPUOrcRBr6H20Vp1oCI8LM/QbKNa9if4eh3FyMle/I4fh1W+Yj+wXZoSySUAyAuueZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+yFPHtlgflRslhcZ8K9Ddu5pWXxoDqTj8fSjTgmqSI=;
 b=oLip1NI8JF8O896W0yez5nS1+QbiR9iacJy9wvAA/rNGZBNG5YH2be2VU8VyuG5iYVu7hdByNuox0N7lbWUbranTUF08PcY7nIhSAdrxRGlhKUnMexPr9GyB7DWtOeFsNhdp/XzU2KwY/or+bof2s08zC4bYretdAiVPX9YnoBOT6HF6j0iSJmL6zgcvQeV9eRLjhynbnsHBzB6Pz8mNZyQm5H/i5e2ODmtSJTMdbDB2uO68v/6hgPGITxnAdFAQ9lggQIFjFaLBBc7wkYYXK4SNL3vUtfb/LSst88OjYZAR2QQZJZkn3IWHDA0tPRc8jpAsqhKAUC6pKpR7ERNL2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+yFPHtlgflRslhcZ8K9Ddu5pWXxoDqTj8fSjTgmqSI=;
 b=I7LM1RgFd57opK4XRBzS0nQTGplk5ELyniSeG4t0XMDwkOqRutkuVb7KJJo4Jc9xGAvPfE4jYp20+1V+qPTxdFTRCh5kx3Ho5XBT0Z0cUUoyArcKIaMySQLxGimFJJEbuzQGlqXgSQJh6yB4NNNXurOKTiMk6GWf46AX99aXaFg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2Rk5a46oymK8xI3MTjzKsoCggiLjnDc5J9v4ryvkm+m9eL65HGa+XVUq0L1zfaQVR0VIeb8EvtfGkB1GrDTIL1bcNSNnhecumHPQ0jcRzmOfR7I+Uf8pYILe54QpkADoUS0jN0VmbjTINvCWfL15AbMMismYKhmFaqMcKUoV7wnAoIWp/w8MkLiAAFhGMZPWgErOeldKqs1KvgBxWSmtho1bPvRxQlNuLCURVWzXD7Vw8C6arJEsPPp70nHzSoUfde3sxxkI6Rtc2eqFO7gpTricQ2NTGE0GcmI2+VOYvOpplzZpGGfZiufOAeA2iyMBFw47R9hEogplafUTiJoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+yFPHtlgflRslhcZ8K9Ddu5pWXxoDqTj8fSjTgmqSI=;
 b=jTUWIWcC35MYSzFUQWFVtLJxgkaVqFjE2HIkg61IRyz+v8s+3XaKs5PfBf8iuHkdCQX3zxYg0koEF95pxc86XfiazehZfcCE1afZ+KcJMYByEFLCC9shChvnBwqRwMwLIwNyHwpwzaGIwWhC82B+jRINTAVysb51XzDQpCa6OSKyZ2ox2k0bxzhIRCHqq+fKe/rr0NhIgWBy2vB7/WRnrA8ImhWPfmJug/lE9gkjxJ53PEVrWLt2UV7GGdeZap0tN3dXcNjjACYDl6k+UEBIga8b5dgdoFpRDklx58xlHceFPT9VAvdEmoikZCAOMtHzdbHXkZM9fDt/ZCIowUDZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+yFPHtlgflRslhcZ8K9Ddu5pWXxoDqTj8fSjTgmqSI=;
 b=I7LM1RgFd57opK4XRBzS0nQTGplk5ELyniSeG4t0XMDwkOqRutkuVb7KJJo4Jc9xGAvPfE4jYp20+1V+qPTxdFTRCh5kx3Ho5XBT0Z0cUUoyArcKIaMySQLxGimFJJEbuzQGlqXgSQJh6yB4NNNXurOKTiMk6GWf46AX99aXaFg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5] xen: Add Darwin.mk
Thread-Topic: [PATCH v5] xen: Add Darwin.mk
Thread-Index: AQHcmbF131JHt0VrQEG2yzDmCYz1i7V6VRMAgAAE5AA=
Date: Mon, 9 Feb 2026 13:19:21 +0000
Message-ID: <D2D36A19-BDB9-456E-B52E-743D5DB4C6B8@arm.com>
References:
 <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
 <15680dd6-e554-4503-8964-e8801aa31e79@suse.com>
In-Reply-To: <15680dd6-e554-4503-8964-e8801aa31e79@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAWPR08MB10135:EE_|AM3PEPF0000A799:EE_|AS2PR08MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5bb532-702a-47e0-9085-08de67ddfc3f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?b26un2mXdIQ+kP0TxO56x0a/5OPzeYc0f63PdKZA5Xl3iOJEvWoQRf4F3x?=
 =?iso-8859-1?Q?rvUD1YgvbqvNVuzl/5s517mftkInhPbBuzK+ncWUR2dtczTLha1aWsRibo?=
 =?iso-8859-1?Q?voRebg368c0xyusXTONXNBWwcsOP3Rw2uX3dABu+bBK6bZST/9giZqn8Vl?=
 =?iso-8859-1?Q?15yU+Aybq+qDZoSkA0V2fUvDtZyQPi4xB5kIhAYnb1f2UCjW1ehO9Ox9hG?=
 =?iso-8859-1?Q?ffkzSieQ0K+DIfFgHx7WR1QDxN32mokB7GOFztMtooNBuIF41/PZ6g2VRS?=
 =?iso-8859-1?Q?VIWQzcIjRUPPzz/KqGj08VDHjv3J3pv+81Mx/IVEdMCVcjv9gWAfeeSMfP?=
 =?iso-8859-1?Q?6q86IM8ooKzaSzHPrMclruwyeKLvXrdY8LytnCJwX+fOw/HxyiDUYcWcfS?=
 =?iso-8859-1?Q?jCvEnosIwpgMHQoJNqGJodS+oujNAeFB4WoD1hco32npc6z/sKRsjRc9W4?=
 =?iso-8859-1?Q?pUdZfRo8liNmiuvYYb6Ia7mIKoGz2iMmjaqW4kgKVP3PYYgu085QD2aq0K?=
 =?iso-8859-1?Q?ZWPGHiKOtMAfwoet8x+PuqRXlJbMoXhwG+kHYKXmADTRJPETkj0We2gCMt?=
 =?iso-8859-1?Q?nVT9CvuEyOavNGrWw2bEtam8WabOIDhg4RFxEJVrypKSrPMX10NSa7SWUC?=
 =?iso-8859-1?Q?NWVh2jzpxFnO0muRNRxOnnELdRfD87g6rw8jn0TwvIvwq5qkMrN4wvLsqF?=
 =?iso-8859-1?Q?kCT822nAnkGUzi/4c7lcuWdJORuw9P8UeZqI8PSxT9+bNfZGE+h/xwj2Fo?=
 =?iso-8859-1?Q?cFbYv2gWhuLVEwH2SEzDyWf8AigBBrxeVyH5G1FEeETIwBSi5N6FB9NSop?=
 =?iso-8859-1?Q?odeddbrvAhvSVVgrRRSYvWdjCFBAajs7kZEYakGDwvTwEuOWanhGx/ATTw?=
 =?iso-8859-1?Q?wsu8HYgIx5KfG3nrlm9BN9B6d4d+I5z0sRjCDF6hWAQ/hq6ecblYMUlZpv?=
 =?iso-8859-1?Q?lKgwSDixV0vQEIeVwK5TYCfZ+rBI/NqK1AZN+9rmzQtLJbddJx0aKPSc7v?=
 =?iso-8859-1?Q?5qwwbRBM8d2zhRdcXYy1c9WAR2fENd9JOZbvpLpvumueEH4DlST2ScqPpM?=
 =?iso-8859-1?Q?nEsumpltUT6h6PiXqJavMt9c76mxz6Ir9GPH29FK5CaCJs7VLGUV/CKetG?=
 =?iso-8859-1?Q?CBhbU/qT/YxNZgOXlLrqvpGpq7hrzjTe3PQv/n3DsycUy/8s9aFWpxvaJN?=
 =?iso-8859-1?Q?ygOBv55vwFt/R+jSRTznjgoYQnOUIqPfOPcipQzO8f9+1v4DXK4NuuYE/Q?=
 =?iso-8859-1?Q?vtq5gHZ3+Hv8WVmuKnzVnOnpRJoUtQwQ2lPLFwzkMnUGaboQyl830rs6m2?=
 =?iso-8859-1?Q?MRVJIeTUIjgL0ggSlAkzev1yskb3b3oghUKgS/TtDusScvS70siaLZujRh?=
 =?iso-8859-1?Q?FZARz+KrP4EHtbUv7JlslpOzMwArbEZEjpW95kV6g8yzCHTRuSUDueH7c+?=
 =?iso-8859-1?Q?/U5YCMdvQZRUGFjVNrVScTuLr3hqlRQ9N/490uMR2o6meZ7i7vUQyP7FuA?=
 =?iso-8859-1?Q?kgutTU7Ew6uuWNEwlG+u1e2cvCtRsMMGZAOSALR1SEhrzYcWHCzmepo1+I?=
 =?iso-8859-1?Q?5unKqCk4q3Sw/RZb/F4sdbU1lxTmXbQeUYNO/kJtBPgaY0YNvShOVa0sjd?=
 =?iso-8859-1?Q?bfT6CYy7bCFrhhhpe3esUheejwuQLFXfNTY9IGFGyMDekq7YWwV9wSXHVA?=
 =?iso-8859-1?Q?xjgToT2Ag0vj/w1UuuY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3C3639A876DC454CB954099B046F13FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10135
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a7a5dee2-0450-4701-30a6-08de67ddd64b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|1800799024|376014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?PD4w6+iODDDTuGJdBMDlFr+iuOLW/U1b4XKEGBtuxbr9uDtpAP4dg3Agc6?=
 =?iso-8859-1?Q?lYhbmFJF/tCpnbkFe65yEyT7IS4/J1uAgg9arb89N7uzNXbgLASx6SPfOV?=
 =?iso-8859-1?Q?55X/oVXW34ZfDTJy2cCZ0EkaaXa3ivEVV5G/nnWy6guHHxxKtZm4wHHDwz?=
 =?iso-8859-1?Q?IoX1oGmEIpyxost2uBWgUCBvkpHgKGSfhsE9st9tBa82xhos8qiTrgW4s0?=
 =?iso-8859-1?Q?mfAWpRwGezyXbVCPxqAjLbyQw6qvDOhX4IM+tz8aX4IFUijhMP46AOWUKN?=
 =?iso-8859-1?Q?xW6E6GeEn/oIEXOV7+Gl1YAlHM6J7WTnJG/c6hXZd8K0hqSQ5/vhyzUVY3?=
 =?iso-8859-1?Q?kqHs2OmxUn5WeNFG/G7BXISkqN+WnRiv/SduFzX2xan1pHzXVTBmRYHVF3?=
 =?iso-8859-1?Q?WB80AlIoYCP8KZ6kFhySrvw6i+DCF3Xi+71VjiLGAM4E16guFCkeKzp0+8?=
 =?iso-8859-1?Q?/UJd/N5XXVovAm/CWXzv41iLg90VtQzwSJRtaSmlS1j3/3iw2A2ufmHVGE?=
 =?iso-8859-1?Q?gXqfihb/D6qx8sjib6shWM4g0vOF6EfQ0cS0vq+ziTu0puWaUTjjboIxKf?=
 =?iso-8859-1?Q?5ESblLFg2Q9We1+rUzGcZvlJXFXizkK8lHRTyhPjbw1iAVEaDD3wJsPygK?=
 =?iso-8859-1?Q?hBwczAmlgnBRGu0m+toegmM1dMF3JNfj3PoQcRosOrFUtkrxdEIG7F1RD+?=
 =?iso-8859-1?Q?FlttcVax2NsT+wHS7UvS7YBnlvNzq6Ccrio6DJHNAGQ6HhIQVcYCypII3G?=
 =?iso-8859-1?Q?BUMbOWo9cs0M6Sv1mE/3TnEgCrRtjMegSFUOQe/6r4veknOaxwmrajB+L2?=
 =?iso-8859-1?Q?zrVf3Dte2sqGHmjlRz551+AMEj3gmzGfIx5N71ZR/QWo14BPN/uHAYsTXb?=
 =?iso-8859-1?Q?kYRrGA2sWPst3gxfWt4/HpdzSNsRVeHgeTqSEaxH0Mi6DZts3tnwrMK1rZ?=
 =?iso-8859-1?Q?xXwCoLT0oPdxQrboKNBoZN1rL5h91UfS/1Ffz1PThBL/VdgCN183RAIf5B?=
 =?iso-8859-1?Q?VoqZxj/arfWiMVfbBRLJyhbYbJrBiD9F/1hvMB4H3ho0VVIULFlwRRTzj7?=
 =?iso-8859-1?Q?JfHCjifoUp43v0fYjQtSr5KxE/0pNef9nwr8SRmb+dtHs8JXhDOjkVCl7+?=
 =?iso-8859-1?Q?gxFMGdUtDfapalYFOLqJ92pzCAh7Nl+vJEfgw4FKjSNSkyPUYT66/nY1o2?=
 =?iso-8859-1?Q?UJygTPba1zQiB85DlAtMWlG0/CvQR/uaF99pH/XTE1FbnMRAcOKQAfTTxV?=
 =?iso-8859-1?Q?ycV6lX20dy+mNWrQRGYVkz0Yu6o9bEAOa7rCbotMllJ6qAUZNLGGuCjU8+?=
 =?iso-8859-1?Q?vZ8FGn2WQl7TSB8+prhptSbRbmZJs+59gaJfVItPz0G+bAX5DtBKseMRlu?=
 =?iso-8859-1?Q?XiRfSHtPsCoD6vAtkmO/trJtsI+bMgKnfeejQGWEU7Rcb54D7GbY+BcYMf?=
 =?iso-8859-1?Q?Nv7HaxoyXgUeh3zWOI56xu4TbVpMdSe1gnkqI/8hUti9P7pkm3uO0AgzhI?=
 =?iso-8859-1?Q?PUXiAJ5QVRmuq5Tc1QhXcCGyyHslNp21u5/9SlNGzjlNKHXMG8nJIGVMm3?=
 =?iso-8859-1?Q?vdw9ctnNXp0RoFrkWg5SXosOFq3A5Mkticbe30Ozs9zKde5fCT1uoID0Hi?=
 =?iso-8859-1?Q?L5Lkau1BlMYVXf0yuxR0K8E6A9sWGh62kDKj7uLLZPNmmtna7EDTZ1976i?=
 =?iso-8859-1?Q?kXewOX0bZ5UYfb+VXTFwY8lfysilueRBmxqGqAwVBii/PLUB1wQc2MeWxy?=
 =?iso-8859-1?Q?+ITw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(1800799024)(376014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oczgqVtXH9KjkY9qNDKe1ga9v3XlOHgkqkLkdPEBCM8QN/icKGmpTfI9qVxh5T2qI5Xuj4dG+o7/y0z75mfTyd9geDczbwqW3AjdWylfFbQmrMMrOTu5Zy3218YITO9jiW+cFWHcnJ0GZHMeKKqVyHneeAk1NGAEK/KetYSIgGn7ZHmsi4f2gnrkIOhzhYnZY4RE/OgXLC/oF+pCN3Hu6Fyp78vLsdNFT92IG8vBmME47lZqHDYQyxWZPygbFn4jfIopk8jJaMrFz+Erwtf3eC0phZXcWyQqjs0KjmmTtP8ut4T3oO3NqfPOaYjYgBl4YlXEYUPwDQtCUFOtr9RWqMyKgfUp+zrq4L239lyCDhH162qWYVGH6p9El9vwDhj5+Xiu6w333Q74E42I3GoC0H0mS/coWhr/5J0Mo1FcfzfRbvGLh7i7GfgWYu3R5o9/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 13:20:24.9722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5bb532-702a-47e0-9085-08de67ddfc3f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9473
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,stdgnu.mk:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: B7EB310F955
X-Rspamd-Action: no action



> On 9 Feb 2026, at 14:01, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 09.02.2026 11:46, Bertrand Marquis wrote:
>> Xen does not provide a Darwin build configuration useable on Mac OS.
>> It is possible to build Xen Hypervisor (tools are not supported) with a
>> toolchain able to produce ELF binaries (GCC or others).
>>=20
>> Add config/Darwin.mk to include StdGNU.mk and force
>> XEN_COMPILE_ARCH=3Dunknown, ensuring Darwin builds always follow
>> the cross-compile path so compiling on Mac OS is always handled as a
>> cross compilation case.
>>=20
>> Only compiling the hypervisor has been tested !
>>=20
>> An example of how to build the hypervisor for arm64 on Mac OS
>> (tools cannot be build for now) using a compiler from brew:
>> - brew install aarch64-elf-gcc aarch64-elf-binutils
>> - make XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3Daarch64-elf- HOSTCC=3Dcla=
ng
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
>> Change-Id: Iba91634afbaab58767bb8744b4b722ce5732a6dd
>=20
> This wants removing, I suppose.

oh yes sorry for that

>=20
>> --- /dev/null
>> +++ b/config/Darwin.mk
>> @@ -0,0 +1,6 @@
>> +# Use GNU tool definitions as the tools we are using are either GNU com=
patible
>> +# or we only use features which are supported on Mac OS.
>> +include $(XEN_ROOT)/config/StdGNU.mk
>> +
>> +# Cross compile on Mac OS, only hypervisor build has been tested, no to=
ols
>> +XEN_COMPILE_ARCH =3D unknow
>=20
> There was an 'n' lost, as the reason for forcing cross-compilation also
> isn't stated. I'll take the liberty to add both back in.

ok with me.

Cheers
Bertrand

>=20
> Jan



