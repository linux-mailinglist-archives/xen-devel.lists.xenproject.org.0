Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952AC73A1D1
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 15:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553563.864184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCKDt-00028c-ED; Thu, 22 Jun 2023 13:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553563.864184; Thu, 22 Jun 2023 13:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCKDt-00025f-A4; Thu, 22 Jun 2023 13:19:41 +0000
Received: by outflank-mailman (input) for mailman id 553563;
 Thu, 22 Jun 2023 13:19:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCKDr-00025Z-Hh
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 13:19:39 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f5d3cad-10ff-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 15:19:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7177.eurprd04.prod.outlook.com (2603:10a6:10:127::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 13:19:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 13:19:31 +0000
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
X-Inumbo-ID: 6f5d3cad-10ff-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/BpWqR41rYyxHzPH9Z8g1+Ui8UMhQz6C/niHp6kC/gw5ot1KsZkyVntg+TWkSc1LnF6uJd4ztl4sitT0f9If2pxLEHUVowGh1ivMbQ0EYGemmUYBEb1iZOSvbOyTNmtA5a0IgBKPjAgmvB2Y9sY2nDY35ipdgx9R3+DwVxU0GIhf8lIT3Bffpfn4vBV57kaUAAY7zffI4t918dzrSgz6pmRWJ10P1QeRKs/AkY9/y/X/v+F/Ae33/oeSIDA9iL62ilPODv8Sll7d312FBt/3zPrmLSVWah5b7vywrw58dF/9VZIMl9J9oVCdPciPlMtggwImrjk8Gm6o2x3hLymbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bd7aG8ZGXgK1OUG11VQ7OIcr8ukgAMz6xuXur6f61ME=;
 b=bxUJ9ObQsYzP79BjpC/tyHad7ax9kiWW0g/Qs8dP3XW6KzxghXQPVTX5u4XJU/imI4VpFqcThhEgwmG2duw5R7MRE6JCnvCP/MGdmCBplrJ3hAIkIq3I5653HmxZhe5+QvLfxpYvMani33HOsRdu0YTZIybg5Ow0tR+5fhCncslcyR8f5RTgUWzMFPhe3hFfDmCDqkCLm+cQ+tXhFyMbnvGBnjzhBebxCDspyBMeaRE/p3sIDy8spIxxwXCqApnV8atjPajtZTnujvnDKOIZiuh2WFiIs/Umtcu+ow2E61/dtr/VR1fjj0lIfRkF7NSnHzb6d4ilszl/tlLrGKXVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bd7aG8ZGXgK1OUG11VQ7OIcr8ukgAMz6xuXur6f61ME=;
 b=5mPCfzRlyZSdpq3MryS0dbqFavAOMcKHao8xIA8JpzFldLHms+weUsefFPUwi2je0AwMXBxlnL9NAJOMBErRds9IY2JJGnOGp5SCS/PcMo0OPlVXOXl21hWLh+bNws8iG+lyS+tC1oKRiJgurbDsNnhrzoSMD7P5Jgcm9Jm55RLYisI4ExKo8xmhHuVyFE8TQxNh5x6Jg9dxRgsIUIspTCL02euwFioUyWSZgizQM8CHESiY/85QeNQSp+T4Gsa0CrFQOspp8FgBTpHf9EXXnLDKoqKW9bRYIkyz4+IevYo4VSBjl3trADkiFOmNHyqWqoMoDCi0xIDWX9LTQEkfFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be6e2799-dd7b-ccba-4901-1e4e10a7f292@suse.com>
Date: Thu, 22 Jun 2023 15:19:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 06/22] x86: map/unmap pages in restore_all_guests
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-7-julien@xen.org>
 <478e04bc-6ff7-de01-dfb9-55d579228152@suse.com>
 <f84d30cb-e743-60f8-a496-603323b79f37@xen.org>
 <01584e11-36ca-7836-85ad-bba9351af46e@suse.com>
 <a99a8246-bc80-07b9-dacc-f117ace37027@xen.org>
 <aa2c8649-4acd-bcf4-d547-e3609bb1a0a2@suse.com>
 <558e68c4-1a2d-5a9e-4070-5b894e14a3f4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <558e68c4-1a2d-5a9e-4070-5b894e14a3f4@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 1270af17-7233-4cde-235c-08db73235045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j4n3ySAZ7VmQ6QNfIA5L8+0Sp/aarfNMVfhGGh3WsDRCSWoumroTE/o83StnXdnpqBp57S+Hc/+a/voGCzGEj6B7PG6M2LaM/2Lzwr9iZnzZHIgIVN7MRh/4SgVZnEUwvYPXmijJmCdZAHNM2hxhNlimqbswhg4bBeoqtlYz2w+4KGeZAMfYUt3YeSOENbQBEM8/+xKg3JFVQfPyCGV8zYO+ZTgLNWUh9yJxjF9bMwu77OLtEyOVcUnaINxnbZeCijuzMjEl+9tmJsbgpckIc8BBcHhVqyp5NGC9CjuOuWFrGkLh+aid2kfpVGgY3GG3X7toSD25h1YBxq3oiH3D5M4QWpiExscHUImUBDxfsrsba+ATC8S9ojVODdGrymr/MCH2Zza4enZsE60t7ELoMTYrym+HqMfyrLL4mC5IZgT1GjBI8yJZ+/o/lOn7RqSmdVAVAYzG6FtFsI7q+itkr6hM3kYU+Z5xeutHUVOvjM9ZIwB3xQ0vMe8v/47nXGabrwmHhjzrhPd1c1y/NFPqx6w3yYIWZhmeoOdTrHGoOLxUQxZqKO5HqsFSIH72wWuXPfFR3WwPWX+Uz98ElHcQdJb7wsy6zVw04E9oLguLWu0hXgv3JdW2efWWHSOj/rFDFIDArNWhwxv1Ojs9zDgy4DeNNsXDKqgxKo6OBD9Ttdw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199021)(8936002)(5660300002)(8676002)(31686004)(41300700001)(316002)(2906002)(6666004)(6916009)(4326008)(66476007)(66556008)(54906003)(478600001)(6486002)(66946007)(31696002)(86362001)(53546011)(38100700002)(36756003)(2616005)(186003)(6512007)(83380400001)(26005)(6506007)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTNOQ0pncm1raWpVOG9SbnViQ1h4Q2ViWWFORFY2WUNjb2FEcnJzTG02VHAv?=
 =?utf-8?B?TG12WW4zMmJXeWxZMDVHcmozZ2hxbjJQNktFMzAxWm9VanNrN3p0SzlLQjR5?=
 =?utf-8?B?blNDcGNCcmVkaks5SGxaOE1MZGJ3Z2lTbXNHaUtIeWg3RExON0cyVjhDbUt2?=
 =?utf-8?B?ZHF2VmI3c1RUMStCRzFxd1p2OTFJVVZLcHcrZFJ4RUVxRXlTOE1Qekw2SHFS?=
 =?utf-8?B?YzM5V2w5cEpPM29SZDl3SlF5b2VRakxCUUxSTHVhRlpYeFdhMUNxRjFBNGNT?=
 =?utf-8?B?bk5KNE45N3kyUnRKSjJJZk5OdW5SOEpVRE9oMWJUditvdGtvMjJzLzQzRkZU?=
 =?utf-8?B?UkdROEN2OHA1TTV6TXlKbUdoTTJvZnZhYkdEYmh4VW4zZXUrcnRBSHFDdUJy?=
 =?utf-8?B?d2ZMNkJxWHdRdEc0QWkxRjZMcXhQUUlETldPT1RVcEYycGpYM0lOLzA4YzJ3?=
 =?utf-8?B?TzdGUUxMOGJrd1VrR1VyQmZCTUR1b1Rwa3MwcThRaG90QUluTVhPVVBJYnJa?=
 =?utf-8?B?UFhaOW9MSWh1aTBqOFM0ay9obTBmQ0VKQ1pyQmh6Um4wZWh0TXhzSlhYTlZF?=
 =?utf-8?B?YjdJdCsyUmk1R2VEbC9SNUY0L2ptSDV3TnRuTFcrV0J3bjRyNFhrajBOaDlx?=
 =?utf-8?B?SUVQTk5JdEpLdlBFUElWQVpPT05ZY0kyQXREYnRhY1ZkcDIwSU1CWG1pNTZ0?=
 =?utf-8?B?L1oyYmdsOSszd0ZWbVN4ZUJDcmJKU3dBdTZtc0lxRTRXSW5Xb2NOcGRwRFlZ?=
 =?utf-8?B?VjVVY3lMblB6OXpRdjRNWklsQXRHMmpwOEJlRUd1eVBEM3FRMlM4dWhBOEVw?=
 =?utf-8?B?V09oa3FVanVRZUxaWE1LNnVRZU5xMmZHSEh3c04yRS9BdVpFRWx2MWFQY0ZC?=
 =?utf-8?B?UURxUm9nU29tcDV6UVYzS2FuTWVienBKZHljTUt6RTFOdWRvMithQUFpeTdy?=
 =?utf-8?B?RmpmT0hzQkxtQ3FxOEpIa3hQM1JwTmVkekdFaXdVZm1KeFJ6TGI4ajZoNElw?=
 =?utf-8?B?MEJybC92MEs3Vm9RdGQ2aXBESTVZdllVTGx0MEEzRFFJSzN5d013ZmR3TXoy?=
 =?utf-8?B?aWxCWTllN0pBYzNRZU9nc0dHNnZVWEpNTWVWam03UGFyZ1VOakM2VkZ2M25B?=
 =?utf-8?B?ZGxaYjNKTXI0MDZHY1RJYksxRWl1allLUGhrS1M1MVg2MVVnR0grNHlWeW02?=
 =?utf-8?B?Q3BPTnUvb1JiYUNJalZRREhyZUtpMTV0Ujh0bmVpcWRUMS9hUXRXQTA1STlO?=
 =?utf-8?B?emJhZS85cWpaOGE3RUVBYzF6MExhaW44RUdvZVprWmduZHN3WWVjbDNickVT?=
 =?utf-8?B?U01Cc2gyeDhyemNEQ2pNZkxuaTlOc00zVEcrdUJXNmgwczVFc1VXUE9GU0N1?=
 =?utf-8?B?amg5a3I1TlNUNVZSWHhFS1EyY25zbGd4eCsrN3V4UEZNdmxSWTJrclVMZUpi?=
 =?utf-8?B?dktKaUNXT3RLdVVISFA4WnNaS2daeW5vbjA1MmZJUlNRMStyYy9Qb3dRZ3BK?=
 =?utf-8?B?OU1ySVdaM09zanNmNTNFM2tXZDVXcS9TY3JJL2JYVG41WEhOUm5sdGk2QUhi?=
 =?utf-8?B?Sy9lcEpFY2Y0S2c2eEhnTGp0L3ZWYWdUai9MazdTaHgvTldDWGpodHlQQlA3?=
 =?utf-8?B?NUdraktyME9TRHY0QkJWOGlHVmNMTDQ4SDV0TTVBOTdGL0g0MEtHUFNOK3RI?=
 =?utf-8?B?dmRqSTh0RTcyQmdPN1pIc0NmYXRXWU1obEs3T2hBQ0lEWmtqai84bko4bjVU?=
 =?utf-8?B?VUl3MGczRFV0MGEvV0ZRajZYcUFJQUFWekJpUlI2eG1CUUwyU29TWGxiSDRO?=
 =?utf-8?B?aFhqQ3F1REtXeHZyUEgvdUVHM3N4SG1ZU29UNzk4eW5QKzlJOFBJUnlPc1Vi?=
 =?utf-8?B?M0Q4TjllYUYrTTN2bnl5T3YveG9kZ3lySHoyZHM3dVZqZ3Q0enMrekxqUUZ2?=
 =?utf-8?B?azg0b05NS2NML2VJNXY3WXdPYmVXVi9JUXVQSnNaQW4vRDJuTTlYU2k5MmZx?=
 =?utf-8?B?VmphUDBBT2V0NG5VdkJYRTg2ejEwQ0tmZEIyZHdzM0pKNHA2aDRtU3VrQmJw?=
 =?utf-8?B?TUpINEVUd1d2b3VQM2oxcjBXc3FRYlNSREhML0ExQnZOcEhQY2tDQk81Y3Zz?=
 =?utf-8?Q?3bnl1N56ZrvCZgIxAStANndeu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1270af17-7233-4cde-235c-08db73235045
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 13:19:31.4156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2Bpx1eG+h0nrHMqTMj/FTCMIROVWAF/ZdojKotCUYBcyzmUISglMwg2CxtzA9yvinr0tv7u186y7UF0sfpiYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7177

