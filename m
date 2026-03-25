Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE9jKAG7w2kKtwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:37:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9AD3231C1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:37:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261916.1554639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5LcA-0003WB-2W; Wed, 25 Mar 2026 10:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261916.1554639; Wed, 25 Mar 2026 10:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Lc9-0003U2-W1; Wed, 25 Mar 2026 10:37:29 +0000
Received: by outflank-mailman (input) for mailman id 1261916;
 Wed, 25 Mar 2026 10:37:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w5Lc7-0003Tw-Jt
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:37:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Lc6-00CDEz-Vt
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:37:27 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c3bae0-2eae-0a2a0a5409dd-0a2a4505b816-26
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:37:26 +0100
Received: from [52.101.201.35]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c3bae4-5aeb-0a2a45050019-3465c923774a-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:37:26 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH0PR03MB6052.namprd03.prod.outlook.com (2603:10b6:610:bf::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:37:16 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 10:37:16 +0000
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
 b=AnjR8Br1oNeRYamYqaeptcsjcM+ORLBgonCk6EJb35zt/pzO0qnuebcHpoEc9grb096YBbXdUg15DK/PBneB5mVP3HBtVcE+r3kQbXrKwqDJjLgF4WMzmlUgoP9+y0vW8t3DHHzdtbA6v0vllTeV2+Zhq6sTPb8yrZMMbNMftt6Ppg4rsRwg3qhwIXd1ZKsxunAdqhu8rXb2PpYq9pevGiNIpeLHnKWGh3TED5QjwfItcDooR3qih9DfaNygFN0E4QPtwo2/nqg5+1mK+OshJSnfWFD3LKs7HB7AgohxDwbHh/1+I/RTA+73kT/SR88E7xjj8NavSY+vL6PWTXrpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB0QI9da2qSM09sqEfgTvllWC+wma82Oqe1TiKZfULY=;
 b=Wqb+u4WcBepn9nvj5VPkmFXjf1fos1nVD9/9+gEbDysmFRDkA6DoEty8fasB/1z86ULY0pux9nz/mG/T2WYuJjpTA5VGEPoiUOR2UAYGQJduRn92tskq0YfpCIfFuEcGkQamvxtTlZP9scCK6JpZpPRQCjd0gpiwDKwHPYXp7OQRR1TAYlPQrgsdHLKk1lYQVGYHAflQPfdCpfbCzQ2wNCEDjFc2Qbgt1QGcHPVbjk0eAxHGL98WfmK/60TbDOoebwyYnfbDSwU8ZDzze+NIKXyFx84zcbnHjFPttVYGXLCKLtAJ8Whtl9Fm1h1ls4yBfGlzISO69bcI6barZUsG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OB0QI9da2qSM09sqEfgTvllWC+wma82Oqe1TiKZfULY=;
 b=0SlebMSkcrmkdbdlewny8pmp2dXWkkjqibrs1QnAFnZzmdeN4qbqVjh+D2QhcYrMqVLm9o1sk/nB+DFCm2k5v6+ZA0q0D2DSmRv93A7a/cZMMh7FalIbDc+fw9OKYnHA4amEbQHNY7yrTcbAGo1QLpp9Iz1PhhXe6ZonXVPpcJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <68469e6b-33c8-4020-bd8b-75afe8f6570a@citrix.com>
Date: Wed, 25 Mar 2026 10:36:03 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] x86/domain: Ensure a vCPU's FPU is reset early
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
 <20260324181937.2465574-2-ross.lagerwall@citrix.com>
 <0471e754-9ea7-4fb5-b573-b770713b2f53@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <0471e754-9ea7-4fb5-b573-b770713b2f53@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0691.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::19) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH0PR03MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: ef861b0a-101c-40c3-35dc-08de8a5a7bec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+JVw/hvRfIyg2FOQe705MG8ENeQRNJw1qREjF2nGO5iK0M8akTsM81RYV2cQRJjz9JsoRGxk4GnTFpFBv6OLAhmmvoOqFzQ9m/KZ+eQzG+xrorrHKPfDXW/3xdCkOcAmzgWGduDe0Jr4fanzFwmugP9d/E3rBU+OqfhFcyCdwKsjCX47Gb5s205dhka1k5v2vR9H4PQwnEZbhTcEN7eaW27mAzHuFQV3mI/4hN0y02adstUcdD+wS1e2gdOm9MnD6QFJRqkLXMdKTGouT+S/4oBbk3880uiL5awBS7Fv+4zYd6CBdxLzFDaJ3Z1Abkekrq8XzZFGmeoithFxitZafxTouADFIibRCi7JV1G8uWH1V02HjRTBLKbWeFoiXq2pjHPVNFZ8MMXCz+iqqy3g5rn5JM+JlctrASjOhvZqFPWj3JkH9CwZ4/gVEUATHQwRfVdkFnMouMGzT6pUrVqJ4LgxZDgHCAfgin9f4bfsle1Teuws4BRkF7MLcALij0aXhFEXfkbcQ+poEQWQJBcxdvkSuCakHmGSvv7iojYEx4m0Mv1Jc1QqUartY8Hm+2BzGWYU6BdWAGMMuePgyNHDdIZSGSaqD/VgdygdEUXfstaTOlZv9itNdkI6jaqvBDg/j1tqejg2u1Do90lSn/LqTqRW4wxTGBNnLsOcVs/ovyJE+/ltLGSVedhQ9KkmzIab
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEhadmo1bDRKdDV6WnZmLzVVZ0gvZjRBY054dEpTTlRzNEtJUkRUWU9mWElG?=
 =?utf-8?B?ODh6UlgxK2tpcDFJQlVEelJqS2NJcEZHRVVrM3Z6bVBXN3p0UWMrazNkYWJM?=
 =?utf-8?B?bjJwbGhENElHSzZ6NGN5TERTQ09ncWZFUUp5WThmeHA5c1J2RDVDMll6cWdD?=
 =?utf-8?B?RHhvdWRwdFdLMGMwWU9UeWJLMnhLYXI2OHFWT3YvaGIxZGJ1VHhuT0ZZQnBv?=
 =?utf-8?B?MmViSkxrcXFhWWxBTDFUN0JOZUJMeGMreDhVVXYzSmxYNUNVdHJvV0ZRWk1v?=
 =?utf-8?B?NXpmUGIrQnFDVTUvbUozTlN0eDVRZHdOMWR4WUl1OC9YUU56MkpUOWpTbHk4?=
 =?utf-8?B?cVhKK0VQQnNjbTVTWmo3VE1vejZmTHQxQ1M2a0phd0Yzbkp0WUFLRU4ybW1X?=
 =?utf-8?B?VWU4bUhhdFFsUXFFazJvMTJlRm9lUFl5V2N6VzR6dzQrbEU1Q3Z0dld5MHlY?=
 =?utf-8?B?UHIzcFhudWM3YTY4QnQyOXZOREhtT3ZtWE0zYlJYeENySXBHV3VpV3VOanF1?=
 =?utf-8?B?eWdpZU9aUkQvWEpFLzVkemErNUhWemJJNGJQZUlSYlpkcU5jMlZzQm8yYmFk?=
 =?utf-8?B?UEF5a0RuS0FmaWlxQXdBb1E4bnNlb3FLaUdUTW5iNTdkUXIybC95c0tHRjlY?=
 =?utf-8?B?Q2R5Y3l5eXVTd0p6Yzd2MFJlQkJUTDdSQzd0b1YwSVN0a2Fnbit3WDhiaUQx?=
 =?utf-8?B?YnJyQXpJUTlYNnJqc0YrYWc3ZUZyVXNLNnNlU25ydll2dmYvTC85WGk0UFNF?=
 =?utf-8?B?NkNzOHZ0YUdmelZaMHFBN2xrRHRBRkpqWDZnam15c2RIR3NxRHlGT2k5MGE2?=
 =?utf-8?B?cXJVajUyTEVRNnlEcWJ2TkloRkgzbDQ0eUU5T0FrTlZqZ1REMkk0Z3FSeG9M?=
 =?utf-8?B?OUtPV1J6bDMyckNtL09DL0pSc0VOa3pyOTNwM1NMMmhzdENSOTQzVUhXK01Q?=
 =?utf-8?B?YkRqenlrK09VdG13bUVpYkNucWRFdWU3U3ZBR0xpVHptVVozdlVlbkkwd211?=
 =?utf-8?B?clp3TnlsbVI2N243MThuZGQ5eEdWWlV2RXdDTzkxUEJkRXdQVXh6ekZ3b25y?=
 =?utf-8?B?bEMwbU9zdDZ3dXpTYnhhSldkY3VKTHRzV0VTZ3k4WlNTQ0RVaUhnQzF1MzhU?=
 =?utf-8?B?MloxYnZ6WEFBYU1MWWM4K3dTV2JjUjBzWWNQelh2UC9JQnlaYkt1OU9KMFFs?=
 =?utf-8?B?eXNVNkVxRkRxNVZsQktXaWc1TitnNlRTU3U1MTJkdDQ4TDgvMzdmazF0VG1n?=
 =?utf-8?B?Q3F0aGJZajNSc1N0MmJKbTRraG1BM1BiMTU3cVgzMzFXQ093SkNLaWV3YUpG?=
 =?utf-8?B?dzE1YytDVTQ2UVRQcm1mTHh5Y0F0MFpuTFdNSHIwcnZQTTBJQkhJZ2RZWWho?=
 =?utf-8?B?RHE3U0JsanZzbEtMb2EweUNiU1lVcFpxMEhGWXp1ajBFclBSQWZ1WHJUYWhO?=
 =?utf-8?B?LzFQNjBkR1ZCdEh0NnFIMXIvQkpLV2Jhc0NMOUFyeFpGUTZ5YlRmSTRtUFQr?=
 =?utf-8?B?Vko4L3lxUVhFSFFqbTZROXpQOEk0dGk1aG1CeWJpL01zbWFGelN0dVZXNjhK?=
 =?utf-8?B?NUhpSE92b25wR0VLajZsNmZUOHZZRFVLODl0c3plc0VocEZlVFFDRUlLWmcr?=
 =?utf-8?B?OC8yZVhmRFRVV0ZzNEsvc1R3YXVMbXhKU3drcEhEM3pURUphTVJscERtR1dL?=
 =?utf-8?B?NkJPSkhtcEx5T25nSW9ZZEc1M1JPYXF6UmR1WDAybnkrSVhPbUVBeGtVM2tN?=
 =?utf-8?B?WEcxMERZdDlsSzg5NWlKbElHMURyZEY2cUFDL2d6TmlWWi9yREU1eDIrSEE1?=
 =?utf-8?B?bDJ4aTVMZDNMZC9BeHcyTXZHSldQdzlwTFk5SmVHSkpsY1VWcFN0alZxY1By?=
 =?utf-8?B?UnVLck1qYXhrUDcycDFGcXhkL1lsaisxcGkxTWdkZmtyTkI0NndTUmdudzVw?=
 =?utf-8?B?RVFkTXZRVXd1NVNzZ2lzc1dzTWNhQWdCbno4dmN0Q2I1TE9td0xrdHZnOTU3?=
 =?utf-8?B?VjVTcllteURMZFF1RmhqT2tjQjFoUHZRWnZWVW5YcTQyUUJMN3B0aGliT2Jv?=
 =?utf-8?B?VzQzQXpGZGtZT2VQUDNpWHhoOGpVT1RQRmNMaSs5TTlZMWFMUUt1Y0pwclFP?=
 =?utf-8?B?cXlaRzVRbnJ0WHNBdnNZcmZrRVVDR2F6U3gxRlhSeE0xeFc2SFFYTmZqeFBu?=
 =?utf-8?B?dit4SjFGWkd6MERXenFSYzBVKzlSK0ZsWVRPcFM2K2Mrcy9sRmt6Wng0R3Y4?=
 =?utf-8?B?UEZBR3c0VEpsUnEvMkRZb3MzZEJIYVZORnZFc0cybzNFWDU4azVrQjVKdDhJ?=
 =?utf-8?B?T3FRY1Mvcm1qQUprMHhQRThNZ3hqTmFGWGhrRmRNQllZdDZ6SHdlTmVrcVpY?=
 =?utf-8?Q?9d23as5hACym8Dds=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef861b0a-101c-40c3-35dc-08de8a5a7bec
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:37:16.5735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opwcYXo1tMq+U+OJVFPbOhgqNjQwpMrxpY5P1zrt0HobukQAPQLw0WG3fQxyPuu7Nb8eLlqk+wGSHiKqGybsdutpzlT1JPrKCVjJrYheJJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6052
X-purgate-ID: tlsNG-c201ff/1774435046-2368D488-440F7024/0/0
X-purgate-type: clean
X-purgate-size: 4225
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid,sandpile.org:url];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0B9AD3231C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 11:02 PM, Andrew Cooper wrote:
> On 24/03/2026 6:19 pm, Ross Lagerwall wrote:
>> When using eager-fpu, a vCPU's FPU is always marked as initialized on
>> context switch but it is possible that neither vcpu_reset_fpu() nor
>> vcpu_setup_fpu() has been called on it.
> 
> How?
> 
> I don't think a PV vCPU can.  You cannot VCPUOP_up a vCPU for which
> v->is_initialised is false, and setting is_initialised involves either
> giving a good FPU, or taking the "reset" path.
> 
> An HVM use of VCPUOP_initialise only passes basic state, so can be used
> to set v->is_initialised without touching the FPU state.
> 

