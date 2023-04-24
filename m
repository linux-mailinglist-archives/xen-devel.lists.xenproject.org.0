Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B546ECA0C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 12:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525271.816365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqtHY-0003Sh-Ih; Mon, 24 Apr 2023 10:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525271.816365; Mon, 24 Apr 2023 10:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqtHY-0003R2-Fo; Mon, 24 Apr 2023 10:18:52 +0000
Received: by outflank-mailman (input) for mailman id 525271;
 Mon, 24 Apr 2023 10:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqtHX-0003Qw-AF
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 10:18:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66f1c051-e289-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 12:18:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7193.eurprd04.prod.outlook.com (2603:10a6:10:121::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 10:18:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 10:18:46 +0000
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
X-Inumbo-ID: 66f1c051-e289-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQL6BLi1vb6P058CRmO7BW6oDQTbrJHsWXELhiv3ddww5yO3f/p5lKbNzBpm2C7E9TOsQt8MsFfLCaCH6fgjUZg4MxlCsSOJAjLHDvICIXWjMxqBubKr/1fbFFCwkE7q4TJHUYgVHd4TG6AyQr6x+vePG/y2fumqfQV+aJlxo/jHHJlgCYP/0vzOir7hNXBu/9BdgL0yPAwVB4U847PvcUa95ntMsKvUI6Z8pqC1rV7MYuKflOL4blh7Bla6SME9SAlLokeFvG4Yzz2osbXPbOgob1SLFKC3E9o8W69v0mnQi3fcYQXj6nf9pExgvbWElPjlpcPKelxf2GzSt4AOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EjfACP2vBBjHQJN0zO+FIwJPNOQ1rmvaSRObIfri9A=;
 b=TPMWCH7iSQUvjv3ZoKHrLuk/G7UV17fVSX6711VS+4ixyFFLlGZUEsXxakRlBWMkWttN9i/H5R/0QBE5lFvlJg7L57m5AVVSO52qi/kKWsn6K2foqqXQX0ONc0+8R8VUmk0sE7jRSUG/6JpNs69jxonJvoS5DHUKkB9pIqovQipgdr657ANDHuopz8EsjacpZS0UaEwtdLJNA+U0XoKAsftSsKOP1nMi0PZYORMArq/WPTYuk7ppar41PVfGZCOCdoS8Irw2rCuKDgZ6p5Z7aEWuMtZsyChf4QSpgbpeFrNcJ+88IKDwjcHSnqflvUAMPmsRa6VmV/44Pvp4kmoSmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EjfACP2vBBjHQJN0zO+FIwJPNOQ1rmvaSRObIfri9A=;
 b=J+8XKv9+369DjVCQI0i6C2Pa0H+ZS3sIZZ9j6z9uE6wHn52jsdd+VRbAPRkDXe1l/NJfCV6WPwP03NM2L4qN8cZK1r/GH3jKajnNo2bvSqMYUudbBwSP0w/6GzCBTDBt7/GEg2IplhXlOnOD8ijIOctsWuhgqM5d3QMAchDv+K8JS+KXr3ysbaJqJg7cwGjqR9xLFve4/mjX0Sg5hH8IAm4I0gq+XOxgLTKdbpJ9kMZAUpUAuBIhOo6uAcdejF6dVUx76SZQvS1niVk6RnyAdoPlph0WKJaUFHYqYuXeVgw8/7AthHNtCd7vouB6iskv9akpF48IE1BW7xFW1vTZwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53257ae8-d306-8c7e-35ff-f3bc3947849b@suse.com>
Date: Mon, 24 Apr 2023 12:18:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 2/4] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
 <5b27693bcdf6d64381314aeef72cfe03dee8d73a.1681918194.git.oleksii.kurochko@gmail.com>
 <67d8574f-2e0d-4eb6-19aa-67fe7645e35a@suse.com>
 <ea2d5cfabb9ada64eb975369779ca430f38e9eec.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ea2d5cfabb9ada64eb975369779ca430f38e9eec.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: f9493af4-2a2d-4d44-8b24-08db44ad4a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d6Ky9kws5aEkq/dER9uF5okXrMcxbcXfxvzNrpEDr9rzj6HL6J3JeskNBfUonYy36SSMSfndfovcX3uabpgOLN4cKHhNEIzg1S/WBc+6GRwYQz2CATA8c1MIaEGTlcFM7mgNRd0PUJBtnvROYHU6JsFfT9miDH5ObRXWmGbGHYQc9XKCVC+2mIi5XGMyxIrM4yK5WzrTbpnMXmFx5zcdGE38Q+iuk223csOaxmgkKF2siD/INJ4yFY/LQLb3K7U/1Mf1RfevTHe9EiU3ZpBSQzY+FX8d+ivh93CkI8rQraQEGhqovxxb8y6aXlFMazw15FpzbhkCWldhW8weA1tmrDa3zWVLqwqXpqo58s5HbIU+djvl1hNS9MAFzrbRoRkzC4NcgFOl4DbIdM7hixLercWdKXf56alMPIi7FjaEDoaix+KE86BlTNyQv3D3Evo00gWdXXO0NXdBOVBWfazhP5S+enZsJr5LdrevcK2UapLAyPMbEPZARqsylSTuM4hmhzChRxz7EXVWht800T3HaR7bMAUtT4l9rXt8sd2Gsg7nqTQjBKUQZei8LKBIm8MRueEzMrRk5lBMDpBYrpx9dYqAXpBDlTqrgRAvowOkGy+0PQwIsZdHRaPGjpH+ZhHEysvzfwaJNGGUOgWKt22exA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(54906003)(36756003)(478600001)(316002)(4326008)(6916009)(66476007)(66556008)(66946007)(41300700001)(2906002)(8936002)(8676002)(5660300002)(38100700002)(2616005)(31686004)(6512007)(6506007)(26005)(53546011)(86362001)(186003)(31696002)(83380400001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXpXWkw4MWJneUhSVE1mMHloS1hFU3VrdjA3N3NpYnp0Mm1tZEFZZEFYK0Fh?=
 =?utf-8?B?d2FjWWRENTJ6bXNUTnNtYm50MzRCQ3FUQk8reDBwbklmaXRTenArcm8zSldE?=
 =?utf-8?B?RTc1TkdKM3pGYTFzZXZ0Zmt1bld2QWZYQ21sVVBIVzhTYU9oQW9YazJrVS9Q?=
 =?utf-8?B?VmhqSTFQUEUweHp4QWJVQU10cFdFc21BUHJIblpmZUl5UUgwaUkxblp5M3hz?=
 =?utf-8?B?cUg3VzNjbVhxdUkrNlIwWXhRTi9oMDEwR05qOXd5MTFCeG1pR1YxSTdLbzdx?=
 =?utf-8?B?ZytkVmVQSGU1OFcrMlRjeFBSTDAvb0hxSlhyWFFGNDRaY0llQTJ5czExR2FF?=
 =?utf-8?B?TC9ZN0ZreWx2dzlCSU1IY2RjRGR6RG9FN0J6U1pScFhBejJWdWphOXh3MGlq?=
 =?utf-8?B?L25DaG1Lbjllb09JeHZ0czVCekp2NXJhMDhqOXRybklXMDdUTURqRkRmM0g3?=
 =?utf-8?B?Z29hQ0FWSzJPKzNwYlJhbklCT0tzVEdmZWpBZ09GcHVnS3VUUXdlUGdJZzUv?=
 =?utf-8?B?TlRkb1pZUGp6cWlmMEtDY1BINDNYalRjN0pPS3pQSlIzODhDalUzWUtzTlJv?=
 =?utf-8?B?aG1hZzdhRlF2M0J4Rk1Ma3JsekZKQWpEVFhOYWZIeUNXMEtJYVVwVHVrdloy?=
 =?utf-8?B?cHBCb2tPeW1xVWNYalF3b3lVenJBQWFxYVdXTHprdEdKNnFLbUxrRmpiV3dI?=
 =?utf-8?B?ZVp6c1h1dER1WHl1d3ZCY3RGR2tDUnp0cS9iT3R1aTc0QW1EZEtIdVhBcWpP?=
 =?utf-8?B?NVROQnpPNmZpeFNMSkNBN3BCWU1WVzZTVGpzUng5YTF1eWNGZEFFNmt1L3Z0?=
 =?utf-8?B?NEVkN2lnNEZlMjlaSEZUbXN5cGhibVVaRjlscWVHcmhBbzk1eHhnM3pLNEor?=
 =?utf-8?B?WHZpbE5NQnlERUpHaFRZVHRFeE1HV0lRMTlwYlUvVlB3VnFyREcwdUxZdVVs?=
 =?utf-8?B?R01VcDYrV1lWMEEwaVNOK0J3YXhuTUFsb3ZGeGZMOVVWWUJNaTZnUHJGMWs3?=
 =?utf-8?B?andiMXFSOGI1bE9sSlo0QUNPZEJWVytadEJIY01JRUp5enRKNXdwVThwZ1hD?=
 =?utf-8?B?cGpRdXNMNDhZNjIwTlFuM0h1eFJCb3ZLaGJlYlNScnhQbWpVTE0xRnJpQkVK?=
 =?utf-8?B?V0pBTmFZRlQyazA4S2Zpc3VrRUpNMFYzOUZKU214Q01qbmozckd4UjczQVZZ?=
 =?utf-8?B?QnNraWZ6aUQwTG5lTThrVk9BeS9BNkhqeGp5SWFvNVBpL3dhb3JzaFAvOXlQ?=
 =?utf-8?B?UnNTYVloUkhQRnQyblZZbk81Z1N0TC9DaTVRb1l6VWVtTTJ1YUkyclMxM3Nu?=
 =?utf-8?B?dytDL2hZWDZFVzg2UFprcFR4L2FDTWxlZi9ub3NRRk9CNjIrRXA4R1pYS1E4?=
 =?utf-8?B?c1dDWFY0SVZxZzN1V05lQUNSUzBnWHBsZFlKL0hiRjJKbm1Jc3VlRGIwVkwy?=
 =?utf-8?B?Z2xNRXRZeXBlUVptTkQ0eWd4SWZnN0k3UkhnVnNxL3FCcTlYOWZDb3VaVk4x?=
 =?utf-8?B?WXZmdmNublFaOFgzQUxVUmhpOTVPVnRLN3dOYW91V0RZTHdISTVJWVRCdVNy?=
 =?utf-8?B?ZkhJOXY5aGl1NGFBRUhWUFg1YWhDYUJOT3Z0VGdab3A0c0RwbTdXc0k0VUVQ?=
 =?utf-8?B?QlIzeUwwWVoyTzkraTlJNFA4dG0xSitaVDNTQklPNUprdGtTWGdBd1BnbFlV?=
 =?utf-8?B?ak1uZVdTNk53bllmMGhvTENNdXVNMUtEazZrajBlbTNLM2NMTXYxelFIOURz?=
 =?utf-8?B?UXFnclVtSVpRdTJMOStIRHJVV1NqWkl6cUpwN3A3TmJhR1YyYk5LUDMxMmMw?=
 =?utf-8?B?alZtbHBCQnVvZjlLVzVsa2Q5VXpSeXU4am9VRHdOeUFpeGVZWW1EU1lGMDc5?=
 =?utf-8?B?ZHE1MXdpc3dwek5WN3JnaVBxSVJ4MmQ4MnlkR2xRNTQ3RVUrc1lJYWd2anlu?=
 =?utf-8?B?bUl1T3BsSGRaM09VTmFjY3l2bE16SFRMWFM1NVFWU1liUUlEa2NiQ2hsYWRZ?=
 =?utf-8?B?aEJ0dVBHVCsxRFBYSk1IZGhwemdKRGp1YkxjUXE1UUxUQXdNM1gwUndCTkJZ?=
 =?utf-8?B?dk94YytjLzNGZDBQTmU1TVhoRGgwRnFhbVJESEdhdjlBS3huMEc3WEFZYVJ1?=
 =?utf-8?Q?MepSp8IMaPivldQldkPrCM5rz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9493af4-2a2d-4d44-8b24-08db44ad4a09
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 10:18:46.6905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oM4Y/CFaPGg32eNyjUZ2/3kh0RROfSgujqs6BGARAOSmfjSjdqlZj4ghLbYg1GxfPTxnhaaQ2RxHwfG41F30w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7193

On 21.04.2023 18:01, Oleksii wrote:
> On Thu, 2023-04-20 at 16:36 +0200, Jan Beulich wrote:
>> On 19.04.2023 17:42, Oleksii Kurochko wrote:
>>> +                        /* panic(), <asm/bug.h> aren't ready now.
>>> */
>>> +                        die();
>>> +                    }
>>> +                }
>>> +        }
>>> +
>>> +        /* Point to next page */
>>> +        page_addr += XEN_PT_LEVEL_SIZE(0);
>>
>> Seeing this as well as the loop heading - maybe more suitable as a
>> for(;;) loop?
> I am not sure that I understand the benefits of changing "while (
> page_addr < map_end )" to "for(;;)".
> Could you please explain me what the benefits are?

