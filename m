Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD90971808E
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 14:56:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541775.844864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4LNU-0002l6-EW; Wed, 31 May 2023 12:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541775.844864; Wed, 31 May 2023 12:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4LNU-0002iN-Ag; Wed, 31 May 2023 12:56:36 +0000
Received: by outflank-mailman (input) for mailman id 541775;
 Wed, 31 May 2023 12:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VTAn=BU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4LNS-0002iH-Rf
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 12:56:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9123c723-ffb2-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 14:56:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7457.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 12:56:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 12:56:01 +0000
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
X-Inumbo-ID: 9123c723-ffb2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZIfooylHcdMNY/Ys6N0MOoDVyJ+Pi3zIlsbgwWz0fVI4eDdzvXofGbIz2L/NqpV/qw3quySZkGoJyaJZL+CQVjunUpzShRBX+IlciLEEhTM/my/MJrjAI62EP+t9Wwis9BgMKjqg39Ic4Reizjsr+eKdML/7s1r00azsRkreTWHRz5MtYo8W1Idb5ZWpZVc049iiEGZRmXDAQekiVGUpbjHy72h89DzhM0zgRq97+3cDLraJAxx5jE2q/9XY7HTAgIKZLTo3edQEGRRR5erFAVZViXHVohW1pnpgm9iftYQ2oMnsnSXrdot9/TkddYsIEgfPbJcJFK9Uzo3Pumg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eibG4ODoHhSIit3N/ADLUkJ1CVVZUjtrmS789JHSSV8=;
 b=cg34yxr/PLZQJZlxreICD6Y5U1Jc3cNpHX850BHgcmrQOK4y1Dn68JRdfu9SoZE5mM1MBLvpkJePr6ZP7EjD366u239blryB4EUAP8ZijKCMDBlNFitMdGg7Jh6SvmAs2jp0ou50ozL4f0jkDNCWmXS9sGkGrQlgJqTLVPwZo6d9R6kLQNeFvhJifqfQ/4yWNNAig2Js58LJ2cr5Ob7BYEJ0w2tqqap8cR6NRY7rBUkU7MubjcgnrMvUWIln+YPVaCkOpVsTieNhR+QoeLufW19VTXFPV6SknJLZ2xHeowYGMix+2ANOtjkSN+EzXVU8TTgt2qwe8DMIWjnoMFFyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eibG4ODoHhSIit3N/ADLUkJ1CVVZUjtrmS789JHSSV8=;
 b=Y90B/SNiCqSS31llvMPvOnmLlIVXi3tWI+MCyZXWvKObPjoTCdg7n2Dpe3TBCY3jKAleYYqyB5qiapAg3JgV8W98qRR+kpZv0mZj2kg+hI9lMDmnCwlpm2Itkt3uRQLuPc3kTJQhBULrOHBnY3K48iJj473TqgS18uzmTJHsMLubFlsMyByFfyl7y63KmjRkDheX7R5VEpiDHIkW4im+Qq5OZyoF/WX3VqNhTdnl8A4t2oFh1CldUuEItYg+EyL1e64KGZqZd5RQNOnjpL0W8JYyjLyeNQtS3yYyJMA3Ov6CVS5Eob8HYd9vqQW0Zl6ZCsWgLm65WZdEUQBsVxIrBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46f2bed8-f592-acf7-4506-dd1558433716@suse.com>
