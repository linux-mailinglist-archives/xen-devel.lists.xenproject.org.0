Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD+LGMnh02mgngcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 18:39:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B818B3A55D3
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 18:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274256.1560436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9myh-0002aT-AV; Mon, 06 Apr 2026 16:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274256.1560436; Mon, 06 Apr 2026 16:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9myh-0002Xu-6c; Mon, 06 Apr 2026 16:39:07 +0000
Received: by outflank-mailman (input) for mailman id 1274256;
 Mon, 06 Apr 2026 16:39:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w9myf-00027P-Ca
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 16:39:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9mye-001MTX-ON
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 18:39:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d3e1a7-bab6-0a2a0a5309dd-0a2a4506d52e-4
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 18:39:04 +0200
Received: from [52.101.66.107]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d3e1a8-0df0-0a2a45060019-3465426b20b6-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 18:39:04 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB6817.eurprd03.prod.outlook.com (2603:10a6:20b:2df::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 16:39:01 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.020; Mon, 6 Apr 2026
 16:39:01 +0000
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
 b=i8N9QNy8aaTGxZqft+2igwW6+IS8WUXVv5SE5xM43FxqweV9jk4BuMYB4IhgLs5tGaNUQ8C0J2MSnHZwpss2zLWOOwZbfDP1I4znVwxNeYasDJ64TOicqAM/+z5f1gf8KcW+dQD1/yIB2zWKa3mu9S2gO5KiIXmwMxbNRU2TQu3/7uHn3U1NmivY47rL/zVXP8gkuW3jZ3O1g+FCwHumxRgjg1njZhMp1nwt9OgneYtYchsl6fY8LsCa3gK6TcimUrNi+Vmx/9kJ5TW1AspWb1vcpRz2Ego8dZlgEH0x/Oj0WFOec/OEpGHqnncRuWz0K2NQjlB/KGT9wnt2n1zgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDSwSTsX27NgoVM+O3HHagj+kmjoXQ2HlmfVzfyV5GY=;
 b=YZmruingZjuMuui7lCFm1+SzHNOffxp+EC9oGDNqFoReZG/TAGZDBSwUFVEvvvxUbOlpM3Sd1bNLTa7LWTWZdmtJKsRoPlkk/jeqrQesA0S4lf6uVthpzyBsedpgy7GA4qo4aGbIR0fKJcqeqw9q8Syl8APd1Pm4396xun10ai97pG6oi6X5lGeK9zSHWJ9zibKW+VMDQNuo1RkTgdEsZIKV2OVDnZtF/yUNPzvpFZazIuMzuKGusvwWuQ9oxM62/qpqzM3WOW3sohVCb3ntuM60FpmPBzf8di8jerrj09qAFAxrvxpk2fMD5TOFnHYe/3yHXRZcWQS0oe3FhrLVUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDSwSTsX27NgoVM+O3HHagj+kmjoXQ2HlmfVzfyV5GY=;
 b=Mv/sHKM9XotLSowkC8tnXKJBiUMJ0dzUe0PATI5xFkSd+4Rx7XRY/VN7V/xe64PERbLICH05dlLspqU5zGSzULcZcRAHBvyf+2UaP7G/bA8wtw/g23OhTt1pdU9krA8DFyPyNL1UJEwTnU8lzn8pglnmpJbMTb0xgRMgLNDZxO7S3aOJBmULWvAc54p7ipHgscf/5zTzwgaGekmtt9KIyudQZ69TXk7/EiMrATmm/P5YOIgNyFvUtt0iT8p+JnXX4X16d+1orGpBu/M2YihCDQxbmhIjndEtdU2MKpYXuRJ8bdtvTlvQWhaVbbGT+be7IUEIqHF581TjcUmaqBFCTw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v11 2/6] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Topic: [PATCH v11 2/6] xen: arm: smccc: add INVALID_PARAMETER error
 code
Thread-Index: AQHcxePfnz5vMO8s00qEGI8zQhJdGw==
Date: Mon, 6 Apr 2026 16:39:01 +0000
Message-ID:
 <45015ff9c93705bdad30288942af405afaf53312.1775493499.git.oleksii_moisieiev@epam.com>
