Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A9473B288
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 10:17:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554313.865438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbyM-000791-Gf; Fri, 23 Jun 2023 08:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554313.865438; Fri, 23 Jun 2023 08:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbyM-000769-Dr; Fri, 23 Jun 2023 08:16:50 +0000
Received: by outflank-mailman (input) for mailman id 554313;
 Fri, 23 Jun 2023 08:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCbyK-000763-Uw
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 08:16:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c1d170b-119e-11ee-b237-6b7b168915f2;
 Fri, 23 Jun 2023 10:16:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8244.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Fri, 23 Jun
 2023 08:16:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 08:16:45 +0000
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
X-Inumbo-ID: 4c1d170b-119e-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YM23IHbgegJ+YBPTNDebdBH965wxo4ew6wkfCwUVF/26VasZ61pmqyb4x6TMcAv7LYN2523at8THGoj7SbtvmdsreD5CVsMG9I829py45NETUTCe4S67np4yKzl8ZWezFuYXo7M50er6wicxh7zWnOOnL1j4l4Aefgm9LRC+IIp0qQF0dVAYwX5URgHF38PKJh8WwBYUT0B3fBMQErkryaS+gAG6C/LHnX/tSvBifLUgXAV7CYajBRcR27oFV8ZRV5P+M93LDx0fJOtqYD7rXSJ2xRPVFoy3W3gbtGoRIYtVJcAp/iyF1X+dSLRySx8YCRTerLGpjj3satHAB4CNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWkvtyrHe5/Sbquh5vkXjWoZfY1d2Vc+OmaMPHZ/5RA=;
 b=RjN+R4Yj3SJXXiX0VhIN0NkicMP+G99+OnDuNMQd473Td8bo4PEVc1nuoDNn56hgSDLrXBcKOZnSlitpc5MaTN27tOMkwCqORFuQJSEJx+zRZjNWnS2/DFDxqW/Lnz69/yaIqEqSz8aXGTSnGxkx1eN1msclYzF05Q0Z1g9Wr2JXVxRCaCHY23QmBRGhPXLxW2OtfPFxXBfC3yzcq4OSe9W0BLTcQo/A6mLGVY67f3UgpKUmeAtkO1ZrgqrZfI7wSwaTcVIQg3KEL0qVLAsm6CCSuz8eduVRb5bwF2EdUNgQA2/ifCbBY1AoCiKE0AzODzloeJlNDQXJZ0nmcFBJBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWkvtyrHe5/Sbquh5vkXjWoZfY1d2Vc+OmaMPHZ/5RA=;
 b=1BquBJilQdaOT3MtwgbOG+OVh4DrHf3j1BYtU4VllbcJ3/CLwto/vQoGthNEe+KygNz8F4W2xbT4NeIVnQePsU9nY82NYpdf1gfEIlQ4Tq+dL7txA+w3Ze6hONIvzjBMe1FIqeI98FcWb8W83zU9SmCrJg4TlQc2iGU0sgIPIJj0+vKF4x0F6ppwu8p4txEflggDE2ZYNV+9ev9jvAX3Ua15e7GPyBCCQUr3MFrDpxqlr4eJ0ijuHP2vlx3CbulR0eM/ub58CG9fk9TS0JfQH8DJ6U+/CydhFby6xGTrvi1tAUGDoMfpXT1IM1e6ktn93S9pnB2LgAaSVn3HwQLMcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2a16bd2-7ca8-8fdc-0400-ef16a9ac4135@suse.com>
