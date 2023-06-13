Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 963C872DC75
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 10:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547897.855539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8zNN-0004Kx-IH; Tue, 13 Jun 2023 08:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547897.855539; Tue, 13 Jun 2023 08:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8zNN-0004IP-F3; Tue, 13 Jun 2023 08:27:41 +0000
Received: by outflank-mailman (input) for mailman id 547897;
 Tue, 13 Jun 2023 08:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8zNL-0004IJ-V5
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 08:27:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 268636d2-09c4-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 10:27:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8645.eurprd04.prod.outlook.com (2603:10a6:10:2dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 08:27:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 08:27:33 +0000
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
X-Inumbo-ID: 268636d2-09c4-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKqaz6MWQA4N34ytIGKpnMdgfP4Fl41aw/BRZaiqK7hcNEiMic2RWqic9BP/Y5OpfO698JpN06RDFBsReBhHHG3x86lTBt7wnTx/FWqqq4h+Fewbtg5GPL1WmXbeR5jQ+cRgySKE4PInkpB1jsOktgi7zbzW855aL4HEB14juhLzNwbjk4OOIegFe3wCRmfiHHEtWHBWC2yq+8w5RqziE265gXs0HjIBI7IQEhjcUy9a6v0jzfdaZ8auNuFk1p0pd9/zXquOl47d/vcIAJZYwtmlwSbI4ioCqU0gdxbJCwJhRdOEMoJbCXBqxtdAh/fDtTkwluPKGMj02bgvYmYx1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HUEguW/FfPGBupJkfWirwFWRZBhnTtryxy/BgWwOso=;
 b=UsDMDX6u48jnxDUME57JD0ClJRg6xebjJmalEAF0JxhuctbU9BbOdjSJ7Y8qRxrgE7cfLdQxouDp52QO406yny0wZOAm113XCE15cXBjoxWs94XpyuKhsW4Z4fPSzTE1sIiGbjAs3rNIRli6yLQ/FFpanlnzgV2HpWRvAmcJN3HwFD5C6szy0vGJq8etYYeZIjWouMZn77mr0mCsnKEkBxwYF0VtJjHWGv4v8QKoOQHO5OLfzPMrRm8IWuOwdRPRGMFrSOIReVWdlwEU7QIfaz5jE0OvQyLstsY8tCpQNpeVQ/GTQyTWyjbWsj4GQJjRnMpMotSMpAvQupQs+AgDFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HUEguW/FfPGBupJkfWirwFWRZBhnTtryxy/BgWwOso=;
 b=QAk2CNYGppugQ7eSOKLWFlVl8eOdY2aCtUj6qtQR2t0t7Bsy/7Q5IJmFG7gRE6X3+TRY5NCBOJoXEx3zxLJpxnx2Iu1KbDt0hCaLwh2mGWDc7YcTsbO0SCrjIFASAWHmv/8a5BWfo2y/Tf7BKp51AEuIqviH5fKW6Z9tYI04ks2VACuUvEju+S5srovdhniimogrcZnE7w6XLf7sf03auDTwS3aCszd8zW30/JUB1m8j/qI2WzuPuDs/TYNkaOBUcUEx+Tj68MhoccdwBG1vF0PB0N4TCkwnVPrsperOP25VPYtOJJoKM7Qkuk6R/gJIL+AZqUJusIHxGQLu9opLqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <42cb13a7-3b62-8d48-a1a1-3094a7bd07fa@suse.com>
Date: Tue, 13 Jun 2023 10:27:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] xen: fixed violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <e139df541183df7c92b3bd73841cf1fb2851e054.1686575613.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e139df541183df7c92b3bd73841cf1fb2851e054.1686575613.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d64cb50-db22-4227-2912-08db6be808ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jmgSyDJDOTgVucUThNxZrFDgKFD5vFBphfsLVcE25eRkEmbNQWKhrnzv2q3Zg627bdtK1wih7D5yeKg5KgpGWTVyFzA0BR1Y3B5ICaZKbBdMpHvyYSV9fchpZ7CnBOIoCHg2PrFFmvspWV+547OP4aTQe/dIzFmwaV+UTRYHuwNJvRseZebwCx3A09LNTdiYqHXRIcUvJCXXIyflYz3Sv3T63aLth9KY5xDEZP8KD0De7WRjm/rPTWTCZv2Pzqt7yJQMsaF7mmJ0zLhEyJrnvOLSHesfVoHmanYvcFIyhTYjzw/+b2Uuz7WrLPjDrID+vCZVFRh/eNA9yMMRXSdJhr8rPFKaIBrJD73f9mVi/MQm1iSoxZIgrOYgNM+jYdp5c/qlsrlMhnVkPxGDvHsLXKCPmPiNsK43keyyhSeb6BhebNl29dxySk/g4IIjNok2e8/Ogk1lfSZ/HSEwJQrjyrKZuUA3IY24uSZytJdfHyUOFx4X0iQZyg2RQfOQUN05Mi4gyXZ0oYpMHVgJ0sQoloHI3DO8ThhCykvuXlzPGSPT1/knPC4BcCUM5o4ofHuO15hLsRNdjfiun2v0gqX1ibnqpvf63ukwoYd69cbgJe7IxhIg6SqJJWKZP2s+am4aS//bsrSXuvmTRDAxgw/jSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(66556008)(83380400001)(6916009)(6486002)(26005)(6506007)(6512007)(53546011)(966005)(54906003)(186003)(2616005)(7416002)(478600001)(2906002)(8936002)(8676002)(31696002)(86362001)(5660300002)(36756003)(4326008)(41300700001)(38100700002)(316002)(66476007)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0JwOUc2NTdISEMzT0V4OTZDSnpyUGcvblAwRDBxdXBFb29WRDFTamNWRGZj?=
 =?utf-8?B?bTBjV2lWRlRyWXRGRWJ1SHRmMFlkYWZKVE43b3ZBMUp1Q2lxZVJxUlNJc0xo?=
 =?utf-8?B?alhMNW9tNk9LQVRsWlAvQUFFUGZONStPL01IazAySVErSVhhRDRMUHNDSGEv?=
 =?utf-8?B?WmF2RHJlR0FkczBDVXhveit3Qk5FTW9yUm0rN29JTDRmTHE4OU5uL29Hc2Mx?=
 =?utf-8?B?RmFCODFicDlYdVMyTmJ5a2lsZHJjb3lqeFI0R2hpZjVmOHFWUXJGL1FIUGdO?=
 =?utf-8?B?cTN4b0xxLzFwQ014eHlyejl0TUtwem1VbkFVZ3U5Y1hXWVFoMDgwWHczdE9w?=
 =?utf-8?B?ZVNUeENXaWR1UTJGQWtiTmk4VERZYWsyNTBVUHhwWjZTbjhwdTdGL0o5T1Vw?=
 =?utf-8?B?eDNrUVVuOWNscVR2ZXdabERzdWRtREMzKzRwcDJPMXdYejhvU216OG9MbjRx?=
 =?utf-8?B?djcyN2JaUnp1TzlDaTBlOW0yTCtxcFpBcEc4QzN3UWhUaVVVRExNY2dNZzRC?=
 =?utf-8?B?VkpxVURlTGpySSs3bmZwdG1xaC9aRVBoM3h1ekNmeS83SUVIWCsvSVEvdThW?=
 =?utf-8?B?QzdaY0ZIVmRpK1lKZnZNVUh3UU4rM2NUZEhta2pnSmhtYmJPRVFyNUJuWi8v?=
 =?utf-8?B?eFZDYTl5aENqU3Z2L0NOdVhXSHJNanM3cFZpdWJya09JeVVZeWxuakYraG5F?=
 =?utf-8?B?a21ZSVRpRWlBY1JZNHBNRVFFa2Q0NmZPWmQxK2F4N0JkM3VjUS9abllZdXNS?=
 =?utf-8?B?bTdPaTVueXJJdWlsUFJnRElCMklvWGFaNloybyttWHdKYzRzVUV4V0MxUGFp?=
 =?utf-8?B?WEc4Tm9SZmxwckhiZStzS05xb1kvbjZVT1JnaVg2OER3Z3pkNC8wOVd5MllK?=
 =?utf-8?B?dDR3MUhoUDVYbHlhalVDMVhKU1lVVUFocExBaW5VcWpXajNqcmI5RGtsNDFh?=
 =?utf-8?B?UWdwcVRTSTVBL3NhQnJ2Rk5lOUJ5aUxjNWJUOTRSREMyb1ZWaVpBMTBQWDQ0?=
 =?utf-8?B?ZFNCVEFjOGlIYm9kdFBTMWNqZEV3bHhMTVREZGRaT2lUK1o3elZMbTBTOWc0?=
 =?utf-8?B?MkdSOGZJWkV1V09GNWRJRy9aQTJaVERJcDBuU0FUOE9HMzhDQW4yRzAySkxU?=
 =?utf-8?B?R0c4Uk5QeEJzNHZTbWJ4ME96bUlwemZVcE9VWDZCWTVrOHpxSWtIWW8relY3?=
 =?utf-8?B?bDRMZytLWmFSRWp4ZGNLODMrbHpKeVdUV040bmZSTllvT0dRZEEzdmxwcmVC?=
 =?utf-8?B?TjUwOUVpL1lBQnUrNlZHUjFJOXMwTXMrVm1zaUsvZTRiU0tWeFI4eU03Qlo1?=
 =?utf-8?B?Qk81eTNzL0MzOEM5WExZemxOMEJGWVJ4RGxLdzJ3VllyVGdYaEtVVUNQNWMy?=
 =?utf-8?B?WXljdk9VbkxUbWJnSzRwaytvR0JVdGJ4K3ZRZGp0dnJZSDFURDQ2bDJRY2Z6?=
 =?utf-8?B?cVQzMVZINlFLMnZRL21maFkvUHR4SGxrVXVnZTdMVURST0ZqbTFMWERyQ0dD?=
 =?utf-8?B?S3g2ekRHdDdVbEtWbHhMOTgxcGV1NWZiaGs3M09ycTlJQWVUR041bHRJeFhh?=
 =?utf-8?B?MjFGU3VQUFRDYVBzM0wxcmU3aG13UDUrVWljQjAyTTZsY05UUFRwL29yZGt2?=
 =?utf-8?B?NWNSbTAvMXJZbTJ3eUhhNVhhQW84cFlnNjdXYWRFbHI3VlFUUzJSSkNCd3Ni?=
 =?utf-8?B?Tk53SEM5QmF3TkZoQ2paMU90M2krMmJYVFp5a2pPYXVPQ20zcWM1bVZ2c0lF?=
 =?utf-8?B?RG9BanB4SEJjVTdvRjdvOGkydlNscE4xZGVmVXEzejg5YmpzajRPV2ttRnZT?=
 =?utf-8?B?T3VZZi9naHRSdkpSRDdWS2oreEVVa0pQNEdSenl1Z0UrM1NXOWJ3cklhN3lv?=
 =?utf-8?B?ZDBGVjVFVXlWc0kzVTlXUEtqNzVoaTIweTJ3Wmh1UUpvcks4VkFhUzVZOEcy?=
 =?utf-8?B?VVRwdVVXVHYxSkJmcnBKVndDMFVSWFd3aVBGbTg1NVVJR29qcEJEZVUzSFN0?=
 =?utf-8?B?SWVITEpXQkdCYU05VkRnNjJEMnc5VUVFYjlxanpwZHF1anRobWg5dEtQM1py?=
 =?utf-8?B?QUJaSWVRaDRHU1FORldyZjdUa2VWNGlxalRkT1hNWUgvNW1SYWQyL1JxNGdZ?=
 =?utf-8?Q?lWWXqAP/zx7FT6q1QSkFLZ1t6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d64cb50-db22-4227-2912-08db6be808ad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 08:27:32.7227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0r514BW22gSnis7ry1E7YJCN+c94U8AIzOGSfx1ugup/30GBk43iaXFn/lxHLxOoefi2p5rj2j4cAPtPkob+rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8645

