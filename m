Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cflrEgTEwWlTWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F48F2FE8C1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259637.1552987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7F-0007hQ-0r; Mon, 23 Mar 2026 22:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259637.1552987; Mon, 23 Mar 2026 22:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7E-0007eK-Tl; Mon, 23 Mar 2026 22:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1259637;
 Mon, 23 Mar 2026 22:51:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o7D-0007bQ-0F
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o7C-00As5i-Co
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:51:18 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c39c-e002-0a2a0a5209dd-0a2a4508b60e-8
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:18 +0100
Received: from [52.101.66.84]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3e5-1950-0a2a45080019-346542541204-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:18 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB7653.eurprd03.prod.outlook.com (2603:10a6:20b:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:15 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:15 +0000
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
 b=km9IMwVZ36w90NnW10fVWm/gqUfca+ANTSdrnj85X/nHdrPQIHwIbwwF4xyCVsNfZGciuJrZa5A+VD7qfjGSerRyYdF1ewTlTnxXo4GGwLQ/L6kajHTfp0aSQosUs+E+yt2AJnTNJwA+H2V1llpJhFnZG+acLovAosrozNWIZfL5OfXFtz0iU1kChghyjOZj4T++NyAF1/jF15pd0d74XXesEHgJsB0mIyA0FI6EQMdn6j4+MnsmlPK0gP0HVby12CAd5ORrmvNyLOu0VojpHNzJJdvO3zSG+cwNqBNKiJE36MnW+yw0c6O+D+veHqw9EPEeKelHMw3TJnGCP4Bmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vewgCNhKHzwDU0YYwkdB31/YzVG34husbiEbX4F2Gxs=;
 b=EgJKlRb/aSmNOA9FCmkIe+3Zv8inFE0MhP8wTjP7wk1GDF8LG+Fs3NOWmgommY7eodWZ4SBXKzc434bPR1cuYyxlNmHtSgpIMuMfrwGSmXbCxnHbNvgOgfDjdRFskkxqdR+7Vw4BSFKC2TveiPsGdoJ0bjfu5h/htng5mpS9qpvL95eB2LskuG8R0mzh7S6kErQukGSNhqkJu40qkgRTBbnTgI/ivvEw8HlmvlZuzxLPxkro+Q2/cONGQgLwwnNzxBvZzq18WMMShdNsMbuefT5l4BYEnki7y1dc6hPGoencLp3LDb0LIoR1PCswhjPrjsKNGzRO7dnxMVMGRx/ugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vewgCNhKHzwDU0YYwkdB31/YzVG34husbiEbX4F2Gxs=;
 b=arpndRpgeQpCYkShynYUZn8eUvyX56OZ1WTze85ayV1tIV66hoW+l2FNx3Y2SJouovMxFVx1JMEd+4cVYh9nfPqfeyM8OVwi+KDsBWtOlO4Jt3HKRStAyepNzOoozOzapFwJ3JoeghEk/Qf+9wZt2IAI0GNL1s8FXOQ7tbDUVvGgPt620bo8N+ln1Ed7VR2eyKynW+vzv0ofSlakG4YWwJK8lujnp7aXFowbY3oQVuTTpm2fMxyXLCZCCPHDTZdaEOlNEnZbhJKy2AonqqCETyUjOhHAaTQWsOpcVgiw/Hf3ljG6OFLGC9R0U7lTjeaSHU6ilyAh5bhE0JTCs93VeA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jean-Philippe Brucker <jean-philippe@linaro.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Eric Auger
	<eric.auger@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>, Will Deacon
	<will@kernel.org>, Joerg Roedel <jroedel@suse.de>
Subject: [PATCH v2 01/23] xen/arm: smmuv3: Maintain a SID->device structure
Thread-Topic: [PATCH v2 01/23] xen/arm: smmuv3: Maintain a SID->device
 structure
Thread-Index: AQHcuxeOzkUuXkjiGEeMk+4qntKL8w==
Date: Mon, 23 Mar 2026 22:51:15 +0000
Message-ID:
 <1621f3abdcaac0e941df7474dfaaa035fb819b4c.1774305918.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 8807c382-dee3-4da0-eef1-08de892eb08d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 +gCBJ0kP1hyzciXpiaohioHglDAzpfULa7skIDjs6MAN2M70Ou9xgtJvSiqFaXbL6zqhD+R0zaDmS19Wf6zI3KMN3K8C/lx8sRnt23oiK8GLAyiqNN+wrI0nI9zYrX3WZj/pJ/kbTtiu80aFj2XzMk9QEDGI4vta4eVv+wV9MMe42x80tKbwoEOmwLoBFCrpBkAaiVBkHHwBI/gPRlqT5q8SI7QSHLLaHI8yPtf16lSG8RueIEHnYPr03MDdm5qb3HuerffHJ2XT9Evin81ThYq8LQwQGlMwCDCpjf8FEgWSnxM0xbQjG6YGZsCIqLZOLrWK6DI+AtYL89F7KsYHV5QofBFW8wq6buSlWdaJnX18reAJGQT617HCWf3GZE6DBatyMqF1uJiA+hCdfq4S59itXznNgEK344VsFgozq7yM/LRngph+0s7wH28eHIuI5YJLEomn79C0Aq92mwx5o7fafnZQkcY0OpbvnWerLibIrHCrtIgjaTIJtxa8Sdmpzq/1uxuyJAoGf2zpB2oUJvorvPh5B+GFHC//b4l012LTVsqxTBytXuNOpe3SDzLMtYt8IPbLI4ngG9iWTM+lfZjibJUvqauvLSobBmteCUE5Mc4Bf+YqLTnm8BllJE853m0q4a9FlZo4IzChVI2nGmjRdAzFF8eQnhxizDOcE7NgKwSpobcqMswvNMz2sFWsaJJGqCKrCSIDk/SxogCI3u0p9KNih5XyTNWuayTNiBh2mSeLJ2EW0yHxAdaAHNtLAkZUPXF2kPTp0BOHbz9aFL2c4L2xtdHhp5ts9cPC0Tg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?f9t8UmGsZlSt0qbsOtsyph1sUa3kd11ooj4381x2PSOXey5nrW68QsBToV?=
 =?iso-8859-1?Q?axSGlWMQ+x/+jrlvjZL8eTj3cxbUER+gewzrRJiOTRrHUTsSFRmRKDUV63?=
 =?iso-8859-1?Q?JvQYXh7M8tqdJwyHDWnzcHKth15ecMkdniTP9Ggwqj6TKV2Er7G3cvcnLd?=
 =?iso-8859-1?Q?7kz3uiP97JQfOC07bbg2NOgglsvwSndfui00IbLUe4q1CHvPZj+0VIAJU/?=
 =?iso-8859-1?Q?ECYbUmOuiSK4w46mT41kEE9A9L1XCtuRqfEB7mAD+kZZqUkd+/K7oJasCD?=
 =?iso-8859-1?Q?vzncjdLA8OFb+3Ay4+K5U/feEYTiLa5Zc+i4hesx8ADf3RDrf+b0bYResZ?=
 =?iso-8859-1?Q?81PMCfAnq/pAewj+Ezd8bcmLGkC/06wzFhiGgHYfz4iuYE/h7xhwitKTXJ?=
 =?iso-8859-1?Q?5owyPGCet79ZUSUZ48655QqcKWACy/UU7K42ZjJAlvXNULetWOgoErJPTb?=
 =?iso-8859-1?Q?EG4+/y/pjzvKY32Mq630GCcSV5yb45/4UzkqwbWY0kYQb1q5Ri3s8kbd8g?=
 =?iso-8859-1?Q?1ZYK2CzcNlNJaylMCGq2PGxd7w7nzJYTIpcb22mQFL16ctK90dX6pAz8pW?=
 =?iso-8859-1?Q?SLLrClh8eBQKyoDiy6ppPjsCkMeoMcFMUmU6+a2ioDDhCJ/8xaROgncV8I?=
 =?iso-8859-1?Q?XDiEzf6oSsReX/Dee9aFcErBfRXfhvhVDWx4AyW20H3ASzEAMzUX7BYfrg?=
 =?iso-8859-1?Q?IvM1n3Z2EWE9zlu+Kg9UUr+QQxrqgFkDJXiSmS0BpFdJXoTrUlH0/JI/tt?=
 =?iso-8859-1?Q?CD3rDN/VXQVv7rtFtlfUfRjrq07t/R/XDkOPki5gLw5VSLnjd4pgqIdng0?=
 =?iso-8859-1?Q?OY6BrIbgZNpQ55A4Hwz/8c2nF+To/2RhGgymUqCEy44biiQqEFJxPm+iF9?=
 =?iso-8859-1?Q?S3xL/P5Y2ry4AiNNx6KubckyjlMOAo4So6twR73rwyUtezs5JtZ9oxSPhv?=
 =?iso-8859-1?Q?36+shwWagpsVqy43pmqdnGtW6TyHd2fLFkHRbjW7ZLLTNRg5Gk9yuME7sa?=
 =?iso-8859-1?Q?kUzpu5IPgFhcy6ibSgJCftjxe71UOmtCYq0cjnVbk3V8IZqTfvhFPCl2uM?=
 =?iso-8859-1?Q?rxDc5q2uMyz6fX2mLYIpnL59W50/RjpecK1cQPGm0jiphAlI/wyO+/YYDD?=
 =?iso-8859-1?Q?nk3BRPEE6L0y5xiLqzur6fhkK3FMgOvwikIemJokZhC51uoIgD6Q5TLAmB?=
 =?iso-8859-1?Q?wG9PCuvQEbaEkN++XkR25t8U4kIH5ZAgkLQZsHuZkjHS6yyOxJBIFUAkOS?=
 =?iso-8859-1?Q?FlFhWMR8dl4YvPKkR50hNKeX0V5wNYIiyOlsxYR1mdyv0Yq2Vb6DmHP+AL?=
 =?iso-8859-1?Q?ga7ksiW3L4ZhMz/xMlQ9Wt836bP33TPWr+bX+2/VjS3Y3Z+4jaq07UluRG?=
 =?iso-8859-1?Q?bj/NhVi/CQtQVNZdoavpZtVOeg1sDHCLcdxQChuqH9BVVYc+gcXflWXrcH?=
 =?iso-8859-1?Q?BcViMrAipGN3eLog6hqDfudpQVMb15kbRCLRC08ELBbSlF4ddLw16DwHcs?=
 =?iso-8859-1?Q?ggknj3apMNe5GJKhnNcgEPvbolh13JjIc6pIPn7h0Y+Av3d5FQre2dUlyJ?=
 =?iso-8859-1?Q?ltHWktAUy/UcUlZLXJZQH3T8Qfa2vMD7MJqPCP/kDwoUK7G5a/Zn1v7fbx?=
 =?iso-8859-1?Q?dReQuGLfB9kVgU13eVc/Jk2W7OlQx3V9btwt/Yrgi5OcNi309iyc7eCVhW?=
 =?iso-8859-1?Q?57pvGFzy/M4jHMi5Q1haKpYytCGvHlXposZVjdMVsAqwYggQyV3GeDUom0?=
 =?iso-8859-1?Q?cqn9G7mX+1nQPv6cXljgNRzRva3yxycojAdeZflPAdeyUr3G6aa+Vx2w/4?=
 =?iso-8859-1?Q?RS3MtB5hRE4b8dVC9IlqSrCXG31kkO0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8807c382-dee3-4da0-eef1-08de892eb08d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:15.6541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Zp7Gn7Ijxmod+WUdE3qFJXiUwGOFTADBb90Tk+xejN0Mjo2ndv4ylTRw0NdDMe8nyfmOi0brL7kGKO0HIa64g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7653
X-purgate-ID: tlsNG-c1860d/1774306278-EA28F726-91406869/0/0
X-purgate-type: clean
X-purgate-size: 7580
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,huawei.com:email,epam.com:dkim,epam.com:mid,suse.de:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,linaro.org:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jean-philippe@linaro.org,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Jonathan.Cameron@huawei.com,m:eric.auger@redhat.com,m:zhukeqian1@huawei.com,m:will@kernel.org,m:jroedel@suse.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7F48F2FE8C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Backport Linux commit cdf315f907d4. This is the clean backport without
any changes.

When handling faults from the event or PRI queue, we need to find the
struct device associated with a SID. Add a rb_tree to keep track of
SIDs.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Acked-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/r/20210401154718.307519-8-jean-philippe@linar=
o.org
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git cd=
f315f907d4
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 131 +++++++++++++++++++++-----
 xen/drivers/passthrough/arm/smmu-v3.h |  13 ++-
 2 files changed, 118 insertions(+), 26 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index bf153227db..73cc4ef08f 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -809,6 +809,27 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_dev=
ice *smmu, u32 sid)
 	return 0;
 }
