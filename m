Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D1A7CBBA8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 08:47:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618059.961298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdrA-0006eN-Sq; Tue, 17 Oct 2023 06:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618059.961298; Tue, 17 Oct 2023 06:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdrA-0006bL-P4; Tue, 17 Oct 2023 06:47:08 +0000
Received: by outflank-mailman (input) for mailman id 618059;
 Tue, 17 Oct 2023 06:47:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsdr9-0006bF-K4
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 06:47:07 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20607.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbf10a1a-6cb8-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 08:47:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7472.eurprd04.prod.outlook.com (2603:10a6:800:1b2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 06:46:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 06:46:59 +0000
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
X-Inumbo-ID: fbf10a1a-6cb8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfPsCVvNTJsOU1e+HqGzYnPnxzW5w2Fv4O1kwf/mfUZWbsK0A7LPwxPKI03IBxtnJp8+KJJiS3Y0XfIvjkLD+toCxpuCfUgO7xHyNPjPjhqx/6dircCeaFHI7IGklHGlcFKE1enVuUxPjua3n8XRonHghPcy/lJMS8qjlSv5V0NkL1lNyA9ekAGKF4cQfb+Q3ldrTuIySZWYIRuDTcPhe6KnjTxe7PU8yEtXQ5yEWAd/7nMhnfYXy1qJjt+VoVtkp9Xl8o0fW98KOoxHGPYhT/i1GBifL+ULAtws0UK3jH0wZm08rfJL+nIarGwK5b6SgUIys6eqBpKGDEvJH83MdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pzti7Z3D0W28wY0DXu9LtuFyp4ivGka5hAVb6E3toPY=;
 b=lfo5RpDhsgbqMdcV93yLya9KAlavEj4qp4kDwDvdroYVhdV+BMRmzQ44AmLiHZqFJXWAvtDP2IBnR8VTCtQP++Y+WgOdRSe+aA7akP0UnW7bpuO8QrBRlmETPZegvin56O6HBRDHCjzih3bqeIEpnK7pMcOAroLX8L/9inAxvEKEZVgq/tAgcagOvCJarDy7L1+tIaxvfdiHMdXkk08s0QcU+AzA+SdctlnTX5c+CQ0UNMBvxUkL+hL7jxaM6sp0eCzN/uOj+9l5vCeXrotIk7QyFDdvghs+Tjo+dsefgl6G3Yy198eMVUTQMaTEINNtlxYjDor//p6/BEz9evZwww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pzti7Z3D0W28wY0DXu9LtuFyp4ivGka5hAVb6E3toPY=;
 b=aya4Q22l6h0rXcjW7dSkGx9kxHpt5VJnUjxiM2XvtltLyMUMInKlZyUBUvISuAYMBEp+p66JGLqtrXsSBSJIVB/N88rL4VYNHpx9rjBEb51qv//Cpw1LtEv/USwMyH2i1AmLBirw/uW3TsR7fqE4WtfLGeZYZ96g7YJ9k5M6aKhAioL9tiPVU1RoQ4M/FIrD4oQk/HrsB81fj1hFFq9jEydAnq+NeP3jLBcRQlvjFC+K+mKahEWOf0p/8y0QPn0o6MqOCSuQnB/R0QWV8fBp6s6UrDVFFqRHOqY80vCjZm5TAVQzihtdUnK6YvqIqyfuCg+h5ubxiYnodWUs2CUAMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5e8e3cb-056b-063d-8f6f-d3f68bdf1750@suse.com>
Date: Tue, 17 Oct 2023 08:46:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 1/7] xen: add declarations for variables where
 needed
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <002d58b1d15619a8c4b2ec6c2b5f20960ed0a428.1696833629.git.nicola.vetrini@bugseng.com>
 <2023f16b-46fb-2a19-9620-7872b3029b5f@suse.com>
 <f89fc0b2814cc4b84abc431c0355b348@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f89fc0b2814cc4b84abc431c0355b348@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a15997-6dce-4504-244c-08dbcedcdc51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EQvlFU+2mn6nBtxN6eLsZkd4t/kqcl8lwFn22eo9eUmVwCYt3lvVo+3NrKO1VT9idWvRn6o0i0LswHcPHeTwPuWJtAA48Q9kNIFNPHxkaTbWNAChUP/q90XMPDFW1aH65RPll1LhMj1LlcynVNLdM7Hj11bA8i02nsVAHtj/CdXLwYnrjL0Y9Kr1AmkGqtxMARN3Y1wfoX14qp9IVVuC/W0glrPREzaxwxrRIUasqLzxCyxcheUHhbRwIWY2RlNbzf1rq8jN6vrAdLePWeTl3zF0M9y2xN2yrAc5gITNta+OBnBAO5vQUrhdiKdWTbDA2cToW+KPgUGKoeMIdLVQbsfosnd1raaNBOQj1y8bmyESd2q/PV2SW7T2Cg35g5k/kK9xnYsPU3VlJgXQVyptu/KQsFqrKDRdP5SA9gH0l63IKgundnuVWJbrqzFoXajqsNO6e4UmHSbJkT2ZFzs56K1kSwsTRNu4v7drakyXKowjvbMTAH+7xX84utI1fEH8sWRdjU6PJ09ITEeTeDtzEZeYC9ElNTRaOTvJ5i/7DUd+LG2O1bGOT2Xw13HQTn3xtgUMvk1INe1U60bmyQZvWrWGaKnJL0RFuvReMGbN4snMWO+rOoONx6z1jEzCOziibFQxecutVhLJMiOXja9w8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(376002)(366004)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6916009)(316002)(66946007)(54906003)(66556008)(36756003)(53546011)(83380400001)(6512007)(38100700002)(86362001)(31696002)(2616005)(478600001)(6486002)(6666004)(6506007)(66476007)(41300700001)(5660300002)(26005)(31686004)(2906002)(7416002)(8676002)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEE5RmtJRUtkYlRLYWpmT2piczJOVHRXT05iRVFpbWlkK0pGUWVFb3RsMXRU?=
 =?utf-8?B?Ylk0Q3RMMnJCNUpSZk56WnB1ZWtyNmdmbUZtNVBRbExNdXlBUlpjT3lVSTNP?=
 =?utf-8?B?K0tna2pzZzNkUDJIV0JZSUd5V1lVaVZ4Nzd5VUcyRFFiYUhMa0FpSXNKaWxm?=
 =?utf-8?B?TVZ1cy92MEs0VEtJS3BtaVY4L1NFdDlhWUdFQ2JrR2RKMWtKUDMwbzlzRGpH?=
 =?utf-8?B?UG9jN1VONXNxNTh2SWdWQndHUGQ3ZmpENkJSZ0V1NXYwL1hMSzJvS0RYMnV6?=
 =?utf-8?B?aE90WVRLeGRUK1Zody96MFdTOHZ6OUpObXMvRGk3eVpPRVhFdXRkSktSaVpl?=
 =?utf-8?B?dkYxOG5JazNBVyttK3ZnOVlaVndYTGNFT1o2L3FVU0xuTlZZSUExK0dHZ3Yr?=
 =?utf-8?B?TENkYk52c1ZndHVWSGk0bFhlb0tkVytLT0ZweWdhd3NzTVNUeTc5eGs1WnE1?=
 =?utf-8?B?d21pWDF4NE1WR0JwWVFuT0pyeFc1aExyY0hyU05BQnNWL3NYd1RQd2oxN0I5?=
 =?utf-8?B?WjVhaWM0UThOR013K1g0RkErSUVkdzRPVE4yZXFRY2EzdkVCbWplajU3ZEtY?=
 =?utf-8?B?R3BQRndJZ0pwcy9xV1lXYkNpckNBbVRyWEJBTGpNZGFCSUZvdVRyNjFRcHM2?=
 =?utf-8?B?bytvUk11VUV0dGNDNGFuanZWbFNVTEdDWFFEWWl6OTBmd09SWTBDVVZOTUNS?=
 =?utf-8?B?cUVLTFp5V3cxdUNtK2M2QVQxMkVvMW11bFpNYjdsZkhTbitWcDF4ZUNkSTNX?=
 =?utf-8?B?MU9waFlNZWdHdG0zb1ZqOEF5b3IwMmxaQ1A4WVlEL0MzMkV3RVgraE1wWFJR?=
 =?utf-8?B?OFhMVkpZa1g5a3JEWlBUSjNaMmFBSCtiZnA1UWNuMzByTGlNLzVzMytCZEV3?=
 =?utf-8?B?UlF2bzJCeXJ3NHgrZktwamJmOHJwNkZGK1JRTzNSZnZUYkIvLzcyVFBRZms2?=
 =?utf-8?B?eUJycWRRQ1lQYmlMSHVpU2gzenZFUVRnZklvZnZ4WVJMMXprSzVla3F0R3M4?=
 =?utf-8?B?Z21yMmpJV0xiMnpPYndVWFZZY290b3o5dmJCOHBmWUJPbHN3WkpSY0FBOUQr?=
 =?utf-8?B?UThkK3lDUE15ZUtkU1VaZjd3VmJmZlVmd0xHSE5ISmswbW05eWdNdFlydnhF?=
 =?utf-8?B?aDZSNlhLa2gwRFV0S2wyTVZLOW5nSXUzRkx4T2ROcXltY2cxY1VZMk53YUtX?=
 =?utf-8?B?NWZTVmRzOTNWQ0ZST1Q4S3ZhYUwwbTZFTEVtQTVGZ1Q4cDhBMG1oKzY4bVJv?=
 =?utf-8?B?azZNMkRKUHlSRjFOSE1kcm4wMXNNT3U3VFB2OE9qTVBEL0VsK1RjSW5ZeDZF?=
 =?utf-8?B?eGQxYkFyQkV1SDFWQUpSTFAzOU1JODRHWVhrS2hiSFFtWGdqZHZnZlB2U0h2?=
 =?utf-8?B?RWRubkJtWXVmN0hNL1A2eVRmSlpWVG9tV1NWekRpMlMyUDQwbjdTVWZSWFQw?=
 =?utf-8?B?d09CUFExL2ZmM1pVNEdpME1Lc0p3bEFza29TZWNNUDBtbWUwV2lsREdGeE43?=
 =?utf-8?B?VU92OTRibytlcVFGREEyTmpkZTAxYlFTUjNrWGlPbHVUa0x4VVV1MUpNeU5X?=
 =?utf-8?B?TXNNRWxoQlhHajc5VzNGWVlKR2JTTzg5UDhDWGVmUWVKVzB0aVlQb3lBaVZ6?=
 =?utf-8?B?ai9vN0hKbytPM1N0Vk1qS1AvOFJGNHhaNGt3YWJlTGRMcXZQSW5yOXhvWTFW?=
 =?utf-8?B?cFFuUkZHTkRMNHFXSUc5dkM0cnA3RFl2aU9PaEZCalBOQjI1UUZ5OEpYMzJi?=
 =?utf-8?B?SEY2UGdyMzZkTG4yQjd3d1hPaDhVa3BsWjRjNFhyTnpKUjYwNkxhU3V1bS8v?=
 =?utf-8?B?ZXkvalcwbzJ3UTU1eE1WYUFidDhPeUc3YVptZk1qdmhrRWc4NkVudS8rdWF2?=
 =?utf-8?B?RDgwaUs5UTZvRGFpVWo5eElzaFdrYjZnZmFHQ1hrY05ldnJBbG5IU090MjJG?=
 =?utf-8?B?WHIyK2l0OFpsRXl6YjdqT3g1d0lMdkNHcFpBV3R3RFlOdi9JS2dsSGtCZ0xY?=
 =?utf-8?B?S21FWFlwODVSWmVWVjJsVVFpdHI2dVpvSG9IcG00SzAvWmoyMGtUR1RQL3Jp?=
 =?utf-8?B?aXI2NG5zb1FRd0hBQTlZS2VDajVoMUQ4ODhDSkhLbmJZQ1R3NXgzYUJyemV1?=
 =?utf-8?Q?gui/6MpsACy2tx5yl+RSK1abv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a15997-6dce-4504-244c-08dbcedcdc51
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 06:46:59.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FFMsyenEN085FSoxTIBkbmnCEM2ApACd2CiQUOZANMM7j5BlLAVEMTeq3ksOnofRE1iKh4GtJ1Mz2PzS4XPVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7472

