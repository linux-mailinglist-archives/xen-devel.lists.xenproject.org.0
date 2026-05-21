Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIwkFl8lD2paGgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:31:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2E45A8649
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315440.1585261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5N0-00024E-CW; Thu, 21 May 2026 15:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315440.1585261; Thu, 21 May 2026 15:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5N0-00022x-8V; Thu, 21 May 2026 15:31:34 +0000
Received: by outflank-mailman (input) for mailman id 1315440;
 Thu, 21 May 2026 15:31:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wQ5Mz-00021X-9C
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:31:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ5My-003blm-Lt
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:31:32 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f253f-2eae-0a2a0a5409dd-0a2a4504aacc-36
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:31:32 +0200
Received: from [52.101.46.35]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f2552-1dec-0a2a45040019-34652e23de8a-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:31:32 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7310.namprd03.prod.outlook.com (2603:10b6:a03:52c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 15:31:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 15:31:28 +0000
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
 b=gJHfziCYRZI1ovuSmRkOOfgV3wo4+L7hNxzUViZlq9RW1ejz0lusMTEDfWgLV2snEFmS57NxnhyOSmzDHQ5ZcW0oZd9sNBwvtTfDma2+777lg38EPCrJBLrttmaj8q+esAzFL1+8+VS6gyzMlXCNRkmsWQ/zn9nitcFHLCYc/syzJlzoCnGDfgzgReDfx3VU0AGgM4hqQ7pmq1G8wcezmyVhJKFX7T+tmscoMzAx1wWSE5ZZ1q2+1IG0dC3FStfLBjRpmupGagk0EuM8W6FM45NsgsfuKsztzeaM4qq99dMeJ1YXAyXsqpAtn724MvClyVBOHnSIaWHZ03o+lQxk2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGQPXkNbL817b+o870HF8Buf3s3YT7nC/t7RIeyWlQA=;
 b=KStFJa7bzXuv+O6C12LxatOwc+EXRLoZCrEPzN1nMdpa/YiDjczRR7yWwHXgrTteVkAxmZVYPRl8XWLVg2dsegjbk+wtRkkqIPAmnErPXZFgHFD5KHLByLhNvmH7lHpkSB1qisBBJ692kF0fBqcVBPF88TQ1m8qIgOyafaK0NG1Nmh5Tr6Cpk/CqfR4fiY3Mh9P2Biv1YhW9x2nROKlThjtDxPFsA+SSl7RtiZjAnzdL6aYY3sd/8LWKmOgAO35Ya0nlM0KNSbvW8aE4GMVmwQX86QOUrCZIG7L77qbmuM0dqd5SLeQbR00jgcjUfxJvNGOrkUMw1QcyrYrZkdzy7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGQPXkNbL817b+o870HF8Buf3s3YT7nC/t7RIeyWlQA=;
 b=uf/ht0j8EGECgFCQHUXSHfrM1mXAK0OjbFMvUylmNwQjdZNDMEWwzj0Re28tfB7fFkcqYbZc7s3j9jyGXhMDsgGvE7d2Rdfp8pXRjLaB02Ke6kRrWxsfs4t/pPPXdkyF2fj/qXM0D8j2FgorQJukfclPgHhUfHfZWfIlocBsMHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8e779783-cbad-4e1c-9401-6eb9f45a84b9@citrix.com>
Date: Thu, 21 May 2026 16:31:25 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 4/4] x86/PV: split a get_unsafe() invocation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <738daea9-ebec-4299-b0f9-49448293106d@suse.com>
 <e8932c52-c030-492f-af87-d37f87ea8f45@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e8932c52-c030-492f-af87-d37f87ea8f45@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe01c7a-6661-4b8b-0384-08deb74e06c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	9DBmc5Xxy83ug6JicpkdxADu0nEoHjtvc7PHSkko4dcMW4ZGcDx22L3v9j4Ph3X1Wetwn3Xp0i8XuqMt91Ukv5vK3Qw05V3cbFHd/NuvfbVcrMlY0Edop0d7gQP8aYQIcxjskAAtT0ESg9LR3QCs9ghV4uVOlWUAYUEfTJZaCst0Il3hRx9OtW0gQbN4vWdjZzwKxE5Z85vmvJg4rrOu2A3gl0rHXvGoTiacxUSb5lwqrrgBn8gDZvpt6f8EG/T7Frzni/Oqr+p5ax4DUERwe22go9GuajakBQRVMuH2ESxf8zFSDZJRlOG7Hu5AVg7AalXOBm3zw/FaWlW8zTRTI7r2wmHWfOoKuFiPD5rLxTsqtMiqCnwGMqdHKH32WxCUrVxMCokFjgbZsU8CfPZPS+MCYtoQeKIxRY4GSbchjX1M+/HCzR9KXwoLF+WFMr3rllERZJL90rrRHRpbmBjNPrdE6mM8NqIxGlBfRpOE6YEVAbzY1rsR0BJroDV+EZXvTVY2B/zviBgfnqz0BbU/y2NNE65y8rfwAIM5GxZUj/AAXZ0n86MDPwCZA5ntdxMcWGdGQahAjopTg9o+G0XMVQ0nm3b6MAd9mMXJhHzULMHuR/gKudHYhhKYqEoJoRAGYISDTN5emOw5bEpuT43mcEoc58/9r2N/2R3xWxtFZ1UDDKEaFOeTUUCtx0073JPH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmpuQ1Y0TnpYTUZyMFY3cm81R3hqbS94bmg2TEROS1RpbmIwc3lqdHcrQXFF?=
 =?utf-8?B?MXNwZ2xXSWovcXk4UnVtSmhMQTdZSzJBMXBrRVJESjJaNUd5UkdYZy9sdXFU?=
 =?utf-8?B?T0lIbXNndU9yaWhmVFM4b2VQZ1JNSy9ZVWc0SXp2VmVVbUU2MFdCUlM4VEZv?=
 =?utf-8?B?MFlUc0pvaVR2UFFwRXFCVmF5WkRxdGxzeTRCMDQ3ZEpTWEE0RkUxYjNQNkdJ?=
 =?utf-8?B?Si8xQTErV0NHMmpDUXBlK0tSVlQvckh6aUhnTHVTUURDcHZrRWJNbUF6K1RC?=
 =?utf-8?B?c2Z6ekdwTHlqbzZ1SW51VHVZUG42QlNZdWtGcVIrTXIwZEUwSVIzVVR2VGF2?=
 =?utf-8?B?d2pNTVpsOVVPbEg2WW9sRi85b09WWmo1Y1Fvemw2SVpXUjFWTUp5M29YaGJk?=
 =?utf-8?B?aDBTOWNDZTVZVlFDeXJlWVhkMjAvOTJOT3Z0SkoxdzUvK0FKeEJsQzhwSzYy?=
 =?utf-8?B?eEN1VXJsZnBOeWJuMmNYYjdZY1ZkTGxXcWdTdEdSYitrcUhPUWhzU1ZDV2Fs?=
 =?utf-8?B?VldmQnBReTZIL05uVWNWR1ZERVlrWEt2VmRndGJGTlJhc3NFZlFtZmRRSER2?=
 =?utf-8?B?ZGx5U0QyK1gweUtoM0djT3Y2WTJ6RWF3MDZ0QjZoNHBlTVBYaHRLVFpOOTJn?=
 =?utf-8?B?ZXVMTlVOem5COHluMm5GalNiN0p2ZWxIWHRkL0s3bHVyTjBWcTl1Z05iTG5P?=
 =?utf-8?B?dlVsdDJES3JUL0MvTlZnVVhpUkJlVXN3MDFzSVJybnBMM1dtYkZ0QWlVUTNh?=
 =?utf-8?B?NmJpYVJES0l4UENHUnpWYWZlV1VxaWJ2RzhyMjhTS0wrWWlqZkxMc25ibDN0?=
 =?utf-8?B?enVmQmhKY3cxdFlyZlF6aDV6MUV0cC9xWjRKamY0NnQ5TERQRS9XemN3K283?=
 =?utf-8?B?NWFMVXI2WXpGVVIxNU9OcHQrUXA2MWdNdmlNajZCbkloMDJHd1BrMTd4c0Rm?=
 =?utf-8?B?c2RubWpzK2h5bm5ub1ZzcFc3b0pGZVBsZmUrYWd4cXY2VkFzOU9jak56Vzlm?=
 =?utf-8?B?SzdiVE5SenpXN3lFSHEraGR5N1pmcWtoR3F1Y2pydEdoVVkweU9yM2U4NWFu?=
 =?utf-8?B?ZmR6bm5XTlRMbms2alAxK2JzMG5aUUpPQzlyblNQSlpCd3hqdko0S0luMURI?=
 =?utf-8?B?eXdwNTlnNlVMT01uUzk0WkZlWkRLWUxsVXhRaFFBWWZXMEtzQzhFdEd2bHlZ?=
 =?utf-8?B?dUNtb2VjektqbVRCTzBib09weldzdDhxNDZSRUluV3ZSb3Y2Q3BldXdTRkdV?=
 =?utf-8?B?Q1hFZTZHakVMTkFXZE9mc1NKcnpLQjdnaUQ5RmJQbjA0VHRVS3pqcFc2ZUpP?=
 =?utf-8?B?eG55TForOVRGTk5PSWIveklqOFlNVW83SjNydStSSjBPYktadm1IQzh4dVo0?=
 =?utf-8?B?S0NGbmFVQ0hUcUYzV0lRNlBtcHpsckQ4eDBLRlFhNmE5VEdhUW0zTnhjVCtL?=
 =?utf-8?B?WEg2Unprd3VFNGZYQk03VzMzd2swL3RCSGZvR2VoQVp3UzlXRzRQbTkvOCth?=
 =?utf-8?B?cElKWjRIY2V1YVlMZWdiZVZ0cFVUZ3pBbTBDUXk4Y1RnTG41ZjBRSkdJQlY3?=
 =?utf-8?B?Q0xLalJVTnZKNDFFRWJaZVNXMGg1SGZkVzNLZktwaVRRVjBCOWw3RXJkZFMz?=
 =?utf-8?B?eS95eFVmd1VBa004MjlIdEVGUzZpZXRaVWFrSlNXL1BBVmlUNDNLZGROTCt2?=
 =?utf-8?B?MDRjRkYvd3FOQncyaHpOYm90ckVLUThOUzBobjN6MEs5eXQ2MmlzTk5ra3RP?=
 =?utf-8?B?Ukh2YWtDczVvK3ZYWGowMldFNVRnaXlVcXV4SzZIWGxaT3ZhVE1PaG8waHRJ?=
 =?utf-8?B?bmFWUnQ5MXZFSEVYNXp2c1B0MCtQTjNNWi9vMkx4c0FtbTZDWUt6QnVyUUV3?=
 =?utf-8?B?RFg4Rm5RMlJ2clQ0OFE2eUhwSWJyM3NpYTZrSldPWmVkc25JOUVsT2dabGw2?=
 =?utf-8?B?YjNhRHdyYnF3OFRGbkhCQnJpOCszM0VsdVJBNnRDSnloYmpzbWt3MU5TL3Q3?=
 =?utf-8?B?WUx0QmFIZHZMbHhxSDlDVTNuY21zU2FYRklJK3Q2b2Z4di9UaHhLQmh3amNp?=
 =?utf-8?B?WWsyWDZacElSWWdNQm5wNnBQdk05czVQZVhEYlhqb1pSa2hSdHl4ekZDbFRz?=
 =?utf-8?B?M0dOY1B4clZUeTdMYWhMZmlQMzI4UlY4NUZCZkVWcXBxOVFZVjlCWG1LTVg2?=
 =?utf-8?B?YkpnbGovZTliUm9GRjJNTlZTRTJyYm9EcU1Mb1NCcjlhRURSeW81bFpSOWdk?=
 =?utf-8?B?YVJ3VUtMbWllUFA5V1hrbWQwYnJZbFVsQnYwdUppZFJISUhpcXR5UlloamZj?=
 =?utf-8?B?UjZwajJocmhuTXBaa1VOaHU3bDR6Y3FYTWoyOE0xQTI5VGxzM2k0aGhVZzYz?=
 =?utf-8?Q?NoARcpljqRi6DXsI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe01c7a-6661-4b8b-0384-08deb74e06c6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 15:31:28.2960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ipzFrOdwDG7xX92H7U385XzjcQDSkX3Gx/bf3DHfh2g6MaPk+YbWEd0T8i5MKS+++ldSeu6+hsfAKtBMnTIqxSZ6GKZRS4LbXAlQWe11nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7310
X-purgate-ID: tlsNG-ebf023/1779377492-291763FF-9C98E5D4/0/0
X-purgate-type: clean
X-purgate-size: 324
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BF2E45A8649
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/05/2026 4:16 pm, Jan Beulich wrote:
> Misra C:2012 rule 13.6 takes issue with the gdt_ldt_desc_ptr() call
> appearing (deep) inside sizeof(), as used by get_unsafe().
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

