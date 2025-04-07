Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EED8A7E1D9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 16:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940253.1340087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nZ0-0001mB-KX; Mon, 07 Apr 2025 14:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940253.1340087; Mon, 07 Apr 2025 14:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nZ0-0001kO-Ga; Mon, 07 Apr 2025 14:35:02 +0000
Received: by outflank-mailman (input) for mailman id 940253;
 Mon, 07 Apr 2025 14:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U9Ey=WZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u1nYz-0001kI-5w
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 14:35:01 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 747d56f6-13bd-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 16:34:47 +0200 (CEST)
Received: from AM0PR02CA0184.eurprd02.prod.outlook.com (2603:10a6:20b:28e::21)
 by AM8PR08MB6548.eurprd08.prod.outlook.com (2603:10a6:20b:314::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 14:34:45 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::17) by AM0PR02CA0184.outlook.office365.com
 (2603:10a6:20b:28e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.33 via Frontend Transport; Mon,
 7 Apr 2025 14:34:45 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 7 Apr 2025 14:34:44 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS4PR08MB7856.eurprd08.prod.outlook.com (2603:10a6:20b:51f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.33; Mon, 7 Apr 2025 14:34:11 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 14:34:11 +0000
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
X-Inumbo-ID: 747d56f6-13bd-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=b/yXmOpVw0qHiLgj/d+tqXVQ2pGOh+FniIg1rSGI4dpNh8vWRSCf8Z20XxU2lEOig9Y8QXRxudEWvdTvrowpcP74I/Q2G7v15xlQG//Zv9AbOSVpazLNHPMMfjtzjeP2/6RjYct0B64XY8WAT0WdPLqkg7hdHT9SHVBYzR3us7ZvNhCepW8s1KelOYe/NOWB4Ry5Z+CfPwgha3FYaFrCE2XXrtHZsAd/zY3jsPN+m6Oz7ciV5b86HJVvXcO7ZJ9zOqO57/ccn8IqajWEMsAC13Egd95nAKo1CA9JMnY07LCyrpKV+DBCY2sVBkMFJ7wkTuSBSQ9xmvoFON8fJ1tFxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vl6U9nejvTrnW9MbDHbtgqaWqhGxsOdtGYGJxwofSJ8=;
 b=txlsPjoLwmUD+nBbWOjolrGiFL3cdQd+asowkRT6ByIjqG5GeCjWFWh1BuBoEpEKrYbLaIMSHzsF3HN6y5K4GOurfTlsKU8iPlZjY/QQ+EvGYUwFvoCqU+ac6Z7lgHuGZ2+V58oGGHrAdJOpS/wwd0ID+AN3IaBWnAezwGHpRRaTQn7lzJISWcXBa1z0sQhBlolferFY752NjkDWmzxf+/VopVgpsUfxUAl1nat87UOvAS9AG8qKVmIT+LDM9bnEwvrlBJgkn1vrdbMn1KL9EtRAfotn4c5RILa555jT0W1U0RConPx8vu6H/WsJPnWTA8rZkHZf70qzKEcDn8yDPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vl6U9nejvTrnW9MbDHbtgqaWqhGxsOdtGYGJxwofSJ8=;
 b=rx8mHHILDXX5EBiG30oF06493YcNBfCOoA8sShn3KzDR9gJVh+jo0qd3HSuV9r826tee3uZDQSDP51bi+3Yv1HK6dfGPkdSOdo6gi26j6cUKimvaAg7hHH69p00rDCcDidBM38DWxoqQVFwgyXDlbYbF5a25UZLLNBdxULEjCN0=
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWGgiDYM+gAqIBp67RR57C9EkdPSa07JrzsgFFhL53CYPeJmVunshVcS+6MzELjWPgEEPOa98DFaNFixtqXpoB/++TBk4uMQh45sOKkPsehYIEPSaEBLQ97FB4R0llxIaPKnAnUjIsL25oV1FObPvIWL4DW/wUZTY6taZF+LQdgYs+Ye/Bju4UI0mSF48sZgoHzMVqL4PACA/b9/dKGQqZUpzc113TEkqpaC/vM0uNrFbILn3O+8f1Ezb8lREuKafakPVfo6GEoadNtSSy3RPTWIpdXCROKvnkOG327swVydgGkqdM/bMlST8G7JywuQWglicW1fyLmaHsKr89IOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vl6U9nejvTrnW9MbDHbtgqaWqhGxsOdtGYGJxwofSJ8=;
 b=di8nk8+400a6iKbE8KuNCKlYRRp6JeZbKApyMWR2ivX3N5wXSHZ6jzv5Deo1vJ95b3TbMp8ExG6Ap3fJJ4cr7OMV1L8SlgpV0V98BAmtfTFve0F4LnWO6ID3olaEvXKTcQ17JQS21VQG1YAjrmH46pBT+e4oq3BUgKmvIv5Im+biCdOiQ2BNXzX3BwPhtj60tmwnRilCaewhoyF5lGyCNy41uqAyQ/5GhrIh21JdupGPX4RH5BgYxOflVFinKAVYvjvsex4N1xeeZG/rGCMVJsWkSWkSgOCynLXLo6HelTsTS9LAEZTtO7083XzFvFn+1rg8NHUdobnTGah5aE5JrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vl6U9nejvTrnW9MbDHbtgqaWqhGxsOdtGYGJxwofSJ8=;
 b=rx8mHHILDXX5EBiG30oF06493YcNBfCOoA8sShn3KzDR9gJVh+jo0qd3HSuV9r826tee3uZDQSDP51bi+3Yv1HK6dfGPkdSOdo6gi26j6cUKimvaAg7hHH69p00rDCcDidBM38DWxoqQVFwgyXDlbYbF5a25UZLLNBdxULEjCN0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 1/3] xen/arm: Move some of the functions to common file
Thread-Topic: [PATCH v4 1/3] xen/arm: Move some of the functions to common
 file
Thread-Index: AQHbpLu5pa88e8EeQkugLRqmrl+P07OTN/eAgAURkgCAAAEbAA==
Date: Mon, 7 Apr 2025 14:34:11 +0000
Message-ID: <E7EF892D-8212-485F-980A-F0D213456707@arm.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
 <20250403171241.975377-2-ayan.kumar.halder@amd.com>
 <C6C24096-2BCC-4D09-A20E-AAB1FA923A18@arm.com>
 <a99913ea-b425-4c24-8d32-f4e2e3ab3edb@amd.com>
In-Reply-To: <a99913ea-b425-4c24-8d32-f4e2e3ab3edb@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS4PR08MB7856:EE_|AM4PEPF00027A69:EE_|AM8PR08MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 205e1790-0f27-41ec-f0a1-08dd75e1574a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NDdkbnM2UjRWaG9SU3MzVjhjQmttazZva1N6bEpQajNGMkNjZ2oxVFlGcFRQ?=
 =?utf-8?B?YklWaEZ3RE9ITFNBWlNGMkFNcDFzVFQrd2tpK2dodjVucW54MlJtK3pIOURH?=
 =?utf-8?B?b3NrWCtPMGZzampEM2h0TlR5ZzJHK3lOU1pCS3prNCs4S05sV2pidnFJSkpD?=
 =?utf-8?B?bTNUc2V5YnRoRWJFKzVZazB3K1VWS2MzZzREc1lNS21GTlM4R0tabVgwdzNX?=
 =?utf-8?B?TFNzdVBoWnlHT0R3TjU1am9mVXNkTHVNMEdCTlUxcnhtUmljL1VLOExRZExH?=
 =?utf-8?B?MTZFSi9sbFFkYTFiOC9uSE5JeDl5ZXlORXRGODBGbG84SzIzUFpIbEd2ZENZ?=
 =?utf-8?B?a2lOSVhIQXZpV09FRVVUd3VEeFVNMyt2Vm04blJjVjd0cVNSZHREMGNXNndT?=
 =?utf-8?B?MmlMN2Q1cjh1cEp6czlsRnU0MlFnQU1YMzF2Z1pueDJLZmdqYzJiczR1QW9L?=
 =?utf-8?B?SEVDQzBIa3JScXpSMXhzNk1vYnJDc2NIWWdMOWRyNXlXV3V2YTgxUDJzclUx?=
 =?utf-8?B?amRMdTBMQUhtbDB6UkJ5L3lVTTdlK1dIbEJHSTYvMU1rdzJnY3hZUVN2bmNu?=
 =?utf-8?B?NlRRV3E0Y3VyUDJQNTBnL0RxdHFtRGVuOHVETGJnT0dKdEhaSll5ZzRSQ3B3?=
 =?utf-8?B?Z1ZHaW5jZkp1bGhhenh1V05MYklQVGNhNEd3aGxCQW1Iei9YdmttdzZFVHMx?=
 =?utf-8?B?andRSGswRjgwNlY5cDlML1czVmpWRWQvQWtoWEgyZGpEMkIwRngybDNPOGMx?=
 =?utf-8?B?VFJmSkVGQXZyOVB2K0IvUkMva3UvNjJYbWw5blo1d0FvTjFyeFhKbmhjaWFJ?=
 =?utf-8?B?YzF5U3JsdjNWUTR4VUhkUGt5dUFhNHA1TC9qK0loaHZaZVk3dGlveTd5L0Rv?=
 =?utf-8?B?clFsQ25yV1M5VnlBTVRNaVlqYURvZHNmNm9ndGs0TTl5QTA2WVdqd2x5akpM?=
 =?utf-8?B?VHpTdng1eklNZkI3RWp6MlQ3K2o1TmZUWXJEUzRKSG5RMi91UGhRQXRMMHhm?=
 =?utf-8?B?MkV6NE9JaENZQk4rdkRtRVFOWDBmRWVKTTkwK2ljUzNMdnpsblRJbUcxZmFa?=
 =?utf-8?B?NjMreEYwRDUxMmVnWkdvZ2QwY2luR2FFbnpnbHRURWhQMXhzbStPaFJibGkr?=
 =?utf-8?B?MWk1RTMwUlBZN0YyRmxwNUhYbW55MkNrNXVJK29Jd0pFa2wzVGNxOUEyTWZU?=
 =?utf-8?B?elRLWENCdllFdDhUUUNZV0JSVGJ6WjE2S3g4L0NpV0YxVmNTTGpkZ2Vqd2d0?=
 =?utf-8?B?NFR3bnNGazFJZnl5Tk83Y29mclhCbi81QkRMUmF6M1Y2ZEs4VThaQytBWGY0?=
 =?utf-8?B?VzNhQzYwcGkrMTRSc1hRWXkvaUNPdTA4OTJrY3dIL3gySVBHS2wvZUhqUlh2?=
 =?utf-8?B?c3BjaERZem1EeVhkZEFhK25XZEdmQnR1SlUwSFdBeVgxbWROU0dKWFFTS2Jq?=
 =?utf-8?B?M1BSdnl2NklDSVR1Y1JaWTNCM1BIR2QyRy9sbEI1a2tGWVROTGd5NE1LTW1U?=
 =?utf-8?B?ekxCK0NTMFR1dVBidHVITGltbFArMEJqSWlDVlN6a3pKSmp5QnpXWTV0UFBI?=
 =?utf-8?B?ZlN3RDV1b2sxcGNqS3NEUHZCR3Era2N1Uk1XSjJaL3JaNHRvaHVzUVlGVTIr?=
 =?utf-8?B?RE1DWGw2Zmg0dXYwenBnNE1CRC8reWtzZHJWTkFNaGJ3cnliZ004TnJTNEhE?=
 =?utf-8?B?SGdHeERQTGp5R09GQjZPdDhjRUpEdmFINlpGcDNHYVVYYlR0bkx2eDk2ZzlO?=
 =?utf-8?B?Z1VGUjcyQzY1ZEpBenh2R2NJQXUvR3R2OVRpazZYV1FMbWQzaEd6bzFLNEQr?=
 =?utf-8?B?bzJjSkZRMkhwTk14SUhmVnBFUk5pYzcvSTliRCtveGxORUw3QWNCcDV4elNL?=
 =?utf-8?B?NmptQklzYkZwWE5aME5uVzRRM1M0T0kvSUlDaTVxR0pvUW9WdGZHNG44U0pZ?=
 =?utf-8?Q?5FBQtaMP8LHxVvsircQzmtxttRqxspr6?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <874B2B56FE988042BB3DD2E86F7A88E7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7856
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d23505d2-1e0d-4cbc-1227-08dd75e14337
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|35042699022|1800799024|14060799003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3M1SjVMZlVYNTFaT0dYM0txbVMzektQa050VmZuSklSMDdadmhrYnlvSVFQ?=
 =?utf-8?B?Q0FuUWNMSUpzSDZ3aDFHRFVVUE10cHVOWGNBcytwZ3huNCtvTmFqbnZqYVhS?=
 =?utf-8?B?b0JHck9rSDlHalFaVDlDTDNZZjVqaUxkZm9kNGxnZlE4TVk5elpaNkQvUy9p?=
 =?utf-8?B?YWgyQ3pZdXlrVzViSGN5L21kQXc1cEZFR0thNml6dk9lU0VEQ2x6bkI1S0FZ?=
 =?utf-8?B?QTRYa3MxclhFbGphYU8rYnk1eE44QlRQNEoxOUw3VGtaUXhDRC9lTTJ5aG83?=
 =?utf-8?B?Q0tXTGVUUDV0Y0hKcUt2aDI1TEdnYy9PRlNFeDMramlLdHhmUjNNa3BRM2l6?=
 =?utf-8?B?S3JCNC9MM21ma1ducHlrdXoxWWFqZk13R1RFOWZndncyYmFRMzZidDdhazMy?=
 =?utf-8?B?Y3psWGFFSnlDaU1QR1loQm5JK1U1Zm9JUm9oTTg4U2ZvalVXRWdIdUhycE45?=
 =?utf-8?B?N2dqT1R5bDl3dzBPR2pYZDRmdmJSYW43OURCaFpoV3M0dVVuWk1RcVQ1TGs3?=
 =?utf-8?B?ZFRBOENlTDVmZ1NFNEdOU29kb2tUd1FKdnZyMUdQSUdTS25SaVBpQzJ1MjNr?=
 =?utf-8?B?dzE4anQ1bVJzZWcwNUtmWnI4SjlFbFV6T0RpNm0zK3F2emlPbDZSd0pDSUNw?=
 =?utf-8?B?cEpZVDM0VnFBRHcwN1FBODlQMmlQUU5pUlBUMnVNSXBzQWNRa1FtUjFzUDIx?=
 =?utf-8?B?M3RuUEUxdVFUbGlSQ201anQvWEd4QWI0angyRVRkREtIc2FqbFVTNFRDdTRV?=
 =?utf-8?B?c1NvNTM2ZVVXZ2FVT0k5eW1oT2Y0UklKdFVkS1BqSVJiNUlCNENNM2FpVVZr?=
 =?utf-8?B?ZWE4YmtxLzZXYzNJK3ZHSmJRZ3FwTUc1SHNpelVsSFVpKzFOSENhT3FVKzlF?=
 =?utf-8?B?R1FXTVh6dVR1QjQvQmxZTlBPUmtIRE81eXRMazFHWGhLS1U4dnkzSzlTNEoy?=
 =?utf-8?B?SkVOU3J2SHZDUER5aFhOUE53QTJvUkNiTmMvL2RBcTAwL1A3U0hiRDRjckdz?=
 =?utf-8?B?cERlbDNLeExyZUdQV2l5MERkRXozL2RwT2QzNXpvL0ZGbTdmaXRqNXBCb1Zi?=
 =?utf-8?B?Y25ERDVjZjExYVh4c3g0L1BXTVNMNDVJSUZYRFloUXhRcXpJSmNhRnlzWkpo?=
 =?utf-8?B?cmNRTGpRVjJ3eXlXaGczSUpKZDNNY3ZSYXlvZzNlOWV3UlpPRjBiYjh4YUM1?=
 =?utf-8?B?Y3JWKzArWWZ6U2V0dTlkalpHV3BydStEVXFUWGl1cmZJQzFqMFIxcEVldGZL?=
 =?utf-8?B?Q1FaT3F2M3E3ZVZjSFRKdUlvbk1Dc3FCdmFhZmJORTJaUlZiTHJxcFlsbk5F?=
 =?utf-8?B?RHJoTjJIWVRRdlNkT2wxdms0bkY1T3U3MWJCaTJsUEJiNjRJcElFNTcxZEpL?=
 =?utf-8?B?L05SSmphYkJjT1hjSGdRYXFDV2ovZzRHVUwvTU41OHBGODFJK3crVVY3bncy?=
 =?utf-8?B?amZNY3dpWWpYNnRndjRoSVlpZ0tSVU1BdTdtMDZCYzc2ZWM0Sjc4blA4cXhC?=
 =?utf-8?B?TEMzbE5sTDVyRUpCU05DSmgvbVdnRUo1NHltNzZWckk1WDZkenoxZjFHZnpj?=
 =?utf-8?B?cm5oSHRianZuRHJRcnN6RTh0L2lpY3V3UkFuYnQ0UTFCQmR4cnQ4alRGUW5D?=
 =?utf-8?B?ZVUrNEsyVnJuSXRhaHYzNkxtQjh4eG5NREdwS3ZIb1p0TTZ2WldqOWt4ZWJp?=
 =?utf-8?B?bUhTY2MyMElHYnBpR2tER21vVFljN1pNb2tRek5PUkRDTlpweFdNQ0V0RFRH?=
 =?utf-8?B?TmtzdWZJdmlnLzlyckFpcU1NeGF4eFlNZ2ZvLzlUZUt5TG1JR2MzZGlGNmtI?=
 =?utf-8?B?Mk1MM0tZTTVGaS9zMXhlNDVZSkdneWl1MzZqdTl6M2JTR0lUL0ZLRmpZdC9j?=
 =?utf-8?B?WHZqVU9YUkd4Smo0QjlTZDJVSDFHUUFORWt5MmJvdDh3NTBrME9OWitKMDQ3?=
 =?utf-8?B?cFVMTG5jU0xMa3pyVkV4UDFjM2Z1MjJEQ2JmbGpPaTBrMDZyTDIxcUdKOE5F?=
 =?utf-8?B?SDRaVTl3elhzdENUNE1XWG9wMWVwQXNXMHRhRGs5eDFYOHUwZk5vQzFOM0xs?=
 =?utf-8?Q?0uIYuW?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(1800799024)(14060799003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 14:34:44.8317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 205e1790-0f27-41ec-f0a1-08dd75e1574a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6548

SGkgQXlhbiwNCg0KDQo+IE9uIDcgQXByIDIwMjUsIGF0IDE1OjI5LCBBeWFuIEt1bWFyIEhhbGRl
ciA8YXlhbmt1bWFAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMDQv
MDQvMjAyNSAxMDowNiwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IEhpIEF5YW4sDQo+PiANCj4+
PiBPbiAzIEFwciAyMDI1LCBhdCAxODoxMiwgQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4ua3VtYXIu
aGFsZGVyQGFtZC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEFkZGVkIGEgbmV3IGZpbGUgcHJlcGFy
ZV94ZW5fcmVnaW9uLmluYyB0byBob2xkIHRoZSBjb21tb24gZWFybHlib290IE1QVSByZWdpb25z
DQo+Pj4gY29uZmlndXJhdGlvbnMgYWNyb3NzIGFybTY0IGFuZCBhcm0zMi4NCj4+PiANCj4+PiBw
cmVwYXJlX3hlbl9yZWdpb24sIGZhaWxfaW5zdWZmaWNpZW50X3JlZ2lvbnMoKSB3aWxsIGJlIHVz
ZWQgYnkgYm90aCBhcm0zMiBhbmQNCj4+PiBhcm02NC4gVGh1cywgdGhleSBoYXZlIGJlZW4gbW92
ZWQgdG8gcHJlcGFyZV94ZW5fcmVnaW9uLmluYy4NCj4+PiANCj4+PiBlbmFibGVfc2Vjb25kYXJ5
X2NwdV9tbSgpIGlzIGEgc3R1YiB3aGljaCBpcyBtb3ZlZCB0byBwcmVwYXJlX3hlbl9yZWdpb24u
aW5jIGFzDQo+Pj4gU01QIGlzIGN1cnJlbnRseSBub3Qgc3VwcG9ydGVkIGZvciBNUFUuDQo+Pj4g
DQo+Pj4gKl9QUkJBUiBhcmUgbW92ZWQgdG8gYXJtNjQvc3lzcmVncy5oLg0KPj4+ICpfUFJMQVIg
YXJlIG1vdmVkIHRvIHByZXBhcmVfeGVuX3JlZ2lvbi5pbmMgYXMgdGhleSBhcmUgY29tbW9uIGJl
dHdlZW4gYXJtMzINCj4+PiBhbmQgYXJtNjQuDQo+Pj4gDQo+Pj4gSW50cm9kdWNlIFdSSVRFX1NZ
U1JFR19BU00gdG8gd3JpdGUgdG8gdGhlIHN5c3RlbSByZWdpc3RlcnMgZnJvbSB0aGUgY29tbW9u
IGFzbQ0KPj4+IGZpbGUuDQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1ieTogQXlhbiBLdW1hciBIYWxk
ZXIgPGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+DQo+Pj4gLS0tDQo+PiBUaGUgc3BsaXQgZm9y
IHRoZSBjb21tb24gY29kZSBzZWVtcyBvayB0byBtZSwgYnV0IHRoaXMgcGF0Y2ggaXMgaW50cm9k
dWNpbmcgYW4gaXNzdWUgZm9yIHRoZSBhcm02NCBjb21waWxhdGlvbiwNCj4gU29ycnksIEkgbW92
ZWQgc29tZXRoaW5nIGF0IHRoZSBsYXN0IG1vbWVudCB3aXRob3V0IHRlc3RpbmcuIDooDQo+PiBJ
4oCZdmUgZG9uZSBhbiBleHBlcmltZW50IGFuZCB3aXRoIHRoZXNlIGNoYW5nZXMgSeKAmW0gYWJs
ZSB0byBjb21waWxlIGJvdGgsIGJ1dCBmZWVsIGZyZWUgdG8gaWdub3JlIGlmIGl04oCZcyBubyB3
aGF0IHlvdQ0KPj4gaGFkIGluIG1pbmQuDQo+IFRoZSBjaGFuZ2UgbG9va3MgZ29vZC4gSG93ZXZl
ciwgLi4uDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJt
MzIvc3lzcmVncy5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTMyL3N5c3JlZ3MuaA0K
Pj4gaW5kZXggMjI4NzE5OTlhZmIzLi5hOTBkMTYxMGExNTUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtMzIvc3lzcmVncy5oDQo+PiArKysgYi94ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vYXJtMzIvc3lzcmVncy5oDQo+PiBAQCAtMjAsNiArMjAsMTMgQEANCj4+
ICAgKiB1c2VzIHIwIGFzIGEgcGxhY2Vob2xkZXIgcmVnaXN0ZXIuICovDQo+PiAgI2RlZmluZSBD
TURfQ1AzMihuYW1lLi4uKSAgICAgICJtY3IgIiBfX3N0cmluZ2lmeShDUDMyKHIwLCBuYW1lKSkg
IjsiDQo+PiAgKyNkZWZpbmUgUkVHSU9OX1RFWFRfUFJCQVIgICAgICAgMHgxOCAgICAvKiBTSD0x
MSBBUD0xMCBYTj0wICovDQo+PiArI2RlZmluZSBSRUdJT05fUk9fUFJCQVIgICAgICAgICAweDFE
ICAgIC8qIFNIPTExIEFQPTEwIFhOPTEgKi8NCj4+ICsjZGVmaW5lIFJFR0lPTl9EQVRBX1BSQkFS
ICAgICAgIDB4MTkgICAgLyogU0g9MTEgQVA9MDAgWE49MSAqLw0KPj4gKyNkZWZpbmUgUkVHSU9O
X0RFVklDRV9QUkJBUiAgICAgMHgxMSAgICAvKiBTSD0xMCBBUD0wMCBYTj0xICovDQo+PiArDQo+
PiArI2RlZmluZSBXUklURV9TWVNSRUdfQVNNKHYsIG5hbWUpIG1jciBDUDMyKHYsIG5hbWUpDQo+
PiArDQo+PiAgI2lmbmRlZiBfX0FTU0VNQkxZX18NCj4+ICAgIC8qIEMgd3JhcHBlcnMgKi8NCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY3ByZWdzLmggYi94ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vY3ByZWdzLmgNCj4+IGluZGV4IDYwMTlhMmNiZGQ4OS4uYjkwOWFk
YzEwMmE1IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NwcmVncy5o
DQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY3ByZWdzLmgNCj4+IEBAIC0xLDEw
ICsxLDYgQEANCj4+ICAjaWZuZGVmIF9fQVNNX0FSTV9DUFJFR1NfSA0KPj4gICNkZWZpbmUgX19B
U01fQVJNX0NQUkVHU19IDQo+PiAgLSNpZmRlZiBDT05GSUdfTVBVDQo+PiAtI2luY2x1ZGUgPGFz
bS9tcHUvY3ByZWdzLmg+DQo+PiAtI2VuZGlmDQo+PiAtDQo+PiAgLyoNCj4+ICAgKiBBQXJjaDMy
IENvLXByb2Nlc3NvciByZWdpc3RlcnMuDQo+PiAgICoNCj4+IEBAIC01MDIsNiArNDk4LDEyIEBA
DQo+PiAgI2RlZmluZSBNVkZSMF9FTDEgICAgICAgICAgICAgICBNVkZSMA0KPj4gICNkZWZpbmUg
TVZGUjFfRUwxICAgICAgICAgICAgICAgTVZGUjENCj4+ICAjZGVmaW5lIE1WRlIyX0VMMSAgICAg
ICAgICAgICAgIE1WRlIyDQo+PiArI2RlZmluZSBITVBVSVIgICAgICAgICAgICAgICAgICBwMTUs
NCxjMCxjMCw0DQo+PiArI2RlZmluZSBIUFJTRUxSICAgICAgICAgICAgICAgICBwMTUsNCxjNixj
MiwxDQo+PiArI2RlZmluZSBQUkJBUl9FTDIgICAgICAgICAgICAgICBwMTUsNCxjNixjMywwDQo+
PiArI2RlZmluZSBQUkxBUl9FTDIgICAgICAgICAgICAgICBwMTUsNCxjNixjOCwxDQo+PiArI2Rl
ZmluZSBNUFVJUl9FTDIgICAgICAgICAgICAgICBITVBVSVINCj4+ICsjZGVmaW5lIFBSU0VMUl9F
TDIgICAgICAgICAgICAgIEhQUlNFTFINCj4gDQo+IENvbnNpZGVyaW5nIHRoYXQgdGhlcmUgd2ls
bCBiZSBsb3RzIG9mIGFybTMyIE1QVSBzcGVjaWZpYyByZWdpc3RlcnMsIGRvIHlvdSB3YW50IHRv
IG1vdmUgdGhlbSB0byBtcHUvY3ByZWdzLmggPw0KPiANCj4gVGhhdCB3b3VsZCBiZSBteSBzdHls
ZSBwcmVmZXJlbmNlLg0KDQpJIGRvbuKAmXQgaGF2ZSBhbnkgc3Ryb25nIG9waW5pb24gc28gaXTi
gJlzIGZpbmUgaWYgeW91IHdhbnQgdGhlbSBpbiBjcHJlZ3MuaC4NCg0KQ2hlZXJzLA0KTHVjYQ0K
DQo=

