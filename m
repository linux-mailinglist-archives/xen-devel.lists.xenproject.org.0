Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B213672FA08
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 12:05:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548665.856711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9NMx-0002N9-4G; Wed, 14 Jun 2023 10:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548665.856711; Wed, 14 Jun 2023 10:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9NMx-0002Kf-1J; Wed, 14 Jun 2023 10:04:51 +0000
Received: by outflank-mailman (input) for mailman id 548665;
 Wed, 14 Jun 2023 10:04:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9NMv-0002KZ-NO
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 10:04:49 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4881cf9-0a9a-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 12:04:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8569.eurprd04.prod.outlook.com (2603:10a6:20b:434::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 14 Jun
 2023 10:04:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 10:04:44 +0000
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
X-Inumbo-ID: e4881cf9-0a9a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6mkw856OVefNB8qX3viFEJqrv7xHkOV+Wr3nR+Lgke40gvhwS0Y8iKblwdAAhm4hkG4Slg2N8NySU+ZMAlVPFkTl92qMzhwgAZHaqaj/riToi5bvdUYcJU4q8W3TVbVdVEnBEeQ3pdXyx164yXWHDp4atHKB12tgBbE5YMaV81L0BrBvXWXWVLFEH+7J8OJxQeG8+H98MyYEEMUpPHeEFKO7vkP9CHZwg/+LT9+iLDfeGcuZTdUZBZuyFNyqE6Sw7HhQWp+LA7gU/MeLPTsQxYmQo8tDXzMycoEEX4rtJrr3QtKS1oUAEBow6YLOR8Uap/1RejreY56CT7FnoNQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Gs5SDCLc/imJXrCJIBf58B+16w/IX8Vx3OoprBkPtA=;
 b=OlF1kZ6I8vvtG5T8P8xxRGSZmGFLlutW6g9o0K/IXZ4ZusimnxItps2LN6snf09CQ+p1bp+1xqntCuV3GOcDKXOI2lnYiJ95q0nivUMbIudHN0tF3vIfst4zO3qy2bJne6pw29kL2naaNJ4wfpFp5BtzWP6S3NJag50pRgQDBFAd5g+dQJLBJI94mKMaj1qhCQH8oQxj5P3367p95TFUv7vjllu3zezAt7jvWpabDnljhajDA27zkYwa1IwLwViM+TL0w5z6wzVZFd+ej2pnOdsujoZW7EqRbbVu9ewteTylrsypH7dHJkshumQgDuWKuTnUNv4hzohE+rqJOGf1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Gs5SDCLc/imJXrCJIBf58B+16w/IX8Vx3OoprBkPtA=;
 b=dfmYQJG1YH4qRXn9Dc/IC1mQ7ercvqh9htqnIAy6xR7/xAJ5JKVft0Kjq1rJtBFwyOSb7wuXxeSE0PpkqGFhEvJnAFavn017BW5fdTsO5K0JE4yo2VQsrQ2dCNLMO2NybM0Q2UR4TH6gAvs6hRA0JYLFUyFxKAQ2A7HynJBlypVADoz9GhHTA6eDX0hgsuRRKQZ+f8biI6QULITI9oYQpYLcO6WQ5EqUzxOt7CVM/YzwCT4dKP8tSt/N8RRBFL1lnwOP1MnTbrs/c+IGST52aGNtzs2RDNaF0bzGFGB9k+xF3tr2c0HOo3quzbVmPB8pPrIyhGd8kHKMqTcTFBP4Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0dd8283f-ad73-8590-3800-0f9a00b4a281@suse.com>
Date: Wed, 14 Jun 2023 12:04:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 5/8] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
 <32aef31768cd81ffc8c848af6c29cd8510bbbf6d.1686080337.git.oleksii.kurochko@gmail.com>
 <4ac462c3-9cb6-f467-2b86-925fb068486d@suse.com>
 <3fa74b20c3516dbeaceada0f8e045d697f926000.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3fa74b20c3516dbeaceada0f8e045d697f926000.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0233.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 21236a24-7ad4-4ef6-c2a7-08db6cbec6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3y/ZxgOlpDbt6UeueLTn8PydJbwcNDxFdJR7Dbkojf5E0w/BzUuveBiQHmjDw0irLicXDXavClqf2eHzPXuH/4sU363dDiztV62z9N14gBi6TDw4j5gHnUSSXHgXf7LV1U6VFeqy0GRs3bIMLZ6YEbpft6kvB15XsVDQzQ5yWhXaRXQ9fMLLUMl5Us1vhIqWrAqApKpuO0k/IQQJwsqsywldxpCpgz9muPVeUte+y4Xat4xs27FwcoQKtjsYCLNsJZLotd8gV6R8CAgj/gDq5KsBfl5fQyacSULytNg5KQEEHpkIaF633s211ITN8WkpiV+fjikxhYKDf0q9IyRO0CgZUPnWuxBJiyN6bNteaLNlAnFJyL/f9nDCZGGTpi+TEzvBkYlPRlKuukgWwDCb8Ba32SXZ/RYDl/iina8STOfbmJkTiWRw1Eh43ZWX6/wFa5pgbM37Hhj9Ub7FxactZm/ZSmla3fOCQNqcWuEfjoGYCxGbUgTmsLKiL3yQx6XwNKB5mfpkOQ8ifz9oexJwKuV8LMqPGV7vM1vKde11iNFiUoa19nztiA7AbS5uo8HwJbLdAAK2FclIzi8BORuh3FCU7o4tORySP7SVI3Xqzju4q6F/Fxu2jhWD35QIN9a8DB/VMOfY8RoJQz6lTDQb7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199021)(316002)(41300700001)(54906003)(31686004)(5660300002)(2906002)(8936002)(66946007)(66476007)(6916009)(66556008)(8676002)(478600001)(4326008)(6666004)(6486002)(36756003)(31696002)(38100700002)(2616005)(186003)(86362001)(26005)(53546011)(6506007)(83380400001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUl1WVJUSW9SblZqWXptRFpFR0UrRkczanI4elplWGtVWTMrYm9hRmw1TGVa?=
 =?utf-8?B?d0ZhVll6YXVZZ0dMZHo5VjR6Slk3aHdYODFQVHF3dE1DdGdJN0VaRVo0a0No?=
 =?utf-8?B?ams1Tlg1aTRsR3UzUy8vdE5ZUGU4SDFmTmJ2SU5Xd29pZTcxVEVrUE4zY0hs?=
 =?utf-8?B?VG9SN3hzQWd4VklNT0I0ZVZZclZhcWNtRkhDYU5jd1kwZUpUVGhnZnB4OGd6?=
 =?utf-8?B?UFJVMWVRKy92TmJIcEF3VTI4eTQ5eEgyTExHV3BTVDl1dEtYTlZQVElGRFFJ?=
 =?utf-8?B?QldZaDUwYlFTTHMvRnVoNE1tVW5LSWh0MjFQR2E1aWlOVzhoZVljRG1vbDgw?=
 =?utf-8?B?VXd6ZEJlU3Vra09ia2RpNXE0TTBiMndIY3NlQ2J5M1lRQjBGWUdkSE1YM0tw?=
 =?utf-8?B?a2F5d0s0UUVvdENoUkRFalpETEJGZVk4SDRmNkFISE9Ybjg0blZoTnRlU0c5?=
 =?utf-8?B?MlpkZUFQaEpOSWpvc01VdVA1TFlncG1Dc2UxeVFTbWpoY2w2Qm9GdEpJUlQy?=
 =?utf-8?B?VHJjWUFqRGdvSmp5ZkxRaitFMi9QZVZOQmhWRXVTRCsyNFBUY1ZUZmtEYjRW?=
 =?utf-8?B?bjhCUHNlQ0dlNTRoOERJVWxTWU0rczFYYm1uTGFUVFhNV3poUjZrcHlhUEs5?=
 =?utf-8?B?Ti9YdXY4cDVvYzZWdVlJRTJleHc3M2NNMkdkQnl1S2xXcEpJdzROdTR2UFN2?=
 =?utf-8?B?ZU56Q2xOZ3BuWG9jTlF2aS9ZdEpDNGtMLy9hSXd2U1lIdXJValFrZzV3bVFV?=
 =?utf-8?B?WW55VXZZM3BSUlZmc2kzOHpXY3UxdlFrdnRpZ05selJYdnYvK3RxVzNEMFk1?=
 =?utf-8?B?TWFjaVlJbjJydE5KMW40SXF6OEt6UVFlR3hMT3JHeENDcEZBZWhmMDI2MVZX?=
 =?utf-8?B?a1AvbEVHcllyY01GekJKK0F1NStKQWY3bXJNMFE0emV3ZTFEenphWGFOMkdp?=
 =?utf-8?B?UDVkYXVsMEtDRmVRMExJbVBnTThkcGdWUkdhaXRHdnhvU0c4SEV4L1ZLY2E5?=
 =?utf-8?B?RkZMZmhsQi9BeWFTNFhlcFB2UmVNL09MbEhJZ1B5dUNFWXBtRkU5TmtMQ3BR?=
 =?utf-8?B?RHBRMXYzKy9LTlRSMGIzNE96Z0QvLzd1SGRMWjQ4UVd0QWtLRnQ3bVA5SzZC?=
 =?utf-8?B?THdKYkNWY2lBMnNoZVNtZXpkMUpmcEd6WnZscG5SNkdFdmlNOVAvbXduNnM2?=
 =?utf-8?B?RVBMWUhzRjVkdC9jWjdHamtyVnRJOU5MYU1ZeCt6TWcxcTJEWUhJdXVSQ1dH?=
 =?utf-8?B?SS8wUDBmbTFUeGdBY3RhUTlyVVlFd1d0alFEN2NQb0lnUUxiRnlzakpMQmRo?=
 =?utf-8?B?Zk5kdUhkTGhaeFpycjZLZHFmM3dmaENYZTZJTk5hdTljeDliNTB1TTlCVGNs?=
 =?utf-8?B?bStsMGFnMjArKzRiTjhQT3JMTUYvOGlhQVVQRjhGRGc3SzM0TFlvanY2dzBa?=
 =?utf-8?B?YlRxQUFZa1Z2OVJ5OXZJUnduVkdWTC84Rzd5SDhsQjJWMWUrNklLQ2dONmhB?=
 =?utf-8?B?Q3VmNjRKSGx2RjlFMXdmOGUyYWtJdCsrSzZtT080eVNvRXpBdmpJRUlsSkhZ?=
 =?utf-8?B?MkNiTXI0Y1h0SmIxSjJvcURWd1VuMXlqeDVWK0pPVS9vSlhQR0ZKWFJualhl?=
 =?utf-8?B?K3VvL0tobnNiQzMrZ2lNOERpdmNQSkpmZytrZTdZbXl2UFJZNnNVS0Rvdmtt?=
 =?utf-8?B?TTJHYTNFNWdCaS9NdVY2Q0luMGIxNzA2R2lFN2J1L2VoUktmT25WYUM0a3gz?=
 =?utf-8?B?SGJYaFRBeEZGWDUxS3I4MU5NaCtuVWFwTitoTG5ucjgvc2ZMV01NUG1BODAz?=
 =?utf-8?B?eGw1NDBBUEFDOWpZSWJLeUhpSFpIRnFWRHBPUWZ3ZjZzSVA0MGd2ZDMxemNn?=
 =?utf-8?B?QnFSTHBaTWd1UzZsT1dvQ04wRFNNNlpjNjRxWndNbFZwVFdDamZjVlhVcjVB?=
 =?utf-8?B?d1J3OS80VzEvcWtNbXYyY2ZZN2MrSmJHR3FXRldsc1Zwb2NoeW5rZHlrZGM4?=
 =?utf-8?B?T1JtbWdtWWtTdWZLbFBrb3JxaFlyNmVHMXp3SjgwVVZhT1hKekZEUWVvdnJO?=
 =?utf-8?B?TFJIUktlc3JyYloxQXZva0Z2R2l6dEdqcW5zRmNtNUd1am5oc1ZsK3oxQ0NR?=
 =?utf-8?Q?reIr+d1g6kGk0qYgIZQYXvEEv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21236a24-7ad4-4ef6-c2a7-08db6cbec6ac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 10:04:43.7792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01RAUl6Lq71+w5AooJu7IeO9L3UDUxYf1/VDXt1Qq38f4oQ5ifstfKrz6RJOSUjN0u/fj8kR6MLrhaVFSBZGMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8569

On 14.06.2023 11:47, Oleksii wrote:
> On Mon, 2023-06-12 at 15:48 +0200, Jan Beulich wrote:
>> On 06.06.2023 21:55, Oleksii Kurochko wrote:
>>> The way how switch to virtual address was implemented in the
>>> commit e66003e7be ("xen/riscv: introduce setup_initial_pages")
>>> wasn't safe enough so identity mapping was introduced and
>>> used.
>>
>> I don't think this is sufficient as a description. You want to make
>> clear what the "not safe enough" is, and you also want to go into
>> more detail as to the solution chosen. I'm particularly puzzled that
>> you map just two singular pages ...
> I'll update a descrption.
> 
> I map two pages as it likely to be enough to switch from 1:1 mapping

I dislike your use of "likely" here: Unless this code is meant to be
redone anyway, it should just work. Everywhere.

> world. My point is that we need 1:1 mapping only for few instructions
> which are located in start() [ in .text.header section ]:
> 
>         li      t0, XEN_VIRT_START
>         la      t1, start
>         sub     t1, t1, t0
> 
>         /* Calculate proper VA after jump from 1:1 mapping */
>         la      t0, .L_primary_switched
>         sub     t0, t0, t1
> 
>         /* Jump from 1:1 mapping world */
>         jr      t0
> 
> And it is needed to map 1:1 cpu0_boot_stack to not to fault when
> executing epilog of enable_mmu() function as it accesses a value on the
> stack:
>     ffffffffc00001b0:       6422                    ld      s0,8(sp)
>     ffffffffc00001b2:       0141                    addi    sp,sp,16
>     ffffffffc00001b4:       8082                    ret
> 
>>
>>> @@ -35,8 +40,10 @@ static unsigned long phys_offset;
>>>   *
>>>   * It might be needed one more page table in case when Xen load
>>> address
>>>   * isn't 2 MB aligned.
>>> + *
>>> + * 3 additional page tables are needed for identity mapping.
>>>   */
>>> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
>>> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1 + 3)
>>
>> What is this 3 coming from? It feels like the value should (again)
>> somehow depend on CONFIG_PAGING_LEVELS.
> 3 is too much in the current case. It should be 2 more.
> 
> The linker address is 0xFFFFFFFC00000000 thereby mapping the linker to
> load addresses
> we need 3 pages ( with the condition that the size of Xen won't be
> larger than 2 MB ) and 1 page if the case when Xen load address isn't
> 2MV aligned.
> 
> We need 2 more page tables because Xen is loaded to address 0x80200000
> by OpenSBI and the load address isn't equal to the linker address so we
> need additional 2 pages as the L2 table we already allocated when
> mapping the linker to load addresses.
> 
> And it looks like 2 is enough for Sv48, Sv57 as L4, L3 and L2
> pagetables will be already allocated during mapping the linker to load
> addresses.

