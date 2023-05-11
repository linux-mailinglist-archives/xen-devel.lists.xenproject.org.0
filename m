Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7331A6FF01A
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 12:47:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533232.829713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3ol-0007vC-Sb; Thu, 11 May 2023 10:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533232.829713; Thu, 11 May 2023 10:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3ol-0007sQ-PH; Thu, 11 May 2023 10:46:39 +0000
Received: by outflank-mailman (input) for mailman id 533232;
 Thu, 11 May 2023 10:46:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px3ok-0007S1-Fj
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 10:46:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a342c77-efe9-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 12:46:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7990.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 10:46:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 10:46:34 +0000
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
X-Inumbo-ID: 1a342c77-efe9-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNuysS6SdNsN77+YMh/rkxqDQml3LA2NxlUaIbwdJyh4udHOckciqYNziL80DEUrGsEsiWyxD6GOH2CcWgK+BPJ14F3OCxx+YVbljZS1E6hlxy6UlSQSRxzmTORNEV/gTu7gpnjcze0YKgjJrS3bYHTsWRg+FEijJzjGaco2bLBKrGaTUMPVbgPm4SVqlawXhWTnet3JkDbgs+w9qWeuOj9vV13FcmGEn3eAJkqzEBYkLzxSyJ6DA0bxD6lMKIL1tnBtJ9EALdVoS8ceUocClKZ97ON/ExUr6z2Q9lbX+n/xM3DuUb7k+oQ8x7jBoJW94hDksvSDf1GvNI319Grctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQ5tf7CFaSVWbnEx0H8pjapDEkk0kRg2kbkOZf7M6Q8=;
 b=iHI/I1u0mlmdG4oRHFSKgJe4FKbxvziYenh0tOpfQ4vU1OqZYsjFx25sNZ+vJu2sxPa6+BGXcEnmngmX6pyYEnkocMZxX9I6gmEqwNAV9l5b24ws0TjufUX8u5r899fJeDR1z8FIxLGL9rAU10fF7KLBCWVu6RRyV0qhlQLIJf295D2u0juGaV+0HZWWM1nzAvANyqi5hwjmidHvMfH/30QelGA9RKzYGrtydA/wNUVQBtBBx5NrHrtCdK+WxigzCk4+FVKIz4XITwhGIHAF/d9xHQmVwHhTw93hOOj5a1fA7OIdogTO6RzaDCNWn1cfVdEoOrJGrVvSVi/IsWjCEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQ5tf7CFaSVWbnEx0H8pjapDEkk0kRg2kbkOZf7M6Q8=;
 b=LQ0erhFkbjT9RKFYZpfhNCAs/whrOJU/w7ei2ikJiXjPSjv11OaiXwOuIohDBEJGFWhroxZwRle9nV5vp2tQp0dDbMUPNoMkwSad83mWx7cLSwSfV4wDBWYeHsmqvLFTFxMFIpxvAGBnha74WEzXqgI4+ZbRxHBPeY2vYVdfbt8bqJJpM8UTzjHyaHuzrITEMGcm8szvZ90WTL3ja8Zqwh8N7llmt4PgUA2OMBQb5e8sn21+3Q/yJLDyxsXmn1OYUY8OcI0RWOxmBhv62Z+JFcy1IdwpnIet4g0U2zl6vo8qeGEpPM/rIReRL/olt6JffqFxErnlBLkrufUsTbMpXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <afce6377-4681-a171-e422-a084e934595a@suse.com>
