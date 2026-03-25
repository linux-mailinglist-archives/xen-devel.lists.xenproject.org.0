Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EkGEsK1w2litgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:15:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1902322B73
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261858.1554604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5LGD-00071Y-Kc; Wed, 25 Mar 2026 10:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261858.1554604; Wed, 25 Mar 2026 10:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5LGD-0006yz-HV; Wed, 25 Mar 2026 10:14:49 +0000
Received: by outflank-mailman (input) for mailman id 1261858;
 Wed, 25 Mar 2026 10:14:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5LGC-0006yt-OE
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:14:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5LGC-009Ma5-3m
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:14:48 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3b58e-5cb7-0a2a0a5109dd-0a2a45068758-46
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:14:48 +0100
Received: from [52.101.56.18]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3b596-3034-0a2a45060019-3465381247db-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:14:47 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB6909.namprd03.prod.outlook.com (2603:10b6:8:44::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 10:14:42 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 10:14:42 +0000
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
 b=YxH9loDWF1Sd6cg0tXAJaRtYpy/vCc4bD31dlkY06ch1furmKCWrQokmiTshcgQ1vFRDbi7X3g3/hgwHnsdoekkLYgwMz+XpSUgwxvuAutJW5qu+cYauKbV/YJN+6OfndGQb1aULOABgyYPY5BJswXkwX6RIbmyd4QofYze0LLOD48htUgWuVGKKk3FD6lY/vYB58dwosN/mTLcL5ggyimqMKTA63XXJdXsXJbyXFRCzQcYkJsSdtCqgEIxHkd0mnx2OrWfR4fhxrziN4fbBASSoiY0s+RQJ48pEHd3Wpa98ocgSoKs0r/xNPO0tS4Scj2yvktF3xDkczzpfzG4GJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7FxLcReI3lvoqNVYr3/LYFjIZGhWVS54QrKUzNgnMI=;
 b=L4TdwDyCCa3qvRtzLmoO6UdEOvqJRd7ZrgV+HhP4BD2UkqI3IcFq0H8qC8CrK5cGG2T8OvS2iGr+2iurY3N3U+bFH/Y8XQMpLV/lsrxnGrnqBDdLrhPY5sRufTsxIouG/gPTsejtxbsf+bfFFJOrmkB2+/bbgIaeJH+tJjZQRu+EZYe+mZuq/1UKXnligpVLjiKG7KpppV5lOAMpJptIcU01/dXwKEAfHXpyFBynTtG7gLMpE3IlTwlRTYWrLgk396YDJzAvKfdYTkx54tC25aOY7hFbGdJjCxzJ8gWZMObmwya/t/Uc+K5tHqss6Je9jobiZDpBdEEFTkHzJiU2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7FxLcReI3lvoqNVYr3/LYFjIZGhWVS54QrKUzNgnMI=;
 b=tJMFAF9pROidzlNZJc7Q8AwmqCBtuFNws1E3M6pK12APJRhrY9RgKF9DkfDKfatx8YEO+dY4v3UolpwwI9Gy2yYvTvX/fUnSEK6kAbsQ4t7uKrAHO1LJwjhCQ6DaKHJVcVdhaSBlxqALM9cM91BJ1745RsvA0oxcPIRLlJ7WuiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] xen/mm: fix fallout from populate_physmap() deferred scrub change
