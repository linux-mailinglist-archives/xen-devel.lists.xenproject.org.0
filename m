Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ESZC9s0EGqqUwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:50:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1935B277D
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316633.1586012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNRU-0002X8-UQ; Fri, 22 May 2026 10:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316633.1586012; Fri, 22 May 2026 10:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNRU-0002VP-Qn; Fri, 22 May 2026 10:49:24 +0000
Received: by outflank-mailman (input) for mailman id 1316633;
 Fri, 22 May 2026 10:49:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wQNRS-0002VI-Mi
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 10:49:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQNRR-0068Pk-Jz
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:49:21 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1034a1-2eae-0a2a0a5409dd-0a2a45019034-32
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:49:21 +0200
Received: from [40.93.196.28]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1034af-c1f2-0a2a45010019-285dc41c42a8-4
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:49:21 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA3PR03MB8381.namprd03.prod.outlook.com (2603:10b6:208:543::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 10:49:17 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 10:49:17 +0000
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
 b=SkNPAbbhwoes0fUn5f4BUk3GAKMU4sFaBM9M/lVy2o34bPwYEluWETaHUlMKVq5f2Abo1+IAI2zsBg1uPo8SkenNEc6vlcCczfucammXcbABSlJ4+HiJt+f3VDpWChq+1Q1Z0z4zkTqRpo4r1ANgL595mR1f5Crw9CiN4DVY3wnwLEwROGwnkP5HtGAf9FKMhMgJT70AUMA0yC7oy0PQn6jaPmUbqeXEM462wxiwj5MBFmKH/ex+iyY40XxQbLvHRY5aL5mTh4kbyJ6l6AC6iXe9joo0VgDxElNKcETMSYV9OsGq5SFoeofGb+Obv0nFK3ECP/E6BagX3bl1GfM+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TS9QdBnGXrR9AiAFyGjCmppIl+M0CN9c9ONzWjXg3Rs=;
 b=BA2mg67jQYqtVWGVUtCrAGdNJh+td0jWnT4rWUYloDb2wc9UFuROnAmJTl2rypWyIUxLhf2U3jQkwpAIGCqP3fYdXrGUYVPAwVIuUQJL7ry/ha5HCdyDPb2vjY3Z5jDOa2Tx6cK4oSatm8W19UVcciC3i2bCMNJe0lILVhrgNRqtgFySr2AmEjqgKzkVs4nfxVE1PhU2YFg32Y6jDkoPOjrAbdwx4OWM2FUKwxWJ2mHKjhy7rGDgv/aCh7NrY73TBS85fHKO3XOY5tuitH8HZv06t2+3kZ7vYxLRs+0KYGRWuP6cye1iEDXpBcQ18n8yeJnJKlsoo9QXT3cGQbPaNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TS9QdBnGXrR9AiAFyGjCmppIl+M0CN9c9ONzWjXg3Rs=;
 b=s+127/T58tn4ml5rjP7ViTG3Vrp1AQeum0MXN8Xo4oPndWv0QW9XXBiTPciFzoSKN6MON1/Y69pMJUYgzFgannI2ckSlQAHkr6YqEASjEArR8osM1NDNAtgABMSviQc8eCwu2JhsCnLZtxxY9GkPL5Xy1yQftk1mKU0KuFewgzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 22 May 2026 12:49:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/2] x86/PV: address Misra C:2012 rule 16.2
Message-ID: <ahA0qSC9w61Kx_4P@macbook.local>
References: <e3cdf68f-122a-4a41-a72c-8e6ed857b282@suse.com>
 <d04afa56-1197-4f5c-b158-b4b7eb7fc6b9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d04afa56-1197-4f5c-b158-b4b7eb7fc6b9@suse.com>
