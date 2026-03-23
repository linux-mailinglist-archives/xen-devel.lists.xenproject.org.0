Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNz0MgXEwWkHWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F152FE8E1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259639.1552997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7I-0007va-8r; Mon, 23 Mar 2026 22:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259639.1552997; Mon, 23 Mar 2026 22:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7I-0007sp-4e; Mon, 23 Mar 2026 22:51:24 +0000
Received: by outflank-mailman (input) for mailman id 1259639;
 Mon, 23 Mar 2026 22:51:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o7G-0007s3-8H
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o7F-00As5i-KU
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:51:21 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3d3-e002-0a2a0a5209dd-0a2a4504df26-8
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:21 +0100
Received: from [52.101.65.99]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3e8-c823-0a2a45040019-3465416374e5-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:21 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB7653.eurprd03.prod.outlook.com (2603:10a6:20b:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:18 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:18 +0000
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
 b=bmwm/ITPXiAW5Azqpb3w0AxMUxssUYIbJU7RRE7INLzZGwX9lHM/pEmPWpUUMltwedfyi/UdzfbNwFkYK2m8l0MuqVXMvcbJPX1MKTE6ykeZT/4XyBhXCPDbXnad6xz0HvaRQAAgTALDOPCU5RPUXLI/smQH90y2uaqTJdEIzXip5GZ8p7WV1I4k7S88XxT9Uf1oXMIHTibwodIM34s+So4lqp+1tPg2mlGS8YXzME9Hw4NMrySFP53D0JuaBJp4UglR0wLYOdV15q8YJhdPBu+gBB5a+X2o7vc4vkRaOzl5tf6owmoChQvrGaK8zlqI5O9esHtyrkcpP5jWaoyMCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9tecJs7l+jief5fwjcb0VdatPuGZ/jTmjdUcsZ7naQ=;
 b=r1Q8vTbe0ctlNy6b8GreeJylpMJkOJQZQRnD34H1Gu9ykWjSL3tmjhmc1CjozE+pCtjKfku1dAL9EeLAHht8dq3Jgs8AlOcdJCR7H4gytt07Cot+pRtUMJZT7Eu9hR4tUDMhN0cYu6UPW9h0LmETGktLOKp0GKIueTyPB30pbESdZDyiUTfui03CqgL219ntjaFZvJX8P7PGOoLZh2e6U8YmTmrwdoVZwVHYTYPS3CIrb99fDyOUD8dDYKQdpHNRrlhPrEseBAyt7e4W5WLdiyWJu8CQtz774htIj+AF4JKune1RQcBh+1+mdNfRpREQZ1I4X/s0iwzedDjnGWbP0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9tecJs7l+jief5fwjcb0VdatPuGZ/jTmjdUcsZ7naQ=;
 b=DK5YOeSwoOOcNdXYY+RlkJVfCKn4eT2YhL67s6lbItXdlsUGSPYqOpMs8MFR4ZmjHDB5A6J6a54dglBw7al/Y19C7URSQX0pGAzM4b8XyjkBv4nVeJsBDHDb+eyg8bdgkPv51fPJvnRKH163Z4sj81F+Jg76o+9bM1K3aOnu0TXu4CmigscAwkqRH/un4rQnB0DD8HLh834WLM9fWTzXgzQSYPQbzvOAE7zt40bTQG+XeMYvAapRsmJ1sGj0MPs3/Unig1STQvPfvMd6PdnEOWF0/WhoBhFCDCqNuPgF8POIcnK8TDKqzF//lT1gGHRE+qdooogdl/PF8lhD7TsxEg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and nested
 stage translation
Thread-Topic: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Thread-Index: AQHcuxePLk1RkRIjgUOb67cOJQVJRA==
Date: Mon, 23 Mar 2026 22:51:18 +0000
Message-ID:
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774305918.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|AS8PR03MB7653:EE_
x-ms-office365-filtering-correlation-id: 33d17402-6d36-4fa2-ced0-08de892eb275
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 9/hTa8iND9xWUhIuYceeG5kZu+ynPAM6HvjkzJXI/lo02IfQYmYRAwKknW4EG36XO1Lzs1MlRze3/tcdluysEQ3TKK5VCMY6Zqx8sAFj4cNJK9cFcreD8tYtMgqbgKPDLSAGyF1AnB35kOnvMJzvHBWY8CYa+zoaS3xcH1nrhEwwMHv5qSgRKkByY4z/2ld9xABA769X7GK8T6jVJ+5+wiKl5tCFB0G8fXu8pE/XtRvp3f2Ucm5XYTs68OcZSuBn8iW0QIz5q2ZESqYxjtPAWLkyGrSGZTSOTY8VgDWxEm2WIRrySwDpoJ6dACX5Gm3Fk7GZta52V/lXL7atjGGgOGdvz36PFT+gh/Dp/BQa1p+KAJ8+yS6V4/e6f6SomOV14/DREvqicRflF+LwKiEzEENdTfkPo44l1iAOfFzwqzkR4iPuZ9wGD0hau11eJsQatKcjiqVLpyCyCXM1rtGBVLKJE4Gs7P6qK3N1hpt89rLwpuek5DjzJ4si2TseOXoRhofVq9yZQ+j2RdxVw7yzx66uBYkewl0p6dvm8iZK+IUjvcc2ecpLax8H/djB3snpnnxeuG7Bn9ONQlxnshNtI7c3LNOKWjFwj13USsye6r3IgNWTFI7tCUV4HVjHxGd6Zq6niGxc785/ukmUipJb85fXfVDtPHWWfdmeCRSa4gjzgs+CuXOvz8pWKeCbciBalYGqvoEtcmq0aH4JtX0upDKJbrvsIwvLym8pN04uC1T8LDwJC4MxGtYGsFUkS8VBxVLaJu+95ZQHFLpnJQwyrzqHobtb8wqoOLMYgJUyono=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FYJqqeAVMDMPCFoIMyq6UxiiqvizY4BMg/7Q8/3zI0X7CUV+o6gguui5oi?=
 =?iso-8859-1?Q?j/SBGkGEAy4/R41sYIizcGJngdq6scRGVNJjkXwIq4bCwMGdy8Jl2ooUR9?=
 =?iso-8859-1?Q?SUGy00eMyEEYLRjS6ysF0cD+oik9XKoqVFeNPleOJrdgheX7Jh1QtOx2c+?=
 =?iso-8859-1?Q?hX2CvV60XwohIj1YvrbgYIdyTRGT/vdKLTxa8MnxHLtjWmevDZPzK9yPGC?=
 =?iso-8859-1?Q?DGc7yJm/Ud8y9uva7jtRCWbEis/Q30yQyPdoPw+Jhxi8JxzxQZBATbm5jW?=
 =?iso-8859-1?Q?rTURtHWd+2clBn+dsG6LvqH1IHGfT2n601Xmj6mV9IUe2ekKk92wIPSFYj?=
 =?iso-8859-1?Q?WQcZ7Mwkjqa648CHFBXISi1N/X8u4O93HmCoC9+8H0MgOgIZFmM535OhfX?=
 =?iso-8859-1?Q?mqPydSqgijiQ/SJCcR4IRk8G+1v4oLxfEHeO4UB3saYnqTarfz9fygxJRI?=
 =?iso-8859-1?Q?3UR0KtxnTwDnz3Lmo6L2KgzmfVNjKJpalo+dEr13J53QhW4x8QYoP38NWQ?=
 =?iso-8859-1?Q?or8hHi6AWmoXTnzJ1SP5jZVXYwqKUNPpPbyYvNgpRISP//YBjisbfWciEt?=
 =?iso-8859-1?Q?rVGZMatqO/6k2BGaFIv1sffJdOGdbT3zF+4ZSksY7t7byZj+d/E5yy5szW?=
 =?iso-8859-1?Q?qhp7UGpeIJIlbkXJ+WkUnYKqxtfa6wHQgr6D28tFD3H1WEjOZf52Kzhyyc?=
 =?iso-8859-1?Q?WnWGA/8cym8BPAqVVSMGMgWwmdAFBC1986V0vMPz/tMs9dW/+wHXMNUna/?=
 =?iso-8859-1?Q?em7yCbQGPYfnCZDY3APAchVyjztBlE3MnMLbD7velLkeNyOlXAmMER3RCi?=
 =?iso-8859-1?Q?u7Xpku2iJv5fAsRwgu48DvqQlCtmH5E8GTN8ioLHIG83bl2unTL1J9E8wd?=
 =?iso-8859-1?Q?/thwF0zYKIK4fV/OsEEMfFGHf7k2JvG35Ye1u8ugL+1jXpcG+X62kTJbul?=
 =?iso-8859-1?Q?F4qpTUmU16GzMpNpfoFmdXaXGIx3XoFFtAhqNipMGdHS7zbvUhiaHumXyZ?=
 =?iso-8859-1?Q?HCEZeJlOUwU/GZnl1rw7rOJgBIDxel9CwrtxmCf4xDAsZKlboAkRLgK7o9?=
 =?iso-8859-1?Q?5jF6/a18m7W3j877QRu7tEYsF6Mtj7O1hMxkx4APOG9QQO0fev3Fvopnje?=
 =?iso-8859-1?Q?y741avAgnmOGIAg8/oRcVw8qlTO8JT1v7CZzrDxz9veUNikMFAE9BjKMtg?=
 =?iso-8859-1?Q?9kHbLRW9kozhT3knuvuVSlDd48mDFfVqoybz2xbshXm3Xb8L6cbKjBxgY4?=
 =?iso-8859-1?Q?2+glM00v/uukyGovjEMQO9qGzzxPx8qWy1wbbTObiaVQJr+9zMPKrghYjx?=
 =?iso-8859-1?Q?i/fh5F1XrtejZ6ccMMJNKYI7bYMVQipWXj5GtDnDZHf+R3imxtt4H9t7wa?=
 =?iso-8859-1?Q?oxirNDuJ74zq2ZCC73LN2u83Cy+rfHVb6rkNqazhGsBm1/g1luPIpt1cn1?=
 =?iso-8859-1?Q?bFxFQpkS9bKzXd+AtZOeQHOjoYiJdEs0pHM6EkQwrn1BAYsHJ12dW4JQ7y?=
 =?iso-8859-1?Q?FdSjk+k+t4aZcdqQodYKVuhRD5e8Mx0i92/6LdQmf8cI4hJll6IPbv+SSn?=
 =?iso-8859-1?Q?qZELVRSk2QY2auUoTYA0zzvBzd0hmrFLtYmhgVn8Cx7zCtigrzQGkBof80?=
 =?iso-8859-1?Q?g+Y1OqA0go74hn+CPaKW8VVTYCocyn3c+SvP0IzTwYfm23cdqs+x6pYu0c?=
 =?iso-8859-1?Q?whO629Y3H1XzYSa3Ej2ps+abyLbQyeOxcFVua2LgP5PUB1ypCbF8cBcNuL?=
 =?iso-8859-1?Q?CUlJsWUYypjOOl0zQeWwAdQBHbJ01X95smJ7l/pEis5RgUCkKb2OYRNv06?=
 =?iso-8859-1?Q?oWYCd+iYELjANlHNUhTqgSptbHF3c2Q=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d17402-6d36-4fa2-ced0-08de892eb275
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:18.8218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yym28Z5FrSo0/VriHR3XpJ56paszqq2FAqjskSxHgYZWXMrcMlc8sg/CIP+c5ZQY+FGnwPFsxovdiHmF6iLMfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7653
X-purgate-ID: tlsNG-ebf023/1774306281-B9C819D1-EAD6BD05/0/0
X-purgate-type: clean
X-purgate-size: 7270
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 66F152FE8E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Xen SMMUv3 driver only supports stage-2 translation. Add support for
Stage-1 translation that is required to support nested stage
translation.

In true nested mode, both s1_cfg and s2_cfg will coexist.
Let's remove the union. When nested stage translation is setup, both
s1_cfg and s2_cfg are valid.

We introduce a new smmu_domain abort field that will be set
upon guest stage-1 configuration passing. If no guest stage-1
config has been attached, it is ignored when writing the STE.

arm_smmu_write_strtab_ent() is modified to write both stage
fields in the STE and deal with the abort field.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 93 +++++++++++++++++++++++----
 xen/drivers/passthrough/arm/smmu-v3.h |  9 +++
 2 files changed, 91 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index 73cc4ef08f..f9c6837919 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -683,8 +683,10 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_=
master *master, u32 sid,
 	 * 3. Update Config, sync
 	 */
 	u64 val =3D le64_to_cpu(dst[0]);
-	bool ste_live =3D false;
+	bool s1_live =3D false, s2_live =3D false, ste_live =3D false;
+	bool abort, translate =3D false;
 	struct arm_smmu_device *smmu =3D NULL;
+	struct arm_smmu_s1_cfg *s1_cfg =3D NULL;
 	struct arm_smmu_s2_cfg *s2_cfg =3D NULL;
 	struct arm_smmu_domain *smmu_domain =3D NULL;
 	struct arm_smmu_cmdq_ent prefetch_cmd =3D {
@@ -699,30 +701,54 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu=
_master *master, u32 sid,
 		smmu =3D master->smmu;
 	}
=20
-	if (smmu_domain)
-		s2_cfg =3D &smmu_domain->s2_cfg;
+	if (smmu_domain) {
+		switch (smmu_domain->stage) {
+		case ARM_SMMU_DOMAIN_NESTED:
+			s1_cfg =3D &smmu_domain->s1_cfg;
+			fallthrough;
+		case ARM_SMMU_DOMAIN_S2:
+			s2_cfg =3D &smmu_domain->s2_cfg;
+			break;
+		default:
+			break;
+		}
+		translate =3D !!s1_cfg || !!s2_cfg;
+	}
=20
 	if (val & STRTAB_STE_0_V) {
 		switch (FIELD_GET(STRTAB_STE_0_CFG, val)) {
 		case STRTAB_STE_0_CFG_BYPASS:
 			break;
+		case STRTAB_STE_0_CFG_S1_TRANS:
+			s1_live =3D true;
+			break;
 		case STRTAB_STE_0_CFG_S2_TRANS:
-			ste_live =3D true;
+			s2_live =3D true;
+			break;
+		case STRTAB_STE_0_CFG_NESTED:
+			s1_live =3D true;
+			s2_live =3D true;
 			break;
 		case STRTAB_STE_0_CFG_ABORT:
-			BUG_ON(!disable_bypass);
 			break;
 		default:
 			BUG(); /* STE corruption */
 		}
 	}
=20
+	ste_live =3D s1_live || s2_live;
+
 	/* Nuke the existing STE_0 value, as we're going to rewrite it */
 	val =3D STRTAB_STE_0_V;
=20
 	/* Bypass/fault */
-	if (!smmu_domain || !(s2_cfg)) {
-		if (!smmu_domain && disable_bypass)
+	if (!smmu_domain)
+		abort =3D disable_bypass;
+	else
+		abort =3D smmu_domain->abort;
+
+	if (abort || !translate) {
+		if (abort)
 			val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_ABORT);
 		else
 			val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
@@ -740,7 +766,33 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_=
master *master, u32 sid,
 		return;
 	}
=20
+	if (ste_live) {
+		/* First invalidate the live STE */
+		dst[0] =3D cpu_to_le64(STRTAB_STE_0_CFG_ABORT);
+		arm_smmu_sync_ste_for_sid(smmu, sid);
+	}
+
+	if (s1_cfg) {
+		BUG_ON(s1_live);
+		dst[1] =3D cpu_to_le64(
+			 FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
+			 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
+			 FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
+			 FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
+			 FIELD_PREP(STRTAB_STE_1_STRW, STRTAB_STE_1_STRW_NSEL1));
+
+		if (smmu->features & ARM_SMMU_FEAT_STALLS &&
+		   !(smmu->features & ARM_SMMU_FEAT_STALL_FORCE))
+			dst[1] |=3D cpu_to_le64(STRTAB_STE_1_S1STALLD);
+
+		val |=3D (s1_cfg->s1ctxptr & STRTAB_STE_0_S1CTXPTR_MASK) |
+			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
+			FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax) |
+			FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
+	}
+
 	if (s2_cfg) {
+		u64 vttbr =3D s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK;
 		u64 strtab =3D
 			 FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
 			 FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
@@ -750,12 +802,19 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu=
_master *master, u32 sid,
 			 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
 			 STRTAB_STE_2_S2R;
=20
-		BUG_ON(ste_live);
+		if (s2_live) {
+			u64 s2ttb =3D le64_to_cpu(dst[3]) & STRTAB_STE_3_S2TTB_MASK;
+			BUG_ON(s2ttb !=3D vttbr);
+		}
+
 		dst[2] =3D cpu_to_le64(strtab);
=20
-		dst[3] =3D cpu_to_le64(s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK);
+		dst[3] =3D cpu_to_le64(vttbr);
=20
 		val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
+	} else {
+		dst[2] =3D 0;
+		dst[3] =3D 0;
 	}
