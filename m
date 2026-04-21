Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHZ7KYmI52kU9wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:24:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17D243BF79
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:24:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289029.1569258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFC0a-0003NA-JI; Tue, 21 Apr 2026 14:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289029.1569258; Tue, 21 Apr 2026 14:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFC0a-0003LG-GU; Tue, 21 Apr 2026 14:23:24 +0000
Received: by outflank-mailman (input) for mailman id 1289029;
 Tue, 21 Apr 2026 14:23:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wFC0Z-0003LA-4y
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 14:23:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFC0Y-00433u-FG
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 16:23:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e78852-bab6-0a2a0a5309dd-0a2a4507cf10-16
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:23:22 +0200
Received: from [52.101.56.49]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e78858-229c-0a2a45070019-346538317568-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:23:21 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7265.namprd03.prod.outlook.com (2603:10b6:510:24c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 14:23:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 14:23:17 +0000
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
 b=QWsrHa7umByzRyC71G+b65BKtd0jophrte0N/HOzsfxTvylmcLvZAoLA1ehVhInKmDCly7N0LjDiPllYBIpbVXAGJAT7zAJoYQ9/o1ri8/o5WrzyY4JZ9WyjLFb5ATS7OJam8q26xSwUOfNloHOYN4ZDERQvz23gil7e3AdsA4Jc4kNQvvTIPUKmifBCkNrfVv2CWAUQHcumvvoWRHzkuE3U3SsqGK5PG7vi3dhRNmd/c6QqXisq/YpKGaqwPmBuSrRKuJGwFguFywpyilyuHnCX5s3ZrB6ovFHB9RR+mPi/k84gBL6oCkb0CdPFlX+PCVboO2wQwOf6fK6TvWzreg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUtIv1ewb4U84lSV8uGYFOlJvG8VvcaZd/pFNzJBrLc=;
 b=YUYrTWIt9vcnHNSla6MhQ8JGBMEFnl79fUScdzvycbdsD+4A164yQSodhi2XuARxu8UwjxiANkUnCV1kR44uvGusbPiNAhhRONlaxQ1CUqAYjzfdjcOIHaa4FQqDDnR/6E7A50+8M0Ya8exBpINbeKit3yrI4tAn4Z/6gAfZjnlJ/CnNdKx9IWMnRdjL7DktZJrJselCVGdt31Oz6MTk5FqAWZiaqkT1MFdgymFzbXOfaAy1x5XRvUF3ukFm2V41wnGY4bziGZa/LZDJIIkr7GZl696em9rSHU4jkMj7dCp4e4sLG9geoqlgnhBG+WGxPK7cI/eIgWFzXv+2leGgog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUtIv1ewb4U84lSV8uGYFOlJvG8VvcaZd/pFNzJBrLc=;
 b=uiNRNgPw/OYcHA79Onr8u5EkFHjL7yyXmfJqflMB7tymSRuENUHTZVyg0bxHzYLd8HK9zJ7JzfPbFGuzt3DHZ1EVa714YQNbsESRUmovyH0XPdE6zH2BzjGaZJulcxt/fvc99wxKL02IfxKu3J6G7khN9rqf66CeXNn2QwDKY44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5787a185-0963-4c4f-94d3-d464871a88be@citrix.com>
Date: Tue, 21 Apr 2026 15:23:13 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 jbeulich@suse.com, jason.andryuk@amd.com
Subject: Re: [PATCH v5 2/2] x86/svm: Use the virtual NMI when available
To: Teddy Astie <teddy.astie@vates.tech>,
 Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1772109484.git.abdelkareem.abdelsaamad@citrix.com>
 <29068558780bd9c6182d7bd74b357acc44409bfe.1772109484.git.abdelkareem.abdelsaamad@citrix.com>
 <1776780264.8631fc262581453bbf619ec5b2062170.19db05b44aa000f373@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1776780264.8631fc262581453bbf619ec5b2062170.19db05b44aa000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0042.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 8684ae53-a433-4e3e-a23f-08de9fb187d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PI/IJ0fKS20Hi4GquUYNNZkdATQY2JipCsk8Rn8Ab34DZHi2XAtNEVLxO4Glue9qDDOLiq6G59rumo8iL06pcHFKwAyU6JiDi6W19SzbAZXcdLi6LLCxnz9MEkS0BvePoxhHHupST1lZNvqvAB54zTImsEpKpsDeGC0jSSRg3XbSA+pDxcC1BOa5oxTlowCnOMuZo80u6Ux9US2Kf3E+PfgIBmp9xwQ7JGG5oh5zfKg2FpfOGMpht1Zpgysl5lvzACXfmqkUiOjjJeF3XsGzr1/x7kaiR3c2g5QRBkyVYQaruyN8HT1/Rqid8eZZSi24IUML3YGPZRfvbviSVgj2bwFScC/cE/Ab7XY3svAmFcLmCAz54LQ3XctpQU2yb6vx4oIcfe1wZtWRTv8lu7MzjeOb1vGwY1tdW1M2zBuF1nULEgu7qzpBOC2bI88EpiyYFbQYvapvdz1var7NEXI4tmOD7UbpyKo4vaIU/R/BlyvMo+Vs5FvnlBDwYdLvX3pf4i4S+BFk1Dy2A5qfT7jl19RICnjhT0IYx7pXwvtVfcMmDedjafeV30ioIgCQEh6LyLQakZufl5UZCkb2+X+4Cxo9u6PZFYEGJMM6ikaTohTAKMVd+dpYIDvPq7OpxRh+cbI6hxZr4XPadkssHeWZZdvfJAMQfUiQBZGjiqkcbkKrO0Af9Qr3BHti8TB7MCLHYkinmFmEHK0/bpM48VhN38Kcxa+UybhKXWInuzIjDh4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVM3aWp1cS9mVXl0Q28ycTJvTThvTWg3NFFtUVA1eUZhaWY4Y0Z4OHlkNEpV?=
 =?utf-8?B?R1NMbDQvUkI4aHJhdGV3bzQrdmdoR3NvSVpScTRCWDUvc1pCUm9BVzFYYm8z?=
 =?utf-8?B?djU3T1dqUDZRekJkd2IvTkZUZUNSM0gzakJXR3ZyNjl3UmhXZnVSRjN4TDEx?=
 =?utf-8?B?MS9MM3o3TzRYU2hQVUV3Mm14L2ptVmhKbi9PRlV4S29GYkxZbjgvbEswTjJo?=
 =?utf-8?B?NlRWbWZTQ00yVklRSThRbGVsKzdRRlNxaFdXblFjRkpOM08rL3ZTSWpNM3Y4?=
 =?utf-8?B?dTdZOXVPeC9QdFJweUVVME9BVktZM2pKb3dsdTVIWk5mVkoyWExxYU1meUtn?=
 =?utf-8?B?WnhmaGxJSVlDQUtLSC9QSTU2ZHZEZDBFNHVzaFdDQTNsUnRTSFFrQk9OaEg1?=
 =?utf-8?B?SDZwUTBON3FmekdjbExnNnByNUF2c2dBMGs4bVNDbXhuUnpESWM0OVB1c2R3?=
 =?utf-8?B?OVpmWXdISXdlWWhDNjdzZEkwcTVmRUhlKzR2UVpLYkh0VmF2OU4vTnVKL25C?=
 =?utf-8?B?R1RvWkpEUEVNSHdSSE5QTjFKMkxZK2t4OTNjMWRuN3d1WDhrMkMwVXN1Nmhp?=
 =?utf-8?B?UjBjUXdyblJuajBPdnNDVGJLMDllQXpJVXVyVGhkamdmcGtQRGc4YUhlekVW?=
 =?utf-8?B?TnZ6dnZLUzFQWU9vSXRoWnNEakJaUXVJVkQ4T0h3eWlsMU41SXkxdWkxSmlQ?=
 =?utf-8?B?cmJ3Q0VrVGhRd1pDc2JvQnFRdzNBUHc2UVZlcHd3VmR5R0xmcmVBajh3UWZv?=
 =?utf-8?B?QU5peEw4am9SODlPYkxreXdDYmpUVk50aXUyVlpuV2tLaUFNWGJYQXB5ZjF4?=
 =?utf-8?B?RUcvQlR2Zi9iZGJuVjQ5WnUzUXF2UHVCY0xWbDh0VnRLWE9SQ09ZVGcxTHdU?=
 =?utf-8?B?WS9KRTk1T1N0Vk1lNlVzQ2VnSDhUeFdxNTJYdTBCWWlWeDYyRWMwRUlGMjk2?=
 =?utf-8?B?dk1ETkJwcXFicks4MTNCVW5MNzB5TjFxLyt6dzgyYW8xRDBhYUNvUXQxY2lG?=
 =?utf-8?B?bWMvY0Q0L08rMFhwV0c4b2RzUEpHZENyYW5vWjRveVpuR3VVZGFHVGZ0Wnhw?=
 =?utf-8?B?elM5U1B5dStja3M4NTFRMTBhUkRVc3dNdEI0UHhKWWY3djBubHA0R0JMdDFC?=
 =?utf-8?B?YXNrbU1DdHc1ZUFFVU96ZnV5MHBBYWtIUzZ4a3ZPK1BTYmVwQjl0VUVvSlV1?=
 =?utf-8?B?OURiZnJGSTBDeFZ0bGZ5OXFWR3BkRlMwNndXMkZPbS9oSWp3ZjE5QWIwaTlW?=
 =?utf-8?B?cVBFNlpuM3pndGhzNjhzVjJ0RkgxSUQ1V1hzVi9zUnNvOXMzK3gzeUZiVk5h?=
 =?utf-8?B?dDBQU2Z1R255dTM4Yy8xQk5xL1RnZjJITlJVQUtsQis0cmdpTVR0QjFxbE9x?=
 =?utf-8?B?d2k1YllVWThoNnBwc0ZteEc5blFWMnBSMnBpRE5zK3A2elRJMk9TeTZpREJh?=
 =?utf-8?B?MTVwb3hiSWtGRDhSTGJYRUhPMDZoRCtKb0U1OUFiazlLVUVUR0VPaDBBRDRv?=
 =?utf-8?B?Y0YrQ3ZJWHF3R0tHVTN3QUVoOVJBaXJZN0Uyemt5Y3F2QmxOYWlTK0Y2S0VE?=
 =?utf-8?B?elh2OXZ6cWhnb2d3NUQwN2xzSmRGbkx1UEMzbWFiWm1TbHg1UmYrT1dsa0dK?=
 =?utf-8?B?dmVmUnZmWkt6SjFyODRaSUNhT3lsdmkvMXlMNWFYVGxtbXprQkxTU3ZGUk55?=
 =?utf-8?B?VGR5bzg0bVFkOXNEUSs2RDU4SFc1bnRDcTJseTZ1ZWUwdW9pSkt4MHFRcFVD?=
 =?utf-8?B?MnoxL3R6UXVTUDRMVmNQaWdzQkl3bXVLSUJyUFlzVzhjMlVEYmR4NE5jclBZ?=
 =?utf-8?B?SWVxcm9JSS9uaWFnUm9JdEVCSCtOMHI3elNjNVlnWEdEVjlJTUJ1dFRyVHJB?=
 =?utf-8?B?YzkrTlFMbXBCYTU2Z0oyRkVhYlF4QUJXbmlJeGdHQlYwK0Y5eWt0VkZCNURz?=
 =?utf-8?B?eXRCbVlmcStpRmtLV2Y4SkRMWXZldkMxN21HTHBRMGdYSCtsbFkxRkMrM0x2?=
 =?utf-8?B?b1kwbkErYUZ2UGJBL0N3MUZadjhmeVIwVnBwa2EzZXJ2T0hoK29Cc09DUDJp?=
 =?utf-8?B?T2tMRmYvTk5tZ3ZZVHJ2UjhEaStab0J2aGNIdUFwK0tPWlc1RWpsRzJCdEhx?=
 =?utf-8?B?djYvTG9oZzdVRU9EeHYzZ2NlZFBnbzVyVFNDL0tRREVWd21pdXRUQkpsSnRI?=
 =?utf-8?B?M1QrWkRJeHREVTJEREg4cGlicHFwdDB1aFlMWG0zT0p2Z0NxazNJMDBXUjN5?=
 =?utf-8?B?ZjdObFZvQWNpMGpJWXN0bG9uMzZHeUFJUkVmQ0RaQk5PUFIwRmpIdVB3THpx?=
 =?utf-8?B?UjZ6MWMwZXhNVURONlM3bGdZN0c0WkJrT093K0RYSnU0VWxXSytsaUdEVU1R?=
 =?utf-8?Q?785bWl/PU27HD61c=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8684ae53-a433-4e3e-a23f-08de9fb187d0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 14:23:17.0796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jG578XBhANw5eqxRbOZzjjRdZoERH8y/ev8Qz3qnatLhwqehKyqHPYTMVH5BqPgSfULTeobNhL6pf73O2X3y7TIL6UzBdGkCLg/oK7gA/SY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7265
X-purgate-ID: tlsNG-ef75cf/1776781402-1505AC48-C223919D/0/0
X-purgate-type: clean
X-purgate-size: 2938
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D17D243BF79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/04/2026 3:04 pm, Teddy Astie wrote:
> Le 26/02/2026 à 14:23, Abdelkareem Abdelsaamad a écrit :
>> With the Virtual NMI (vNMI), the pending NMI is simply stuffed into the VMCB
>> and handed off to the hardware. There is no need for the artificial tracking
>> of the NMI handling completion with the IRET instruction interception.
>>
>> Adjust the svm_inject_nmi to rather inject the NMIs using the vNMI Hardware
>> accelerated feature when the AMD platform supports the vNMI.
>>
>> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
>> ---
>>   xen/arch/x86/hvm/svm/intr.c | 6 ++++++
>>   xen/arch/x86/hvm/svm/svm.c  | 1 +
>>   xen/arch/x86/hvm/svm/vmcb.c | 2 ++
>>   3 files changed, 9 insertions(+)
>>
>> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
>> index 6453a46b85..112a393211 100644
>> --- a/xen/arch/x86/hvm/svm/intr.c
>> +++ b/xen/arch/x86/hvm/svm/intr.c
>> @@ -33,6 +33,12 @@ static void svm_inject_nmi(struct vcpu *v)
>>       u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>>       intinfo_t event;
>>   
>> +    if ( vmcb->_vintr.fields.vnmi_enable )
>> +    {
>> +        vmcb->_vintr.fields.vnmi_pending = 1;
>> +        return;
>> +    }
>> +
>>       event.raw = 0;
>>       event.v = true;
>>       event.type = X86_ET_NMI;
>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>> index 18ba837738..815565c33f 100644
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -2524,6 +2524,7 @@ const struct hvm_function_table * __init start_svm(void)
>>       P(cpu_has_tsc_ratio, "TSC Rate MSR");
>>       P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
>>       P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
>> +    P(cpu_has_svm_vnmi, "Virtual NMI");
>>       P(cpu_has_svm_bus_lock, "Bus Lock Filter");
>>   #undef P
>>   
>> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
>> index e583ef8548..e90bbac332 100644
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -184,6 +184,8 @@ static int construct_vmcb(struct vcpu *v)
>>       if ( default_xen_spec_ctrl == SPEC_CTRL_STIBP )
>>           v->arch.msrs->spec_ctrl.raw = SPEC_CTRL_STIBP;
>>   
>> +    vmcb->_vintr.fields.vnmi_enable = cpu_has_svm_vnmi;
>> +
>>       return 0;
>>   }
>>   
> What is the status of this ?
>
> IIRC the main concern was regarding whether or not the vnmi_pending bit 
> requires to set the clean_bits. But it seems it is not the case here.
>
> Do we have a official confirmation on that ?

The status is it's waiting on me to do some additional testing as part
of reviewing.

I think it's correct now, but I want to confirm some corner cases.

I have confirmation from AMD in private, and there is not a cleanbit
involved.  No ETA on if/when the docs will be adjusted.

~Andrew

