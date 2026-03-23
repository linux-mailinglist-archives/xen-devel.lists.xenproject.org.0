Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNx9MQjEwWkHWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AF22FE927
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259641.1553011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7J-0008Dp-UP; Mon, 23 Mar 2026 22:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259641.1553011; Mon, 23 Mar 2026 22:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7J-00089i-Pg; Mon, 23 Mar 2026 22:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1259641;
 Mon, 23 Mar 2026 22:51:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o7I-0007wO-Fh
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o7H-0000sX-Rp
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:51:23 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c360-5cb7-0a2a0a5109dd-0a2a4502e3b2-44
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:23 +0100
Received: from [52.101.70.72]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3eb-63bb-0a2a45020019-34654648d8b3-4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:23 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB7653.eurprd03.prod.outlook.com (2603:10a6:20b:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:21 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:21 +0000
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
 b=nI8SQf7hRUS008Vf8vbxYc3YdqvgU1knGZIsZIhfA40qSbnSeUyak2kGCMPf4cmaRoYEN3/knsdeVE94idsx9d6YIPvdMlsXfU7nJ3smQHwlUFVOEGCXzReQMKB9itV2Jgq31eQmRzovmbHYdsAnvXnfiDEM/hcPFdB2zUW4co96y3y2WHDny1MAE0LOFojPYdoGhsDx4xqwuaDhTlkHcypJzYHab12bzPEhig8GwS35iNPymwNMmAXn24pU/ZEjQB0o2EMdz1PTcmHOL/mQ6y1fdupz+DZKluWkLO1LAt6yt9q883pKPY5rJw6Dh8z26vCMvVS9fgSmNy7cqK3n3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwgosUysiRpjZuWloQCjW+LxR3bA2OFErZFmVHnQIUw=;
 b=hZaH7PfAz9g+6wdlclkWHKzJQHx3YmmEOXA0dHB2mASb8f2MSBVAn11H/Agr7UAiD+NubkwWabSZ+yKLBV4QRbdlEJEm7hH9S6XY11H6ZkQX9aUqAQPTrNJROVtkfdYQefd4DkTcc8FmsUpye2mRsq6jdgGBV3qvIt+20ne1/+xQ6+F9POlWPvk+UGGDwmb6/gxODfPBTDGFAmgpR3jlndtu5ynQ8zqROBAyfV9nfhl/FXjcuiMcZM3Sh5/8IOp75WV2pR9h2IzchZt2NEh3Qv4oBIQH/dXxQaZZKk+Nr1Q4puPj0XeZ3T07PkvflsY7xe05NGtI72c+C+WtgpiOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwgosUysiRpjZuWloQCjW+LxR3bA2OFErZFmVHnQIUw=;
 b=JJx6YlU65OgvREtTxVzsHVbJ/Y0rs3zvUNVP8Fb38xOBT2FqVdazmqbpU6+ymtOb1V4l8TLsjXc8wyOg3rfw1vDFMIy477o5TXJQ7/Ua72koX0T6kutU1k87W+EpObiGPaDq4xp/lIkA+G1u9AmD9Bg2OZsYPoul7ziRT3Newuh+CcYNvzR9aI6mJPKT8VoQYGr0DUzTON4CQ4fTbwuC3MI6WsgePR8qktsankzdohHxRODgI+HiHaFpqrdDu3ztwGBNNiisqWawh6ub4pTI21JNuwAX1NtqO4CCu8kHi8GipEu8osGFIiIMBna74yAYgrkiwY+qC+nNrjcHxP3cFw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v2 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Topic: [PATCH v2 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Index: AQHcuxeRR7+UskAt3km+pnjx0ifivA==
Date: Mon, 23 Mar 2026 22:51:21 +0000
Message-ID:
 <f20ce7b6b230ee234c9a278a6d69330f1abb03c1.1774305918.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: ff2f71c4-7a87-420b-551b-08de892eb40b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 IJBDxKbAw+GqqjAgZA8EZx94Ux4GsxEZhv1YtueIGD54g5SiZQS2GzU/wpKwyW4tfwcdNFMJl20UWmG8D1qNLMxJnyy4zxSIWlGoUJUGjK+uFZ17/GZbaKAutFpHbaHk9K5A6quQ48qzwPGz6BiOdMOLm6uMLHq2OdDgr1pPG4xADbcIeNfFFficrTfHYkeOBLeambXAiD6UDDQYNFQvClXOjiGVXs3l3Z4Q5+ueBsa+hZWXgtzt1/na3BktrK4PT4WuamWGxw6mblDopifhBL3PMksldyb/CRv8WkTTxSz4/sUb5BBJXW+LrUKzTEEaJ2WM2HvohoTQ+i5t2Wxtj8q+M4OaaRwL3wfqk+lLHTQgk25pxuJbSRHsFteUc0v4MVAxTzukk5kZ9rKYEg3PWjQhQjTgLJfTiiaFTFejCZiu+6hLxGUpeCH90a92V3T/IcOfavchuPbTDwGoIFbZfGOWxrOp9HCfIwtriMr1TNVeQdHIB0uI2Wedk1pJnYZLuOFOTJ8+rpZvZxgUsupKS0BbnRvPca5NbrGsxUMzuHzeJtrDVixSfoq9UjjxrNuQStVIBg6mu5J8lKZoIWeiTzJgDMrzrZ1Og6JsvJz4JCgzyJ8oLqxPSvxy6PWm+6VUULxYp/Xu0z5+ziiFKW+q8YXPPc5uwPP16HgebsXt9GxoIN5y4owtDXbtKCKtyT5t/9TnUPghfF/w7FQ2QjzoifHRpIsNXMS3Zm4/FuuwrvizQ/tAZLGH2SgqLP9AcvrWGXqoEt57ddVuaIDrEUMqNcDfa6IKZn0XIWocjyEL0Ro=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AdpApo9e+oc5tcfLhiBs3yBwxkwMK2GOwdRpiKEESlWW+9R0vq5uLACI2q?=
 =?iso-8859-1?Q?/VuUJRbLaAuH8InOCnJJv1fKQqu2xliSzAqLY5aFBtJqaq7Axf47Flw1LK?=
 =?iso-8859-1?Q?+V3CDLhAVhUOEe4yE8uVXod+GM0LuePa6iSeQFjmnlejZtDZ1fofkeIghj?=
 =?iso-8859-1?Q?4eVQDrEilGheGtpHuj4GzYmG1GNYUqxh+nRDq8yrFssuGazVS7eQtXuIAi?=
 =?iso-8859-1?Q?Sw9GFZQ9OlsdEMEQkUbTRlOa449Q4o0gHNFfNtBFFtbRrun/Byoj3MMNeE?=
 =?iso-8859-1?Q?0FepisRNE9DEGflG6yx38Gd5yMoEA6If9LZ00AzhwtKl6C5SS57RO/4zdp?=
 =?iso-8859-1?Q?2mYs8aZqCbHNExCZC/Uq+qbv6b6I2BgcxoV/+r8cUdLaGYorbLfkFdcTTz?=
 =?iso-8859-1?Q?BZ98vULQ6k8kmGU21QOx4dQPsrFPAz1CntpC2gR3RdcKzCiysH5/DGbMiG?=
 =?iso-8859-1?Q?bL8R81schozf6gwmtkXP+cRkbT/OFcD8yNlxo24LHf0AH+XdCVezPh2SoB?=
 =?iso-8859-1?Q?/2GUxbWUhAsIwSIjAq5v7bWmAe+Um16S4BMn+pzEbf8p/8QSdU297Wm0FT?=
 =?iso-8859-1?Q?dyFtWv2Kybp8oYK2SkYyLJb1gBf2uyKzAMvpCNLfZWc6zYJss72MRSbBbh?=
 =?iso-8859-1?Q?ksByivX3cbhwuv9goNH8tVJ2NTATN1zglTpQhBGMvA0GJb5jydBqU+XOBo?=
 =?iso-8859-1?Q?koxxOUJzyxd3OVyr3kvHPe01EUyhfhThB798Z3Q5lVzENgvs+vRbF+JD7p?=
 =?iso-8859-1?Q?ugLrnZORnGhsVqZHk9Zi8emm8UhbMafwcdoRJpbVDUm8tkgk/bLgEVHR4/?=
 =?iso-8859-1?Q?MYg+ZiXnokcH/l60lnQl5r/KWHFYLovQHf2H5yzTi6VmYaDR+hSxUsGRaD?=
 =?iso-8859-1?Q?KGWMTgMb6Llgvhke3kZiLSJ70Ah33YUbQEseZ9clEbK98gmLoww0JvQezV?=
 =?iso-8859-1?Q?ZxaCvBDTwsqCEjSuIRUMrieoQpjjDb5RfYFEuoHcVDGtec4Rdj7bsVns4w?=
 =?iso-8859-1?Q?lyX3MOhMULX3C7cAQmLbI/UTmku4kjUFV0Sxkrc1lfH70FITUL5wZ/9m90?=
 =?iso-8859-1?Q?CJQLT5nG3SfEOZ4x+gAfTMBqxjzaIINqXDktRfMmDXq4tuJq65TwisUOmq?=
 =?iso-8859-1?Q?2Lq18GNVqCgNVKTgwZndRgrdACf36sNvqVgZeFfXJVUS12R0uLh0ZmOjtQ?=
 =?iso-8859-1?Q?QbPWAnM/O4oD+Y4nbhZz7sZkjCqFtnRE6lCPDL8jz+hr7UtJiK8inYhrpT?=
 =?iso-8859-1?Q?BCQmT6Yr859vz51W8nODORNGsaO7ifPuYZK0UHMJJvlyG1yVrX8Sz9f2iZ?=
 =?iso-8859-1?Q?rRU57sehG1yGf/dAqNkZ7YV8KbPLBWlf79MiNfLwtov2QNG3920cO0U9qD?=
 =?iso-8859-1?Q?+DkL66KfcUDGCXyiwP9NGRaUn7dzomERG1HldEHsElIcJHuxfNwqohFzTH?=
 =?iso-8859-1?Q?xIWfKNVR16bTFuIe1GUE1hvpF/TtZeKjwwi2XTgl8qqv4c0JTcKL++bL6H?=
 =?iso-8859-1?Q?QZHr33NQ4wBQ2eJGOQYbWBJZRgqzxvwEO7xV2Z+CXzJktRMcRpvY422JZ5?=
 =?iso-8859-1?Q?yI6Enowh6ulq3l4SC1IPPrqyF1ZDeN6nbzLW5TTN0Qn2KY2IR1z6yqZVo/?=
 =?iso-8859-1?Q?TaM43DE5ji79Tssf1/KW0e6NAMRzV0V8erlu+K/EVK0OxCeRaCywN51ZsN?=
 =?iso-8859-1?Q?5E+jjSo4VCaDiahUNrQ+IxSsFuET1WII4D8l+EGzdRIVnao5FEK4rvDDf+?=
 =?iso-8859-1?Q?t0GW97LuswSDWGXoCcvY8uA/BToM+LVvOcp8DbHURaYrDYEAdJUJyBbx5L?=
 =?iso-8859-1?Q?+Y6AOQRmSQ6PfkZOjUXGjtfB9ELTztA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2f71c4-7a87-420b-551b-08de892eb40b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:21.0815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D7XKZncfJO4klT7Yuhv/nsqM/Ur+ScX5LFw4PnTPH81AAxQGESDx7/6C608gccsNRxqj95jA2V2k8x4MvOdZxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7653
X-purgate-ID: tlsNG-720697/1774306283-4388DDB8-239BFA7B/0/0
X-purgate-type: clean
X-purgate-size: 8907
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 60AF22FE927
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

This patch adds basic framework for vIOMMU.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/dom0less-build.c        |  2 +
 xen/arch/arm/domain.c                | 25 ++++++++++
 xen/arch/arm/domain_build.c          |  2 +
 xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
 xen/drivers/passthrough/Kconfig      |  5 ++
 xen/drivers/passthrough/arm/Makefile |  1 +
 xen/drivers/passthrough/arm/viommu.c | 48 +++++++++++++++++++
 xen/include/public/arch-arm.h        |  4 ++
 8 files changed, 157 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/viommu.h
 create mode 100644 xen/drivers/passthrough/arm/viommu.c

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4181c10538..067835e5d0 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -23,6 +23,7 @@
 #include <asm/arm64/sve.h>
 #include <asm/domain_build.h>
 #include <asm/firmware/sci.h>
+#include <asm/viommu.h>
 #include <asm/grant_table.h>
 #include <asm/setup.h>
=20
@@ -317,6 +318,7 @@ int __init arch_parse_dom0less_node(struct dt_device_no=
de *node,
     uint32_t val;
=20
     d_cfg->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
+    d_cfg->arch.viommu_type =3D viommu_get_type();
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
=20
     if ( domu_dt_sci_parse(node, d_cfg) )
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 94b9858ad2..37511c9323 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -28,6 +28,7 @@
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
+#include <asm/viommu.h>
 #include <asm/vtimer.h>
=20
 #include "vpci.h"
@@ -626,6 +627,21 @@ int arch_sanitise_domain_config(struct xen_domctl_crea=
tedomain *config)
         return -EINVAL;
     }
=20
+    if ( !(config->flags & XEN_DOMCTL_CDF_iommu) &&
+         config->arch.viommu_type !=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+    {
+        dprintk(XENLOG_INFO,
+                "vIOMMU requested while iommu not enabled for domain\n");
+        return -EINVAL;
+    }
+
+    if ( config->arch.viommu_type !=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+    {
+        dprintk(XENLOG_INFO,
+                "vIOMMU type requested not supported by the platform or Xe=
n\n");
+        return -EINVAL;
+    }
+
     return sci_domain_sanitise_config(config);
 }
=20
@@ -721,6 +737,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc =3D sci_domain_init(d, config)) !=3D 0 )
         goto fail;
=20
+    if ( (rc =3D domain_viommu_init(d, config->arch.viommu_type)) !=3D 0 )
+        goto fail;
+
     return 0;
=20
 fail:
@@ -965,6 +984,7 @@ enum {
     PROG_pci =3D 1,
     PROG_sci,
     PROG_tee,
+    PROG_viommu,
     PROG_xen,
     PROG_page,
     PROG_mapping,
@@ -1021,6 +1041,11 @@ int domain_relinquish_resources(struct domain *d)
         if (ret )
             return ret;
=20
+    PROGRESS(viommu):
+        ret =3D viommu_relinquish_resources(d);
+        if (ret )
+            return ret;
+
     PROGRESS(xen):
         ret =3D relinquish_memory(d, &d->xenpage_list);
         if ( ret )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e8795745dd..a51563ee3d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -35,6 +35,7 @@
 #include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
+#include <asm/viommu.h>
 #include <xen/event.h>
=20
 #include <xen/irq.h>
@@ -1946,6 +1947,7 @@ void __init create_dom0(void)
     dom0_cfg.arch.nr_spis =3D vgic_def_nr_spis();
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
+    dom0_cfg.arch.viommu_type =3D viommu_get_type();
=20
     if ( iommu_enabled )
         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
new file mode 100644
index 0000000000..7cd3818a12
--- /dev/null
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+#ifndef __ARCH_ARM_VIOMMU_H__
+#define __ARCH_ARM_VIOMMU_H__
+
+#ifdef CONFIG_VIRTUAL_IOMMU
+
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <public/xen.h>
+
+struct viommu_ops {
+    /*
+     * Called during domain construction if toolstack requests to enable
+     * vIOMMU support.
+     */
+    int (*domain_init)(struct domain *d);
+
+    /*
+     * Called during domain destruction to free resources used by vIOMMU.
+     */
+    int (*relinquish_resources)(struct domain *d);
+};
+
+struct viommu_desc {
+    /* vIOMMU domains init/free operations described above. */
+    const struct viommu_ops *ops;
+
+    /*
+     * ID of vIOMMU. Corresponds to xen_arch_domainconfig.viommu_type.
+     * Should be one of XEN_DOMCTL_CONFIG_VIOMMU_xxx
+     */
+    uint16_t viommu_type;
+};
+
+int domain_viommu_init(struct domain *d, uint16_t viommu_type);
+int viommu_relinquish_resources(struct domain *d);
+uint16_t viommu_get_type(void);
+
+#else
+
+static inline uint8_t viommu_get_type(void)
+{
+    return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+}
+
+static inline int domain_viommu_init(struct domain *d, uint16_t viommu_typ=
e)
+{
+    if ( likely(viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE) )
+        return 0;
+
+    return -ENODEV;
+}
+
+static inline int viommu_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+#endif /* CONFIG_VIRTUAL_IOMMU */
+
+#endif /* __ARCH_ARM_VIOMMU_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kcon=
fig
index b413c33a4c..487331607c 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -35,6 +35,11 @@ config IPMMU_VMSA
 	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage=
 2
 	  translation table format and is able to use CPU's P2M table as is.
=20
+config VIRTUAL_IOMMU
+	bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
+	help
+	 Support virtual IOMMU infrastructure to implement vIOMMU.
+
 endif
=20
 config AMD_IOMMU
diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough=
/arm/Makefile
index c5fb3b58a5..4cc54f3f4d 100644
--- a/xen/drivers/passthrough/arm/Makefile
+++ b/xen/drivers/passthrough/arm/Makefile
@@ -2,3 +2,4 @@ obj-y +=3D iommu.o iommu_helpers.o iommu_fwspec.o
 obj-$(CONFIG_ARM_SMMU) +=3D smmu.o
 obj-$(CONFIG_IPMMU_VMSA) +=3D ipmmu-vmsa.o
 obj-$(CONFIG_ARM_SMMU_V3) +=3D smmu-v3.o
+obj-$(CONFIG_VIRTUAL_IOMMU) +=3D viommu.o
diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough=
/arm/viommu.c
new file mode 100644
index 0000000000..7ab6061e34
--- /dev/null
+++ b/xen/drivers/passthrough/arm/viommu.c
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/types.h>
+
+#include <asm/viommu.h>
+
+const struct viommu_desc __read_mostly *cur_viommu;
+
+int domain_viommu_init(struct domain *d, uint16_t viommu_type)
+{
+    if ( viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+        return 0;
+
+    if ( !cur_viommu )
+        return -ENODEV;
+
+    if ( cur_viommu->viommu_type !=3D viommu_type )
+        return -EINVAL;
+
+    return cur_viommu->ops->domain_init(d);
+}
+
+int viommu_relinquish_resources(struct domain *d)
+{
+    if ( !cur_viommu )
+        return 0;
+
+    return cur_viommu->ops->relinquish_resources(d);
+}
+
+uint16_t viommu_get_type(void)
+{
+    if ( !cur_viommu )
+        return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+
+    return cur_viommu->viommu_type;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index cd563cf706..b1db2bf19d 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -330,12 +330,16 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
 #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
=20
+#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
     /* IN - Contains SVE vector length divided by 128 */
     uint8_t sve_vl;
     /* IN */
+    uint8_t viommu_type;
+    /* IN */
     uint16_t tee_type;
     /* IN */
     uint32_t nr_spis;
--=20
2.43.0

