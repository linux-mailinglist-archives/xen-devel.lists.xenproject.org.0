Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jJRWBO17Nmo6AQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2026 13:39:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572676A8CF3
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2026 13:39:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b="Bkgyk/TE";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342827.1602720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wau1W-0002lQ-Bg; Sat, 20 Jun 2026 11:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342827.1602720; Sat, 20 Jun 2026 11:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wau1W-0002j8-6u; Sat, 20 Jun 2026 11:38:06 +0000
Received: by outflank-mailman (input) for mailman id 1342827;
 Sat, 20 Jun 2026 11:38:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wau1U-0002j2-Rl
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2026 11:38:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wau1T-009HZn-Lo
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2026 13:38:03 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a367b6d-e002-0a2a0a5209dd-0a2a4503c426-22
 for <xen-devel@lists.xenproject.org>; Sat, 20 Jun 2026 13:38:03 +0200
Received: from [52.101.70.88]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a367b9b-a3da-0a2a45030019-34654658144f-3
 for <xen-devel@lists.xenproject.org>; Sat, 20 Jun 2026 13:38:03 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU0PR03MB8503.eurprd03.prod.outlook.com (2603:10a6:10:3cb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 11:38:01 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0139.018; Sat, 20 Jun 2026
 11:38:01 +0000
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
 b=U20Is2fQke0Pbh3rhb0AGIaQudywI8BYRy+LmMKAzJhJSIBdhMFj+p1nTuoSwz80snJhM+mwl2U8vpZtLQE8Q+RAnzm+oO2zRjn1fBBj7aPIrHGouYQkB2OaSxl+LTVyNb/FiXdH2fTvxgqdr+PDjEriJKOkwhH/Qvy9j014YOmp0hYJOcdHbHShG2SFqT9xSgG+Dx4ahagNcHfStIeeCVX3yvtCmFMfRm2EdXMaQ3dpMeiNmZQo4aD/0dJ/owfUw1c0mMtmqxl4SyNmxHFWIIUzYDeLkaRXybRrC4RMo78vBq2/Zgaq4C09FrCbdnQI///IwHrrbFFQXBTYNp6stA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbksNNuRvqZIp7HG4ezBwuPrg62fSvJRHarBf9UUhF8=;
 b=Uf6rRBlrlmd8xAmyHVjvZSwf3vN44V55YYb6LrIl06IFPrvDgZfjc0o5U5QznuCqXyU3cJWItWjE2eevVOllxbnNI3u98GTTx374y4DbKDxZlXC/wuRSqulPoKl1a3d3j5e9NPdOSa6ci0RlcjESynNbtwlj5k53GjN9TY+iDleUZc8mRg5XQhZL8cPpuBhsB6Xb0mPt9Cxy/MlsozkU2E0BFBtlihUmZI3JSnbTXHh8eTsOyhzMI2TFtfhp3WahVD8ucVFniYDljmyJUv6c0eYyA9sfO1eduYkUqpv7zKeMQNc8mbfQKlnWvH587ppCH53wyO1MX3TKjTnW4jr4eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbksNNuRvqZIp7HG4ezBwuPrg62fSvJRHarBf9UUhF8=;
 b=Bkgyk/TE8h2Aw84h8b5r0yJ4c+M8Q/eKgTKCxRm08XRcc8oq0mcDTYactIoUsey4scWQTrG8Jab3AMGU7NGtGXf5PV26SwRV9ZCpBoNCix8z/5q8+rvuWlfcxWxTtzwQbAUgpG43mThWLnHIJ7ZbK0agp02+uq8qeqGnnpJfG53gDRu8y2rTJAKlINxOU1EvFXV4wfzg8D0vhN1uLBEdH1XQkTL9babF108ozgPkkym3KGSLYN4e6Y4u0v0Ywo+oenSoDenBNp+KEd8fsJl2hrfnuDynVfrQtFnjMWFGvyTmN9lmVgIWhBryyGdMgCsWKCXtLXF0FdzGnUh8RnjS6A==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/psci: Handle PSCI_ALREADY_ON and PSCI_ON_PENDING as
 non-fatal
Thread-Topic: [PATCH] arm/psci: Handle PSCI_ALREADY_ON and PSCI_ON_PENDING as
 non-fatal
Thread-Index: AQHdAKlAK1umCsX/P0eRzZ/s11RmWw==
Date: Sat, 20 Jun 2026 11:38:01 +0000
Message-ID:
 <337edab445a38b523f4f793b01d960994b834d01.1781955326.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU0PR03MB8503:EE_
x-ms-office365-filtering-correlation-id: 7c32e5c6-f853-48f6-6dc0-08decec06285
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|42112799006|1800799024|366016|376014|18002099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 1uo0Gz0Nt4iP+D2zpBEpp/0wUTUlsImbVMm0vFtYgUSmRBN18DPrncLIKkz/A3T9M1pXSfSCzeAQT6pxcFHsFg96vp7rpCO2x/0ZaP4QyVtk2LL3BgMqKGOVClXPIWxbENbWnqpededwJ+sp4oFjn/cT6A8+0Elu8tiyWz4DwsCRa1r09BXdi2wSlO2AgjLQ46WwYm1bbmsgYbcz4jtSYbcMf2v+r3RA5OJLlq3R5AfQ7y2mzqm5PcIOlhe/E3Z2EzFDJ5SJBGXUtpKr/rCIDV/G4O2saHum7gMYgM+KFOAInm3VZBFkp+wMxgxfkE6LUFPWSrJcAQExhyI8k20yfQ/VCyCNM9284Hw8GpicX/H6fY0lHUGYbSELOaiWupg0Bpt4jaobrKn4vfXSWjQ2AOEA+fyt08hC63WG2QuqRptSICk+gNn1kgtJKPfkkikaYIYzAWaP44lE+oWqy8eJ5765eSQ3u65Oz5YlJ3koqe1o07V3YEINuC6dT0Z6cqFFmnipMg/lMhgm8gmtq/HogVVzLrKnSBprchVhQpRBa2952BBc3MF1xOBsmzfDbL3REPOblhrlumU4Km8Fo7y/TF8rUHe9wd8fqucSbHH9CpTnQWXaWiFEXLlgiz+ICDKoGx3+TgPaL+ndGrKkf+bzKSHKjpQYdUbQHxM3H1SuHM2rzF2dMQS9ll3gPQ3p6Fzl1Iu7xb6W/uL/6yRukzgX3CnZvDv6Kyx29Ioo9uC6GWI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(42112799006)(1800799024)(366016)(376014)(18002099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qjpzuajyjP5NEJFP9TObQIGfE+2FF3fGNkXba5xKT72hS2gHhAMVvWBMHF?=
 =?iso-8859-1?Q?TMwTfMXGEruzhN2DR/l+QRSIzI0biocMDE0gcxjEa3k5ltv+vXRRuIoNIQ?=
 =?iso-8859-1?Q?G2aQIlqTkwYN7Kksj8gxOW37tXnm9km4b+CnL5Pn8QFeXscxzZfdb4oRgG?=
 =?iso-8859-1?Q?UxLjK4kPBMP5h7iM/9RwognMgsSLthVMidGwHf0efVIYN+/ppnfVegWQUi?=
 =?iso-8859-1?Q?ygL90zJd34FvjWtDt7vjkY2wH0IX1NPwYWWVWr8twsMvxprge1vMFZx1Kp?=
 =?iso-8859-1?Q?cA1ReDN6406i1ZDEP9soc3c7v4d54v0HPuHdlb7ugfj/wUTAtdhZ1PVALI?=
 =?iso-8859-1?Q?giy1qiXFLIjo/lwZYPRK3Ud3WWWMsYgYTBgIN/4Tsq2n6D3paVDFu3jjDU?=
 =?iso-8859-1?Q?zb1P8HYaDIeqLayU+JUlB7i1FYmtismpTaHaLxc4voSzNLkxezO4rmSy6H?=
 =?iso-8859-1?Q?rH6iWSQzUkOeiLx8b84CzmpJSHzrUK+Hvs8plrXx5duDfAEdXfZOBmAWKo?=
 =?iso-8859-1?Q?YL/0xUebRRfYjCtN3gWM7HvJ+aTe70QRoSxs24Lhoja4D8u8p9j+rcElpo?=
 =?iso-8859-1?Q?/QA6W5si1IzkXSrCOHlctG+7oft1xXKdVG350xcXIlcVzWoLk2YAK73iy1?=
 =?iso-8859-1?Q?WVwpNjkj4cWeOdaW1PA68TfpD9X1TAGCmU5+CBbj+BZd3PwlEPr1HPRQHa?=
 =?iso-8859-1?Q?pCi0VepwHAKKRUg1cJjcXKSIdG5BYwT1lkj0wD97QBetIFNb5+XCPvZr7Y?=
 =?iso-8859-1?Q?YL+Q6EsyhazTTO3UNVmFxPwFyA3aA4Mpxg+9hE3p1tKkwxe8upMW9PtuFf?=
 =?iso-8859-1?Q?kPxL9LqrCXdJobEsk89jgeBmSmDSrcpfUhUYNl4flS/HPoF44NMjfB+bKj?=
 =?iso-8859-1?Q?XdhWZ4/w4MMi/cTtiIExw/Y4n0EKrSMkEMpkep0MR9oUWV2I2gU7kz3P1c?=
 =?iso-8859-1?Q?be3n0A/SJ1zis3N0xFrtXXHafy0K5UOmn/0mASnFO5LyFvgY7zWEaM8pMm?=
 =?iso-8859-1?Q?2sqxvC7KxZfrdGYs2Vwdlt/CA8wdIBaCgFlWLTvIBEN9+ZsDYXJ0QbQNsJ?=
 =?iso-8859-1?Q?KXIvGZytnGemydUepjHufc7SrB3Ti0SG2/NgaSxJOXhZOX+hLaM2PSG6WD?=
 =?iso-8859-1?Q?WmuY0+jATfI3waSI/yKd06tpblOHemYYgTOTsQMwxKyS7OC5fxUnBkNaHD?=
 =?iso-8859-1?Q?c1MrEYwLaBs2nl5F//srbXXSVTvBfDS04k+7J1ACkDDzmWLdvnN/4KH2a5?=
 =?iso-8859-1?Q?zgzwc6f1qH7LcldvF7PVZN2H+rXNjg2H+syAp1Fq5kD/Zo2LOSg4A+AYpb?=
 =?iso-8859-1?Q?xH2rSAsQqvH4BvbyEFTqYA8vP1qP6xEpbpEsDKsceNrrO9PgQ0U9fw7fnm?=
 =?iso-8859-1?Q?4XwFNwk2Gk52OrIG9V6R3AjHlWFTvtrzxM0SgycUVBq0mjrQuhIJxeUsqL?=
 =?iso-8859-1?Q?yvyA0eb/sd1JbmQu34G1amz5RS/eUrOgMh3eP9HGPDT9p+A1PB5ILpOzzA?=
 =?iso-8859-1?Q?KFzzxJKZgp62l8w8Lg+aGe+047+2XowsKUV2qaktRTOUmPtg/qTKG30ti9?=
 =?iso-8859-1?Q?R51OfjkhZcmVkR2VJMfV8LSTV/EQ4C+EHKA0ufgY3KMEpeGdl01cD5MHrb?=
 =?iso-8859-1?Q?2FdtgeeT3JIbO66MPsbfQwSvd8y2nft2IAXaVpk5NUvL8OkZibVuYNF6mb?=
 =?iso-8859-1?Q?TMOE/KBm+W6YBuZbhLnnl9lxWi69V4ClaMQo8WaZP9XyEIh99Jf30oWa7t?=
 =?iso-8859-1?Q?nmKbKubaQHau30F9T1Iwies2tFQYYoxQw/Flzz0weq+EgxX7AF7Zxntn6c?=
 =?iso-8859-1?Q?YG7qYRfMz72/pJVzpjrttT+oKTQ5ETg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c32e5c6-f853-48f6-6dc0-08decec06285
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2026 11:38:01.4618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w0vf9foXqlQKsAe0Mr69+hxO2D/0ymwdrLfsPeD82wdEmvgjy2bJ3K2x1Ie59JYZVv6zSNQT97XdHzB9iAVibQ4e02vCJxNXZRXt44jRxuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8503
X-purgate-ID: tlsNG-33051d/1781955483-659C1D84-1558A801/0/0
X-purgate-type: clean
X-purgate-size: 1567
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 572676A8CF3

When bringing up a secondary CPU, call_psci_cpu_on() returns the PSCI
result codes back to arch_cpu_up(). If the physical CPU is already powered
on (PSCI_ALREADY_ON) or is powering on (PSCI_ON_PENDING), these negative
codes are treated as fatal errors. This causes Xen to fail the CPU bring-up=
.

Map PSCI_ALREADY_ON and PSCI_ON_PENDING return codes to PSCI_SUCCESS
inside call_psci_cpu_on(). This allows arch_cpu_up() to succeed and
lets __cpu_up() proceed to poll until the CPU is fully active.

References: Arm Power State Coordination Interface (DEN0022) Section 5.6.2
"Caller responsibilities", Section 6.6 "Implementation CPU_ON/CPU_OFF races=
".

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline: https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pi=
pelines/2609141554
---
 xen/arch/arm/psci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index b6860a7760..6015bc0a5a 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -40,11 +40,16 @@ static uint32_t psci_cpu_on_nr;
 int call_psci_cpu_on(int cpu)
 {
     struct arm_smccc_res res;
+    int32_t ret;
=20
     arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_secondar=
y),
                   &res);
=20
-    return PSCI_RET(res);
+    ret =3D PSCI_RET(res);
+    if ( ret =3D=3D PSCI_ALREADY_ON || ret =3D=3D PSCI_ON_PENDING )
+        return PSCI_SUCCESS;
+
+    return ret;
 }
=20
 void call_psci_cpu_off(void)
--=20
2.43.0