On 22.06.2023 12:44, Julien Grall wrote:
> On 13/01/2023 09:22, Jan Beulich wrote:
>> On 13.01.2023 00:20, Julien Grall wrote:
>>> On 04/01/2023 10:27, Jan Beulich wrote:
>>>> On 23.12.2022 13:22, Julien Grall wrote:
>>>>> On 22/12/2022 11:12, Jan Beulich wrote:
>>>>>> On 16.12.2022 12:48, Julien Grall wrote:
>>>>>>> --- a/xen/arch/x86/x86_64/entry.S
>>>>>>> +++ b/xen/arch/x86/x86_64/entry.S
>>>>>>> @@ -165,7 +165,24 @@ restore_all_guest:
>>>>>>>             and   %rsi, %rdi
>>>>>>>             and   %r9, %rsi
>>>>>>>             add   %rcx, %rdi
>>>>>>> -        add   %rcx, %rsi
>>>>>>> +
>>>>>>> +         /*
>>>>>>> +          * Without a direct map, we have to map first before copying. We only
>>>>>>> +          * need to map the guest root table but not the per-CPU root_pgt,
>>>>>>> +          * because the latter is still a xenheap page.
>>>>>>> +          */
>>>>>>> +        pushq %r9
>>>>>>> +        pushq %rdx
>>>>>>> +        pushq %rax
>>>>>>> +        pushq %rdi
>>>>>>> +        mov   %rsi, %rdi
>>>>>>> +        shr   $PAGE_SHIFT, %rdi
>>>>>>> +        callq map_domain_page
>>>>>>> +        mov   %rax, %rsi
>>>>>>> +        popq  %rdi
>>>>>>> +        /* Stash the pointer for unmapping later. */
>>>>>>> +        pushq %rax
>>>>>>> +
>>>>>>>             mov   $ROOT_PAGETABLE_FIRST_XEN_SLOT, %ecx
>>>>>>>             mov   root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rsi), %r8
>>>>>>>             mov   %r8, root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rdi)
>>>>>>> @@ -177,6 +194,14 @@ restore_all_guest:
>>>>>>>             sub   $(ROOT_PAGETABLE_FIRST_XEN_SLOT - \
>>>>>>>                     ROOT_PAGETABLE_LAST_XEN_SLOT - 1) * 8, %rdi
>>>>>>>             rep movsq
>>>>>>> +
>>>>>>> +        /* Unmap the page. */
>>>>>>> +        popq  %rdi
>>>>>>> +        callq unmap_domain_page
>>>>>>> +        popq  %rax
>>>>>>> +        popq  %rdx
>>>>>>> +        popq  %r9
>>>>>>
>>>>>> While the PUSH/POP are part of what I dislike here, I think this wants
>>>>>> doing differently: Establish a mapping when putting in place a new guest
>>>>>> page table, and use the pointer here. This could be a new per-domain
>>>>>> mapping, to limit its visibility.
>>>>>
>>>>> I have looked at a per-domain approach and this looks way more complex
>>>>> than the few concise lines here (not mentioning the extra amount of
>>>>> memory).
>>>>
>>>> Yes, I do understand that would be a more intrusive change.
>>>
>>> I could be persuaded to look at a more intrusive change if there are a
>>> good reason to do it. To me, at the moment, it mostly seem a matter of
>>> taste.
>>>
>>> So what would we gain from a perdomain mapping?
>>
>> Rather than mapping/unmapping once per hypervisor entry/exit, we'd
>> map just once per context switch. Plus we'd save ugly/fragile assembly
>> code (apart from the push/pop I also dislike C functions being called
>> from assembly which aren't really meant to be called this way: While
>> these two may indeed be unlikely to ever change, any such change comes
>> with the risk of the assembly callers being missed - the compiler
>> won't tell you that e.g. argument types/count don't match parameters
>> anymore).
> 
> I think I have managed to write what you suggested. I would like to 
> share to get early feedback before resending the series.
> 
> There are also a couple of TODOs (XXX) in place where I am not sure if 
> this is correct.

