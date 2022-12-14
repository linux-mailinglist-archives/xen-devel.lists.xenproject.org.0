Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C6F64C755
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 11:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462050.720218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5PFS-0003QE-QF; Wed, 14 Dec 2022 10:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462050.720218; Wed, 14 Dec 2022 10:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5PFS-0003Mn-NF; Wed, 14 Dec 2022 10:44:26 +0000
Received: by outflank-mailman (input) for mailman id 462050;
 Wed, 14 Dec 2022 10:44:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5PFR-0002sh-TA
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 10:44:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46b1ddf9-7b9c-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 11:44:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7915.eurprd04.prod.outlook.com (2603:10a6:10:1ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 14 Dec
 2022 10:44:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 10:44:23 +0000
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
X-Inumbo-ID: 46b1ddf9-7b9c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aviHrQG6yPNmHIOatBltcl8YMKk7VBoY0n3mM85Cv3B/9hdYJb/UeocWkE4CsgurQDhKzzoCbW1KefaeYPbfnsgIMkLIX6/d746R8M+xEEbJTjWQoKAXIujYD81YwtRpOA6GYnbfMlnao4Xe8zgzB9dAK5CDG6n6MflLDCoROisAxOR0w143qrDz+iJNWB/3wqafONQbUkZ42XfcRum6XaCVXQNKqRQGzKJNsHpbASUxWsz5qUKLlAVkTmICKATDKov7kqQHTvB0TVcZcR+v862fE5E+KXP1MnbZ82r0kZizCzxJoebkYDYSaI0ZA9p5opi9SY/ZOP99BDWb62b1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fdp8Xs7GrHwvTtEpIJkSGlMjTOZrewPWiwBJ4NmCM7o=;
 b=HKs3XPl2e9acWxluxVGSfD5JQM4D+7PL/epuvPUzBBJTOv2OqBorgwZIhoiwWEFU9BOpRxgn1bkyt7AmyvLLB5i2o7dPio72yWdejAI2S7BGFwUj+LHqOIc7IsqHIXtsPJGNK21dGgR5MnmOG5DcA/CSNPC95w9c7nUFFj4Zx26gvTFClcQDUN98mqmpL9NGuPTtTX2GuhUSMFCTHpkpbEgfdCCHU9Y/tM1IaM/L+7/UlN8smQf4tCf/HpTTb6+vimqTcIVfpqpRYqa0Q/YqKV15Tpk2R3ldVBbiBfHNDR28QvBXfXHtEgtdiyZT7fdFfJUDyqLM8Z6mzJ1U7n+WNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fdp8Xs7GrHwvTtEpIJkSGlMjTOZrewPWiwBJ4NmCM7o=;
 b=WTs0+K9mWBIW36WvP+/16NZlbRLDKFaUKnafZuS4r0dq2tXdj5G3TTM0K+I64r42V9YqmS3EKZTHOEwr3ZVxlJ8cCIcQCrxTZc2Quo8UhqYeXZ+7Am5nJt8CZ0m6MR2TJ/5iZYEBrFHkxqM+5Y3tCLfwNKKdzVPvCBPsK+jHf3kT5mGXwQUxGbsB06/7oyzk3H/i/VZRRSKsdoY1kG3ftHPYoK/F3bVkwjZcNJlGUhZ2FAbI/fNupFjdC/8wey/awWpqwVmV1AgqqZKCVbDpvr+xwwhPChD7+xNyaMZwrTQeKRfH+cX/2hkjAdu3zyqpMTFyrUeZrCdD7qqLX5hIBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <638706b0-bbaa-f077-b874-eddc18d7026b@suse.com>
Date: Wed, 14 Dec 2022 11:44:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 1/3] drivers/char: support up to 1M BAR0 of xhci
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.932f486c1b08268190342f8918b09fa6a7c3f149.1670724490.git-series.marmarek@invisiblethingslab.com>
 <3398f603208397e2894dd452e9de047431599c58.1670724490.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3398f603208397e2894dd452e9de047431599c58.1670724490.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: 9683bbff-5ebc-4574-c7bd-08daddc029cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mHJ1dkBG86akf+w1J4xvRn/0kQuQEt9Z8s/ECt877/HqLpbPP7UfObh9Sy1/unOyV5c9cla63QGojW4tLfcHoKsFb4hEMdhwVAhxSnKvlpKOFrz7Mq8XL7yEjRrILWBiOtwvqFk94Y2gqhiq9eJaE1uh+Dw/o1X83jQWWW5zy395ihj+4t8GMukJZRQlnIElaC8x9pHnrM7dkrVd7DWw++5AAuSKd6VKow3ZpOni7zKyPi5rRYrYX7D9fM9o90DN0jlp3mrsQYjcZvL8i7Lt8yDouhXKEOcoGMOmoEL09IVJcwqKWkApIMePYXFtHfEQ94vA/XUu9wZTTBTcGM2m2e2IBs+z70Od72Bqfa7PKTrcymlwIj85uSrE5CJAWGAVJMmZ6bt9+SHNDtX2roGPlotsCweuSZjokg2bia36osvBhOQ0aRoYRzAal5rbEWqkc8Z26OWQh4E9R4CTI8uy9fhyhU4I2TAdSXwlzZyrobNs/oYpj8W0iXJU4sdjtet3PylACUk2NhLa654shOdVnNH1jFMXkvyhQ5E0UXlgiJkaSuJ2aFhldNkCNnk+u8Thp8FzP3q43YXA5IPwwv1POxcpRSnbcuJ9mszVku3qaaIokqXxVwWQfkRatHHF+oG+UwhoG7SdSDj3hmqCF19JBriq3XlF/RXqsI7fo4xYpZrPuvdjcbwAQnrc1BvQk+WsbTjthBjJf5Db0lwduPiJ6dNHoEFWG7B674I2ZnGircw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(38100700002)(31696002)(86362001)(54906003)(4326008)(66946007)(66476007)(66556008)(41300700001)(6916009)(8676002)(316002)(2906002)(8936002)(5660300002)(4744005)(6512007)(53546011)(478600001)(6486002)(186003)(2616005)(26005)(6506007)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dS9aVUV6alVtVVgvc1luVVlXVzR3eHdaRU1WWGY3MmhONnpVR0dqVW9ZbVNv?=
 =?utf-8?B?WnJEYnJjeFdXTzZrL25tOXJ3QkpmRHJsNnVibkhKQmJ4T2JzVytCUG9hSmcz?=
 =?utf-8?B?a3UzaWhOb2xUUGZVYVR1TjFZMiszRXg0S2VPSGxzZW1Edm0xTHRQMFIzRStN?=
 =?utf-8?B?RGl6azdxRGN0U0szOFBtWEo2OFRad1Z1QWkvdEJka0c4Z3pyL2pXMk5INFRI?=
 =?utf-8?B?WlFzWUtRYWZHeG83VkVnUXdjSUV6T0JUNEVRQnFrRy9lSUNza3hXcmtMLy9h?=
 =?utf-8?B?VjFKa3Z5MFFrR1JSOG9iMG5GcUVwWHFTeUsxYWtzaW4rZ0ZvS3M3Q25WaVJ4?=
 =?utf-8?B?UGh5NlEvKzhycHhtYU10d0F5TjEzZGYwNFhhQlFGN3pFMi80Z041SE1XT0kv?=
 =?utf-8?B?bDA5dXRRNnFsS2tUU3g5dUZSVEFXM3p5N3FBRDdSeXlhSnBIZkU5N1RaY1Zt?=
 =?utf-8?B?QUlBZWJqem5abSsxejA1ajMzVFFaNlVKbHZEYk1oWkVXTFgvdXdCdG91cUFH?=
 =?utf-8?B?UlpRQ0xqWDB4MDI3dFJGNkdET1NFaGI3K1RlMXBCbHJsSVdmSklEZ3ZUSUlY?=
 =?utf-8?B?c2RaS0JYVDBBMkZCc1BHckwzNHpxekNlYUI2Q04wcjZwYVlvV0gycE9BSklZ?=
 =?utf-8?B?VHc3ZkRLNitvU2E1K05YTGhVd1E0VzBGT2JEeFZFZGZPTklMSlFlRVl3ZTVl?=
 =?utf-8?B?MkZVMGFLRWlrYUR1bm1reTlIcHZabm5MWmFBK3NaaDFKU28rbzhGT1Vuektq?=
 =?utf-8?B?Ti9yNlVSR2pGUnJTdlRKK0lEQ3phemcrOW1mWW1lMnRwcTFZU3NSZW1EWmVH?=
 =?utf-8?B?eVU3VVp2ZURaWUtzVndWZWFNNXpKbHFOdlYwU0xrQy9TbzNMZm9IMlZLNngr?=
 =?utf-8?B?Sk0vd1VqVnJVVGhPV1hkZFFwakpJWGtuNEJPZ29MUFF1d04xNjM4TE9iQ1Fl?=
 =?utf-8?B?OHhYK281eU91Q1J6d0xqZE91L3ZqVjRRVlZzWWxienlwZXJaTlhNM0YyV3ZT?=
 =?utf-8?B?blNFZUdpd0g0Nm9leS8rQkY2NDBrcjhTREEzNnBZYkRSVHp3SUhRZW15ZlY1?=
 =?utf-8?B?RDUwaytQejZQUEt5Z3VBMmRxOXcvM2VQQUdoakN4QkloRlhBWnA5Rm5zc3Nm?=
 =?utf-8?B?ekMxNTFHbzkvZ09qdnNtOFBLNDl2RC9RWjMxQXAwM0twd1d2SVk3bXBLNmor?=
 =?utf-8?B?MXNUcVhhOWZLenZZaFpRZjVBaXFZZ3Q2U2FmMXc1SklVaGk2RE9UK3BmdndF?=
 =?utf-8?B?TC9oVkE4UEJHU2dGQ1NDS0tTZkJsYzFmMjVnREEySzhOLzlwb2N5Rm5vNlZQ?=
 =?utf-8?B?L3hjSW1rNVhLTk1xelkwdEE3aXBzZ2VTVE1lRk56OHB5aVRNNXFrZlpvdEM0?=
 =?utf-8?B?RGpPVlpXbUc2bGpVRGFHZ21GTytERzdXQWJnU2hMN0c1SExLYkdFMk03Z1N4?=
 =?utf-8?B?Q1ZWbGNTVmJrUG9WbzNzU3ZpZ1RvVzJ6OGV5Q2hMeFJIdGJZSFByYWxBZ3JS?=
 =?utf-8?B?VmpBeUV1ZkNNU3ZuR0d0bEt4MzdPL2psWGdXdDZtWm5FK1ZOWW1MNEdURDlN?=
 =?utf-8?B?bE9ndDhPYUFZZldHWnNFNGRoYWEvczNNeWJVRVJtc3I2MXNuWm11c2tSUnV2?=
 =?utf-8?B?N3BwVGQzb1RxNlRhemNJUUpjZEtJckZodEVxZko5d2xiL2tHaWZKUFg1dXJq?=
 =?utf-8?B?RTltVnFQdFRxNWp1RjlzUlhISGo2bS9pMFdiRDdOSVVabk1CQ1Mra1NQb2Q2?=
 =?utf-8?B?S3dORGhMbnFQTURranJjUnN5WmtiOTJKM1grZVBNeVpYSHJGZDA2YzA1WWdk?=
 =?utf-8?B?bWhaK1U3UmtuZWpsTVZYdGVoMTYybFJEb1ZCWkFDT2N6WDJGOVVXTy9FcW9V?=
 =?utf-8?B?MHhIWVpveEg1MmJCc2xTKzVLS2xwcVV0NDVOMGxlVFdvS0g0c2pyYVpleTBi?=
 =?utf-8?B?YUFGT1ZaNVJ6N0c4Z2xyVmJuVlpTdzFZSktpcFlWYS94Rll1RG9zWWRCbTZp?=
 =?utf-8?B?bzJGdEVsUlFDbFgxak5ZRml2ZTFJZnJOKy9xSXpCUDBqbWQyNVdpUWpybGVp?=
 =?utf-8?B?MndHOEhmUHhuSGZ2eVYyU2R0T1ZvWGlnUjBDMVJvM3J0Ujh4emN5dFFCYUtz?=
 =?utf-8?Q?s/Kv7IZ0PLYaOefe14q86Hg9N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9683bbff-5ebc-4574-c7bd-08daddc029cc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 10:44:23.4060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymdbhah3Qf+LYxiHItxJo5Uu2673QFZ1M/K9oLpcEqxPcPhDW3lg8n3RuPaSN6doXiXc6keyLsOGBUxAUnRKSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7915

On 11.12.2022 03:10, Marek Marczykowski-Górecki wrote:
> AMD's XHCI has BAR0 of 1M (compared to 64K on Intel). Map it as a whole
> (reserving more space in the fixmap). Make fixmap slot conditional on
> CONFIG_XHCI.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -268,10 +268,12 @@ static void *dbc_sys_map_xhc(uint64_t phys, size_t size)
>  {
>      size_t i;
>  
> -    if ( size != MAX_XHCI_PAGES * PAGE_SIZE )
> +    if ( size > MAX_XHCI_PAGES * PAGE_SIZE )
>          return NULL;

To be honest I didn't really like the original, overly strict check.

Jan

