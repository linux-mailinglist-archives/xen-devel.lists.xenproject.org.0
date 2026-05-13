Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DfTGi6SBGoVLgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:01:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CC2535A33
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308182.1579723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNB4f-0006zi-82; Wed, 13 May 2026 15:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308182.1579723; Wed, 13 May 2026 15:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNB4f-0006yB-5D; Wed, 13 May 2026 15:00:37 +0000
Received: by outflank-mailman (input) for mailman id 1308182;
 Wed, 13 May 2026 15:00:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNB4e-0006y5-8t
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 15:00:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNB4c-00CTId-2Z
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 17:00:35 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a049207-e002-0a2a0a5209dd-0a2a4501a4ae-24
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:00:35 +0200
Received: from [40.93.196.64]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a049211-c1f2-0a2a45010019-285dc440853b-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:00:35 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH8PR03MB8273.namprd03.prod.outlook.com (2603:10b6:610:2bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 15:00:32 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 15:00:32 +0000
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
 b=jVF0ZQtvoBmz0NsVxO3zQFkPNG0Kj/Rvpkod74vVLNi/3uN1YJsR5ThoOfm8WNUxW4vtBLVqYnY9DKUp19f5hHZK78yKi/3Ib9P/HuwkicnIPA/ZKWZIQUANiDZXgXnoDqFJApGkvBl1oxbdnjCbgHLCHzFxgwwVafV0jXxc8hSMro2RJE3zkjazwfdM+VPdm0bUxsW/ZTYHpP2wDGkDBb12PmJral+mEul+aJeCoBbPfxiMMp+tCYNzPyM5hZyUWAqglwQP6m1+zDEIzRFhQMDKu572NNPJZkGmSmMOxEeP3i6r7UNu0t0v5o6EGbYhWYvaHR66HjBeBzrtR4ML+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTUTfeGhvKC0K/ETVm8Kl7FUPr4NaLkrH5PjpmIVvuc=;
 b=iAI715elqX0ErX0IsbX4C7nDP1QU1No3jbw1gR5bVPBHhY++Rx1Nh36BwUFQJX/yyynVuVDts/Iqp/PzSaR19bE7abYX6EXzVZIueB4PUpZOUyaG5TgMTvavM3O1izQB9o0UNm49+ZYM1Wm6S/0JlE0B2giLFggaz8wGkS5sryjQ8Q/eJfq14fCVjmgERmi/+FVhR3h3oB0ZPeCaXqmt/H+IgXzqWVkdgA+v+1vAfR6jENrNG0gLF0kN5Z7PDcgkFWy2tUDc7i0YLPF0JAOaDCj0fDaQAkQ6vlTxGCE+Vgs2c3MU4BUkpG2lnMviL7IMWrFFP4fz8og/RIwAHhvLPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTUTfeGhvKC0K/ETVm8Kl7FUPr4NaLkrH5PjpmIVvuc=;
 b=R7dqhXO5ZRGed0kueYD3L7GBY5d4SzW+do/PycZAd3lgFkDT6oUpwLfewYAQoCUikQeOZOgtwjxk2hUCgdBgIxYDTBTcNIUiB1vwtCKJv5Sd6YlAq1uQjbbv0zh8GE4ghMZ94Aqh8SOzn1YqXQJ9bmjv+/vB1xEvP4kIivOzqcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 May 2026 17:00:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 5/5] tools/xen-hvmctx: shorten various format strings a
 little
