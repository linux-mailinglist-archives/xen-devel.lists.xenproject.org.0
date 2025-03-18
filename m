Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AECA66657
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 03:35:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918402.1323106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuMml-00050j-P2; Tue, 18 Mar 2025 02:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918402.1323106; Tue, 18 Mar 2025 02:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuMml-0004yv-Ks; Tue, 18 Mar 2025 02:34:31 +0000
Received: by outflank-mailman (input) for mailman id 918402;
 Tue, 18 Mar 2025 02:34:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvL5=WF=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tuMmj-0004hg-TP
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 02:34:30 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83ba7bf9-03a1-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 03:34:28 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI0PR03MB10565.eurprd03.prod.outlook.com
 (2603:10a6:800:20c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 02:34:20 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 02:34:20 +0000
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
X-Inumbo-ID: 83ba7bf9-03a1-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K67LyPoB975Ilfw7LW+VmhSKr/UmbGOuarOa9+WA6a9YVFIw+VVEJpPVCTZM9maqAp2WnUMT6boskntE0WJnJu4cDvDtwrhTH7Fr2+yVBe40ReKnz2rDiyR1ikfkDflYpsRZf2iRQBO7AleVd1KaPSZtc4ujdVpQJvOOrfk9oZ8ilzdtRQagsdPU2V5hcI9FVwa728iUu1n6Ln+D7adhpNnzSMym13DRCVNRMXXTrNxFMI17X6Nm6SfSG3EPoHCSLDAf2bO0+5HMuMSWwqte9afDgaiAcwD7/Fi7/2cbQrhMjeNVo/mCHQ5kcjtExCm/ugAVJiAA3GbS4hWZ02Bl2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daQkFgoq5ipbNMtA3lu7b2NeP07vXt94awDw7fEV8oU=;
 b=T0Mhi+5xfQNdYbFGDSZUPayiW2ZfOgDAWjARfSgLNzXXCmyqMoT5CZL+Ua6SfHrWetxH053rMXCHFMjBpo0OqmltzWahKcW4+YLZ32IcvZuVZw26jzUSknVYJC1bsH72m1hqoqisG2x+3uRY8XNUkT24/lenmGkXUBRdXAsOOBm3hTg3SLlE6JUOjlt3rTqhn0bESo6Gy4Gag/cXIKszF20tPKu2asgbc0lJ+yXJJ+SLQcaKeaRR2XDwQMifaF1RyyMi4alJd0itzyTOQ58ERJPkKuD3F9MmO3xTKHtIDQdgIXJdoK0brCuR5vA3ZHTvg7PCppYSMMwvPwU1ZupchQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daQkFgoq5ipbNMtA3lu7b2NeP07vXt94awDw7fEV8oU=;
 b=av5WHprUpVkqjisjYGgkN0d3L9iw/+CwojNgQU13ZLFTAQWTrzS41Nu4K+i/eSZPWnlHHa3q3VpgRuzrljrUay3Ff+k8efbZUqhk+m6Gl9UhQlitKr6J7nK0OdL0q0VpgpxBAo0z5cLPknmUx4r2e/aQmiV86C8m1hfNB29zzCl7IZrkAqKUkl4pVa5ErZVtaqC/Rp+7D2BQGhzNNjEhWs6JQ/0w/BH09yLwyjYDsjXzZe9WicRE+uGo39jqpL7mlUDZikjwWHiD8GO2PfgFN+6FzzYYUvud/eeO5GUWI7IJlDI/yZP5A5CPHsH8U2I6ouyx3J1u9alYWzuxSCWMrA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 1/3] xen: common: add ability to enable stack protector
Thread-Topic: [PATCH v7 1/3] xen: common: add ability to enable stack
 protector
