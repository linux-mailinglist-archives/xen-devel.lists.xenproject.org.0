Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A054190EE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 10:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196511.349387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUm5A-00006B-Hc; Mon, 27 Sep 2021 08:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196511.349387; Mon, 27 Sep 2021 08:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUm5A-0008V4-DB; Mon, 27 Sep 2021 08:33:52 +0000
Received: by outflank-mailman (input) for mailman id 196511;
 Mon, 27 Sep 2021 08:33:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUm59-0008Uy-0U
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 08:33:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4310cad7-7447-4375-8927-a1d1cbc27737;
 Mon, 27 Sep 2021 08:33:49 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-KYw03PszPD6KURfOaR2G4A-1;
 Mon, 27 Sep 2021 10:33:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Mon, 27 Sep
 2021 08:33:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 08:33:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0249.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 08:33:44 +0000
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
X-Inumbo-ID: 4310cad7-7447-4375-8927-a1d1cbc27737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632731628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iyMZMmPtZ3Mp+s6sZOxcPkrbJcV0Hxysk8STaKxn9nY=;
	b=Cu8RCHsN6YPx87B+7BXMaN4r4VVNJNghfXjd/rwq4hJJjXS/C7hcN6A271P8Oc9aVgYD/j
	3yfcVnsyiGc0p9o7nfAlp5eWmagzvX0h5nrEImp8tlcV4Vd5zEtde/CBxiDz536J3vceP9
	Cb/Ca/bXJI5jeTBwgOBpy2giY0+x6ws=
X-MC-Unique: KYw03PszPD6KURfOaR2G4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtgQhDKTyaZtPIGKWgp/aRW7Y2FqlogMlNj67QYdSCq0SBUSb81uWYEWtg9kDQ1pQvonaZ1PjJcCccxKnAkNnLpAMQbOMXFsdFbPNaBN/dl8HuJU/TdFgJYqkA6ie4JJH8VW7tPR8sFqeda+WZqwej6MDNQ5FXw/wjWGPrea4ncM6MxutM0s82ZjpVZKS5jljOuNcFKSQzCzva1aDFGrzJaoG9YJieik0Y1UuklZ69v85erlC9rvpGTwysZcPV9KGVwOfMTxA0KaH4Kflx0XI6CRcYslzfom0334o6B26PBVpe16SQlPkoMeSleHCqnp6cRTgVXsZdRVqEshwqk8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=iyMZMmPtZ3Mp+s6sZOxcPkrbJcV0Hxysk8STaKxn9nY=;
 b=dP9nib0dDHuSeMA/+/Jd9xZp1cT9SMRWsQDUhOpv2j2OPHzY4pzfC0JMQy0OBvn74p8GPhidfldwagpCJgBkpscM9KOLkHjTlO0jP1JuRgtlLDmgbHu9qV03u6T0NP0l1fclPkWLBRnz5p+BBoaQWB6gF+i62wMQoafkyfScVkLtCCZZj7hUvnxMITar6+ag0BfOF+nzvZp7MPdvCmvhfYhfwFY4izryqjJNSBzXmHGaDOnsDGMxwBtooe+tCJAILarc4WhbmnpGKGaLNUOoBN+slVrkWwpvroIYTGvLxflAcMll9OxFBtP1/6TLHyhU+m+QmxzqB38xkjVKl9PlzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable
 NUMA
To: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, Bertrand.Marquis@arm.com
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-37-wei.chen@arm.com>
 <alpine.DEB.2.21.2109232029450.17979@sstabellini-ThinkPad-T480s>
 <56e0cc0e-7405-74b0-eb4b-07cd9cdae225@arm.com>
 <alpine.DEB.2.21.2109241237210.17979@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4e6f7222-59c8-7853-cf2c-076620efa244@suse.com>