On 16.10.2023 19:05, Nicola Vetrini wrote:
> On 16/10/2023 16:50, Jan Beulich wrote:
>> On 09.10.2023 08:54, Nicola Vetrini wrote:
>>> --- a/xen/arch/x86/include/asm/compat.h
>>> +++ b/xen/arch/x86/include/asm/compat.h
>>> @@ -13,6 +13,7 @@ typedef unsigned long full_ptr_t;
>>>
>>>  struct domain;
>>>  #ifdef CONFIG_PV32
>>> +extern unsigned long cr4_pv32_mask;
>>
>> Why is this needed? Didn't we say declarations aren't needed when the
>> only consumer is assembly code? (I also wonder how this header is any
>> more "appropriate" - see the changelog entry - than about any other
>> one.)
>>
> 
> It was pointed out to me [1] that compat.h might be more appropriate 
> than setup.h
> (probably because the asm code referencing it is under x86_64/compat).

Hmm. I agree setup.h isn't appropriate.

> Further, while it's true that this variable is used in asm, it's also 
> used in x86/setup.c, hence
> the need for a declaration.

But that's the file where the variable is defined. IOW no risk of
definition and (non-existing) declaration going out of sync.

>>> --- a/xen/arch/x86/include/asm/setup.h
>>> +++ b/xen/arch/x86/include/asm/setup.h
>>> @@ -13,6 +13,7 @@ extern char __2M_rwdata_start[], __2M_rwdata_end[];
>>>  extern unsigned long xenheap_initial_phys_start;
>>>  extern uint64_t boot_tsc_stamp;
>>>
>>> +extern char cpu0_stack[STACK_SIZE];
>>
>> Same question here.
>>
> 
> This one is a bit more nuanced (I wouldn't oppose deviating this), but 
> there is indeed one use.

Still same here then.

>>> --- a/xen/common/symbols.c
>>> +++ b/xen/common/symbols.c
>>> @@ -21,23 +21,6 @@
>>>  #include <xen/guest_access.h>
>>>  #include <xen/errno.h>
>>>
>>> -#ifdef SYMBOLS_ORIGIN
>>> -extern const unsigned int symbols_offsets[];
>>> -#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
>>> -#else
>>> -extern const unsigned long symbols_addresses[];
>>> -#define symbols_address(n) symbols_addresses[n]
>>> -#endif
>>> -extern const unsigned int symbols_num_syms;
>>> -extern const u8 symbols_names[];
>>> -
>>> -extern const struct symbol_offset symbols_sorted_offsets[];
>>> -
>>> -extern const u8 symbols_token_table[];
>>> -extern const u16 symbols_token_index[];
>>> -
>>> -extern const unsigned int symbols_markers[];
>>> -
>>>  /* expand a compressed symbol data into the resulting uncompressed 
>>> string,
>>>     given the offset to where the symbol is in the compressed stream 
>>> */
>>>  static unsigned int symbols_expand_symbol(unsigned int off, char 
>>> *result)
>>> --- a/xen/include/xen/symbols.h
>>> +++ b/xen/include/xen/symbols.h
>>> @@ -33,4 +33,22 @@ struct symbol_offset {
>>>      uint32_t stream; /* .. in the compressed stream.*/
>>>      uint32_t addr;   /* .. and in the fixed size address array. */
>>>  };
>>> +
>>> +#ifdef SYMBOLS_ORIGIN
>>> +extern const unsigned int symbols_offsets[];
>>> +#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
>>> +#else
>>> +extern const unsigned long symbols_addresses[];
>>> +#define symbols_address(n) symbols_addresses[n]
>>> +#endif
>>> +extern const unsigned int symbols_num_syms;
>>> +extern const u8 symbols_names[];
>>> +
>>> +extern const struct symbol_offset symbols_sorted_offsets[];
>>> +
>>> +extern const u8 symbols_token_table[];
>>> +extern const u16 symbols_token_index[];
>>> +
>>> +extern const unsigned int symbols_markers[];
>>> +
>>>  #endif /*_XEN_SYMBOLS_H*/
>>
>> This change is even less clear to me: The producer is assembly code,
>> and the consumer already had appropriate declarations. Why would we
>> want to increase the scope of their visibility?
> 
> The missing decls are about common/symbols-dummy.c. Xen can choose that 
> this file does
> not need to conform (to this guideline or any guideline), in which case 
> this change can be dropped.

Since symbols-dummy.c isn't used in the final binary, I'd prefer that.
Otherwise imo a new private header used by just the two files would want
introducing, to keep exposure limited.

Jan