Date: Fri, 23 Jun 2023 10:16:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 5/5] Config.mk: evaluate XEN_COMPILE_ARCH and
 XEN_OS on first use
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230622153005.31604-1-anthony.perard@citrix.com>
 <20230622153005.31604-6-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230622153005.31604-6-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3726ba-9282-4560-8e6c-08db73c22f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ME9w4/FvIAC8yN9fFdagP+gz0OhzXHpg9z+Osg7b8i7mH668iDIchrLESB+LW7yvPsVVNkBSQrpD2wluymmrQ81gKXOcVvrpVBM82BITIQqMD0mS5c2nwohC/UROOuJCyUkF1EICqbL7FvIY/sST1sQPGZsZIKxqVhdxGKFx0SOO2yvCha0gLUSrBfWuIEZ9o1Jg1mGCZJDURUT0dc+WKK7HYcMlnVpYhSouxxLWBOkxOLV00E6Frrn8vd1TkeqQ5pVI1Qqpmb9ppaiIex6b3K2xoB1WUaJK1pBHzhdoevdRXXhDNlt1I2g+DCfi3Yw7jQ3mpftJgYo7hDYk3iFpP1yhUhlVrGuVdD9woW38mh3lbps08a3Z7eIeUL1SIhiychWxtHLb427TgOc8cBR6FAoWsbjw6TBgoYZFvaTXig9iUBnUa2Ki5yAwH1uWbyiWACqu/vN9vLgGhISOeO8mc1lCunGYsjQZvYZgTkNRyzlmLsVlIWTVykdPnloWQoiHBBkcIFdYZ1JZl77jnIDCzV3g3wsh1C3VK/9gap4KbAQYU2TPdtSNbBOjJuq0TAjMEGdzPhTN1BqTd4ynwC9YBr3YuMa0yvpZxmyl8C18bwAFgjYy+mYmZgT65DSSIJQfRcMyZBBmCcvojXvaVv1uJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199021)(6506007)(6512007)(6486002)(478600001)(54906003)(186003)(2906002)(26005)(53546011)(2616005)(5660300002)(36756003)(6916009)(4326008)(31696002)(41300700001)(8676002)(316002)(86362001)(8936002)(66556008)(38100700002)(66476007)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGYyODdJSTJFLzc5RCs1RjRRemFXcnVCbDF6bDVaN1lMS09WazVMNThPalhT?=
 =?utf-8?B?cW9SZ2EwYm9TZzlaZUxCVytzSDZQU0FlbElQaFJCZWdCdWRpSy8rNXFrNDRY?=
 =?utf-8?B?UFBRNlY0ajl2aGVEMHVRYUI1TEdIWEJTaGREelJLdXhvcFpzMlBpcUZKV1BQ?=
 =?utf-8?B?czZOU09jU25DRzJwWTBIeHZSQkRROWFHeWdzdWZaVnBJcnNIRG9DWUxNZ0lZ?=
 =?utf-8?B?N2tmRjBsQTQxWm16eWx5TkJkSGVxbGsvS3VkeFgrMUVTQ3VnZEhjdjRjeTRj?=
 =?utf-8?B?dWE0d1N3MWo0ZTV5YytYVzhBVHdMNktlMEdINFBNMTJIUE9sMkxRQktjMm14?=
 =?utf-8?B?Qkoxby9iRmxpUUkyVmVkSitXeU5MdEMrMGFDMFVPUWEzbHBVeHpjbXlzWFlP?=
 =?utf-8?B?VlNzN0JwN0N5dkJHbHlrSWpEalNZOTVZanRRUFhCTElqSGozQW8rT1NoSmZw?=
 =?utf-8?B?ek1acUdRd2xUaFdUR3M3MDQ3MkNWRHFSMWdtZUpwUzd6N29TSWJGRHFpMkw3?=
 =?utf-8?B?bkdqdDlCTlpoY3FYT3NUWXp1dFBWS2M5ai9hZmJhRHZZbEV0NE9EMGNpdmYv?=
 =?utf-8?B?UVhCVDZnUGtGTWlNcmV4bjg2WldKQjJNdjhLcU54UHIzU0ZvbVE4a0xwTjJX?=
 =?utf-8?B?YUhEUjVEUmk2U004TlBZK1MzMFUrVVVKMXh6TFdDUGFuNXo3YldXdWY0U2Ux?=
 =?utf-8?B?am53cEhmdk5tOFBTaExIclZaSnBYOVVxUmR3SzdISHZ6cUhOck5mTDNLZ0xV?=
 =?utf-8?B?UlZmVXg1UExaV1FxV1p4TUtuZ21VR0NGQWxyZ2JweVhDZWlPd3YxNGtOTzNM?=
 =?utf-8?B?bUdON1BuUFBzNzFPdlRCSzVTeGpkbm1lV1FiZnlRdWx2RWNJejhYMGF3a1NB?=
 =?utf-8?B?N2ZrOHU2dnhXMjhoSU5lUEZMU0pPTDBiNW1VSUpCcUd5QXl3R0ZMZForYW8z?=
 =?utf-8?B?QjJ6MXY4VDFwT28yWTkzZG56bXlOWGxpSjdza24vdURIeTFTaU9JbU50dWRP?=
 =?utf-8?B?dG1yZlhxK1IvOU1mV0s0QXR4QVEyOWdhREhDYVFJRTB5WUFBakNOVENUVVk0?=
 =?utf-8?B?QzA4TXgyNHd4eDZ0Q29OdW85cGpSYU1YNmVsVExrTU9jaXpRZ3BCN2pMbXg0?=
 =?utf-8?B?azRqK2EvN01RcWRxTGVXQWFlZ3N1LzBQM29qMjVxTXRzR2dsbVJnNXJvN0h6?=
 =?utf-8?B?Q0ZDYUZ4UThsL1IrcHJLQnlKNmV0eE96UEFPZUZ5TkhRbGNXMTFXVHZLWHhU?=
 =?utf-8?B?dFFiaDE0T1ZOMjRsYjUvcTFhNXVuOTU3dzQrdkMvc3ZVSmpIc0ZWOU1ZN0U4?=
 =?utf-8?B?MGxkVWFndDRHaUVtTW11Uk5JK1BwcEp3UFlxa2lBNG5tWXYyREkySmR1S3Ay?=
 =?utf-8?B?QW1qOW43WUJrc29zTFYxU1gwWTVXS2dnODZLcExTWjFDTE5zNUQ5L3cxc2Q5?=
 =?utf-8?B?Q25YMnQwellBY2dpY1QvZldqVkFsbFI3UGJUZ0IyYzhWc0JFVHlGOU5jazdH?=
 =?utf-8?B?NHBlK3V6MjdwcThrN0xqUG9MbXV6SWJmUlNVVDUxdmFkVjR5N1VyajdxMUVj?=
 =?utf-8?B?dy9FRUVXcmN2Ti9mRmczTWUyKzdzbkk5cmdISE5xcVlMd3R3NnNmWHh5OUFL?=
 =?utf-8?B?U3Z2SkUvWWpidzkzeTg5elpNclRPTTdJeU9odVlKc3c1OXUxZ1VJbTlQcTdR?=
 =?utf-8?B?YXhLSHFJWDhzY3JFZUsxVHI5SDMxazlqd0VDcjNueWY5djhUai9ETE5IbTdQ?=
 =?utf-8?B?TnVLM3dSNHdzOGpTdVlHUkFwMXh0Vk0xZnRwN0VwVk9vNXVXcmtIMS9sNFZp?=
 =?utf-8?B?NGIyVnNsOUJWMDNVMG1vSm5pMjNjR3c3eHJxRG5hNTgyeExFTlBFelNXSVMz?=
 =?utf-8?B?VlNrcW9HUGJobzY3SHlWbFpOeWRJb1NmRkg0d1JDQ1ptM1lnZk5HRTBNdFhw?=
 =?utf-8?B?UHlQOG94Z01ZYVJKdUhmVTBRWm9KaE1BYXpkZzNNMzNBUHIzbnpEZDJibG0z?=
 =?utf-8?B?MUpTNU9CeXY2cTdJbXpLdElPK3FYNzNLVDBMMFdEaWkzcGVyVXEyUkVoNDB4?=
 =?utf-8?B?Q0c1TUZQWkFOcGU5eWx3NlhDQ25uYzhUNVVHb2hnNGlpMTRVRkRHRDJ3MmxP?=
 =?utf-8?Q?N/xvuKBJpMqqzjWS88WxW1knj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3726ba-9282-4560-8e6c-08db73c22f0c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 08:16:45.5193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZJ4Qe3m/lzTZ4LNSlEMmChBiOJUy/K+x2izegLZeFpE58VUvMGzBESxo7oRp1mwjAujIuomLgO10OaXx39QNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8244