I agree the root table will be there. But depending on load address, I
don't think you can rely on any other tables to be re-usable from the
Xen mappings you already have. So my gut feeling would be

#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)

>>> @@ -232,22 +242,27 @@ void __init setup_initial_pagetables(void)
>>>                            linker_start,
>>>                            linker_end,
>>>                            load_start);
>>> +
>>> +    if ( linker_start == load_start )
>>> +        return;
>>> +
>>> +    setup_initial_mapping(&mmu_desc,
>>> +                          load_start,
>>> +                          load_start + PAGE_SIZE,
>>> +                          load_start);
>>> +
>>> +    setup_initial_mapping(&mmu_desc,
>>> +                          (unsigned long)cpu0_boot_stack,
>>> +                          (unsigned long)cpu0_boot_stack +
>>> PAGE_SIZE,
>>
>> Shouldn't this be STACK_SIZE (and then also be prepared for
>> STACK_SIZE > PAGE_SIZE)?
> Yes, it will be better to use STACK_SIZE but for 1:1 mapping it will be
> enough PAGE_SIZE as I mentioned above this only need for epilogue of
> enable_mmu() function.

But then it should still be the correct page of the stack that you
map (the top one aiui).

>>> -void __init noreturn noinline enable_mmu()
>>> +/*
>>> + * enable_mmu() can't be __init because __init section isn't part
>>> of identity
>>> + * mapping so it will cause an issue after MMU will be enabled.
>>> + */
>>
>> As hinted at above already - perhaps the identity mapping wants to be
>> larger, up to covering the entire Xen image? Since it's temporary
>> only anyway, you could even consider using a large page (and RWX
>> permission). You already require no overlap of link and load
>> addresses,
>> so at least small page mappings ought to be possible for the entire
>> image.
> It makes sense and started to thought about that after I applied the
> patch for Dom0 running... I think we can map 1 GB page which will cover
> the whole Xen image. Also in that case we haven't to allocate 2 more
> page tables.

