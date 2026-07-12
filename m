Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MbvQNiifU2qkcQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 16:05:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BED9744ED8
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 16:05:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=c5eFi0IE;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361068.1613567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiunZ-00017n-T4; Sun, 12 Jul 2026 14:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361068.1613567; Sun, 12 Jul 2026 14:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiunZ-00014J-Oh; Sun, 12 Jul 2026 14:04:49 +0000
Received: by outflank-mailman (input) for mailman id 1361068;
 Sun, 12 Jul 2026 14:04:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wiunX-00011o-Kj
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 14:04:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiunX-004b44-07
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 16:04:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a539eb8-e002-0a2a0a5209dd-0a2a4506b1e8-38
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 16:04:46 +0200
Received: from [52.101.83.95]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a539efe-0835-0a2a45060019-3465535f2cc0-4
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 16:04:46 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS2PR03MB9540.eurprd03.prod.outlook.com (2603:10a6:20b:597::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Sun, 12 Jul
 2026 14:04:45 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.019; Sun, 12 Jul 2026
 14:04:44 +0000
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
 b=wZqb2QjNkYYs8YImGebgSvADWlIoN+xi/REvKo9fwqPa0blpX6wGjq4VJ7jc91VzJraANOBrtwrrwrjAMrCb4LH4nC1R/eqyc8rNJe0X/8flUPC5T2kpEMWxCBbZ3/th0V80VAbrzFUkP1rnHe/Rna6cj2iSFy5uruTSk6605lxDjV/Sxbh7tHWTJczTFlvCV7D9fEcLfkQUF8QXukTbo5Fu1aH+06o6+7DHhHqvl/Bnn8gnT3EQYLvn1Feju2376UMXD7DlJzEkXePxBgpEs4ddz9iIz9wpaIQRWb+T74K8sSRpeMMogTNc9Um3n+YQydiXVgkYV391P2EtS4H36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aikdj9hX9Ez/J0T4upRKLp62iT8tY2+jkV0GfNhHj3w=;
 b=PyPyy/DD7FaayYdCDyyjnCdItWAVNM/LCyyr2WM5VEQBbNNF6hK/D9gIyqqEpeX+7XmumtDPph9TcFC2aaUH37reVVpbgLbRESUWi24bLGgUVV4AEaGzuC/pHYrhGw1jNVS3m+BpNOClqCdSVo9UAB+j3GV+Zb9rS0fzpFbRTb0xoqYf8w5OaEu7T5AFRUW49q3OV791BKwB2naMal5b/jsYx76wbfo2ao0sJ/zaO4Dvlb4MUdEJYNkMQo1EVI4IyV4U/t/T/2jFnuUfF8DALEwJgSJQM0e07CMT14f2xcj/awFmHdtZDGp21yo0Fu/Rdf62WWNWIkZr7RR+7PvZSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aikdj9hX9Ez/J0T4upRKLp62iT8tY2+jkV0GfNhHj3w=;
 b=c5eFi0IE+V5FXJsSsdkxmWqwXBKps3dUM0j+UVcl0ac1InnDP1yUE4tn/qt6V3rx/SYZl6RNzTE/p0FMZm2/vJm8cFJGvgALeaM4V2UUIL2/PDXRI/Ouf+bhbfqYA2hvpVHAXzZQM+2Q/EQ6yct4bixGDT0k6WxE8k939pQL79nNoZwx1UdgZtQtON5aYuur2w3MyV0AJ+1UBzcMAQVMuQQeEEkil9Rpo6Du4+eWmL9mecJGv+JMOBpsUho6nmc3qCZ7ZunFoZenexND+W6ZYWEn/VHAQTLXAqfuNbhnPBvcZgIBG370DBGipoe5HL+x6+PuWIhy3xxIuxwEbY46+A==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 1/3] misra: deviate MISRA C Rule 5.5 for
 'hypfs_alloc_dyndata()'
Thread-Topic: [PATCH v2 1/3] misra: deviate MISRA C Rule 5.5 for
 'hypfs_alloc_dyndata()'
Thread-Index: AQHdEgdk86c5ivEPyUWTFvlIOTPRVw==
Date: Sun, 12 Jul 2026 14:04:44 +0000
Message-ID:
 <365f750cfbc626e763819da2604bfccab2ac80f8.1783864426.git.dmytro_prokopchuk1@epam.com>
