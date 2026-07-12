Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q/1yLCmfU2qlcQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 16:05:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F41744EDF
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 16:05:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=PSGhMnzs;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361070.1613587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiunb-0001a2-Em; Sun, 12 Jul 2026 14:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361070.1613587; Sun, 12 Jul 2026 14:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiunb-0001Ve-BN; Sun, 12 Jul 2026 14:04:51 +0000
Received: by outflank-mailman (input) for mailman id 1361070;
 Sun, 12 Jul 2026 14:04:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wiuna-0001Aj-2o
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 14:04:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiunZ-004b44-Fg
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 16:04:49 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a539eb8-e002-0a2a0a5209dd-0a2a4506b1e8-40
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 16:04:49 +0200
Received: from [52.101.83.87]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a539f01-0835-0a2a45060019-34655357a96b-3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 16:04:49 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS2PR03MB9540.eurprd03.prod.outlook.com (2603:10a6:20b:597::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Sun, 12 Jul
 2026 14:04:47 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.019; Sun, 12 Jul 2026
 14:04:47 +0000
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
 b=Argt4KlYvFuS5Fpp9L7S9lLQSm0tlyZsXPtz47CbOvhBAvWQoqs1DEu+gJYt591WvPqPL1/0gmLyQCLDuWahDZx3A2N7NaJwkHvcJmDnMFnKIt9YEB11FtOB1/e/SYD36hZ2BTWU/cgeGkhk5iHV9oj8KZcUfH0nuo1o0roahcBk9ahnORsE7YbefcphdIw6RV9ClEVrvLudtVFAN/2HKWm6O19tAeWmSeV55y+gp23sWDSdYdVtUfb8gu4ppPFFcvfdatrq+zbIadwqnLwOrJnLPR1sauhULalSU/0OKD55g+BfsLwvKMeH3DP1d/TrUBn2qvfhV14t5VNvJ1kkyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgnoE2/vbR0U54fdtVsbfuzS4jDVloiK5WrMbSsnuKc=;
 b=qWIviSGw+m495pin0I81GfY1SIqFwv/vXSdU0kUF14uzvJiZbEj0/8J6BWX8cD/ts/ov4xWvhAlB7RNKDKPHw6WF/iOPFqzVO996ygI/IJPo87Nlm78uEUJbopThJnc4KwZWpReiefBPbKzPRnYlsj+V5Qo7zmUyE4LBel1oDH3GGh6fpy83ks8ax6NgqXJnUGw2sTln/OiwS2nJWCRDEyrJ97YyuENTtTrPiUkUN0IQYX+3pzy2/p9XQ/l7WmIrBdV8nicLu9akSr4bk7A5ml3tEE6epSDzTMNV0B8jhqOkh3ilo3CYrBp745XuuAVS7nka1OWKTj7Q6OGcXvGXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgnoE2/vbR0U54fdtVsbfuzS4jDVloiK5WrMbSsnuKc=;
 b=PSGhMnzsb0zDaAEEX7fMVkDwMCD3HESYPpD7H5hKVtTyUBU9j749K/hx/Eb1GwV7CZizfS5b9jlDV79b+5eLxrhy8GMVrVH/u7PgqriVHvpxUoa0fROHP7yd929nNRCM5wFNHhRsMc/o4LmAAPOQH5GnPKofwskuMU5Lod3c6Nfjxz/mWpMZA5JpMJsWYficOCxht7OWOcK2qcteJ/Hei0ntO6KR/vZOQ/vw2cmxoJmBrsT63LMUIVO5Y0PQBYoQnxXhVyGGl/b5c+L2gXbhIped22u6CgXTMb0wMRDJoGDO4zM7gw85XwYNfx1G/lUhpxb1xxHpBCFL/kgF7Rl8LQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 3/3] misra: deviate MISRA C Rule 5.5 for ARM SMMU fault
 handlers
Thread-Topic: [PATCH v2 3/3] misra: deviate MISRA C Rule 5.5 for ARM SMMU
 fault handlers
Thread-Index: AQHdEgdlAM1Q0XRp9UaSkflqa1nGRg==
Date: Sun, 12 Jul 2026 14:04:47 +0000
Message-ID:
 <242bdedf03e5b0b3e9db37c4f9d2160cadfabb3e.1783864426.git.dmytro_prokopchuk1@epam.com>
