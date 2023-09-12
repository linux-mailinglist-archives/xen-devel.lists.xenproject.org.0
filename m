Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6747C79CC73
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:52:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600269.935922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg04R-0004cr-Ni; Tue, 12 Sep 2023 09:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600269.935922; Tue, 12 Sep 2023 09:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg04R-0004bB-Kj; Tue, 12 Sep 2023 09:52:35 +0000
Received: by outflank-mailman (input) for mailman id 600269;
 Tue, 12 Sep 2023 09:52:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qg04Q-0004b1-12
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:52:34 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 181fb98d-5152-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 11:52:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9094.eurprd04.prod.outlook.com (2603:10a6:20b:445::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 09:52:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 09:52:30 +0000
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
X-Inumbo-ID: 181fb98d-5152-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+9L5H8I3KC7+3OB23SKtwDLH4VDyTZYILYZrsF3srIrN10q6w8WOjrgaArmNAIIGsDy4p7n6oXXWaCyEuE+X2kvgS7EKkl2SP4cJum2pmRqgBfpb8GP+LP08+EZJmuGeKGOJPmbdiZapFqDc/bn5kLf+xwm6TdZZMr9/+bNQ2dR6U3uoZgtx865y0NjtN/E3fcLFb2Mp8vIZeLffKoONzardzioiYMRSc7LNdSOb9e4NWcHcOfV7AloQu7pETwNqaiYO+zkq3yMO9CsN8ukxsxNDeMLCq3pYDnNY3qC3Wmjfoz1Ssvdv/cp7UZ55U9W+2ffXA7CLN0GPWTmK5SGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyfZFT+ww7j8a9XO3nrVepzJpy8ee/cFHlrJUwfkBpI=;
 b=Fz+dfeI5MH5yxcJ9+eXulBYNeXQrD4vyqF4Sv6ryiamRJeZu4X7P2z4+epKzYd8uclZ+CnSHTASSiV5ZBOZsxxg3GMraE6uc1m5D2UsHdIpWOg6VTUnEsVYoPcLw9A6ppx5RkTFYbddCDjXqHISniSHGjfQRi/ZcD6AbkNwu+O6fIRpE+R5i5glBRYjUvzFHF8fSLLEJtz6aKSbtEZMfi2weQGxJNxNwhrjZZefzvvuBqWrWb6Z1eNHSYo2J+iWOG/G8fG8ovDLLFir5DyqWTcZhUFCmyxyewvufRVbAFxM0x7LqOg2PKtkwNQyt96QjyxwhPSqGuZ1eSWeR4kQ+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyfZFT+ww7j8a9XO3nrVepzJpy8ee/cFHlrJUwfkBpI=;
 b=Y75B/njBJy8ULiGw8uxZs7qLq8m3sy4YChjiYbedGvPvEnVUp6oyw+vnPjmHIvJ7f1tRC6NcSouTEy7jDMHYW2bwTi5AlR0JM7slauJGfn3Pr6CKHlDn5p+KGDysZYBYvN6Ia4KS0owppEQcoTwITKJCOCmuSfEWuClsZkXkXiunFrCMT/7l4B0krfOtaxw6scWbzcdmkj1wcJyYhvwc4LOo3Aucsh/pou5Ye0YVqH5hnnFsXxCABPzstURZqaCpgVlcuXHJSWouVJee+oZMMrppI2AtXONx5Nio2+MvM0ycnye7kczWIDe7JyQZ94M1oURd6ekLioGgMan7P5GJOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50e33371-8dc5-d4cb-a606-72d1ab005c21@suse.com>
Date: Tue, 12 Sep 2023 11:52:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v2 03/10] misra: add deviations for direct inclusion
 guards
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <0c1fb82b539d939e7c6655a9a8f3d7fe8b213cef.1694510856.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0c1fb82b539d939e7c6655a9a8f3d7fe8b213cef.1694510856.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: e3466589-5579-4e7f-dc71-08dbb375fb06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J9NjiaNSX12OPAF4zj0A5TtpYYIPrhSdyzcB8gpsYGtNV2IYtZH8a8L1Invvj9/MLtbyUOa1SXb1rYxD4pQjo9hbAy0U8WvEbwLE6qBWTZguJNGYn0xvuYsvXGtDndT6jKedD7qHyoep8SgI8POyMHxIftMY7djgZMgJuA52fWm8eSFMA9QF9k3s12DhnrYURlfGX1zUy/A07RiF4tc1FzXCtb22mLzn4G+7POXPPPU5u5dnikKdCHskdMNRHMTIW97/S0KrhJRA0tbVbtKOdRWroHMshKfxx4LKWqzCdGUOMIAAVmuxAGTTWOhm5QYMZkskSCMca2B7FdhXupdDZM5KM22W/IXEapWEvtqDPugHTyhuUexHjGJOkmJKPth1Xw/pFOjelYM2CmWs+/Kvb/CXM1vgao3HqZAyR2HDHIsNbN9RJKAZqkjcdq/oCPqa5K6LmpEkgd8tOhuPifBVbFrONmzehnIxj7fGA2Os5DcJQqxjOzfwxL9ak17s773vOQP2hNQpmIgxHP+SDWX4z+WZdz3+z/Oh/S/LNv2erk1KtFN6L8y1f8NuJgrlUHZbVAl2a987Ypy2zprRxNdpmraMmhM7KV8EFlUp0Tk3ARvZDSEixXZokaYceusskgWVjWx3ZYZOq+WRCcvCRaw7bQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(1800799009)(186009)(451199024)(6506007)(2616005)(26005)(36756003)(6512007)(38100700002)(53546011)(6486002)(31686004)(478600001)(41300700001)(66556008)(66946007)(54906003)(6916009)(316002)(8936002)(5660300002)(66476007)(4326008)(8676002)(7416002)(2906002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWNYVXpnaFR5R1VKdG5Od2l3dm5kYklnQkFSQk5mTFhDeUcrM3U4Um9FSFJv?=
 =?utf-8?B?VlZhM3M4TG9TZ0J2SW5PY20rbjRINjdRbmcxb09DME84UGc4SHo4cUdXbjN1?=
 =?utf-8?B?OGFpemZrTGpBQ2RWa0Q1aFlHODVQL0dKdlc2K1lLaVhzUytXL25iRDU3NzQ1?=
 =?utf-8?B?bWZrRjJ0TU5sV2toaXZqOGhUeWlPZi9pcC9hV1pPbHdyOWtVMkViRGFtaDVp?=
 =?utf-8?B?RTVSbTAzeUNxR2Q2aEN5VkJtbEJmNGEreWhLb0lzWDZuMmR2akN4YTAvVVVw?=
 =?utf-8?B?dm5jYXMzYXpHVTFlYWZibTZsMTV4MmhxOFBPK3lzY0Y0UWNsNWF3eHFjSlJs?=
 =?utf-8?B?R21VQWFEay9mcXl5aC9mU1FTeE1MdytFc0NaelE1SWJmU01VVGhYM1BXUFNJ?=
 =?utf-8?B?SlBUSFUreDBVelVzUzhxQVVNd01oZjI4VVQvUVBGWHhjZHFBOUJhZWdoU1Bi?=
 =?utf-8?B?dnR3VXVUUHJMck4wc2wzTC8vYzZkcXlid1pENUl6dHgrcTRqNFZBMHZwSWUz?=
 =?utf-8?B?WmE2V1VIMXRXczNVV2dCVUNHRkFMaldoL3Fpb3BKL0lGNzJXanp2SjM0YVVh?=
 =?utf-8?B?bS82c0dLZ0ZPQTRObm1qTVhHa0pEdFNJcU1ua2dCd2NKN05xdllBYjBTMWI3?=
 =?utf-8?B?RnhERGpjck1LMHZha3M5RDkySGNLVWZSSHV1NUQwRHo0MlZoU1A5eENXWGps?=
 =?utf-8?B?WjNuaE9GN1l4c0crN3dpTlIrTlRUbjJRVURkMnBnZUFyZktDcFJFemJSU3R1?=
 =?utf-8?B?VjFxM2t3cDBNb01MSE9oR3hWelZiVE42bnhtMHM2ZjdZVTcwa20yalJUanMx?=
 =?utf-8?B?Ui9BWDhiMC80QU1sN25tSzF5bEs4QzAyR2ZDcXNidmw1SUVwNUViRU5rNHkw?=
 =?utf-8?B?VUFOM0tjVGlwUW1hUlFTMHIvd0RVYUFLM01TbHM0YXBaZjJ1YTBWQmlnemdK?=
 =?utf-8?B?eHdiM2hHa3d0Wm8wQytkK25pT3BmcTdwbkIwaGNVQldCTGZ4Q2p6ckpkcjZr?=
 =?utf-8?B?UEYzMkEvMkpRT2ZrVjJXRGFhWXQvNVJEa0l2bHhpOWQ0UzV5MnJJRmJMMXYz?=
 =?utf-8?B?OWYvV04xUGU5TWVtK1ZraHkyR3JjRU5oeGFwbE9ULytiUTYvV0xpUG96NHRx?=
 =?utf-8?B?MHlWR1ZVUWRJOVNhMWJ4Si9qNDFuM00zVDV4ajByZVVjdlRvcFBxYXdCM1Aw?=
 =?utf-8?B?dmNVUENxckI3NjVsRUh4VlRnTkNOQWZKN0hYYlJxY0hnWWM5cXVOczNHT2dv?=
 =?utf-8?B?UFBMTjVmUFBrL0N6ZTQxUUg3QjhmRWc5MEpKbmphNVcrc1AvUDVWbTJ4WHFk?=
 =?utf-8?B?TG5ISyt2blFkbTV3WjdGUDk5TGtmTmZjVlFGRXRlSHljZG9qb1JZeWtvWHZy?=
 =?utf-8?B?NWlXaDlnUVcrSmxCQ0NFcUFwZk5DV0Q4UlVFNlBDc2xQckR2ZWZWY1p4dmtr?=
 =?utf-8?B?UUZZM1Rtcml3TW5naEliSEtMWGJxUXd2R1ZoaStkNjcxWXZxc2RGUDU5ZlJm?=
 =?utf-8?B?TnIxZmtqdVl0NkV3cHBvMlRsVmxqb2dhcmdxd25Dc2N1dWRPeE9nL0owVGVP?=
 =?utf-8?B?WGVpVU9XVDViMkdwcHczbHRaVDMzaHRpQUhySHMwek1QcFVZcTU0dmw5b0V5?=
 =?utf-8?B?SDhGY3I3Z2pMYmhVZHd1YmZTZHNYSkRVR1Q2bVFCc3hjR2Y4ME1ha3JmSzNM?=
 =?utf-8?B?SmR0NXk1ekU1Y2FRM0h1OEYxNTBkTHliQ1dPdkdaS2ZRQk5PNEtacDJ3NldB?=
 =?utf-8?B?R1BUeFRjOGV4UkVqRnJXMUhlckFRL1RqVlFKV0tsNzN4YlV5MEdyQWNrOWlq?=
 =?utf-8?B?dDNLOFJ6MUZBYjh6R1NBTEpvbXVaNExRNHhYMVNwVzJ2TXEzSDRsRE5qdVA3?=
 =?utf-8?B?OE9jMzRWbVRacUQ1YUxicnNCSVJRS2dvUnNmUjhnb1V5aStBKzZlajZsV3F3?=
 =?utf-8?B?bHNmVi9UZHBwMUs1RDF3WGFkVElCT2RkZnhvQm1OYktjbE4yNE1nL014ZUtR?=
 =?utf-8?B?dzVGMW50VExmU01GcHZuYkFKdG5KNzNLMmpMYk9JTFUzSHY2RnRCSGI0aHBP?=
 =?utf-8?B?bXFtODgrWjZFZjFaZjI1NjI3VjBIRUxSVG1MeTdCbE1tNEpSMnpVM2xDeGtw?=
 =?utf-8?Q?CYirALSaAooWbDH1TGBRnESL8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3466589-5579-4e7f-dc71-08dbb375fb06
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 09:52:30.8495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpEFua1vUF/gJFMLZN1VCgqtev00Co6x3ZBPDVXJdjxKxIuwOLxtbLGLVfK56PA3o1Sd4Meo1JAacaiFqRuwRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9094

On 12.09.2023 11:36, Simone Ballarin wrote:
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -36,6 +36,14 @@
>          },
>          {
>              "id": "SAF-4-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.D4.10"
> +            },
> +            "name": "Dir 4.10: direct inclusion guard before",
> +            "text": "Headers with just the direct inclusion guard before the inclusion guard are safe."
> +        },
> +        {
> +            "id": "SAF-5-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> diff --git a/xen/arch/arm/include/asm/hypercall.h b/xen/arch/arm/include/asm/hypercall.h
> index ccd26c5184..24f8c61a73 100644
> --- a/xen/arch/arm/include/asm/hypercall.h
> +++ b/xen/arch/arm/include/asm/hypercall.h
> @@ -1,3 +1,4 @@
> +/* SAF-3-safe direct inclusion guard before */
>  #ifndef __XEN_HYPERCALL_H__
>  #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>  #endif
> diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
> index ec2edc771e..dfdfe80021 100644
> --- a/xen/arch/x86/include/asm/hypercall.h
> +++ b/xen/arch/x86/include/asm/hypercall.h
> @@ -2,6 +2,7 @@
>   * asm-x86/hypercall.h
>   */
>  
> +/* SAF-3-safe direct inclusion guard before */
>  #ifndef __XEN_HYPERCALL_H__
>  #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>  #endif
> diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
> index 0a2b16d05d..190ada7800 100644
> --- a/xen/include/xen/unaligned.h
> +++ b/xen/include/xen/unaligned.h
> @@ -3,6 +3,7 @@
>   * without faulting, and at least reasonably efficiently.  Other architectures
>   * will need to have a custom asm/unaligned.h.
>   */
> +/* SAF-3-safe direct inclusion guard before */
>  #ifndef __ASM_UNALIGNED_H__
>  #error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
>  #endif

Apart from the recurring off-by-1, will this have the intended effect of
Eclair still choking if there's then no inclusion guard following these
early constructs?

Jan

