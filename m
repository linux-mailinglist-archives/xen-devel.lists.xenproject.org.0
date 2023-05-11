Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CCE6FEBC1
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 08:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533127.829518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwzlw-00041p-OV; Thu, 11 May 2023 06:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533127.829518; Thu, 11 May 2023 06:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwzlw-0003zB-LI; Thu, 11 May 2023 06:27:28 +0000
Received: by outflank-mailman (input) for mailman id 533127;
 Thu, 11 May 2023 06:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwzlv-0003yO-Ec
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 06:27:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e52f144c-efc4-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 08:27:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9095.eurprd04.prod.outlook.com (2603:10a6:20b:446::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 06:27:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 06:27:24 +0000
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
X-Inumbo-ID: e52f144c-efc4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGHiv9JIS6vUaA4IXhbq5sa6WALxzZTJszV4ba6+2y3DdevlaxSh8Kho2a9fChRgsHMWZ0MlCzJBQF4SRBC9hrfPRXT591Jo91lVJnPwUGJ7BibbxdogwEsq974MDGG10gzoIellER3PE8vDyWJ0U6IhWgzH8LkzxmIilyoo6AxYFP1dQI1Ep8xKppQafgKoQ9dpiVFX/F7U9XF718wXnX9uqIKhix69upKDaPX8LJIw7e+IR7ffee1B0OaHL1ucwcJhUwtHrv+liwKkYzY1V4cy1GPSO3hxWQJUPPD73NAkU/BsurHFMqwGhePCSPsbCaFvxVEEPvbaKf/a4PksHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/eE/QlgO9DdRdDNB43Un3ARKvzaZpNOV2K9WEcTCgc=;
 b=KnahjXu5TLgcjFFGJdbdxalpNIr8Io7LFNgnz5kH9hJQbE3mklIkt6lNS8fki89ecxBj0AMKat6d2gr3tHJ+6ckSPrFiW2WFGj3RYUPnxO8dXpG+GWeA9K+CwbQrQREX2D0HEQ9XhASJAxTn5cg2ODUTt3bv13YxVFrR5LtnOsk1ciXaH0WzquZdik5nBCTVJRnQXNzjPIq0+/6hJdeqyZ3nIAi6wIJRsiTHzSfmC1AEtR6WB7vKsNOrIrRKuddOMlmN47U++m7AfZLt13gNJLltN31xFfs5Hr839HvT607XmvpKubHundvJ2AeQ5WCi1L6Sd7upxB1CaVWa18t1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/eE/QlgO9DdRdDNB43Un3ARKvzaZpNOV2K9WEcTCgc=;
 b=k4qneEeo8IaJ6pTdgRQvCY2R4T6434lLlIrrfuO+LLqfbjf3emiUUuzMOOlHSAHwinnc4QiVkmfoVmYJnjl/UEjhV3cna1cWwYqopHh32jjfkkHIS4xtzS2Y9bO7NW69vHPLnrS2kh4VS/xTwsSoVWdbk0pyUqXf/w6T9p/dbS4u3wGm8IKEtYxzgec37BrSB7/XsfbGKleStUHmknzrlxY1dUj39ValWEj0Uu3gZgpVPf/JuO2e4uQjBNnOmFkl5UNex2QoxysvdvvYVEMgmdLz1Vd41uDCdFwpppbtVkI+e/XMqQFSIBJbUlq4iZIdvZvgXtkSFYvBUUMcpC45oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87629ef5-fb35-60e8-0d67-ded6f777f9bc@suse.com>
Date: Thu, 11 May 2023 08:27:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] iommu/vtd: fix address translation for superpages
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230509104146.61178-1-roger.pau@citrix.com>
 <bc750b8d-77be-f967-907a-4f19c783ad99@suse.com>
 <ZFtVYEVsELGfZxik@Air-de-Roger>
 <5bde1d79-03ef-6f8b-4b28-8d7e6867ba18@suse.com>
 <ZFtwSjuZaz05DIY0@Air-de-Roger>
 <f53d0041-d694-1221-475e-648a2afd2ff9@suse.com>
 <ZFu2EzMmQvfpE7tJ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZFu2EzMmQvfpE7tJ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9095:EE_
