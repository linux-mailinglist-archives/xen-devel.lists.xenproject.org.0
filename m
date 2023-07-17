Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DCB75690D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 18:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564772.882486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLR1b-0001x7-KV; Mon, 17 Jul 2023 16:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564772.882486; Mon, 17 Jul 2023 16:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLR1b-0001uG-Hi; Mon, 17 Jul 2023 16:24:39 +0000
Received: by outflank-mailman (input) for mailman id 564772;
 Mon, 17 Jul 2023 16:24:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLR1Z-0001Me-Lv
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 16:24:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c0936c3-24be-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 18:24:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7101.eurprd04.prod.outlook.com (2603:10a6:800:12e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 16:24:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 16:24:34 +0000
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
X-Inumbo-ID: 6c0936c3-24be-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOi4TxYRDB94qwcMqYHebXsGLIDpjNf+vW/bVjIRsujJstQV8C0dSUH+7c3UF4y/g0ZsypHiG5F5kYy/BN2h6actjtNB+LEYEtZr+sSDPIgND6+5yIeUggv1o+MlBgAQEXzSYMMbMfSsM9lMTeRcig2ckFt9idAkBKi+XttDi+kh2bhqGn93SjNNqH8fkC6zpIidXNxXxpNcx3LXWhwzLBq7wGt3M0CNuMSHVOsVjn9HWM1xTJHbXXLcQxukm3T9gqQ458rJEi03UyOUVfVpjBnaFq3IE4FaMIhXWM0pnkvbasFa7IBLBZYamtL55ZfPlFT79J9LN8HOdTNpRAVW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dL2eJQhfm87bvNPNP4TtVruaJ6w0fga5D8CfSX+4Mz0=;
 b=loNsMIGHh+lsUbpyHYtF/vznhM3migelvo8JlTjL9dXlNLQMRLQLEtlTdalPoURPC/QKco6W0rORgk7OmPMzxRbLDTHzyTLe8oCKyErU+v4xKFBIrmuuwp/DHDjdoZ5UgNj3/JpOfRhrFp0H1jEl6JDVkKHbUAfrUXCMPEInGPzkw03jr4VzTXLT6DnuftWgYeSeAKGpbSwYNFpgxZItIDilnljeaxE8iv1veylI26tUYplSzvxF7G4eAzvj49xYdXCpIopH6LQbidZnQ7cM8t+mEc7Q9J2isuf8GeiEJXxXn05hbB1SfM7vua5qDUZM4S9prG8hcL99via0bW/66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dL2eJQhfm87bvNPNP4TtVruaJ6w0fga5D8CfSX+4Mz0=;
 b=tc5xm13ckfqUxv8t3GDVE1ngGIDGp7MPO8Fw0gPY2312/27QOqKx479mjZ4fJzZY863ALOyt1z1rjxRvRbkKopnl4HV5sy6pfmX3ubG/dyRduJIBT3fI5WrjuFe51cftiM0xXDL5k8a8OMai0Mehd/GRSLD+VGVAKfUFMKXT36mEZKZPyN+sRB7ZXxU+IalI53Oo2sfENvOO3ZRs9fnkqUot6U+EOyuLCAl5XrwLa1wXowNtPccG58oxdcQGfUXIyG/b81+sRgji5GOdQDGP1Lu8G9vPkkmN7+wEjWCUV17L0tGmG/wL9Q7hP54358zIJ3MkbaVoL0pawdHlvr+mxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <caa41c6d-6863-1e24-b3a7-58ac7c1a311b@suse.com>
Date: Mon, 17 Jul 2023 18:24:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] xen/ppc: Set up a basic C environment
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1688670018.git.sanastasio@raptorengineering.com>
 <8c79f498ffcb0837ff18640dbaf5b66f79186574.1688670018.git.sanastasio@raptorengineering.com>
 <7f6feb8b-29fe-7a7f-8965-20a12b4dfb25@suse.com>
 <dc64009d-53d5-6bd2-14ab-be2481523b0f@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dc64009d-53d5-6bd2-14ab-be2481523b0f@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: abb4df33-30d1-4ffb-dc1b-08db86e24edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iq6fHqNCvr1YxE4qflHbZotpWDQ6y/xUypd2jmW1VDDYsSRJFj+UWmHCQmkO9ULbtgpoO0N5OfHRKfuJOmAOjuqFWTcW+dhXY0x/Mgce/fMnNlNz81BMkcNboqWxcYSuwxsJkTgIcCF4xdAHrMnGJYqw6Gn/2YX9/KwEvO5/9VpZtQ3PrpoKUyRk9uGhWrHrN8CkcMj3v5PvPrQ1ErCHoJYQltLKHrdz/0L37SoszcFEfhUt8KMgRrOcpbSVmcgQbtfFfmOwAHx9bGypl5mR58qJORGAMJXrOA75ILz2jQHwwb6zQFk0fGny7x8QMb1ki01+R6HZnuQ1No6rtqShY7LECVWsUc0f9aovStRzUjua+36XoIBxmcl5zig2q86rRCxREdeb+1XqDmoF6H8eFL9G5mJls59kHs9CiTUPn863ws5ZEo2RfdZ/p7p7Vr0q2oY9YbLifNdmuhQQ/Vx+ArIMHbeoKaVf4JfkTTZISgXLfSQmc77uMGqyVSabhv39741p4G6aP+buq/ainj4jMGrV/5a2tQxMWTseB4jQPAEzJvrPYwkITixplv6iOzYxYVTVe2G9n+UptMhWTFCCDo330VZFExSDUAS6tLTrVXZQAiA7C1G1zQWG4bfdR8sky2Xq/mQ1T9PyuSD+RfxCrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(31686004)(31696002)(86362001)(2906002)(36756003)(6512007)(186003)(83380400001)(6506007)(53546011)(26005)(38100700002)(6486002)(54906003)(316002)(5660300002)(66476007)(6916009)(66946007)(66556008)(2616005)(4326008)(478600001)(41300700001)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVg1aXU0eElROUNzWWZLTnllUzJ6eG1LRXVtRjl3dDBmekFlWmNBWU1rUzNm?=
 =?utf-8?B?V0d4cXR3ckI3YmRacDZWaGVqaENEaENnUzJQQ1BXOUdtQlVMYW1aa2hpRWxX?=
 =?utf-8?B?dTVNYUc3SU5hZ05tZHRqZWFpbUc4d2FHbW9FRlJmUEo2dFArZi9nK2pMOXdI?=
 =?utf-8?B?MGNKNkc2cU1SdTNvaTkwWUZmWjBJdUR0TGNuUC9CRzZ2RnByNWdtckVvRmdh?=
 =?utf-8?B?NVh1U1FqMVJRbFd0bjk4M1g0ZktCaWNsTG0zUGM3MFo1Ukx6MWRnblJsTXJr?=
 =?utf-8?B?eER4cERFRHBvdS9OeTZ5SXBLVW4zTE9lTlNZQ1UyUDZoSkR1YTJzMjhYQjlS?=
 =?utf-8?B?ZUYvcWozclp4MGhwcWtwbFRKaEFkUDdlcVdNdWFFVnNEU0V2VG5hNXlYU1ZX?=
 =?utf-8?B?ZFBJSnY2bVpNUTc0dStlajJKK0g5SzdIS2xGNlRzNE5NdkE5WDJFdzhTYmE1?=
 =?utf-8?B?UE1sRThMK1BGU3FqYVFqWC9XZUlNQUpCa1lpN0l5QUpSSGVkZmFFOFcwN2JF?=
 =?utf-8?B?U1A4bDNEZStLbXFRU3F0SjA4azdBTWxoMlVCY1M3VlUyVWNYdlRtOVZqWVBQ?=
 =?utf-8?B?RU5pMmlGazlDMG0wOFFvUTNxblZubGJpTkVqUFZ4TWFjcUFRck0wOWczVzVL?=
 =?utf-8?B?ZnZxNjJtNjA5cHpnaXp2TnBDTkJIY05scUtzMm9Zd0p5NDMvdUlNR29zYkR6?=
 =?utf-8?B?c3pCVTAxVHJYOVlBTks4cTdzU1J4NUhyMStGTEJFais2d1hCREdKZzd3ZEdQ?=
 =?utf-8?B?bFV5MWNTbTc2am4rMG4yNmRac2FPZWlacmx6MnhseEEzSW9xSnBjVGJMTnF2?=
 =?utf-8?B?TTVUZEVmOHJaNHhwRzFHQ04zSGtpcXk0bVlWNGx6VktyeW1qQ3k2SFhTSUhX?=
 =?utf-8?B?R0NtcnZxY2I0bWp5bEVQNHl4NVYrSVUrbEZZWUxxcVAzM2NUOC95REdVUFBR?=
 =?utf-8?B?N0pPZmZPcjM3QnVjZlRYTFZwMFIwK24yeEFYczExbDZpb2hlWC9IOW03RWh3?=
 =?utf-8?B?c0FvRkRoSVB0L2VkYlFpcmo2WmkrUFJmdTBNY2Z6MyszOUlqWDFCQTZOVGVH?=
 =?utf-8?B?UUdkS1ExT1ZXM3VISyt3bW5WWTh0WlB3cFRQWmpuZjJac3NwR3l0UGZsc0Uv?=
 =?utf-8?B?Tnhtc3VXaktwK3FrZ3NDeHV4SEFaT1VNcTlxU3plQkdaVGJWbUdvT0dEMUtO?=
 =?utf-8?B?Zm9QdTRLLzhsVjNGVU8xVGNNemZ0VUM5TkJaNC9WWkJ3VFEvU3BJeUJsMzh2?=
 =?utf-8?B?SUFFTHJwc3ZkRXZ2RWZEMmFtcHN4THV1a1haL2EyOXYwM2xqbStwTFFsY3A5?=
 =?utf-8?B?alRMRDFhTW1QMjhwS28zL3F1c1lBLzRHOXNPb3o1SjU3SDhoVU1KZUVyVVhu?=
 =?utf-8?B?dFZodEJrRGZ2ZlBSd2NoSGsyUFJiNDlSc1V5eEhoT2xCamlMZFRXK3FpdytN?=
 =?utf-8?B?enFmZVg2Sm5OL1hyNVUrN080YkFPdldQVzlhN3MxSHhnM04vQTlsVTFGZGtr?=
 =?utf-8?B?cTcwUGNYZ3pNbTBtZzFPMDR1bnNGVmtKck0xMWZiZ04wdDN3b2RVbnpXZlEy?=
 =?utf-8?B?MllncXIzSXlFRXBKblhUNzlXeTNkbXMvV2RMcVBMczlyd054MGZEZlA1OVFn?=
 =?utf-8?B?cnFvY3FWUy9qSkQyZTRDZVUxeVVoU1ptUldybW1oMGdSMFVMSjFOQWFwaGdZ?=
 =?utf-8?B?OU54U0pNQ2pYRUNXZmFjd240WHBlQ2UrY3c2a3J1RFI4NkdwMkMxdmg2bGYy?=
 =?utf-8?B?WHNxUS96a2xzc0hHYjVTN0ZNN2I5bmxJRFY5VCs4ZVR5ZzNjZVFWTDVyVVQv?=
 =?utf-8?B?c1o2WnVrR0NLK1lZcTgzQzdJRUswOGRENDBMS2xuc1ZWK0RLOHBDNGFaTDhD?=
 =?utf-8?B?U28ySWZrNEl6cS9GT2dzL2VVOVBrVlJscGt5L3FML0pob0lsUHYyY2w0RUNl?=
 =?utf-8?B?b1dTVTFYOGNnZGhEajlKUktOMVdxbU1WbTFidTZpZkwvYy9WQmVuRTJORHVC?=
 =?utf-8?B?S004eU5Mc1FiY2JkMmVmWWJnTzBYSm02ODI0YWVzK0FRL2YrYm9RQlU1YVpj?=
 =?utf-8?B?VVdZc2h6SG9UTjJOVUp6ekpuRmZyV0NPT3VnWE1ZQVhGUzgrd2tvWjVsWENJ?=
 =?utf-8?Q?0YlfV74g+7HheqQgtriu/2scP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb4df33-30d1-4ffb-dc1b-08db86e24edb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 16:24:34.7745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATygnMQvrOzkVwzxzfEUf2nbdit8NxVbzXhhQ8DHd6byOjJbkjB85hurZuJE5RjIRzqJBT75K0OsVvQ5IqYenw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7101

