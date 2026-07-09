Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e7XwOld0T2pOhAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:13:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D7D72F72B
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:13:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=HuMXEpxL;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357873.1612205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whll7-0006mv-NQ; Thu, 09 Jul 2026 10:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357873.1612205; Thu, 09 Jul 2026 10:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whll7-0006ky-K5; Thu, 09 Jul 2026 10:13:33 +0000
Received: by outflank-mailman (input) for mailman id 1357873;
 Thu, 09 Jul 2026 10:13:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1whll6-0006kr-0j
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:13:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whll5-00D9WB-DW
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:13:31 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f7445-e002-0a2a0a5209dd-0a2a4502d9ce-44
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:13:31 +0200
Received: from [52.101.72.108]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f744a-5a27-0a2a45020019-3465486c04d1-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:13:31 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU0PR03MB8415.eurprd03.prod.outlook.com (2603:10a6:10:3b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 9 Jul
 2026 10:13:29 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 10:13:29 +0000
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
 b=VMxItlvQ9fLyBgbdX6wHpGTMEZUewzUIX5uMrkvXlQFtmnaGi+wNaz6eoIL98U4+efKsipCUxcVBNcpP7MZUbXAon7Fb59ROjVqIHexmn1skCN9ZfQAsomTEbxB2shJ6FHueknlbVy41ameSWm7bRDS6qRmCWn0TpfKF0KQCIKzKtdAJCa9z0ENXmzZ50lyBPffobmTeFt0BwMES21MeQlQbAIo4wl4O/nHNIWE/tXTf2JHxmd/3JYQFJ/OD/UYf9ktf+DrcvqGcuvyl0FQRjIbTDWVcf7/9N31j9TMJyPhcI1AfCYgxCZVqTTv+4hbGqwjTFzriTOhgYkwQlwGFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/o8sTq8hzBqS17jGbJrLIxEROCwYZI7Po+zLWplBApI=;
 b=BVgBofyHL74skSwJg3zwGt6SD0OfEy/nJX530x1E1lqDllBMLmB9+e9bO97mpf2x2E+v0oi6hCfqNR6j0+B+rhevbu0dVEewA5yc9aLfPoU7t15SGLOaUgi/XWi3GCmjpSOqvX+taCenXEAfNLPCxeTJHwrMa3pUPqA4q5w4lmZcaE+iEF2p+9eKZm0nX8o677mncsRUVgZ1fILCOjy7XjXpR+u0kdWf5xRAaoSVZjHrKmLefaEKYQME9/yobGXSCezHgJ4BMty4HgCy0mbRTdDG6lAapR4YfQRehqc09XiZ/edQ1q2bBZ0K6IJoPK3IzJhnp9b3+Ms0wWXARVFh1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/o8sTq8hzBqS17jGbJrLIxEROCwYZI7Po+zLWplBApI=;
 b=HuMXEpxLlk2QB03axUjcpMKHl1B6SkIOTAsqGB6Yag5Vqmk/b8seLLwWxcLCBHkg/NM0ecDVYKjSMPqdxlMojPQGRcUMqrAWwbsHJ0X6RhH2hmPdcSxijIM9Wy7+L1Xtc/inhu0pGeIPYAcZVUNCeE4Wy9AJUei8t4Pn/E/BrUeFD+u4hr31Bcyp3GvSBGDN5PK3k/Voq/Vpc+RA5ZTWy24JFKHWMKFpEmYYEI5nISJrRenHB0a7QH2tEbPTcYKFNPlI4kLB6+rFckhH1sy2MkKu3O/P9d7IlwQbuLkL43DXipa2bRi0Y4d5zZMbqNPkFdJz6ST/MYHLFALRklbk8w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.22 v3] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Topic: [PATCH for-4.22 v3] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Index: AQHdD4d7qU530mHLc0yhuTdjB7BCxbZk8ayAgAAGcAA=
Date: Thu, 9 Jul 2026 10:13:29 +0000
Message-ID: <76a0516a-a24a-4b95-b34c-bcb6fcb6f740@epam.com>
References:
 <500cc80a172570f7fdde3287185398dc49460b2b.1783590032.git.dmytro_prokopchuk1@epam.com>
 <19771234-d108-4ddc-9517-ae420aa70e93@suse.com>
