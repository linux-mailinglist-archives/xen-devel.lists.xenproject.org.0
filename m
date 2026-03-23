Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CdfBBXEwWlTWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:52:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0552FE962
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:52:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259693.1553163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7o-000681-Kc; Mon, 23 Mar 2026 22:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259693.1553163; Mon, 23 Mar 2026 22:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7n-0005lZ-ET; Mon, 23 Mar 2026 22:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1259693;
 Mon, 23 Mar 2026 22:51:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o7e-0003nf-4t
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o7d-004fuD-Fq
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:51:45 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3f6-bab6-0a2a0a5309dd-0a2a450c8c80-22
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:45 +0100
Received: from [52.101.66.87]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c401-f93d-0a2a450c0019-34654257e4c0-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:45 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB9699.eurprd03.prod.outlook.com (2603:10a6:20b:61d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:43 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:43 +0000
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
 b=fz4VbrLpGL9C+041fr5bzlLu9ZFdDe2EIJd7yA0hE0ncVR7049FwHdr3lVLDbDgUJQuVaoAvPkPiHoR7OV6APvkGtXzU1CtCQ3fhA+BpgEaJYr1bsXmOmLRI/kgYrdiHAFcWc68jpqoWdkaqCc8Sf0oVxKxqcSz0Lo1CHkFFOt8oy267d+4f43qk1vGL7L3Zn5Op/A2hAp81KAQV/aisOBHxNyMQCRAzayLFjIW8oVvS++hzxZFOOMCzVLXA8U3K5CEESva4SwbYjl5mWEBq67nItewLIZ4l32hQwAdNwA5BGuPO4nCLN6RYgBYytT3vyELL4VbpmHHFm70/j4emLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmh6EAphuAL/gDfScNCpPeZ1mXHcEQ3KZCH14Om7lUQ=;
 b=QTDJhPwfeGW0T24L5BQY6d1jourj7OClyCmhFvY/JiGFtacWzLn1aq3NaiGAVUChzL+OtgSZsL6MZEB0EoMGmGi9i1UcxK+DnHlvk9G6gXWsgw430ZXbaDSSkJ4F8nvZgEsYQf2MzK1hiatXpRnEq+lWfoMLGTEqYavZGpSm+XrGBiuJL0/t5vk7AheM6efXqCN/5uZ5bT7Dd2zgOTHkw6fcbAXZMmldsv5vqE42wK9IiHQ43kDXUjsCHnDFfe3JXLKSRLF4Fvo8zQTErmxwAK1V9hrXyvVznSI/zl0EhJtXQwFm7ycX4T9WscTi4DJFJNBZKuZ0JtsWJoJgFZHdfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmh6EAphuAL/gDfScNCpPeZ1mXHcEQ3KZCH14Om7lUQ=;
 b=QZOssT2ZJms7YlkkUwFliKis/D5gByyt2CgS8jz4L9SouDOa+2/eHqKNbEitlAOHFxqSZrb/VLMdkk4yrnRxKHzRrSFvQqwOt47ytyMgUd27cmCukm1dxO6tSpXeymXYNVFIZypcofJvDwdNyB5C4B3hpiFC9x8/+2r319RjpclR/1xh9NEh75QHQT2z8OKuvQclDNpMTVcUTSmB+bmMD5HgMB+6uNGpxfILTpu43MABQ0SOIe5XEa85Cb+IzpjL1PFbkF78QfijAC2dtXwIAKdLBEEl5PGRp0XNClAbG05LgwTFEKRbD4my1vwCaASdzjJVecOxuqkadw4sySnEFw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 22/23] libxl/arm: Introduce domctl command for IOMMU
 vSID/vRID mapping
Thread-Topic: [PATCH v2 22/23] libxl/arm: Introduce domctl command for IOMMU
 vSID/vRID mapping
