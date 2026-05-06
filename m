Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLsjNM35+mnjUwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:20:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00684D7C57
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:20:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301272.1575564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXUQ-0006I4-Bu; Wed, 06 May 2026 08:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301272.1575564; Wed, 06 May 2026 08:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXUQ-0006GL-8N; Wed, 06 May 2026 08:20:18 +0000
Received: by outflank-mailman (input) for mailman id 1301272;
 Wed, 06 May 2026 08:20:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wKXUO-0006GC-PL
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 08:20:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKXUM-006Nvc-KU
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:20:16 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69faf9b9-5cb7-0a2a0a5109dd-0a2a4508cf40-28
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:20:16 +0200
Received: from [40.107.209.6]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69faf9be-63b5-0a2a45080019-286bd106426b-4
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:20:15 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7904.namprd03.prod.outlook.com (2603:10b6:806:42a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 08:20:11 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:20:11 +0000
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
 b=cD6q3VMSkzkjxI+LX/4FcDgLHIFx7yub1TNfk0DgrQZCKmaQJlJd17s7Ke9Zw2XDuT6xH3MBFKS/OY89FSVC0wa5aMm4S+R/THj2xslNV/60usnPD+qPmi0NxHMeWFDwQnM4VQCdvZhDee9+Kwuws/VmhqnZte1X530kxKNIq21N9jQlIgIlDP3Bcp+rk2lBIwIn48ju5wDsM6GHBxUvFSj3hsX0s7vJjPFhykKGGfqgeEhbmPfq/gWuREWacQUQhXk7D1hPK/7KSUGc5AXx7/D401ZuwBudLW4K9SEp5zPuH19B5FQtU56wm1VqDDjuSn15zONKOsMX1a+j+ZU/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=914UiiP8gqFzbTYKily7Lq63c9QMhT57qbAVRXfk5tE=;
 b=Dx32afmw/nlypXRBeD9UpQ6a9/LHxG3ONHskHJb5V2lX/T4iP2SIDh/v/xpJY7mUqlohBHZqEu66XO35J+jbwMQ6pWOvTurH8ACH3UJb5DkM6zK38urghbMVIodRwSLA42dFFuyQNk7JMs0+3Rx3jJ+jFjD44l/O4HZoWoYIO86wv22Y4LBwFlVjuzzvkpcinzGmeMEfbQ6gug4truki9kEQQ4/ynHJeKXWOEvP9ycMLtW0Hpj93OHwXV1x7IoW1A+zcFS2Bv+XO7wlWxlhJ3cPfkfzR4w0DQyaAGHtY73xlkhKJQu+j5fsRPJvEBTYYpOoXoWRfNu1I4JQy39Fl/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=914UiiP8gqFzbTYKily7Lq63c9QMhT57qbAVRXfk5tE=;
 b=IkNAOJ5FEUGzR7bv+bFDGuJEsQ0G7aDzShwKKKFHrDHaVmiaw6S/KHGSMmgZWe6Vj2A4Qk/WtCDGmPJ5jPtJQyOc07gharKJX2UPw5ARIoj57zz8KkdIGO+fY0SYhgR49Ko5aYG8rKm8pUTC4A9sGLEKsH8+5FxVVjx5LvewsiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <41ec5134-b117-47ee-8e59-682ac1e4a69f@citrix.com>
Date: Wed, 6 May 2026 09:20:07 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/2] iommu/amd-vi: do not zero IOMMU MMIO region
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260506073719.40075-1-roger.pau@citrix.com>
 <20260506073719.40075-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260506073719.40075-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0359.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37c::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 8abfab82-bc20-40f4-fb04-08deab484a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nYBvycU0bHtrwCzSZsITdeei2uF/SXuxLPPD3bRE073Y734eqiU6MLukLTOmLeUMh0Ga2ejb0PLCOb7xwDN/vW1IprH+dnMyHkB/zTBrWk5BPiAe5GU1Uir3/+uTSC4eW9fNljsF4IF55BYzyqXV6WlisSKNtFWQV1Sukl+7WX59u7LpEvwGbrTDCQ7yp1TC4DTt618jIyTSpv7ASfYz/utdsJ+59HThUty+eFZW8e8GUcZ7UdgQwxoDtyUP/RpGtTDr7OxnAAmfujT0zcefhOiO+B1C0o12D68DIp4x5+Sse/sy6nHXdHIY+jWbRLfGAGXnC2F7CaTJWfcybPa5BN+/PCPo74MvTVk04qfB7TMqg5W1dihl+MroMFg6idL+uFjULgEd63amK9BwmS0c3KuHE1BiRykKJfZhwI2flMqOsb7iva8Pivo9ys4PA0CDGhjwd4pjbqjoZyOzx8+WaT7t86pR4tQczp08yzv3O+FQvu4k2SGJWZuYdILsgtVlPYKnfxUjYkCv7OwQ9k5X7EaUPejbOeVCJCm6XIoBTfc6MMdI/JlOmTFI1vNLs6fnA9JrswNtx76PhUzFzlt4lp7Ad33KxzZJ5eXuTrIbMqX8Uoyy6HHFZ8yNduovpJDrGRxghWK4R4yonDlKe06/o1z6goQjKx8SCjBujtK7YAC9lW3+dUstvoCdlh+JTsQA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YndyMlJzMmN5S3AzQk9wS0tVemtTTGczMGN5YVZ6dlpYYU8zMFZ5N1kvQ3k3?=
 =?utf-8?B?NVFHQ2cxVzJBUzJrRHhXMVJrNk5wQ1cvTVZPRHc2d040QlJnSWhPdk45MWNP?=
 =?utf-8?B?cDBFeitMMXhDcXB4TnhYODlyOG1qZHJ3SkJscU8ySVg1M3BBVjBJKy81U2lP?=
 =?utf-8?B?Zy9KTXdpdkJkU0JuSnFJWWhMc1kxY2N2ODBGMm9pVFZQYVRvT20veENYcnYv?=
 =?utf-8?B?eUQ5eDlJOGpGbE1uKzBldlR0VWdHNjZRdXJsNHA3UmU2R3lFeWI2K0pNS1Bx?=
 =?utf-8?B?NWF0NUN6VUoxOGtaalpqbi9KOVZ1Q044MHFtSFR0Mkt6ZUVzRS96YXd0QWRY?=
 =?utf-8?B?Y0Z2aTF4YjR2STBaNDBobUszdzRmQnkyd3p2RzhOMktLbzJhSGZSK09NU1dz?=
 =?utf-8?B?ZWxabDhhd05vZE8wY2VxVHpHejBzS0x6Z1M3WEs4MGxGY3RkUThLS0NqbWhP?=
 =?utf-8?B?d0VGalhxamZMdW5LNGF5VlpKVnpIOUQrcHl6N0tINHNyZVpjMUFUL0E5RmJz?=
 =?utf-8?B?QjBxT3Ftd3NMNDh0LytCY1VFZXFkWENldmxhbnlBd1ZHZGE1SklhbVJBdTM5?=
 =?utf-8?B?UnFkamY1ODNlRDFwVGxka2xJa3dMZW1HQnp6aTFNSUd5WEg2R2dyMno0cXFu?=
 =?utf-8?B?a2ZteXBTUDgyTjVBUEJZazRUTDJOQzdUZWJiOER4QlBLS2NGdmJqRzBjNk1J?=
 =?utf-8?B?Tkw5T3h3RkpuMDVVRU1HYUVuRXZqbjBWWkJqQnc1dkdjc1dHdkFHb1A4ZlB6?=
 =?utf-8?B?Wk5CK0tYVEdvQmMxcitueENydmxnWXNRTy9mQ3FkZi9kWjlYYjJTV0NEUnFt?=
 =?utf-8?B?VTI0QWJISnlySWp4NFhNeVgrM2k1K1ZqeEZFMUtxak8wUUY2dXM3aEtZajhv?=
 =?utf-8?B?RCswZTZGTmc2NjRNc2h0dktCZjJPd0kvc0FUQXd2TU5GK2dMd1NjZ2wxa2dM?=
 =?utf-8?B?WXkwUWRWS1VqRFRDdTZWRFFsd0RyT1NaTnZRSi9TRlNhRzVwNmpCS2FrVk1H?=
 =?utf-8?B?Y1hsWGdSSjgrYVBSR1dKY1M3ZlJUNVlpbVBrUU5PTktGTWNvc3p3eENMQVp0?=
 =?utf-8?B?T2swbVlNSlRyYUhKTmMwTVU4TU1Vb0ttQWM0WjBNazVPRkZqYXMydkF4Y29q?=
 =?utf-8?B?b1pMeHZrWlg2dUNteWVCR0M3M1dsb2pab3RXcFVNN0R6QlJBbmE0VzFUVXZ0?=
 =?utf-8?B?dlVyVjJIK3NJbDcyN2hiQVQySjlvUUhybnF4dHdQdXlDNUpKSUk0OXFTc2dI?=
 =?utf-8?B?dVpnR0FRZ3dRVDZqQnI4UExNalVLQlVYd09TV0tBNXFhbVlOSDdnNEovNmdL?=
 =?utf-8?B?a3htM1hrZThtaDVOenErTzg0aTdYVVFCQTllWXQ3ekFYVGl0Z3A2bnRNNEJs?=
 =?utf-8?B?NUhrMTVveDBPQVNEZGJoS2h6dU5lSXpDSEUxU1dpUHF6cmhjUG4rNi93d3RQ?=
 =?utf-8?B?WHRPeWRrOXNzNGlxLzJuUksrMmt1N3crNkYxa2JHZldBMVZ1TE8yNFpjdGVW?=
 =?utf-8?B?Y1ByOEszYjc1bE1GYk9pTzNrQ1l6WHFIUTU0WGs4MktuZTUxd3hla0pOOE5v?=
 =?utf-8?B?MWlka0c5dkZtTXBMUjVqZ2ZuL0pSazBDY3ZkNUlXa3NEckJKN3FwdzZDcmNt?=
 =?utf-8?B?eFM4eFpjbEFrSUFsLzNlQU5ROEI5UXF0cDlmUmFtcFBKc2dmd2xyUTZ5cjRr?=
 =?utf-8?B?OGxvNG9tRzNOVkl4OURxZkphVUhVeDkzZHBEWXQrZ25ldGM5VEkvRTB4MnBx?=
 =?utf-8?B?eEZPSjVCVHFFTGdQRXNBbzl4andibEdDZGhxNS9tdGg4N2dJbFJyREx4RWhs?=
 =?utf-8?B?RkxqY3VvZmdVeElsRC81S21rMWYrK3V5cVVFbENpZWVOVFJodXoyZEo5TDg1?=
 =?utf-8?B?eDZXbkFRdm4rdzlxQWpzczhMM3pzMnVlNzVCbEZxVUh2cDE1WUdwaWl4cU92?=
 =?utf-8?B?ek1DdzhUQXR3cGZ5OUhkM2Z6cC93dWF1Sk1sNDZ3YXQ5dGxHV0NxaVltRk9i?=
 =?utf-8?B?OFVOVlppTURJbEk4cml4MzUzQ3dLRStrVUwrMURnYUJGWHdZTithZFpvWlN5?=
 =?utf-8?B?ZDYvVDR1aDlEZU9ocjgwUmJOV2lTU21RNHd4WFFVaVFYRnUydlM5OEtLQ3Yz?=
 =?utf-8?B?ZURYVUx3SUxGcFp0bXJDSE1raXZ0SmVSR2pZNkpmeWFYZmV2UUs3U3pyRktn?=
 =?utf-8?B?Y0tlVTNZcUJVOFlFTFhNNEs1VUNWaitlY1NWa0Q1SlRNeEtwUUc5VVQ0azcr?=
 =?utf-8?B?VXBsYkVpSWpBVU1rdG5OS3pycmorSWFudE0vNjF2ZXd0YXZzWnU1TmxnbE1I?=
 =?utf-8?B?ZlNaeTl1Wnd4dVlJbWhFZHhKdXBtQlJPYzdZWlRPWHRYV2dVSk1aTnR2dlN0?=
 =?utf-8?Q?kTmV0d67f/8eXyv4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abfab82-bc20-40f4-fb04-08deab484a7c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:20:10.9912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWWVdiiJG5awcINlpb+g6pRV8y2P6JytIGT2l9Hxy/EJaa6bKu3Sg7BF49kWKlaK4g0ESEgXVUXjiNVCSVcxvj+1JC7YQITJsVkl+8hLA2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7904
