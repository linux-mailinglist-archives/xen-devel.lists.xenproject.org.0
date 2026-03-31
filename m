Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK3FKvkoy2n/EQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E57363330
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268278.1557692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHP-00054L-9a; Tue, 31 Mar 2026 01:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268278.1557692; Tue, 31 Mar 2026 01:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHO-0004eE-1u; Tue, 31 Mar 2026 01:52:30 +0000
Received: by outflank-mailman (input) for mailman id 1268278;
 Tue, 31 Mar 2026 01:52:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OHG-0003Jw-F2
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OHF-00HCrd-Qu
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c4-e002-0a2a0a5209dd-0a2a450a9b40-28
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:21 +0200
Received: from [52.101.69.85]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28d4-1772-0a2a450a0019-34654555cfcb-6
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:21 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:19 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:19 +0000
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
 b=E+yp07b8BGn28fCTyp1rf7kdRbPk1rOvgUbafXfowDtZ1DbAz2DfrhqKYyizZH5Gxom/07GSW2PqGA+8EDps6/lNbqLdlrA6Gt20L/2IyjScW7+NTyyyGmmkNctyEwvzlqtt9SNmZEzGFIcznAT4edpVRFaYidRpKEL/vmgN2LfACBk1CQnV+fyMxaOJ6J+J6u2FO2fL46otyPLwDqm5cQIxLPVtDr9l6MbUE4KBszIGAlDkdbyxA4FmXExpMyC9RgDwqSryAkl/atits5TRiKchba2P/IB6SCvJ0nHfCkngygWypmyQHNNJ0fUu0DMwrfxZpFzuBYR1fH09W4DMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5LU7iG+kNVwY/pJJXqeYx+mIUucgqu7L1cZI7G6HOQ=;
 b=R3KnFfkgBVnTtJ93snoJfXugIoq7SLUrqyBG9uIDpDSLn0AHpk/mgUGiWPTVVKVoISQ6qVTheUi1RbVY54kKDC3k2AcqF8lA6D0twA3OV/ylCT28zzBcKs+0O0eGqA3AX67gYa9HMrqKjJ8UKNStVM2ei0EvAVCZ2GTq8Jlm0J8dgi1SM4RpvPFjiijj/vWXtr5NCzWBXRtAkl8UvoNQn+TBF/tWI1kiTwipMSzrcCNzY3oAkOAQoF03XlSlzoe6mo3lAbkH2Y856TQXzJH0Y/+Fh6skMFpXCdn7g24nT29w3ra3vxFQVob7cwGxXelh2x8XP+ax6k8RiVtN6fR9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5LU7iG+kNVwY/pJJXqeYx+mIUucgqu7L1cZI7G6HOQ=;
 b=MRwmrzGnvb3ujpQek8oDU3KGzziplCJOqIZVYYarr9oKrpxLpHHIWkYRF+l648VBjVCf6sbBxcZgMsnMXrsgnuuDfeEsUfP/M+LEkyLsjfs4VD7Q4qsxzCg38DUAPhGGn+vA+YFK3OPddQofNKTM81lhgAo+QyAdHTSwhvILfvF+pwzkN0mPvMZxwKTtzGkZdNd4M8kJ9GdKTvLVpY5Vazafgluc8GZ9OMIYjIQpXwQ1yP/3SiFz9H1zrWFUr5RfJfhpjJjXAUULhaUiLCsMEIeenF/x8vkEKadx7QnOnotZg+v1T2iQASCB0jnQ22RNbObGzyq0c43iXUxe908Bvw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v3 20/23] xen/arm: vIOMMU: Modify the partial device tree for
 dom0less
Thread-Topic: [PATCH v3 20/23] xen/arm: vIOMMU: Modify the partial device tree
 for dom0less
Thread-Index: AQHcwLECE0hodS4DIEuRCh1Lzu+9oA==
Date: Tue, 31 Mar 2026 01:52:19 +0000
Message-ID:
 <2de0eddeb862a7d9f0fb55c7dca1152591d71404.1774918270.git.milan_djokic@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|GVXPR03MB11035:EE_
