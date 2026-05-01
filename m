Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNJqFKAn9WlmJAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 02 May 2026 00:22:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A346C4B002D
	for <lists+xen-devel@lfdr.de>; Sat, 02 May 2026 00:22:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298955.1573882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIwF8-0006no-ES; Fri, 01 May 2026 22:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298955.1573882; Fri, 01 May 2026 22:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIwF8-0006l5-BP; Fri, 01 May 2026 22:21:54 +0000
Received: by outflank-mailman (input) for mailman id 1298955;
 Fri, 01 May 2026 22:21:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wIwF6-0006kz-Mm
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 22:21:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIwF6-00CwaW-0t
 for xen-devel@lists.xenproject.org; Sat, 02 May 2026 00:21:52 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f5277f-e002-0a2a0a5209dd-0a2a45079900-0
 for <xen-devel@lists.xenproject.org>; Sat, 02 May 2026 00:21:51 +0200
Received: from [52.101.61.46]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f5277e-229c-0a2a45070019-34653d2ed72e-3
 for <xen-devel@lists.xenproject.org>; Sat, 02 May 2026 00:21:51 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6979.namprd03.prod.outlook.com (2603:10b6:510:169::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 22:21:47 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 22:21:47 +0000
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
 b=cRVeK+xZkuNnBnWhK+eOPazaXK0IrmVSWYOXoWE0WQopm1oYlW1PQlVBmO9v5iSR3AK87EjOA7Z6bQHpUbg5n6xBjiSIhZZU1fqBWm/wh0iQUSiNCisLP5vbYWhicPLfc7zQ71ougWvfsQqwbhDraaWqWpdsBNPGHGk9MsuYVhOZcUixFKNPXX4ldhpaGN1a4LXbGReiYJvMd1pNp6Q3C9QMiY+LNsgASlDYiSK+mLekL4LVyL5xn5mhKWmeBaLPBD+P8txTs+JuS/WUBv0ChnX0BhcZtEWZ+cv2WnvQACgZoltQQ8wXLreae6tQu90ixlTsaxXRcc7m3fw85hMhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L38TbsMue7FujU3ZRudU7Pw2syw+ljgeIFgee/ytrgI=;
 b=CAI2mBcxejXBwhk2qtyhuQ4xJzBPWS6ZSjlwGTB/sKZ0WyT/ayrquH6cs2FSdiSyECCfkQ2LksS3Zo1hyxsRYEpotxjuuB2g7kedzYFVjx/BSyR1wmMO7b6u7mVk15JK2bnKLsAeWONoW5lXooR6FvQpHL2ZyDPV1Wu+R1a70eUqSMAf8A+qVOjk7JO757mXMGxwAIQlUSRmvuF6R/Egiz6kUXv4N8b/H0EKpEiGySzWM2CKpvQVxcVSr6WOlKeKO+wcolKJSUepG82taTB3xEI6ZROVd4HtYvNX2CnkC4qkvPC7UMWSvOAOAbWwbMNzZtym+8z/vfLg0wafo/QaXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L38TbsMue7FujU3ZRudU7Pw2syw+ljgeIFgee/ytrgI=;
 b=icN8GEwyLXhIcaX0GoHxCbyMoVfuroy3QlzV11INr0xGrwnzvvgP2Ej52xU1trR+cG4QiB2fRh695cNSRcM2z9SrKDj0wfcVZe0lK2awKmuXQQNDCdI8K2dRSvRJR6nXatkI5Dadp4FZDg/YfJ6FOt9VwDuUxG4aFb7Usl/PbNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <981a0dad-dcbb-42c8-a840-6f228eb89be1@citrix.com>
Date: Fri, 1 May 2026 23:21:44 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/svm: Always sync guest CR2 on VMExit
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20260501213826.1291860-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2605011443580.512397@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2605011443580.512397@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0430.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2a120f-d221-41e8-8461-08dea7d0089a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cJZ1ktdN5XI9AcJKLA8rKJMlxHWo/cckWot70mQzilGYo0+COG9dBBAui9oYzs5oq+1QqILriv49I/FLk3lFC/4wm4Appu3T4Jm7XgBI3x1htY+KyGGxYwnb2iDN8vj2yOFapvlrYut/1ibF9kV9BBiMkfGDt12VvDjNFVvvkVqEGYX009rw7FugJxfc5i6JsC8RXF9I4ABMPKV3JZXnyH0KTYvuY4fr1QVNimi8qGHq13d1xXsWIjSsRuocDIbqJRTRaKucJUpM9+jrIq1URI237/Re7hJF5EUxX+cy/oqT0ulGhsmkfvsXLRn7KFtULvqIhSsdl/dz4kLqA3NtT1kHkJ3EKalkoyKyDoTWbGV6gI8evtglGcIxchipT1cKJ3Esd6DY1On/sO1xaWgBiZkQjN6miURXY8rMeiELxHi5DWSPYwueOykSwgDuInZz1Tl/c7dg0z4LreMcml/KD+ak8nB1H1AWMTeytH7DbW2Lz4hsxBjsgVVSD452KF53Wc2z+Z6FqV+93THyoyhFEfX7fD5YK77DbjEXDezA8ZDGDROMy7IUpASGeYinw2tSleMh8NlXhGJwrEWCezoIpFJOhzsaMOh5WA+wWUidl+RjBJbjaR7YmzL+lXBMpi9wvOu+DzcOIAmUeug1CDjUNXyZy5zH+bBn4EpMEV0E5AsG2Ie7YHPuzGL6zlfURkuc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkIzTnpWMHdqd2tRb3JHVGJ3RVdQbUtyMlRiNDBzdkJ5ZEd0WXpRajF1aEEr?=
 =?utf-8?B?NkxRbEhTVkprUFFsQzI4Qi9FcTc4RGRDbTZkemcyWGxNOEQ2emExcEJxVmsy?=
 =?utf-8?B?eHFYTG1QTStwR1RHL012VXNYYlZhWnd1TlBlT3FFa3d5bnh0T1JxZW44c0gv?=
 =?utf-8?B?a0JnWXpmUGZycWZKdjhWRmlhZ056M3RjbGZFaFVSaGhkWXB5ZThSK0tJSVV3?=
 =?utf-8?B?NytBc1JuMTFScWRUNGZyaG9zbXlUOUpyei93Zy9LZjBnRGxoM0w4TjJIdHBK?=
 =?utf-8?B?eWFvVy9oUVBRSjlIUTNNeVllcnZzWmZETGQ2NTk0Z2puZzJqbXVCb2JyZkE5?=
 =?utf-8?B?d3FnMU1mS3RWbWxjb0Q1dDd4NGJ6Qm83V1dKTkV5TlNGMHZNdTJoRUQzWGNW?=
 =?utf-8?B?dFY2STlWK1NxaEswNk94S1JUWnBmRndCRHhIdllBc1FiUEovV3pwaUhlVXNU?=
 =?utf-8?B?TnpqeFhNbDNCY0kydTJQd2tzczJMSmUxM2JmeTZ1K3NWS1FNMzdORmFKdDFH?=
 =?utf-8?B?cm5LVzEwWThSNEo0TU9IWGUzbHo1eGdVUS9oZkk5UWZ1NjByaVlLU0pkaGJo?=
 =?utf-8?B?Z29HOFpwaWFSdVBoeTVqMmQ4Wk5mRHBTYlA2RU5Vb25QTUxYZ0xORU5oRXRL?=
 =?utf-8?B?K2ZEZ1pIbU50MjJRRjdJQXhqYzFjMUhJd296ZHVMRWNPeDA4eGU4Zm9jS09Z?=
 =?utf-8?B?dmxBRCs1RkJOc2t6ZXpMVitRNk15dFQrNU43b2hwUEY1bjNmeUF6YU9pVnZ2?=
 =?utf-8?B?Rk1vWEhRNWxqeThjZ0Mwc2M3VUxiQTllRmdETitEaTYvUWhpQjh2ZHV6amhH?=
 =?utf-8?B?blJVaXQwL003RkNRWUtENjZXb251ZnU1UlVpUDd2czdXVGs5QStTbDJkbUFi?=
 =?utf-8?B?eGl5eFJZRHFUc1ZLNlJCSEFxUkllUy9yZ3lUYXZsekhjZ0ZpNVRUZSt4OXpU?=
 =?utf-8?B?NEExbzhNekUxSm11QVQzYndySVF4ZUxPMjF6bkhyaUg1MHd4c1B0NXR4Tm4z?=
 =?utf-8?B?Vi9NVVdnYUdwUzIySnF5V1ZudW9Fb1FnRHp4MEljZVl5ZFFYZklmN1RVRVlR?=
 =?utf-8?B?bllycDAvakJoNHZCai9hYmIrRGxTampjOHFMT3Brb3c3RSt4TVBtbFo1V1NF?=
 =?utf-8?B?cTl3Z0svWXYyNzk4RlFxQkRSTEw4ekpuTzk0aTlZZmc5Q3Z0U3pQUS80L3JF?=
 =?utf-8?B?LzM1S2cwVnFxR01YQnpwMEphVjhpcE5HMDFPaVYrOHNuTGlSWHdoZUFuZCtr?=
 =?utf-8?B?RjUyNUs4Ym9IVWpYMjh6UzdZN0p0dktadEUyTjVqUmFJMEprRGdMSnY3MGFx?=
 =?utf-8?B?SEZpT3o2UDJmRmtlQVo2T3lmUnRoNVl1eU5NVzk2SXBqV1kxeUZpOUNrUmtm?=
 =?utf-8?B?by9RVjhEY3NJN3FyYzVtdTJSWjZhZHRYbnJRMXB6MkVuVW1Ga0UyampMM1U1?=
 =?utf-8?B?QkFNSjNJMjFXWHd6ZmVNTDBrZUV4RjBoTzFCN1QvTDZaRlNlMzhNM0VsWE51?=
 =?utf-8?B?cUZRWnpZM1B1ZnBGYVdQdDA3QlVCUmh6d0lGQVEraTk0cGREcmNmM2o0TnZz?=
 =?utf-8?B?UG55V0lhMGRPTjBST2Q4cjQ1WHlsZ0FNaDBraVQxU2x2cmFnTHo5eVJzTkpC?=
 =?utf-8?B?OTVjL0FKZHR1b29EaXpTRC9vanFXOEw2bFJ1Y1B0Q2VJQXZIKzNnMDRobU5J?=
 =?utf-8?B?YUNDWWlqT0tobUdSU3V3VGpNcmNOeU4wY1JXNVd4ZkFrNTRmcHg2VlFPanVo?=
 =?utf-8?B?YXA4RFo4NWhIblh3N3pLM1dac1NDNFM0YTJyVnB1VmJYdEg0dzUxeGVrNVVn?=
 =?utf-8?B?TWF1UDhWd3B0UTNwZm1PM25TSThMd3Jjdzl4c1cvcmtHejVPRDY5dnBlVHBh?=
 =?utf-8?B?SWdWTk51Mk5qOFhUcVNpekQ5VWViVTRjUitSeUdvNFF2UUNMMVdFSitXMmhm?=
 =?utf-8?B?bS9oaTFTbU5aSlpRZmtTNHludjNpOW5lRlJSZEpGSE1wVjVEWkhmSkNjcTVD?=
 =?utf-8?B?MUxLQXMyZCt2MHl4VDVVcVROS3pxTmpjTXl1ZlRDdXBmNEh3bnJCaUdVVmNv?=
 =?utf-8?B?Ymg2QUtMdTBDTWRjTFNMN0tJb096bHlEaVNtY3M3Uk9Yd3NvaGhxdHFmSFFY?=
 =?utf-8?B?T045UWd1ZzdkdG5YZFhZaGt2QWVoTDdKcklLaFZuY1V3L0F5VVBUSzR1RFJO?=
 =?utf-8?B?VjhSUVM0dDhkSnpQYnh2Wk1qSTZrZDhzTUExVGE4d1lYUTlqbTRjWXlpdUEr?=
 =?utf-8?B?WENWWk1ZcVpoTkRlUXVnaEhsYkZKdG9Ha1dzTytvbGdxUUlxQ0FENDdiRysr?=
 =?utf-8?B?Z0NRQTI3OFE5KzBlMlpXaitFcFVqTTluM3hJOEZuNWhBWThKV2szeHhGTkZM?=
 =?utf-8?Q?ychMhjY2ljrLG114=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2a120f-d221-41e8-8461-08dea7d0089a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 22:21:47.3449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9OeV+rYwViclXNtvURUVbn/xgc7tjigZz87ehrKr6u65il4IcfsLxsCVqhM9F1/XpTQNngExWhdn0VOUpaFKxJsK5+uausxnK+ymvP+1x8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6979
X-purgate-ID: tlsNG-ef75cf/1777674111-23D7FC48-101C7482/0/0
X-purgate-type: clean
X-purgate-size: 1254
X-Rspamd-Queue-Id: A346C4B002D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 01/05/2026 10:44 pm, Stefano Stabellini wrote:
> On Fri, 1 May 2026, Andrew Cooper wrote:
>> Under SVM, there are two copies of guest CR2.  One is v->arch.hvm.guest_cr[2]
>> and one is in the VMCB.
>>
>> Xen doesn't intercept CR2 accesses, so this mostly goes unnoticed; hardware
>> loads and saves the guest CR2 across VMRUN/VMExit.
>>
>> For HAP guests (where #PF is not intercepted, and therefore we don't typically
>> inject #PF either), this causes the guest CR2 value to be lost on migrate.  As
>> migration is cooperative and not done from the #PF handler, this also goes
>> unoticed by guests.
>>
>> It also means that an emulated MOV-from-CR2 reads a stale value.
>>
>> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
>> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks, sadly I made the mistake of extending my XTF PoC for this.

There are also bugs on the emulated MOV-to-CR2 side, and they're far
harder to untangle.

This patch probably wants to go in in this form, accepting that there
are issues still to be addressed on the other side.

~Andrew

