Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BQtOg7EwWlUWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2E52FE944
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259679.1553133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7i-0004ec-Pa; Mon, 23 Mar 2026 22:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259679.1553133; Mon, 23 Mar 2026 22:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7h-0004AM-NH; Mon, 23 Mar 2026 22:51:49 +0000
Received: by outflank-mailman (input) for mailman id 1259679;
 Mon, 23 Mar 2026 22:51:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8gh=BX=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1w4o7a-0007Yi-Kq
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:42 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021085.outbound.protection.outlook.com [52.101.70.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d98ffb33-270a-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 23:51:37 +0100 (CET)
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB9699.eurprd03.prod.outlook.com (2603:10a6:20b:61d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:36 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:36 +0000
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
X-Inumbo-ID: d98ffb33-270a-11f1-b166-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0igUW+5pBjNkoNMyP0lxdZGPQPA/lBf4/bBGQf6IxPbiPerdBV09D1ihUUlSchwGpBYHnBzSpwdE9jinUfwriGf0zFHLAD5JJmmpX9y+Q2FRJNW7IkUwCd4Ki6LrUMYYDcu2WK7EnT+HMSsRy0/pHYbwPLFdhhjGAO3bp1nBQ++mGgdamEsHQPNzilAwFzMpavKvC90S0kvB5oorh2supLffNkvGpeeELwpgQbmuXdOLpRKLFVII8eLX2ntL6wY7RlIsSeSbH2gGC70e8ao0CFm3FQZN/7mGXubwhLUeHRqra2XQ0FgV6aD4+42BMR4ueIAEB2aoDvM01Axg3RnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lisQP+TLfEQnpO/kQ1D6SirUFzjk70NyNV3O+NFZVg=;
 b=veVkJ1ZCk2HcAVw6U5XU8eOc1wsNZYCuZIirv4Mi5BCEDH1dHyj+jlW2Om4Z3sDRcutmoL4wQdWL54iZERof7dy6JtAXXm1h9HD2nEN14Yz3XW0g9QdGzlrkdc+hOBUixYfhZReWbICEd3RPywNfxZvjdnRFDE104dbwEvwqZvxwsBnSpPHDkwybgYv+7aC9W9izVBLF8D/T7Y85cub9OaSokJc50Zd9fzrSXns639U8esYIaD4UZEqgqTGhx6RC8gEmQvarrz2EvxnhS8+DmrkyCxTnTyARbRVtjqFRKE3q98L4TI1oUh4KdNe0VSTBEZxkdBTPv2ehQkAuTX95/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lisQP+TLfEQnpO/kQ1D6SirUFzjk70NyNV3O+NFZVg=;
 b=Fz1KlrhckYwOhn/TuSwap36HRnOHr8wykjXLKz9YWdgHlbl0DSYIZmnWHqj4KOSkKLYTNHvLdpoqzfQs6Q/H0GQYh0MBUcJTZ1M1hVHKAFmxVS/VwICPJtw2+hz96wczEcFrPPWxaKZ0n2INVyEVrJFQiv8nE7nHZtTYRcF+qLhQKqUymRphcyW6acweIbcSgsa5aVC2isOQDzRumuqG53nNpckvaUVjDWk8RURa9DhKWBQInAXNEiRa02PJO6Iz8Ixvc2DjfF/s/ZQU0++73LwElH50PrwDKfl/VUlhXiTT9g31RpW0/gTTPCUnemp7ga4TbbKN3SAchVR+UFBZgA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v2 18/23] xen/arm: vsmmuv3: Add support to send stage-1 event
 to guest
Thread-Topic: [PATCH v2 18/23] xen/arm: vsmmuv3: Add support to send stage-1
 event to guest
Thread-Index: AQHcuxeaOPcMHzAGC0id97FOvbAiNg==
Date: Mon, 23 Mar 2026 22:51:36 +0000
Message-ID:
 <ccf1795a04d97cfec233cb4524822738591f5cd2.1774305918.git.milan_djokic@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774305918.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|AS8PR03MB9699:EE_
x-ms-office365-filtering-correlation-id: a24dc277-7beb-4ae7-7225-08de892ebcbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 m4gpx7Z8kr95mNOzR60fPE0+f5fPwUkZsxfU2sWJhEQc3r/Vgx/4l8Is21paVh4mfwMebemnCs1mzC43wWNIu8tJRXOvJ7zujSlAzYEBI/vlW4f+Hw7ZGwamW84uGF1kH0wh7vkssqMKj3uQ5QTjJCM61lmUXW6yAC7RiQa1rZCPWP2jLdfMpHBksnloGdKYOxjiFmzwrqcDTSLMNggK2l2p01fYr4sIjJlyR1QpIB+FQCz9XdTR1JmHQtQ0IWJ7FLR7EEa9vy7kuCH+E7WqDCVi8Q2OaaPuY0MZpHPzMRKGzQBkjQtRvCbyikfXUd19e/9u9SaNN59CK5SHN43lGR+VmPyUclSC6tfTjGRq2fzmS9GPDnOyfb4F2QhhADu29OZfEP+4xIkMgC3K2bwG7hBcHyltSsycBcuSVnrCJwqEz4IFFV42cXUOThL8ru5/cBjAlds8fsgtoheC+n0bUwy61BK/A0W+h6pjXWTJo0wvBOxAp6nvlTcOEBgVvc5fjHVx2MvykRcSqYUKkcxE4ydz7Spa8SNTjwg3YFa/YDC/kdYbiUSSOhn3BkBuuAtQWDKeu9byS2ftWOtW8wKhcFsKdXu8nYYjUwOD72AgCHhb4BZnAGqhCuNDn9OhrNW9cwWw/SaOWcq/jOJF0u7yje0Kzmh7tLKtm1hLbt752DatUIJxI4t0O9/J7PJW/Zxt/B/UjbEATkhWv2LdI8phqKod+0Bb4q9z5aPEpl+xNscI0Yv3tJbozVEiK02YtBWVjBtZY5xPj1u3RPrZYOrLjXlvI5LaEcaxdcG4Z0o/2qg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cj23hGS8HOdTT28YA37k4Ad5v8DPVt76QYRE71GJze9VqycOw3PCgQvrOz?=
 =?iso-8859-1?Q?h1Skf2pelInO2lpAGwNLJztKz6dwapbSbQ3AvrQnikbdcM+B3qlAYhlRVS?=
 =?iso-8859-1?Q?Dme00XcMlWCifKbkVs9Z2SlLKshJRXICI20t43vlORLyL+Pfhda2eAL5CQ?=
 =?iso-8859-1?Q?B1uAPv70P2BZdmQshVnYgW0Q8P2IL39oURob2J3B4ZWYQeUGvDW5Gm7Luv?=
 =?iso-8859-1?Q?h467J+83rl9EH3tUl3dr+fwZegd4SO136knRk4vPihSxX1X6SzJ4lv9+m8?=
 =?iso-8859-1?Q?lYvKtUKkWCFL8p0BlFkWyF0PNn5MyylaztFdscZp635KQRNrFN5JDaMsP+?=
 =?iso-8859-1?Q?mKLvVIceIYdQjOGbfAch7CpZGg/FHkNAJmYLDtVzEeX32YTdDp830xkGa3?=
 =?iso-8859-1?Q?a1TqdZchMoYFLPal8J+9fV+gy4IIJ+oDz+ETvV2XJZHGnyfZv395aQHGSt?=
 =?iso-8859-1?Q?AvwN5ipzAgNGlpmy0LkR1qdL7TGRtX4mig0V6RSCncl2T7/6zlUP1t0NKm?=
 =?iso-8859-1?Q?TqPbCU3TU7Kqy3zWWysfTtVuhJBgTdL3WWtHSJ9qH6YiXdoUZ67VXc3kf6?=
 =?iso-8859-1?Q?kjcQMe44Xd91bYlVY8Nwjw085moqTHN5vWAI7Kx5G3NzcTutXP3duGZv/h?=
 =?iso-8859-1?Q?lW2eK0KGFCTdbIJsgMSz0+UzhTaTPAyfHqQnyVcmpFimSeKQhB695rfe1f?=
 =?iso-8859-1?Q?P5ocLvLFbx+lSWuaA8STKxk3EGS8Pla2/lhxbtzSfcDeV4+GzWdHYubxYi?=
 =?iso-8859-1?Q?H8we7NJMkQP3DFurprbP6n/V2hm8z27VdXQ6JaZOJLYPKjVgvvAAC0t7Vi?=
 =?iso-8859-1?Q?KTjtK1mh/NI8fd+F6/Fq4Hfpxbgp/8xrM7D9Y0GO/W6X/vj75u8CRYaHP7?=
 =?iso-8859-1?Q?IBfjsUTtnVb3NLpxqGqvFkcR3shTtuQ5wIGHUrFOZcouUG8S2j0e+Wkn5L?=
 =?iso-8859-1?Q?VEXhly23zK4kS6Hqsv5nqy8j14j2bfFRMFMWqnE1tjs2OKNVmuyLKFr6n4?=
 =?iso-8859-1?Q?rnsCtuDXdd2f5RjhBCBpLibahwyHpXgpQ5qqg2+kvu3i4i1x3d6yvniARb?=
 =?iso-8859-1?Q?5N2z+HrAbThKvTruwaegtChD2dAp72Jbjmxxn3Xc8opaWPndhZB/JH6nUZ?=
 =?iso-8859-1?Q?2kUxAknPKfN7CWfArjyYfF/Sa/5NVhiUQpr7yUGDTVj/FmQXc5Yv8D57DW?=
 =?iso-8859-1?Q?PGwRss7DQtSWtcf1sM2eO9PRxLtTHVQowlQ8EqhUYvJGEB5VtAc7x45dQs?=
 =?iso-8859-1?Q?oI7ccj6SkYBAPTXJYo19LnG53xjRGOf6RgmvDQVVqChNoIZel4uaIiYxgc?=
 =?iso-8859-1?Q?WdnXoUYF0HFmdDI3RLfi+c5pLTvswT1BWKLvdbr+9tl8GsyNyQGoAr3sau?=
 =?iso-8859-1?Q?hXxN8S/M2wqOaFG2kHCbylnBJsVbVcQwPFiGHHuiWy3rMto05agQQOhkjD?=
 =?iso-8859-1?Q?Jr4ECjvfhZMk6Lfxm3GdYI+ZFNCqgzTYYEXYWlL8ZEJpcaymOJQkT9U9yP?=
 =?iso-8859-1?Q?Lmf9QC+yUHjbp/c8yGDdgMMKmDAxbpzYhigqwJR3u117Sdv+1nOKhLnCeH?=
 =?iso-8859-1?Q?VnJSFbakVoJ2siohYAfGrhKPEOco+LuS3OFqfYLY0KQxmg+0PYEeDzet8+?=
 =?iso-8859-1?Q?1Qv76HNQALulEL4fdRpjln0xany/iuWIHZn6cya0Bb0GGjEg/+y9xxOEHp?=
 =?iso-8859-1?Q?lCitKsT/JEMJOvowcCdsCm0GaAXlr+NCtX6SeRbyr7tkebhdZX4I7tO0IM?=
 =?iso-8859-1?Q?99NC3M6p/nHffsM0FgslD7gT9ETW1IfvgK5ZSrhXLv1566yGxF8AcllwTD?=
 =?iso-8859-1?Q?C4U2L/E9DplEcT9l0rTNzFG9Th3jpZE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a24dc277-7beb-4ae7-7225-08de892ebcbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:36.0976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xkquCQcEiQjiQiqxz3jKGjpNlXeyylfYAIfK1k7Mdhc9jOCKQ8hQz015gV31RqDWxZkhk9/T0q2fIxcKh2uLsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9699
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
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,epam.com:dkim,epam.com:email,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8B2E52FE944
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Stage-1 translation is handled by guest, therefore stage-1 fault has to
be forwarded to guest.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c  | 48 ++++++++++++++++++++++++--
 xen/drivers/passthrough/arm/vsmmu-v3.c | 45 ++++++++++++++++++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.h | 12 +++++++
 3 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index cf8f638a49..4c1951d753 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -869,7 +869,6 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_devi=
ce *smmu, u32 sid)
 	return 0;
 }
