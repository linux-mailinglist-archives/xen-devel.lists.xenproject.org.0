Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6gLoDLQZJ2oMrwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 21:36:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FEC65A192
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 21:36:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=sORFrdG0;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332030.1594661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWfkm-0002UX-15; Mon, 08 Jun 2026 19:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332030.1594661; Mon, 08 Jun 2026 19:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWfkl-0002SR-Tr; Mon, 08 Jun 2026 19:35:19 +0000
Received: by outflank-mailman (input) for mailman id 1332030;
 Mon, 08 Jun 2026 19:35:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wWfkk-0002SL-U0
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 19:35:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWfkh-003oIN-1R
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 21:35:15 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a271972-5cb7-0a2a0a5109dd-0a2a4502eca2-2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 21:35:14 +0200
Received: from [52.101.69.117]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a271972-af86-0a2a45020019-346545759631-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 21:35:14 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS8PR03MB7318.eurprd03.prod.outlook.com (2603:10a6:20b:2ea::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 19:35:12 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 19:35:12 +0000
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
 b=FhGwSkvpGHV0kUchm/Gp9yHJtLfDdVDD+5ZAzcigOE0pcOp1P2EbEHb7SjPu3hcnq4QAaOBwGRfsvlA31JEUUbjqBPmmFstvrJBSdkK84vjs6yO/4RtpfqLBXdcINwNSgLg9M4dNR5leR8U1D75NZE2gYrHPBQD5kl81ZSNnvBqM5KKpanzFwy61eZew8rbD0clnq38fz0bQyYe06i5V/PGmlwmGo9HCONgoC5fVuoX4X4MrvljqFxbmAxTQWLRx9H3cMKLnxB5zZP3Mt7W5KnWVbgNto9g6ZCyx9vpLpP6Zp5Tv4nXDROyqbjoptlJrMWm0hr5ytOa+4cKFzoR23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gM/uJWznb4zSkV5by61LyWNXqXZ7xUU/M2EgvsQx6Zk=;
 b=DsqSEYLBLTN9zd260Vg0sX5lWa0fpvLrE7pskgyrKxO2TIh56P/5jMlPjT5UaMIX3vllG8wrtpoWrpwAj9WSf4mnhEkYOW+/m6bBrsSMHxi1jkpr1YurVhQn8bS5R0hiJ74+jp7ChuBTJspitfAbhzvz0BtYUu0WYhwarY6oXEPZZKGDmM1HkMgNennwL2+TR1ObHax9+liB3t5/bp8GE/LRT1/3eHQgy0YCCdzk4vHtUQmg27vqYIcSD2MPZUDbPjr3ytLrlbVxUqZBVQXecYaO77S4qLApYDfdfBOGp2XZu+1XW8o9uUYBgDvjCaFg0evp//TYqf/Fj9LwGqxu6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gM/uJWznb4zSkV5by61LyWNXqXZ7xUU/M2EgvsQx6Zk=;
 b=sORFrdG0vVwIwrRHjV0iJ3rXyX0fUrbFFOhQt4xQQFTJDuuHQeTVo1HN+3Q3d+UBq9aMNUV4lKEfKpDt1J3ft1NXFdkaMV2+nxavOrY0xhO1qdBHJJP5mhF99DlQq4vVKY3A0A3g1WiGGKCoYL/nylEuw1lsVgbnd3+sVWsXrGNMZPXwi4HA5GGfVGqfCHPCvVCSA7T37nNM9O2mHmAAbqdXQSIdu6eu5zkr2cqyAUuWvt2Jtis7bnbjxH/HDdF8Y1Y7RtIsw6s1tJ1UyoGywXv4Fmj6WdINMDj0nrHmjWMM8UuUbSrRe0geHbnf6ZcAZZozxlHDfORjmKboWX6BMA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] xen/decompress: resolve MISRA R5.5 identifier/macro name
 conflicts
Thread-Topic: [PATCH v3] xen/decompress: resolve MISRA R5.5 identifier/macro
 name conflicts
Thread-Index: AQHc933sqAgjoPjitEesqeqMnsJ02w==
Date: Mon, 8 Jun 2026 19:35:12 +0000
Message-ID:
 <f73e440f0ec5aeaa5f1bceaf1fd1403099df57bc.1780946676.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS8PR03MB7318:EE_
