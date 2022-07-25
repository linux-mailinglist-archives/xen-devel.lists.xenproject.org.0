Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF9C580282
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 18:18:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374711.606867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0mY-0000ba-30; Mon, 25 Jul 2022 16:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374711.606867; Mon, 25 Jul 2022 16:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0mX-0000YY-Vr; Mon, 25 Jul 2022 16:18:09 +0000
Received: by outflank-mailman (input) for mailman id 374711;
 Mon, 25 Jul 2022 16:18:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oG0mW-0000YI-ET
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 16:18:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5df3d065-0c35-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 18:18:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0402MB2724.eurprd04.prod.outlook.com (2603:10a6:203:97::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 16:18:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 16:18:05 +0000
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
X-Inumbo-ID: 5df3d065-0c35-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IE0ZNx8fPFMG48avmplfv7RVmu18sLwQESSsTPVhKOKICICWkHQbpL4oyA1I0EQ2CYi6Xn7SPyzmihaIIkBqxAOzLOoR87nPAQQnZq+flvO5oV9n5OSu/Yeh8djh7kcZYo3VIewJskKOuU4/nXc/V6SP3GwcoFkeHqxIru8hBXG/F53lpob82dhjmpVBgZ/wthmpmAosQABxGdMgHl0vEPrUPZSTFRRwwuffYZNxQHijd9CmQDx4oLsOeIzxZPCqtSpP2QRv3zarp+4/veXlD/zhJzaWRqcamLMISLiiOTP4iT5vlnOzx5WR6WIL5yxbboqEjw2ptkVfik+J8BkDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mz1YE18l9VGVY57WwyAGO7FD1IPzpn0GTqYKKlSJ2cU=;
 b=iH/7WazNf1U/tCdLxE/P408sBkL3oG8fVEC8268is9HUe1L4cBED/3Mr8DSLhf3fP9MBTE6JQZTGw+63pPRA6Y4i5FjPe0qEwRXYkzvXK14YTtBRDFBkl3NS24DwDRnEhz03cE8kGvJ0qPYYkiNHBVPNGNgTXtapR3nwQYqjDwlmz8f5YgvLe6CrL9wAdUihhszLpm5TbJPU15lwhsIEfQ1RFaZrnm1rjT7kWE0ajgx9cZ1mjNkJO72SerudwOTTpOgO3nJgwbgGHaU9MJKBVBDJQ48Owl2pfzjcnC5CQfIP9dz6ChPM39r0m4sUaiHKSLssKaD210ulphrF6ouQQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mz1YE18l9VGVY57WwyAGO7FD1IPzpn0GTqYKKlSJ2cU=;
 b=4b24ozksqsE/8nrQGlFPtsKkXkl0NhIw4f6LHK/kfvRMrVaO8BNwiUe63UQyANhByRJgeNUYyLr23X69bwOz+/PTFCOvulXEwM7PVV5ZUCJDopH5DRYxhY4dM6gymkRTCbSHDf2wmV9Wc3stZqJPL4fyRCph9ZDLzAYZJJSZDAuQg1KBuBdVfDgK7f1mOKdrXKAzQ7+CFQAaQkcXnakPoGt+KXnuzornQRSwoSwEk6ftcFV8Fr1MR7yvFd2vyM1OYAtGjgfASAxb6ueETShciXq/QXI73FVZWo3FvY3pA9+RuwAHdswlglwkGt9vBEk4Xuy3LbMK3uDnPAzVrdkFAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ea40e1c-6be4-ea82-accb-8bfc21cdf987@suse.com>
Date: Mon, 25 Jul 2022 18:18:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] page-alloc: fix initialization of cross-node regions
Content-Language: en-US
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "Xia, Hongyan" <hongyxia@amazon.com>
References: <473c82d9-0f81-b4f4-70a3-8dfc3beb2be2@suse.com>
 <CAJ=z9a2MsEzLwMStTY-1Nxy0y5QZA=CaUsF84q1e_pjqL2n3qw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAJ=z9a2MsEzLwMStTY-1Nxy0y5QZA=CaUsF84q1e_pjqL2n3qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecfb92e6-a939-4d32-2653-08da6e59415d
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2724:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uqh/Cu2SfVLnUumY8u2Hz6KlRTsAcEglF899GtlOLNmKX/T1TcObBqh5W3KHEl/J+nhhGhW7r0iPn3+pncn64Z5S7ltgkqbuRFtvxhpwu4sY5Ih43xgzptFSlInfiIWOCqc4FtH0wsKacwz7a8jOsDt8UY/j5fXuv0bC8yputxu0Pt51QXU/Qa4ymbNdEiWy0p2j5vP6hRJQu3ZdDffDL452JAqexYAYrDLgp2JrKSckY43g0PmzGNqnaXrKpTA7IAtdVHo1HffQn7VzopK55RuNZpsaANHXso8/1p13MRvjltLJe/koa8zwTH/I9Td/e2XRBj1JGDpqYyne4Gp7BTDP1c+ZmXfAdOK5L4REeNHvD2pzq5KLzPi6W/vjTS7WBvOZoruUwNFz86Zxl1y6Wo9DKHbiYab7NWWDM2bfhsKKV9epsO5ifYWZTeqoPMQaot4RxCuIizkqP9Mx0VaMrbbTQFFkYM3JFPPPDglBlipqzzBgGTaf5lEZEd43F/b1DpTOJHoSKez9vqS73V+Edc0lidfnXBfY1JgLxOi28sQhWrF8aTyiKrnBuvJhGW5V5sthub3VFwSxTUUedEGC1zkpc0CuwqgmQmmePizVwyOS1CIkrAEH/kHmUX8ISx9juWG9GjwV/livf2iKpXN/mPpUIE4y9Hm6xl8pl32ZlEKMg1E5Ox7ZJGl6pqsaUG5ifT4eSmrALM83pMWjsx3/O5aYlapDbyReLJue8ULF3zq9SK7jMfxkKEw9cRd1Qm+dGiQE+qCY1O0gHv32iQWijJP2y3V/hTX9B6CI5urod+3FRdJDpShAP4M6/yeOkqIdNRPIfssauV/7Hegvk/PULg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(376002)(366004)(346002)(36756003)(54906003)(186003)(8936002)(6916009)(66556008)(66946007)(8676002)(316002)(66476007)(38100700002)(86362001)(31686004)(53546011)(2616005)(478600001)(5660300002)(4326008)(31696002)(83380400001)(6486002)(6506007)(41300700001)(26005)(6512007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NllXdCs1aDI1Q29MTUVGMWRScGxqNEkxN2tmeXBqYmhITUlkTFZrUXNYVEpi?=
 =?utf-8?B?OGVNTXY2dG5neUEwamk4dGFKL3NTazJzRnl5c1dYc0dESzR3d2wzQUIrU2p6?=
 =?utf-8?B?dm5SVFdQRVdkN25JT0F6MXZDeVgwdVpIbW1Mb3UvMkpubW1rQU91bEUreGl6?=
 =?utf-8?B?N2dGRzZnZmJFVitzdWRXOFptM1JQUk4rb3hOMEtReDI0N040bHdmZVQrSUx6?=
 =?utf-8?B?dFkxamJqR0hUWlowdCtyRWwyVHhRcytLM0hvWHI5ZHNleXBVTFd0N1N6YlEy?=
 =?utf-8?B?MEpyODB4ZDJSNTBFK29haEhvc2VoNlYzblhOcUZOdzdTMGUvc2NIUWJXVHJK?=
 =?utf-8?B?ZkpsYnZyYlJ5SmpiczUwQnFEV2EyVVIzaXh2c1VRamdaTTF5NmcvaXlkQWpo?=
 =?utf-8?B?aVNEVEM0YnpLMXc2MTUyd0pTWDd3RHN2dXJWR1FHV3VNUDQvYnkzTWxGY1Rl?=
 =?utf-8?B?Mm4rdm1ndnN3Y0MxK3REVGFWL2s0Q0d2b2lqYndKdC9iVEczeHdRclN4eWc2?=
 =?utf-8?B?THVjSjhCUXdBdmY1bThXdFVtU01ya2tjVkY1ZFVCTk5UQ3dTTGptR1JJckNR?=
 =?utf-8?B?ZG5NeW5OblN6c0RmNWVPK0FaSFl1M0xhTFVTcFZwL0g3R2l0bzhlZHlwdElF?=
 =?utf-8?B?MmVOQzl6SlF1STJTQjh5d1c1MzZteDZub2pSODBEVm5jNTJzYTN1ZkxHSXRt?=
 =?utf-8?B?RzVWM1lLVlU2cnVuMnFCandRM1VMVDFMVVd1U0ZGTjBrMXFwNHE0em5ZY29x?=
 =?utf-8?B?L3E0Rm14ZFhMelVzcHJpcWQ0ZmV1OW5nNitkMnNZd1g3S3c0RENDTGhENzJV?=
 =?utf-8?B?NCs1NFlRUWNjbnpXQnY4QTJ1dlJYVS9zdm5OV3hCYXo0M25WRGRxVFBMUlgv?=
 =?utf-8?B?dWFMVDY1Y0o1Z1pocVZtWHV0bUhVN3ljQkM3dTdQN1pSMGpxNXZYOTB0SHF6?=
 =?utf-8?B?VHhCdkpDaXNmNmY3R0wxMlgxQncyZDJnVlZRek9rMlhPaGQwejBmUUFhR0la?=
 =?utf-8?B?aEorSTNXYitBeUdCMEluYVRpaEhlZEJxWjR3LzkxYWZyNWhva0ZSUVB1MVBV?=
 =?utf-8?B?aFBRa0JNVmhaV2JpSUNUMVJPc1l2dk50N3ZQNU1vL0l2MmcyRXg2eklPUngx?=
 =?utf-8?B?WW1lYXdZMFgwNzNRRnZYRlJFRm1ITkN2U051SjMvUkI0VnRMTXJUNGprNmd3?=
 =?utf-8?B?M0wxSGZzUVhKc2h3N1oxMkFqd0pCUktpbis5SzRkL2MzbEM5UFg5RFlPQ3lM?=
 =?utf-8?B?elNUTEVjTGRXTEZwajJsMlB4MnEvbndVK1A1WCtkRCtEVjhYbld6cUxBZWZ4?=
 =?utf-8?B?VnNld0hlMEEzdUFndEZXeWdpV0YwNGNaWjYxK0hhakV3Q1FTaXVuNlEyZVIv?=
 =?utf-8?B?U25HdHFPZTdRVmtVckx4Wjd6QVNXR0plSk1KTmRmdGszczhDQUhqNjQvZ1JY?=
 =?utf-8?B?aDNkaklQZ2d4aW9LWTZLdlgybXlKVlhZRFA2UkVXNXFCUUloL0Vya1pEV1NS?=
 =?utf-8?B?N3pQaWc1UXVVZkZWMVVidnU2ckx2djBWNEZaZHRxaHdxZGhIaVNCcFB4a2h1?=
 =?utf-8?B?dUdhOUQ1bFNGa1Y0Qk9mTTd1dFNsbE1lQWdkb1NRc1djais5eWw4R2xkOFJh?=
 =?utf-8?B?TGt5aTBvbktIR0hyMGwyYmxuNUFWZWJySG5UQmpZcm00WGlmOFNWWjdBUHB2?=
 =?utf-8?B?K054VkllZzlXUVkvbzVhUyt2QUtVS0YzL2NVZm1ub0FUTUVvYnNORTlrR1Qv?=
 =?utf-8?B?MFZteFNBdFZ6TjYyMklWakdjUW5lZlpqeEVlLzJYZDVFcDNRV2oyZXZoTVN2?=
 =?utf-8?B?Uk85YVRxZTN0Y012YVJ6NjNJcGQ4QVRQQlNvZnAzOS85Q0p1RUFEK3NIZTFZ?=
 =?utf-8?B?RDFHVitsNThXQ2hKOW96RkRZVnNVcTM3SmJVMHRuUXUwWEZ0R2FuUnVTQmlD?=
 =?utf-8?B?N0pXVHRIb1A5WmlHbnBSYzhrdFhER1dhenZwWlV0ajJjd1JyL01jMkRFRUhm?=
 =?utf-8?B?TFZ5VDlUNENLdDZhcGZNdCsrT0dFbitGRGVyZ25xT29ENlFGSFkxRlF2ZUo0?=
 =?utf-8?B?L3VKTzZxL2laOE1YazZDRFZ3clBEU2plR1VDUnZqODVvb0xFQ1JpZUZEN1FL?=
 =?utf-8?Q?Vok/eCQfzLHERXKOt17kb+H3J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfb92e6-a939-4d32-2653-08da6e59415d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 16:18:05.5677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8GEWLmMuJgXltKyH++eh0XNMFUTjhemexeqsRqpUt+J8S/j06sPtSfLmxPLtFvrzrnqHWrDvWxE3ztboR7k5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2724

On 25.07.2022 18:05, Julien Grall wrote:
> (Sorry for the formatting)

No issues seen.

> On Mon, 25 Jul 2022, 14:10 Jan Beulich, <jbeulich@suse.com> wrote:
> 
>> Quite obviously to determine the split condition successive pages'
>> attributes need to be evaluated, not always those of the initial page.
>>
>> Fixes: 72b02bc75b47 ("xen/heap: pass order to free_heap_pages() in heap
>> init")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Part of the problem was already introduced in 24a53060bd37 ("xen/heap:
>> Split init_heap_pages() in two"), but there it was still benign.
>>
> 
> Is this because range will never cross numa node? How about the fake NUMA
> node?

No (afaict), because pages were still freed one by one (and hence node
boundaries still wouldn't end up in the middle of a buddy).

>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -1885,11 +1885,11 @@ static void init_heap_pages(
>>               * range to cross zones.
>>               */
>>  #ifdef CONFIG_SEPARATE_XENHEAP
>> -            if ( zone != page_to_zone(pg) )
>> +            if ( zone != page_to_zone(pg + contig_pages) )
>>                  break;
>>  #endif
>>
>> -            if ( nid != (phys_to_nid(page_to_maddr(pg))) )
>> +            if ( nid != (phys_to_nid(page_to_maddr(pg + contig_pages))) )
>>                  break;
>>          }
>>
> 
> Hmmm I am not sure why I didn't spot this issue during my testing. It looks
> like this was introduced in v2, sorry for that.
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks.

Jan

