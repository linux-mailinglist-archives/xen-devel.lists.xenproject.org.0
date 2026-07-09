Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LaAsCw69T2pMngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 17:23:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0F5732D12
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 17:23:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=BQJmtgYt;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358264.1612466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whqbH-000148-13; Thu, 09 Jul 2026 15:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358264.1612466; Thu, 09 Jul 2026 15:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whqbG-00012F-UP; Thu, 09 Jul 2026 15:23:42 +0000
Received: by outflank-mailman (input) for mailman id 1358264;
 Thu, 09 Jul 2026 15:23:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1whqbF-000127-01
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 15:23:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whqbD-00CTuW-Pg
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 17:23:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4fbcd8-2eae-0a2a0a5409dd-0a2a4502a746-44
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 17:23:39 +0200
Received: from [40.107.162.99]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4fbcfb-64c6-0a2a45020019-286ba263f203-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 17:23:39 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by MI3PR03MB11716.eurprd03.prod.outlook.com (2603:10a6:290:75::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Thu, 9 Jul
 2026 15:23:37 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 15:23:30 +0000
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
 b=NPPpOE6RDMnRrtIC15Y3TfvQyPHgMrmMyw3krLEuilLxPDvE/SSYhCd+98zPlwLJ4e6Wj3z4cPrADiK1CdpzQsXFQvdjcnoaZHTzoub0Waif7nWgFHV9xMkIMwmBuGIj0xKYCj33gqKMaeMcyeGIkqz4ggLiWGimDKCxNDlgOb/lO/ME3Fuyc9hFnk2xTdjRpmxaE261p0597hQJQMl5tVcDAt83uA2/BhU++dLGl99QDBz1MXE83zi4BUrEpL6CTfAlR63pXAF5fZWqZaznCXOtXqC+IP/8p6CZ4Gt/aK/RrMidFuhaacQhB15ZBq0fFb7wJ7G3MB3mfr6Vn8ZiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dlyv5Fbi51wIjxmvgcBF97mzr/mGIUpsoVE/xwMklTg=;
 b=RXLWeiCEbDr44UHhtTFeFJUf6t1Q2oidBPRQHrbvh8QiwEtGnYZaH/2twGJYY+/YHjJvWl+WtjLB7oTFos+id/PTUl7uICn0KD3k+LwA8AUbmAqqAex6ZYf0GBy+NsljddG9gItC8pbiolmY7q038HOWNNM1DsJRw0Dmrz9gRV6CcsjQ3tEIPTcKoCXpf0lulTVXj9lBEAMda36bMcotjJfKJ+YBmKCeCwQW78nyaBsZZhzXC0Ht0Xqc2cZQEYsYpdWm9QyUqTF5bUIE+LYZl5unALUgB2HdMcu78+HrxdxKqK+3SDgiSqv50ygQWKo/ZhietQglWf2wA8Feu8t76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dlyv5Fbi51wIjxmvgcBF97mzr/mGIUpsoVE/xwMklTg=;
 b=BQJmtgYtJy3iqJ0axVpE0STVX+GPTmMaQ2CJJXf7wbXDs7pm4BdegWFdtW9FukfLjMuPhMGh4AdaTsL5F9xEazjrqCUPyM4hU7MiBsH9qsVCjBx0Y1Dl29r8WAXmAzR7aejYenZRLtcAchIDcQ/C43ZGOQspCG6DCFe9TOTj5zbdWtn23N1X3O81ihFbUQenCa2OUsabb+nElWnRCrSBhWAvcfxBqaznj286pc1w6KwAy/GbnRJCaHLfoyyxzC5Bj2LytGXGm3I42yiGzNv+Z0Va8Px0pp77c8khKd0sqIQ378pLHlSXhoaMq/UATdA+VqoBuVFXgGdrNalNjyK2FQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] generic/altp2m: align and simplify altp2m_vcpu_idx()
Thread-Topic: [PATCH v2] generic/altp2m: align and simplify altp2m_vcpu_idx()
Thread-Index: AQHdD7blJ03yOJ48I0W3XaixAGyTqg==
Date: Thu, 9 Jul 2026 15:23:30 +0000
Message-ID:
 <f246f66c9020d5ab5f6ca20e0645b93b6210b4a2.1783608944.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|MI3PR03MB11716:EE_
