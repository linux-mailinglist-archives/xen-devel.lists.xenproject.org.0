Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLLtNOsoy2nLEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736143632D8
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268223.1557547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OGy-0008IW-An; Tue, 31 Mar 2026 01:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268223.1557547; Tue, 31 Mar 2026 01:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OGy-0008G2-48; Tue, 31 Mar 2026 01:52:04 +0000
Received: by outflank-mailman (input) for mailman id 1268223;
 Tue, 31 Mar 2026 01:52:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OGw-00085b-5L
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OGv-00HCrd-HX
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb288a-e002-0a2a0a5209dd-0a2a4506a066-32
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:01 +0200
Received: from [52.101.65.82]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c1-3034-0a2a45060019-346541529909-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:01 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by PAWPR03MB9202.eurprd03.prod.outlook.com (2603:10a6:102:342::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:51:59 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:51:59 +0000
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
 b=tNjRLNLd4tOtMNiiste5Elr6LnZuDbQNZR0RwqO+uHkmhvpXkrY9JpvwhdKqstsg0osvUaybWRKWYmamoAER5seoULSLGAPrhW1Gj1l9kAmbvAkRCswgKNHTznV/P3VlysYD0CXRO3irfL4XVlqcvT3omuJAaP01wkN0mtoKleS6COh0ld8No/f1wQnBKnIuVXZZZqVaPWDlbcVQx+kEkZjgvJlzy65YlAVw47+VLksFSYdRU568VtvJWIHJxgUJtL1/rrVfPWY+Gm+gzBy9bcqWHvQECW9Y9ujtIcoAK1vRrg9XWDfMQe983ivx5I+QWsMJz/14ILCzX9ai73YoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9tecJs7l+jief5fwjcb0VdatPuGZ/jTmjdUcsZ7naQ=;
 b=H7QODlFIAoX/JnqmxO9rkQDE6pHZYBZO8su/5iglLmHIFGbaObikBWiuZwk4JC4D49CmPeiJacP4kM1l8pr4wN7421kXgM4tNnd3vOaUm0ogWJTOltMWyNlZl/FsPpbD4Z0vqCTTYfiQt+wKi6gSFoOsFUD7Hc7D7P7GB/64UpGwedDPk1YwmYqwhiXmvggOu6xWTWw8KifxUNyjIqqInvJjeRgHbWBoHFm8ty27eb2GU1NyhTSje1WPQlFwBwZGFTAsYfsx7CIdvIzBU1U/C/cpoRDfP3NAsosIK8rmswwu6r8sLhUQxqitERBCcUKpaBpQ3v63LZ3z1qk8uTqVmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9tecJs7l+jief5fwjcb0VdatPuGZ/jTmjdUcsZ7naQ=;
 b=BESlUymbPb+D/vGMq5llAIk76JOpWRqoC9GdTrd54DRkEybl9XUi5gPs6wsv7TM7n9BMjHFpg7DEJBRuBy4VfYpEKp0xJ2TGOLrbpNP/RXCGRWQ8C6AktWKnUg4zf/Xqi6MZA3H21KVKVg0SozEdw8ekSd6oVsuCxE1XLsbcuoEiroRhGAtz2zrxcsu7rkr4lRZKHp3KaMMXP61Qon4w4kQuMfxEIkUvjhWlOhFM5XFnop42rxQLscnLWL26DkK0LkPfdxmN5Yop9wFfSrDkUiratKjOZ7c7JsbS40/cBSKA7XhBRmGkd9ZtyQY/9Tw8H8snjPAzJjfJUpsHnnOaag==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v3 02/23] xen/arm: smmuv3: Add support for stage-1 and nested
 stage translation