The common case of using while() is in situations where one cannot
use for(). for() is (imo) preferable in all cases where the third of
the controlling expressions isn't empty (and is to be carried out
after every iteration): Any use of "continue" inside the loop will
then properly effect loop progress. (Of course there are cases where
this behavior isn't wanted; that's where while() may come into play
then.)

>>> +    csr_write(CSR_SATP,
>>> +              ((unsigned long)stage1_pgtbl_root >> PAGE_SHIFT) |
>>> +              satp_mode << SATP_MODE_SHIFT);
>>> +
>>> +    if ( (csr_read(CSR_SATP) >> SATP_MODE_SHIFT) == satp_mode )
>>> +        is_mode_supported = true;
>>> +
>>> +    /* Clean MMU root page table and disable MMU */
>>> +    stage1_pgtbl_root[index] = paddr_to_pte(0x0, 0x0);
>>> +
>>> +    csr_write(CSR_SATP, 0);
>>> +    asm volatile("sfence.vma");
>>
>> I guess what you do in this function could do with some more
>> comments.
>> Looks like you're briefly enabling the MMU to check that what you
>> wrote
>> to SATP you can also read back. (Isn't there a register reporting
>> whether the feature is available?)
> I supposed that it has to be but I couldn't find a register in docs.

Well, yes, interestingly the register is marked WARL, so apparently
intended to by used for probing like you do. (I find the definition of
WARL a little odd though, as such writes supposedly aren't necessarily
value preserving. For SATP this might mean that translation is enabled
by a write of an unsupported mode, with a different number of levels.
This isn't going to work very well, I'm afraid.)

