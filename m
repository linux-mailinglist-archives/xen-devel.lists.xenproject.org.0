Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFC2LuSR1mmiGQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 19:35:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDE73BFA77
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 19:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276459.1561926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAWnq-0000IN-Pu; Wed, 08 Apr 2026 17:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276459.1561926; Wed, 08 Apr 2026 17:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAWnq-0000GR-N0; Wed, 08 Apr 2026 17:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1276459;
 Wed, 08 Apr 2026 17:34:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAWnp-0000GJ-QP
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 17:34:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAWnn-006Wgq-Kg
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 19:34:57 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d691a2-5cb7-0a2a0a5109dd-0a2a4507b0a6-32
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 19:34:57 +0200
Received: from [52.101.56.50]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d691bf-ba2d-0a2a45070019-34653832128f-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 19:34:56 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6567.namprd03.prod.outlook.com (2603:10b6:a03:388::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Wed, 8 Apr
 2026 17:34:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 17:34:52 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXuO7gq2ZiEUpwDOWe4P640XjCyuFNE07m+hX8sI8E/q7CXwzeAlPoAz3bJqosC2kVNQgC3bb5mXbYK+iF+W9Fw1kN4q9TNrwFAPYcKAbkepaC8VFhQJLS1uldZrrR6CrvLxNIoyxMC2Aw7Js28rPfKNOUUNxBwXJ+sTY58tAWo4WI1FQnBHhBH7kgdsKFWqGd0XD+ZuapI5Q6DKkNzxaSmGQHFq+A7uYw5ob23+6eC3TGErOenuD9SI4WCMz/fqB+CkFW3grOqxws+n/6gSAHM2SnA+d/7ue5BKnlzSdG8M59xrApSsQgqB5Eq9sEKI4uFZMqKttb4tXWkFi9YMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/5++fakmtAqPuvXEf/y5YLO0oNpqBA5ait8Co9rnzg=;
 b=FBAP7N3rZD81sIzQrRGUtP5ahFqJQM52cIqQUjCvFJHIas/bzBcsoTArH+fSMDM1zxQatpE5EWh0jFMaRtoK6iiDdoccsmT/f9o5Gnudq7/VotkszuDm7su8XH/toMgipUAzGEVWnxVXG+ebF9KVRJBWluKqfBblbL9tyoOuAYW2yci+r9qIBkVsaP5a7HkrTQJ61/9QKMqwT90DY7/dWnW/wjSB4623xyOcUWKxHzFteGP2nUTwiyj6omQ0vb6niN8XLsS943zava5JPUbmbufId8BlF63jXB7gcHFl6pmm8psnqWOyVleeIPGNpk+mrfg+slLsjGDpVNh/XU6Tiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/5++fakmtAqPuvXEf/y5YLO0oNpqBA5ait8Co9rnzg=;
 b=MIRD1BmMxyBJEI5O3MJgcJpLXIfpXoLncXa6W5h16IPSyAjF08IchLdJs9S/v8SpNHFuaXwxtj1AtzXy06DKlMhA3A9x9grK/XhaWSMrXFTySnlwKDw2A/vfeRz82CBsWD9pDJ4BkJzVw0NeGLtj5gEPH7l+HUg+JNpNTpzusVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9b9586d2-c18d-47b5-bce0-4c9a4570bcfd@citrix.com>
Date: Wed, 8 Apr 2026 18:34:48 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 2/3] x86/traps: use entry_ssp in
 fixup_exception_return()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
 <79c90706-0530-4b72-9b43-f003dfe87291@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <79c90706-0530-4b72-9b43-f003dfe87291@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: c16b5718-97e0-4725-3f52-08de95952462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NTZr4F6w2V/UIXEB7gtV6X2gs4aBX+AqHkD+YB4gHLn2xb5SwPexgcray1mMUXKXmxxw3fq8XhDM0BaQ2jmZipENiv8mH59GFMm9E014Wmq77UoCRwhXND1TqtKvYZoG4vc/OhHFKRnZ9AMOhPvPbPnZJq+cfY+mbFmiHwHh0XImZ/+VqVQ4Z2hBw73guH1o/HBdFqN8CE+SJxm8NcAC9VgOc3M+7moiuF/mKdiA71xH+dxZjP4/MQHzc5Wu7UkMkWuQzHPpRCl26qxFMXTYXkOoPxGeIwnMkh3iK0jvy/5wktQ4wACPag0GJIJR0JXqHtIcCRBk8Z4ACdafcj5KKZQv9msQuXTGXZWQ7jbtpAJUmdA8u5t8Vtcdt3YeEM5gXTeZZ8heOJse/Ncc7IBUcvhuET80mkQsWDijO05s30lSBupm++U9aqR1zPMNSGBpl4+l5fwfzNIwIa/E732aBi7x02PtR51m/Ms7VPOdqMTgNQ5U48SdywoW+/z5CDSWm709dASg7jarTCjXIcNMpiZmONuSli9Mzk4TXQ1BzNQTjLSZjfPYsWaMB4oR1ebuw6r0nspB7J5+EAOXTSTIKMhyM4uwjY46sVzrFrY4JhDNf6j60wdtqGwYe545SzsN5g6fjYIcWlWX4YI6Z2L4dTN0Rhjalv+KHr1zG3aCTgXdhNj1BEzmoH3Xc7Y0eugkoN9qbF4oyXEuwsKrEVNXOUjbGzdUivxRzaz1Zft1wJE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2ZvdlNCSWdHbUZrQ2dTWmZhMnZkcHdMajQwSFdheVNXZ3ZGajMyRjQwYUtR?=
 =?utf-8?B?MnJxRklBM21ncnRPVXVZV2R0UDdkSnBvREs4dXVVNllSOXFDaWJzWWNudFZY?=
 =?utf-8?B?L3cxS0s0UHRpVWJjT0NxaVkxYmdmVmVJUmducmFGRjJVbGlNaGlsbDBUYkNq?=
 =?utf-8?B?OTU5Y3pMam5YK0phUGdBM3ppSXZ3ZFBVNGhLK1VRRWdwVTFzT3NTWUl4Tyt4?=
 =?utf-8?B?dHZncEJSV21CQXlnTHFCNi9WU0dZd2dpcm9pU2Eyek41Vk1NVE1QR25BQnBS?=
 =?utf-8?B?aTdHaEFSYUUvcjg1YTRXT2xTM2lVaGdzVGJ1dmg5RGEvYncwZ0xNa2pVUzVK?=
 =?utf-8?B?THB5ZmNHZkwzRGtZTHdKbktmSkRMVzFPc1RscjhSNUQyZWpaYkVoTXIwTTVF?=
 =?utf-8?B?bXZ0TUhicmdFTnFUeUZHczJITVBuaVBEcUJYRkpISjAybFdhYjdCUmNvVzNV?=
 =?utf-8?B?ZkZkUFZmUmhaTnpBWkFIc3JLSFNsL080cnBCZ3NpNUZDK0h0d3k0M2V4c2NC?=
 =?utf-8?B?bHhJN0JQNHlzeHd6anlacEkzRjcvcHNZRG9CSkdWa3VSazdzZnNac2JHaWtU?=
 =?utf-8?B?THBJRzZxQ0RkWVVvUmpTMDdFUmlYUE1MWHg3SEc5MUVQZEdyc1hiWVA4RWY2?=
 =?utf-8?B?dERTSlAxUWRjeTdkYXRFUVNuemVkcjUxbldlUWQvbWZvL0t5a1ZMMkZQZWsy?=
 =?utf-8?B?cUZtWi9jQTVzYm5kL0ZXaGxUNjUxSFpiUVgwOWJna3U2VEJLRkZ1RVJNdU9t?=
 =?utf-8?B?RXZsa3ptTmgyVFhJeGtVcEVUaE41R21YL3lNTHNPQ2FNRlBHcHNyTWZLc1RP?=
 =?utf-8?B?VFB6aGNNYjQxeGlhNGNNVng1Tmh0OWRmYlU4b3RrUCtwMGR5SEpPVitFeENl?=
 =?utf-8?B?ZlBHVVg2dCtJSlhCUVo0Tk85MHBNWEw5K3hUeHdNT3F1U0RDRVM3Y0hBUmRD?=
 =?utf-8?B?ZTRuMXZkK1RKV2diZ1Z2UC8wM1A3amFwMVRkNXRNeHExWkNic1c2Kzg2Mm0v?=
 =?utf-8?B?Ymdpb2FXVHh2MHNicHdrSUR4cjBKM2d4VFYrczZyT2VBM3cxQkNtQXZWY0VG?=
 =?utf-8?B?S0hBb0xqMEFHWEQrb1lMZGFzQytlRm1sU1J1a3oxZU1iNlpwRUJGdUplL09E?=
 =?utf-8?B?ZmE1Z1VPRzhUUC9QYVRvdWxhZWxCWVNzeVhWT1Y2akI2VmZKaFR3bC9vT2JZ?=
 =?utf-8?B?V1IxRUtVRHVZL2FPTGNaM2pZbUJkYVJaR2xhcFlEYzRMNTFjUUt1OW1Wencw?=
 =?utf-8?B?RGs2WjIybDFBUFFNaENoc2owQTJNZkVkTG1aWXN5aFRFVWJ2ay9zZGZKN3N5?=
 =?utf-8?B?L2czMEdNcVpvZXd6MHV0MFgzdlJqQkFnT2xBZ3Z2dnBjdnhvdHVjS2g0aUx1?=
 =?utf-8?B?eGs0VktiZHRtWURKSUhkWkdzS3FSSEcxbGs1YWR3NFk5YXdhWkI0bzFOcDQ0?=
 =?utf-8?B?eE5yc0o0QmhJb3ZLbFU4a0k1S3RyUkNEUG5RN2h2M2FpcWRyWkU4aTRzYldY?=
 =?utf-8?B?eVl6RUtGTTZuK25SNXFSSHlhVDRsMjE1YkNEYlcwc3F5c21HbVZaa0RoRnhz?=
 =?utf-8?B?bXRScG5KRXFTcVhSOU9QWjNKalBGSGhzLzFlYTNIZUgzRTRMVksrWDRUNngw?=
 =?utf-8?B?YXRsZk1NWGVnUFJackhqNUp2aEsrckdyQzBpVXJuOW5UOWlDYmRVVmdlN3g4?=
 =?utf-8?B?UllDNS9JTmd5N2NNeE0vVFJocjJSbk1KMGpGeFdGMjhjcFBJclhwSWlZdnpx?=
 =?utf-8?B?dHB1d1BKakZHT20wcXUyMVJXTE5jN2ZaeFlOUG0ybm5CUVBhT0ROZEpJRGYz?=
 =?utf-8?B?NXZycElsUEtiZ3NLUmc5VzIyVU9sUlA0dzFpNGdlWkZ2WXRDdEJwY2FwWFdJ?=
 =?utf-8?B?MDZmMmo5NWpocXpmSDRTSGMwWVNVN1M5aXlIVG1MN2FDekJRaXMrNG1ybElZ?=
 =?utf-8?B?V3h5Mzg1c3c2ZnNpOXY4cTYwdzBzNWJRQkpjc3VEeG5zYzJtTkVEMU51LzZY?=
 =?utf-8?B?ajNpV2lJWlExckY2TE9pVlFodUdGRkNPaURmUlIwdTdXcTU0M3U5ZW9VMnBF?=
 =?utf-8?B?amErYWR5cmlaTmZIN2cwQTZkbFZkS1ZkWFNSUHBqSmZwK25CRHhnYXVReDNG?=
 =?utf-8?B?TkUzYzVXak41K01oSCs4SnRlSGlmZ0FRQXRLZTdoemZLU0YwZ1VlS05Qcy9r?=
 =?utf-8?B?KzEvSGI2R0UxenV6WGN1RURFdmxYQ0tVNXplWDU2L2NXZDBMU0UyRlhXTVdu?=
 =?utf-8?B?UXBZTE1ZUjk3QzRpR2o0QmpNK1lFREtHODk1K01rRTROV0lsOGVTM1NPb21U?=
 =?utf-8?B?QXJvMWF5RUs4eEloclVVa3Y4OFFBSUxZQmtvRXV4YTNBWnZ1cnBnUlhvYUFK?=
 =?utf-8?Q?5eRzvGaZAcaT6W2g=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16b5718-97e0-4725-3f52-08de95952462
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 17:34:52.7024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGtqp9OwirZhUczLuigAHEfl8InYOQtmkuAkUXvLWpmL6a6y3/h0nVANoWe/pj+5rWS0l044UwgtJD1FZbbbYHd7yzyhWSJs/LOGfqCgeCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6567
X-purgate-ID: tlsNG-ef75cf/1775669697-8AB4841E-8F97FA01/0/0
X-purgate-type: clean
X-purgate-size: 1721
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1FDE73BFA77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 1:23 pm, Jan Beulich wrote:
> With the value recorded on entry there's no need anymore to go hunt for
> the respective exception frame on the shadow stack. By deriving "ptr"
> from that field (without any offset), it then ends up pointin one slot