Date: Mon, 27 Sep 2021 10:33:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109241237210.17979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0249.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::21)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc6b3a52-69ba-4617-317c-08d9819184bd
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5325537C59E7A4FDB118B775B3A79@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YNGJNGuKV/xDGPwNYJySnaG5UAI7CAiHn/hXk0YT/5S6wuDSHT1jBc9z6b0FP/bF8Q6JAX+fDR0UoVMcQDlZAK/yGkyV7TUa3bNC9UJRLLHAdj0IM7JQ1BpOvnGhFNAbssD2PZR73hruKTKXQqvvGkc7UUTd7TMjoSBMnaIkhKn6gMt2tJZi9yfF2cMnnx8lKVywTug2Mx+VztqgeeBNuQhaS8VdisA59H98hvg4NieqIKFr+IkmrBEmPeyNRZO+ia8Szrhsox4sarzWodvQo4EKMKtyVnzmYuplCNcGUjVKuhbX9pJbho/Png6PhwjGj1f/N7c6/xUjS7XvpksVkDn7zgK5aT9u2fOKaBzW0JLU/XjFu7uGaC7P7tPPQiP/+y3pBtC/HDpdzK1HNS91HX2huO3v9GotiduDqI92pTUrk53NiTZntquowKBu1O5rKlOXcjdnCWZ/Fu66v2Wvc4StwvDZjVUYzo0FZcOzgQD1lFTsYDBfXZklv41tv5t9rt+9O6tp+xLEfjXq3/Ohkr6Z+8Muy9T1/xBEfZ1UpuFDIJWiHOyGqhoOSfL28aojbYnsKQouQWnWARWBy1ZjFXP6oVDXrF2aY6QBJHS0ALOVEdsXc2z8po8jxPVycgqUSCPaPEQsoGzQd2QqxT5SY9ffTGAxbQIohoUTNc0ZN+o1PbnunEbs1EAohCL8dwaID8NS3HIBvQXJUw9qfjqZ5GmGBUblgTzR3A8mkOFDp91jgwAscX2egN1uYE9ZOm3+f975YpTXPYUg/+P0UXYNNPHVD/9X4ijnk+e8A90w91nHGnAI/poCWn0MlW49Xvuv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(2616005)(508600001)(956004)(316002)(966005)(66946007)(8676002)(38100700002)(186003)(2906002)(110136005)(6486002)(31686004)(5660300002)(86362001)(36756003)(16576012)(26005)(53546011)(66556008)(4326008)(8936002)(66476007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0xTZ3ZPR2RDdGorNTJZV0pWWXg5QmF6Q2xWdmV0bW84V1BtaDk4ay95MDJF?=
 =?utf-8?B?WjF5UGh5bXVtUnE0TmZUcWU0Q0dUc3ZUWVAzVUFKV1BtaWFBVzd4YXEwMytF?=
 =?utf-8?B?OGNZRll1U1lSZDc1WlVJSnUyc2llRmVaam05WU0xVUh6OU40MVg5alpCRVYw?=
 =?utf-8?B?Zkx6SktETFBUc29zUHJ3YU1CeUpMZUg4OEJvS2MvMVlUR3puci9nSDZBZDN1?=
 =?utf-8?B?a2ZBWXB0VWRmSUpFYUY5NG5oNWJkWktJZFpPL3dOVGlha2wyamwzVTQxMDlF?=
 =?utf-8?B?ZUlaV2hRdGJKa2xWcnB6U2hweGY2dHhWNjBwL2ljUkFhQmRpczRRNDNHS3RK?=
 =?utf-8?B?WGRzSEFuWXhUV2g2cWJObjNxeVhsaWlGaUdNZTRKeHRmM0NWaklxZmdqUHpt?=
 =?utf-8?B?ODQ4c0VJVENycU1WRzRzODVWUzJGTi9PaVRvOU9FbW4wTW1RcnNPQkdGWlg1?=
 =?utf-8?B?UEM4ZGs4WVROV05QQjB6bHNOT2tlWGU4OUJoQ1Zub0JldmJHOVZHYktBM05n?=
 =?utf-8?B?dGNpbCt1TFY3U0E0OGRlVThMWWI2OTY5Y3FQWWd2eFUzV2s4R0E4OHk1bnZC?=
 =?utf-8?B?b2FMUHBHSURwZnl2djRHVWZFSFh2NHFvdnRMTDREcHNTVzJMUUliWVJuY2c4?=
 =?utf-8?B?QzNsM0NVOVlZeHNDbkFTZVFPWlFoOTArTFhKUnNtYXBtSkIzczEzQ3FQSGpT?=
 =?utf-8?B?RjcwcE5DMW1qTU4wdWxFdDFZK1NTbFpaVlZ6Sm5ENEJoemNndWNRV1lVbU1p?=
 =?utf-8?B?ZnJjcnpIUmNIcVhQZFNJSzlaMmRHV2dpWlhuS2NUVHkvaHN4czV5WnRULyt1?=
 =?utf-8?B?U3Iyb25OK0tNNEhtMGl2Z3drTHZoT3EwY3lVdll3RzlGVWdWREN4alB1UC9P?=
 =?utf-8?B?Y3hrNUlPWURQOFMzNnY5Tjc1RjhvWWtqRVhOUzdVZVBFd3dTRWhIWEZZTVIx?=
 =?utf-8?B?YkpaWEE5TGtBek82S1oxMUE1YTRXaElDZWpVWGd4NTI4dnVIS20za2p5L0Fp?=
 =?utf-8?B?czFmNERRdllJVUZOSkVablpQMFZUZ1NpV2p3d01pQU9BWkdHZkVjUStoaUp2?=
 =?utf-8?B?ZDZGb0pHbklaSmFlSVkrUVJLYzN4NWdLbGxNa2cxRStsQjI2dDk0ekNBdDYx?=
 =?utf-8?B?ZTV4WHlJbkxSVHhEUmV5cnc0WjVYTkV4SWErekhwWUUxeFVqWkg1RkhzREZt?=
 =?utf-8?B?cDQxU2RNUFVuYTBpUDdSNTlhcVJmMCtyRmRjcnR5NXJ0VlFBSy80RHBrdTF5?=
 =?utf-8?B?T0xmL2EzeFhXRVVKcHNEZGxiQ2tES2M2b1o5THFjUnVBSE5GTFBCTG5BV0NW?=
 =?utf-8?B?cHJFd0MwNWsxN2orZjFOQXNNbHgrNysrTTFRRmtOSWdIZUNOWmh0OTVMQVJi?=
 =?utf-8?B?cUJJZmNPQjJkY0xYcDdINkxFdmhMV05iY09YL2lqTXFEeHo1cjdlSFBIVUhN?=
 =?utf-8?B?UzB4ZStsbnBFbnR2c2dQNHhObXM1UFdndzNqR2Jpc2tKUndrcDQzV3Y1ZVRj?=
 =?utf-8?B?d2ZiY2NQT1FKbG5hTFEyaDBwa3MyTlR1aksvK2pEaFBzYW54emNWdll5SHlN?=
 =?utf-8?B?SFV4MVVKY1UvTFRGdzZLY0ZtMUFLbHBRaU01L1dheml5b1dhT0F0NXFFU29K?=
 =?utf-8?B?bzNoREpnSWNDWm5iMDArTE9hNnlGWFFQeXc2TnE0cmlidDRPdHdXL0V6TWR4?=
 =?utf-8?B?cEZpVFdpOU9NYlhoakZVNTZRVm5mWkMxYWJieEU2RWh3eXB0eTlTL09ReFdi?=
 =?utf-8?Q?/fptN3Y8xsQ8WVgzV6OROLl2eLj967lePWxy+5D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6b3a52-69ba-4617-317c-08d9819184bd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 08:33:44.8147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEueJpU4otjdUHRH6SGltBZpY4YrGJ280mUtDR2N5eXN6Tk+INtjTQ9Yhai647t+3JiPzd0J4pDTdrzHOvJgHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 24.09.2021 21:39, Stefano Stabellini wrote:
> On Fri, 24 Sep 2021, Wei Chen wrote:
>> On 2021/9/24 11:31, Stefano Stabellini wrote:
>>> On Thu, 23 Sep 2021, Wei Chen wrote:
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -34,6 +34,17 @@ config ACPI
>>>>   	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>>>>   	  an alternative to device tree on ARM64.
>>>>   + config DEVICE_TREE_NUMA
>>>> +	def_bool n
>>>> +	select NUMA
>>>> +
>>>> +config ARM_NUMA
>>>> +	bool "Arm NUMA (Non-Uniform Memory Access) Support (UNSUPPORTED)" if
>>>> UNSUPPORTED
>>>> +	select DEVICE_TREE_NUMA if HAS_DEVICE_TREE
>>>
>>> Should it be: depends on HAS_DEVICE_TREE ?
>>> (And eventually depends on HAS_DEVICE_TREE || ACPI)
>>>
>>
>> As the discussion in RFC [1]. We want to make ARM_NUMA as a generic
>> option can be selected by users. And depends on has_device_tree
>> or ACPI to select DEVICE_TREE_NUMA or ACPI_NUMA.
>>
>> If we add HAS_DEVICE_TREE || ACPI as dependencies for ARM_NUMA,
>> does it become a loop dependency?
>>
>> https://lists.xenproject.org/archives/html/xen-devel/2021-08/msg00888.html
> 
> OK, I am fine with that. I was just trying to catch the case where a
> user selects "ARM_NUMA" but actually neither ACPI nor HAS_DEVICE_TREE
> are selected so nothing happens. I was trying to make it clear that
> ARM_NUMA depends on having at least one between HAS_DEVICE_TREE or ACPI
> because otherwise it is not going to work.
> 
> That said, I don't think this is important because HAS_DEVICE_TREE
> cannot be unselected. So if we cannot find a way to express the
> dependency, I think it is fine to keep the patch as is.

So how about doing things the other way around: ARM_NUMA has no prompt
and defaults to ACPI_NUMA || DT_NUMA, and DT_NUMA gains a prompt instead
(and, for Arm at least, ACPI_NUMA as well; this might even be worthwhile
to have on x86 down the road).

Jan


