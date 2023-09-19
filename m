Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26DA7A6569
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 15:40:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604759.942259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaxK-0005Ci-Le; Tue, 19 Sep 2023 13:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604759.942259; Tue, 19 Sep 2023 13:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaxK-0005AF-Io; Tue, 19 Sep 2023 13:39:58 +0000
Received: by outflank-mailman (input) for mailman id 604759;
 Tue, 19 Sep 2023 13:39:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiaxJ-0005A9-3s
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 13:39:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0423e52f-56f2-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 15:39:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8330.eurprd04.prod.outlook.com (2603:10a6:10:241::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 13:39:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 13:39:51 +0000
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
X-Inumbo-ID: 0423e52f-56f2-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkbTNTtZYZQ/dVjEy3KUhyBIsgenpdZQXrMTDFmFkASKxYy2Vvg4hqpgsS5+CDavHbhlpPCgghjIALwj5xmvsu8DjHZyEsjuXHxp27FjDobPV7iOTi/EG3ayGR8T0jNrO5bK8MTxpqaX0Rt8ppShywYYyf4xTVebJO8RhpnJRuYu8w6rn/dKeqgaHffdBzSVzax94ysOXEjCzCB3Qq889e1WmVnYy5iRShZtuofxTdfwdVFaXdsu7g/3uDnjrHOPCtJ3zQFaRRGIyy5rwLVVMxGNp27YQoLRsJuiJ8G/zvwprS0l1G9gOKVN7xpAksVh5d6cbYPachnRvQQiM1tBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE77XIIREE9ECC2hP3WdScR24/fTLYEKuHkJydljJbc=;
 b=HA0ZPrFe0lLKsN65XUnTgFZhNJfLvIGu0zxO22BytMV9nHf1R5IrpibywoZK1Yg4W4v063LdZzesTXWiFgIE0wQfr8bKwQX92PGISt6EfPN1UjONPxjOCO7WVgS9SO0+ivv4MUpkzxHZowbIK1LbaQRMZB/25+H3VEhPA7n4JBGXwi2NzEGCliaplkcb9W5beOA+IYFsp8CPUIJ/jSj2MgAyauY+VIG8N/9lXE0SSFL70mZ5Qmu/YpBFPl7fbxx8V9JtqushgA5e9NERA9+wAJ6PaQesX/EbxxF8uroH/+w7D5dZq2gaEbpwAyEfn+0tO4z+vsakMlYNb1zvyvphfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE77XIIREE9ECC2hP3WdScR24/fTLYEKuHkJydljJbc=;
 b=yKJrBuTiLsZ5yV0XrNI6nj05QJCNF15qUGgYjhhYZYyhIPiH+sCpFxUG5uj/1JlCDt832UMavyhKwG0I54i+8vgf1RaG80cx+nbC3iAjYTwG/EC+x1GKYwNSVNzYntPL3A3mEP+3rSTRyDPU1LBv3DsONMTOelo3GHUGVKdCMRORU/ZzQgvcZYWZTJavSLAO09TCY7cnP8ksKCO86sFVf9u/Dh7tw4PniSEPjVlcwaQrOTTs8H9/SLPKl5cprUDaczKJ/fbT7pXzH8tXJD0oBtcyJu0p3Bww663las/l3nZUUUV93vPn1rQl3A9bZKtpgKq1Ip8VYuTNVcD1x7PD6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b460843b-3dbe-03af-19f4-80e715c8aca0@suse.com>
Date: Tue, 19 Sep 2023 15:39:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 02/10] x86 setup: per-arch bootmodule structure, headroom
 field
