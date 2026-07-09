Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8B3JAo+KT2rOjAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:48:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E15873094D
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:48:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=sxCHL4uj;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358014.1612303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnEZ-0007RD-Ht; Thu, 09 Jul 2026 11:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358014.1612303; Thu, 09 Jul 2026 11:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnEZ-0007Pc-FE; Thu, 09 Jul 2026 11:48:03 +0000
Received: by outflank-mailman (input) for mailman id 1358014;
 Thu, 09 Jul 2026 11:48:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1whnEX-0007PW-Jq
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:48:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whnEX-00BXmZ-06
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:48:01 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f8a64-bab6-0a2a0a5309dd-0a2a4509e574-40
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:48:00 +0200
Received: from [52.101.70.130]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f8a70-97e6-0a2a45090019-346546826ea7-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:48:00 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU4PR03MB11119.eurprd03.prod.outlook.com (2603:10a6:10:5f2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 11:47:58 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 11:47:58 +0000
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
 b=lQA75k9Sk/h1nHVHOD6S+YSUzaxNt6G41OGFeXDyCCYqK550PG5WNVXmdK1nqvL1IF6PkXJbPbG3CY3MpezYlhFrEdTzYglXWJZjeyu50pRgeEm5aFJcImeq7AARE8S4Vr9s3+tgCxt1XEH9DEFTQL2mbKfIQSWbW09CVrMWC3wpB3JK1x5DxPUjMVBryggUwFiYvqFwzNjJqATtEIxys9KQU8i8YTPykMLj4oKWk178o0aDPSomAO1tgKuqTHVOW9LqH13reNWoRlTCsiaIUiwssrmDlB3/jjebIfJGGkzb6+b+1Kj28U3d1lkVONJe3q624AOMhpQQx3lTHX0zZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhXS+HC0sNwJXbPKhcfnfjlNmOwyK7UUE/S0KoD6FdE=;
 b=xPLczhyTCcuvQpv9kWG8zwO0vpfVFm3jFY0szwJQoYcFAf8Lsu1OjrsvyorPmQeWUpJAjnLWsfQjmlwk5FJMVJaWlUkC8HWFpHDxI8Wk13zml0GOKn/xlIxC0qYioojPnr4ho37MK3S2uu/Oc2WkVPyWLfdAMDXlJU2UbihfHa8nHg5TzeaOegW8O4OTgzY7dXMdWqjGNTEBbycZ6zzaFLJ2IEBzWBLJl2Q1KPb8u5wWs7XPZJ9T8QsqdElbYaQiJAbRfmWkn08DSQ8GKoQHoHVeLjDEY8TQ35Jo06A2zA5FEtIXSTyfF6AsjeKRyoeXays0NviYHr8HXYRzKaQRVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhXS+HC0sNwJXbPKhcfnfjlNmOwyK7UUE/S0KoD6FdE=;
 b=sxCHL4ujwUBbmYvi8OIao0FJmgxRm4oxkqPr/hn5yDhwqYfQe2fXR8W1kl5oUZq+T4V5AjggwybLSAEaKy8SPV9NOOBvc9acLqOi9uipEaUqiTSkasck08sZfs/uaXbQOs4xzB4FrrEkR4miGdw5HInQQDO1Y80kIYLj9RI0sFjwDdCX6vlKAp+3HQUVn5WnmXDaCoux4OZJWM8+ZTeN5RwAgG4pDC7ToDe57CyECILwQsVYL9RM7iTFqW4CP/vIhpvTq1VpmLu4JL9uUVad6SNLWIrGy0MUGnCOYbe5UVJGBrn8qf3fLLih4zjCY5WHb8eIzRVcpawj1jpY27JRjw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH for-4.22 v4] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Topic: [PATCH for-4.22 v4] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Index: AQHdD5jJCDOEjONIbkmZhLZ5uEYFYw==
Date: Thu, 9 Jul 2026 11:47:58 +0000
Message-ID:
 <b31a0f41a52d78091556352c3e961c8238806e0e.1783597523.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU4PR03MB11119:EE_
