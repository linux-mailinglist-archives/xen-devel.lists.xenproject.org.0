Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WExTFxzcoWlcwgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 19:02:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7BC1BBBC9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 19:01:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243026.1543094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw296-00058A-CG; Fri, 27 Feb 2026 18:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243026.1543094; Fri, 27 Feb 2026 18:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw296-00055K-9Y; Fri, 27 Feb 2026 18:01:00 +0000
Received: by outflank-mailman (input) for mailman id 1243026;
 Fri, 27 Feb 2026 18:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH+Z=A7=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vw294-00055E-RO
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 18:00:58 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4395c34f-1406-11f1-9ccf-f158ae23cfc8;
 Fri, 27 Feb 2026 19:00:56 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by CH0PR03MB6177.namprd03.prod.outlook.com (2603:10b6:610:d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 18:00:50 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 18:00:49 +0000
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
X-Inumbo-ID: 4395c34f-1406-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9ZaPLHvAJXdcTTarA3X7gAgxsYtsiqHq09XWfOj9P/xgDoudGh7R15by9vDbZrMEDQXq5txxA28erFGgQgH87lbETa5ATeUXfBqMYmOG7/1AUeMMc/96D4Qp1lDeMrEblLCjJve9uFyE2wvvNdGn8EPdTHwxs32i/MmIaKnUxcaZdx85PFqW8JxeJi4W5xTtH4F3kM5DclaipSroIKoUHyRksNveOxPLrTFMsBF4F9JKyIqk1LvQXcwSqk0APLJ2AG+9cLLP60KQHo1QxiYK3arQa7fQvtpbBphcI+tNu5oCRBCeXLvtdZVxqznzGg4H9cO+VmOsqb+N3qgt8Lygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gWzCdg5gadUerYjYxhYNLwRHOAFmjO1JP/VTpiILQg=;
 b=Gbz6r6sYZyAjbyLOUAuJll9jJwFOwbi9DREUqKYFNOW29Dlpie9Z2WAwIWgLZv9WqMjJGBYhOqu3Lu7zhUSj8lU9OrSTbTdVXcAsF0u1azHPfvvBY3qw2QK3q091Dp1ghl5S0DPli+Bh7SJuMJMFNw7jUCqeDV+3lq99nvLWdTgN8z7pUGMHCTYs6QM5RH+sHAx3rdIf0MldLjzFicFmZ1ijtd680NKUrPp57oLlK+BNT47ms985p0nKTXYqeoeBO6r8lJ4IaR9QycAo/E3aX3Vtb275ikOME5OXfaP2hSIuNLRirpScwW2o1i+KyBHO7ZUDCrpeM6+5qD9ATMfKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gWzCdg5gadUerYjYxhYNLwRHOAFmjO1JP/VTpiILQg=;
 b=ZWPJwZVUg4TbbtcWibjd4MrLDQE7JjPu4h3S7ov0prrwAUvU1gvMIQchxis15mwAtFkJZre3EFKV9240V7W1tqefPMtdju+Y0TarFJgsWMRNgIOKKCQLHQ3YcjjOhNsNFrfy1jNYrJcyh8r5gZ+FUGXDNfc/eqByQ0VTBOWF9Ck=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Denis Mukhin <dmukhin@ford.com>
Subject: Re: [PATCH 0/7] Factor out common build rules and helpers in
 tools/tests
Thread-Topic: [PATCH 0/7] Factor out common build rules and helpers in
 tools/tests
Thread-Index: AQHcpK0ssUh7hdj8f0mNZT6LyhFCMLWQGOWAgAbDtQA=
Date: Fri, 27 Feb 2026 18:00:49 +0000
Message-ID: <EFC38170-BA34-49E2-8628-219EF6EC3301@citrix.com>
References: <cover.1771840831.git.edwin.torok@citrix.com>
 <dba3fb3f-b5c9-460c-85fc-761f58e140fc@suse.com>
In-Reply-To: <dba3fb3f-b5c9-460c-85fc-761f58e140fc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|CH0PR03MB6177:EE_
x-ms-office365-filtering-correlation-id: 27c6d438-d8ff-4058-d8b9-08de762a2410
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 RUPPF419/0pFY8JUaUUyGrFqjABwpdh6NSdIh7/InwtYSFO0d5xa+uwSmUKoFLDwxyBcVDLLm0aOWksa/LKyfU4/gfu6xKs1fFJbt4jDDNyj/AcOWyh/uBmGiDnOBX9oeegBKpw7AzmCpYRroyzf29t+50YEkWIpLu7w5OWpNZ28/qqGVLnEGwUTNcJvc89rKrNwBjxP2S2oTL0xx+5qL103QtXluM1e7grFHpSyveshb7v4R7mH8UM1n8trY0gQQHIhihI3XSVviTxGf2mbyWXq1LAoyq/Ne3BtN89mcv2KStYy7DCxNW8/BXPR6c4+Hf9bbuBB3IIf7IWuy2yxzzg3ohrrQznHaaeWxQYmvHh6z1S42Ja3HJmXiiXl3yC8qYbCddwCOIRmup6U/AAs1y8YB7X8Ig4S0SL5rohc42SoIsKeIliCe0op72Tra5xQ/mJhxTXDmXCxw/s4dsRANoBmcz7KO5Jw3GECNWIFBJibrFaJK/NK8fS4dCsLhLWy/3gWnKixv9joG1Ikb1wBcIRaDTnhkWqdk+oLiNI7CsQRvvI90W2BAvVAzHpOmccIOjRTgZTxZzWlCspDYWCP8ooBgH/tJOdTWh85rImINE/SWhMZFUxfUckkQ0KYCxqXr4WwGczjhoDLEbSaYdhCnHDVknTG73sCA9Ym9KCIiePL+aLGupytRRlwBuPkSH7d4Iskbs3twLIQiwMmMiXf0BTJNP+iW1l0WqpW8SHVBXcw9ZLuf34VdSg6jI4cciES
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OUVhN21nOWdGbE1DNUc5Rmk5RDN2am9TNjlNcWdoKyszYVhEZWduVWh4RzFL?=
 =?utf-8?B?NjVmSEEvcFdqVTh5cjQwNTlYNWhMUkdPM20vbjhycEdUd3J6ZllrYy9mbEli?=
 =?utf-8?B?UFdjakJsUnEwcFBLbVcxa3k5L1l5dnZ6NUdYdkJBUWYrK1c2dVZUaCtXSmxz?=
 =?utf-8?B?VnpBcFZnVStJN3loZ0RaZVhxdFVYL2tjbUtLVG4xNzh1VUZmUmtLK0I3Wjl3?=
 =?utf-8?B?aHIzM3gxYWN3VFkwWlpOTkZXTFdaSVFQOElEMmpGaXkwU21DZFhrMXJmbWxW?=
 =?utf-8?B?TFNzRFhhYnBUSzA2aU5KVytveWtiQkRjMSt4Y09mOVlwWXJyRk9DSWxNSXNS?=
 =?utf-8?B?M2xsejRHTThwT1BjRXh5cWFld1dyZ0hnVmdGTHIvYks2SWNuNEp2YzA5RFVy?=
 =?utf-8?B?K2FrRG4vcWYreVVlc2h3bzJMaFlEQVBQdVNZbXUvakp0eWpRTnYxR3hBbGlW?=
 =?utf-8?B?WFVLR3NmbnNWSzNEa0ZkUHRmR0FuSEpMNHdDYSs1MzJqcGUxc25VUDJhWUcr?=
 =?utf-8?B?c0tWVU5zelZjSlIybHRqV004K0hROWJPSXRFY2ZxQmlUKzNzNFdoOWJhdkZO?=
 =?utf-8?B?akxuaG5vZm1PV1dsbkFrUnNyeWdvM1lGNFlUVnNKc1l2QzNmdWRVaUJZN3ll?=
 =?utf-8?B?eWJ2Ti9abW90TExJSkFtOVRuSnVxVW9sZERGVUo1c1NvN2JWT0RtTGF6Kzlr?=
 =?utf-8?B?YldJQVFzc0NTc1AyL1dpSElOS0hIVW4wTklEWnhwUVF5ZkFXWGZEVFVFNGk4?=
 =?utf-8?B?S2lVUkFQSW9ZSUpkYWExWGI1SnhCRWN1Y2phOFhlREtGS1Y2TG1HNXc5YnZp?=
 =?utf-8?B?aHV3TDBmOElsRFJjSGNocUFPNE44ZjBPOFF1cFNRdCtleDRYSUs5SlNiTVFF?=
 =?utf-8?B?WWtzV2t1NmhwUDY4QUJ3dmFLRURoeERJd0pOeU5xdGFvdDFBZnBwMjRJbE9p?=
 =?utf-8?B?NDRzd0tZOTBQK01MNUhRR3o2cDNFaWV6bUM0aGhOVlBzbk42d3k5eTFDYzZV?=
 =?utf-8?B?dlhHbXZBbFcwa2Y2RE0zVWdYanJSVGtYaFpvVzEydU5ydjRZU1czVDNsWkVy?=
 =?utf-8?B?MVkwT3VTWW41Y0ZDZUVuZ0xVY0hwdGFUcjVWVHRKT2E0clpuaW4wNzlYN1ky?=
 =?utf-8?B?cm56VlR2MGZwZjdRUlNCMnhmeThKRW1FTzdJSUxrd1hOVjlGNHFVSkhEK0s1?=
 =?utf-8?B?dDFmNU9wTEorZEhlWTMrcGZEdG1sbTBvdkkxek1HM1c5VXZ1WFMyWDhYYldT?=
 =?utf-8?B?akhKZFZha0Vrb3hqUW0yYWJ6YXZXYWxXbW9XTWoxU0JNazNRdWYvSWFvWXNW?=
 =?utf-8?B?ZS8wT0xjNWJFSitZRzNzRFRnRjRlZjBERGp0Q1dUR2Z1a1BuQ2QzSUNMcVhS?=
 =?utf-8?B?UUtaQzBOYTJXYnlBbFh1K3c4ZzhBcnlFOXptOWVTUWdEa0hTelJBcm85SWJW?=
 =?utf-8?B?S3RIMWI0UnhOdENldmt4TDNjZEdKWmhFam5Tc3NteStKQ2VYUHQ4WXZhRERF?=
 =?utf-8?B?a1RrSE1IdWI4dmVUM3F0a3VMMFlJcVp5OTZ1MVNudUp5bHFkeGwvcXJsZThV?=
 =?utf-8?B?NWxwVlBMMFEzd2p1RWdXN1JocmlVeU43ZVdUcFQvblFVQ0xIVkxHUUMwM1NL?=
 =?utf-8?B?VjMyQW0vM2ZkM01EcXRQYmtPb1lHdGVNRXpESmxqOHIwZVlxVWs1K1U2TElk?=
 =?utf-8?B?cjdVVTFKTVRLbTJiWFc3V2R3ZE1BWGZIZTN1TVBnYSt4M3JFMDUxK2NsWUlB?=
 =?utf-8?B?ME9Uby9VMFhTR2VYeEhDQU9GNlBjL0VxcS92bk0rWi9sTkc5eHdPdU1MMkhZ?=
 =?utf-8?B?TmdmMlcwank0cVFaTkxYTGVTUWlTK05wZUFlMU5RUzA1M3JKTVdtZDVzVHNn?=
 =?utf-8?B?cmp2L2d0UHo3SktvRDlsaHRFeFZuVWpITHVOcUpGaEpNbEk2c21aUTIrR01S?=
 =?utf-8?B?V1pjc1dTK1hHS2Z6dTd3MXV6TFdyQ3VkaXgrWWFSSUxOekpiNFBVa2RiZXpr?=
 =?utf-8?B?elI5WGtmbHBOUEdiUTM2cHVtbzAyNUw2Zk1sUjVSUENlemdnUWQ3dmtkbEp2?=
 =?utf-8?B?ZDEzZzV4eCtLVmw2WE85TGZwNWZDWWhsWEh6WkxrYXJyclZDenFjTUFDVW9L?=
 =?utf-8?B?TGowL2pjT2UyaUdWbWcvaGgzNEovZTNuTjNzVVhPRHRPb09XUGVJTDdKVGsr?=
 =?utf-8?B?elRLcExlcG9aVzBrWExVOHR3ZlVEeEFxdlhxMkVGdVEvb1cvOFFnOU9WZHNh?=
 =?utf-8?B?M3hEZGEwb3pVS3QzOEEyeHV2UDA1VXRmaXBXQnMvSnFxZGhYcE9odkVnQ3BJ?=
 =?utf-8?B?N1N1WGovYzVBaTZqR0ZyR3UyTXJpRm9TZGZVTjIwTVZIejRSRnl0a1JuY3NH?=
 =?utf-8?Q?VYg8S0yvLGv0lS78=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8498EDCC4FE29D46BF69E33090F81EDB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c6d438-d8ff-4058-d8b9-08de762a2410
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 18:00:49.8743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qhd2xh86j2Qi04jLVe1pDU4KlrDzrDkIJkTG2T6TIdsJ1TmZRpfCXIQi5yJHE8/0HdZWvXVOHlLW5LhcphEkBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6177
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,rules.mk:url];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EA7BC1BBBC9
X-Rspamd-Action: no action

