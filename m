Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F0A58DADB
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 17:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382994.618076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLQv6-0003qF-8a; Tue, 09 Aug 2022 15:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382994.618076; Tue, 09 Aug 2022 15:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLQv6-0003nW-5o; Tue, 09 Aug 2022 15:13:24 +0000
Received: by outflank-mailman (input) for mailman id 382994;
 Tue, 09 Aug 2022 15:13:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/TE=YN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLQv4-0003nQ-Mo
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 15:13:22 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20070.outbound.protection.outlook.com [40.107.2.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c83f4cc1-17f5-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 17:13:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8662.eurprd04.prod.outlook.com (2603:10a6:10:2dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 9 Aug
 2022 15:13:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f%6]) with mapi id 15.20.5504.019; Tue, 9 Aug 2022
 15:13:18 +0000
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
X-Inumbo-ID: c83f4cc1-17f5-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxrGtPS3DScUKvVpMc98LjcUFWRknmzjfyc77SBUcspWuWkMCbbO5D5TkOUZIgIKY50M24rr7X4DVHnhtodlFseoJoNAfKW10htcyVuzgQ7JADQh6cuqgrT/d6/oUYOTVYNLnDd4Vsk83W+lWQ77IsdgPezW3BYAvWonBwc/OARTh/UhnZGXYLDrn+/7d51p+PZyt7+axSHWW90V1OXHrHQ1t7nv8gtSiuc86VNdHvzhWCdJ+9ZQe5XcxcWu+zrI7r1wXCzqNnEPZh2rdsomluHn5fuY8dvdYUU62mhZDZWsT/uXYjMMshlCMhKYl0BTiCCrmy1VHlbbRCe6sV/uqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKh30c55EpI/STGxmfeUdUzT9z+6VgDDJLq4DGKo834=;
 b=QMG6iYDpSMn7OLbLeEe6QBHreY+rqTMClDn757FN88Bfj5op31CVe44aMha+IDyXrJ81FRaiRptMJq7crg5eK7DlbajbdDiMwfmqFxi9qoT4ir0YTGvNFIHkKyQ/dsMwV531BchrRmtwJvuAlMiqBcokN2Q2sICaZouVMbH7AEjAv7z9O0k4AImGC4VZngD5VQ0Wg2eXvVdU/T9fcvFqRnZ/1KK6KTMBNuf/KOTfG0WH6EVj0agyj0YkbXywvsWC4OaIoThEHSwOQMlCXq1CSupl2sOqN3ppSky7qD8QXc+8QEFP5206GniZG+tIM8kkx/ux2WcqbsMkLgUWDDaWbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKh30c55EpI/STGxmfeUdUzT9z+6VgDDJLq4DGKo834=;
 b=0UdygP/yptmf22itCGqVedgUFZ5rVUmT9IyafvGhfuBHrKqPwssMU8TNEEjfp3wdVq3CPxIu2mWJvzxychUcmfzTPRt/0GwXcvhR7TiAAju2paUrxtFLZeey4PrYabApYyerv0zBcln3dl8Hg/pO/wJvVGlVf5J8A3r7FoRi9IzfmeDwVmQacnNXics1Lvcn6PKirsou7oXPy4Lk8DS0v7LV53rNzwm2Xepu4sz17jYmH/lng1C4P0GKMmbWU3GpqGHWhHnY5bZIKI3ve79RLB7Ua6UZ8D7r39ErO66HaCWkfSWekzwSVHf9UPFf3gzSWdsrkHaTfM4GCCCgUOXeaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bd7d16b4-f11b-48ee-07d9-0f2e3d533964@suse.com>
Date: Tue, 9 Aug 2022 17:13:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] [RFC] xen/vpci: modify pci_get_pdev_by_domain() &
 pci_get_pdev()
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
 <dd0ad0a4-6a01-7e35-51dc-614477bb9556@suse.com>
 <9F5E81CD-858B-44CA-8BE3-B518111E2E85@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9F5E81CD-858B-44CA-8BE3-B518111E2E85@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb78e224-b91c-4eab-b868-08da7a19b094
