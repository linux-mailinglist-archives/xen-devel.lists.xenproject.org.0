Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m8yaKS6TIWrUJAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 17:01:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3316412D4
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 17:00:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=EseEUCzb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328009.1592672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9Yl-0003ZZ-Fi; Thu, 04 Jun 2026 15:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328009.1592672; Thu, 04 Jun 2026 15:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9Yl-0003Xl-Bl; Thu, 04 Jun 2026 15:00:39 +0000
Received: by outflank-mailman (input) for mailman id 1328009;
 Thu, 04 Jun 2026 15:00:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wV9Yj-0003Xf-6N
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:00:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9Yi-0021ed-BO
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:00:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a21930e-5cb7-0a2a0a5109dd-0a2a4502e954-22
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:00:36 +0200
Received: from [40.93.195.28]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a219312-af86-0a2a45020019-285dc31c5a8b-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:00:35 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB7584.namprd03.prod.outlook.com (2603:10b6:8:204::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 15:00:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 15:00:30 +0000
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
 b=ZHOdJSrAyyloto9JXNbgwIv8Y2XGCXbiNe8V1C1gRYbAEMqUTH5Bh1XTJFDxHjwTj4nWjzsNLyIm5ZD7fXiB0I3P5h1WVrF94B9wnnfpoKprm6xtpaRWbUbqEJ4uwEt8uJ9OsHyuLDNi1fCxHvhqJH2FpsFg+ps0suLkPFXilSqQ67u/zI1H8gRTXNFmnrK72mGmSm6ICmSvv7g2rhfPsPi9nWbL2bFaGG8bTBwvv+xYduDmbJppoZ0SWiMnpLKrVFYzge5wgM7Sxf2awi7Z3o59Ho24PimkAlFas426V7ewRUN808O+OaSfk3gZ9uG/qI8gzK1c7PplX6pLK3mq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXmpbheSmskeH9lGm817+N7HqFK3kltSc6OGz9297+U=;
 b=voxWlT3GW+qEVURIpY/OwhqWrUeRHS4Z9hRkxsL3L8HFehg5fGw9BOc6kFYeqY1XoczolXtYzmiBugETYkdz40qBPV0y5lp2rqgZWXsDhh+LzbNbtNEtv1BIHZyXPDEN/PIPNt8qhAz1VtyVzBnspHJC225V2cmp1282AUn627OiiSptUFvV2T0Tez9Bjhu9UfA3mg3lI47bnupVATGpveDQVD7djfH1ijCCNhHkIi0KKiAOl5qfBKj46/tQ2EC842V03Z6Wb65kOHEvP+yw89wT971QBOpYHUBciHBacZxt+5fWZp3uzaqT92+IPzu/J0Tck4bqdq+8Z+hmUvppTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXmpbheSmskeH9lGm817+N7HqFK3kltSc6OGz9297+U=;
 b=EseEUCzbrDgtzys8nuX6mUZTxCq+A5VvHIhFkgh3yY2VBaT8B7JRnLFgUd7tvfI7v5oFQ/a2lenJrNjho8v+t6lEqeJrglEyOR+5SKYsqwOGtGWfWcAO80g1vSIgULa6TT7dRLWxOZda8lPeSWPYQJA6R04aon5js+F7Xy0RTgE=
Message-ID: <474b6698-e620-4785-b3e6-698059748d89@citrix.com>
Date: Thu, 4 Jun 2026 16:00:26 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH for-4.22 v2 2/2] x86/mcfg: relax memory map checks on
 newer firmware
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260604132523.95125-1-roger.pau@citrix.com>
 <20260604132523.95125-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260604132523.95125-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7f920e-3463-49e3-5675-08dec24a0510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|4143699003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9WNwMGuNKD9xdyheLnARFIWInYGC2w7sEN3R296SaCq+hTu4BWDyZceQwWixK3n7kKOaF7DYGcMHgGEXK7PonYBXqt7WS7Xefpz6rcjcjvojnUYDGMdfghP05arrTrZJmJ3JPLJ/P96B1Mfy40rDmZxBfy+t0+wIoQjV+TcXDnWNY8yeU3x0Gw/laF4iMpu/a72qabLjKXWM9TAyWx+8ho1tz/WJdgEAklOV2F9AZzMzvjnvcBMLGRwBlDfuAJ/xtEOKbmRmXshx07PsNsGw2W+Ye9ayUaoKJdm5OC/PORgL5M1SqRiH7CyeHfmLCEOsiOOlm0YHfBI7fbzPXXAF/969+TPUF1Oaio3+JA5FpCj5ZhNKC8+tFxN3wMNo4EfHedA55AorqpMMJWHFRvNrLS0DBRp5iDA0RoRhMqVMlRoCsrAQ0q3euunVQeMVGvgU2TGkuNZZpMIDs+L/cnINzfa31eWxIOZDWJ8JKWDe/Kra3SAqxVH4lvI5LbKHbKuBOvlATanFobIKmP17AGUuQGWL48j2+IxI22MO65kzn7mKWJDNkJvid9LoHl4qMpHB4xOayS08HqSiGs06jiKnBjFymPxCUw80S1JeT81xkOSBUd4nkS6W2zQ+rlojhUwQYPgurn+cTCFFHTYyoC6QdGtJ3bWtCanYxb9ZAY4tT/Hbdg28j6gqxgRA4vW4hQKd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmQ2QmdzaDllU0QwcFljbFRnS1VLMWJvT0JWZlhrdFRJZUQxMWl0V3pDMFZ2?=
 =?utf-8?B?dmp5SFhYdGM1bk1GUnY1aWd6clI3TFJGWktMa1NxeTVDeWRzeThyUHNJVERM?=
 =?utf-8?B?V1dXSVJXeUppU3psS1NOZTZWT3l2d0djY254WXptd0Erai91eFBQcFhiVWdq?=
 =?utf-8?B?UTNsSFRKZnEzUkNmV0tuOXUybkl4a1VrVWF6QS9tQ2lFV1VzaWRrbWpFaVRr?=
 =?utf-8?B?aDZtWXIvck5ONkk4b1k1Y0thdU5JanMxb1BQWGI4SmlxR0N4enBPZm9VRmsv?=
 =?utf-8?B?ZUV0T0dpWGp1NUFuMkZ6U3lMVE1Ib1lHbTY2MURuNitKQ0IvMDZza24yVmF0?=
 =?utf-8?B?bWtGYlI4WGhrK1hYRTVneFYycDJRRW5samxOUjlseWVCamRSU3R4ZEVJRGRZ?=
 =?utf-8?B?S2FoYVdsYXZxWU84bnFXMzVhMVlBUVJQaEtKZUJhYmhNa0hjVlRIUmtvUzRB?=
 =?utf-8?B?dUd3dUZxS3VrLzd4QnZSN05MQnI0dnZnbnQvb29Xb0Y5RE81cDlEVW94eTFQ?=
 =?utf-8?B?eFhRbVlMYk9oWDdVZnVKb1c4cThKSzBFbXJYT3NqeEFnb2h6d1B6SFpqU1FW?=
 =?utf-8?B?UXQ0djBLTlA2akoxNTVhek1qNjNiWVJZZi9wakEyVm9paWl0UlhqYy9wM3FS?=
 =?utf-8?B?R2NaMkttM3Q1VFppd1JERDEyN0RxNXI4cGpiQ2Fuc0RkZk9kbXdBeTBKUDNh?=
 =?utf-8?B?MHdKbndYRXM3Um1Jb2VRbFN3clpBc0s0bTJ1QUdqR0h1TEV6Y2RQMUdZalhq?=
 =?utf-8?B?YjhrTkpLa3RuU3Q0bGtheitZREdPOHhZOFNiMjNlOFlJbXgydTNBV1NZQnhy?=
 =?utf-8?B?clgxY3ZuTnRhd1F4Sk5lb3kxRzAyQWdOYTdrbUQxVE05UFkrelJjSTc4U01O?=
 =?utf-8?B?VFZSVmI4NjhFYVNRbXhYR1MxZnJET250ZDZvZG1uYy83bnhYdUZLZllDUlNr?=
 =?utf-8?B?aUF5SXpYYjJzd0RPSzNncnFUOE9VS01YZDg3ZDVXMXRPV0NySnBzNURkeS9j?=
 =?utf-8?B?NzZ6MXdQblExQ3VlMUU1NHdQa25paWp3SEdDMDUyRlVrdXI4aU1DM2lNRmRE?=
 =?utf-8?B?eStDNG85QlBSaDFiaVBFai9EeG03dFVEK05Ka1hZVjltUUdLNW5uQVN5Nndw?=
 =?utf-8?B?akkxL1RGN0N0Nms0d1l4Y2RXS1E2Zjd6eDEzdFRVNUdRbVVGNjJFazlrbFkx?=
 =?utf-8?B?a1Zxby9wQ1RSbVFSc0NBUkJSdndGOFZmS3hiTmxRb3VUU3ArdFFyM3luV2pJ?=
 =?utf-8?B?c2FwYTBYSFRLQTFDZDZVdXpLTEdCRFQwcG44eTJFZjF0OGtTUHNUUU1pZnkz?=
 =?utf-8?B?Q1JVNTI5cHJDTXg0MitQUjVUMHhSNUNsdnk3S0FZU3FoVVNnMWhVbGI0NFdn?=
 =?utf-8?B?QkFwenF0ckh4K0dDQ0xzZnZETDR5NFdDUG9KdFI4M1BGR2g3RHlWZlpQUG1y?=
 =?utf-8?B?dkc1bi9jbnNQZWNXa0tpWVFZbE1nZkhlMm4xZmtaSmlhTW4wVzFIQXd1SHVN?=
 =?utf-8?B?QUV2NlYzZjhDY0RZd0VIZkZ0T2szM0JObjAzWkMzYTY2MnlGYmhhL3MzRmV1?=
 =?utf-8?B?RmUxck1lWUNjV01DL2lYb3RoR0pNaWRWYVIrbXJBbmFPL0RuYWZSWk41ZEl2?=
 =?utf-8?B?ODFPOXdVeUNJNThPUFBwa3EzSGVoWE9DSCs4NkhXMVUvR05pajhzdjVUSXdS?=
 =?utf-8?B?MlVld0wzcWRUZUNmSVBVRnF4NG1NeTVWd05LcU8yQ2xXdUtSZFRmVzgzRlJU?=
 =?utf-8?B?VzhmRm90RUxJaktKUitvWVN0UG1ha3pwRHZ0ekxiMXFJcXhUZUdlLzhNbUZn?=
 =?utf-8?B?a2l1UFJRdE5Kc3NVUmh2M3NhNG9DSzEvUXl6RzFZeFRsWTVqQ1U4a2RNMENN?=
 =?utf-8?B?NGVMOWZMVjh2dVZkalhrMGNuYk9LT2N6VDZQQjAreDhsRHBXKzRjaGx1Zmxk?=
 =?utf-8?B?aEFSdXZYZ0ZuWVNQWXNNa2MvN204bWo3OHpGaE1RUWxTZUZkZGtBZVBFNC9L?=
 =?utf-8?B?eVFlWDBKa0ppQmsvMi9XSDhMNDZXOGdDZzN6TUhvUTFaRDRIWlBOS0xOZW5v?=
 =?utf-8?B?TVFJRjIzckhlL2l6OWRSVTBLNVFqQTdSb2FsdTJSVnBlR01lS3dVbnd4N3Fm?=
 =?utf-8?B?NDU2Q1dBRWlGRURnK3k3MEtOWDJVOTVnQzR4amtPdmFPUXV4NlIrMWV0UVZs?=
 =?utf-8?B?NHI2YWZpQ29jTlB1bUVnSnlpN3NqMWJuYkFtMEtIMEJtaUNveEJWRWt1OWlo?=
 =?utf-8?B?all2S2RSOW1ZcFYyT1Zpb0JMK25rdHBvMkZZdkg5YkpvcFRoSmlQNjVPU0s5?=
 =?utf-8?B?ZmJxRzRkU2ZlR0dZQXZXamlIK2pIbllDbFZ2U1FUZHpXaFFJYmFaeGRFNFV1?=
 =?utf-8?Q?9BjIi7miLV9RLKqA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7f920e-3463-49e3-5675-08dec24a0510
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 15:00:30.2396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6oi0r4i9SmVqgM1wQ48I9V49idQODIcoUEM0nvWwLK/F6+rn/aZDey/6nOmFaDXhvbCGMUpG2DIjXWR3Dsnh2GCxwWNr5RhyTPAFoIzD04U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7584
X-purgate-ID: tlsNG-720697/1780585236-8316D161-DF6818D2/0/0
X-purgate-type: clean
X-purgate-size: 2001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.68 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,suse.com,vates.tech];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E3316412D4

