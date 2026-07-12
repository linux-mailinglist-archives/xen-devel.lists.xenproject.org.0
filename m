Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PreoKCifU2qjcQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 16:05:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F28744ED5
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 16:05:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=IT4nRGok;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361067.1613564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiunZ-00014T-Ni; Sun, 12 Jul 2026 14:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361067.1613564; Sun, 12 Jul 2026 14:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiunZ-000125-HZ; Sun, 12 Jul 2026 14:04:49 +0000
Received: by outflank-mailman (input) for mailman id 1361067;
 Sun, 12 Jul 2026 14:04:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wiunX-00011n-9l
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 14:04:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiunW-004b44-Mz
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 16:04:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a539eb8-e002-0a2a0a5209dd-0a2a4506b1e8-36
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 16:04:46 +0200
Received: from [52.101.83.95]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a539efe-0835-0a2a45060019-3465535f2cc0-3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 16:04:46 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS2PR03MB9540.eurprd03.prod.outlook.com (2603:10a6:20b:597::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Sun, 12 Jul
 2026 14:04:43 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.019; Sun, 12 Jul 2026
 14:04:43 +0000
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
 b=ZmwDZ9hJcbkBC7GY5NrOgTg5vwEcBF6UMLmFi6ffJvOZuayh1RvQfKp7WVyjOyiittXV5WlDlumNIbh2tknmJo9R/G0iQ5bRWOePX3TA59W4B7NMH7xSfzVFU1N/HyMvZ6daxRezXx4BPlqAoUbiFyKjfVKNoYtZXe+17CCmq+snWgCAoUi3FfNZ5Rug2Zhb48ID//r3sSdYHln69jBALbG1OBGGqYIRSRt/OMXQEnaximFr0pI6qfEhHwXA+Au6JsVdFhmXucCU6CcWi0rKFl9OXGhyK06E+8dHl9dk7VF3x70YL07//dkVl6QNmoI1dG/3ikMjanGHVWWmMYWA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heZ+hCwBOHlPBsStACIkcTth7xnn3if3PJaDgI2tfKc=;
 b=YhHWBji/u2kgODP8P9V+A8AUQOyRd7uyRas6hW/Ts0E4y+EvuvsxW1AOj6F2t4/wPcKYIZZP9mkYZBkKf7paWnpNnyIhn0lcJRqOR3wnnlvgKb9d6Ft8jRuOJTDwbAgvJPpYyCREFJefOoZPZUB+cRNVTuNv0U0DWWrRLa/NVhb1yz7jQbI+kKhzS5pkbKsGr3OUtp7+xB6lIcxyhdXFdPIJZbz6Ss+Q4FAij1ld8Ic+xHeaznTxIwipWylF6JL25COJRXfpJDiA98Kbu/rpENEr7yohil/PwuXqVIMA2NXn+w0Vs/k8O/Osls5bnKADOZCNPZGd3T4nVg7ZWZBHNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heZ+hCwBOHlPBsStACIkcTth7xnn3if3PJaDgI2tfKc=;
 b=IT4nRGokOE7KGyXyHLLyt7B15RBhoC6KUBgGsmqxDveeyYVqLv/o1lhWe0byl6mTGWLGs9LkXPl38KejclEnY4DlLSIP0HjTiM/iyB48FEc0m8b8Oufmto/I5YmZU7JvSqr1d1/bcEIOJ7G8UYPa7atS82jZMKfbsCoq7O/ef/txNqrJ6+2IW2HFt8ZVw5CyU518/D+0pJrQ/hyda1RNyoqNEvWQoEtUQLJsLjUIgjLA8lsNw/0/gTHgpBTUxM6DbgihDHfRAe+3cHO172CJ4JpFgUVJtsnsXadyCEgWlS2hugl4REO9SMsUP2LUt4c/pI+xjOEyWWXWLJvBNg1DqQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 0/3] misra: add Rule 5.5 deviations for macro clashes 