x-ms-office365-filtering-correlation-id: b3b72b96-4a5a-48b7-8f37-08de8ec824c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 6GunLjadxb6Uxigeb5AGDQJHBthmVL1CFXZtP7WcfWOYEHVyGqrVd6TJuvhr3+wOpxyaBtdhIFM1nyFg1G/P2ePrJiBHIjTD+hyc0b/KNhpIWbiDtDMH/In0FtAPyiv0zmOT82ifKQOQMCWnrjX8LKF+1CIYSPbyrldwN1pPt4HE35e7JSBXMGNxPxxvZyZTY2EA2MzxztRgejfWfwIoIHqmcnt4Vqx8OAqjRocntr5G//YGpqZ5b1+LTQVcfK3WAnxNNK5qM/8RZfMQDk5I36mMc6222Xe5DkeztyjjQeoSO1NyYPgi0lNQMeEGxW/tlx+BqgBNu9rKofUUnrXrr652GdTJk1mcWS5Xd+AFuZrjKETc2v9Xf8W74naMMLL2/z6mms3J+xS+UcvjeMVu0TpFWol2H0J+9S29n02xkbQIjCREXPm1EZTf1Rz/w+/JvZvoMK/lhong7Kza+t35H7lsQ1/hC84c078eDHsIQMwGNThhQM4Q0o7NM3dmySmhNyu9GnbX770dKGDJ5ctsHWaTrBpqAS0XwsujiVdAbJ03VxLz4AwcH3vd/imey5QsJyWZJHQHA4jhfuD6Efm8I1JRRxXy7cC26FQ7yN/XzLeaE5xrQLyXVtLDtSY+lyViI42PaL8Z/ohKXjv/1kpbypqrPjvsUt3ehMaubz/7oewpDDBWgePkeN49UAEYKaRl6CsgMIe1dJ5Xb85jbnn8udD2Z+t6Wtnx4Maq1d51b/e9bsda4/NsXq5B/nYt496jLz3PDjvECsyiBQeamG8Kx6eVrGFAUp79lulitoj+duk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xSOlBG9qXZQ45LL4rT6M9WwLeob43mjtBkPlaD09sD3tvClCdzD6umtFh6?=
 =?iso-8859-1?Q?7qbfTxlIeY8ikdYLzkvAFCMGZNLBsAD2tkks5KY2eNNKzG+kAoN+EFskY+?=
 =?iso-8859-1?Q?tsbEu7EwjZM8oTpxrspmmZoiTCFtvP8tO/DwdjFMOOSELBV/WyjQUSNBVO?=
 =?iso-8859-1?Q?1GpsClZppNdNsttKJg2oaNW2Iw8EfZiBlrHpAujEC6e5akv6ziH12L902M?=
 =?iso-8859-1?Q?1dB3t86Esnr2LvHtLbIpGOGwXWwqSh+iSB8U7venpJm8hlMMtoxPW4c/1v?=
 =?iso-8859-1?Q?lYoPHgxTV3rG7bBEB8UHfUW1s0ErTtFqhP7svUSXkjuDw+JqTACjRLmiRT?=
 =?iso-8859-1?Q?TetTIMcoHkuwwHCIw+rLdOO9pky9AOLHC40I2OWPZ3RpuW4kMWkNwKv/gM?=
 =?iso-8859-1?Q?gLtx8//U9GozsgvaCpeqctP+ZhBjUVlHFgvMnTUGtRyDiv6YuScSPKIxL1?=
 =?iso-8859-1?Q?qnkGlxYCSgbQ3qbBWV4PTgZCucoJPXBZDZPR9Qby2AgIdYeRqHObmZ5h+K?=
 =?iso-8859-1?Q?8+WjvYPFEKsS9Y0Z2hEyS/+pbzOFKTcnhu0zHw8yQfjsSKJC3JUy+g/WVM?=
 =?iso-8859-1?Q?hvJ9t9bLkY4elJ80hsIm+3VKXJj8mT0rLaYiNn0in4CY1qjmWvHOh0wSW9?=
 =?iso-8859-1?Q?3noYEGWmCsKyNy0Acc+/zLM8MjlxMbSey4Z6np1SjXkpu2V0qXa6CyVIqM?=
 =?iso-8859-1?Q?c0LpZ2DXdHs77VM2fsC3M3Wt8kThYBxdqwO1sb1hNigSUbZKzqu77p1Zto?=
 =?iso-8859-1?Q?EgtAF4+hZ7xHfJtr+FgqAFv4WbxlJI5CwghFxx6IORgegiRjAhUk9l7J7N?=
 =?iso-8859-1?Q?uECbx9LVIIXnH633L8ZiWRywG3lVx39lej0K6/xCUSr42DXgZ4Orbk/dbz?=
 =?iso-8859-1?Q?3Y+GYbuITjMBMPifbT0yfFOeSqvqJ+WE274P2Hq1mVm6kIJn9NJTIbAEMS?=
 =?iso-8859-1?Q?Sc2ELEy/hsjD55NRZDHGD1FJf2FKenBS21sAD/1N36+IdkxkJgikIkHxNi?=
 =?iso-8859-1?Q?JniCuNnovQrG9l2y/4nFc1JruE58v7dA7tFQGbiZt/+O72GX3qsB4DTyx6?=
 =?iso-8859-1?Q?w9axCDBgLPOA3jQvZXWeR7Ra/XpVhfmDi6BIOLi6F5Bpk8FQaudZKowxl9?=
 =?iso-8859-1?Q?nWVOGpnMPE0l5OTs9WqP+T8i+YMX3xowkzH6D4LPjtPYsGkFHyyw9BvwgW?=
 =?iso-8859-1?Q?mFnz/bm7b3wgwyKPQCjKloW6FNcwIz+xWe8oHZKQbhoMXCKLzJzgpgVgUG?=
 =?iso-8859-1?Q?7Qq7tD2QjByDpvvdo48ZXcT/KHpGFNiw4JOXWEEPwN/AGKFMjMPBnQcWYX?=
 =?iso-8859-1?Q?ov4iUUJy9rlqEd8BSmowFkPKj7MFJ64V2Eh9QYIBXEBXVf87CJZvTMhpYR?=
 =?iso-8859-1?Q?cKhgCRclJ4ebeIekcoit6yZWXfNlaEYdyeAu/KMIKh17Eeg+6X4AC2cZH9?=
 =?iso-8859-1?Q?0vcehm6qEv/IpCB2dedSK0jsR5Bs5fe3NGNC5jKE4Gp4Xg821u91arB4oF?=
 =?iso-8859-1?Q?GSXB8VIg/ctJjQrtqPI5N1X7P/BaYYojF/3xWXVAl4vxKEglR9yqmaJirF?=
 =?iso-8859-1?Q?I7CsA0GckF4EEyOGMbbIazQ++q8+0j4Na+QzqqMCRVu9Qu7iocdYT3Ar5b?=
 =?iso-8859-1?Q?BZ9lwGA71icgVyKzFAWcrcEHqyYnbkA7QMnRwP+r4cOH5jjlwhnssqXZp8?=
 =?iso-8859-1?Q?iqFIwBmSpVOMo1Fi0z/PmVJGq6Fa213AcM4D4IBKfM8pxxkf+2HXBX4oaz?=
 =?iso-8859-1?Q?cI1cc7hxiXocBMpXPVS3oGB5JNbwYyzhj00WnFqeCH5VWF6pTpsx81pkEF?=
 =?iso-8859-1?Q?G+y8V4P3M+pmI5pHK8iUPe+KvqYdaFc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b72b96-4a5a-48b7-8f37-08de8ec824c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:19.4475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TCZW1OTgXGK6ZOrM5XSteXNinxtmWkqmP8BmORczSiNL3WOE9Yt8pGqWC9Sm1FoPpcYHQpAAodnCGCwc2lNU2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-4011c0/1774921941-BC0BE900-1A5C6744/0/0
