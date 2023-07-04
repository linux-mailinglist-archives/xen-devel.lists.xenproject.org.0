Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F79F7470B9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 14:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558313.872287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGf2W-0005Uq-Vr; Tue, 04 Jul 2023 12:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558313.872287; Tue, 04 Jul 2023 12:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGf2W-0005SK-SO; Tue, 04 Jul 2023 12:21:52 +0000
Received: by outflank-mailman (input) for mailman id 558313;
 Tue, 04 Jul 2023 12:21:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGf2V-0005SE-0Q
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 12:21:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58e10ffa-1a65-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 14:21:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7492.eurprd04.prod.outlook.com (2603:10a6:20b:282::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 12:21:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 12:21:19 +0000
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
X-Inumbo-ID: 58e10ffa-1a65-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwfyPA0xH4/RImmUbV8WNHnstvAahL3LRXp/ePTA7FVAWFM96ZYC0mUqJYVG3qwKToFRAqQnVTHik6wDD2ogsoYoomFy5Wzpsf9HvQVGCcWzQA+lG3Oi1WF7ha35Xq0ztysMC28QfhQ109bqBOP0g/3x78E5VbMzulKzTBIEcVnPfb5/UEObOEZW4KqEW0QsojD66oyDAJmKKT/Fhxgkvi4WGjecP/M8Yaa+BHbLFdaQlVT3sBMDv07XHTCiJ6zlYykeh1wdpANmvZXT2dPmrqUlIcHqAuqo2jMUaF+H/8ixQFs5NOzNhEzuTsi839VEkLeRh2U0xCnNVwoREB1fig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=In3WCiwidXW2LkHXdFTMrEoGDNfe1stpI+BHStJM4dc=;
 b=hSI1tGrZLaCssm6CKsUnVQz2+c+H8ndio3Mg6dm2yXUfQH2D6e7625C5wMkphtD6dklpPfSGqh56xCwWMNX9Y87aYBjYrPn7xuRRBsugXyxew9CKgVFWjnpNmBw7b6975fWEtP6ZWm5zaSHGAmXYOX/5PllVaFfc2Sulrxvv83phypPUqA/fMwxmVnegngO7AxIG0TlOiYPbsAQKwM0QB3dG93f/scqvG8uo5gCWDmuuyrBmb77e0pQGT4fxOoctqPJFjUdzBNqBShcLbqC7R//o/UDyGwKRien8FujiF4fNEtuf2UEHB+tKeRsqIp1P+dER3daaVerShhzQIasbSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In3WCiwidXW2LkHXdFTMrEoGDNfe1stpI+BHStJM4dc=;
 b=FW90UHpa88v7rilaCaloLiqgHmMVltpCN3snF2FrzURX6cWKFrfkjP12f6J8+M2+JiUSfDhgLLzvcAG3k97/ywcDrRwhppLx+gc81eKegLeVuYb3NGEZdVlQkzcRL1im/Pn5/gYmHAMLpi6tHnCimM3DWYFrJCYLOXkzjEJ6iVDSi5eKMR1+iXgAkd9Sdvucj/pnUZ3R+t/ePjjJ6LuUaIQBEsq2pMFtGiPCjdARXJ7+86tmc0kjsAE8fbjVgaQP8MpxTVmcylr1ihdMoJKZXiQi/NXmMyXq7qhpwHSrfwNrbALzwK0eBxY5er0E3aitiUkFYQ9RRIc3odx7cAwHjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1bc81320-7bc2-3392-528e-8434d6a44ccc@suse.com>
Date: Tue, 4 Jul 2023 14:21:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 15/52] xen: make VMAP only support in MMU system
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-16-Penny.Zheng@arm.com>
 <654c9925-565a-80d4-5e93-129f6f0f691a@suse.com>
 <7d3ff868-60a4-1eab-0b9b-f6ca649cfdeb@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7d3ff868-60a4-1eab-0b9b-f6ca649cfdeb@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ecf48db-ba5e-43db-64d4-08db7c892bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A9Qs7AAoyN6NPJZvriH5q2znsuWGbo1gHq+uoRnbMFmqS+qMNlTqyBIikzAtP3mDSDpXFEmswq/4AKr1h+cmiYBJQdKyhIuWohuy2uf3JYNK4AjZDAuxpBYVeCz76xrf2OEnCyevHUpR9x+Y3/WPFPaLXl0t7KDbFrpiRlScVXqskooj43fK48MShRN4mzfAclIBbXNfkC5fUkgyRJ7N9eKXFCBajPcANQZCFapLEgT/Ysrm5XaFIM52jowoSnwMmHVbqJGnBupiSafMi7DZ15a5Y8Z/O94xWCRrA2yOxyx0rAs/rUN1uHdUrGf7ua4Wkcp690euzUoHnkOtzGDiGlAphUB7H+09K0gF2wSOLsHI/u2Cro8QevbWZ2qYR1UPOPb4fUqiWkiAGCqpHimeY3xtd8oBNWXI5Uh0RiO3mZyCqgE9PRNHTYuNg+RYBPXRhEvut+fjfQkD2Xi6t9a96oZk2jU0h0hbALu/ol9OoQ1FxWXVPbyLBB2qWemj9qkeCc71x+sfMz6DABzF0ZBEJt5Mpb/L7pOsJYkCvJZnmE97i7g1nMHxbvMfH77xdGCFD+jB0h1JulMelUN2Y+1zIIP6fZqY2VXzV4PixLZQMAztk8qHY/ly1XBDiDH0zMImVcApDe03mns5jgpozltdwMdygFpthCnnqXhxXRip2oc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199021)(2906002)(41300700001)(5660300002)(7416002)(8676002)(36756003)(8936002)(31696002)(86362001)(6512007)(6486002)(478600001)(6666004)(83380400001)(186003)(53546011)(31686004)(66476007)(26005)(2616005)(66556008)(4326008)(6916009)(54906003)(66946007)(6506007)(316002)(38100700002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG82WVJmRm9ubkJxNDZTcWl2Y0JrY1diQnY5L3p5cVBDN1Bsb1dyZWtCcEVQ?=
 =?utf-8?B?UDIxS09FQlVIWDhDenZWMUhPYk9uaEJzWFpkeFlncG5tY3VkRG5pbHhmS1N2?=
 =?utf-8?B?ZEFDWS9QT3l4Q0FTSmhrZm41S2xtVlN1Q2lKNU1DS1k4OHBwaDNBSjRiWDFQ?=
 =?utf-8?B?L1RpUWMzQy9HaldWb0d3ekhIUHNGMmlEdi9vTkEwMEVjNGJjbmI2enJtMTBy?=
 =?utf-8?B?YkZ0STh5ZGExdVJiNDM1QmQvOHpienVPeTNNUUd4cStSajBZb0tFd0c2U0Ja?=
 =?utf-8?B?L05GenNsclJ3eVVST3Y2MjVXbmFabU9PWWpUa2Y3UnZrNkM1MU5STUttQTQ1?=
 =?utf-8?B?WmJWekZZV0VSYllwbXo2WkFBS2ZWeXRUTTNjcWVDOVZRVzE0eXRFLzdYZW5T?=
 =?utf-8?B?WkhEOHlMY2hvRFhldnFGMGtpbHVYNnNhY0R4WmhwcXk3bEZmbU1GNVl5L05i?=
 =?utf-8?B?L2xLZm9pdjFxK2NiWVZzMU9BSnVkVFpSalR3dnZkY0NRLzVvRGFoeERTVlhv?=
 =?utf-8?B?SnppSDFPQ0hSeThCOXJ1T0M4MDF2cmFZM3l0VTZ2NytKRGNyMWE4M0NzNUFz?=
 =?utf-8?B?TWtXSU5JSXc5aWtwZ1JWWFJFSEV6REZscFdZZ0hDaUR2aVAvTWFJL25YWkQ5?=
 =?utf-8?B?WDNacEtEdENkT1lIVHJiY2FHVFYzTjhYR25KNnphalJHQXVzMnpFdUZrblBn?=
 =?utf-8?B?NDVWUkh0YlErZEdwUnovckxMbnpKQVBvdkVoMG53WUlmQTVmZTZrNWRtWVhn?=
 =?utf-8?B?cFZjN0Z1bG5qbDNSenNYRDdHS1NuQ1JiaERHTUpucFh2clByQXRUTjZrSXRt?=
 =?utf-8?B?aTlTVlFZbU1wQjJydllaUkpVcmp0a0xpUXJDQ1duZHFObGZTdVJTdktwRzUv?=
 =?utf-8?B?c2syYUoyQVgrVGpnTUtaQms3alNISVdDVkZDSW8wK3A4M2ZuZk4xM1kwKzNj?=
 =?utf-8?B?VCtscS9LZFp6Y1dQZnBtdkp0d01mdmNCWFMzMlpmNmtBVUxVcWJSOS9Qb2NM?=
 =?utf-8?B?b0l2dVhnR29rOHRUTmhxemxRMEhmcDN4T1BNMStFN0lVVnhpU1BwZElMcXFw?=
 =?utf-8?B?YkJ4TWcwckNGYy9JSTJFVS9jU00yTlJGaW9ya2V1ejA2OGdpTlN6a25lM2tD?=
 =?utf-8?B?SWExQlpzNWFDRzJMRkliMWxsS0NRS2JneU1oNFc3OE1xNFZrdDd3YVc1REs1?=
 =?utf-8?B?MkgrbERaTGtGL3U2anNJZ2xmRFR0OEZEZjhQbnpKMHFpZG5yZ3p2UmJuT09P?=
 =?utf-8?B?ckRsc2tTY1Y5dE11S1U2aU1WTTh6OTdGSmVEQlhQeVRSUm0vUG81VEkyT2wy?=
 =?utf-8?B?cjRlaEJLbUR4ckFhKzVnUEVJdExKQUJBUDdDell4bm9RT0ZxNzVpMlZpSTVl?=
 =?utf-8?B?TEFrSnVFV1dyZ2g2cS9iNzdFSHpHcEJUcVlSa2ZZNUZ2NjU0TC9rUmdyZytt?=
 =?utf-8?B?eGtSSWREdXo0MnFBM0w5RTBiay80MFNWSXppRmw0amV1SVVSdUdXbG1vZU9J?=
 =?utf-8?B?U0E1K09EY1BPOVZUWGxhcFNxekJ5Y1pXQjBpd1lKTDlTNTFVdDdBUGMwemlY?=
 =?utf-8?B?NjlTQ3YxYXRrZkV2WXVIdCtRYmpmdDdDZkZvZmtqZGJCdFEyM2plbThsM0xW?=
 =?utf-8?B?dHFHM1h2SlVKMzZDYlcxNWRKc25KaHRMaE5BMUtQV3VLM2dmeEdTV3cvQTAy?=
 =?utf-8?B?UFlqaGNocnlhVXJLaXIvMWc4SEhQanhOM21xOUsyT25KNnRweFNvV002VmJw?=
 =?utf-8?B?VlFUM29VTm9RbWNGZFV2dGxFYUlDTVV3NUl1TnBlWFRUbk5OalpsRUZ2eHcz?=
 =?utf-8?B?bGd6UW1ZT0xNckxJWko4UlRIcFhjTGdtYzQ2NHNmZU5lajJjMkRVWTFpV2RQ?=
 =?utf-8?B?elh4WENLQ2YrWTVZRmQybFJEZVc0eW85UnFoQ2FYbkhtWWFROHZGZHpHTG9S?=
 =?utf-8?B?NDFhQWU5bTd1NzROb3N4VE9CTnRkOCs3bVhCTzJaaDJwdiswbWs1L2p1V3Jx?=
 =?utf-8?B?K05xQjJ0NXN3K1NEdFNUQWhCS3VRQU8wR1dOWCtkR2R2aVNEeno0aGRucEk2?=
 =?utf-8?B?YWxzVzc1YTcxb2c1aWVWa003NFhEM2E1eU00L2tsc050elhHRGsxSFB1SUVW?=
 =?utf-8?Q?k3xasOgrDsz524XfZItH322rs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecf48db-ba5e-43db-64d4-08db7c892bbb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 12:21:19.0399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snqGxa1317f6C0YeOJ4Y/OtIovCH/l8Y17VrgTPIAM2QLaIHegwGkoM/P9IwMFOQdUJQkhUXksd6tnbAN5oruQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7492

On 28.06.2023 07:38, Penny Zheng wrote:
> On 2023/6/26 14:00, Jan Beulich wrote:
>> On 26.06.2023 05:34, Penny Zheng wrote:
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -27,6 +27,7 @@ config X86
>>>   	select HAS_PDX
>>>   	select HAS_SCHED_GRANULARITY
>>>   	select HAS_UBSAN
>>> +	select HAS_VMAP
>>
>> With this being unconditional, ...
>>
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1750,12 +1750,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>>           end_boot_allocator();
>>>   
>>>       system_state = SYS_STATE_boot;
>>> +#ifdef CONFIG_HAS_VMAP
>>>       /*
>>>        * No calls involving ACPI code should go between the setting of
>>>        * SYS_STATE_boot and vm_init() (or else acpi_os_{,un}map_memory()
>>>        * will break).
>>>        */
>>>       vm_init();
>>> +#endif
>>
>> ... there's no need to make this code less readable by adding #ifdef.
>> Even for the Arm side I question the #ifdef-ary - it likely would be
>> better to have an empty stub in the header for that case.
>>
> 
> I may misunderstand what you said in last serie and thought #ifdef-ary 
> is preferred compared with inline stubs, referring here to recall
> '''
> Do you really need this and all other inline stubs? Imo the goal ought
> to be to have as few of them as possible: The one above won't be
> referenced if you further make LIVEPATCH depend on HAS_VMAP (which I
> think you need to do anyway), and the only other call to the function
> is visible in context above (i.e. won't be used either when !HAS_VMAP).
> In other cases merely having a declaration (but no definition) may be
> sufficient, as the compiler may be able to eliminate calls.
> '''
> So maybe the preferring order is "declaration > empty inline stubs > 
> #ifdef-ary" ?

Indeed.

> As having a declaration is not enough for vm_init()(when
> !HAS_VMAP), we provide static inline empty stub here.

Really you change the existing vm_init() to an empty stub already; no
need to have a 2nd one (if that was a consideration).

>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -15,6 +15,7 @@ config CORE_PARKING
>>>   config GRANT_TABLE
>>>   	bool "Grant table support" if EXPERT
>>>   	default y
>>> +	depends on HAS_VMAP
>>
>> Looking back at the commit which added use of vmap.h there, I can't
>> seem to be bale to spot why it did. Where's the dependency there?
> 
> vzalloc() is used in grant_table_init() in xen/common/grantable.c:2023

You'll need vzalloc() to fall back to xzalloc() anyway when !HAS_VMAP,
I suppose.

>> And even if there is one, I think you don't want to unconditionally
>> turn off a core, guest-visible feature. Instead you would want to
>> identify a way to continue to support the feature in perhaps
>> slightly less efficient a way.
> 
> We have discussed in MPU design, normally, xen guest in MPU system
> will be a linux guest with no pv(with CONFIG_XEN=n), so advanced 
> features like grant table is in no use there.

Is this design decision written down anywhere? It looks pretty limiting
to me ...

>>> --- a/xen/common/vmap.c
>>> +++ b/xen/common/vmap.c
>>> @@ -331,4 +331,11 @@ void vfree(void *va)
>>>       while ( (pg = page_list_remove_head(&pg_list)) != NULL )
>>>           free_domheap_page(pg);
>>>   }
>>> +
>>> +void iounmap(void __iomem *va)
>>> +{
>>> +    unsigned long addr = (unsigned long)(void __force *)va;
>>> +
>>> +    vunmap((void *)(addr & PAGE_MASK));
>>> +}
>>
>> Why does this move here?
> 
> ioremap/iounmap is using vmap, at least in ARM. So for this more
> generic interface, I was intending to implement it on MPU system.
> In commit "[PATCH v3 19/52] xen/arm: switch to use ioremap_xxx in common 
> file", I'm trying to replace all direct vmap interface with ioremap_xxx 
> in common files.
> Then I, in commit "[PATCH v3 36/52] xen/mpu: implememt ioremap_xxx in 
> MPU", will implement MPU version of ioremap_xxx.