Thread-Index: AQHcuxeew2ClCP8ETk66SlRYjUIe7A==
Date: Mon, 23 Mar 2026 22:51:43 +0000
Message-ID:
 <9f722baf917fd47227b636287dd825fa1d695ca1.1774305918.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 44bd5340-ea42-484c-e67d-08de892ec0dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 TrtzUw0U4iWg00JQhAp68fKKy55wWOd8N9V89lZaduGqpFqefGg/e1SKoX0uanvigSvC1q6gO1C+NvnSGs+lasepTrAhWUHU/C3+7vVyff+XogABgBKa7ei7tGTlN2yecsHOCzJHvrqqRuOOxOgE5EDW/N2Jtu/q5plKvQ2IesjQy1gKSdJDxTSr/ksSUtSbKEOWKw23Mx0/JiOsPq4zgTe5B0nGdthn7oosOJfudV5D4HHN+82l+LWyxxvFiWUCqGHN5xXlZhikuYifZJRzjUDTTFKRNSEeOC9g8pYSNDraZA0Ngl5lNVE0IWUmQMY2+HTwz6rsDME3B16wWNejr4xI8xMkLLho07DigQqYa21r36MuVaz0xaiTfd1QCqFoP8FSsTEHAPrVNeQ5SD2cAmDkv8EPAmnmWsq1MsuAru1luaVaR92RNfwE3nTPN+Eg2CZR66PbQGnRUOXXyTS6B4NPDIwnzvZvlHbWOWNxNHZbHWXoxlPAm9dnNwi0apPBRokwMecNuzap7vu6rng4LURkevCAUU7DHfh3YETmql74Mq0xOYTMC5YDJbjFSsrG0swBzXVS8dHP4QL7kJMfzpg5w6GJTywba5WfbiZSpCKWBPuJEXXh9mF4BJ1wkmP+7bRzR0tLNS2uIH9H8p9snsFDLQXL8iZRchWeN7ZTW59Yruxu2h6DNGGlMDZqL69sErUyAbJoFPlogizdL4ptWcP/G6+GMLdP5ay0hTXo4mcWk5QplAFuO/CMXQmdsirpeMhK/pKUPdEZVRLzbs0MlqULJG6tTAXuzCNAk766l54=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+joBfLAR/R/aQes6L+RrlQN0TkCnz9t8hX8/o+hX2N+xWLNJM5Vd9kjbTy?=
 =?iso-8859-1?Q?JClvfS5ToHtRJaILpmE+azHuNZJ8ehSAg6Ud744lHDKs9EPGEAM1S29Oy1?=
 =?iso-8859-1?Q?+hbNBzbZYiM6kNBhcavp+tDbfFcVS2o3t+YO4VjhvR/0J5JuVLHSJypMXs?=
 =?iso-8859-1?Q?Z7l+MierBpUGhu8Vy4YD34BoNknNpcslzs4sDZgwnVYJ4Gbjg73rnCF+05?=
 =?iso-8859-1?Q?8nddTtQ07LnFrc3ygo25T0z0zBuUXUoSdSPexghm/JXH8RuVC+GriNgopw?=
 =?iso-8859-1?Q?3A1Oac4DyhPdVb918qbdPw6ouQwxP8hsMILC9SQPLP1d4T5rQVGoJGRfNs?=
 =?iso-8859-1?Q?JNmXmkd04DCDtqJgjSzqwHFgz28wW3KVdgeH720b3U6TFAmEZnwZHSzywL?=
 =?iso-8859-1?Q?oQpmpcpKIHYeuoSRfnRSWXa1pEuN/ner86mBkJP2MiwcB1qQCdWe8jejmK?=
 =?iso-8859-1?Q?OXNXGfBdDtiE+513QNueKGT49Iej82g2a2w1dRfKr9d3JGDiX/0mEtJw+5?=
 =?iso-8859-1?Q?vgYp5r8Df9oIibIlFHF3TBXLKr3SNgFdsc8DusgW/IDnX/BVnkPoLnRIhq?=
 =?iso-8859-1?Q?HUFP43/L83HT0fveC7/soOggv/SvfhEDFNH5Joz2+ThszJOlh14GtJy8F7?=
 =?iso-8859-1?Q?1rMe0VdPWfrwBb53OfACYTCyVZU5wheXGa9lgiCWV8OTZ7+7m65L03B4s2?=
 =?iso-8859-1?Q?AQGQMIUf3LwXufwPNQo15DFtDk6I6TfdVTHKDIz5hNzvsgwhTTwTFLsQDM?=
 =?iso-8859-1?Q?LDVrjYO2DBqKXy6Ruei4ARmzJOOQPLctr11iYO93CGQBleKKO4GANknlof?=
 =?iso-8859-1?Q?wk0rZMjTt52v9YBJ4ut/35O5TsVEGb22bMDqVrBRjjWSMK8VzabMQ2ipez?=
 =?iso-8859-1?Q?R4wHXAHEdb+ieMF+DsZAUQR8s9RSopD9yVCoV0KKcsrgYGhNKbTQpUl0QY?=
 =?iso-8859-1?Q?CmR9S+i9Gmy7ocRgglhGLp3FJHMRwuB2CM4jkyWIfQaAwoqsTJEt1cVB1y?=
 =?iso-8859-1?Q?b/SYgLokCYQmiRRDgzskCsmG2cCP8/+VXdDy+wvt1GUmcjKGQLd0ky8EBj?=
 =?iso-8859-1?Q?eML+s3ahz3cCTBVmj7hny1tfEnNosOXcBbl0meGP5jW+YI2UmCEYkRPOKx?=
 =?iso-8859-1?Q?xu6+4agg98NMoG8IVThTg7whKvYaHqOYIgEi9Vqw6lreA6YHH55F6R3nyZ?=
 =?iso-8859-1?Q?BJazwjvNrYcA2cSvASDakjWHM9nCAZCpqj+fqXTIZQgN290vJIQ8ZjQghz?=
 =?iso-8859-1?Q?rtcKmxwwZdCA+BO3ll/Xx6uQNHI6DM6Wvs663tLJuNrHKj8O+8ynHha5KA?=
 =?iso-8859-1?Q?CWi0fiGGNNOtKuT1BaJ7zAt1uQKCp9kR1D/YH3yp0vQtmZ2ZeRoXje0Pfj?=
 =?iso-8859-1?Q?fEAzNvd88tbIL3ZkLo1dPGZn+KyFwPwfjBhFvvEAGNUfg0iLoyB2o3Rp+I?=
 =?iso-8859-1?Q?wW8k3VozLAslXZXRWfyjFXtl0vxPNbAB16KsqxE5QIMoEPwX1GtwIiTk/W?=
 =?iso-8859-1?Q?NaVWn1UJoF3SA5f5GV8We8MbQTsgg82Zg3Lx5rEZK6hYcort5zsiku/AvK?=
 =?iso-8859-1?Q?jpGwnzVzuP/PoIJbNsc77Lg9qPP75tRnTWH9ablccJzIQIeYFG+9MilOOK?=
 =?iso-8859-1?Q?Gc/uDhXoULXY0PPZO/mprBmj2Kj9UDJ54A6l5eoCIXofld6/cNQsCJBlPc?=
 =?iso-8859-1?Q?IRdpu81N9H++cF/Yit4kCDrrqAUYnCRPeNwXRad8PBv6SOt5BUV9+jH9tF?=
 =?iso-8859-1?Q?jL41/fP/iNSq9IcCFpQjL0fvntv8DHEe6wYyAnzY+LO0wHrzVriEgW0p/h?=
 =?iso-8859-1?Q?RI63vbiogYTUTkNc/3E6BoMzWZ8+J18=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bd5340-ea42-484c-e67d-08de892ec0dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:43.0422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uq5ghRxbM5vuLXt46A8J7AEcgTA8pOalcfpar4jYs/CWQorCIw4IsW+ojQ1XbK/y5v2l6QCPboSVTCIpTJfpFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9699
