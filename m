Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4SkxIUhxT2o9gwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:00:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2614972F3FB
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:00:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=nk0tDOf8;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357814.1612151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlYG-0002QM-F3; Thu, 09 Jul 2026 10:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357814.1612151; Thu, 09 Jul 2026 10:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlYG-0002Nc-Bj; Thu, 09 Jul 2026 10:00:16 +0000
Received: by outflank-mailman (input) for mailman id 1357814;
 Thu, 09 Jul 2026 10:00:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1whlYE-0002NW-H3
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:00:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlYD-002f2y-Tq
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:00:13 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f712b-e002-0a2a0a5209dd-0a2a4508dd06-22
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:00:13 +0200
Received: from [52.101.65.138]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f712c-edec-0a2a45080019-3465418a3a60-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:00:13 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS2PR03MB9611.eurprd03.prod.outlook.com (2603:10a6:20b:595::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 10:00:11 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 10:00:10 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNx0IT4tu9Tc7d7WDvGZNgzo/8kV3qIAu7f9dNeIiViOZpS2dwkXAvaEMDw5jneqcqahEvvzaCTIEUtIofp6lqSCZIam5i9MMHXo78Vr+U1dALp76a94A0M4NTY6OobWgp2jFqt05DC3HED+UYiepeADNnphhRbEt5yWJhyKRySolgNtB8JxW3rVTdMG+a7jP6lav266tGkH2MQxUVqz+huXdW92HKoH53PwZP66laYRaBlqh1QwB2dsY9bMBsOmBpMsxa+w7N3TSINj34lsrPAO9V5ZjBVdwYmiml/iiEft6WNeZCVvudEuFdNhDFpdjZxSE3dLJCiA6d/zdfbHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4AChsfAvIyp0KSiQVnCeNi/DLSWY404cvjnZS4eaT8=;
 b=d7OhczKfQsZti2gKGuzAb3rpLkcQaoTlCvjO/eXcJ369605R4f3WjVPfBRFZ5l6ieUfAplts9Ccwkn4ZahhjI9QOpStPWzyBjHQZJPyI9u2cM2Y/5zBd0jDsv30jZXJULEv95v0NXkCaDY6m1xNVyVeIS2ekNrfWt9x/L8Q0yGEpYR/IbkFbiE3CBn5CeT67OyDUEuZ400ng+2UiAaeyBJZ+BweJw6bryyFBGwfvEEqc1d5XPf4QUeMRImcBh8PnvWWzxpBAiQluaEow4Tmu4qT4yjZM9nCJogO5o0s3fJAMKjrCWWJfMBOa8ptBf0MA1yWojxsJ9KJv+OeHh7mYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4AChsfAvIyp0KSiQVnCeNi/DLSWY404cvjnZS4eaT8=;
 b=nk0tDOf8ywXV0lCeiyz1yzrVwU27YGByNXOvyaIt41CTIp6Ji33pFRDdI3BGw3pNA6BOMNXhMihm5+YKamZKISwX5P1X1HvA8WPuNVOUAkLp2e3TMj0PMwUjI8g1PjkU57zBW3AoWksk51V+Dy+nchYQ5uno3vdH1OZEXBTpDgu2QY2nLb6QrYnwi5SZIm759BXs043dARHoYXNpgX9WM8paABRMPwck8WSTnKcSWhmuImCf5yON5MqAVs/hW/2sWILgTMmwGe6C9zaiP6FMFDobLXu2xVI3VERBVz/qgYMla5jd/0ATU/azHz7akJYZDh8cooCFpoSvH/ByGCPdXg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] generic/altp2m: address violations of MISRA C Rule 2.1
Thread-Topic: [PATCH] generic/altp2m: address violations of MISRA C Rule 2.1
Thread-Index: AQHcyEeH3FAPJgz8C0q4McY6u5ZElbXXzxqAgHMEWQCAGq9yAA==
Date: Thu, 9 Jul 2026 10:00:10 +0000
Message-ID: <b0738b79-2a9f-4571-8465-bfb00123300f@epam.com>
References:
 <8b5ca213a097f7b221b06b6173e4621563779a73.1775752149.git.dmytro_prokopchuk1@epam.com>
 <3b2daddd-9afc-4c75-92c0-f7c6ace3f735@suse.com>
 <d6dcde3d-99eb-4fa3-9078-a13e35c8a1b4@epam.com>
