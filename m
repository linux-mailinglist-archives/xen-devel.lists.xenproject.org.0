Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5eFQMAgxPmryBAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 09:58:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7166CB2BF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 09:57:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=B4JhK82n;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1345953.1604552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd1RS-0001eq-IQ; Fri, 26 Jun 2026 07:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345953.1604552; Fri, 26 Jun 2026 07:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd1RS-0001d1-FK; Fri, 26 Jun 2026 07:57:38 +0000
Received: by outflank-mailman (input) for mailman id 1345953;
 Fri, 26 Jun 2026 07:57:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd1RR-0001ba-I9
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 07:57:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd1RQ-00FUBv-BT
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 09:57:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a3e30e3-5cb7-0a2a0a5109dd-0a2a450592d6-46
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 09:57:36 +0200
Received: from [52.101.65.112]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a3e30ef-3cb2-0a2a45050019-34654170a4b8-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 09:57:36 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PA4PR03MB6895.eurprd03.prod.outlook.com (2603:10a6:102:e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Fri, 26 Jun
 2026 07:57:33 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 07:57:33 +0000
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
 b=qLutStB7HNHxV3HczlDNZbOTRTUHWW7pMKcDeSw0kn+6zlx7EfCWIf+hJ9+Ns3W5HDFDZPKiV9v6wel9R6/twnQEwIMH6dGWftZ6b0H5OapNArS/KTu0a/iF0CplR0bi3JbIxwmCmVMZjA9x9UQBst++UxasQVnUe4N7cUo4neT1y5D6CMAkSk0vVnROmsQnJdBZ2+1eXAMbcKS4X8QYiMqQzqZWLGjJbYhOODC4VnN4j1S53EPQ0MalvTwiv3u3AylaUleKvp913rtXIbu5VG24QSLbdyhXxyeBkC9m8oVjHMcM49+/I/2ojKsbE/oZPbKEW/J16DGqDUI89qMLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PrC/Eb+2fIxUwpdRIaXwrg2q5AkEmRTFDXNr16JHCQ=;
 b=jITwOu7dLLs0Xu6f6tTMvsEuDZcnhUp4cPkAnnfVDGQOxjCyfJMRKI9o2CxDhGTK51j9oBxFAat6+mpm5fOmUhyT2keTvkF78WWu7/+EwGlvnnt3PbuUAQ9wJX69W6DioCgNerzo40P2eggIKOUtdsqs5m2o7QCpKToknmwDNhy2Qhkttfyx+Sf1G4s0lAASZWxJlIdpzvroVcYK01qu8SQIs5eVwfkDccd1e/HegOytR6UQ83FBxQavE0Kq6VK/uei5NsFusPNZSMUUR68DyacDs7mBh4kpXtb32uyLYRuGy7FVmkChHDKHpMp6XrzKrHi+hIq5H6Zxx7iWm0jROg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PrC/Eb+2fIxUwpdRIaXwrg2q5AkEmRTFDXNr16JHCQ=;
 b=B4JhK82nZUUYm1zr+yk79FOf6FCBsen+8uFykQ0oc9qJzPm1gCBA02Dd8sdM9AEofcEXvWGLihkMl1kO/hz3YtQrr8+Pzt9FA29xdf1emDSgClNtNN1a7RF0cz+nbUQmhVYTaUFotAFQHzvtKx50AUZaENb8Y69TvkvpRcezdFEWzFZVKy0DU9Oz/GxNLfiPvNjGQFnH8F1g95QE0N3HcVBMCFAlyGZIbB963CXuo/HAR4oGg7HlyVIPL8LrJoaIoaUxI7dUp0nAhcSbVDtgw6V/90ZPBrMy7tsijxRGmjBcRAjL/RqXLyOW6s9SURjk6B06ZLwfY+ZkyRU47T+0GQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Oleskii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 v2] bootfdt: Fix infinite loop in
 device_tree_for_each_node()
Thread-Topic: [PATCH for-4.22 v2] bootfdt: Fix infinite loop in
 device_tree_for_each_node()
Thread-Index: AQHdBUFxg9s3rPnBwUySuBkN/k4WxA==
Date: Fri, 26 Jun 2026 07:57:33 +0000
Message-ID:
 <21363e7c1f4d0be76bedaaea73404fbd2cf2b0d1.1782460456.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PA4PR03MB6895:EE_
