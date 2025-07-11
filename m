Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5D6B01348
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 08:05:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040457.1411889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua6se-0006Tz-KK; Fri, 11 Jul 2025 06:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040457.1411889; Fri, 11 Jul 2025 06:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua6se-0006Rm-HM; Fri, 11 Jul 2025 06:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1040457;
 Fri, 11 Jul 2025 06:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cwzd=ZY=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1ua6sc-0006Rg-Ec
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 06:05:06 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcfda8e7-5e1c-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 08:05:04 +0200 (CEST)
Received: from PA7P264CA0199.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36d::19)
 by PAWPR08MB10019.eurprd08.prod.outlook.com (2603:10a6:102:362::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 06:05:00 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:102:36d:cafe::a3) by PA7P264CA0199.outlook.office365.com
 (2603:10a6:102:36d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.26 via Frontend Transport; Fri,
 11 Jul 2025 06:05:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Fri, 11 Jul 2025 06:04:58 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by DB5PR08MB10047.eurprd08.prod.outlook.com (2603:10a6:10:4a0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 06:04:25 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 06:04:25 +0000
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
X-Inumbo-ID: fcfda8e7-5e1c-11f0-a318-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Z404LLJKFjtOgiWFtswhRMxrZcwCgr/jVM60qFlklhUEq8OCEsFReCBrKQS+MRWei+AtwUIJpZX2/a967EOEp6TuKE49xJsiPKf1ey7iLD9eejzgjxEdNOlZHSgBM2i2cVxfWQJ4pR9Nf7CtqFjqsCEXitA4pfYFIiXVHkPeje5BALOvjpd9t0ykiOfokTHdIgxtMrc/SQNK7MRV6GNuAF0BqAG8T/IPMniIMyFupIYmzanfTu1WcBw3GPsoXMQh+Q1VOkUNUjisUmr6ySrJw/5yfA7zAWrCUDQwMYkk0lKvOamKXkWJgCIVn2WR1SbqK9/uve/5foFVJjDknEX/KA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHqF4E74Z3XVbu/u6ww4c/C+EiWf0VcecjJHUFhYwDo=;
 b=GiOzdY8XJAkBlverzhYbtk671Nu2ih9pIO+reEyZBkQNVMdv4GdYE6XJRTLgBcrE22+oMFMHKN63gY7YefzfRPcFHFntwbb3XFmsRWBrpWxlAVF8534tO3UgkBsvhcNP3b6Qr/gWEjUO3Du5LxB05veFQ+aXtiG578Q3y8LJHlnfJI7AyTlOYd3IgF6KnmNcUdBcUb32dk5QeI8gpZghn4e1ae6gWERjJoU8L8owlhwCOF/dO19HRrpDFwNzEIrpl0KeHjtnnHE4cbfj5OLaWFhg5HU1ZGRlauLiejxrabgfRK0C3u+77m/ZqvbNa1SuWMk4I6DZqtUaQghhUgMY7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHqF4E74Z3XVbu/u6ww4c/C+EiWf0VcecjJHUFhYwDo=;
 b=b1/TmnGweJsYoke9FGNd13WDqHhiee/pg2zFTueGe1ZvKh16NxH2tqWDdTfImXybhnuoDfHj8mMt+nOpFEiROPO7HuHIf45/F7uItNTePrKMb7udUoZugeUCwFp/MDZkNn3CyoYBRH79QqDgVQmX/9yRBL+QuX3F1fFbepPYj1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUYoLO3VBLw5v0IoHQS9cZwC0EvXrJFjYxOP6LjseNCmf1gS4djocDnr4hkhjsfcgd3jvp5YVYlDf4cq9DjKFSoiWeQenGpyr8jNlGSd6RXnVmQvAE59/XTtt7YKKeJ9RCpwQAb/E+z0ajbCNoYM+DXFSTIyz3ySOFwsXUwEiskYSsQKSKQqNa7RvEi0Xh+A3EUapiWKFWXebaRZ0oboVP607dgI/PQMUMMaBhO/jzTKV3FT3m552h9WI9f6J64cdySDmrmLS4EsBwpnPeEa+GDCOMMCqnp8fTkRCnCza0ngTlbtcvYxlWmwokzTF7JYEuef7b2lKNk0COuXrKdATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHqF4E74Z3XVbu/u6ww4c/C+EiWf0VcecjJHUFhYwDo=;
 b=oQj5FhpRrF4puQLLrILyYpB6GwytZZ40uwSxEwcTIJ58Wr49S0DZVZmu1k0uCl4oS1HbPWFOk8fP96jVVoOa67ufrGtDXG9n9PjvQDvffTr4xYqjO3KsXuhD22QTFxI61rJOUFAeOL/S+HXEyPy1hBcpdMhMLpTvLR+ryXoTGp7opndfxQPwg7ntLHSn+JnQ/DVGNFW5GquohVDJHT9aZ5qmNdXks6UIoTxb3V/MI1zqBY2nhZ8glLFogcqXO9dd/JkVUz5GvLsQuw4dXzmV4zwEWhBH4lCDxQMZxxIAvhZ8lumiMCwu+D9AEBqf9TafGBYAPDN4xQ6l5PCbUOrklA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHqF4E74Z3XVbu/u6ww4c/C+EiWf0VcecjJHUFhYwDo=;
 b=b1/TmnGweJsYoke9FGNd13WDqHhiee/pg2zFTueGe1ZvKh16NxH2tqWDdTfImXybhnuoDfHj8mMt+nOpFEiROPO7HuHIf45/F7uItNTePrKMb7udUoZugeUCwFp/MDZkNn3CyoYBRH79QqDgVQmX/9yRBL+QuX3F1fFbepPYj1M=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v2 4/6] arm/mpu: Destroy an existing entry in Xen MPU
 memory mapping table
Thread-Topic: [PATCH v2 4/6] arm/mpu: Destroy an existing entry in Xen MPU
 memory mapping table
Thread-Index: AQHb8KgBNlCBCRibX0umgPaurd2jQrQscMs3
Date: Fri, 11 Jul 2025 06:04:25 +0000
Message-ID:
 <AS2PR08MB87459AB8D0BC1C09D20984A4E24BA@AS2PR08MB8745.eurprd08.prod.outlook.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
 <b3ed60f28d7234f4091196d7bdab8c9ae12ea6d0.1751464757.git.hari.limaye@arm.com>
 <8b8592ea-2508-435f-994a-826070cd68ff@amd.com>
In-Reply-To: <8b8592ea-2508-435f-994a-826070cd68ff@amd.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-reactions: allow
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|DB5PR08MB10047:EE_|AMS1EPF00000047:EE_|PAWPR08MB10019:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ef511f-d077-4925-c014-08ddc040dde6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?iPfnM5cwRkWO9TGT9CeJ0jHEFDRsYfuMlghjehrhxng5Ge8fAjSFHlIGlQhI?=
 =?us-ascii?Q?MTkQnu8yhSdfy6PwLf1WWp1upjvfshUtpPLv+tZQS01CfvADiYE8R/E7ccoT?=
 =?us-ascii?Q?ODyWTmoiUW6SFji/o552KtZkbvGAaRJvc04qQK1a5eqKfK8gM8hlMoDs6Y7v?=
 =?us-ascii?Q?WQo/R1pRE1qoL+1njQkmRy1Z4kiGH9eMpaX6mYdj5HC08bl/p2GW1O/bAbOj?=
 =?us-ascii?Q?vcgwsDZ3b4Uskh2Vm+GyrkD1lCvFVjUdP1rMsJx6VnTIcgHczmPFASojImDZ?=
 =?us-ascii?Q?YiXrBb7MW9qQv7zrsw0Ebtyn0TQy83wnyBIDMrDIVjAInkk7nOUiAP9zPehF?=
 =?us-ascii?Q?Iij0RrnR2KpcEBHSVIBRhWtAHbfId6TkKBcCswcfz9Bes0Mf1SoH/hgDhDIH?=
 =?us-ascii?Q?XI/N6isn9lc4KZbrpv4dxfe9HaKzzH24k24PDgxub4p2V18RBoTEgmMUrG8T?=
 =?us-ascii?Q?JJIeEwm9Chu8WxZaI7ivmHuN0VPGXukq5M5alD68MmyZNY6ybuCJ5PjD4LGQ?=
 =?us-ascii?Q?lxtkwD4/ZKtNJ0Wl1atGXXd/NadVQjF3wpuKLSqLPTVNoUmyEFXtt/Uj8USi?=
 =?us-ascii?Q?ItthcP1qJZWpFX/laIUZqPE4i+m0yQiG7oOC/2DekOIOmOrBYJwciISfXKwb?=
 =?us-ascii?Q?cR2xD+pOTNj+N+aanJrNGDrv+bjlfGz+5ub36MGKJPKHnqJWSwqo2wHBKb2K?=
 =?us-ascii?Q?/H0gA5bxYJ3n2vGXKvobrj7MT1CgzYT1R5d3XpWU8FgFIzWHzSp32lvh8ZKY?=
 =?us-ascii?Q?D8Z2RBrmtHVSQyXBHAvqJckw4qMAvTOSWDW49QKTmdcaQ/A46rZzgv4lfxpG?=
 =?us-ascii?Q?kyyveHtmNTUNSQ6QY4HBsOQAZ16x+nlJr9yD1NxlnMFOcqvqma3Gh82Sk5bj?=
 =?us-ascii?Q?85QNyFK4Xf1PF2SvCDcJwGAYSDQT/VtbhT0/CK8JRmCxfMKNOgf+4ctpKWbC?=
 =?us-ascii?Q?YIVLVPuAlj89xwvqPPce9DzJRIyCNq8gJC7b8VJq5lAt0NV2gRoNbNbyX1D0?=
 =?us-ascii?Q?Kqm5EOtK+SqRlTMdnTMuoppoA//zJE5JyGd5kN18jdO/uftegddRR+v6draG?=
 =?us-ascii?Q?cd4bcCsQaXa93gJwmdY6gjcS7R8p7ywkQZoROmcRliF3+yaynw8rpgON4Bsc?=
 =?us-ascii?Q?meArMbzBXEgT1344eRzLvbp6E9nGT4JmasLqlxJvfWGsqqS8x5y6m0ZdgPMI?=
 =?us-ascii?Q?Or0/bbFg/THpWeAJcRtiCbNhIHPxPxrViP7MbLcdF1G8zXl7ctTXuQusIY/B?=
 =?us-ascii?Q?y9FV+69zXZjza1+q4RSlXG68KdyDIWHRhk8Oh84RRI8Ka7ScvBrzFkYnYTw4?=
 =?us-ascii?Q?LkoqfAQGaiHTCaA4v1Atld6hqjGf1Ctkt71rUyg3ZeXPz/xrUr6e7KaVghhw?=
 =?us-ascii?Q?q8PfurZoNEQje1w0zZLzakJhx8tpoSOBXO8iqMw3rA6+mR0tTUo3i7xAKwn/?=
 =?us-ascii?Q?fciqZ0xqnXWbp/FrLCc3rQMWO8l/l563g7AOWcbbSJ81V5AIkqqbVA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS2PR08MB87459AB8D0BC1C09D20984A4E24BAAS2PR08MB8745eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10047
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	df3ac2b5-6503-4e15-8a87-08ddc040c9ba
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|376014|36860700013|82310400026|35042699022|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VXtcvWnxzeB+vnkByhPMKY7/JBD1UnG7Khc13i7NIwxrHqmH8VKLaxzFzDZJ?=
 =?us-ascii?Q?0XElY12UJa+GX5i80rvNu/EU1knsE7WCwt0ZLBIzddAM0jxW4gfcoC/WF8zp?=
 =?us-ascii?Q?uPEDMnz6QeSs8RQKNiEQkRWVH5MlgS8d38tEtHvE5yhevdl/OuLqgVkqVI6T?=
 =?us-ascii?Q?7lwJKPh0vUa0KAamWhuVJdWKms1sA5pPmzTwz49qkUtw57SNb56Ue1hK8hsk?=
 =?us-ascii?Q?vXJ0zelVj/UCoSHYl959wYrI5pUB4H/L8TPfr/H8WoI5jvUQX4OXLiu6rBPq?=
 =?us-ascii?Q?3uUejmqGwyFjd3fwkodZHAymdRwDFjkBTucQsXvB5X567JuMoDiXFHIgTChj?=
 =?us-ascii?Q?kFwkk9GZlxwqm0UWUsoZBn2INMj0a0AVJQ3CGPDSNLnVLQ65AL7sY4aGp3Nl?=
 =?us-ascii?Q?Il/n/JypDGYkx5KxrKlD7zxMTFDD40MreIrSSCj5vAdpLheYQfnMSzjr7j/Y?=
 =?us-ascii?Q?crhFOTzHmzoxe/UeMlCijvdLM0pYQVmCRnudi+ah6LMmyUgkcWOLdtnXWcWT?=
 =?us-ascii?Q?WmAyaUPtOhjidCPyFjwx+hlu4TByC5B0G8FyCWth5URPX1X8VUsxIvxRRqPY?=
 =?us-ascii?Q?Pso4gZrcsHEMD7Mc4PUi7cAni7EopicBDGqmNZC44sUt9zO7DFEd5vAKVPBz?=
 =?us-ascii?Q?VxOjf3luxFe4hNzca2Ips20eA3GngKBDi1gSohpUyw5Hf7/H/YAhJAzcIa7u?=
 =?us-ascii?Q?AagxCdQHUKJG3YyH//lz4TB105E7+jUzkazzW+bVCbFPxy3v8kMDoklRNwru?=
 =?us-ascii?Q?/YTVvEiDq5PE9DhJuDlWXB4hm/ix67vlU38RFZXZa8OLWnqNGN0/r7repUbn?=
 =?us-ascii?Q?ubaUm+u3C1ZsQM66k/kUW3sMVuht8rcvN4JLsVn0XLj1rVBtrvcMU8lCOnDH?=
 =?us-ascii?Q?wcWkBh2u6Zn86lJCZaHfDX+O84MpgWynGvJZuChtV//Mr9WJkxtrFszpija2?=
 =?us-ascii?Q?8NrYyLhWyjUE38KZOolWlDspJFDx9lKOTLG92RbH86bPbw9lOBfgzqaz9d0n?=
 =?us-ascii?Q?PI8yHrhkM5oBxyY5a7wzTFivkdow2oJUy/YSpIik6MWw+c7PXUPJDbfrq70s?=
 =?us-ascii?Q?xTakdyr06Sm9XgYMhox+i3UxnxxhA+Xkp/GniMFglLTsfkkxkz9/ftPb5sij?=
 =?us-ascii?Q?bQCrUEepTHzrvGqpU7TGjAxNs7Vrq2UKrrUA5rMhBXoDGnMmKQHigb0IgLC9?=
 =?us-ascii?Q?fQl82UhaAIQM/lqoluHyPhNtF15b0GSXmXuKNpzBysik3SDnSSS25OIQK4/H?=
 =?us-ascii?Q?b7/Oj4gkpR2SDZHRDZXvDL26Dm/hvpcPCusz4NmALOLnf8ClmAmemdHRwLTf?=
 =?us-ascii?Q?9WUm9NbN+1RwYyMY9IrGIP7y8pIUUab+WTcMJ06tLEiDYtnD/ZDiHaUwY6hy?=
 =?us-ascii?Q?qNALR8A2I6HxajJtolFYJG52wUDX1grWnJfbgn5G5+iG3E33UAiyowW2CBKX?=
 =?us-ascii?Q?2c2CX6AIBK8bCe5eAXEGm/SyBf64TerHvIKsr0zHbLiHzcbN0XVKel3F9PgU?=
 =?us-ascii?Q?5GaPysDVmoSl8Tv+rhtT04ZQXELEWYE69Yjv?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(36860700013)(82310400026)(35042699022)(8096899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 06:04:58.8769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ef511f-d077-4925-c014-08ddc040dde6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10019

--_000_AS2PR08MB87459AB8D0BC1C09D20984A4E24BAAS2PR08MB8745eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Michal,
Thank you for reviewing the patch.

> > +    /* Zeroing the region will also zero the region enable */
> > +    memset(&xen_mpumap[index], 0, sizeof(pr_t));
> Is it ok that for a fast case (i.e. 0-31) our representation of prbar/prl=
ar will
> be different from the HW i.e. xen_mpumap[index] is 0 vs only .en bit of p=
rlar
> being 0 in HW?

I think this should not matter - there is nothing reading registers directl=
y and
all the decisions are taken looking into xen_mpumap.

However, if you would prefer, we could alter the logic here to only clear t=
he .en
bit in xen_mpumap[index] in the fast case, so that things remain consistent=
? Alternatively we could always directly zero the entirety of the registers=
, but then we would remove the use of the fast case entirely.

Many thanks,
Hari

--_000_AS2PR08MB87459AB8D0BC1C09D20984A4E24BAAS2PR08MB8745eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Hi Michal,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Thank you for reviewing the patch.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&gt; &gt; +&nbsp;&nbsp;&nbsp; /* Zeroing the region will also zero =
the region enable */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&gt; &gt; +&nbsp;&nbsp;&nbsp; memset(&amp;xen_mpumap[index], 0, siz=
eof(pr_t));<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&gt; Is it ok that for a fast case (i.e. 0-31) our representation o=
f prbar/prlar will<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&gt; be different from the HW i.e. xen_mpumap[index] is 0 vs only .=
en bit of prlar<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&gt; being 0 in HW?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">I think this should not matter - there is nothing reading registers=
 directly and<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">all the decisions are taken looking into xen_mpumap.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">However, if you would prefer, we could alter the logic here to only=
 clear the .en<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">bit in xen_mpumap[index] in the fast case, so that things remain co=
nsistent? Alternatively we could always directly zero the entirety of the r=
egisters, but then we would remove the
 use of the fast case entirely.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Many thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Hari<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_AS2PR08MB87459AB8D0BC1C09D20984A4E24BAAS2PR08MB8745eurp_--

