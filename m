Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLxBBHgO+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:48:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914524D8E5F
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301479.1575771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYrl-0003yX-Un; Wed, 06 May 2026 09:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301479.1575771; Wed, 06 May 2026 09:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYrl-0003wO-RD; Wed, 06 May 2026 09:48:29 +0000
Received: by outflank-mailman (input) for mailman id 1301479;
 Wed, 06 May 2026 09:48:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wKYrk-0003vn-HG
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:48:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYrj-00CpWD-UD
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:48:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fb0e61-5cb7-0a2a0a5109dd-0a2a4506e25e-46
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:48:27 +0200
Received: from [52.101.62.56]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fb0e6a-7371-0a2a45060019-34653e38f65b-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:48:27 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6529.namprd03.prod.outlook.com (2603:10b6:806:1c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:48:23 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:48:23 +0000
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
 b=UlWK8oNns7H8H/7zHcZvCi5/t1QJsg/xqTkHDm4f/oqr0VPDsn9fKHcf74by8IBzsp9oHFtNtPla0xjZ4WKrXoaTSpu8LIdzKbULdGGVQZX1zSe2vQnmffB9RdkEQyN/Erk4oaM4vBXDOM5UvgK29xJ1nqFXD/go+f5MQhT/W4GsSepgf3noE4sqb7XiZFyf4zUHo2O2fTBPG0wGIkPumhEqTfGzV0soMGnLwcGUtH+JHeTiTioqj7KwZVOdOIfJtVmscLWIHE7aw9A1aNnzOvFdxNHBSl1FibaZI/E9ChH47I6rUFILXIiT34S2OB9B3Px1324oHAsX1/vi/RgFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baUsvVlfGmXYytLEvPEf9tKBeHiYRkM6cBKZhnbFxgo=;
 b=qHJmvn3xEy/TCxhUTVGYSferm65Vdam50ZtYgFJwd0yj01dRbman/mg/UyZvCme1SRktekEv+qwuJag00wn/lvEK2fWrtAg1+kw26pL1Ls4YkyLwFjhVfPO0hyNCj6O+e3WFdiDJP66CW7ORHwg9/vtkz5K+g+LYdahoRjT3HEzDNZWMTDaBgxy2Eraw91SdqG0BEXmdEyCm7fsqmxhnB6G4woeXEdDH2xE0rwbAnx/0TuDWSNnrzLrlOLc7IeVIxiBsI00mdetaPjF3EJWBmNx15EnwLnLQwWwumlIl35vuhCvKj9ukmcwl1/qx5Qo0HMK7hipzOEOiVNjVNRqRlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baUsvVlfGmXYytLEvPEf9tKBeHiYRkM6cBKZhnbFxgo=;
 b=Jw2nefne2h/n9aqtx2BHdeuFG1BM3sgNT3Z//e4E67JxIdX4mXnclgr1oeh+J+8PAtSVYBOqFMQkVQhtkgalh5Pkymn2i5Shk8oM7ZrrC2bJa0JL0IaCX6ck+Z+7355c/lGYoEjN/x2762eRCRjnVhB0+uC2Oc0Q8LuPUaIg/dQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bb0174df-6e69-4b7a-b0e1-496fb351dc75@citrix.com>
Date: Wed, 6 May 2026 10:48:20 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] x86/time: make do_settime() uses more accurate
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <99a4a514-3ed5-43f7-823c-54771f3bd03d@suse.com>
 <b47302bf-50a0-4535-b5b2-42d8de3f6dc6@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b47302bf-50a0-4535-b5b2-42d8de3f6dc6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0214.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 98277109-b445-4869-c0e3-08deab549d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	T25LQM7uCk6T/hzvwydZU7RddtW3yqsd6r1F0d9YyiA47DqiSFZ0vpjuUxi3C2x+J2I7xwsDO2A72F4G8mgy0DucfHpeRK0V0zKewj1g/8C2JAgAiAg7jqM8zXZZerPUT1Q8uoYe7HvOVlRxyg27yL/yTGwyDLEh2VuMUueIUZPU+B7eduqrwLFjxwEwPXMyGzJTSR7JmDHoClW7lM80a6QrAJpJdhkcO/J2MBTUL0SBZSwPY644piPluWRk3uBxwWRqZceKr74eMYeR4JEzzBHjvgJiiJSBv7KO7UGNv19Vf9kXkJwjwttvaGFl0RHKGdoLwdlmJogebxueQ9Rhv7Ccnvf0f9RnYkbeiJ6jUePPmnR5OrR3B97fUHKyVF4rSi1nI1lyCvJ88nDjVZsqS0O4jU03aHEdBkfrYd9fWf9CCOr7Wug2OeVQeLHq1RPViE75gUncAJsnxrXweMiKyzyvEQJ7upQ04jlHn2jtasmG2VSzXSNhyFUJSe5gd2PyCwPxqmh/UZIpANLUKU/g8UJOdCVeyqko1QUGy0ljGozlPkd1l8zAUxIIb7pR2tLkLt81A6q+XRPimHpScnRfDdEdC1okIS/FdvLzOGf2xmG8g3Oo6fewukg/obBfqGEprHnMEe17EhZklDIiH/xBpBBS44kgJij6tjZYW8+VI4wqHsH3oWAzPZo9U1ePfDyG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUVOZU11QllWV1JKMWNnS21OUnNwMG1WbmVTOWRSVzFJRk5nSm1yUmxDRGVh?=
 =?utf-8?B?cTkzUmlSRWVRVUh2djI0Y3YrQUdaakFCYTJYdG1GVTUwby95dlFVaG5pMVY4?=
 =?utf-8?B?NXRYTERVdTY2RkpXL1JJd2VDN1BCNGJpTk5adHA5TlkwMU5MOUphWmRUMEJ6?=
 =?utf-8?B?T3l6RFBxcUxzQTVIcENPTmRYZ1h0eUxMQXBGdjAxYVYzV21LczRJK1lheDZu?=
 =?utf-8?B?WFIzMEozNFVzNzVVQ1BUME9Ta0RmWlZYVzIveklid3I1TFZTYmRyZUVnQ3pL?=
 =?utf-8?B?eHNDTFExYWJQZjRWcVpad0N4RmcrT3R2SjJSS3drQnhXdTBPbytWMElMQUFC?=
 =?utf-8?B?SEJoVzZ1MkE4M2g1dWMrSnhrNnlVVDVkeDNGcWdDdDhsSXpZcmFLYUd0WStK?=
 =?utf-8?B?ZWlmMlpBVUxHQm5IUXZqUGV3NG9hYlVnaHpRV0pJc1VMeGI2VFBYRE5GQjZZ?=
 =?utf-8?B?eDJLVllhTVNzMTdJaEU4RmZuYlZDcDZpSUpZdFE4dmIvTzFGRUNJR2hWUDNz?=
 =?utf-8?B?THBHaVdVM1NESTlGTW1SeEc4Kzc2SGxoeVoxdWpYc3d6OWpSQWsyMHc2OGlx?=
 =?utf-8?B?Y25rZ3lvdU50NUFlVHJCc0YvRWYzbm9tYlUwZUNvMCtPZ2xoanBEQy9lb2I2?=
 =?utf-8?B?bWFDN01ESmc1dzU1TTZiSHVzYWNzMC8ybm1TMkoxR3djN050Zzd4T3JDL1p2?=
 =?utf-8?B?dXFhbTY2NVRhMzhwNUtsMkllUFYvWEZjVnY4MmxDdmNzK1Q4OTJhZDcyTDQ1?=
 =?utf-8?B?dlNpUGs3WVV6TkFNTDRRcFNIV1lHNEhkbXZuQXh0cGF3eTJoWEV0VGs1bGZF?=
 =?utf-8?B?U1FjUklkU1VtUk9DK2ZYcWJwZTlsOTNNQ3ZoRUVCTTlMVmZMaUJzQUd6UDJi?=
 =?utf-8?B?MGhNSVM4cHVkdHprWElEYUcxNlVVS0RYcUw2dDdsUUd3RlAxWWNNd1FmUnQ0?=
 =?utf-8?B?ZEJEdzBKRzJzUEtaMGcxKzh6TS8zSTM1RVZ0SmZDTGFpWGdoaDV2WmxuU3Fr?=
 =?utf-8?B?SGMydWFJOTFXdlJXanZ5UTQwQVBJbndqc2hpVWdTTW8xTjUwdVhGRWwxZWpG?=
 =?utf-8?B?TklLQ2Y0ZVIvWktBVDJTUFNMMzRGL05rczBoNTByY0ZqZGo0cmIyOG45dFNM?=
 =?utf-8?B?dmtJbFJZZGZQMjZ4SC8vc1RRdlNoUGVDT3RlS3NsZUVMOFZlQkxxcExnN1ZY?=
 =?utf-8?B?REpMeklQV1Z2ZHVpVGxBOTF2Y0xvdVg5eWt6RHZVUFJCdi9STnFJeGhueUxD?=
 =?utf-8?B?aXN2cldTd0tqMGdLUklHeXczUzJ6VnV6NkRGciswd2dSUzBlbTFnWjBWcyts?=
 =?utf-8?B?SHR2RmpoczZaNHk0Wk91THNWMzlwREdkOXUzaG9oVnlUTG9odDg5OGp2Qmwr?=
 =?utf-8?B?b2ZYNksyb1gwNXo4T1d4VVVoV0xUMWNMbUc4SG54aDJsTm1ZVGIzbVpwSVgw?=
 =?utf-8?B?cGc4MXNiM0xwU2hMSGo4YmcwNmtoTFkxMU9yTDQ0T0dtSGhoKzFLaElxdVY1?=
 =?utf-8?B?UHNwTWoyc3JwUWdsQUpmVVNJbDJwdFg5OGFkOW12aURiNTJwVXJENEtaN2NY?=
 =?utf-8?B?RlVOblBZVk94Z3pNcUNtdU94Um5pMjhxakJmenc4ODNtN1VVckttZzRVQ1Rl?=
 =?utf-8?B?QmJtUDJDWWFKYm9LNXF4UFBiMm82V29Ma2srR2crdXRrL0lNdHllSTBRZDd3?=
 =?utf-8?B?M0RQaXVxNmpLdEhSN2x5OFdRVVhieXpIS2dwZ2J1cmorMjJFS08zdXRad1RJ?=
 =?utf-8?B?b010UFFSSkwwT1pWZWpPNWM0OUN6NU5QLzJqVEZSQXAyMnFzdEpLQVlSSndp?=
 =?utf-8?B?aEhEOGdCVUNoNUJqM0xnQlE3SXBJVzU1VmVHKzB4OVRVTE5pb2dQQkJQUnFS?=
 =?utf-8?B?ckZuRE1VTGE1cllKYWpNNGpWWk41MVR1bXN3aUwzQVRpT0YxRG43QU9ZUkxK?=
 =?utf-8?B?NncraUprZXFBdWpvOSsxRmpPemV4ZCtCTFZERDFFRkIyQzF1dHlNM04rNFdu?=
 =?utf-8?B?S0FtYllkTWRyUHpMWGpNaWZGdmJIVFQ2bElpMnRpRnd1NHF4b1drc2FSeEw4?=
 =?utf-8?B?WmkxYjJHYktxOXdJOFhLbmRoSDloc20vZlB4ZkRnYmFodi96MXhNRmhEMHBa?=
 =?utf-8?B?ajdvcXVSOVBjS3VwRkdWVWQ1aTdHZmY0LzdzM1U4b3BhMUhUMUJOQVlDcW9p?=
 =?utf-8?B?YTZIMkJZbGlGUkhJNHp4WURSeWhCb3pJdXZEN3Q1S1pjWVR5Tm9NbEQzMWtZ?=
 =?utf-8?B?MExnS2tIUlhlOW5XQUVZa3dYbnJLRVdKRm5yNzdvd1BLN1JNbUlNaVVHc1c0?=
 =?utf-8?B?clhVcDAyWmVWNW4wQVllRThGUkU5U0dsdXpLKy9NeEZ3SzhXQ05UVDUvRitQ?=
 =?utf-8?Q?gqPaCyPqrOr0negM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98277109-b445-4869-c0e3-08deab549d2d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:48:23.6703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7h/aa9pCn+9sDP6PD56/n+ivApxiUSQWuUzif7VuBkCsNjULp+C/rMmc+eWh/p9meJeRd2sQiJKTvl25ChUXOcPXemwBz9FMnitaQZz1PY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6529