Thread-Topic: [PATCH v3 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Thread-Index: AQHcwLD2/10nH0Xm2kCl3teEQVi7hw==
Date: Tue, 31 Mar 2026 01:51:59 +0000
Message-ID:
 <baa5aa0db3d8d2cbc5f46a60241330c4c7055d11.1774918270.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 3ef33927-a2b9-445c-045b-08de8ec818f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 hcTjxPoL5wtogidfyHaCFuA1TaQtcxLuk13mJ7uDVvty+sc6mPbxlTZZ2GG4504ff9ksUACqGMx6iqMdgMuoIGnSlksEYvF3n57PFLOqLHZy8bcqlwMA14rZv4Gi3y07KYeRytiWJTa1r+MhGExTHIYMJTxDBUKZ6f+gluetSZ8K1xuOSnYV1meu3qcs2Mn8RqknXhTWXcBJ0nl2RP+y/WDnrf8+aUDTRvxNd/lZI6qLDL0LLj1FPYNSVZqcGLvX3R0bQhR1/2OHIRjaN5/Vb4VGWDQKvNeAwrTgIAyflOM1c+8s60ZxCAQmoIvY5LNSK34NkCL1cN4J1PMkXDC/rXgT7qd11uWyuVEmL7Eg/zEMWFIf9cKe+mJEwTqn0N65FgzBfIHwxxkD+lQnMfeiKoWFoUeUeqqVE3cNH27MDey/H49gSBzs1VAVYrvd1K9oeNB0/hEBU0cDRaOcoz2hUeaubpK6ibpQtRTLyGQnVmIt7k33fvr0TTvWcLfekukoFzlJh9gRU/8VZ8rrw+y86JE0r9iM+E8WLzk0gwHA6X8hu0D1i6ZBJfJtfPhG4MAOvJsHQMckRGtONmuoFHybcMiPo25kClpDXtKRoA6LzOkhk9riphLQdrKNV2Yyb85dJps8ClsyVBhov4C1YlLwQzHtRBb4Mqv3GDTk7cBWJ/wAmtfjOtj6GwtfeztQuhlPLqRf4y+YJbuCoq7AcPRhVBOyik0Bx5U3Hk6A2eAvvbwST4yhvdHT7iuAdynyP3pwuunwzI3KuXpN6srOrGdfb596iSfmfhctdZttDwIaamw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jIktKig026MCFztwCeVjWCErgFD3B2c0vu4igA18e/POJspE7ZHRt46PUJ?=
 =?iso-8859-1?Q?3vFwjrxoyYxu/h/M1LEI+vRy49l13W/iA9QM2J643zJSMOAU/Qpk5fxZgm?=
 =?iso-8859-1?Q?R3lxRfzgsHqnrQ0ZyyG+xU5O1prWBPmGJagWm9JxVLDaSZ8O9f5Ad/pA/W?=
 =?iso-8859-1?Q?+CPN+l9QPAMSNRVABjHlYomfgP59+whB/VNJAQZiibzl5sEby4tutSwo8Z?=
 =?iso-8859-1?Q?tQBA7HMxmW+WfPyAsDW+ht9qeP8x8hwzqIphKmiZcLwoC8M1+S6ovNMYmV?=
 =?iso-8859-1?Q?V19+H7xXOXceoHvpHRh84qcAQEewCZJuGMsZNFqMuf29AJLQ0U+mwmQTUQ?=
 =?iso-8859-1?Q?7PD8EjjLiKbb61NCcWbP3ilhr/RhKAdlJPrOlQD1RkxcM9rGH+MuIh2aa8?=
 =?iso-8859-1?Q?swTYL0TPJ7/7cYIAEs+VssAOdBovmgonyulgjQLnfEN5o+7QH0T2Utxcxz?=
 =?iso-8859-1?Q?YVdPy+kXsd86pXFhFzZgX6Hwd2G+PPyCZnx01vksUqwxs5aA+L4kRTH+FT?=
 =?iso-8859-1?Q?dn3SKY6HibPnfnza+TsRJ4JSbs9PGyVsf15LInvjXvrGgtfIT0RgQ/3l+E?=
 =?iso-8859-1?Q?vYFvRldhzX2+JrU25I2kXvd0NpSvI27vCQLeCn6PL/msPOP14NIZ1MZu5+?=
 =?iso-8859-1?Q?VcsArkMrXVMWV072vaAuqpz5QMMk3UKl88Djv+PZIysU1pfJP6M0Uaxokz?=
 =?iso-8859-1?Q?QHk6pN/hd8qksxOT/DQ9AXWDdQEp/4fGkTndkzz2PXWATC95yFmGfLYjaN?=
 =?iso-8859-1?Q?rb0sV+5aX/r7PjTAfTjsVM9yjHRfchYhipqIkPNaoM5Tt3OelCuWzAWHJm?=
 =?iso-8859-1?Q?LWShpLOMhRYJg5BXTU51dJpwwu05jBz8F0IWtXxBi7SjbjVtacrnV9tBdV?=
 =?iso-8859-1?Q?z99DP8oqVoPTdsTDf0tZnZ83UXGCNH6dBPPR3qF7CT5DH1xSVO0mvE+J5D?=
 =?iso-8859-1?Q?XO7az0Zj0RH2ygID7ioWcAtFpxTGLXYrpXZZxt63FBIzLyv5o0TR8Au2uE?=
 =?iso-8859-1?Q?GI216fi/LBIUQjzjMf3hD/fWkUVa6IoiKCd4UZoCgO96YoleqMtzYp9J4B?=
 =?iso-8859-1?Q?FffVYXv/AbVfuhgos4E9ESsEmBAAmFfbEV8K0Gt0n0ukqKypIpYj6OZJug?=
 =?iso-8859-1?Q?aZXhWNyWNMnD6ybbqFwvSEP83XezXT8nJ+YVCQwOsiqIWk4o4ZPnDjCfAC?=
 =?iso-8859-1?Q?BJffKa14H0a+XQYnCpyIufc6s5lBYu/bK/3S2/ToQFnGmhKxcD1PtiBe0Z?=
 =?iso-8859-1?Q?vyjE+MZ3ehjdl8G+n4j6fLm+dkDSzfA1H+Fi0zguNbpi821Bekc72M/FDn?=
 =?iso-8859-1?Q?EVkS3vfAKGw4wGShS4Zx38k4fbAZWF6PtwlgykMvzVccUjyE3yyWTXlhGa?=
 =?iso-8859-1?Q?O56HRW8kSaaey5C4F+bjc3OvftnjcLAeN3NFQtdOMneNO2ASx9PHcNcyiT?=
 =?iso-8859-1?Q?SpxUB8pUlOv15UcNxojKg6P3yzDcx7N84xhoNc/IaJI6VOgmnlC5gZjCLb?=
 =?iso-8859-1?Q?LaYVf9BtcBYC9wMQNstZTPq7feGtQPC5Eo6ofebrli15rq8Fmie45HEuZd?=
 =?iso-8859-1?Q?v7wEXtTsw+HatHC/b3oS4kjBXbjiT9jqBTIviminPNQrAg8KiXR8JT6U0o?=
 =?iso-8859-1?Q?1EA1s7ZoFDWrIUPYw0xmYc2d0H2hxONtgxfiNjf57aCgd8lSeWrr4L0hWB?=
 =?iso-8859-1?Q?ldgYb8OCbljyt4Xlv7GT4grDYSYaWWRZQs3oUGEwvNwlFnDFgmLRwaSrix?=
 =?iso-8859-1?Q?vMXGutl24t8o+X5KZV9nr6dPtcno7DpQookmvM9tFyn2DkBMDXuq+vtEn7?=
 =?iso-8859-1?Q?B3uDs2rn3pvzQUUefLRc3u9XiUOmtjo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef33927-a2b9-445c-045b-08de8ec818f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:51:59.6356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VMn+9DuE4x6mXRYAD+p35UjZqFRWKRztl/jKrkLnchmWCq0B7QMqkvbMRF3naZKDP9R6P5169HN+qLd5Em5B7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9202
X-purgate-ID: tlsNG-16d1c6/1774921921-82B961C2-18CA9FE4/0/0
X-purgate-type: clean
X-purgate-size: 7270
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
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 736143632D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Xen SMMUv3 driver only supports stage-2 translation. Add support for
Stage-1 translation that is required to support nested stage
translation.

In true nested mode, both s1_cfg and s2_cfg will coexist.
Let's remove the union. When nested stage translation is setup, both
s1_cfg and s2_cfg are valid.

We introduce a new smmu_domain abort field that will be set
upon guest stage-1 configuration passing. If no guest stage-1
config has been attached, it is ignored when writing the STE.

arm_smmu_write_strtab_ent() is modified to write both stage
fields in the STE and deal with the abort field.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 93 +++++++++++++++++++++++----
 xen/drivers/passthrough/arm/smmu-v3.h |  9 +++
 2 files changed, 91 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index 73cc4ef08f..f9c6837919 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -683,8 +683,10 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_=
master *master, u32 sid,
 	 * 3. Update Config, sync
 	 */
 	u64 val =3D le64_to_cpu(dst[0]);
-	bool ste_live =3D false;
+	bool s1_live =3D false, s2_live =3D false, ste_live =3D false;
+	bool abort, translate =3D false;
 	struct arm_smmu_device *smmu =3D NULL;
+	struct arm_smmu_s1_cfg *s1_cfg =3D NULL;
 	struct arm_smmu_s2_cfg *s2_cfg =3D NULL;
 	struct arm_smmu_domain *smmu_domain =3D NULL;
 	struct arm_smmu_cmdq_ent prefetch_cmd =3D {
@@ -699,30 +701,54 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu=
_master *master, u32 sid,
 		smmu =3D master->smmu;
 	}
=20
-	if (smmu_domain)
-		s2_cfg =3D &smmu_domain->s2_cfg;
+	if (smmu_domain) {
+		switch (smmu_domain->stage) {
+		case ARM_SMMU_DOMAIN_NESTED:
+			s1_cfg =3D &smmu_domain->s1_cfg;
+			fallthrough;
+		case ARM_SMMU_DOMAIN_S2:
+			s2_cfg =3D &smmu_domain->s2_cfg;
+			break;
+		default:
+			break;
+		}
+		translate =3D !!s1_cfg || !!s2_cfg;
+	}
=20
 	if (val & STRTAB_STE_0_V) {
 		switch (FIELD_GET(STRTAB_STE_0_CFG, val)) {
 		case STRTAB_STE_0_CFG_BYPASS:
 			break;
+		case STRTAB_STE_0_CFG_S1_TRANS:
+			s1_live =3D true;
+			break;
 		case STRTAB_STE_0_CFG_S2_TRANS:
-			ste_live =3D true;
+			s2_live =3D true;
+			break;
+		case STRTAB_STE_0_CFG_NESTED:
+			s1_live =3D true;
+			s2_live =3D true;
 			break;
 		case STRTAB_STE_0_CFG_ABORT:
-			BUG_ON(!disable_bypass);
 			break;
 		default:
 			BUG(); /* STE corruption */
 		}
 	}
=20
+	ste_live =3D s1_live || s2_live;
+
 	/* Nuke the existing STE_0 value, as we're going to rewrite it */
 	val =3D STRTAB_STE_0_V;
=20
 	/* Bypass/fault */
-	if (!smmu_domain || !(s2_cfg)) {
-		if (!smmu_domain && disable_bypass)
+	if (!smmu_domain)
+		abort =3D disable_bypass;
+	else
+		abort =3D smmu_domain->abort;
+
+	if (abort || !translate) {
+		if (abort)
 			val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_ABORT);
 		else
 			val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
@@ -740,7 +766,33 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_=
master *master, u32 sid,
 		return;
 	}
=20
+	if (ste_live) {
+		/* First invalidate the live STE */
+		dst[0] =3D cpu_to_le64(STRTAB_STE_0_CFG_ABORT);
+		arm_smmu_sync_ste_for_sid(smmu, sid);
+	}
+
+	if (s1_cfg) {
+		BUG_ON(s1_live);
+		dst[1] =3D cpu_to_le64(
+			 FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
+			 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
+			 FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
+			 FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
+			 FIELD_PREP(STRTAB_STE_1_STRW, STRTAB_STE_1_STRW_NSEL1));
+
+		if (smmu->features & ARM_SMMU_FEAT_STALLS &&
+		   !(smmu->features & ARM_SMMU_FEAT_STALL_FORCE))
+			dst[1] |=3D cpu_to_le64(STRTAB_STE_1_S1STALLD);
+
+		val |=3D (s1_cfg->s1ctxptr & STRTAB_STE_0_S1CTXPTR_MASK) |
+			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
+			FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax) |
+			FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
+	}
+
 	if (s2_cfg) {
+		u64 vttbr =3D s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK;
 		u64 strtab =3D
 			 FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
 			 FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
@@ -750,12 +802,19 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu=
_master *master, u32 sid,
 			 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
 			 STRTAB_STE_2_S2R;
=20
-		BUG_ON(ste_live);
+		if (s2_live) {
+			u64 s2ttb =3D le64_to_cpu(dst[3]) & STRTAB_STE_3_S2TTB_MASK;
+			BUG_ON(s2ttb !=3D vttbr);
+		}
+
 		dst[2] =3D cpu_to_le64(strtab);
=20
-		dst[3] =3D cpu_to_le64(s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK);
+		dst[3] =3D cpu_to_le64(vttbr);
=20
 		val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
+	} else {
+		dst[2] =3D 0;
+		dst[3] =3D 0;
 	}
