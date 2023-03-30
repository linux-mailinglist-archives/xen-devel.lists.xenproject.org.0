Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2086D056C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 14:55:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516705.801266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phroG-0002nb-FH; Thu, 30 Mar 2023 12:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516705.801266; Thu, 30 Mar 2023 12:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phroG-0002lA-CB; Thu, 30 Mar 2023 12:55:20 +0000
Received: by outflank-mailman (input) for mailman id 516705;
 Thu, 30 Mar 2023 12:55:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phroE-0002kt-Iw
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 12:55:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ed363c0-cefa-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 14:55:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9078.eurprd04.prod.outlook.com (2603:10a6:20b:445::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 12:55:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 12:55:14 +0000
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
X-Inumbo-ID: 1ed363c0-cefa-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuZQxNYSFDZiuZTliIKlC/bBSsTNfOxJ+toUZfUkU6Y6kj1Fd4S3fHbcruVt2Pd7FOWzruBRiddNqVEJoyprtpOtMvyBOks6i2Vkm+dfYxccXy2Oq1INf4B8Vfwhz8VlzxogIFPRCtyMraJZNvz+jIYZ3iZ4RVBpLjVXP/jRTvtvSGPU7In89lINa1u9RRWx7m0BbdbBuJBSy3Pu8Wae54cJfIhMoJKKAWepCldi1WV0AGD90s0lhb6YH6Rmpb4MLLPcxo62WXs6f5s6vKZvf0IjGYk5shCAmN2O42BL/8iZfzZqqegKawpfxAnM03fsNqUwgi6ceClNPCs7fQYKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhFPt1TfXePXaRLUkYIb6ATg8B5TONBPN2u8BQmW2xM=;
 b=XYwDYtzf2P2wQ7Fv7RpEiiycoqH/WLkilaT030LTPm1n8+eO+m3C/MsBvOUgBBOGvQUNNG2tYCcJ8SFWVQbpNius0wf6tmUFtPSKzO4LsT0GKc5jmw6DMK4QS8WD9ffERQ51kZXKPDKWjrQ3wffWph9Hba0XgrNuov7k9rElrgnOvIps1UT2klHAOWgRsDvGBCFUdhlhB9vyH3UqL2yXvkBYAK18ajuSZJUmJYRX9T29Xuj/tr3ZwuZcluCTfz2VTut9irbdOmQQsD12BwXIzwXtyGeJ/RuOIOtJqdQEP5UCeQG+TXc71ZA1JNl74Pr4W9NQJyXlPzkQbd7QNc//Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhFPt1TfXePXaRLUkYIb6ATg8B5TONBPN2u8BQmW2xM=;
 b=o854zPCQNuVEHCWik1JnGCXkXeW0RMqq2U+200nLoFlRYSfab48NepfIiueC3QRXIaHCHL0EZO0WtXrEyrdrHx7BZvmp8dgHvEZ30t5nYlWV4k1NjcArzDsLJYDH4/Hg/P4d08hQsccNH2N2uc7nKe8X9tcAYHhxr2mlJaa7SMqNo3GMrzKkQ0ACF4fmZ2/2ltP5aAi+5x8hnBjQLM0NvJ3RGase4OzP1fVvDBUc/dCXpsa1gkIL7QZRWaYIJyqmiwmojlOYgDuvXh6+N/jPSa9VYhyVqWl27cvGCdsvmhoFgEoJjnShwe2hiicGKb0yGR9C+cC+jpFRXx6OJccy3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77067988-9389-87b5-22e7-398a37bef1ef@suse.com>
Date: Thu, 30 Mar 2023 14:55:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 9/9] RFC: Everything else
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-10-andrew.cooper3@citrix.com>
 <758615c4-bee6-32fd-0475-0c3c3bb7debe@suse.com>
 <8b368b4d-8a10-eb82-f7cb-d20e406ed285@citrix.com>
 <7cc9be8c-5628-1d19-077b-a70472c9095d@suse.com>
 <cbacbc0b-60a0-35ea-c813-e4d620f6406c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cbacbc0b-60a0-35ea-c813-e4d620f6406c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: d757279d-c4cf-4c98-285e-08db311e016f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CMtZyacJsvygumASCJPHOxN+kwBw6wD/nH8ORFddx1Satf/9YWnoTPKGjYg7Nqtt3258p0iZwmawCHu1981qaqmcMGP3xkGphADCE9+NLYsF9vANxLuAk6PRTUe/ZJlUdp0me58KUeLqFdK51FcovyOnbV1OEXTExlxedUlWu/VOg5MphYMNxPP1Ct5nhbnA0aLvE2ybAI4eKic41PrUOK3hQVh2TnCyvx1AejDsnVdRMRveJD2F+LvAtXUg+tzLVz5LkWSNOHgHhiSVBTCydECIEn+Z3n1T88k0sA8mMadurhj8h02yfmDB1VeT98u9CK/MLmDBq1AD79kgrRHhWfGKvL7B1lCGPjnEYnMQCGVdPKD8lwvyjh8ZX4fARF0yMd3gwemifU6uJKdOF8V7rzB+ADIJTkwtAdQbsGpGdN5adoMfb8Dw7TBK0hu1TVu9y6k5bxhZFOnOnBnYE1850uD65WNFODVRdw9scxgB/iFS+XB6g7rYVzk5cfpX53ksdPZcpk6xSvziTBDA7M6u5QyNuHPnlNnTAtWkgsl/f+nzKGIbu4CQSIieNPmr8dv1fcQ5Sg+ugVK8KNIVEOd6asUxWQIucrR8nZpHzRH0e9lkoZ6DoDTyhClWzZSjN1cz5eVnI5fQWuxbizzXIgGgbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(2906002)(6512007)(316002)(53546011)(6506007)(26005)(8936002)(186003)(66476007)(6916009)(66556008)(4326008)(66946007)(8676002)(54906003)(83380400001)(2616005)(478600001)(5660300002)(41300700001)(6486002)(38100700002)(86362001)(36756003)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1ozK0tXSmk5WnFvUWUwQmh5UVc2b3BHNjRQbzFWdDEvQTU2Z3VuZGNZeFdi?=
 =?utf-8?B?QjhRdkZSY0FRNGx0WThFaDlDVTBGVkljNWZHYlN0ZVUzSTRSYnprZkp4eThp?=
 =?utf-8?B?N0dzTWoxVUJiemFBd2E4eE5ZRkFBM0pqNzNrc0NQTm5CanoyakNoeUhBTGo1?=
 =?utf-8?B?dmlNOTZMNklkWFBzME90ODhGVno1bVFGSTFtMGw5MjA5NTRhck91Q0llUUVl?=
 =?utf-8?B?Si9HQkxwNWFoMHN5cmh5SW85dmQ3dzRoZ1pXakdnQ2U3K05ZM09XRnozUEdw?=
 =?utf-8?B?REVmYUp3cG8xUFMveW94OEFWdVhWWUkwS21vZ0djOFJETzAzd3BNdTljRUgw?=
 =?utf-8?B?Z3JpdEYyUEY2RS9hNC9ibU9IR1J5aTQzcUhWdm5KcytiV3JSN3ZKREMrRWRi?=
 =?utf-8?B?enE3M1h5VjNqVlVsNDQxOWp3SWU5eVZTaFNrYy9ySnNOanZOQkxoNEQzc2hH?=
 =?utf-8?B?WURLK1VFR2lMQmVWUWxnUTJMMjkzNzczVFVuR0FWdkQvZUloUWNVd2hqM0FK?=
 =?utf-8?B?aE9jTmVubXRjVU56ck9GZVNBSEJ4eHVvNVdwVlFCN3JEK3hyQ2s2Zld6MW84?=
 =?utf-8?B?QzlUWjZtVXIxWTlqKzhMcnVJTEVEcWlPbWFIcHo0VVowek9pa0FxL2VVd25J?=
 =?utf-8?B?cnI3VjlOTzlKZUNKcm5iOTdoUi9mcjBGK2d6Vlg2NEFJeGhXMVBVQllRUWNp?=
 =?utf-8?B?UlByQ3gwRXZlRC8yRFJodTA4ZW1iYjBhQ1lsd2dTUHJXVUxpYUpVNGRFR0d5?=
 =?utf-8?B?MVYvNmRTbmhFd2lLeVJYUC9rZHhZUVBKS1pLOWVTSXdnTVF3Ukh2alB1WFhm?=
 =?utf-8?B?ekkvRE1pNlBKWlRGcUlqZ2FSZWdSZjB4cklna1B3aWRBZ21PK2hYQmtnMWht?=
 =?utf-8?B?K1M5dlEyNGp6ZFB4WStPQ3pnaWJMUVZLWFBWSjlkcFlQOEk2S3Z3L3RWYTk3?=
 =?utf-8?B?T3dtaXpZQTJwVUYwc0s1Y3JoSzVpazhnemMxWi82cjBGYlNVM1Roa1F0Rzl5?=
 =?utf-8?B?Vm1LYXJJdzdobFVtYWphZUVFeGx3dWg5NGp6d3RrVnNlRXFtL0Y3ZG9yM0I4?=
 =?utf-8?B?NGpFaVZuVG1XRng1d1J1UDArTjU3Slg4bC9hdFZMdUFvSlVqRXdmb2tsVVU0?=
 =?utf-8?B?bmZDbHZDTTBRSGdBM3NNNVd6UTJsV2ZMS0hQQ25QNjcxYXlhSW5vTU5iRVlw?=
 =?utf-8?B?YXhsYnVjalA3eGFDaGtqOWd5Vm8xMFhLK2tCVW5uZDA2R000KzFJMlRxakR3?=
 =?utf-8?B?VHVRVlE1NzJoVzlkVkhNQU5remd4T0tzR3laU21KcTRmUzRLMCtobXN0L2hq?=
 =?utf-8?B?aVdMK2tPZDdIMithTzIvM0hIUUo5WGZGMGtrbkttaEg1Q09XRFlDRFE0eGpO?=
 =?utf-8?B?WjhJODliVFArMGhGRjdxYTYzRVBidHNrOGFBRnNGQXBDaEFWaklpVGZ1Wmhk?=
 =?utf-8?B?VDlpUXJlZldRV0RHTHk1b25IN3BRVlRNZFdPZ3NHUlphMUUrV3V0Z0RBLzVs?=
 =?utf-8?B?Ry8vU3JjU0JiSFI4SEs0dEZNMnYwQmdOR29Ob3RSdU5WRHNueFRjY29rZDMr?=
 =?utf-8?B?UHJ2QnRpWE5lTjBUM0xJN2NGT2FFNGo0a2pRVjRLY1JUTzhmZW5ZR2YwZTR2?=
 =?utf-8?B?K2NrbVdtTjBkR0pPbFVDUUw5M2ZScGQ0UHBScVNNZk83NmZUMGxYS0psSG9H?=
 =?utf-8?B?Q2N6UjFmQWpYZllVTXFISnlDS1FrcHJFUjh3UGtGWXlET2pyNWtLNkFCSHVB?=
 =?utf-8?B?WnhxTGhCUHV6c1FZeXJ2OWJoS0EvdXRqS041Z2J1ZFFmdGRzQ1FrOTJkK2Ra?=
 =?utf-8?B?SWZaVlBjekJkQVFNYkZFemZTdTVCam9uS3BKdWFXUjB2MytWN3B6Rk9FYkV6?=
 =?utf-8?B?MjBGU3ZGbFVJMkNhay93NDdpbnFHQUdZQVZlZFN6a3IxejlFa0RwTWJCK2R0?=
 =?utf-8?B?RDJQT2kvRHhQL3FVUk9KK3d5U2ZlN01JTVEvRTlrUmNaamdTVHlhdlR1b0VR?=
 =?utf-8?B?aFlVOWloRDk5NnFDbEV3YThTckRIaTkwSE1qZWszdW4zK1NRdUtCKzFJZEZ5?=
 =?utf-8?B?KzRFdG04V2MweDBic3YxekVJV0NZa280QlIrc1VVZ2RMaWdRa0VmY1JOTWhU?=
 =?utf-8?Q?iGAF+6qwG82SXjeiKislU8KC+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d757279d-c4cf-4c98-285e-08db311e016f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 12:55:14.7355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwjDHuMNfYEAyamlGqX6ssfyb/us12pHbc88GMvEk5Gjm0i5tA8xggFlwpvSqS8+vJOrgFx8kt5fACXN3WxxlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9078

