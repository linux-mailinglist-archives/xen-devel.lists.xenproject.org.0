Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCDE763BDA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 18:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570585.892503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgvQ-00014L-I7; Wed, 26 Jul 2023 15:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570585.892503; Wed, 26 Jul 2023 15:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgvQ-00011o-FM; Wed, 26 Jul 2023 15:59:44 +0000
Received: by outflank-mailman (input) for mailman id 570585;
 Wed, 26 Jul 2023 15:59:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOgvP-00011i-DO
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 15:59:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e9b3c8e-2bcd-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 17:59:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7606.eurprd04.prod.outlook.com (2603:10a6:20b:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 15:59:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 15:59:39 +0000
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
X-Inumbo-ID: 6e9b3c8e-2bcd-11ee-b242-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZRfCoUDJiohrVeTK+SeLA6x8E/uTn7r6d8rk5AtT1/JxXzbim9vUzU0EjseykbHap0uj/rPM0whZyv/Lc9IsqQ7zpAj2Ax4bt9Q8x9fiatBzxvitH3m2orHWz5MeFID1UCRIVZIZSFrwffIUrR2FGQcDVud6mrQZXteg4unLaYQGWfMUVxCJ9n7EOVoZPRo0DHK0R7XWSKgUpDcfuB8Iz/DvSvV0mGVf1iI5YZonX18uKXUEyvSK2ujvi04XTKdccGLJL3QZR/HVpo9fJ+o4QTc9zCDnnPn9BmgUvuvf+6NGFfU2YM/K4MjYrK5lix3KEItcvztZKN9WkGBra/s2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKf3oPTm1/CMIOBWEXl0cm2Ke4cVYtZ0HR4HXECaUxw=;
 b=c8UIr1a3uqgxpyh4W6xAZabLRWHT3JVwjG9BGoIGxvUjrWSDoBEb6dINt0PnbpHGbhWe7rgaFmYkhDrQz7SamdbFnrlnUYKFLMtVhgkn29GHCU2kYJSn27B2TcRx4j9ozxkb0I+YfghIItUoBwDkt0NSlBMSg5MyOJheXALZ7x3GxsZifg8nB/NrI8/d8XroztPqG4dVLY1aNXyyD4R7nz+Gsv1jPmzIqxNOrY5SyfT3xi/VU3QKgK5/POcHZdV8Queqch/BLRje26IZqJrrXLVQVyLYIGu4CCkA8SYTtf3PtUi6JxiKqA96SeDPlxZfmBg7kXPjKxsd1QvU10zfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKf3oPTm1/CMIOBWEXl0cm2Ke4cVYtZ0HR4HXECaUxw=;
 b=r13CWfb1LhuKKtuonSslHjOsh8CyQwXlJrkIZVWGqRJUS++a76TgyLgBscwSoehCfSJ5RCQBsj4IfWnH42O7Sz34t9OAJfb1ReJ0T4Li9/inidvvYQfWurPqas/FuuLPHn+SFcyQI1tgG3alm//Rd63HAKK1nIXEh/FcFMOgOeD1NxTzn8HB+o3yrlZjRFMN91VQPS3a+GfJCk8DONFqA9HvoZAgXl0/CuYsNjZmO95vNV3PhD9bSidQOvZHVS91ghfShazpm0LNM7wLVZJFiLE4jdVgnLPFip2FgJZKGZKVERbKMXXogCSVPzCjqlYFDemh9xte9s7+q90sZTAkww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <79b20131-46c2-9e54-e615-18a346b83b8d@suse.com>
Date: Wed, 26 Jul 2023 17:59:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/2] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
 <a8ab1829ab718dda869db3df3348ded211e81967.1690191480.git.oleksii.kurochko@gmail.com>
 <a370548e30aaa8c1160ecd5f2eccfcc10002a8f9.camel@gmail.com>
 <6675f535-7cf7-dd55-4ebe-82ba486029f7@suse.com>
 <4deb8c44cf639af66ad7f5b9b42180554e08d5cf.camel@gmail.com>
 <5a40abd4-edc2-0de0-99ed-d23174940d66@suse.com>
 <dee3624525f9530aaf3252c6c4fa6eb5262e76cd.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dee3624525f9530aaf3252c6c4fa6eb5262e76cd.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: d125d003-c8a5-4a12-cb34-08db8df15177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/hM+iXptjdekJL9OrkebURlOGSo/izjoe0CL/HORF2RP0y8h2WtPjhFwOIO6mf7saRJ12/LLCFZ7iGu7aVkiOTlUA8t7EAu+fQpWnrK+2jrTe6dHIntjt5bKCeXdGYcN16dSgc01IqPObeL+3MWBkil0vw8wHmtJkk2z2YbBqsXMMiR5Hew8ifXk3klf1GIEyrWHnntBLeVVnvioJLFKFkCR50WuT5v4zQw5NwO5l6MfmSL9LfwI1il30OdJ2XCeWkFYXGUu1RMcWlBltXmz0dNpbKquqjpSEwq+l2cejAEeT8rL5abeZEBijSSqyoVFavwFFdR9W2h+/uDHRUhOXsHus41shwebwHkde6k/h8Lo7phHz4+VI6YWKK83rSJjdYfrV4ZMzEZ42qWBzqBnVMdKaM1NU87Ouziate5R3o7pOfFLT80T13EeioHwPgtJqo7ZgkZPe7kOs5fvn9P2kar3ie4Y1qQxNptzUvDkaag6XK+znGAJw4rrKq+Q58XRr/8jh/U60hK1zuEDkALoth0EvP2O1rKsLnxWHhbv2yhWUbp6H9Ro8eS/AMw9z2ZmrVqdXQIOCaNLcXaiqI1ymU7nWjlUIN6810i3nCRb3aZZG+Mt+T3Nq8QTvrjYUHjiy0eDFffvgioewtY6AZbNbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199021)(36756003)(478600001)(31696002)(54906003)(38100700002)(86362001)(66476007)(66946007)(5660300002)(4326008)(6916009)(316002)(66556008)(6506007)(186003)(6512007)(6486002)(26005)(53546011)(8676002)(8936002)(41300700001)(2906002)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3I3WEdkRkdhZVQ0UWRNR0d6cU52bzRmTnh0andkTTZGRWJsazk2YUNzYnlU?=
 =?utf-8?B?NTd4ZTMrZE9LQWQ1Qjk4blMrK1JGWHEwcUFWZndTZjBsTi94a3NxTlNzYkoy?=
 =?utf-8?B?azhHNlNFL3JIUXgrQk5pNTlzVkI2UWFFa2xPcE4yU2d3N2hBRmhoWjZUKzVs?=
 =?utf-8?B?dUh5bEVPYzNlQ1p2VlJwQW0zNUhGM25Pb1FDSmEzaFlIKzdIZEgyTjVpb1JT?=
 =?utf-8?B?Qk5oY2VjTkhJNTFJM1M2K0p5TWF0MEJBWVlWeHA0UTZFcWNOZVVocHQyQVBH?=
 =?utf-8?B?NXNqcjNLeitrcWd5QkRNK3NZY3NqckIreWdrTXFsb2Q5bWJDZzdRZlY3SlZz?=
 =?utf-8?B?UWNSUlU5d0JyZnlFSlF5MDFkOVV2TVprdkVaUW84bGlkczMzVU1BTllMbVNZ?=
 =?utf-8?B?TWpDZldHSjBwcmF3bkNDOFRabElXdFk4WGxFUDVZbjVXb3F2eEZuTXRJTnJl?=
 =?utf-8?B?M01PUDV3Sk9Bck0vd1Mwc2p6eEtuZC9yUFc4a3pWMHFkT1lnOGdtbmtqRWhm?=
 =?utf-8?B?SWNHZlRrN1ZBcE9VR05sMDRPM3p5ZjN1M3NNYTlDUEQ0bmlXc2Jvd21md1A5?=
 =?utf-8?B?eGc2M3VPNUozZkxndTJsTURURHN4QkRRNm5od05BL0lBNndXQ09hd2ZwRXpM?=
 =?utf-8?B?b0ZsODM5dllRb2JVUFlOYkx5OHFraERHaUgrb0MvY1JRV0JrN1ZCL0VoQ3Uw?=
 =?utf-8?B?bndJNVJkR25VSnY2WE52QTZmMjZ3cHFJSHNTR1Q4NG1tUnM0cjlOeXg5Z0xG?=
 =?utf-8?B?UVh6UDhURnlqbVFLRVprQVVsU0lWbHE5UlBQL0JIV1ZnSlRnRFlsTWJSVTRY?=
 =?utf-8?B?MFR5WUNqWEZ0UUZDeEVUNmlQN2FlejZ4VC9KM3owaGF3dHVNcVUzQzBnWUVQ?=
 =?utf-8?B?NFI2ZGl2VmNJeVg3VFFBMUdPT2laVDZJbCtHZDI0R1o4dmZUZDVuazRDblov?=
 =?utf-8?B?UENSUzRQdnJ4d1BRVzVDWW1uWFFWQ0R5LzB3Q0tablJUaDhYNFJkZ1pQMm5y?=
 =?utf-8?B?eEFDaWVYSTBhWkU0NGhHNmR6K1NEVExndGxWVS9kUTI1aSs2bE90TDQ1dkRD?=
 =?utf-8?B?YTZqV3lFSm1kdkhzWXIvTktLZ0NmOXNTZk5PdWtiYXViT1Via0N5emJkYTNk?=
 =?utf-8?B?SlJxdnBoZTdvY0dkN0JGLzRreFRYRGNHRzZ2VEFKWlR2MDFCQzRndjd0aDdE?=
 =?utf-8?B?MzFvTXhQSi9rZ1Z4VlVKOHppVGRYaStFT1k1aFpCOEZSVC8xdVNBalZPNWI3?=
 =?utf-8?B?YS9ZUm9XL21uM2pEaHFYc2Q1SWxUQWJqdXoxT3dDU1BJdkJTdENDQVI5d2lw?=
 =?utf-8?B?T2lneWNNV2tSM2g2bEhhRGwyUVJtdm8vQk5oL090dTNmbTFRTW5RcVEybnNO?=
 =?utf-8?B?Y0RjRnJXb09yaGJRLyt2TUhXb3NudUl5SG9PUkdpSDYzWG1WQ3FqNWdOK3RY?=
 =?utf-8?B?c2FORVl1Y0VxRTRBK0NrcExkTGZObnozVXN5TDkrUUpWLzRzOXhwUllQZXl5?=
 =?utf-8?B?TTNZSVg1dkRjUU51eWhtK2JWNmExc3p5WEpFMytVYTlwc2l0Q1I5a21hQ0Nl?=
 =?utf-8?B?Q25aQVNVakM4ZENEbC9UQURnOUNEUEs2WndEVUl3WFRKRXVzdEpxa05rL25H?=
 =?utf-8?B?WkdCY2E3Q2haUWkxU0NZekpCWHJTeUd4OGdRekdJYyttRWQwakQxREF6YzFK?=
 =?utf-8?B?Qndia21UazNzZFpDalZOamUvcjIzdnJocDdjSjA4MlJDd2IxRHM3dDBvUFA5?=
 =?utf-8?B?bVRiYkdoV3pQRXJlR2lEbVh3bGlLRWxDdHdwa29ZZ3BBSi92cDRDNS9OTlhG?=
 =?utf-8?B?U044c0RSMEF5SFBJbG1WZEFnT3VxYTloZGxYLzFsd29wdStScHhQbW9YUzVJ?=
 =?utf-8?B?eEgwUFE1ZXRDYlJXUURNalZsN093Mnp3dmJFOGhxeHVrTGVpUDR1NWZnalp5?=
 =?utf-8?B?c3pJa2N5TjMrT2xVMExxanV0R21JYkQzY1BEdkJzWVQxeTNsS016VStNZjJV?=
 =?utf-8?B?VFBSZEZoaXM1eHdha2tiSEgrSnZpK3B1UENYTVBHeUpEYnZFNVJmeDdRcWRI?=
 =?utf-8?B?R29rY3d1WnFtOGVsMGVtTDAvenJVSVdJbjdQc3ZMQzM1MlpEZ0ZYaUdSMFRD?=
 =?utf-8?Q?dsFKdANdMLRD9nXbQpybfr0TC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d125d003-c8a5-4a12-cb34-08db8df15177
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 15:59:39.7774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvZ/pssuormwt4Rti9ughLhzdwMgg+gKCHDlS2y9iyA6CBgxRN1iD/w7bzFP24xq9h8EHFmwl+f7Hwljk4IL2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7606