In-Reply-To: <d6dcde3d-99eb-4fa3-9078-a13e35c8a1b4@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS2PR03MB9611:EE_
x-ms-office365-filtering-correlation-id: b88182cd-0ad7-4063-cd20-08dedda0dd3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|23010399003|11063799006|4143699003|56012099006|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 v2rSVTlfgPYym6YX5AIX0wY1abahiD+DIpRLqyEfdn0EFn+0tpmaykqdcfUsGRrXrDqq0Yk79MaXe7zPvJOeMf7B7KWYqeOPxm9TZRX3L8yePmuGkDDMDb0fPNkgM6rftvifoM+Vio5Owf6MmAuMazvlFi9Jv8bpHSmC4EcrlRu6L6SkUgagz07GzxdqO5/tkdviGswTM1XYgEdu7XbdHKDctF5rNX7CTJ73ZI4mjpdcfne37k+2BzF2fliOXEhk11k+YrIyT59Zngg6gmUR8KLS1ToNZkGWrQyoiSC2waETNo4c2XjXE3yY4fTgTYXaYjDSq4UF+mTTnMgS7bcga13MHDW04ktNgLawi6kRh6yhqiEHbB94kzUAMOXU+UdlAF1hzPJLHCEy0OraPiToESCOBXPveW3qbDW0ECdG3AG5ncPeXA8znCsGZh5cNEM4gmxuySKBOII4est4LewmyjPMiDDUiCcCoQflfc8ZyIlMPF+4ZK2f3xBpbJMjZFNAKBRM9p4yJfxi+rHFpn4ds9c84RkyMiuScfuoYm7fEQJocZaHbPpv2yDyMljDe1/qNx4WQwTzjIJiBamzlxqeUOdAP86jHSXPFrXXAqgSTzHajVKiB2BiFiKCpJ0NFPy+27G2ozXvMJYZoAuEjnyIQMZiWwAlUezrL8wJ5l/yPwaR0kdMsrjyp9DeoTL79+mfMRqpqWq2X1ssME0v+L+MWSYK2PuS6pctZP08+JNpw7s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(23010399003)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OURnL2l0eU9INDZKSVdxUXZVdi9SdHVuVzZrRHBwYTdGVEVaUmUwTkVaUDQw?=
 =?utf-8?B?TlU5RSt4NHdoT2plMytjdFlqYlhia0ozeTlJWWFndmhyZHVpNkdSUTNQczUx?=
 =?utf-8?B?VFZBblB4QmlRdURkZGVvZ1hmTGVFNGFVSDMyaDRyNkFuWmxQMmovNGM4TWl0?=
 =?utf-8?B?VFVBMEFvekdBMnAyKzBaeW56Mmd1MlhQK0J4RUpIWFBIU1RBZ2owdTgvbmRD?=
 =?utf-8?B?ZWpmVUlQZkJBWEdaUHd2MzYybkl1V1NUbmUwSHlqdXRod0pORzBLZE15UGRZ?=
 =?utf-8?B?U2c2T0pSZHBOdzY5Z3ZwRHJMRlRCeG9MZDRoMkNSWjVpQXlSTU4rQllSYlYw?=
 =?utf-8?B?b3pQK2s4Tm9ySkdGWTNoZys3UFQ3T2l5czJXN3R6d25tY3FjeTUxTkZuWWxn?=
 =?utf-8?B?TGRwTDJLeHNwZGVMUWJ4aVZxcGE3b1hVZGVQa3hjKzJaeVduVHh0clRkamRn?=
 =?utf-8?B?YlBZZGhnSHlyUUdaaCtmTkNUd0FoRXpiY2xSbnZqUXJhUHpZK0hlR29YZTcv?=
 =?utf-8?B?NHR6S3FKTlUxOVg1cHZtb3NzR3VaVFA3ZG9JTWFQWkRvU0pTTFA1YXlOTG9F?=
 =?utf-8?B?NHNkcG91dHZ2YTFXZnZ0RFVMdDZUVmtaanFuNXp0TkJaSVBYK0hnOWYyYUZY?=
 =?utf-8?B?bEVGTGhaNDNmdkRab3I5QnY5RFo4bms0VWg0RE53WUxZaEpFUUlrTWVOeXRp?=
 =?utf-8?B?QXJuekNWTkVoU2YwZmUweHpZdUkxVnkvc0p0S0VlYmFOUXlRdllOTEdEZEhj?=
 =?utf-8?B?TnlMT3IwQ29DQ3ZZOGxkNUowcTU1M0VEVVV2K2tkTmFiVkg4NzdtY2xNTERT?=
 =?utf-8?B?Sm03bG9YWjVlNUYrZFVhSEZuMHdUZ2hCQVlQM09IZ3NPcUVIejVqejFjWmlX?=
 =?utf-8?B?bVVyT0wrWHJPTFFPWVRPVktEUVNMYmpvZEpXMXN3NHQwSU9HRTdnUzZubFZk?=
 =?utf-8?B?OG5kMzc3RUVHcStxZWpuSWE3TWluZU5kSmtNZEhoOUVuazMvcThYdk9sRXdn?=
 =?utf-8?B?cWxvUXpzUXRJTm5IdDhjemlxQWYyR0NPb01udVIrUFpDU1A5aTQ3VVl6TE9I?=
 =?utf-8?B?UjRidGl5ZjdEeE5KUVh2Wjc5MUEwd0VrZFRlQUlTcmNTMDUzZmlCVkFyakNo?=
 =?utf-8?B?Q3Z3R3RMQWhITHVhQUFoZjJvcVl0dnVFdE9TemYyRHZRTVpwZ09VbnNyUWxW?=
 =?utf-8?B?dFRZUEFiNXZRNkorb1RFVUJrakxEQ1dTcEl2eHFnVytFWnVieDF2Qm5lZVpj?=
 =?utf-8?B?bUFWUWUwRHdKTmlxc2lxejNpSDVNWVBvbVd0Ni9qM1lNQTlBeE0zZDNlOEt1?=
 =?utf-8?B?elBFQS9lSHRPWkJvMXdaVld3UFJxVk5tamxnakFONlpzR3FxbjJTS0Y5ZVJr?=
 =?utf-8?B?ZEdlQUtPTFlVeFkvdlZva2Z1L3J4QnE1V3kzd2xkUENZYUhIRFB4ZU1wa1do?=
 =?utf-8?B?ek15WlhXdks2NG9jNUVFME1jdnc2c3k5VEZpUFRneXBJbFZXVnVsenRQT1Jw?=
 =?utf-8?B?SjVCMWhIMWJUWktTdmZJbjAxR2hqZGlxT083d0xoZWt0VEx6d2x4bE5LVGhw?=
 =?utf-8?B?UXRxNlRGRStIQ2Vsdlc1aDlEMVJWMHMzYWNXQUZ3MmNwdDdtSFB1bmdCYXBX?=
 =?utf-8?B?ckV0ajJHSGxjMXZ3UFlTNWc2em1BWFM0ejNFODgvc3JlWGJxTU10VmJJSkJa?=
 =?utf-8?B?QUFpZ0M2RTA5VldjcVkxOHVoait0dGlVTnhNakRLSS90SDZ6aWhDNnhqZ1Bo?=
 =?utf-8?B?YUgyL2hXbzNua1lRRVZNSXU1Wnh3QjhSVndYZ1RxVjdLZ1d3V1U2VTlqZUZF?=
 =?utf-8?B?NnlOUkNtTFFBMGVMV21DN3Q5am0xLzE5ckZLd01lSXBlQWwrcDQzK2s1UktT?=
 =?utf-8?B?bjluYTdzRU1nYzl4RG9DODgyV3QzK0pDRE5LTSs0c0d3anNVbVU4TDJVY3Z0?=
 =?utf-8?B?ZERCNTNYcFE4bHJPSENTTUVLU3VtM0J0NHlSenlnVlNzZGVSRmpOU2lNeFJq?=
 =?utf-8?B?MlMySVZuZGwrK3JvbkVBMVlCN0Z1bXNTdVEzNEpKbTh6dzhJYUk5cGJuVkZQ?=
 =?utf-8?B?Z0ZxR3R6TSt0NG9kT0Z2bTVmRDlrTDR3NWlGQXB6WkFVc29lZ0dVYUpHTWJP?=
 =?utf-8?B?ODg4ekNERkZMVGszcXArRFp1cG5LK3doSDYrK3pxRms2Y2hzRDdRcXhzVUhF?=
 =?utf-8?B?VW5KWThPdmU4aWlPVkFjWHJFdWF0WFlraDZyU0FXR0EzclpLcW1QbVd2NW03?=
 =?utf-8?B?VjFTUnA3MTFrbFBXY3gxYnppNWV4dS80SEhZK2k1QTl4U0ROMHlSbTVab2Ry?=
 =?utf-8?B?TjhGWHYxdloxYW5oNnJEUVFiblNkYnk4RDIrT08rcnAvelBQdUY2bTJUdEY5?=
 =?utf-8?Q?vIxt275DB7SwoqI0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F98DD68CAE9E7148A3F1D151B2A042B8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88182cd-0ad7-4063-cd20-08dedda0dd3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 10:00:10.9186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zTm7lKbbeo1LDtfW4IBjErFVphI+ZV97pwjrYkvrxm0C7qwD8chV/FxaRns2/YLj3jHSHQctjYCHOwNMnAFnRNeSMHLFiQdfWSaQpgr05Bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9611