X-purgate-ID: tlsNG-c1860d/1778055616-3B97DDB1-55F383E3/0/0
X-purgate-type: clean
X-purgate-size: 2127
X-Rspamd-Queue-Id: B00684D7C57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 06/05/2026 8:37 am, Roger Pau Monne wrote:
> Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
> say the least.  We don't know what registers might be there, neither what
> values might be safe for those registers.

Minor grammar.  "there, nor which values".

> On a forthcoming platform doing
> the zeroing of the MMIO region can put the IOMMU in a broken state,

"does put"

> which is not recovered by the IOMMU initialization procedure in Xen.

"recoverable".

> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> index 76ae78e5ea53..8bf5ca4de18f 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -1367,11 +1355,14 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>  {
>      int rc = alloc_ivrs_mappings(iommu->sbdf.seg);
>  
> -    if ( !rc )
> -        rc = map_iommu_mmio_region(iommu);
>      if ( rc )
>          return rc;
>  
> +    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
> +                               IOMMU_MMIO_REGION_LENGTH);
> +    if ( !iommu->mmio_base )
> +        return -ENOMEM;
> +
>      get_iommu_features(iommu);
>  
>      /*
> @@ -1381,6 +1372,11 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
>          return -ERANGE;
>  
> +    /* Read current control register and forcefully disable the IOMMU. */
> +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
> +    disable_iommu(iommu, true);
> +    iommu->ctrl.raw = 0;
> +
>      return 0;
>  } 

These two things are unrelated at want splitting into separate patches
at a minimum.  The removal of memset() critically needs backporting.

As for disabling the IOMMU, I'm not certain it's wise.

Linux can already "bring up" an already-live IOMMU and Xen needs to gain
this ability in due course.  This is mainly for supporting PreBoot DMA
Protection, but also for things like the kexec environment.

~Andrew

