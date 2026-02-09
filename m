Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMIsGnuMiWnP+gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 08:27:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662EE10C6B8
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 08:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1224947.1531391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpLg5-0000GG-Kw; Mon, 09 Feb 2026 07:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1224947.1531391; Mon, 09 Feb 2026 07:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpLg5-0000D6-Ho; Mon, 09 Feb 2026 07:27:25 +0000
Received: by outflank-mailman (input) for mailman id 1224947;
 Mon, 09 Feb 2026 07:27:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpLg3-0000BX-SC
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 07:27:24 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5263012-0588-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 08:27:21 +0100 (CET)
Received: from AS9PR06CA0582.eurprd06.prod.outlook.com (2603:10a6:20b:486::18)
 by DB3PR08MB9136.eurprd08.prod.outlook.com (2603:10a6:10:435::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 07:27:13 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:486:cafe::fc) by AS9PR06CA0582.outlook.office365.com
 (2603:10a6:20b:486::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 07:27:19 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 9 Feb 2026 07:27:13 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAWPR08MB8982.eurprd08.prod.outlook.com (2603:10a6:102:33f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 07:26:09 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 07:26:08 +0000
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
X-Inumbo-ID: c5263012-0588-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OyyTekr4r7jlgEsL5bmYXqfMuC0vi6uQbWBV7Z0GZIBhRT8c6ajxMUpTdnypCoty6dq5U6hhY7LxAIh/O7SXebzO9tpZY0B0/FvKiDVdDj7j4HjaPAeiHmCDpPM/uy0QHHLkxg/w3GnQ7pwGIKATSwgRK2mGr+CAMp8c3Kg8t1YFig1VQpPRrC0ZCl98cOGrBrl01MZ8JkGAKiTN7rgbsvOfzMwICQBMXZq/R9jgj4XXmX1anPA7ZOs/ykLFg6uWrXGT7Y2zPy3CH7MfdY88bW63dDn0g1zErIpovM2p3fijfj88+H+McHK6PZrWB5pFeoU0UJf8jMOYhS2TPsgQDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUUTfMYYaBZ3xrrZiJBRATlMTMjWxXeVJnrs26n2EiQ=;
 b=SeLcLSwJAcRxdi2iGAnuRvpvsiymuxv9ETydj7LJyLIMYPxVesCThIAV33lcDnNcQQFA1gUgkCt81OJx47EtTXsHq/EVKA+QUt22N74NSjUyNSn1G24IB/txwcxifbXAWTL5SWgrGInVQ4KjsBQ05KP8nZ6XgQCiNHQP3JyMzaQuUkn4244M+aSF+4oNx4oyg7WAwoXMdUzz3mqsasCGjmTvwOWimbqskNj79qpKMIAves8lgXZTzD84fzqrNpT3hRxJIw7NhQzZsrb4yx7EtZ0s6GVYdsZ2v22twKSm9Ae3O738HuWwC1CwyFrHqR3ma3LhAlHic+nZfTinOSwfmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUUTfMYYaBZ3xrrZiJBRATlMTMjWxXeVJnrs26n2EiQ=;
 b=OUOg8clW94WxM0AyGnvuWC4oKnPA3eIv3uEU4hR4dHgEXzOlcgewlYeTmdUi4E02TRTdtcLpYHadnsfWteEuDB5UagirP86ehIVXLV/fbPWYIaGbGRyPQoRFLbweev7bUkseFwDmzsOEuWxlplrYR60+w9T4b2h7hEkKQ0wWftU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrE75YSHnk+eaGUF9CCk6YxwQl4Y9YfHLJkPrrAE4qGtbmGSFA/AY5RIE1kKjfKt3h3gzFRqPPRXhYf5o1wv4+i7BqdumtwuKUGn+dzKk91Se+3DMMIBriS5AFGJUcMf2ZxrGzGzUOhufvGocOkr5/jAy1/u+e+dd+1hYRAHxgli2EmVRmbwTDoyBjUAJfcaTDceQtALGVBHJmNfyUZGYBAB+fYxNHAtFxthgsjS7g0rntIMyCPz3Un+1Uz24s7sx93iGqFLGS2DsXdYXqpem9jiD+5ufnXV4s0Pj+Y9HYJ+S8uXEkeEvopSYWzaX+xGjSb5IRgj+UW9GPWryCLCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUUTfMYYaBZ3xrrZiJBRATlMTMjWxXeVJnrs26n2EiQ=;
 b=FviXsE0tWSWGNZBXW37Lk68RHN0nUlnjWyKu/ynanzoXk++7I6a5oBQDLF5wARGp+SSfd9l4LvuHDSD8z7g7JkPCd0pif44irBLSsjf4xjFR1MHd+BI5pbY3wrvVRBD+9QyhMAgxOYh83nh1XakwzClCM40CJ/cWktfawyF7ncLHeq5AtIx95xzUcZd3jEzI6cVd9cIMPNv+xRlMrOFLQt3nqKwgbdCZNlVtPYKZ/z3TGthGs1hhvEDea+G7RcYgdvPRi50zvDFlvvlIgmFrvCJsB+sh2iHc3Dgv+4zXpf204ztbvnZL5sfWUQBW8dpdRjRloeGPwzegf81qY9dwbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUUTfMYYaBZ3xrrZiJBRATlMTMjWxXeVJnrs26n2EiQ=;
 b=OUOg8clW94WxM0AyGnvuWC4oKnPA3eIv3uEU4hR4dHgEXzOlcgewlYeTmdUi4E02TRTdtcLpYHadnsfWteEuDB5UagirP86ehIVXLV/fbPWYIaGbGRyPQoRFLbweev7bUkseFwDmzsOEuWxlplrYR60+w9T4b2h7hEkKQ0wWftU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen: Add macOS hypervisor build configuration
Thread-Topic: [PATCH v2] xen: Add macOS hypervisor build configuration
Thread-Index: AQHclpNk83RtAc43+U+zvyNqPofiH7V4GlYAgAHjLgA=
Date: Mon, 9 Feb 2026 07:26:08 +0000
Message-ID: <6285DC05-0CE7-49B7-B394-34D0872FE551@arm.com>
References:
 <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
 <13bee33c-43f7-490a-b1be-85e8cc5e0fdd@gmail.com>
In-Reply-To: <13bee33c-43f7-490a-b1be-85e8cc5e0fdd@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAWPR08MB8982:EE_|AM3PEPF00009BA0:EE_|DB3PR08MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: c24d4632-7bcd-419e-85b9-08de67aca517
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?e0cXdmTBs6u+3DrAxCnH50or5UvIsis2Nw3cWmfgFQdnGY17DJTtRAmfzU?=
 =?iso-8859-1?Q?ChVHIbh952W0k0ghBWusp+hOaKEKYYQZPrc0L2RbQpCCOGOO3vgTJ/oZwG?=
 =?iso-8859-1?Q?e3aFq7qBHleS7JK7PMLsDp5taL5GtpZX3z/uYpUa7iMnJ4J4/e/1+hqqvj?=
 =?iso-8859-1?Q?tvA+2NxXi7OlXx5/wPC7T0tTZ9jkFpgM0P40mZ62TAy5E7eB3xJd5iIpJy?=
 =?iso-8859-1?Q?Ofai/DgK8qlgA5B7pv6Pfx7YYz46Ijn5pKBGaWIPleMPF5TWgMoYhOeAua?=
 =?iso-8859-1?Q?kdZYQsTzwaD3mPvik9Wbne6Oj+BFqN6x2/ixr7BgNYY5hXDYcXbFLoeuzg?=
 =?iso-8859-1?Q?apnCwsJtDJnWxE57cdU6YrQfy/GCoxctrLzATXvdL3iP9qlHvppWPr8uzW?=
 =?iso-8859-1?Q?1nXmQXU+akn+nfGELRGEDlYapw35XyM2KpCUlE+TTc/H+pLktdItosZE29?=
 =?iso-8859-1?Q?dflA7WhMYFrbr5DCySnjLn/fe3NNr+e6r5Tu47ZodY4suXUWsbFgdbm76Q?=
 =?iso-8859-1?Q?hWueX9/GsR2/ZzTeam2kNaPYb4gnyayX0J42Rd2jrFsI45PlF2/4zI31fG?=
 =?iso-8859-1?Q?u75qqehy2/fv/J5av0dkpNW1Jz5yMG8n8MhjnGlpdZNiHcNcdlcxwHN3O4?=
 =?iso-8859-1?Q?ddLm+4TOtC54xR1aUKFo4bIqAVzlxdNkHZk9krv/Gd37eqLZmNtosXgB+s?=
 =?iso-8859-1?Q?evDs4jVg9OvwhAUEYnngYQHymyPU2YxTcxSTXWWAAdObPr7I4F2bHXNsZq?=
 =?iso-8859-1?Q?qnHlK+u4M6hhMgsNSLUSK8J82gQJXVlxY87gzLfyZwd7YItaQw9xGu2r+3?=
 =?iso-8859-1?Q?aSUb1apQUCikrcQbnFoj5BPvGQam9RdFCotTywFTDlDlYcfW5q6WjAfYwM?=
 =?iso-8859-1?Q?OdjEWDnDliboNCB3KoLnJCCyK5tDoz510Mv1YmaojkzzwmIv5dLI7MlVli?=
 =?iso-8859-1?Q?dMcB2lCtfyhY+aHquaYAex4X200SPn9a1t/mINAZGA+KrWlWpB0CMqxD34?=
 =?iso-8859-1?Q?tklkmEnqOkrBWM4YM3l8xL0NVEGC8L3oqPg5Ganp1WSkaYRy5quuvEEYaW?=
 =?iso-8859-1?Q?7cguF7wik0GpfmDH7M9QdDVWVZxAkHMbHgnc0U+dG01RkiBqA1/CzGUDhG?=
 =?iso-8859-1?Q?jLdEhDLGG5qFXtsBt0S1BiUera9budNPKsIzj5iVTbcdWXFLUaOyZoMko3?=
 =?iso-8859-1?Q?/Q/7ZxvHl99c9zZj4TykglBbMYFBF2e0ptdVF6JZqAc91drBgx5OivLS2X?=
 =?iso-8859-1?Q?X2+2aVkSk5PQ9PRH25uWUoN9A1F7ZSjx4HyvZzBBchIRXLtqD0YLt+htBu?=
 =?iso-8859-1?Q?cA5CbTfA7hFyYlNX5oDnHbXE+hyTNNKDUk3jyj/LTViqDRpwa94249Lyvl?=
 =?iso-8859-1?Q?G2Pb2n6tUbvBH0Ygu7IIVK4AjWDrkI7q0AEYHEd6CalzSD/56pBtWKUFJy?=
 =?iso-8859-1?Q?CpfeNu6fefNYjtn6s/qNg1yHQgGTQARebRR+2WBB7lElgjv2p60QeYBhO7?=
 =?iso-8859-1?Q?mQWqSXDXVE9sAkjJriO2e6TiXIXGr8hpVaZAt//SyITe4Ktb1WnUvB6BH3?=
 =?iso-8859-1?Q?2d7gsqexEMS85ARbxVsxDVCaHzp9trdcZGRgcx2DDOvx+40F4JJoLkCcJH?=
 =?iso-8859-1?Q?c/KT7CLYkwWCE9wSNwVyVXlnXgHsiY78brVoJadaxE7yiF9z4mN9aLIj1N?=
 =?iso-8859-1?Q?oA1w6eHnkjbOBQBbVvY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4FAD67B52F7ADA48A46A1B47CFDE7E05@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8982
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9e30bcf7-5aaa-4776-47ca-08de67ac7e88
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|35042699022|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?k/UWOC5nAPSiyvt7Wa5b30oxE465nRGr+4Wwv5uIMfnuu68N/VJo8FkkuF?=
 =?iso-8859-1?Q?4+0xXEcMnUE36p8fy+BzNnYEjfDLPqB/5Tju61AbGxxsmIehLDR9r6csbd?=
 =?iso-8859-1?Q?3W1uUd4uKx16aqITsKKv139iIwDXCu4oyMaQ5JZKNMMqWLIl3f8txlwbfa?=
 =?iso-8859-1?Q?QnKL4nXjXTlkK5ULHxDP11OwKU/mEipqxGcMCHZ15fvFSLP5ySKZuKDLcf?=
 =?iso-8859-1?Q?HNVMnKbb+mUmO6R3n6/eIqFflApleqQrloTGF7mHylSLmW7r9isYnocVZP?=
 =?iso-8859-1?Q?/slNFN5FA2ePudKxeWPN2nen7vDkNmU0CRNIH/J484nlCuUHVpeZeTw4Qa?=
 =?iso-8859-1?Q?PEVBxuj6/PxmbApteQJ3fkXubVnY4RyiMQ9tTMTAW8jFtNgxw542+g3Ck9?=
 =?iso-8859-1?Q?6nHPnvKsemvREx9SAm4c3gEiJw5BW2tvKxo8wZUtH+PlY1Z9RDBpbdrhZY?=
 =?iso-8859-1?Q?yNrqlwu7h86cM4PB/QhdX4m+svgweBxpnnALJT7mc3oQ1KjcwJEYFfmzsa?=
 =?iso-8859-1?Q?uig0phSBEkPaIeZbRfrtpkKVxiyGCYAEIGBkXrFkCZtZM6mj+0GiKgDDQ/?=
 =?iso-8859-1?Q?PVwO90sG9ZKfpj6ZnDnzHV+VhjOhDEfK9Hm7LREsuKDmtPvQw2+8KjWqsy?=
 =?iso-8859-1?Q?iDpEfLdFZBq5SfvAYWLOz03bdsrPWw+P8twXpvp1auGuI/2BPjPeYnjdnh?=
 =?iso-8859-1?Q?29XNlTUEopzPyt+8ccAxiEcwIGt/UZmX6lSRJQ5tzHAxDYMlauynNsSmAc?=
 =?iso-8859-1?Q?LxCVWeS1QkUDLvR32brgrwBnEzJLwHZ6ERrWwpLK12cWFgWWNYBobHLcoL?=
 =?iso-8859-1?Q?WcI8KQlIZIDy6OHkTF64g4jMzPJFTS4o8c+X76ZfFVnZtCDfoRHfYeL/0Y?=
 =?iso-8859-1?Q?0a9rkVSKsgPH8rpw9+TBwdFhB89w+VEuxBIJN4Ng7X67YBdE4Kx+842sxK?=
 =?iso-8859-1?Q?wQNTCll14AXVq5R+79AryviTKI6x8jM7xSbzcukF7i3J/HDvuGjXWPC29w?=
 =?iso-8859-1?Q?zk6mByIZp5h8bpG8vvvIiNtakDwUnIOUTSKoKWc2R9DmW7ODfZWdslLJQq?=
 =?iso-8859-1?Q?AxGov7DlnU6bbMm/bS+SM1DCBmWM3ENkkomfOj5CWhDFb7AEcOr7Vi/LPn?=
 =?iso-8859-1?Q?jV+6PrKEWif798WMNMtlryM1UD3JekszMk5GMFgvoIiiwAfHUPsHbeL2aS?=
 =?iso-8859-1?Q?iVLLB3Zu2XSS/tMgdFDHlo25X7HbiUYnKMS8JEjqUYm5g1q5SgsLZbg5ub?=
 =?iso-8859-1?Q?CoHMymGHnQ41lRfxL42IakwxQiOG1HkBpYFHc2252gSUur4Y3ieqslKcnD?=
 =?iso-8859-1?Q?16+Ysp5PAp/r5rPsFPt+ltpPra50rrPLZsNT63YLAg8xiyaMbRQp6/IBxb?=
 =?iso-8859-1?Q?PHR4fSFoODphvU6/SaC7z3SBgZXSWOOzIw0sXI+RrX/09jFlCX1rZjDkTr?=
 =?iso-8859-1?Q?gkz9bPbzlA1OxjeamX6xcV/FlonZ5G5diPYu2czeOGQhHbTksJEN914dUJ?=
 =?iso-8859-1?Q?j9fwF025YBZV4bUfsynYjE8RYIUVJuzDyLhJnjR5XYeEnJXt0Xygp8p1gP?=
 =?iso-8859-1?Q?gXC2bv68Sqhq0xjhlpQhPM2fiTYFkzjkzCg4leOU9VXUUroyLJyB7zcCE3?=
 =?iso-8859-1?Q?1ugM+oUrn7z+nKnz/rVZjoOiO1RtIzl7gFM8bebxu80NZAqB8VleIMJKUi?=
 =?iso-8859-1?Q?BuTc4dpi/Ux7Bwp9SulffnYQtj4llx3gxaXonZQUnvt3PJUv7b+Ee6LhsJ?=
 =?iso-8859-1?Q?LS6w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(35042699022)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HkKWNhIeJL8LNwihEIq42c5eQbjhfjLZPjp7n7zFnSR+Wu26M6XVIMqm9+VnDeMHfs7sbmwe4OR2C6KnuFQwxXhz2lsDus2m8L2Z7Ycejyp48708szMTN83uaWe2iIvbdXmvJADx6Z//Xi38PPNO67pNAMrLd9fGNVGdy5w+uSdTiNb0SL5nwRXJjS+9JzWaEbhFI34GCrK8LvMZId8RfNAUNdU0o1KT8/5lxmkHa95WskxMGHKYH/HAnNJTvhN9ZftWF9OMaiTb3TpHjAQQqeMSMET8z2UvURUVNj3y8tpTWLxVtR9YnNYQmOxHRKQTnfR9tUzDYi8tf3GAO9u5hnPXka7s6i4NcR6sqJc3qOqaG0eY/HG0KXux3MIKtKV9PjM6mHhBwXgrvHhjHGBdV9m/WhkADYG5mPkGVFwjJJwLIsDuI1EjaHG7WU7sisaf
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 07:27:13.4164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c24d4632-7bcd-419e-85b9-08de67aca517
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:demiobenour@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,darwin.mk:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 662EE10C6B8
X-Rspamd-Action: no action

Hi Demi,

> On 8 Feb 2026, at 03:36, Demi Marie Obenour <demiobenour@gmail.com> wrote=
:
>=20
> On 2/5/26 06:33, Bertrand Marquis wrote:
>> Xen does not currently document how to build the hypervisor on macOS, an=
d
>> there is no Darwin configuration for selecting a Homebrew-based GNU
>> toolchain. Native builds are not supported; the hypervisor must be
>> cross-built with a GNU toolchain and GNU make/sed.
>>=20
>> Add a minimal Darwin.mk which selects the GNU tool definitions used by
>> the macOS workflow and point to the build guide for required tools and
>> setup. Document the Homebrew cross toolchain and GNU tools needed to
>> build the hypervisor on macOS.
> What is the use-case?

My main use case is development and testing on MacOS.
I can do a lot of stuff by only recompiling and testing the hypervisor with=
out
changing the rest of my test environment and being able to do it directly
on my mac is making things a lot faster and simpler.

I have been using this for a long time and someone asked me some weeks
ago if that was possible so i figured it would be a good idea to share.

Cheers
Bertrand

> --=20
> Sincerely,
> Demi Marie Obenour (she/her/hers)<OpenPGP_0xB288B55FFF9C22C1.asc>