X-purgate-ID: tlsNG-d25034/1774306305-6D6B7734-1997B317/0/0
X-purgate-type: clean
X-purgate-size: 14595
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:milan_djokic@epam.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 9E0552FE962
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For guests created via control domain (xl, zephyr xenlib), partial device
tree is parsed and loaded on control domain side.
SIDs in guests device tree have to be replaced with
virtual SIDs which are mapped to physical SIDs. In order
to do that, control domain has to request from Xen to create
a new vSID and map it to original pSID for every guest device IOMMU
stream ID. For this purpose, new domctl command (XEN_DOMCTL_viommu_allocate=
_vid)
is introduced which control domain can use to request a new vSID mapping an=
d
insert a new vSID into guest device tree once mapped.
Requested vSID allocation using this interface for vPCI/DT devices.

Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 tools/include/xenctrl.h             |  12 +++
 tools/libs/ctrl/xc_domain.c         |  23 +++++
 tools/libs/light/libxl_arm.c        | 127 +++++++++++++++++++++++++---
 xen/arch/arm/domctl.c               |  31 +++++++
 xen/include/public/domctl.h         |  18 ++++
 xen/xsm/flask/hooks.c               |   4 +
 xen/xsm/flask/policy/access_vectors |   2 +
 7 files changed, 207 insertions(+), 10 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index d5dbf69c89..61be892cc8 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2659,6 +2659,18 @@ int xc_domain_set_llc_colors(xc_interface *xch, uint=
32_t domid,
                              const uint32_t *llc_colors,
                              uint32_t num_llc_colors);