x-ms-office365-filtering-correlation-id: b2bb627d-17ca-4762-2c28-08deddce082d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|23010399003|38070700021|18002099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 32Nh1QrIajuKYxWh+HsHlLfWHsEFjt0HSd2ZwqgBuuxDQjjOzA+ixDl1a2JQASxRiwY2cnd8o1CL9MFZkGkJu2u4aIAqNh8F6CGDWPFYlMHbNhtxp3YtkILb3Dy09yyyBuo3L1gdRLttVzcBXjzbRezYfRHHDapRyXp5vJhNq6chBnnolAtoBXX3R4ewpfhwzugPtcsEN6m3F+VBNPBFlQbkt4Zde/8HBZ5n78UaBKG3AuQ32Ak7WCZH8mmnM2ExUIX+4BBStcznd0yCDFYtuGzJ2mtepKm0qxviIoCw8qzG2w6iZfXqAWtOfPjfY+dPFdyvM+eg28QInTKjsHFetjdnVY4TfDp589DNOBre/RMOjqoja2/PPWW2LdqYhw2tLaj356p6bIb/+CiTsQ32EixXbdZsv3rVQpiqb/AlgUMLwtgpHihTjYFhhvuCzfvy+tVNNwZZfqYxHBYQhO82S76dIjVzasodN3bZkv/Rrb/ma/NV6LrK03eO5RTT3jRmk+nwscKsyHW8rfQFO9HTYcUCCciTnE40fAYiWNNa8tt3Vwbu/1eN7Hnnr3Bc/hR8qr0FhJRLpLmfLAi573i9UQszDnl3RV5eHIdN6aUwk9UUEb6rVdZy+xtFSYQC0sXrFLanflyU7fyobW3PnV1jK8cgGWyGi35CA6QkO/Voy7mz67KlpHWVv3GlNDdCz1dMQ0KY5eCHFh13RrQIOiQdLtQZO+6OjXSGiNUazfZwBvE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(23010399003)(38070700021)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Rj9QrQ+hmk8udh++6QGKCf0ZKDslTXqLkd8naHw0sUIQxoDf70Ynq0ljBk?=
 =?iso-8859-1?Q?ul/vjf2qkDDVTgUQz3x9m/BIoBaILbEGPQWdJ5VUxz4R22Zq1XV6/793um?=
 =?iso-8859-1?Q?MGf3IzFMJZhZCFGwtn938jCfeubEVkR/uEjv4lGeTtgdwXThZoYmAV+bSO?=
 =?iso-8859-1?Q?uIVei5d7SeU3fDQCZBAhFTgSynAZYDL5DK9lHndbMYukIoAI1TE0SKW8QA?=
 =?iso-8859-1?Q?CESyVzrZiaRt0yMTAo8AB4usiZGYGv2TD4xwvaYJmFNMCVVPyydAMWgAHu?=
 =?iso-8859-1?Q?C7C1ujTygpOh02ytfzYe/nZH8R/xtbLVOGXaRXcDVAKZBGQUl6HdgTWOBN?=
 =?iso-8859-1?Q?IZ/Kl3bIavERMw+mZhIvTj1PFCBoOCQ2OkMsYIb0BaYzD0chVVB2wkz86A?=
 =?iso-8859-1?Q?fIX3PQm9/sRB7ZJm/W1vMF1SqpJ5OWLp2L1Vr20uJfg3pBXphvzWCnZq0z?=
 =?iso-8859-1?Q?RDqMc/++xA7+kbu6M3P/sxzeMswG3NaE+ngfjmZJbLTAeJZVAyZRz3LXrW?=
 =?iso-8859-1?Q?X5P6eWXFWk8VpD7tscBizumSHEGX3u7ufQ9NRGsfVoSNrF7uCxZL3+9kcu?=
 =?iso-8859-1?Q?RQeuxaCc32HMrqyHq10y8TYceFIMeSzDHd8u8SguV7wmINhqUBH2JQb8xW?=
 =?iso-8859-1?Q?xF3jXPhZKpMsURyAreQMEEbsqlPI7J2HHjSxF97nIOGAZSCcltXC1Xf00d?=
 =?iso-8859-1?Q?4YWVLg0zVFrbqMrjdFWYAaozlxDTJyqEY+74AETbv26s4NkYXdmICzdtE7?=
 =?iso-8859-1?Q?vmYIt4IyzqjkLTdiU9oAGrulccPypiLBoN1Cn/qIkKrKWLkIIfUKNORNoq?=
 =?iso-8859-1?Q?6b+oAMcy+NKPpNeObE1JgtwZVLo7JLKMUpE+4NpUWXj3s22k6A5crLs+15?=
 =?iso-8859-1?Q?l/qg/cwaNPS9/M5Tu2TFJRoz6xxkHYdPufJ0bLGVXTVlCJOCZEs4QnerqR?=
 =?iso-8859-1?Q?Dg6Fxy7wNumBCdba0WjvuoFhcjL///Ti4UVWbuWA0KCtJmvIxfzzGZH1mG?=
 =?iso-8859-1?Q?FUL2Q29fnRtkPAf2kkQ1A8ipRzst6fIMf3Wxcrogfg1ewf6XsAR3mtcdqq?=
 =?iso-8859-1?Q?7/OoisUi5XvtuMJcOMG0LnuPv6qoBR5xIgEOy3/SbsxZ7qOUyNncZAM+fu?=
 =?iso-8859-1?Q?+DocpdBaHraDkFvhB1vccJbDvCpOHrJR8z0L9kgQX+bpg8UL3GEM1y/WRy?=
 =?iso-8859-1?Q?jGb75mY4zhVRCI0Nb/25uZkHB0ALu9m6+YA9AQj4bNm215i/H1Wme20qY/?=
 =?iso-8859-1?Q?3c8qbnaS57JIYB3onKmW++XbjpP0BVr0f751EAewcZ35LagzU91SDRq3iu?=
 =?iso-8859-1?Q?ZQdycnAVbGIXP1YMl4tJ1Up4HumWn3skWHBpBI/NtmpyvmrwgPND7pbJsb?=
 =?iso-8859-1?Q?omTAeWLWaCV2GBGLL98267qHBz+h8TNl2TE38HL73wE/etSpRhQ5MIQshp?=
 =?iso-8859-1?Q?pyfA5h26sm7RhpkbyD6cHHVhc/14xYUkYXNn7S9gy8cMR6q2agis/7GjQP?=
 =?iso-8859-1?Q?Q5CZki4UWkYpP7bP2S3aeA3rH1QctrWtcT1qEB6Os6gx+PW6Rkg4dujLGU?=
 =?iso-8859-1?Q?U/0xeHe04wyGF627KJqrWrkkMQmtCGtMkOHXMRwnRuBWGW0fmjRWqFpMCz?=
 =?iso-8859-1?Q?hMILOZ+Ejm8CA99a/l/cd+vNF/a0Ntj+cDXYm2kzXTdYv7nyAXZxrHQV6D?=
 =?iso-8859-1?Q?N7rS0sARDIS4RIwczsWFNrGh0sNe9DazzqER71RWa688IDr6zeZvlEsfN2?=
 =?iso-8859-1?Q?F59T80CJptvSJaWkSG+TDrHwZkH85m7DzxcdyvkvsEKyY/DSakE4gXerXT?=
 =?iso-8859-1?Q?csqbob/4izp6G3oOk2pMk5esVXYCn8I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bb627d-17ca-4762-2c28-08deddce082d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 15:23:30.3134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5XxbgJljgDyQu3+3fzC0rzuDzlhSSLrpgf7LrM0uun8SwyMuXLkomQtErelrQcof4Qjw4QZ2R8fNuRVfECKwD6iXMfJnYOYo1PD8wmsER3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR03MB11716
