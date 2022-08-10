Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6DA58E7A0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 09:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383407.618573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLfrV-00055V-JB; Wed, 10 Aug 2022 07:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383407.618573; Wed, 10 Aug 2022 07:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLfrV-00053Q-Fy; Wed, 10 Aug 2022 07:10:41 +0000
Received: by outflank-mailman (input) for mailman id 383407;
 Wed, 10 Aug 2022 07:10:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vQbV=YO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLfrT-00053I-Su
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 07:10:39 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130079.outbound.protection.outlook.com [40.107.13.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 898e7ada-187b-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 09:10:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5405.eurprd04.prod.outlook.com (2603:10a6:803:d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21; Wed, 10 Aug
 2022 07:10:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 10 Aug 2022
 07:10:35 +0000
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
X-Inumbo-ID: 898e7ada-187b-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nU8qHy7FJ9nkTItK+6vk0i5YVxL4vYnH6chSdxgmYiqYjiNIqgKBz8ukOPADBoI6QG+GAElD+YXdVvVxE7G9WubzFhRFN1Soguyws8bJ3CpDm7h9NGJEMVHZPIhhRx7wGxPSsEu++8kVo4WMGBaE4pAF5tf+FwCX4VPXGoqZwH/UIZCRuuYVXJkiTVjUL14Mid+rzhMlm1R/h+SzGAbMKj0cfPRuCrY8ld3eWmAJ7Pw6ReUJYx56y7yT732KS0myfNclm5/wkQbJ6UA3iPzOpmNnrs6AwcqEKGKLoxs6qFaIrbY6LGDJM9qqSWEO4wdZswcoT0oGdW2B7RsZT2qfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOKjV8PwDXsbXnXM2KUxg293fjuhA015i6GA5Bq9058=;
 b=VX7CFb/Cb1uDYSp6CJjq8F6KgzpTXm8MUqWuEem+gzzEVk+cFrieYOamuonu7RhD0L3KuouR6Y8M5gxX69Gd50VoNztJr8x9PK+vT6ZX5iCxaRlcc2n4op/JDSnqjR1J2+VJa5aCTmN9zKcYK+pPrwP3BUGmIVUwk/uId+ceLliOKcdJUOV64t39nRcJuemE8X4WGeRDwmNln3D4Hz+sOytMeQhvvhmp4O30A5kr4ViDLiQDHUYpdsPSp4lqDsk3O2wjc4wMIGQ5cak6O3sYhCY/mWIecatLCNzSEmer3qOShYRwy8BQEDBxjr7iGnr1pLqoYAGXn78HVTy89I9qdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOKjV8PwDXsbXnXM2KUxg293fjuhA015i6GA5Bq9058=;
 b=LXzOmGHH7eNWXQTlPAP/aTntlzCjyyBXJhT4uQM3vf0leFfWz6OqzdCJZ/dSak5FjvmmstwZkVi1VD6bhMmuQQ3yn12jkJ3u43SWohxbhI5eHlOel0PT5kt/YJOYknWa6NA5ty9Y+krNSDD7CCwSFa+0as0HLohimin8FKA4HaN0hTUqQrlVqmOPlARLF8wYPXB+5x8vMeWnpm9zGBvPJmBX75Qs3z/Jhi57VhDAyYw8SVXTbjJypSa+KvO6FTh/3tg/2qQTo8oKy+z45AdabgbTBkIJNPorzQsWLEHYwhC2oKlwAkV9ZEbcep/pejb5YKwtx0etWLv3zYkj+zcatQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97ed879f-9b2e-a1d6-ca89-e98081f90cab@suse.com>
Date: Wed, 10 Aug 2022 09:10:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] x86/spec-ctrl: Enumeration for PBRSB_NO
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220809170016.25148-1-andrew.cooper3@citrix.com>
 <20220809170016.25148-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220809170016.25148-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4af6ef7-c1f2-49ab-8986-08da7a9f6b7e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5405:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SQmNsaIdoIfjneFNgU0FMmLKkqLvXpwjlA8eJDJrjjypAlbkgACGNJ1y88q1bV/awIR3JBWjA3TIQgs4IbndUH6ig+jHCgJ9+lPgYAofmFXitypRade1mVT4ceHOMfeT8RXcG45BX8XE+jjl6C9PpdeDirqsfAGyAYrcHEgTpeQEfo4oAEGYh//Ed0sUFFXzRl2pwZetIusBiDXjo11xsofPlUgGgdkHwCZEJooU774VI+hMkf0ooSppwDp9uDWbzKaEx6m3QCOS/wGfZ/ilaVWCkKvKSWq7/MdNGDo2upVKaUDdrbKsVlKOgE27O0v2I4CY6H2qA+22lviQO1ugsCHzV3+9L3/Kcng6Ql0y9VQhVlgF05M+1bgv6/ua5INdeZefyVFzmuZQrUxW9/swZOWNwqrh2RUxay/JKIJdcuJ+Js7hR6MJHLwnacyAkcfAIkACTSB0xUZvHeRiXS5z1QeBJjSoQ2bh0khicCuc8ZYkpmf5EQaxDcjuNl4+AEDCf/3/02HDVzfpccbLZzetVz+Z6HXTtEwZ11vYujnUML91LbM16AKCx+XVE+jyxgjCOis2M9X3g0UDTe5CltWXnO+wnqOcxcvISdCkFmRQXeJf5gXdiXeiLEicm/I7dhbR+iSF90GC0uE1V/IhGsmf5bPOV4SvKel2VUNy16CJV8Z30gyLP4Tqjfh74sB/Bw5AuRS5u3IfEn1eACcwQF8fVn99AgI0/vKk7IRrq7Q3NhdWubtkImxEMYV3YMZlz2/p93aJDxmCh8EhnakYHxEuq7JoLUzedXbHACYN4E1bJY/zaIb7nwZ8s/Av1BGlNW0GPkafA74U/1E5Yhcg6G5VEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(346002)(39860400002)(136003)(31696002)(2906002)(8676002)(31686004)(66946007)(558084003)(4326008)(186003)(66556008)(5660300002)(66476007)(86362001)(316002)(8936002)(6916009)(36756003)(54906003)(41300700001)(6506007)(6512007)(53546011)(478600001)(26005)(6486002)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEF5UldUODE4RmM5SFVUWkROZCtXdzB2WE5nbldRYVhIQ2J3QTlIOWF3L2VC?=
 =?utf-8?B?QkVOOFRyN29QaDJUNzRyUHBZVFJWRERZTlFPRjBIWkdMZXkvMmVUZG1CTmFC?=
 =?utf-8?B?VUZKRW02VXlVQWR3OGNPc0lGMHZLa1VUZlVQVE5vRjhPb1FhZDJpc3hMbHZH?=
 =?utf-8?B?bFpweC91UFhrM1NhRWV3K05WNDBkek9xeWV5RHpIbnY2aWszcmNpZnNJTWVp?=
 =?utf-8?B?RlhCOXVnak9KbG9tM1JyYWcrYnI1S0JvRzdVQ1dXYkM0M08rVGJISXdUK0lk?=
 =?utf-8?B?d3BRbVdldnhKUHlYOFVZSXZhbzJYQ0tGcWhGaGF0eEc5OHE5MHBNMVBCRzZm?=
 =?utf-8?B?ZFBWMGQ1bkhqVko3dlRhSXBqbzd5OU5iMHlVYzh2QU5vYmxCSmtvdEVGcUc1?=
 =?utf-8?B?R2xaQ1hiWEsxMnFmZHgraGtNQjFCcDE1TXNHNmN0cXFGVUtwS3BMeGcvcThu?=
 =?utf-8?B?WXhURlNDdHpPUWx0NEdPWlp2dUR4d2FvYW9iaHNWNlpBcUZKeW82RkxsVHB3?=
 =?utf-8?B?bVJTMFI1NEpHMnhJTW1ZcS9jWm9DVC9LTkp5ZDRKVzF0aFJPQmZ6czZWeHVO?=
 =?utf-8?B?TzJtNVRRV080aElNblZuMHg1VHFUS0dWUGtYYlF0RkVMeDZSaTZDd3JESEpT?=
 =?utf-8?B?M1BUQUVMNkw1aUFVR2N0V1hNS2VtWncrdzN5RmhJS0tNQVhBazNzbCt5NFdv?=
 =?utf-8?B?Ni95WDFLYldtVXpWUjNRSHZMWEZQTWNPVHVyMXNCbU96S3kxOWp1M1BKYUhj?=
 =?utf-8?B?cGJoWXJiYndOS05WamN6S3Q3VzRYRlpRZk0rMkpaRFpvdW1raEh1V3RpL2VE?=
 =?utf-8?B?cFhHSkdjWHJ3VTJzR2lxVlRWcjRpR0hNSFN4azBGWW9aOEF5aXNJdGNBaGQr?=
 =?utf-8?B?b1Y4bVFScnJZYjhxU1RPbktvanlJSER3TjdoK0h2NE0xQzhNaDhFUW1LbXZN?=
 =?utf-8?B?UnFSTmduOU5RSlR5NDFSQUNUWFRCNWZ0TXI2MEVSM0puamM2SVQrbExCNDU3?=
 =?utf-8?B?cjdxc2lScFkwQUpoanBzWGRZT3g0cE55Y2NuVi95dHJpMmM2elZmTmVib1pP?=
 =?utf-8?B?Yk5zdGlLbWg4ZnVPOVdOQkFneHFoV240S3pFQTBOb1dvcW81UnRWbjJPQWtx?=
 =?utf-8?B?bVY5aHkzOW1UZHVEbjRMZFgwSkIwN0ZBWThCait6MWtleXltaVpkVXlIaUlS?=
 =?utf-8?B?UW9FZTd5VElpR3MyYlhUQjFKSlhEZ0pibG9BeW5WKytRSVdxT0NiUWk4Mmd6?=
 =?utf-8?B?cm9RRVVTSWYyUTFDeCtyQmFxb0U1ZlBZemtRM1g5TXdkRW4weUdLNHFKTEZJ?=
 =?utf-8?B?aEFYekdxZk56MmhNeDZZR0RsRlZBdmRSNllheThESUtLTDZMU0F0RnZpVUdY?=
 =?utf-8?B?d3RiTE9qWVBhcVJwL3pUSnJXR081bFlzbzc2dlpxeXh4THNqVVRwWXF3Rkk3?=
 =?utf-8?B?dUExSUVLbjd6WTQ1Y01jMW1RQzBFc1U5S0p4ZHQzVjFKczhMM0E0aEdyK1ZK?=
 =?utf-8?B?RFlFS0VBUkFWSWdCaFY5L0xaWjFUSEF3ZGV0Z1VPY2g0cnEva0IvVnZOKzZp?=
 =?utf-8?B?cWxLUVdXNVlxZzZkVDNsbVVLNXdXcUVCVkI0aVA0Y0psSFBia0I5dUpwcVQz?=
 =?utf-8?B?L0hnMVd0Q042WHFFYm1aZlNSQVBwd0dZKy9GSmhYL1N4eGNuR1FQdDNIOVht?=
 =?utf-8?B?TCtXckVHc2Q0eVBaQXByQSsrb0FESTAzRDhZR2NIb212L3BFbExuZkw2SkxK?=
 =?utf-8?B?Qml0c09jZmI2THlUTFBaZCs0eUc4L0hJdElHTFJkNU9oZDhzdXUvb0NRZ2o3?=
 =?utf-8?B?ZmVIcldVL3dQTmR6Ui9xZk80N1VsUE41YkZIVlBESHlUdWR5K3h4VEk0ekQy?=
 =?utf-8?B?VUpJaTViU2RrWmtXdEczYWRjd0VGemdyWHovcEthN2I5aVVmZGlkSHNqSkwr?=
 =?utf-8?B?SUxHbU1IVk9CSFlyWFpTTllaWEgvMkg0ZlVNU1EvVVVRaGdoYnU0VlVOVmJ0?=
 =?utf-8?B?aSs1cG1tRHdEYmV1aWZGUUprUENuWlRUWmRRaXkwZGhBOTVMOEZHaFkvK2dP?=
 =?utf-8?B?Um5xeDdJTHhWSmhOcnFpN0hIb0ZBV2NvbWQ3Y0tOVnY0bHJ3eURvWlN4WEdP?=
 =?utf-8?Q?K//50g18pc8XuI/xyHCtjkRe6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4af6ef7-c1f2-49ab-8986-08da7a9f6b7e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 07:10:34.9752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGvsulwbixgh+YGpx+QcrZDL8Fe9mHWoqP0pEPGMn3jUQbrm5Pi+nzn8QEmC7b/AqK0tfuedrSPMeTJWbXnkaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5405

On 09.08.2022 19:00, Andrew Cooper wrote:
> The PBRSB_NO bit indicates that the CPU is not vulnerable to the Post-Barrier
> RSB speculative vulnerability.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