Yes, then a subsequent VCPUOP_up allows the VCPU to be scheduled.
vcpu_restore_fpu_nonlazy(), called on context switch, always sets
fpu_initialised to 1 in the eager-fpu case. I confirmed this happens
with some debug logging during VM start:

[  106.281001] vcpu_init_fpu vCPU 1 (fpu_initialised is 0)
[  110.088015] vcpu_restore_fpu_nonlazy vCPU 1 (set fpu_initialised to 1)
[  110.088155] vcpu_restore_fpu_nonlazy vCPU 1 (set fpu_initialised to 1)
[  110.088518] vcpu_restore_fpu_nonlazy vCPU 1 (set fpu_initialised to 1)
[  110.356216] vcpu_reset_fpu vCPU 1 (set fpu_initialised to 0)
[  110.356236] vcpu_restore_fpu_nonlazy vCPU 1 (set fpu_initialised to 1)
...

> 
>>   If that happens,
>> arch_get_info_guest() would return a block of all 0's for the FPU
>> context claiming it to be valid.
>>
>> Fix this by calling vcpu_reset_fpu() during vCPU creation.
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> The phrasing is a bit awkward, and the function names don't help, but it
> is something we're going to have to address properly when doing nested virt.
> 
> (A minor tangent which is relevant to where we want to end up)
> 
> https://sandpile.org/x86/initial.htm
> 
> #RESET and #INIT used to be a physical pins, but are just a message on
> the fabric. Either way they're events which alter state in well defined
> ways.
> 
>  From Xen's point of view, vcpu_create() is the only #RESET-like thing
> we've got.  If we didn't model crash/reboot as constructing a new
> domain, that would be the other place to use #RESET.
> 
> #INIT exists explicitly for HVM guests, via the APIC interface.  Xen has
> no working model of this because HVM guests were built on PV which
> wasn't modelled on how CPUs work.
> 
> v->is_initialised is a PV-ism which has infected x86 HVM and non-x86
> architectures too.  The key thing which PV vCPUs need that doesn't work
> like CPUs in the slightest is the chosen vCR3 (and vCR1 for PV64) need
> to refer to a property typed L4/L3 pagetable, and PV guests can't take a
> type ref on 0.
> 
> 
> Anyway, returning from the tangent ...
> 
>> ---
>> New in v2
>>
>>   xen/arch/x86/domain.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>> index 9ba2774762cc..82da1c5d7b38 100644
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -522,6 +522,8 @@ int arch_vcpu_create(struct vcpu *v)
>>           if ( (rc = vcpu_init_fpu(v)) != 0 )
>>               return rc;
>>   
>> +        vcpu_reset_fpu(v);
>> +
> 
> ... this really should be part of allocating the memory.
> 
> First, we should never have the backing memory in the wrong state, and
> second, the idle vCPU doesn't take this path.  i.e. in
> xstate_alloc_save_area().
> 
> Looking into this asks more questions.
> 
> xstate_alloc_save_area() does set some of the backing state, but misses
> FXSAVE_FTW_RESET.  That's easy enough to fix, and turns out to address
> my original concern.
> 
> vcpu_reset_fpu() sets v->fpu_initialised = false.  Doesn't this defeat
> the point of this patch?

No, since it means the backing memory has been properly initialised by
the time fpu_initalised gets unilaterally set in
vcpu_restore_fpu_nonlazy()...

> 
> Maybe it's easiest just to fix FXSAVE_FTW_RESET and then purge the
> booleans in the way this series does.  I don't think trying to unpick
> any other bugfixes is going to be fruitful.
> 

... but yes, that does seem like the best way to fix this.

Ross