Date: Thu, 11 May 2023 12:46:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/3] x86: Add AMD's CpuidUserDis bit definitions
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
 <20230509164336.12523-2-alejandro.vallejo@cloud.com>
 <8995344d-cd14-d66b-efb6-e4ac7be6d457@suse.com>
 <645cc5a2.df0a0220.e9123.e022@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <645cc5a2.df0a0220.e9123.e022@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 66164bb9-ef77-4bab-5dd1-08db520cfd12
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HilS04ynMq8/yK4HUWVl3WV/dA3E5Ik8ryq/eNPhzBm3fpbOaFiGsa0Kj3iQnH4Fay+SxsQBhJUHIAJHvRZzO1CwwPJ70tbRPp4SB7lm2zNUY6JZj7SVMQCrr96X+o3rRqGt3VA6U8HKdrVetT62HyIDmIQF5jyeeyQbGZsA82miZiASKCOLnhNmYdu2mJw8lm0iBOkIkVi0vWqSTjHxKuQ9UU0SLzjePb+hZmrj7jPfmLde0PpV8vj27z5+GzEUqp8rjk361TDhHyxK2KRVcCMLKpYYiqlHH3/fvtTM/3woZ3B2dSqdy4Vl1eMrDHU8eFgPTVVqG8DBb6OioFrKIoOzgtxJFmU3iZMlMxE8C57rjat0dNdNPH5Xk2tqwgHDkAd6pb3r1VOEJLcMJ8MDrItsLjm3ONNEbBpmOO3hYwEPxhKRmx2VdbRWgz8zmI/kTAvtCuMIwvmv3gJ+6HnxwfGY9/jJhv+P1WHAh71ThvKgMZnGBIg0ZgeUPeRDaOrfTtvLZzQzpzcj+lf4FGJYZuZWYKd8VjTbzti+oJvv1SiGmIvNiNfkmj9iCqG9pPOGpXT4/sY1029ssDb8n5fOIE2+ZtqzmV+1PPbyoeRFHYG/SuTyBs6WOeHt7uyGGEbcKWLds76ADhEsuIEkX+Fx1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199021)(66556008)(6916009)(66946007)(4326008)(478600001)(316002)(31696002)(86362001)(66476007)(54906003)(36756003)(66899021)(31686004)(2906002)(2616005)(186003)(6486002)(83380400001)(41300700001)(6506007)(8936002)(5660300002)(53546011)(8676002)(6512007)(38100700002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzcrQUZ6QzlCOURrVjQxNGtZcEMwSWUvdVRwTXdWdEJTOU9NS2k1UEdqQWkv?=
 =?utf-8?B?RmVCNm9KSzJka1V2M01CeUJmUFRtMm9TNWw5V0N3bkNrTkRPcU5XOWxGYmh1?=
 =?utf-8?B?c1lNRjFMS2ppc0hhYk5CWnRUcTRBWmVwTG9sSWg4QXVuTVZTR3VEM2ZJdHJY?=
 =?utf-8?B?Z3RaZnRGMzNiTDdyQ3BUNnYrUzAwa09pTXlnZjVlUlAyRFJQWk1vcHlhQ1g2?=
 =?utf-8?B?RW1GOTBBYzBHU1hWR0ZsQmFJdXpNZzNtQWF2a3NRb1JMZWhjNzVMMEwwR1BK?=
 =?utf-8?B?S05Oai9Wb1U3WGp1SVY4OGQ4M1JpK2dZcFBGcElqTXFkMWpFMHYvM0l1aUtu?=
 =?utf-8?B?Qnk4R3ZhNnpXRG80QXNLODRlSERnMnhvcEMvWTNhOTVNUmdWOEtWR3o2NzI5?=
 =?utf-8?B?MHUxMTRKcFFoT24rcUpxSUsrZjFjbC83dk5IT3BaOE5zaS9VVmptTW5iRXdZ?=
 =?utf-8?B?UTRGWTh6OUNISGJBazNVOC9YR21kVmFxZk5ZMWFNalFyVWV1VHFESDBzMTRi?=
 =?utf-8?B?dEVBTjh5bXBZTm5RUWxnQ0FXRFhUaDd4MngwOGtIeFAzczJVazNXbTVlOUFl?=
 =?utf-8?B?QW5oY1JwQnRsL2YrdWZQM1JINDFLVGNBNTl2VVJacWZRQ2pKV040T0tvTWor?=
 =?utf-8?B?cGQ5VHllWSs0dkw3YkppYWVNTTFOQ2s3ZEFIR2RCYVI2NlRjOEVmUGN5MWls?=
 =?utf-8?B?aTBDYThUeEtVcStrVmZUVUdiaUtpZUtURlNuUTByMHVUSUE0TFBzSk5PMWY1?=
 =?utf-8?B?NEdPbVBqWGlYNWxBN0NSbnE0VWdFaittdUc4VjJPcUV4ZkVEMmcwVlQzNmcx?=
 =?utf-8?B?OGQ1KzFYVHMyUTU2Y2JCZlBndnNVa2tGMDlzRE5jcjhPcHo0L3lveGZmUzlu?=
 =?utf-8?B?TFVVeHN6dmZaK204cncyMzBSc25STWJRS2l5RExwZGlocjZ0ZkE0UFJoclRv?=
 =?utf-8?B?QldpOTZ1Tnp3cHUyVXVIZkNRN0hIdkJlUnRMa3BRajFndFZhVU1UTFA2WUp4?=
 =?utf-8?B?VC9RaU5ZMUZUMDBHTjB6cGVSSzl6UGNLMTI1eUVUWmgvL1hRb1NteGR6TTdm?=
 =?utf-8?B?bzFXTDBGNm9HNTlnNGZzUmZSNUVkTlUzQmJHSDZTWWNUS1NWdEJjUERSTWg1?=
 =?utf-8?B?K2lzc3hMaHRrZFhPMDFrMGVBQ3VUeHBBRDVtMjdFcjgrb24yNW16eis5UXo1?=
 =?utf-8?B?OXU1VkFVZUljY3pXSEQrcnR3cTlhdU9XZmJ6ODhsaXplSFNyaHBHbFh3RHoy?=
 =?utf-8?B?c2RIVVd3TjVsM3VCSUN0bUduRDFRcE14MC9kK0J3dHhTVVZLWmhrMWkrZkZ3?=
 =?utf-8?B?UmNVbmZJYnFKcW9nYmZKdEV2VjVhSDdDc1N0dUtGWGdmZTZ4bnMzcVV0UGpH?=
 =?utf-8?B?ZXVLMUF1UklpL1ZZYktLanhtNlR1aTdMVWxEdStFWlh2UFdiYzNoeklHSGxP?=
 =?utf-8?B?TlZYbFI3MGJwVitaaGVPd3dMRUNaMU1qODBDZlZMZFpwWmtSc3hLdzBLbkw0?=
 =?utf-8?B?RU1qMUdodWFQbHpxUDRKR2pScnVHekJLMmIrSGdadnQ4TkhUNlU4SDlEN0Nz?=
 =?utf-8?B?dDQ3djVSWUpXUVRhaWIybkgyVnVuVDE0bmFEeitKaUVjZE9LSkMwcjg5NGZK?=
 =?utf-8?B?VHFUMEx2dzJsSzIxYkpkMmhiVWhsWlgxVmhpNGtTK0hYZENrZ3ZXNndEVzVC?=
 =?utf-8?B?WnB3RFdsVDZIUlREa3dGak54U2p5ZXJWdjMwNWk3eXo3OTg1SjRicmRUTVhS?=
 =?utf-8?B?dFk1NFovdG43TENrVDdsK0dGMmlzWEVRemFaMXBqaXpjRDNLNi9kVGtFM3I3?=
 =?utf-8?B?MDRIWUUzS1gycDV6ZnUvOHNPVWx6bjNTekh1N1RuTDJ5dlRCR3VoR1EvS2FJ?=
 =?utf-8?B?VUdKZ3dwem96a1lib2NET2QwaFJBenp1YVRTWWg5THR1S0VtbHoxUml4M0pP?=
 =?utf-8?B?Vy9Sa2RxTWR4dWRaQ1RqRUxtYjY5cmR0SUNoOExXUlpzeWgzNDdreUhPUmRw?=
 =?utf-8?B?QlozZEEwWGUvQmM1L1ZISy8rZGhTem44cURueHp5dmtUaHpkdVkrQ3R4K0tI?=
 =?utf-8?B?K2FkWTBja1Y0S0ZpZFpvcHdJN3lpQVBtME9obWxLY2tDQlhvZzZxTllzSlB2?=
 =?utf-8?Q?imzjEVvPQq4Dzo9+GGe4nTc/0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66164bb9-ef77-4bab-5dd1-08db520cfd12
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 10:46:34.4153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgVLJHPMvDENXClJtsb53WaeKVvp69eJkUbUuN8sE0x6XaGExke3fWRtAarY2vgQkdrp+JW39KcDDqXVFGlU0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7990

On 11.05.2023 12:38, Alejandro Vallejo wrote:
> On Thu, May 11, 2023 at 11:41:13AM +0200, Jan Beulich wrote:
>> On 09.05.2023 18:43, Alejandro Vallejo wrote:
>>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>>> @@ -287,6 +287,7 @@ XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
>>>  /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
>>>  XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
>>>  XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
>>> +XEN_CPUFEATURE(CPUID_USER_DIS,     11*32+17) /*   CPUID disable for non-privileged software */
>>
>> While I can accept your argument towards staying close to AMD's doc
>> with the name, I'd really like to ask that the comment then be
>> disambiguated: "non-privileged" is more likely mean CPL=3 than all
>> of CPL>0. Since "not fully privileged" is getting a little long,
>> maybe indeed say "CPL > 0 software"? [...]
> 
> Fair point. That was copied from AMD's PM, but there's no good reason to
> keep it that way. I'll modify it as you pointed out.
> 
>> I would then offer you my R-b,
>> if only I could find proof of the HWCR bit being bit 35. The PM
>> mentions it only by name, and the PPRs I've checked all have it
>> marked reserved.
> 
> It is in the Vol2 of the PM. Section 3.2.10 on the HWCR. I'm looking at
> revision 4.06, from January 2023.

Oh, my fault then: It didn't even occur to me to check Vol 2, as normally
it's the other way around: Only the PPRs can be sufficiently relied upon
to be at least halfway complete.

With the comment adjustment (which I'd also be okay to do while committing)
then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

