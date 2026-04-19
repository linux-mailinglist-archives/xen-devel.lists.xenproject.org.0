Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iERCBTIX5WkNeQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 19 Apr 2026 19:56:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751D8424F3A
	for <lists+xen-devel@lfdr.de>; Sun, 19 Apr 2026 19:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285362.1566430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEWMt-0003VC-Dh; Sun, 19 Apr 2026 17:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285362.1566430; Sun, 19 Apr 2026 17:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEWMt-0003Tk-AW; Sun, 19 Apr 2026 17:55:39 +0000
Received: by outflank-mailman (input) for mailman id 1285362;
 Sun, 19 Apr 2026 17:55:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wEWMr-0003Te-SW
 for xen-devel@lists.xenproject.org; Sun, 19 Apr 2026 17:55:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEWMq-005aNF-V2
 for xen-devel@lists.xenproject.org; Sun, 19 Apr 2026 19:55:36 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69e516fa-5cb7-0a2a0a5109dd-0a2a4503d3e8-14
 for <xen-devel@lists.xenproject.org>; Sun, 19 Apr 2026 19:55:36 +0200
Received: from [40.107.162.99]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69e51718-672d-0a2a45030019-286ba2637562-3
 for <xen-devel@lists.xenproject.org>; Sun, 19 Apr 2026 19:55:36 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by GV1PR03MB8359.eurprd03.prod.outlook.com (2603:10a6:150:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Sun, 19 Apr
 2026 17:55:32 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%6]) with mapi id 15.20.9818.032; Sun, 19 Apr 2026
 17:55:32 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgXRwfjKcpRsYb+pHjaTFoKCvnmM4e4BGtXSQ8EmGamzHFTZM9dU2Sh1TsgR4gXMYVpV7JB9qBuAvjwgw8D4aEzZFVQIR3DTntWd707yIdXj+F69QTDh8RV82Qkmd4DazuwfC6UNSebBX0U24czzRIh1kr8ZD42KW8ePoUFjUnQysq/b6/TTExwjzuIxysoZeQppBuA4yEtm+Ji5FyYHqism/MtwcwZfu/h137YsD1k1S3xEwN4/PK7BMv5fzKd3F1AVLWk7XS6EKP+khAXm3WwtkbZwZD7StKUXSmJ6ZeRQL7wAnbYKC32ec46HlPGpfiy/5DbHOrYLnOFEh0+0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pM3WTToRusV2pmI4GGzV0KEF95zi9vOjmYJaQMVxYpM=;
 b=LaHZcV8L3FdfMZlotvLrd6GUSqPSDI1ugXXnha2r7k2NgQuQJViYx0Xjhu84LHW2mcS9hLQ+1szqDGIwlxK5cv6iRdoJIeuvskQ+kRsbeP/Xop/JBMj3zqYf9fPEj8ULKTES/tFV2tNWMKY3t7KcTmqJUDl2l7bd7FzMaHtM8LkBjjsRb4ak0SsQZGoSv2QOGqdzhnGVBm9PZhOUcVWUR3uPA7l94X6o7kzmNU7iIIHfQKC+7qHacH+MVql+wvqVVWgXfxyGDVJy3VxJXv2x9t98fvXytIZgEf5hAWiy2f4PcYkOHXKd+VABkWWPSTkIATg0rlaHgjtVuY1J61UtGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM3WTToRusV2pmI4GGzV0KEF95zi9vOjmYJaQMVxYpM=;
 b=HucGnEaRq0QWUun1xkuwwTUjooxXHcTElVExkBuqQCWOiEoVdk+lhj0tHGGTvDoYxVx4W2IiDHMzNaWYVADm3cb/dU2ZonG9souuw7C2E3qxOAk9szIA6bBWR5eHOXCKA4SwP5lyyqt7yUZPvOkR0EbQudj9abyxEIdavwRy7dJ9B3kriZ5ZxwHBhcLQm28lClKaA0E6KcGlJztFwqE6hIbyy97p1ILSAABdqdq0Wn4KL2KsBSrdL1J7znIs4dYUtTujDZJHd/GAjElmFO+Q152FY9ex2x0qaYwV1QvBsmNWcQUb1/opWJYQlM8EuoDRr7QlXIJmlf2B9Z57ieaD1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <9221c2d2-0d0c-4db7-b796-3bc54dc6d6b6@epam.com>