On 04/06/2026 2:25 pm, Roger Pau Monne wrote:
> Per PCI Firmware 3.3 specification, section 4.1.2, ECAM space must be
> reserved by declaring a motherboard resource, but there's no requirement to
> mention it in E820.  The specification additionally states that: the
> resources can optionally be returned in Int15 E820h or EFIGetMemoryMap as
> reserved memory.
>
> This fixes an issue with detection of extended capabilities when running
> Xen on a Lenovo system that doesn't list the MCFG area as an
> EfiMemoryMappedIO region (or as any other type) in the EFI memory map.

This still doesn't quite track properly.

"Recent Lenovo systems have been found to have the MMCFG region in an
E820 hole, which looks to be technically spec compliant, but is rejected
by Xen."

That then bridges nicely into the subsequent paragraph, perhaps dropping
"more strict" too.

> The more strict logic was introduced in Linux in 2006 as 946f2ee5c731
> ("[PATCH] i386/x86-64: Check that MCFG points to an e820 reserved area").
> This was picked up by Xen when MCFG support was added in 3b35911d709e
> ("Enable pci mmcfg and ATS for x86_64").  Apply an approach similar to
> what Linux has done in 199f968f1484 ("x86/pci: Skip early E820 check for
> ECAM region") and relax the strict reserved region checking so it's only
> done for firmware manufactured prior to 2016.  For firmware from 2016 and
> newer allow MCFG region to reside in holes on the memory map.  Note Xen is
> still more strict than Linux however, as it will refuse to use MCFG regions
> that overlap with memory map regions different than reserved.
>
> When dom0 boots it can prevent access to misconfigured MCFG regions by
> using the PHYSDEVOP_pci_mmcfg_reserved hypercall.  This brings Xen's early
> usage of MCFG (prior to ACPI AML parsing) more in line with the
> implementation in Linux.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

