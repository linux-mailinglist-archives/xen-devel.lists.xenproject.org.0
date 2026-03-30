Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPXOEdFlymll8gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA56135AB70
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267451.1556957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHh-0000nT-67; Mon, 30 Mar 2026 11:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267451.1556957; Mon, 30 Mar 2026 11:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHh-0000jV-1u; Mon, 30 Mar 2026 11:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1267451;
 Mon, 30 Mar 2026 11:59:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1w7BHf-0000FG-40
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 11:59:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7BHe-003QIn-Fn
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:59:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65a8-2eae-0a2a0a5409dd-0a2a4509bac8-46
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:54 +0200
Received: from [52.101.66.84]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65b7-e484-0a2a45090019-34654254c0bd-5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:52 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB6847.eurprd03.prod.outlook.com
 (2603:10a6:102:eb::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:59:50 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:59:50 +0000
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
 b=oOoT7OjvRhZINl3Rio4Blw3tDvxWBgq7SOvoNTg8M+nEYLUK+0hgxOdC0egWpxedU6RQHGGLEAX2BpZZdQiA8MgvhQAm+V3wVmAnLw1mkJXOJ4W90NE9z3ktDNUOCmNvBF4Wzys6BzKUpVP9LW2qCf0+uJUmzeVgymk7in/r4epaFWy890Kym1DsdTNJ/krSvKIkDoWIGI0RNe29fbulvTs7zTITNsaW48E5lqphau5ZPbZB5mF0Hd2T+y1ijcxR3DQmSqmrmVLI7V5Ymv84S42R33HtpfFtW31Utlt8gKJJnEU/jLg0p1v5ppJhkjTMTbhtC+/UQBsq02yuxflQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJF2GnvkUpeFC8MeYR5G0v/n9PCj1jBo1kZj44vU37Q=;
 b=YK4cIBBROeQVCFM/a5tJvAAfI57fudjOZgzWlifA9VbZW7MQtOk3fGDBniJWtRLKIh6lSfW7xwsSjlULCCxGmaFszkdXfCn7wrqhM/S0nU5DyFH0HAmFwcHTK6YuluOZag1J2aQlIYtYCkIDB3XRazeil08XHlN37oI1wNqwZqOQiAnZJ/kM0wdZCXEdE9XB4JHKwUZEpRAi+3BWfxMwJxd7Yary7RJzZe6Zh2mfikT/0Zd+czef4riW/LagKrhQAsaUBA/8IuVlGhf//7cTcz3QRuVzuCNYy8PcpXTZ6Vm7ShPmFH1y6q1I3sCT03w2kH5gVdzqjuNl8WAud6l6Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJF2GnvkUpeFC8MeYR5G0v/n9PCj1jBo1kZj44vU37Q=;
 b=IqGWG1vVM4mWOYJcAN+gDfRMBvcOuAMm+y8yHabkuhxaW5w2Rl2i8uqxzZvIoq/Q5ZaKE+aOy+TlIKU45zGrc5SxdOM7hhw0oW8O8Khd1RLtYPQfjinqwIBnvj0RAnfVW3vSmwkwhz8x54MBe7TbjSISIWjcY3Gwkzn8gqLvITAjUbsbvkpREVHXA3tzWHNqae/pzIH0rWw6Fdb+t0v/05EmZDJeFfKpKqrkISgO+z61ujSsLZY7kede1GSApdp72hQnfCKGPKuhL/tm0ThSo7JN8/mBlrutvpFil6fjZzxu5fkSP9qC9OfHdacZw7sOWFUgJn6vdmJDlJfU8HfChw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 2/6] arm/irq: Migrate IRQs during CPU up/down operations
Thread-Topic: [PATCH v7 2/6] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHcwDy2Ii3JnaWGS0ukts0X6B0lGQ==
Date: Mon, 30 Mar 2026 11:59:50 +0000
Message-ID:
 <d1fce979525d4296b0f461fda7dc08ad1d596d6d.1774871881.git.mykyta_poturai@epam.com>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1774871881.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB6847:EE_
