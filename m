Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNruGvIoy2n8EQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C03632FD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268230.1557582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH5-0000nr-1I; Tue, 31 Mar 2026 01:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268230.1557582; Tue, 31 Mar 2026 01:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH4-0000it-NE; Tue, 31 Mar 2026 01:52:10 +0000
Received: by outflank-mailman (input) for mailman id 1268230;
 Tue, 31 Mar 2026 01:52:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OH1-0000WA-Oh
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OH1-00G5Gh-4W
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:07 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c1-2eae-0a2a0a5409dd-0a2a4501906e-10
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:07 +0200
Received: from [40.107.130.136]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c6-6400-0a2a45010019-286b8288781d-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:07 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by PAWPR03MB9202.eurprd03.prod.outlook.com (2603:10a6:102:342::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:05 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:05 +0000
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
 b=YqZ46PbL9F2AS8mQg+Re8XDbSMitY7CsvWHGRcODBFntiT3XH5ThbHNPAJCnsFBGvKfd/RdO3LuTS6ai5hY48OEyNJaLFnNGPVl4A5GKpI/nQA20n8++zHSjL2ECur++GPv1awA5VKuA3m79fm+Xbs+gj+5TyGnbFAM1WkfJkQ5yJIaFR6N3YtreVORRM7Hjk9xxPEQZs/jlrQQWrC5+5N+D33CSRP6ntA+qk+w7z503MKkIaRlbhMUlNn3GO32pwxnm+CjwdiExbsqDDou9rpF7dPHyM4xSfAj7OMQ8Y1odk/cDc8SuEyhl17bK4Fv9bHC/Nd+a45NmDgAMBgenjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDUYrSIdo53ObCotDr7tj5YH439JuLXwKScEzghD/yo=;
 b=Dc+53AGUKmP4wpCEE5wtVIEf1Ct0Fv6dDQcc1rZEmHbn3rrGwfTNdXhgPccO/buaXZCFsTmbOt/wxa9BHvlSZ2ckPyx08RyJTm5xYViZEgO7ASyVSg+fmToDJ2OJ2Uxh0nZZTtuLegsD4/snX+8rnFEbYkPqYJyzIifYxeWrkCmR5fUuZ7REnDWxWu8//lm0FgaNDJCx0FBCJ+hmLWP2k6qgnmZGNOTrM79vMaPGrVkbHAp251m4sga85+uR2RjlEfoUKaNYzjVRQpRwpIlm7nBq81CR0CDWBn3HriUEQVRLusoYmKavdz1GpoaGTe8GoH74MfBopQvOr7uI9Jm9bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDUYrSIdo53ObCotDr7tj5YH439JuLXwKScEzghD/yo=;
 b=kyK/x9oZHvNd9RPV0d48dgDeS/6EFivBFH97CjQ1q+GXAzz7fnOU99CBukpok6RyASbPej53tH61Ih+8YWJUSsEXzlBVQSqvr3//DsY1gV4fYDec6krV5fhfk58G2UnGZuKfbtDou2aqBvL/4f0uDPLPG6hq3W6pTuvCjVbYURkGpaaDACmvVrqeEgBxvVY4ABh5vj7i2fWo7iGDX1m14i30WnrvtRtYxBL2bJvXA8dGGWcAeTEpsBoi3zX0tlcHwfntooEYyneMRtNfHzFrP3HX+ce1fIxCyo2wGxTHyfm7M0VGSwvfIAzJOFpDdQvPYYvRn6yl6gYlwjIEsHM6jQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v3 07/23] xen/arm: vIOMMU: Add cmdline boot option "viommu =
 <string>"
Thread-Topic: [PATCH v3 07/23] xen/arm: vIOMMU: Add cmdline boot option
 "viommu = <string>"
Thread-Index: AQHcwLD57usK/+AyOEiltLG6u3MZ5g==
Date: Tue, 31 Mar 2026 01:52:05 +0000
Message-ID:
 <5d86efa38ca99439153822fa19064bda6843fdc2.1774918270.git.milan_djokic@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|PAWPR03MB9202:EE_
x-ms-office365-filtering-correlation-id: 528b943c-3f13-4806-ac3b-08de8ec81c3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 qX1ak689Gl8cWmJ4ADLlEzG6RZMnCS7jQOIAs2T/rg64/5O1W5wqMyPNgWP09cO1mvmKmOxwCCR7Db3RNie4RrAM4iRRXz3Qoo9uPqM3sxINewY4z7hLE1Ifz0CNw60BJnE2eV5gcraLjN/yje6D29mBuduM1GgrJRrkBqSTCRY874o7EdOohZmJf4fOGLCwvT7uq167ig6Nnb81yb1iCA/JU/NjuAGrSe/g6oAKZU0ldWNkHE+C8Es6Yc8TqBUpy2w9TjJAVrXJg7r1gT3wl3W5xfa1CMyHkP7y0FQlDtHIdZUKmPuoUz+eLNXjbDQ+FnZxRAMLLQD84A9xe/tARN8+g06pT8xkGKV+SREIkJuCC1YXq7jDK2xbVZ6sawsc94rySv1vMsC8QTliHTV1QwcFfbN3FJ8KcxGahOKDlocmSai1iKRDT4ZneaoD7H7B6HnGOHJV7MrAywLA3veuMiGwe4cnVQW5jh0TAhyPbxg4POY+OyUw/QCPNKMOMc6Yl+2v+Rn7DH1Ks0UQw4sUPyF4PzpXhBqjKBePcS32zpfbhYiAcHkouDVO58e09MUknL1RZiu5Bj5v/3WJceVOC/6SewZm/cm9a963Xw38my+yNIDiogAzZ9dF45g2yM1ubGaxq8vsvOvbsPo9aeiaSoYVtvnXKpk8hzNyZQMglesYGAUGp9IAwEpQK4xlxyj03xkrrWzE5cNa2dQHxCN55+87tjrbKu+zjwFmMDJjJ47ciPki9zZcfniMkZYmhnEgzOav+/PGtHT+Yn7yNDX3neqthkiXF2NJc6mWf0Qz1Mk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?owWB9g2Hu+BALjoe/EcpSgi3k0044MqYX1RsGyp+/0H0grLhlPq0knvEqH?=
 =?iso-8859-1?Q?oA9y1eVET+GofFnkue2vr8tqORZsXYxDYJzHAX21X/NqZurI4LvCZUlthI?=
 =?iso-8859-1?Q?gAP2B+Xz6sKHV1Av04iYPZfnZJAcOkH39KD7ZaVgU1jobsf478DxDU82Jh?=
 =?iso-8859-1?Q?1p3bS/YQlfD0/qFMwxCcqYrhP+h0nl2+pdyz54bDjlBCUZ9pzhXBsTfWHU?=
 =?iso-8859-1?Q?DnrBqn19kt6Yi76pbiEllkzL1lp60y345IXzgVeh6AATljflZoPqaiLez3?=
 =?iso-8859-1?Q?OUs7soMO5LZ2h/oQ272sEV9CKv2OMqBguQ2S4YIsgeXBopK52q5O5KmGrD?=
 =?iso-8859-1?Q?O5sMK9h6Ymj+VhrAQE3u9yryM/2ASZpG2LOuH3IhW59ZE1co78KjpcTb6D?=
 =?iso-8859-1?Q?DfiIC6qbFNZ0xpqtXi6Q4a2g8FeVPWYBTVHzB063MlIGHI+8IitCD6fVZx?=
 =?iso-8859-1?Q?5tjrgrjfMAXZq8o4D6RLFEoM9SaBHlTByNYplqLUMUSyA8t6xA++plGJYP?=
 =?iso-8859-1?Q?YAQA0tep/7lB4qaBC/Rw4ALoqaI6x7/2nKKRFzFYJTG0zi5+dKH/5Yyd1B?=
 =?iso-8859-1?Q?RI/U9nFfnoVAIeiNMoKyeLaHrtHON1kQWHl/p6ZloXuxwT560Ipt7x0XcP?=
 =?iso-8859-1?Q?wKH79+xcm78i/QCguY4gs4yLZmCVimlurw1lD3HSIBkvllZ3igrS8tTbx9?=
 =?iso-8859-1?Q?k2EaJFQFQVrlJcg5GOwii+lR8FIUUN+XKd62SVrHfSIrXcRPsLKcsbJN27?=
 =?iso-8859-1?Q?RessUGIhGTx8lU3bPhSbH9ZeDCPNK/2bPjSO9vbqNrLjhbSVjRmfzespUj?=
 =?iso-8859-1?Q?rC35KU8/oQemDYSdpZkrgf8FMYtFK6B43y8MfM5Y82ggonEu0vfuIm/Qc5?=
 =?iso-8859-1?Q?gpRlEydf367xMGtwcqjvJSCOpHH8ytnT6vqg2AoPJujMDaLpPsYdhf1A5Q?=
 =?iso-8859-1?Q?CiAy1mUn08rH8AnObxo7nZfIsFHQwo9HKjyPMW1GEaaqP6rQPdMgSBMWq5?=
 =?iso-8859-1?Q?leaM3FPQu9PKJALkHPwB6fsIMLTM47JLE5z9aim/BtL2mgLq16JkWUtoH3?=
 =?iso-8859-1?Q?RAttr5HuNPqf6eHIktEU64j3g2AmHQU9LMMK83tPBH2q0VM07hYHO+rfzz?=
 =?iso-8859-1?Q?HVEPkXzF7rGRb8s6nscckCZilccl8LgwMI/xJVV+18yvaq9A39jSLMy9nd?=
 =?iso-8859-1?Q?vG6LSj6S8C9/Lw1sKc6xirEmxllywai0KfxTzVw5JQNFg0VL2HCZrydNZ7?=
 =?iso-8859-1?Q?c5Yjm06DR4geUmsfBxX5cn6hzwduqP9SomD4iGSxi5QUS9yb6vpDrimB0I?=
 =?iso-8859-1?Q?nffNq6xSkUHh/IRQrem5kqLkkTvgAUmuRqbt4XylQASoOixmsRa2+XvBCp?=
 =?iso-8859-1?Q?DohDaCjeYj4+dFx7j8W2Mzxw7NzK23iLZi7vjlPwM1SUt/8zYfQqp4gnE8?=
 =?iso-8859-1?Q?8d7rY4T5scC1g6ggNWvdJeI2fA2G3rB1Lt2JcTC4ksUaXPpSBKjIqneRnf?=
 =?iso-8859-1?Q?n8JkMAXm30tFX7qJhMUKsasm1UA7STrPXJ9EEDhUvHp7WJqp9EUSuNMWMJ?=
 =?iso-8859-1?Q?FdEWGx9WU8cc4+sVuG2ShrF4TseqnHDe6AZ4R3zcOrbqfjmSJ8Brpv31bh?=
 =?iso-8859-1?Q?WpZd/t7UVMSpxWhlYLbMkSJX1hlp9FboaDIUHQ+cv+t+AIuAcAr6rCzJgH?=
 =?iso-8859-1?Q?kiRt6lKFBBKzRQUcKPz9XI46k3jLE4M0LLty1dndBjMNYwJU8PjXz+0mTN?=
 =?iso-8859-1?Q?9Rf6sN03MQbBoDoKpCTrccllN9Yr0TqwkJK1OhuB8WZg8PC6WZpXzrTnqJ?=
 =?iso-8859-1?Q?6VhGreXAWgU8Pam2zXR8BtyebZgiDIA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528b943c-3f13-4806-ac3b-08de8ec81c3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:05.1342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v4DZpXyb4AfdC6/AUFa3aScXf6NTEjgFu/3Jm/8/KPVg5yJmndUYsCv/N46Ssg9O+RvdZqNGf5+kn4v90wPFHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9202
X-purgate-ID: tlsNG-d62444/1774921927-48815DF3-EF10D7B7/0/0
X-purgate-type: clean
X-purgate-size: 3984
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
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 247C03632FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Add cmdline boot option "viommu =3D <string>" to enable or disable the
virtual iommu support for guests on ARM (only viommu=3D"smmuv3" supported
for now).

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 docs/misc/xen-command-line.pandoc      |  9 +++++++++
 xen/arch/arm/include/asm/viommu.h      | 12 ++++++++++++
 xen/drivers/passthrough/arm/viommu.c   | 11 +++++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.c |  3 +++
 4 files changed, 35 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 6c77129732..6531c2355c 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2850,6 +2850,15 @@ The optional `keep` parameter causes Xen to continue=
 using the vga
 console even after dom0 has been started.  The default behaviour is to
 relinquish control to dom0.
=20
+### viommu (arm)
+> `=3D <string>`
+
+> Default: ``
+
+Flag to enable or disable support for the virtual IOMMU for guests. Disabl=
ed by
+default. Enable by specifying target IOMMU type (if supported). Only "smmu=
v3"
+IOMMU emulation supported at this point.
+
 ### viridian-spinlock-retry-count (x86)
 > `=3D <integer>`
=20
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
index 2a6742de73..ed338fe0ec 100644
--- a/xen/arch/arm/include/asm/viommu.h
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -10,6 +10,7 @@
 #include <public/xen.h>
=20
 extern struct list_head host_iommu_list;
+extern char viommu[];
=20
 /* data structure for each hardware IOMMU */
 struct host_iommu {
@@ -50,6 +51,12 @@ uint16_t viommu_get_type(void);
 void add_to_host_iommu_list(paddr_t addr, paddr_t size,
                             const struct dt_device_node *node);
=20
+static always_inline bool is_viommu_enabled(void)
+{
+    /* only smmuv3 emulation supported */
+    return !strcmp(viommu, "smmuv3");
+}
+
 #else
=20
 static inline uint8_t viommu_get_type(void)
@@ -76,6 +83,11 @@ static inline void add_to_host_iommu_list(paddr_t addr, =
paddr_t size,
     return;
 }
=20
+static always_inline bool is_viommu_enabled(void)
+{
+    return false;
+}
+
 #endif /* CONFIG_ARM_VIRTUAL_IOMMU */
=20
 #endif /* __ARCH_ARM_VIOMMU_H__ */
diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough=
/arm/viommu.c
index 53ae46349a..5f5892fbb2 100644
--- a/xen/drivers/passthrough/arm/viommu.c
+++ b/xen/drivers/passthrough/arm/viommu.c
@@ -3,6 +3,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/irq.h>
+#include <xen/param.h>
 #include <xen/types.h>
=20
 #include <asm/viommu.h>
@@ -38,8 +39,18 @@ void add_to_host_iommu_list(paddr_t addr, paddr_t size,
     list_add_tail(&iommu_data->entry, &host_iommu_list);
 }
=20
+/* By default viommu is disabled.
+ * If enabled, 'viommu' param indicates type (smmuv3 is only supported typ=
e atm)
+ */
+char __read_mostly viommu[10] =3D "";
+string_param("viommu", viommu);
+
 int domain_viommu_init(struct domain *d, uint16_t viommu_type)
 {
+    /* Enable viommu when it has been enabled explicitly (viommu=3D"smmuv3=
"). */
+    if ( !is_viommu_enabled() )
+        return 0;
+
     if ( viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
         return 0;
=20
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 6b4009e5ef..e36f200ba5 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -105,6 +105,9 @@ void __init vsmmuv3_set_type(void)
 {
     const struct viommu_desc *desc =3D &vsmmuv3_desc;
=20
+    if ( !is_viommu_enabled() )
+        return;
+
     if ( cur_viommu && (cur_viommu !=3D desc) )
     {
         printk("WARNING: Cannot set vIOMMU, already set to a different val=
ue\n");
--=20
2.43.0

