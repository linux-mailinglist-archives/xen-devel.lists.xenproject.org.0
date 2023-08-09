Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E56B775308
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 08:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580696.909080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTcu8-00075P-0K; Wed, 09 Aug 2023 06:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580696.909080; Wed, 09 Aug 2023 06:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTcu7-00072o-Tl; Wed, 09 Aug 2023 06:42:47 +0000
Received: by outflank-mailman (input) for mailman id 580696;
 Wed, 09 Aug 2023 06:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTcu6-00072g-Ah
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 06:42:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f274eda9-367f-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 08:42:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9195.eurprd04.prod.outlook.com (2603:10a6:10:2fa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 06:42:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 06:42:44 +0000
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
X-Inumbo-ID: f274eda9-367f-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrZBk/vck8q8iXLXfSQP1WZ4CxT4GbKrap82cWGmskOb/yGfqau0uvjZoqio96wCc030Ax2icJ6MNV3eJQeEJV44fzmAPnwR7ygoh1LleqnFJDKem71YsqEOqL7V+is8DoObfPRAc1S1XBSXUUYcheX/KQik1yZMMIehwV/dypAFtA2EGD0/9VtQItKdXNqhPtknm7/Dqg6yy1pMH/viQjTNnsy0rm+dFTeFPY+GqnFel+EBdMei0bDsF0AevEhKck+3uHYj2+vMarVYy6pgH2k4iQgMhBklfVC1ji21dTLynI7GmvNTihquxxl7PctPZ2FvYayQp1mEYMmK0bJk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/qv8RzdLGkHNogzIJrzcZKa6WYQvuP94xlgxFUFJqQ=;
 b=nG5b59+BDfokVxFwcodbAH6dNrj74IeSvILCktyTWTXw/X745X9QMjM/8ulEUXOf0XIrtiyf4zjVdxLpXQb0c6YqeyM9OzDL7D1yQ+uW+7ERdo1OoXIHDNpzG1fXZ0qEbWGw52fIjuJRAIPRgf38N0okw9vsrEbHmPxYVH54RKiLDpRGrhEv02X8ziwzfycHEcQRZhexjnSkdOoLZ+DQxsVW0f+GSTc/TlxImEmetfZeMWeNZUI6JgQOGGbvAmByBbK7O5Y1c0E2evz1hPW05i7TquuqMIHrhZFJZIUgskUE5gu9KLzbXc2TgLkuxX3z071aPbh7AVp4KjvqbLRktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/qv8RzdLGkHNogzIJrzcZKa6WYQvuP94xlgxFUFJqQ=;
 b=HkBwV8pO26q/eKWt306YnHyFXliyFDoJf8vCeqGvo9OhKw5LFyEsGX99XhjgV+s8MEiynE2KCKyo8mgQ3yL9nQFyM2q+8/wgqZMckTC1i3udOdEU7cXib/YorX/2F4Ky0aUsItZXri5wyloqy6CPV0MlEOl+rwO0+PmxlsegYjoMeR7nEPbyPs1AdTHpiDcqiWYPaLnURN2w+k7gnPJOdyGfm5CmjreqX/mVNSSwI2deZUUeTqtP2QyOVGHBofGNnU4MSTMcQnPbdwatuk8as2DWytCwKzXxHOd5YbJenMPRTV5uK5JX8gSk/mvRCKyVxUehRU1z2CQNWl69+tSL8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a649e904-44e8-6210-a1fd-297c00bba317@suse.com>
Date: Wed, 9 Aug 2023 08:42:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/9] xen/common: Add missing #includes treewide
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <2c9eb4fc175a1bdd21293f2e2611d8e21991636d.1691016993.git.sanastasio@raptorengineering.com>
 <af751f31-5e8d-2b1d-e878-148e08d9264b@suse.com>
 <7e77b8ed-2c0e-b814-6ce2-c6b2cf47bec9@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7e77b8ed-2c0e-b814-6ce2-c6b2cf47bec9@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0216.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9195:EE_