Date: Wed, 31 May 2023 14:55:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 5/6] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1685359848.git.oleksii.kurochko@gmail.com>
 <bd2dd42c778714f25e7e98f74ff5e98eee1cd0a5.1685359848.git.oleksii.kurochko@gmail.com>
 <92580a6f-e97a-c4a9-435c-bd95a84d4306@suse.com>
 <f3bf3a483f7282eb365cf04f27e1c7a4e84f5aae.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f3bf3a483f7282eb365cf04f27e1c7a4e84f5aae.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e0de26-075e-410e-3737-08db61d662dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pi/EZOiaHri4zDbDWy/iihiH5hjxwrv26o7l/ggaMtBvR7ef7fvT6HodwNOLLR1+zYnplr8sQIkuvrBKtSbYcV5YRrwz7qMcMjtTpD01sKAXt7M3yPPMBMofGrMeBFH7PKb469h0Vs2LJZX9S63K6XaTzNXJZXWV92daKzb9OOdJsB5QCA0O1V28dbLcI/Q92Z6COjC6cZWlM88jKNZJVs3o+ES0MmCK574iuBrvgQw7sbHRdSgpjhaz+zN5yjELw2xu4QgZqkk9s8majZ0dxrDMqzng1BzW+oOOqj85aAMlihN1ouhHw7yX5IxYtl4ov/Fy6G8L1Yfwlqu3+gUBtW0FGWefyomq4rRJlP/Mo+BQOZoCK6Ebj47Vg0xMCP6eTZVS0LLDsmMNMNCL4/UzPyjZ1ycpY7SDATwdrgedWXg+jIGY+miydcABgHDHul2BpF+uF0B+1pkE4xKAlVlyTVpWX026Un0UnTjv+UoW7+cM85Zvm2UGszjQgQ/khoT3fWDPEEEve/DpTuc42E62Aqst2OG4qLNhEXdO7KrhZW0mVtBG0B77C+SocjEsbWwk8zRHiMPP9ZB/p9z3UoUBoV4EEhcJXf+BkPLWy1iwflPuCbvN7rytN96mhpeQmmYFAXcP202BywZyzo9mqWSMcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199021)(31686004)(5660300002)(54906003)(41300700001)(8676002)(8936002)(6486002)(26005)(186003)(66899021)(53546011)(4326008)(6916009)(66946007)(66556008)(66476007)(478600001)(316002)(6506007)(6512007)(2616005)(2906002)(83380400001)(38100700002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHlORmZxUnJIZVBVaXZxRXBXWlhraE5jbitEZmN2ZVY2aDhDaWNEcWRRQXhp?=
 =?utf-8?B?UER0MDdDanRJYVMxQk1hTUp1S1RSK2p0VUNoTHFONGlNQ05HNFdZNXFqNEQv?=
 =?utf-8?B?T2IrNHR1bUZDYldFUUw2eHFseDkzdGkwYWp6aTVibTdQMTVKOEdZb2dyYjQv?=
 =?utf-8?B?K0F1KzErOStpazlNcmhoQ3NuSFNTMm5pL3kwYzI4ODNoSm16QnNaNWEvb2Vk?=
 =?utf-8?B?TWRVVkdHaXVsQWZ2blVpU2RIM0R2Zmo0eitwK3FSc2NUZ3BXeGdxRFR4VCtv?=
 =?utf-8?B?aTFaMmt1empzUDgxMDdDbUVxTCt2MnhDN3ZYb0dJdFJpaTBaL3QwNm9US1h4?=
 =?utf-8?B?RG5EOWhNTjkvY1NUNHExMVA1YWEydnF3b3dFQWNmemw3cFJHQWJOZSs1UzFr?=
 =?utf-8?B?alo3RTBIRlo0MDFnMUNhVHFGY2NYT2M3Z0Y3eWxEQ3ZUVXhxaVFoQlV3NlAv?=
 =?utf-8?B?bTgwc1NZN2xGL2kxRWtEb0IyVjF5by9NMVRQK0JLNkM2ZVVRVCtQd3E3RWQx?=
 =?utf-8?B?VEF2L2IwMU4vSFYzSEIrOWY4VEM1ZGFtMEE0SE9UZGFXYU9mOVlmZEZGamxU?=
 =?utf-8?B?N2FiRVZ0U3dFYm1PNVN1UzROd2lwcjZiKzNSWURIMFRMOFZDc0hlb09TZm1F?=
 =?utf-8?B?K2RDb1VkZ0Z6Ty80RzZkTTVscVdxWTh4TXp4TVdlYXpNUXIwdU00Qi9Fby94?=
 =?utf-8?B?amFYY2Q5aFFEVWd0endaRnBuY0o2cC9sV0NubGpaYXdWdEJZVlBnc1hVMUdN?=
 =?utf-8?B?b081eHROeUNOY3VVbTBnL1RxOGtqd3FuOUpnb2dMSGhwYko4STJZVnNDdkph?=
 =?utf-8?B?bzZLWE5CdDRBMkk4U0VrSWwzekQwcE9FQjRObkxIQlpsL0hVV3lpZjhiRHA3?=
 =?utf-8?B?L0E0UlpkSWtQTFJiVWdEQmd5WlRFaVdOR011ejA0ak43WUo3Z1A1c2xsZ3dh?=
 =?utf-8?B?NnJjOGFXc3dhSmErRUFvd2xnbjlOdHQ3alpiTHB1NGt0STg4ZFNvTHRMMUN0?=
 =?utf-8?B?THVZNVQyaUdtNTEzTnRNNjV1SHI0NXJ6WXIrNVg0aWhLd01xdHFJRGVLdFJy?=
 =?utf-8?B?ZkNxczNJa0NweDlGU3FISU1hOURPQVRPMkYxUUNXK3M5Mi9kQmt4cUVndlpn?=
 =?utf-8?B?aTE1cFN1WUU2aUt5TjM0T1p3RFd6c09CMEtSWjJHTW5mSHA0UVdkOGdrdmNr?=
 =?utf-8?B?M3hHTVgvUW4zL0V1My8wdmMyUjBSbVN2TGhPUlFJWnE2aDlxdERjSjNGeCtO?=
 =?utf-8?B?aGhxa3dITnhyOWV1N0dxUlJJSFJ5RDlYOEsza2lNZkV3Y2x2N25QV2Z4TE8r?=
 =?utf-8?B?SllYUjhPalZ0TGlHcTh6ZGp6UVJ6Yk11NTV1UlZLQ3AzRHhXdUowaWxnTmxB?=
 =?utf-8?B?S242UlBVVFNIWWJMNFlDS29RczMveTBaTHNXMlRuMkFSRXArYjNsc1ROVEIw?=
 =?utf-8?B?WWtYbHBiamR5ZzY0QlBoakEwSEg5ZWpaY2RrU25GKy9iTlJiZFJEZXVQdVZV?=
 =?utf-8?B?NnYwRFh2YzhMSzRGNExxVWpROVF2Y2pqRXViSUVGUFB4SlNpL1l4Ym9oVkdr?=
 =?utf-8?B?OTNDVDhRT3V5YWVnQ1J5YmprT0tDN0sxZlhNU21GYUpLN1U2ZHB0S1luUm1p?=
 =?utf-8?B?Q0ZndFh5MWJmcUoxYS9BVWhVa3p6SllZVTJWOTEwR0NnNE03Mm5QS0Y0ZG1Y?=
 =?utf-8?B?dEhHYStuK2I4Y3VGYm4vWGxVR1Z5K0xkTC9vOHJTZmdlM1NLc0ZXcXpMb1R4?=
 =?utf-8?B?TU40T1Vod1M1NVRreHdNSEJlcjN2c2lhb2VJMENYTUVNVE50MmNtSkp6Zm5m?=
 =?utf-8?B?bjdUZHhpb1dHRUZ6RGdTODRUb3dnQkgvOXBtUzFsOEhoRldSSDZIRWpnNWF1?=
 =?utf-8?B?bEFBMS9aVkdJSVBKa1RqY21sSjU5Y2FML3RJa3d5ZWJzTVZNT01KNWMreTRu?=
 =?utf-8?B?bzhoRDZqdTJHZi90OUFYVEM4UkcrTmxqcU5FVGNpQjQ1MDRFWVJySGFMREp1?=
 =?utf-8?B?YVJxNkxER0pFWk9sa1o2RXpZSHdkUFk2a1VKYmVNb2Y4aERPTmQ0MWdKZWk1?=
 =?utf-8?B?UERzSWNDR2NaOUtHRTJBTVZQdjNscFZGaG5hcmx5cStzdldCMHFRZyttN0F0?=
 =?utf-8?Q?xGisAj+RyyeF8d9TmWy8uXCIg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e0de26-075e-410e-3737-08db61d662dc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 12:56:01.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dEyZqsDKimhB0tuylRrtcMSzx2WGt1Ct+X/1cgnU5SGWu002SExb7IfaoluwjI9Jr4GDM2Ug5VJWCupVlMq4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7457

On 31.05.2023 12:40, Oleksii wrote:
> On Tue, 2023-05-30 at 18:00 +0200, Jan Beulich wrote:
>> On 29.05.2023 14:13, Oleksii Kurochko wrote:
>>> +static uint32_t read_instr(unsigned long pc)
>>> +{
>>> +    uint16_t instr16 = *(uint16_t *)pc;
>>> +
>>> +    if ( GET_INSN_LENGTH(instr16) == 2 )
>>> +        return (uint32_t)instr16;
>>> +    else
>>> +        return *(uint32_t *)pc;
>>> +}
>>
>> As long as this function is only used on Xen code, it's kind of okay.
>> There you/we control whether code can change behind our backs. But as
>> soon as you might use this on guest code, the double read is going to
>> be a problem (I think; I wonder how hardware is supposed to deal with
>> the situation: Maybe they indeed fetch in 16-bit quantities?).
> I'll check how the hardware fetches instructions.
> 
> I am trying to figure out why the double-read can be a problem. It
> looks pretty safe to read 16 bits ( they will be available for any
> instruction length with the assumption that the minimal instruction
> length is 16 ), then check the length of the instruction, and if it is
> 32-bit instruction, read it as uint32_t.

Simply consider what happens if a buggy or malicious entity changes the
code between the two reads. And not just with the detection of "break"
in mind that you use it for here.

Jan

