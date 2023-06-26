Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30D873E7AA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 20:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555632.867531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDqm3-0006YL-LB; Mon, 26 Jun 2023 18:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555632.867531; Mon, 26 Jun 2023 18:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDqm3-0006Vn-HW; Mon, 26 Jun 2023 18:17:15 +0000
Received: by outflank-mailman (input) for mailman id 555632;
 Mon, 26 Jun 2023 18:17:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X2wr=CO=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qDqm2-0006Vg-4O
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 18:17:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab4fc033-144d-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 20:17:12 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 18:17:07 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 18:17:07 +0000
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
X-Inumbo-ID: ab4fc033-144d-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwk2IyBnTKtpf5qDF7Rg5Rpmi8IwwDjsGLaTCH2xzR1aJTvk5mMzwLDWlC9xtDf7X4CwKF8o5SkbZcbo48Y1tcCUVnpxJ7QZZJSWaYeIT8Az50Oqs+Du49XN4qJN3nZg63xJ6CHPSB6yfHVQxu6OGx+0GLJqKtMxPuqkjYv0yflcOhH6XM45kQYtOfE9Vvx6tgirqmWzO/PtdsjfNplpDPleB7ATHpmHgH6xnL0GFeYkfWqKnBZU8FGo7VZavukpTWsCZb3kyqp3wqskXIrMXkYwUAnJrFUUmwy+fHNrxpSnuH9y1dm3sVHemSn765JSVDOTSnCs6HN74RWRe0u9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeHXLEtbheAf+jFSN86qIDwoxCZcTUTBwyQiWyrKNnI=;
 b=It5d2T3i0OwubxPz4kS1Tpm2B1hOcQCSCv1aNa3i3WjCTFWbip9K40GsBHLIzbHl0p8Qnw3fEzPKtdpJFS1753At+j3Rf6oWK4KphtMHloQTEI3tavSrCV3tzFtDzs2TMjPtMXToB8UXdrP4tXTC2z9JT6QDdd1KGq4v8S4p9p2RkMzRWU0ejse0/W8l12zdoMTNJS8ZLOBSm4duE7wkZa5Hf5GEykVFlREfDkhn44HPZlpFrQNvg9XjdbgbcSANthal9SuMvtK3exjGh2AVjCud9zLlxD1ftUjDk/wTfs0mzY8/+6WmF+GALU/Uxq07RCe8RfyzsjPb4pLp4cN2Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeHXLEtbheAf+jFSN86qIDwoxCZcTUTBwyQiWyrKNnI=;
 b=eES5qDzQ048BbeFru90VewRopXvaCkwp03ygtVfXwcHtkhybjX82oU7LLgs81H4u0J7eFhrDrVoOd9XOYyqIagbBYusZv2wNYgUCj0uBImDhBnbxTW1yrQXI+DiYxoC2Sr2N9YWskCzQx0KiSISb0f+Gy95fJoOwL4ybcMCWozI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <90c0f648-9413-74a2-0f65-c250106dfbcc@amd.com>
