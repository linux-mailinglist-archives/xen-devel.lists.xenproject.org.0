Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aCrTJxRkLGpqQQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 21:55:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66B767C353
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 21:54:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=AniQ6YFe;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1337008.1598675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY7wu-0003xd-Ay; Fri, 12 Jun 2026 19:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337008.1598675; Fri, 12 Jun 2026 19:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY7wu-0003vK-83; Fri, 12 Jun 2026 19:53:52 +0000
Received: by outflank-mailman (input) for mailman id 1337008;
 Fri, 12 Jun 2026 19:53:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wY7wr-0003vE-El
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 19:53:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY7wq-00ERlC-09
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 21:53:48 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2c63a3-2eae-0a2a0a5409dd-0a2a450ab794-16
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 21:53:47 +0200
Received: from [52.101.229.104]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2c63c8-56b3-0a2a450a0019-3465e5688e3f-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 21:53:46 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYRP286MB5249.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:115::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 19:53:40 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 19:53:39 +0000
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
 b=q/1G+triCT8JkXqnC5MpZeBluuQGZTvlKIxpCqbXuvgQzHCIJeanQZfzvBVsa5+GoVHxG5iBlT52nufGQa+p3SAvYngSvMiEfdPUC4Tfwza+JRy//h4CgdvHBthq5jmeZk9ODmW+dWi/QIWM0ePy2JholVjj9f8FycADqbvghuaIyenuUlmfLRgotB+ZQuJAA7voM63T2SyMCLfutHuS21F4cvA9rYO54HOUK0EJ8X1Grsu6Zj+CpKK1RKXAcHI4Ex5iO06g/LS1AE2tnxXR5vkPJ0TRT/IveKlUBOvb1mavzVdwAPKDudU5NshMuBk7kYhYdObB9AogSZbc2tQviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAwUhyzwlywENjHgFMhMKyoKocmktssWzq8DspHt9hM=;
 b=co3hEnH5HmbD8Os05Vnh8zjC6ai1nKD/+TmrZ5JqSKMRDZH8zxSS/Y/movZYw9RcLi0m7OpD8CulrbjFsJtlPGqQwA4XjRwzvKxK2y1N4Isd0nrjQ+5LkUfmekU23DTB0FiFMXLPqckU5JbKJXoz0Xd1p+urQgkJ4pxv0JnZTfMKaLyjCSmtJR2tIVnBXkiMkscy6lCjECDriPcoCtF1An6W2e2DmkCq0S3TL4Df4t1KYgcmcZ/QBSKmiRksoTE/S3kPjZa5s9beXqll4k7/ulLlYibi9ydi0ZU82YS4n15hkkL5SwtQ7vgatOXnHOHsg7SIjpfb1Qs53mJWhtPx5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAwUhyzwlywENjHgFMhMKyoKocmktssWzq8DspHt9hM=;
 b=AniQ6YFertmqJ+TRT5CjSyUjVMRu/53hSzXzqq1AIZEYRMUVcStvUGl/UucKFDIC/oj7n679FUJQoXDOqzRmAl7HUPQv7rVN7XpopviEOJ9b7WUygzjG9lSykPRksG0bVz58XHVlKyKyxU+yfJnUhDcgHYejW9/XQLOdgy/Z9y4=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 2/3] xen/sched: Link CPU topology to scheduler
Thread-Topic: [PATCH 2/3] xen/sched: Link CPU topology to scheduler
Thread-Index: AQHc+Mopz/Cks6fKlk2NBrgno/uZs7Y5ZxkAgAHeKMA=
Date: Fri, 12 Jun 2026 19:53:39 +0000
Message-ID:
 <OS9P286MB72224A75554691CDC5F82D0E82182@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260610111320.133784-1-taka@valinux.co.jp>
 <20260610111320.133784-3-taka@valinux.co.jp>
 <4ad6cce2-c15d-4614-9d73-5ed1354047b8@suse.com>