x-ms-office365-filtering-correlation-id: 066b30b0-aa6e-451f-ac49-08dec5950f04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|376014|366016|38070700021|18002099003|3023799007|56012099006|11063799006;
x-microsoft-antispam-message-info:
 ZuLb9gen1+n0uDNhTLrvIAPWMC7KcqjuAP148wD5KWSXW3M40o4tkjul+ETHll2jMTbg8p42mrEWpgXswYAulk6+O11Ja6DGQpLJ/6+l00QHlXRsHFW6JBzmZjSydv5K6YvCuGzrAevWuVlAmTiCdVRN++Y5v5nQOxUTFRsIXeWuzQDrBQT01fd9u8/106UVroUiEgEhXZWh4sIl4QSMEDIPYhN9QRRfpZSGyOd+qo3sFy1I2NhVSmA227w/cB/hLURoy36EF9FV7amLfkomc/+dFtLcwUdP/9EIEfb+Iavzhz9ajtNR6Fo/PXq341ao0QI68QXDsKqBfwifrhe/ZSZ2fC9+e3Ng2stQR+kRFEknSIDoxMUDfOyKWiE0d/2deKUUpxx8YF9RZU3EMrHABbKylp1Rfpy+uV8bafoKjJyCi4QWNKUWmSV0HZYEpmpdL0UKDbnki+2UC9tqd1cY//JEYWwcZ6S3CrmnOw1qlZVbqbNhZnlkh+QgI/vtKZ1Jp60gD+D4t0yHQ5dT5L7qgXtCFvXX2HnVW7GrQ7+rLG3Cej/295yYa1G3xOYs0jsflaPepfDxSZKa/UXOlqSdCKeM8OcIGJlUNZsA8nGjC9oChRb+q2DCn5GaG+aVxhPhxjaGpOH6u/96m90OJBoYbKvngN29UY1ATDb72UNtX9r5/9jvlph2qKG8Vs44d/nppPsJJfVN/4Pk7ymlWB37WA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(38070700021)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MbfCDtSBOg/Nv0IQKE9vaQT3xEt+XyFVTlu5L3FtcUd4Te1oTPz7jIgsh3?=
 =?iso-8859-1?Q?u9htilbO/yni80LEHB2edRToLiWXv722/MQUK1SuRVY0OwlsQawemY/Wbo?=
 =?iso-8859-1?Q?t9PCYgHSFHtzQXcGpp5ZA17OymkeTkTihR/E+GPlX65VbTHdO7ZzbJCRfx?=
 =?iso-8859-1?Q?R5YioFm0IFIUqbJvQNn1n3x7cZNqVk/OWFfBclPuY3DX3fOLzAMGZxxjlg?=
 =?iso-8859-1?Q?44HolNjpqd7h5zJacvWlRqpS09L3IQQOv25Dl7mxWTiKObk55RKy1LR/F4?=
 =?iso-8859-1?Q?owavdjux7wETebSHrUOSYOkUlzbkjbqeUftEM7iQ7QZbSc6t2nu1dz7Sfm?=
 =?iso-8859-1?Q?+gTFw2yggijyRfqxHm7iUtmQNo4v2im8sflIjoJp94j+7d2Kbr5YvvHyx5?=
 =?iso-8859-1?Q?GC6PcbbEtK0VtYbOmNounO+Vaei7ZV/YK0VFT5JBxoBTBNeEcjrbqU5gI7?=
 =?iso-8859-1?Q?L2HYO5baR3lfkfX9iFLPkkbVyMmOCBQ/3qC5EGIBwM82TPY/Efg+CNijFg?=
 =?iso-8859-1?Q?i7WfEjbqBLnKFWZz/yF4h6/9QfN8fLE/luwBzamWLC1qGFS/z2rh7meLUS?=
 =?iso-8859-1?Q?TZyeW7xNBYULZYgmFgo2x56GmY7Jg6eohXQoIwOMOUGCVBKp7vfLGFZ2uS?=
 =?iso-8859-1?Q?rWpUQ/9m3vfHgzKHOven6CDmqnM5RmbpM8hpL5WwzzfH2hAfZKB8dfX8xw?=
 =?iso-8859-1?Q?UJsZbVltejOluZW6vZGAN5uPDQxyFlUCHyJOcBrrwHa6GnNLpVXsjpUBm6?=
 =?iso-8859-1?Q?jIr/gx5RpV5I7u+Inciw6Ksz1N3fihey6oMtG0dwcJK1I50WG5lceo8tCr?=
 =?iso-8859-1?Q?eHCQz764dQ6UZhQWbaW4OnXIFBE05hUPLGmLEM9uBKKBFlMLnRQanLLUQA?=
 =?iso-8859-1?Q?CrCANXjBHv0SeTJjHi3hOC3tDome7lDYu7CDWWflIeqDqEATQVJDbeTyg6?=
 =?iso-8859-1?Q?/GZjp6dFT3xnjW9q/NU7DkeUZdndRneJD2+SpaoB+V91WdHryknmoygJPB?=
 =?iso-8859-1?Q?xqk/AcWX0C48YBDQHiYuZF2h/zi2PVYJSDlliwFUG3ijRg8bAI6sRDtKW3?=
 =?iso-8859-1?Q?QOT3Ay82JABvjcNiWM/bwsPS2cTxh4tWsGHUyruGxgRzsblN1XUxUSOPCK?=
 =?iso-8859-1?Q?lTqsDc9JfJ5OftWwWq7AfReIAMHZKHBTSPlPo7rX+jVowCJN+5iYEehjDu?=
 =?iso-8859-1?Q?T5gLSdGnlF9DgR0qansSAE6vjiJIZnfnviPrXJwPXdNl1q370WLGRWLoL6?=
 =?iso-8859-1?Q?u7vKNyeQjEQ1j5Zko69iPffd0/hhem9pcUOSDq1wBAkB2lMtxdw2U7FSI6?=
 =?iso-8859-1?Q?zk9ituLg89XcAvG2r/5EJNGkt4bGXrKvD5mFTW64XCvezt+sIB4w0UDcNo?=
 =?iso-8859-1?Q?FMmbr4h3iCaRNcESWDchK9v886hquqb+73FiQjAX1d/Jpz8HeNneArNHAi?=
 =?iso-8859-1?Q?9s6K6uMUsHliipoB6uNrSk/aOQlL4VQYc/ihOSy056y6epGU2UZ3YVTlXo?=
 =?iso-8859-1?Q?5xvbcPCrxUQelRO4XKnp2j9ZpAByzTm63Kc/uS1yrtoE2Yt1834BGdGc6s?=
 =?iso-8859-1?Q?6LEdSPE+in+XgK5HHpvDiYDemSvC3gmlghPxLm8iuJ/iUpHaXMWdvmPMvk?=
 =?iso-8859-1?Q?E9U+HWZPtOY/Zn7/3nGVCdpbbUNlhgRRh1bUYSG/dhe7VekwC+Kmx90cO0?=
 =?iso-8859-1?Q?cuuKrKB2+c1nF/ZQ8QHG0GqYn4RAuK95LnjaTc1+J5Ib845zAPA77ZbrLK?=
 =?iso-8859-1?Q?7RidaCh3efiHcbrz+HSK8LHFzFfE0BURCVQkyWlIm5S+mNVDu8TxevAAAw?=
 =?iso-8859-1?Q?Ff06s8kOxM+VgzaaRCE2uLTs7KhtQpQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 066b30b0-aa6e-451f-ac49-08dec5950f04
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 19:35:12.5319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ZZUl+EWWE8th6nKJttQe198NZq5YogEyydIZglaouP3pbMCCc6FF4JK4ZyWATBvy6LjKTfsi5qTm9XZ+cQaENHpz5vXJu6teBeN2rBiPnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7318
X-purgate-ID: tlsNG-720697/1780947314-ABF66161-923E9453/0/0
X-purgate-type: clean
X-purgate-size: 2160
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82FEC65A192