X-purgate-ID: tlsNG-720697/1783610619-B354EA87-4330F509/0/0
X-purgate-type: clean
X-purgate-size: 1726
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,epam.com:from_mime,epam.com:email,epam.com:mid,epam.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E0F5732D12

The return type of altp2m_vcpu_idx() in the generic altp2m.h header is
currently 'unsigned int', which is inconsistent with its uint16_t
return type on x86 and the altp2m_idx member of the monitor structures.

To fix this type inconsistency and simplify the header, this patch
replaces the static inline implementation of altp2m_vcpu_idx()
(contained a BUG() stub) with a simple function declaration returning
uint16_t.

For architectures using the generic altp2m.h header (such as ARM when
CONFIG_VM_EVENT is enabled), common code calls to altp2m_vcpu_idx() in
common/monitor.c are guarded by altp2m_active(), which statically
returns false. The compiler DCE will optimize out these calls, avoiding
any linker issues for the missing definition.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- add Stefano's comment regarding return type
- rewrite commit subject and message
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2665080481
---
 xen/include/asm-generic/altp2m.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/alt=
p2m.h
index 39865a842a..df6b9a9c01 100644
--- a/xen/include/asm-generic/altp2m.h
+++ b/xen/include/asm-generic/altp2m.h
@@ -15,12 +15,7 @@ static inline bool altp2m_active(const struct domain *d)
 }
=20
 /* Alternate p2m VCPU */
-static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
-{
-    /* Not implemented on GENERIC, should not be reached. */
-    BUG();
-    return 0;
-}
+uint16_t altp2m_vcpu_idx(const struct vcpu *v);
=20
 #endif /* __ASM_GENERIC_ALTP2M_H */
=20
--=20
2.43.0