On 22.06.2023 17:30, Anthony PERARD wrote:
> --- a/Config.mk
> +++ b/Config.mk
> @@ -19,13 +19,13 @@ or       = $(if $(strip $(1)),$(1),$(if $(strip $(2)),$(2),$(if $(strip $(3)),$(
>  
>  -include $(XEN_ROOT)/.config
>  
> -XEN_COMPILE_ARCH    ?= $(shell uname -m | sed -e s/i.86/x86_32/ \
> +XEN_COMPILE_ARCH    ?= $(eval XEN_COMPILE_ARCH := $(shell uname -m | sed -e s/i.86/x86_32/ \
>                           -e s/i86pc/x86_32/ -e s/amd64/x86_64/ \
>                           -e s/armv7.*/arm32/ -e s/armv8.*/arm64/ \
> -                         -e s/aarch64/arm64/)
> +                         -e s/aarch64/arm64/))$(XEN_COMPILE_ARCH)

I'd like to suggest to wrap this differently, e.g.

XEN_COMPILE_ARCH    ?= $(eval XEN_COMPILE_ARCH := \
                         $(shell uname -m | \
                                 sed -e s/i.86/x86_32/ \
                                     -e s/i86pc/x86_32/ -e s/amd64/x86_64/ \
                                     -e s/armv7.*/arm32/ -e s/armv8.*/arm64/ \
                                     -e s/aarch64/arm64/) \
                         )$(XEN_COMPILE_ARCH)

>  XEN_TARGET_ARCH     ?= $(XEN_COMPILE_ARCH)
> -XEN_OS              ?= $(shell uname -s)
> +XEN_OS              ?= $(eval XEN_OS := $(shell uname -s))$(XEN_OS)

With these further uses of this same construct as in patch 4, is there
any chance of abstracting (part of, e.g. at least the rhs of the ?=)
the construct into a macro?

Jan

