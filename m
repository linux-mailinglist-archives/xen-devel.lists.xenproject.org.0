Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8088E777CC2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 17:53:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582136.911736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU7yF-0005uh-W2; Thu, 10 Aug 2023 15:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582136.911736; Thu, 10 Aug 2023 15:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU7yF-0005si-T8; Thu, 10 Aug 2023 15:53:07 +0000
Received: by outflank-mailman (input) for mailman id 582136;
 Thu, 10 Aug 2023 15:53:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU7yE-0005sZ-9d
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 15:53:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2053.outbound.protection.outlook.com [40.107.13.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd8c59b4-3795-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 17:53:04 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8413.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 15:52:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 15:52:34 +0000
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
X-Inumbo-ID: fd8c59b4-3795-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fy1yztWJnftEHBxbd++hiCIHnNmE/TNxQVuVWTliGY9pSe03gVIrdpKJ0ISIbSZ9fLnQKkOpaq55576jr2iDKCVIN5uP/9pNJeWjGhKB6omAvHgVVgpeB22QxBabwZc+IDsjvYM4W4eK/Lra8X1w8xsvWg7J0Wzj3kH1vmtSJy5ZgQYSGRkBEt0redIHIO5falcpJKHvekaAsjWJ8R6WSONffD1gdhq4bg9qBG2OuiG3xTKKEbICiPZdq4ccezi+3kBbVrGTdq3+1QS9U1/CT06+zKuAOF2OAv3ZIvY/U8jHkfYiQghrnZwiNLxtTcg2PswxbAxT55HJoMjOJLP3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z60Ti2fMSVeqHGDewhZxhZipQmInqV1YQBGZbZPUA8Q=;
 b=IuLn4xS5zooENP/UkYm2aVSArWR5dqVfjxYNk2OWq88uxLFvLzIXKdbCtpeJPZM5o+/ecQU+N1XqpdSUuJXrfRERAC92YuCb+9PgSEKtRmZXZ0OOjR+B5jmEGdKCBVRZn4WydsLPfpIBq7Qmzl1KMQVx0qLllS45QYU+apqcpfaOcY7TEXuqgCFD+7cfcUuqyxwCGBqOwipvbrwmwdL0yJ1IBRaYW/HKXazc+sHjZy4o7g7ESQYPC59kWMAAdY0pBXf2S+EtYeDsy2OZynWFc9s9BRkcO8n13McSCRR3Inc3+31ji8RslxG840ewS3+aWywUYrPvwfnH8Mo6UpM52w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z60Ti2fMSVeqHGDewhZxhZipQmInqV1YQBGZbZPUA8Q=;
 b=PGuNas/Ppk6s00uVKvFp42BFp6nlTlKEDw7cKL7ZXacS1bJV5EwL4FQ82uTPBfcC9XEg9nPzPjE2GL7oFYZEfMbjn0nyLXq/4twfwmk8A5fNqas4astbWksaTXJdVk0c/oeT2lMKl0fWeOd64DZ6AtDQ3TDXGPnSmTJ0ch7fnpTXijmKQZ33TQUAoRY8DKJj/Lo+0meGEgPvXHRducpWYPaolp/84O7N11Ts+Vb3V4HqMhLc5u64XReaG5DIWTGKs+Tx6gqJrJAHSTK9M2qGX/uSYmP2r5kcICv8WT42r1I5KlXG3MYAxSRe9CleGoIg3r0XF70gpYGDH2M40I//Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b8f28fc2-df77-96a4-a3b7-11cfaceff596@suse.com>
Date: Thu, 10 Aug 2023 17:52:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] x86: address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <bb162480acf030d31cff63f07d576967189ca2a9.1691681734.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bb162480acf030d31cff63f07d576967189ca2a9.1691681734.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 0035d7a7-ed07-41dc-4415-08db99b9d025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uFHWzIMDcigwwM3YDYvbZ0tlUIRql7fHG/UJIiPG1vkE83FRuF1B1n+FUzgVaob5exaClqXu0k0S7MJGXeU3R38dDzkApZlJNaRtUm30aQgrYY7JqmaNfFIm5luSe/fbdppTUtJ6pcKKDOUDMJPo1mQd5lhVn0kUGDgAEpt5KDUaenktxjRziZzjMtiE3x2pf/aoq6UcwcnKm50r0ZKQKrwhgACSV1RPJMxVkvPQSbctLZ3f3mBdWqk1h17z4aX5NFUZbAjUjfY0Jpyxpg/DxQoqKBjSmQ3jY0J8Gsc8CqOBnA+eb/DYQHy4irXmtiK3bBfXTr39fH1Yn1w6l+r4Tj0heTYdhgBPZDxLCNI/F2bpbebN68o7na6mxW4g2P6+B7e0GjTiIrSTpKX14CN3RTKzWDrVvgzTocdZUj+zO70/gYTvSxI3ohcxx3jDR9GMzleHBeP2gY08shttUA+IggRfHnkSKDzhqp/knNSxt1VsVfrREvFry83F6ajnTqYQFgqJ4ne2rr2SlhxsV8I2gV3hKlgiChAgb42pyk+YaqufoyzMyESjKuVU7gwFbcVPKPPIz/A2A/BCrj56w0XckXMZxsygu4CmnwOj/FjixjH637RjANjqp4Ga0mNpohmu68lW1I9bhfkmY54qEAEzsQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(346002)(136003)(376002)(396003)(186006)(1800799006)(451199021)(36756003)(86362001)(66946007)(478600001)(53546011)(66556008)(66476007)(6916009)(54906003)(26005)(6486002)(6506007)(6512007)(2906002)(41300700001)(7416002)(316002)(4326008)(8936002)(5660300002)(31696002)(8676002)(38100700002)(83380400001)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlJ6Ynh6UmZvUDZRRVlXY3phTS9OMmQ4RHhmTnZGenBxU3Z5TWdKREFNS3Ja?=
 =?utf-8?B?RlNTcGt5SDNQMks4N3VjbkU3cGNiQnhoZXVNdjUrancyWSswc3RLSUl6RmFm?=
 =?utf-8?B?MVhXVzdPdWk1MUNpZGNYd3grbjUvcEFRaTBpNThDOEhPeFJtbncrWVhZdU9i?=
 =?utf-8?B?aUZNejYxMkhEMndYOVVpV2l4MHo5RVl4cUgvb3RKZEVBTW53R21Ic0NiSG5q?=
 =?utf-8?B?RmpCV3VRUG5NWnZXUml6dXY1SUdSajRYYUpVM0phTVJhcXNkOGpqZk11cVJV?=
 =?utf-8?B?ZXNBcmdsd0NYc09tWmo3SGg3OERUWm1ka1NJNTVmaU5jM1FvYmh4bE5lQ2x2?=
 =?utf-8?B?TVF6T25vZG01ZzRxMndLSU41Ky9mQWFtRmEvUW1UNTl3d3lYVFd2RmV3cHow?=
 =?utf-8?B?aktNdVZFNDZ5WkRBU24zSWhrRDZuaS9JaWhqSCtHZHBFMzdUa216STZqaTBZ?=
 =?utf-8?B?QS9mTkZHOHhnaGI0RjFzRUc1ZU5vVHN2cGNOeHhsOWRaa1NYS0hJZGpsdlQ4?=
 =?utf-8?B?ZEF3czVXRHozUkJXSDlZQnVsSnRQVXdzRmNRaUM5c05hNHBuQU9qTzRCVFVl?=
 =?utf-8?B?VnNGZEUrcDVybEEwMTEvNVdkSFRIVlJUOXpXL2ZyblNaTHFjd2tqUjlhWFhs?=
 =?utf-8?B?enU2TkFmTE9PM0hTbXNiaHM3ZkRiK3dEWCtudVJ4YTl2WHBlV1VjTGRUOVJq?=
 =?utf-8?B?TW5BbEJLNEdiNXZOdElzSGpyMnBhSldFU0VjVnlETmR0clVkU29reWFOQnZo?=
 =?utf-8?B?bm5uMGxuT1dIWGRGUVRoYm5ENHdvcE9yOWxQVFgwU0M2WXpsTVp0QVVFTmQ5?=
 =?utf-8?B?VXVNSTZORHl4cjlPbUdpYUlLYzBHdVE0c2xiSDk1RjdxWWJTSXE3TmJZWjMv?=
 =?utf-8?B?bUlYb3JXY1E3MnpzbTVxNHhXanR5WGFHekVJUjUyUm40NUlEeW1FZ3JPSEhT?=
 =?utf-8?B?Yk9YRy94SDNRRklEdEFYUzJzVEw3Y0NRd1AxTU5XWU54LzdpUG1MOVcvcVR3?=
 =?utf-8?B?WFdMbnNFU1R3eTI2Y3ZrZ29sV1AvNjByWGtiOGdhRmh0SWZrdXVBR0QybkVT?=
 =?utf-8?B?bHhLT1ZudUJpVXlDNVYrNVowazljTDE3WS9RS0REYUV4VWRBWXhoN29qbllW?=
 =?utf-8?B?S0JRVGN4SlZXTVFtemwzSUtnekJ0ZXk2NkZOaFM3ZEZCMnR1bFlGb2VRUlh2?=
 =?utf-8?B?THFtVWswckV2L205UjFPc3ErcjdHWUpnR3NxYUd4dU5wdG1mWkZsRTJKVHdM?=
 =?utf-8?B?NG5ZWGNna0xiRk4wdHNNK3JTS3p0aGVUNzlramw5VE1vUEs1aitVQkRFRXNT?=
 =?utf-8?B?dUhDNk1LSHVvZ01aT3k2T2hjeVluYy9KbDh5WmRqK0tBbkdlOGFCK3ZRc2tE?=
 =?utf-8?B?bklkc1A1TG5ZUlMwN0c3dTVHRmd2dmJVL1NJQ0w1NklZbUIxbXZ4MC9JeUFM?=
 =?utf-8?B?MUJlRTNTT29GcmNwN082TUw4dWkrc1U1R0Z0T3BhTWpad3pEWTlRYlowTytR?=
 =?utf-8?B?cUIweFV6ZTFKdmQzQStqeGtHMEsxVzNhclhsekpmMVNIaGNBbTdaOUhZUm94?=
 =?utf-8?B?aWxibXU5Q3FkQnJEclZqV3NJanVvNkVhdWdQQjM2L1BjelNEejI2bmxiTUxy?=
 =?utf-8?B?cGFCMXY4RHM0cFlleEtwQnNYRlMrUnUrWG9yOWNsZ3lwTGpWSXRPSDV0VlZH?=
 =?utf-8?B?bjVVRW92b0taUXZmVHhPRzZkR2hCbkM0c2ZGd2pRZTJiTVphWW5DTVZ6SW1I?=
 =?utf-8?B?Zys4dzhid1FTMFVPYlcxWm1LSmJiSytyc3F0ZHYyVWlnTGFYYjVHaWhnM0h3?=
 =?utf-8?B?RlJYVUhXd3ZJWEF1QmNXWmRQZVNQQm1QWW1kTDdUTnVXcE84M2ZwYXlCekFh?=
 =?utf-8?B?c09SN3RCa1ZKSU8zWDRlN3ljbUFMUisvS3lGVWxjNXJXbjZQd1FTRTBKYmN1?=
 =?utf-8?B?TFJrOGhoTUFITkRYZUp1MlJacUFnY1BhdWxFYTh3eTAwTFVMVmdIYnhIVDRo?=
 =?utf-8?B?bjc5OHJEUWx1bkxIejYraGFRa2dWTWxoN0tvc3ljZnB6NFdrVWs3d1hrTGJO?=
 =?utf-8?B?WlJMN2kvTWxhYUFXV0Y1bzEwa2dwK0tMUGJFMC9jY296M1ljUzVHSFFEcVdG?=
 =?utf-8?Q?k4ivFy9aiuTAOYYCRJAhbP7s5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0035d7a7-ed07-41dc-4415-08db99b9d025
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 15:52:34.4868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICy40V4m9TYSClGd+bgGVrLIRB7ouwX+7leZvPrBLUqKlSjcQKK50JChYYuswErEvX7VP47koN9h1OaWGwOX+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8413

