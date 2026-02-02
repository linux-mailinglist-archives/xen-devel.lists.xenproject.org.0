Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBw4JGHOgGkuBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:18:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AF9CED4E
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218929.1527829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwd8-0001eF-E5; Mon, 02 Feb 2026 16:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218929.1527829; Mon, 02 Feb 2026 16:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwd8-0001cP-Ay; Mon, 02 Feb 2026 16:18:26 +0000
Received: by outflank-mailman (input) for mailman id 1218929;
 Mon, 02 Feb 2026 16:18:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZj-0000fY-38
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:55 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bcbe92b-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:48 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI0PR03MB10299.eurprd03.prod.outlook.com
 (2603:10a6:800:202::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:14:45 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:45 +0000
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
X-Inumbo-ID: 4bcbe92b-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYfIWbtMrjg2nYLxoQya/k3TwKtY9LznINQ98O+8qzcfGO7uJ/oE8tPydCjXS8tfcikReYytSyZHAEG7a1NgFL6DIaY0kS7d0vAiVMH8s5DhvYjQF2UZCbCkYRFiR/ek2fwZBBO8dq3yVG3D0htnPP4YFB+HeJe6S7jKZXq+Fn0i+K6GYvS8L/7IDL3MDU2NBRyFc4QqD71/McQ5iD3ixb1Agxae+jlodYmSzCQpYCmlVVw0dGxP3/uWaQzdI2YJKcR/KkTzZEr628kOQ3ANxSjTUPUdneKErY91kIJbjIU7Mjb7IVCoqK6aub0UnIAyhRHEnjKmhrzXB+eXU2As/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wp+CiOFmbPXN19I1ClyhnDa8y/Of5ZIcvETuWgCaDEY=;
 b=H5E4zZiSC3+vfz3NsPmS6O/KNB1jvFUhe5TF63dLqqEy4fM+DaaUwzlJCf92ubkF1SZXZgBOzTn539VDdnxhY7QWXwaAUgw+qVExe5KIHLDHWEyhWXoWSAQeUHZEthufjC4jE9JA4F6reNcGH1LAPJcv1JcB6Q00cJ3mLIU6rKZM1QXlpORp5bobqsniRhfK4sO2XC26EnYEtnBbTcFXXr2nfGIv9+1NarlSnOW6WaXUPQkwE9uyjX07x3KqMjr502iw2VYACA3sk7eVd3+1ATLIs0f9warRYc8/GThF2KYzSbbyAaZorzSZ3JUcm38+34wPnWFgU9oOOTfLhBM1SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp+CiOFmbPXN19I1ClyhnDa8y/Of5ZIcvETuWgCaDEY=;
 b=SPnLvz5kaKhvqzjfEui4UCRpSq/tKzW+uHpqLS08Fw7tBs6wX1B2Igil3fyBfx3FOJ1GAAmatHEReMj4dEA2LY9D6UGhLif+xM/RQuNM0KVU9fVmYLM10EA76mrwyhAG2lriv0XILXDlLMMwlQ4xPui0HMBfPI8r4akwitWoWf3kciE4QbIq2avUFhGkTIwdqvjgCXwU7O4QAqNH0PMyfBzu8PsaE7bH/ydI4XXfeMOhMStbeDdGLk9BkZmvGi/QFBIaKqdiKie6NrCQIXHrUDZn2U2XVo+s1PjsbBhH1EXQRPNGLa08RijWwdoVRCqopeMV6s1esghSpnQK94cZeA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 15/19] arm: Add gicv4 to domain creation
Thread-Topic: [RFC PATCH 15/19] arm: Add gicv4 to domain creation
Thread-Index: AQHclF8Knr0LoFPnik6/4BE0GszmIw==
Date: Mon, 2 Feb 2026 16:14:43 +0000
Message-ID:
 <61859ae57032ad2da9c0eec5fb30dbe4ecc8c0df.1770046465.git.mykyta_poturai@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI0PR03MB10299:EE_
