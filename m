Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084B8757DB7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565262.883268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkrE-0001N2-Hj; Tue, 18 Jul 2023 13:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565262.883268; Tue, 18 Jul 2023 13:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkrE-0001KD-Ew; Tue, 18 Jul 2023 13:35:16 +0000
Received: by outflank-mailman (input) for mailman id 565262;
 Tue, 18 Jul 2023 13:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLkrC-0001K7-ND
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:35:14 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecb07680-256f-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 15:35:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8811.eurprd04.prod.outlook.com (2603:10a6:20b:40a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 13:35:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 13:35:11 +0000
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
X-Inumbo-ID: ecb07680-256f-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIJJQPwQ/yMMtlE+x2elF3274LxzNzpRasIQY0upPkIuOST0lxjgqSIcLqiauEFdUi+0jf9BRhktoashpYGMr6l0D6eMBFOs2MjhDeaFCOzzN2nTYTWXCTgJc5qyHo+4dfpyC5lVxUdswex9n7cfK8zdcVq8ZTK8vTO2HnWWWNhDP8Qwg2acPudUw+hDFKdy4ASrzb1398OOm3hPff63xkOsaSZS02YhLAHV5BSqZJ0XB7WnVSoV0l+s/DGO0iy26iyE1b8MCjTus3kQv3L9q1CL10+EBHpAl7/xwid23Bmx6nnw+9gCXwZTISN7kgIOs+cyD50oN2uMBrWSE25raw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKNiIAb7UMZ/CQOhwRgB6/YTS04hMOKJYnQBe1pbbUM=;
 b=By2Pntlw/9ueZvVvWKmstWTvlhAAVYXSja4YjYVTUO5KFaXCkWFocY5GCHZQ4GmSKlRm/NSXy4XmxDncd2KGQ869f5X9KngBLjJ4EqCmir2hxmrZWZlcwllQyhWTmp97eP4XCe0ERZYLrELQRXdT5GkfrcHYvNfvJdv6TIuiAK7c9mfwHr3/Rj9c6Aicn+llPkk4nrBNsEg3cZvfEtwMbyUkii9rbL0IUC07mKxFRRJZbWztLcSpbiqKQnZOVL8OIsvL2sARgLep7HtJvFyPkpZ7hnfTUJ/VRHOZU4/JxAb+0hYzyJpMmDl79ShFmev13M/7fLf+i8De54Kv2BwYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKNiIAb7UMZ/CQOhwRgB6/YTS04hMOKJYnQBe1pbbUM=;
 b=hxebelQqZjoV3oBasJqws60uXfCCtCXezKGxpaKgWOj7VBo0/AsZ9CAe2S4qUl1gOB1L9sBz4yH0QQYw/E4dZ1vJEJpU9E9k1t4hAg0kUfZBfNf/7e7drHb1JU0xQJBUfTzRm2qyQMrOZEmsc6wnl5YwBa46CFmbmyQmfnvJixvVjC69kfCDDa2lNJD/eXwPXA3HzgyUKionwbmLllD2/CJGCxjoO0f5gXEa+O81aDMUpvGLLzkHomCUlmZ6niJFtb65nODpx+8j05mAzHTx4KqpLBMYEQJzb7R/WjXbfmNJH3RAa8fRcIKpwpg7oUaJAiGumZKZcB4T44M1hH2UWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa23a090-1883-008b-e395-2a3bca709258@suse.com>
Date: Tue, 18 Jul 2023 15:35:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] x86/idle: Get PC{8..10} counters for Tiger and Alder
 Lake
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20230718132334.2087-1-simon@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230718132334.2087-1-simon@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a311cb-ce09-42db-464b-08db8793cf66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MrIawZzioBqiwxIFgcotx1RX6Ut0X+znJmCz3t12GhL20WwidVonF77bF8SfE7U08nqTJwtzuIdfweioJKLLoJ4v0euX1us0kYEUEZAbHe89REKIAcobHdn6Ms98ZOrNaAv6CKL+B53zk6W+c14biSJqEQqVrjCQMaRm+DOR1/9CgfyT6UZil/EfyIQnD/W+CskRSi9AtCMYFIT5vWYhDv8LarVlXfM0ENM5vWkFpBAvXLyItZCQtvOZwBRpJTl+FExRB4M+0GFW+L7DMtwMVtqdAkjV/IBM03l9laKFAriWuhscwDZ8vOFZ6+JSKonIsLykpQ1vTQzlXsdpkmFXAyVh3USzfcJHZoeSO2o+lDETzclIBW8FLDwQf9nJLUokZxCBBkJROdAhOP6mxWcPLH/Op7B3xgBqtU1ECINk2hYAQKoUr5xGeC2ArnTD8U1tm/DNZ11HpImuM2hjaRyUAYWjIVJLQt18wY3XYJQ3BWRGMCLpJX8cf6MXc7b8wq2T+iYkTo0K3iHkbdpXas7FiTY2Ubkxc82OtaUB6WuR2/YBmjuEst6WjDFBGfIPyVLfo6shClT9KPhevFGAn/VkwTIq+Ru8RpsGmHqVxQfpG65Zc8gPO9liOWM8iZn1uEsX5ms3/kn2DIeeBo8Ti64+er/gnZT3ZGxSAOucwDdoogCo9VoZnj5z/XXziyYR3bkw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199021)(54906003)(31686004)(316002)(186003)(8936002)(8676002)(478600001)(66476007)(66556008)(4326008)(6916009)(41300700001)(66946007)(5660300002)(4744005)(2906002)(83380400001)(6486002)(6512007)(86362001)(31696002)(26005)(6506007)(36756003)(2616005)(53546011)(38100700002)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDdySGEwbHZWclkwOUVKUEhLUFVSdlZXaHpPNThBVUJOWVZIMW5qbWpoand2?=
 =?utf-8?B?dTJoL0tlVTBVVEFJTHZwMHFGWTAyQ2Zpd1lNUUxibGE3OElObGpYbTRwV3ZS?=
 =?utf-8?B?M0lDQjdFWjNoVDhkY0JJNFZvUEhLeWFGWlRjZHBpK3AzNHhxdllBWEZjaXRq?=
 =?utf-8?B?bUVNY1IzclVHdmE0b1V2akZvV1N2b1hQRlpsWEJhVlU4R2RUaHZvY2ZaemJJ?=
 =?utf-8?B?ZXNESTFkSFpCQzdFTDhJOWxuRDJJMFdSWDJvckxrVXEzTjUyUkZCcUxIQUlY?=
 =?utf-8?B?TDBITERZb052eDJQbkdoZlpBWXNFSEwvbGk4QndJV2NUcjZ5cDI5c1JQYitt?=
 =?utf-8?B?SjE0K1R0bmJ0Si9lL29EUjFSbXdpM2ZSc25ubG1qVnIxM200eXVYL21xZ0tz?=
 =?utf-8?B?TTJEYjlFYWVXdlZTT0pVby9Od05wcFEybjA1d0lGOXJnOWwrQTVwQktDUnho?=
 =?utf-8?B?aXFsd0puZTY1KzlucldsWmp4SGd5azM2bzFKWWhYRWVnVlBSSGFZdnpXakxB?=
 =?utf-8?B?L05DOVdVVXZvQzI5RDgyMENoWWVmeHNoUHpmRFhIeGt6d0ExL255dHB0MDIr?=
 =?utf-8?B?dlVSa2ZZOVR2MXA0QWF2Sm1EeWFmN1pITzVzbFBuK2NWMllEcVN1cFlYblM3?=
 =?utf-8?B?WHJaR1NXUmFkczduQmRXOVJydjJUdHNvaG9LWVRjT3JNWVBWNFB2bzNPSlpC?=
 =?utf-8?B?TDIxRFFZaVBhNXJQaTNxVll3WUVYT284TlZKSFhQeFFuQUo0MDN2RVM1ZDhh?=
 =?utf-8?B?cFpBUDFIQU1uR3VuWDhUemZCaWlyVHFIcGlYMFZnNkpsU2dQK3F6dHA1QmZU?=
 =?utf-8?B?OTFzM3l1RGhscjE4aUxnOVpndG94YjRva2pwdUlDbThoWUk3NDhuRmJFSjI0?=
 =?utf-8?B?VzRRSjNkNzhnZFM4VDlvZm9LVGhTSFY5ekNQS29oZThQczdwMW0rc3hZMUpP?=
 =?utf-8?B?WDd4cCt6bjl2cjNlYnJwSE10d09mVGlHYkp5MXl0eGFXRHpubDFyWEoxY25I?=
 =?utf-8?B?QnZpR3JuOXVTSlRRWGx6bEZTYkl6bGlKR0tsL3J3MkN2aU5aQVpRVUFCVTZJ?=
 =?utf-8?B?bCtXNGY4N3ZFampYVHgybDMwS1A0aEpORkdIaWk4U05sSDdkNzE3Y3lBM0RX?=
 =?utf-8?B?SmJKaFRHSWRpNWh4WXMwWFVqQWE4dDNSV1ZGd045YUxUZVRuQnlRaGhVdHhq?=
 =?utf-8?B?dkdENjU3dUhBd2hYazhLUmRSbU1FdGlOTzJjYkRraGpPb2hZZ0JKaTVBQ0FY?=
 =?utf-8?B?MkdMZFgyTFU4NDNPUWJ0eFh0Rk1BdUNUM05odHZURXA0NGphNCtCVFo1dXJp?=
 =?utf-8?B?cGNxRW9MZ2dlSFpCWlZRYTJDM0tpOVRteXRMdndpT2JmZjNpbk1ucjdqNVBU?=
 =?utf-8?B?aktaajlrTnhBM2VUS01xZld2eEtkRy81b2ZKRzN1bjJFUCswcFE5QlpxZHdT?=
 =?utf-8?B?TDVOVDRTSlEwamJXcGJDMTVGY3E1NW5BS0pxeWhjUWovbFRxM3dkbzByNTRl?=
 =?utf-8?B?dWhEMUVqNEJKYWY3eVBabkgzSUV4dWZaSkVNRXlST1hTNER5UmVkbk9ZNWZB?=
 =?utf-8?B?TmZkUFRNcldLa1FwNEk5SDhsRWcxTWNoZW41NGFac1M2ZzVKZGJFU1g5YzRJ?=
 =?utf-8?B?TmRDSWE3V2Z0SERWaDZ4REIxTFdONWJ6OXJTZzZhd1prbnRSajA3Y2NIanJ6?=
 =?utf-8?B?NnhyenZzckJUeitTSUxFQWlCN1VsNW9oeHZzYUNPa1VqV0ZTM3l2eHNPTUlU?=
 =?utf-8?B?RFFrakY4TngzR05wN1BSdlQ0MXBYaXZqUkFhNGwwdjJmeElURGtKRkxBL2sw?=
 =?utf-8?B?aGduT3ZzYkZPQ014Zm5CVXFYUVlOemViV0NjcE5NNmwydm1pbktvTTBRdnp1?=
 =?utf-8?B?YjQ5bEhJeU9INEZOenhpSHZRNEFCWmJwZGNQNXIwSWUzTzFwWDNoclJKeWJO?=
 =?utf-8?B?ejcrZ25adXlSaFJrYTI3NS8rcVdqaGZjZTVOK0JlSjd1cWFkMGZKb3RpWnNh?=
 =?utf-8?B?Mk55YVRveDVPQ3M0TmlNaTlkeUdudXJscENyNGxrN1B0NFFqQVVyL2EvS2g3?=
 =?utf-8?B?QnVBMFlEei9VQ3YvNmRCU2VUNjMzeE1jVVdCeElmTWpHZ3hhelRvYlVVUWw0?=
 =?utf-8?Q?zE3sZWobFtvD/GQEKqRmizBrZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a311cb-ce09-42db-464b-08db8793cf66
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 13:35:11.3504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tq4FTmQvZL0+EByThTgR60UgyUYq5wFsRkL8MJ+DPoV5363RzVWPM9LmPSzTmGJztS1RvVRDa97emyXAnagctQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8811

On 18.07.2023 15:23, Simon Gaiser wrote:
> ---
>  xen/arch/x86/acpi/cpu_idle.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

This lacks both S-o-b and a proper description. The latter in
particular because you ...

> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -155,6 +155,12 @@ static void cf_check do_get_hw_residencies(void *arg)
>  
>      switch ( c->x86_model )
>      {
> +    /* Tiger Lake */
> +    case 0x8C:
> +    case 0x8D:
> +    /* Alder Lake */
> +    case 0x97:
> +    case 0x9A:
>      /* 4th generation Intel Core (Haswell) */
>      case 0x45:
>          GET_PC8_RES(hw_res->pc8);
> @@ -185,9 +191,6 @@ static void cf_check do_get_hw_residencies(void *arg)
>      case 0x6C:
>      case 0x7D:
>      case 0x7E:
> -    /* Tiger Lake */
> -    case 0x8C:
> -    case 0x8D:
>      /* Kaby Lake */
>      case 0x8E:
>      case 0x9E:

... don't just add new case labels, but you actually move two. It
wants explaining whether this was outright wrong, or what else
causes the movement.

Jan