>>> +    /*
>>> +     * Stack should be re-inited as:
>>> +     * 1. Right now an address of the stack is relative to load
>>> time
>>> +     *    addresses what will cause an issue in case of load start
>>> address
>>> +     *    isn't equal to linker start address.
>>> +     * 2. Addresses in stack are all load time relative which can
>>> be an
>>> +     *    issue in case when load start address isn't equal to
>>> linker
>>> +     *    start address.
>>> +     */
>>> +    asm volatile ("mv sp, %0" : : "r"((unsigned
>>> long)cpu0_boot_stack + STACK_SIZE));
>>
>> Nit: Style (overly long line).
>>
>> What's worse - I don't think it is permitted to alter sp in the
>> middle of
>> a function. The compiler may maintain local variables on the stack
>> which
>> don't correspond to any programmer specified ones, including pointer
>> ones
>> which point into the stack frame. This is specifically why both x86
>> and
>> Arm have switch_stack_and_jump() macros.
> but the macros (from ARM) looks equal to the code mentioned above:
> #define switch_stack_and_jump(stack, fn) do {                         
> \
>     asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) :
> "memory" ); \

Note how writing SP and branch are contained in a single asm() there.
By checking ...

>     unreachable();                                                    
> \
> } while ( false )
> 
> Here is part of disassembled enable_mmu():
> 
> ffffffffc004aedc:       18079073                csrw    satp,a5
> ffffffffc004aee0:       00016797                auipc   a5,0x16
> ffffffffc004aee4:       12078793                addi    a5,a5,288
> ffffffffc004aee8:       813e                    mv      sp,a5
> ffffffffc004af00:       0f4000ef                jal    
> ra,ffffffffc004aff4 <cont_after_mmu_is_enabled>
> ...