X-ClientProxiedBy: MR1P264CA0213.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA3PR03MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bef70d9-75ff-406f-18be-08deb7efc53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|5023799004|11063799006|4143699003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qNCEyPBwJ+rnUu4SMjd04rCxvL3W1ioojKGELW04Kk82kpqOKbmr2Q5iMAY8jNNNrylXTRrDViizyOCtALuhNhjXy7QbnxCMMHJiqHJhfsVxAKXLXrYuD+puYuqFeDTHIVumheLNj1O+GWgbH6OQT5cmKKRBRBH8Y9mH4uJ85FkAYuMTHk1rfve/O5jzqwlV8dqbXj8ODHe1wN4Wt05YUbckUtkPhDEOGwpy5Sg7B/VxOwjF0w55uIpyfJkDfO3P3+sZQCc3iUkXC1O8zJw0G0A3D3zifSP1WSG7rrXMldRWt4VL9FtGp3D0GiDOZvrgt7XKjSz9UQgeSWtKMhVKvQ1pBh14T4qOM/TX8iaFnTVmoSyyIOLNG4CJLJ9jMc2rfSaeGXB92PruIBHy4mE+3ejnHTJQMNkzM8/mPZw46k3+7QWjQhI9/+hjPTM9/b6qxAo95iWZbLQYPMgwPnh98eii09gRLO7ZRqWhG0JbhoVLUgVLfzX6qg7YIWjfKY5kCu3OBHv6YxFYo1X8tO1UxWnMPrbiWjP4WIEDsxFwJDM0GGAlehNsVPVxBIVrmZel/niLJwTnjlPcvm+ptgPHZIMDVa7C6xW6nE43ya0yhDq1La5UFtwICnRokZLCZ6JNkpQKB+9DFRUTiVV+/aKrjXXHXfabIa6uTA5RzCcj9tEdxrk44UdwCMR4TwTqnYiu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(5023799004)(11063799006)(4143699003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUdnZVMwbTRTUTl1SFhPcmc2dXlxTVp2a0FBcERMbERUSVlFekd2dlpoVXgz?=
 =?utf-8?B?azJsYTh6UEFGT0xLallmcU9qYktmWlhjM0FEd0wrcnY4R1FzVElSZys2QVln?=
 =?utf-8?B?VWxQcTRab1lSeXYzN2NVRWNEaDF3QmJBTkw1OXI0c25zMkwzNFdDU2d1cWQz?=
 =?utf-8?B?NzZJd1U4SE81ODhsQUFranQzYlRpS1dMUU1MbWVpa2pHSXlXUk9qZjQ0dVZy?=
 =?utf-8?B?ZVlTTkFSc1VjLzBRenh0NmgyNjN5K1pRREk4eUZYZVgvVnhRdTBjZ2NFRUVZ?=
 =?utf-8?B?Wk5QQWt1Q1VEc1RlUXhmUU5nSlhCTWRSckN3SEQzQ2ZhUWl5S2J1VDlRQVV1?=
 =?utf-8?B?c2tuRG54OTZ1SEhmd2Z5TmNhTVkzODRuWUc1cTJnYThIVno1NHNoMU03SDRa?=
 =?utf-8?B?M2ZOR0pGSDVYK3VaaWhXMVMxRk1YdXRZUDQ2K0tNUEpvbTB1Nm11KzU1b3Qy?=
 =?utf-8?B?Mm1YL3habVQvTlpTV3RoUnp0STFDejc5cTZTYm42OUUzZlYxbFFXeEtIb1Br?=
 =?utf-8?B?aUlwSm81bTJuNDdkODU2eUMvUHN0WlpnNEFzenZRem9DdTVKUS9QSVE1M3Jw?=
 =?utf-8?B?a3BpcGxuTkp5TWZXM09xVkJrQnliQ0dsZ3BEdVdScXpVRWI4aUpZemFRT2hW?=
 =?utf-8?B?WWxHb2plS1J4ajh1aEhnVmp4UmdRUHNqODRYRWFpUjhFVzh0alRQNkptUXhE?=
 =?utf-8?B?R3orZDY4ejJrQUdRQ2EvQ0lkZllyYzNObkQvN1ozdEJTTnUrSUwzTVd1OFBv?=
 =?utf-8?B?bnpnbEhlbjVLbEMxZWg0VW44bWFlMGdLQ1RCVWVmckg1NWFGT0prZ3NsaTh4?=
 =?utf-8?B?UmV2SmZGUGllUzVXRVNBK0ZIZndrUXRJa3RRNEJTeTBXNkNYMVI2NTE0ZUM1?=
 =?utf-8?B?VXFiVnBqb09Xb25TVVI5c1AxbHk5YTdzaEFjaVAzNlZIL3k5MWtzcThmZ3VC?=
 =?utf-8?B?bnlNUE13Yk1wSEY2SWhmMVBRaU9oT1ludmdWNytTNUwyd0Rndm91blZhVW9X?=
 =?utf-8?B?RWFEcWxVNmRUWHRQcllrV2U1R240dFZnSy9EU3YwV1JjRGYwSnpHOUlwU2g1?=
 =?utf-8?B?OHNUaWtQSjhuT2tWY3Qyd05sU2t5Z2tZWXYwVHBmY2Y0R0x0U2ovajBCNnVj?=
 =?utf-8?B?Yy8vS0RQc3haNGV3UjJwbStxM05QZzJCQW9FODF1akozNXI2eG5MbWlBMytE?=
 =?utf-8?B?OFlTdTlHT0JEdnJJa1QyMEdpUS9JNENmY0tJV0NrY1lNOStYTGltdk1Pb3FL?=
 =?utf-8?B?YzVtbW9vOEttZU1ER2JXNnFkempvUnI4eHRraTd6RkxGR3c0bC9RWmJSNGZC?=
 =?utf-8?B?VFF4aUw3SnkvbVRDQTJ1czlXNXo5ZVdKWWxTWU5vUmZjTGhndEZPNXYrU2NI?=
 =?utf-8?B?S0RQZ2VYQ1lVR1dVZE40bWZzbndsZ2c3UnEyMWlCSVA3WHVBYTlsSHVQQjhz?=
 =?utf-8?B?V1R3TzdPRS90OGhMUEgwK2QwRmd6ZE5lTDZ3OEltSjBqVXV2ejAxWEtoUGhW?=
 =?utf-8?B?ZUMrcEMxQmtRWDBvOWpTbVFkdjlOL1pXcHdmc3dNOVkxWnJnSE9tSTVJWE9z?=
 =?utf-8?B?djNtZVNnVDAyTEticHFaK3YrTldjcXNSSFJQNXhMSHh2eXZMNzl4NjVHb1V5?=
 =?utf-8?B?ZHpCU1V4bUZPaHV0QnBNdHRpY2dnVktQQ0lnYzFwV1E2TGpESFpxdmVmKyty?=
 =?utf-8?B?MklKSkFUR1hsYzE4SUZHRS9mN244S2tYMGtKdmpudm1EWVZYd0IzL2xkdWtR?=
 =?utf-8?B?UlFYZE5rNnh1QkpkRk9wTUxGMTRIdWdKZHV6UkpRelF6U0NOdWdhdXhKclhQ?=
 =?utf-8?B?djJXbFF6Rm5FU2lDaHVGZjc5K250SWYvbGVUa1R0RlhEQW5qbXFTUWd6Sndu?=
 =?utf-8?B?anFxWEMzV1V2eWZlajJtK0NybzIybkpOU1Nld3IvMlNvd3dHTGNIWVIwLzVt?=
 =?utf-8?B?U2RvMTY2SStPd0JWVVJiQU9JaHFWenpVcGFoNjBoS1VxV2wrYWgxL1kvbHpy?=
 =?utf-8?B?NUhJN3VUTmV1UDVva2dGQkFZWFJSS2J4L3BtcVc0OTVhdW1tQzRSQ0RsUFZn?=
 =?utf-8?B?SXl2Z0xkM2VGbnJnT1dWRGtGN0I2QytJVFBKV1RsS2sxM1VqSGpKSi9oOVJC?=
 =?utf-8?B?ZTR2MzJUeVZXc3hDOW9Nb2NkQzRMTk9rN3RVaTFyR01TTlBreGRIenpnejdZ?=
 =?utf-8?B?OE1VWHZwY00xOC91d21aQUprcTUwQVpRUHpUQkJSSDQxWVdYNnVpN2MvT245?=
 =?utf-8?B?UGozb20vZjJzOFpxLzgrcUNmUkliQWtTWTFRMmdRczkvUVVtSHJmLzNwS3Jw?=
 =?utf-8?B?NmNLTDlHalVtRjlqSy9CRWpGcjVFOVhRa1I5NFc0YW80QzdaVDI3Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bef70d9-75ff-406f-18be-08deb7efc53f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 10:49:16.9753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZrtMWkfUaiW39dVc3PH4W8Tc3Ywi9tEzf34W8sZkUkLrKry/t72gF33FcyPZNM2LbWZVJ1qAUeD6UHOPXv89Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8381
X-purgate-ID: tlsNG-d62444/1779446961-AEF58FF4-AC9442A3/0/0
X-purgate-type: clean
X-purgate-size: 2684
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8A1935B277D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 04:06:20PM +0200, Jan Beulich wrote:
> ... ("A switch label shall only be used when the most closely-enclosing
> compound statement is the body of a `switch' statement"). While I don't
> really like doing so, use a few "goto" instead. No change in generated
> code (somewhat to my surprise).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

With one alternative below if you would like to remove one of the
introduced labels.

> 
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -897,7 +897,7 @@ static int cf_check read_msr(
>      struct vcpu *curr = current;
>      const struct domain *currd = curr->domain;
>      const struct cpu_policy *cp = currd->arch.cpu_policy;
> -    bool vpmu_msr = false, warn = false;
> +    bool warn = false;
>      uint64_t tmp;
>      int ret;
>  
> @@ -996,21 +996,21 @@ static int cf_check read_msr(
>      case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
>      case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
>          if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
> -        {
> -            vpmu_msr = true;
> -            /* fall through */
> +            goto vpmu;
> +        goto check_relaxed;
> +
>      case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
>      case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
> -            if ( vpmu_msr || (boot_cpu_data.vendor &
> -                              (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> -            {
> -                if ( vpmu_do_rdmsr(reg, val) )
> -                    break;
> -                return X86EMUL_OKAY;
> -            }
> +        if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
> +        {
> +    vpmu:
> +            if ( vpmu_do_rdmsr(reg, val) )
> +                break;
> +            return X86EMUL_OKAY;
>          }
>          /* fall through */
>      default:
> +    check_relaxed:

Not sure it's much better, but I think you could avoid the vpmu label
at the cost of keeping the vpmu_msr local variable:

    case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
    case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
        if ( boot_cpu_data.vendor != X86_VENDOR_INTEL )
            goto check_relaxed;
        vpmu_msr = true;
        fallthrough;

    case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
    case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
       if ( vpmu_msr || (boot_cpu_data.vendor &
                         (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )

Thanks, Roger.

