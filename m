Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769B065E5D2
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 08:14:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471657.731587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDKRT-0000Kc-KA; Thu, 05 Jan 2023 07:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471657.731587; Thu, 05 Jan 2023 07:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDKRT-0000IT-Fz; Thu, 05 Jan 2023 07:13:35 +0000
Received: by outflank-mailman (input) for mailman id 471657;
 Thu, 05 Jan 2023 07:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDKRR-0000IJ-DE
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 07:13:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2047.outbound.protection.outlook.com [40.107.6.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74f3d6fb-8cc8-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 08:13:30 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8337.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 07:13:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 07:13:29 +0000
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
X-Inumbo-ID: 74f3d6fb-8cc8-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VM3VqyJ3usvUou7yHCxvrhCW4EDnmn/YJPTrvCm/f9UM3Dipg+2BUfXfgJyf1owCJ7q16IF3uffQsG2StG8JP6PNVbxBTq1NMcTBJ4FOXwjtQqp+k0qIJncV4XnODLgNzA084lZNUilxI8iQRKeS7IPAkRobePvELrYOdHwPi/+wiXxLkpHs+iPmz3w8EK0OSn+6qoW2W28g7RHXp2Qbew5FOpg6LiEFFBK5o45b2WTogFL1ydZswL7HkRnSE2zgfLVilbubsREdvlGQUUhAR8EODFYvxSN3MaMK+HG+cutQT0VCX09MRUW/DrtgU7zTUUDejENBhhE5cyw0ETP+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4180Hykc+KTZMJiQ1FymiaCwrT2A7+kybbdi21Hl2ks=;
 b=GwFNsH/BPPxn9wR5fUKyH1mY91TfVKUXbQTru0ZDF6yToUiXiktWCKbN7V6BN+B1yNuH4vp2zn20o2PzACbZ3LmLAy0ymUOPGMicingfnCrrssjDtUPI5ccVii791udStRCrg/p/TTZyXg678B93UQSeb8KwPPcagbNKQKWAlBYoMrrHxRdFA8xfiXhTAjWUpuH0Kh8d8Vfs0afSxtW/PdVAp/WDw4z9YHDYd0IJQyInj1jPWIsAxsAXpJP9TMI6PNewfhmQUCkhVImA/gmvAqf0n0XYhORgBUJdl9l26HazpkPViH+26Yov5bS8Lw23M2N0xsrVk/36w6scgYfJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4180Hykc+KTZMJiQ1FymiaCwrT2A7+kybbdi21Hl2ks=;
 b=XShXLow1Xekh21gVO/411AR/B6mIWLUsGTNKauGGYl5Epu5DPeq3fouBQnXrt/BSnA+hs88mzNrR3hH/TQawsl8VVC3BcQZSgx8Ga/YSsLmHgzmM2+OYlf/cnWQXWPokqtylIaD13SoGGIxQ3vtu+UxGV1r2l7Q/3d0mOOABD3eoyM3IJAg2hJE9+5b2ooKnDiIvsJ5M5oc5VzTsiE8eoTB9XsNadw4tN1UVQSwTg2P66A5f19Alr1Nsz+adw/ICpDpcJYRF/rXWiZGaheJvfAQEs0i/QY3yaBQFI5VqHfznkeglQyuWvouTYlBao1PDKPzx3bMHrsFRxkdL2W7CpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5c4d3c7-59aa-1f21-c952-3b94f662298f@suse.com>
Date: Thu, 5 Jan 2023 08:13:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2-ish] x86/boot: Factor move_xen() out of __start_xen()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
 <20221216201749.32164-1-andrew.cooper3@citrix.com>
 <520cdde9-07e1-fce8-56d9-205fc31c62e3@suse.com>
 <c14dacf1-7057-d860-7708-2dd13e8d6a4f@citrix.com>
 <e70bf233-4444-8c65-8cca-1b7ea74c55d1@suse.com>
 <5f3df359-2906-ba20-b8df-ae2f2d5f5981@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5f3df359-2906-ba20-b8df-ae2f2d5f5981@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: af0c9e5e-c866-40d7-ed5e-08daeeec5868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I5q2s1BOChuYGuI2wl4jkS4bogSS9HAMRupMCoI1tsV86suzLlkU1g5uT2WTxitanrtVzjfw64ilT1DaIF6hKTm25DMDjro9QspkPZJnVr6LDLpYHJGrCy6RXOiyDbpb4sj4mW+zdwKwO9wvql+QCeV44U2X5Rul/mlZ6CI8KMFkQHMbqM+xGObKvAnFHGumpTfS/nySl67dz04ssi1vkr3kHir/Hw24FHBsVsbA14dqpoVTP9a0bm+g2RPXvz93qvpdYQ8itQqWvOsx6GJ5izEak3+bfKnPV900K9g+Q41L6vUpOL7awK3aZLqKks/W+vUCTXMtyzXti9DMa0EtEqiyOu1QIVZtaL82DNrT81EFZxNTIw+r+kLmbRG0mF/KIkxGsy8RPJ67SoOX+lo8CQ9RGb6TouUPAz/k9vpQ8Q/8yskIyuJCYHzfebXDSN8/opG8sj2/IpvJHmow5s6WOtgwMdyiGgrANXJcyBwO3EqgbGVgNycfpqcAc+fKwr8p0I/8UYM9ZJo4ftTazIKsGwYQ3mHHxcGXdv0GaetVox6aw3dskX7/M5kmxqgKXIJ/6X9phsiBBC93cocvT6ORnGdsyOojnTo5ogibont52r5JihnnTemrPgiCwAFm7ZXVyQmaBzij145AbWwweNe5e1Ba90V2+6zX7ljZVLNUue4cjZydTm8Ru4OpNR7P3ff4zYnDAG2kgxwjHV/VXVC5VeWFXIpmgQwrgZrffWhq9OLpgqZk2KOPiXLpctYdkC541xry5llSlb/17IqY2fZGLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(396003)(366004)(346002)(451199015)(5660300002)(2906002)(8936002)(478600001)(41300700001)(4326008)(316002)(8676002)(66899015)(66556008)(66476007)(6916009)(54906003)(66946007)(31686004)(6486002)(966005)(6512007)(26005)(6506007)(83380400001)(2616005)(53546011)(38100700002)(186003)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUozTWErdEZkZ1dFRzZyZUN2Tzdwa0N1SlNHUkFUdFNFbkpUUVYzby9DTS9B?=
 =?utf-8?B?QkhiUWVRS2hVVWFjTTBBZEJuNHlvK2J1QjVaSC94NVBwdENmVEpNUFhDSnZr?=
 =?utf-8?B?Ti9oanZnd1A2UGJCUlNIZUNSTlg1NmJqQjJwWVc3SUdxZzV3a3NwTGVHT3Jj?=
 =?utf-8?B?QmNSc3V4dHROVGR3WEU4ZHlVUm16QnZaY1Q5aXk2NS8vU29FYUh0UmVhMGYy?=
 =?utf-8?B?ZkQ0WnlVZzhGS2JXMHVNQjRQbnBFaUdFdUtvcnZLeGdXeTgwWTY2WUFVUzRa?=
 =?utf-8?B?R01VOStsLzNOVThHL2w3MG9ENHROeXZKWU52L0VTNVFHOGs3V0lvdFpzbk1B?=
 =?utf-8?B?cDBkOVpMa20wd3lOVTlsaUhBQVBEZENsbFJhdkExMU1aVk9SQ2VTcVBoUVNy?=
 =?utf-8?B?dkFKWktydHdsSXpacENxUlpnelVkUWxDN0pRYmRJYnNubHNQWTJCVVJLQm1G?=
 =?utf-8?B?WFFQZzJid2owU05Ja1VMSWsyZkJCZTFhbnYvY2EwNDVxSFE2eUg0L1NsWjVO?=
 =?utf-8?B?VHAreWVHS0ZtalJqK1oyYVZsaThLTy83cGpNZG04T09yYU5VZThvYVdiZnZT?=
 =?utf-8?B?RTZHWVdIQTQ3eGJ0Q3kwb0w1dEw0aGlrUEVnQU5VM3ZiMWVId1F3VjAzR2xy?=
 =?utf-8?B?QVBzdVozb3RzcUdld09RQ1NQRzZtdUQ1emNQbkJKZlY3cjYxV1dJbjIyQ1ZX?=
 =?utf-8?B?dGJ6MmRjQUFaNzNWaERlK0RjZTBnaEJhcGtIcDdTK0tCbkRoQ3NycUpjYm1Q?=
 =?utf-8?B?aEh6MTQvU3o3cWphbTY3Uk5ES3E5cC9BOFpxMCtjZFh5U3VLZEtZdzB2eSti?=
 =?utf-8?B?YzFLcmthN1hoNE0wQi9Ia0ZwZGxhOXNDaXJ5SlBJejlabUQrdkY2SWwxVUJT?=
 =?utf-8?B?Y3EyZVlUc1JlSjI5dlBpKys3Vlg2V1pPNHZBM2RNZ3ZQZUQvT2pFbnJxbEJl?=
 =?utf-8?B?MEorRy8zNWVTYXNhSkR6cXY5dWVXd0JwbE9tazBEa25CRHpMbXVoK1ZTKzRp?=
 =?utf-8?B?UEpiNWQ4NUZPVEV0RlNwNDVwcFQyeGdQS1JTZUJnRGN3UXBYZDFqYjVkV1Iy?=
 =?utf-8?B?b0o1OGNoTFdHWkFYYnY4QTBicktaazBGVXZGMnVrOFBNajYrZ2d1R0t5ZG44?=
 =?utf-8?B?QWNhemJEQkw5ait1Y2MvUzVJUHErTzF4NjlTdVpybnNOQ1JtR2NGb2luUGYz?=
 =?utf-8?B?bUpmVFBJdEJ0RFFKdEVONE11UlYrY2t4L0FxMGZTUE5lWHYxQ0NaZFEwZkxh?=
 =?utf-8?B?NXhDdExCUE1RR2xQcEVJU3lzYXhwd2xzbHJnWkVNalZKREZ0SnoybzFFS3Z3?=
 =?utf-8?B?TEQ0TGFIdkh0SGdWSXpYNGFRdm1qcjZDbkRuWnI0ZFBWMHBOVUxaQjJxNlpa?=
 =?utf-8?B?WUd0a1QwK0pjUVJ3TFpOZ0RyNkVzcXpqRk42d3paMU5semg0S3JWQTY0RE85?=
 =?utf-8?B?Wis1MTNsSWhocEpESzlaYWlRTEEzekFLZ3VxVlpVRFEvZzV6Q1dOSHZkTENF?=
 =?utf-8?B?RFBjb2c5M1lzRU1WOG16N3AzRitwZkFxUldGbUUxK0wrYzBqNVZjdWtIN1Y0?=
 =?utf-8?B?YnBhcDIzYTcydk85RUhYU3Y4enpsSi9xRSt2STZqWWpvem5XUnh6Y2VsVEEx?=
 =?utf-8?B?dk1sKzkyUjA0bHJ2VUN0MjgvTkQyUDZmTTR6NG50MGJPMGRJVENSVmFZaTFa?=
 =?utf-8?B?dTBIVzRCYmkzY0FzemxOWGFTcnErdnFrNWVlZHFXb0laVlczZzdQSTNKRXIr?=
 =?utf-8?B?OWMyWjhKWWdTblFDTGNsRVN4WUdMSmFMcm95YVJScHN0eDV2SmpSbUE2bjBN?=
 =?utf-8?B?aXA2U1hTNFhZa2pEZnpzUjRXeS9sOVBMTStkZm1UeGxZejQybUNOSjYyRVJG?=
 =?utf-8?B?a0FZN29lQXNiRmNWVXhuRTIvbzJwd3ZCSVR1NHViTFpCUkRDWkdMVTFuR2hJ?=
 =?utf-8?B?cGFac3hQZlNncjlYbiszbTNJVVJvYjREYUhlaGQ3V05LTGJOSzNXQVdRVFRL?=
 =?utf-8?B?TkdkMnRsYSsrb3BnRzVSQjl1VVZOZXF3UzNIRmRLV3cvZ0VpSkdHSDdYTXBy?=
 =?utf-8?B?bW5LTy9NZVhqam1IcklvVVlUaUtOMkF4OWw2cFlDRnVBaERFNmV2Wm5sdllv?=
 =?utf-8?Q?94NwyMAHdu4SVOScNeXSKjtkP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af0c9e5e-c866-40d7-ed5e-08daeeec5868
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 07:13:29.0716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNJEfzNFG404jJM3BrultHvqYsSpi3NM2znqVMuHwopIi5560B7s7OMf0AuCRhEVj3e8REbzagFmkSf5ZGW6Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8337