Date: Mon, 26 Jun 2023 19:17:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v1] xen/arm: arm32: Add support to identify the Cortex-R52
 processor
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230620151736.3720850-1-ayan.kumar.halder@amd.com>
 <d92e26fb-86d4-1681-0d10-be6c2e2cc846@xen.org>
 <d7701ff7-4cee-800a-69c9-deb8560804d3@amd.com>
 <3b7f584e-700e-4598-f36e-51a96140323e@xen.org>
 <bdaa74a7-8707-62a0-fcc9-24f80772a104@amd.com>
 <030fc5e8-8293-2306-06eb-9275c2a2c9e5@xen.org>
 <c7ca9356-ffd7-8fdf-3a69-5267f2957815@amd.com>
 <2fbf6885-5bb8-4b49-522d-eb265349d4b7@xen.org>
 <75008370-7141-757c-0768-14b654724f07@amd.com>
 <ba33a5ea-aa6c-2b93-b10f-28a89cd402c4@xen.org>
 <b0f1a006-7be6-2df8-8859-e9d7927a35c9@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <b0f1a006-7be6-2df8-8859-e9d7927a35c9@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0054.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::29) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MN0PR12MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 220f1f77-6f9d-489d-3867-08db76718d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SttnXFh90Tsg7Rlh8i7lch9L2RiDfMi5ByI3fhbOWOFo4c8lXUcgyxG60dwF545M7d5iG/KnbQXzfl9pjzysgQgEZBQ+wC2tx/ShD9mWVW+Eea+tLKa1Mn7OiFBmOsGs34mlJ9W3KAT8Waw8xHKU8SYAOiX0emMzfpKtn1bkZZMAB3RePC/Q2ulhyQsAdChAaOHqK1A4OpLBJD+e7fKEDLdoPgs/Covp+lNv725uP0DSGMGjD4L1W/IzXCy9OVB3/CipjUG3E+mZe9+CutuRlse+3knKOwsltZBx0YTBq/oGWfgkGNpBxbfmeCUZ8U2pCuxQ9xOKzq4a51v6P4N0RS5AGVeeivsHrqgCXy/3g9iGMA3CC1pHSN8nH6S0YpSrEQITdjU84Rwxai+lOuSrn8sbNHddoVZwkS4L9u/VpOfTXdv3r6Keum0+l8bU0ist/usQivV9u30tDWI6v3BWJkL2nmlkhjKUPrxTeqbYqfq0lzg7IBj4JB/Hq5xwZvXL9AAcmLbTzaVyLCG1LYAD8aLsfuW6wsYZEjeODpGCGYDpVXQNdgj4jK7xA9Hw01/fw19X9bOEhzjZqtZZtPTDY8LuX3Qh1rIpvxZu5lnFles90JGr7+oDpjJAzxwfxBcZcrbOxtAuDaLSzOvEPs9Ddg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199021)(8676002)(8936002)(66476007)(66556008)(66946007)(316002)(6512007)(4326008)(6506007)(26005)(186003)(53546011)(6486002)(478600001)(110136005)(2616005)(41300700001)(6666004)(2906002)(5660300002)(38100700002)(36756003)(31696002)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTNZUXlwM0xreC93dnRjUVJBUVV2SllKanF1eWY0QlBuczhLTkExM0FmZFll?=
 =?utf-8?B?d0ZwNjBEYk9GS0JBb0tjc2pmbkl0a0RGa25hc2VHdzJjcXFBQm5zaVVmaVo1?=
 =?utf-8?B?ajFPQlhsWE9wNTNzNThiVCt0ZmVwREx4OTZJMTh0MjRsTzN3WlNqN2pLcDRE?=
 =?utf-8?B?ajlIeVFNdGl1VWl0SXA3eVBWbjZmZFBHcmJFNEVUa1lRRUZ5cFdFQmduL2Jt?=
 =?utf-8?B?MzVlUWExU092TFhwYnZSZUx0NThmNnBMMHFIMXNnLy9hUFBhNTlXVG9vMG11?=
 =?utf-8?B?eExaMURWU3JBb21NZjB5R0JWSWJjbFk0d0swNlUycDdjR3hpRWVsTXAzTktt?=
 =?utf-8?B?ejdVUDlPNGlqbElLMUVmV2paSmdPanp1cU1oN2VyOWU2M2tPenlkVThkbEdj?=
 =?utf-8?B?dDg2SFl0Ukl4V2pweVhFODlEdzRwckg4bkJFWlFVUlg0NjdKZmdUdHRvZERh?=
 =?utf-8?B?RUl4UzY3c2V3dlY0Wk9pL21KOGZkS1VGbTJzRWF6VFBoWEo4bThLN3JSTFdt?=
 =?utf-8?B?ZkFtMW9JWDh1cU1Pc1JzNHhsNFc5REdWMjNFVURXWkNQWnlTRmluOWZjREpL?=
 =?utf-8?B?aUtKSU8xdjg2cUtTQm1HMzFPWFR2ZDg5NkVmMXBEcFhCL2w4TExrSWpCSE9J?=
 =?utf-8?B?S3B2WUxhb1lPNlFrMVBFdDBYcTJlOUU5MWMyR3hzckY2ZVZ0K1dGYVZaUi9I?=
 =?utf-8?B?aVBUY3Bkb091VWkwTGU5TWc2VzU5S2NIMXNFVmpOeDk3dHBzWnRDRjRaL1dn?=
 =?utf-8?B?cktvc1JmUEZ0OXF2QnJMdVlrR0JLdk9UYWw2aTVicFRqTWE5aUhpVHdDWElK?=
 =?utf-8?B?NVc4blZTYktRZ0UyWmMxZGQ4dElaV280cnZBZUl1T0xLamxmZUxHZjJ2b1I1?=
 =?utf-8?B?ZGtMU2Z6RDI2alhyTkFUdlk0bXcvckE3ZjRTRmZUL3ZDUm9IYzh2MkpJOWtj?=
 =?utf-8?B?aTN1ekRyTk5BUTNFVG13RHR6cWQ4Mnp5RXdvU0phZUNxaTc3d2tBeVhaWDkw?=
 =?utf-8?B?ZUx5ZzFmSFZCQ3JkK3g0dUlKUlJSeXhWeVJBS01pN2xpUXNyK1hGNkNBeENy?=
 =?utf-8?B?UzlJKzEwL3BQbFFGdTVNeU5mOHBLRWYyTnRxOWYyM1QyR3BBcTVLU3FKSi9N?=
 =?utf-8?B?ejVvSDBscVdxVVdkZXVOVSt4a1F1TGtaYytzalBSaEZDM2FUZ3paZUlZTDI2?=
 =?utf-8?B?amtSWmdxcm04L1hlUFEzM2xGYyswcTh3RUlUOFJPc2ZBNGUyRmxmQUFUNVJy?=
 =?utf-8?B?VExIM3NBQ1A2clh6YmlEenZJbHJCWXJiSDlrRnI3cXVXM0Jid1UwSHhHbExV?=
 =?utf-8?B?bVVENUozWmlUd0lhcEVxb3VFY2FrTFIxem85ME9GbGVIOTkybko4bC93cVlB?=
 =?utf-8?B?NWVacWdOMHc5d0pKcERNTjNtaW83NFluc28zYTJVTmdjZWthbGl1bmlncWg3?=
 =?utf-8?B?NzhHd3lmRC9EcGtzNFJSQzhnZHJ0Y28zanNQeitINDJYYVJLREc5Nkh3Njda?=
 =?utf-8?B?ZFVQTFRYMTVNcmxQUDlOTDB3NU42WklFZ2p1RCtTbVRrSjROUys3djg3SVpl?=
 =?utf-8?B?dnYxN05VNGcwcmFjbkpVVkt3T0tlZlZlWFVrcXh3YU9TTzQzV3pIcHUzL3V5?=
 =?utf-8?B?b0N3S1VKb0xET0VOVDQ3TGNmQnVmTjlTWjVCMkN2dmQ1aEVURm1UeGN3ek1t?=
 =?utf-8?B?VDFuQitEWWV6Y2pmVHRHSno2dXFpQSthL2ZKTjhuVzlmYmxhallKT3ljbXZa?=
 =?utf-8?B?Ky9INHp6MkRjVHkwemczK2NPaTFXOHNkRGxXUGo4QmhhZXU5UW10WTVvdmNT?=
 =?utf-8?B?VFE0cGJkZEVjZGpiZ1pJaktyRTFyNkN0NEpwVFNQM0NMMllzMCs3R2o4RjBY?=
 =?utf-8?B?RW00ZmdEQjQ0aktUWE9HOHJwLzM2aVk5cllINDJyK0x1OExHbW9ia2Jxenpv?=
 =?utf-8?B?Mnp5ek9YY1JieEhyMlBoV1pXanZnVjJMeXRxSVlPN1VpbG9MVzBwN0h3NW9O?=
 =?utf-8?B?RVQrajZOZlptU3JVWDkrOHNxeXJWcnhvN1ArZk5FU0pVNkxxRnoxWlpTSUJn?=
 =?utf-8?B?M1NIOUpUK2d4RElvd0hRRFpON0JnWndsTUFrQ2VkOE4rNU1kZ09iOVBUaGdH?=
 =?utf-8?Q?/S3F9jok5/DwYRrfCncVW2Zwd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220f1f77-6f9d-489d-3867-08db76718d08
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 18:17:07.5203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdNPWaD0EID+MX/7ANcjTWNMANA4AmXFzpduRA1kdFMWIsVTxaDb0uG+dxwSgTeY0NWZ2CY++xN1J5Wuo3Preg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246


