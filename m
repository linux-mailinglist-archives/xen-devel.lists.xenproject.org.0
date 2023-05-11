Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D96FF3E3
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 16:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533410.830053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px794-0007rA-1g; Thu, 11 May 2023 14:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533410.830053; Thu, 11 May 2023 14:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px793-0007oI-UW; Thu, 11 May 2023 14:19:49 +0000
Received: by outflank-mailman (input) for mailman id 533410;
 Thu, 11 May 2023 14:19:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px792-0007oC-G6
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 14:19:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e14ca37c-f006-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 16:19:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7399.eurprd04.prod.outlook.com (2603:10a6:10:1a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Thu, 11 May
 2023 14:19:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 14:19:43 +0000
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
X-Inumbo-ID: e14ca37c-f006-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJN+gHmpOrH9SdejrZCGFysRG4Rr5WzaDldsjcCK1M5AVCuQJYX54olFq/QErIB2VvGQQRb8dgw5kySmjII0C6/6qI7RFs9xLKNqVautPGGx5ZgG97EIF9tavVKh2mynYtOqG567rkRsMIgEnf0Km5WCQg5F8qT8uLi7YpZrAQLXiaLjPDBDDhGxE5TC/ah0nruy1csE2lJecp+HSHxHIAMfz79AR1Z5TtoitxnoFKr1mtx/6Fus3kpGE4CjaJS1L8lPBvOcrxlM3zizM9TqRfNHPd3/eH7G44j3YJrat8ljrAi406VEnjU+tsQLYHS+FyLJlTDiXEKk9j70+hSCBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1rjBGOSvHegrtNBhVwTiHkfdYXlTGAw52sSIXeGlE4=;
 b=fdvoGLcW7N3ZuDlW+JFUVnuBCzPoD+XL3EUB2S4opYirGQJJ6Z52Aep0HFSU63PVj1RCR6IxzXBdMTP37ZQLaXd5eKTVTJ7jyXaaPxTYiC/6tWU2EXEQbwf22WG8pF4CUjm7mapH9I7MK7enzOIhifHkH/2nY4Js6NUA7KVMy4ME6UmQilqG86saCPpjqruhfo92vYlTz/6VO4r2WIGNhCiLmA7Y3knDi0T2Qs8c5Vjskx4BOAgLZELBcHJp3PbRJ6r2Q80E7G2aZnDvEVWhZWOp0Sk5Z3ZMeUDQMBUPVmPG4GEKYioQWIbDcnnA3USbGGU8/EE4/opv5dylDr+ymA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1rjBGOSvHegrtNBhVwTiHkfdYXlTGAw52sSIXeGlE4=;
 b=lXDaqvbsjMCycRDvR4qqfQ7y2dACMzO2lFTzFPP1sRdz/QrXvMDAImCJeWVIcU432we68Kl32ZZe3Ny06ERF8uCdQunD983f9nnM7r/jrBjYkqPZ5k0dKYeoT1lrdnAuDMSzPtTGWt2jcPKPO7bVgd07R9ckIX8K6PpLig50gZ9BHxWJpHy6P3qBptNv2liiNOgODQuvn3W7FAbh1qZTGlyFJqJ0/wctvHxNbmdNHYn/mmqbjmojH4mQw0Yo1ivJNpasl+45PRf+4S8EizsHQLgnfmiuN4Ld07HJvcFqGlJdOY0Iz6aPN3q7hejhs1SrGba94zGX/zpvFaBIVwS9mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <904896c5-45dd-45a0-b38b-3f72701194f4@suse.com>
Date: Thu, 11 May 2023 16:19:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1 4/6] pci/arm: Use iommu_add_dt_pci_device() instead of
 arch hook
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
 <20230501200305.168058-5-stewart.hildebrand@amd.com>
 <ced11c6e-caf7-3a19-92c8-5c11b18952b6@suse.com>
 <8591236e-5dc2-7da7-fe3a-7cb2ae1ed7d0@amd.com>
 <462657d4-72e7-6266-6ea5-2b9e443f9813@suse.com>
 <03fa79ed-2b24-8329-36fd-dd8edc14fa72@amd.com>
 <f07ceaef-d525-faa8-8911-77c588e85102@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f07ceaef-d525-faa8-8911-77c588e85102@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7399:EE_