Thread-Topic: [PATCH v2 0/3] misra: add Rule 5.5 deviations for macro clashes 
Thread-Index: AQHdEgdjyN2FQ/IpqUeJ8f44PkQn7w==
Date: Sun, 12 Jul 2026 14:04:43 +0000
Message-ID: <cover.1783864426.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS2PR03MB9540:EE_
x-ms-office365-filtering-correlation-id: 1718ce46-401c-40f8-c407-08dee01e860b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|42112799006|23010399003|1800799024|38070700021|56012099006|11063799006|18002099003;
x-microsoft-antispam-message-info:
 kwLqzEN+zm9lUU6hsJjm5tgRjs3Fe937WOvStp5EVey5RnOWtPNLoxWExUWp6MmdVnOZB3xcj3oSfRoYvVypHokF0Phgl/5f8+QBboBSr40HWfBdh24bgydsX7YkOxgmyGv2TyMwUgGJToB6j5yyG1CR2R2c3tYL9b9eX4dSXDlf/WqGlzB/b0L4WAB4UfWTNTIteI990h8r0N+L7HPl4fVBUCDuPVYGyXv1kpPyNrRmQuBM4z/aBDLHWF+ejwfPJFhbHgOn3QrlvfMSq2DM5PwdyOIKkiJ5ijw63Girkm649QyzTRJEzM0H1uxLYo8vE9Pj4uZGx0ahmPxfBjOFU6Ir9kAzPWE4Yft/+Q+72yYqT763nM2oFLz6A8NYS+0DWstSbJ8JFhEFZ4/nIwByV86UncbAcwcGkLePeavzEieZQq60AXegoGXUxMon71DMyUhwVAJDt2SEiNsn79Uboe6deasZ1ZR3PHJYDE3Y12F/y+eH80c2/Tooh9YYhQXIb6+1uOa9r7k8VBi8kb0QOA3dazaiLqQiWAOA+37jNNiEd0oJTvG36XYHvZtc80x/X0fAi4RcisLS7VAihunT2JKf7tb6A9949aJOGh+cfBlVVMNVP4IRWsTPbcSNI8Upr46P9ZWM0ipRKFfhPFwYMBnbnJ18ClBNVD2AW1KQJDhNouBLAR1trDXGpplAZUY/bMNy1t08tjwXp88zEgQExt8o0vfQ7VVL/f2Y7OW2LnU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(42112799006)(23010399003)(1800799024)(38070700021)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?spKWCOtdRCyi8DHhp8eUXNBMvkp+X/Asuw6e3XqmpuB8Gj/FqTGIVKgoaV?=
 =?iso-8859-1?Q?8ya6Y4JdX0r0x2hkhfIVpz4pxSU7Q1qVHvsHebcfe/Qkg0gTsy94kZ1CRi?=
 =?iso-8859-1?Q?TAbh6NCjNZO9WCELs8mmeYN6OYQJ+O8bRGi/HPNzfglkLmr1srVWbdJVU8?=
 =?iso-8859-1?Q?lLlsnbpdhGc+VJd6ylHoGX69Bz+btN1RO0L9dm7tpeL87a0PEdnmRKQYbG?=
 =?iso-8859-1?Q?tB78DDGSUCxpiVPu0hfYE0U8/vvDVgkNSN4ogAAZlUWcb4qmrM7LuL/DZp?=
 =?iso-8859-1?Q?zPW2v+yE+CIcYIAesM1GlZ9x1cGeHP0nt3zXiBSmkZAxHozq1AV4Zpkvlm?=
 =?iso-8859-1?Q?34Ez7YP5AR5Oq8no6Mi6kCj4HVt7vAPSXBxhtMPNJLQBd8a+C7gJrEG55x?=
 =?iso-8859-1?Q?qcFalppOwf5oqFZMsuJw7kZYPRcIP2HFTExJUcFWlubZ2w1kIWG+7Qqa50?=
 =?iso-8859-1?Q?HSpt5tdNdYlYImdzTfG1O8NS0g9yjDiUNoDwaUkhRlSBeqbRBgA+53sHv0?=
 =?iso-8859-1?Q?ou1AhD6nmbhvF7ARsBc//h5xiqmO/4CUpDJRN7JgBJ06QsXoFTbYsCJ4Hj?=
 =?iso-8859-1?Q?f2P0MHzwxnYuH0circzWM/vNM7wa78g8c+f2QXqZOjiLODU9aw4JuBHamk?=
 =?iso-8859-1?Q?M58iQ31jYOX73HgNOadqu8NmPUl9EocIA41Ltg2ME7G3KN3DFJPH57d6IP?=
 =?iso-8859-1?Q?/hCnwUBffaIixyV1DcOPQ1Kmc+uZb6G/XUv3dell5bLsNp62uNUh2FpDy9?=
 =?iso-8859-1?Q?tE6kv/RXPzL9/wJBk3O4OLqLkmi0emMEMgQhlKdDD10P6tBocuc7TyPu/E?=
 =?iso-8859-1?Q?seCTZzYGJbo26H+F1vmCm71apHvsSVAUtyc91601FtleqbEkFhbXM9ptjf?=
 =?iso-8859-1?Q?jNaYjlFdPLN86yWsGSMwqJtOMIaHCuyhBvrvAue+LKDfIRUK10x8lYlgVf?=
 =?iso-8859-1?Q?KkBQDy0ylzT4T/rsfPc+Sc6/rVVYfXbcDFUA9pcKnkVKAXSsiVFNUArfrF?=
 =?iso-8859-1?Q?E5uMST4a3kKeeezmDpY/oOmAyEhzVM+nPt9mT+3dJBtu/ht7wcxpVlPlR6?=
 =?iso-8859-1?Q?40c6REd7QKUQtVqDWW4VcBS9bN4fOz15iLWiXVaxHNuz8wZP5P4b2yQ0DO?=
 =?iso-8859-1?Q?YpRz4U1GniSI4jqiWk/GkaFhf+5IyssncpT5bEt89eBM4lKo8rLoiJe/cd?=
 =?iso-8859-1?Q?y+cfv/rx2gir2v8yq/bJ3XZX2/7PSLrVJPOJDxlWhHkM4/NOUPaI98wbGW?=
 =?iso-8859-1?Q?qTStd37IymArOHOhUA0cma3Qebm4VJOBmngSHAtDmDT+LD4kDZlSyttsT9?=
 =?iso-8859-1?Q?vLdvgCJHj2JEm/8PWRaZi9MoUP7yT3nxN/trAF0e2vDBMBn/9DRSJwMX+k?=
 =?iso-8859-1?Q?bR7eCF4BiaRUOKTd9CASXmtfNqG7/pJxOoC/+uDwobUzIciTB6ZE9JpI2F?=
 =?iso-8859-1?Q?AKXhnK9zGFZs62dSfpCkv6IzraUdBWZRKyQcAYesN4zIbhtGZqmu5sOFrS?=
 =?iso-8859-1?Q?jHte0yMSregsV9HmACebTx8V/S7VFjYwt5rXcgyBMf2I78OLXJNjcTrzKo?=
 =?iso-8859-1?Q?/LbuYri/afCKeFf5HTf5ygLkE7K/tjhRQq3fQu6UsfEJ2HjoVuJL2qSSl+?=
 =?iso-8859-1?Q?UsuS7YI2LWC1MqgnLH4RsffziXc2U2VaWGFQGN4Lhy2phqvbi+klOOyu8X?=
 =?iso-8859-1?Q?Hw16cpTOT3q+frN1YWRkPQo9aGcEez4cwDrAXmUEV8gDR7dFNmul527n8i?=
 =?iso-8859-1?Q?3e3ntBl7wqCSndVGwAhdVrc1oesXLYO56doLh+ywGB9UxZ5sJIjKdDiK0Q?=
 =?iso-8859-1?Q?YkBWxmVcndC6GGcuvmbICbPozVwGZqc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1718ce46-401c-40f8-c407-08dee01e860b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2026 14:04:43.5256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wMoZplCEAUNpyVP9zXCbQ6yC0HqF6gmIjZoWhRHXjj40epNK/HWjLAW7VrUd3bliLc0GeCopCZ5LEV0J0Dg7R7WHqy2Hid1w9m/5iHO/ASI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9540
X-purgate-ID: tlsNG-16d1c6/1783865086-FAD54617-D7E8FDAD/0/0
X-purgate-type: clean
X-purgate-size: 752
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_SPACES(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:from_mime,epam.com:dkim,epam.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51F28744ED5

This series adds deviations for function/macro name clashes where
the macro is used as a wrapper around an existing function name.

Changes in v2:
- remove much details from deviations.ecl file
- use word "deliberate" in descriptions
- append "()" to function to avoid mixing style

Dmytro Prokopchuk (3):
  misra: deviate MISRA C Rule 5.5 for 'hypfs_alloc_dyndata()'
  misra: deviate MISRA C Rule 5.5 for 'request_irq()'
  misra: deviate MISRA C Rule 5.5 for ARM SMMU fault handlers

 .../eclair_analysis/ECLAIR/deviations.ecl     | 12 ++++++++++
 docs/misra/deviations.rst                     | 24 +++++++++++++++++++
 docs/misra/rules.rst                          | 12 ++++++++++
 3 files changed, 48 insertions(+)

--=20
2.43.0