On 26.07.2023 17:54, Oleksii wrote:
> On Wed, 2023-07-26 at 17:00 +0200, Jan Beulich wrote:
>> On 26.07.2023 15:12, Oleksii wrote:
>>> On Wed, 2023-07-26 at 13:58 +0200, Jan Beulich wrote:
>>>> On 26.07.2023 13:23, Oleksii wrote:
>>>>> I would like to ask for advice on whether it would be easier,
>>>>> less
>>>>> bug-
>>>>> provoking ( during identity mapping to remove of whole Xen ) to
>>>>> have a
>>>>> separate identity section that won't be more than PAGE_SIZE.
>>>>
>>>> I'm afraid you can't safely do this in C, or at least not without
>>>> further checking on what the compiler actually did.
>>>>
>>>>> @@ -264,6 +268,19 @@ void __init enable_mmu(void)
>>>>>                RV_STAGE1_MODE << SATP_MODE_SHIFT);
>>>>>  }
>>>>>  
>>>>> +void __attribute__((naked)) __section(".ident")
>>>>> turn_on_mmu(unsigned
>>>>> long ra)
>>>>
>>>> Did you read what gcc doc says about "naked"? Extended asm()
>>>> isn't
>>>> supported there. Since ...
>>>>
>>>>> +{
>>>>> +    /* Ensure page table writes precede loading the SATP */
>>>>> +    sfence_vma();
>>>>> +
>>>>> +    /* Enable the MMU and load the new pagetable for Xen */
>>>>> +    csr_write(CSR_SATP,
>>>>> +              PFN_DOWN((unsigned long)stage1_pgtbl_root) |
>>>>> +              RV_STAGE1_MODE << SATP_MODE_SHIFT);
>>>>> +
>>>>> +    asm volatile( "jr %0\n" : : "r"(ra) );
>>>>> +}
>>>>
>>>> ... none of this really requires C, I think we're at the point
>>>> where
>>>> (iirc) Andrew's and my suggestion wants following, moving this to
>>>> assembly code (at which point it doesn't need to be a separate
>>>> function). You can still build page tables in C, of course.
>>>> (Likely
>>>> you then also won't need a separate section; some minimal
>>>> alignment
>>>> guarantees ought to suffice to make sure the critical code is
>>>> confined to a single page.)
>>>
>>> Thanks. I'll move all of this to assembly code.
>>> Regarding alignment it is needed alignment on start and end of
>>> function:
>>>     .balign PAGE_SIZE
>>>     GLOBAL(turn_on_mmu)
>>>         ...
>>>     .balign PAGE_SIZE
>>>     ENDPROC(turn_on_mmu)
>>>
>>> Does the better way exist?
>>
>> The function is only going to be a handful of instructions. Its
>> alignment doesn't need to be larger than the next power of 2. I
>> expect you'll be good with 64-byte alignment. (In no case do you
>> need to align the end of the function: Putting other stuff there
>> is not a problem at all.) What you want in any event is a build
>> time check that the within-a-page constraint is met.
> But shouldn't be an address be aligned to a boundary equal to page
> size?
> 
> According to the RISC-V privileged spec:
> Any level of PTE may be a leaf PTE, so in addition to 4 KiB pages, Sv39
> supports 2 MiB megapages
> and 1 GiB gigapages, each of which must be virtually and physically
> aligned to a boundary equal
> to its size. A page-fault exception is raised if the physical address
> is insufficiently aligned.

You'd simply map the page containing the chunk, i.e. masking off the
low 12 bits. If far enough away from the Xen virtual range, you could
as well map a 2M page masking off the low 21 bits, or a 1G page with
the low 30 bits of the address cleared.

Jan