References: <cover.1775493499.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1775493499.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB6817:EE_
x-ms-office365-filtering-correlation-id: 0eeed215-86eb-4173-346b-08de93fb024f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|38070700021|22082099003|56012099003;
x-microsoft-antispam-message-info:
 6G2IKwo4H5v5xw1Q8ylIh/o3+L1LjyhcmqTxGZoI9Aen4Pjz2+7sAT0Y/2wVfnmnjuoD1sy4s0dK6EvJDnzSF1vO/d0IMlm02g1tc+0v5X8qf18+SOjTlfhyqia7b860+iqzygjc3e0c8i8jOXtgxQ9Ko+vtI75jis8SBU3zX/EGHHnYLagV7zRxL0sFaYQ0iYXz8MgVirj3fLu+NvFj/EAXagLVKp2vXtw1xKoWafNMELOYnu5QH44mnuBjfCk1vSDDKWhf7gCqE3GmgC3NX7tCwfYHIXLtNcIVM1qsRMfqSy2GvaemsZqdIMGMeoBhpXJNPOmeALKqAW1E9jTBrSUfqW8t6o/Emqm1W8Er0vuB+qTtIe8VxHkeKr5iz3WBieR/ks86UdGdJrnTvvOCssYa1eY1JrD6LIEFl/6s5Upi3jpl08VeWRe95dQI7dj1rpQ1DQQ3+LXNlYj6XDtatvPL98CP3U8RshrZjjQff9hJvZ/3idN4JSe2NW6Qf8H0x0VPkLHsOhGlzytBhFRwQzQClBA++gydGdITiRyAxtElalD4wY5THhlAiyKqwzK6KDwljIhuUEA91bY1qR46qZX3ZtHGf03W/ASSfwMUMDeGjfcnsmZNG4yNyayiIDlifGBj0lFVbCfSvfSHzgqvdqbMXyeIMzDUH2tQDWJ3ez3N+LZrEKFLwPHHnWf5POtONjbtmztaXbBusBCbnflaxVGEGWziuS1+xELrY9FYH6bzd/aakZQ/cROxLVsnnDEb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(38070700021)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zLJ5bnmVGF3qY6m4ECk2DHjika5+UcESEzpfohNTjUeZZP1DZjbvLA9aXe?=
 =?iso-8859-1?Q?FmmPabkS/LiDARE7ivXa1mMlYA2E03Mlu9jQ1fi4P00r4NI9xYhxtJOeOn?=
 =?iso-8859-1?Q?JdCWEwNydpuJcG0k/Gp3DC9DWoxtEb/7Gz4CHkM+vmuz5xwaqH0jRmgo0E?=
 =?iso-8859-1?Q?nFIRGj7an1Mnjeu5cA73OdifSshuIsRlRU8UmIndptu66Ae33q30S8OgnU?=
 =?iso-8859-1?Q?l9PfoeXMmQ2f00lnQc+6G+6WyFld3VIddFtdgGraWuVr/yJJdWUkJGmDAM?=
 =?iso-8859-1?Q?CLvaG0+5BLYQoCbnEdFnfJK6RQFteMzRpOy3xZAhRE+/4+r9rZBBcpaqJs?=
 =?iso-8859-1?Q?qIy7Y7j+uB9h1WhDAKD2aOr0ZD45KMChHUhYKfhs5wiIEFYOvfRkTmm+cm?=
 =?iso-8859-1?Q?tFaIoa5XzJsEWWDJmu8uE2t0tkjABmeI3Shbgfy6Gvsekbis6PnDKSQYAG?=
 =?iso-8859-1?Q?8UJ0AoGUJkyE5baD+bNEVgnti+WwKajVGhHgrLXqURy0l4njF8dme4Zns5?=
 =?iso-8859-1?Q?FgY6Peiy+HiAV2c/vwihmdvjmEOOWIHc5JKqw8ihYrTMPhF86dZEvdiZX6?=
 =?iso-8859-1?Q?YbcniUKvs8ExmpdStX2roURmgIAZ3aNtP7KupeNc5z0y8wNs4s/gdKND8H?=
 =?iso-8859-1?Q?gBe86RXy8dbNjzdYqppYCXyKsEbUFicAgHTF3WsvETrLZItRIKNb4tXOLG?=
 =?iso-8859-1?Q?KKYaQmJiuhWYpR/E+wBCj8weOxSbbBQtWUmprggoC25hGFnmFDr1eE3+gs?=
 =?iso-8859-1?Q?15YG6bVtwC8Pw3xNjUQzDgeLnIOgXLz3IumAStDnEDOatyusQwH7Wq/g15?=
 =?iso-8859-1?Q?eG0LYbMg6RVUGzO+TkUMXhYXAwgLnKoZC4GAYN5uD7Y5OD+pnLjLwjIJWJ?=
 =?iso-8859-1?Q?dp4A7rwiJYIDlYUNB5sO7Ocxd7ksV07+rjqUMqVuKgmauXuMg8Pa4WRPOh?=
 =?iso-8859-1?Q?9Ywf3/PjDqKdgzJNgtA/q/lXNZLZy6fi/7x+oan11ZSWV17o1Hk241fv9E?=
 =?iso-8859-1?Q?m/b8sP1PTyJv1A4n7ns2SAwrpdkvuONJnQ0MvMiBRI5LiqOAoaRBA8hzhY?=
 =?iso-8859-1?Q?e7fbkwY922NzX/0qfzr16ZgDMJvG5p+UZ2f9BHA9gpfYYv1qw9WpWalEgQ?=
 =?iso-8859-1?Q?KGY/6ChedhAQOhbwLFHA/IUyQdaeR5mPF2ETvxY1wQNDrBA6Qiyz7nfDmp?=
 =?iso-8859-1?Q?gvJR098gQZm1We5v0+xtEdjcPWdFa85MLZll187kZfowukCyVyKsFfrzhP?=
 =?iso-8859-1?Q?JHqjT6iH7P5hJmprUJrlGCP590iqzTkYSowuZVBl9ICTl0WIGtz72aiaXK?=
 =?iso-8859-1?Q?WykDMbf1eqpRheZ9GZ+B87A5LRNYTLXFKcmQ2rNgMqxtDvhEwaz+/41tms?=
 =?iso-8859-1?Q?sw9+DDOlvUmJiwOd0ZloKlGwB4V9+IfHdctJ8jqapJbq4ltvg0ua9ObT4D?=
 =?iso-8859-1?Q?9+GD4C7mVc8mxZtQTt6blzSkIX0v94c+CfPY/CLl0IcjcJPs87Mf1Ea18g?=
 =?iso-8859-1?Q?vCziIxDZX6vBfwzBJlmfXQGOp1Doc3PhfF1jMy5ks/uUkHlh9ZqfzvU1Zn?=
 =?iso-8859-1?Q?/i0e/d0FeXcGKOxSb39jiOU4fJ1E2CTMM4PgRadd2xcxiAlfx74bRu7gm4?=
 =?iso-8859-1?Q?P9g2zcEvFEcUlQowrAF2+L5H1VDh1iWf+85hE84dfUp31FHGcAwQHys0Y7?=
 =?iso-8859-1?Q?6/zdXfhpILAXZO+qz4d54zz86sczzWIHljUuucWmOhcHa1YUp/v2diD1WC?=
 =?iso-8859-1?Q?FWv/J1+KxX+JNauK/5b/xZGWyNAJK7m5DaYXB8vE5WBal7GJUrSgEzZgoG?=
 =?iso-8859-1?Q?yAUf8s4if9NngMRl0re5xU5LbOpx3KI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eeed215-86eb-4173-346b-08de93fb024f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 16:39:01.7722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BnaRi+Lf9AQvWinzP8aFenbB9JoGb2cuPbLKUzCyvucKc2I9IROwLCo+cGq+I2cMaZUCxTHJBMuMWDynIcs1S059S/3CxBemN2Egt8d7Nps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6817
X-purgate-ID: tlsNG-16d1c6/1775493544-64A4C3D8-EDE9E374/0/0
X-purgate-type: clean
X-purgate-size: 1003
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:url,epam.com:dkim,epam.com:email,epam.com:mid];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B818B3A55D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the "7.1 Return Codes" section of DEN0028 [1]
INVALID_PARAMETER code (-3) is returned when one of the call
parameters has a non-supported value.
Adding this error code to the common smccc header file.

[1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---



 xen/arch/arm/include/asm/smccc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/sm=
ccc.h
index 441b3ab65d..478444fb09 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -381,6 +381,7 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs =
*args,
                        0x3FFF)
=20
 /* SMCCC error codes */
+#define ARM_SMCCC_INVALID_PARAMETER     (-3)
 #define ARM_SMCCC_NOT_REQUIRED          (-2)
 #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
 #define ARM_SMCCC_NOT_SUPPORTED         (-1)
--=20
2.43.0

