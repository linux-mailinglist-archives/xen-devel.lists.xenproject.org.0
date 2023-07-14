Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91369753846
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 12:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563560.880824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKG9r-0004Dv-32; Fri, 14 Jul 2023 10:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563560.880824; Fri, 14 Jul 2023 10:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKG9r-0004BT-0E; Fri, 14 Jul 2023 10:36:19 +0000
Received: by outflank-mailman (input) for mailman id 563560;
 Fri, 14 Jul 2023 10:36:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZ6j=DA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qKG9p-0004BN-86
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 10:36:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4256fcae-2232-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 12:36:15 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM8PR04MB7985.eurprd04.prod.outlook.com (2603:10a6:20b:234::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 10:36:13 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Fri, 14 Jul 2023
 10:36:13 +0000
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
X-Inumbo-ID: 4256fcae-2232-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxBL9k1guvJu+LE4HgQJuH1nCDfgEAG39UvHcnkg6cTP2ZDhAk03aX6WX7Mf5iUCkjg0EoOaX2JlR2yuY/0154Y15r0mr6zy5fJRaxI/noLhklhPcZvm9u9utaoKYhzTR5vKAQbPSyBMUlq2bMFuLGW1xBiAqsixaBm/46NbXArf2EfB9V03R+gojT3LzCPnZDiAGmtLYNi0nBPCmUYBYACIdQy4zbj4a21Vu9VzJzChmaV6Om2q5n/HjYQ3KocYl6al/5+Z6zCerV2Eo/aRY48XhnwJnlDOjqqiCvxdPf9jAXynoPMNXuf3O7CzZ3Z1dy+tVPoNMhWn7ZvQxbkGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+RaykPCRbdgeRyXofqTtk73lNViHXDMglaAipBLksg=;
 b=OTb6E3XgwXDU2Pfo3jjkMQY1AA1G8Nzux1Rq+203X8wD1jTjEzPPSpeE/I2y5/Kz3IqjyikHsSaRoCoP7zgAEVdJwPjhe5yYcRtkTxqw48iy6eh9XGiVQcpSmsOBwPrsQe/RSsMNg+PpF/9S97HbyXQcXmr861GlZtwfG6DkTSKEix0kjd92r4xKJr45oDR80QX482paRnt/wjOEQb1P1JyQwsIQd3SN9KBWYQLH0EhqToVPGs5K0+m/RdcaJXXGHX5cRTQhRuQgQfxJuUrgUYHe3qNJ2ZZxpK3RX8Kapew+Nc4ha/49JxKHq3JflIQ1ruWvW5ZBQNn7ZGGtAOITfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+RaykPCRbdgeRyXofqTtk73lNViHXDMglaAipBLksg=;
 b=dTryznHbDOabxCjDWqef6VHq0qVsF5LJaPx0+M2KPlMmb9WbbbiCZWtl/HrEEtZpEBBt9r61AIIQjuLBWwoyw4LDyZrv7oI1ziVo8iI/NxkYyVFZ7DIQZ3fOu6uQ1rr6s3oytirrEhTIr7EI6VCsbjfaOcUuQM1rnCeIahJjg4G9BUxbZa/eHNyMLZMibl4SvFpu2vZMk8qzArwZj0jVHFoKmLXUS2D7AkAc8Oyrer4XnbYZ8yAEJCZwDhZQR7Xv5iGb0lM3xm5mkjKzNLyjx6Zd3gEyt0ujJPZ284sIUNd8dadA5Xzk6l8teQ/NdNTHrzYm61WIuV1ptNZsAJ+Eng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6519818f-d31e-d588-6613-3671cc7427d4@suse.com>
Date: Fri, 14 Jul 2023 12:36:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] mm/pdx: Add comments throughout the codebase for pdx
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230707160759.12132-1-alejandro.vallejo@cloud.com>
 <646ce8b8-7a8c-88c1-2b1e-76a721e6f164@suse.com>
 <64b1232a.050a0220.898b.6177@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64b1232a.050a0220.898b.6177@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM8PR04MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e34685-aeb2-453e-a2fc-08db84562540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vYA0mfBvMMsNk7ZpGpqFfnVhDwZkWMdbiWto6QV21BQVrAQOiJzXMd3AvI4GhRqDPsr38/FO5P12ggq661VNQlB2M4yP3OiKTUumaAfSP3o8dlqGf8RT5RMsEEYdYWOdxqWUbki5NbyaVJLeaz35lZCR9WXWxALJ6sfsE/geBqq83WMqfPQAIlMTlbW/Z4PPzUOrXR9QB57u8uh1D+xizJYmZsgWBFnvZTcWHd5Di0W2ym5R3EQt+VFsj2QgYm5+w2wduPPaSTBHmrWxgniClpd/M8d+XbHqk4cKJUxA/bXOUfMeejckW2KnOOz99JDbAf1YxXV5I/nwYhJ0+gZ1dC29oha/gMbtGeW93PI83keBCE0xPL/tR+gcg7e2UTtdhGyVzAC1uQf5c2AB85/GfM8uKfp3D3sknpomsviGpx5WZ/KbKNbsKa0NAKrRGlT4y4Q197g+bc2Ns4qZ7i1xdgdq8lkgPFtlu4CPAB2YKlweN7okpL2od3KYhbknV61qbf7xVk3TvNslN/eBGy5Kewmju/h3UYxwhHED5vGQhgakgWRtXQACQ2R8zH9WoWlGWbYf4Mc9ri6fZJI3kHmNZiHQQYMxc2YHlfw4fR4kHUrfzTW35PGHpS+5nm3qVeChciWX7xbG1MtFon85MtzFqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(31686004)(66899021)(2906002)(478600001)(54906003)(6486002)(8676002)(8936002)(36756003)(66946007)(66556008)(4326008)(316002)(41300700001)(6916009)(66476007)(6512007)(38100700002)(186003)(31696002)(5660300002)(6506007)(2616005)(86362001)(53546011)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDRpaEtvcjNBMDVwRE14TnJLMzFTS0s3RFZQVnJIMEFQQ0Q5NWNkRDdvUUdF?=
 =?utf-8?B?bzBRYkVYY0FNWDJvZGNpVGJKRWpMMkRSNUxHaUhDOUdoSDU1WjdkMTErMVlh?=
 =?utf-8?B?MnFCWVE4UmlsdCtsdGlSTGpaTWc0K2ZuOVV4MUhYa3hOMXJaMXROeldLWFox?=
 =?utf-8?B?dVNXVnJDY2dXaXE1Lyt4TXlZS1M3TW1tSU1GdUlibFd2OFJLRXdDeW15ZmhM?=
 =?utf-8?B?dzFNY0RjdGxPbEFwQWc5OGhCcjExUFhuWXN2Wm9tZlh6N0gyMmEwbUp1TVcv?=
 =?utf-8?B?dzFvMlNnc0NTUWVieXdIK2JDVjkzY0o3cnEwVWQxdTU0dDhoTFpVeEpUcklM?=
 =?utf-8?B?ZlQ4ZG56QWpWUWVwdWtYUFUvSEMvZ3JSb2xrTzhPMUZkbDNaMlNkbng4Y0Er?=
 =?utf-8?B?ZUxCU2N3S2F4SXUyOWd3akE2TTRDaTVzcXhQcDdUZXZDcndiL21iZ1U1UTF5?=
 =?utf-8?B?WWNuZ0tZSUhXc2VtRWE0U1gvdWwzRkc2UVVoaTVCSVRsWWlxWU5jUmgvSm5y?=
 =?utf-8?B?ZDMzRVloVkJQUXdvSVZ0a2hubmxwMDhETHNYbUFOTmFsWUxjcGdKNU5HL3cw?=
 =?utf-8?B?WEQ5dTZWT0RCTjBCVUxvRTZMRDV4d20xdEhoMWgzYURhKytaUTVWSS8zNEdo?=
 =?utf-8?B?ZlJVVU9HbWJrM0VURWx5d0hmOXZ4Wnl0UVozQm8xME95SGdKVitMK1FGVGt3?=
 =?utf-8?B?aGxNSUVGaEtacE1lc1hFR3RaemJ5TENhd2p4amNKeDNjK3kyNnV6Y2NvZ0N3?=
 =?utf-8?B?U3RBZkVVRFpGcTZPaUxWZngvMENHTXlWbGY4VzZOZm10WmNhWGNEYXNxQlhv?=
 =?utf-8?B?Tm9mamNoVE5hRDR5Q2NsTWZKUHo4UkViV2VIMUMxWnp0MXhnTUZ4UlhtWWxC?=
 =?utf-8?B?OEp1RDBQMjBUWXRPUjZqS2JOZXlCTzlsTS9iRWdQS3JKa2UyMVZvb1AvaC8y?=
 =?utf-8?B?VjFWRmcxRzFaUTBxWlBTYzJHRk9vbE9PRSsxdXh3Nkw0OTBpZVQzbGNUcThs?=
 =?utf-8?B?SHNhT2ZXY3dQcmo3aVpFZUZYcG4rMXhCQ1FvL1hPU3FsYld4V1BlT0F6ZFoz?=
 =?utf-8?B?TUZnMkFsQVJGcVl1K2Q2dmlTNWhOc1NXTWpTTHRKRTRhUUVmU3JuMG9FSlRz?=
 =?utf-8?B?Q25naFBEMHJNZ01KVXBwWjBpTng0UHpoZU9DMzZIdFp0UkhNRGp6RkFOYmEv?=
 =?utf-8?B?Vm1Ta2hxdDAzaWtBaVhRVU8yUG1uUG1tL2VLNkpTM0ZDeTFjYmV1ZFIzY2Fs?=
 =?utf-8?B?STNDY1Jtc2xxc0NveVNwSTQxRllLNEMvblA4RjJzQkwrR1pmQWZHNUFIWTVn?=
 =?utf-8?B?Tjl2bXpUTTNleE80TDZZM1JJWVdidTJDNFhnaVBQL1czRjNwQnBzRklHRm50?=
 =?utf-8?B?dFBiRmFUNnhLS3k5RDE1bGZnZjdjTDQxcDBLcWZyMHhiREhpV0k3WWNaS2Iz?=
 =?utf-8?B?T0dVQU5VenlEV1pxME5XdUN2NmlQZlJmTmJTRTBlcmhMTWR2aFBxUjBZYVJL?=
 =?utf-8?B?WmVKVExvVmNObXZ5M3lBcFlBK21NZ2ZqNnJOWnJYUEFoZTZCdXV6M2JnWnhj?=
 =?utf-8?B?dm4zT0RUcEphdW5OZlZQK2licFhrN0FJQ3N3YXIrVklabThsNUI0WVZtWUg0?=
 =?utf-8?B?OURFbzFEZmc4b05JS2hmRkdCVGtUcW42cHVhdXBnREZaLzk5aklBQ1A4aDR3?=
 =?utf-8?B?TEhCa05tMjY1YjI0YS9qYVFOSFZCaVpQWnYyNG1TSzNWUTdvN3FlZ3lPaUw1?=
 =?utf-8?B?cGFldzM2THI3VW9KUyt3OGlwOGtaVE5lQis2Q3NxeFdVZFdDcXNKZzV2WmhL?=
 =?utf-8?B?UGQ2dzFxbm9xVXM0SWl3azhkY0VLQ1AzZVRtazUwOSsrVkpHbWJ4NzZKV2Ix?=
 =?utf-8?B?d25zWWxacUdMODlQekRaRlA0NW5WV3kwekNTN0d0V1dTMXN2Q2UwbzhGVEVl?=
 =?utf-8?B?WVorVGJINnpzd2REc1pxeTBhcHdQSW5aTHp4T1ZHTVNnR2FRTnpyTmxTWFZs?=
 =?utf-8?B?ejhEQjFwZ2FIbHZIUWRvMHdkTHZtaHNOTFZ2SVE5VGthNkx5cXpuQ0JwSHVx?=
 =?utf-8?B?dGNKeWhVRG1xclMwZzVVVUhQbXU0M2R5UGRFZWlYc0J6d0hRb0plWjdENjVJ?=
 =?utf-8?Q?CKyc01hWVvgSTo9gTcVxmkElm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e34685-aeb2-453e-a2fc-08db84562540
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 10:36:13.1546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TGbo79O6P9O5vlzdooii2dPHFMfnXPN0th9qW34KgWjOxRiPo940Aw4bmpZ7r0gvaKXxNEHfyzdQjtDr6Yraw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7985

