Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFN9CE8zGGpwfggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 14:21:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C045F201B
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 14:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321152.1588122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSZjQ-0005wi-0g; Thu, 28 May 2026 12:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321152.1588122; Thu, 28 May 2026 12:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSZjP-0005tu-UC; Thu, 28 May 2026 12:20:59 +0000
Received: by outflank-mailman (input) for mailman id 1321152;
 Thu, 28 May 2026 12:20:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wSZjO-0005to-Lp
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 12:20:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSZjO-005hJW-2Z
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 14:20:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a183321-e002-0a2a0a5209dd-0a2a4502cc76-36
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 14:20:58 +0200
Received: from [52.101.83.130]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a183329-af86-0a2a45020019-34655382f844-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 14:20:57 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AM9PR03MB7474.eurprd03.prod.outlook.com (2603:10a6:20b:26a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 12:20:55 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0071.010; Thu, 28 May 2026
 12:20:54 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P85UiEpS7WutJa6Oo2Ezl/W2XuqIT+V57+lvXzspiqgg3L0ig7lE6tLduw/UxuyOZ7AZ5M2MSyC2qRTI0W2JNtWFqaSHDLTVnTK8ILdhbsRRXU96xfA1UBlLDu5PFwXjbUtC1Qpef9Z7544+VlHQRVdL38mgrP0DOn2hWLtJTO46+bQ6vtIDD/ixCxikoh4cAxrkDZvIiaDB2o9V6Izl2oP4q0wUH1X+iPxP7vONt+8koMKcFKu95WXOs2FS17WakBTQkQ6svK284JLHQx0x5n3dTG/dcOnoIHnPsz43ewIQEIFLh05S8XieEEGz+ZH60uZpMoSGXUBZpha2354fzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yn6cD4B+vWQMSyZe+Xb1pwRiw24ZIq/CbRgerj+mVQc=;
 b=UHUtFd/5OtIbi9t2LcfFkWh4iZhiNZZcYe9n+9M1y6vsoupD8GPhqZ+rynvaJmLjlAZ/16AtsVuOrLBpW8gIuxRfMdVcQLnIGCTcNYpk88r3Qz1Cc+lMTvazR2Zs1ZnrOd+Jj88l8ArF5Md/bmQ/xtiNdMzS4RQAp5470nt6Uv+pP1N16zRxpbTCnANQSAi8TczG+HwvSTVedNmHgdVu5yUBuwGI4bbsKHWFAej6V9b3VPOU++J0TAhEGBFQwuC2QkgZvM5b4JiDFP80u1ccfViro0YklHRgmwf7G9o/89vytUi2Ay5eLuIj9tOFDk7mIneWJyAYAWMrY01gJqLsvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yn6cD4B+vWQMSyZe+Xb1pwRiw24ZIq/CbRgerj+mVQc=;
 b=ZcpkUDLxx3Z6covHVIjHWcrNQQgbMjwdqMKbFZVDXGW87LaTTXQa0vfHmqMPd9I9AzQG+55TPIy+2Y/wqcmd0CYmm4pnyXp3qIdCjGPYZXx2NP110rvQ/ZQr210FQa0JPBiZrVEJ7WoGwQ9598EAVnxDaVzDPdV8E0qC24cVJXLpDlgBW6llqj8YI97Pz5x91YuLvqdB6KiBW7m37j7bDddRZYg8bDs7rGKiZWUpjDUDcnVjxddGmPEr7Jfi5g435DddK1s0PErjSMIWzP15NQD3dyxFjxOTgXd8PeboKsF0oN/qo4G+VqZU3ACRTBRiWCWrD+t4qdGOkR3k4O+6ww==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: Re: [PATCH] coverage: place GCOV-generated .text.* sections in Xen
 text
Thread-Topic: [PATCH] coverage: place GCOV-generated .text.* sections in Xen
 text
Thread-Index: AQHc7VOxa7dJ7uwiTkiCFpTyz2B8prYh27QAgAGCf4A=
Date: Thu, 28 May 2026 12:20:54 +0000
Message-ID: <adef7657-e7be-472c-a11d-13c4d92ff007@epam.com>
References:
 <cb8c1e0862a554f7a28347f549e9cfd0b0d6db2f.1779829545.git.dmytro_prokopchuk1@epam.com>
 <ahbu7qiPxp7c4Yp5@macbook.local>
In-Reply-To: <ahbu7qiPxp7c4Yp5@macbook.local>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AM9PR03MB7474:EE_
x-ms-office365-filtering-correlation-id: 84d036a6-bf02-4b05-5043-08debcb390a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|42112799006|38070700021|4143699003|11063799006|3023799007|6133799003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 lkoNtGSOtya8fk5SINrTVsnN55G9oYF7FCigDjZJRRTHQl17mjEJFMsBnALdyFjs1N1xSSw8hsNPOvkb77/lEblZYhBX+cY4o4dhyLVjATVKQJIbkksJ+Pch3rZoMTmbzztG263Xrc41tKC4DY+jJDAChNlZAD+GALBR6sFwDv86f2ZcdU/Y7g8qk7TWo/6f4/chZ7tc9aFtI7VvnOr/rWEFoaZIcdlklxDXdDeD60Cgwd/GQJJzVBUpzi0MhsJmMgh8MYeM8tzElHo3a1/9e+bdcT4+Oh7+wRGVDwfE+ahTBBX3Wx8P13ACZYdpOzNwfLEqN761U9n9ufNi081UGIur/6c6lAZWnTs9TXLAF1Chg88+WSvf2vYLQlse3uTOVa0WyTP2c4aaU9IMunccokdUZZ7jzsCBnPAu6yl6Cpq/kxqx27zRIRHpNrfvGQ82vScifSswXwtras4s2WIx/WHx+HaFf8O6p7iWnM5vUr8U/U7NYM4D82Fepmmertd4W7ZlVw4m8Ao2jtQhx6AFiBRXfKH1otYTxkFlHp7mrvxtGEKmHiJS3UDy/V3EqZS31tXCnjiGt7+6h46RgmWlTBzQ7o21K6M5zT/jlGVn43abRBcmK59BqFz1hNsWFmws/pZyYkk9pqvSimotSawU50VuBDBemtNsSh/c+T2mRBqlEBMnwyjtZUaE5PTzbQQT8ll0ogBejj1Xj8oRajaulIekMG0lSYKmwwA4TYE7yNTweYhX5ihi2ZCvC9M4qpz2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(42112799006)(38070700021)(4143699003)(11063799006)(3023799007)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2lDYnYzYW96ODF4QlpoMEpFNk9ZSW1PTlBhRThncVlnUU9EeXB5Y2hqQUJJ?=
 =?utf-8?B?Nm9NODU3ODFCR0ZlU0QzRGdta1diTDdzUGxsUGpJdmJLZjBSY25yYWdmdm04?=
 =?utf-8?B?OCtvNjM3VndhVWtGdk9nc3BFTnNVRVd1RGhqNnRZdmxLSlpTaUUrRW8vY2RM?=
 =?utf-8?B?QW5qNEt0SzZRRVREdU0vVFRFSmNBL3RtK3l6NlhQRDNVYkNGcGpMcWpUSnVS?=
 =?utf-8?B?TFczQmdxNGdQR1RDeGJuVHFYNkVLOG13K1VSWTlvUEg3U1BlS1ZIYmVaS0pQ?=
 =?utf-8?B?SXVSTGNkUkc5NjhES0wwU0FxZEhwSXVJYlV0VDhWamNuaHlBcEhJWGlremhS?=
 =?utf-8?B?NW1zVjN6QVVjdzVPeTJ3UTVWYXhORmlBODYzbEQyd2JjT3ZWcmk2cTJUWXlY?=
 =?utf-8?B?ZDl0eUQ0SzQzYkNnY2Q4Qm03OEhkYzZDeExiY25HZE5CSUwxTTNzVXI1eXBF?=
 =?utf-8?B?UDBnQWRHKzA1V0JhbFlkY1hGcS9iTWpmTzBKZm1yamJGMzZZK3FsZ2JER2Jn?=
 =?utf-8?B?N2tKM2VqVi9DbmM2dmZ2RWhuaUJacytTSHpVelkydWkyWG1keTRMWit5SEdy?=
 =?utf-8?B?RDdtUG01ZDNZRlluOTRxc0l3bi94VXQxMHlaSGdodnFSZXJHd2NPUXJEY08v?=
 =?utf-8?B?UUlOTmdPWnV6V0IyMmRudk1ya1VwRDk0NzBOU1daM3lzUFNLUlE2Si9ZZVUw?=
 =?utf-8?B?YTNLSUxKMkE4UzVTcWs4eDZFYVJLcFJ2UEM1ZVoxR1dyVkpFcko2T2FZM29S?=
 =?utf-8?B?YndON09xQUxiOHFBaVk3V3hMN01WV0FwM0o3Ui9UYitmc1BCYjNzMjk0ZkFJ?=
 =?utf-8?B?cFVGRkw5Z3JhOU01Tit0dURkcFF3RHZTSk5yRG1OWnNxdnBBS1BUcHU3UmxC?=
 =?utf-8?B?WWlXWmhyT0x5eU9IRmZ2YjNwOWc4aC9MMnRPQ3lvL3pDbXZPb3JHak84YTNI?=
 =?utf-8?B?WUZmekE2c1BEVU5mQ3ZodnRjbVgveDFEcjhYcDZBalJqZmJTdGljdG16c0w3?=
 =?utf-8?B?cTAxOTFoMXJkekFqZnZ6T2ZvVStZUko0UDdQaTZld3Axb3FqUXMxMksxQmEy?=
 =?utf-8?B?ekppSlh6TXlSQnV0Nk03dHVsRVJhbGJKS2M4RVMvRlZ1eHVpSlRjdk8vVUUz?=
 =?utf-8?B?VlR5a0pqYUcvVjdzdjdwVEZiL3Q1dDFMRVF0cUs4cG8yMWhVVEVKRmQyY1ln?=
 =?utf-8?B?WGd5cWM1RHZYTm1ydnJVY0Rjc2dCVUlucjVGaG15OURPZlR1UnJDVXlJaG5n?=
 =?utf-8?B?a0RXSVZrY3hYdGJTcUNJSng1US9KeVdLektvaDhhQXZkTkxIT0F5N0Z4b1lU?=
 =?utf-8?B?V1prNzFzd1JFSHV2RDlWenFFWC9WN1dtRlVqSlY2ZjlhSFNGamZtSkJyYlYx?=
 =?utf-8?B?em5wZWFaWVJ5REhYQ3JVWmFQOFFGM2lBTDNOaVZVbUdPRDhiaUZrN2hycDNM?=
 =?utf-8?B?NWloTDJneFpRbHk2SGpwdFdVY0ZUOXRHRzhBRHY1ZWNLT1JDTnY1UDFYcTFQ?=
 =?utf-8?B?U1I1b3R3TmxsaXNHeVRIVEhDOGV1czdtTVorWENXSEwwM2NZUEEwM0tqR0Rl?=
 =?utf-8?B?NmJBMldEaWFRK2c5ZFJpd3dNRFBpempTUE5Bc3VNKzY5T1VEenRKaTF4V2th?=
 =?utf-8?B?WW85TUJpM3o4bzZGc0pUdkFweENodTA4VjgwczR5b3hnZEdZM0JNazNaZTN2?=
 =?utf-8?B?d1h6S3dEZUFsNGVwck1CWDl4dDc0OGM0MlFGbC9aWEVPR240NHZGdTdwNzVP?=
 =?utf-8?B?ZGpVTFR6UkptcmE4a2NkczVHTVQvV3dxSmhQRjVscjRzczlKZ3dReHdDNHlz?=
 =?utf-8?B?b0NhTW9YOUx0ei9RVStZK0h2ZkRiaWFxMmVyWEtIQjdHck9FOUJnNEVhRFdY?=
 =?utf-8?B?Zm5EU01pVkZPbTJmdXY5ellJRlQ5TWI0L05RdFZRUjBRQWRwSkVNQlVTM29H?=
 =?utf-8?B?RDV4TG9vWHJZbTlPWUxxSzNkL0kwbDZvSlQvdG12RDRhekJVR2g5L3VPaFBv?=
 =?utf-8?B?NFhvalgzczgxT09aTmg4R2ZkeEt1Tnh2WTdEVmZsWFBPTTRRaHlicUNoTVZG?=
 =?utf-8?B?UklKM3BJMDF1QU1sNzNYbGJHVC9KWEFrRXlhWEo3S3lCUUxOZ3ZMREV3Vyt1?=
 =?utf-8?B?dlNZQ2N0T2c4NXU0bG1rMXgwNm1wekpuMkFDeEpBZ1VWeDNkU1dBcDJ4aklX?=
 =?utf-8?B?ZmlNTU1Cb0I2YUNyTy9RQmRMQVlhTGpkMnJPVFBBYjFuQ215VUNxS0Z2VytJ?=
 =?utf-8?B?Rmx0bHZHMVVuczMvdVpkMU1ZdWE2SXcvaVpDcjN2Tk9vbElvQTRwc0grRHN4?=
 =?utf-8?B?c1ZaQzhtb3VKVWpzWUpnQyswYjNiTjdCNEptY2IvVG9KYWRFb05NdlkrOGQ5?=
 =?utf-8?Q?D7SuHGgXCaAqEtDk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE341934A2C32F4CA3430B0D25164632@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d036a6-bf02-4b05-5043-08debcb390a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 12:20:54.5253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M2eSrOpGmaxbH4d5nUaA6ZRf4h7ekkOb6733r+FS9eRwIj8HfX/HPLxey7YnfXJWYPsOuM4AXFhImEOYnRiIeOzLsBw9sarLczwnZTlJiTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7474
X-purgate-ID: tlsNG-720697/1779970858-ABD67161-6AD23E33/0/0
X-purgate-type: clean
X-purgate-size: 5786
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xen.org,arm.com,amd.com,epam.com,raptorengineering.com,wdc.com,gmail.com,suse.com,citrix.com,vates.tech];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,epam.com:mid,epam.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 61C045F201B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCk9uIDUvMjcvMjYgMTY6MTcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFR1ZSwg
TWF5IDI2LCAyMDI2IGF0IDA5OjA3OjQyUE0gKzAwMDAsIERteXRybyBQcm9rb3BjaHVrMSB3cm90
ZToNCj4+IEdDT1YgaW5zdHJ1bWVudGF0aW9uIGNhbiBlbWl0IGV4ZWN1dGFibGUgaW5wdXQgc2Vj
dGlvbnMgc3VjaCBhcw0KPj4gLnRleHQuc3RhcnR1cCBhbmQgLnRleHQuZXhpdCB3aGVuIENPTkZJ
R19DT1ZFUkFHRSBpcyBlbmFibGVkLg0KPj4gQXQgcHJlc2VudCB0aGUgWGVuIGxpbmtlciBzY3Jp
cHRzIG9ubHkgY29sbGVjdCAudGV4dC4qIGludG8gdGhlDQo+PiBtYWluIHRleHQgb3V0cHV0IHNl
Y3Rpb24gd2hlbiBDT05GSUdfQ0NfU1BMSVRfU0VDVElPTlMgaXMgZW5hYmxlZC4NCj4+DQo+PiBX
aXRoIENPTkZJR19DT1ZFUkFHRT15IGFuZCBDT05GSUdfQ0NfU1BMSVRfU0VDVElPTlM9biwgdGhl
c2UgZXhlY3V0YWJsZQ0KPj4gc2VjdGlvbnMgbWF5IGJlIHBsYWNlZCBhcyBsaW5rZXIgb3JwaGFu
cyBvdXRzaWRlIHRoZSBleHBlY3RlZCBYZW4gdGV4dA0KPj4gcmVnaW9uLiBDb25zdHJ1Y3RvcnMg
Z2VuZXJhdGVkIGJ5IGNvdmVyYWdlIGluc3RydW1lbnRhdGlvbiBjYW4gdGhlbiBwb2ludA0KPj4g
YXQgY29kZSBvdXRzaWRlIHRoZSBub3JtYWwgUlggdGV4dCBtYXBwaW5nLCBsZWFkaW5nIHRvIGVh
cmx5IGJvb3QgY3Jhc2hlcw0KPj4gZnJvbSBpbml0X2NvbnN0cnVjdG9ycygpOg0KPj4NCj4+ICAg
ICAgKFhFTikgWyAgIDEyLjMzMTE5M10gSW5zdHJ1Y3Rpb24gQWJvcnQgVHJhcC4gU3luZHJvbWU9
MHhmDQo+PiAgICAgIChYRU4pIFsgICAxMi4zMzQyNTNdIFdhbGtpbmcgSHlwZXJ2aXNvciBWQSAw
eGEwMDAwM2NlMDAwIG9uIENQVTAgdmlhIFRUQlIgMHgwMDAwMDAwMDQzNTJkMDAwDQo+PiAgICAg
IChYRU4pIFsgICAxMi4zMzg1NTBdIDBUSFsweDAxNF0gPSAweDQzNTJjZjdmDQo+PiAgICAgIChY
RU4pIFsgICAxMi4zNDE4MjNdIDFTVFsweDAwMF0gPSAweDQzNTJiZjdmDQo+PiAgICAgIChYRU4p
IFsgICAxMi4zNDUxMjRdIDJORFsweDAwMV0gPSAweDQwMDAwMDQzNTI3ZjdmDQo+PiAgICAgIChY
RU4pIFsgICAxMi4zNDczMjldIDNSRFsweDFjZV0gPSAweDQwMDAwMDQzM2NlZjdmDQo+PiAgICAg
IChYRU4pIFsgICAxMi4zNTEyMzNdIENQVTA6IFVuZXhwZWN0ZWQgVHJhcDogSW5zdHJ1Y3Rpb24g
QWJvcnQNCj4+ICAgICAgKFhFTikgWyAgIDEyLjM1NzY0M10gLS0tLVsgWGVuLTQuMjEuMSAgYXJt
NjQgIGRlYnVnPW4gZ2Nvdj15ICBOb3QgdGFpbnRlZCBdLS0tLQ0KPj4gICAgICAoWEVOKSBbICAg
MTIuMzYwMjQzXSBDUFU6ICAgIDANCj4+ICAgICAgKFhFTikgWyAgIDEyLjM2NDA5OF0gUEM6ICAg
ICAwMDAwMGEwMDAwM2NlMDAwIDAwMDAwYTAwMDAzY2UwMDANCj4+ICAgICAgKFhFTikgWyAgIDEy
LjM3NTgzNV0gTFI6ICAgICAwMDAwMGEwMDAwNDgwMmY4DQo+PiAgICAgIChYRU4pIFsgICAxMi4z
NzgyNzNdIFNQOiAgICAgMDAwMDBhMDAwMDRjN2UxMA0KPj4gICAgICAoWEVOKSBbICAgMTIuMzgw
NDkyXSBDUFNSOiAgIDAwMDAwMDAwODAwMDAyNDkgTU9ERTo2NC1iaXQgRUwyaCAoSHlwZXJ2aXNv
ciwgaGFuZGxlcikNCj4+ICAgICAgKFhFTikgWyAgIDEyLjM4Mjc4NV0gICAgICBYMDogMDAwMDBh
MDAwMDNjZTAwMCAgWDE6IDAwMDAwMDAwMDAwMDAwMDAgIFgyOiAwMDAwMGEwMDAwNDEwZmEwDQo+
PiAgICAgIChYRU4pIFsgICAxMi4zODUxNzZdICAgICAgWDM6IDAwMDAwMDAwMDAwMDAwMDAgIFg0
OiAwMDAwMDAwMDAwMDAwMDEwICBYNTogMDAwMDAwMDAwMDAwMDAwMQ0KPj4gICAgICAoWEVOKSBb
ICAgMTIuMzg3NTU1XSAgICAgIFg2OiAwMDAwMGEwMDAwNGU1ZjQwICBYNzogMDAwMDBhMDAwMDRl
NWYzOCAgWDg6IDAwMDAwMDAwMDAwMDAwMDANCj4+ICAgICAgKFhFTikgWyAgIDEyLjM5MDAyN10g
ICAgICBYOTogMDAwMDBhMDAwMDRlNWYyMCBYMTA6IDAwMDAwYTAwMDA0ZTVmMzAgWDExOiAwMDAw
MGEwMDAwNGU1ZjQwDQo+PiAgICAgIChYRU4pIFsgICAxMi4zOTI1MTBdICAgICBYMTI6IDAwMDAw
YTAwMDA0Mzk3NDggWDEzOiAwMDAwMGEwMDAwNDA2OTM4IFgxNDogMDAwMDAwMDAwMDAwMDYyZQ0K
Pj4gICAgICAoWEVOKSBbICAgMTIuMzk0OTU0XSAgICAgWDE1OiAwMDAwMGEwMDAwNGYzOTE4IFgx
NjogMDAwMDBhMDAwMDRjN2JiNSBYMTc6IDAwMDAwMDAwMDA0YzdiYjUNCj4+ICAgICAgKFhFTikg
WyAgIDEyLjM5NzI5M10gICAgIFgxODogMDAwMDAwMDAwMDAwMDAzMCBYMTk6IDAwMDAwMDAwMDAw
MDAwMWQgWDIwOiAwMDAwMDAwMDAwMDAwMGE5DQo+PiAgICAgIChYRU4pIFsgICAxMi4zOTk4MDNd
ICAgICBYMjE6IDAwMDAwYTAwMDA0YzgwMDggWDIyOiAwMDAwMGEwMDAwM2ZhMDAwIFgyMzogMDAw
MDBhMDAwMDRlMjAwMA0KPj4gICAgICAoWEVOKSBbICAgMTIuNDAyMzkyXSAgICAgWDI0OiAwMDAw
MGEwMDAwM2Y5MzkwIFgyNTogMDAwMDBhMDAwMDNmYTAwMCBYMjY6IDAwMDAwYTAwMDAzZjRjYTgN
Cj4+ICAgICAgKFhFTikgWyAgIDEyLjQwNDc5OF0gICAgIFgyNzogMDAwMDAwMDAwMDAwMDAwMiBY
Mjg6IDAwMDAwYTAwMDA1N2E5YzAgIEZQOiAwMDAwMDAwMGJlZGI2NzQwDQo+PiAgICAgIChYRU4p
IFsgICAxMi40MDcxMTBdDQo+PiAgICAgIChYRU4pIFsgICAxMi40MDk0NDJdICAgVlRDUl9FTDI6
IDAwMDAwMDAwODAwMjM1NTgNCj4+ICAgICAgKFhFTikgWyAgIDEyLjQxMTI5MV0gIFZUVEJSX0VM
MjogMDAwMDAwMDBiZmZjNDAwMA0KPj4gICAgICAoWEVOKSBbICAgMTIuNDEyODk1XQ0KPj4gICAg
ICAoWEVOKSBbICAgMTIuNDE0MjA0XSAgU0NUTFJfRUwyOiAwMDAwMDAwMDMwY2QxODNkDQo+PiAg
ICAgIChYRU4pIFsgICAxMi40MTU5MjhdICAgIEhDUl9FTDI6IDAwMDAwMDAwMDAwMDAwMzkNCj4+
ICAgICAgKFhFTikgWyAgIDEyLjQxNzY0Ml0gIFRUQlIwX0VMMjogMDAwMDAwMDA0MzUyZDAwMA0K
Pj4gICAgICAoWEVOKSBbICAgMTIuNDE5MTUyXQ0KPj4gICAgICAoWEVOKSBbICAgMTIuNDIwMzI3
XSAgICBFU1JfRUwyOiAwMDAwMDAwMDg2MDAwMDBmDQo+PiAgICAgIChYRU4pIFsgICAxMi40MjIw
NTZdICBIUEZBUl9FTDI6IDAwMDAwMDAwMDAwMDAwMDANCj4+ICAgICAgKFhFTikgWyAgIDEyLjQy
MzgwOV0gICAgRkFSX0VMMjogMDAwMDBhMDAwMDNjZTAwMA0KPj4gICAgICAuLi4NCj4+ICAgICAg
KFhFTikgWyAgIDEyLjQ4NTM1NV0gWGVuIGNhbGwgdHJhY2U6DQo+PiAgICAgIChYRU4pIFsgICAx
Mi40ODkwODBdICAgIFs8MDAwMDBhMDAwMDNjZTAwMD5dIDAwMDAwYTAwMDAzY2UwMDAgKFBDKQ0K
Pj4gICAgICAoWEVOKSBbICAgMTIuNTEyMDc2XSAgICBbPDAwMDAwYTAwMDA0ODAyZjg+XSBpbml0
X2NvbnN0cnVjdG9ycysweDM4LzB4NTAgKExSKQ0KPj4NCj4+IE9ic2VydmVkIGZhaWxpbmcgc3lt
Ym9sOg0KPj4gICAgICBfc3ViX0lfMDAxMDBfMA0KPj4gY2FsbGVkIGZyb206DQo+PiAgICAgIGlu
aXRfY29uc3RydWN0b3JzKCkNCj4+IFRoZSBpc3N1ZSBjYW4gYmUgZGlhZ25vc2VkIGJ5IGVuYWJs
aW5nIGxpbmtlciBvcnBoYW4gZGlhZ25vc3RpY3Mgb3INCj4+IGdlbmVyYXRpbmcgYSBsaW5rZXIg
bWFwOg0KPj4gICAgICBMREZMQUdTICs9ICItLW9ycGhhbi1oYW5kbGluZz13YXJuIg0KPj4gICAg
ICBMREZMQUdTICs9ICItTWFwPXhlbi5tYXAiDQo+PiBhbmQgdGhlbiBpbnNwZWN0aW5nIG9ycGhh
bmVkIGV4ZWN1dGFibGUgc2VjdGlvbnMgc3VjaCBhczoNCj4+ICAgICAgLnRleHQuc3RhcnR1cA0K
PiANCj4gVGhlIHg4NiBsaW5rZXIgc2NyaXB0IGRvZXMgYWNjb3VudCBmb3IgLnRleHQuc3RhcnR1
cCBpbiB0aGUgLmluaXQNCj4gc2VjdGlvbjoNCj4gDQo+ICAgIERFQ0xfU0VDVElPTiguaW5pdC50
ZXh0KSB7DQo+ICNlbmRpZg0KPiAgICAgICAgIF9zaW5pdHRleHQgPSAuOw0KPiAgICAgICAgICoo
LmluaXQudGV4dCkNCj4gICAgICAgICAqKC50ZXh0LnN0YXJ0dXApDQo+ICAgICAgICAgX2Vpbml0
dGV4dCA9IC47DQo+IA0KPiBJIHRoaW5rIHlvdSBqdXN0IG5lZWQgdG8gY29weSB0aGlzIHRvIHRo
ZSBhcmNoZXMgdGhhdCBkb24ndCBoYXZlIGl0Pw0KPiANCj4gVGhhbmtzLCBSb2dlci4NCkhlbGxv
IFJvZ2VyLA0KDQpZZXMsIHByb2JhYmx5IGl0IGNvdWxkIGJlIGRvbmUgaW4gdGhpcyB3YXkuDQpJ
IGNhbiBwcmVwYXJlIFYyIGFuZCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpUaGFua3Ms
DQpEbXl0cm8u

