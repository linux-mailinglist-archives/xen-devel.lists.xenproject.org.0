Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PtuRNFGBU2rbbQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 13:58:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D04744918
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 13:58:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=ucqb0FQQ;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1360999.1613553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wisns-0002W1-SH; Sun, 12 Jul 2026 11:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1360999.1613553; Sun, 12 Jul 2026 11:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wisns-0002Ty-OK; Sun, 12 Jul 2026 11:57:00 +0000
Received: by outflank-mailman (input) for mailman id 1360999;
 Sun, 12 Jul 2026 11:56:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wisnr-0002Tc-DX
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 11:56:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wisnq-00AqkR-QV
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 13:56:58 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a538018-bab6-0a2a0a5309dd-0a2a4506c906-44
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 13:56:58 +0200
Received: from [40.107.159.76]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a53810a-0835-0a2a45060019-286b9f4ccdfa-3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 13:56:58 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS8PR03MB6869.eurprd03.prod.outlook.com (2603:10a6:20b:23f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Sun, 12 Jul
 2026 11:56:55 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.019; Sun, 12 Jul 2026
 11:56:55 +0000
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
 b=gi+hAIbS8/gIrHkHS7T0zAItTcc/4BWfGtpOv/q7dXbnGiA/3tRJWJM8GZmxfUXaPUExjtmmXxtMxzCeHbXx6xlUTcBHCH5A6MsSSM8pEPUWM3Wf9f2/N0TLJTGbG3nn4iQ8Qn5ExvtwGDhsG6ktqEg5qA+q/NrtKvvD2aKLp+YdI0TmOz/NZfhSl+HstYOApaAx1p/n+pCyiHOoGTtqJD72B1lhhFZgZXlh4vWna89yICGalbCjYUo/SASVCjlU130+V7dF3y1cCHYF5USFy6SuYdZRQUk0nK9zy2HAHJFCL6zJjWiLCHh1xcezPbruTfbd4mBkQX0pUONhdwsM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYSPPdVvAI5lUuozSM16Or77N8DGe8MHqHcPvmSevBs=;
 b=ag094WXexVTITY3aR1l+2wf5j5+5gXrX6E5mReRjhV8hloiw6RGIk69O3wNcXyweaFvKktw8oO7kH2EjSpTBzQOx2fedgAVxenoyUm3RsG9TVLTYxr4N0c03lhMMqZ+uWNCoWOQQaIGSYVw/aT+5bMT88N3GekAyPYfAwe63FLhzMJvJY3rFkRghwbtvU1ZxhRCh0NJwA5JsH84NljEtVwzz0+Ak+/ssKDW90o8l7O2ENWS3/bbmObb0WjdvfnuPz2LIyWKaRY33o2TeNRuiIPpK7jrmH17E0aV4u/3qdz1U0gxmgVJwHuy4Uz9DQDlACd7nYRtmmeY6kGTdP3j9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYSPPdVvAI5lUuozSM16Or77N8DGe8MHqHcPvmSevBs=;
 b=ucqb0FQQbw4lPLGWy2Iuzi+GXA0P1V/4jGM15BjqlsF2Nn8wBVgAzHw4bb8tWFVBl360It27NjCJ3cD9dJdAmxU+wjcmYjgejrsB1DZ1cqEeCuqU70BzynFSy/c1tm2sF1pZl/lHJmiPmhy2ytB2+wdptlS3bPXmedzcD8C+K9Ikec2GL3NSxZK0TkeyhKmtAIKL8WxmJ3j7haIiBL6gcgbsdircsf6Dto+tnp/tHYu7+WtE6ALRB+PJODBoRnJKsstyD3FMgqENoo7UVXDzGfjhawanlQI+Vdoe/kWYU/QJ+0zI89HJoiskLR2PhnLCNEWybQKQipJliBmAtgp6JA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v6] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Topic: [PATCH v6] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Index: AQHdEfWIck0nSDsiiEuWy8nQa16TYw==
Date: Sun, 12 Jul 2026 11:56:55 +0000
Message-ID:
 <351b89ba726d5524fd920cc28b7204d683fa8c43.1783856794.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS8PR03MB6869:EE_