On 04.01.2023 21:04, Andrew Cooper wrote:
> On 21/12/2022 7:40 am, Jan Beulich wrote:
>> On 20.12.2022 21:56, Andrew Cooper wrote:
>>> On 20/12/2022 1:51 pm, Jan Beulich wrote:
>>>> On 16.12.2022 21:17, Andrew Cooper wrote:
>>>>> +        "mov    %[cr4], %%cr4\n\t"     /* CR4.PGE = 1 */
>>>>> +        : [cr4] "=&a" (tmp) /* Could be "r", but "a" makes better asm */
>>>>> +        : [cr3] "r" (__pa(idle_pg_table)),
>>>>> +          [pge] "i" (X86_CR4_PGE)
>>>>> +        : "memory" );
>>>> The removed stack copying worries me, to be honest. Yes, for local
>>>> variables of ours it doesn't matter because they are about to go out
>>>> of scope. But what if the compiler instantiates any for its own use,
>>>> e.g. ...
>>>>
>>>>> +    /*
>>>>> +     * End of the critical region.  Updates to locals and globals now work as
>>>>> +     * expected.
>>>>> +     *
>>>>> +     * Updates to local variables which have been spilled to the stack since
>>>>> +     * the memcpy() have been lost.  But we don't care, because they're all
>>>>> +     * going out of scope imminently.
>>>>> +     */
>>>>> +
>>>>> +    printk("New Xen image base address: %#lx\n", xen_phys_start);
>>>> ... the result of the address calculation for the string literal
>>>> here? Such auxiliary calculations can happen at any point in the
>>>> function, and won't necessarily (hence the example chosen) become
>>>> impossible for the compiler to do with the memory clobber in the
>>>> asm(). And while the string literal's address is likely cheap
>>>> enough to calculate right in the function invocation sequence (and
>>>> an option would also be to retain the printk() in the caller),
>>>> other instrumentation options could be undermined by this as well.
>>> Right now, the compiler is free to calculate the address of the string
>>> literal in a register, and move it the other side of the TLB flush. 
>>> This will work just fine.
>>>
>>> However, the compiler cannot now, or ever in the future, spill such a
>>> calculation to the stack.
>> I'm afraid the compiler's view at things is different: Whatever it puts
>> on the stack is viewed as virtual registers, unaffected by a memory
>> clobber (of course there can be effects resulting from uses of named
>> variables). Look at -O3 output of gcc12 (which is what I happened to
>> play with; I don't think it's overly version dependent) for this
>> (clearly contrived) piece of code:
>>
>> int __attribute__((const)) calc(int);
>>
>> int test(int i) {
>> 	int j = calc(i);
>>
>> 	asm("nopl %0" : "+m" (j));
>> 	asm("nopq %%rsp" ::: "memory", "ax", "cx", "dx", "bx", "bp", "si", "di",
>> 	                     "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15");
>> 	j = calc(i);
>> 	asm("nopl %0" :: "m" (j));
>>
>> 	return j;
>> }
>>
>> It instantiates a local on the stack for the result of calc(); it does
>> not re-invoke calc() a 2nd time. Which means the memory clobber in the
>> middle asm() does not affect that (and by implication: any) stack slot.
>>
>> Using godbolt I can also see that clang15 agrees with gcc12 in this
>> regard. I didn't bother trying other versions.
> 
> Well this is problematic, because it contradicts what we depend on
> asm("":::"memory") doing...

Does it? I'm unaware of instances where we use "memory" to deal with
local variables.

> https://godbolt.org/z/xeGMc3sM9
> 
> But I don't fully agree with the conclusions drawn by this example.
> 
> It only instantiates a local on the stack because you force a memory
> operand to satisfy the "m" constraints, not to satisfy the "memory"
> constraint.

Sure, all I wanted to show is that the compiler may make such
transformations. As said, the example is clearly contrived, but I
also didn't want to spend too much time on finding a yet better one.

> By declaring calc as const, you are permitting the compiler to make an
> explicit transformation to delete one of the calls, irrespective of
> anything else in the function.
> 
> It is weird that 'j' ends up taking two stack slots when would be
> absolutely fine for it to only have 1, and indeed this is what happens
> when you remove the first and third asm()'s.  It is these which force
> 'j' to be on the stack, not the memory clobber in the middle.
> 
> Observe that after commenting those two out, Clang transforms things to
> spill 'i' onto the stack, rather than 'j', and then tail-call calc() on
> the way out.  This is actually deleting the first calc() call, rather
> than the second.

Which would still demonstrate what I wanted to demonstrate - we can't
assume that "memory" guards against the use of stack locals by the
compiler.

Jan