=20
+/*
+ * Allocate guest IOMMU vSID and establish its mapping to pSID.
+ * It can only be used on domain DT creation.
+ * Currently used for ARM only, possibly for RISC-V in the
+ * future. Function has no effect for x86.
+ */
+int xc_domain_viommu_allocate_vsid_range(xc_interface *xch,
+                                         uint32_t domid,
+                                         uint16_t nr_sids,
+                                         uint32_t first_psid,
+                                         uint32_t *first_vsid);
+
 #if defined(__arm__) || defined(__aarch64__)
 int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 01c0669c88..39ffe80e6d 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -2222,6 +2222,29 @@ out:
=20
     return ret;
 }
+
+int xc_domain_viommu_allocate_vsid_range(xc_interface *xch,
+                                         uint32_t domid,
+                                         uint16_t nr_sids,
+                                         uint32_t first_psid,
+                                         uint32_t *first_vsid)
+{
+    int err;
+    struct xen_domctl domctl =3D {};
+
+    domctl.cmd =3D XEN_DOMCTL_viommu_alloc_vsid_range;
+    domctl.domain =3D domid;
+    domctl.u.viommu_alloc_vsid_range.first_psid =3D first_psid;
+    domctl.u.viommu_alloc_vsid_range.nr_sids =3D nr_sids;
+
+    if ( (err =3D do_domctl(xch, &domctl)) !=3D 0 )
+        return err;
+
+    *first_vsid =3D domctl.u.viommu_alloc_vsid_range.first_vsid;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 7b887898bb..79904b746c 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -955,6 +955,13 @@ static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
     return 0;
 }
=20
+/*
+ * Stores starting vSID of vPCI IOMMU SID range
+ * Used as a lookup value to avoid repeated
+ * vSID range allocation on every fdt resize.
+ */
+static int vpci_first_vsid =3D -1;
+
 static int make_vpci_node(libxl__gc *gc, void *fdt,
                           const struct arch_info *ainfo,
                           struct xc_dom_image *dom)
@@ -963,6 +970,9 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
     const uint64_t vpci_ecam_base =3D GUEST_VPCI_ECAM_BASE;
     const uint64_t vpci_ecam_size =3D GUEST_VPCI_ECAM_SIZE;
     const char *name =3D GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
+    uint16_t iommu_range_size =3D 0x1000;
+    uint32_t first_vsid;
+    uint32_t first_psid =3D 0;
=20
     res =3D fdt_begin_node(fdt, name);
     if (res) return res;
@@ -996,8 +1006,20 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
         GUEST_VPCI_PREFETCH_MEM_SIZE);
     if (res) return res;
=20
+    /* request vSID range allocation if not already allocated */
+    if (vpci_first_vsid < 0) {
+        res =3D xc_domain_viommu_allocate_vsid_range(CTX->xch, dom->guest_=
domid,
+            iommu_range_size, first_psid, &first_vsid);
+        if (res)
+            return res;
+        vpci_first_vsid =3D first_vsid;
+    }
+    else {
+        first_vsid =3D vpci_first_vsid;
+    }
+
     res =3D fdt_property_values(gc, fdt, "iommu-map", 4, 0,
-                              GUEST_PHANDLE_VSMMUV3, 0, 0x10000);
+                             GUEST_PHANDLE_VSMMUV3, first_vsid, iommu_rang=
e_size);
     if (res) return res;
=20
     res =3D fdt_end_node(fdt);
@@ -1326,11 +1348,92 @@ static int copy_partial_fdt(libxl__gc *gc, void *fd=
t, void *pfdt)
     return 0;
 }