=20
+__maybe_unused
+static struct arm_smmu_master *
+arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
+{
+	struct rb_node *node;
+	struct arm_smmu_stream *stream;
+
+	node =3D smmu->streams.rb_node;
+	while (node) {
+		stream =3D rb_entry(node, struct arm_smmu_stream, node);
+		if (stream->id < sid)
+			node =3D node->rb_right;
+		else if (stream->id > sid)
+			node =3D node->rb_left;
+		else
+			return stream->master;
+	}
+
+	return NULL;
+}
+
 /* IRQ and event handlers */
 static void arm_smmu_evtq_tasklet(void *dev)
 {
@@ -1042,8 +1063,8 @@ static int arm_smmu_atc_inv_master(struct arm_smmu_ma=
ster *master,
 	if (!master->ats_enabled)
 		return 0;
=20
-	for (i =3D 0; i < master->num_sids; i++) {
-		cmd->atc.sid =3D master->sids[i];
+	for (i =3D 0; i < master->num_streams; i++) {
+		cmd->atc.sid =3D master->streams[i].id;
 		arm_smmu_cmdq_issue_cmd(master->smmu, cmd);
 	}
=20
@@ -1271,13 +1292,13 @@ static void arm_smmu_install_ste_for_dev(struct arm=
_smmu_master *master)
 	int i, j;
 	struct arm_smmu_device *smmu =3D master->smmu;
=20
-	for (i =3D 0; i < master->num_sids; ++i) {
-		u32 sid =3D master->sids[i];
+    for (i =3D 0; i < master->num_streams; ++i) {
+		u32 sid =3D master->streams[i].id;
 		__le64 *step =3D arm_smmu_get_step_for_sid(smmu, sid);
=20
 		/* Bridged PCI devices may end up with duplicated IDs */
 		for (j =3D 0; j < i; j++)
-			if (master->sids[j] =3D=3D sid)
+			if (master->streams[j].id =3D=3D sid)
 				break;
 		if (j < i)
 			continue;
@@ -1486,6 +1507,80 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_de=
vice *smmu, u32 sid)
=20
 	return sid < limit;
 }
+
+static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
+				  struct arm_smmu_master *master)
+{
+	int i;
+	int ret =3D 0;
+	struct arm_smmu_stream *new_stream, *cur_stream;
+	struct rb_node **new_node, *parent_node =3D NULL;
+	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(master->dev);
+
+	master->streams =3D _xzalloc_array(sizeof(*master->streams), sizeof(void =
*),
+					fwspec->num_ids);
+	if (!master->streams)
+		return -ENOMEM;
+	master->num_streams =3D fwspec->num_ids;
+
+	mutex_lock(&smmu->streams_mutex);
+	for (i =3D 0; i < fwspec->num_ids; i++) {
+		u32 sid =3D fwspec->ids[i];
+
+		new_stream =3D &master->streams[i];
+		new_stream->id =3D sid;
+		new_stream->master =3D master;
+
+		/*
+		 * Check the SIDs are in range of the SMMU and our stream table
+		 */
+		if (!arm_smmu_sid_in_range(smmu, sid)) {
+			ret =3D -ERANGE;
+			break;
+		}
+
+		/* Ensure l2 strtab is initialised */
+		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+			ret =3D arm_smmu_init_l2_strtab(smmu, sid);
+			if (ret)
+				break;
+		}
+
+		/* Insert into SID tree */
+		new_node =3D &(smmu->streams.rb_node);
+		while (*new_node) {
+			cur_stream =3D rb_entry(*new_node, struct arm_smmu_stream,
+					      node);
+			parent_node =3D *new_node;
+			if (cur_stream->id > new_stream->id) {
+				new_node =3D &((*new_node)->rb_left);
+			} else if (cur_stream->id < new_stream->id) {
+				new_node =3D &((*new_node)->rb_right);
+			} else {
+				dev_warn(master->dev,
+					 "stream %u already in tree\n",
+					 cur_stream->id);
+				ret =3D -EINVAL;
+				break;
+			}
+		}
+		if (ret)
+			break;
+
+		rb_link_node(&new_stream->node, parent_node, new_node);
+		rb_insert_color(&new_stream->node, &smmu->streams);
+	}
+
+	if (ret) {
+		for (i--; i >=3D 0; i--)
+			rb_erase(&master->streams[i].node, &smmu->streams);
+		xfree(master->streams);
+	}
+	mutex_unlock(&smmu->streams_mutex);
+
+	return ret;
+}
+
 /* Forward declaration */
 static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *de=
v);
 static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *=