X-purgate-ID: tlsNG-16d1c6/1778060907-85361D75-44C8B56A/0/0
X-purgate-type: clean
X-purgate-size: 1853
X-Rspamd-Queue-Id: 914524D8E5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 06/05/2026 10:47 am, Andrew Cooper wrote:
> On 06/05/2026 10:35 am, Jan Beulich wrote:
>> As a comment next to one of the invocations states, get_wallclock_time()
>> can take over a second. The order of evaluation of function arguments is
>> in principle unspecified; in practice at least gcc looks to be evaluating
>> them from last to first. Hence with NOW() invoked first, the respective
>> value passed to do_settime() can be off by over a second (which is in
>> contrast to __get_cmos_time() attempting to get the time exactly after an
>> update, i.e. [pretty] precisely at a seconds boundary).
>>
>> This also addresses a Misra C:2012 rule 13.2 ("The value of an expression
>> and its persistent side-effects shall be the same under all permitted
>> evaluation orders") violation each.
>>
>> Fixes: f64134cdb81c ("x86: Fix time_resume() to notify all domains of wallclock change")
>> Fixes: 0bfcf984b727 ("x86: Reintroduce clocksource=tsc")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course the time it takes to do all the CMOS reads (or whichever else
>> wallclock time source is in use) also results in an inaccuracy. For
>> __get_cmos_time() this might be solvable by having it latch NOW() before
>> doing the 6 reads, but in particular for efi_get_time() there's hardly
>> anything we can do.
>>
>> As to Misra rule 13.2: tagging.ecl lists the rule as clean. I also can't
>> find any deviation for the two instances fixed here. What am I missing?
> From deviations.ecl:
>
> -doc_begin="The following file is imported from Linux: ignore for now."
> -file_tag+={adopted_time_r8_3,"^xen/arch/x86/time\\.c$"}
>
> I've said before and it bears repeating.  This claim is false and should
> never have been put in to start with, and time.c is not impacted file.

is not the only*

~Andrew

