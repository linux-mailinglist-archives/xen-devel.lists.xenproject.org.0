Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4ECAFE2C8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 10:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037889.1410388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQIs-00020g-DQ; Wed, 09 Jul 2025 08:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037889.1410388; Wed, 09 Jul 2025 08:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQIs-0001yN-9L; Wed, 09 Jul 2025 08:37:22 +0000
Received: by outflank-mailman (input) for mailman id 1037889;
 Wed, 09 Jul 2025 08:37:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sxNU=ZW=renesas.com=jahan.murudi.zg@srs-se1.protection.inumbo.net>)
 id 1uZQIq-0001yH-F6
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 08:37:20 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e837bf68-5c9f-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 10:37:13 +0200 (CEST)
Received: from OS9PR01MB12407.jpnprd01.prod.outlook.com (2603:1096:604:2e8::7)
 by TYYPR01MB14229.jpnprd01.prod.outlook.com (2603:1096:405:214::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 08:37:08 +0000
Received: from OS9PR01MB12407.jpnprd01.prod.outlook.com
 ([fe80::5c77:b9cd:f9eb:f89d]) by OS9PR01MB12407.jpnprd01.prod.outlook.com
 ([fe80::5c77:b9cd:f9eb:f89d%4]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 08:37:08 +0000
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
X-Inumbo-ID: e837bf68-5c9f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReEeism2UAew+pNUaY1p3Rrd48CKXC+fUuSCNirwGSBpcwZk0LKKAoUxewv7gUJgEedpN7ku7Lrdjqcho4iICYqH79aD2jgbWnyVXEVao/ND8mzk80ZRw31v/IVPGljXjZcnu3kJfSI50aLYJbQcaHWAFkZuLtxuaJ7xs9GY/yHmOC6B/jVERX86dc48dDew0Fh5WAKNbcrgj4m8lxjCl3Tn8I5IFAfltubJ4qJNZs4KO6LcYgXdz+SOsPsYqBmWKZ+f2WspuUFWVyaYCVLkla+vOD7LHw7Q2ZMMqbyJ5120Hy6k+4xSN/Igs2yh0/o7RWZzGKYUd6lbDKEVD1saAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6ok2KhIP03lcaHa92B8AbwxuUrNq2XGT5CTzBo/7VU=;
 b=iYdJKHnG9PmyZmaEb5NS4IfjTgR9U0TG+64pzH5l7bAq/dGXgrjKj7d2kjb9/NQoWznksXIIW1DaX2NNe6I3+VmAsX6RLwaVz0wJqhTkyjuLLyjudQwUoiLteJ1aNnB4YzQaGsbfUAK/ws9UHtQvCzxLpChVe63eZIvIthVkuiARkK/vDGZ/0nFdF/5WM5ebGZ/KVA0efii48Bc87iBrKZ9WIDIckXDMxI5X4WlkLXcxA4m1d7YpwewI/RWNZct5iLqg/Mrj9sJRZjH+fKzEoqwi4hwU+wiUSwbtdPY7BMCEx2y5qzJJai8WRcCiAr1CjBEIIQkS/mfBRY42uC8FvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6ok2KhIP03lcaHa92B8AbwxuUrNq2XGT5CTzBo/7VU=;
 b=C94ZB2pwGENfHaRpzn8cdNz8tTaz40jJCALP81Q88JvooIpvt/HtObq1cFr8UFr4fst5KGYU5FP2klTul+5y/hTpWNsbj3OjQkpgXMT4xzmiCJ1kweWLKGc1sDeOqz2+7njBQovUyVO4VaAUxv/GDwqYeyN4J6/RSZNqBrkEhA4=
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] tools/xentop: Add physical CPU statistics support
Thread-Topic: [PATCH] tools/xentop: Add physical CPU statistics support
Thread-Index: AQHb7/4FGehggkKGsUyTQlD7iNI2ErQoPOkAgAE6+EA=
Date: Wed, 9 Jul 2025 08:37:07 +0000
Message-ID:
 <OS9PR01MB12407F5B0554EA8CE26BBA6DBAB49A@OS9PR01MB12407.jpnprd01.prod.outlook.com>
References: <20250708114632.3007693-1-jahan.murudi.zg@renesas.com>
 <b4c2e9bf-6bd7-4e26-92bc-3ad5d83dd144@suse.com>
In-Reply-To: <b4c2e9bf-6bd7-4e26-92bc-3ad5d83dd144@suse.com>
Accept-Language: en-IN, kn-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9PR01MB12407:EE_|TYYPR01MB14229:EE_
x-ms-office365-filtering-correlation-id: 09b40afa-95a2-4a3b-03b7-08ddbec3ca6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aVM1aXNVRWpEN01ZR3E2NHNmc1JTU0ZsNGFYc0ZrMWZ1SkZXbncyelJ2YUpt?=
 =?utf-8?B?ZzdsOElteUh2dW5Hd0pvQlVmSE1iUmVDSkRsVkl2SnZacDBoRzRwOWRaSENi?=
 =?utf-8?B?RkJFcVRVODN3NE9aRWQvZzZJbWU0VXZhRDBkV1pmdmpmUVpwcUpQZzZRL0No?=
 =?utf-8?B?TW5OcW5ESDJ0MWRibE52YzBoQTdQOTlVOGVJdTFNejUxZ2lTR2srS3ZyMEhX?=
 =?utf-8?B?WnMzV3F6VnA1eWlRUFFHallFd2czdkovK2s5UlYzclE2SXJaVUt4ZzhwY0tq?=
 =?utf-8?B?OG44M1pkcjFDYWw4NTZpZGlYTERjMzFHWUQwTDRFV08xSm9jNFhIQlE2Z0Fw?=
 =?utf-8?B?Q3VFY2lUUGI0RUtSYmtzTUJYQTkvT1hYZFU1QXZTOWxTN0R0R290Mi80b3Vv?=
 =?utf-8?B?ay9abjJFY0QyNnNmVTdra29FeC9zS25WaFkyNHVwdng2bHdsQ212b2xlWHNh?=
 =?utf-8?B?akVqQWk3NDJKMEVIMFNpYnNJamRXRTZrSzAxeWR3RCtkbjMrUlgzdlgxTXZa?=
 =?utf-8?B?bmtoSmI1aVhGQW8yNDMrK0hsOWRLeDYvNXJseXRleldiVjRNUmtleHk3Q3FF?=
 =?utf-8?B?YXhYTlJCTjZmRVkyVDVONmw5UlY1VTVaNklzNGNWaTMrc2szdEt6UjVzVk5N?=
 =?utf-8?B?VGNtbEdyWHZNb2R4blhSemttUnB0VWRCRkJnUGV2Mnc2YTF0dU13YnF0NDlr?=
 =?utf-8?B?dndFdDBwUU96dEszYmtDNDRGSEdLVGozcFpkYm9XSmJQcXc2S2lkQmcwcC9R?=
 =?utf-8?B?dmNCeVhHR0Z2U1FXVkIzQ3loQTh2cmc2cExHWGlMTllFV1g4Mk9wd3QzclZM?=
 =?utf-8?B?bHl1SHdXT05SWEorSi9URDJPUTF4VGhiYW1ha0dEVUNtV2duT1JJalk2c1Bh?=
 =?utf-8?B?UTNzakR0WjI2NlZ2c3lrdzhqWWZSeGJ4T2FtZjFDa0hmOVAxYjFxMkc5V2RK?=
 =?utf-8?B?YlNOdHpET1pjRmRqM1BlenRYdXVtUzMvME5Fek41c1R2b1RxaEk0RnRVN3hs?=
 =?utf-8?B?Q2FacHFvcW9XVUlLQVRMaWsrREpTb2JqeC80RytQVFp4Q0xOTHJxUUt2YjE3?=
 =?utf-8?B?bFNWVnFxazhEQ2Q0cEE2TFFWUG0veDBKRUo2QTdscHpKdlZ3d2M0d0JTWkFv?=
 =?utf-8?B?SmpXNGdxOHBJOTI3b0xyZktNM2Vuc2RGV3VIdGlOUkVVNEtNV2NhRjEyOWVx?=
 =?utf-8?B?Mzhoa3BibnJHUHRjM0JBdEFPL1I4cXVhWFA1WTd5YlhtUE1qTUN0bWx5cjdJ?=
 =?utf-8?B?RkdDSG81RnZ6UjRzeXV6SWwzSVkwQ0NjTHkxeTBIUGNaS0p2TG5rL08vTVRD?=
 =?utf-8?B?bmZUV0d3bk1SYXBYdkxqK3hOYnhmdm1SSDJ4M3FNTm5iMjk3bkFOaVh1UWFF?=
 =?utf-8?B?ZldkRCttTVZySEY4UGI2bDVQSU81dGlwVWRPcUhFQmM0Q2cybzJ1OGNFYmhl?=
 =?utf-8?B?QWFpMm5sRVJUUE14ZktnZTR0Sm5pVUpzbWRsaFNOMytiVkMvRzFyTkF2VnFF?=
 =?utf-8?B?MW9aOWVYWlNFbENXZ1YvWkRMb0prd2J6MmkxbVJuNUNBQnFtSlRscllOY2JU?=
 =?utf-8?B?R0pXZUthSWdRMmFPSzJjbU1kZzF5c1l0NEpydEFuTDVYZVpBNjN2b2JTUi84?=
 =?utf-8?B?cjcyZ0hxZkx4N2VFVmF1bFAva2Z5TjFTYjNCdWJUa2ZaaklMQ2YxaTJHYTVV?=
 =?utf-8?B?dVZIZjNrd3NPWXRDand4bnpxQVFoanRLdWp3VTRyWWJSdXFlS1dsT3N4eHNU?=
 =?utf-8?B?cnZ5dFp2QWJHOWYrVmlPUXlMWnZrejRJZEhSWmcxSjNYQ09kUjhPbTQ3U01J?=
 =?utf-8?B?dWU0R0VIRVY4T1JiRmZJYWVlc3NDKzZTNk4wd2ZLcXg1VFhVZVFoR044ekhE?=
 =?utf-8?B?SXUrRE9vK3YzTmplb0lic3kyaGtEdDg3OHRnZWlhM2ZzZ2lDcnMrQ1RUZmxG?=
 =?utf-8?B?VmxDdmxyL2FRWVRoM0ZsMkN2aDBVZ0FCQzgvQlJ2SUhpUSswL1l4OEYvejV0?=
 =?utf-8?B?UERIbWNaWUtRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB12407.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SDJrVzFJc0FFOXF5dDdOdjQ3dDdEVGFVdy8xaHRXWWpyd1c0NXFOcS9hL24x?=
 =?utf-8?B?d0ZPaWllMG9HVEkyOUpad2JxRXlvNUZqUjVpNjZnaFBIclhyWFY0TzlWVzY4?=
 =?utf-8?B?TWNzRUo1RnhvTVR6MUlPL3BWaEtoSjdsY2g4aG4xMWNtTUVnWlNLbDZmYUpQ?=
 =?utf-8?B?ZVpDcmhaZy94amNyUmRPeXEyTmF0UjhmZnZaRGtNam1UOHFiSGZZY01zOC9L?=
 =?utf-8?B?bXhtOS93TXVscWE4RkxPUjdSZ3A0WXd4UVd1M1hMT09Nb3RwMFJUVmc3c3J2?=
 =?utf-8?B?VytXd0Z1WXQyd0IxTkFQTExPUnVGRXZIR1RWK3I1TGdocHVaWGtvYjh4Umd3?=
 =?utf-8?B?dSthSHpBUmZaMnV2ZVVYbGFhN3ZGcmp0OVZSa0h5MkhMQzlXZURpcnlWRWpk?=
 =?utf-8?B?a01yd1hUUnduT3B6T3diamVJT1d4Z0N2MWVSQnZ0S00xUzJkYmlCRXJNTFBZ?=
 =?utf-8?B?bkFzckJ5TWIrWUdLdS8waHJZbENFdVo3bFp5dW5aRjJSamlaZ3ZmU2VTaVRq?=
 =?utf-8?B?azZPT3VxS0JqN2FUUnlheVhNdTVXZzBLSHMrcTJ5YVZqSkx2ZjZ5aUZZZmRZ?=
 =?utf-8?B?dk1uZFdsSzZzWlBmT29Oc3NDVm01RHNhT1o4SXI0M3BSVlpmVHRxOU14Y3Ev?=
 =?utf-8?B?NWRnRGxMZG5nTllEZU04NUdtQTFzeFZENnhUbUJWSm5BK3JUVHJTdkNkeFlG?=
 =?utf-8?B?QTN6NkcrMlVzZGd1c2Q3L3FINmxRZjZCRUpVdTArenJRRU5TV2lmYkxia2hK?=
 =?utf-8?B?WFBLcUZwTDJyczRieWlYWFM1Nmh1a0xWbW00eXBndzRZV3RCS0xGYm0vb2VL?=
 =?utf-8?B?VmdRZUVHejBaaWVINm1vSmlRdFNDSTczTVNVd04zUjNILzRDaGU1ZmZ0VVNr?=
 =?utf-8?B?SkxKNVZRdGtRVG5Rd1RpRFAzRVcxdVdlZGkyemVHNjVaNUdFN3VHa3NLbW10?=
 =?utf-8?B?TkNOQmFNN3NDMVlaL2hBbUVHdnNNKy9OMCtNQW1INy9lc1pRYTZQY3I1d2I3?=
 =?utf-8?B?elJNYThOSFZkdm4wWTNzODY5UFRWRWJUaHRVei91K2V3ZEQ0bE9aOFR1TnE1?=
 =?utf-8?B?UDlRNm5KcGdVYTlpMFhFUGtMWXZaWk04Q2pnZ1dZd2hlK1pHaTJTWUpUSFRP?=
 =?utf-8?B?c2UzeWJqaFRHcXdsMDVFcGRxU2JXR1pyTCt6VHlDb3NvVWMyeEQxZTcxRXY5?=
 =?utf-8?B?VGxKOGdFMk1DY3VWRXkrWTliZGRFaUxWTUE2SXNvZ01iQ3lBaFo3YWNPQUs2?=
 =?utf-8?B?cDYwOS93bXRaMjJndmgxRHhFL0E1VGlwUnBvZExOemMweUZRS1hlbUJvdUxt?=
 =?utf-8?B?TU1jZU9TdjhEak5PYWhKUnQ1bTErOWQ3MFcvVmlwUlBFQWtSd1k3VGhFbVZU?=
 =?utf-8?B?UmpRclNWU1lJbUV2RkNvMlZvd0F1QTYxMk1KUk9XdFBnUThPdzJWMnlLWjVZ?=
 =?utf-8?B?aWV2N2d0S3hzUVlLNGR4aFNWUmFMZiswQ2kvb2hiSWVZbGdiSVVaZXFSeXdX?=
 =?utf-8?B?Sml4VEZiQnMvdm9tL3hCOFg3bCszN0dpeFZZYk40d1hzTk1GdWFiM244VDI5?=
 =?utf-8?B?M3FyTUxWU3N1VncyN2EyN3dPekJ6dHpTbzRXSGY5Wm5tSjY2QUg2NXVuaGYz?=
 =?utf-8?B?eXlJeXN2STZoTlpwamtRRVJUcWlDVWlzQkUwdWJOck1XTjd4U0RpWmhDZVFG?=
 =?utf-8?B?ZmFudWgwVVE3ZFFmS01wUmVoOEl0SDJBZ3doSWhINVA5ZUVTTkxkaU9ici9t?=
 =?utf-8?B?ZWxpUFgzT3VvaGhWZ2FqOXdYRmdIamhPOHJEVXpBeUk1bWhTeXBrRWpZZ2Ix?=
 =?utf-8?B?bXd4Unp0KzFoRVNLZWtmQkNsRnRQWXZSek5uSVErc3h1SmcwZm9FNkVaVzlI?=
 =?utf-8?B?MFBIMXBnZ0p1cHFseGFZOVo4b0ZwVXRBY1YwaUJqNkVMOXo4TUpLKzBTTFNN?=
 =?utf-8?B?S2o5SjdLZ3c5Mi81OU90Q2o2amhHejVOTFNRSmc5R0Y5THBWcUgrSWtSbDZn?=
 =?utf-8?B?ajBqMkQ4THgxVnl3NFlJMVRsYjB0UnFzNnVzN0dlS2dnOWRQMWFNaTFEK2FM?=
 =?utf-8?B?ZmVWdEtja0xzSmw0ckpyMmJldURMbFZkd1pwNk05WHZ2RzhBTHRVYmJlTnFn?=
 =?utf-8?B?N0t1Wnl5Ti9vU2tLL0M2QitqbVcyYW9ZQUJZVm5mYXNXdVFabnVWMlhmMldi?=
 =?utf-8?B?cFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB12407.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b40afa-95a2-4a3b-03b7-08ddbec3ca6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 08:37:08.0003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BoyD+W3YNC0PhEb5wTRnva03f3bmsuA5Q5iPQo25gBaw7xXpowWRC1Rv24HKgrU2NRQAz1fSC6Iud8M4yyOlS/0iPE9fBA72k/N7irix8co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14229

SGkgSmFuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KDQo+IE9uIDA4LzA3LyAyMDI1
IDE5OjE1LCBKYW4gQmV1bGljaCB3cm90ZToNCg0KPj4gK3BjcHUubzogcGNwdS5jIHBjcHUuaA0K
Pj4gKwkkKENDKSAkKENGTEFHUykgLWMgJDwgLW8gJEANCj4+ICsNCj4+ICslLm86ICUuYw0KPj4g
KwkkKENDKSAkKENGTEFHUykgLWMgJDwgLW8gJEANCg0KPiBBcyB5b3UgbWVhbiB0byByZS1zdWJt
aXQsIHlvdSBtYXkgYWxzbyB3YW50IHRvIHRpZHkgKGJhY2spIHRoZSBhYm92ZS4gWW91IGRvbid0
IHNheSB3aHkgeW91IG5lZWQgdG8gc3BlbGwgb3V0IGJvdGggdGhlIGV4cGxpY2l0IGFuZCB0aGUg
cGF0dGVybiBydWxlIGhlcmUuIEFuZCBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYWN0dWFsbHkgbmVj
ZXNzYXJ5LiBBbGwgeW91IG91Z2h0IHRvIG5lZWQgaXMgaW5kZWVkIHRoZSBhZGRpdGlvbiBvZiB0
aGUgZXh0cmEgcHJlcmVxIG9iamVjdCBmaWxlLg0KDQpZb3UncmUgcmlnaHQgLSB0aGVzZSBleHBs
aWNpdCBydWxlcyBhcmUgcmVkdW5kYW50LiBJbiB2MiBvZiB0aGUgUkZDIHBhdGNoLCBJJ3ZlIHJl
bW92ZWQgYm90aCB0aGUgZXhwbGljaXQgcGNwdS5vIHJ1bGUgYW5kIHRoZSBwYXR0ZXJuIHJ1bGUu
DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL3BhdGNoLzIw
MjUwNzA5MDgyODEwLjMwNTI1NDQtMS1qYWhhbi5tdXJ1ZGkuemdAcmVuZXNhcy5jb20vDQoNClJl
Z2FyZHMsDQpKYWhhbiBNdXJ1ZGkNCg==