x-ms-office365-filtering-correlation-id: 42e6facc-211c-4279-8295-08deddafec62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|23010399003|3023799007|18002099003|38070700021|56012099006|11063799006;
x-microsoft-antispam-message-info:
 nGWBDbZJFIobFaXXC7kSHop4fPAyL0jwhYBphNugJaV86B4roMu/CqtHMJXe0f1v84ONzOTpoCiCgamn8Dd7Whc1OQCq0+5Lnsr+B3uY16v+u/916rwupAqzQ3ln+car7elYKFNtT7cilb4lOYGEafJ2pOHIEBOLV3Qif3io1YB81nVAw8+1qnEeIJjRbnrJbn/YNLW5/8CICvYz9yK8LZU/DFqQfD0b4NWKC7u63nb3kOPyN5cOmcPSJxgQM8MmHkwV2FZr+gdkLnuAXLgwxXdFcuZDUI8Nm+0o/z0U3zghW0B9fj+NYJoDokQpHnYDdODJgxA7xkQfNIqSpoJeNrvQuP+DEG9xhQSm0nQKwgRCQMJV6EeZgLo6JWxVFwwKbz9mhnLLWU53Qfq15uZT3qGdHrNjLQMVhiCbVkHDi6r49G7zC9zD+KHKMjgsIpZnJeK3XgasjPMV4ENGkc9jdlya90hEkI3v0Ig0dGpC/mj+1gR2GlQ0WZN2lzCfzcTnLY3vNxb8gtV4NI/63H+p8x6LZ5kcEqGteUe4fiGym0WWzysCKPDgLjdvuCJBa1ROqxGoRPaMcIc+Mg3I9cyRa27DIof17SoM4DePJ8MN1baHL6Kknl4KCjj+6qU6M/U4jwD1ssOBwEZTVlFyHIfdvbPDX81kdSalJK4niF7JUL5COE1l8C0A/aqET9ZyEiuufzweIBk2GVogiQfUUY0R7zOI585xmulf247zk3n+/iU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(23010399003)(3023799007)(18002099003)(38070700021)(56012099006)(11063799006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oYkh1ToNtQIrs36Vd0qJZ8Zxo/KWZ0YiWbArfhOmvkJ8mlh+PXouvhJlaL?=
 =?iso-8859-1?Q?vEra1Ht4tuglPf6KnSHjh3iqZUZlw23mpcNWcCpmNis4m0wOFNwo9M5G3W?=
 =?iso-8859-1?Q?J6+igTcmculbqDExRL+jdaChU7SNdyUlFIt5Aj5dq8jdoRy4YYr7TMLRSO?=
 =?iso-8859-1?Q?dOTsOvRHSKReQkMIDcfzKs5IQ7yG0nvyK99wDbEGCH3YhfFoCkqNPv9zk1?=
 =?iso-8859-1?Q?RS2foAbMFneSvFpOsJ7cQNJm/Uj8QnESg2zvVAnYZkytS9WDZfzwR63VMh?=
 =?iso-8859-1?Q?By2pNsh92P4La1DdybyzkgmNciDgbWqO14zbed0oOevFffSIgmjmiMMRU1?=
 =?iso-8859-1?Q?IQHRAplI8A5ryemHJgkmU4SzyHUx2fhSfhQdAbKqtNsJMvxk7k6IDxCuRj?=
 =?iso-8859-1?Q?Deze6b/gYtz25gHLd3eyJb3fjA/znu0lqqn43OZ+YB+gJpz0lvAI0239nu?=
 =?iso-8859-1?Q?iQfTNmS06DzDJ6JWgxLy6oXuJj7fx7C8ogkKwRx9kFCdQMYgJAXx1n1ObB?=
 =?iso-8859-1?Q?XaK04xfow8ajZQF3ZYtsRO8N0q0jii7PYejW6rEJUuQHbEBas/LAgaxtef?=
 =?iso-8859-1?Q?u3WZ4lnGKQICPZFBsJwDqr3HtF0TPitf55wxKZyzXpB5qNhKqu6mzLo1GA?=
 =?iso-8859-1?Q?h0P11cnTZ0dK4mBYKZ38/teX3y88XtiXBOuKyYyXklel2CHhZkgsswsFY4?=
 =?iso-8859-1?Q?RnHl1FcG6WW9vbxZRi0mZMGGvyN1Ulk5raP1ltKP4eElIdGsmUY4ivdqYt?=
 =?iso-8859-1?Q?ZDXVfgimu1riVX6Y9Zgyrw8dAQOoU7nvk5dwPnxKzk57vztM0ql7demWYU?=
 =?iso-8859-1?Q?wBMvux/wkA5bX4VhFmaB6PpDrhnH+S4YQP9FajME0hpdgx0mvIxt/3BPjg?=
 =?iso-8859-1?Q?Bc5evdQVDeTLWQ5EEB4h6EXGLU1uqW4RGZKVPmejVb5UReU74RL0gN+TzB?=
 =?iso-8859-1?Q?jV6s5UfCdaLXNSKQRrHp5QTQnbF2ggWRp/mI86JIY4LoDphdTAXVgWf0Jn?=
 =?iso-8859-1?Q?MQlwTmYQ92sz7+XHyYiZJxe7ftDadd3UheEEbdpwUfAugSeXZlW8ZHX8EN?=
 =?iso-8859-1?Q?eX1VYzBasv/X7p6ZAzXRQ7MSV4df1LYZCwHWDbp/GWfFCobakx8341KqIk?=
 =?iso-8859-1?Q?6mrRLlcvjbDL9cwmdhIuAEQOsKYR6dfNLMepf1ktVR8+Ln70AWRgfNWPdM?=
 =?iso-8859-1?Q?XJgKRP27rBh1s/t1Ha6Bea2pbuJx0G9zxsSNmJaqERodqE3JVndX5l+tm9?=
 =?iso-8859-1?Q?ixvePdDPzIetiT5kOKlJoFfmBBMiNd5YzFbLFwE0T0LbyhMy4F8upzFmzg?=
 =?iso-8859-1?Q?FeNPkCaXSBW15IxMKXyrOCTykawpak7H0+lUqYefbc/yxQn/I2Nqi2hwlb?=
 =?iso-8859-1?Q?L7Emw8MV+m1vSymBn0/MgUGUrwbs5IaZ72jdX4eBql3BK9k07qYLCGw+/4?=
 =?iso-8859-1?Q?GGOtt0EP1+Ub47DEY/ynNhN7vewGylJjnKRFPS89+Ri9IDmwUx69votzRd?=
 =?iso-8859-1?Q?ZfvJd8t2MtISfCYwOr8Ng4WGp4aOwVP7hpRsZUfQiy5qwriw0DubsgvU/h?=
 =?iso-8859-1?Q?zuBPaJScznGwxjh+z7KxgrJ47vUifIT9+P9BV4P1G/zMaFc7RRETQC4EhJ?=
 =?iso-8859-1?Q?XSWp2l8p2hCdTd2HvlWweVw1X7BTgS7FKTVuWmOVC5Q6kv1uStMUj9ahht?=
 =?iso-8859-1?Q?5cav1yOPCRLegaBBDtGHyISa8qt1LuVW7Ya+99a+2LV3MCS7kIQEdz5ns9?=
 =?iso-8859-1?Q?PxFgg5mGNnQi1dDgVyJyMmjI446uUpnOXV3TVR4xwNmz8rt1wgNR2dZMYG?=
 =?iso-8859-1?Q?JCJl1rBs0KyT3h5K8A4MJCm5s1v/hqY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e6facc-211c-4279-8295-08deddafec62
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 11:47:58.8013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QQi9IitG0cPSgJJL9q326CYaIzcpdpDIIQVpMnxEt4Q8u7sFiDFZYYOSEvIKeUDMLy7hrgEALOkBGGjnMVBLr/NevRnMy0PJzxQRW5IcqUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB11119
X-purgate-ID: tlsNG-bad1c0/1783597680-47731986-1A80EEBB/0/0
X-purgate-type: clean
X-purgate-size: 1982
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:from_mime,epam.com:email,epam.com:mid,epam.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E15873094D

A malformed partial DTB specifying both '#address-cells =3D <0>' and
'#size-cells =3D <0>' causes '(address_cells * 2 + size_cells)' to
evaluate to 0. This sum is subsequently used as a divisor when
calculating the number of regions in the 'xen,reg' property inside
handle_passthrough_prop():

    len =3D fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) =