On 14.07.2023 12:27, Alejandro Vallejo wrote:
> On Thu, Jul 13, 2023 at 05:12:09PM +0200, Jan Beulich wrote:
>> On 07.07.2023 18:07, Alejandro Vallejo wrote:
>>> --- a/xen/include/xen/mm.h
>>> +++ b/xen/include/xen/mm.h
>>> @@ -31,6 +31,17 @@
>>>   *   (i.e. all devices assigned to) a guest share a single DMA address space
>>>   *   and, by default, Xen will ensure dfn == pfn.
>>>   *
>>> + * pdx: Page InDeX
>>> + *   Indices into the frame table holding the per-page's book-keeping
>>> + *   metadata. A compression scheme may be used, so there's a possibly non
>>> + *   identity mapping between valid(mfn) <-> valid(pdx). See the comments
>>> + *   in pdx.c for an in-depth explanation of that mapping. This also has a
>>> + *   knock-on effect on the directmap, as "compressed" pfns have no
>>> + *   corresponding mapped frames.
>>
>> Didn't you mean to keep the directmap part optional,
> I did.
> 
>> which would call for saying "may" here (twice)?
> That paragraph as-is doesn't really mandate a directmap. It merely state
> that there are knock-on effects on directmap indexing, not that there's
> always a directmap to index.
> 
>> Yet then ...
>>
>>
>>> --- a/xen/include/xen/pdx.h
>>> +++ b/xen/include/xen/pdx.h
>>> @@ -1,6 +1,73 @@
>>>  #ifndef __XEN_PDX_H__
>>>  #define __XEN_PDX_H__
>>>  
>>> +/*
>>> + * PDX (Page inDeX)
>>> + *
>>> + * This file deals with optimisations pertaining to frame table and
>>> + * directmap indexing, A pdx is an index into the frame table, which
>>> + * typically also means an index into the directmap[1]. However, having an
>>> + * identity relationship between mfn and pdx could waste copious amounts of
>>> + * memory in empty frame table entries and page tables. There are some
>>> + * techniques to bring memory wastage down.
>>> + *
>>> + * [1] Some ports apply further modifications to a pdx before indexing the
>>> + *     directmap. This doesn't change the fact that the same compression
>>> + *     present in the frame table is also present in the directmap
>>> + *     whenever said map is present.
>>
>> .. you mention it here as non-optional as well. Didn't you tell me that
>> Arm doesn't use compressed indexes into the directmap?
>>
>> Jan
> 
> The [1] note states "whenever said map is present", meaning that it may not
> be present. Saying it's optional is a stretch though. It's not like we can
> choose right now.
> 
>> Didn't you tell me that Arm doesn't use compressed indexes into the directmap?
> arm32 doesn't have a directmap at all. arm64 uses biased pdx as indices
> (they are offset by a constant), so they are still subject to compression.

Hmm, then our understanding of "optional" was differing: I understood
"use of compressed indexes is optional", when you apparently meant
"the use of a directmap is optional". If this is the case, then I
agree with the chosen wording. (Nevertheless using the suggested "may"
wouldn't yield and incorrect outcome.)

Jan