X-purgate-type: clean
X-purgate-size: 2444
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 60E57363330
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

To configure IOMMU in guest for passthrough devices, user will need to
copy the unmodified "iommus" property from host device tree to partial
device tree. To enable the dom0 linux kernel to confiure the IOMMU
correctly replace the phandle in partial device tree with virtual
IOMMU phandle when "iommus" property is set.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/common/device-tree/dom0less-build.c | 31 ++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 840d14419d..4b74d2f705 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -318,7 +318,35 @@ static int __init handle_prop_pfdt(struct kernel_info =
*kinfo,
     return ( propoff !=3D -FDT_ERR_NOTFOUND ) ? propoff : 0;
 }
=20
-static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pf=
dt,
+static void modify_pfdt_node(void *pfdt, int nodeoff)
+{
+    int proplen, i, rc;
+    const fdt32_t *prop;
+    fdt32_t *prop_c;
+
+    prop =3D fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
+    if ( !prop )
+        return;
+
+    prop_c =3D xzalloc_bytes(proplen);
+
+    for ( i =3D 0; i < proplen / 8; ++i )
+    {
+        prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
+        prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
+    }
+
+    rc =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "Can't set the iommus property in partial FDT"=
);
+        return;
+    }
+
+    return;
+}
+
+static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
                                  int nodeoff,
                                  uint32_t address_cells, uint32_t size_cel=
ls,
                                  bool scan_passthrough_prop)
@@ -344,6 +372,7 @@ static int __init scan_pfdt_node(struct kernel_info *ki=
nfo, const void *pfdt,
     node_next =3D fdt_first_subnode(pfdt, nodeoff);
     while ( node_next > 0 )
     {
+        modify_pfdt_node(pfdt, node_next);
         rc =3D scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_=
cells,
                             scan_passthrough_prop);
         if ( rc )
--=20
2.43.0