x-ms-office365-filtering-correlation-id: 6a4b12ea-ff2f-49b9-29d4-08ded3589442
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|42112799006|38070700021|18002099003|6133799003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 u/MYahSjQHU0zpITQ66dxA+lit6PUvgf9Ne7nWMYBf9J6uV5kpbH9yTjzNZmhJmWWz5n9WFhkdXt5gzr1SjOrlkoDJpcwp5rqOTps2qwAGxLG49WyDa0AWuXKC9dnn6TbDMgfxUDvEfQbqBbBSvltgHavtemxJHrgNWhlgu+j8SMRdhrjvn2QJeVgVhLgsYlOjHWDJsGG6eKT6VBwEIOmNW7Ato9D30svOCV5/uCs9mVeUHIWpHR5vX01Pzzog+SqI7X1Gva75KYqqYQGEBpkgBuyHm6aM88vjjodq1Iej5vWL7/jhoWSowfOK63wA8REOdvhsYIiGmIfepRcl2s/LZiz4BPjnSDVtGsaAHyBqRRJWLfP71LiBOxliRFls7uTYODiEti0cjBeS5czoeWtsMntx1pdC0ScaG5g0sCD1vU6omaPqM7AHfhpPyshPGpySwqLUIvQvILrebzoZD9T2f+Csm3kFKLH9nC83y15gu/YRdhdBfC3YYlpWCtQpnbO/jc6XfGf+sRCkuE8buN3WP5LXZTCVEokVBby/7JbBQuG5FZHQnID18ia3HA+4wZw0tw5lug+Me4s1RFpXG2krKMSHtJWVWXAnaeeGDFjuuu+QeeHI8KtrDkzSdY6SvlLMxaJNHih5mcdfqf3pLL9k1C9bY0NrnFThaynRVgnsI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(42112799006)(38070700021)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ILX8xjt+B2bvTkhqKcTpB6g/B+CGG8gnjhzyteHs2M3rNGyysA4vHhtOxs?=
 =?iso-8859-1?Q?g+rc9VOi2iaHXKagEHYdNqOS/xCyhHfS+dPU+jAkPweWicxYskw8W8waPK?=
 =?iso-8859-1?Q?XtJTKCtERNJZ+Eq1sgPsEIe34D3vIUrRj1zvpKMo6jMP/y9gViYW3RebVF?=
 =?iso-8859-1?Q?+xZC9K8iGZWQDpRRrTVgmybazJ/Asm7tc5rg1WRNzgUDf8T5Plk5rgJurI?=
 =?iso-8859-1?Q?ohD+1NIIiTFU95trA6hK0l9fh07Nht62+YDHMo1iCw+DnGDbf9AhCJaKFy?=
 =?iso-8859-1?Q?GzOgCxCu/lEKxQWWYPMOCXM4qtXn8a2roxPbD6VVYoVtL0h/f2q4ttzhIM?=
 =?iso-8859-1?Q?C7D3MtSdVCrb2IBeGgizY6ojLEMuzZO8zZvbaYHKTeFjl71PKFSuAhyq8X?=
 =?iso-8859-1?Q?pAdxCinD/gVmaC/FY+wrZLxDvMejC+oF2ZN7EpQyxFCLO160Zh8plHJv3z?=
 =?iso-8859-1?Q?1EhhveP51GJ66GaqYIubQcw3tSPqLQEZjd/GrlssyhfYgjALaAU9bDbjPu?=
 =?iso-8859-1?Q?HSTUGOXjMlsq9yKS0lN064B0X2kFBxRigAtf/Q3VA2QivYYS5rGoe+FqD5?=
 =?iso-8859-1?Q?UWZiTseQKpN2ctl7ZZ6fHhduJFjxfrmgLCeSRy+JQTdFC5/RoynoI+XaIN?=
 =?iso-8859-1?Q?bCs3LlEyWkJOWEBu2maG8NoagmdQ8SwkIvrV1ShZmGQkx0e1blnE5sHhLU?=
 =?iso-8859-1?Q?GA8GRrQ75bhrz+RrijTX9XkmnC6JVa/CU4wvAoMd9wM6IoMd14K82YwAcB?=
 =?iso-8859-1?Q?ZvuldKaPDnfYsIZEn5r8kBYOYyfVCaqAtup2Ferw9I1r8BJlCRQ1WGZ3Wf?=
 =?iso-8859-1?Q?qP5/3BOtkjwnHLn/KZ5M1CwnQ8ArWV6X19EH++XiuUf0VROOPlfZwZnW4P?=
 =?iso-8859-1?Q?u7oMP9MLPi+uLDzTQEQzUVXWXTrSIcWUsSyIZErPISEEz2ktTXLE+ulzqt?=
 =?iso-8859-1?Q?w11y5/gbbaPoWXPPIVqDEU3cQCIBrSs2LK5/w+5wVsH7mmDjWKf3KCNnwU?=
 =?iso-8859-1?Q?6rIPQetoG06X8gko0wmGkTVY/BB36BnRzSlJkIuTn+RtNS8puDWh7R6ZHc?=
 =?iso-8859-1?Q?snlc+E/yfRsxV+EjEwARL+t82+1WurA5au98OKZZL4RaB294AmCzOYusZ1?=
 =?iso-8859-1?Q?UAhvH1P+8WOPxavv60AHVhmS/riRCXCHwp0SXBTZd209lUbFuok7yapHlR?=
 =?iso-8859-1?Q?QCw2kUpDydVLbzwCybstYyNs5iGEKEYOjHRPS9aByTz4dPODcs9GJB5Luq?=
 =?iso-8859-1?Q?JIDz45a+2XvVMJNkXtICBv8Bi20+qhcpSolXVhXmhsBH8uJLz3/dAzkrJD?=
 =?iso-8859-1?Q?3m4bCejl7jk3P7OZ/XQi6L4FEH/liG1QhKk5X40/mSktsMZO9LMiGj7hEl?=
 =?iso-8859-1?Q?L3X8uMQDdPi+tZGyQFSK6lSq0uyO/a1I8WDrwHowVHbrNtPwR7m5hYV0w+?=
 =?iso-8859-1?Q?MHcZ/hvHRPhRK4Wjye12vQohWTSFw3TDD5FckhMfeffYoGh0BAxWawGVnK?=
 =?iso-8859-1?Q?Ke4xYov65zuuQDxHcl8u4wwpkqqYFSO2folgKHS0xeYiKJ1beUraXL6Dka?=
 =?iso-8859-1?Q?Zt792aPGunpsoMERyu3+HIdV4KKLFCXG6ShbLvQScJxZC3TKHJy4O4Z7GD?=
 =?iso-8859-1?Q?8W8hDWHRJBRjRYnrj8MJTG36VO7FXo4jAbMUHh9LIpdKdZ6cuIkrFUIgXa?=
 =?iso-8859-1?Q?GdAZbK50LQ+I0FX5UAvkv46YF0ZTBgql0yw5w1cH2VpNV2DXtifsdZVqom?=
 =?iso-8859-1?Q?O7345DMl0luz6PbM+M9wwd4LbCIwerQ/esB/N7HgZLM37aEj13e5skR++Q?=
 =?iso-8859-1?Q?4OmC6FPWJoaUflen8pOC2eH0heP66F0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4b12ea-ff2f-49b9-29d4-08ded3589442
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 07:57:33.1035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hal3daF7S9ZApP5lwsYLn6lca1/dKg0ehGqWKv6fugTnw35J+BH9F37YeaSgLpJMrD1petJw+y3vONIdsqfLAeIZ6RRB7rt3qP9SPCuEn74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6895
X-purgate-ID: tlsNG-c201ff/1782460656-553E72B8-C09B6CDD/10/73395122804
X-purgate-type: spam
X-purgate-size: 3271
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E7166CB2BF