Date: Sun, 19 Apr 2026 19:55:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <baa5aa0db3d8d2cbc5f46a60241330c4c7055d11.1774918270.git.milan_djokic@epam.com>
 <D20F71C9-C43A-4F22-9B44-84C0105914B6@arm.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <D20F71C9-C43A-4F22-9B44-84C0105914B6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI4PEPF00000156.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::877) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|GV1PR03MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dea987f-62b4-49d4-6353-08de9e3cd9dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	tiJvs1MmB1TCznmGhVd9VXynl/V1wdj86ZgqWNYKFuvi3LLZyYvv/nrR0LVABXbe7dI2Yx/mv7nYlNy1m5qQgwkV6za21xTEF2Gc5LYY9tFXkppPrJO7YKLBX5IOeTv+9q4vhoDa14qkrRGEkhK3e2DvjZcE5rMCr1OgCrUPJ2furwukfMr7q9cp8ft+imr6k5JEM/QBIQ9At3BvcJ6ibldQD0I4v2YjIpihMSkn9LfoZGJetlzDa6/9gO99OG83W10hzq2dGHQVipz6ERFNMKR4VZ3q9iVvMFzkoj33Vc8UdTxHCt5XCBRzHlAFWt9zo6UnXsqflhHk56erPqf703nriog4fzvCn6MwwBuGZsoaE2WfwabSxrHu09wxm4EplQBOcRjSc+aoR0YZnKh8WPGRdTD5oU3y1h3f6e8s7//q2Dfc9kn1+10GgvkCRmhLm/UDHxk0up/StC9XVl6CZC+MyWmGZ3Umew+SRliCgaLR54gnLJvW+2Hg/Sha8uSDcJxIuNGd2DO2dglstaYMTvxAozLEPepTJfnn+0LyHdY7x1vB2TWtb1BR4eJsEd0gfbX/pzdB3FaEWtIEvgYNAPjHtMlpiEvoQwOA5OP1VeHxI9//rIJhYwfy8+pw70owAaYSHRWs1CTxxbEYn61aqR7o2HInldGEmF2qX8chRei+lc14NLMSl52D/MVZ6o9PYyAK7PYM8bZLQmWLdSru7VsnK/pEm7ieSNC4OYLxduk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elhHTjU2SVZ2dGR4MGVxY3U5cHc0a3grMUdzOElpOGp3L2pLMTVQZU4zRFA0?=
 =?utf-8?B?cnRlRis5M3ExS3JQZjlvWitVNVh6TTZHTzVWSG5LRkJoTWdYUjJOeGVHZTk4?=
 =?utf-8?B?YkNvQ1Q0cCt2dHZ0bCtYcStLUTh1bUdLWjdzdk14dmlSQmNLVzVhTFRGczRE?=
 =?utf-8?B?eTI4ZU5SdTZQcmtvS1VWZERMdDBxMGpGQjNpa1hZL2VxMXVCUEYwQmhWZmNR?=
 =?utf-8?B?eklEWDNkTGgzY04yZTBXS0pXa0tNelYrQmJNeUcxUmQyTnFCd01uME82UnlE?=
 =?utf-8?B?MG81eEpMRjgyUVlZd1RodlJpdzRuTTFhRFZGNzdDV1FOd3N1RUI1bnU5c3dP?=
 =?utf-8?B?ajVDUk5Zcjc1bEQzMkF0ZWpqbDh5c0N2U1RSNStKY043V2FjWlZ6VEd6RFFi?=
 =?utf-8?B?a29oNzB1V3Y5Njh3cnpMZ0dtTzdyVjg4NUZHbmdCZzFKUENvN1lpQVg4dito?=
 =?utf-8?B?b1JWaVRid21peXFZK1YzUEM0a1ZiQlhkWFVPQjR3MlZqa3RZdlE4eW1mdHlm?=
 =?utf-8?B?dWcyNGpXZWVmZHhsc3Q2T3VSSXZwc0k3SjBWK3FJS2RxN29lbDNXQmduSnFF?=
 =?utf-8?B?ZTJabWFFTE5YekhHdEI2ZEh5ckttOEhuMGo0aTFaUmFiUUc0MGlxNHk4aTNa?=
 =?utf-8?B?cjI1Q24xaHBwcy8wZDNQMGJwQStESzlYNnVLazc1WDBrYWpVQ3E0UUZYQStv?=
 =?utf-8?B?bFpVUjZvSFdURmZTTE9hUGllYk1UZkpEcHd2Q1A5TFdTZzdOVVh4NTdRUTR3?=
 =?utf-8?B?ZkdaSVNnYTEwWC9ZYS96VlE3b1VRVFcrYjRveXZNT2swQmsxNTk1YmpUSmZJ?=
 =?utf-8?B?SDNoc2NHdXB6ajVtY083TVJFUTBZZzgwQlZzaTRtNm9MdTU1amF4enc1c0xI?=
 =?utf-8?B?MytHTVQ3cUdDd0JhQlRNTjhUaEN1WlJmRlVoL1pTMW1aMHZ1RTFScm15bEJp?=
 =?utf-8?B?QnhuSENuVE5RbzdiSk04cGtISjFGeTNBbyt1VFB3NkRqYzdZSnhXR3RzR2NY?=
 =?utf-8?B?L3BQcGp4TkRmY3R4TTlYeThLNlZZY2VNdTJMeGxPM2F5eG8wdXpIWWlHdjd1?=
 =?utf-8?B?SzR3aDdidTIraHQwYXBHTk5WcFM1eFFjQzU0NmQwREl3V3UzNThSQjYzL2tT?=
 =?utf-8?B?WWpEektGMERPR3BEYjVZRXVRSVR0LzBuM25oejFYNzNrcEp5Tm9KdDdxVVh2?=
 =?utf-8?B?R0RuREVLTzNHdjk3MXR1Sys1bmFVZ0tkVjNnekJpblBSMXBqWnRKZmlLM0Ra?=
 =?utf-8?B?Z09pWkM5Ui8weUxXdEltSHlwa1prRnJWa21rZnJ3VTRmMjBBSjlaN2Vwam1a?=
 =?utf-8?B?ZXB2Y1VGVEFxeWdMb2tHNzlkbVI1Qm90Um1QRlpHcmp0cVlBdVFxU3k3MEIx?=
 =?utf-8?B?RE1MdXQzcVFOd2tvVFhMY2N5NEdkU0hWZkpORW52K2xUd0VSREhxRHlpQ2tS?=
 =?utf-8?B?dkh0OWV5NGlQaG1DVUVsdzZuOHkyVXMxU0NONjBwRmlmU0lNNmo1VHd1OTMz?=
 =?utf-8?B?YlZHTXpGdU16ZEd0UjVLQXdMeWhKSnVVbXZ3alFNWTU1QWRGREVobldZYjQr?=
 =?utf-8?B?NTJubWxnODlhbmF6dnN5VXdqUUcwZnkyY0ExMTNOOG5FM0dpYitNcnFtTjh6?=
 =?utf-8?B?YXhkZ1k0d0hlaUNleDN3d1JxL2M4VUYxUjlEM09pOHV3Z0tlL3B4UDJyTFRm?=
 =?utf-8?B?RTI3L2o0YXN0cUVobEMrSUs4OWhpVHNwQmhKVkVXSEUxOERmUlBGa3VEYmll?=
 =?utf-8?B?K2NscW5nWlFBcDhyYng3VEIwN3k1ZnZBS3F0ckVsSHRZOEwrcVlNSHF4RHdV?=
 =?utf-8?B?WFRxellwWDBMT3pySU5WdWtqUFgrTTcrSktqVFZiKzZxb3Y3aWJ1MEJDV0ha?=
 =?utf-8?B?QjlnNnYvWjlSc2gyQkNXdkFHRThSaWVZK3oxcnpnUGtwNytoU3pOeThQQWlG?=
 =?utf-8?B?elpmK0p4ODI2d09IM0xrQU4vNDM1NVIvT3VLK3QzWndwME42dkNjeXFJVVd2?=
 =?utf-8?B?WkNrSjhIaisyODEwYXpIS0EwRHFyc0t5bDJXSnhaa0E2UVdWUjdZbHUzV09L?=
 =?utf-8?B?eDVHZkErWjVlZU96cmtUSzlQSFhzSUYxWDVtSDgza280TnNSVVFKZDd1cVA4?=
 =?utf-8?B?K09SeGdtUWNzNHhTOXZ6eGVFcU5XQzFoK1h4MkR6NG40dXdWOUNEL2NvTFly?=
 =?utf-8?B?QTdpa0E3U3Vpd1hmUko1ejg1Vk1XcGIxNXByWTlWanN4ZzFHN0FTRUFXRm5B?=
 =?utf-8?B?ckkwU3lORWFXdzVtM0xmNEJ0dHFXZHQwblJoUjR3cFNLcnIxQjI5ejF0Vjdq?=
 =?utf-8?B?ZEhaZVgrVHdpR3g2WEVlc3ZaSWpsRXB4YllxRVlkRW1qS1FibHhUdz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dea987f-62b4-49d4-6353-08de9e3cd9dc
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 17:55:32.4827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUAyYVpJj2j6z2kc4/FeD8XWx9xVWUaQc8l2MYQpFyTaZB6Nhlidqvm+IaMi3RzJZtsB0hzpnSz5Kc/VW4/kzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8359
X-purgate-ID: tlsNG-33051d/1776621336-A1F7A938-498FEC95/0/0
X-purgate-type: clean
X-purgate-size: 4004
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:Bertrand.Marquis@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 751D8424F3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