Message-ID: <agSSDIfIYIwylU2g@macbook.local>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <4bcd76e9-1bd5-4a2c-8d75-7d29b9dfa31f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bcd76e9-1bd5-4a2c-8d75-7d29b9dfa31f@suse.com>
X-ClientProxiedBy: MR1P264CA0123.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH8PR03MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: d35cd785-0e2f-4541-558f-08deb1006168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WSi1c4sKHO1AQM7vSgysa8mrbBfc81PlvFZx/416wAr/MJZkBnE3pEK4obLQQMgwinKsgRgpIjYGQ9/HntRq7lA/TuYBT0jNar9CPmMVP4QW0O4nlOH3Gs7Ihupb+ls6rHeLnBybWKhi9gw1526Z1B1AvG1O5kjb2tHtRkVRAbzt5i+a/2M9v8e1uXOHSSVZ9slTNlDqutAI1bkNrSuzyrIYY6UPHstFg8en/G9FcUul/9MJWD1z+OMARnqODC0F9Vo/VWMfSB8a+jnPh5i0jeQFw9CaLS/00hEwgz2XiHVFKr/tL2buv6qfZrWUgiEUhgk4xbCx087r3Ieiw/u9PA6hF8KFL8mUgc2KSod7WB+dIilxJwbzmhfOMwdok++sWxdzYU6oypfpCft4PhYr6Pkm4ITnJJDCetEuDolN8A3o8AGXWq72t5xdnSHVZ0ZcWHy5cUzmfPoTcakxsg/I8A9EYtO8txZTIZSwXw0tbm219KlMJ/e0IHPYR3hDXyIk8r2bcyrXalLZtNPzHB6foL3ZE0pBzdIy8ATwRliJdWJNN8fJLhE/un4TKP+QOvyyiFsk8zVjD8dxY0IvG9KNB3KWUX0Qn1vZMrFIRxlk7BO4ej4QevB6gjzo61ygiv5pexl7fIrnaT+dajzoKdMjFOLNJmE9XtkwLydtVxUYjnei7Y2bMYzncrbuIqfuG7sR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTVDMzRWOFB2Uzkwcko3MytqNEZCL3ViVXhtRzY0YnZESlYveU9KMkpGUCtE?=
 =?utf-8?B?T0VwTlllcVpZWmJGQkNTQ2lybStNNzVGc2l0OWtOSXlaU283N2xHbStGNjM2?=
 =?utf-8?B?VSt0Z0g5bHZzME9XTXMwY1QxQmhncUZhTnk5Y2NvTVpScVlhYUozVnVZTUJK?=
 =?utf-8?B?dHZWdFFIVCtiRzhydWpFL2s5U21QSkRLSlExMTJlUldnWDlOZXFnMTMwdzZU?=
 =?utf-8?B?eTRITHRTSjJDaURsaXVnZVphUkNIcEErVnBHdUNCbGtLRTl5a3M3NnFpRXI0?=
 =?utf-8?B?NUJjMzh2L1ZrTmV0MlZPWG5jY2x4RUpoVDVyaWM3c053TExkVXlobnA2K0lM?=
 =?utf-8?B?bUNxTnNtV0J6Zi9PK3R0bVQ1ejcxNkxQaCtqZDRSZVgzM0dTdUgvTzFHWmFZ?=
 =?utf-8?B?K1BDY2todmRpQW5KWEtGb3lQNFcwZkVOczJPNjA0QVBiWXlEUnFBWTRRN3pE?=
 =?utf-8?B?Y2orVGthRHRrc3FxcWRaM2RqRUU0R3MxcElGZzRnR0x0SGFLZ1JDVVRMcXZz?=
 =?utf-8?B?dGNyNUJxcHBxc3lZUW9PSTRRUGZTVEV3NWt0WStYOGdBRXZiZHZYd1FVSWNR?=
 =?utf-8?B?SWFxTkxPTkdQdzh0aEkxdFRZNVZta3F5QU5Iakc5ZlhVUFhsWWFoMDZEUTBE?=
 =?utf-8?B?UGJ4dmJSa2pob1dqdk03dHQyOUpNVFlWRS9DWFExYWR0UC92Y3ZmRy9GTHdC?=
 =?utf-8?B?TnNNd1hFQUIrb3JNTjNMRWtkZ1FSdVBSWkcwNEpMWklla2dCZWNPeWQyaGJj?=
 =?utf-8?B?cUdLTXJNbStmc1NFVlNXQnlhbTBLYjR5RmVKcm5WNEVscXlDUExoc0JFeUpH?=
 =?utf-8?B?Sjg3Nk5wY2FWWUM4MzR1NUduSVFXMXA3YWJMUTk4QmVYU05udmR0VnZSY0ox?=
 =?utf-8?B?ajQ0UDF6ZVlOMDZCT2JTL1BUTmxBekM5ZW1NSTEwMk0vc3ZMaThlTG5TTDRm?=
 =?utf-8?B?UmwzMHlwOWE1TUZlMS9maVlyaDl0TW5NOVFUOEN3ajJ6NFFWVHpSSUpERHVE?=
 =?utf-8?B?OXVMT1BNZ3VjR2JUSTU4WFE3M2lQQmI3U1hEd1ZpbmFjbVdoYkp5cE5IQU15?=
 =?utf-8?B?eEtrNDNjRnorMlRTVlE3cHAyc2lBVGxWNXRMY3lTdjBlK1VkeHlIeWRGZis2?=
 =?utf-8?B?NkcrYUF1SSsxZlFZSjVUeFdKQ1FOUm1LMXJVaVg0OFBScVR4ZlBTZGNqRVNr?=
 =?utf-8?B?RDBQVWJFSGRNZFZtWjZqSDJORXhUYldMUTlYbmtCeUtBTkVFZnpUNEgrd1o2?=
 =?utf-8?B?K3d0U3RJdExleS80amM3aG5LSVRST3hkN0ZSMzdRclVramZ5RkQ1VGNXVnVL?=
 =?utf-8?B?S2NzUWFkZVdUVSt0Qi9JRVBvMSt6bTRBUENJZldBOUVULzhDUkVQYkl3YXZp?=
 =?utf-8?B?cTdjWnRROG1WS2d6dE5TUnZkM0dsbkJPVnV5cHRzY09mTHJFZVp1V0c5SHhZ?=
 =?utf-8?B?Ui9yc21ISDYycG5qQlBzc2QwTTlQaHNHOTZLVXMvS1R3d0VndXJXWjRnTVpG?=
 =?utf-8?B?aG9idzBxS0tFUGRLcU9mc2hCZ3VOc0d1VndxVURTbUR6N1BkbVhkTjVTbmJ4?=
 =?utf-8?B?WkJVRGVtYUtCL0R6ZXlmSHIyRTd3Zjcyb1NCUThzY0NUREpqaUhjazFzN2s3?=
 =?utf-8?B?ZmJlVnNET0RCd3Z2ZHNLTFUvMDlsOWlzenBZU2twN3NRdkF6bzh3NlA1SzNn?=
 =?utf-8?B?ekR3TVgwOTlpZ2dLRHh2clQ3cmUvVll1akZvbnNJcGpWcEl2Ny9BdGFBQXVC?=
 =?utf-8?B?dDY4RlQzeHAzRHlDVFlrdllpZDlHTC9YS0k5YllzWnpBZVFaRFFPRlZyN1k5?=
 =?utf-8?B?eVZRVldoazFJOWt4YTlvcythQnYxLytuUGk3UHhOdjh2OGx3eUkxRFFFM0c2?=
 =?utf-8?B?c3JseVNNU0xGQ0t0NmpCZUVZUGFaNlhCWmJyWU1KVUcxUlRyU2NIcE04QU50?=
 =?utf-8?B?UUFhMUcwc3lEM2ZTcmV6YUtPM3JJeUh5akhuOU1ieThVcWdic3MrRzBxYzFi?=
 =?utf-8?B?UE9PNWFKbFpQOEJubVhDMEd5L3VLRGIvRkNEMmVuYVZWMEpRMVQyNlJvMkts?=
 =?utf-8?B?RmRkUVQ0WFExeWR0ZXQ1cU9vaFYvSHcvRk9SODF4VjNHT0dXUS8rOGxaN1lu?=
 =?utf-8?B?RzVmYjZoWXNxQi9odWxvTTJRckdCNmd0ZFlOVlY3MXFrN0JmaDkxZXNwQnJq?=
 =?utf-8?B?VllSNWlYUlplOUpZdFBMQS91QzhxcFZaY3MxRko1eHVhNGl0TWoyaG1JZXNG?=
 =?utf-8?B?ejVUNC9MRHZWU2UvWEpGemR6OS9LQlIwbE55YjdEZXVVb1h5ampudWhDZGhJ?=
 =?utf-8?B?WnlSMDg3MjdrUElRemhOelV5M1piN3UyZHY3V1M2Vi8vM1hvMVZyUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35cd785-0e2f-4541-558f-08deb1006168
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 15:00:32.6759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kitaWJV2DRUz37HtYAgvK8mO+P8VUkxIjBgJpvlY2ZqadA2bjCa2wx0q5RKGSSaazbE5Q2JZHgqX3PO/SwvwCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8273
X-purgate-ID: tlsNG-d62444/1778684435-AC656FF4-09E6E543/0/0
X-purgate-type: clean
X-purgate-size: 522
X-Rspamd-Queue-Id: F2CC2535A33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[10];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[jbeulich.suse.com:query timed out];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 05:00:43PM +0200, Jan Beulich wrote:
> %4.4x and alike format specifiers can be expressed shorter as %04x or, as
> e.g. dump_ioapic() has it, %.4x.
> 
> In dump_fpu()'s XMM register dumping, also move away from showing bogus
> xmm03 and alike. The proper register name is xmm3 for that particular
> example.
> 
> Also strip trailing whitespace from lines touched.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