=20
-__maybe_unused
 static struct arm_smmu_master *
 arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
 {
@@ -890,10 +889,51 @@ arm_smmu_find_master(struct arm_smmu_device *smmu, u3=
2 sid)
 	return NULL;
 }
=20
+static int arm_smmu_handle_evt(struct arm_smmu_device *smmu, u64 *evt)
+{
+	int ret;
+	struct arm_smmu_master *master;
+	u32 sid =3D FIELD_GET(EVTQ_0_SID, evt[0]);
+
+	switch (FIELD_GET(EVTQ_0_ID, evt[0])) {
+	case EVT_ID_TRANSLATION_FAULT:
+		break;
+	case EVT_ID_ADDR_SIZE_FAULT:
+		break;
+	case EVT_ID_ACCESS_FAULT:
+		break;
+	case EVT_ID_PERMISSION_FAULT:
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	/* Stage-2 event */
+	if (evt[1] & EVTQ_1_S2)
+		return -EFAULT;
+
+	mutex_lock(&smmu->streams_mutex);
+	master =3D arm_smmu_find_master(smmu, sid);
+	if (!master) {
+		ret =3D -EINVAL;
+		goto out_unlock;
+	}
+
+	ret =3D arm_vsmmu_handle_evt(master->domain->d, smmu->dev, evt);
+	if (ret) {
+		ret =3D -EINVAL;
+		goto out_unlock;
+	}
+
+out_unlock:
+	mutex_unlock(&smmu->streams_mutex);
+	return ret;
+}
+
 /* IRQ and event handlers */
 static void arm_smmu_evtq_tasklet(void *dev)
 {
-	int i;
+	int i, ret;
 	struct arm_smmu_device *smmu =3D dev;
 	struct arm_smmu_queue *q =3D &smmu->evtq.q;
 	struct arm_smmu_ll_queue *llq =3D &q->llq;
@@ -903,6 +943,10 @@ static void arm_smmu_evtq_tasklet(void *dev)
 		while (!queue_remove_raw(q, evt)) {
 			u8 id =3D FIELD_GET(EVTQ_0_ID, evt[0]);
=20
+			ret =3D arm_smmu_handle_evt(smmu, evt);
+			if (!ret)
+				continue;
+
 			dev_info(smmu->dev, "event 0x%02x received:\n", id);
 			for (i =3D 0; i < ARRAY_SIZE(evt); ++i)
 				dev_info(smmu->dev, "\t0x%016llx\n",
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index a5b9700369..5d0dabd2b2 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -103,6 +103,7 @@ struct arm_vsmmu_queue {
 struct virt_smmu {
     struct      domain *d;
     struct      list_head viommu_list;
+    paddr_t     addr;
     uint8_t     sid_split;
     uint32_t    features;
     uint32_t    cr[3];
@@ -237,6 +238,49 @@ void arm_vsmmu_send_event(struct virt_smmu *smmu,
     return;
 }
=20
+static struct virt_smmu *vsmmuv3_find_by_addr(struct domain *d, paddr_t pa=
ddr)
+{
+    struct virt_smmu *smmu;
+
+    list_for_each_entry( smmu, &d->arch.viommu_list, viommu_list )
+    {
+        if ( smmu->addr =3D=3D paddr )
+            return smmu;
+    }
+
+    return NULL;
+}
+
+int arm_vsmmu_handle_evt(struct domain *d, struct device *dev, uint64_t *e=
vt)
+{
+    int ret;
+    struct virt_smmu *smmu;
+
+    if ( is_hardware_domain(d) )
+    {
+        paddr_t paddr;
+        /* Base address */
+        ret =3D dt_device_get_address(dev_to_dt(dev), 0, &paddr, NULL);
+        if ( ret )
+            return -EINVAL;
+
+        smmu =3D vsmmuv3_find_by_addr(d, paddr);
+        if ( !smmu )
+            return -ENODEV;
+    }
+    else
+    {
+        smmu =3D list_entry(d->arch.viommu_list.next,
+                          struct virt_smmu, viommu_list);
+    }
+
+    ret =3D arm_vsmmu_write_evtq(smmu, evt);
+    if ( ret )
+        arm_vsmmu_inject_irq(smmu, true, GERROR_EVTQ_ABT_ERR);
+
+    return 0;
+}
+
 static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
                               uint64_t *ste)
 {
@@ -742,6 +786,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr,
=20
     smmu->d =3D d;
     smmu->virq =3D virq;
+    smmu->addr =3D addr;
     smmu->cmdq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_CMDQS);
     smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
     smmu->evtq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.h b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.h
index e11f85b431..c7bfd3fb59 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.h
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.h
@@ -8,6 +8,12 @@
=20
 void vsmmuv3_set_type(void);
=20
+static inline int arm_vsmmu_handle_evt(struct domain *d,
+                                       struct device *dev, uint64_t *evt)
+{
+    return -EINVAL;
+}
+
 #else
=20
 static inline void vsmmuv3_set_type(void)
@@ -15,6 +21,12 @@ static inline void vsmmuv3_set_type(void)
     return;
 }
=20
+static inline int arm_vsmmu_handle_evt(struct domain *d,
+                                       struct device *dev, uint64_t *evt)
+{
+    return -EINVAL;
+}
+
 #endif /* CONFIG_VIRTUAL_ARM_SMMU_V3 */
=20
 #endif /* __ARCH_ARM_VSMMU_V3_H__ */
--=20
2.43.0