Content-Language: en-US
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, xen-devel@lists.xenproject.org
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-3-christopher.w.clark@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230701071835.41599-3-christopher.w.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de2aeb2-7a88-40c9-12c5-08dbb915e65a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r15ZeOAY9CW59UX9XWVBhh5VpYtMPfGI3hcVpcX7gnO9Wd/Y3jHmI/hecrBlVvGm9ThN9hWvCeQ+yubHojkRqv0rqi4r7+pbwD7Z0y8QqvjgJhD6jVcelR9kGeTNGgjmu3OCia0a7TTQJaso/lqXLLt+v2b6Lmbns6vsjq8YaPG1BoebkdS20UbiQkIURkpRd7nO53mo0/MAqNRQ3h00pMEuWqbv1LRb/uz3IKqK1lqIm88sXMGCNsYN1CkdDr0t3XQTT4+6SeetE2RuNW465580dIQQGrJ4igIMPQpp2eYoOVYI1u+l4k81COWcQOyUvrfax59Dmt9OI3/WcD3R7AZ/+11Zf/8ykO/C7/bqhXt4E4yiyLKkPAo3fFtz0rmZ1fDa8kg6BigYxqaDYTUKVWzRwFOSGFsOrM7PY1wMHKHtR5j2pFKoJhQKkikiAGBean4ZpucuaKEVxU/A1j9tayisgXtD6UwCoq0k5N5NWECrjxxJHab7PTErTwpJhjM5Fh6Bo7yw0GKMNwhWkHJGHxgx9+wMVm58BLidGzgbmKTglGGcZvFWVp+IQJsm9X1rd2RIRJE5EpEuqwa0XjC4LDOMr+rx9vO48anbOk3nb752x3jU4iOTV8pGJrY/uOJyVGMShNuvdq/Nr10RDxXweg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(396003)(376002)(39860400002)(1800799009)(186009)(451199024)(6512007)(53546011)(6486002)(6506007)(66899024)(6666004)(86362001)(31696002)(38100700002)(2616005)(36756003)(26005)(6916009)(316002)(54906003)(66476007)(66946007)(41300700001)(66556008)(7416002)(2906002)(5660300002)(4326008)(8676002)(8936002)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am50RTZleEhtSGRZZDA4dDdrV1F0a1AraHBkVm1pTWpxbTNCdXNuK2dXKzVN?=
 =?utf-8?B?UXVJUkdrd3RRcFVEZFg2c0toNW5CS1NyVVlkaFlxSmplRmh3YlRmZzJHRFg0?=
 =?utf-8?B?bEFCZzgyTDdsOXNHOGd0cVg2UWdKeEVnaFdlUkNYZTBERW9aL29kTnVQVjJi?=
 =?utf-8?B?eEJLaXhIcXdTeUNGNDN2YUhVbHVOaFl1RHl1SVhVOEx1SFA1Ri9UVmEyaXVN?=
 =?utf-8?B?LzRrRGk3SmJBYUNBdkJ3TlhSck5IMFExK1VRRzJ2VVY4TWV2bk9EVXMwWnpW?=
 =?utf-8?B?RElXRG41ejAzZU5HcjdLZDhNL0VsK3FxZWtJZHpiaFdFNHoybGE2Y0xrWXJp?=
 =?utf-8?B?SHZ2dm5CaForS0grTGlOS2VHN3V0M2xtcWxiVE93QlpUd0k4bWRYTkxUdTBT?=
 =?utf-8?B?RUJ5MUJ6NkpTcjZSUnNyUW9XK2hOQzZDdVJUbk1tUHUrZTBNTGhmNXp1ZW9w?=
 =?utf-8?B?NzNzdWo0a2hUa3JXcU1FOWlwQ3p3ellxNUxQYUtROWRrVGFUN3hiWjVjeWxa?=
 =?utf-8?B?a0V3eE94ZG5oVXF4MElFK1dkaWhQY1JPWVJKZUhrVkdORUl1ME5kMVdUcnQv?=
 =?utf-8?B?TGJQcCszOWFJaXZMbHNzNG4rYjRBZytpTkdva2s5SWZUTDVHaTA5b2pMMVVK?=
 =?utf-8?B?Nk9pQVpWS3cvNjhycFpSQS9aVEdGN1ptZXdMVktSNFVYMHVaZXVYRG5GWXlp?=
 =?utf-8?B?QitXcGhFMEhzOXlzYVhFTGtFVHQrcHVhMjFSYWRrT2xDVmV1bzV3N3BObkFO?=
 =?utf-8?B?ZUlhZVUwQnk2OTgwc0RGUC9vckExWTU2cVNFYWNQU1dCblZOTmZWOVFTNWQy?=
 =?utf-8?B?anFjV2R5bDJ5SjN6OGNLNjFPNzk2bFM0TjJxRjhIOVZHQTRUL1RLMEJ4TVl5?=
 =?utf-8?B?d3FzV0tZZGRISkphQkhsNmVZNkx4U09sSVVFUldXQzl3VkVPQTNmTEZDdjJL?=
 =?utf-8?B?L1ZaYld6SmtNRS9nRE4vTjJQNWxhekx6SWoxaTBYMWt5V3J0REVjSUFGYVNi?=
 =?utf-8?B?dGJoUUVBMFp4VEV2cm9VbHlkYlJSeEovcXd2TEdTS1IwRisrNnRLOHFVbnFi?=
 =?utf-8?B?VjErWXdFUVhtcDAzWDhqcnE4WDdWbzJpRm52NTVrVVdoMDdjVFlLS2UwdVJu?=
 =?utf-8?B?MXVDeDNmTW9jZXR5K0VHZy9wd2pRSWJOQnBtMXhWMVRNRnZzYzJzVmRJeTZp?=
 =?utf-8?B?MnJXVE1KdWdjQjV4MEhLcmprK3VTYm83MHZteUlRLzZmZzd4UGd1RDZtNVUr?=
 =?utf-8?B?ZmtGM1pPZ3VtRzBaZDRwc3pXRk1rLzhsUktOelRpdG1UVjZzb3hjcTlSbXJz?=
 =?utf-8?B?aXBMajMyaDlnQTVRb1c5N3FTeE9lNWtMczd3NFB3UmVqei9LVGY2dmRXRmpZ?=
 =?utf-8?B?NHZmejdCdzdyL0FGY3NTUnVKSjR2TXQzODJ5OTRBU0hYWGRCYmRyNzluWEJx?=
 =?utf-8?B?NGNKUThERVpKYlJVWlZZWWRHdjRZR0JuRUQvaWkwVUlrN01kR3I0NFFFT0Q0?=
 =?utf-8?B?VkQ1TndOb0FaRzhFeHNQR0gzdTNOcUdGU2I4aUtkQXBxUFNuSkYrc1VOOVB6?=
 =?utf-8?B?dG1JVXVyWjJDUWxzTGNjdHNSL281UTVxUXdKMWFsVytRZzNiK2tJT3IzaEkz?=
 =?utf-8?B?bzUrdVBqN05haXYrNnNnbU9td0ZXUnVjZU03enhvcXhXWjhpU0dkc2l0MSs2?=
 =?utf-8?B?ZU1ja3Roc1U2VmZtS0JDbnhPS2tmRzZZK0ExbnZya1lKREJRL0RTclV5bU9B?=
 =?utf-8?B?RnRjZC9QVWdnY3pyZFpacEUxR29STDFhWnJsdnhSY2xzQ3N1VkdXeXR1TDk1?=
 =?utf-8?B?aWFsemw0YWJEV1hPMWkrZlJmaUNtTVJBQVVETVRYbTlyTUd2MHh6OHN5VkRt?=
 =?utf-8?B?UFZXSVVtZXhjNTlEbGdCdk92TXF0UTlOTDFjaFdKM2RkY1pDcmpDbmlVbzNH?=
 =?utf-8?B?REsvRit1ZndLZXJJdXJkQjcxWkVvN3lNNTA2WXp4ekwrbnFBdXpKTWhOSnFw?=
 =?utf-8?B?UDFDS21saUZmaElGTXZSYUROdGxTdDQ3bWNzTzBwREo5WTBSc3c4VG5iQkR4?=
 =?utf-8?B?VW0yRHBaU2RNZnBkSnl3VmhKaG1nTkF3VjFXR0dodCt5N0pVeUI2ZzhZOTM3?=
 =?utf-8?Q?Kwe5bMuz6YCdBwISiMdmAwwdf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de2aeb2-7a88-40c9-12c5-08dbb915e65a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 13:39:51.4147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZsu8BiQ8Nrm4/oJkLdV2kKVZewBNAJ4ZQBL3qMdiHzjbaRRT28Nhs1oZIOvNAQRvh+xsFqw9y0OGotzPmJrqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8330

