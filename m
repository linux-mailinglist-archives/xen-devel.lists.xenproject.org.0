Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4877DA727D4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 01:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928333.1331059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txbIz-0002M8-Vr; Thu, 27 Mar 2025 00:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928333.1331059; Thu, 27 Mar 2025 00:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txbIz-0002Ih-RH; Thu, 27 Mar 2025 00:41:09 +0000
Received: by outflank-mailman (input) for mailman id 928333;
 Thu, 27 Mar 2025 00:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKAi=WO=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1txbIz-0002GY-2a
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 00:41:09 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c20bf79-0aa4-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 01:41:08 +0100 (CET)
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by PAXPR03MB7698.eurprd03.prod.outlook.com (2603:10a6:102:204::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 00:40:53 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 00:40:53 +0000
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
X-Inumbo-ID: 2c20bf79-0aa4-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKzzv1OeRjXHVIHaozXP04ACeXZ8+QE8RNOTn3UtpuOCcPmCtFfrgYWSOEDt9xXjXGOuus3zYBYMr2dbx9SWO/FvWLt3o8Gq/zTGlg1Iw2Ci9gkfEwzZ5IHe2y1a06eX4U7xclJjkXWLLKm0lOlyi4NU0hd/jNHJ1Xt0ys5wuJxABrwTmzrWwkHqMXLDv2OX1PeRMwqSs848LlDvXhc5myZnvi35HmJ1I9zrD3bC3GbsHChZy0Y0QAvbgAUasoru/9U7mKe30hISI/UWQ7quQMy0b2p7MToMsVefLiHl3n6fkgwq5A3oVDEdRE1j/N+0E4UmVEf7hBXVJ2KEwiG2AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEZnUOLnZm9F/fmyW7D8ug/laXFR6uaOFnmYo9TVn0E=;
 b=GYkVVRwjOs2OJ0Wgo+sKM9kOEXCRQEnXMVGFVWPwTqqwSc0B9BYnLJk5gVw+mNZ3IpgymerqtcKdwpc3gZ+V32H9SMK1vXhsdEzMqpvl8WL1Ls2aX7Vf9Xc9i34HjjdxAA/jHMmYrpI/rh+RIAkmUbb3bL/2RwKyKrhSvxFrCjpXa7/CQUV0fHauxDWYzPeMNVLhcPHloz5jIPQUMrzz7lR9OU8xvlX7V91xJmdeOmGOAe2yf5qnUqZzN+KvjJe3Bf5yKWXt/Sc9snYc+2lS41WUMK1wg3OGit2S1Bcn8bTglpdbHOlZ1fffO5JFS85khA9Lny4xXwNtFYBWX4bBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEZnUOLnZm9F/fmyW7D8ug/laXFR6uaOFnmYo9TVn0E=;
 b=ITlLKW/CHDV10tOBzb3KEImNsz/PSXJz+6/R0BhbNWH9dHKnFS64/2n9mYcUl53p9bH0IHSMPqXC6iy5xsP9YRGecoo8hT4mc8gNqzoKDL8X6kbrRHrhLFMDk1ytgdFMdvqb79OlvilmQf9ajNA+EKIZt3b1SQoQZRV+pqiygZyyPDiLhGGCAdYWUWeBor08HQLj7hAL8mW2eiYOi7/FliSUt3AKipljZ1QS1ASRKEZ4Gkv6kBx+5z/qO+m+CHpoDThdNqK0VkIpGr+RjEfZte4Zem14rp/BKKCVbZ5UnlJNR4mPhZVXitIOW+J6nZMShyGePJpt3s8mDkPcIE7QQA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: [PATCH v1 2/3] xen: x86: irq: initialize irq desc in create_irq()
Thread-Topic: [PATCH v1 2/3] xen: x86: irq: initialize irq desc in
 create_irq()
Thread-Index: AQHbnrDjW+8Ym1NjVUmmlSXcOEREog==
Date: Thu, 27 Mar 2025 00:40:51 +0000
Message-ID: <20250327004044.2014048-3-volodymyr_babchuk@epam.com>
References: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|PAXPR03MB7698:EE_
x-ms-office365-filtering-correlation-id: de088462-be6e-47c3-2908-08dd6cc80782
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WjdOOXVWWUlteWMweDJSQTZKQ1N1eDY5UHpVajNnRWRXZkN0SGRma0Q5UnhM?=
 =?utf-8?B?bG5FREFtSllVdHZqRzVxNmlvTnBmMUw5UUltSERMaGJrQWVJK3p6Q0wyNnBE?=
 =?utf-8?B?ZTZCZEVXRWkzMjBIQzVKd2Nxb241Y2lTdlVTMlpwbWg1UVd2V1EzSnM5MW9F?=
 =?utf-8?B?ZWtJZ1hDb201dWZENFFQTFFmV2ZIaTFiZVVKM05lRzZNWnZvZzVnbUNCQ0Z3?=
 =?utf-8?B?bWRWZlp6bHN6K3ZUL2p4aXJuaGQvS0QvcUVMaTBzLzl6Um9oRWpHYTkrY1dZ?=
 =?utf-8?B?MkRiNksxdDU3MUcyaEZSRllxa2ZML2NFRzJldFhZZ2RjUWNNcXhRZk9IOHp6?=
 =?utf-8?B?WmlvbWgwWU1FMmRGOWdzU2dEZTJKY05vVjdYalB1SFNLM1pFdXlCVmFZRWRO?=
 =?utf-8?B?T2tMTWtJWU5WZ1dkVzZReGZwdDVWODZBeXAvVm9OWHN2R2tVY2hsbFZOcFV6?=
 =?utf-8?B?WFQxMDFuUWQyQUJtNUI3MDJYQnV4VXV2cUFjVkZWYUNyeVdlaCtsRFRkK0Vp?=
 =?utf-8?B?Uk82MWZpTWJlckc3NEdrRzQrMFVncU1sWUtUOFdyYmU1L2F1bTVuaUs1bWV3?=
 =?utf-8?B?UVozS0t6aEY2dGkrMktJZXRpSzNmdUNhdTJ3eGtlN2VVTW5FUS94TFdXenkr?=
 =?utf-8?B?TW1LVUM1YjZNU2c2UlZVQVBCT2g5R1ErRHpScm10anNGaWoxSko0RnVjTTlp?=
 =?utf-8?B?N3JOZ3RKT3dSak1zOVZPNWNqNHlsVUJGS1hhRVU2UTFnbGhwNm93OEM4VGNz?=
 =?utf-8?B?NzlRTG8yNUVMaU41RVZQRm9KazNKRlY1TXFDNmVwQXRCSEw2bUxKUy9kVGd0?=
 =?utf-8?B?REx5cWpocW5aanFWS2pjcWlKWTQ2TWlpSkc3VTZJQ0loK0ViQVFpNkhWWkFV?=
 =?utf-8?B?Y1d2cGxEd01FRGlKR0haL0pGWGlMNUdUTDlFSXp6MzkxV1RYUGtaVGNQWXJP?=
 =?utf-8?B?V2ZkM0dsZnVTRFFyRG1yQXR4Zm5FN3owc1VKc3pUSzZSN21DZlVhaE9mQkpu?=
 =?utf-8?B?ajk2ZUNGQVFubEVHd3JXcCt2bGNoRS9mQ095VFBSTTVMNURSNEVucUUvWVBB?=
 =?utf-8?B?MTZzWGpGYTl1K2h4NjNBSWozdE9BU2hMZVYzYkI1enhTZTY3bFZWZ0d1QlVn?=
 =?utf-8?B?Q1ordzN2VW85S3hoREduS3BVdUE2Z2FadjVJU1BzWTB1STJmZkEzWTd1aTRt?=
 =?utf-8?B?WUFZUG43NlVyeW1Zb2xTd1dYT0VNRU42NHVwUEVaVHdoenNtVklPbWhTQnJ3?=
 =?utf-8?B?VERlbURIeWE2R2JnV2pxbkNWTGIza3V3VEJxVDBCQmRrTzJ5VkhjTEZETVY0?=
 =?utf-8?B?MXZkaE1vdVREeFR0UXdCbWt1WTE3bngwcFVuaC91T3A4SzRDRUIvZTJabFVY?=
 =?utf-8?B?T1hmRGlNK1pyRks4cTY1dzllci96RVQ2SEoyL094YWUzbkoyRG1YbGRHVU1t?=
 =?utf-8?B?blg1c3JkYzA3VGk3VjFQZURrVlFCRjc5enU3d3lvNVRmTnA1SW53anpFTTBr?=
 =?utf-8?B?amdRQXVpMHFkVTdSUm95N0ZjQnlXRVRZMm9DMndOSHBDbzRGRlBMME51WGtL?=
 =?utf-8?B?NlJWRGZlT0h3ckFtU3VRTGhZR1UvempHaW9sbnVtL0IvTHdadjl1RmQwRTZE?=
 =?utf-8?B?SlNIdHZtSk8yZGZVb2xSWGY2WUd5Y2RJMjB3UzRnaGJFK1JkSmwzMVJ2cEpT?=
 =?utf-8?B?TVMxNGVTdy9vVUtpQ2ZlcUhNOEcwYzkzeVYvajZac2MzYWY2OHhUdGhOWWwz?=
 =?utf-8?B?dGg0dWNrY1VxRVA1VDduU0hoMW0yK01WRnROcFZMa1FENWVwOXdjM1pUeVJB?=
 =?utf-8?B?VTdqb0ZxeFBOUWRobnQ0QVYvYWxjYnZKS1lSYk5ucGs1OUxIanNKWUdEUXh5?=
 =?utf-8?B?OG4zb1VlekZndTRucncvdk9laXVqemxrUE9zOVBDeHFwdVl1RmVIN2JEc0JH?=
 =?utf-8?Q?i9nyP811mM0FhOLLLxQGtEEVxRheRA5w?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cDVTOVVMUGVrR1BHRWI0UE9MaU5RNnRtNFgvZ2hyMUoyVEhzbGtVY05yKzZM?=
 =?utf-8?B?d1c3QWhFZDI4T0dxd0gzZGVraVlYYmNwKzdRMUUxMDNuRXg3MTdoQVEwSklQ?=
 =?utf-8?B?T2lvOFVVbGx1dWxBUW9wR2pxWUovZFJ3RGIyTlg1SlNua2huVzNpU2dBZzBx?=
 =?utf-8?B?Sk85SnJvRXdsWmRvSTM1WU9Gb2p5Ynkzdmh1d0lybnBZMGg4SXdYeTdvdHF1?=
 =?utf-8?B?eXdWN1VpWU94eEdzTE0wUndQUUxjNVpJZ2laQUZBUk5kTDJvWjRka1hTOXdq?=
 =?utf-8?B?Z2JoTjNvZ2x4blhaVEp1M3plVVhZRFkvSUJqdHZFTlZ6VWZXNlFBLzFCL3FG?=
 =?utf-8?B?NXcvUHNXR1EwUG1vaU5DV2JIZVN6cENyWVYvS2FHRlpKdko0RkdwMFhYOGJC?=
 =?utf-8?B?Wno3VnpjZkJEWXgzdGFhU0szeVFrRFVYR0M2Tms2U1hvZmhNZTR4Zm9CNjBz?=
 =?utf-8?B?WHkxd09nWnJvdjlCVHNZR2FPTy9ITndwNkVhYXBtdjRkem5uMUQ0NGZjVlVk?=
 =?utf-8?B?WnJoQ1VKYTdldG02b0dERkE3dExrUFlkblQxYnB2aHFzRGhhWVNTVW9DbkJB?=
 =?utf-8?B?VWNqYms0T0VYbzVMeHNqU0QwWVBUSE41ZU5wVjlkbHg5eXpSSmdUYjRQVGsx?=
 =?utf-8?B?ZkYwaHZOdXNzMUFzbFdTY2RwdXBsSWVob3J5VmUxVkdtWENYdVNucUxNMUNF?=
 =?utf-8?B?WkYvNzh3Nyt4YUx6d2IySGpLYW9YbWNtdXVnUlRxWWVaa2czZEFjMW5ISHcv?=
 =?utf-8?B?eHBzVHJxQWdvTzNFaUlyb1lLTmtDQUhWVm5YL0ttWlpFTTJ2T3IrUlBLeWNt?=
 =?utf-8?B?eGxkakVmL2ticXdEL1lzNS9OT3dwWlRSWDBJaCtxOVN3NVdSOVdYdW80djky?=
 =?utf-8?B?MXBLaTBMUG8wTGNEMmZ4eG13QnZlWFhLMjB2S1pndHdTYm5vTCtWN1hNWHdW?=
 =?utf-8?B?VU9RL1ZPMHJJeEl3bU93YUg4M0l0ODZlTVg4T3UyMVUwSk55VlBBNWpTK0ZT?=
 =?utf-8?B?ZzNIK0ltQ1NlWVEwRERIeHdlZVdGN1h4STFkdCtBRXNZZG5KVXNlSW9ZZkpk?=
 =?utf-8?B?bnRKZDZlaHhkd0dueWtmNDJJZFloZENaSEZtbEthRHBZMllGWENzN0gwZEpR?=
 =?utf-8?B?aDlobTJabjRoK3VNc3BGSldpUXNIbitvbnFoUG95a3pWaXRXcitBZTFPMDdG?=
 =?utf-8?B?WHZZclJiUU5rclVxeGFpOVVYTUVJZFM1a1pKdDd6YU5oRWV5cUNBRGRFVEhz?=
 =?utf-8?B?dXl6RGZQb2doc2lBUGhNL2JFTTJHWmVYS1VrbjhERkRDTUhjZlVQUUJaRU5u?=
 =?utf-8?B?NzVOZFRLWkFoZzdzdytXNWtKMjBHN1ZBenkxcE1JcmFWVU9OZCt0bDNWUk1C?=
 =?utf-8?B?cldEUEFFNzdQak5xU1RqcXluQWhGdkNIVmV5YjlWTzNLMldobThqVGRYejlp?=
 =?utf-8?B?cDVrZWhmYkVkNllvQkNPY1YzbVE0cEdMV05keDA3S2dqTjE3aDhtVWhvNDNR?=
 =?utf-8?B?a0EvMWJHbjVHeEp1OGJ5SFBJd2NMQVM0ejhHWnltN2IveHErd3RtaHBrNTA3?=
 =?utf-8?B?L0pHaVQ0bE5tUDcvaXAxN0VuMzduNnRva241ZWFvRjhHWGVIYUsrUEJGdWht?=
 =?utf-8?B?QmxsTGtLMjJOdHpQUXRIZ2xUN2dDSnhKa3kxTFBUQzE2Z0V0bE0rbU9lb1Ar?=
 =?utf-8?B?QnFqb3F2WmpZVzJnYVhzWmIwYmpLSEhJazdtT3psYTVSUnZEU2J4WU1KdDJ3?=
 =?utf-8?B?Vjg4cktkc1h1NEhYU2xDRCtpTU44UTRrN3dCVWtLU2NhUklJMDNyN1FTelBj?=
 =?utf-8?B?V3BodkFET2RyaElXN2lmOHBWRVB5SlhPODVYdVpFK1RDNnpFQVBBM3FnTGlp?=
 =?utf-8?B?eXlGQkRQc0xUa2xzQi9INGVXUldsY1NYVFlBOVVwalNYbnFFblMwbWZieVda?=
 =?utf-8?B?ZHQ0OTJKeTIzYzBpVTdtV01UUmxWRlIrckhxYUVhanZhcCs5OFBKanlsQ1pK?=
 =?utf-8?B?cXNaUmdsa1Bxb1MyVzdvRjJuVVkyNWp0Sml4OU5rdE1rWklxZzVKQVJjMlk3?=
 =?utf-8?B?S0x3VnRtRnZ2ek56ZXJYRUxyQjZjY2FXU3VEQ3R3dGs5UTJCWElKVHRuVnly?=
 =?utf-8?B?NTBSNWQ2WDZpTzhIVENMRW42SXdnYk9OT1NnQnNoNE11aXFSZ2tIQm05K3Ay?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53E02801B0E44A45951B7441C16259EA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de088462-be6e-47c3-2908-08dd6cc80782
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 00:40:51.0820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B2VxKxvEpq+7TuXqrw4S+wW1jVH5hZWxCHoTJNcLtP4pUI+zaaCOBVMkFb30/rwRmvx/Gx6+s6jRIjM7Z5TcxJub71JC9wjyqJA9KREqE64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7698

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
NTI6IGFyY2gveDg2L2lycS5vXSBFcnJvciAxDQoNCldoaWxlIHdlIGhhdmUgc2lnbmVkL3Vuc2ln
bmVkIGNvbXBhcmlzb24gYm90aCBpbiAiZm9yIiBsb29wIGFuZCBpbg0KImlmIiBzdGF0ZW1lbnQs
IHRoaXMgc3RpbGwgY2FuJ3QgbGVhZCB0byB1c2Ugb2YgdW5pbml0aWFsaXplZCAiZGVzYyIsDQph
cyBlaXRoZXIgbG9vcCB3aWxsIGJlIGV4ZWN1dGVkIGF0IGxlYXN0IG9uY2UsIG9yIHRoZSBmdW5j
dGlvbiB3aWxsDQpyZXR1cm4gZWFybHkuIFNvIHRoaXMgaXMgYSBjbGVhcmx5IGZhbHNlIHBvc2l0
aXZlIHdhcm5pbmcuIEFueXdheXMsDQppbml0aWFsaXplICJkZXNjIiB3aXRoIE5VTEwgdG8gbWFr
ZSBHQ0MgaGFwcHkuDQoNClNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlt
eXJfYmFiY2h1a0BlcGFtLmNvbT4NCi0tLQ0KDQpBdHRlbXB0IHRvIGRlY2xhcmUgImlycSIgYXMg
InVuc2lnbmVkIGludCIgZGlkbid0IGNoYW5nZWQgYW55dGhpbmcsIHNvDQpsb29rcyBsaWtlIGNv
bXBpbGVyIGluZmVycyB1bml0aWFsaXplZCB2aWEgc29tZSBvdGhlciByZWFzb25pbmcuLi4gQW5k
DQppdCBpcyBpbnRlcmVzdGluZyB0aGF0IHRoaXMgaXNzdWUgY2FuIGJlIG9ic2VydmVkIG9ubHkg
d2l0aCBNQy9EQyBlbmFibGVkLg0KDQotLS0NCiB4ZW4vYXJjaC94ODYvaXJxLmMgfCAyICstDQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaXJxLmMgYi94ZW4vYXJjaC94ODYvaXJxLmMNCmluZGV4IGRkOGQ5
MjFmMTguLmFlNzIyNGExNDUgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMNCisrKyBi
L3hlbi9hcmNoL3g4Ni9pcnEuYw0KQEAgLTI2NSw3ICsyNjUsNyBAQCB2b2lkIF9faW5pdCBjbGVh
cl9pcnFfdmVjdG9yKGludCBpcnEpDQogaW50IGNyZWF0ZV9pcnEobm9kZWlkX3Qgbm9kZSwgYm9v
bCBncmFudF9hY2Nlc3MpDQogew0KICAgICBpbnQgaXJxLCByZXQ7DQotICAgIHN0cnVjdCBpcnFf
ZGVzYyAqZGVzYzsNCisgICAgc3RydWN0IGlycV9kZXNjICpkZXNjID0gTlVMTDsNCiANCiAgICAg
Zm9yIChpcnEgPSBucl9pcnFzX2dzaTsgaXJxIDwgbnJfaXJxczsgaXJxKyspDQogICAgIHsNCi0t
IA0KMi40OC4xDQo=