x-ms-office365-filtering-correlation-id: d1eb3613-99c9-44f8-54b5-08de8e53d8f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 OoPgo5w+fOfKHVaazEkk4og55ZsTpDIRIOS0/9xbqYrTeIrCCBpmZ20ulSROCiftobIKyxb+/f3Imta0cVSg+lIR8h3KlPl+DPgEh6CUdk3o9ZrQiqcGtSj9Q0M81BSRnjJil8NcmyEfwAK2ej1Cndl5GcXH9+sxU1rVFPwGV0PHDLXHAv6Xg6vXJsK0eLKCMNI92KMv+RdJEwI19L/CjtOI5idntkS3SNwIzoUjXX8yrXbh+SosRSTRmQJx5qlcMNsO742oauCsyS8GfSPUvcF5eIMBrHQDfelKHe+5rQszR4EKTtFOkGgi+gLF4ZyF6deQusCYCVQlASAZ6IuyXro17Y/je2Lm/P5rG4yq3YZqO96Un45+Iz782iMcfkGMUxhGUPnL1P6SOEdoQOIKwwRC8TigaCPmXZr5FMqLhsQo+7GwZrtLQK8R9hg1ne3r/JXU3lSW8nTzDGA3LLXsAu1AzX+B1rMo+xqaDw6eHsupXi6SaRD8F9r6yj/9cPCSXlTQBqkVw/Y73E/xO7yeqs0SBOL/U+6FabdNqIVuOJwJWBpRbWgB81uIDKi+ybgRcg0aqmFeSqh56AHt0iTerTOZGogCyphbk6vjYWahj1IaasGL1qWQ3mTxYc5zuvfV5iwFJUTMJU+azhhJiej5fzSgIqzBfASF6sZhd2wbGD8xG8ZivX07kUP2eVR3BBRKXNC5Kk6aHAcskrDNj7p+HxgM375XQZ3fIMGHOE1PfbU7YMXK8+PtsZLL1cYKP8N6oOsc4/0gD3uO1hRnnCbyolyEEQ7y7PfAMbheuq4+cic=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OmqmLzDTxAaNiOxTmjxr2pr4UYvLVQ3/PMa8Gxj2ILjq66m7+yV4CgUmoA?=
 =?iso-8859-1?Q?wCE/jt1W4E5DlS80vEd0bEGcEKYPKE8AyqddJxup2XhBVmpdP91zDPyN/F?=
 =?iso-8859-1?Q?s8S3IkgTzPwecsiTe0OutoBxqcs8WRvJbUxdrAgPfD53UwjDLapGPrBG9I?=
 =?iso-8859-1?Q?TI9acpprxTnoc1DwtjU5drGnOPOHv5GaM58OWcOvYZE5KVo9+ddpKwIvWa?=
 =?iso-8859-1?Q?lmmaYDQFmdYCDS1LFwtZGkDNquI/LM2qx56Gksghs+6ulvbcIUSfI8z6/R?=
 =?iso-8859-1?Q?9zWXqjsMufd7FdGoWN8nRbMlNVLjdP6mgO0UEnxHDtjj/Tzl8LP7JOatis?=
 =?iso-8859-1?Q?kFYXHfXYFqXC4kOB+uBtGqUfzh3VshBTzMFUG3SkDOtM6PuySzj7PocGEL?=
 =?iso-8859-1?Q?jdF9lFdfjTKIYd+YtaqNJ+1PF+yfY3++0CqJjItQPF8NBKINCjzrD6ZdhM?=
 =?iso-8859-1?Q?IRVRZqYoZEXRHjCVxbJEEm2eO786RdZQ4kwZvvmdnbURmfMKDtyPPKQBJ3?=
 =?iso-8859-1?Q?+NKUZpeWK1e+arSZAZuG1z2HudQ2qHqbLomWiCglxpTdmg+W2J+oi2DoLt?=
 =?iso-8859-1?Q?O45AbUljQAQvXcZJdjBU6FSmI2l1fcRrOrqNdIsy1oNniivryxqDgLdHoE?=
 =?iso-8859-1?Q?naPYT8NFY+FQWTt1o07kRUdTRHx8jc3/WG8lR0DhqjI1N3vZmjr0BkpQkf?=
 =?iso-8859-1?Q?7gQ99D4fcXElRmqW8cgU4HHxJMfK0+6gR1m1BuBWPzr6TG/p6CfhziUdEO?=
 =?iso-8859-1?Q?4lYTwCkchsy6boFkwFHGHjJc+3b5Y8J5AElCsbVPZ2LNUm/JGSBi/schcA?=
 =?iso-8859-1?Q?xJ33ZPj4gfeiFaPlu5AZyWexDWd9q8DMe/TDrlI9of2L1kdkI2R1S6Xeth?=
 =?iso-8859-1?Q?wPJA2pglAo53zPy0PyQgOtGAbYDL+IE/FHaLKNWNOegmWjGnzUwcWJiqoV?=
 =?iso-8859-1?Q?Uxlj7jYZdQLc0JwadaWihkQJl7ELyJMX73hx2ULfjgGH2IiiDls7iX2zVP?=
 =?iso-8859-1?Q?9RQrub3N7FslRt9Zg//FQQgYAD85heAGuf9SZqq31dbYP7W+cdmmePouKs?=
 =?iso-8859-1?Q?FZ8q450RHEHc2WMiRq77rcxdo5fatr0qSvYwYKTsaY5hO+UcM17iQWf47D?=
 =?iso-8859-1?Q?M3n3G+HfyhGKWyG4uEsb0d6j/As/t5ZbQICphaHVDFOCKYjci8A47OVk5s?=
 =?iso-8859-1?Q?g2dh2ueHTdsM+ic52RqGKdqlLryR8NARv8XpOVULMRrkxSJXADxUxjV4kO?=
 =?iso-8859-1?Q?3otBQkUEveM3a2ZYSs8RBdrL8oknRwMakyzXx+ci11TDREgGysbf/lrcks?=
 =?iso-8859-1?Q?1xGwkdaw/A/hPq6geEao9GzX1Wr7ESfLVEBwXaE1k7T+CkNwWY2rhAwYfa?=
 =?iso-8859-1?Q?vt9f0eEYlJ5DRr9aEw2lZFOGLobZThxX98dtostwOldRm/hPfx3+GOuxHX?=
 =?iso-8859-1?Q?EtTXdUTNm+xzxZTn/A21XPJjFms9mseMbmjBQyn5Q4j6p32a8Wq3RJi2HL?=
 =?iso-8859-1?Q?qPu1koN2+KGzoLmUhE3xcfUuuLGJoYYUyHXm1dWRRBdGtP73ooWkp5/Ltf?=
 =?iso-8859-1?Q?6dE4jdJR11ZNhV4ibg/BQrLEDiFM1oW4WU4I+b2sNfXcBmybuKHIdP5FiQ?=
 =?iso-8859-1?Q?xSf3xQDlrgT8jKdERbmJo/ab/32Lfwcc4//vSrWrBFUj/WhnpC+i/LBcVO?=
 =?iso-8859-1?Q?lduz7tB3VHY8t1dI3CNXsVvyYC89rNaNyOGITdLg0M06zqZYPlP9wMvHDt?=
 =?iso-8859-1?Q?A5TqgIxbynGMd6KvQqumKFEB18aAZJLAupQ2OiXmq2qh86k/pcacNfocxq?=
 =?iso-8859-1?Q?r8pYTXIOybHmaCxxg1CMsv0EsTCbvWA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1eb3613-99c9-44f8-54b5-08de8e53d8f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 11:59:50.6311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MQzmndRzo+dw6rWASBUMvXBTAjVmk3OeIuQtiPBpowHDDSQfmkXNg6ZA2WR60VeWCku24WYFbcDIhoh8priDPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6847