Thread-Index: AQHbl64+rhP4I7ynyU+rW59ZNq7NnA==
Date: Tue, 18 Mar 2025 02:34:16 +0000
Message-ID: <20250318023234.1210659-2-volodymyr_babchuk@epam.com>
References: <20250318023234.1210659-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250318023234.1210659-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI0PR03MB10565:EE_
x-ms-office365-filtering-correlation-id: 3d11eea2-e491-4425-29e7-08dd65c56380
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cnlVYlZZb1oxVThkcm1TQjIvcXlxUFljSElIUncxUWs0TmNTeGVXbTdNU3VZ?=
 =?utf-8?B?a3FmUTFOU2FUbzVJdFZzbjJIVHZKWmZVdHpHMDJTb09TMXVXNVVJSDVmci9W?=
 =?utf-8?B?WEJaWVRObEdPRGRJbzQ5SHVwRDkrT1BVT1VHNmYxQTdCaHVmWk1yb0NoaWpS?=
 =?utf-8?B?aEZrY2g2MnJacVRzLzdkdDN6VnYvWVRXZGNVVEcrS0o5UlJhK3hTbUVnRFFi?=
 =?utf-8?B?ZUtnc2JQRzdWNGJYZ0gvSEwzQWhIblB0anFPWk0yTkFCT0NCQU5HRExWTU1O?=
 =?utf-8?B?S1RBMk1jQ3I5SjFDL2wrRnM1ZUl1aUEwSmh0VG8wNFdxNDZBNWlpK2hXME9Q?=
 =?utf-8?B?TFgwR0h1SVQ0Q0tIeGV3aDg3RnRBRGhWRUg5WE9TM0J5dlBxS1p6eURnNUhy?=
 =?utf-8?B?TVFwZzgrMnp4dzM5R3FSUXVGTTRGdXVjdEpzb1IyQkU4T0hOWGVGd0UvSFRZ?=
 =?utf-8?B?TS8vVUlrWHFJMklSWEF6c2RZUC9kdllNdk1MR2psVkRsT0FPVzVDbm80ZFJh?=
 =?utf-8?B?V3BPR01ydUx6cE00cm16My9JS3dBVW1FekFpMUx1MWFub3NLdFVZRmFvZG1W?=
 =?utf-8?B?N0NOb3FFUzI2RzJhNUFPZC9KRnlneFcvMVB0aWZBY1NRcDh5bmJwbFA3V2Zm?=
 =?utf-8?B?d1BhdGttZ0xIcGM0TllYcGZiUWIwaHoxdUM4eElVV0g2eHpCMUJTKytZaWlC?=
 =?utf-8?B?TTg2STV0blRHYkZxcDc4dFpXaEpIeklhUmlnMSszR0RRLzk0WHIxSzNzNVNN?=
 =?utf-8?B?MWNKbGYycjlrSkp0a0RJTkJNUUtmNDIzTUZKcHo1RmFxVDZwbmNHelp6L1ZL?=
 =?utf-8?B?M3QxRlpxajB2SXJBbDlhRm00UStKbSsrY2VlV0hyN2ZycGQ1amxEWEF0WXV3?=
 =?utf-8?B?eFBRcUFwcEc5Y1VJRHdOZkhzNm12K3NsUTM1elY2TGthMUo4WEFTRlJINzli?=
 =?utf-8?B?Ny9jOEltV3BST21ZSUVaWGpIZHBxUUp3SjFpSnA3OXVqcGcvVURZT0UrQVVL?=
 =?utf-8?B?MGRyOUxGVG5HbzlHTW53ckEydC9ncDJYS0NRckNzd0xFSTFOdDVNZmVjNkFo?=
 =?utf-8?B?dU1Ma0tEd1JlbmRnekozVnRnbkVyWExKUzk0akV3S2M2TlZDQ2RSa3VtNlgw?=
 =?utf-8?B?RWV5K3ZjdGwzektTeVFIZjllYUtSMkFjMjdlZm1uNGZoNGJGQ3I4cjRKV3k0?=
 =?utf-8?B?RElWOWFHR0lPdkt4S0hMLzN0UzlYUXF5cHo4QkV1QldQSVRLMEVBUzlBaHQ1?=
 =?utf-8?B?a3BMMTVOdHZSUGdtRmZLWHJjT3lmZmtLVngyMTY3WjhvNEt5cUFBWXNkS1dK?=
 =?utf-8?B?bGRJaUxJbnNFR0dnbEJNTWFUWUJUaWUrblV1dEs1TnAwcjF5OFFDYUFnRS9N?=
 =?utf-8?B?Qmt4N3VzalNucWtLS2tBYkRPNUxIQWVEMVR0M2FSdVNxRUU3RFpNR3JPSVNo?=
 =?utf-8?B?UENqTFMxeTIxRzBBNWxTQlFabnNjUEd6Slh0VVgwMld3OUpIZ3k2ZlZxRGs0?=
 =?utf-8?B?L29ESWVTd0NxN3dOMVpnY1RIaXhUbkxKNXBhNXhWQTBtWGRxSmVvQkpBNTdF?=
 =?utf-8?B?RStXY2hiM1Y2YlZ1dTVNcFhvMXlEQTcwbDFnMXFKSm9ndW11SUZiWFZ1ak4y?=
 =?utf-8?B?aDNLWm9xVnF3SHpLRzlEdDVVK3VEMlV3RGE5OFF2cXI4ZVZUL0FtY3k0aUlj?=
 =?utf-8?B?N1BRWjlOang4dVArR3h3Tm5TalpCM29WbjZpYk51b3pDTFp0Vno0UmtuWkRk?=
 =?utf-8?B?M1dPSHFLei9KU0I4ZzVPaTNHa2xnVy9MSU1XcEdzeUdDQ1hDMVlTL1NOOTdk?=
 =?utf-8?B?SDdud0hmdEVRRENLZGFjYzUwVCtsZHpCaDVaMEY5VjRtR241WE9tanR4bmU0?=
 =?utf-8?B?UWM2SUt3TU1PTGFvL2dQWGI4VkhLVFpUYU91WDBoakYzVmZoZHpOLzBnOUo5?=
 =?utf-8?Q?hr4TIuyTVkzXv171ulRlY6yjRxPmkKXi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUZVNjhtNE5VUDhuT1VzL0tSWGdjT0hrcjJMalRScEpSQnFNaHpONEdYMk1k?=
 =?utf-8?B?RDZydFIwdkFwVEtCNnJQOTdWZHc2VmlIZjZtT2pQOWhvbDB0TGdjVTZ3TERN?=
 =?utf-8?B?ajNLODhGRytsUDJuMUJxbDMzVENkVW1QSjBQUk5wVWkreENsYjVrME5QSUpz?=
 =?utf-8?B?SkxzdFU5Ulhvam5JaWh3SU5ybDFGdUczS2tNSEE5OFUrVzFDTmRyZ01rcHUz?=
 =?utf-8?B?Y1JmaWd6S2tNVnJMa1NUUEJXNnhGSVlNeGdSUUYvbXp3Zk16bnYyem1lOWts?=
 =?utf-8?B?cVh1TkhMUlVja0JZcWE2V0NsQ2Q1WXlGc0NmUjVBazdSU2VjWmhYcm5BL1gv?=
 =?utf-8?B?Q3JudkJTaGdGS3VIUjduTnd2K1dOdjZxQnF6eTlhMnhBZ3VNMURpSFRnc25w?=
 =?utf-8?B?d1krcXVZVTV1aVJ3QkdDZjJmbzZHMUtkTkpOUlVLNjcrTTBxUXI4Ymc5cC9L?=
 =?utf-8?B?SnJJaDltV2pQdDU3V0RKMjdpSVlyYUhJa0t3SkxQTTg2U3lqQWVkcnk5YVlu?=
 =?utf-8?B?RE8vMzBUcDI4L0E1akNESy9nMGV3OVBLYTA2T3dwS1FKNGF6YTY0eEd0UHgy?=
 =?utf-8?B?ZFVPRVNoU0QyVHh6MG9GamNZcFdZdy9ZNUcvYWpHTjhMSVVTOGlJSmF6clVJ?=
 =?utf-8?B?YnN3NXBOQzZpZEhlanlIL09UV1FkNHNWdjkxTEU3NjErZ25pb2ZrZU1LQ0J5?=
 =?utf-8?B?eEpDcmxJdkFwVWFXRm9LalNrMWU2VTRuUVRmK2RBT01oM2ZDanFQLzRucGFN?=
 =?utf-8?B?MC9idzVVZnVJb00xdVpDaU9zeWpSK1VIOUdCeDUzN0dZSkNYV0J0TzNnWmk3?=
 =?utf-8?B?VWpSQm9HcmRqWVdTaUFRMnJGajFXQ1hyajM2Y1FtbzRka2tCOG9VV2RHQWo3?=
 =?utf-8?B?bHNYSWJSVHlLWDQ3ZG1KYXNWbzZ1OURwcWRGRENjZnkrdDVxZ3djcGdQTFdk?=
 =?utf-8?B?Z0dFZDNCdVN2ekRHWkwxTUU5M1F5NDg2Z2t1QUdkdDEvSkZUd2ZmaEY5Qzd3?=
 =?utf-8?B?ZCtjMm9PM3paMnBOZXp6Qmc3VWU0Z0EzN1ZCMDFyNFgraUNGRDZlRWwyT3BD?=
 =?utf-8?B?alEyMU0vRjhYWjVhalpBVk9JT1hyc0p3elJVMUhHYitCV0hYVU9jMjQxT1RV?=
 =?utf-8?B?M1FYM2ZyT3R3a2tMSmltaXRDYTNCZFYxM2lmeHRNVk5pemlXTllBOE5PYytl?=
 =?utf-8?B?VTFLK1R0NUJVaVhQNXJBNU90eFRmeGhrUW01VFJKTTFuWnBhbllNdU5tV2Vm?=
 =?utf-8?B?SWxudkVNWitEbWYwdStwN05IS3hkaVNlYlBka0lqVGtjUDNMcmVMVWw5TURa?=
 =?utf-8?B?R3g2WFIycXM1S2xJckplbGtWc2FpVjRaQ1RzLy9mZFh0d1E5K0xMeWhXcTVh?=
 =?utf-8?B?U3c1cEFDdEk3S0dyWmZ5MDA5dnRoTTA4TmYrM1pzWjM2ck04TjhucEF3YUhT?=
 =?utf-8?B?TmxTbHRUY1NoL0hBaW4wTlEvM1ZvOXV5cTE5N2xOZDdQU09VejJnSzIrT3l1?=
 =?utf-8?B?eEI0VzNZU0JMajFIdWlWc3hjTmttTndLQWw0UzhZL2FXa3k2QllUWWlnMlNS?=
 =?utf-8?B?eVBndGN5YmxBMU53K04ram9XMWVSRUVMb3REaGRIV2RaNy94L2dlbUZPMWhp?=
 =?utf-8?B?QTZjQ295NUxrZ2lGeVY0aWZnYk1DRFppcEhIYkZPNThhdisxdGk0ZmVuZTZ2?=
 =?utf-8?B?NVppdFZQVzlBNnpRWkUwb0U2NlEzQXdhQ1dKSXFJSEV3eGkvY1J1aGNNVCtu?=
 =?utf-8?B?UllkNTFmY08yMm5pRko1L3lkNmNkK3c3RjI3WFJ0UlVkTWVWUDBaeDdHdXNL?=
 =?utf-8?B?QnVnSitFeWVkWDZZbWFjeUwzdk1hSy9zdnpxMGtKc29kVFhjM1l5TlE2K2x2?=
 =?utf-8?B?bGRKdlBXZVN0NEpYUE1yRjhuMnV1dVQrWGQvOUFKNFZFV21OeXU3eDEvbXNK?=
 =?utf-8?B?Q0ZHMDhkMVM4ekdESkRyTXBGOTFZS0FiQVhBcDNYbjdVWEpBRWdvck1yTmQ0?=
 =?utf-8?B?MjA5cHk3UXR0clkwdVdHVFk2dC9BQm9sRjVQdlpKZUN5dmdFTmFjdTAwY1J6?=
 =?utf-8?B?YkVXSkk4TC81OVAxbnZzeUYvS3dNaDYwY3J5ZHo3bUlpeERsaS9MdTRnZXVz?=
 =?utf-8?B?bFpLVytyQVRSbXFWOWJJUjh4VlV2d3BoMFJnQ0JkNFMyWS83MnE2aklYUmNZ?=
 =?utf-8?B?SlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3239571861B0B47AF2ED13F7C53F699@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d11eea2-e491-4425-29e7-08dd65c56380
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 02:34:16.5494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: plaHtDOt6OGHFBDSfbwc0W6WN9vog2Z3GWZZRxLyevtjOrRgYf6RAL+CVaQwKUImO6QspGz6vHRMcCFwIQYHZdR7zpWbc/+yReYZwIVissU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10565

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
b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NCg0KLS0tDQoNCkNoYW5nZXMgaW4gdjc6DQogLSBk
ZWNsYXJlZCBib290X3N0YWNrX2Noa19ndWFyZF9zZXR1cCBhcyBhbHdheXNfaW5saW5lDQogLSBt
b3ZlZCBgI2lmZGVmIENPTkZJR19TVEFDS19QUk9URUNUT1JgIGluc2lkZSB0aGUgZnVuY3Rpb24N
Cg0KQ2hhbmdlcyBpbiB2NjoNCiAtIGJvb3Rfc3RhY2tfY2hrX2d1YXJkX3NldHVwKCkgbW92ZWQg
dG8gc3RhY2stcHJvdGVjdG9yLmgNCiAtIFJlbW92ZWQgQW5kcmV3J3Mgci1iIHRhZw0KDQpDaGFu
Z2VzIGluIHY1Og0KIC0gRml4ZWQgaW5kZW50YXRpb24NCiAtIEFkZGVkIHN0YWNrLXByb3RlY3Rv
ci5oDQotLS0NCiB4ZW4vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKysrDQog
eGVuL2NvbW1vbi9LY29uZmlnICAgICAgICAgICAgICAgIHwgMTUgKysrKysrKysrKysrDQogeGVu
L2NvbW1vbi9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgIDEgKw0KIHhlbi9jb21tb24vc3RhY2st
cHJvdGVjdG9yLmMgICAgICB8IDIxICsrKysrKysrKysrKysrKysrDQogeGVuL2luY2x1ZGUveGVu
L3N0YWNrLXByb3RlY3Rvci5oIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
IDUgZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCB4
ZW4vY29tbW9uL3N0YWNrLXByb3RlY3Rvci5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9pbmNs
dWRlL3hlbi9zdGFjay1wcm90ZWN0b3IuaA0KDQpkaWZmIC0tZ2l0IGEveGVuL01ha2VmaWxlIGIv
eGVuL01ha2VmaWxlDQppbmRleCA1OGZhZmFiMzNkLi44ZmM0ZTA0MmZmIDEwMDY0NA0KLS0tIGEv
eGVuL01ha2VmaWxlDQorKysgYi94ZW4vTWFrZWZpbGUNCkBAIC00MzUsNyArNDM1LDExIEBAIGVs
c2UNCiBDRkxBR1NfVUJTQU4gOj0NCiBlbmRpZg0KIA0KK2lmZXEgKCQoQ09ORklHX1NUQUNLX1BS
T1RFQ1RPUikseSkNCitDRkxBR1MgKz0gLWZzdGFjay1wcm90ZWN0b3INCitlbHNlDQogQ0ZMQUdT
ICs9IC1mbm8tc3RhY2stcHJvdGVjdG9yDQorZW5kaWYNCiANCiBpZmVxICgkKENPTkZJR19MVE8p
LHkpDQogQ0ZMQUdTICs9IC1mbHRvDQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9LY29uZmlnIGIv
eGVuL2NvbW1vbi9LY29uZmlnDQppbmRleCBhNmFhMmM1YzE0Li4yZjZjNzRmMTFlIDEwMDY0NA0K
LS0tIGEveGVuL2NvbW1vbi9LY29uZmlnDQorKysgYi94ZW4vY29tbW9uL0tjb25maWcNCkBAIC04
Myw2ICs4Myw5IEBAIGNvbmZpZyBIQVNfUE1BUA0KIGNvbmZpZyBIQVNfU0NIRURfR1JBTlVMQVJJ
VFkNCiAJYm9vbA0KIA0KK2NvbmZpZyBIQVNfU1RBQ0tfUFJPVEVDVE9SDQorCWJvb2wNCisNCiBj
b25maWcgSEFTX1VCU0FODQogCWJvb2wNCiANCkBAIC0yMTYsNiArMjE5LDE4IEBAIGNvbmZpZyBT
UEVDVUxBVElWRV9IQVJERU5fTE9DSw0KIA0KIGVuZG1lbnUNCiANCittZW51ICJPdGhlciBoYXJk
ZW5pbmciDQorDQorY29uZmlnIFNUQUNLX1BST1RFQ1RPUg0KKwlib29sICJTdGFjayBwcm90ZWN0
b3IiDQorCWRlcGVuZHMgb24gSEFTX1NUQUNLX1BST1RFQ1RPUg0KKwloZWxwDQorCSAgRW5hYmxl
IHRoZSBTdGFjayBQcm90ZWN0b3IgY29tcGlsZXIgaGFyZGVuaW5nIG9wdGlvbi4gVGhpcyBpbnNl
cnRzIGENCisJICBjYW5hcnkgdmFsdWUgaW4gdGhlIHN0YWNrIGZyYW1lIG9mIGZ1bmN0aW9ucywg
YW5kIHBlcmZvcm1zIGFuIGludGVncml0eQ0KKwkgIGNoZWNrIG9uIGZ1bmN0aW9uIGV4aXQuDQor
DQorZW5kbWVudQ0KKw0KIGNvbmZpZyBESVRfREVGQVVMVA0KIAlib29sICJEYXRhIEluZGVwZW5k
ZW50IFRpbWluZyBkZWZhdWx0Ig0KIAlkZXBlbmRzIG9uIEhBU19ESVQNCmRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL01ha2VmaWxlIGIveGVuL2NvbW1vbi9NYWtlZmlsZQ0KaW5kZXggYWMyMzEyMGQ3
ZC4uOTJjNDkxMjdjOSAxMDA2NDQNCi0tLSBhL3hlbi9jb21tb24vTWFrZWZpbGUNCisrKyBiL3hl
bi9jb21tb24vTWFrZWZpbGUNCkBAIC00Niw2ICs0Niw3IEBAIG9iai15ICs9IHNodXRkb3duLm8N
CiBvYmoteSArPSBzb2Z0aXJxLm8NCiBvYmoteSArPSBzbXAubw0KIG9iai15ICs9IHNwaW5sb2Nr
Lm8NCitvYmotJChDT05GSUdfU1RBQ0tfUFJPVEVDVE9SKSArPSBzdGFjay1wcm90ZWN0b3Iubw0K
IG9iai15ICs9IHN0b3BfbWFjaGluZS5vDQogb2JqLXkgKz0gc3ltYm9scy5vDQogb2JqLXkgKz0g
dGFza2xldC5vDQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zdGFjay1wcm90ZWN0b3IuYyBiL3hl
bi9jb21tb24vc3RhY2stcHJvdGVjdG9yLmMNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAw
MDAwMDAwMDAwLi45MDg5Mjk0ZDMwDQotLS0gL2Rldi9udWxsDQorKysgYi94ZW4vY29tbW9uL3N0
YWNrLXByb3RlY3Rvci5jDQpAQCAtMCwwICsxLDIxIEBADQorLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KKyNpbmNsdWRl
IDx4ZW4vbGliLmg+DQorI2luY2x1ZGUgPHhlbi9yYW5kb20uaD4NCisjaW5jbHVkZSA8eGVuL3Rp
bWUuaD4NCisNCisvKg0KKyAqIEluaXRpYWwgdmFsdWUgaXMgY2hvc2VuIGJ5IGEgZmFpciBkaWNl
IHJvbGwuDQorICogSXQgd2lsbCBiZSB1cGRhdGVkIGR1cmluZyBib290IHByb2Nlc3MuDQorICov
DQorI2lmIEJJVFNfUEVSX0xPTkcgPT0gMzINCit1bnNpZ25lZCBsb25nIF9fcm9fYWZ0ZXJfaW5p
dCBfX3N0YWNrX2Noa19ndWFyZCA9IDB4ZGQyY2M5MjdVTDsNCisjZWxzZQ0KK3Vuc2lnbmVkIGxv
bmcgX19yb19hZnRlcl9pbml0IF9fc3RhY2tfY2hrX2d1YXJkID0gMHgyZDg1MzYwNWE0ZDlhMDlj
VUw7DQorI2VuZGlmDQorDQordm9pZCBhc21saW5rYWdlIF9fc3RhY2tfY2hrX2ZhaWwodm9pZCkN
Cit7DQorICAgIGR1bXBfZXhlY3V0aW9uX3N0YXRlKCk7DQorICAgIHBhbmljKCJTdGFjayBQcm90
ZWN0b3IgaW50ZWdyaXR5IHZpb2xhdGlvbiBpZGVudGlmaWVkXG4iKTsNCit9DQpkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUveGVuL3N0YWNrLXByb3RlY3Rvci5oIGIveGVuL2luY2x1ZGUveGVuL3N0
YWNrLXByb3RlY3Rvci5oDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMC4u
Yzc2YzYwMTM5OQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIveGVuL2luY2x1ZGUveGVuL3N0YWNrLXBy
b3RlY3Rvci5oDQpAQCAtMCwwICsxLDM5IEBADQorI2lmbmRlZiBfX1hFTl9TVEFDS19QUk9URUNU
T1JfSF9fDQorI2RlZmluZSBfX1hFTl9TVEFDS19QUk9URUNUT1JfSF9fDQorDQorZXh0ZXJuIHVu
c2lnbmVkIGxvbmcgX19zdGFja19jaGtfZ3VhcmQ7DQorDQorLyoNCisgKiBUaGlzIGZ1bmN0aW9u
IHNob3VsZCBiZSBjYWxsZWQgZnJvbSBhIEMgZnVuY3Rpb24gdGhhdCBlc2NhcGVzIHN0YWNrDQor
ICogY2FuYXJ5IHRyYWNraW5nIChieSBjYWxsaW5nIHJlc2V0X3N0YWNrX2FuZF9qdW1wKCkgZm9y
IGV4YW1wbGUpLg0KKyAqLw0KK3N0YXRpYyBhbHdheXNfaW5saW5lIHZvaWQgYm9vdF9zdGFja19j
aGtfZ3VhcmRfc2V0dXAodm9pZCkNCit7DQorI2lmZGVmIENPTkZJR19TVEFDS19QUk9URUNUT1IN
CisNCisJLyoNCisgICAgICogTGluZWFyIGNvbmdydWVudCBnZW5lcmF0b3IgKFhfbisxID0gWF9u
ICogYSArIGMpLg0KKyAgICAgKg0KKyAgICAgKiBDb25zdGFudCBpcyB0YWtlbiBmcm9tICJUYWJs
ZXMgT2YgTGluZWFyIENvbmdydWVudGlhbA0KKyAgICAgKiBHZW5lcmF0b3JzIE9mIERpZmZlcmVu
dCBTaXplcyBBbmQgR29vZCBMYXR0aWNlIFN0cnVjdHVyZSIgYnkNCisgICAgICogUGllcnJlIEzi
gJlFY3V5ZXIuDQorICAgICAqLw0KKyNpZiBCSVRTX1BFUl9MT05HID09IDMyDQorICAgIGNvbnN0
IHVuc2lnbmVkIGxvbmcgYSA9IDI4OTEzMzY0NTNVTDsNCisjZWxzZQ0KKyAgICBjb25zdCB1bnNp
Z25lZCBsb25nIGEgPSAyODYyOTMzNTU1Nzc3OTQxNzU3VUw7DQorI2VuZGlmDQorICAgIGNvbnN0
IHVuc2lnbmVkIGxvbmcgYyA9IDE7DQorDQorICAgIHVuc2lnbmVkIGxvbmcgY3ljbGVzID0gZ2V0
X2N5Y2xlcygpOw0KKw0KKyAgICAvKiBVc2UgdGhlIGluaXRpYWwgdmFsdWUgaWYgd2UgY2FuJ3Qg
Z2VuZXJhdGUgcmFuZG9tIG9uZSAqLw0KKyAgICBpZiAoICFjeWNsZXMgKQ0KKyAgICAgICAgcmV0
dXJuOw0KKw0KKyAgICBfX3N0YWNrX2Noa19ndWFyZCA9IGN5Y2xlcyAqIGEgKyBjOw0KKw0KKyNl
bmRpZgkvKiBDT05GSUdfU1RBQ0tfUFJPVEVDVE9SICovDQorfQ0KKw0KKyNlbmRpZgkvKiBfX1hF
Tl9TVEFDS19QUk9URUNUT1JfSF9fICovDQotLSANCjIuNDguMQ0K