=20
-static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+/*
+ * Store virtualized 'iommus' properties for every node attached to IOMMU
+ * and passthroughed to guest.
+ * Used as a lookup table for mapping <phandle pSID> -> <vhandle vSID>
+ */
+struct viommu_stream {
+    XEN_LIST_ENTRY(struct viommu_stream) entry;
+    char path[128];          /* DT path, stable across resizes */
+    fdt32_t *iommus;         /* fully virtualized iommus property */
+};
+
+static XEN_LIST_HEAD(, struct viommu_stream) viommu_stream_list;
+
+/*
+ * Helper function which creates mapping of dt node to
+ * to virtualized 'iommus' property
+ * Mappings stored in a global 'viommu_stream_list' to
+ * make it reusable for every fdt resize
+ */
+static int viommu_get_stream(libxl__gc *gc,
+                             uint32_t domid,
+                             const fdt32_t *prop,
+                             int proplen,
+                             const char* path, fdt32_t **iommus)
+{
+    int i, r;
+    uint32_t vsid, psid;
+    struct viommu_stream *viommu_stream;
+
+    /* Lookup if stream for target device is already allocated */
+    XEN_LIST_FOREACH(viommu_stream, &viommu_stream_list, entry)
+    {
+        if (!strcmp(viommu_stream->path, path)) {
+            *iommus =3D viommu_stream->iommus;
+            return 0;
+        }
+    }
+
+    /* Allocate new viommu stream */
+    viommu_stream =3D malloc(sizeof(struct viommu_stream));
+    if (!viommu_stream)
+        return ERROR_NOMEM;
+    memset(viommu_stream, 0, sizeof(struct viommu_stream));
+    viommu_stream->iommus =3D malloc(proplen);
+    if (!viommu_stream->iommus)
+        return ERROR_NOMEM;
+    memset(viommu_stream->iommus, 0, proplen);
+
+    LOG(DEBUG, "Creating vIOMMU stream for device %s",
+        path);
+
+    /*
+     * Virtualize device "iommus" property
+     * (replace pIOMMU with vIOMMU phandle and pSIDs with mapped vSIDs)
+     */
+    for (i =3D 0; i < proplen / 8; ++i) {
+        viommu_stream->iommus[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV=
3);
+        /* Allocate new vSID mapped to pSID */
+        psid =3D fdt32_to_cpu(prop[i * 2 + 1]);
+        r =3D xc_domain_viommu_allocate_vsid_range(CTX->xch, domid, 1, psi=
d, &vsid);
+        if (r) {
+            LOG(ERROR, "Can't allocate new vSID/vRID for guest IOMMU devic=
e");
+            return r;
+        }
+        viommu_stream->iommus[i * 2 + 1] =3D cpu_to_fdt32(vsid);
+        LOG(DEBUG, "Mapped vSID: %u to pSID: %u", vsid, psid);
+    }
+
+    strcpy(viommu_stream->path, path);
+    *iommus =3D  viommu_stream->iommus;
+
+    XEN_LIST_INSERT_HEAD(&viommu_stream_list, viommu_stream, entry);
+
+    return 0;
+}
+
+/*
+ * Used to update partial fdt when vIOMMU is enabled
+ * Maps dt properties of IOMMU devices to virtual IOMMU
+ */
+static int viommu_modify_partial_fdt(libxl__gc *gc, void *pfdt, uint32_t d=
omid)
 {
-    int nodeoff, proplen, i, r;
+    int nodeoff, proplen, r;
     const fdt32_t *prop;
     fdt32_t *prop_c;
+    char path[128];
=20
     nodeoff =3D fdt_path_offset(pfdt, "/passthrough");
     if (nodeoff < 0)
@@ -1344,11 +1447,16 @@ static int modify_partial_fdt(libxl__gc *gc, void *=
pfdt)
         if (!prop)
             continue;
=20
-        prop_c =3D libxl__zalloc(gc, proplen);
+        r =3D fdt_get_path(pfdt, nodeoff, path, sizeof(path));
+        if ( r < 0 ) {
+            LOG(ERROR, "Can't get passthrough node path");
+            return r;
+        }
=20
-        for (i =3D 0; i < proplen / 8; ++i) {
-            prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
-            prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
+        r =3D viommu_get_stream(gc, domid, prop, proplen, path, &prop_c);
+        if (r) {
+            LOG(ERROR, "Can't get viommu stream");
+            return r;
         }
=20
         r =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
@@ -1360,7 +1468,6 @@ static int modify_partial_fdt(libxl__gc *gc, void *pf=
dt)
=20
     return 0;
 }
-
 #else
=20
 static int check_partial_fdt(libxl__gc *gc, void *fdt, size_t size)
@@ -1379,7 +1486,7 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt,=
 void *pfdt)
     return -FDT_ERR_INTERNAL;
 }