When a node's depth exceeds DEVICE_TREE_MAX_DEPTH inside the
device_tree_for_each_node() loop, the code prints a warning and
executes 'continue;' statement, which jumps to condition check,
bypassing the iterator update step:

    node =3D fdt_next_node(fdt, node, &depth).

The node and depth are not updated, the loop repeatedly evaluates
the same too-deep node, causing a hang.

Fix this by wrapping the node processing logic in an 'else' block.
This ensures the loop update step is executed on every iteration,
safely skipping deeply nested nodes and doing the traversal.

Fixes: 40f2ea3df2e2 ("xen/arm: pass node to device_tree_for_each_node")
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Release-Acked-by: Oleskii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
- add R-b from Michal and Oleskii
- add "Fixes:" into commit messsage
- wrap two lines which were over 80 columns
Link to v1:
https://patchew.org/Xen/8836494cb51f6e1f4b094fc690876d344adb47f3.1781955521=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 xen/common/device-tree/bootfdt.c | 35 ++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/boot=
fdt.c
index 7c790b9a4d..8e9b45d1a7 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -90,23 +90,28 @@ int __init device_tree_for_each_node(const void *fdt, i=
nt node,
         {
             printk("Warning: device tree node `%s' is nested too deep\n",
                    name);
-            continue;
         }
-
-        as =3D depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELL=
S_DEFAULT;
-        ss =3D depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_D=
EFAULT;
-
-        address_cells[depth] =3D device_tree_get_u32(fdt, node,
-                                                   "#address-cells", as);
-        size_cells[depth] =3D device_tree_get_u32(fdt, node,
-                                                "#size-cells", ss);
-
-        /* skip the first node */
-        if ( node !=3D first_node )
+        else
         {
-            ret =3D func(fdt, node, name, depth, as, ss, data);
-            if ( ret !=3D 0 )
-                return ret;
+            as =3D depth > 0 ?
+                 address_cells[depth - 1] :
+                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
+            ss =3D depth > 0 ?
+                 size_cells[depth - 1] :
+                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
+
+            address_cells[depth] =3D device_tree_get_u32(fdt, node,
+                                                       "#address-cells", a=
s);
+            size_cells[depth] =3D device_tree_get_u32(fdt, node,
+                                                    "#size-cells", ss);
+
+            /* skip the first node */
+            if ( node !=3D first_node )
+            {
+                ret =3D func(fdt, node, name, depth, as, ss, data);
+                if ( ret !=3D 0 )
+                    return ret;
+            }
         }
=20
         node =3D fdt_next_node(fdt, node, &depth);
--=20
2.43.0

