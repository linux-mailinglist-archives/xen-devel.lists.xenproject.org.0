Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XyGIHYeqVmq4/wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 23:30:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5C4758FFE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 23:30:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b="jKj/Ec2/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1362580.1614391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjki6-0004zS-8W; Tue, 14 Jul 2026 21:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362580.1614391; Tue, 14 Jul 2026 21:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjki6-0004wl-5b; Tue, 14 Jul 2026 21:30:38 +0000
Received: by outflank-mailman (input) for mailman id 1362580;
 Tue, 14 Jul 2026 21:30:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wjki4-0004wM-6M
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 21:30:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjki3-0028r4-Ar
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 23:30:35 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a56aa09-bab6-0a2a0a5309dd-0a2a45018162-44
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 23:30:34 +0200
Received: from [52.101.125.86]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a56aa78-5984-0a2a45010019-34657d566cbf-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 23:30:34 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB6353.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:335::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 21:30:31 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 21:30:31 +0000
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
 b=B33iiX22fokPxM3CSagnFFDHU6PTWLYxNiDX/bseuVCJqvHczpUEVpac3O3uYwiCseNV///AEnqkkgBotFqDLgSWVIVMVSDwRHm2oz3+Y58rw1mL54OU1TP1FIf1/DwUFEy3D91w5TEC+tVIp3JNMLKIX/FFZ+pc4HaHYUJtcejD+e3OSNxF5T1Z7Vjg0ShygMXbS03fveKIRaDNbp8j2gxQdMnywCGKEpBPzSjNql/Bat7rD+7P7fWcTjGlspjG5luVDWC41uqFdBzDtcZn1FsA6E+dlSeztj6sPRu4wxFFA8BdOUBwb2wDNTbRm049Z0gxmdZHdbSb3WVKYAxOlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOJvXg7cAAxmAm/Wbhg/4vVy+dTO6gUZT+sQlS+81Bc=;
 b=xhPIw3cwNsUdu6qRpB9ytcaZ54J94zahpA34D03Mhx4aw7CkDkMFcw3MzFuP88MxkZy9D2g9sdAI2w/F06rpHC+b0Z49Q0Wz9oiJIr9OiZP3aiBkNF8guAGDKhCvQqWfj5xoHIAgfvBLUwBPaU1XDwcocYVEWxs0WxNkiqe/YzOF1OJ12VRcEeieVOAmFH60QiLOiINI/v63ss1OXkplGPa8VSHHbR7saBZ2gCCduxOt05j/uaqV+nVktTvA8wsRLrqjEtAyj9Yrfaf9i4LHTaA6RtDj7hcqNomOh6T+QTP4u1LcTkULSau81pbF6qVjME3MCExFl4BdTryw7jnAZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOJvXg7cAAxmAm/Wbhg/4vVy+dTO6gUZT+sQlS+81Bc=;
 b=jKj/Ec2/BpXFtfKDuYPprFj6LBRW2raCIJf2+heHybnqWT78PVZa20gws1jELTAgVgo8f+P6lTFHUZQM4MJ1IJxnsu5xofPhvxtP3y/VISInLcZJgvlCNz+L/v86RjsOR5P2AWDSwITRkv+zKNRy11xtWilCtF1apu+SJwuHUBQ=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: RE: [PATCH v6 5/5] xen/acpi: Parse PPTT to initialize CPU topology
Thread-Topic: [PATCH v6 5/5] xen/acpi: Parse PPTT to initialize CPU topology
Thread-Index: AQHdE336EabuJxSEHUSo4bExE1f467ZthrLggAAB8dA=
Date: Tue, 14 Jul 2026 21:30:30 +0000
Message-ID:
 <OS9P286MB72222CC8A5C8B0E329F8A9B082F92@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-6-taka@valinux.co.jp>
 <OS9P286MB7222D458C3248E908695F2DB82F92@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To:
 <OS9P286MB7222D458C3248E908695F2DB82F92@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY4P286MB6353:EE_