X-purgate-ID: tlsNG-bad1c0/1774871992-60CBBA73-8904E72D/0/0
X-purgate-type: clean
X-purgate-size: 4772
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AA56135AB70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move IRQs from dying CPU to the online ones when a CPU is getting
offlined. When onlining, rebalance all IRQs in a round-robin fashion.
Guest-bound IRQs are already handled by scheduler in the process of
moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
itself.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v6->v7:
* replace ifdef with IS_ENABLED

v5->v6:
* don't do any balancing on boot
* only do balancing when cpu hotplug is enabled

v4->v5:
* handle CPU onlining as well
* more comments
* fix crash when ESPI is disabled
* don't assume CPU 0 is a boot CPU
* use insigned int for irq number
* remove assumption that all irqs a bound to CPU 0 by default from the
  commit message

v3->v4:
* patch introduced
---
 xen/arch/arm/include/asm/irq.h |  6 ++++
 xen/arch/arm/irq.c             | 59 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/smpboot.c         |  7 ++++
 3 files changed, 72 insertions(+)

diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 09788dbfeb..3ed55e02c3 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -126,6 +126,12 @@ bool irq_type_set_by_domain(const struct domain *d);
 void irq_end_none(struct irq_desc *irq);
 #define irq_end_none irq_end_none