pointing

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1187,26 +1174,28 @@ void asmlinkage noreturn do_unhandled_tr
>  static void fixup_exception_return(struct cpu_user_regs *regs,
>                                     unsigned long fixup, unsigned long stub_ra)
>  {
> -    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
> +#ifdef CONFIG_XEN_SHSTK
>      {
> -        unsigned long ssp, *ptr, *base;
> +        unsigned long ssp = rdssp();
>  
> -        if ( (ssp = rdssp()) == SSP_NO_SHSTK )
> -            goto shstk_done;
> +        if ( ssp != SSP_NO_SHSTK )
> +        {
> +            unsigned long *ptr = _p(regs->entry_ssp);
> +            unsigned long primary_shstk =
> +                (ssp & ~(STACK_SIZE - 1)) +
> +                (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8;
>  
> -        ptr = _p(ssp);
> -        base = _p(get_shstk_bottom(ssp));
> +            BUG_ON((regs->entry_ssp ^ primary_shstk) >> PAGE_SHIFT);

This BUG() isn't correct.

We can be in a fixup while in an IST handler, at which point SSP does
not point to the primary shstk.  e.g. wrmsr_safe() in #MC.

If you're looking to at least roughly bound it, check that it's any
where in the stack range.  The WRSS below will #PF if SSP isn't
referring to a shadow stack.

Alternatively, add an is_shstk_page() predicate which checks for
get_stack_page() == 5,0 which are the two shstk frames in the block of 8.

~Andrew