dev,
@@ -1495,7 +1590,7 @@ static int arm_smmu_deassign_dev(struct domain *d, ui=
nt8_t devfn,
=20
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
-	int i, ret;
+	int ret;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master *master;
 	struct iommu_fwspec *fwspec;
@@ -1532,26 +1627,11 @@ static int arm_smmu_add_device(u8 devfn, struct dev=
ice *dev)
=20
 	master->dev =3D dev;
 	master->smmu =3D smmu;
-	master->sids =3D fwspec->ids;
-	master->num_sids =3D fwspec->num_ids;
 	dev_iommu_priv_set(dev, master);
=20
-	/* Check the SIDs are in range of the SMMU and our stream table */
-	for (i =3D 0; i < master->num_sids; i++) {
-		u32 sid =3D master->sids[i];
-
-		if (!arm_smmu_sid_in_range(smmu, sid)) {
-			ret =3D -ERANGE;
-			goto err_free_master;
-		}
-
-		/* Ensure l2 strtab is initialised */
-		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
-			ret =3D arm_smmu_init_l2_strtab(smmu, sid);
-			if (ret)
-				goto err_free_master;
-		}
-	}
+	ret =3D arm_smmu_insert_master(smmu, master);
+	if (ret)
+		goto err_free_master;
=20
 	/*
 	 * Note that PASID must be enabled before, and disabled after ATS:
@@ -1796,6 +1876,9 @@ static int __init arm_smmu_init_structures(struct arm=
_smmu_device *smmu)
 {
 	int ret;
=20
+	mutex_init(&smmu->streams_mutex);
+	smmu->streams =3D RB_ROOT;
+
 	ret =3D arm_smmu_init_queues(smmu);
 	if (ret)
 		return ret;
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index ab07366294..ab1f29f6c7 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -639,6 +639,15 @@ struct arm_smmu_device {
 	struct tasklet		evtq_irq_tasklet;
 	struct tasklet		priq_irq_tasklet;
 	struct tasklet		combined_irq_tasklet;
+
+	struct rb_root		streams;
+	struct mutex		streams_mutex;
+};
+
+struct arm_smmu_stream {
+	u32							id;
+	struct arm_smmu_master		*master;
+	struct rb_node				node;
 };
=20
 /* SMMU private data for each master */
@@ -647,8 +656,8 @@ struct arm_smmu_master {
 	struct device			*dev;
 	struct arm_smmu_domain		*domain;
 	struct list_head		domain_head;
-	u32				*sids;
-	unsigned int			num_sids;
+	struct arm_smmu_stream		*streams;
+	unsigned int				num_streams;
 	bool				ats_enabled;
 };
=20
--=20
2.43.0