But you then need to be careful about not mapping space accesses to
which may have side effects (i.e. non-RAM, which might be MMIO or
holes). Otherwise speculative execution might cause surprises,
unless such is excluded by other guarantees (of which I don't know).

>>> --- a/xen/arch/riscv/riscv64/head.S
>>> +++ b/xen/arch/riscv/riscv64/head.S
>>> @@ -31,6 +31,36 @@ ENTRY(start)
>>>  
>>>          jal     calc_phys_offset
>>>  
>>> +        jal     setup_initial_pagetables
>>> +
>>> +        jal     enable_mmu
>>> +
>>> +        /*
>>> +         * Calculate physical offset
>>> +         *
>>> +         * We can't re-use a value in phys_offset variable here as
>>> +         * phys_offset is located in .bss and this section isn't
>>> +         * 1:1 mapped and an access to it will cause MMU fault
>>> +         */
>>> +        li      t0, XEN_VIRT_START
>>> +        la      t1, start
>>> +        sub     t1, t1, t0
>>
>> If I'm not mistaken this calculates start - XEN_VIRT_START, and ...
>>
>>> +        /* Calculate proper VA after jump from 1:1 mapping */
>>> +        la      t0, .L_primary_switched
>>> +        sub     t0, t0, t1
>>
>> ... then this .L_primary_switched - (start - XEN_VIRT_START). Which
>> can
>> also be expressed as (.L_primary_switched - start) + XEN_VIRT_START,
>> the first part of which gas ought to be able to resolve for you. But
>> upon experimenting a little it looks like it can't. (I had thought of
>> something along the lines of
>>
>>         li      t0, .L_primary_switched - start
>>         li      t1, XEN_VIRT_START
>>         add     t0, t0, t1
>>
>> or even
>>
>>         li      t1, XEN_VIRT_START
>>         add     t0, t1, %pcrel_lo(.L_primary_switched - start)
>>
>> .)
> Calculation of ".L_primary_switched - start" might be an issue for gcc.
> I tried to do something similar and recieved or "Error: can't resolve
> .L_primary_switched - start" or "Error: illegal operands `li
> t0,.L_primary_switched-start'"

Matches the results of my experiments. If I can find time, I may want
to look into why exactly gas is rejecting such.

Jan