References: <cover.1783864426.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1783864426.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS2PR03MB9540:EE_
x-ms-office365-filtering-correlation-id: 079ba1cc-4fde-44ec-b3d9-08dee01e884f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|42112799006|23010399003|1800799024|38070700021|6133799003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 e1nff4OI7ASCkNLPENdwkT50b+7fVGjEty0y+DZT8tVEK7tT05cipSuY5dI4k/OkftxGNhWA7P+6MzNWznjClIAoIJc2VqszW191aySe03NS6yA2yEvxF8vCi4qEfzhAITf4uwNId7ZC8E5WmtfWVPeCvuQ+qHFK0W0wX++/bth+4U8RA7yotlB9+Zve/TN8Md0Ex7J5sPw994tuJONwXJvFroQGgcDYCyhbaXOHKQufKK6Zo8NjQm4vW+i34mcebS3PLDJbtGo1LZ8M5vo+gRfN+PRt7lCKn08MiYxe87kLms5ryTBT/+ZloFTZo2hqpA4tSgl7jGPdE0tmm/O5dzmqc5om+kg3FVJvAi5BXS/2nYvZRlbC+Wy0FRq4EphX5thpHvnQJMw/Mml6xZAPs64UVguv/BMoSFRBCbjRyeVgbWY33lKfWPlrk6kCJ9ZQjjhAOHNncJLbAYJ0A25UyGCDzw6+ul25axPtAX1Y6+7fUI7Q3oaFzID8N+r6cEDHPxSmhFLJOtp0FX8F3f+RyzDbSSq5In7/OztRBE3SO3BA/d+JqH2FDtIRUXACxUr3WSW0XoZE7lSIUbK4fTK9jctsg+J+xh7zZtdi88Xd76C/OedXksp1hu5+1bSoIr/R+TPeplb2nomAlBS5Iw/6HSUWWBN50Z8Rm5e31z96fNTIxjf4W8GYxakodRnDJbJlmfSqoNpfW/UgnpXZ0LuEBNzTdMAuj//dbACHtREb1U0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(42112799006)(23010399003)(1800799024)(38070700021)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?w6iWP+uSCubn1ICZuK9HzHhZouTN+UOa7Z5IigasmJiluT/+wrIiD/MK1r?=
 =?iso-8859-1?Q?f1ixBsSmkRFlhdc0mjxpdiDUqpbydUXR+wQ+gYdrxt5XiLRQ2vP5Q9D9Qn?=
 =?iso-8859-1?Q?/pUTSAfWb5WFPZczZlQqGX8XUXN07rrl12hCCMf2hgyLSpJDx9+zBy8KIj?=
 =?iso-8859-1?Q?zfiKrwI0s/0cn6xfp09LWGV7dNeCAlYp0uAQFZFk23/48xY9hsYMOQ2NJ5?=
 =?iso-8859-1?Q?QpzT+yqxPJaQZwqlcRI+3ruVQVYlw+Q7GQPnjEcO0BoQxmc9GWQrleIi9b?=
 =?iso-8859-1?Q?SA+W1lwcLocVEojG6je5XZevcF84I6zRsI2SxZeyi1up/lrbP16IINkPYC?=
 =?iso-8859-1?Q?ICJQ7AIhCAFrl1aN112Qjli5hMweF0tXAMZ0SF8EtfwS9wFZL/ukUJnQGT?=
 =?iso-8859-1?Q?P+uPFdc7aOpimeEq+12JbiKhMROwEIjjjtqsubM9EWAJnYoW0dRHy9AZ2N?=
 =?iso-8859-1?Q?HVkxyDdXNwa/9ONULHyjor77hyM/aEEz5vtwkx+eX6I1BH3GfRrgpcT9Tz?=
 =?iso-8859-1?Q?zi/E07W48nd4iabtMYu/216CRj8JFCEy+RJp5JNvW8cUy81wMdutHGyDeX?=
 =?iso-8859-1?Q?aRgkgKcYkV3ohSltbdDdvr0msLIH6OwaXhTu+8AAgbdp0NiOOdrvDaUBF9?=
 =?iso-8859-1?Q?FsFoRPMqBnxPvpnJevGIyGaE0q1NBCzoX8cGE4qi8VigsfBWEPb21b8VWg?=
 =?iso-8859-1?Q?YOONDGFLZrRfXcrAdUpTu2u+SIpYjopEsLdOUXcj18NjPw8IT4rfMUGXSc?=
 =?iso-8859-1?Q?MjVr9qUTEUnYLRrtfyy4mX1e+hc9y6vSyZAPWGOAn59T8KGpS2yfL6LIYL?=
 =?iso-8859-1?Q?6/VYU4nyeeFS83hbEpu7fSONZNtJ6Fo0mzi2PeCkNwzo6GUvS46VhL1mX0?=
 =?iso-8859-1?Q?EgAdXBPGrkIgbkQv3644tiia33H7lE37PpurOjv9tgJX6gy2MW/yc2gtSK?=
 =?iso-8859-1?Q?nkiPkI1mg/I08qJGQfzYZHNwnmFOqdcfg+2qgHi8GYTR94Y6Z6pWaJ/j44?=
 =?iso-8859-1?Q?v7bL9K+uBJdFTM6I5boAUa59wVdNcmp0hUrJ8k3RAMTFyAwlgstLXxTRi9?=
 =?iso-8859-1?Q?L73mS8o+O8Wih1FPj+ZzQOEv+49FZuWtsZQLpv2pYsOtG1nqG8WcxkDFgD?=
 =?iso-8859-1?Q?5pFh+Blv3DkWLkdrneHw8SrBgZGbH3UJE+L0izqUToYtttnW1XxWkGFOvt?=
 =?iso-8859-1?Q?LfTIrUfQZ8ciXA6J8A3gso0Rf2/Um+BmjiMw74OIflcIGeXr7IiKHiyQGI?=
 =?iso-8859-1?Q?SBk3fhP+Enp4rGHrSREZrYGVYVAu6xLx1E9kOt5UU3gIyxyXoE7TTYZB8w?=
 =?iso-8859-1?Q?GKdDGdYG9BTim9MbQCNG0TeDqLK794VLsbt4e2WMfHdwQZVkUOJX8eDEP2?=
 =?iso-8859-1?Q?UgSez9mFoin0HcA6MV7rFCTWMK7TrruqgMexmdHu5RCX6/uQ7DbQpUynQ6?=
 =?iso-8859-1?Q?2NzyjLVb8Y+Oze442Y3CbhyZ7gVuTtQ2sS1kDXLO5Jdn3z1zf+bnJfZ4Zx?=
 =?iso-8859-1?Q?Nm8SM4zyR3bO26s5X1J/mOVa8moxAWy6WHbn6PeGXQa7tMWR5Ww4WPlBSl?=
 =?iso-8859-1?Q?Eg0B1XDNjJE5wJ3Z8EFH948IsgqniGcT6em7GWuir6lWnAgpoK5lmBdLlj?=
 =?iso-8859-1?Q?FhsHqxex3KTe90fT3TJ1vO1V84urYLX28zbjLdaDi6h51yFzeg+Ipw87VC?=
 =?iso-8859-1?Q?4rYUQnasxxQXJpXx+08eiNofk9xAktu5lbM0bkgxLfIYMuSBWGMM0nzWWV?=
 =?iso-8859-1?Q?G7HEKcF+YUWJ0+V2h9oc30uJ9mGWEtpXSRL3tvByHQQhezbcW+iw79lR5G?=
 =?iso-8859-1?Q?8uftDcGTluY/8vqp+vrCoHiBD9HaWSY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079ba1cc-4fde-44ec-b3d9-08dee01e884f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2026 14:04:47.3610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lDmpr+4+3Jps8VMYzQJpCfY6lnIyfLQgme67ulyhwFY4X12db6c2flf7tpwNKC+butHo316+Af+GP2gkvic47bg8M9pmThLGDa1xgbPbs9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9540