x-ms-office365-filtering-correlation-id: 1ae26ef1-ac91-4f86-2655-08de62762e45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qYP+3cKy+VRgEU9LlSvKZuWwgpqt44IZZ/pSxcu9g+0fcZerPOxA52+6RT?=
 =?iso-8859-1?Q?90bXOEr3b+0GPGODLonIHuUs+s9UnFqXSpSquZYhfcOmO9+Hr57gYRVwUn?=
 =?iso-8859-1?Q?mf9iZBLv+j2nix3XsmM9AyFAXd1XWsWshfoQrdzY2GIw2vMxITR7AeGZnq?=
 =?iso-8859-1?Q?JuM56JAvk21oae5oJHjkMbnsokjU/wDTm8e2u/Kaib4AdK40s7lmgHhhHd?=
 =?iso-8859-1?Q?4HE0xqUDW0z0Bn0VwPP5dixvh1xHTVEm3LCBIhNbkRQGriQQ8g//3Dwhok?=
 =?iso-8859-1?Q?+R/D813NUUxheVHcAER9UfmYDAyHFaxXF6cXsj7i/4+OEsJxpbXLAyPp3r?=
 =?iso-8859-1?Q?hOVWfiYaWEAts0yx/YydI5bKXKqFHu85GydRjQKvbqttzA9/XktawHkboT?=
 =?iso-8859-1?Q?4sEW/0AUakzhtLxyt+BH7Mh0XueYFyYVaDpKQzelUUVUYcL/3rP+QQ2VGE?=
 =?iso-8859-1?Q?A0RpQ4zPvlcsRgXK/RAqWc7izF+c6kWdrQ64spBFzqWabcB+6adk2rif4P?=
 =?iso-8859-1?Q?aYsoF3IJ2rG/7bpQlqr9e2DpjlnKpN+t0amsWpZUtafImVcVoyUyKP7bkv?=
 =?iso-8859-1?Q?aeXKwZlWV73NFj2+0VPJ2f7tNELFOCKuLtMZoV52W51GopIdxTbzZ+W4cH?=
 =?iso-8859-1?Q?g0+Y3YWlpl237h1/TTOyVADt4R0NldEIl6ILWr4n47bXZJZGt36j1+X+82?=
 =?iso-8859-1?Q?DyFZ5odlwtDIhPDpPNrKnunVMZ5wWSmCHcTWTQ41mIGVhnvSKQ0cAVSN8v?=
 =?iso-8859-1?Q?gjX9v/W+0ryIxcOAu5c9DqesRc8PVI2P5Zqm2Yx94YmwEXB7s9cp2TR52B?=
 =?iso-8859-1?Q?WXGBwA5dE40bgpgqs0kC+j031QOzWIXc6Zv+5YxCmtTNLfuK8yns9INm+Z?=
 =?iso-8859-1?Q?H8YSNSDGwMxgh87smR7AkmltLhqdfQ/00fCMxlrhC6z7Kl3gCoDtwTGEKi?=
 =?iso-8859-1?Q?z70L7/NZ2kCt0u47dGQH43acPKf3At6aMvuw0mbE1bwKZEi9NMHn33Ksqe?=
 =?iso-8859-1?Q?W4l2ReY6YVgpZV4FjA9H8rrYKifHwrreLh9ol/2m7SRb2IUrIZNVbINoaV?=
 =?iso-8859-1?Q?728Zji2OQhLO1uEYSQwH834w3JKKkBN9taOfW7ZtHuNKrbNcKT36KIl0vx?=
 =?iso-8859-1?Q?OLGhtUgEb+MexDYqi59uykAenHFAbvwQCsNHNOp8aZ5GRpqYNitukoNz7v?=
 =?iso-8859-1?Q?SJ1gbm/cujNide2MtTVhpwgDmNFpD7Lmo5VvVd5yD6wNuK91DPSXQRzNsH?=
 =?iso-8859-1?Q?FV5hfiqvvAeCj4SjUrRhfuHGBT2yQBgwqYrNeIto5/YRT3IW4TQTPrmc+o?=
 =?iso-8859-1?Q?3TGlFiC7oy1Vw55eSufgFdkfQwYoIG8152/sPba09mk/D+66U2d7GDf5UU?=
 =?iso-8859-1?Q?Rk4ZaJvzgwJFfNn9n3Qw4fO4GxaKJbAQ1B48OqnkRtsBD2tm+FsjKP7arG?=
 =?iso-8859-1?Q?mO+Wbys8HN/xoigopCVNk4dfv0SHOSkqWUBgxLiG0UqbdBeyDIgM74kISE?=
 =?iso-8859-1?Q?cvQF1eEmlRQOIpN86akts8EtaCPJg0tBIQZfPA0P6SAPKPx0cbA6GTRF/x?=
 =?iso-8859-1?Q?+Newa4xioI1Vjj+8rM3MxySnMoPiGQvB6u9hMrmdAbDgbGU1rlqF9ZFAPn?=
 =?iso-8859-1?Q?SSVOmfMQda2MhlRKjOFlPfS4bGLT5ne7z3dLsRf8TBN8Ocog4SgBbYA2fg?=
 =?iso-8859-1?Q?7mr5YxYnUK0lsryeKxU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PoJeGQ6bZwaUyq0tEO2W6AH0sJvRlUUYd7uqjEgJ+/A05I4ZicMKaW6tlj?=
 =?iso-8859-1?Q?Bgs1Gkj23MusUEL6lOPorKRc9gZEemujBPFVSDHXl1NLXOqwk088CcQrD2?=
 =?iso-8859-1?Q?QNpqnN8ViPl0a7DBKMVKcuj730rOoEASzTsZP5Akh+Up/MhM87cIWsfhb2?=
 =?iso-8859-1?Q?kBi3yaN3NwHuMZcbX7BXXXqnUROlvDvFQpFQ5iLrwskfuhUsYLcv4A+oEV?=
 =?iso-8859-1?Q?cvLsg0JGyIGhXH4KX5vgW/6YZj6MQThcsSLD9XRuy9mhBp10xw3p+gAkq9?=
 =?iso-8859-1?Q?yc1HygZVhR8dWVV2f+D/kTcxZTqxfoshZzTweXut7TNgbKQaj5+ArftEpT?=
 =?iso-8859-1?Q?U/eDzrerZ55eicWdph4jpYd+oILF/KIsD9frktple6thXMhK9w2c/e4SP7?=
 =?iso-8859-1?Q?+I5QWCNXI6JIBtx/udj724Usu5r+bapGizLoFqcwOQRrsltuXWa6d7NdPJ?=
 =?iso-8859-1?Q?5Zm1pQM9/VfqC9t1oF7Jf4eU2VlAdtnkUbqrvoFSDp2VMPZKMWmVvAF1au?=
 =?iso-8859-1?Q?QJmoeCQkbaWP3iwazn2dDJmWsupRgVaYjCTUrMMdJ3iU1ZdjSvGRRmSNvq?=
 =?iso-8859-1?Q?MuNjIZ9jktn3+eCII6n/F/v7J9w/c8SZEytj9srf64vZGSkwGL80CroKtb?=
 =?iso-8859-1?Q?wMMdwRZgzTVHAJ+CB2GchPetzNo6TPkEho5vg5qvrBcqKIEZdTyeY9tNMr?=
 =?iso-8859-1?Q?bOm87xw8/P51nfOdfwmJqIP6i02ourSgOPcnzneODlW1ZQ2ymLDbc8XaaD?=
 =?iso-8859-1?Q?eImYc0L3V14yDfnogVG0SguCh6Y6Du6fTVa/BZkwuNDlBnoAepjMtZxf7A?=
 =?iso-8859-1?Q?w0IOchvdVMoq/KXlbO00A/C0UvxiOJu3klUfszOWYXWe2P+YBVeCBKn2mU?=
 =?iso-8859-1?Q?W7K48v7bRm46IN29jcRe8rqngGAvzBCNPKNJODgPjvpl28st7b7agjAHZZ?=
 =?iso-8859-1?Q?tQ3davKORhpHDNoEho1GjxnQ6lZwZWWEjVsOamscjShxQMAG/9tMEYXfRS?=
 =?iso-8859-1?Q?DdA0MrYax+PB9yLRzmoaKMRQIo9h5amTQtl1KLWnowDjL+7Z6SSgDHS5wl?=
 =?iso-8859-1?Q?BMPBd7UiwT5ZP8pB6kNR5H3sFxWlVurp9pgcdfWDif76/hWDuAIXP1vwO5?=
 =?iso-8859-1?Q?fu95KZcscW5985mat1FXSPrcPb8WkS9RoT/RYRTaHMMWSqhWb3lQ5W0Iys?=
 =?iso-8859-1?Q?Q6+dDMzn5lK3bzwDMyaQaZ5RdVjetqCyaN3viGyM7dqW1hfR8mkRMIdD5b?=
 =?iso-8859-1?Q?DFp8OoyBoWI3sMhX3IM4JH8nFQ40ELwKU4b79NWrkbDWqP7YyVJCn1do3i?=
 =?iso-8859-1?Q?tyTC960vBQQY+tu7xgBHYopvy+93pVGc7lFzJeMOqS3Os9Wgo3Ow5zwK9Z?=
 =?iso-8859-1?Q?OAZ2Wh6uz/zT4nPL0g1bqtAAgSTf464Zvmw685TcSiGg1XRZrLVS3tw2BT?=
 =?iso-8859-1?Q?EmLn5y5WXGp1kl6cM9w5HRQmR76YAxv8kNEvQ8eLsA1tkCLbKq5CeEgms9?=
 =?iso-8859-1?Q?OCl65PZPVb003H3Wpa7b0TUcEWkGzXl4gUsaYzOjgHpV2kKwgndiIeyOn0?=
 =?iso-8859-1?Q?FMuNrJGsETPOyprYGCTTpqgaNtmlhRwbWvsi2W83SS5SdAodk/fLd0d4Yt?=
 =?iso-8859-1?Q?l4vZwvrNjKjqO11UybWBlJKRHBqm1NZbHUFcfUmRKiQNjrva6j1FgAQRht?=
 =?iso-8859-1?Q?Xh+1sMbMIb0xl7SLOoo5KcSSVX3M7xdp+cwcaCSzOaPPap64epxCjMZ3DD?=
 =?iso-8859-1?Q?8er/bxE6f4e447f+Zl3/E7nEWxltQIFVkSAHQTciAsxPEWQdtb4eDQbyUC?=
 =?iso-8859-1?Q?y0KTDkkqaPLWCIKWpwzU3g/v1rHOao4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae26ef1-ac91-4f86-2655-08de62762e45
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:43.5062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fp74PmtN5Cug13gXiPBl68BEakKfHcso4FZZLPdRqR/uGzI1E2UjMTd60UvqdGXoveRp6HSZeunJ65CV4aUkIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10299
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 49AF9CED4E
X-Rspamd-Action: no action

