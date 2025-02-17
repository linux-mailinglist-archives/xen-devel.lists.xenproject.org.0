Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B89A379EC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 03:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889654.1298738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjrCH-0002Vi-QA; Mon, 17 Feb 2025 02:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889654.1298738; Mon, 17 Feb 2025 02:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjrCH-0002T6-LC; Mon, 17 Feb 2025 02:49:25 +0000
Received: by outflank-mailman (input) for mailman id 889654;
 Mon, 17 Feb 2025 02:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eGlc=VI=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tjrCG-0001oi-7p
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 02:49:24 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061c.outbound.protection.outlook.com
 [2a01:111:f403:260e::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca13219c-ecd9-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 03:49:21 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9534.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Mon, 17 Feb
 2025 02:49:17 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 02:49:17 +0000
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
X-Inumbo-ID: ca13219c-ecd9-11ef-9aa6-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4qLCB/liKGHWKLJRam5ZLujsg0j2rJi4/wWlU084l6v7/HdNAa7Pbfme/ng2HRZqwM8z9DeTxKhwNWdoceURBUsqMbbGQk1ifeGs76LrG8gG1gzXXOCY+OOaXYjMa5Sp/MSV2JzZsAuJYi/DqY/5aBTXgvA6tpNnEp23hDcDsiCInKV4RYh0c9t6zyoH87I569iRm+j2YX0Ng61EAJvN3Vl/OHzrb1Qv17jDxEbjshzCdG3YqwSrczXrmFTums26/Ht+I1BB6aQC/tq1GyjY3sxcgjYwYIzyWvGhlGn/CAOH4gATjUoUQaLAHfMC0y6FU0ctRzhUh2FUXqKjVtnBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYCAKQexokAgM3h/9SoGSw9D7Aknb12i66xb7xIFR1s=;
 b=FCOh86KrKkzWCh3ze4fNDbXdxoDjQmKgv34Z5FscUxKSsDdewixi7+lmca9f9sqRZHQMKJHbh984rJibeH/adxcSnTZhHqPviJysulVADk1mptOKqJ34m33XDqA3ZH0862Zot562zeaIChnocZwtl6pgWjtKP6Mqvdf0UbUPfMjhFcOXs7vPuDO69CMWs9Od3jF+o5w3pBY2zntq85gKcgdXzkLHMek1rPnBngS0LOuvcZ0e230OneRDVsQxvn8N/M6Gt4DgnJ+iA8yNZa+GZ5vNgit9v8cod0ZHKi4Kt9lD747hOfMDEyITbqhpnFNhKqME5Bk6VtBLGcQE/tn4/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYCAKQexokAgM3h/9SoGSw9D7Aknb12i66xb7xIFR1s=;
 b=Ff0Y+WCITB+s/U1ojn3ighb6hJFV21sKisC4SP3kTRmA2wFEz0WQTP7V6vkT3pHQ+CFaKY0JgCx/4sbn80gzZGiA5t3+qThSdT15Kal6UPKlSkppQlC1bEDiSPeVf+tHwTnr1Cjw/i2WD+jca9izXJ2qTIK6EX+SOnjBqMk9wzSdYyWPIV7E0RUdM/KQVq2hDmntrf7mdLxrxoF0EaFmijvaY14FTunlTlmvW01lLHADERiURXdaoMrOZgXa8VHwlMBcC22TpEIGvuiLTtYD1KTXg924KLbW3xeztfZsYfz4gchwdViA6ASGRSRcvZhbO7zx7J4dWtW1eZffMe8lAw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 2/4] xen: common: add ability to enable stack protector
Thread-Topic: [PATCH v6 2/4] xen: common: add ability to enable stack
 protector