On 13.06.2023 09:42, Nicola Vetrini wrote:
> The xen sources contain several violations of Rule 3.1 from MISRA C:2012,
> whose headline states:
> "The character sequences '/*' and '//' shall not be used within a comment".
> 
> Most of the violations are due to the presence of links to webpages within
> C-style comment blocks, such as:
> 
> xen/arch/arm/include/asm/smccc.h:37.1-41.3
> /*
>  * This file provides common defines for ARM SMC Calling Convention as
>  * specified in
>  * http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
>  */
> 
> In this case, we propose to deviate all of these occurrences with a
> project deviation to be captured by a tool configuration.
> 
> There are, however, a few other violations that do not fall under this
> category, namely:
> 
> 1. in file "xen/arch/arm/include/asm/arm64/flushtlb.h" we propose to
> avoid the usage of a nested comment;
> 2. in file "xen/common/xmalloc_tlsf.c" we propose to substitute the
> commented-out if statement with a "#if 0 .. #endif;
> 3. in file "xen/include/xen/atomic.h" and
> "xen/drivers/passthrough/arm/smmu-v3.c" we propose to split the C-style
> comment containing the nested comment into two doxygen comments, clearly
> identifying the second as a code sample. This can then be captured with a
> project deviation by a tool configuration.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes:
> - Resending the patch with the right maintainers in CC.

But without otherwise addressing comments already given, afaics. One more
remark:

> --- a/xen/common/xmalloc_tlsf.c
> +++ b/xen/common/xmalloc_tlsf.c
> @@ -140,9 +140,10 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
>          *fl = flsl(*r) - 1;
>          *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
>          *fl -= FLI_OFFSET;
> -        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
> -         *fl = *sl = 0;
> -         */
> +#if 0
> +        if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
> +        fl = *sl = 0;

You want to get indentation right here, and you don't want to lose
the indirection on fl.

> +#endif
>          *r &= ~t;
>      }
>  }

If you split this to 4 patches, leaving the URL proposal in just
the cover letter, then I think this one change (with the adjustments)
could go in right away. Similarly I expect the arm64/flushtlb.h
change could be ack-ed right away by an Arm maintainer.

Jan