Date: Wed, 25 Mar 2026 11:08:01 +0100
Message-ID: <20260325100803.6640-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0051.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e4df5b4-54eb-4c31-ed0c-08de8a5754bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	UI3ceHjADr7E+nWHx3Tls2ag7I/Mxa2L8Alwf7g3+nfmF8s49ySq/JSh/mV/NF4GDSDfe1h9o49f3XOlp7HHPD/9HiksWzTyz8YAYgzpfxo6UYENXkRnE8d9eTqEFxeFKs2WDLb6QQPWN5M7bSAQ6/FUW0OAkfuhW07LpmGY46oHbO9H9RcaDD2G8G7D8bRVIn5CCOO+Tc6zq+x42KZoUGiyDMBKnAmWUGb4xBnpzXaY+kr4I5XTpn1tPmpMQRJTHckdBiy7fX3jWwmfwU1NZz8ggNvWUhHx3Uib2mFpSySltfynKyFAiUV7Css4TCALIRs16zeyyuNT7CLgvceRaAPiIEmcEwjk+NogNFTO20X0yQgyaIDBbHrWfJ40vPx5flpMwi7vZAYxe5qjaxhSmOLp0/Bp+Jhb0ZrlA4Ul4YDNgD6GSvnjhNpi185/U+DtgFj8Y7BG+cfaIcsDfjAx/HBjnbjpSNVzgiP1JFbNOWYQNuGZ40CiO5wAa2hptKEePtWxs1hlK/7z+Lxbmm0rM7SMFOcYzFnyoNWLn+gwjQPe+Hcv9R2k46aLRMYs/9v0x2v+umuQ8k6mEvGhuosp3IjD4sKEaYmVjogIKnXeSNneUY147zke5iGywzrr/Jd6jcwurvPFTiSSIWFX8ncXjH3jpBw5eSzGuDKSrNCNtW4nvdNg2XD6Ce1AzggFINkexFzLe88xaNhoLs1frV2qjORUK4Mo3E6kTgwVSGrqPj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OU1JNjVvRmxDR3pxVXpHalpMY1VoeXVsNzBHdVFYcW5uVUd0RzRxZGZqSU5a?=
 =?utf-8?B?MkFndm8wMnRkVGtWWjlGNFF4V0hIUXZVU2p5d3RERHlPaTdoL1UrektXdFp0?=
 =?utf-8?B?TU9iQ0RoTnZReCtKVUtWMlhkcFNZQXR3c1hUaWZnN2NSR3A3R0ppanl5RkFu?=
 =?utf-8?B?OUNQTmZpTWd5b3lEMlpWL2QvZlVqUllEVFJ2NW5Nc05GMmk2NGs2cEtHQjJH?=
 =?utf-8?B?Qjhwb2plL3cyOFdjcERhYnRxZkdmSEY4ZjZOeDZic01GTU1mUjJvMldlSHB0?=
 =?utf-8?B?anVDZFo4azJzaHVVSHY1ckdYVlZ2Mm43WWhsOFI2WWZpMlR1cVdwaHpXZytt?=
 =?utf-8?B?cEw4VGIwTnU2eGJDSzVpM1l6alNZYXZ6NUFVcEVTQzFnd1phdWRDQWFFSkVU?=
 =?utf-8?B?Smt1YmVQVHJSQjRzNzBLK3VPM2lhRktUeVl4NmdvUittYXZabURYTWVRRkFG?=
 =?utf-8?B?dFNITFRUOWQzMFhJc1g5bllMejk3UERTVHl3dTJZb2VNK3lNWnpSL2tZa0tn?=
 =?utf-8?B?MncwUjdab0hUSnRRSkJtcDZRZ3BBNG1uUmhkenhrSit3bjJseDRyQ1lUcUJQ?=
 =?utf-8?B?T3p4T3k1cGQ0aHNZOUNLRHRjQXh4aG9QWHR3S0s1SDgyZnoxQ1R3ZGJrNVlp?=
 =?utf-8?B?NjFnUy9EYklDUmdKN3Z0Z1NIZGViSlBqUmxBbnhsSWxtWE55MFRReHZmQ0pz?=
 =?utf-8?B?Ym5VbGhTSW5adGNndmcyVURMcXE4eTZLMC9iY29Zbk0xaGdpbmExWmhnZzZT?=
 =?utf-8?B?UTQ2R1doZkxCNWhBTnVXak9uV2pIREJEY0x2eDllVHFBUFQ4YkxEMlZIL3JO?=
 =?utf-8?B?YmlKbHpYbzJTR3Z0cG9MS09QWVUzT3ArdGpwdjRWK1hRSnVJRUVZNmw3bU83?=
 =?utf-8?B?OExnVUlqR0Z5anpWTUUwM01uQXExNHFoWVhwSkR0cmxOd05jdEdad0ZZdWhr?=
 =?utf-8?B?SEg3U011Y2xKOUY5OXF5UHJ6cktPL3lsMXJMT3VCL0haWHlTSm50aGpYckMx?=
 =?utf-8?B?S2I4MlZzS0tNLy93VHFzZ2o1Tm0xWnR2UkQwd285aXY4ejhQNlBicFpWUmNH?=
 =?utf-8?B?aWk4RVYxWHhIMjhQZ1hyMitpbjZ6QzZ1RUdYcjM1dzRuQXVJVWFsZ1FwbEZ2?=
 =?utf-8?B?bFlqODNOUENERU9pSGNxaXROajg2ZWNHRGgzeTdMZEJ6eWc5bXd1R1pIZGVQ?=
 =?utf-8?B?VGo1NkF2bU9uNzVkU0xuMFgrM2FWNzJGY0NCenFMeVVlaE41R0srMDNYbDZj?=
 =?utf-8?B?cm5kODZpT3cwTHhxK1JPellmemtCVzF0Yno2c3pVZ0w3MXpGdGJTaXNQWTZy?=
 =?utf-8?B?dW5GSVJQMGxKODBGRkFFMVJiUnc5STk5TEdicmNkd0djTWpnOUt2S2lMTEds?=
 =?utf-8?B?YmQzaEZEWWNMRVA2Wm5qMmFqR2t3VEFtdWlnUmxXV3ZhbkM0Sjl3TEpST0hv?=
 =?utf-8?B?VjF5WC9lRjk3b0k1Q1Y5ZXVqMVdJQkpNczkvWmtFTlJyaXlROU5UVjlzVVhi?=
 =?utf-8?B?bG1yek1jai9UUlNsUndYZVN6azB3ZjRrcUZqVVJ2aDhzaTB6REZheDRWMXhF?=
 =?utf-8?B?NURNWm54dVNhMlNTWFNkTG5CR0FUcTBOWnRjbzZEcmpzMWtndmRld2FmUnlH?=
 =?utf-8?B?RUVmUHBqaEtFakpvNnROMXp5NEN6Wk5Xa2ZmcjRaYlRDZTY2MkJNNzlQVXJo?=
 =?utf-8?B?Q0RMc3FKR3pZVUZrN0phcXNvUW1SdmxkKytFMCt4cGlHVDlnM3phNndPOWxh?=
 =?utf-8?B?ck90MzEzbGRjcWRqRDJBQ0N2dUhtLzFaOVBCYVp3V203Ri90VjNFelFzZkVR?=
 =?utf-8?B?NGZvd0ZpMnpHb2NENUdsMXlsOXN0UjFsa05nL3lNaGM3MHplZUZuM3ZSUDBG?=
 =?utf-8?B?WmphRlBtb3dkOWlpY1FLeVBwYTJ4ellYTm9KR1RTMmY4ak5VWWRqQ2YxdVla?=
 =?utf-8?B?U3FFcWNDbmNQOHV1cFp1STRIdzR1ZjAwSWZ3bk9aMksvMktLSitvUHpCUlhD?=
 =?utf-8?B?WUtURWpWUU1jMnlsQnlTS1l5YlFlUE9kZlViUTdNUDkzWkxGdEExblkxaTlV?=
 =?utf-8?B?UUNsOU1Bay9Vc1RwbXk4eTNGUVM1VGhCUlpVWjluMW1sSC9uU3JtN2hwS3lI?=
 =?utf-8?B?S2crL1RNWW5pS0ppam0wRDRWSnNpNEcvRXZOMFB1SEtieTRMUXFLRFJtM3BU?=
 =?utf-8?B?QytnSkJQSXl0K2oyTVgvTmtKUEtKcVBKV0llUUM5aVRHWW41RjBxWkpwcmhB?=
 =?utf-8?B?MHBjR0crODFSVHZlVXlpeEcvSjBwK0tKWXZHZjBEc0dxa2l2aHBIc1lyQm8r?=
 =?utf-8?B?V0pjTzU2R2hnbnFhOVNFYXNSMkhjY0Z0ODFRNmh2T0U2THc5OVkwQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4df5b4-54eb-4c31-ed0c-08de8a5754bb
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:14:42.4631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V13WbjO1BCsoS+U34Nf8rmqBKrE/7kbsq6qAHmjSHswnmVORZIvbrzSZR4AimcgwzIj2va+sB3geW9DKGa4Z/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6909
X-purgate-ID: tlsNG-16d1c6/1774433687-829971C2-F0D34538/0/0
X-purgate-type: clean
X-purgate-size: 484
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F1902322B73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

Two fixes for the populate_physmap() deferred scrubbing changes.

Thanks, Roger.

Roger Pau Monne (2):
  xen/mm: don't unconditionally clear PGC_need_scrub in
    alloc_heap_pages()
  xen/mm: do not assign pages to a domain until they are scrubbed

 xen/common/memory.c     |  9 ++++++++-
 xen/common/page_alloc.c | 39 +++++++++++++++++++++++++++++----------
 xen/include/xen/mm.h    |  2 ++
 3 files changed, 39 insertions(+), 11 deletions(-)

-- 
2.51.0