On 24/06/2023 08:04, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 23/06/2023 22:26, Julien Grall wrote:
>>> --- a/xen/arch/arm/arm32/head.S
>>> +++ b/xen/arch/arm/arm32/head.S
>>> @@ -322,7 +322,7 @@ cpu_init:
>>>           PRINT("- Setting up control registers -\r\n")
>>>
>>>           mov   r5, lr                       /* r5 := return address */
>>> -
>>> +#ifndef CONFIG_ARM_NO_PROC_INIT
>>>           /* Get processor specific proc info into r1 */
>>>           bl    __lookup_processor_type
>>>           teq   r1, #0
>>> @@ -337,7 +337,7 @@ cpu_init:
>>>           ldr   r1, [r1, #PROCINFO_cpu_init]  /* r1 := vaddr(init 
>>> func) */
>>>           adr   lr, cpu_init_done             /* Save return address */
>>>           add   pc, r1, r10                   /* Call paddr(init 
>>> func) */
>>> -
>>> +#endif
>>
>> I think it would be best if you just #ifdef the fail below. So if the 
>> config selected, then you will still be able to have a Xen that can 
>> boot Cortex-A15 or a core that don't need _init.
>>
>> Note that for now, we should only select this new config for Armv8-R 
>> because there are some work to confirm it would be safe for us to 
>> boot Xen 32-bit Arm on any CPUs. I vaguely remember that we were 
>> making some assumptions on the cache type in the past. But maybe we 
>> other check in place to check such assumption.
>>
>> If this can be confirm (I am not ask you to do it, but you can) then 
>> we could even get rid of the #ifdef.
>
> I had a look through the code. We have a check in the 32-bit version 
> of setup_mm() for the instruction cache type. So I think it would be 
> OK to relax the check in head.S.
>
> Bertrand, Stefano, what do you think?

As per discussion, I have sent "[XEN v2] xen/arm: arm32: Allow Xen to 
boot on unidentified CPUs" with the comment addressed.

- Ayan

>
> Cheers,
>