Which suggests that the movement _may_ be needed, but doing it here is
likely premature.

>>> --- a/xen/include/xen/vmap.h
>>> +++ b/xen/include/xen/vmap.h
>>> @@ -1,4 +1,4 @@
>>> -#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
>>> +#if !defined(__XEN_VMAP_H__) && (defined(VMAP_VIRT_START) || !defined(CONFIG_HAS_VMAP))
>>>   #define __XEN_VMAP_H__
>>>   
>>>   #include <xen/mm-frame.h>
>>> @@ -25,17 +25,14 @@ void vfree(void *va);
>>>   
>>>   void __iomem *ioremap(paddr_t, size_t);
>>>   
>>> -static inline void iounmap(void __iomem *va)
>>> -{
>>> -    unsigned long addr = (unsigned long)(void __force *)va;
>>> -
>>> -    vunmap((void *)(addr & PAGE_MASK));
>>> -}
>>> +void iounmap(void __iomem *va);
>>>   
>>>   void *arch_vmap_virt_end(void);
>>>   static inline void vm_init(void)
>>>   {
>>> +#if defined(VMAP_VIRT_START)
>>>       vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
>>> +#endif
>>>   }
>>
>> Why the (seemingly unrelated) #ifdef-ary here? You've eliminated
>> the problematic caller already. Didn't you mean to add wider scope
>> #ifdef CONFIG_HAS_VMAP to this header?
>>
> 
> plz correct me if I'm wrong, in MPU system with !HAS_VMAP, if we don't
> #ifdef-ary here, we will have the following compilation error, I guess
> it's because that vm_init() is a static inline stub:
> ```
> ./include/xen/vmap.h: In function ‘vm_init’:
> ./include/xen/vmap.h:33:40: error: ‘VMAP_VIRT_START’ undeclared (first 
> use in this function); did you mean ‘XEN_VIRT_START’?
>     33 |     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, 
> arch_vmap_virt_end());
>        |                                        ^~~~~~~~~~~~~~~
>        |                                        XEN_VIRT_START
> ```

Perhaps, but that doesn't mean the #ifdef-ary here is the only
solution. I'm afraid the approach so far doesn't really make clear
in what overall direction you want to move. Possibly it may help
if you split the patch ...

Jan