x-ms-office365-filtering-correlation-id: 81e743cd-b3fe-4e76-9582-08dee00cab54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|23010399003|366016|1800799024|3023799007|11063799006|18002099003|38070700021|56012099006;
x-microsoft-antispam-message-info:
 sSuKo+8ZjttKa1bCNsJ2bx853bKUXpDDDkkNlTE4wwPxgJvn5Nc49AcMzGcedDdoH0WWABCjhqxkbZhiVuuPvoLumQ17HityrA9PaXZxz9OwAPBX/JC6L94i/tndlNDPGTDi2aelhZgFvudQNLgVnq8RwGeFfeGzO3N7Qj5NRNtRxxp4Xvz8xwFNwRriCCQ6201b6r4vmALINQqftWMnzaCsvVIHec9pXVTb0A589GzpH/adiGeEd5Ob0GlNbBrVtjRxuIfZn2s7p/04YAJadl0lPk+vpcEAykpzEVeoG/w3oIH23DbVpOPZLL2CD/r4cDaVuyyH8xj9gM4U3Dc2ASZemERHvmaBnPvHjjkFtgzplvR+zm0USEg07zg4HNVrUr1gacjuTxRUZXQ8tt0+06TsYZ4NkJilw7Hte5wCPIN93nyYw1kQCDNipHEpiC/O9x85BD9NRDVtP/apN9J818Mo77SwXfBTh8s+hr9B/FOrt+JXT0AuqDPZGfmRjO2X9tWLpCW1tCOYiTiEANo/8NE5DBXK/eSLWsjDk6fW/kkwC+HwklmnoK+OJu4Kb0b71vxl7nvQx/XnSoGcGFRvTGTWc/sy7oTvxEEn/J8UVFQ/5cepY13AiZgnplkcQPnSWcyQseQW2JsUP0v7yuiuHHL1uJRSmefqbRW1Z1Gby1fr1DPu+UlPExMXH70R2zLRsONCRiY7nupeVpDo26EdbFpOoUcPYAjpFrBZrK6reWU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(23010399003)(366016)(1800799024)(3023799007)(11063799006)(18002099003)(38070700021)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?B+ASsgAtGDTNf9LPXHMcRFyjgpZvh4894aBrJ1lvlZzqGzy8XxAuPabANr?=
 =?iso-8859-1?Q?rckSw5TD7JgIrcBEjdReAntKK7sCT5UMds9a8X8PqJGAFOxS5Ho0htbZVG?=
 =?iso-8859-1?Q?dJ0X6HUQRjFWBUpw/Om3pYvSUBUixIU06cJBHlxZwelneon6+5S3CnmtfG?=
 =?iso-8859-1?Q?ViKOPEC1cf/7K0B+CDsbU/incqqx7lG741UavewcAy7lkNLXTluOKaZof5?=
 =?iso-8859-1?Q?g5UhOHlWHBND4GFeNX4b9qzXgLx6YWIkixQeX81pK1iRkvSku/gDxnw41v?=
 =?iso-8859-1?Q?SaYV127LLpFn0Q9045A+OKCZa1vpUSzA2CwEKoamR3abZ+zwU5zFaGOBto?=
 =?iso-8859-1?Q?Kb6Brhe4G6oJKdLK6jQD0pkdjvAO3soieTIv7tRUXW0XZTNS0d7UysRikz?=
 =?iso-8859-1?Q?KPsxRQGGMOQyTiekQl/lDMNszqX28uq7TvIoDFMbUWROpcp6bnq/MfHZN4?=
 =?iso-8859-1?Q?3elHc118b8PIvbGwizM2ZvN+xLAAsd5RBpSFkTtnUc3PQywvckTEOxPMu7?=
 =?iso-8859-1?Q?VAx+m+bGnxvEOk8u1CnyEWl96xPUMtoarKAkTw4YvwOpzpDPjuVaHRMhF1?=
 =?iso-8859-1?Q?SSx9witt4AxiK/KyCGioTCOTvKRsY2hhdV7IJvrI0Aiq73IZzs3bEoOj8q?=
 =?iso-8859-1?Q?u12MTP9+31LlFihWI8gNaioeUYJ0FDdp0ylfjZTwly9L6FcEtEeBG7udrz?=
 =?iso-8859-1?Q?K3756YA0FLIWjnpYoi42Vw+8vcQ5rX2Fiyq66n7KInX6EVQJevpdvxAD5e?=
 =?iso-8859-1?Q?sPkJq85VEgn2A8Khf3+DiKELyuR22MzOxXiqkeViIo4q0OsX+cZ+xvFWnp?=
 =?iso-8859-1?Q?FQD/usvxa+fY+We32bPejgz8Zjqi1bmjl2ePt/9IN4JbRHytw8YOLT4UsR?=
 =?iso-8859-1?Q?UWGYiER/7xXy602PsVclaLRext7RgT9eXCeKuSVONcUBIrDbCm4RRnxtxC?=
 =?iso-8859-1?Q?274hRldn5p9idFTD6ohrhUoqnkdlCypCX8APiSeDWQETP4JU12c8kXJdYP?=
 =?iso-8859-1?Q?YbVCDynM0DlWWdIkLBxqk1kTnqfHTx90f9Zzukz25NCe31PV2ZyPfSy8kB?=
 =?iso-8859-1?Q?gzjlEYuQmNQTjfqqZPAvYvbqW1Ea1bE2X5wGqnrcPp6o6ywruXMBgfIzV/?=
 =?iso-8859-1?Q?cHiGK8QXmU63lYm3cetJ/qdyxC1dqyoVwwHIb/TQUu1lmQ1XsRo1rxGg5g?=
 =?iso-8859-1?Q?byK4K90iOxmqdiGX43Oc9hbad9J0MA1BHJUkOvQSyJBRADyGHHQDdNYagW?=
 =?iso-8859-1?Q?ZQZPnstEGxZLI/cgcpIK8zkI/19B7k4yxSKeWl30ixLN3Y2NjlqqvToCrY?=
 =?iso-8859-1?Q?vBnTBu9XICjXNlgHle/PdEOgMU1k9Spadm//K/F3LEHYwbh//OVh1bplew?=
 =?iso-8859-1?Q?81hCHHOp3FIB+XG5q9uSMpyMFPmJXx32E4tQ4XCOV7lg546apz7DTWIJCW?=
 =?iso-8859-1?Q?bREr7xbrZjIibGSt6mGN1BguTDaINEMOS3tS97D5L3UaC/XlIUHKCCysXm?=
 =?iso-8859-1?Q?XF1rrYwuoGL7F5qAcAjQRrJQmhlZj2w+aJfmUOuDynM2puy8EYlyz/lMte?=
 =?iso-8859-1?Q?t6RH99rdbJqozstfVtdSNjB/y/kGPK4g4Dnff8tqiXDphiE0DmrxfrwYul?=
 =?iso-8859-1?Q?rB40yHDUezi9BhBa0nwts7xZYuhPUl9q2cJOTT0Y2tZuT2nJ820F+3QGsG?=
 =?iso-8859-1?Q?0VQJjt9uOi/clntWbEmdUVZR3XtoXNPrCROFR7bPaTGK+fhICf3fJhTMpd?=
 =?iso-8859-1?Q?OsO+4AZTy+AwEThM0oD7BnKDDkPsAjogQFsFBmMkgYIMCDH/vQKHe2DH2S?=
 =?iso-8859-1?Q?9DNccy8DEnXxIqVWitUHXBuixgVmDtM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e743cd-b3fe-4e76-9582-08dee00cab54
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2026 11:56:55.1605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gXyc4sNxzMCImLfFsu5IvCNvmbDWRiWja26L9K+eRwyy9Tlc30KeftY6S9461VP1lFFdqTJskGjnIf2XAkrlAi/pCBSkdhnRbSpeYMNrkp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6869
X-purgate-ID: tlsNG-16d1c6/1783857418-F9548617-173A00F6/0/0
X-purgate-type: clean
X-purgate-size: 2713
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27D04744918

