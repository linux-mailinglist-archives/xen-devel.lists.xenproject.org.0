Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uChuGqweEGqjTwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 11:15:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B739A5B0F71
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 11:15:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316488.1585886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQLxL-0004Kn-BI; Fri, 22 May 2026 09:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316488.1585886; Fri, 22 May 2026 09:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQLxL-0004I3-8D; Fri, 22 May 2026 09:14:11 +0000
Received: by outflank-mailman (input) for mailman id 1316488;
 Fri, 22 May 2026 09:14:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wQLxK-0004Hx-Ae
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 09:14:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQLxJ-00E0O9-JD
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 11:14:09 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a101e5e-5cb7-0a2a0a5109dd-0a2a4505c2e8-8
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 11:14:09 +0200
Received: from [40.93.201.0]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a101e5f-aaa8-0a2a45050019-285dc900ba76-4
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 11:14:09 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BLAPR03MB5524.namprd03.prod.outlook.com (2603:10b6:208:284::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 09:14:05 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 09:14:05 +0000
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
 b=JuI3A4YbwgjE5ygkQuTp3ORNmDWuox9bO1SEIWnBvrut3fl7KUniy6CRiKQNFI15zxohwbqqy7JgHw+Bpll66JGYXMAmH80+/g166ZBiiINzoiQcKTmlUHv/VFgE7CJL7S8FQuGD/LHHDvccUvZMBs+dXRuEkQln0AdiyHD4K2zz1qLhU7AIT7yvJ60N+2RqWHALxqClBR6GJPF/Al8h0r6b0x/3CPo+/64bV0YIPGMRi64wCgkPHYJfgw8gKpFdtFva0V5HYPZqD3P1WgtyCUv8rSf31lDC2FcTBZkcQFlZ/FqLUurCTbrM8FKmtuJOvutA/nuYHNrYx9FfCmIjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYq8Eq3IwKKX/eUYJnfz3JguYXQEaaaaBSAyij69T5I=;
 b=gqf4YQqzxvvQMblgPzM+pSwFz4Jjs+nj1onx1z0xpmyKauoA9iF4WuJEJqebGYHMnVVBikIvhn8yyi575USabBPdcvf5pup2chu3KkIg6bvapn30CzQLVKv6kHvj6Jltk9wYJY5pxaTlSbx0grAqzhq6RYuH2rIAFJzTZR8ZxW88sn1ezz5hYWs/mbmFjwsWAU5DxzybKRZjPhw7D6rgb2dCaHAHwML1D30wvLFNYgdsW3ozHrC0KRkBiOUguDDfzdmGRkkfoN1mLhMsilNfRqOBjPGYPbKiSIEtfYuwpZ2M4SwnU0iOmgyfl6zp+yPDOZ8W8L+Syh+Fq7b2w9CGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYq8Eq3IwKKX/eUYJnfz3JguYXQEaaaaBSAyij69T5I=;
 b=Os1L06YYkF8jhflnMLk97puc14miTBSjj76msiJspIu6j2OXOqvh8eo+BGq0W/DhxEvDX6v/AGFASKqXe4PHlafd6DsEDDgOfZqF4AMK6UhY59ccl0zR1At0HdumMzFo2vM0T0mZbChcH34lmPzlXgqv2FtEL6MkgquKpxBOsTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9cd57494-3b11-4e75-a8bd-4fe2767f0490@citrix.com>
Date: Fri, 22 May 2026 10:14:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 5/7] x86/hvm: Move INSTR_* constants to hvm.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-6-ross.lagerwall@citrix.com>
 <a5b2561f-0225-4f18-bc74-7f66227bc807@suse.com>
 <6a6dd703-cb9f-4a13-b0da-ff1a9d841bc5@citrix.com>
 <4aac1424-1a65-4af2-b9cd-0ec70eee042a@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <4aac1424-1a65-4af2-b9cd-0ec70eee042a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0037.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::9) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BLAPR03MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: f976823a-fd1f-447d-2128-08deb7e278f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003|11063799006|6133799003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	+o+8DcC4lPQZKBh2F7YXY+hfZBNaMBcXA41L0P96EHN2i0tYUjVOoElQgtpVa6YK5JWXyjwr+weWKlHOxhjiktGFLYPLSBxRwP/8Fb0v3V7rPnKuZOlB0lUal0bJ3bxABOpHPJkbrEHcq29l4aH88mGNTcFPc4K2Ix9QjvY7uoZDZHsTYc2ue46Jwwtx/xCgUYZGIJD25oB/jJf9ZRZdlKXqhIDl/XW0XU8961HwfB0q42YtwXzt76FTD/RFEl4a4iDwl+haBizN5KigvCx7o4siuOmtFX48h0PEfWldLp2iXoHGXFk5FHFY0c4ypAzJzYv3ZlZh6WejmOB+OFTQcJRx9KzecLrCPeEax21JZELatuDP+ZisT42W8Phym8iIwwbptjD2aJbPh33gW/XHGlcoK1OXgqqFnVu9Uqse+GfN63OHPjdo666gjXhCxSfPmIklE09VgPGaVj4cYRtTLTZWb24VCqhXkrNiXvCazHqCrrB0dpw9vBjH16amA83705yfi/x6y4ldiZE4NMhOlSNS0qUeFGlMWaBAD7Yvkh1alW68EMr22wLg8CvtM2z3aCOjb0PSVe+E6+YU4weYxLayt/80popYdHzRmJ5C/YfKLm8ur4f9QodBEPbw5oAePE26+V4O5TTHhk0cbCcGs6SWJIYH7uwoYUGULw4RKJH8c2uE01FJNZHqyye6ghCu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003)(11063799006)(6133799003)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzFtVnR3MHNmL09JR3B6cjRGbXlvUzlBdk9zdmlET0pKeWdHVHUyb0xWazVJ?=
 =?utf-8?B?VUYrNUNvZ1Rnb0Z1amxzL0Vlcyt0Vm1ldjVqM3NCWTNqcWFLZ0gzeU0rSUt2?=
 =?utf-8?B?OXFXemFHcHBLWm5PamJNRCtYNklSUzNNY2k2M0kyMUZJSjV4VlcxSkdVZktR?=
 =?utf-8?B?K1dqRit1eUtwMVhUZC9aUVdUNC9sR0tWQkNZVEV4aVFsbU1aanlYSFBsbjRP?=
 =?utf-8?B?bzdCMUorazc0UVVZb01lMFRHZGQ3aStzcFdtdWdSeHBHaWhvQlY4R1VNL1BD?=
 =?utf-8?B?cStVVkdFWVNBeUVoT3RYQ2FmeTFSWTJVYm1KNWtTOEJlRytKUDdjUnhQL0N1?=
 =?utf-8?B?VGJlVURjcGdVdG5vcWh0ampjellYbjhGa01QZEJRdUNNczcreXVQa1RoTzFi?=
 =?utf-8?B?c2NUMktPR0JHSVY2UEIwdE1sbW85UXR3QnNuQ25VWmNFdGh5NVErOWhqV2VX?=
 =?utf-8?B?U1RrUCtyRkI1MkQxTWxMNjFQbmxMcVRJcmZDUVUwMkgrK29IenFVYlVIb3hZ?=
 =?utf-8?B?MjVQcW9BVHhaUDl1RUg2KzBmWWlOeXJhTjFkbnJBOEpFM3lKeVBqQzRBK0Q2?=
 =?utf-8?B?cGd5L1M1VE13Mlhzb2IzVWdFT3Ixa3gxa0Znd3dQeXlQalBQU1JYR2E3ZEdh?=
 =?utf-8?B?N3Fma1ZsU1RFWnVwMmVBN0gycHZMT2R3dUQrNSs2TnVzRHIweXRWQXBoeVZs?=
 =?utf-8?B?QThka3llaUVOeHRxeHowNlk4UkxJWU90RW9wMmhRS1pGRk5wWEo1cUFGS3FC?=
 =?utf-8?B?L3VPVklQZFgwZzZwS00zMGhEOU9sL1BsNUlFRTBtMS90NVNlNGNZWXBEeUNM?=
 =?utf-8?B?c095YmcxejN3d0ZoaFNHRU9xOHVleXp2amlBTDRyRXlTN253RFh1UDJ6N08v?=
 =?utf-8?B?Sk84eWxoalB0L05yWTBXdkNoRTNVMWR0UVRKTmpybzMySWlxcDZ5V2VUeGw5?=
 =?utf-8?B?MExLajlmYnl5RlRFSDBiZEgrQnVIbmFUSmRncTRoZGZaTndSWHFDMTRCNlht?=
 =?utf-8?B?RHlQbEZQaGs5ME13TUFMNXUveHFHTHBSTU1Xak9INjRRN3BhVEdnYkZyZDNJ?=
 =?utf-8?B?b3pHM2tXRDg0cVAyYW1MeHNPa1JJUzZTc1NjZzAxSXFET1BrWDZ1UVFTYjVV?=
 =?utf-8?B?TnJvNHJBUE4rVlBkOVRrMG5uSTUyQ0oxM1M4WjBNZk1RUkQzNHNJb3JOa01k?=
 =?utf-8?B?cXB6OW1ybmFJNlViMkFWNURadHdnSURxUmIyRmtKV0p1bm1RYk5RQm44QVFm?=
 =?utf-8?B?RVozZXV4dmRCTitlTG1vV2I0clV3anFFZnRVd2RORTFQVDRxMm5JQTY4Q1E2?=
 =?utf-8?B?TnhvYWVkZWt3WGh4WTNYNG1Gc21tVzk4Vm82bFY1Q0NpS2lQcTB0aFRJREF6?=
 =?utf-8?B?dmtmWW1YZ3JaYUx2dnlQKzZUSTNJbjdhaGJ4bkxZd1BjNG9hR0lCQXBrdDZE?=
 =?utf-8?B?eVJVMzE1VFIrWkZCNjM4REtNRm1ES280bFVXYmNqY3FyYWUzNVVEYWEwckEy?=
 =?utf-8?B?Y2tHUno1QmltN0ZzVWlsWHJRNi9CQVFNYlBleU5LYWJsUDJ3bEhWUzVpS1Bi?=
 =?utf-8?B?UjE3ZFBuZ2FDQm4yMDhrQzBTQTEwMFR5NERmRjBRVmF0SWRxSEhHL21sbGVv?=
 =?utf-8?B?ZjBXL1M4WUk0aHJydjMzRUhBQ3R0M0VlUURmVC93bTdVeXRGS0FxckdCNHNU?=
 =?utf-8?B?M3g5WHR0cHFoTTVDMFNWMStGVkJXSllqWm5JbGU3eDJXUzN6S09wM1Y0aHJk?=
 =?utf-8?B?cFUyVHhxeXoyYXhKazFzTzdZblpKZGJyWC9VU2JkcEFGVWszN2Q3ZWs3ZnhY?=
 =?utf-8?B?RW5ZUnhvb0JjNlV5Qm5HK1ArN1ozN0tSMmVzcC9LZ0oyTDljbmoxdTk1U284?=
 =?utf-8?B?WlludDBYZnBxV1hPVGxsNlhTUlFlNXIwakRWbVpQc1UzcUtNUUFmRDdCTTVm?=
 =?utf-8?B?T3BOb3d0YU9scHFrYXRrYUFmOW5RLzVUN3dSM3I5RTB4N2xRM3llYnBmajdi?=
 =?utf-8?B?bXAzNk03WGc2QmExdWZYZGpTU2hOdS90NisraUJNTWZKa0srZzZCRXozVHNT?=
 =?utf-8?B?cHpiNU5qRUJLN1NDcHdYWTJLYnJ6TzE0Y2tUK0lUNkEzMnZzcmhIV3pqTjhs?=
 =?utf-8?B?bGRlUStkNmJRRmgvL2dGSGtoaWZiaWF4elpKK2laUUdLZjVBdzN1ejMyQTdw?=
 =?utf-8?B?OXlSNkRRcjdKRzFEQ25iTklTN2FRa1RFWWh0NERTT0orN04vRzdjeWtJcCtO?=
 =?utf-8?B?U1VJTm9VTzZvMENZQWEwOEJmejNwVU9jTHBielZvVUp1L0FTV3ZoQ1ozbGY3?=
 =?utf-8?B?aHUraHpwNm9ndEJQNUZlbEZ6ZkhrZVlWSnphMEI4ZnNGYkxZc0pUQmZJalA4?=
 =?utf-8?Q?cLrkSv4j0JNYpOT0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f976823a-fd1f-447d-2128-08deb7e278f8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 09:14:05.4806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mZJBf8J37OmSHZmLmZL13ezaI72b0izSL7ZYXH4A5VkzibP6MqvmFPSKQjFl66XJIUwu+FmRG/6wSHbIxEBgXJyfP6UAuo/ALK6BFhMIuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5524