... what the generated code in your case is you won't guarantee that
things remain that way with future (or simply different) compilers.

>>> --- a/xen/arch/riscv/riscv64/head.S
>>> +++ b/xen/arch/riscv/riscv64/head.S
>>> @@ -1,4 +1,5 @@
>>>  #include <asm/asm.h>
>>> +#include <asm/asm-offsets.h>
>>>  #include <asm/riscv_encoding.h>
>>>  
>>>          .section .text.header, "ax", %progbits
>>> @@ -32,3 +33,4 @@ ENTRY(start)
>>>          add     sp, sp, t0
>>>  
>>>          tail    start_xen
>>> +
>>
>> ???
> Shouldn't it be the one empty line at the end of a file?

There should be a newline at the end of a file, but not normally a
blank one. When you introduce a new file, it can be viewed as a matter
of taste whether to have an empty last line, but when you have a
seemingly unrelated change to a file like the one here, this is at
least odd.

>>> --- a/xen/arch/riscv/xen.lds.S
>>> +++ b/xen/arch/riscv/xen.lds.S
>>> @@ -136,6 +136,7 @@ SECTIONS
>>>      . = ALIGN(POINTER_ALIGN);
>>>      __init_end = .;
>>>  
>>> +    . = ALIGN(PAGE_SIZE);
>>>      .bss : {                     /* BSS */
>>>          __bss_start = .;
>>>          *(.bss.stack_aligned)
>>
>> Why do you need this? You properly use __aligned(PAGE_SIZE) for the
>> page tables you define, and PAGE_SIZE wouldn't be enough here anyway
>> if STACK_SIZE > PAGE_SIZE (as .bss.stack_aligned comes first). The
>> only time you'd need such an ALIGN() is if the following label
>> (__bss_start in this case) needed to be aligned at a certain
>> boundary. (I'm a little puzzled though that __bss_start isn't
>> [immediately] preceded by ". = ALIGN(POINTER_ALIGN);" - didn't .bss
>> clearing rely on such alignment?)
> ALIGN(PAGE_SIZE)  isn't needed anymore.
> I used it to have 4k aligned physical address for PTE when I mapped
> each section separately ( it was so in the previous verstion of MMU
> patch series )
> 
> Regarding ". = ALIGN(POINTER_ALIGN);" I would say that it is enough to
> have aligned __bss_end ( what was done ) to be sure that we can clear
> __SIZEOF_POINTER__ bytes each iteration of .bss clearing loop and don't
> worry that size of .bss section may not be divisible by
> __SIZEOF_POINTER__.

How would guaranteeing this only for __bss_end help? __bss_start could
still be misaligned, and then you'd
(a) use misaligned stores for clearing and
(b) extend clearing to outside of the .bss (as the last of the misaligned
stores would cross the __bss_end boundary).

Jan