=20
 	if (master->ats_enabled)
@@ -1254,6 +1313,15 @@ static int arm_smmu_domain_finalise(struct iommu_dom=
ain *domain,
 {
 	int ret;
 	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
+	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
+
+	if (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_NESTED &&
+		(!(smmu->features & ARM_SMMU_FEAT_TRANS_S1) ||
+		 !(smmu->features & ARM_SMMU_FEAT_TRANS_S2))) {
+			dev_info(smmu_domain->smmu->dev,
+					"does not implement two stages\n");
+			return -EINVAL;
+	}
=20
 	/* Restrict the stage to what we can actually support */
 	smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
@@ -2353,11 +2421,14 @@ static int arm_smmu_device_hw_probe(struct arm_smmu=
_device *smmu)
 		break;
 	}
=20
+	if (reg & IDR0_S1P)
+		smmu->features |=3D ARM_SMMU_FEAT_TRANS_S1;
+
 	if (reg & IDR0_S2P)
 		smmu->features |=3D ARM_SMMU_FEAT_TRANS_S2;
=20
-	if (!(reg & IDR0_S2P)) {
-		dev_err(smmu->dev, "no stage-2 translation support!\n");
+	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
+		dev_err(smmu->dev, "no translation support!\n");
 		return -ENXIO;
 	}
=20
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index ab1f29f6c7..3fb13b7e21 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -197,6 +197,7 @@
 #define STRTAB_STE_0_CFG_BYPASS		4
 #define STRTAB_STE_0_CFG_S1_TRANS	5
 #define STRTAB_STE_0_CFG_S2_TRANS	6
+#define STRTAB_STE_0_CFG_NESTED		7
=20
 #define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
 #define STRTAB_STE_0_S1FMT_LINEAR	0
@@ -549,6 +550,12 @@ struct arm_smmu_strtab_l1_desc {
 	dma_addr_t			l2ptr_dma;
 };
=20
+struct arm_smmu_s1_cfg {
+	u64				s1ctxptr;
+	u8				s1fmt;
+	u8				s1cdmax;
+};
+
 struct arm_smmu_s2_cfg {
 	u16				vmid;
 	u64				vttbr;
@@ -669,7 +676,9 @@ struct arm_smmu_domain {
 	atomic_t			nr_ats_masters;
=20
 	enum arm_smmu_domain_stage	stage;
+	struct arm_smmu_s1_cfg	s1_cfg;
 	struct arm_smmu_s2_cfg	s2_cfg;
+	bool			abort;
=20
 	/* Xen domain associated with this SMMU domain */
 	struct domain		*d;
--=20
2.43.0