In-Reply-To: <4ad6cce2-c15d-4614-9d73-5ed1354047b8@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYRP286MB5249:EE_
x-ms-office365-filtering-correlation-id: 6031fdd8-8841-465d-3d28-08dec8bc4c96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|38070700021|4143699003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info:
 soBGs/xmcgkBrK9dtnFm66OEk/QiYc1XoG0bB/LL1a1aI+RRBSLwXJ4ToowKkm+5XrkBX+RG391FkAxXRmsVee7+OYQIGdCeItQEqdPzoqR88e4eJ/THBCqayFxmwMH5Le2UB7UoK7C/911y9IKMZJpWAruzYQDBlVIb7QJVHECERGnRK+Q5hQA40jfXanz/FhW314cdv4Ig3doRU8xqSPPSFdeGSwElEOJgEv3w3IznsURYRVlg/K22PeDlucY8kVHxhq/J61Vgq99bbDZIzzKIKJOcYOHWEUzK04PU+vShV8/QLU3qhA9nwYvRIp8KlDCjHbkpuiMKEbWiQHD4+zFVl6XK0P5i8Sy4weOy22ZFQ05CxSfeV31VNtStSsCFmoI6Wn/l1WpWE76dqS38ZUpfEYPcz91TEoMkI6Ra5Ft8/bzHeIr90czd46sLCRfW8zJ60NEel+2SSzucGfiIek71z1ablJRxiTvUh0FzM01ZpAk/FPE5N1TaPOGvoJgVLLJzEQLOO0ZXI+STFULMKub1veRLyKQRudboWu2v9hH8zmPhax6dGMa5qsORXGqGwVNgBsM2EeqC8kR2wFJkW5XmK59in1RK3EqcZgvbvXGhegaDmtkU8jkE44o9iXCha3x0aon2qEUYiH3NLeoVez1dcQUUBC9V+elACiMN/xU+9hJM5r4QasxfRW99FV2g7nekBh+zNceUDC0u8h6SBX59cfYvtPfmz+zuyanc8PLb4eYimxQYm15SWKeB+Qju
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(38070700021)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MUYyaWxpOXNDSUtxK25wU0V4WDk4ck1Kckhhd05MckRNeTZWRXlGa1YxZnVT?=
 =?utf-8?B?YzgwT1YrRHhvbUVQbmI2SklNQnhwbmQwczNmeEp1dlFJYTNiZnVRT2EwdVA1?=
 =?utf-8?B?YTBiWmI3Y1B1RkM3d3pvaTBiaHRhZVpSaldkRDhlRndoV1YvN2tHY3ZMUnpM?=
 =?utf-8?B?cVA2a2g5MjNtaGIzVGpPdHkrSDNOU0l6VERxSkV5blhNbyt6UUkzVHluUjFn?=
 =?utf-8?B?OEVSRkRxU3pXSDRlc01vN0JBblZaV1pRcVRmZlNwOThWOFJaTHJHRjV6Q2NI?=
 =?utf-8?B?dEhJcHRRdmNPL3NxMngydS8wTDBZMExybnpVSVBFZDAyQnU5Uk5UTTRyWU1k?=
 =?utf-8?B?OXlZNDVEdFd6bjdISnNFR1JldzBxZUcvVERKZGNXWkQwZHdwZ0F0elJMNTBU?=
 =?utf-8?B?Y3htd0NjZFU4NkEva2V0M0NuUFBOVkE0bi8ya2NZNzA4WmRLcEFxRzlsWHMw?=
 =?utf-8?B?aTR4d1JLYUV6TG8wamMyMmViSmFPK3hPVG5zSFRSSnB5TVNCZ3BQdUNpbnhW?=
 =?utf-8?B?L052dlJnL01OYlVYaU5OWGNmaDdwRFhDbldhUjlSekZpNmRqUHBWTlJuaFVM?=
 =?utf-8?B?VDIwWmQ4ZzBROVI2cEYweEhIV3BLZzBRQzFVK0h3VE1kQ29HdG4yRTgrVEMy?=
 =?utf-8?B?TG1PQmVqaUdZTmlMdEpLVUdCTXJOU2VZVjdVeWE1Q01nSkk1UUJlZ3RBaWgr?=
 =?utf-8?B?TVZQMXNld09DbFNuMWhGdXRUODlJSFp5US9kMWJmS1pGeEdNSWsxVmREdFlw?=
 =?utf-8?B?YmIyRyt0VnZKN2pPL3dLSTYwOFNCc2RML2NaaVlIZE5waGtSaGhsZHVXRkVr?=
 =?utf-8?B?eStyWGVhUFRiSmRxOGZIcDhzbEdkSFR1Y2c3bWRMcDZqSFZ2UEJWZEVqeXdr?=
 =?utf-8?B?OGVjNncxT2hyUXI5OXNyb0FZZ0FpWmh3OTZKSURhN21HRWZFb3ZBdnlCSVRl?=
 =?utf-8?B?S0QvdlJpLy9YdWF1L1VvcnhJUFpFM3BWaHBUc0E0d2d3KzJQUk5RSXVVYWFY?=
 =?utf-8?B?a1JJV2J0eW9pUHdYcXJPTlZmdDI4UWJoNkt1ZE9jYTd5NTMyWTlaaGFJaEJM?=
 =?utf-8?B?dWVvZHBQMW9RTXhHR1QwZForV2cwdjE5SEU0d0xtMjhnRXpmUEFIeUdSR0hx?=
 =?utf-8?B?eE04cmozMUpUbVBGa2VGR2k3RDFFVUREaUFrNVlEb1BzSVZvemJtTXBnSVFw?=
 =?utf-8?B?WlFHN0pydDdmbDBOVTdrOXdvY2FUcFRDNm1PUzFTSzdsbEExQURJVFVNZlpl?=
 =?utf-8?B?WitQRm5CUFBwOG9vQStSY240MU03NGIvblB1bnRxTDR1QVpLVUI1d1BSbk9G?=
 =?utf-8?B?RnBwSEplVUttMEZDV3JLUFo0RjZuL0dOU2tTL0xTL0gyTy91VTIxY2IyZWh4?=
 =?utf-8?B?d1ozWmJLYk5JaHFacGgrMmZCRUFjTFhsUXk2WERTaXdBRlU5MDBBS2hmbmFD?=
 =?utf-8?B?bGhGUS9WNzlQWUozS0x4UGVLNEk5MFo1QTh2OS83SlNFcHE1MDNqNmtNQU1m?=
 =?utf-8?B?MldrcGxNa0ZBNnR0Z3dkcXExSnV3UnFvbWNTck5yek1TM0RNbSt2Mm5nWDdh?=
 =?utf-8?B?ZzllbFUwTEYyemtLVlV2ZzRBL242UmZWaFF1a2F5ZDYyV0plalFMcFRjbC93?=
 =?utf-8?B?VkdsWkpoblhXbFRaMEV2UjhnRy8wZXk1OTZJbVc1UzJENjNaNEFXdmRjNnpi?=
 =?utf-8?B?U0ljd0NiVVRwdmxiZWJtaC80dW11OUxtcXhpS2RlcmhKWkhHbW9JVTQxQ0Z2?=
 =?utf-8?B?RTd4ZVNvRVNwbDJBSE9KS2NyOUYxWlpNS1kwdEc4cEgxdkV6MXYrb0pGMmpE?=
 =?utf-8?B?a0dGZHhvMWNKdUducXR0WExTUzZWY2E2eDFtME5vUFFLTzJoNGpaeVpnM3Ar?=
 =?utf-8?B?c2dmUUhKWFNRdFhRWWZEOG5pa2ZTT01XeHg1TUNaeGNSVWwrR2hvWUJZZnp1?=
 =?utf-8?B?RkJSQUo5RmR6aklrQnUxMFBHYU1ZSmg5QXJieTAvZzZIaS9Cd01MVUliTVg1?=
 =?utf-8?B?aDVKTEVCQVpHWHQxejhmT0xuYjVzL1VtVnJXdUQrb0dHVisrZTRRKzIxSHEx?=
 =?utf-8?B?d2gxZ0MyUlNSbzdLdnRMTXduaWpLNnFEa2xOc3lBdGUxT01UUjgyNlU1T2py?=
 =?utf-8?B?V1NkUXJQWHY0VU9DUlYyT3BWMmN1Qk5MS2pRMmJVRDJCRzIyNVhUL0xWaXhR?=
 =?utf-8?B?Ykl0TXRaRzZjanhsanRRT3BhOE1Sc1BwalRYR013MW45a3JhdG0xUVBWRlAy?=
 =?utf-8?B?dENZNlpoVmVFd05Cd3o0Sjh3cEdlTUNHeDg3azNESlRMbWpzaWtmQlNrTEsx?=
 =?utf-8?Q?XYY/73kfSMrvg9TZLp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6031fdd8-8841-465d-3d28-08dec8bc4c96
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 19:53:39.7164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVwNwqf1dMNGxOsdzMbv4cF+AL/OljdRyRMUnX5irR7u51e09SFJaR/5WcMlcR2S1YY+o6qKNuTzb/B6qSrJpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5249
X-purgate-ID: tlsNG-4011c0/1781294027-7F1948B7-4E9E8D0D/0/0
X-purgate-type: clean
X-purgate-size: 4566
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E66B767C353

