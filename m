Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MFdLGbjAWoEmAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 16:10:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC8950FCA4
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 16:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306246.1578305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMRKo-0000j2-8z; Mon, 11 May 2026 14:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306246.1578305; Mon, 11 May 2026 14:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMRKo-0000g4-66; Mon, 11 May 2026 14:10:14 +0000
Received: by outflank-mailman (input) for mailman id 1306246;
 Mon, 11 May 2026 14:10:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1wMRKn-0000fy-5n
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 14:10:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMRKm-000Zp5-GE
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 16:10:12 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6a01e341-bab6-0a2a0a5309dd-0a2a4502e6d2-18
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 16:10:11 +0200
Received: from [40.107.130.80]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6a01e342-af86-0a2a45020019-286b8250d1fc-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 16:10:10 +0200
Received: from AM6PR03MB6070.eurprd03.prod.outlook.com (2603:10a6:20b:d4::24)
 by AM9PR03MB7850.eurprd03.prod.outlook.com (2603:10a6:20b:431::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:08 +0000
Received: from AM6PR03MB6070.eurprd03.prod.outlook.com
 ([fe80::6498:3539:2e93:7416]) by AM6PR03MB6070.eurprd03.prod.outlook.com
 ([fe80::6498:3539:2e93:7416%2]) with mapi id 15.20.9891.008; Mon, 11 May 2026
 14:10:08 +0000
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
 b=oZ7j/PBfB6Zf371IjQhakHSxjduNFGKQetFDGeWFL0Eo2RUlA9DiZdMs4v+cPO3+Z60oIls5ADPtBu0GKMHt6NVoUUDmC5y6L5z+Rh5qToFrGSKVu3wo3/JTyNzkoJRIud3tX01oEJgFhP15Artd7hqduXLxXsXajui52WQcmJ9gFCy9N7hsJHWxPli/8Rj6GKsvUhgUGZnEH/aT90N6z8x/Pt3bk7BtJQOuEdKTiXooi6q0Tn2N9yUctwY/7DKdD+fRP7aI8GS3C+yix2fQnDf7rTurqmcpF3Gv5kqrNR6vH49uh99jIuAk6ixThAP5wy60wBPwR8153jPetNGOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hZLdnkGwo5abQg7i0gPKLLtqfBYEy6gK2VAG6S2m/4=;
 b=ZiI2sXGucCBR/A9suE8z91yODZ42a3IDSdIGNXH6cx65nxnL2KHmcHTf86w/htNWN0bnKUhg3w3oJg0pLCAEDdAmCkm4RYQTK74Xz3zxWVUbE1c499SMN5GD3C21anXpaax73oCGQxrkR2xzZVOIpCTyN9An4lPDfUbXqTDWCytqJNqMZ6OmaivbCIQVwBMcWvVNlTlaPuXOyuHo6c8nJTh2mdF6WFqZ/NdC6Pgo6nzTNdDIS+CAPGjOC6CTb0vvEQcmBIWGe3Wytd6jSEj2dxqsSuSy3v0IZH7omA+Nc26trr5/R9PMdeb6cfol4vtokElVyx2xUpYKshPfoww4eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hZLdnkGwo5abQg7i0gPKLLtqfBYEy6gK2VAG6S2m/4=;
 b=HKQNCEvbNAKXLSOZxWehRzPOozWPWENgE/7/2HmtehdNBOtcejLCPMwsClB7wO9UiEWDmqj+o3gjKFc60sO4vakjxroLhTaijIVZ18YSaezWVoHsqGSn+lgVe+OtA4cvf20KGkX6Ij05/70NnYw4F7b/X+qJMH2RW8Mt2CK/he78Ahvwzle5aNDQoyp/lPrY5alx2aVhtvHtIwig9s3lbpRVVI9jHosxP7zQqUpa9g5leuQdcEVsgQ3u4UDGxRhMlj38KnJZcF4nnipYv+xrgP53u+Gs//wtrajp+ZrOf/tO0cZtYAtELy/HIXIll64LxiTxPPICZPijNsz9Rdxi3A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Thread-Topic: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Thread-Index: AQHcyClfuk/Yqk/9/E2oGahG1JP+sg==
Date: Mon, 11 May 2026 14:10:08 +0000
Message-ID: <877bparq9t.fsf@epam.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
	<a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
	<5efddecc-3665-4a53-9eaa-b117370cc0e4@suse.com>
	<5168207f-33ed-4fc4-918e-6c3b454b0efa@epam.com>
	<efb254c2-f52a-408d-b225-e4e03935d05e@suse.com>
	<d0916f22-b5c0-4c93-935c-4cbe17e626d4@epam.com>
	<e5844c28-aa68-4bf6-8287-a4ceeda3a1d2@suse.com>	<878q9vt0lg.fsf@epam.com>
	<e9610f70-85b8-44d9-8e13-da26d506d5b7@suse.com>
In-Reply-To: <e9610f70-85b8-44d9-8e13-da26d506d5b7@suse.com> (Jan Beulich's
	message of "Fri, 8 May 2026 07:52:04 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB6070:EE_|AM9PR03MB7850:EE_
x-ms-office365-filtering-correlation-id: 20a6b063-9825-4ca8-6df2-08deaf6701f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|38070700021|11063799003|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 BumeUh4gXdsJbG9Jvt+Ue/xAorBBQzej95d76VQBiu3fIatpPJRp1JAV9EbczCWu3NwlPnVVSRxuxFbryaIvGInEAmf31Tz6jTUNdgztXSKFNENTG8QL9/1xHPxe1O/yvAZoFu3V9PCAl5+rcYXKCqxltfboEU5qxIIzMj4gat31AXJZbuLsthLcqKHpLbQzih8x1ly6DIWpVbXoKl8Kj7xwA7/DCwGbcCVYCXxf8aOBwa3M31feo7wPZ4EPb4DiL/JMGw79rrE6Ebburw/FSYSprNJLgVoQ73zUz1LLXgKxkLqZ7bSQNw65832T5qm/fJncV/b3vfFvie6dRKdOv5SX1FqArfhlkeZmXudiB9ba25JEA87ozyr8YhGah60UiJf46kZWGcBmpJ1zye10tHUGUNNZQzyzrktk6smpGMFf/xH7BJ88foS4xkZdXimetw3FFKbA17DD/qpgX+sIotCzQEBqZqc7x8IDluvfTpPugSOPyMWAIqgQROLQa7qZeM89NLx17/V3hnoSfkuU7AbTJGasUwfniOVqvapeJdtIPKLnqV7mfhx1pFjGJLd6oKQFeDzQW7UyxECfYvdpY1n6pZ25Swu1iWXG4l6xKHnNDrlAzSCqLgE64AK0pYorJ0vQbcbJjF15V/zYemPIBVo2pH4cGQE/pSqEZQWJ5skbCMX9hUVsLWysYMGSxmtBa7Ik1fNhvKAJ1neR6O4mWZCe7RByHq78T0bxkA4fL0s/EEkiPMrZmsj+2huyEzYo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB6070.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(38070700021)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cvsKCl6bQruN9VJ5Jb38FyUkLClsbrY1euh/orfXaZuRhKMrt23Cta9REA?=
 =?iso-8859-1?Q?FMXdvF0Ls6C68US/JI0H+wHDwmKzCm1d0EW4KPqOX3+1DJh0IAjUqE07PO?=
 =?iso-8859-1?Q?+HJRvTp0TVqNPZczo60X3KumAe/S/L0zIGm0WSoIFtkHX0DAU1WmqLs7WX?=
 =?iso-8859-1?Q?enVGhXWgpH04yeMb+MUHkidI23k/dICCiRLqhj763Oo0FI+VodsnXOnpyU?=
 =?iso-8859-1?Q?Ax5Ps3WxNcm3rGC8zizg/D7LzPXS+1YmZvEzAsq1setGDbwJ7avr9ZXOAT?=
 =?iso-8859-1?Q?qCHiSI2ry7jvDFLIXEX3yZUDAfZCif7Iui0PjTLG1eHQ+9SdND/M31pw6S?=
 =?iso-8859-1?Q?5taKWDYqa/qeZzc1Z49NWmB8ymCiD6+Orn5+qJqas1C+TfWq1iv2KOC+xL?=
 =?iso-8859-1?Q?Eh9WZ2gwSvb4om495m5NEykSFEVPeoHvhgYf7H2tkbm2kc8UOMdmsywpdZ?=
 =?iso-8859-1?Q?m8zLJj16HYoT3wB52EUEkO/btBEU/C6U8H66x6zYzIJtI5VFO5JMeHmqcc?=
 =?iso-8859-1?Q?cLN2zMhD9svBZ79sUdZ0MtIcb1vSOzc81zpSXcljch75ugqawLk0VQnN5i?=
 =?iso-8859-1?Q?3cduoW2E8QUdTAjRZ8iQMiq7n+0q8WZ8gxvgLyMEMLNSj5kXwu1uUoOpVE?=
 =?iso-8859-1?Q?QsGIgTz8jWNno1W/5WALr4ADzTQzzhU+8BU8oqTwfLYRZ/FBFaDSGM/xvv?=
 =?iso-8859-1?Q?uDGkPboj3K4Sh6xUbJBGMY6MsKdP8haIZajZyE57ltgta4EHHKFJxWLu7d?=
 =?iso-8859-1?Q?3w22gra7nJJ49HoDqfvDYewpGSv3hmL/aO9n8/8MCVM0yIt71jM3jKCge2?=
 =?iso-8859-1?Q?5RFy+IYK1KA5F1gsE6mcKnYJilyLyvQIerdCWBt2hjp7btICMsmolcDqzm?=
 =?iso-8859-1?Q?frcAk176U7oqnltz9ml9uMhAGG1LbZXuiIDvREsRcJ5vjGqUswF/srQgaR?=
 =?iso-8859-1?Q?2Tp6oPQ/8kLpzGsEAfQi/kqFZMOx/Q5/Ev7C+nTtJm2Xdrj+GVw2pHhiw9?=
 =?iso-8859-1?Q?e++DY1sqvTUZD+hTHyTJY7XhgGBGP/H6Akmlyv83m2YB20xRy1ocwFZQQl?=
 =?iso-8859-1?Q?em4fdjQMuFxVaEIvXJ7Ms1Crwquw6sFy2Iz4R7pE9SCZD8c4YW9yAll69W?=
 =?iso-8859-1?Q?Hu3KAF49L9tLi4ht4wEHnmxB5Z9kH+YioXhIelk5ZLV8ooCF5dtiIkal1C?=
 =?iso-8859-1?Q?dyEV//Foc6dwAVe2VJxLIl2bAbMm1c7vLDbaX/bR/8DIn7UTtkHs3fkL3X?=
 =?iso-8859-1?Q?zJQrC3ua2KiFoN8isueBqKO51DLZISnQZjov7d29OrA4IIQd8pHEDoGyBd?=
 =?iso-8859-1?Q?wZlRCpHAlhAoOUGMVLF0H+HzpAgYK8Yo1wD23KUfCNs9lzoFKw/9sUA0Aj?=
 =?iso-8859-1?Q?NviSQ7UN42UB4dcIE9Wa44xbcF1sWVe25Xsm7r+nIx3uRlbHWuKoFxT+sH?=
 =?iso-8859-1?Q?xqxZJ3hgNHFbnfzgmVUXvbsMbm7j0Ef5ZxG7Kkmwp1chAdfTpgF2UB8oqk?=
 =?iso-8859-1?Q?Jr1utXRRNSclqSzIggbbDIv0r3eBH0UIfgyOWLNAuUusjemceWNbyuRJmB?=
 =?iso-8859-1?Q?PlsIdwRGg9llRamkKqThNCmj4/5VJMdZ6LENpV9loxTisvKb5ss87XxyG2?=
 =?iso-8859-1?Q?K/oD+thIT1RfL+hETeuIhbBYPeUM95CRY3qjihoLu7X5CkxgWqVQKbalhv?=
 =?iso-8859-1?Q?VF3STZbNao7fxFvWBsEmyHuYHVQdJ4np0fH1588JE/WSn7JPwAMn60LowV?=
 =?iso-8859-1?Q?j4iy6V9c7+Plkuiae7lT0Q9f53d4bn4iYYGrcnxOxyIaIlPVOyO0PQZWGf?=
 =?iso-8859-1?Q?ZiZfs0Lk1yS3/TRbHnytsMVfrzDeWFE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB6070.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a6b063-9825-4ca8-6df2-08deaf6701f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 14:10:08.2545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VOW8xu4AfxP0j6Cqf5LDcJBu4WK/OvgbtdijC4OcgXaWlSTFuUn1k2CRIHVx4U2kmTjOd3FewP3u6X2yCvYoOwmmQqwR7pFuUMSpSi53Yo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7850
X-purgate-ID: tlsNG-720697/1778508610-8256B161-1303DAF6/0/0
X-purgate-type: clean
X-purgate-size: 4202
X-Rspamd-Queue-Id: 1CC8950FCA4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,epam.com:mid,epam.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Mykyta_Poturai@epam.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 07.05.2026 22:40, Volodymyr Babchuk wrote:
>> Jan Beulich <jbeulich@suse.com> writes:
>>> On 06.05.2026 11:39, Mykyta Poturai wrote:
>>>> On 5/4/26 08:37, Jan Beulich wrote:
>>>>> On 23.04.2026 12:12, Mykyta Poturai wrote:
>>>>>> On 4/21/26 17:43, Jan Beulich wrote:
>>>>>>> On 09.04.2026 16:01, Mykyta Poturai wrote:
>>>>>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>>>>
>>>>>>>> This code is expected to only be used by privileged domains,
>>>>>>>> unprivileged domains should not get access to the SR-IOV capabilit=
y.
>>>>>>>>
>>>>>>>> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
>>>>>>>> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to acc=
ount
>>>>>>>> for possible changes in the system page size register. Also force =
VFs to
>>>>>>>> always use emulated reads for command register, this is needed to
>>>>>>>> prevent some drivers accidentally unmapping BARs.
>>>>>>>
>>>>>>> This apparently refers to the change to vpci_init_header(). Writes =
are
>>>>>>> already intercepted. How would a read lead to accidental BAR unmap?=
 Even
>>>>>>> for writes I don't see how a VF driver could accidentally unmap BAR=
s, as
>>>>>>> the memory decode bit there is hardwired to 0.
>>>>>>>
>>>>>>>> Discovery of VFs is
>>>>>>>> done by Dom0, which must register them with Xen.
>>>>>>>
>>>>>>> If we intercept control register writes, why would we still require
>>>>>>> Dom0 to report the VFs that appear?
>>>>>>>
>>>>>>
>>>>>> Sorry, I don't understand this question. You specifically requested =
this
>>>>>> to be done this way in V2. Quoting your reply from V2 below.
>>>>>>
>>>>>>   > Aren't you effectively busy-waiting for these 100ms, by simply
>>>>>> returning "true"
>>>>>>   > from vpci_process_pending() until the time has passed? This imo =
is a
>>>>>> no-go. You
>>>>>>   > want to set a timer and put the vCPU to sleep, to wake it up aga=
in
>>>>>> when the
>>>>>>   > timer has expired. That'll then eliminate the need for the
>>>>>> not-so-nice patch 4.
>>>>>>
>>>>>>   > Question is whether we need to actually go this far (right away)=
. I
>>>>>> expect you
>>>>>>   > don't mean to hand PFs to DomU-s. As long as we keep them in the=
 hardware
>>>>>>   > domain, can't we trust it to set things up correctly, just like =
we
>>>>>> trust it in
>>>>>>   > a number of other aspects?
>>>>>
>>>>> How's any of this related to the question I raised here, or your repl=
y
>>>>> thereto? If we intercept PCI_SRIOV_CTRL, we know when VFs are created=
.
>>>>> Why still demand Dom0 to report them then?
>>>>>
>>>>
>>>> The spec states that VFs can take up to 100ms after the VF_ENABLE bit =
is=20
>>>> set to become alive. We discussed in the V2 that it is not acceptable =
to=20
>>>> do a required 100ms wait in Xen while blocking a domain. And not doing=
=20
>>>> that blocking would require some mechanism to only allow a domain to r=
un=20
>>>> for precisely 99(or more?)ms. You yourself suggested that we can trust=
=20
>>>> the hardware domain with registering VFs if we already trust it with=20
>>>> other PCI-related stuff. Did you change your mind, or am I completely=
=20
>>>> misunderstanding this question?
>>>
>>> No, I still think that we can trust hwdom enough. Nevertheless we shoul=
d
>>> aim at being independent of it where possible. And I seem to recall tha=
t
>>> I had also outlined an approach how to avoid spin-waiting for 100ms in
>>> the hypervisor.
>>=20
>> I want to clarify: you are telling that Xen should not wait for hwdom to
>> report VFs and instead create them by itself. Is this correct?
>
> If that's technically possible, yes.

Okay, so let's clear this. If I remember correct, you discussed this
with Mykyta in the previous version and suggested to put the vCPU to
sleep for 100ms. I don't think that this is a good idea, because guest
kernel will not be happy about that. So, IMO, it is better to just
allows the guest to tell Xen when VFs are ready.

Or maybe I am missing something and you had some another idea?

--=20
WBR, Volodymyr=