On 10.08.2023 17:40, Nicola Vetrini wrote:
> Address some occurrences of shadowing between the global
> variable 'e820' in 'xen/arch/x86/e820.c' and the function
> parameter name of 'e820_add_range'.
> 
> Since the function is only ever called with the global variable
> as the actual parameter, so there is no need to have it as a parameter
> because both are defined in the same file (mentioned above).
> This in turn causes several other functions to lose their parameter
> 'e820' because they are involved in the call chain that leads to
> 'e820_add_range'.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

The changes look okay to me now, but ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -686,7 +686,7 @@ static void __init parse_video_info(void)
>  #endif
>  }
> 
> -static void __init kexec_reserve_area(struct e820map *e820)
> +static void __init kexec_reserve_area(void)
>  {
>  #ifdef CONFIG_KEXEC
>      unsigned long kdump_start = kexec_crash_area.start;
> @@ -700,7 +700,7 @@ static void __init kexec_reserve_area(struct e820map *e820)
> 
>      is_reserved = true;
> 
> -    if ( !reserve_e820_ram(e820, kdump_start, kdump_start + kdump_size) )
> +    if ( !reserve_e820_ram(&boot_e820, kdump_start, kdump_start + kdump_size) )
>      {
>          printk("Kdump: DISABLED (failed to reserve %luMB (%lukB) at %#lx)"
>                 "\n", kdump_size >> 20, kdump_size >> 10, kdump_start);
> @@ -1308,7 +1308,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>          if ( e820.map[i].type == E820_RAM )
>              nr_pages += e820.map[i].size >> PAGE_SHIFT;
>      set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
> -    kexec_reserve_area(&boot_e820);
> +    kexec_reserve_area();
> 
>      initial_images = mod;
>      nr_initial_images = mbi->mods_count;
> @@ -1495,7 +1495,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>          reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
> 
>      /* Late kexec reservation (dynamic start address). */
> -    kexec_reserve_area(&boot_e820);
> +    kexec_reserve_area();
> 
>      setup_max_pdx(raw_max_page);
>      if ( highmem_start )

... this isolated set of changes wants either breaking out into a separate
patch (as suggested before) or at least needs mentioning in the description.

Jan