Allow creating domains with GIC_V4 version.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/dom0less-build.c |  1 +
 xen/arch/arm/domain.c         | 16 ++++++++++++++++
 xen/arch/arm/vgic.c           |  2 ++
 xen/include/public/arch-arm.h |  2 ++
 4 files changed, 21 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4181c10538..3c4b074b05 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -157,6 +157,7 @@ int __init make_intc_domU_node(struct kernel_info *kinf=
o)
     {
 #ifdef CONFIG_GICV3
     case GIC_V3:
+    case GIC_V4:
         return make_gicv3_domU_node(kinfo);
 #endif
 #ifdef CONFIG_VGICV2
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 507df807ed..864e5511c9 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -604,6 +604,14 @@ int arch_sanitise_domain_config(struct xen_domctl_crea=
tedomain *config)
             config->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_V3;
             break;
=20
+        case GIC_V4:
+            config->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_V4;
+            break;
+
+        case GIC_V4_1:
+            config->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_V4_1;
+            break;
+
         default:
             ASSERT_UNREACHABLE();
             return -EINVAL;
@@ -679,6 +687,14 @@ int arch_domain_create(struct domain *d,
         d->arch.vgic.version =3D GIC_V3;
         break;
=20
+    case XEN_DOMCTL_CONFIG_GIC_V4:
+        d->arch.vgic.version =3D GIC_V4;
+        break;
+
+    case XEN_DOMCTL_CONFIG_GIC_V4_1:
+        d->arch.vgic.version =3D GIC_V4_1;
+        break;
+
     default:
         BUG();
     }
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 6baf870ad5..e5752faeb7 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -153,6 +153,7 @@ int domain_vgic_register(struct domain *d, unsigned int=
 *mmio_count)
     {
 #ifdef CONFIG_GICV3
     case GIC_V3:
+    case GIC_V4:
         if ( vgic_v3_init(d, mmio_count) )
            return -ENODEV;
         break;
@@ -929,6 +930,7 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_ve=
rsion)
=20
 #ifdef CONFIG_GICV3
     case XEN_DOMCTL_CONFIG_GIC_V3:
+    case XEN_DOMCTL_CONFIG_GIC_V4:
         return 4096;
 #endif
=20
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 96365e5603..12690cf3ac 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -322,6 +322,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
 #define XEN_DOMCTL_CONFIG_GIC_V2        1
 #define XEN_DOMCTL_CONFIG_GIC_V3        2
+#define XEN_DOMCTL_CONFIG_GIC_V4        3
+#define XEN_DOMCTL_CONFIG_GIC_V4_1      4
=20
 #define XEN_DOMCTL_CONFIG_TEE_NONE      0
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
--=20
2.51.2