=20
-static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+static int viommu_modify_partial_fdt(libxl__gc *gc, void *pfdt, uint32_t d=
omid)
 {
     LOG(ERROR, "partial device tree not supported");
=20
@@ -1511,7 +1618,7 @@ next_resize:
         if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3) {
             FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
             if (pfdt)
-                FDT( modify_partial_fdt(gc, pfdt) );
+                FDT( viommu_modify_partial_fdt(gc, pfdt, dom->guest_domid)=
 );
         }
=20
         for (i =3D 0; i < d_config->num_disks; i++) {
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad914c915f..9679c386e5 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -16,6 +16,7 @@
 #include <xen/types.h>
 #include <xsm/xsm.h>
 #include <public/domctl.h>
+#include <asm/viommu.h>
=20
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info)
@@ -179,6 +180,36 @@ long arch_do_domctl(struct xen_domctl *domctl, struct =
domain *d,
     }
     case XEN_DOMCTL_dt_overlay:
         return dt_overlay_domctl(d, &domctl->u.dt_overlay);
+
+#ifdef CONFIG_VIRTUAL_IOMMU
+    case XEN_DOMCTL_viommu_alloc_vsid_range:
+    {
+        int rc =3D 0;
+        uint16_t i;
+        uint32_t vsid;
+        struct xen_domctl_viommu_alloc_vsid_range *viommu_alloc_vsid_range=
 =3D
+            &domctl->u.viommu_alloc_vsid_range;
+
+        for ( i =3D 0; i < viommu_alloc_vsid_range->nr_sids; i++ )
+        {
+            rc =3D viommu_allocate_free_vid(d, viommu_alloc_vsid_range->fi=
rst_psid
+                                            + i, &vsid);
+            if( rc )
+                return rc;
+        }
+
+        if ( !rc )
+        {
+            /* Calculate first vSID from allocated range */
+            viommu_alloc_vsid_range->first_vsid =3D vsid -
+                viommu_alloc_vsid_range->nr_sids + 1;
+            rc =3D copy_to_guest(u_domctl, domctl, 1);
+        }
+
+        return rc;
+    }
+#endif
+
     default:
         return subarch_do_domctl(domctl, d, u_domctl);
     }
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 8f6708c0a7..bb6d867cb8 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1276,6 +1276,22 @@ struct xen_domctl_get_domain_state {
     uint64_t unique_id;      /* Unique domain identifier. */
 };
=20
+/*
+ * XEN_DOMCTL_viommu_alloc_vsid_range
+ *
+ * Allocate guest vSID range and
+ * establish pSID->vSID mapping for target range.
+ * Allocated range is continous
+ */
+struct xen_domctl_viommu_alloc_vsid_range {
+    /* IN: Range first pSID  */
+    uint32_t first_psid;
+    /* IN: Number of vSIDs to allocate */
+    uint16_t nr_sids;
+    /* OUT: Mapped range first vSID */
+    uint32_t first_vsid;
+};
+
 struct xen_domctl {
 /* Stable domctl ops: interface_version is required to be 0.  */
     uint32_t cmd;
@@ -1368,6 +1384,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_set_llc_colors                89
 #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
+#define XEN_DOMCTL_viommu_alloc_vsid_range       91
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1436,6 +1453,7 @@ struct xen_domctl {
 #endif
         struct xen_domctl_set_llc_colors    set_llc_colors;
         struct xen_domctl_get_domain_state  get_domain_state;
+        struct xen_domctl_viommu_alloc_vsid_range viommu_alloc_vsid_range;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b250b27065..91e80ea80d 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -820,6 +820,10 @@ static int cf_check flask_domctl(struct domain *d, uns=
igned int cmd,
     case XEN_DOMCTL_set_llc_colors:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SET_LLC_COLO=
RS);
=20
+    case XEN_DOMCTL_viommu_alloc_vsid_range:
+        return current_has_perm(d, SECCLASS_DOMAIN2,
+            DOMAIN2__VIOMMU_ALLOC_VSID_RANGE);
+
     default:
         return avc_unknown_permission("domctl", cmd);
     }
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/acc=
ess_vectors
index ce907d50a4..e4ffe2f5db 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -255,6 +255,8 @@ class domain2
     set_llc_colors
 # XEN_DOMCTL_get_domain_state
     get_domain_state
+# XEN_DOMCTL_viommu_alloc_vsid_range
+    viommu_alloc_vsid_range
 }
=20
 # Similar to class domain, but primarily contains domctls related to HVM d=
omains
--=20
2.43.0