*
                                        sizeof(uint32_t));

This leads to a division by zero exception in the Xen hypervisor during
boot, causing a hypervisor panic/crash.

Fix this by validating that both 'address_cells' and 'size_cells'
are within the valid range of [1, 2] at the read side in scan_pfdt_node()
immediately after they are parsed. Any invalid cell size combination is
safely rejected early with an error message and return -EINVAL.

Fixes: 9ce974c47588 ("xen/arm: assign devices to boot domains")
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v4:
- put the expressions in brackets
- improve the message as Andrew suggested
---
 xen/common/device-tree/dom0less-build.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index eacfd93087..47465a3609 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -341,6 +341,13 @@ static int __init scan_pfdt_node(struct kernel_info *k=
info, const void *pfdt,
     size_cells =3D device_tree_get_u32(pfdt, nodeoff, "#size-cells",
                                      DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
=20
+    if ( (address_cells < 1) || (address_cells > 2) ||
+         (size_cells < 1) || (size_cells > 2) )
+    {
+        dprintk(XENLOG_ERR "Invalid address_cells %u or size_cells %u\n");
+        return -EINVAL;
+    }
+
     node_next =3D fdt_first_subnode(pfdt, nodeoff);
     while ( node_next > 0 )
     {
--=20
2.43.0