On 01.07.2023 09:18, Christopher Clark wrote:
> @@ -105,11 +102,14 @@ unsigned long __init bzimage_headroom(void *image_start,
>  }
>  
>  int __init bzimage_parse(void *image_base, void **image_start,
> +                         unsigned int headroom,
>                           unsigned long *image_len)
>  {
>      struct setup_header *hdr = (struct setup_header *)(*image_start);
>      int err = bzimage_check(hdr, *image_len);
> -    unsigned long output_len;
> +    unsigned long output_len, orig_image_len;
> +
> +    orig_image_len = *image_len - headroom;
>  
>      if ( err < 0 )
>          return err;
> @@ -125,7 +125,7 @@ int __init bzimage_parse(void *image_base, void **image_start,
>  
>      BUG_ON(!(image_base < *image_start));
>  
> -    output_len = output_length(*image_start, orig_image_len);
> +    output_len = output_length(*image_start, *image_len);

If this is correct, then I would imply that so far we passed too large a
value (a too small one pretty certainly wouldn't have worked). But I
wonder whether you aren't passing too large a value now. In any event
ideally such a functional change would be split out; otherwise it very
clearly needs mentioning (justifying) in the description.

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -0,0 +1,18 @@
> +#ifndef __ARCH_X86_BOOTINFO_H__
> +#define __ARCH_X86_BOOTINFO_H__
> +
> +struct arch_bootmodule {
> +    unsigned headroom;
> +};

But this isn't a per-module property, is it?

> @@ -961,7 +967,8 @@ static struct domain *__init create_dom0(const module_t *image,
>          write_cr4(read_cr4() & ~X86_CR4_SMAP);
>      }
>  
> -    if ( construct_dom0(d, image, headroom, initrd, cmdline) != 0 )
> +    if ( construct_dom0(d, image, boot_info->mods[0].arch->headroom, initrd,
> +                        cmdline) != 0 )
>          panic("Could not construct domain 0\n");

This looks to render the function's "headroom" parameter unused.

> --- a/xen/include/xen/bootinfo.h
> +++ b/xen/include/xen/bootinfo.h
> @@ -3,8 +3,19 @@
>  
>  #include <xen/types.h>
>  
> +#ifdef CONFIG_X86
> +#include <asm/bootinfo.h>
> +#else
> +    struct arch_bootmodule { };
> +#endif

This wants making use of include/asm-generic/ now, provided the non-x86
header are going to remain empty. Otherwise arch headers will want
introducing right away; there shouldn't be a CONFIG_X86 use here.

> +struct boot_module {
> +    struct arch_bootmodule *arch;
> +};

Why a pointer? By the names it's a 1:1 relationship, so ...

>  struct boot_info {
>      unsigned int nr_mods;
> +    struct boot_module *mods;

... only the pointer here is what takes care of there being multiple
instances (likely as before represented as an array).

Jan

