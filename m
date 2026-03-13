Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BgyDYnds2ktcQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 10:48:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5C8280C2B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 10:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253474.1549706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0z7X-0006ga-EC; Fri, 13 Mar 2026 09:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253474.1549706; Fri, 13 Mar 2026 09:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0z7X-0006em-BU; Fri, 13 Mar 2026 09:47:51 +0000
Received: by outflank-mailman (input) for mailman id 1253474;
 Fri, 13 Mar 2026 09:47:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q06f=BN=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1w0z7V-0006eg-Cp
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 09:47:49 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aecda6f2-1ec1-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 10:47:43 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GVXPR03MB11627.eurprd03.prod.outlook.com (2603:10a6:150:310::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 09:47:41 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 09:47:39 +0000
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
X-Inumbo-ID: aecda6f2-1ec1-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGOP2Y+fkmCbdAx9mraAeL+xfFhd/20qODl79DRUZ4d8m4/fqmiRkhE2OfH3wjEv/uLVB0+9CoHKmWO+OfALzsNJuIs9Rler6pkGq4lpZYI5eznn1kn80ZRuJS+nshdtluDK6CUdFhNSv+5JgpviXeV+1eX2+8SbMprt5WNe1utSBQkLnbHUE//XVuV7WQXwHkEwJob8HBrvS4h9w4A/ZJmGFT8t3EsC1XiiIqkuFIrayaIexosE7YULVi8URc7PSM3uvwu0LEgxvywEDtPlE2L/whzmtO6g3AGgQODWRE4bg9lDOk+CXYEVIW9Fx31rPbPJ0ECuYJjlj1Ac+CfZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUsdyvpnIikzo0pSsEdPSpYumfroyUemSD3sWoJp5xs=;
 b=scHxA4IWp0rNZUYlUsfJ3tMqrs7+b4kom0M4biJun98C0bXEEaJvsEosgq+2wGI6xvkshsHFKlX+SGNN22oYRQ2HandGC7L3HQ2N5PVvsa/XfhYnYF/FFJ9q4Xoxs/sN48pwh0P2Wkd4WNYGwpKZPo4MxOIAkmkgp6PxXDkA4gQdJDGOT+QPmRQaGWLsHm73VljvH9IG+ZJMTc4Tyf7C3GF0op9Ot3efdy2M/XsD/s2wALS57tGYC9QuJEy1sVoeK6+RuszoIuvnYH2agpUUsTeqKePNuUcQSRafY8qtseAL0l012KaGlLHWYn8WdIyU1+84m3QE28Xb2lnKx6mx/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUsdyvpnIikzo0pSsEdPSpYumfroyUemSD3sWoJp5xs=;
 b=fSt6FCMoNmmxMieV71ghiYSFjfs3KgZ5s7RX6Hd31Vlew8Bvr7WbvSFstDORp1QLzj4gv2S/TW6RHfj4fViLTQVI1OpKaNbRlmu9Ytv6hzvij1MLJmMlaJFhgBeLQVYii/0tIOdHX8tJpysYcVK/PVb+5VowvOq0setMAkXl8nIdIXEkgLve+uLoAgIAnIqklO+CVwXZPijUbDb/2CftkvAOn8N4NkV0UwqmUlv/g2lYcgCOzZgiRAGCFIaAGyQOOv7Kv1CEThgA+puDpsFVDEltqt3zB9Sl/kwcU7o924YWBSS5FGViAc2l0pWNNzJ90/oejh8s3R7eZNUvQPIVJA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [PATCH] arm/ffa: deviate violation of MISRA C Rule 20.12
Thread-Topic: [PATCH] arm/ffa: deviate violation of MISRA C Rule 20.12
Thread-Index: AQHcss5tR2+5DPx62k6x27kB0BQ6vQ==
Date: Fri, 13 Mar 2026 09:47:38 +0000
Message-ID:
 <5c415313cb818323b70c59c2a9c26e6122bdc434.1773393963.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GVXPR03MB11627:EE_
x-ms-office365-filtering-correlation-id: 8ca98e24-1922-407f-ac5b-08de80e59064
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|376014|366016|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 4RNrBc4MT+mUqd3TGyY2kPBbSMlhE7d94vD7XYs3ammSb1PvUkR3rtoacfYv3EwWb/qlflvPZjBHmswUUGuS5S3XIpds0ywcOnO07acrpmWWQb6k8BstKnuvE3phznH9aYVdcDlCU00WO+b03ONpN68K8gevpemQQiJ+L9BSyUqVw8QBCP2y3gAR5NUKZhZvgJPxsMeQPAhVOuv8tf3sc8XvttIIzusedgdlPPOldVEALfDeSi4Z8BHjLal90wXfKQyjUXzayyDL3ZJn0vLNi3eCnI2MkxOwqUe/od9jF+ownf30voUgFxTJEUcRH8nxwZgAI6ARthsGXjcVJstsIVTOdsmNprmvl7rLrITSyf6qNp0VFzmReLWupvOLOcKoHHlXhp/sIUYOmlKeVsdhJqRRH7edl/dClybb90IvffylzfVpH0HvVVu2WtztBgCFWuWLe1xzD2qTsmj+EebAr9Hc21jq0/3HjXc4VnHQluoYWWPOHIEb67xrGa0jplCGHhuE2MATtdz5+LtqOttLcWg2R0q9vtN0g9rqduSAaFa/K8mPKEoiRRnIPTNxWjXtfDWfokm5xMhRzceQceewGBJFc39SI7PgVoW1waPxqp3jwbcfuF6nS2SU9rRsJ7ZKZKh7RLbri6Tx8Sp8pXqD8UtCZ2DC5TY4VkOaLGcEXJUfVtzpUCAsr5E/AoMmdD6WVz4VYqKSlIqeEw0ZAFo7S47w/zy+hHFNKitRNg7TBMMFLh+9lKGKywaW9DAb8HEwvIiL56bG+nuhtpIfRZQYNfi/xd9lnsZt0lCsSYDtBiY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?B77x2U/lQTWt8d/Z40FtUCmgkKCWcbo7TY3z/XmgRl6gEXFlP9xnEmdAGy?=
 =?iso-8859-1?Q?OkqUk73JncA6wrG8g9ZB6ruQUzwKT70CH5xaq6wWEm2qmd47CNO0/hKi50?=
 =?iso-8859-1?Q?x7W39uR7cvVfOUOA9fzk9Btbt58tbVJgoDS9/eNuRxLVuCVOdevijgTw+0?=
 =?iso-8859-1?Q?MRRyQse/o5cYpJcojQVT5HXFjw+meh1e0rlXWkSBNLEelM4saaLfApLiDj?=
 =?iso-8859-1?Q?QzvJ3wa0n59+31HZQeDZk2EqYq6Aj9qMG/bALj5P++gvTD7nRaMKv1Rgky?=
 =?iso-8859-1?Q?bT1AiluFyt7hc33/rMj7s3Xh7N9JVgsEEmOYD3jMxGZz1/pDO/fZhausz9?=
 =?iso-8859-1?Q?buV8hr+FfnLRaebKFw4Mb1zeKP07oS7sbERYkT7W9KQh4p0Pbm7zX/MVYV?=
 =?iso-8859-1?Q?9z96Aav2vWeVCLHRnOB7jLkCnGLsS8iySX/bb4g+LrMOUb87I6eaMr6B5q?=
 =?iso-8859-1?Q?NTjTt3rilgoDpYlD6suETHnELHhEh6JPwoJhRYZOB1RIUK9ZJCZjOhHCvI?=
 =?iso-8859-1?Q?esdFrnvgH509HABbE9jXR/r2/u5SAgWXVkT3he7tFz4rTEeDPO75tvMD2G?=
 =?iso-8859-1?Q?yJN5QjirKt6DMZV3shZI7pu6BvXsImyjW4dg4BIDi2iwrg+4pcYSE6Aicr?=
 =?iso-8859-1?Q?Yb2j7IQ4xUcsmr+Mn01jdBZXLcAvy+r7QmJV/sffIDCtGU3ksPqNh3TGHT?=
 =?iso-8859-1?Q?M5s+Lq8tgjUjvoHtp6y1NInuiRKIk4bsmwW59pw4KR7aAGEOdvcDyGlNQV?=
 =?iso-8859-1?Q?0cYMFxYSIun8HXvhrUxam9aitiHptA0rCnu0FNuAZiUnlIV8q5le0WcXxw?=
 =?iso-8859-1?Q?6qkjM6rYaSY8gvAOzU4pO0SA58YTUdaBM4g6Trkxc/lOKNEHbTCW5FpsIW?=
 =?iso-8859-1?Q?MB59hAQYO1NNLePpsgvcpgHsN70WiaNE5urYfJerRSSMu3dli+m5kB2urt?=
 =?iso-8859-1?Q?bMl4HFXCiJBJ82HYyJVK6igc5l5tkXThoATJRo4zQH8a+Tf/VNMGURHk5V?=
 =?iso-8859-1?Q?fb4IngBQvE6E80iGwBLzb57QJziCoWblpQW+/YQbpgeUCR7ha7Tzler4bn?=
 =?iso-8859-1?Q?1Lqqmn1UdMFtFE5MhUbTTMw5BPbyHCNNZFsGkZhI+E3VLyYUahv124OyBD?=
 =?iso-8859-1?Q?JMGhkBjwT0EEMrn4jWpRVSKjFzi079I7OztQCf/0eF35L7TCAyNPFF2BXN?=
 =?iso-8859-1?Q?BJ9UhY7BAB+vpmOomJMeISQCG2LQ+mw9UmyQIOUspAJQh7S4KRrU8XCz+q?=
 =?iso-8859-1?Q?kv5ep4F3wmrvRQz2Pb6tLegPIB+p+hczhdyP9lFgHitqVPofp/EwyzUGLN?=
 =?iso-8859-1?Q?ZduPEa26X/JQL1a52sG94q7vOB8ES9cbeQdaaMmDTurffwpecKL71ZKHv6?=
 =?iso-8859-1?Q?OHrfsREaqzobG/Qpy1PvYUCIBEDdQz6tLEzCmDBb9sNRRTFe7YH63O/dQj?=
 =?iso-8859-1?Q?Ku9lBJshnouSlq9ccMGBEhmp2IXu+4yU28Id0jKOOHfv/4n1QZc6yOPmZ9?=
 =?iso-8859-1?Q?23RHGIDykLwtDs0BD9pKGhxFHxCmjZZKbNc7GTxHZc5hsb5n411xmcOmy8?=
 =?iso-8859-1?Q?t7MFnLw8PJ97fdW7GNpiNB4f+JC1ANyvx1brRpAi4AJwMej+/jaBHDZlUS?=
 =?iso-8859-1?Q?KHcd4Lu96RBj7/g6NVRGYRMbcPmWeDdthn62CHCwLWJlIT+PBpTWYycvhw?=
 =?iso-8859-1?Q?P6EeTzXSlQ/HJRC2RmQMFZyJFQ69h6CVTD1XwT+j9hunQJCRe2ZlIE/CDL?=
 =?iso-8859-1?Q?/6KdhIdjtKzekJJbgRFHA7XYHWVVH8EA1If9jor3oCdzSP1t7BZXA3UAiQ?=
 =?iso-8859-1?Q?9Z5nBaqtSyJKwioZ22cYH5pL6LkAons=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca98e24-1922-407f-ac5b-08de80e59064
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 09:47:39.1253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FwnUG4j7b6qCll/DJPVXBIqQnmFvNY8HCFGhM//Z9EuYRdXSRH/Emi1NMqeyXOOX0kH/F5QAMi1K2KRwLgKeppTI4HshvAeueJiRW/G4MHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11627
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8D5C8280C2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MISRA C Rule 20.12 states: "A macro parameter used as an operand to
the # or ## operators, which is itself subject to further macro replacement=
,
shall only be used as an operand to these operators".

In this case the 'FFA_*' macros are used both as a regular macro argument a=
nd
as an operand for '#' stringification in the expansion of 'FW_ABI()'.
This is deviated using a SAF-x-safe comment.

No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2383141997
---
 xen/arch/arm/tee/ffa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index aa43ae2595..d4a77206c6 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -80,6 +80,7 @@ struct ffa_fw_abi {
     const char *name;
 };
=20
+/* SAF-6-safe Rule 20.12 expansion of macro FFA_* with FW_ABI */
 #define FW_ABI(abi) {abi,#abi}
=20
 /* List of ABI we use from the firmware */
--=20
2.43.0

