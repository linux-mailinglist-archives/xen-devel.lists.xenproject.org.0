Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD196CC1B4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 16:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515886.799204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9yU-000649-76; Tue, 28 Mar 2023 14:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515886.799204; Tue, 28 Mar 2023 14:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9yU-00060l-3O; Tue, 28 Mar 2023 14:06:58 +0000
Received: by outflank-mailman (input) for mailman id 515886;
 Tue, 28 Mar 2023 14:06:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph9yR-00060d-Tb
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 14:06:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cabba360-cd71-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 16:06:53 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB9446.eurprd04.prod.outlook.com (2603:10a6:102:2b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 14:06:51 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 14:06:51 +0000
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
X-Inumbo-ID: cabba360-cd71-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myD8+qFKdKMkO5VStvnRjXVLV/YfRnbipdFE5EtYVe3f8sOrCUxiSkTGbQx6vo/HuE5znXsUzxTlJ7NBJgzE4wcOQAYtg6CTy4WtMGsGyrRHDpEYuyjTafbgmdHJ2CE2qZTCPVxXzaa9es70etn5TQgLsmTGtH1BQ6OIVhAhZ/0pdtP86O23QYqIHQdJbwE941CiFhiiq/zq7qR/1GZJoAuWUFdAJllV9wtM9txXpLvmUhUczFd8Sr5ANksjt9pWYvX65bUu8Sn1hHwxPaQq5SM/HtLcR40njfxj4v6tyHdcZgneiCwFU6fGWU9i35m4JxBuo1mi9nib0xlD7IWMJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dk4CB2bDUPrvY3FuJimChSSIF7EDCoyJ2LS0qWZRRfU=;
 b=V5EU0oyL3oYyyLnTnaSql5AI80EV7gu2Qn9+WGPAZRnhLCy5OrL9niK5JTodq/DMSn+oEAbl5eH57A+MDCFI71cnhe4CZ6/JM2sffTOzckSTkabCtu/PAEpK8Pn+Og2iw38rknxCHwY/f5YP5oiHU0L/mNjuJxMea0gcIpmVX+WQLvljVkV5or9r8lEe2DoZI1T54sBPO55YK5jBcCkkPTY2BqucuM2HieLz+nhRSf/KPEuhkYzxwV6EF7rYreNT2s0ecrdabnGLkCMqAOT/q0uwP3AxG1br8nDUZ+hFofCHNk1B58/bFDAjIkLrtyHnXi5QqhndQu2dEZkXHg9MGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dk4CB2bDUPrvY3FuJimChSSIF7EDCoyJ2LS0qWZRRfU=;
 b=SUoOKedjMd8v16SM6Gfhng5kgIH+4BNucMUHSG+bnfZyhYhABpw9eiSe70WS1HYluOnyQJx2dQyPIqRzH+zUk5vJEGIv0adGBt2rc6SoALucId0ILlAQMxO4iBSD8cTHlPbTE7JN+t1cJjGrZ3C5QMRZKiTHVp0T9G/KjDRelLpC4AssB246685GNdqKagNSjEQzSsYRUdiLLTDXEZWmHEJ+dSShg19QEnGjvT5lQHnaM1vD1wqK47Xaz+MY/89NBHL85C1UVRIodleJuPZgptUw6lAVprCCDSjsmMewti5bOFgK9y7udM5F2z++i+kqPWRGJ3kN4OdXUOPbvEFD1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <310d2d40-223b-5cd2-97cb-d9e40441c254@suse.com>
Date: Tue, 28 Mar 2023 16:06:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] x86/ucode: Fold early_microcode_update_cpu() into
 early_microcode_init()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230327194126.3573997-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB9446:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e8dca27-02af-44a0-68ff-08db2f95ad73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VrytbZkGKq8IPLyXKCivM8YBkbrtL5tMsca6wFW6o8Jm2METEloSOw0sgwPvFgBZQdhm9+UWhWMU2XnrIlaMB+QA6t5Zw5Fl4rbe2dd9eRcL4Xcz7Me6YaCkNjSPyvSnq51sqys1TqWgRhYMQcquLz/95g2agP6oZ3rMaS5MD3UuzbruEVdnORpOPbBC+Ynke8sc9D7AZzX5OY5gictmkUUjjWKg5npA88AYb21hCj38yBUSX5EOG/t2++UxYe3orW4FNzjFu+4E+soNoATLT+dh5F1isCGDpe8oDOZoijv6N7mAatS1RdG9HqZB1o4efuenIUNBayRItD97jvNLpJYs4YgeZnP6TLcvw04eynvH3vm2XqBL+zt2BqR+axMqXlbxRtH/KO8S9zvKu+ClZTFkrsHtqXVDlt5u/sBjmvscoFHqzbYEHZuEuOTIeWyqbymHz6Q8BfSeiv6H8VV5rAUrwJLkZFy0K+RIFGs0KGCh2LiN4ZmAbnTrrdsiMIp0AX0fc/yoW0CReX0fCGSj/2i436brFOl1DeDfE9EQPII6VOkVFneaIAPuqDulCM0pqIH5lr0G0KuXeXugbrefa1AJSjKsHG5vHXOZ6+febqILXJ2DN3yAPB6vax7uix2yAS5dmYMcVjs9bTwnk3p3Tw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199021)(54906003)(8936002)(5660300002)(66556008)(66946007)(478600001)(66476007)(316002)(41300700001)(8676002)(6486002)(6916009)(4326008)(31686004)(2906002)(26005)(53546011)(6506007)(186003)(6512007)(83380400001)(2616005)(38100700002)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGduWk5meUZTMFozTWhPNlBlUmxxdTNNN3dEb3ZkQlNqNXFvc0dqeTM1VVc2?=
 =?utf-8?B?R3grRnpOQkloTTNETXU0WldWUDFRZVNFeDd2SVF6aHNDUC9wUDVDRUE1WHpB?=
 =?utf-8?B?LzVaZkt0K05aZzk5MmpzRWwwLzAyNGNtUTNzYWZMRXgxbjFRWFpnYXJHcnAx?=
 =?utf-8?B?SGpvZFo1SlR0dlQ4cXNkSjZyV2pmWWppQ2JJNzhCVTc0NktGQWtNSFh6Z3Bu?=
 =?utf-8?B?ZXV6a05uSWRYV3UxaXdMYUxJN2JFazdWaVo4WXljSlBSdTdCYWh6a25odVZM?=
 =?utf-8?B?TWVuT2RtTW9KWEhMMzBlR3FFQmJNeTlOVWFsSENEeTFGeEw0MTF5WkZDM2oy?=
 =?utf-8?B?ZVpKTGlrQktCZzZTb0ovdENGRVhZNkxUdEN2R2dZbHUxbFJZY3Y3ZXcyd01i?=
 =?utf-8?B?Mm1uL1N5K1Z0T3VTWFF0NDJhU3ZyRk04SkJpeUZQOUNQd01XNFdKQy9lajEx?=
 =?utf-8?B?c3AvVlR6aVRaUENjMzlqWmwxcFJWWm9KcmRDWFNpalhFc3BXSjBXTXRja1V0?=
 =?utf-8?B?Zi9XZG5mNG8vaW51aFBYQ3dyaGpOdE0vMzgrbXowMktVaC91eEF3YjQxTjFW?=
 =?utf-8?B?U1pWY3BOQUVqMUVaRDgvYjJVOE05MXNFbGVlbWVGMHIzNFdYdUFlOXFJNUxn?=
 =?utf-8?B?bjZvQTNSWnFVa1RiMGtsYkJCUXhBM2xVY3JjcmlObmYzU0U3V1l2Uit3UE5q?=
 =?utf-8?B?WkJsNlJQU2gwYlhQOHVaRDhZbjlmUEZOVmZuWUJ3eXNNaTF4STUwUUFzRkxp?=
 =?utf-8?B?eVVzNFhTL1kxc3NzWGF2NnI5MkxSbmloeTF4S3o2Q1FOS01CaGozUEFaeGlz?=
 =?utf-8?B?Zlp5MnU2T1dtSVdlRjE5eTRGZ1c0bzViZGd3VDdvY2RLNmVXQ1pUTmZIVjlE?=
 =?utf-8?B?bC9HYVo3c1Jpa1dhMDl3Q2UwcDVMbkRZOTJnaTBDTHFJelRTbXNkaDZsLzd5?=
 =?utf-8?B?WTlzMjhJbkJmTmdpRlJUY2Iyc2lTb1BMUkZtSkFObG9TMlY0WWJFUWhwclE3?=
 =?utf-8?B?RmM3YldZMkdCVi96anBMRDJ5Z3pNbUkwZUhQRjFLdFBYeGZ3Z1RpMFhBSnEy?=
 =?utf-8?B?K2FrTDlaRTFvcTg0TGlBOEVZQlh1Y1Bjb2dYV2NyM3VwM0FoNzVaZW5JYmU0?=
 =?utf-8?B?MnZHZmtLZFI5T1AvMzlDdUVQTHFQdWliSGhpVXBmVytlSldqR1JtTlhFUFBs?=
 =?utf-8?B?ek94aE1uT1FZR0Z1N2FQSU1BVURBV1dpMU9xeEJGM2ZoVG1XeVNYeVdDckVT?=
 =?utf-8?B?YmFWOThBWWNESklFWXA2L3dkTU9CK2w1R2NVS2JENnl2SnNCQkpIQUErckdn?=
 =?utf-8?B?Zi9wbjcrOG5Sd1k5RVJ4eEtpZ0VQRXE0cDVGQUIzdlkyaEU0SXRwbWE5RnVF?=
 =?utf-8?B?VEV6SmJUZVJ0dmFlQXZqSlA4ZHFMdS93QUxaWmRySnVzWm1tT01rYnhubmZi?=
 =?utf-8?B?TFRqTWk5WFIrcnJJcVI4VHJncG04OG5iY1o2eXJxc2NmZ2M4SGxnSGF1OXpk?=
 =?utf-8?B?bE1OWUJYYzRhcGJtUU5ha25nKzRlRFJ1aU1tS1M2WWd6d3hIVXpWUWxibUla?=
 =?utf-8?B?VGdGd3lPeFF1cElsK3gwaW9jckpieHFKcHZXcHdncUNoT003cjJYbWRncHEy?=
 =?utf-8?B?TTFzenBhcElZVUROelZhSk5vTjZrdm80QlBaTWUwRGJQbHlFMDJzbENUTWh5?=
 =?utf-8?B?ODhoWFZPUG5sTWZ4VjNYVE9PTjZVSm1maTQ1aXRLRk5qM2dSL3ZpT1lzaldI?=
 =?utf-8?B?dFUvYkhxYXhIWmVpK2tCNERQSGc5UHVSZVhTTzhta3Y5Nno0MVNhRnFEb3F3?=
 =?utf-8?B?eGppendCblNFK25kWmJGQ1VzbFZlSGk0RXZLTG5CZ0ZMb1M0Tjd4eUNKWEhn?=
 =?utf-8?B?L3BZS1ZkZGpKMGR3NmpERmF1c0hPeDc5VUlQNHBFQlFwUmpnMmZDZngrK3Vr?=
 =?utf-8?B?Lyt2aDVJSnpXMGdjRWdtUkFaek1pTGpnUzljMmVqc1ZUZXo2YkREV2ovc2dj?=
 =?utf-8?B?Qkx0ZDUzTlQzZlJQQlVWT2FpVTl5TGlLLzNaajZlYkJzcldQSVJobi9keisr?=
 =?utf-8?B?RCtEVXB0T08xNEFVR3prOWdmQmZsUWZaY1dhRlVGK3ZqN2h5SjdYdmRVUDM5?=
 =?utf-8?Q?FcSMPIQ38h50dbf80eKDKRYVr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8dca27-02af-44a0-68ff-08db2f95ad73
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 14:06:51.1199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwJxPjuz4nUF+KqFNkHzi8YTtFApoYQaVSRrLqbqmP90GszKYeNjdXBvHCUtwbLMuVfB6J+XgmiBOzNImwwnlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9446

