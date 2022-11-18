Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092FC62EE3D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 08:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445442.700596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovvfj-00088K-Gw; Fri, 18 Nov 2022 07:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445442.700596; Fri, 18 Nov 2022 07:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovvfj-00086V-E9; Fri, 18 Nov 2022 07:20:23 +0000
Received: by outflank-mailman (input) for mailman id 445442;
 Fri, 18 Nov 2022 07:20:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LL5N=3S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovvfh-0007xL-L2
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 07:20:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74b36ab6-6711-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 08:20:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7064.eurprd04.prod.outlook.com (2603:10a6:20b:118::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 18 Nov
 2022 07:20:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 07:20:16 +0000
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
X-Inumbo-ID: 74b36ab6-6711-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0gwI8u69DMsmJEz6MQetvhd2WaOUfYcnSPZAsKnGtvbjBrytgiS4zaRO9cCLbyjpDrc7p7KlQQggzGQrckOs/w7g3LnauJTQkNzQh/yUDGJ6PuwRsE9hZWyQS/TEQzvrwMF1GdyQdmg6hJeahrScU/Zg+nyAwXw5w9rioa1LwgVfLSG1X2Bmtq18oBW+Km5IJ6+eAiBqRwIJAWBNYPEnGwDHbheXm9wP15zKJIzDE92TPlYix/HzYxpLm9FzrKFd3KRI99q/RTIgfumQ/G5nIBFKA2juv3fa0aD+yA7dRNk6EC97ildWgI8lROmol+syBbkfGa2Zo4SXM92vMTl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mb2x508X+9y63QKlaQN5o+Rq3EAdZFCsk4rNaOj5IE=;
 b=dmz0tZ2hzgIqi2a/GlY5zAwgJuAlFuBPv1D/Ov2+R2hAXUSrTtepSMCwsDInq0s8U3yL9xRp9M4PBdNIRRjmcctsa2u9+CVfTqHTPbCW+qcI4JlFNHxf6jI0kcF7hK8gfNIofsBeFaCeTc37J1U2lkBLHBUf+c5B2jsrT6pmG24TH8xlGhuVWeISEqi5NYj0PC1+WFJaqu562zgaZFG7mzcLhVmahXmNt+dIEGP289TSZsuRu6D+/SgshIyShzNzy//74Jn22a/z7hdmbPZ7We36FOCMTXN6oWQYmKbk/loTRCp7H7FNhYz2u07C97HRTARfHceUYZzqNlhkRKAhGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mb2x508X+9y63QKlaQN5o+Rq3EAdZFCsk4rNaOj5IE=;
 b=mGf50q62sGaV8C+sEZ9wY+h1PjCVUxKh99QOqmKCDMmqjH0Y+mZy9uCT1Mic7Zo2lkuP0KZZEA2ULGxfNf4B0yqIRhrwUJx42f2FUFOM86OVnM02d/7nLz9ygyP/Njh2I00IAAiSWV16GPCg3Bfllfd2UyRnj3P3XTLYmyvNQzPQ2ROlFNVMSKJODGPuvFUDmQDQArimTc4Zw3JuyIt084GME/TGunZtveJuAE+D8xl4kGFSSfw6yFmOJPUwuSlm61DqEvETWWDH+bo9Udoe9QGDfX5/KLh9MyCOEy0wq9lH2nsWsOzanRkmBCyyRnH1kgLxBLWhg3JR3AHmpTvGsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc75d927-b936-0716-bf36-70bb65be7a1e@suse.com>
Date: Fri, 18 Nov 2022 08:20:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] x86/msi: Allow writes to registers on the same page
 as MSI-X table
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
 <20221114192100.1539267-2-marmarek@invisiblethingslab.com>
 <15138618-5cb0-8304-a56b-cb787e187772@suse.com> <Y3ZwAJITlD/rSf/n@mail-itl>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3ZwAJITlD/rSf/n@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: 5182fecf-3d1b-4e99-c5f9-08dac9355722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cRiwDJNAWpdjs0jL7bVflWwpLjfvH+WTkzay5kAQrIPAJnaYsSKmaqQoq/xWBc3NJXtjEdwHvMsb1VdtBf4OaoVOyXFQLt1klImxx5DLudTHseoR4aZTHHK2PI9K2bvHYoPugE69vxwN8vGDkqk5T/RnhJ9/DN/ur8Smj6Xof6ef0Pp+EQ5mjnw2RtSAuEvJiQb2Ecg2fmdjgWHcX96t726r2v5zY04V2YnMwImTG3Tgqbr4fPxZ3hTqY86STqFHn6ih12AR5AUEuYQr5y4wrDuLtG9OJU5a45wB78pLiyNNYtHb+qHR5PY1ziw1+3ehqQ1fb5Vhv1rTttRVQSZ8vSk8y7x5hVxwh7UmvAuldItTV1Fdq2gFmWVo8gbgA4z1EZAlLUjuk5daS4pAlNgkba1GIgd68HJbGnHkvvDVzZV8rDZNjDAwHWSb/LBrQoV8EWAFeesEtgg0BXAW36PeR3ELljza5tjU8Z9wHqbsTLm3mUyD1funr+DT4Z9gihpyKymTiYGc7r8VE8sw+57euf9bX2PRI79z57ie5HHu9+N7L5uPW8iQEECef0kfu4NFrl4J6Rs5AiWnhJO/Qkq4X7CGA15d83kEiwWfEgWuWWhoj+UU7XBdw+BueOob/4dUGB/WbLLrk1p/v+ZBUfWIAi5H1DdpdbQtQmDE/pO/FAXwrrzE79eXCJCMuchQOslVtniQlA1Gw4so4b7XzQvAEy8ScZbUGaPr9+CLoM/Go9ns+fIByvA0KHFsvkPGSpBy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199015)(31686004)(2906002)(83380400001)(66899015)(36756003)(41300700001)(2616005)(8936002)(86362001)(31696002)(66556008)(38100700002)(6512007)(6506007)(6916009)(53546011)(54906003)(26005)(186003)(5660300002)(66476007)(66946007)(8676002)(66574015)(4326008)(316002)(6486002)(478600001)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cll3OFQ3U05xNStPZ1ZObldWYWh3THBRbDNnUG5YS2NWdENZLy9kbHZHM3lN?=
 =?utf-8?B?ckk4NTJxTm5PNGp4YTJrZHNiL2J3NjZ6OW1HL3VsWGtPemdMN293UTdVdkRr?=
 =?utf-8?B?QWJicWVBMUlsdGhlYVhLeTlVU3dOQzA3QStYTy9jOTVNTnlMc2doektsTmFm?=
 =?utf-8?B?dCtGRlVNajB4R0YvSWRxMkN3ZkhGNVRXWml1Z3RzM0VVZ0VKSzVhUDNBOS9O?=
 =?utf-8?B?YzNmM2MxK3JSS2VJa0lvWXNtN0ZWdUtDb25pSmpMVDBWVHFueE5CMFN1TnNC?=
 =?utf-8?B?Q0wwT1VrRXovZkFxSGVYRU5vM3YzSEg4MFhRMng1M1JDZ1QwVVB4dXNaa2E0?=
 =?utf-8?B?ZmUxSjY5SERodDJoUks3clBBSTdsSWhDN2I5cFZXbVVHeWdMOXNITUs2UHRF?=
 =?utf-8?B?QndZOUJVZjRoV0xPNmlENi9kZEdCdzhYWTIvOXVXbmdQMmtNdUR2RjZWWk5i?=
 =?utf-8?B?VmRxcUhQVlhzcXltbFFlTW0wdlFZNjJoUDR3YUZta1hTVmxESVdzVjkzczFG?=
 =?utf-8?B?NU9oWTI4bnJsQU94OHZvTWs2d0VESXcvZnMwVmsvTUZoODZneFFFU0RIaEtD?=
 =?utf-8?B?QUpjdEpsanM5RlExRkFTNXZVUWpWa3pKcEd2UW9oTUV4d3BHU2w2SkNNbmFZ?=
 =?utf-8?B?YkxTWXJMZnArUUx0UStaMjdYdnlsWGkxOWRvTm1LckJqWnlHMzZSVWxxMDQ0?=
 =?utf-8?B?V3FWOEdMdGF2MWZ2VmZ4d1NrdXJnYnp2YWI5NlFLYkE2bHhYbDZiK3l0aXZI?=
 =?utf-8?B?U3RQVVZ6d3BRc0FsdDNwMTh4WG45RWliVm16NTdBN1dwY0RCK2RGUm43TUNK?=
 =?utf-8?B?M2lqeWpqZEVucWZvclpGZlYzNnZkTitvd0t1NUIydEN2RFRyU0xiQjFEMDZU?=
 =?utf-8?B?dTZuZnRSN2FCRkhzS3NpNmxnbll2K0JKeFV2R2UyckN4VmRhU0sxWkFZNlV0?=
 =?utf-8?B?NE84QWNWN2IyS09BSVp4MWQwdWJqRjBCbkdzTERjSDBPdWpaekFCd083UlM5?=
 =?utf-8?B?VWFzK1BsWmZ4K1NQWHN6TUUvdWtDcnBzWFQySzVhMDFYWCtUUnZwcWhOUEw4?=
 =?utf-8?B?M3lvYWI1ME1EbWdQZUR4RGtDZVJWV0JtbzNFd1JpeEJSeS9kRGNiVC81RXN0?=
 =?utf-8?B?RHo4RU5FODVsRDkxNHZ2Q0NvUDVRcHdna3N2Z241Rkx0ck5IOE5BQ0QxV0tM?=
 =?utf-8?B?N1NKRUs3dzJSTHNQMk52UFNQcXpCbnArK1F2UGVDTENsbk1tUmp4cklMUVM2?=
 =?utf-8?B?R24vZkZKTThNSmpQMHdLM2dNcDNnSlBLdkxJNy94WkFLOXJoZjNaeVIwQXgw?=
 =?utf-8?B?RzA0M3hjQ2Y4TkVsQ1VlSHJNd045T21LWGwxYmRJdTVvL0ZCM3M1MStGRUtH?=
 =?utf-8?B?US9YVm5zZVNuZWFaV1RrWVJPb3c1N3JtdUMwQ3lxNXQwd1FrZ3NtMlBkcG8z?=
 =?utf-8?B?dWN5N3IrL0hLVDFZR3QzU2x1QXpkL3V0RnBHSytJREdEcWludnFVTFJlWmVH?=
 =?utf-8?B?SG9vS0VkT3lJcE8rK3RxbnlFeHNTaUtpVjdwaHlIbzh3NjE2aHVlUUM5Qy9T?=
 =?utf-8?B?VkkzQmFITVJvOFMvcTl6WFRXZXVMeGNDUEhNZk1aL01XZVhzOUtMbzdoSUlG?=
 =?utf-8?B?akVyRm4rMUllQm9hRFIrYnNkdG9aeWlxMGNCNUVRemk1REt4RXRoRG12a3JE?=
 =?utf-8?B?SFVEMVptaFdHUHpuNGg2ZDhwY0JOMXN6YnJYanpKbU9CQmQ0WlFPbVppMXJJ?=
 =?utf-8?B?b1l5TUtzY2NVeHBQcnNFUXF3ZEVaTWhwSURTMXVsLzNLV2xKa21GT0tzdmli?=
 =?utf-8?B?ak9KMllEZGVldEFrdEE5WFpBenVMKyt5OHpqQU1hQUFpWHJXRG40NGtGc3RT?=
 =?utf-8?B?T2d0OEFGaWExeDN0dDJKUHlXYW5IQjdjdlpUQ3dOYW10RGUxYUFPcmVPdVpE?=
 =?utf-8?B?TlFnTXVXbGsxVEFYNXJ5VGZOYXJscGV4V0dLU0hNWlAyajZnUWVNeXpnd1Q3?=
 =?utf-8?B?YTN4dlFOTEI1V2xFRkVyUDZoTkExRG56VjVnd3lheXV0NnJwbWRFclo1Y0Fh?=
 =?utf-8?B?QjZUUGVrMzN3K3RJQW1IWTFVSHNpZkFiSWRGZ0xqOXh3bW5idzlldmFPc1JC?=
 =?utf-8?Q?iWPfG6SEfTrHmZWnfY5MoROEO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5182fecf-3d1b-4e99-c5f9-08dac9355722
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 07:20:16.0255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5PcWGOOm4UsaWGXkoqeTOYJLETwBapeZn71ydEGj6TM/d6pZ1s7XrImpb4dmDwpcU4lyawUKlEiUo1RR/ONCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7064

