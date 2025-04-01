Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9DFA7724B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 03:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933348.1335338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzQGM-0007Hs-Mp; Tue, 01 Apr 2025 01:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933348.1335338; Tue, 01 Apr 2025 01:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzQGM-0007FI-JG; Tue, 01 Apr 2025 01:17:58 +0000
Received: by outflank-mailman (input) for mailman id 933348;
 Tue, 01 Apr 2025 01:17:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gZL1=WT=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tzQGL-0006nG-Cb
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 01:17:57 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20630.outbound.protection.outlook.com
 [2a01:111:f403:2607::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 241708ab-0e97-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 03:17:55 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB6703.eurprd03.prod.outlook.com
 (2603:10a6:102:ec::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Tue, 1 Apr
 2025 01:17:52 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 01:17:52 +0000
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
X-Inumbo-ID: 241708ab-0e97-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAwatLDyaajIHjiL/s5mfEpHBsbwKLOAGOTkfgtUeIMilYYDcjsWvQOs6G0zozNkMC7qGx/DG6UkH03NzM3BYapxhhiTPipH4KUXC9xU5vnqsUlhX7W1SakJEX6028VqLaZSuqoVlC8rotawfVCSEFeFyJYzi52HsyWcFyl4kJo2nZ6eVQ3l/3q4lU6czc4MKroajrfmOUGvdSBKz9xIYJtX4MOPSGsTI6Lq7vlkTr3qKJwdPjDmPBCbIBYoFxURWNycYsM7nTuAH8GO6mkWLTLQRKFdC38nQZQnEQIIklKL+6b2OJJfl8HTwBipacyiQgDBK6yOwdnf4HUKLtst/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYY5TMzKZzk8Pg6xp60F/cK2FtqsNx/Afg43r5Pf3JM=;
 b=mOrbLM/vuq9wFjCobJL4h6WgP0EUf0bCNJfkVFrgQZmE/ykKUs7zmwAtf4iqjZUscF2GeZ1iPcj0TP2MXkXY1TMChrszNIuMUr3uF+Qpc8vVHAXJKsRgqVPQIQPfIimGulLsV1c7FEM7z4+zMh4guMbygkJ/PwffjnEnfbB+oNUvvMz4rrcKJ/gjxDlihybtySNigmA2kl+RrxzallUaVk9PyEGkpS93e7nHMDE6M10aS7w3GFMkGFayI7P1N3prdYrMfoLQJl3A0iiR7MU8pcfgCzRTkOkKannmsVL0cePRoVG8n88uOrBAGocyzh2w1pWnbocVbfGq9Kp7xaHNpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYY5TMzKZzk8Pg6xp60F/cK2FtqsNx/Afg43r5Pf3JM=;
 b=J1h9Xh5r2iq8Gw4JEDG1f4qW7TX3eYASmChHMjhGirR4LOhMPEYBNowFLAsU+FHvWV8pUQiSiD5xTnwFAab56SY4Oyj/Oo/+38VIrihCab9C3QO42Kn+EkH3iipNM9CfyTArz9cTtaXBtNiFrKApfapXPdfUPLZHNwWt78DAw26LHbPS8Vhu1HquOv0uA0mOCo7Jw024gyXmemitf9c9Etysf8lZF1S3BN6shBpAdZKiA/0+KG29aOVOax8FjtcJJWPeOwq23jiPhT3vGyNjhZZSN6aHJq/jLeRRABYNUlFRPHmBnlvaxoTzbOqni4wfSAYfzpJVYpf3f7i/0N/qhA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: [PATCH v3 2/3] xen: x86: irq: use do-while loop in create_irq()
Thread-Topic: [PATCH v3 2/3] xen: x86: irq: use do-while loop in create_irq()
Thread-Index: AQHboqPjgHkUwEzR90uZDjrf8rDceQ==
Date: Tue, 1 Apr 2025 01:17:51 +0000
Message-ID: <20250401011744.2267367-3-volodymyr_babchuk@epam.com>
References: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB6703:EE_
x-ms-office365-filtering-correlation-id: 9100af57-b86e-46f7-630e-08dd70bb061f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SWMrZ3JtKzd2SGpwT1dZR3BLWndGNjhYSVhLdVJrWnpOaDZ1TlVtS3lRN0hs?=
 =?utf-8?B?bU00ZUQvVk5DbGJWVEhnUloxem4vZitYcHhpcGY2aFMxNnhJR2dPMHZqUElq?=
 =?utf-8?B?UEMwdXYySXpXQmNoM0F3YXAvTnpLNzhZMWRvaVRLdzJmd0hySmV0QTlxQzFY?=
 =?utf-8?B?N1NRdzFmZm1nbnpXMjB1eG16Zy83ZWM1SVhSNHhWa0dncDQ2WVlBazFlWmYz?=
 =?utf-8?B?UUZqWm0yMngxRmU1c0NpYTVjdjZQTXZZdm9TSExIMk9SdjRWdDBqQVN6ejFH?=
 =?utf-8?B?WkcwWkFjVUY0ZGFLc1lERStBSmFJTlBXSEVEYUwzdmtWUHlxRmk4WFJpRHpm?=
 =?utf-8?B?YVlldHFQVnNidU56V24rM09EZW5SU3lzVGlJYXY4Vmo4NGdBM2ZaWmJubWRV?=
 =?utf-8?B?RFpiUUxxak9VbkFsRmFDNjZhU2o5TmprOXZFa0laZU83c1R2dFJyUmpidzhs?=
 =?utf-8?B?Slh1a1NQWDVMZFVoK1hhc2F4TU1nVDNjOGZidXdPQllKSmJDNFQ2VEtNYkxL?=
 =?utf-8?B?NjZocWhUUDdIblRiekRRRzBDVWU0NW5SVU5LbEZCZ3FwRUFNNnRJUUQyOFpz?=
 =?utf-8?B?ZUprQmVMcTA0L0VwSEtQQWEwRTFDZHhoWUpSSTAvdDJmK0xwSHg0Uy9RRkRM?=
 =?utf-8?B?WVU3cmRYTEdpUDlNeUJ3djlxMFhVNXozbWxYUlpJY080SmhlWWFjVzBabEFS?=
 =?utf-8?B?Wm5jZlAzWDBrck4rOTNjcUN2TDhaY0RXUmw5MGoydEFWQmlLK2ZtRVIzbnBl?=
 =?utf-8?B?TmJRbDU5ek5HUjNXS1ZWSHU3MzlMZlIxVHlieTAzYnNkdzNOSEV1U2ZucS8w?=
 =?utf-8?B?Y1RPUWlhZmRHWG5uQnV5TUZOWWNIQWtobjIwUi8rdVlVNVB5cDQ3R21Zd3p5?=
 =?utf-8?B?REZrb0twcUpOM0RzckgvcWgyckxRNFF6VDZBdTRhMDVUeWUySHhLQTdsUFEx?=
 =?utf-8?B?MGdla1dzdWVXUy9zRjZSbWVTcURLQkV5OXltYWxrVXBXOUNKbFFvSG1xcGE1?=
 =?utf-8?B?Tnd1bnU4OWxjN05MUjVLckVHdlZ1QlltdXJaWVVWWEtYcU0vajM1K01mRUt1?=
 =?utf-8?B?ckxRNmk2OXN0ZjEwVlBUUDBsemhHN3RHSFVXTmc4Rkd0QzQrcGdGWG1hb0Ns?=
 =?utf-8?B?MW93cGFjT3BJenkvU3NUTktLK1A5K0J0eGVWbE5meFEzcG00SHhnRlk5bmds?=
 =?utf-8?B?eFNsbTdBVHFva3g3Q1l3SmNMSjNYZ09BSGJOZE5WTWJSVGh4Q0tXVU1Qa1ps?=
 =?utf-8?B?VjM2aUI2MmRzSkxOZVpWNVJPWWtGUk5oV3cvelBTaTUxbWY5QURaa2pxaHcw?=
 =?utf-8?B?dVZiNERwcFFLU0VFZzdnS25yaUxyaVdHN3ZqQUd2eFRucmUzN2ZNMHBhWUI2?=
 =?utf-8?B?U0R3bWl4MUJXRis5SDRHSnVuNVBBc3dPMEIvM21ZenhrcWNORkR6UXBWNnpC?=
 =?utf-8?B?ZjJjSVRkSnp5aklKZUNheFB6OUlzdkFOZFhvY3RpL21DYmZwT3lab1FWVm1z?=
 =?utf-8?B?bmFmWWlwMzkwaDMybHZWNksyWm5qMGdlVWhlM3BIc1dNM2diMmtBdFhHdmVD?=
 =?utf-8?B?SGNqaEZhSzR4aUJCNVh6L0UzMlZIbnVjQ0JmektlUGVQa1N0c3dkSm1XWHZB?=
 =?utf-8?B?bldBTkViV3BZMndMTnFVWVRGWCtCK2RsOGh2blF3a05nQXpVQjFLTlpDNVMr?=
 =?utf-8?B?MnZoR2hhUFBzZVJoMlIxR0QxNFRjaXdxRnFoMjVtVlZSUTFDdktaeVIwVk1l?=
 =?utf-8?B?TEVsNFREeFd2Uy9NNW1paWEvcDA3aVhhVDU3VG1uV3kzem5jRWpISE1janBh?=
 =?utf-8?B?b28zRjN1ZEtmT3lCSnl4S09lYUx3Qld1UnhXKzV0YXhPYWZrRk9hTEdkMmlo?=
 =?utf-8?B?c3dLVEVNeEROektyZElwa0c0N2dxVlZYb2FwTmdHY1lqc3owaFd1UzE1R3ZY?=
 =?utf-8?Q?ns7eJ6HRCQX4FlVbfmlKu7GdBZfK2Pq2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDI5ZEFnMFB4K0lkWi83SmFYYzBqVVN3cjduM0NOSjFRUFY1WVpXU0EwWS9h?=
 =?utf-8?B?Ym1MTTYvODQ5dlFRQlV0UTJqU3hUSm8xVC9rMHZKSnRXUEJYaEpHR2J5UzFU?=
 =?utf-8?B?bE5uY1NFdVJSbXFXVHpXcUMyN0M3MjJyc1ZjdG05NVpjY253UzhYcUJsNXd1?=
 =?utf-8?B?V09TUXdIZjZGNE9ZblJSREQxems5dWZZMzc1aGplK2ppOWFDUTBuMUFERUlJ?=
 =?utf-8?B?ajNVaWozaGkvRnZPcjhCVThmWUR6S1ZkaEtxaUtQMW9TSnFmdC80TDQyUlNo?=
 =?utf-8?B?d2JJMXBNazdvQ3FzQXc4WlRwREJsN3padDhTaXpURUhqaWNab2Zjdk5wSGw0?=
 =?utf-8?B?NUhJdVhJY3NJcFp2Q0VpVGdxNEUzeGlKbnJDa084S2hsVG5OKzQ5N1MzaWJY?=
 =?utf-8?B?d3laMHlOWTZ6V3ZzV1RkUWhGWFVqaTV5ZTFYTW5RcFJZVGpLbTd1clBPcUVN?=
 =?utf-8?B?aVZtM2l6TTM5ZDk1TnNLU1U1REZMRWdIdnVyTUZDQ3dmWVhabWJMa2dVUk1R?=
 =?utf-8?B?Tkw4Q2pTTktZTmlQVEh1R1VCemtJU3ZxNDlyYVIrNWZBaDd3QTlIYUVOSHJt?=
 =?utf-8?B?bVAxaEdwcG5vVlRWSENJWUlxeEZ0cndqOVZLazY1SkJIaDZlcjY1SWNlSGE3?=
 =?utf-8?B?RE1HWCt4Q3NFQUNPdDFvQkYwbFQ1OVkvL2k5ZXhDVTR6SllzbnJXam1PbDEw?=
 =?utf-8?B?QzZaQkdJN3Q3VVpWOTZtTElSTGdkb2xtNjFOT0hTWnRWTkhhTVgreFN1NVdi?=
 =?utf-8?B?dTNnMFRMcXhCUFVNcFRsc3ZqTnlOa3BHSUVYZ3pzL001RlJhcGkrbDM2ZENZ?=
 =?utf-8?B?V2tPNGxWSW5vNWdpTG1iZHJVaGhGV1NMWU1qRnVXMW9GaGdIRlVJVmpNdllB?=
 =?utf-8?B?dkxYOEhHa3RkQ2Zaa3FaZGs5bFlNV29xcTZvVW5qcWlkZlRVM3lEYmc1MndJ?=
 =?utf-8?B?M2ZvTkJwRlo3TFZUN2VhWnYwT3RpcFFPM0NkR1ZJNlpqbk9QL3A0WjI4V2gz?=
 =?utf-8?B?YkxOT3BidEJlbnhpTHJ2MDBVM3JtV1VyYUs2UWVXTGU2aERaODZPMWdlNkpF?=
 =?utf-8?B?OTVneFB0Z2ZRR1ZQSWxlUTUycVdxUE5ib3ZSZjlsT2NPbHVSZWl0Uy9nQjFI?=
 =?utf-8?B?WGhJMlpDb1FncENRMFJHRXl6bVliamNxeVpXVVJtbkI2YVBleVBnUG9Jd3pN?=
 =?utf-8?B?RE5yQXJBR2xYS05nMHhPeHREaDd1SWFid00rbnExVGF4SUsvUGdldTZBZ29x?=
 =?utf-8?B?R3FNaXVGSlF4R3l5Z2ZoRGxoOFNseEU4b2ZtemptcW5DemxRZ2I5b2hHTVVY?=
 =?utf-8?B?SFRlQnhCVEdDbmpkc2pQV1hxWFdncW8xQ2ZHbXZCcmhOMXYxcmRuelo3d3Zh?=
 =?utf-8?B?NWdvUzZXbmhRNnFUcW1SQUFEakdTaWxOR2x2MG1HWHI0ckVkR0lQU2lyVXVH?=
 =?utf-8?B?K3cveHN6N3k1NUtoa0orOXN1cml2V0dkMEtmb2Y4Qyt1THhyK1RiWHdkV1JE?=
 =?utf-8?B?N1dKRS93SWtDa2NUSVFXVTBYNUhtSFBGUFJ1T0xyM0tYckt5S1dvclVFa2c1?=
 =?utf-8?B?L2hRSzl1UE1IUkE5Z0pjdUNDdFdsY21YWTVYL2llODhnVmVWQnh6YTVWK3A4?=
 =?utf-8?B?cm1VOFVtVkg1N29tZFRPbzJndHdFamZ3TGd1VTZSaU9WbFZGSFRtVUtDZ1pD?=
 =?utf-8?B?U2pFdmRURDFFYXRrTEN3UzJUbWptTDRYZnltSTJhOW9PRy9pNzhDcDZCcE41?=
 =?utf-8?B?WUJSRjJtZm1yVWlpdGczNXBOWHNqSVFVSUVGM3ZPeVlYV1JmQzM1L2s1dHJ5?=
 =?utf-8?B?eGdwNlhQU3o5cXk4Qllxa05hakJVeTlzekxESytDSVhaZ2VBc3JVcnVwSXZ5?=
 =?utf-8?B?b2QzemxWQlNaSU5mdEM4MzZHL0lkTStVL1BHSGJvcnlpRXNRd3NEMkpIWi9P?=
 =?utf-8?B?bmtWYTdCQzRKaDVKSnpiOU5Td0ZTL2owSUhCcWF5bHI2UC9YcXM3QUZwOEhC?=
 =?utf-8?B?QVhSVmhweCtONkZYYzUwbU9DVUxRTGx2dGlPaFByLzEyVWtHVDBaelF1QUtE?=
 =?utf-8?B?US9DYk9taTNVcjdYY1dLbVQwV0RabmNLakM1Qzl1ZW5CT2huaHNBN25IVnho?=
 =?utf-8?B?cHZOU3lXUkx6R2h4TGpXdXpYbHFvOEJQTTVPZ1lPUFkvbnB2T0hDS2k5enE0?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EE89C3D6CF6004F9DD0A0D8CB2A0C39@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9100af57-b86e-46f7-630e-08dd70bb061f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 01:17:51.6593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zsh/WTgvIvAxew5xeHXv1ZP/H3Z2PgHGa+1dOypOV9a0W3/WEpsEwP1+Vwbl1W8NknLMUk9Ef0Co+5/VBPsZGB5FbnIhnRo/WyfFmUTlXk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6703

V2hpbGUgYnVpbGRpbmcgeGVuIHdpdGggR0NDIDE0LjIuMSB3aXRoICItZmNvbmRpdGlvbi1jb3Zl
cmFnZSIgb3B0aW9uLA0KdGhlIGNvbXBpbGVyIHByb2R1Y2VzIGEgZmFsc2UgcG9zaXRpdmUgd2Fy
bmluZzoNCg0KICBhcmNoL3g4Ni9pcnEuYzogSW4gZnVuY3Rpb24g4oCYY3JlYXRlX2lyceKAmToN
CiAgYXJjaC94ODYvaXJxLmM6MjgxOjExOiBlcnJvcjog4oCYZGVzY+KAmSBtYXkgYmUgdXNlZCB1
bmluaXRpYWxpemVkIFstV2Vycm9yPW1heWJlLXVuaW5pdGlhbGl6ZWRdDQogICAgMjgxIHwgICAg
IHJldCA9IGluaXRfb25lX2lycV9kZXNjKGRlc2MpOw0KICAgICAgICB8ICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fg0KICBhcmNoL3g4Ni9pcnEuYzoyNjk6MjI6IG5vdGU6IOKAmGRl
c2PigJkgd2FzIGRlY2xhcmVkIGhlcmUNCiAgICAyNjkgfCAgICAgc3RydWN0IGlycV9kZXNjICpk
ZXNjOw0KICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIF5+fn4NCiAgY2MxOiBhbGwgd2Fy
bmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMNCiAgbWFrZVsyXTogKioqIFtSdWxlcy5tazoy
NTI6IGFyY2gveDg2L2lycS5vXSBFcnJvciAxDQoNClRoZSBzYW1lIGJlaGF2aW9yIGNhbiBiZSBv
YnNlcnZlZCB3aGVuIGJ1aWxkaW5nIFhlbiB3aXRoICItT2ciDQpvcHRpbWl6YXRpb24gbGV2ZWwu
IEZpeCB0aGlzIGJ5IHVzaW5nICJkbyB7IH0gd2hpbGUiIGxvb3AgaW5zdGVhZCBvZg0KImZvciIg
bG9vcC4NCg0KU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJj
aHVrQGVwYW0uY29tPg0KDQotLS0NCg0KQ2hhbmdlcyBpbiB2MzoNCiAtIENvcnJlY3QgY29kZSBz
dHlsZSAoImRvIHsiKQ0KIC0gQWRkIGNvbW1lbnQgZGVzY3JpYmluZyB3aHkgd2UgbmVlZCBkbyB7
IH0gd2hpbGUgbG9vcC4NCiAgIEkgcHJlZmVyIHRvIGxlYXZlIGRvIHt9IHdoaWxlIGJlY2F1c2Ug
Tmljb2xhIFZldHJpbmkNCiAgIHNhaWQgdGhhdCB0aGlzIGFwcHJvYWNoIG1pZ2h0IGhlbHAgd2l0
aCBNSVNSQSBSdWxlIDkuMQ0KICAgd2l0aG91dCBuZWVkaW5nIGFuIGV4cGxpY2l0IGluaXRpYWxp
emVyLg0KDQpDaGFuZ2VzIGluIHYyOg0KDQogLSBVc2UgZG8geyB9IHdoaWxlIGxvb3AgaW5zdGVh
ZCBvZiBpbml0aWFsaXppbmcgZGVzYyB3aXRoIE5VTEwNCi0tLQ0KIHhlbi9hcmNoL3g4Ni9pcnEu
YyB8IDE3ICsrKysrKysrKysrKystLS0tDQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaXJxLmMgYi94
ZW4vYXJjaC94ODYvaXJxLmMNCmluZGV4IGRkOGQ5MjFmMTguLjJmMjg4NzA0YjUgMTAwNjQ0DQot
LS0gYS94ZW4vYXJjaC94ODYvaXJxLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYw0KQEAgLTI2
NCwxNSArMjY0LDI0IEBAIHZvaWQgX19pbml0IGNsZWFyX2lycV92ZWN0b3IoaW50IGlycSkNCiAN
CiBpbnQgY3JlYXRlX2lycShub2RlaWRfdCBub2RlLCBib29sIGdyYW50X2FjY2VzcykNCiB7DQot
ICAgIGludCBpcnEsIHJldDsNCisgICAgaW50IHJldDsNCisgICAgaW50IGlycSA9IG5yX2lycXNf
Z3NpOw0KICAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2M7DQogDQotICAgIGZvciAoaXJxID0gbnJf
aXJxc19nc2k7IGlycSA8IG5yX2lycXM7IGlycSsrKQ0KLSAgICB7DQorICAgIGlmICggaXJxID49
IG5yX2lycXMgKQ0KKyAgICAgICAgcmV0dXJuIC1FTk9TUEM7DQorDQorICAgIC8qDQorICAgICAq
IGRvIHsgfSB3aGlsZSBsb29wIGlzIHVzZWQgaGVyZSB0byBjb252aW5jZSBnY2MxNCB0aGF0ICdk
ZXNjJyBpcw0KKyAgICAgKiByZWFsbHkgYXNzaWduZWQuIE90aGVyd2lzZSB3aXRoIC1PZyBvciAt
ZmNvbmRpdGlvbi1jb3ZlcmFnZSBpdA0KKyAgICAgKiBtYXkgdGhyb3cgYW4gZmFsc2UgZXJyb3Ig
c3RhdGluZyB0aGF0ICdkZXNjJyBtYXkgYmUgdXNlZCBiZWZvcmUNCisgICAgICogaW5pdGlhbGl6
YXRpb24uDQorICAgICAqLw0KKyAgICBkbyB7DQogICAgICAgICBkZXNjID0gaXJxX3RvX2Rlc2Mo
aXJxKTsNCiAgICAgICAgIGlmIChjbXB4Y2hnKCZkZXNjLT5hcmNoLnVzZWQsIElSUV9VTlVTRUQs
IElSUV9SRVNFUlZFRCkgPT0gSVJRX1VOVVNFRCkNCiAgICAgICAgICAgIGJyZWFrOw0KLSAgICB9
DQorICAgIH0gd2hpbGUgKCArK2lycSA8IG5yX2lycXMgKTsNCiANCiAgICAgaWYgKGlycSA+PSBu
cl9pcnFzKQ0KICAgICAgICAgIHJldHVybiAtRU5PU1BDOw0KLS0gDQoyLjQ4LjENCg==