Thread-Index: AQHbgOaJRZZjxSPvq0GPGrg2wX/xCA==
Date: Mon, 17 Feb 2025 02:49:17 +0000
Message-ID: <20250217024848.3059635-3-volodymyr_babchuk@epam.com>
References: <20250217024848.3059635-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250217024848.3059635-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9534:EE_
x-ms-office365-filtering-correlation-id: a3309769-06f9-45f9-cb5e-08dd4efdabe2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cnNyRGxzem9LSUc3WjIrSFBXWkkrRjcvcHBwUjBBQkR1NzkvL0k3TE95bXh2?=
 =?utf-8?B?Q3BKNXpjbUY0UnVEcUpKTkNiVFRHVVdqemxTbGJjL2JROEpMd0FwMGJmYTA2?=
 =?utf-8?B?TUQ2STFROXUzK1JOb1hSR1FPZURITGVTWCtNMWRUbzF3bUFNZlFReFpPblBq?=
 =?utf-8?B?TjduUzJtL3hxWWltR1ltRnNMM1VZSlNFTVBWMWh2bFpNV3VXME1Nakl3RnhM?=
 =?utf-8?B?MU8zcnNUaDV0VVhjQXBUVWVzSVlINmxxbkx2UFVscUlMSHd6aUZHeHAzeU80?=
 =?utf-8?B?b0p2bEhoZk9zL09sU0wwZzNCbnpycGxNKzFlb2V2b3BpTTVOSTMzZWZ6MVhJ?=
 =?utf-8?B?c1FVVFI2d1c0ZEpZaDNYZ0Qyb2ZUb2lhZE9vU3pnSGpoenVSNzYrNDQ1d0tO?=
 =?utf-8?B?blVTSHAzUXR5TGhXNk4ybi9seHVoMUdzK2VVNHJ3dkwwQWplV2VuZk9zeUtJ?=
 =?utf-8?B?Q0xFQ2JjVmlLU2dSSE1sVExTSTk0RFlwT2ZOR0hlS09OamJJdzh6S1RQQjd0?=
 =?utf-8?B?bjFqUmZnT1FaS2R5ODJlaEJYdmdhTGdhZnI1YWhKRWExK3FXMWoycGZPeHZT?=
 =?utf-8?B?MTRjeVVsSHVlKzRoTkhWN0d1aUw4RFlVNFBsY255SGlrUkp2OHRUNGJLZ053?=
 =?utf-8?B?cmp5RkFXUnYvSHNMWkpZVXlmMU1LK3YxVERFUmJ2aW1aM1M0RGUzY1BKTitE?=
 =?utf-8?B?M01oemUrc3Y4RVpSUk4xZnVlUUlkWVNBT2F4N21RSThKaDRVWUl2a1k3ejJM?=
 =?utf-8?B?RnJzTjVPZU1qUWdBOVhlQ2pJaENXYWY4V1g5UTJJWUpqbWJCVGhxWCtXTisr?=
 =?utf-8?B?TW5ZZXZMbWFiYmlydzVuQnA4ZkNUdm1TcWxKbld1bHVJay9rU2lkQ3ZlaXJQ?=
 =?utf-8?B?N0VreDZUbjFlMU1oM2NMTnpNOE9VM3psU0dnL3J3cytBV21yNUJxVWRzVURZ?=
 =?utf-8?B?RCt5aC9UTU5vV2NnanNWVzFJaVJISGEwYW1YdHM0MmlSdDV3T3paWTB6OVNW?=
 =?utf-8?B?K0h0aGhJNG5DczFjTFpRc3BqeHZuV0JhUTFXZjZQbThHbEhYQW93ZlFEMHdl?=
 =?utf-8?B?SVNVTGl5SnRLcjVVeHJkSHdYc1VCU2tFT213U1pZOFplVTA3ZUY4ZUNjTUlS?=
 =?utf-8?B?ME5jSTdHcndrNlR2SExpb3RiZER5QWVBZ1hpenAxYSswMkIrRmgwb3NDdTYz?=
 =?utf-8?B?Z0lkSmhyRUlqUkNzcWhHYU5DbjJuSnpnNzd3V25Dd3IrT3B3TjZWdUJsYnli?=
 =?utf-8?B?K2xkaVFQc0k5MlBRMkRBZFhYR2NNdEtNZmxBLzNuU1RGVlp1QmZ5YVpLanNY?=
 =?utf-8?B?dFArUVFkZDBVMkZOcnNjRGNVUFZVbEVxUWRGRTJFNkRCaVp3ZGJDVVZ1WU92?=
 =?utf-8?B?UDBYRk8rWGlmVkY5QU0rYldUOWhvMGsybVZZcnZoZnJzNHQyYW83Q2d5cmFm?=
 =?utf-8?B?bWt0KzVrUks2aTliMDRSYXNKU3FUUTVNVlI0QjNDb2VYVGc5d3A3R3k2QkZ1?=
 =?utf-8?B?L1JJUDBvU3ZLRzJJd3AwV0FNQ05sUjNsZDd0cFoyRDhTcDFFamcwSGhGOHRF?=
 =?utf-8?B?Nzg3Q09PNFhieWtkcVllbGFsb1lLcmJUTHQrK3M3cHFCc3dTUS9mdlpTbDFY?=
 =?utf-8?B?enJscHJoOXNySitvYmllWmJTazVhL0xBVFg2QnZnUDlYczlMaEgxWUpCTFRM?=
 =?utf-8?B?MkRyTHlKeTh5UW9pV3ViM1V1c3ZaWVBTTWFFUnhqQjdQTmNGRExna2U5NHFp?=
 =?utf-8?B?MjlvUiswN245U1JBNjNmaHRtejA5NDBGRFUweHQyaG5Hd0IwN2IzWDhXbXZl?=
 =?utf-8?B?YkFqNTVvNGJQTVBBQUlsUU9HYy9iUHBrOE52Z1pObXRkVWVPMm4xTnMxc1Vj?=
 =?utf-8?B?emd4enJZRkNQM24zd3U3WndqVXJzdFRidGpIeWNJaFVvUExHbE5HQTZ6eFFF?=
 =?utf-8?Q?Ntlb1Yvn8np15xr4XSxq4wEiA3WrlpAg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ei9FYm8rYitMZERuQVNJRHdnK0FsVTA0cnM3WDN4VWFxdDgvYWxRWlpnaVZ0?=
 =?utf-8?B?ekJVekNYd0NkRXFlaGxlUDJSSUpNOWEvZmJDV0plcUczeCtsS1lRK0xIZnIy?=
 =?utf-8?B?L3FSNWhyampka1o2bm1JOTMzeGhvd25SemFXNlJrVkJUa3BRMEhQMXRJU2hR?=
 =?utf-8?B?YnRJaFhMc0FTWHAvNjhlTHk4SzBLQlNZRjd3YUZyeEwzcVFIVTVEaXZaenZE?=
 =?utf-8?B?OHpJU2w5QkRYYUJpaW9WVWs4RnNiVVdDTk5SMEtVYm1KUDVEcHlCTUgzd1Jx?=
 =?utf-8?B?VXpnUStzZ1AremZSQUxRMjBYb2kxVFR0UnZoYUxaaFpVZVh6L1FKZWJ6bUtG?=
 =?utf-8?B?bVk0cXRlWlVqbGJ5anlKZ0NoSnBYNWdsWmJadGRkS1FzNVdRNEdVTm5WRFU3?=
 =?utf-8?B?ODZMMDZURk53UzB3NTZSUGo4TUh5NjB5dTJGYnU5Ly9pV0NMTU1ER0hRb29i?=
 =?utf-8?B?eFlHL05EdlFDQmExc3UyejIxcGR0NlBqUGlSMjV2OGZtTk5Vb2RDYTlFa1Rn?=
 =?utf-8?B?VkRpaytRcFlWbllIYklrZHliZzl2b0hHcHEwM01NQ280WGcvcHcySmR1N25z?=
 =?utf-8?B?cy94M21CZHpneWJHaGxhNXNNT2xxMHdGWGU5YWxlVU1NM0hsUVo3K0NOeGNF?=
 =?utf-8?B?dmtvTW9wLzJ5cTg1UVFsZEo0VkQzUHJZa0dLRjFyUFFEL3R2ZzFiQU1ZdkNM?=
 =?utf-8?B?cG5hb1dkSXIvckRkWWYvbmRIREdnSUY4UXJia2trcTRMWWpib0tRSTdqNS9I?=
 =?utf-8?B?ekgzQnpHOTlUaTRzZzlIcnBQTEhUczdGLzFyaHg3YVJJN2FTWFZHOWRFdkdn?=
 =?utf-8?B?Nm44bjA4VVBjVmZYRWUvb01KcTRROTdtT2taMk5NUTJzcDBaemp4TWY4OFRL?=
 =?utf-8?B?VjRTVC9mVzVuVUZyNzB6VkpPZjU3VlExRnNiSE5TYk1CamNzdEJFbEFuNnFz?=
 =?utf-8?B?ajFPOEVpcXdmamswUlJTZGhTQTdjc3l6ajlORnllMzBxMS9uWDh3Z0h6SFpp?=
 =?utf-8?B?eW10VXR3YnlIS3lmVkZlTCtYc3dZR0RlUDVxWW51TWZTR1B6QmJacjRPa2RE?=
 =?utf-8?B?aERNMHRqRHA1amVVZTdsdk9PUTd4QkJQK1pKeEhNQUNxRnlxdDNhaDNPZEJU?=
 =?utf-8?B?Q2lIWC9zVVJSaVVWcW5uRExGcTAzTml6OHIxNXJFcDJ4Q2EyYnV3UGorRzVT?=
 =?utf-8?B?aXIzTjIyeStsa29oWGxGOU1MbGJJVHIxWTlKbHVQZTRvS0hWRXJxaXZGK0JK?=
 =?utf-8?B?UDFTOXowVk1JS29JZ3ZOWWdaU0grRTJaeXBXeTBqd3U5eUs0bVgxdTBGd0dJ?=
 =?utf-8?B?bjNyb1BEa2dyQk5zZVZXOXgvb3Z2VWRmV1I5bnluQkxQQ0NzRHI0NFExU1FU?=
 =?utf-8?B?T3JBUmNCUVRzZmE0OHBRZ3ZkV2VIWkF4UTY0OEpVRWQxaURmQndFQWVVa0dO?=
 =?utf-8?B?TXJWNjRzcCtBcWF3QWUySlhmUk5uMXpyKzU1MWw4SXdWQlJ1VjFyZjF5Sm91?=
 =?utf-8?B?Y21JbzFIMFFZSXdhcU5lZ2Q5YXhLSHJhYXdvNFdZSGFvU215YUJLeFh4QTJj?=
 =?utf-8?B?eTIxcThyb0h6eWs5WDNHZFh2Y0dYMGhqdGpaSEY3T083MjlhWUE3Znh2SlNx?=
 =?utf-8?B?Vkdhak8rY2RzUjlLbk94STQxMnBjODFjaHNKbFpRTnNPYVdpTmlwVUkvb1dK?=
 =?utf-8?B?TEgwSGt3NXoyQTE0SHUrM0FhMnk4dER0bTNKK2h1cWt3TUI1b1VrUEVRQS9u?=
 =?utf-8?B?L1JPa1pYNjdmKzRIRWdGTDE1MnNzV1g0NXlTNit3SjlYRkh0elUrZEtGeVNP?=
 =?utf-8?B?a1BhMHU3SDd6a1lma05OWVdXQjdKZkJhOERKRE5YZDBjTldPc09kaFVlSWwx?=
 =?utf-8?B?amRlNXZteE9LR3BQeWovZ0NiQ2xVRkMweUxLS0EyZlU4MTY0NTREL0ZaOEc4?=
 =?utf-8?B?ZDFBL1U5RXRYaENmZEtYWUsxUGN3UEs2ZUYwbml5K3FLSVV6WXBWRjZmajMv?=
 =?utf-8?B?RytnWG51Njc0cHVVdDIzbktXVDhNc0h3R0VwWFJVYy9wcVJycDRWdG54Ymlv?=
 =?utf-8?B?c2l2cmFhMGZmVSs3aGdhc3FRa3AzQUVUUWU4bVNnVm1LQVhRZzNUZXRRVW5G?=
 =?utf-8?B?b1IwSFpzNkRvWWRiV0JzcmNrRC9CUDNMRUl2K05TNWpxNXIxbzY3RlAyK3lu?=
 =?utf-8?B?aUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8DFDC8F55893045A81A4E1C2AC17E16@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3309769-06f9-45f9-cb5e-08dd4efdabe2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 02:49:17.1109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iSTs79sLws3QteRDXeBrAqr5T+o2F0GQ8LICl3+H8yVGGThaCDKdo4ozaRM/EzS/s7nWpa6TohgI0SWWUGM6goY1z7aiIFJE0/4/eMcf4N4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9534