On 17.11.2022 18:31, Marek Marczykowski-Górecki wrote:
> On Thu, Nov 17, 2022 at 05:34:36PM +0100, Jan Beulich wrote:
>> On 14.11.2022 20:21, Marek Marczykowski-Górecki wrote:
>>> --- a/xen/arch/x86/msi.c
>>> +++ b/xen/arch/x86/msi.c
>>> @@ -961,6 +961,21 @@ static int msix_capability_init(struct pci_dev *dev,
>>>                  domain_crash(d);
>>>              /* XXX How to deal with existing mappings? */
>>>          }
>>> +
>>> +        /*
>>> +         * If the MSI-X table doesn't span full page(s), map the last page for
>>> +         * passthrough accesses.
>>> +         */
>>> +        if ( (msix->nr_entries * PCI_MSIX_ENTRY_SIZE) & (PAGE_SIZE - 1) )
>>> +        {
>>> +            uint64_t entry_paddr = table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE;
>>> +            int idx = msix_get_fixmap(msix, table_paddr, entry_paddr);
>>> +
>>> +            if ( idx >= 0 )
>>> +                msix->last_table_page = fix_to_virt(idx);
>>> +            else
>>> +                gprintk(XENLOG_ERR, "Failed to map last MSI-X table page: %d\n", idx);
>>> +        }
>>
>> Could we avoid the extra work if there's only less than one page's
>> worth of entries for a device? But then again maybe not worth any
>> extra code, as the same mapping will be re-used anyway due to the
>> refcounting that's being used.
> 
> I was considering that, but decided against exactly because of
> msix_get_fixmap() reusing existing mappings.
> 
>> Makes me think of another aspect though: Don't we also need to
>> handle stuff living on the same page as the start of the table, if
>> that doesn't start at a page boundary?
> 
> I have considered that, but decided against given every single device I
> tried have MSI-X table at the page boundary. But if you prefer, I can
> add such handling too (will require adding another variable to the
> arch_msix structure - to store the fixmap location).