X-MS-Office365-Filtering-Correlation-Id: f462b139-4708-4c39-96ed-08db98a3d5bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7nq8935HvKCxfyVcqYFuqNgraQp/ToTu2ZDzj9MaAnTl0BY/8vy4DropGES3eezgC4al4icLBmrLgWhkpobX4ghl5f5VL8vG/bLsaMgLcYy/4VsARAIjRQDrgNUOJfrvCGRoblVfD54WhQvGOlgnWkhq8ZMoapyvkPtl5nD0xzh4UpISMDxa10QZLLF9OMdOqCBnYQxBoIPlOPGtZWA9C7rjZB7SkyNg0x6bNULd4Y5+QRawbHo8WFr0w6k2bYTnP5Ya2kzrOixUehvhHN0nLErlBpknJzqjADvZSuGIAnpxB401s5s9BV2DypLAUVTb2eShnIf3y2Ex88fOmWzqPXE2VH1uc53s+dWCkGuQA+YAJXwzu2gsCA+bBoWeau4X/Hrh2jaJ0edYGajdmZXUsIfAOqFIApSnu7Va8RgtgDNifGCDlP4KwuL1JyfkFQqFoFRPNTCwK4j+7SuDW2jy9+gR1UHog4XieWfxZWR1t272XzZeOcCsSDIiPs3p6MCpVXWw2W63bKVUoobPZg6LGpcx7qgvPHo3+1opBpjNnK9q0tQoFE30Koaza2idIfCBGHSlpzCj5AHxv720ORu8jEnu4PNRLx0f5Qjs76/OPk9qQZ945rzoxzUqeA99Md8cH50wlZZukBtsgq302MimpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(39860400002)(136003)(346002)(366004)(186006)(451199021)(1800799006)(478600001)(31686004)(2616005)(83380400001)(6512007)(26005)(53546011)(6506007)(66946007)(8676002)(316002)(8936002)(31696002)(41300700001)(66556008)(2906002)(4326008)(6916009)(66476007)(6486002)(6666004)(36756003)(38100700002)(54906003)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjN6dVJrYnVCbUNXVUFUMnMvTXJLc1MxaFMyNkZSd3crdk9nVVdid1JYWGFB?=
 =?utf-8?B?N3hQbTBEb0xNM1kvL0FESkNnSCtCUkJhUmpybDhPM2g2ZUFGdVlNVTN0K3JU?=
 =?utf-8?B?YU02WEluZnlSSHI2RHArK2tIbGhEN1BFTWpFS2VuRkFxMGVtdlV2OTVWRUY0?=
 =?utf-8?B?WXJ0ZWdVMWp4TUlLdUQxKzAxZ0Jnbk15UTdpL21YYVFqQkxJUmR3S1dyTmNW?=
 =?utf-8?B?YWs4UEQvbU9FV01YVDZTZ3dnY2liSFlEcDhqQjdJelVwWU5XMU1HK2dPU0tL?=
 =?utf-8?B?bTBtOFMwVk5OcGJsUmRQUDMxM2UwNDdzS2NnYmF4bkxXNU9OZlE3dFFjUU95?=
 =?utf-8?B?bitYNGVydzlqRHVwdEFwZmZLMEVyVDIxME1QaC8xSDRzbE5WTDVWQ05vakNI?=
 =?utf-8?B?OHcyK0sxRFpSYXpsYi80SGtOcmVqRjFnUDJFdmJ3a1lsdnJRcytQZE81czZY?=
 =?utf-8?B?QVJZREdBL0E3WFd6VkhsU2M2L0VkYWRtbTJmSkNyL3JrTUk3QndqL2FmUlBI?=
 =?utf-8?B?cmlJWlZxdFpSVVNCOEhZV0ZZN0dBekxvUVVqTUNad2E5dncvbHUyY2dSTHBJ?=
 =?utf-8?B?ejhKOGpwVEU2dTBtOENxY3Noc0l5ZzlxOWJKVEd3RVJNK0Y0bjBZVm5LcnZG?=
 =?utf-8?B?TkpwNVVtb3k4cXNiVjlzaHUxREdqK1lWVW05aE1vd3dZUHd5L1JudndtTVFH?=
 =?utf-8?B?ZFBCanV0Z2FuTjdhdC9QQUsrUmtJZGdDN1kxR29rVThvZXlrNXV1RmFxbjV5?=
 =?utf-8?B?eFh5UVdseE9NTEMveENYQzRQeHV3Z0lwby82YWpCdDM3UkVrSENuY3pTSVpJ?=
 =?utf-8?B?M216NXFKLzgvbnlLdXNXSXRVT1p2elJQQmd2cGdkMzF2M0l3Q25Rc05TUVMr?=
 =?utf-8?B?R3puMXpTRGxCektUSGZ2OXA2c1hPSE5wRDl2aWFFN1M2V1VLWmRRZDVXNkpJ?=
 =?utf-8?B?T0d2dzFWc01IazVveXJUb1hHTWM0ZFFiczJFQ1VsNHRORkFhZlM5bzN2OFZl?=
 =?utf-8?B?Ui9wdThST1B0MG1CSnRNdkhBYnhjVTJNelJqM0lNQktFQmpxeTJMd1ZOVUpr?=
 =?utf-8?B?NmdaRzl6MFdtejE2K0VxdVlSc1cvcE1MWVg4WkpkUzdPbTh5RnM3RWo5K2Mw?=
 =?utf-8?B?VlIvMS82WDN6Y1I4NzQvTUZTdUs1U2dTbytwRUhwSnZFNitabC9wbHBxUXV5?=
 =?utf-8?B?S0ZXZnZOa21XMll5ZDVmQkdPYm5xYUo0aWc0ekRNUlRDL2dBSlBKT1NOcHdF?=
 =?utf-8?B?bVB4TzhBRG5LZTNTOHpSK2t6NEplb0h4SU9lYkJrWnl2dllhVEhLVnlvK3dH?=
 =?utf-8?B?dnRsempNT09KZEZubkhabjV2MWtiQXNDbkorR1lqa1c5UmtOZU9CYTFBMDQy?=
 =?utf-8?B?LzkwWWYvcnpJQTQwYU9LUnllZkxpaEthUDMyZVE1QTdma04yQzZsNGRmWlRS?=
 =?utf-8?B?bFZsRG11dGZxSzN0SHlvMWdKb3RMM3ZRUHpxWXhWS2ZoY3RGb0lCeXdBcWJT?=
 =?utf-8?B?VVdwVGd4UnRFZzhFdkhRZURINHlGeDdqcEduMUVIR2xQY2J3dXJ4cGZMdU1r?=
 =?utf-8?B?b01UZjRXUnN3a2xSTk5aRU1vaVVLaUtDN1FpMFFIbi9ESTlPU0I5OTR4VHZX?=
 =?utf-8?B?QkFaeVhsZ1RDVFhEd2p2Rm5kbDNwcEtTbnVkY1YzVm9KV1Y4TmRMT2ZzbVV5?=
 =?utf-8?B?SGp3VW03WnU5S2sybDF2Wm5XTFlvckdKVURDbmtOZi9XdU1IbE4vcUZsdjdM?=
 =?utf-8?B?RndyT0gxTERWZmVyOTNNbXJ5c0srTURqdFBZZjlCV3RYMzdEVTkxaExqYzZ3?=
 =?utf-8?B?d0o1cjRObXRDVlk1blpKRkgrenpEU1dsZ3lseEloblhFem41ckM3b0l2NDVZ?=
 =?utf-8?B?SzBNKzBqVmlnWFJHY2I1amVCNmhqVDFiMGhFaWRtZ2tNelRLZ1U4ZFZ4L2xZ?=
 =?utf-8?B?SUNJcW55eGo5bE9sNnEyVUxNRi93eVBiOHBWYjlIZkIrSEU3dElrK0VRZXl0?=
 =?utf-8?B?UE9WWnJkTWYxekFJckQyQ0MzTmpIVHBEWllPRjJ3THJZMFBBdm9XRjNXeTAy?=
 =?utf-8?B?QWhpc3hNRUtiSGhBMzZBMkgvZmhLKzBNWlBkVW5QbGIrbGh2WXU1YTFITFVh?=
 =?utf-8?Q?sU923wdNX3Do5A2MnCBTtwAHk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f462b139-4708-4c39-96ed-08db98a3d5bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 06:42:44.0449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXBM/3/vpdsMJC5K6oO0M4WLteBQPQNS0/TF7F1JWFKjrDoSJRZRLkT0kA3KQrx74R6GJ/lDqNZjqZZsH6uFlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9195