=20
 	if (master->ats_enabled)
@@ -1254,6 +1313,15 @@ static int arm_smmu_domain_finalise(struct iommu_dom=
ain *domain,
 {
 	int ret;
 	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
+	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
+
+	if (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_NESTED &&
+		(!(smmu->features & ARM_SMMU_FEAT_TRANS_S1) ||
+		 !(smmu->features & ARM_SMMU_FEAT_TRANS_S2))) {
+			dev_info(smmu_domain->smmu->dev,
+					"does not implement two stages\n");
+			return -EINVAL;
+	}
=20
 	/* Restrict the stage to what we can actually support */
 	smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
@@ -2353,11 +2421,14 @@ static int arm_smmu_device_hw_probe(struct arm_smmu=
_device *smmu)
 		break;
 	}
=20
+	if (reg & IDR0_S1P)
+		smmu->features |=3D ARM_SMMU_FEAT_TRANS_S1;
+
 	if (reg & IDR0_S2P)
 		smmu->features |=3D ARM_SMMU_FEAT_TRANS_S2;
=20
-	if (!(reg & IDR0_S2P)) {
-		dev_err(smmu->dev, "no stage-2 translation support!\n");
+	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
+		dev_err(smmu->dev, "no translation support!\n");
 		return -ENXIO;
 	}
=20
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index ab1f29f6c7..3fb13b7e21 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -197,6 +197,7 @@
 #define STRTAB_STE_0_CFG_BYPASS		4
 #define STRTAB_STE_0_CFG_S1_TRANS	5
 #define STRTAB_STE_0_CFG_S2_TRANS	6
+#define STRTAB_STE_0_CFG_NESTED		7
=20
 #define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
 #define STRTAB_STE_0_S1FMT_LINEAR	0
@@ -549,6 +550,12 @@ struct arm_smmu_strtab_l1_desc {
 	dma_addr_t			l2ptr_dma;
 };
=20
+struct arm_smmu_s1_cfg {
+	u64				s1ctxptr;
+	u8				s1fmt;
+	u8				s1cdmax;
+};
+
 struct arm_smmu_s2_cfg {
 	u16				vmid;
 	u64				vttbr;
@@ -669,7 +676,9 @@ struct arm_smmu_domain {
 	atomic_t			nr_ats_masters;
=20
 	enum arm_smmu_domain_stage	stage;
+	struct arm_smmu_s1_cfg	s1_cfg;
 	struct arm_smmu_s2_cfg	s2_cfg;
+	bool			abort;
=20
 	/* Xen domain associated with this SMMU domain */
 	struct domain		*d;
--=20
2.43.0