Sure, some comments below. But note that this isn't a full review. One
remark up front: The CR3 part of the names isn't matching what you map,
as it's not the register but the page thar it points to. I'd suggest
"rootpt" (or "root_pt") as the respective part of the names instead.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -509,6 +509,13 @@ void share_xen_page_with_guest(struct page_info 
> *page, struct domain *d,
>       spin_unlock(&d->page_alloc_lock);
>   }
> 
> +#define shadow_cr3_idx(v) \
> +    ((v)->vcpu_id >> PAGETABLE_ORDER)
> +
> +#define pv_shadow_cr3_pte(v) \
> +    ((v)->domain->arch.pv.shadow_cr3_l1tab[shadow_cr3_idx(v)] + \
> +     ((v)->vcpu_id & (L1_PAGETABLE_ENTRIES - 1)))
> +
>   void make_cr3(struct vcpu *v, mfn_t mfn)
>   {
>       struct domain *d = v->domain;
> @@ -516,6 +523,18 @@ void make_cr3(struct vcpu *v, mfn_t mfn)
>       v->arch.cr3 = mfn_x(mfn) << PAGE_SHIFT;
>       if ( is_pv_domain(d) && d->arch.pv.pcid )
>           v->arch.cr3 |= get_pcid_bits(v, false);
> +
> +    /* Update the CR3 mapping */
> +    if ( is_pv_domain(d) )
> +    {
> +        l1_pgentry_t *pte = pv_shadow_cr3_pte(v);
> +
> +        /* XXX Do we need to call get page first? */

I don't think so. You piggy-back on the reference obtained when the
page address is stored in v->arch.cr3. What you need to be sure of
though is that there can't be a stale mapping left once that value is
replaced. I think the place here is the one central one, but this
will want double checking.

> +        l1e_write(pte, l1e_from_mfn(mfn, __PAGE_HYPERVISOR_RW));
> +        /* XXX Can the flush be reduced to the page? */

I think so; any reason you think more needs flushing? I'd rather
raise the question whether any flushing is needed at all. Before
this mapping can come into use, there necessarily is a CR3 write.
See also below.

> +        /* XXX Do we always call with current? */

I don't think we do. See e.g. arch_set_info_guest() or some of the
calls here from shadow code. However, I think when v != current, it
is always the case that v is paused. In which case no flushing would
be needed at all then, only when v == current.

Another question is whether this is the best place to make the
mapping. On one hand it is true that the way you do it, the mapping
isn't even re-written on each context switch. Otoh having it in
write_ptbase() may be the more natural (easier to prove as correct,
and that no dangling mappings can be left) place. For example then
you'll know that v == current in all cases (avoiding the other code
paths, examples of which I gave above). Plus explicit flushing can
be omitted, as switch_cr3_cr4() will always flush all non-global
mappings.

> +        flush_tlb_local();
> +    }
>   }
> 
>   void write_ptbase(struct vcpu *v)
>[...]
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -165,7 +165,16 @@ restore_all_guest:
>           and   %rsi, %rdi
>           and   %r9, %rsi
>           add   %rcx, %rdi
> +
> +        /*
> +         * The address in the vCPU cr3 is always mapped in the shadow
> +         * cr3 virt area.
> +         */
> +        mov   VCPU_id(%rbx), %rsi

The field is 32 bits, so you need to use %esi here.

> +        shl   $PAGE_SHIFT, %rsi

I wonder whether these two wouldn't sensibly be combined to

        imul   $PAGE_SIZE, VCPU_id(%rbx), %esi

as the result is guaranteed to fit in 32 bits.

A final remark, with no good place to attach it to: The code path above
is bypassed when xpti is off for the domain. You may want to avoid all
of the setup (and mapping) in that case. This, btw, could be done quite
naturally if - as outlined above as an alternative - the mapping
occurred in write_ptbase(): The function already distinguishes the two
cases.

Jan