Convert 'free' macro in 'decompress.h' from object-like to function-like
form.

The object-like macro '#define free xfree' performs unconditional text
replacement, causing conflicts with identifiers named 'free', such as
struct fields in 'page_info' unions defined in 'xen/arch/arm/include/asm/mm=
.h'.
Function-like macros only match when followed by parentheses, allowing
'free' to be used both as a macro and as a struct field without conflicts.

Applying function-like form to 'malloc', 'large_malloc' and 'large_free'
ensures consistent macro style.

Additionally moved 'large_{malloc,free}' past the #endif to reduce
redundancy.

While function-like macros prevent uses where the underlying function
identifier is needed directly, such as taking a function pointer, no
such uses exist in the current Xen codebase.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
- updated wording of the last paragraph in the commit message
- large_{malloc,free} moved past the #endif
- changed macro parameters naming ('s', 'p')
- added Jan's Acked-by
Link to v2:
- https://patchew.org/Xen/025bc771fe1339dfae476037af86c6bfa1048382.17796541=
14.git.dmytro._5Fprokopchuk1@epam.com/
Changes in v2:
- converted other macros for consistency
- updated commit message wording
---
 xen/common/decompress.h | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/xen/common/decompress.h b/xen/common/decompress.h
index 034c833665..b347d91980 100644
--- a/xen/common/decompress.h
+++ b/xen/common/decompress.h
@@ -9,11 +9,8 @@
 #include <xen/types.h>
 #include <xen/xmalloc.h>
=20
-#define malloc xmalloc_bytes
-#define free xfree
-
-#define large_malloc xmalloc_bytes
-#define large_free xfree
+#define malloc(s) xmalloc_bytes(s)
+#define free(p) xfree(p)
=20
 #else
=20
@@ -21,9 +18,9 @@
 #define __init
 #define __initdata
=20
-#define large_malloc malloc
-#define large_free free
-
 #endif
=20
+#define large_malloc(s) malloc(s)
+#define large_free(p) free(p)
+
 #endif /* DECOMPRESS_H */
--=20
2.43.0