Qm90aCBHQ0MgYW5kIENsYW5nIHN1cHBvcnQgLWZzdGFjay1wcm90ZWN0b3IgZmVhdHVyZSwgd2hp
Y2ggYWRkIHN0YWNrDQpjYW5hcmllcyB0byBmdW5jdGlvbnMgd2hlcmUgc3RhY2sgY29ycnVwdGlv
biBpcyBwb3NzaWJsZS4gVGhpcyBwYXRjaA0KbWFrZXMgZ2VuZXJhbCBwcmVwYXJhdGlvbnMgdG8g
ZW5hYmxlIHRoaXMgZmVhdHVyZSBvbiBkaWZmZXJlbnQNCnN1cHBvcnRlZCBhcmNoaXRlY3R1cmVz
Og0KDQogLSBBZGRlZCBDT05GSUdfSEFTX1NUQUNLX1BST1RFQ1RPUiBvcHRpb24gc28gZWFjaCBh
cmNoaXRlY3R1cmUNCiAgIGNhbiBlbmFibGUgdGhpcyBmZWF0dXJlIGluZGl2aWR1YWxseQ0KIC0g
QWRkZWQgdXNlci1zZWxlY3RhYmxlIENPTkZJR19TVEFDS19QUk9URUNUT1Igb3B0aW9uDQogLSBJ
bXBsZW1lbnRlZCBjb2RlIHRoYXQgc2V0cyB1cCByYW5kb20gc3RhY2sgY2FuYXJ5IGFuZCBhIGJh
c2ljDQogICBoYW5kbGVyIGZvciBzdGFjayBwcm90ZWN0b3IgZmFpbHVyZXMNCg0KU3RhY2sgZ3Vh
cmQgdmFsdWUgaXMgaW5pdGlhbGl6ZWQgaW4gdHdvIHBoYXNlczoNCg0KMS4gUHJlLWRlZmluZWQg
cmFuZG9tbHktc2VsZWN0ZWQgdmFsdWUuDQoNCjIuIE93biBpbXBsZW1lbnRhdGlvbiBsaW5lYXIg
Y29uZ3J1ZW50IHJhbmRvbSBudW1iZXIgZ2VuZXJhdG9yLiBJdA0KcmVsaWVzIG9uIGdldF9jeWNs
ZXMoKSBiZWluZyBhdmFpbGFibGUgdmVyeSBlYXJseS4gSWYgZ2V0X2N5Y2xlcygpDQpyZXR1cm5z
IHplcm8sIGl0IHdvdWxkIGxlYXZlIHByZS1kZWZpbmVkIHZhbHVlIGZyb20gdGhlIHByZXZpb3Vz
DQpzdGVwLg0KDQpib290X3N0YWNrX2Noa19ndWFyZF9zZXR1cCgpIGlzIGRlY2xhcmVkIGFzIGlu
bGluZSwgc28gaXQgY2FuIGJlDQpjYWxsZWQgZnJvbSBDIGNvZGUuIE9mIGNvdXJzZSwgaW4gdGhp
cyBjYXNlLCBjYWxsZXIgc2hvdWxkIGVuc3VyZSB0aGF0DQpzdGFjayBwcm90ZWN0aW9uIGNvZGUg
d2lsbCBub3QgYmUgcmVhY2hlZC4gSXQgaXMgcG9zc2libGUgdG8gY2FsbCB0aGUNCnNhbWUgZnVu
Y3Rpb24gZnJvbSBBU00gY29kZSBieSBpbnRyb2R1Y2luZyBzaW1wbGUgdHJhbXBvbGluZSBpbg0K
c3RhY2stcHJvdGVjdG9yLmMsIGJ1dCByaWdodCBub3cgdGhlcmUgaXMgbm8gdXNlIGNhc2UgZm9y
IHN1Y2gNCnRyYW1wb2xpbmUuDQoNClNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2
b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NCg0KLS0tDQoNCkNoYW5nZXMgaW4gdjY6DQotIGJv
b3Rfc3RhY2tfY2hrX2d1YXJkX3NldHVwKCkgbW92ZWQgdG8gc3RhY2stcHJvdGVjdG9yLmgNCi0g
UmVtb3ZlZCBBbmRyZXcncyByLWIgdGFnDQoNCkNoYW5nZXMgaW4gdjU6DQoNCi0gRml4ZWQgaW5k
ZW50YXRpb24NCi0gQWRkZWQgc3RhY2stcHJvdGVjdG9yLmgNCi0tLQ0KIHhlbi9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgICB8ICA0ICsrKw0KIHhlbi9jb21tb24vS2NvbmZpZyAgICAgICAg
ICAgICAgICB8IDE1ICsrKysrKysrKysrDQogeGVuL2NvbW1vbi9NYWtlZmlsZSAgICAgICAgICAg
ICAgIHwgIDEgKw0KIHhlbi9jb21tb24vc3RhY2stcHJvdGVjdG9yLmMgICAgICB8IDIxICsrKysr
KysrKysrKysrKw0KIHhlbi9pbmNsdWRlL3hlbi9zdGFjay1wcm90ZWN0b3IuaCB8IDQzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCiA1IGZpbGVzIGNoYW5nZWQsIDg0IGluc2VydGlv
bnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2NvbW1vbi9zdGFjay1wcm90ZWN0b3IuYw0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS94ZW4vc3RhY2stcHJvdGVjdG9yLmgNCg0K
ZGlmZiAtLWdpdCBhL3hlbi9NYWtlZmlsZSBiL3hlbi9NYWtlZmlsZQ0KaW5kZXggYTBjNzc0YWI3
ZC4uNDhiYzE3YzQxOCAxMDA2NDQNCi0tLSBhL3hlbi9NYWtlZmlsZQ0KKysrIGIveGVuL01ha2Vm
aWxlDQpAQCAtNDM1LDcgKzQzNSwxMSBAQCBlbHNlDQogQ0ZMQUdTX1VCU0FOIDo9DQogZW5kaWYN
CiANCitpZmVxICgkKENPTkZJR19TVEFDS19QUk9URUNUT1IpLHkpDQorQ0ZMQUdTICs9IC1mc3Rh
Y2stcHJvdGVjdG9yDQorZWxzZQ0KIENGTEFHUyArPSAtZm5vLXN0YWNrLXByb3RlY3Rvcg0KK2Vu
ZGlmDQogDQogaWZlcSAoJChDT05GSUdfTFRPKSx5KQ0KIENGTEFHUyArPSAtZmx0bw0KZGlmZiAt
LWdpdCBhL3hlbi9jb21tb24vS2NvbmZpZyBiL3hlbi9jb21tb24vS2NvbmZpZw0KaW5kZXggNjE2
NjMyN2Y0ZC4uYmQ1M2RhZTQzYyAxMDA2NDQNCi0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KKysr
IGIveGVuL2NvbW1vbi9LY29uZmlnDQpAQCAtODMsNiArODMsOSBAQCBjb25maWcgSEFTX1BNQVAN
CiBjb25maWcgSEFTX1NDSEVEX0dSQU5VTEFSSVRZDQogCWJvb2wNCiANCitjb25maWcgSEFTX1NU
QUNLX1BST1RFQ1RPUg0KKwlib29sDQorDQogY29uZmlnIEhBU19VQlNBTg0KIAlib29sDQogDQpA
QCAtMjE2LDYgKzIxOSwxOCBAQCBjb25maWcgU1BFQ1VMQVRJVkVfSEFSREVOX0xPQ0sNCiANCiBl
bmRtZW51DQogDQorbWVudSAiT3RoZXIgaGFyZGVuaW5nIg0KKw0KK2NvbmZpZyBTVEFDS19QUk9U
RUNUT1INCisJYm9vbCAiU3RhY2sgcHJvdGVjdG9yIg0KKwlkZXBlbmRzIG9uIEhBU19TVEFDS19Q
Uk9URUNUT1INCisJaGVscA0KKwkgIEVuYWJsZSB0aGUgU3RhY2sgUHJvdGVjdG9yIGNvbXBpbGVy
IGhhcmRlbmluZyBvcHRpb24uIFRoaXMgaW5zZXJ0cyBhDQorCSAgY2FuYXJ5IHZhbHVlIGluIHRo
ZSBzdGFjayBmcmFtZSBvZiBmdW5jdGlvbnMsIGFuZCBwZXJmb3JtcyBhbiBpbnRlZ3JpdHkNCisJ
ICBjaGVjayBvbiBmdW5jdGlvbiBleGl0Lg0KKw0KK2VuZG1lbnUNCisNCiBjb25maWcgRElUX0RF
RkFVTFQNCiAJYm9vbCAiRGF0YSBJbmRlcGVuZGVudCBUaW1pbmcgZGVmYXVsdCINCiAJZGVwZW5k
cyBvbiBIQVNfRElUDQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9NYWtlZmlsZSBiL3hlbi9jb21t
b24vTWFrZWZpbGUNCmluZGV4IGNiYTNiMzI3MzMuLjhhZGJmNmEzYjUgMTAwNjQ0DQotLS0gYS94
ZW4vY29tbW9uL01ha2VmaWxlDQorKysgYi94ZW4vY29tbW9uL01ha2VmaWxlDQpAQCAtNDYsNiAr
NDYsNyBAQCBvYmoteSArPSBzaHV0ZG93bi5vDQogb2JqLXkgKz0gc29mdGlycS5vDQogb2JqLXkg
Kz0gc21wLm8NCiBvYmoteSArPSBzcGlubG9jay5vDQorb2JqLSQoQ09ORklHX1NUQUNLX1BST1RF
Q1RPUikgKz0gc3RhY2stcHJvdGVjdG9yLm8NCiBvYmoteSArPSBzdG9wX21hY2hpbmUubw0KIG9i
ai15ICs9IHN5bWJvbHMubw0KIG9iai15ICs9IHRhc2tsZXQubw0KZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vc3RhY2stcHJvdGVjdG9yLmMgYi94ZW4vY29tbW9uL3N0YWNrLXByb3RlY3Rvci5jDQpu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMC4uOTA4OTI5NGQzMA0KLS0tIC9k
ZXYvbnVsbA0KKysrIGIveGVuL2NvbW1vbi9zdGFjay1wcm90ZWN0b3IuYw0KQEAgLTAsMCArMSwy
MSBAQA0KKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCisjaW5j
bHVkZSA8eGVuL2luaXQuaD4NCisjaW5jbHVkZSA8eGVuL2xpYi5oPg0KKyNpbmNsdWRlIDx4ZW4v
cmFuZG9tLmg+DQorI2luY2x1ZGUgPHhlbi90aW1lLmg+DQorDQorLyoNCisgKiBJbml0aWFsIHZh
bHVlIGlzIGNob3NlbiBieSBhIGZhaXIgZGljZSByb2xsLg0KKyAqIEl0IHdpbGwgYmUgdXBkYXRl
ZCBkdXJpbmcgYm9vdCBwcm9jZXNzLg0KKyAqLw0KKyNpZiBCSVRTX1BFUl9MT05HID09IDMyDQor
dW5zaWduZWQgbG9uZyBfX3JvX2FmdGVyX2luaXQgX19zdGFja19jaGtfZ3VhcmQgPSAweGRkMmNj
OTI3VUw7DQorI2Vsc2UNCit1bnNpZ25lZCBsb25nIF9fcm9fYWZ0ZXJfaW5pdCBfX3N0YWNrX2No
a19ndWFyZCA9IDB4MmQ4NTM2MDVhNGQ5YTA5Y1VMOw0KKyNlbmRpZg0KKw0KK3ZvaWQgYXNtbGlu
a2FnZSBfX3N0YWNrX2Noa19mYWlsKHZvaWQpDQorew0KKyAgICBkdW1wX2V4ZWN1dGlvbl9zdGF0
ZSgpOw0KKyAgICBwYW5pYygiU3RhY2sgUHJvdGVjdG9yIGludGVncml0eSB2aW9sYXRpb24gaWRl
bnRpZmllZFxuIik7DQorfQ0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zdGFjay1wcm90
ZWN0b3IuaCBiL3hlbi9pbmNsdWRlL3hlbi9zdGFjay1wcm90ZWN0b3IuaA0KbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAuLmI3NThhOGNiM2QNCi0tLSAvZGV2L251bGwNCisr
KyBiL3hlbi9pbmNsdWRlL3hlbi9zdGFjay1wcm90ZWN0b3IuaA0KQEAgLTAsMCArMSw0MyBAQA0K
KyNpZm5kZWYgX19YRU5fU1RBQ0tfUFJPVEVDVE9SX0hfXw0KKyNkZWZpbmUgX19YRU5fU1RBQ0tf
UFJPVEVDVE9SX0hfXw0KKw0KKyNpZmRlZiBDT05GSUdfU1RBQ0tfUFJPVEVDVE9SDQorDQorZXh0
ZXJuIHVuc2lnbmVkIGxvbmcgX19zdGFja19jaGtfZ3VhcmQ7DQorDQorLyoNCisgKiBUaGlzIGZ1
bmN0aW9uIHNob3VsZCBiZSBjYWxsZWQgZnJvbSBhIEMgZnVuY3Rpb24gdGhhdCBlc2NhcGVzIHN0
YWNrDQorICogY2FuYXJ5IHRyYWNraW5nIChieSBjYWxsaW5nIHJlc2V0X3N0YWNrX2FuZF9qdW1w
KCkgZm9yIGV4YW1wbGUpLg0KKyAqLw0KK3N0YXRpYyBpbmxpbmUgdm9pZCBib290X3N0YWNrX2No
a19ndWFyZF9zZXR1cCh2b2lkKQ0KK3sNCisgICAgLyoNCisgICAgICogTGluZWFyIGNvbmdydWVu
dCBnZW5lcmF0b3IgKFhfbisxID0gWF9uICogYSArIGMpLg0KKyAgICAgKg0KKyAgICAgKiBDb25z
dGFudCBpcyB0YWtlbiBmcm9tICJUYWJsZXMgT2YgTGluZWFyIENvbmdydWVudGlhbA0KKyAgICAg
KiBHZW5lcmF0b3JzIE9mIERpZmZlcmVudCBTaXplcyBBbmQgR29vZCBMYXR0aWNlIFN0cnVjdHVy
ZSIgYnkNCisgICAgICogUGllcnJlIEzigJlFY3V5ZXIuDQorICAgICAqLw0KKyNpZiBCSVRTX1BF
Ul9MT05HID09IDMyDQorICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgYSA9IDI4OTEzMzY0NTNVTDsN
CisjZWxzZQ0KKyAgICBjb25zdCB1bnNpZ25lZCBsb25nIGEgPSAyODYyOTMzNTU1Nzc3OTQxNzU3
VUw7DQorI2VuZGlmDQorICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgYyA9IDE7DQorDQorICAgIHVu
c2lnbmVkIGxvbmcgY3ljbGVzID0gZ2V0X2N5Y2xlcygpOw0KKw0KKyAgICAvKiBVc2UgdGhlIGlu
aXRpYWwgdmFsdWUgaWYgd2UgY2FuJ3QgZ2VuZXJhdGUgcmFuZG9tIG9uZSAqLw0KKyAgICBpZiAo
ICFjeWNsZXMgKQ0KKyAgICAgICAgcmV0dXJuOw0KKw0KKyAgICBfX3N0YWNrX2Noa19ndWFyZCA9
IGN5Y2xlcyAqIGEgKyBjOw0KK30NCisNCisjZWxzZQ0KKw0KK3N0YXRpYyBpbmxpbmUgdm9pZCBi
b290X3N0YWNrX2Noa19ndWFyZF9zZXR1cCh2b2lkKSB7fTsNCisNCisjZW5kaWYNCisNCisjZW5k
aWYJLyogX19YRU5fU1RBQ0tfUFJPVEVDVE9SX0hfXyAqLw0KLS0gDQoyLjQ3LjENCg==