SGVsbG8sDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIHhlbi9zY2hlZDogTGluayBDUFUg
dG9wb2xvZ3kgdG8gc2NoZWR1bGVyDQo+IA0KPiBPbiAxMC4wNi4yMDI2IDEzOjEzLCBIaXJva2F6
dSBUYWthaGFzaGkgd3JvdGU6DQo+ID4gTWFrZSBDUFUgdG9wb2xvZ3kgaW5mb3JtYXRpb24gYXZh
aWxhYmxlIHRvIHRoZSBYZW4gc2NoZWR1bGVyLg0KPiA+IEFkZGl0aW9uYWxseSwgZW5zdXJlIHRo
YXQgdGhpcyB0b3BvbG9neSBpbmZvcm1hdGlvbiBpcyBkaXNwbGF5ZWQNCj4gPiB3aGVuIGV4ZWN1
dGluZyB0aGUgJ3hsIGluZm8gLW4nIGNvbW1hbmQuDQo+IA0KPiBCb3RoIGluIHRpdGxlIGFuZCBk
ZXNjcmlwdGlvbiB5b3UncmUgcHJldHR5IGdlbmVyaWMsIHlldCB0aGVuIC4uLg0KPiANCj4gPiAg
eGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICB8ICA0IC0tLQ0KPiA+ICB4ZW4v
YXJjaC9hcm0vc21wYm9vdC5jICAgICAgICAgICAgICAgIHwgMTAgKysrKy0tDQo+ID4gIHhlbi9j
b21tb24vZGV2aWNlLXRyZWUvY3B1LXRvcG9sb2d5LmMgfCA1MQ0KPiArKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4gPiAgeGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMgICAgICAgICAgICB8
ICAzICsrDQo+ID4gIHhlbi9jb21tb24vc3lzY3RsLmMgICAgICAgICAgICAgICAgICAgfCAgMSAr
DQo+ID4gIHhlbi9pbmNsdWRlL3hlbi9jcHUtdG9wb2xvZ3kuaCAgICAgICAgfCAxMCArKysrKysN
Cj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0K
PiANCj4gLi4uIG9ubHkgdGhlIGNyZWRpdDIgc2NoZWR1bGVyIGlzIGFjdHVhbGx5IGVuYWJsZWQu
DQoNCldoaWxlIGl0IGlzIHRydWUgdGhhdCB0aGlzIHBhdGNoIGlzIGZvY3VzZWQgb24gQ3JlZGl0
MiwgdGhlIENQVSB0b3BvbG9neQ0KaW5mb3JtYXRpb24gaXMgYWxzbyByZWZsZWN0ZWQgaW4gYGNw
dV9zaWJsaW5nX21hc2tgIGFuZCBgY3B1X2NvcmVfbWFza2AuDQpUaGVzZSBtYXNrcyBhcmUgZ2xv
YmFsbHkgcG9wdWxhdGVkIGFuZCBhcmUgYWxyZWFkeSByZWZlcmVuY2VkIGJ5IG90aGVyDQpzY2hl
ZHVsZXJzJyBjb2RlIGFzIHdlbGwuDQoNCj4gPiAtLS0gYS94ZW4vY29tbW9uL2RldmljZS10cmVl
L2NwdS10b3BvbG9neS5jDQo+ID4gKysrIGIveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9jcHUtdG9w
b2xvZ3kuYw0KPiA+IEBAIC0zMjUsNiArMzI1LDU1IEBAIGludCBfX2luaXQgcGFyc2VfZHRfdG9w
b2xvZ3kodm9pZCkNCj4gPiAgICAgIHJldHVybiBwYXJzZV9zb2NrZXQobWFwKTsNCj4gPiAgfQ0K
PiA+DQo+ID4gK3N0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9jcHVfdG9wb2xvZ3lfaWRzKHZvaWQp
DQo+ID4gK3sNCj4gPiArICAgIHVuc2lnbmVkIGludCBjcHU7DQo+ID4gKyAgICB1bnNpZ25lZCBp
bnQgbmV4dF9jb3JlX2lkID0gMFU7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgbmV4dF9jbHVzdGVy
X2lkID0gMFU7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgbmV4dF9zb2NrZXRfaWQgPSAwVTsNCj4g
PiArDQo+ID4gKyAgICBmb3JfZWFjaF9wb3NzaWJsZV9jcHUoIGNwdSApDQo+IA0KPiBOaXQgKHN0
eWxlKTogRWl0aGVyIHlvdSBkZWVtIGZvcl9lYWNoX3Bvc3NpYmxlX2NwdSBhIChwc2V1ZG8tKWtl
eXdvcmQNCj4gKHRoZW4gdGhlcmUncyBhIGJsYW5rIG1pc3NpbmcpIG9yIHlvdSBkb24ndCAodGhl
biB0aGVyZSBhcmUgZXhjZXNzDQo+IGJsYW5rcykuDQoNCk9rYXksIEkgd2lsbCBmaXggdGhlbS4N
Cg0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIHVuc2lnbmVkIGludCBmaXJzdF9jcHU7DQo+ID4g
KyAgICAgICAgc3RydWN0IGNwdV90b3BvbG9neSAqdG9wbyA9ICZjcHVfdG9wb2xvZ3lbY3B1XTsN
Cj4gPiArDQo+ID4gKyAgICAgICAgZmlyc3RfY3B1ID0gY3B1bWFza19maXJzdCgmdG9wby0+dGhy
ZWFkX3NpYmxpbmcpOw0KPiA+ICsgICAgICAgIGlmICggZmlyc3RfY3B1ID09IGNwdSApDQo+ID4g
KyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICB0b3BvLT5waHlzX2NvcmVfaWQgPSBuZXh0X2Nv
cmVfaWQ7DQo+ID4gKyAgICAgICAgICAgIG5leHRfY29yZV9pZCsrOw0KPiA+ICsgICAgICAgIH0N
Cj4gPiArICAgICAgICBlbHNlDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICB0b3Bv
LT5waHlzX2NvcmVfaWQgPSBjcHVfdG9wb2xvZ3lbZmlyc3RfY3B1XS5waHlzX2NvcmVfaWQ7DQo+
ID4gKyAgICAgICAgfQ0KPiANCj4gTml0LCBoZXJlIGFuZCBiZWxvdzogUGxlYXNlIG9taXQgdW5u
ZWNlc3NhcnkgZmlndXJlIGJyYWNlcy4NCg0KT2theSwgSSB3aWxsIHJlbW92ZSB0aGVtLg0KDQo+
ID4gQEAgLTMzOSw0ICszODgsNiBAQCB2b2lkIF9faW5pdCBkdF9pbml0X2NwdV90b3BvbG9neSh2
b2lkKQ0KPiA+DQo+ID4gICAgICBmb3JfZWFjaF9wb3NzaWJsZV9jcHUoIGNwdSApDQo+ID4gICAg
ICAgICAgc2V0dXBfc2libGluZ3NfbWFza3MoY3B1KTsNCj4gQXMgdG8gdGhlIGVhcmxpZXIgcmVt
YXJrOiBCYWQgcHJlLWV4aXN0aW5nIGV4YW1wbGVzIGRvbid0IGNvdW50Lg0KDQpPa2F5Lg0KDQo+
ID4gQEAgLTE5LDExICsyMywxNyBAQCBleHRlcm4gc3RydWN0IGNwdV90b3BvbG9neSAqY3B1X3Rv
cG9sb2d5Ow0KPiA+ICB2b2lkIG1hcF9jcHVpZF90b19ub2RlKHVuc2lnbmVkIGludCBjcHVpZCwg
c3RydWN0IGR0X2RldmljZV9ub2RlDQo+ICpjcHVfbm9kZSk7DQo+ID4gIHZvaWQgZHRfaW5pdF9j
cHVfdG9wb2xvZ3kodm9pZCk7DQo+ID4NCj4gPiArI2RlZmluZSBjcHVfdG9fY29yZShfY3B1KSAg
IChjcHVfdG9wb2xvZ3lbX2NwdV0ucGh5c19jb3JlX2lkKQ0KPiA+ICsjZGVmaW5lIGNwdV90b19z
b2NrZXQoX2NwdSkgICAoY3B1X3RvcG9sb2d5W19jcHVdLnBoeXNfc29ja2V0X2lkKQ0KPiANCj4g
UGxlYXNlIGNhbiB5b3UgYXZvaWQgaW50cm9kdWNpbmcgbmV3IG5hbWUgc3BhY2UgdmlvbGF0aW9u
cyAoaWRlbnRpZmllcnMNCj4gd2l0aCBsZWFkaW5nIHVuZGVyc2NvcmVzIHNob3VsZCBuYW1lIGZp
bGUgc2NvcGUgZW50aXRpZXMpOyBhbHNvIGFnYWluDQo+IGJlbG93Lg0KDQpPaywgSSB3aWxsIHJl
bW92ZSB0aGUgbGVhZGluZyB1bmRlcnNjb3JlcyBmcm9tIHRoZSBtYWNybywgd2hpY2ggd2VyZQ0K
b3JpZ2luYWxseSBkZWZpbmVkIGluIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aC4NCklzIGl0IG9rYXkgdG8gbGVhdmUgdGhlIG1hY3JvIGRlZmluaXRpb25zIGluIHg4NidzIA0K
YHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaGAgdW50b3VjaGVkPw0KDQpUaGFu
ayB5b3UsDQpIaXJva2F6dSBUYWthaGFzaGkuDQo=