On 08.08.2023 18:49, Shawn Anastasio wrote:
> On 8/7/23 10:39 AM, Jan Beulich wrote:
>> On 03.08.2023 01:02, Shawn Anastasio wrote:
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -28,6 +28,7 @@
>>>  #include <asm/current.h>
>>>  #include <asm/hardirq.h>
>>>  #include <asm/p2m.h>
>>> +#include <asm/page.h>
>>>  #include <public/memory.h>
>>>  #include <xsm/xsm.h>
>>
>> I realize there are several asm/*.h being included here already. Yet
>> generally I think common .c files would better not include any of
>> them directly; only xen/*.h ones should (and even there one might see
>> possible restrictions on what's "legitimate"). Do you recall what it
>> was that's needed from asm/page.h here ...
> 
> The references to invalidate_icache (memory.c:310), clear_page
> (memory.c:1867), and copy_page (memory.c:1876) all need asm/page.h to be
> included somehow. I'm not sure which file ends up including asm/page.h
> for build to work on x86/arm, but with my minimal PPC headers it wasn't
> getting incidentally included and build was failing.

Okay, that's unavoidable then.

>>> --- a/xen/common/xmalloc_tlsf.c
>>> +++ b/xen/common/xmalloc_tlsf.c
>>> @@ -27,6 +27,7 @@
>>>  #include <xen/mm.h>
>>>  #include <xen/pfn.h>
>>>  #include <asm/time.h>
>>> +#include <asm/page.h>
>>
>> ... and here?
> 
> Here it's the PAGE_ALIGN used at xmalloc_tlsf.c:549

Hmm, PAGE_ALIGN() really shouldn't be a per-arch #define.

>>> --- a/xen/include/xen/domain.h
>>> +++ b/xen/include/xen/domain.h
>>> @@ -4,6 +4,7 @@
>>>  
>>>  #include <xen/types.h>
>>>  
>>> +#include <public/domctl.h>
>>>  #include <public/xen.h>
>>
>> While following our sorting guidelines, this still looks a little odd.
>> We typically would include public/xen.h first, but then almost all other
>> public headers include it anyway. So I'm inclined to suggest to replace
>> (rather than amend) the existing #include here.
> 
> To be clear, you're suggesting replacing the include of <public/xen.h>
> to <public/domctl.h>?

Yes (but see below).

> I've tested this and it works fine, as expected.

Good.

>> Then again I wonder why this include is needed. xen/domain.h is
>> effectively included everywhere, yet I would have hoped public/domctl.h
>> isn't.
> 
> domctl.h is required because of the reference to `struct
> xen_domctl_createdomain` on domain.h:84. Alternatively, we could get
> away with a forward declaration of the struct.

This is always the preferred solution, when available.

Jan