X-MS-TrafficTypeDiagnostic: DU2PR04MB8662:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UcerGU+YGX8ba5ErQbucnUSw8sOPDM9TBvHVGnvJh5w0wSifiYeGkeauJgMBh4fqGCvHRCzBg5WG0iqtOjJ1X8VL+pVOtdz4n21xoAVcUvpZbbFaql8a/rOt3QI6fX3pbi24yWzltAIMEds3WQZilG/gV2cj1KCqr2PEfKmVZN7r6nimRmVvbZoAZLP4PEFskS8k9CkChCffdJyLeni4p+7WDfilX2ic+LFfB/TosWyTro0ZTafbSNyeJuKl2G8D0yFJkcJMh33tfmHr6kQBFqa97f/g0H0FEO7idTZkTDRX4XhMJFbA8Ig4ztjVzJRbcYUULYvqOoQpLM2wEdMKwKNEdU3SK9Tygw6+FJDa9DnARhAk+gNWdK0hU6eptp4BB8z8MIbTtosaVkKlijd4+AHjmTbYV8X/s64TYmGjFqoD8fNabNK03cxwT/ULQiBVTexgZjFdCeTvoOnKpAYdoO6HRXkSHDz8TpKDb9df/eyZRjQj2nuELBXAvRYLuxtzuLHvDHi3nHgFEa1nWnY34Lf+XMYFNQfhBClAt6kUP3q+BcOz4xQagtl2FVJyYssj+JPNSijnSoZRAprVcFSKEZU+rjwasrCUBwOw4QpDsgQfPX6skGcJUE4Zno6KrMyP9NeYeNrpajm4rzp1Mvv353U+u6PwZTivluztKVmNTwEKytdTU+MNl8ZyASmU0+HZ+1Zcqyz+p+N49eD0p3mLeOJMtO1AQaMDMRJmGHNEOBk4bYVtEE32LfSCPhgvLU6wOAUo8O6bJXXVBvwM1BmwWEcgw6KsyePnvOa18MkXmuhg6JfHbV31X7vkos0yIm35Vt3ju/zBSZJEXaX3eCvY9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(376002)(39860400002)(26005)(31696002)(6512007)(53546011)(86362001)(41300700001)(6506007)(83380400001)(186003)(2616005)(36756003)(4326008)(8676002)(38100700002)(66556008)(66476007)(2906002)(8936002)(5660300002)(31686004)(6486002)(54906003)(6916009)(316002)(66946007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2YvNUpMQ3AzWC80M2Y5ZjhUTDlVRHRmdUhyZGhFVUZsSldZSnFmZjRrK0JP?=
 =?utf-8?B?Z1U1NUpmTHNmT04ybXVTdmhVS1ZPSll5OVlOWHZ5K01KMXpqMG1ZTmNuNURM?=
 =?utf-8?B?T25CQnZFOWcvdEQ2N2ptcUk3MnVUcFNoekpQbXUzR21OM3VubkxMNEVraldi?=
 =?utf-8?B?SUF5YWU5cTh6Uk5xSHpYb2JheTR2SkpZTUlwdm9xMUhjTzdiTS9YQlRoRVBn?=
 =?utf-8?B?bkZldXZFNlFJNEVkaFNvWjZTdlgrWHdSMHNWNEpDTU1ubFpLVUF6ZDcyRzJh?=
 =?utf-8?B?bVZiNk5KQmdVYnpQc1Vza0Z6T2pxNmYycHE2a0Vuc1NVMUdad0pVbkQwaUc4?=
 =?utf-8?B?RXQ3amhwalJKZmN4OGNidVNtUUMzTlVtMThxamZwMEY3eFJOYlFPVW5GVGdX?=
 =?utf-8?B?cERJeWxLOVhtU29iVVUveXpoQ0l4ZTZWMGNZSU44Y2xKR1dlQXZRSWhLbG02?=
 =?utf-8?B?aVFPVmVFWDhtcTNtSnh1MzBudFJYYnpZcjcySmIrTHBqNFlGS0lBOEF3RUt4?=
 =?utf-8?B?eVVTeHlSZzFDd0JKVjRTMDBLRHpPV3N6Yk14emVoRnQ4ZUwyTTVkdjF6TW1J?=
 =?utf-8?B?cXUvdFVveWRwa1QzQmt3NDREa2FEQWFIRVdZa3d6b3BJMVVSWHF3cHUzR1Jk?=
 =?utf-8?B?NW9TQnN6WXZ2MzNic2JFTjJiMFhIdk5EQitONlFqWlZlOTgvSEU4S2QvQVN6?=
 =?utf-8?B?UGJxc2dzUm90OUpJbHZWOEY5dnlUSERLclh3WndPRVZ6WWJIUnU3RWRIVHZK?=
 =?utf-8?B?Q0dicC84T243aXgzcjJqZUlzSlkvS09nTUR1bzZaeEFwbnFvb2YxVElLVnkx?=
 =?utf-8?B?MnEyNUJ4UHc3U2NFWUwvL0pxNDZmVFlYWWptWVUxOTZ2anpNaDN4SU1mdE80?=
 =?utf-8?B?OVVnNlNCUkxLbk91MWhOaDVLRDNwQ1hvRi9odmwyQzNuWFpCaHpVYTZUKzZB?=
 =?utf-8?B?eDc4K0crSWhJUVIrWUx2eDROaFhhbW1rT0FjM3l6MUdIR1B4YTVQWnUxMDIz?=
 =?utf-8?B?MjFOMU51dU1XQmVNT0h2SlI0WDFQejk0TEJBZ1pVTHExdGs4S2UzK1NUU0Z6?=
 =?utf-8?B?NzBqa0RpSkRUWmZMNHM4eFlOL1hQQ0dHM2FuMEMvaWNnQ3hQNEdiRFhrQlZT?=
 =?utf-8?B?eTBJZ0VTa2dPNDNKdnpYQzNMcCtaNlJMQWlrVmdJZjI3MS93aktQRTdDL3R0?=
 =?utf-8?B?dG9MY0UzQzZtd3dkUTNaUzBrRlQ0R3RPNUtrUzQxZG42YzRMMXZJZmFudC9E?=
 =?utf-8?B?QVNPOWpQWmhKOWtGQ3VvNlVKUDdIQ0Z2MVoydHkrWHV4d25ZVGdVT0RKSVE1?=
 =?utf-8?B?LzgyZDhzWkhiR2MwMm1USlNyM1pJVFdlQnZ2c0pvelczRjJnQ25RMXRwMWs4?=
 =?utf-8?B?dDU3TGpZNm1UTit5MTlaeTE3ZjRDRlNzRExQNXVIbWQ4SzUrYWhjSW1UYnMx?=
 =?utf-8?B?ZW1VdkVEMWNHNnlqcEZkbmZZbDd4RExQWjRkQ1NZVHk5bUtIUkZab2VRNTBh?=
 =?utf-8?B?WXhmL0NsejZyU1F4SjlFbzA2ODdjbi8wRWpTeFFkWEhBZjZjdmxubXFUVDdB?=
 =?utf-8?B?NkdrV08xc0dLRzloNWNxSWxvaWZFU2xuS0J0MGFlMmZMcURjTWxhREJ3RXM1?=
 =?utf-8?B?NFFzRmdkeGl4ZmtiU0s0TVJSYTROUUhvY3NQYk1QUjRRcmluNzZnNG5icnYw?=
 =?utf-8?B?ZS92YmE4cXBRRTcrc0k5czhrRGpiVGUxSnU1NGVoRGdDVEpjTVM1NUltOWQ2?=
 =?utf-8?B?ZDczYXVERERRcW5RSnkxV0RHNE5qL3lMSnhnVjRpSEJCNWE5c2NYenUwZGJB?=
 =?utf-8?B?TVNEbVpNei9ZTG1JTWJqQ3FJRktoL244SUtSRTY1VnRlWjFSSzQ5ZExoczE1?=
 =?utf-8?B?eHBURTRhcWRlaGRCdjBYcWc2SFl5UXBTbm1OcWFmdzE2d0U4Vlprbzl4NHB4?=
 =?utf-8?B?WjU5aVlDR2VUekN5bklEZGZSd3ZHcTNSaHVLNXI2VzhUSm15RzNRaURrWWw4?=
 =?utf-8?B?OU92cGhYbkpSdkRuOGNuVHJWaG94Rzc2QWJneG43OTZZRlI1RHZtMmxMcjZU?=
 =?utf-8?B?TXJjRlozVFkxbDdYTVNEVmJ4VHhoYmR1bFhTdGdNSFkrV0FNeFphc1JtSkRr?=
 =?utf-8?Q?Oo/KaHilWM7Hb18oxQqEGPjaP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb78e224-b91c-4eab-b868-08da7a19b094
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 15:13:18.3060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIYGxGezWAxBfVohw9RfWfpXwChzIKoWewOs8QK9wgQlIjrh1oVt1Jodf6/Y9USQcLrG3+6GSJ5e+WOAovzEwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8662

On 09.08.2022 17:06, Rahul Singh wrote:
>> On 9 Aug 2022, at 11:02 am, Jan Beulich <jbeulich@suse.com> wrote:
>> On 05.08.2022 17:43, Rahul Singh wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -593,13 +593,10 @@ struct pci_dev *pci_get_pdev(int seg, int bus, int devfn)
>>>             return NULL;
>>>     }
>>>
>>> -    do {
>>> -        list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>>> -            if ( (pdev->bus == bus || bus == -1) &&
>>> -                 (pdev->devfn == devfn || devfn == -1) )
>>> -                return pdev;
>>> -    } while ( radix_tree_gang_lookup(&pci_segments, (void **)&pseg,
>>> -                                     pseg->nr + 1, 1) );
>>> +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>>> +        if ( (pdev->bus == bus || bus == -1) &&
>>> +             (pdev->devfn == devfn || devfn == -1) )
>>> +            return pdev;
>>>
>>>     return NULL;
>>> }
>>> @@ -642,14 +639,11 @@ struct pci_dev *pci_get_pdev_by_domain(const struct domain *d, int seg,
>>>             return NULL;
>>>     }
>>>
>>> -    do {
>>> -        list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>>> -            if ( (pdev->bus == bus || bus == -1) &&
>>> -                 (pdev->devfn == devfn || devfn == -1) &&
>>> -                 (pdev->domain == d) )
>>> -                return pdev;
>>> -    } while ( radix_tree_gang_lookup(&pci_segments, (void **)&pseg,
>>> -                                     pseg->nr + 1, 1) );
>>> +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>>> +        if ( (pdev->bus == bus || bus == -1) &&
>>> +             (pdev->devfn == devfn || devfn == -1) &&
>>> +             (pdev->domain == d) )
>>> +            return pdev;
>>>
>>>     return NULL;
>>> }
>>
>> Indeed present behavior is wrong - thanks for spotting. However in
>> both cases you're moving us from one wrongness to another: The
>> lookup of further segments _is_ necessary when the incoming "seg"
>> is -1 (and apparently when this logic was introduced that was the
>> only case considered).
> 
> If I understand correctly then fixed code should be like this:                                        
>    
> —snip— 
> ….                                                                  
>     if ( !pseg )                                                                
>     {                                                                           
>         if ( seg == -1 )                                                        
>             radix_tree_gang_lookup(&pci_segments, (void **)&pseg, 0, 1);        
>         if ( !pseg )                                                            
>             return NULL;                                                        
>                                                                                 
>         do {                                                                    
>         list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )         
>             if ( (pdev->bus == bus || bus == -1) &&                             
>                  (pdev->devfn == devfn || devfn == -1) )                        
>                 return pdev;                                                    
>         } while ( radix_tree_gang_lookup(&pci_segments, (void **)&pseg,         
>                                      pseg->nr + 1, 1) );                        
>         return NULL;                                                            
>     }                                                                           
>                                                                                 
>     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )             
>         if ( (pdev->bus == bus || bus == -1) &&                                 
>              (pdev->devfn == devfn || devfn == -1) )                            
>             return pdev;                                                        
>                                                                                 
>     return NULL;                                                                
> }  

That would about double the code in the functions. Imo all it takes
is to alter the while() conditions, prefixing what is there with
"seg == -1 &&".

Actually while looking there I've noticed the get_pseg() uses in
both functions aren't quite right for the "seg == -1" case either.
I'll make a patch there, which I think shouldn't collide with yours.

Jan

