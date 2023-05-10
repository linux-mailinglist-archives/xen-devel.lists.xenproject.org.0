Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 708E86FDE92
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 15:30:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532807.829111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwjtl-0005Mk-P0; Wed, 10 May 2023 13:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532807.829111; Wed, 10 May 2023 13:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwjtl-0005Kq-KV; Wed, 10 May 2023 13:30:29 +0000
Received: by outflank-mailman (input) for mailman id 532807;
 Wed, 10 May 2023 13:30:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwjtj-0005Ki-DL
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 13:30:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d28e1e94-ef36-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 15:30:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7621.eurprd04.prod.outlook.com (2603:10a6:20b:299::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Wed, 10 May
 2023 13:30:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 13:30:24 +0000
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
X-Inumbo-ID: d28e1e94-ef36-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+Nz5ZA0Igd7picUaiEoj8G/JQpNfZ3QWwtyzxxNExZd4ocYo5m8I4CvfHHh5NLTEP3ZkdQd0v3nabR2qzSLgYvL3oX7QlQO3hXhkt3p2J+L9OADdRn8MJnsFqHN3iGZp3IVmrTyies4Fp1LtYk1O5EPSA1cGajbHgKTEQNq3TK9RfUamjGBPA6o4dIPvVzy7TxTw8EBZBhntG2tjE3TIZlO3l7RYPpHi4l/N9jlkxjrGfKvPJMHrJqKaLfx5whLdPwnU7J4eMFDQr/gpJCbnNoneb9n3G9NAZgDvkPIAeC266ZQCWd4tlE308N6wAFs7+xYrZtbwWyfYdC0QrfKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkwdbCza5GI8/fMe9/WG6chBxRImyMQTKLkUScg/9gU=;
 b=Kr2Y3bRRqRHITPod+Jjw3pbEIKUWLXkNSf5cgpEqGV1X1y9HixsMCNB1LzOvMQ1ds43vteIg/CEBqxcTvyf11vpkBiGy8tvYr+RMtBRHdx8V+QQudBr29iaDEJNqU9uIrZn4eipAL3aKmkDsiqwZOjLYu4nurWQfTNl8CD9qNDO4ku9UDGNRwne/R+1Ng5n5ArVUVVe/nWK0ewmi2PPH/jg5GkwFzUKBJuuNGdAq0gAs47zPzzktLBbKuQkl62ckv+TXYWo5Umu5KYJ4Q+tCjdutxoBBXVi1A7NNGeO/c3LVfC3Y+nzIg2bc308McQb38j6q2TdfRzzT7lTmB37MMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkwdbCza5GI8/fMe9/WG6chBxRImyMQTKLkUScg/9gU=;
 b=u/vnipHb+NO991qh16Cl0rzCZ2GulFgPeWTCN4CWP4vZYs8fNG6KVyDSRLGNs2KeDfTb3WU05aAWJcwfpZG/QosAPHo+LUFyI7X46A8fZwu/yAYV3JIYTtmJKUsXZU+2D0DCbtIJAQW3vZQxJG4FF4Wxf0zABLzu+BGXDj1B1ivOC76PBzPCWdKcxkOoyggTrhjzLENdna4EfoYyLPGRMV6HF2w45VckynxAhCe0uj+w0Co6d2ptZC5eH16adeaHr2NOKaAuDKmIr/soSBfPTNC5/mjVUSsUjKXpSq0wQqSXwA7+0iE702pmWR7nLT5v782XBt0NI/8iVI1aATGMsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f53d0041-d694-1221-475e-648a2afd2ff9@suse.com>
Date: Wed, 10 May 2023 15:30:21 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZFtwSjuZaz05DIY0@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc7d5fa-a82c-4a95-8611-08db515ab578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3Le/s2WHu3KAS5Ek72KiDIHqW6wOxTK1oUWC6HR0sSUchPFRJwX1C7ZJN0IAT6BjRk6JrKhRqzm+NlbiBZtdSHZUzocVDT8oqGKRPohpfUVpBg/f+sQrLJhUAJVIHlD+26Qas05TCzTAOWxHcH574s17wrjYk/5Z0wHlgwyO7R4cDpNR1kbhICu6xJr8hXJSZpLJx7f2e3dMAAr5tirtWZPDVI9kne3Y660b+bSrwIalgqjTSQ56/jD9uHe1tQelvjD3uZ3Do0kONMShg7byxIbxiIZyMW5HL16nujBd/Tpg5ZzsExX8eSkkZf0QR5FT7Ok6RtF3S2V3Vk/Mf6Q539PgBbbRhFZsj0C3ADE4aoNs8cxtll2InWfiN3ZI6A8zToZFIk8BaG9s0o5RvlDG9DxIUDKsLZEaGPnMwlhZLnNfmP1SZ8rMZdUjC7DFdTMVgQzbsOD0kXHcMpm2OKIwRPRccm7P2RmBFrzVFz5qRA5SZCeTprqYgOTqU8D3PPeZnsYD5mJMaDrRRHK0idltPPJ+/MyWgk2/tEShqt4jS+JJww+pR+0OHhcbSwMjSv2cCM2p1QkdzXprrn91dTLxNIjOjSebkrYtVw/+90+bFZd0olycFTnrwaQ4yPTE0FbVwhoOHjk6GhMd3g+5O0vxVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(39860400002)(346002)(366004)(451199021)(31686004)(66899021)(6666004)(66476007)(6916009)(4326008)(478600001)(6486002)(66946007)(66556008)(316002)(86362001)(31696002)(36756003)(83380400001)(26005)(53546011)(6512007)(186003)(2616005)(6506007)(5660300002)(2906002)(8936002)(8676002)(41300700001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlNqZkZ5c0NnelJTVkozZXpzc3o2c0U5Y2dIZ3lwU2xQUHhTUlFiYThXRmwy?=
 =?utf-8?B?ak1FTmg0TFZYcCtFQmZtSk5NTHdZY1ZCSWx5RXNrbXhZdDdUV2FtcnJoYm94?=
 =?utf-8?B?eldlcFc1QWFwWG40NmhxSDdDc0FYcHJWQ080R0s1NnVxOS9UMHQvZm5IMm5E?=
 =?utf-8?B?d0FuMXRRTmUxYkd5UkluOUt0NStOVHI2Umc0ZzNCWWNBMkROUFRVcHpwa2cz?=
 =?utf-8?B?ZVFRQldwdll0MVpySzAyUmgxWm5sQVNCM2lqbFd2a2xLNEd5NTFabXdlT2lM?=
 =?utf-8?B?bmRETVlxQi9BZ1RvdDVuY01zNEtkendrRnlFa1lkR2lXSCtDS1hxd092WTE4?=
 =?utf-8?B?SlpjMC9xY1djd2RkRDlDTWxKWk1sOU1Vbk5sd2lLV0hLOHpYd3ZNZzZpVmlI?=
 =?utf-8?B?dE9MdGRsdmI5VkpZWDg1ajNRTk9SQ3R1TTA1OUNGRTZtdlRWbmlEd1Z1ajJp?=
 =?utf-8?B?bkNVaEc2THh5ZG43VGhUSjA4N29sSXkrZHhUS3ZrYWI0TDgwdnRNdTZzY3BD?=
 =?utf-8?B?K1hTeU1nT25uei8xdjFQTUk2RXpMOHZFSjlYdnhWUS8yZXZadjRMU3loS1Rr?=
 =?utf-8?B?ZGg3ZUFob0ZKVUVPTC9ZcnhxY1RtNkVnN3RkaFp1U3VBZnlxeFVKT0xlbGdO?=
 =?utf-8?B?MFFPUXY1ZFZzdzRZQXIxSEZjRGdYT05iMDdwekIra29vWGNFZnpBSHVjNXRl?=
 =?utf-8?B?ZHhCSVdjRkFZMFJSTTR3cWtPTzZrbEN2OThRRFNFSUt6cXM1UExOd1dpUWJY?=
 =?utf-8?B?dGlyOVE5VnZncDd5b3oweFNQMmpFY3poaGNWenRTYzZ2YUp5VGQrSkdEanEz?=
 =?utf-8?B?bEdsYUxENE5wWUtWTEtnZ0djVUJ0Rjh1dWNpOUMzNnZhOS84YlFObFJpTlVK?=
 =?utf-8?B?dC9nYlNsaUkrVDdHb3Jvd3VSWk0rdUVJZG5oS2xWdzRKZ0d3SDVuSU0xYTht?=
 =?utf-8?B?QTBQOTg4VmNLVExybjB1ZGVLSll6SjFtM21lbHNySTdGUERSYndYbTR1T3Iy?=
 =?utf-8?B?V085c0RXZ1RWQy9IWEd3L2NwdUFUU2pmZVB5Q2VoOHNVK1FhSGJVZWdHQUwv?=
 =?utf-8?B?YzdMYkhlUkErMHo3Q1piM2tSTWpJejNZZjBOZFJZWkxhVUJkU0d3bi9URTYr?=
 =?utf-8?B?RDVzbUJJZXpCT0VjOEwwRmo5RFRBaFVpaTYrazkyejBaTFJNN3RlQ21LcXpN?=
 =?utf-8?B?V1BkOWhWV2RmVkdkZUxYRFkxb1IyWkN4djV1RnZ2ZFUzZUpiWDNldUNLZTdr?=
 =?utf-8?B?OFhPZ21wSndaRGxIdEFTVjNta3lRNXdlQlNXNDlKMEJaYUozZitRdDBoUXFO?=
 =?utf-8?B?L0dHUjlrYjJGa0Qramhmb29KbzR3UXlkeFBSK25VUUtHcUsrcTZ5WEFEckMv?=
 =?utf-8?B?cSt0dDdjb2k5b0VzMFhUM3ZMR1E2b1d4eHRraGNYOWNkT28wam80TWVLaURk?=
 =?utf-8?B?dk9zNk14V2FEV2xGVGxDdmpzaU00ZzRjSUxwV09aWG9uemtYVU05ZkdNUWtu?=
 =?utf-8?B?dHV4WE1lMnJQcGgwb2NpUVEwV0FKaEZjUlJIbzQvd1pBbnc5UjMvNS9PeHV4?=
 =?utf-8?B?QWdldStWcldwMklTVFNnY09XUVV6UndPSTZGMlhCaDV6M1NXcGFrcjFGZ0or?=
 =?utf-8?B?R2VGc0xSa0luc1VxcUJ4Z2l2bU4xaUNQMDAwR0FCa1RFUm84OG1ETDFaMXg4?=
 =?utf-8?B?L2dvUnQ1aUw0aGdld2ZsWXMyQlZleWxWTnBtaWUrbmQxTzkxc0ZQaEhUbWc3?=
 =?utf-8?B?blJ0VjAreExsMElkZG54T05RdTB4d04wd3dkMDYvN29GclVnRTJWazVteVE2?=
 =?utf-8?B?SjgwaXVMKzlGbGFLWlY3M25iZlgvVjZoUFdla1JRM1R3cDJodEFsUHVXdnUz?=
 =?utf-8?B?Z1N6ZjFkM0FkdW1iRCtWa3Zna2Y5d2VJeWVDMm5qQ3hBSkZVZHc1ZjlwOVF6?=
 =?utf-8?B?eTI1SXI5azZrK01kdVRkekxTT2RZcXJzc25Fbnd3NUFrQ1VrbmhmMHRsSmZS?=
 =?utf-8?B?R0dkeGN5cTQyOXRncDJWSUIwYWM3dm00Vk1HUjA3SzVrR3JhV3pXL3NvcGp0?=
 =?utf-8?B?NlZVRkFMb3huT1oyaE5LbVVlcDZIbUFRcTZ6UkJoYW1aYmVuUndub1VpalJ5?=
 =?utf-8?Q?Nv1nr9brkSu3qWtWD+0o4Gxwq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc7d5fa-a82c-4a95-8611-08db515ab578
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 13:30:23.8508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XrTXsSWSbFSFyC7U3i5c38VwhsgiqHE4lQm2+Y6JlO4CbmVe+Smr70Gmm2Y6G3Ql+oBViYGZgtdJVwTvObCcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7621

On 10.05.2023 12:22, Roger Pau Monné wrote:
> On Wed, May 10, 2023 at 12:00:51PM +0200, Jan Beulich wrote:
>> On 10.05.2023 10:27, Roger Pau Monné wrote:
>>> On Tue, May 09, 2023 at 06:06:45PM +0200, Jan Beulich wrote:
>>>> On 09.05.2023 12:41, Roger Pau Monne wrote:
>>>>> When translating an address that falls inside of a superpage in the
>>>>> IOMMU page tables the fetching of the PTE physical address field
>>>>> wasn't using dma_pte_addr(), which caused the returned data to be
>>>>> corrupt as it would contain bits not related to the address field.
>>>>
>>>> I'm afraid I don't understand:
>>>>
>>>>> --- a/xen/drivers/passthrough/vtd/iommu.c
>>>>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>>>>> @@ -359,16 +359,18 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
>>>>>  
>>>>>              if ( !alloc )
>>>>>              {
>>>>> -                pte_maddr = 0;
>>>>>                  if ( !dma_pte_present(*pte) )
>>>>> +                {
>>>>> +                    pte_maddr = 0;
>>>>>                      break;
>>>>> +                }
>>>>>  
>>>>>                  /*
>>>>>                   * When the leaf entry was requested, pass back the full PTE,
>>>>>                   * with the address adjusted to account for the residual of
>>>>>                   * the walk.
>>>>>                   */
>>>>> -                pte_maddr = pte->val +
>>>>> +                pte_maddr +=
>>>>>                      (addr & ((1UL << level_to_offset_bits(level)) - 1) &
>>>>>                       PAGE_MASK);
>>>>
>>>> With this change you're now violating what the comment says (plus what
>>>> the comment ahead of the function says). And it says what it says for
>>>> a reason - see intel_iommu_lookup_page(), which I think your change is
>>>> breaking.
>>>
>>> Hm, but the code in intel_iommu_lookup_page() is now wrong as it takes
>>> the bits in DMA_PTE_CONTIG_MASK as part of the physical address when
>>> doing the conversion to mfn?  maddr_to_mfn() doesn't perform a any
>>> masking to remove the bits above PADDR_BITS.
>>
>> Oh, right. But that's a missing dma_pte_addr() in intel_iommu_lookup_page()
>> then. (It would likely be better anyway to switch "uint64_t val" to
>> "struct dma_pte pte" there, to make more visible that it's a PTE we're
>> dealing with.) I indeed overlooked this aspect when doing the earlier
>> change.
> 
> I guess I'm still confused, as the other return value for target == 0
> (when the address is not part of a superpage) does return
> dma_pte_addr(pte).  I think that needs further fixing then.

Hmm, indeed. But I think it's worse than this: addr_to_dma_page_maddr()
also does one too many iterations in that case. All "normal" callers
supply a positive "target". We need to terminate the walk at level 1
also when target == 0.

Jan