X-purgate-ID: tlsNG-16d1c6/1783865089-F8B43617-738F6DB8/0/0
X-purgate-type: clean
X-purgate-size: 3550
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:from_mime,epam.com:email,epam.com:mid,epam.com:dkim,gitlab.com:url];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61F41744EDF

MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro
names".

Update ECLAIR configuration to deviate identifier and macro name
clashes by specifying the macros that should be ignored.
This includes 'arm_smmu_global_fault()' and 'arm_smmu_context_fault()',
where the original ARM SMMU handler returns irqreturn_t, while the
same-named macro redirects later uses to a Xen wrapper with the
void interrupt-handler signature expected by Xen 'request_irq()'.

Update deviations.rst and rules.rst accordingly.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 8 ++++++++
 docs/misra/rules.rst                             | 4 ++++
 3 files changed, 16 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index f7ffd78a36..97f1a91afb 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -140,6 +140,10 @@ These macros address differences in argument count dur=
ing compile-time, effectiv
 -config=3DMC3A2.R5.5,ignored_macros+=3D"name(request_irq)&&loc(file(^xen/d=
rivers/passthrough/arm/smmu\\.c$))"
 -doc_end
=20
+-doc_begin=3D"Clashes between ARM SMMU fault handler functions and macro n=
ames in 'xen/drivers/passthrough/arm/smmu.c' are deliberate."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(arm_smmu_global_fault||arm_sm=
mu_context_fault)&&loc(file(^xen/drivers/passthrough/arm/smmu\\.c$))"
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 3eb9912c45..0404e6cc7f 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -192,6 +192,14 @@ Deviations related to MISRA C:2012 Rules:
        reordering the handler and flags arguments.
      - ECLAIR has been configured to ignore this macro.
=20
+   * - R5.5
+     - Clashes between the ARM SMMU fault handler 'arm_smmu_global_fault()=
',
+       'arm_smmu_context_fault()' functions and macro names are deliberate=
.
+       The original ARM SMMU handler returns irqreturn_t, while the macro
+       redirects later uses to a Xen wrapper with the void interrupt-handl=
er
+       signature expected by Xen 'request_irq()'.
+     - ECLAIR has been configured to ignore these macros.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on =
the
        type of guest to service.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 40aff97a07..dcfe4d5f30 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -230,6 +230,10 @@ maintainers if you want to suggest a change.
        the macro is a local compatibility wrapper that adapts ARM SMMU dri=
ver
        call to Xen's request_irq() argument order.
=20
+       Clashes between ARM SMMU fault handler functions and macro names ar=
e
+       allowed because the macros redirect ARM SMMU driver uses to a Xen i=
nterrupt
+       wrapper with the handler signature expected by request_irq().
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
--=20
2.43.0