DQo+IE9uIDIzIEZlYiAyMDI2LCBhdCAxMDo0MiwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToNCj4gDQo+IE9uIDIzLjAyLjIwMjYgMTE6MTQsIEVkd2luIFTDtnLDtmsgd3Jv
dGU6DQo+PiBUaGVyZSBhcmUgYSBsb3Qgb2YgZHVwbGljYXRlIHJ1bGVzIGFuZCBjb2RlIGluIHRv
b2xzL3Rlc3RzLg0KPj4gVG8gc2ltcGxpZnkgd3JpdGluZyBuZXcgdGVzdHMgbW92ZSBjb21tb24g
YnVpbGQgcnVsZXMgaW50byBhDQo+PiBgdG9vbHMvdGVzdHMvUnVsZXMubWtgLCBhbmQgaGVscGVy
IG1hY3Jvcy9mdW5jdGlvbnMgaW50byBgY29tbW9uL3t0ZXN0cyxndWVzdHN9LntjLGh9YC4NCj4+
IA0KPj4gVGhpcyBhbHNvIGVuc3VyZXMgdGhhdCBDRkxBR1MgYXJlIGFwcGxpZWQgY29uc2lzdGVu
dGx5IGFjcm9zcyBhbGwgdGVzdHMgKGUuZy4gb25lIHRlc3QgZmFpbGVkDQo+PiB0byBidWlsZCBu
b3cgZHVlIHRvIGFuIHVudXNlZCB2YXJpYWJsZSBlcnJvcikuDQo+PiANCj4+IEd1ZXN0IGNyZWF0
aW9uIGFsc28gbmVlZHMgdG8gdGVzdCBmb3IgdGhlIHByZXNlbmNlIG9mIFBWLCBIVk0gSEFQIG9y
IEhWTSBzaGFkb3cgc3VwcG9ydA0KPj4gaW4gWGVuIGFuZCBjcmVhdGUgYSBndWVzdCBhY2NvcmRp
bmdseS4gVGhpcyBjYW4gYmUgc2hhcmVkLg0KPj4gDQo+PiBBZnRlciB0aGVzZSBjaGFuZ2VzIHRo
ZSBwZXItdGVzdCBNYWtlZmlsZSBvbmx5IGNvbnRhaW5zIGVudHJpZXMgc3BlY2lmaWMNCj4+IHRv
IHRoZSB0ZXN0IChpdHMgbmFtZSwgZGVwZW5kZW5jaWVzLCBldGMuKSBhbmQgYXZvaWRzIGhhdmlu
ZyB0bw0KPj4gY29weSZwYXN0ZSBib2lsZXJwbGF0ZSBjb2RlLg0KPj4gDQo+PiBgdG9vbHMvdGVz
dHMveDg2X2VtdWxhdG9yYCByZW1haW5zIHVuY2hhbmdlZCwgYmVjYXVzZSB0aGUgTWFrZWZpbGUN
Cj4+IGNvbnRhaW5zIGEgbG90IG9mIGNvbmRpdGlvbmFsIGJ1aWxkIGxvZ2ljIHNwZWNpZmljIHRv
IHRoYXQgdGVzdC4NCj4+IA0KPj4gQW4gdXBjb21pbmcgcGF0Y2ggc2VyaWVzIHdpbGwgaW50cm9k
dWNlIG5ldyB0ZXN0cyB1c2luZyB0aGUgc2ltcGxpZmllZA0KPj4gTWFrZWZpbGUgYW5kIHNoYXJl
ZCBoZWxwZXJzLg0KPj4gDQo+PiBGb3IgY29udmVuaWVuY2UgdGhpcyBpcyBhbHNvIGF2YWlsYWJs
ZSBhdDoNCj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZWR3aW50b3Jv
ay94ZW4vLS9jb21wYXJlL3N0YWdpbmcuLi5wcml2YXRlJTJGZWR2aW50JTJGbWlncmF0aW9uLXRl
c3RzMj9mcm9tX3Byb2plY3RfaWQ9MjMzNjU3Mg0KPj4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1w
cm9qZWN0L3Blb3BsZS9lZHdpbnRvcm9rL3hlbi8tL3BpcGVsaW5lcy8yMzQyMzE4NzE2DQo+PiAN
Cj4+IEVkd2luIFTDtnLDtmsgKDcpOg0KPj4gIHRvb2xzL3Rlc3RzLyovTWFrZWZpbGU6IGZhY3Rv
ciBvdXQgY29tbW9uIFBIT05ZIHJ1bGVzIGludG8gUnVsZXMubWsNCj4+ICB0b29scy90ZXN0cy92
cGNpL21haW4uYzogZHJvcCB1bnVzZWQgdmFyaWFibGVzDQo+PiAgdG9vbHMvdGVzdHMvKi9NYWtl
ZmlsZTogZmFjdG9yIG91dCBidWlsZCBydWxlcw0KPj4gIHRvb2xzL3Rlc3RzOiBmYWN0b3Igb3V0
IGNvbW1vbiBoZWxwZXJzDQo+PiAgdG9vbHMvdGVzdHMvY29tbW9uOiBlbnN1cmUgZXJyb3IgbWVz
c2FnZXMgaGF2ZSBhIG5ld2xpbmUNCj4+ICB0b29scy90ZXN0cy90c3g6IG1vdmUgZ3Vlc3QgY3Jl
YXRpb24gdG8gY29tbW9uIGFyZWENCj4+ICB0b29scy90ZXN0czogcHJpbnQgbW9yZSBkZWJ1ZyBp
bmZvDQo+IA0KPiBKdXN0IGZ5aSB0aGF0IHRoZXJlIGlzIGFsc28NCj4gaHR0cHM6Ly9saXN0cy54
ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjYtMDIvbXNnMDA3NTEuaHRtbC4NCj4g
Q2FuIHRoZSB0d28gb2YgeW91IG1heWJlIHdvcmsgdG9nZXRoZXIgdG8gaGF2ZSBhIHNpbmdsZSBy
ZXN1bHRpbmcgYXBwcm9hY2g/DQo+IA0KPiBKYW4NCg0KVGhlcmUgaXMgZGVmaW5pdGVseSBhIGxv
dCBpbiBjb21tb24gYmV0d2VlbiB0aGUgdHdvIHNlcmllcywgYW5kIEnigJltIHRhbGtpbmcgd2l0
aCBEZW5pcy4NClRoZSBNYWtlZmlsZSBjbGVhbnVwcyB0aGF0IGJvdGggb2YgdXMgaGF2ZSBkb25l
IGNhbiBwcm9iYWJseSBnbyBpbiBmaXJzdCBhcyBwYXJ0IG9mIGEgc2hhcmVkIHNlcmllcywNCkni
gJlsbCB0cnkgdG8gc2V0dXAgYSBjb21iaW5lZCBicmFuY2ggdG8gc2VlIGhvdyB0aGF04oCZZCBs
b29rIGxpa2UuDQoNCkJlc3QgcmVnYXJkcywNCuKAlEVkd2lu