X-purgate-ID: tlsNG-c201ff/1779441249-D877A443-6C8D0F3A/0/0
X-purgate-type: clean
X-purgate-size: 3254
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B739A5B0F71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 12:57 PM, Jan Beulich wrote:
> On 21.05.2026 12:12, Ross Lagerwall wrote:
>> On 5/19/26 10:49 AM, Jan Beulich wrote:
>>> On 18.05.2026 15:14, Ross Lagerwall wrote:
>>>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>>>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>>>> @@ -851,6 +851,35 @@ static inline void hvm_sync_pir_to_irr(struct vcpu *v)
>>>>            alternative_vcall(hvm_funcs.sync_pir_to_irr, v);
>>>>    }
>>>>    
>>>> +/*
>>>> + * Encoding for svm_get_insn_len().  We take X86EMUL_OPC() for the main
>>>> + * opcode, shifted left to make room for the ModRM byte.
>>>
>>> With all of this moved, the comment wants adjusting, at the very least by
>>> putting "e.g." in front of the function name.
>>>
>>>> + * The Grp7 instructions have their ModRM byte expressed in octal for easier
>>>> + * cross referencing with the opcode extension table.
>>>> + */
>>>> +#define INSTR_ENC(opc, modrm) (((opc) << 8) | (modrm))
>>>> +
>>>> +#define INSTR_PAUSE      INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
>>>> +#define INSTR_INT3       INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
>>>> +#define INSTR_ICEBP      INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
>>>> +#define INSTR_HLT        INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
>>>> +#define INSTR_XSETBV     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321) /* octal-ok */
>>>> +#define INSTR_VMRUN      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330) /* octal-ok */
>>>> +#define INSTR_VMCALL     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331) /* octal-ok */
>>>> +#define INSTR_VMLOAD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332) /* octal-ok */
>>>> +#define INSTR_VMSAVE     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333) /* octal-ok */
>>>> +#define INSTR_STGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334) /* octal-ok */
>>>> +#define INSTR_CLGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335) /* octal-ok */
>>>> +#define INSTR_INVLPGA    INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337) /* octal-ok */
>>>> +#define INSTR_RDTSCP     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371) /* octal-ok */
>>>> +#define INSTR_INVD       INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
>>>> +#define INSTR_WBINVD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
>>>> +#define INSTR_WRMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x30), 0)
>>>> +#define INSTR_RDTSC      INSTR_ENC(X86EMUL_OPC(0x0f, 0x31), 0)
>>>> +#define INSTR_RDMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x32), 0)
>>>> +#define INSTR_CPUID      INSTR_ENC(X86EMUL_OPC(0x0f, 0xa2), 0)
>>>> +
>>>>    #else  /* CONFIG_HVM */
>>>
>>> I further wonder whether putting this in hvm.h is a good idea. Is there
>>> anything wrong with using a brand new header, e.g. instr-enc.h?
>>
>> No objection to that. I do wonder though if using the instruction encoding like
>> this is the best way of passing through the instruction to the fast path in
>> hvm_emulate_one_ctxt() since I think in some cases the instruction encoding
>> may not match the actual instruction that triggered the VMEXIT.
> 
> Do you have an example? If so, that would indeed be at risk of being misleading
> or actively confusing. (Of course INSTR_VMCALL wants renaming, as was already
> suggested.)
> 

VMEXIT_CR0_READ may be triggered by MOV-from-CR or SMSW. There are probably
other examples...

Ross