=20
+#ifdef CONFIG_CPU_HOTPLUG
+void rebalance_irqs(unsigned int from, bool up);
+#else
+static inline void rebalance_irqs(unsigned int from, bool up) {}
+#endif
+
 #endif /* _ASM_HW_IRQ_H */
 /*
  * Local variables:
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 7204bc2b68..447bee428e 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -158,6 +158,60 @@ static int init_local_irq_data(unsigned int cpu)
     return 0;
 }
=20
+#ifdef CONFIG_CPU_HOTPLUG
+static int cpu_next;
+
+static void balance_irq(int irq, unsigned int from, bool up)
+{
+    struct irq_desc *desc =3D irq_to_desc(irq);
+    unsigned long flags;
+
+    ASSERT(!cpumask_empty(&cpu_online_map));
+
+    spin_lock_irqsave(&desc->lock, flags);
+    if ( likely(!desc->action) )
+        goto out;
+
+    if ( likely(test_bit(_IRQ_GUEST, &desc->status) ||
+                test_bit(_IRQ_MOVE_PENDING, &desc->status)) )
+        goto out;
+
+    /*
+     * Setting affinity to a mask of multiple CPUs causes the GIC drivers =
to
+     * select one CPU from that mask. If the dying CPU was included in the=
 IRQ's
+     * affinity mask, we cannot determine exactly which CPU the interrupt =
is
+     * currently routed to, as GIC drivers lack a concrete get_affinity AP=
I. So
+     * to be safe we must reroute it to a new, definitely online, CPU. In =
the
+     * case of CPU going down, we move only the interrupt that could resid=
e on
+     * it. Otherwise, we rearrange all interrupts in a round-robin fashion=
.
+     */
+    if ( !up && !cpumask_test_cpu(from, desc->affinity) )
+        goto out;
+
+    cpu_next =3D cpumask_cycle(cpu_next, &cpu_online_map);
+    irq_set_affinity(desc, cpumask_of(cpu_next));
+
+out:
+    spin_unlock_irqrestore(&desc->lock, flags);
+}
+
+void rebalance_irqs(unsigned int from, bool up)
+{
+    int irq;
+
+    if ( cpumask_empty(&cpu_online_map) )
+        return;
+
+    for ( irq =3D NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
+        balance_irq(irq, from, up);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( irq =3D ESPI_BASE_INTID; irq < ESPI_MAX_INTID; irq++ )
+        balance_irq(irq, from, up);
+#endif
+}
+#endif /* CONFIG_CPU_HOTPLUG */
+
 static int cpu_callback(struct notifier_block *nfb, unsigned long action,
                         void *hcpu)
 {
@@ -172,6 +226,11 @@ static int cpu_callback(struct notifier_block *nfb, un=
signed long action,
             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
                    cpu);
         break;
+    case CPU_ONLINE:
+        if ( IS_ENABLED(CONFIG_CPU_HOTPLUG) &&
+             system_state >=3D SYS_STATE_active )
+            rebalance_irqs(cpu, true);
+        break;
     }
=20
     return notifier_from_errno(rc);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..7d877179c0 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -425,6 +425,13 @@ void __cpu_disable(void)
=20
     smp_mb();
=20
+    /*
+     * Now that the interrupts are cleared and the CPU marked as offline,
+     * move interrupts out of it
+     */
+    if ( IS_ENABLED(CONFIG_CPU_HOTPLUG) )
+        rebalance_irqs(cpu, false);
+
     /* Return to caller; eventually the IPI mechanism will unwind and the=
=20
      * scheduler will drop to the idle loop, which will call stop_cpu(). *=
/
 }
--=20
2.51.2