On 30.03.2023 14:31, Andrew Cooper wrote:
> On 30/03/2023 1:06 pm, Jan Beulich wrote:
>> On 30.03.2023 14:01, Andrew Cooper wrote:
>>> On 30/03/2023 11:16 am, Jan Beulich wrote:
>>>>> --- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
>>>>> +++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
>>>>> @@ -893,7 +893,7 @@ int LLVMFuzzerTestOneInput(const uint8_t *data_p, size_t size)
>>>>>      struct x86_emulate_ctxt ctxt = {
>>>>>          .data = &state,
>>>>>          .regs = &input.regs,
>>>>> -        .cpuid = &cp,
>>>>> +        .cpu_policy = &cp,
>>>> ... this and ...
>>>>
>>>>> --- a/tools/tests/x86_emulator/test_x86_emulator.c
>>>>> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
>>>>> @@ -909,7 +909,7 @@ int main(int argc, char **argv)
>>>>>  
>>>>>      ctxt.regs = &regs;
>>>>>      ctxt.force_writeback = 0;
>>>>> -    ctxt.cpuid     = &cp;
>>>>> +    ctxt.cpu_policy = &cp;
>>>> ... this imo want keeping as you have it here.
>>> Ok, so that's a firm "switch to using cpu_policy for emul_ctxt" then.
>>>
>>> Which is fine - in fact it's one I'd already started splitting out of
>>> this patch.
>> Hmm, wait - CPUID "basic" and "feat" and alike uses I still would prefer
>> to see using "cpuid". It's really only such initializers which (imo
>> even logically) want to use the name with the wider coverage.
> 
> So its the other way around and you're saying you don't want the field
> name to change, and you don't want to see
> 
> -#define vcpu_has_fpu()         (ctxt->cpuid->basic.fpu)
> +#define vcpu_has_fpu()         (ctxt->cpu_policy->basic.fpu)
> 
> in the resulting diff ?

Neither. I want the change as seen in the diff further up, but indeed
I'd prefer if the two quoted diff lines in your most recent reply
weren't there. This would again be by way of using a union, this time
in struct x86_emulate_ctxt:

    /* CPU Policy for the domain. */
    union {
        const struct cpu_policy *cpuid;
        const struct cpu_policy *cpu_policy;
    };

Having said that: I realize that this is against what C mandates for
the use of unions, but since we (ab)use unions in similar ways in many
other places, I don't think we need to be concerned. Furthermore this
specific use could, aiui, be "legalized" by making the declaration

    /* CPU Policy for the domain. */
    union {
        struct {
            const struct cpu_policy *cpuid;
        };
        struct {
            const struct cpu_policy *cpu_policy;
        };
    };

Jan