X-MS-Office365-Filtering-Correlation-Id: a42c82a9-9bb9-4b84-81f3-08db522ac400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/P7GaYssQzmY8SePEHyYCYTg1bDCrZV8LUIc3FK/sWdBlf1CztHoAFS9DQwleM4ndXiGRR1n6crLo3XgfJAYKW0iye/ekoqrt5Ob6S1scL6bgh4rPvBZF7XkmLnl7t7RCFuUsDZYCqi/64OhoZWR/tf6me9evvcv8Y4NWJpwe67PjwcEOWzQqbkOtUJOVaUkfK1zgX4U7bfoGKYZXr06bfVILlPxudLoD/NDWng6M9sy7WD9NuymhJxDGO1u63dM+4tWlu5uo811yX9gMvthQyzcZniMrrV6FhUcCRgANLJrWsbMizUs/TDoaT7IDlIrWnxQ4LA59HK0uEfCk/XP97Ep8OszuwOS7h9+MYEa0dQo8+YAUye4k4pN7LtD8nerrkkOaeCzA9l9N0Sqi7n2ng/cof8x7+90GIAd/X4ud3WHilnReTnxv1qEPQSjP6OTM5eNTXuECBImzvkcnTERN0ZmSym27QU1YPxnec1C0jMwuq+a7ZmD12QejorDU8OFx7e8kjxeCah0aLCRJJFtXDjqnD1earaL/u465xxLkU4dLUtMo0nxw1sv8PGOV5nre/ivTbxAHh7ufX958IpUXzb3MWDuXbNArqAfm7hPJi+04TvgPTJq/ayBuRSuoiajRFdKV92kbPf2WupJA9w/JA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(5660300002)(41300700001)(8676002)(8936002)(31696002)(31686004)(86362001)(66946007)(66556008)(66476007)(2906002)(316002)(4326008)(54906003)(478600001)(110136005)(38100700002)(6486002)(6506007)(2616005)(53546011)(186003)(6512007)(26005)(36756003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y216NGJUeENFdEtHeGxsTGRSTmxYb2tTYTdITGtPZnNyclEyYlVtOGFRRGQx?=
 =?utf-8?B?RXdLaHVJNS92MkJoZGR1cEo4cHVjZjE3OUZIWEVwQWZXWW1FZzN1SW1ObGlH?=
 =?utf-8?B?T1FMRThSZGU4cWJ6SG1ieXlXMlZ6S1VlMzd5a0ZPT2dyaDJxQko4NGkyM2VT?=
 =?utf-8?B?UjErQzVlWThuS2RKeG10c3l5MTJTbzJHRjdjOHBmVzFKb0tBeUM4VDkzbFlF?=
 =?utf-8?B?cjRvcjBZQnFQbUI3cEdiMVFKdHpGU3dxNmNVQ1VEL1VQZzdOTEJHMTNvV0pX?=
 =?utf-8?B?UmdVdFh3T0FENk9oKzFQcHovYzh6c1lNb2YrVDZNb2szcXBHaXZGODNMU3ZM?=
 =?utf-8?B?a0NNMDFiK3dDS3E5OXArckgvcmRMTGpuMTQ5UmJPVGtvK1BIZXJyQllHNUNM?=
 =?utf-8?B?OHlmUTVtTTd2QjJ5cGRmcHY4U3pKNTRyMzh4RGpQOE9SVUgvUnI1eFkrRklN?=
 =?utf-8?B?NmNvRTJHd1dMNHE5SmRtbW5hb1Q5K0VjQ1JUd3ZWWU1RT1VIUmc5QWd2UVdX?=
 =?utf-8?B?dXR5UXFMQVQrdVFTYk1pOFZhZVQ4YjBjb2xUZlZBUHFuN0FjdEpqcWZoQzha?=
 =?utf-8?B?RjdXT09JT2llWWoyeUdvVmVINmFQdW90UWtUaUc0U041RXdpZjNJNDZOVENY?=
 =?utf-8?B?UE9hcElsUEVrYTFxcEZUQzY0NVI3bXJyNXdraGZCczdNRFZkU0pxYWdENnRk?=
 =?utf-8?B?dGhzcFlVVjhWWllOYmFNZGhxV08wNWxCUit6QUJ4azYvM2gzV0o3MDNxak16?=
 =?utf-8?B?dG9BanFOeG5VWDRUUFlXK25hMjZQSlVwZFdBTk5RYnJLWE9LSzc0RlQzMHR4?=
 =?utf-8?B?a1RzYUJiUDRjeXEvcnkvcGpyMktHTUFGOU9aYXk2b3FUMDVhYkc3K0JMNHZx?=
 =?utf-8?B?ZnNCbWNHTWlVMWF6TDMwZUcwUjF4YUNsVGppdHJ4K3VaYkpaMERqd0pMSDdl?=
 =?utf-8?B?K3J2NUlUbk5xM2wzSGhDckp6R1cwRmVOWTEwOS9uSkREZHZuZldQYmtGTEtF?=
 =?utf-8?B?NkZqY2t6VFFZU2VUK0VVUjBMYU12QnhscTRGKzlneTBCSHBsNGtBdVNZNjJJ?=
 =?utf-8?B?b2dWeEFPWFM0cDc3ZE1wMDI3SVprMEFKN3FVMHlER0hOMml0VU00aDRwSjE0?=
 =?utf-8?B?NkZpMjdvMVdORjZiK1loTWxMU3YyMmZlMkRFZlh3dTlyL1BYZ1VBaHpnaFAz?=
 =?utf-8?B?UThLajhjc2hhUnNOVGQxOFpacFkxaWIyYjVoMnM3TE9ZbVVJWm9DOWR3RWRC?=
 =?utf-8?B?M1lJVXhVOU9FYlFFSUh6L2R0cHVsWVkxVm0wejcrakc4VG1mRzc5SzcrVG5j?=
 =?utf-8?B?VU1vV3J4ODNSQTlYS1pWc2hTMndweWYyL1JnV0l3UUhrKzdBUWNGUmlERStX?=
 =?utf-8?B?ejJRY1pQdTgzVkZEcXFHL3VjK085bFFIcWxsRmNTSEw1ZnVtNEpyUzAxRDY4?=
 =?utf-8?B?UmxCK3JIUVh4SFFtak9WUTBCSGJsTzM2VkxWSlFVNTVCU1dWalZlMEFMcitY?=
 =?utf-8?B?ZTFQRHNJOXVOSC85WkxjYXNERVg0Y2dNY2dTaUZjVEtLNXkwK1VzQVU3cTNv?=
 =?utf-8?B?V25tRDd4emVSUWZPWmc3OW5ia2hnNUthMGw2dnEzNGpMYlBEb3VkUUtRcnlK?=
 =?utf-8?B?TEc2UzAwMUZLcXJmaUIvVGVaTVgySzFHOTJTRE5EQi9BSzU5OU45SFpmTk9u?=
 =?utf-8?B?VUhRVk9HNmd0VXBMdDFhMG5jRXFLclNpeGpFdXNtNjVQUVFZZXMwOU43ZWhy?=
 =?utf-8?B?V0NqTGdUajlXMWl5VkEvRldYWWU5bjI3MTNzaWF2ZWlPZW1hM1d6amNGZVVp?=
 =?utf-8?B?Q29Bc1hIRVdHWWlHZHpOYktHd2wrT2xTTENoMU5aTzJnREdIUDhXUVVIcnRH?=
 =?utf-8?B?R29idHBvNWpUVE1YT0pTM2pYOUVqQ1ZFRGZGV2ZzRDJkMVNSMy9yeU9STzlT?=
 =?utf-8?B?ZjI5Y1duTUNKZG16d3J0VWV1WFZRbTlrNXhYU0RYV2diQVJ6R05iRWh4OUZH?=
 =?utf-8?B?clpaZ1JGUDFPNWZCWjg1L0NYWlZjNFk1ekZDcVpURmszTlZUNzhhTGJUcTda?=
 =?utf-8?B?elB3MU15THlUei9Yd0dvN2haS0hiSVdCaHJWUVFsQ2gzUC83cFFRVDI1clZR?=
 =?utf-8?Q?ODWYHSGaa5cwPtl/HcaXEie3l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a42c82a9-9bb9-4b84-81f3-08db522ac400
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 14:19:43.4605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jg8Q5KVCwfOAbmoIEJcpaE4Ozf7Zb7fJ5rwVxKbXjxVvFrM0GuQS7c8NrXH9lEIZSn0PEGmJ7CDjiQucrqRHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7399

On 11.05.2023 15:59, Julien Grall wrote:
> On 11/05/2023 14:49, Stewart Hildebrand wrote:
>> On 5/8/23 10:51, Jan Beulich wrote:
>>> On 08.05.2023 16:16, Stewart Hildebrand wrote:
>>>> On 5/2/23 03:50, Jan Beulich wrote:
>>>>> On 01.05.2023 22:03, Stewart Hildebrand wrote:
>>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>>> @@ -1305,7 +1305,7 @@ __initcall(setup_dump_pcidevs);
>>>>>>
>>>>>>   static int iommu_add_device(struct pci_dev *pdev)
>>>>>>   {
>>>>>> -    const struct domain_iommu *hd;
>>>>>> +    const struct domain_iommu *hd __maybe_unused;
>>>>>>       int rc;
>>>>>>       unsigned int devfn = pdev->devfn;
>>>>>>
>>>>>> @@ -1318,17 +1318,30 @@ static int iommu_add_device(struct pci_dev *pdev)
>>>>>>       if ( !is_iommu_enabled(pdev->domain) )
>>>>>>           return 0;
>>>>>>
>>>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>>>> +    rc = iommu_add_dt_pci_device(devfn, pdev);
>>>>>> +#else
>>>>>>       rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>>>>>> -    if ( rc || !pdev->phantom_stride )
>>>>>> +#endif
>>>>>> +    if ( rc < 0 || !pdev->phantom_stride )
>>>>>> +    {
>>>>>> +        if ( rc < 0 )
>>>>>> +            printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
>>>>>> +                   &pdev->sbdf, rc);
>>>>>>           return rc;
>>>>>> +    }
>>>>>>
>>>>>>       for ( ; ; )
>>>>>>       {
>>>>>>           devfn += pdev->phantom_stride;
>>>>>>           if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
>>>>>>               return 0;
>>>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>>>> +        rc = iommu_add_dt_pci_device(devfn, pdev);
>>>>>> +#else
>>>>>>           rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>>>>>> -        if ( rc )
>>>>>> +#endif
>>>>>> +        if ( rc < 0 )
>>>>>>               printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
>>>>>>                      &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
>>>>>>       }
>>>>>
>>>>> Such #ifdef-ary may be okay at the call site(s), but replacing a per-
>>>>> IOMMU hook with a system-wide DT function here looks wrong to me.
>>>>
>>>> Perhaps a better approach would be to rely on the existing iommu add_device call.
>>>>
>>>> This might look something like:
>>>>
>>>> #ifdef CONFIG_HAS_DEVICE_TREE
>>>>      rc = iommu_add_dt_pci_device(pdev);
>>>>      if ( !rc ) /* or rc >= 0, or something... */
>>>> #endif
>>>>          rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>>>>
>>>> There would be no need to call iommu_add_dt_pci_device() in the loop iterating over phantom functions, as I will handle those inside iommu_add_dt_pci_device() in v2.
>>>
>>> But that still leaves #ifdef-ary inside the function. If for whatever reason
>>> the hd->platform_ops hook isn't suitable (which I still don't understand),
>>
>> There's nothing wrong with the existing hd->platform_ops hook. We just need to ensure we've translated RID to AXI stream ID sometime before it.
>>
>>> then - as said - I'd view such #ifdef as possibly okay at the call site of
>>> iommu_add_device(), but not inside.
>>
>> I'll move the #ifdef-ary.
> 
> I am not sure what #ifdef-ary you will have. However, at some point, we 
> will also want to support ACPI on Arm. Both DT and ACPI co-exist and 
> this would not work properly with the code you wrote.
> 
> If we need some DT specific call, then I think the call should happen 
> with hd->platform_ops rather than in the generic infrastructure.

I'm not sure about this, to be honest. platform_ops is about the particular
underlying IOMMU. I would expect that the kind of IOMMU in use has nothing
to do with where the configuration information comes from? Instead I would
view the proposed #ifdef (a layer up) as an intermediate step towards a
further level of indirection there. Then again I will admit I don't really
understand why special-casing DT here is necessary in the first place.
There's nothing ACPI-ish in this code, even if the IOMMU-specific
information comes from ACPI on x86. I therefore wonder whether the approach
chosen perhaps isn't the right one (which might mean going through
platform_op as we already do is the correct thing, and telling the DT case
from the [future] ACPI one ought to happen further down the call chain) ...

Jan