x-ms-office365-filtering-correlation-id: 6dcf5efa-d190-4294-df4e-08dee1ef2195
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 RcPeuhUsCYoN8MK8wNGXyCuvB5HrEwyUcLsYsKAYF0vlH0FmiHNChhHhS8JMdEuI/p6eaClRBHfNl7TYtTFllUBFbfgwJuBX4yhlrtJ39OMmT1xQWWTehn4Q5Sr2bGTMve0f6pWyxkTuBrnYPYQ3yxZNiV/pURozsqtbAU9o3uV53+osTssBgWC/N9j5aYk8++Yy80ANV5D0513iM3g5+xKOnOpxNBROmqOeI2HYNLbBTJMeaIY3q1riWdZAHG8CO4QMStDZGuzCg8YlzTME0nSKZNnX7Z1bE889lezy+ttbzKjSy/1QJuRerjA8wH6Dz/lz6q3unixtT5LUP2bIoF9VyJvLYaCPNsAT9Yf4/14b4tyWpmNPZIIIkJDH7lXZdf7Gp8fsjfUA18ilOtM8XBM3EO5GVGyHELnGGAwI+nGYBl6Q6qJ4wdQuByFKNmYUgTN3sBqDJpyZRgOpnl0WJiqYzyXplhI7nWtJGVGfo4/D7jc3hpYYkVfNy2dr6KhuJPGiOPhX6IZGAR9yVS9qJyzelF6/1tLHyapby0uu0dWo2tShtiVfV6j/KjkcU4fXkhGUpe9FVJXGJODZ7LADDudW5Sx26hRokwQxvqk0U0YJjF9uT7gW4FPPXsjbCp5phIVvWzNNvCWAomnBJeoX/DubJ/78m7rh5GWJisBgKNO9lgvaJh0tpMmehoqNjec5jMDFjG9qTT1T5n8CSV6GVg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?q7Dk/HnKYLhgGDBzhT7HawrGSPIB9Tg+LS/QDhcszXeSmY6zbMgVLsHzit?=
 =?iso-8859-1?Q?PILzW5R8aaus2BX6mTIx9LabOw9IximYw71tUI4lNL+wC71XejLzAKz9C4?=
 =?iso-8859-1?Q?pBUSSozzMmn1d/Q/BRVgWcBkJJ4zniQnlsyuhtsHMMzHPywY/0acHT/NNv?=
 =?iso-8859-1?Q?gOy74MzjnkDwrwCHguL/K7S2F47yFqmTHb7jPHufLxt1PdK8A3tBU0rsLU?=
 =?iso-8859-1?Q?p4T29v1K4vfnAdrvdR+VyvP1RNZUM0fnIg9GG6bpuC42lqQMOuUTxQ/BZq?=
 =?iso-8859-1?Q?VmYzjSYJj91p2wKPVI+AOopyesTusxdcqtk58WozZYNDCP8hruk6Q6OAxE?=
 =?iso-8859-1?Q?1GHsErvz1Y50yTovj/+E5HbRo75EdjAdLMgorPSa4TYagpwq71mLIyXBks?=
 =?iso-8859-1?Q?sTkjy2WosqAgslM6vmkR/GcKxN+UrlHAMseT3imT25xrVmFeBafqpSWZDA?=
 =?iso-8859-1?Q?ZWOc7PRV5xMFkmlToU2ni/QXi1V5eLzFkwEI5n0WRa3+xUvAfKZ/jiPb6C?=
 =?iso-8859-1?Q?41UrhTbfYHgUKyOB2x/7VOVK591AwPDpQ234ptujY50z1adva/o5brzDI6?=
 =?iso-8859-1?Q?kC0fYjACjwoX+BKJgXse9Njkyr/gLR+XVBMqvUc3YXPG6RhbH/notqXVQm?=
 =?iso-8859-1?Q?3X8AmfvjwszM+2itWnLV/8oxKeYcr0NZ/Dq6YOWLHys5/nY80cnhsJ3AiJ?=
 =?iso-8859-1?Q?5uUvrKX383yPwo5Bk5gCTxDahVINB/QauI3Ywikt0u8OywYZXGxgIduc/3?=
 =?iso-8859-1?Q?nTn+wA0GDgs0HKzQsI68qkdNadYNtJpuxoCxBmHBkELqauW6VL8Xg9Yg+R?=
 =?iso-8859-1?Q?abmkCIgjr+trGIzojQBezXVDHuQSbHOAq87EiqIgp8tBWvZul1mDo1Rs/n?=
 =?iso-8859-1?Q?viSmdlpSV2N2CU/eCvLzMuIJyMFz0TL5T264X+jvwHN5khORxTkjZq6VwE?=
 =?iso-8859-1?Q?fStuiIU0YNIdfKA50FmPFUr8PynIwwrmcgJLi3PvOTC+upE/p6KCT2J/Jq?=
 =?iso-8859-1?Q?d3t2HCnzEPXaqeoUqOej4Anlj0XTHq4na094O+lVS11Eyn0txklTMd/sxe?=
 =?iso-8859-1?Q?Q7dOZ/VdeqfI2zVQWOSUp2H4JgQSQ8id5cKjlNeBePW9CUq2yUfywowW8P?=
 =?iso-8859-1?Q?ZeVv0MKfawkUbAdAorzTF9r0avood9jVFLG88StpZNjU+mu+ObHYU0GCB+?=
 =?iso-8859-1?Q?879wjnXqQfWxc5WUtXTLyDn7ZCZc7R6wdnr3xqo5rddW+ggk5YlIEFt5lB?=
 =?iso-8859-1?Q?icDJ37Uym7dZeGVhjtEiPOrVhFeV3yihANErfXGfO3Zw/rgSf9xHvhyrZe?=
 =?iso-8859-1?Q?haE9P5ItFd7YagCZbWQJ7HhUIVCAltXwsx/fWb+IgQtVAjb7p6R4lIbK9e?=
 =?iso-8859-1?Q?lrK2ZCYGo6tse9+SCZHkoJVbYemEr81k5dSpDz9HW86fuG2KRvfizrRBu0?=
 =?iso-8859-1?Q?qM6VUfByfeMFS1IxvWVk91V6tez11F4UMZGHzX/UpXtVbEqHWNLn/I+KNi?=
 =?iso-8859-1?Q?pMTFllvoCMxhA4ItujIMLBr+xtXx87QIS9fiA9GVqopDVSi4C1XxOWYkur?=
 =?iso-8859-1?Q?e2l5FcJa0yHe3T54v7Gs4H75mpV6HjvZtQ21rYBPWnfQymcJb7bNX+JnMj?=
 =?iso-8859-1?Q?nTt+8x7hGY3SW9UIkaU1/9Rqx9+6PGrEgkKiPd5ibkePUuwPieYoPi1GcA?=
 =?iso-8859-1?Q?aA4hCqgybO5T0w5AT9dM3vsF+RJs9xQ9c8k9YCaNuA4CUZG4VX/Bit896x?=
 =?iso-8859-1?Q?81TZ6eMHbwqRHIqeMfFTrsaKfYZsabr5FVPhHUj+rciX2q?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dcf5efa-d190-4294-df4e-08dee1ef2195
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 21:30:30.9781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0tXYt5zQE4qQOD5Dvmz5v0kG6i3hWJfoRPxInfsG29Zo+o/Ys8z6saBmNw+4T3iBGOLjTpYO35qIy6bbfISA2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6353
X-purgate-ID: tlsNG-d62444/1784064634-BD67C757-42E678BF/0/0
X-purgate-type: clean
X-purgate-size: 898
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid,valinux.co.jp:from_mime,valinux.co.jp:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC5C4758FFE

Hello

> > diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
> > index 56fcfa4945..e6dea527a6 100644
> > --- a/xen/drivers/acpi/topology.c
> > +++ b/xen/drivers/acpi/topology.c
>=20
>=20
> >  int __init acpi_init_cpu_topology(void)
> >  {
> > +    acpi_status status;
> > +    struct acpi_table_header *table_header;
> > +    const struct acpi_table_pptt *pptt;
> > +    unsigned int num_sockets =3D 0;
> > +    unsigned int num_clusters =3D 0;
> > +    unsigned int num_cores =3D 0;
> > +    unsigned int *socket_map =3D xmalloc_array(unsigned int, nr_cpu_id=
s);
> > +    unsigned int *cluster_map =3D xmalloc_array(unsigned int, nr_cpu_i=
ds);
> > +    unsigned int *core_map =3D xmalloc_array(unsigned int, nr_cpu_ids)=
;
>=20
> These have to be xzmalloc_array().

xzalloc_array()

> I will fix it in v7.
=20
Thank you,
Hirokazu Takahashi.