In-Reply-To: <19771234-d108-4ddc-9517-ae420aa70e93@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU0PR03MB8415:EE_
x-ms-office365-filtering-correlation-id: c0a9dbaf-fd71-49a8-1778-08dedda2b900
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|23010399003|1800799024|366016|376014|18002099003|22082099003|38070700021|4143699003|3023799007|11063799006|56012099006;
x-microsoft-antispam-message-info:
 l0O5VKvss0AfHxcflB1uBqotaQr/njax/DgA6zwdh9rlBd1yaIO1clbg/8mBZfYpvo6TNbCXL6dt7oCRDS96VgRbRciRID79oE/Ls6dNeCL48g6Dxo3W9ZczB/PawKkmnVBaRCKgZWk9Kkd/bsySbs0YsK2JDeB4JlxkLW3aKkV/efM+gbdl0U9rMzDa8jTcUMbZ+aukXivtn8nGGnJL0yXi2eiHhb7TQLG1P39TxNzjRDhCNQqJCttbTuu3/49i+FIeKFV3346Op/D4GhzGYhAjuen+mgB3GHzthBGqax0e0kRHb7g19ykzdYyT6v72gWJ/KbE5qtEFqbJOnt6qSIr/t97jjUO/3IpMiyVvZrzQ5pEe6KecrQ463JeT4IXDZDmfpRmeEvrTrUv5MnGYpPmR4E6HLdifdKy7zr+d0iz+97rR3Uyp5eTb2exF0kC/C8I7tWbjVlj7uzzwh6Enzq+5wLi8JtvIa9U28CWMuSnYlPDb+sc4i/Kv2hSsME2x75J20uE2RQ4IVgayj3MJM6Kdu4vs/qLdMmAdgOArpxB8TNezCIFJHPphWGoxuYjp/iMfoGGNfYaNcKYfCobWTQjx0o/rQzUBYDaPS7NLcubM6l3aaXZJX4p34wZTZ9DSOd/XWJgttXh9p7jxNe6IEHeH8lk1XE5TkBTcj/5WXo2N7ZYV5OGkcSi2hMh2ZmfEMaecJiWjLA9LwnBLy+mnWNC1GNReZhxYNMw0IrcpJvE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(38070700021)(4143699003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGJPUGhMd0RvS2VKMHFWWXl6V2loUHEzNVh4eDUvdnBaVURTYWFEaXFTcGlJ?=
 =?utf-8?B?WDVZZVNjTW5iNldqRk4zVjI5YTFLaUp1K0NRNkFLUnhBcWFjSXBkL1c3am03?=
 =?utf-8?B?SXRpdTRFcENCSXRxYUxqMGswMCtWSWNxelp3cE00WTNhLzJreEZ5ZVVSZ0U5?=
 =?utf-8?B?NmJsYlNEMEIrUG9OcHROZnJ1cDZOVnhRYnhPZDFuUUhYUno3NW43Q0FIY25o?=
 =?utf-8?B?d2Juc3llUXhNMU9EazJyRldjVzJHYnN3ZFV1Q3ZwWFlMbTdidTB2RFYzWEFY?=
 =?utf-8?B?SE4wN1JhVUR6czl5Sm9nR0FYTkdIRTFjYnFkeitUYnozczFrM2paZlpLWm9P?=
 =?utf-8?B?dWYzOWRvMVRvTWhRQzk0Q1psTTBJdk5Ub2RxM1U1eWppRUxmOUthaXZFMHND?=
 =?utf-8?B?ei93RVBsbCtyc09HSjdmVTROU05lZG9zSE9UM01tU040akRId1FOcHorcGpj?=
 =?utf-8?B?Nk1OU05GSkVpVVBkTmVETUlCckcyWlFTdE0rR041N04rcnFBek1GWlpyMlBl?=
 =?utf-8?B?Wk1NV0xsZk1lOENLeHVnZENOaFovaXBoQWdrNFRCVXlLaUZpRzA4K2Q2MU8r?=
 =?utf-8?B?SXlvRkpGbTBEbnZXVEJQc1ZMVXBMOW92ZFh5bllENGxmeTBiMlZ4ZjFkMVRo?=
 =?utf-8?B?MTJlSTZZOVQ5bXIzWTlSTFV3Wk5KYTlIaFhsai8yb041RXNNMHNDNEtZeFFx?=
 =?utf-8?B?WXJtWHk2ck01MkF2M3pEYXVCV0c2U0pLM1hrWHhPYTNNVENSWHRXSWRKdjRT?=
 =?utf-8?B?bmh4czIreWZmTEg4NCtxUVliS281bnFpcUFnRjZuT0RrYmtIWEhERVlDNUJY?=
 =?utf-8?B?OHhFMlpxK05DdHI0U3RHQzB0b2pYR09PVFpCL3QvYmJZL1dnVXQycUEvSTdI?=
 =?utf-8?B?bTZqdUs2MEhjTzQzd2xJNVRqMUVKa2YwMFJac0hsVm9aSlNXK3pKNUJXN1hl?=
 =?utf-8?B?QUlFYmVvcFAxeUc4OCtTWjRtMWJ3K1VlVEtRWXNncXgrU29nMWkxRGU4QnVL?=
 =?utf-8?B?UFhjc1daVHVTZmZNak5YQW1WMnVSWWlXZzk1Mk9TMytDV0g3aGxUMFE5V0xi?=
 =?utf-8?B?N1NPUThXMkFPQ3ltbW1GaDFxT1VLUkNYUFRuWE05SUhSVTRUMk9KRlFjNlVV?=
 =?utf-8?B?NFlqQVJxM2xhbzU4aHJ0Mkp5d3FBSWdPdmxOcUdnS2JReUpEa0ZNTGJTRnpU?=
 =?utf-8?B?a3lxQUdJV3lWY0g3V1VIZFc0dlVQTnVVMFZOc1pNVGNZVC9mOTNmemdxK2tx?=
 =?utf-8?B?dnJOVDMyUmRKUHFaN2xWVWx0L29kNExUc1dVNGpMR051UHo1OTdDZ1R3dmFL?=
 =?utf-8?B?YjNtUzJsekI3WklLN0ZSZmdZeDNCNkhhUW05SVdJQnYyZk9RbENqbnc5UW03?=
 =?utf-8?B?aVVnNXhncEd0N2ZwM3lOZmNHM2tvQkVMSUtRQWVIZDFyWldqVjRLRitzTlhS?=
 =?utf-8?B?bktFWUVodkJlQ2lXQnY2YjdIeDZtYVAwOTAyaGF6cFRLRDljbnBvRTdNRlBs?=
 =?utf-8?B?R25XT0lkZkVtV1o0TXNjMnpzSmZhaTlSM1h1bnozb0FXck9xelBEd1V4T1U3?=
 =?utf-8?B?YmJFTE51b1JucCsza0lqbWc5RTBKK2UzeEs3aEpva1B2SzZjdnVQWk90blJ6?=
 =?utf-8?B?NTJSYmRXZGg3SHRTa0YyNHY4ZnRmUW5LeEgwQnVkTEJFbnRmc3B3VFpvT3lV?=
 =?utf-8?B?VUh6bXk3SVFJMEhpT3lWRzZnN09DK2FJZGNZSU5HdGtkblNIU1BMKzd3VW5F?=
 =?utf-8?B?ZjcwUEZIN0lMR0lRdFRNRFFzYjU0TUZNRVpkMlNNNDF4Rlp6VWVkSzZhWkJQ?=
 =?utf-8?B?UzgzdG5ZS1NNcE43Tkx0RUwzV3VRclBEZW9KK0NWdHFKT1FvT0JDYkdyYnV0?=
 =?utf-8?B?bERubDAvRGJFTE1XVDBMUFQrSERZblh5N3RTczRqeFNWM0FjNEN6L1dDakN2?=
 =?utf-8?B?TG1XSzRmQ0Q4cDMzSndpdWRtMzkwT0FEbDJwZzZNemFBSlA4RytreEFYaDFG?=
 =?utf-8?B?NUFZQ0ZaL1ROanBaL2NXZGtrRmY1ZW9SNzd5WTdLMXJLdGt5WWRVNDdyV05K?=
 =?utf-8?B?VzRNSDBGR21TODFiR0h2b1NhaVgwblBrVGY3VmN4OGVWV3E1OXg5UzN5SUhO?=
 =?utf-8?B?Qm0rYzBuUWVkaTNPNXN0RlZUdkVsK29aK2pOK3RvcStYZWE0L05sS0k0c3ZO?=
 =?utf-8?B?NXY4ek9uL25CUkw0UkhoRkJmRXMvNGVmZk9qRmtjdUxjejFRcHp0QlJYdHYx?=
 =?utf-8?B?NmFQOXZOOHFuajY5R1h3K21Ub0dUZ3d2TVUrS1lsSEdIcnhmeTJkUTBDYTNi?=
 =?utf-8?B?cHREQ2NjUlowcG5oMW5hR1FKdUVEcEtJMEMyUTNRTDVDcDRwSm1HQWVKYTFq?=
 =?utf-8?Q?NI1WOtR3RKyWm0TQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7CE107CB524B74BB70F6D2CC1BC6ED5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a9dbaf-fd71-49a8-1778-08dedda2b900
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 10:13:29.0959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8dOoVX4ounSW/B1Z0bUqyQDWG7elJ2Rl6++/f/xleLUWNZd4pjBhjOg20o66aKDg/61k3LUqH67RWNVebYUtXrtMVOs2MDB4K8kKQ+Syf3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8415
X-purgate-ID: tlsNG-720697/1783592011-4D1027C5-5566E882/0/0
X-purgate-type: clean
X-purgate-size: 3572
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53D7D72F72B

DQoNCk9uIDcvOS8yNiAxMjo1MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA3LjIwMjYg
MTE6NDQsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+IEEgbWFsZm9ybWVkIHBhcnRpYWwg
RFRCIHNwZWNpZnlpbmcgYm90aCAnI2FkZHJlc3MtY2VsbHMgPSA8MD4nIGFuZA0KPj4gJyNzaXpl
LWNlbGxzID0gPDA+JyBjYXVzZXMgJyhhZGRyZXNzX2NlbGxzICogMiArIHNpemVfY2VsbHMpJyB0
bw0KPj4gZXZhbHVhdGUgdG8gMC4gVGhpcyBzdW0gaXMgc3Vic2VxdWVudGx5IHVzZWQgYXMgYSBk
aXZpc29yIHdoZW4NCj4+IGNhbGN1bGF0aW5nIHRoZSBudW1iZXIgb2YgcmVnaW9ucyBpbiB0aGUg
J3hlbixyZWcnIHByb3BlcnR5IGluc2lkZQ0KPj4gaGFuZGxlX3Bhc3N0aHJvdWdoX3Byb3AoKToN
Cj4+DQo+PiAgICAgIGxlbiA9IGZkdDMyX3RvX2NwdSh4ZW5fcmVnLT5sZW4pIC8gKChhZGRyZXNz
X2NlbGxzICogMiArIHNpemVfY2VsbHMpICoNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc2l6ZW9mKHVpbnQzMl90KSk7DQo+Pg0KPj4gVGhpcyBsZWFkcyB0byBh
IGRpdmlzaW9uIGJ5IHplcm8gZXhjZXB0aW9uIGluIHRoZSBYZW4gaHlwZXJ2aXNvciBkdXJpbmcN
Cj4+IGJvb3QsIGNhdXNpbmcgYSBoeXBlcnZpc29yIHBhbmljL2NyYXNoLg0KPj4NCj4+IEZpeCB0
aGlzIGJ5IHZhbGlkYXRpbmcgdGhhdCBib3RoICdhZGRyZXNzX2NlbGxzJyBhbmQgJ3NpemVfY2Vs
bHMnDQo+PiBhcmUgd2l0aGluIHRoZSB2YWxpZCByYW5nZSBvZiBbMSwgMl0gYXQgdGhlIHJlYWQg
c2lkZSBpbiBzY2FuX3BmZHRfbm9kZSgpDQo+PiBpbW1lZGlhdGVseSBhZnRlciB0aGV5IGFyZSBw
YXJzZWQuIEFueSBpbnZhbGlkIGNlbGwgc2l6ZSBjb21iaW5hdGlvbiBpcw0KPj4gc2FmZWx5IHJl
amVjdGVkIGVhcmx5IHdpdGggYW4gZXJyb3IgbWVzc2FnZSBhbmQgcmV0dXJuIC1FSU5WQUwuDQo+
Pg0KPj4gRml4ZXM6IDljZTk3NGM0NzU4OCAoInhlbi9hcm06IGFzc2lnbiBkZXZpY2VzIHRvIGJv
b3QgZG9tYWlucyIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29wY2h1ayA8ZG15dHJv
X3Byb2tvcGNodWsxQGVwYW0uY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIHYzOg0KPj4gICAt
IHVzZSBNaWNoYWwncyBpZGVhIGZvciBwbGFjaW5nIHRoYXQgY2hlY2sgaW50byBvdGhlciBwbGFj
ZQ0KPj4gICAtIHJld29yZCBjb21taXQgbWVzc2FnZQ0KPj4gLS0tDQo+PiAgIHhlbi9jb21tb24v
ZGV2aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYyB8IDcgKysrKysrKw0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZGV2
aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYyBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxl
c3MtYnVpbGQuYw0KPj4gaW5kZXggZWFjZmQ5MzA4Ny4uMTc5YTJiODhhYSAxMDA2NDQNCj4+IC0t
LSBhL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYw0KPj4gKysrIGIveGVu
L2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jDQo+PiBAQCAtMzQxLDYgKzM0MSwx
MyBAQCBzdGF0aWMgaW50IF9faW5pdCBzY2FuX3BmZHRfbm9kZShzdHJ1Y3Qga2VybmVsX2luZm8g
KmtpbmZvLCBjb25zdCB2b2lkICpwZmR0LA0KPj4gICAgICAgc2l6ZV9jZWxscyA9IGRldmljZV90
cmVlX2dldF91MzIocGZkdCwgbm9kZW9mZiwgIiNzaXplLWNlbGxzIiwNCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIERUX1JPT1RfTk9ERV9TSVpFX0NFTExTX0RFRkFV
TFQpOw0KPj4gICANCj4+ICsgICAgaWYgKCBhZGRyZXNzX2NlbGxzIDwgMSB8fCBhZGRyZXNzX2Nl
bGxzID4gMiB8fA0KPj4gKyAgICAgICAgIHNpemVfY2VsbHMgPCAxIHx8IHNpemVfY2VsbHMgPiAy
ICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSICJJbnZhbGlkIGFk
ZHJlc3Mvc2l6ZSBjZWxscyBjb21iaW5hdGlvblxuIik7DQo+IA0KPiBQZXJoYXBzIGp1c3QgZm9y
IG15IG93biBlZHVjYXRpb246IElzIGl0IHJlYWxseSAiaW52YWxpZCIsIG9yIG1lcmVseQ0KPiAi
dW5zdXBwb3J0ZWQiIC8gInVucmVjb2duaXplZCI/IChJIGNhbiBzZWUgMCBiZWluZyBwb3NzaWJs
eSBpbnZhbGlkLCBidXQNCj4gaXQgbG9va3MgbGVzcyBjbGVhciBmb3IgdmFsdWVzIGFib3ZlIDIu
KQ0KPiANCj4gSmFuDQoNClllYWguLi4gSW4gRFQgU3BlYyB0aGUgdmFsdWVzIDAgYW5kIDMgYXJl
IHZhbGlkLCBhY3R1YWxseS4NCkhlcmUgaXQncyBYZW4ncyBsaW1pdGF0aW9uIGluIGltcGxlbWVu
dGF0aW9uLiBTbywgInVuc3VwcG9ydGVkIiBpcyB0aGUgDQptb3N0IGFjY3VyYXRlIGRlc2NyaXB0
aW9uLg0KDQpXZWxsLCBhbHNvIEkgc2VlIHRoYXQgdGhpcyBmdW5jdGlvbiBoYXMgbWFueSBzaWxl
bnQgcmV0dXJucy4gQW5kIG9ubHkgDQpvbmUgcmVzdWx0aW5nIGVycm9yIG1lc3NhZ2UgYXQgdGhl
IGVuZDoNCg0KICAgICBwcmludGsoIkRldmljZSB0cmVlIGdlbmVyYXRpb24gZmFpbGVkICglZCku
XG4iLCByZXQpOw0KDQpNYXliZSBqdXN0IGRyb3AgdGhhdCBtZXNzYWdlPw==