X-MS-Office365-Filtering-Correlation-Id: 1318959f-5618-42da-b1a7-08db51e8c89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	18YHKessPpf1UqXWvTRWNcQOQtKPdUuZgMbRPx3aL17zPSa7pZ3y2QylqAZTB8yzsK5W7Y1L/CYmnVtb0fqwoWQERw7V9LmFHkyN0hlQxyljZpom/7JjCyYB/Cpztwhm5GG3IpxSmAA51Ewv74av+XPYxyggdTn4SOwcSNM8PBRH+H+QOmPWYdr3ujllu8O7RGs7anYzbCHAD9Al6VSa+DWe7yLQDLExb3WstR4yePrqQV6M3nxMeSPqir3M+MSEaw8PpXanLKh5UnajCFFXEESToasCWzLUyZMxDtfZYszt7fz6JeCPdPUA/uqkHIgpEujBAIaVJDkZ/NJRtwvZBhIyQe7mD7PuHiF87bJT+AflLHPEFXYeazrydBzBo1TE//FbZR7QzbBjyBxPXdVFZS8O/gucfwszvDHjRE7t0oCXfaPpQ15lHZ4twrYnOXpZLDc0etCvalRV5D5Q6lDlY85JJK0wtG7xRHpZYBshwdSpvHWuPjPUXUkjpa+AOWuvetviEHSbMm9i5dXJIzF2lQawh8OwcwL6paG7me7Jg1DAXEZaITve0LbIP7RkN/F9zS+RJybPkN94u4DH0OncxPMEHRZtunTz2iwN3SIGDiJsv8f29mO65304o3D1n0aUkNJcvcRIz8xzPULGNGD4Ww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(31686004)(66899021)(66556008)(66946007)(6916009)(66476007)(478600001)(6486002)(316002)(86362001)(36756003)(4326008)(31696002)(83380400001)(2616005)(6506007)(2906002)(6512007)(53546011)(26005)(8936002)(8676002)(5660300002)(41300700001)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejBuSjRDMzRqVHYveTBvMXdpNVZZcHhjZVNvZ29YWlNSeXBCUVNwWEVkQzVI?=
 =?utf-8?B?KzhJNktUeS9mZzJ5MDRHSFM2Mk1HRDlKVy9zdUFBK1RETVo5U29VbWJZKy9t?=
 =?utf-8?B?ODg5UUdrMnZGM3F2ZDY1SFlGaG1tdllHNlNNSStDNWlTeFI2WWVNRkRqMGhV?=
 =?utf-8?B?T1pRd3cydDQrR0FweEtGVU5yUGJzb08zd09FdzVxVWJJMmZSckRNenJhYmdh?=
 =?utf-8?B?bjFRa0hEdXozQm9RazFTZGRVNVpaUGpCK3BESHV6c2Z4alVySXRQNXlXS3FZ?=
 =?utf-8?B?TWMzdXFNdEtiUGNDSTlQTGZkZThEZE41M1k4MVZoY2RwcFMrc2EwL1diakhT?=
 =?utf-8?B?OUVWRThVcDB0VE1uZ2tnb0VDYWxjR0RDMjFld3Q5VjJ4aHlVTDhCU2Zzb1NH?=
 =?utf-8?B?T3pReWpVOUVnWUVOVXJIYzVrK2ZNcmx0ckxtQUlWZk5RS3MzQWVyaXNHTWJl?=
 =?utf-8?B?RGxDcnRnU2RMaXhXam9xV3MvOVJ1M1FDa01yejFkcXRqa1l5ay9uVFpoTkM1?=
 =?utf-8?B?UHR2ekd1VW9nZ2FFekdGY3dvQ1Z3ZWMyNFhRTkdVZHNCODVKRXpQc09Kb2FJ?=
 =?utf-8?B?MGJnVjZLK1l0U1Vxdk5iZEwwRUVtZkNNakZEaUl0VWdOUkpBcXE4ZUxpalZU?=
 =?utf-8?B?RlRvcVJ2QkJzbnpDOHlqT1RScUlBYmdWdjdQZ0hTWnBKU3hlYzBCRE9QRzgr?=
 =?utf-8?B?WTVzZ01iNWZ0eTBuUlNiMWRTV29BZ3ZaUzIvT1hSZ3NadDZLZE16UERia29n?=
 =?utf-8?B?Y2daSXp6SXpOeDBMSkxnTDhkWW1aSjd2SmxkRmVTNE95KzdpRUhSR1VZYmFx?=
 =?utf-8?B?eW04dTNKdDBSSUQxYUVhSmQ1bXBQcERuNzZtMWdMazF0MmU4SWhMZWdqY0tE?=
 =?utf-8?B?M3dqSWxmblRTWjNSbDdQRmhHanY2emlsZW1KbmNwaTFTd1JtYldkMEY1OHVV?=
 =?utf-8?B?dFlSTlo5Um55SCtoN3BsalY2SHlDbDN6MW4xM0hCVFczRm12YlYyckNJMkFN?=
 =?utf-8?B?R2szN0dWTWhQMUFJYmhZL1ZQUlJ2K0hUSmdnai9Uem5ETmk0ZU5scG4zZDFP?=
 =?utf-8?B?ZDQ5YWJoR3NwQlgvV2FpNVJmNHdKZzB6eFZpTW8xeXl2blR5Rm8xUnRxVXRB?=
 =?utf-8?B?QW9UME9aY2gzdENOTUJWa3gwSi9YNndEcFFsdUcvV3kwWG1yK1VpRDUxc09Y?=
 =?utf-8?B?TWM2dUdramtnUHJpREVJTVpqMC9Qa0s0UFFlek5CWW5FQmFiM3BpRUtRTXZD?=
 =?utf-8?B?ODkzYXpqNWRISHRQb3hVZEFzbFAxMC9xNTRndys1Zmo4N3pyOS95QUViNmRZ?=
 =?utf-8?B?NzhGcXd2Qyttb2JyYmx0OE83VjljMjhxeGovTjhOVnN0aHZiYngzNWNzTjB4?=
 =?utf-8?B?YkNLUmMxd05OSU4vRlU3V0JEbm5pWS9EUnpBbnBqUldic1ZSUDdMc0ZzditN?=
 =?utf-8?B?UWJUemRIcGxuUFE0WS9vZDdVOXdRN3FQM1NoVmRsV3ZXZ2pKbnA0WTRxc2d2?=
 =?utf-8?B?aUFFUzRmUHhoWkx6WmwzcVRlZnhNSVU5N0cxeVc4bExneU9pdXRWeVUzak9D?=
 =?utf-8?B?S3k0cXpDdGwwNkg2Q093SGlHRnRVU2tFSzFxcS9FWlAxTEM3aWtNMHdaRGJR?=
 =?utf-8?B?Z2hnaGlOakpTTFlqMy9URVNWQ3FSVUNWckpXSDhBc3ZXaFB2Ykp0N3ZBNURT?=
 =?utf-8?B?Z0R3WnV1QXFHdldhazFtVjFXa0VkNjZzbEt1amhwemxIb2hDOWl3S3RxY2VQ?=
 =?utf-8?B?bzBScU9Ga1FESk42N3o3ajFZRzh2ZzlKN0c0MXBMUUp6RlNhWXorMDRqbVgw?=
 =?utf-8?B?cE9HUmpxcnZKYlFJVjJWRDU1c2czdTJnK2diWjgvb3k3S1lHUFUzRmgxZ3h2?=
 =?utf-8?B?Vkozenp4MWc4cGhZNTFNSkRaNXpiU2VFeG05d1VVSXloNUhYV2ZjVWVEMHBW?=
 =?utf-8?B?QTZoMTVwc3c1SHJUaDBUdGJLRVI4bTVzOGlKRSt0bVpJSWJ5RW9tMGRJN0VB?=
 =?utf-8?B?ZTVwNTB4SXBuelE3aWFXQ0traFZCbEpqU0RJd0VobDROSDF4NUJITThIdVZR?=
 =?utf-8?B?Q2wrYXRCaE1xdE9tbksrOXUxaHhmQUFaNEpHQjZSMTJvZXE0U0o2amxaWWl4?=
 =?utf-8?Q?5o1IYB29QhEY/rggT9Xh2Tr9T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1318959f-5618-42da-b1a7-08db51e8c89b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 06:27:24.4298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcTQ9G/gDAlYmot+i2IeE1D/OWVU9o3gfMv9mFjkiliHYbyl/3XckTsOrAbC15d97+B3tgRU5900iyCjuFHXqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9095

