Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32966596B64
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 10:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388737.625479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOEYE-0000zi-Pn; Wed, 17 Aug 2022 08:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388737.625479; Wed, 17 Aug 2022 08:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOEYE-0000wt-My; Wed, 17 Aug 2022 08:37:22 +0000
Received: by outflank-mailman (input) for mailman id 388737;
 Wed, 17 Aug 2022 08:37:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOEYC-0000wn-HW
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 08:37:20 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2088.outbound.protection.outlook.com [40.107.105.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce390132-1e07-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 10:37:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8715.eurprd04.prod.outlook.com (2603:10a6:20b:43e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 08:37:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 08:37:17 +0000
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
X-Inumbo-ID: ce390132-1e07-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXLdS5zEp20g/J544ha8fT2Rjddj/sVbHdyIwAvmV9tGdB1uZMeHeXzD2ltIyYxp+juuV68o48ajIrtlYI2hjjS5OzsmIaf5vT20ptVnb7O9kx2DzVBaeU10dHUJHN7uYtX487QdoBSSIfjYEFB3BR/NyWX7zihbIKh23KzgUj14ajdPn/7YHifN5EXU6+d1yJKs36IIRsyF36NQpxrUhUgyTZWFaDyxH6IjJzKtRGoGC1ILCrIltJUpJPBtNcOcCVcZoiwJMeK5vPxzu7RQCaMKNeI9YaSXeQooZd+ow5IqeN+sGkfonKu+70dg7/+neU9/NqUO/KQ/lUC8AbLFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7w5dscsKH1+XS6ikeKzQ3eRGM2tBkUkycjyueMpk854=;
 b=QTMoO2Fn1OjvviSZPlG+kXX1h6+lAndwV4pNrNniohD7L6RegT1hJjv3mQwTmJTN9ca8/T9Q4vpAhMJMd1kEm1TIH0a2tJNAq125YNLuu7U50KND2uxporR5/kyfz/tgMAFHmnOHwsn6TdADcyFkM5zcy/Joj7E1Hkm60hz5rnUE5sni7E2cjnWlYwNRTpA3S5/3wS8be98Q4hZ9cwhp9BWfUzpoOeP09xmRu3c/tWiAJ4SVHzPUZx1LalpzafMZ27pjx4MLqp8G1HHaA+sRrpnjt5ECWeAi8ETHU8beFlJIUcH8A+yMbCwkD+pcQ2O0kK0ceNrr2auDjoYSzV160w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7w5dscsKH1+XS6ikeKzQ3eRGM2tBkUkycjyueMpk854=;
 b=lVhsYDs0DEVB+cChYtIJBjjCQ/3m/cXS5nV+Vry5CjQJ1PJjCdZ5fmDkZqVcWOWhpStNKpY8zSCeK3bYDW2zV6Ct5dturQJpBuwiuMxqDyGbEyNpyQ2G8YYB5UAHYNGvi52o3Uj0hzguKW9L+ERzz6x8xl6TfaUKqbpumeR1VzRJlSlyN6ns3XRBd+7CqgjgUIhXGAxttHsXU4Z1owBfZQfUIolYaVTQaWONDFSgh+Sq+I4x9KYbOZdtu/wjeXe0cwpGMxklcjTYC1EBhXp4jT8N0NEh5buIwXmSZwGHIzHMorxMEKrFk5r5g9e8EhSk7YeUVPSpIt0vioBzsD4BwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da0126fb-d357-bde3-f362-32c7d3b51ee4@suse.com>
Date: Wed, 17 Aug 2022 10:37:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on Arm
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220816185954.31945-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220816185954.31945-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36405c67-debd-42cc-1465-08da802bb169
X-MS-TrafficTypeDiagnostic: AM9PR04MB8715:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sSxwmJqs7Yemv5dxTjgzFcZjRcE+IzjQqylJX85SneekTvX86bYwUlEDeuLLrJGCGoqGtHXwTF5HtFS4r/hGv7fePwZ4/hvt3zSOphowMFaVcnXUKn4MavsFmOjV+OdnQRo1hePSGkXP+6cgscTLD4qRQUNfh4u191mvYsgarWUWzoPGShXmKn0mTKUfkzQ0nnFW+wEI1EcqQFGHfq+4a9oSCqv8nEA707wyr60r0IknP+t9lp/Hg6rwNwBnyIMwmC5QnZcyzn4ThS/SritjQ+56IjQ8zjM8KX+rlKrifqwbG6/5poCyuSJ93EE7q/CFG5Z/2x0AcMRFrONIJdXZ+rolf/f/sC5EsZaH4eHRAZzVI95JBlAcgrAMqcMSQsfVK1eA+dzviYh5eRd+qnieSexJtMRrEh5qstZa/p06ULEx4CYAAxWe0R/FmhEtH0If5pgq5YL4oBzebRj4xkKR2wGnSod0he4648mM1sAteXJdNyZtsphh1WxhvTEWk/nKLZvBoMHFru8w0axTipTuwbamJ92XG559MWzSFRY+3AW1EYC2i34CBAi00g1PxzxhibnEGTQymhafZKVCFjerh3MZlc5al+IFjO2H4wUqqnOvjRVQvctCIpoDdb7LxksYGchFTuXoaDyQMeDmHeS5AEKF85yeLoVzjwx6zc3rUjCBRU0QfwFQQb28WhB+SgPpQem5+8jTYSgphnua0X9LabBG0Uec8WvJ6eYzp+W4zEChJwvmWBy5uj6F97c1QDUDQUmMk7m3yDjZ2jLFET0XhV/87qxQaSRh7TtewgZ+FLBmeCrGk8RoIyfufXZfP6a+FgEnmeqWTQUahn4StCU4rQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(346002)(366004)(39860400002)(396003)(54906003)(2906002)(41300700001)(316002)(6916009)(8676002)(66476007)(4326008)(36756003)(66946007)(2616005)(31686004)(186003)(66556008)(26005)(38100700002)(6506007)(6512007)(8936002)(86362001)(6486002)(478600001)(53546011)(5660300002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnU1RUtnZTZSZUhHa3Z3ekpwSjZSZ2dLRHBiV1RzV0MyeXp3SWluWlRrbXFi?=
 =?utf-8?B?YWk0QnNUSXQ5MER4T0ZuVUxOUU9HZXRNS2puWXlqWHgzL3YxOFhXSmh3VCto?=
 =?utf-8?B?bWx2U1Uwczc0c3FNMDZ3aEV6WlVzN3FNelcwQVk2UVFSNFNLTHRMcHJUL1BL?=
 =?utf-8?B?NGtaZm5JRVdzSUdybXE3WDk2RjdOOUlYVmN0UXZZclRjVmlhM01oWHM4Z3pw?=
 =?utf-8?B?bDQwdG15NFk3RzUrWkJhancwWmQ2d1QzWHFyUDBtTzZUaitsekt1ZU03SE11?=
 =?utf-8?B?ZmxXSmlzci8xeGRyMDYyeXpJZWdnQXEyL29MOVJjUTl5cnJkdWZWVHFyQmxQ?=
 =?utf-8?B?a0NQYUVyT2hIRHMxSUNEUXNjQi9kV3lsSitYdndZRFRjTzdBUS91K0RQRndo?=
 =?utf-8?B?SWZEWGVkSGNzMDNuYXVyY3pmMGVIUWFLdWpwQlpGM0dvTklZRDBmYTExS1li?=
 =?utf-8?B?WFZSYjJKaS9NaCtwTnFjT3RCOUlTVzJRdXJNZkVQL2dyQjRMcXNaWUhsKzlK?=
 =?utf-8?B?ODNwRmNSakZzV0V4RVk4dzcrclQyQ0F6eEx0RTNGcDNxZGcyd05TcGthczNn?=
 =?utf-8?B?UHVxc3VtREluandMWENpRDErZjdWdE5UUlNuZG1xbGUxbE5YTFBMbzlaWFky?=
 =?utf-8?B?UlJJbTNzU2hQcnB3Z2prK1hPUEdEMlluTzFJdUd0Vk1paTlrNFVTNVNGZGl2?=
 =?utf-8?B?STEvNm5jMEc5b0ErVmlzSmNsYXVBbXF1bU41WUUrWmN0UHVkWHpxaVU0bGtB?=
 =?utf-8?B?cFAzTEswL3REcHZYdUdMY2JOMkRHQ3ZRTTYxQUxzUUJnaTNZOU9TWWhETzFa?=
 =?utf-8?B?SEJ0RUUvT0U1Q3I5Zmd4bkp1MW1NdkdIZW1NdXpvS1dOZDd6ZkRnTTBkS3Ix?=
 =?utf-8?B?ZEhZY1hld1pkZXJ1NEZ4NUZXY0l0RFloVU5LemZDMEwxczc2MUFvVE54RGJR?=
 =?utf-8?B?U0pDcU9SR2paZ3BUMk52N0pkc3V4bEdHTEt1bGl3L0JybzhvTmt4WUtFY3ls?=
 =?utf-8?B?KzZDbFNvcFhQaUtLZ3JDRjZZMlVRb1pBaEpwZEhtNlRjUDF4UEhSRGswbEhV?=
 =?utf-8?B?UXFkSGw2ODNXN0VWSjhtb0svKzVBbVlFVWdaT012dzExMjhnVjFXeVgvbFJ4?=
 =?utf-8?B?TnJQTDRlU3ltcVgwR0c2OXRZRmljcWxGc3U5WFo1MFgrKzI3cWpjMU5Ja2Y2?=
 =?utf-8?B?cHZRS3hucXlvRUZiRFFKbTNDQzVNN2dsNzlDdkhXaU5mQ2lzNEFFYnFBYk9Z?=
 =?utf-8?B?eEM1TjhBSzZDZW5yMEhjQUhvMVYxdDNJYWZyU2hhQkUwa25tQUpPQW1jenBz?=
 =?utf-8?B?UG5LeEJYSkNmZjZwY05GQkZNL2JsVDVhWWs0YUtjNzViSFV0NU5YWnhHVHNM?=
 =?utf-8?B?K2VBTE5BenVFQzY1UlBGUDR1QTdrdEZHSFJmRWIzVTArQzV3Q0E0UDQ5RXhR?=
 =?utf-8?B?TjVXSnNrejlubWFrM1RPV0xsZG5tMHM2WXJNanpCSGNxRDI5RWFSZW8rOVli?=
 =?utf-8?B?aWNGMldxaGpmZCtsdXE1VkVLWEtSUys4eVBOZ09GUjhZcVpmRURTT3ZTSlUz?=
 =?utf-8?B?bVZVbmZubFZVVHB3dkdYY2h6RHNTbzNWSi82S0FFM1lOTGVSeCt2L2dNMGV3?=
 =?utf-8?B?S3Y0elNRWTMxa2dlZ3lMazhuc3V3Q1VIa1U5SnVkV0xyMjdVYW5UVHZPSS83?=
 =?utf-8?B?aVVJQTN3Z2wveTlpSVgrUTRrNHNQMnhPalZCWitLOHpqcnU1K0diTEpWVkR3?=
 =?utf-8?B?MXhwZGo5c3U0b1A5aXMzakVHWDJiK1lVS1VOMERUcDcrN25zSlYzc29sL0xT?=
 =?utf-8?B?Q3BNbi9hWVAxTWZKMG9ZNHBNK2xzS0FhdTYzSUJnNW5GWXRMbE9rZjdkZjlo?=
 =?utf-8?B?SEFiMFMvMjVuZ1p5YjZUWDZUSiszT1NaSVpZT2pPOXBBeHlubkZiUDhiQy9p?=
 =?utf-8?B?cFIvNU56ZUFYSGRmZndjSEV3a0NueENCWWlSWkloWUpjalg5NHZpODhtSzFX?=
 =?utf-8?B?NVBJSzVPbzFPM3pXZEZuaDFZWEVidW5GUGFDU3NpbzE1T0tTYVYvRU1ld2J2?=
 =?utf-8?B?ajBuaWh5dTFicGphT2xVWXhVR2hHYWpoazhZWHhuUU5KUFNpYy9uaUtudEM5?=
 =?utf-8?Q?QS1P8fbra6ZX4gNJd+sZw/LZN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36405c67-debd-42cc-1465-08da802bb169
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 08:37:17.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0+6Tf5VaUJPovnInnMXbfc383khjRHIM6ORIbski9BciNcuqlmo6OSGPTQnoyrYqObxXToMMypfabzu7sSCJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8715

On 16.08.2022 20:59, Julien Grall wrote:
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -75,10 +75,24 @@ domid_t __read_mostly max_init_domid;
>  
>  static __used void init_done(void)
>  {
> +    int rc;
> +
>      /* Must be done past setting system_state. */
>      unregister_init_virtual_region();
>  
>      free_init_memory();
> +
> +    /*
> +     * We have finished to boot. Mark the section .data.ro_after_init
> +     * read-only.
> +     */
> +    rc = modify_xen_mappings((unsigned long)&__ro_after_init_start,
> +                             (unsigned long)&__ro_after_init_end,
> +                             PAGE_HYPERVISOR_RO);
> +    if ( rc )
> +        panic("Unable to mark the .data.ro_after_init section read-only (rc = %d)\n",
> +              rc);

Just wondering - is this really worth panic()ing?

> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -83,6 +83,13 @@ SECTIONS
>    _erodata = .;                /* End of read-only data */
>  
>    . = ALIGN(PAGE_SIZE);
> +  .data.ro_after_init : {
> +      __ro_after_init_start = .;
> +      *(.data.ro_after_init)
> +      . = ALIGN(PAGE_SIZE);
> +      __ro_after_init_end = .;
> +  } : text

Again just wondering: Wouldn't it be an option to avoid the initial
page size alignment (and the resulting padding) here, simply making
.data.ro_after_init part of .rodata and do the earlier write-protection
only up to (but excluding) the page containing __ro_after_init_start?

Jan

