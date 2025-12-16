Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE51ACC5846
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 00:50:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188471.1509631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVeo0-0007nq-Sl; Tue, 16 Dec 2025 23:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188471.1509631; Tue, 16 Dec 2025 23:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVeo0-0007lG-Pu; Tue, 16 Dec 2025 23:50:12 +0000
Received: by outflank-mailman (input) for mailman id 1188471;
 Tue, 16 Dec 2025 23:50:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKfF=6W=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vVenz-0007lA-Tm
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 23:50:11 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f45dc7fc-dad9-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 00:50:10 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6462.namprd03.prod.outlook.com (2603:10b6:510:a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 23:50:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 23:50:05 +0000
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
X-Inumbo-ID: f45dc7fc-dad9-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4VTMcNpOblkKUTKNyRqpnkdZWSdK/eKHamndOx36ZdVTVt74mjkdd/CB5qw7yTpiTkX/ACvahbLu4isztap03YTj9Bet2Lpn/HhDK3gKQT9uPOOg4kfVr8A8HUrfNYbp1gtMBGBkRzfQxfElMoaTjoLnq3nAV0xEWQhY51axXvJEDYBDKTeG6W+IaG3pI+DPLmaH1MR8APrMLuNhNXQKLO1ExrlhNlbUyrk5w9W73SE687kr0B+jRVx+SbI4w/4YTvSDfpyNIH7tznBkMg/N6ENsssWliqlppSm3hM0du4ayA9fLgO3Sdp6BVEgXHHUrIaEPhBhG4V8b0r1Ugh53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Evzmw0Kbb1086SNAFwP84OfWZk7Qtqa9y+NiCRowB/s=;
 b=W3sDss/Tpbp4p1XIWqhVwGuxZIRTPFSSIpSs8yRqXh69+sZwwMX2noaJcJWb/+b2wnuUaGkfp+Bfbjw7t3BxCjA5If3PDuucd77v37zpwUBuEBXOC6/rwqAbVcTDLoDSAwIhKDdQEkeza0NrOsuzBnXDnRaC1WjjeE1lPfN2SpXUCOuxCm3l2KcjlqpLcgVIfPSpLixho8Bf+QkZsb8yeH4eH9mYklhG0INP722umiyjPJc2FUrnPI3pee9f/XwfR7FKmqVVg2rI/u4ZF7B+VU7bGheaz6yijOuZlCtO2yFzg1k25NeussruX66XTqA8Bmd2JUVf1jWnetX6OhU0kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Evzmw0Kbb1086SNAFwP84OfWZk7Qtqa9y+NiCRowB/s=;
 b=O0ZGwnCJ6mN1B2OLYxNbZdWzcsjf7OIT2kWmnWpgs8FuXSVzIMnAf4ppxE1s0SgP0LPszpUxHNq6/LKahXrBMAC6cH1FGHr2M9S2SrmGFbcrEQEzublqiq440UxYbm2mQDSnbSH6y3tpSgSnVN1EecBrczCd+MKIE4Ntdpr7N8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <939d27c8-0cf4-40b3-b5b9-c39c47c57541@citrix.com>
Date: Tue, 16 Dec 2025 23:50:02 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 2/2] xen/x86: move d->arch.physaddr_bitsize field
 handling into pv32
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251216231348.3897820-1-grygorii_strashko@epam.com>
 <20251216231348.3897820-3-grygorii_strashko@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251216231348.3897820-3-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0611.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fc9278c-efa5-4e13-dc40-08de3cfdd671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVFBR29jS3k4dldzQjN0ZFNRK0grN2VGMzBZZ0lJTnhzTmFrbWdkc2JYVlYy?=
 =?utf-8?B?TVVWZkl6QlNOMWNuZHV5ZHVRZlM0SWFPS1ZWV2dVZ1d0RDU4NnVjNlBsOWlL?=
 =?utf-8?B?NTZFbmMyU3JLajZnQ25pM0JCMkdLSmdwM0g1S3BqcnFBT2h4QXA5ZjhmaE5X?=
 =?utf-8?B?cW5sSGZ3anJxcUZmUEl6NThLVHZ0TWJhS3B3ZGU2YktON1RuQk9sVTlpcTRw?=
 =?utf-8?B?amNBQ3FIN3FqeWtJaTlhNDV0Tkh3SGc2S0ZETDFuQW5CKzJlaHBTQ2x3Z1Vx?=
 =?utf-8?B?WmFQNGVremsyTklVNHliYXkrZEVQVmJ6WUtpVHhmLzBnTVpJUHdWWXoyWXRC?=
 =?utf-8?B?SEVrMktmSWV1T1ZJaE5WVFd1TWFNSW9nOWR5ZEJVTUtHUVNuVUE5ck9PRHk5?=
 =?utf-8?B?Z3MvZEQzMnBEVzE3WkUzNkJFSWcwWTR6UnZCZlVSamdjUkQ5eUxoUUF5NEtT?=
 =?utf-8?B?T0dHazRsMFdpOU9obUZUS1h3amgzb2U3KzlJdUs3VUpXVFJhNkhhL0lWQ3Ar?=
 =?utf-8?B?QmZaa2ppSEFsbmlvTktWclVjZ1ZRN3RBeHg1V3YxRGk0aG5kMjVjbWJuRDk1?=
 =?utf-8?B?NjNSRlk2QlFUZUc2eUpVcjczNmd1Q0RqMnQ2aktRV3NFMUUwY3pVb0FmRVBU?=
 =?utf-8?B?UzE1LytnQ1JLT3JOYVhxVnFWa1dWSzllVmczOGVTTVdrWThpREhPQUpxU0NK?=
 =?utf-8?B?WTNTaE1XcGRCeTRxbWR4ZGtJbDl5WkdsdnlwMEpia1NtZ3V6aGphTks1MUNX?=
 =?utf-8?B?TkFhMzJJZ3BMY29adFVqVkU3MjBBN25NMDJDWURmTzRZMTdCTTBpTDAvamhV?=
 =?utf-8?B?dERrc2YvNXVhbXRuL2Jzams2bmFpbjQ2d002WFBLQXpTeUJ1a1RwRWxmbWw0?=
 =?utf-8?B?UTAraXNiOVF6a2Y2bWhWbEluTzJRcXNRZjF1bktmVlR1RU92WWUxQVZhVGpG?=
 =?utf-8?B?M2xiM2VTU3FDbFVHdjc5V3pNTE5QRGlkK1hXSW9VR3MzZkwyczhtOGgwM0hV?=
 =?utf-8?B?RVoxUTV1MHhPOHREaTdhRFpOWlRMb0VONDMxNFZmbnVEZWdqd2FrY2JnSDJl?=
 =?utf-8?B?TldLR2w2clhGbGV1YTJpRTBvLzNpbjdEeUYzRFRKTWdLTGI5WmhWQ3hzNFRT?=
 =?utf-8?B?WXp2Y2tsRDY0RTdtRjRBaTQ3SnNuUXFDeUVVYlB1RnhyODArSUV5UFM1c2dt?=
 =?utf-8?B?dHdYM0RQL1IzQXE2bjRzRXZZTUgrVmw5b0RjRUhXOWJQaENXM2FWOFRDUkVK?=
 =?utf-8?B?MVJhejdJK1NzQkpUMDY4OXkvUTdWMklBNndYM3JsSEJOejd5RGw4YlJVYmtC?=
 =?utf-8?B?YUFyQmMvZmtSS3U2eUdRbEsxMVhMdnZTWG40NHFaRzhFU1ZpTmhoaGFKRC9r?=
 =?utf-8?B?UjBhd3dBYVc0MXdwTTA4Y0lhRnNGd0sxSjVzMXk2TWRxdnI5cUlHTWJaaXZW?=
 =?utf-8?B?cmZGajUyVEZmMnhOeEk0TFM3NFc4SlBsd1NJMWhBbjRHU053MktIbkNKeVZU?=
 =?utf-8?B?d0FuVFNvM0Z3ZzFWU0ZsWXpPcFRZZGJPNEVRTXVaQlovaCtuSGQwRC9jM09U?=
 =?utf-8?B?d09ET1ZtdFg1a1pYcHBxTmhXbEZlN01tb1pjNXZ3TVcrdCtBMVYxR3hpZXNl?=
 =?utf-8?B?Vk1yZjAydmpNOU9YQ1AxNE1ramFLRHlaNTF1UDZNZGh5ZWdUdEV4UlBkWGlW?=
 =?utf-8?B?WEVHaE5DakdKQXRwSjhQTnVtUVgycUxIYVFpS1dKR2NLT0R4VkRZcWpOQ0Jv?=
 =?utf-8?B?emZHeWttcjNuZ0xzM0tLU3czOFp3aVJGOXV4MzY2OVRWcS9aRnJuY1ZScTVK?=
 =?utf-8?B?Q29Oc3hrM3UrU29NdTNlZGNWTHc2VkQ4YVNUNXRHdjNSakhtY21xNDVhekRT?=
 =?utf-8?B?ejFvV1VSMFJmbXFmeU5lWHZnejUweHc1Q3VTQ3pMc3lxMkpqd3Y2VGZZL3Jm?=
 =?utf-8?Q?CyNqfBQURyBvBBOO9B6fBQ7ZjntgtOvp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnZUb3dVVGRuSk51eGNWdGp1NFdENFJ4Yk53dEVYVW5kMDJMTVRKejBLdzBY?=
 =?utf-8?B?NHJETVRpYmJjS1NXeG13ejM0UzV2ZnJKZFBPNEQ2NjI1TExrUnpOV1VtNUlU?=
 =?utf-8?B?VkhWR1RCMTkxVm13c0k4R0JZc1RHQVFrcXJxL2lacUJtM1lFSXk1aFRFUEwy?=
 =?utf-8?B?QjdWeHpHYnBLNEpNTThVU3YvQWR2TzFMTFJPeThYVlN4aHMwMlJYdEFRL3JF?=
 =?utf-8?B?NHkrdWtSSCtmL05EbFVPTFlxdnV6bEtvTlUrNU5DOXp0VWhkblREK0Y1NU5L?=
 =?utf-8?B?WHVWTmhCYkhIemVoMnpBOXFya21zU1dDa0kxK0EzMkVnT2VnL1B4aldWRkFn?=
 =?utf-8?B?cmJPNkZBckJGWGpoRVdHQ0Y1ZlFVWVlraWtydWQ5cTVGeERxaDdiNHQwNU9W?=
 =?utf-8?B?ampTNVoxWTZsekYxdkFXWUFOM2pKYXlXTHp6YXBndXlieU85M1ZpNUdqN3Zy?=
 =?utf-8?B?dW1MTFBieTd6cWVKa2tBVWdWekJ4RWpaRUdMaldFRitZcWprdWpUdW9tQ3M2?=
 =?utf-8?B?VUZ5Q3ZWOHdwVGZqcGFTVVpVNGVxakNhNXZmRmY1L25CVEZKVGNnU0FscE9p?=
 =?utf-8?B?dFpqeWNrWUlTb284TU1sSWpFdVBPNWRqY21tREFrU3Uyb013ejhLYkwyakJ5?=
 =?utf-8?B?ZmFGL0lETlQ3c005NEgxMlhkQmtuSUV4VkIwU1UyVnVWbzB6QUlaWG9Vemxv?=
 =?utf-8?B?cCsvTnF3S2xGYTYwQW9QRXRuZ0p2cENPTjFCdzJweTlnRWhLMWZnekFJTmZp?=
 =?utf-8?B?WG5JZkt0U2JCSkdONWI2anBaOER4NGY3U2UrOWdIanlpOEtmVTN3OXpYcHBR?=
 =?utf-8?B?THZ1T0NoNktmaTRGOExIancrY3ZvQlJOR09CWTBGRndlN0tUdUVuVlVzbGhx?=
 =?utf-8?B?Z2lnSnlrbVgwQS9HK3VWc1lhcGZEVXlEekRRY2JXL0xoL2h4eDBHczc1d3R6?=
 =?utf-8?B?TVp4YzJIZmdyNGZrcENnZVJ5c1ZqeDJ5TlBnbnA5NTJETkhQQ2syK1FJdDRM?=
 =?utf-8?B?NjluY1dWQUxJOTVjQVhoelRyVDRPaU1FelJzZG5wY3BzalMySFVwQUU1czN4?=
 =?utf-8?B?RzFUVlhvM29xY0RGUm9BNVB0VlN5K0lrcUt1bzNBUzV1Y3VIUzhLTW4vYm1s?=
 =?utf-8?B?TUF3S01WUmhrVEcrdEYyRkJqeUJheFc1L3hkNmQrYXFtbWVhMTY3bmtxWlBM?=
 =?utf-8?B?WUEwUllQSzcyczJxM04rNTFvSnhLeEs5aVhRcXhKUG1ZemU4ZGQwZTNWZkh1?=
 =?utf-8?B?SEoyUXlyZ1FQaXcwSGhKNUM4UzVZNm4wU3Jta0ZNeXYrNldIZmxyY29NbnhY?=
 =?utf-8?B?KzVtTmJSdXVaTEYzcWhmK2h6M29qYXVvSWMrMDBLRkhjc2ZCL0c1WlQzVWpZ?=
 =?utf-8?B?VHdzSnlzOERoR1lkbnE5Q2tTUFBSN0Y3Y0dkOTlTZ3BzOG5PTWRSN0FaZkJo?=
 =?utf-8?B?QnN5a0J2VEFGZzM4ZFpWdUNYRzJrQ1ladE1NTXhqVERGR1hZUkpJS2lwdith?=
 =?utf-8?B?SExtL0x4Wnk2M2Y0U25sNG9LbUg3dFJoYlpIcDNqTDBGYVZJREFWZGJ6QmJK?=
 =?utf-8?B?YXhHdmNvd3pBTWNkQ1NkMTBLaGZFOEJ1dksyT0tvcm02RFZUYWdKUFNvNUhF?=
 =?utf-8?B?RmpJTHpZTGxmdWpiWHp0VkdOaWpPVFR5dktNeTdwZHBtYml0TFRqOWdjeThG?=
 =?utf-8?B?Ylh3UUYwOVJULzYvY0NwWFFrM3hrTTJKSTAzM2NNeGRQanlmakE2Qk44VHFM?=
 =?utf-8?B?R1BHaGFCTUF0RDViWTNoQkh0SndSS2U4dXp5RVBXYWVpSHh0VDJlbDQ4cm9N?=
 =?utf-8?B?RXVCcHFidHlCYXZFTm5IbUZLQmV6Z1JEMDA3cEpTcXdtUXlteHVHdVcwODdw?=
 =?utf-8?B?SGhpMk9aSWZhZHMvS3NLeGZzSHovcTJkMnA3ekwwdkdqVUNUcXZESzJqVmtu?=
 =?utf-8?B?ZHE1cHRpbVZKV0lGcHB6b1hXeUgrSWVZc05FOExXL1RwVDlDWnFkUEgyOG1F?=
 =?utf-8?B?cG9xSHZ6ZFRiWWVuQ2tuUEVFZWpNbTd6UC9WTk80eExYYXg2VGxucmdIVFB2?=
 =?utf-8?B?bzU1Qng1SnAwblBOM3NpNWxJMnlHaTJhcDFMSXVYWkFhK0UxOFlHM1l3cnJE?=
 =?utf-8?B?bThkdHBhbFJ2QmNJb2tCLzJ6M3dvTTIvR0E2YW9DaGZNVW8weHhjVzBUODFs?=
 =?utf-8?B?SWdpYkZQZkJTdnNMNHY1MWpjUGQzT3Eza1ZXZEltWHdwTThPeFV3WmgxM2Ry?=
 =?utf-8?B?RG8zT056bnplZ2pVZkZrQ2Q5ZFB4WEZVZE1qK0xxN0V2SkRlVUMwS05oYWJh?=
 =?utf-8?B?RXNSaXBYR0R6UW1Vb0dzbGhLdmlkTDdJM0JKU2ErS1ZpMFJlWXJ1UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc9278c-efa5-4e13-dc40-08de3cfdd671
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 23:50:05.7380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fS4tdpPPO9SgthbDZczpuP38fDBKBruZlPH30/jg8L595od1fy4hBvdNJeW6mwQWp4sXhtp7d/r262+AX0migf5Y0CUh+ONUHwQxK+0Vos4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6462

On 16/12/2025 11:13 pm, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> The d->arch.physaddr_bitsize field is used only by PV32 code, so move
> d->arch.physaddr_bitsize field under PV32 ifdef into struct pv_domain.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

(Yes, much nicer split out.)