On 10.05.2023 17:19, Roger Pau Monné wrote:
> On Wed, May 10, 2023 at 03:30:21PM +0200, Jan Beulich wrote:
>> On 10.05.2023 12:22, Roger Pau Monné wrote:
>>> On Wed, May 10, 2023 at 12:00:51PM +0200, Jan Beulich wrote:
>>>> On 10.05.2023 10:27, Roger Pau Monné wrote:
>>>>> On Tue, May 09, 2023 at 06:06:45PM +0200, Jan Beulich wrote:
>>>>>> On 09.05.2023 12:41, Roger Pau Monne wrote:
>>>>>>> When translating an address that falls inside of a superpage in the
>>>>>>> IOMMU page tables the fetching of the PTE physical address field
>>>>>>> wasn't using dma_pte_addr(), which caused the returned data to be
>>>>>>> corrupt as it would contain bits not related to the address field.
>>>>>>
>>>>>> I'm afraid I don't understand:
>>>>>>
>>>>>>> --- a/xen/drivers/passthrough/vtd/iommu.c
>>>>>>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>>>>>>> @@ -359,16 +359,18 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
>>>>>>>  
>>>>>>>              if ( !alloc )
>>>>>>>              {
>>>>>>> -                pte_maddr = 0;
>>>>>>>                  if ( !dma_pte_present(*pte) )
>>>>>>> +                {
>>>>>>> +                    pte_maddr = 0;
>>>>>>>                      break;
>>>>>>> +                }
>>>>>>>  
>>>>>>>                  /*
>>>>>>>                   * When the leaf entry was requested, pass back the full PTE,
>>>>>>>                   * with the address adjusted to account for the residual of
>>>>>>>                   * the walk.
>>>>>>>                   */
>>>>>>> -                pte_maddr = pte->val +
>>>>>>> +                pte_maddr +=
>>>>>>>                      (addr & ((1UL << level_to_offset_bits(level)) - 1) &
>>>>>>>                       PAGE_MASK);
>>>>>>
>>>>>> With this change you're now violating what the comment says (plus what
>>>>>> the comment ahead of the function says). And it says what it says for
>>>>>> a reason - see intel_iommu_lookup_page(), which I think your change is
>>>>>> breaking.
>>>>>
>>>>> Hm, but the code in intel_iommu_lookup_page() is now wrong as it takes
>>>>> the bits in DMA_PTE_CONTIG_MASK as part of the physical address when
>>>>> doing the conversion to mfn?  maddr_to_mfn() doesn't perform a any
>>>>> masking to remove the bits above PADDR_BITS.
>>>>
>>>> Oh, right. But that's a missing dma_pte_addr() in intel_iommu_lookup_page()
>>>> then. (It would likely be better anyway to switch "uint64_t val" to
>>>> "struct dma_pte pte" there, to make more visible that it's a PTE we're
>>>> dealing with.) I indeed overlooked this aspect when doing the earlier
>>>> change.
>>>
>>> I guess I'm still confused, as the other return value for target == 0
>>> (when the address is not part of a superpage) does return
>>> dma_pte_addr(pte).  I think that needs further fixing then.
>>
>> Hmm, indeed. But I think it's worse than this: addr_to_dma_page_maddr()
>> also does one too many iterations in that case. All "normal" callers
>> supply a positive "target". We need to terminate the walk at level 1
>> also when target == 0.
> 
> Don't we do that already due to the following check:
> 
> if ( --level == target )
>     break;
> 
> Which prevents mapping the PTE address as a page table directory?

I don't think this is enough - this code, afaict right now, is only
sufficient when target >= 1.

Jan

