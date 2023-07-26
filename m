Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05147639C8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 17:01:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570528.892381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOg09-00063A-9G; Wed, 26 Jul 2023 15:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570528.892381; Wed, 26 Jul 2023 15:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOg09-00060Y-5H; Wed, 26 Jul 2023 15:00:33 +0000
Received: by outflank-mailman (input) for mailman id 570528;
 Wed, 26 Jul 2023 15:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOg07-00060C-OZ
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 15:00:31 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28d3df11-2bc5-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 17:00:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9918.eurprd04.prod.outlook.com (2603:10a6:10:4db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 15:00:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 15:00:24 +0000
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
X-Inumbo-ID: 28d3df11-2bc5-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9XM/0o0wK+J8AuqORxPAyMXCbra+qNHMSeTZhdCXKMhoIF0SEzk9SFBhZvPPXgZl3go438QyOCLrjiPVvrP52BfpLeczgZHg8pLLX15xEPj0p5DKkNaieRGaPgX5bc9azatIx+jGTI7pu/MLgOCLjB883czXMqfwTE/uBvjP+RejbDwaUGRstySoXGqXt5t8FpsDNnq1WBacj+wYqp5F4YlZGQt++ooMrYMri+laUbaX/J3I0laf1JnbfXNasEYQOPQddUt80yO+ewYWCEjl2yD8jTDvauX5tRL1xA6LvmngPZ3O4DYhsXUSUCwz4Px7qeMoo+tyY4R/FJIUBktsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKDgIRzS6g0SCT9y8ZYDmvY8ivnpVEKA0Wu3YWwRvYY=;
 b=hTPkDcFYQ0/30abY2SWcb1aOmin9cMkA5cvOVCFOZNX2MZdy9Ew5KmRjsK/RVzwr67ildqyaWSCh1fFgjVNlTAx4Vxs0ca0SWjqCjEtGSa/YAIBqkOMDqT+AoDnmwUIVrxBAMU+3agIT8yRPkfNm/QKSjBHRW+lfdyB5FIrquB9FH9Uc7ApTGLlWThcoz9Qy5V6JsLofo21erlmeXa3RQjAFWRRzNt0OLS+hXGxjcfq6q6vonjmoo4RiGQ8r7yOeMjg31PkzaP6fWcypLuE1EbQPJtOF3Pce+fG3FYrxjjVkoXhscxPjRGAC1tB1jk9ukNFzyQGWcC84FwQgnqr/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKDgIRzS6g0SCT9y8ZYDmvY8ivnpVEKA0Wu3YWwRvYY=;
 b=EThdlWsDPOu/b8CbC+xed+Ne464vyjSfbrIOfs1s0/9SQ8NeoOY614AutxEelEpvprumzmaFTVNIQF7SZHwLe5U+BbPoEiFSQeX0cgI0egKmYwsBGt6TgKYM4rYntlKKPT3gbnG2Q9odiirGFyDlYPQ+lR1LKBmqHjjf9xRPsgoI7RalrsVhk0UFNpLy7DpkMbNNsQ2L4D1VTi0kSTsf3EK2JTcKJ5XTvc/gLe9k99oR8JEGuV1TMcPY+PveGrDzu6C9YXA5axrqhDexctjIhTrEoMLCorHf7P/fSQEez/xOc2HikD9ey7xJjrSX92VGfjDmZTd/G2lPSuP7yu+slA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a40abd4-edc2-0de0-99ed-d23174940d66@suse.com>
Date: Wed, 26 Jul 2023 17:00:22 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4deb8c44cf639af66ad7f5b9b42180554e08d5cf.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9918:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3ad295-5d76-48f4-6fb3-08db8de90a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y8CnHAoDhDa458ZFSCiMrnhBDHf8AgbCa3+hy4BtRKGKWh72WE19WKUU1jlmyQ55ciYwAGmFkqr7rcPtuhQLZGUH1lmFOsDdhEyJ8GaSr9Zr8yvHzFuBG0Z+uHgy5i54ZKUqz0nNIJnV/XHVqkfwdF50IUSDqLuD7IJJhoe8R1U3rpSb1qegMU0WG2uqokBDIAAvntrLHdKA4YVknq4qYgKc2fZnad0R4jALCtrOdR0E7T+jTZPy9Y1F1H1AP5DmcNCMM2U7V+HJepATLthH4E8IYKO3MPLyLgfALSjN41b13TsdRRqOyauPSZffOgq8gIBm7qkD2hUscCch1+/rVljmDQ+tY51r9OSPECHurgYQqk74UOYGCSdSuZ6pLpUoabdMgZxRGjCziFEUpCZGDv+XPEoYfNPeBFB7+RKZXf7p6IyYdMvW/0FC/36yoFBWiJcNAfwq/ixAltsaNKrO/cb3Bl+m44zEeNjhcDKc9ZdziWcPq7r9T9KizThyD+E+l9T/7UkieDVKNETGXDMNkd1TvIo/8PhA3JpiEXCRS5CpgmEk+MZQd8PEFholD/vkNsHEW9YXEvomnTWC1dNMuRucEl7NghOd3QjWD8/9eALAQW80H2BvWwN9iv5gO6B7PW2XyN2C+FuqDvde++yWJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199021)(26005)(53546011)(6506007)(38100700002)(31696002)(2906002)(478600001)(6512007)(86362001)(54906003)(6486002)(36756003)(316002)(8676002)(8936002)(5660300002)(31686004)(2616005)(4326008)(41300700001)(6916009)(66946007)(66556008)(66476007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjQ0bXo2bVdYV0wxcG9jandZVWE2dFZKVXBCdUVTZjVnbEtOSVFmcjAxMWV0?=
 =?utf-8?B?QllmcGJkclJDTEs0Q0pOZnp2cC9NOVVFbE1peVZiZVlpU2xHV0ppMytRbHBr?=
 =?utf-8?B?amtRNVQzUWM0RVNLN0hWMzhWWFQ0MlFJeldtdDlYU1BObythRHhUUDgzdDJV?=
 =?utf-8?B?K0R6c3doejV3UklVRHJIMUZUMmJpVnp5Z2JxU2NkemM2a2pSTHpPWHdSaDBS?=
 =?utf-8?B?YWUrcEd5V1ZRTUM3R2FQSEJnLzVPNjk5eWVVdThlYzFCVFNlM2pMbWk4RWdQ?=
 =?utf-8?B?bjRGR0NmSlplTmkxWkJNbW4zaXI5Y0RBaXRGUXJuVEhnRU9mbWkxT0EwcjBV?=
 =?utf-8?B?dTBjV3lVL1ROVExrWE9CVXdyUTAyMEFTVUFHdnYyTjlUdW9IZHJmdWhGQXpJ?=
 =?utf-8?B?UlFKVnpsT3puSEkyOTZRLzAvM2RnOWxQLzRRUGxJK1ZZLzZOMmh0RHl3bmty?=
 =?utf-8?B?Y0ZuRWZhdG4rM1dTVjJJOFdXYmtKUm9WRVQyWHorYklXbFZqZXlYTHNoLysz?=
 =?utf-8?B?RmJENGs3aFV3UklQK29qS3Q2V1F3Mk82Z3ZKNmJWZWg4dUIvZEI1S2JSQmRh?=
 =?utf-8?B?VGMybFNEWjdLSTJwM0VIUDFlYXowcXJjcUNrbFZlMk9MT1Y3ZmhTMExWd3NW?=
 =?utf-8?B?TnBCRzhlWWxQZHNBbTdyM2lrU3g2QkVHcHhiTy9SaEdDMHdxT3NOMk9ybnBr?=
 =?utf-8?B?YXdDSitjclQ1cjE2b1RSVFVqK3ViUVBSaU1rdGVNY0xObmpwRmRGSGlTemNU?=
 =?utf-8?B?VEZwMGFjb0xGQUNabGpxQ0NKcXpyTlF0TjJsRnVCaWVGa1pGYUx1T0V4QTNs?=
 =?utf-8?B?cVYwdU9MQWJweCsyR01tbld4Y0cwSDVkczNBQlhaRXVDY1E1NVhTbXU5cnhN?=
 =?utf-8?B?NVJ3eGNJN3N1aUNLZlp0VTBucGZ0MGJMK0lZUzFpSkdBN21CdlUyYW5OOFpC?=
 =?utf-8?B?QlE1UFl3ejNaQ2twWFdpZldJT1p0T25EL05HT2EyN0JGWjBsU09pWTdkaU9r?=
 =?utf-8?B?bTlMeWdnUWdNQkxRRThOd0JNQWlNOHNtVU5rem1vMklSYTZiZVN2Wi9SVE5D?=
 =?utf-8?B?MitFenBLRDZ0Z3pvT0hxY2FIUGpPdk96ZmFjVSswV3VMUUFrREQ0VkZ5eXIy?=
 =?utf-8?B?d09TRHNPL3Z0cHFVb0xjZHJWRkppVHR0MUlqRWMwUUIzNlI3aXpwbU1TVnNI?=
 =?utf-8?B?VjFnTk1FbksxV2VDSUdISzYvQU8xQlJ3RGg0bS9aa283WS9QL1V4UjV4TWcz?=
 =?utf-8?B?dXdSNjByUk1mYkRNYTZPNytSWEtuOHRRcmtWREEybW5rdzg1eG5qKzEwSWNi?=
 =?utf-8?B?ZXpnS25KUzdyd1NqVi9jTTgxR2dzRlgwR1BJeXZOWldEc09Ubm95WnA5S3pN?=
 =?utf-8?B?Z3hxUG85Q3VTbU9ZVi9VeXNBTUFCTUEzZ2E2Ym9vRWJCVEQxZGJ2SDZrL0pu?=
 =?utf-8?B?UXpXcTdMWWw5ek42eUJ3RmpoV1RrRzFMYjBYY09nRlphazNHSDltVmNBM2V0?=
 =?utf-8?B?OHVnZEFQcDhRdjBQWDY3M2h3azBIVnFDVHkzbGpLSmVieWdIek9UTTlzNE1Y?=
 =?utf-8?B?cWZMK1RKaEVHSHZJMFNDSmI0UWN3QkRFS1JpT1drM3hrcWg3RVdXSE5xZlVr?=
 =?utf-8?B?RmRMZ1FKZEhQT21xc1ZFQjdOdjB0VHVtQ21uNDF2TlgrS1hUMkJLcFh2Sisr?=
 =?utf-8?B?SFFpTFAwYXN4N3BBaTFRU1cydnNuYUJNSTV1WkZSdXV6cGw4R3lFMTVsczRj?=
 =?utf-8?B?am1VdVl5UWVKRVRkOVFXb0ZyT2xCdGlieTFhSitSaGVUVFR3QmpxL2pRYjhu?=
 =?utf-8?B?Z2pDNDg0Y2k5dzdERThuRHBQbkRnRGVBSmVtRzB6ZHE3WDJpNkgrUHZaSVpL?=
 =?utf-8?B?aTZ2Nm81WC9WOVYzUjlYeXl1amlla2c0Tlh1bnhPclE5bXY4dnl6OTFNZTVq?=
 =?utf-8?B?U3FHbGZmMlZlWWNiNHRCUy9ka3ZUVDM0VVh3M2VUaWhZQTVtV0lMeHdFWCtM?=
 =?utf-8?B?M3lwMm1UN3JiaVRZTGI2Y1FnbXNuYUxIY3RnN1NuNmd6alJJTm8xU2xlb2Q5?=
 =?utf-8?B?RE5oQXhsTlIrZHkrNytvK1VIVDhqVXBHVytmUlJTazNGMm41Uk1sZzVLendx?=
 =?utf-8?Q?Zxgf7D8ze7znIVLZmm/gjaG6Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3ad295-5d76-48f4-6fb3-08db8de90a48
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 15:00:24.3790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ULBDSGX+OJlDRSx+foSzSqH/WvZbn0sMw3TBm3CFEG3LegRc1KTbKERalKtRiapQF9krjPT3KK9l4O9jYQ0IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9918

On 26.07.2023 15:12, Oleksii wrote:
> On Wed, 2023-07-26 at 13:58 +0200, Jan Beulich wrote:
>> On 26.07.2023 13:23, Oleksii wrote:
>>> I would like to ask for advice on whether it would be easier, less
>>> bug-
>>> provoking ( during identity mapping to remove of whole Xen ) to
>>> have a
>>> separate identity section that won't be more than PAGE_SIZE.
>>
>> I'm afraid you can't safely do this in C, or at least not without
>> further checking on what the compiler actually did.
>>
>>> @@ -264,6 +268,19 @@ void __init enable_mmu(void)
>>>                RV_STAGE1_MODE << SATP_MODE_SHIFT);
>>>  }
>>>  
>>> +void __attribute__((naked)) __section(".ident")
>>> turn_on_mmu(unsigned
>>> long ra)
>>
>> Did you read what gcc doc says about "naked"? Extended asm() isn't
>> supported there. Since ...
>>
>>> +{
>>> +    /* Ensure page table writes precede loading the SATP */
>>> +    sfence_vma();
>>> +
>>> +    /* Enable the MMU and load the new pagetable for Xen */
>>> +    csr_write(CSR_SATP,
>>> +              PFN_DOWN((unsigned long)stage1_pgtbl_root) |
>>> +              RV_STAGE1_MODE << SATP_MODE_SHIFT);
>>> +
>>> +    asm volatile( "jr %0\n" : : "r"(ra) );
>>> +}
>>
>> ... none of this really requires C, I think we're at the point where
>> (iirc) Andrew's and my suggestion wants following, moving this to
>> assembly code (at which point it doesn't need to be a separate
>> function). You can still build page tables in C, of course. (Likely
>> you then also won't need a separate section; some minimal alignment
>> guarantees ought to suffice to make sure the critical code is
>> confined to a single page.)
> 
> Thanks. I'll move all of this to assembly code.
> Regarding alignment it is needed alignment on start and end of
> function:
>     .balign PAGE_SIZE
>     GLOBAL(turn_on_mmu)
>         ...
>     .balign PAGE_SIZE
>     ENDPROC(turn_on_mmu)
> 
> Does the better way exist?

The function is only going to be a handful of instructions. Its
alignment doesn't need to be larger than the next power of 2. I
expect you'll be good with 64-byte alignment. (In no case do you
need to align the end of the function: Putting other stuff there
is not a problem at all.) What you want in any event is a build
time check that the within-a-page constraint is met.

Jan