On 17.07.2023 18:00, Shawn Anastasio wrote:
> On 7/17/23 10:38 AM, Jan Beulich wrote:
>> On 06.07.2023 21:04, Shawn Anastasio wrote:
>>> --- a/xen/arch/ppc/include/asm/config.h
>>> +++ b/xen/arch/ppc/include/asm/config.h
>>> @@ -43,7 +43,7 @@
>>>  
>>>  #define SMP_CACHE_BYTES (1 << 6)
>>>  
>>> -#define STACK_ORDER 2
>>> +#define STACK_ORDER 0
>>>  #define STACK_SIZE  (PAGE_SIZE << STACK_ORDER)
>>
>> In which way is this related to the change at hand? Aren't you going to
>> need to undo this rather sooner than later?
> 
> I noticed the stack order being too large when I moved the stack
> declaration to .c per Andrew's recommendation for v2. Since we're using
> 64k pages, I don't see why the stack would need to be this big. A quick
> look at ARM shows they have a stack order of 3, which would yield a
> stack size of just 32k.

Oh, I forgot page size is 64k. May I suggest to have a BUILD_BUG_ON()
somewhere, such that switching to e.g. 4k pages (the need for which
cannot be ruled out yet) will make obvious that an adjustment is
necessary. (Alternatively accommodate this case here right away.)