On 4/10/26 11:49, Luca Fancellu wrote:
> Hi Milan,
> 
>> @@ -740,7 +766,33 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>> return;
>> }
>>
>> + if (ste_live) {
>> + /* First invalidate the live STE */
>> + dst[0] = cpu_to_le64(STRTAB_STE_0_CFG_ABORT);
>> + arm_smmu_sync_ste_for_sid(smmu, sid);
>> + }
>> +
>> + if (s1_cfg) {
>> + BUG_ON(s1_live);
> 
> I think this is wrong, if a guest issues another s1 update on the same sid, this will crash Xen, I think
> that we’ve already invalidated the live status so this one should be removed
> 

Yes, this is a leftover. I will remove this assertion.

>> + dst[1] = cpu_to_le64(
>> + FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
>> + FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
>> + FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
>> + FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
>> + FIELD_PREP(STRTAB_STE_1_STRW, STRTAB_STE_1_STRW_NSEL1));
>> +
>> + if (smmu->features & ARM_SMMU_FEAT_STALLS &&
>> +   !(smmu->features & ARM_SMMU_FEAT_STALL_FORCE))
>> + dst[1] |= cpu_to_le64(STRTAB_STE_1_S1STALLD);
>> +
>> + val |= (s1_cfg->s1ctxptr & STRTAB_STE_0_S1CTXPTR_MASK) |
>> + FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
>> + FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax) |
>> + FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
>> + }
>> +
>> if (s2_cfg) {
>> + u64 vttbr = s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK;
>> u64 strtab =
>> FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
>> FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
>> @@ -750,12 +802,19 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>> STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
>> STRTAB_STE_2_S2R;
>>
>> - BUG_ON(ste_live);
>> + if (s2_live) {
>> + u64 s2ttb = le64_to_cpu(dst[3]) & STRTAB_STE_3_S2TTB_MASK;
>> + BUG_ON(s2ttb != vttbr);
>> + }
>> +
>> dst[2] = cpu_to_le64(strtab);
>>
>> - dst[3] = cpu_to_le64(s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK);
>> + dst[3] = cpu_to_le64(vttbr);
>>
>> val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
>> + } else {
>> + dst[2] = 0;
>> + dst[3] = 0;
>> }
>>
>> if (master->ats_enabled)
>> @@ -1254,6 +1313,15 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>> {
>> int ret;
>> struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>> + struct arm_smmu_device *smmu = smmu_domain->smmu;
>> +
>> + if (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED &&
>> + (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1) ||
>> + !(smmu->features & ARM_SMMU_FEAT_TRANS_S2))) {
>> + dev_info(smmu_domain->smmu->dev,
>> + "does not implement two stages\n");
>> + return -EINVAL;
>> + }
>>
>> /* Restrict the stage to what we can actually support */
>> smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
> 
> Here we set stage 2 as default, but in arm_smmu_device_hw_probe() we’ve
> deleted the check for S2 required, so if we have an HW with only S1 the probe will
> succeed but we will wrongly set here S2, so I would keep ...
> 

Yes, handling of stage-1-only scenario is not correct, missing in ste 
and guest config handling also. I will update this in the new version.
Following comments from Julien on the same topic, I'm wondering if it's 
valid to provide stage-1-only support in Xen?

>> @@ -2353,11 +2421,14 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>> break;
>> }
>>
>> + if (reg & IDR0_S1P)
>> + smmu->features |= ARM_SMMU_FEAT_TRANS_S1;
>> +
>> if (reg & IDR0_S2P)
>> smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
>>
>> - if (!(reg & IDR0_S2P)) {
>> - dev_err(smmu->dev, "no stage-2 translation support!\n");
> 
> this change, rearranged in the way that is sensible with the new logic.
> 
>> + if (!(reg & (IDR0_S1P | IDR0_S2P))) {
>> + dev_err(smmu->dev, "no translation support!\n");
>> return -ENXIO;
>> }
>>
> 

Best regards,
Milan