On 27.03.2023 21:41, Andrew Cooper wrote:
> It is not valid to retain a bootstrap_map() across returning back to
> __start_xen(), but various pointers get stashed across calls.

Same comment here, and ...

> Begin to address this by folding early_update_cache() into it's single caller,
> rearranging the exit path to always invalidate the mapping.

... this looks to lack editing after copy-and-paste from the earlier patch.

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -804,45 +804,12 @@ int __init microcode_init_cache(unsigned long *module_map,
>      return rc;
>  }
>  
> -/* BSP calls this function to parse ucode blob and then apply an update. */
> -static int __init early_microcode_update_cpu(void)
> -{
> -    const void *data = NULL;
> -    size_t len;
> -    struct microcode_patch *patch;
> -
> -    if ( ucode_blob.size )
> -    {
> -        len = ucode_blob.size;
> -        data = ucode_blob.data;
> -    }
> -    else if ( ucode_mod.mod_end )
> -    {
> -        len = ucode_mod.mod_end;
> -        data = bootstrap_map(&ucode_mod);
> -    }
> -
> -    if ( !data )
> -        return -ENOMEM;

Like in the earlier patch this looks to be lost.

> -    patch = ucode_ops.cpu_request_microcode(data, len, false);
> -    if ( IS_ERR(patch) )
> -    {
> -        printk(XENLOG_WARNING "Parsing microcode blob error %ld\n",
> -               PTR_ERR(patch));
> -        return PTR_ERR(patch);
> -    }
> -
> -    if ( !patch )
> -        return -ENOENT;
> -
> -    return microcode_update_cpu(patch);
> -}
> -
>  int __init early_microcode_init(unsigned long *module_map,
>                                  const struct multiboot_info *mbi)
>  {
>      const struct cpuinfo_x86 *c = &boot_cpu_data;
> +    struct microcode_patch *patch;
> +    struct ucode_mod_blob blob = {};
>      int rc = 0;
>  
>      switch ( c->x86_vendor )
> @@ -868,8 +835,37 @@ int __init early_microcode_init(unsigned long *module_map,
>  
>      ucode_ops.collect_cpu_info();
>  
> -    if ( ucode_mod.mod_end || ucode_blob.size )
> -        rc = early_microcode_update_cpu();
> +    if ( ucode_blob.data )
> +    {
> +        blob = ucode_blob;
> +    }
> +    else if ( ucode_mod.mod_end )
> +    {
> +        blob.data = bootstrap_map(&ucode_mod);
> +        blob.size = ucode_mod.mod_end;
> +    }

I wonder whether the order of if/else-if being different between
microcode_init_cache() and here (also before your change) is meaningful
in any way. I would prefer if the checking was always done in the same
order, if I can talk you into re-arranging here and/or in the earlier
patch.

Jan