>>> --- a/xen/arch/ppc/ppc64/head.S
>>> +++ b/xen/arch/ppc/ppc64/head.S
>>> @@ -1,30 +1,30 @@
>>>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>>>  
>>> +#include <asm/asm-defns.h>
>>> +
>>>      .section .text.header, "ax", %progbits
>>>  
>>>  ENTRY(start)
>>>      /*
>>> -     * Depending on how we were booted, the CPU could be running in either
>>> -     * Little Endian or Big Endian mode. The following trampoline from Linux
>>> -     * cleverly uses an instruction that encodes to a NOP if the CPU's
>>> -     * endianness matches the assumption of the assembler (LE, in our case)
>>> -     * or a branch to code that performs the endian switch in the other case.
>>> +     * NOTE: argument registers (r3-r9) must be preserved until the C entrypoint
>>>       */
>>> -    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
>>> -    b . + 44          /* Skip trampoline if endian is good  */
>>> -    .long 0xa600607d  /* mfmsr r11                          */
>>> -    .long 0x01006b69  /* xori r11,r11,1                     */
>>> -    .long 0x00004039  /* li r10,0                           */
>>> -    .long 0x6401417d  /* mtmsrd r10,1                       */
>>> -    .long 0x05009f42  /* bcl 20,31,$+4                      */
>>> -    .long 0xa602487d  /* mflr r10                           */
>>> -    .long 0x14004a39  /* addi r10,r10,20                    */
>>> -    .long 0xa6035a7d  /* mtsrr0 r10                         */
>>> -    .long 0xa6037b7d  /* mtsrr1 r11                         */
>>> -    .long 0x2400004c  /* rfid                               */
>>> -
>>> -    /* Now that the endianness is confirmed, continue */
>>> -1:  b 1b
>>> +    FIXUP_ENDIAN
>>> +
>>> +    /* set up the TOC pointer */
>>> +    LOAD_IMM32(%r2, .TOC.)
>>> +
>>> +    /* set up the initial stack */
>>> +    LOAD_IMM32(%r1, cpu0_boot_stack)
>>
>> Wouldn't this (and perhaps also .TOC.) better be calculated in a
>> PC-relative manner? Or is the plan to have Xen linked to an address
>> below 4Gb?
> 
> As mentioned previously, I am planning to enable the PIC code model in
> my next series in order to accommodate booting on the PowerNV firmware
> type which has a different load address. That patch will change the
> initial TOC load to a simulated PC-relative one (pre-POWER10 doesn't
> have proper PC-relative loads/stores) and the rest to TOC-relative.

Okay. Perhaps worth mentioning in the description, so the question
won't need asking again. What about addresses being confined to 32
bits, though?

>>> --- /dev/null
>>> +++ b/xen/arch/ppc/setup.c
>>> @@ -0,0 +1,19 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +#include <xen/init.h>
>>> +
>>> +/* Xen stack for bringing up the first CPU. */
>>> +unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
>>
>> This yields the entire array as zero-initialized. At which point I
>> don't see a need for the store in head.S.
> 
> Okay, fair enough. Given that the array is zero-initialized the stdu
> could be replaced with an `addi %r1, %r1, -STACK_FRAME_OVERHEAD`, and
> the load of zero to %r11 could be deferred to the second patch in this
> series where it's used in the .bss clearing loop.
> 
> That said I don't really see the harm with keeping the standard
> idiomatic `stdu` for the initial stack frame setup. Other than
> performance, which isn't a concern here in early setup code.

I'm not going to insist that you switch, but as you can see this can
raise questions.

Jan