A malformed partial DTB specifying both '#address-cells =3D <0>' and
'#size-cells =3D <0>' causes '(address_cells * 2 + size_cells)' to
evaluate to 0. This sum is subsequently used as a divisor when
calculating the number of regions in the 'xen,reg' property inside
handle_passthrough_prop():

    len =3D fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) =
*
                                        sizeof(uint32_t));

This leads to a division by zero exception in the Xen hypervisor during
boot, causing a hypervisor panic/crash.

Fix this by validating that both 'address_cells' and 'size_cells'
are within the range of [1, 2] at the top of handle_passthrough_prop().
Any invalid cell size combination is safely rejected early with an error
message and return -EINVAL.

Furthermore, update handle_passthrough_prop() to use the sizeof(*cell)
instead of sizeof(uint32_t).

Fixes: 9ce974c47588 ("xen/arm: assign devices to boot domains")
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v6:
- move cells check at the top of handle_passthrough_prop() with a comment
- reword commit message
- replace sizeof(uint32_t) with sizeof(*cell) (use expression instead of ty=
pe)
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2667596761
---
 xen/common/device-tree/dom0less-build.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index eacfd93087..9513c1c837 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -152,10 +152,23 @@ static int __init handle_passthrough_prop(struct kern=
el_info *kinfo,
             return -ENOMEM;
     }
=20
+    /*
+     * xen,reg holds flat host/guest physical addresses and sizes, so the
+     * inherited #address-cells/#size-cells must each be 1 or 2. This also
+     * guards the len division below against a zero or wrapped divisor.
+     */
+    if ( (address_cells < 1) || (address_cells > 2) ||
+         (size_cells < 1) || (size_cells > 2) )
+    {
+        printk(XENLOG_ERR "Invalid address_cells %u or size_cells %u\n",
+               address_cells, size_cells);
+        return -EINVAL;
+    }
+
     /* xen,reg specifies where to map the MMIO region */
     cell =3D (const __be32 *)xen_reg->data;
     len =3D fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells)=
 *
-                                        sizeof(uint32_t));
+                                        sizeof(*cell));
=20
     for ( i =3D 0; i < len; i++ )
     {
--=20
2.43.0