To limit growth of the struct, please at least consider storing the fixmap
indexes instead of full pointers.

>>> @@ -1090,6 +1105,12 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
>>>              WARN();
>>>          msix->table.first = 0;
>>>          msix->table.last = 0;
>>> +        if ( msix->last_table_page )
>>> +        {
>>> +            msix_put_fixmap(msix,
>>> +                            virt_to_fix((unsigned long)msix->last_table_page));
>>> +            msix->last_table_page = 0;
>>
>> To set a pointer please use NULL.
> 
> Ok.
> 
>> Overall it looks like you're dealing with the issue for HVM only.
>> You will want to express this in the title, perhaps by using x86/hvm:
>> as the prefix. But then the question of course is whether this couldn't
>> be dealt with in/from mmio_ro_emulated_write(), which handles both HVM
>> and PV. 
> 
> The issue is correlating BAR mapping location with guest's view.
> Writable BAR areas are mapped (by qemu) via xc_domain_memory_mapping(), but
> that fails for read-only pages (and indeed, qemu doesn't attempt to do
> that for the pages with the MSI-X table). Lacking that, I need to use
> msixtbl_entry->gtable, which is HVM-only thing.
> 
> In fact there is another corner case I don't handle here: guest
> accessing those registers when MSI-X is disabled. In that case, there is
> no related msixtbl_entry, so I can't correlate the access, but the
> page(s) is still read-only, so direct mapping would fail. In practice,
> such access will trap into qemu, which will complain "Should not
> read/write BAR through QEMU". I have seen this happening several times
> when developing the series (due to bugs in my patches), but I haven't
> found any case where it would happen with the final patch version.
> In fact, I have considered handling this whole thing via qemu (as it
> knows better where BAR live from the guest PoV), but stubdomain still
> don't have write access to that pages, so that would need to be trapped
> (for the second time) by Xen anyway.
> 
> For the PV case, I think this extra translation wouldn't be necessary as
> BAR are mapped at their actual location, right?

I think so, yes.

> But then, it makes it
> rather different implementation (separate feature), than just having a
> common one for PV and HVM.

It would be different, yes, and if - as you explain above - there are
technical reasons why it cannot be shared, then so be it. Mentioning
this in the description may be worthwhile, or else the same question
may be asked again (even by me, in case I forget part of the discussion
by the time I look at a particular future version).

>> Which in turn raises the question: Do you need to handle reads
>> in the new code in the first place?
> 
> The page not being mapped is also the reason why I do need to handle
> reads too.

Just for my own clarity: You mean "not mapped to qemu" here?

Jan

