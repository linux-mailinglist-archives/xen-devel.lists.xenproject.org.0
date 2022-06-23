Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C657557669
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:14:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354694.581936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Iv6-0003Jq-6E; Thu, 23 Jun 2022 09:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354694.581936; Thu, 23 Jun 2022 09:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Iv6-0003Gz-3K; Thu, 23 Jun 2022 09:14:36 +0000
Received: by outflank-mailman (input) for mailman id 354694;
 Thu, 23 Jun 2022 09:14:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4Iv4-0003Gt-DW
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:14:34 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130072.outbound.protection.outlook.com [40.107.13.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4f1061a-f2d4-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 11:14:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0401MB2660.eurprd04.prod.outlook.com (2603:10a6:203:3a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 09:14:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 09:14:29 +0000
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
X-Inumbo-ID: e4f1061a-f2d4-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rjac1rTYS+yLGpDq4YaDTYQAGW5iXAmPjZgIY2o+DK5GLofykXr9MXZu0dIzNyasEAU2JYnowN73r7EFzzwHFLIaQANpfOVzRgsvEuNDZlhOIggt6HQ/Dd5ABSdQqE+4yVVy7LyJK/9b/6NV8WyC1LFyvu8wgSrY9U6oswpGPF/L9sjMnCnHGMBxBXTk7+IUYiU7hFSnW/RTm8ytCHL+bMiS5wYJSEasCEaBe9/krq2rdDNCa8EaRB59fIFYJI0SXHiVNDmdNo8fnCWhFyFrRAky6aR0CqdEwkPeqoHfWi6W5FzaBVXZaLO39zDqSwLH6hIHKABKb5tdiG05uijD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WdlzlEK2bgdG54qJThScXFFa7IsFPTAKkg7uUyQ+Ew=;
 b=JO8uMfeW30QnyT5dKuQvUYhs1N78PVZVEFLPO+ESGwnyCfsMkwhvO2/0pfMqwDTdIft4F1ZrtbBc598npTeFt/jsxbZl1KbOtTzZkqP2D94F3yu6kqt/V7lwt0RO/+p47JC0v9elw+sFc8RunCWn5Uhtv1Z44JMCh1XHcB+Mc5bYjxZPtpYzfgyObF4KDhsLtOMfXCT1GnHyW8SSZe/C1kTuxXAPf+pBFuODnIU34UTfpekjEFevIo5Kn27p6rDVjKqDbrtWu0HWok0RYcf9S1IL/hdVj14For/GyLp93npGTXB+3sAwc8zwgBff3SMaeZBNTSjGwobNmvOrwP2dyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WdlzlEK2bgdG54qJThScXFFa7IsFPTAKkg7uUyQ+Ew=;
 b=qyVJ6JDvV79LHuL93cOOmEA2mLQoSPYJ2c5S1ScfbLfkCnYmU42Yzbles9Fj1x9Sg5ci8tq404j0yVtxWgOd2vaZrlT8ZRHkdIFzIJBWtq02ZzZ5DwhKzJ5QMGIHWx+vCW79qCIxEjxIelhQcdahgXLQzZM4B3kcq8d6xLlESwgGveMI2+i3nRZMBOeKoE0hdClwYgCD4wOlv+NJhvPZ+7KsI9WmGodwRFQ2ntiWrarZywxTmcJ9lv3tloy8HMrb4CN9huNQFK0uayMAd6I3e87xH8NcNBMmVIQ6ZjDTiTfSDBaQBWMniGOVQp+FByAUYMOQRTIoUh+n2anSHVc4cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0daa40bd-db1d-759c-5d02-16634cead932@suse.com>
Date: Thu, 23 Jun 2022 11:14:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen: consider alloc-only segments when loading PV dom0
 kernel
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220623080208.2214-1-jgross@suse.com>
 <c5961627-1719-dd54-bbcf-c08a826ba14d@suse.com>
 <50942106-0082-e86b-8a2c-b04aaafac444@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <50942106-0082-e86b-8a2c-b04aaafac444@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8dbefa66-19c0-4f3e-78cc-08da54f8c73b
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2660:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM5PR0401MB2660354B223377A5CE29B0EEB3B59@AM5PR0401MB2660.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ss5kKNcWhCV2JX+wiNLnV+DrvxDwKUjJTMoj954jOHXDI3Q7e1PhggIL4Sb4LRErIo5LpwTqoISiFQGZiKnpBIDqAkwvc0i+69SnMbKm9DrVd1rfuH8uKLFq59zgciZxlDNsX2GbPlWqOdOz6Eg16e90ioM2u9cJkdNWmCNm78SfoPQ18ddT4b7SQf+IU/iy+wrqJFtZcbQPt+d68cN22x7R4TI9sesnrJjMYqzEM7XUTzNwfV40lhrJKynI+lJlnA5gCkATD4TutQ5/BUELI1fZd84XXFoIrxEMxAbuDoGJhmHg/eM8FH4K0orazMYIuqeqbNHkbJRHJAioGDItdxPBwEsLooDLhQK8HYMnNR11poHgFVMQ6ozxE3Xemu1Ttz4cShNZODiog4Nzkb2eZrUMaunizL0tJsobEHKMv3TqXS1xwjU7cpb5g37PbS9LjrUyGZoRjULy86YZgNbJZode6GlOC12UtELqdkKpgBBZ03wsEYv0kZF4yuAUChvsjeqbMc4bBjjK9af8OFeKBwybAtaSi59P/1ZZ7oH2Rpm1DjnxjAowWEnRrCyZsNX9eH+K/4mFNBe9QA/I0MEJrwrw2G2OuHcAIh/UNQJqPP/EvF8XI0SL7hdAC9xVizze4Q+OeJPZZ58cWacf/dI5MzlWghNFw+N7XXq+dITH528Ssl0dn2pR7hY/WEw/PDl+ouDUdPoRTpZNZ2Sztdzzm/bnizuT1TIfOUwlgspp6gY9A1kw+ty7eXQstnuyTEzjCPIi7C0SF2yCeJU5REuEcz6xdMD62Rgz4kYhgvOJ6MY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(396003)(136003)(376002)(39860400002)(8936002)(66946007)(316002)(8676002)(66556008)(66476007)(4326008)(83380400001)(31686004)(5660300002)(2906002)(6636002)(6862004)(36756003)(6486002)(478600001)(54906003)(37006003)(6506007)(53546011)(86362001)(26005)(31696002)(6512007)(186003)(2616005)(38100700002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1hPaVI3eDE4aTNWWjlMRTdqMWtGN2ltM3M5SERSMmhFNFhhVlk5L3MrYUZt?=
 =?utf-8?B?cmNTTUduYUhWcWtnRU52a1d2UWVnT0ZORDBuRjJHMjdKRTZjUVNCY1gzSVRL?=
 =?utf-8?B?cG1lWDZwU05HMUcwNnlVbU9NVHQ3amEzVHBSTnpDM1pUTVhqZE5kYmlKYW1I?=
 =?utf-8?B?NmlOdFNBejVrZUM4Zk84SnRZVU9ydDkxaU5YOXJqTjJVUngyZjNyN0lqNEVJ?=
 =?utf-8?B?dElkVSsyRS85QVkxVnZFUHpleUFsYlZVZFR2K1JLUmowMmNLVWp1RmkvaVpE?=
 =?utf-8?B?dlovanpSVEFXaTUyMEExS3FxcDdrVWhqdmhhcDhreGJzTndXN20xb3VHMFBY?=
 =?utf-8?B?emhUUUVvQXV6Z2VyeFRIUytraHQ0N1R4Y0hXUUcrSWVJMml4TitmWTJNMmcx?=
 =?utf-8?B?NkhqcTdGSDFPc0dmVklaWlU3QmdZWE92YVUzdDRFaVpGdEU0bXRpR2QwSDl3?=
 =?utf-8?B?K0k1RHAybDh6ZVpEcGRqbXBFMFJUQWFHRnFVV3pDT3g1WDRJQmROdGRMK3N1?=
 =?utf-8?B?bzdETEhrSjF4NDIzbUdFa1BYL3FVWi9kc3pvZmlGZTkxN3BjOE5YZGlvTnVm?=
 =?utf-8?B?b3B3NUJiY25DRTZ0eTlLcGhKaDg3L3VoZ0hQUVc4eXN5S3ZmOWEwL04zSFQ5?=
 =?utf-8?B?UG1qYnhZV0ttNkdobDlPcGFSL1c2UldwbzIxSVlZM1NtL2JtNktGUkNLamtD?=
 =?utf-8?B?MEF3aU80enBORkR1QlZkamRkL0R6RDhET1lsRThoME55SmtqYmlkS2orRnB6?=
 =?utf-8?B?Z2Q4eEhaMEdRcXRWQ200SUQycmt4bm0zY3dRdWkvMUswSDJzd2Eva0JMRncx?=
 =?utf-8?B?eG1TRkthRlByM3hUTkxLbVAvRFVFbUhlSHcrZjVxcWtxMkJiSTFIcmo4a3ZU?=
 =?utf-8?B?eHJTZ2pBMTNYV3FOOGRlbUlvMTkwU2V1a2Z3T01tRkhsYzVMN2dhT2JyTDRP?=
 =?utf-8?B?R3pCY3RYaUpldW01TzFWQVZzbFppU1Vja2lYWjFNTW11cUF4eVdST3libXJv?=
 =?utf-8?B?ckN0N2NCWm1JNDVLZkRaelNaSjBpRjlJMzRnd0F1WEpuYVBreHpkbEtsV2lX?=
 =?utf-8?B?WmV4dndIaTJNZHpFaHRUYUoxWDh0YjZNQ21FZFk0bHI5aFNqMG96bzFDbkNR?=
 =?utf-8?B?eGdjdHdWbWI1OHl2am5RaDR4eUE5VGlPczJyTVdVaGhlbGhzb2x3SUs5Vm9Y?=
 =?utf-8?B?YlRDTXg3elJoQk1QYm1LVmF4eUp4WEhwUS9kbG1TUVZJaHZJcEp6WjZLOHhF?=
 =?utf-8?B?bHBrZUFObFplUWNNWjFheUlGcUxNclFKRnVMVytIZWV0MWdFQkExZnBCQTVT?=
 =?utf-8?B?NXZXamoyR2JGVTZaMGdGR0RBQ2hyUmY2cCs0U0RRaXFVWm1XOWh6eGpCdnAz?=
 =?utf-8?B?dld5RlJIQkNOOSt6bFFKU1FxMUE5b3pOOE9adWREWEhXOE56b3VVaUVvNkxB?=
 =?utf-8?B?dnQ1Ly84TG56b0tjTWUwUG5jdWllQlBub2lRNHNVVlZpRTdwemlKajlvMXFh?=
 =?utf-8?B?OTdNVE5ZVG1hall4WFExSzl1Y0Y4WmdWYUgrVVdHZTRBV1dMdjRJYXpONFJQ?=
 =?utf-8?B?QUppc2J5Y2locTdLaTAvTUl6aERSTVhVVmtrV3JEdnd4cDkvQjBZRGFvNDdV?=
 =?utf-8?B?d2xPMTIyNnVzaWhXbWx4aGxOVmdHQ1prVmI0dkYzYmN6WXVaUlpOVFhQOUJ5?=
 =?utf-8?B?SW1Tc0VPWTRJU21KMUFXK25RdTRIRUF5ZUdWcnRHV3VPSXNSdXlrb2VWNGoy?=
 =?utf-8?B?RXhXTFBsSFFueHhLZTZwQ2gvYklkYkVnK1ptRHo0WDNIU20wOThiSmx3emZr?=
 =?utf-8?B?RjJBY3UvRkcwaWh6ZGZUb0E0V3ZOS045UTJ4WDRnVEF4cE1BeE0rRUVnSHMz?=
 =?utf-8?B?VEt2VGhVNmtHTG1HbG8yRWRWdHpNVjFRQzRlRFJlQXF2ZHEvZlRVUGh2TzNE?=
 =?utf-8?B?MWtNcGNBblU3YnZJVmtLMHptbWhHTThIVkVDSkFQanVFRFhwa2pVeFVvQkRv?=
 =?utf-8?B?RlRpajQzMnBlUXRLZEorWnhMeFZhb09rNlVIeVAxbjl0Rkt4U3lLR1FuRGlB?=
 =?utf-8?B?SzdLeHRXUmZOOEtYSS8wejNBN0twZlRnQjBVKy9QNktwV0UvemJMUHdHTXBn?=
 =?utf-8?Q?S9Vx+h2j+yekERyNOK9AqRC/6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dbefa66-19c0-4f3e-78cc-08da54f8c73b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 09:14:29.9251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHyGbrxXHnI5VGd8hvplYxRrNP+NKWlkL8URib1VFTkl8nUVbkO11aufJ1VaiGgprkHwXwgBn4g2dzDDzfJ7tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2660

On 23.06.2022 11:08, Juergen Gross wrote:
> On 23.06.22 11:04, Jan Beulich wrote:
>> On 23.06.2022 10:02, Juergen Gross wrote:
>>> When loading the dom0 kernel for PV mode, the first free usable memory
>>> location after the kernel needs to take segments into account, which
>>> have only the ALLOC flag set, but are not specified to be loaded in
>>> the program headers of the ELF file.
>>>
>>> This is e.g. a problem for Linux kernels from 5.19 onwards, as those
>>> can have a final NOLOAD section at the end, which must not be used by
>>> e.g. the start_info structure or the initial page tables allocated by
>>> the hypervisor.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   xen/common/libelf/libelf-loader.c | 33 +++++++++++++++++++++++++++++++
>>>   1 file changed, 33 insertions(+)
>>>
>>> diff --git a/xen/common/libelf/libelf-loader.c b/xen/common/libelf/libelf-loader.c
>>> index 629cc0d3e6..4b0e3ced55 100644
>>> --- a/xen/common/libelf/libelf-loader.c
>>> +++ b/xen/common/libelf/libelf-loader.c
>>> @@ -467,7 +467,9 @@ do {                                                                \
>>>   void elf_parse_binary(struct elf_binary *elf)
>>>   {
>>>       ELF_HANDLE_DECL(elf_phdr) phdr;
>>> +    ELF_HANDLE_DECL(elf_shdr) shdr;
>>>       uint64_t low = -1, high = 0, paddr, memsz;
>>> +    uint64_t vlow = -1, vhigh = 0, vaddr, voff;
>>>       unsigned i, count;
>>>   
>>>       count = elf_phdr_count(elf);
>>> @@ -480,6 +482,7 @@ void elf_parse_binary(struct elf_binary *elf)
>>>           if ( !elf_phdr_is_loadable(elf, phdr) )
>>>               continue;
>>>           paddr = elf_uval(elf, phdr, p_paddr);
>>> +        vaddr = elf_uval(elf, phdr, p_vaddr);
>>>           memsz = elf_uval(elf, phdr, p_memsz);
>>>           elf_msg(elf, "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 "\n",
>>>                   paddr, memsz);
>>> @@ -487,7 +490,37 @@ void elf_parse_binary(struct elf_binary *elf)
>>>               low = paddr;
>>>           if ( high < paddr + memsz )
>>>               high = paddr + memsz;
>>> +        if ( vlow > vaddr )
>>> +            vlow = vaddr;
>>> +        if ( vhigh < vaddr + memsz )
>>> +            vhigh = vaddr + memsz;
>>>       }
>>> +
>>> +    voff = vhigh - high;
>>> +
>>> +    count = elf_shdr_count(elf);
>>> +    for ( i = 0; i < count; i++ )
>>> +    {
>>> +        shdr = elf_shdr_by_index(elf, i);
>>> +        if ( !elf_access_ok(elf, ELF_HANDLE_PTRVAL(shdr), 1) )
>>> +            /* input has an insane section header count field */
>>> +            break;
>>> +        if ( !(elf_uval(elf, shdr, sh_flags) & SHF_ALLOC) )
>>> +            continue;
>>> +        vaddr = elf_uval(elf, shdr, sh_addr);
>>> +        memsz = elf_uval(elf, shdr, sh_size);
>>> +        if ( vlow > vaddr )
>>> +        {
>>> +            vlow = vaddr;
>>> +            low = vaddr - voff;
>>> +        }
>>> +        if ( vhigh < vaddr + memsz )
>>> +        {
>>> +            vhigh = vaddr + memsz;
>>> +            high = vaddr + memsz - voff;
>>> +        }
>>> +    }
>>
>> As said in the reply to your problem report: The set of PHDRs doesn't
>> cover all sections. For loading one should never need to resort to
>> parsing section headers - in a loadable binary it is no error if
>> there's no section table in the first place. (The title is also
> 
> The problem isn't the loading, but the memory usage after doing the
> loading. The hypervisor is placing page tables in a memory region
> the kernel has other plans with.

But part of "loading" is to determine the extent of the binary, which
is what the program headers (and only them) ought to describe. Note
also that our "loading" includes correct handling of .bss-style parts
of segments (i.e. their clearing):

static elf_errorstatus elf_load_image(struct elf_binary *elf, elf_ptrval dst, elf_ptrval src, uint64_t filesz, uint64_t memsz)
{
    elf_errorstatus rc;
    if ( filesz > ULONG_MAX || memsz > ULONG_MAX )
        return -1;
    /* We trust the dom0 kernel image completely, so we don't care
     * about overruns etc. here. */
    rc = elf_memcpy(elf->vcpu, ELF_UNSAFE_PTR(dst), ELF_UNSAFE_PTR(src),
                    filesz);
    if ( rc != 0 )
        return -1;
    rc = elf_memcpy(elf->vcpu, ELF_UNSAFE_PTR(dst + filesz), NULL,
                    memsz - filesz);
    if ( rc != 0 )
        return -1;
    return 0;
}

IOW in principle there's no need for the kernel to clear its .bss
(a 2nd time). Provided, of course, the phdrs properly describe the
entire image.

Jan