X-purgate-ID: tlsNG-c1860d/1783591213-48E6E3FC-2DAC3F37/0/0
X-purgate-type: clean
X-purgate-size: 3602
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[lists.xenproject.org:query timed out];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:from_mime,epam.com:dkim,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2614972F3FB

DQoNCk9uIDYvMjIvMjYgMTM6MjksIERteXRybyBQcm9rb3BjaHVrIHdyb3RlOg0KPiBIZWxsbywg
SmFuDQo+IA0KPiBPbiA0LzEwLzI2IDA5OjA0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDA5
LjA0LjIwMjYgMTk6MzcsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+PiBNSVNSQSBDIFJ1
bGUgMi4xIHN0YXRlczogIkEgcHJvamVjdCBzaGFsbCBub3QgY29udGFpbiB1bnJlYWNoYWJsZSBj
b2RlIi4NCj4+Pg0KPj4+IEluIGNlcnRhaW4gYnVpbGQgY29uZmlndXJhdGlvbnMsDQo+Pg0KPj4g
Q2FuIHlvdSBnaXZlIGFuIGV4YW1wbGUgd2hlcmUgLi4uDQo+IElmIENPTkZJR19WTV9FVkVOVCBp
cyBlbmFibGVkIG9uIEFSTS4NCj4+DQo+Pj4gdGhlIGZ1bmN0aW9uICdhbHRwMm1fdmNwdV9pZHgo
KScgaXMgZGVmaW5lZA0KPj4+IGFzIGFuIGlubGluZSBmdW5jdGlvbiB0aGF0IGNvbnRhaW5zIHRo
ZSAnQlVHKCknIG1hY3JvLiBUaGlzIHJlc3VsdGVkIA0KPj4+IGluIGENCj4+PiB2aW9sYXRpb24g
YmVjYXVzZSB0aGUgJ0JVRygpJyBtYWNybyBtYWtlcyB0aGUgZnVuY3Rpb24gbm9uLXJldHVybmlu
Zy4NCj4+Pg0KPj4+IFRvIGVuc3VyZSBjb21wbGlhbmNlIHdpdGggTUlTUkEgQyBSdWxlIDIuMSwg
dGhpcyBwYXRjaCByZW1vdmVzIHRoZSANCj4+PiBpbmxpbmUNCj4+PiBmdW5jdGlvbiBpbXBsZW1l
bnRhdGlvbiBhbmQgaXRzIEJVRygpLWJhc2VkIHVucmVhY2hhYmxlIGNvZGUuIEl0IGlzIA0KPj4+
IHJlcGxhY2VkDQo+Pj4gd2l0aCBhbiB1bmNvbmRpdGlvbmFsIGZ1bmN0aW9uIGRlY2xhcmF0aW9u
IGZvciAnYWx0cDJtX3ZjcHVfaWR4KCknLg0KPj4NCj4+IC4uLiBhIGRlY2xhcmF0aW9uIGlzIG5l
ZWRlZD8gVGhlIHNvbGUgbm9uLXg4NiByZWZlcmVuY2UgSSBzZWUgaXMgZnJvbQ0KPiBZZXMsIGRl
Y2xhcmF0aW9uIGlzIG5lZWRlZC4gVGhlIGZpbGUgJ2NvbW1vbi9tb25pdG9yLmMnIGNvbnRhaW5z
IGEgdXNhZ2UgDQo+IG9mIHRoZSAnYWx0cDJtX3ZjcHVfaWR4KCknIGFuZCBjb21waWxlciBtdXN0
IHNlZSBpdCB0byBhdm9pZCAiZXJyb3I6IA0KPiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5j
dGlvbiDigJhhbHRwMm1fdmNwdV9pZHjigJkiLg0KPj4gY29tbW9uL21vbml0b3IuYywgYW5kIHRo
ZSBzb2xlIHJlbGV2YW50IEtjb25maWcgb3B0aW9uIEkgY2FuIHNwb3QgaXMNCj4+IFZNX0VWRU5U
LiBXaGVuIHRoYXQncyBvZmYsIHRoZSBmaWxlIHdvbid0IGJlIGJ1aWx0IGF0IGFsbC4NCj4gQnV0
IHdoZW4gJ0NPTkZJR19WTV9FVkVOVD15JyB0aGlzIGZpbGUgaXMgY29tcGlsZWQgb24gQVJNLg0K
Pj4NCj4+IEZ1cnRoZXIsIEJVRygpIGFuZCBhIGZldyBtb3JlIGNvbnN0cnVjdHMgaGF2ZSBhIGRl
ZGljYXRlZCBkZXZpYXRpb24NCj4+IGFscmVhZHkgaW4gcGxhY2UuIEkgZG9uJ3QgbWluZCBhIHVz
ZWxlc3MgZnVuY3Rpb24gdG8gYmUgc2hydW5rIChvciwgYXMNCj4+IHBlciBhYm92ZSwgcGVyaGFw
cyBldmVuIGRyb3BwZWQpLCBidXQgdGhlIGp1c3RpZmljYXRpb24gdGhlbiBuZWVkcyB0bw0KPj4g
YmUgZGlmZmVyZW50Lg0KPiBXZWxsLCB3aXRoIFN0ZWZhbm8ncyBjb21tZW50IHJlZ2FyZGluZyBy
ZXR1cm4gdHlwZSwgdGhlIGNvbW1pdCBzdWJqZWN0IA0KPiBhbmQgbWVzc2FnZSBjb3VsZCBiZSBy
ZXdyaXR0ZW4gbGlrZToNCj4gDQo+IGdlbmVyaWMvYWx0cDJtOiBhbGlnbiBhbmQgc2ltcGxpZnkg
YWx0cDJtX3ZjcHVfaWR4KCkNCj4gDQo+IFRoZSByZXR1cm4gdHlwZSBvZiAnYWx0cDJtX3ZjcHVf
aWR4KCknIGluIHRoZSBnZW5lcmljIGFsdHAybS5oIGhlYWRlciBpcw0KPiBjdXJyZW50bHkgJ3Vu
c2lnbmVkIGludCcsIHdoaWNoIGlzIGluY29uc2lzdGVudCB3aXRoIGl0cyAndWludDE2X3QnDQo+
IHJldHVybiB0eXBlIG9uIHg4NiBhbmQgdGhlICdhbHRwMm1faWR4JyBtZW1iZXIgb2YgdGhlIG1v
bml0b3Igc3RydWN0dXJlcy4NCj4gDQo+IFRvIGZpeCB0aGlzIHR5cGUgaW5jb25zaXN0ZW5jeSBh
bmQgc2ltcGxpZnkgdGhlIGhlYWRlciwgdGhpcyBwYXRjaA0KPiByZXBsYWNlcyB0aGUgc3RhdGlj
IGlubGluZSBpbXBsZW1lbnRhdGlvbiBvZiANCj4gJ2FsdHAybV92Y3B1X2lkeCgpJyAoY29udGFp
bmVkIGEgQlVHKCkgc3R1Yikgd2l0aCBhIHNpbXBsZSBmdW5jdGlvbiANCj4gZGVjbGFyYXRpb24g
cmV0dXJuaW5nDQo+IHVpbnQxNl90Lg0KPiANCj4gRm9yIGFyY2hpdGVjdHVyZXMgdXNpbmcgdGhl
IGdlbmVyaWMgYWx0cDJtLmggaGVhZGVyIChzdWNoIGFzIEFSTSB3aGVuDQo+IENPTkZJR19WTV9F
VkVOVCBpcyBlbmFibGVkKSwgY29tbW9uIGNvZGUgY2FsbHMgdG8gJ2FsdHAybV92Y3B1X2lkeCgp
JyBpbiANCj4gY29tbW9uL21vbml0b3IuYyBhcmUgZ3VhcmRlZCBieSAnYWx0cDJtX2FjdGl2ZSgp
Jywgd2hpY2gNCj4gc3RhdGljYWxseSByZXR1cm5zICdmYWxzZScuIFRoZSBjb21waWxlcidzIERD
RSB3aWxsIG9wdGltaXplIG91dCB0aGVzZSANCj4gY2FsbHMsIGF2b2lkaW5nIGFueSBsaW5rZXIg
aXNzdWVzIGZvciB0aGUgbWlzc2luZyBkZWZpbml0aW9uLg0KPiANCj4+DQo+PiBKYW4NCj4gDQo+
IEJSLCBEbXl0cm8uDQoNCkhlbGxvIEphbiwNCg0Ka2luZCByZW1pbmRlci4gUGxlYXNlLCB0YWtl
IGEgbG9vay4=