References: <cover.1783864426.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1783864426.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS2PR03MB9540:EE_
x-ms-office365-filtering-correlation-id: 5732a9ca-9ca0-4a2a-143a-08dee01e86df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|42112799006|23010399003|1800799024|38070700021|6133799003|56012099006|11063799006|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 XQ+Kevlc3CthY0HZqBZ15qpJ5w/9eovsMr/6KXwnZF3UnPzb8FlgMttgm1LT+SkrE9NhsTpA/iNYlsEgjezwZMy+klFmMcRZWszYyGOc9fnK1gcKxEwxzKArfUWviYEBOZGrDV8sKmeHZYWds3Y7wIhzbv4hc3dY4cQin/Rix26uKedLOnUrpGOGFDsNNYqFakPlZsgGnghw31XxalQOUGNovdykwJfP4TyD59LonHbqHJqswqgEOUyqMwIijgm0ly99Xw1Baln+mpc1//1lmiVaXJcchHUnp+wkYlptYyhCqFOXIEeD5lh+Bno3Z07ABG9L0m/06yc6zdeZ8jFKDXoxtIi6mLzLqOswb4c4QyIoeDQLSyCVrAuHs/HjvMf3yXv61hHKvvOlza6j+bv43iXuCKyQbJBClzE3WyqLxzIowIUVJuyiUy/Pgq49MmCsL7OdyRvZIoaeEatbgXEtYJ+AncfVwn7M4CbhtGE4wYDf+MQ15ciKNRK0sjaktoSfGWd4tU1TVNlGNvUdsr9O5jJTZr50i8ZjT5vhDpgWWnTgJd1OvX892BMAiEikkSubqQvHgUi8O7yTn1nzmkPVI3orXJs2IpVoCkr7p8zXmeWNYiLjf0sHHI7rsloQS5TZZ2gNoxnERdrmjVcqkWhNmN5Re9RyX447PpkTxX8wFbDjdX1z6QgBywifg0wDtpO1m70lq4Usg/jz7rl/4WU53EaEDcweIDcoWefjcN4a7M4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(42112799006)(23010399003)(1800799024)(38070700021)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?14q3TJ841CYSsPMCjNK51LyR7ntP3QgvEeBTXXbB95ztUIL1DTMds7zaw8?=
 =?iso-8859-1?Q?znYSztZn8Ek5C61xx+rJ8chkUTx8M4qMjZGTN2f+T19EEST1YywXOD9ZH1?=
 =?iso-8859-1?Q?kIeuUVkMTRKmmy8aSetf6i8w+xd7a5oeZBOjBG9DCf70cGSOeX/rWRyjsm?=
 =?iso-8859-1?Q?PKTVG9b6qXlu47m24kdyVQR6oiF1idOEpok7QXNvmoz9dVJbVKtlUo1VEH?=
 =?iso-8859-1?Q?lVSPxqo0+kWGEQd87rM74JyzNZm/9KaKHm4MyM6a7CgUul6t6AEBVEvkDN?=
 =?iso-8859-1?Q?+22WMGMw6FP0ZmbFmVLDxwDn3f7PNa90ZitAbuQPdSf5/6j9O7woEZG70S?=
 =?iso-8859-1?Q?56joIMo9YtTMh1VyZHYrBhVs2cQ3opwa0Q6pTZADNnc+q0k8LQI3o0O02p?=
 =?iso-8859-1?Q?hJpLw5u/r/vafV3nHW5QRvHGQeT5bzD5yarNAYtaahc5Jj2ILS2wIjiS3c?=
 =?iso-8859-1?Q?N5lWoyS2IzQPgNZU7VDGHq4jMgpPWjPwqztmzWWItiWo13qrrXTqgNsUNv?=
 =?iso-8859-1?Q?RBc2KDGMwRj1fw3HnORoOc90+0r4XHzDWFZswCkbuWl+MKQ1IALbSyzinx?=
 =?iso-8859-1?Q?XiiUhf9+yMevstOdZTA3q8iTGAKsLYPRRMez5QIKL1pFAlTaubc42SAm5Z?=
 =?iso-8859-1?Q?qB9tItlN3ykYRYo/NSSDn4cNIchK0GgGPwyYQSaPcUTl6lFa/lPSVrbenU?=
 =?iso-8859-1?Q?IAi7fZUx41NOh8yo5cepVJg5U9iTy2whafOY5AOwmwYvukVp5pIQT3z56T?=
 =?iso-8859-1?Q?KM1Qg1vRQcEzVCE/WJ7Tm2jBxyoN+jVQNz2juWAIqxz0sDExC4QJCIO/gB?=
 =?iso-8859-1?Q?E87WtDb5o64AIt8LPM0ZH99ZYe8jw2vVhgrXeOwfMHxYq1VNnMYo/kr3Bd?=
 =?iso-8859-1?Q?FUhqdv66Bs42UfprlAOBUhFJoRHgW88EnrcwRxK14PaHrKQpsTYh98FJFv?=
 =?iso-8859-1?Q?vJxsZWV1B7wamGWWJsCeDeICnuDXNJwJagDJvXOmdglH5tCgYJF/HfdsuY?=
 =?iso-8859-1?Q?8vnI7Enz58ZQNezAqN7H/IgZrp4zTIPz5RkwBGe1E/+QTzsAsQf0TjZ0SJ?=
 =?iso-8859-1?Q?v8sBzrc0apyEJVcTKK+tX5DT9rs6Pg5OKJHtGt38mD0aV9AshFnRgcsBYF?=
 =?iso-8859-1?Q?zgtdVYuOVsM7YZSeqLnQWsIYvKVSdWHjpTzk63mhZEi2sPRAffP1NJqSYV?=
 =?iso-8859-1?Q?JoT+pUe9Piu3r2TSmBuDebCK+TZ1Wn420Ix1ZxWSPMoTqoYh9d0kNUImmD?=
 =?iso-8859-1?Q?0uPzT+fOSAD1u0sDjVFt4WHGq76mJYcEKcpndAkuawHdkpTNzv93TTaiqn?=
 =?iso-8859-1?Q?TFSiMYRp5RvLbESZeLkmLRmG97R0MmZYzmHT1vCDohbCHyzILhi3lc+fi9?=
 =?iso-8859-1?Q?GwKfgvGDpKZJuyUxl461XcOJ3HObefVXEQjQnfUOjWHtVFVoh/QRT9hy4g?=
 =?iso-8859-1?Q?7Hp69u4HEae27p2x4h/hkwA9fwJcaoRSdjWhXthY40t6+MhdzggmDA+IcM?=
 =?iso-8859-1?Q?HlMIiZtfbfprT81+ym+Qq+/MXDNf3j0cfh6lhht5P5B74jwqGlgodAnHkd?=
 =?iso-8859-1?Q?fzmNf5IT9p3PYlswTMsexBrlPdjPxm287mOvnFwMo2xCfFKpNHdZdBE2mL?=
 =?iso-8859-1?Q?2kNCOSLqg9th1JvCyyFBWRQaVMf1qY80Z/z6LAD2a7GrETcfj3axiU3gHO?=
 =?iso-8859-1?Q?hq9mRLm4fHsoLSrmOC+xCC4IAwa4jVH2lSQMASwAN5yfq1CjZ8E1w6yqBA?=
 =?iso-8859-1?Q?jGiBjEe05fsbMB1FaqoU0lL2NQ1mmdMvoWV+yTnIxYze1RyrxJZ1445ZwZ?=
 =?iso-8859-1?Q?lgF9sVZMnc1WXjrDzHv2GfkYbzyxus4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5732a9ca-9ca0-4a2a-143a-08dee01e86df
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2026 14:04:44.9303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 117NiS7hxS6lG42AHtVm03trps662ETqKIJcXLpmSo7eIQ+g6//yTV5XES+vbvlufhLgaut4eyOI/ae8vnJLbPyDXvCl89tHAm2NDHGcDJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9540
X-purgate-ID: tlsNG-16d1c6/1783865086-FAF55617-69B895B7/0/0
X-purgate-type: clean
X-purgate-size: 3525
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:from_mime,epam.com:email,epam.com:mid,epam.com:dkim,gitlab.com:url];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BED9744ED8

MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro
names".

Update ECLAIR configuration to deviate identifier and macro name
clashes by specifying the macros that should be ignored.
This includes 'hypfs_alloc_dyndata()', where the real function takes
an allocation size and the same-named macro is a typed convenience
wrapper that expands calls using sizeof(type).

Update deviations.rst and rules.rst accordingly.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 9 +++++++++
 docs/misra/rules.rst                             | 4 ++++
 3 files changed, 17 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7d4b6f2948..7e743f7c5e 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -132,6 +132,10 @@ These macros address differences in argument count dur=
ing compile-time, effectiv
 -config=3DMC3A2.R5.5,ignored_macros+=3D"name(update_gnttab_par||parse_gntt=
ab_limit)&&loc(file(^xen/common/grant_table\\.c$))"
 -doc_end
=20
+-doc_begin=3D"Clash between 'hypfs_alloc_dyndata()' function and macro nam=
e in 'xen/include/xen/hypfs.h' is deliberate."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(hypfs_alloc_dyndata)&&loc(fil=
e(^xen/include/xen/hypfs\\.h$))"
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index b048309596..ab80f01195 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -176,6 +176,15 @@ Deviations related to MISRA C:2012 Rules:
        unused 2nd and 3rd parameters to avoid warnings or errors related t=
o them.
      - ECLAIR has been configured to ignore these macros.
=20
+   * - R5.5
+     - Clash between the 'hypfs_alloc_dyndata()' function and macro name i=
s
+       deliberate. The function is the allocator taking a size in bytes, w=
hile
+       the macro is a typed convenience wrapper used by dynamic hypfs node=
s to
+       allocate per-request traversal data with the correct size and retur=
n type.
+       The implementation explicitly undefines the macro before defining t=
he real
+       function, so the name clash is controlled.
+     - ECLAIR has been configured to ignore this macro.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on =
the
        type of guest to service.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index b3e929307d..4f7b7fc848 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -222,6 +222,10 @@ maintainers if you want to suggest a change.
        Clashes between grant table functions and macro names are allowed
        because they are used for discarding unused parameters.
=20
+       Clash between hypfs_alloc_dyndata() function and macro names is all=
owed
+       because the macro is a typed convenience wrapper around the size-ba=
sed
+       allocation function.
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
--=20
2.43.0

