Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E476488F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 09:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570800.892952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvNc-0006nb-Qe; Thu, 27 Jul 2023 07:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570800.892952; Thu, 27 Jul 2023 07:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvNc-0006lO-Nj; Thu, 27 Jul 2023 07:25:48 +0000
Received: by outflank-mailman (input) for mailman id 570800;
 Thu, 27 Jul 2023 07:25:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOvNa-0006lI-Rg
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 07:25:46 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe02::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc689de3-2c4e-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 09:25:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB8032.eurprd04.prod.outlook.com (2603:10a6:102:ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 07:25:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:25:42 +0000
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
X-Inumbo-ID: cc689de3-2c4e-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCn3VYQyr+5KjGk+sGoi0jwBMzh6/6OUKACVVFlkheFDTd8+EnhEE44Z/e3piUKEUB6DrUbD5Qf38lfr/Ic8eTUzYrGKq1vbF+iO+NGu9v49VtK0UshD3oKRdLyPYtAMkNuh1H+E9yMyNVWaOtRGx9M20w4QlPse2jhpuDjplCfTXjROK+ulgJiYyADtpleh5i9uORNwo2cNDnu08hbLECOR1gSGGs4H9wQSRM0nsn6fOERg+FyaJFDfUzr3axNDFaNZhLS0EZ+txFvENI7G5O0TbP2VWTg/+VvfnOYcvVeVBzTFKLMcjz3CidRZtGrlgjIMmYmxPzW+2VtAdJHYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7C2FFgGzEfISBoMK8DcLO46eX3ACJj++EcD9eY4iAQ=;
 b=MbJ0ZAT+E0Vr7Ch5oOlCRP/AA0V+Yml/kB96h7qdgjueaFIClCcHnJQ5NKkmfGLXt8ZBkQeAt1hEDNQ74Aa0zU0fTEBLZ00l7mmzbdtPWVpGFLQCF0QdBHpKkHDN6avQWExGaCLt6OcddTJMj46zzzoqfQT6ELnQ3i/Er+h/QFWyVn+UpmZ6jc0yBSHcmTT9ZpTxCbe0GVWWTzZtszB6N7qrap7QfYX26w9Z/lgapCksP/SuPRLdLiEhwNBhGwRWMAjYhxny6xtioTYKNA8roLEhXx3clrV0LO7G5URBMKParamibrCmBArg9/VlPL2bxNSTru8IyYrKBVF4jGBAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7C2FFgGzEfISBoMK8DcLO46eX3ACJj++EcD9eY4iAQ=;
 b=EAJk4zn4V8tHZvhazJwQqg2jM7BfhY+IsTTnrQ7SdxcyECmk+tCe3F+qCy88fvwaGylMhD8POZRb2KmGMT/A12ZROuKFTXZdw0lJABu4+jS23fg5ZpkFEtmQ9jcFKSEPgRh7beBjBg+ISP/aq84+pnRMTNNN5Il+cYwAYTfftUz+18/esyzjIjZwju7QfrETfhPDzK1/SUKZQA902HuS+VMc4JyUvDZ8Lg6f9ekVEbDtNxzQZlRqFURMbmSKg6jtLJ8HpkEk/NSnpPcuue8Yz/30VpKAjSo3N0a84sC08mFwRhyA0GczfqLXMM2Kom6ZCiaieVb1KsRYI57nl5Dkcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53dc4f15-cdff-100e-eeff-f7bad24436a2@suse.com>
Date: Thu, 27 Jul 2023 09:25:39 +0200
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
 <79b20131-46c2-9e54-e615-18a346b83b8d@suse.com>
 <b219699f928b9e86a3b0af9656bfe0e083d3cfdc.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b219699f928b9e86a3b0af9656bfe0e083d3cfdc.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: 7951627f-90f0-4cb6-a0e7-08db8e72af1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ONDP1WnyGJKrOBHAD5OwJDUgJqGMShWuBKDT968kV5ES6dTwDzgIQutsJg77gOqAKbqbYDwtwT2M2kUZAqaVUv4xk2Al/mU6K+fLyG+bjrtcChPR3truNFKJl6co42EGdg1ZZ4CdwikAfEI0cFVooKI95JJVYcHp7MXF4jmal5gBb5sNAOwTTdyNXQW3WOshgyJ12ilLl8Ak6KnF1M0hcFiT6ceD+SJdzITSnGY1dhTcAL+qwfa3gnn5VSyzf3s4lv8MOd/l8cBqfHvSHoCf7XUUX5TIZbYF3piQ8JILfH40jvw7+MxANh1/Ug+GFjWYrfot1vo/jVgzxDBlKLaWUCzExtl0/MebFLOSjPbz3s0Wx4EHhQtDY3o1OXUnmyM2K3hWVMK1kA1lSCygj57MeJ0nTJPhjvsQuKULG51ioIDvQH+Sn/MfEGK2DtdSu/LMbJqoMiJ1gr0bT2w8MAYQqtVd4nnOCUmUYITAPV0zum6GaEc7PRRK928pvOVxr4k9xKya+C4YFIFOEn9QuWD9cX60VJJLyQGZ4JovWLtZHOjCnrBGwMPpYRiYJ+6iXRwA1X1N2p4UyE3EiGMafs1Lv3ZhQbemn3tc4E53swhGOk9KfLSi8vQ7hob3Je9OmO3jizMSRZOrt2HNKwC/gIDzLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199021)(2906002)(41300700001)(316002)(5660300002)(8936002)(8676002)(36756003)(86362001)(31696002)(6512007)(53546011)(6506007)(26005)(478600001)(6666004)(6486002)(186003)(31686004)(2616005)(38100700002)(6916009)(4326008)(66476007)(66556008)(66946007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWx3YmR4TTJZS3k5UGhPS01rUWQyMkNzYmlDVXhrZWU4K2xEcXpreERkQldm?=
 =?utf-8?B?OGNxQWpRcy9EeVRDTXB6c1NFZFZOUGRzYWhXUDU3V0FPMFBmZTBiZDNZeHJK?=
 =?utf-8?B?NVhiOGpGUDZjVEdhT2R6MUlmZlNBUTJLS1B6YWRDTnV6TE93cU9LTkNndlZr?=
 =?utf-8?B?TTAwM09VcGhlL2hLcHJsK0VhVytwU2NhdTRzWlU0eUZxOHEzZmkzVitIVUJ4?=
 =?utf-8?B?Q01mZWhhTkdEcWY4eW5NbUhIK1QzUjdqR3BBdlh3RHdrTnQ0OEdSNnNaenQ2?=
 =?utf-8?B?MHNjQmRFbmVLRFQxeG5OaUI3eGtOeUZwcUhWdWMwODZETkttaEJyR3RIdFhC?=
 =?utf-8?B?eDZvMnlJTEljSldoRW5GRDJYRFdwUGlHaXFURkRXM2dZb0dMNFJyRUxKYzFL?=
 =?utf-8?B?RG5tVmYvOW5RS1NUY0EyVy9pZkZWTE1JRkViQkhXYXRWU0FZRDY1MXpxNXp0?=
 =?utf-8?B?Q3g4RGpnZ0RDMjJyTjBsd3RHRDdMWDJNRk0zMXhYeWRlU1F0eXJoSXAwdS9H?=
 =?utf-8?B?MEhjdEp5NEJSNjVmUUJOWFZQNitham40MTNXSEI3RG9KRjdwc3lZKzFBTW43?=
 =?utf-8?B?Ny9DUFR6amVsYWpqSXkycm91Tk1mM0lESnRralBKT3Y5dk83eE1EVEdPZGZk?=
 =?utf-8?B?TldiVm1ZT3YrVkZyMTRHcmE3d3poVnZ1SXBVdllJckVCZ3lHUlJhR1J5NnFN?=
 =?utf-8?B?NVdqVWJBMUxQbW9nZHJDaW0vTzFicjl1UWNsUXV4UDlJNy94ZTNCdElFODRH?=
 =?utf-8?B?YTBERFI5L1R5Sk5CK2VQd0FDN2pDNlNkSVF4OUR2Zks2YjUrK1d1NENTT2pJ?=
 =?utf-8?B?RjNKM1dLN3pxalRVczAyNkEvODJMYXBveE1nQTBPWWNVcUJ0OElLajlpTkNq?=
 =?utf-8?B?RUdEK0pmNmVNWUhBTXlBWVIwQ3ZFaVZGUkdBc3dHQ2FrcHBaVFZwUmptUVIw?=
 =?utf-8?B?Z21CbTNBZmtQa2grU2picE9TZUNTQTQ4WXdFTVozQ2M5NUkzUnlEOVlnUlEy?=
 =?utf-8?B?V3RSSi9FUzB6VnRmRDlDdE5WL2tyMUp3S1lqeVRMMXVnTXVBejFKSlc1UEc1?=
 =?utf-8?B?dkZ6aSt5N0ZaUnowNjhIVWo1L2FLTU1WUitTMnppbk5pRXU2bytydExPaW85?=
 =?utf-8?B?U2pGTXpuOFdFV0Y3dWR6azFlbk56MGV5Zy96dWoybGVoM29EYk5NZkc5eHd2?=
 =?utf-8?B?WE1qcnBFOENHcm1za3p1QVNLVGxVeUwvUTlCdE9lVlg1NjVUNmRxWVk3YnhB?=
 =?utf-8?B?aHJjUXJkYWY3WkF0TTlJV1FidWRWa2hpSXpaTFFRN2c3VzBZYzdzV252THkv?=
 =?utf-8?B?UkNjV0xQbUlpeW9Ba01LZ0h3WnNMdmV0R3N6SWwvVEtZY0hLT2ZYaXNWTm5s?=
 =?utf-8?B?c3lSMDR6Vm1XNFFycFNYdzh3QnZENUpocDRVYXdQWThEbE9VTEU5eElGd2xB?=
 =?utf-8?B?ZFlLclI0bnBMelN0K0lPRzJYWWN5UHBaRHViSE5ONm8vWWc2WG5waXBTQllm?=
 =?utf-8?B?ZVhNSHNwWURjTk5GeDdDakFvZzhvYVlUdXdrdG92TEx4ZjUvS3ZsS0xRR0hH?=
 =?utf-8?B?ODNBRVR6VW9lZmVCUFVOUThvVXY3SGtUbTgxUXdRM1JqTkh5ZDFuNGRzUzR4?=
 =?utf-8?B?NzJhOTVudnp3RktZRWdoenFHWGxzeXJXSXduRCtFdnI5WEs2bVdrc2FHRTRl?=
 =?utf-8?B?Yk9YNGs3Q0xyUndHNEU3OTI5TXhKZ0tuUDRBQ2NzeFIvZ09WUkg1dXIvTzVa?=
 =?utf-8?B?UHdvSXpOZUgwUDdhU2tDYWZwOWljcXpEbHlDc1ZCbGFhbE5TcjBXQlVOVTFk?=
 =?utf-8?B?a0xETWNadUtTY2kzN3hNZDQzSTN5REZuRkc0ZnBJdm05YllrZEVQcXl6TGp2?=
 =?utf-8?B?TzFHcFBZZHN6VEJ6Y2NnMWhId1V2RmRLQmVoUURVbE1YcXRQWmRHVEM5NkFN?=
 =?utf-8?B?c1BEWEF6YnRsbEJVSnlJYlo2Q1FhbmpOTGNjSXZkeDhVQmtlTi9CUjZBdGxK?=
 =?utf-8?B?WE1yMTgrNkhGZCtZSjl4NFRaT3dyRUNqaFZqSUtJTFdxLzI0dzFDbHRTOWJ4?=
 =?utf-8?B?bU41NjhaSGxqd3JRZTd0ZGdYTHA2czFlc0RkU0FNOFcxbEx2ZnNVa1NiMjV1?=
 =?utf-8?Q?zh7pdfn/8e/Ldnl2gaoy7VtyM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7951627f-90f0-4cb6-a0e7-08db8e72af1b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 07:25:41.9721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGB/5K7Pa+Y+Cp44AxocDCJeho9AC2AzFnCLjwtQmikbJN7/DItg8FiIej2OBiSL545BX0wtQhBVJy/LO7WPww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8032

On 26.07.2023 20:39, Oleksii wrote:
> On Wed, 2023-07-26 at 17:59 +0200, Jan Beulich wrote:
>> On 26.07.2023 17:54, Oleksii wrote:
>>> On Wed, 2023-07-26 at 17:00 +0200, Jan Beulich wrote:
>>>> On 26.07.2023 15:12, Oleksii wrote:
>>>>> On Wed, 2023-07-26 at 13:58 +0200, Jan Beulich wrote:
>>>>>> On 26.07.2023 13:23, Oleksii wrote:
>>>>>>> I would like to ask for advice on whether it would be
>>>>>>> easier,
>>>>>>> less
>>>>>>> bug-
>>>>>>> provoking ( during identity mapping to remove of whole Xen
>>>>>>> ) to
>>>>>>> have a
>>>>>>> separate identity section that won't be more than
>>>>>>> PAGE_SIZE.
>>>>>>
>>>>>> I'm afraid you can't safely do this in C, or at least not
>>>>>> without
>>>>>> further checking on what the compiler actually did.
>>>>>>
>>>>>>> @@ -264,6 +268,19 @@ void __init enable_mmu(void)
>>>>>>>                RV_STAGE1_MODE << SATP_MODE_SHIFT);
>>>>>>>  }
>>>>>>>  
>>>>>>> +void __attribute__((naked)) __section(".ident")
>>>>>>> turn_on_mmu(unsigned
>>>>>>> long ra)
>>>>>>
>>>>>> Did you read what gcc doc says about "naked"? Extended asm()
>>>>>> isn't
>>>>>> supported there. Since ...
>>>>>>
>>>>>>> +{
>>>>>>> +    /* Ensure page table writes precede loading the SATP
>>>>>>> */
>>>>>>> +    sfence_vma();
>>>>>>> +
>>>>>>> +    /* Enable the MMU and load the new pagetable for Xen
>>>>>>> */
>>>>>>> +    csr_write(CSR_SATP,
>>>>>>> +              PFN_DOWN((unsigned long)stage1_pgtbl_root) |
>>>>>>> +              RV_STAGE1_MODE << SATP_MODE_SHIFT);
>>>>>>> +
>>>>>>> +    asm volatile( "jr %0\n" : : "r"(ra) );
>>>>>>> +}
>>>>>>
>>>>>> ... none of this really requires C, I think we're at the
>>>>>> point
>>>>>> where
>>>>>> (iirc) Andrew's and my suggestion wants following, moving
>>>>>> this to
>>>>>> assembly code (at which point it doesn't need to be a
>>>>>> separate
>>>>>> function). You can still build page tables in C, of course.
>>>>>> (Likely
>>>>>> you then also won't need a separate section; some minimal
>>>>>> alignment
>>>>>> guarantees ought to suffice to make sure the critical code is
>>>>>> confined to a single page.)
>>>>>
>>>>> Thanks. I'll move all of this to assembly code.
>>>>> Regarding alignment it is needed alignment on start and end of
>>>>> function:
>>>>>     .balign PAGE_SIZE
>>>>>     GLOBAL(turn_on_mmu)
>>>>>         ...
>>>>>     .balign PAGE_SIZE
>>>>>     ENDPROC(turn_on_mmu)
>>>>>
>>>>> Does the better way exist?
>>>>
>>>> The function is only going to be a handful of instructions. Its
>>>> alignment doesn't need to be larger than the next power of 2. I
>>>> expect you'll be good with 64-byte alignment. (In no case do you
>>>> need to align the end of the function: Putting other stuff there
>>>> is not a problem at all.) What you want in any event is a build
>>>> time check that the within-a-page constraint is met.
>>> But shouldn't be an address be aligned to a boundary equal to page
>>> size?
>>>
>>> According to the RISC-V privileged spec:
>>> Any level of PTE may be a leaf PTE, so in addition to 4 KiB pages,
>>> Sv39
>>> supports 2 MiB megapages
>>> and 1 GiB gigapages, each of which must be virtually and physically
>>> aligned to a boundary equal
>>> to its size. A page-fault exception is raised if the physical
>>> address
>>> is insufficiently aligned.
>>
>> You'd simply map the page containing the chunk, i.e. masking off the
>> low 12 bits. If far enough away from the Xen virtual range, you could
>> as well map a 2M page masking off the low 21 bits, or a 1G page with
>> the low 30 bits of the address cleared.
> Agree, then it will work.
> 
> But still it doesn't clear what to do if turn_on_mmu will be bigger
> then 64 ( ASSERT( (turn_on_mmu_end - turn_on_mmu) <= 64 ) somewhere in
> xen.lds.S ). Right now turn_on_mmu() function is 0x22 bytes and it is
> enough ( we are sure that we don't cross 4k boundary ) to be 64-byte
> aligned. But if the size will be more then 64 bytes then the alignment
> need to be changed to 0x128.
> Am i right?

Well, to 128 (without 0x), but yes. That function isn't very likely to
change much, though.

Jan

