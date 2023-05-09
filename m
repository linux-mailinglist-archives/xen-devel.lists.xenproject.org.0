Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E593D6FC936
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 16:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532258.828365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOUF-0003sE-Ok; Tue, 09 May 2023 14:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532258.828365; Tue, 09 May 2023 14:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOUF-0003oR-Lt; Tue, 09 May 2023 14:38:43 +0000
Received: by outflank-mailman (input) for mailman id 532258;
 Tue, 09 May 2023 14:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwOUD-0003oL-U0
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 14:38:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fac8634-ee77-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 16:38:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8629.eurprd04.prod.outlook.com (2603:10a6:10:2dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:38:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:38:37 +0000
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
X-Inumbo-ID: 2fac8634-ee77-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvk8wBWducPI5X2SbrUuZrcWHlAQh65nxdjkRzSmA5gJdGhdnOGcGzaMHQu/oyEsbUQbXAvp40XKfHdlGHxLLg2keDfXP9sDOOfK2DHHoihlMP63ZRZsGgau2aYwNmwQq5Xy/YF7untYOui7KIUsRNftiLJkPanjaHqBFFHCfDwdSs7nha2KtRC/j7y/+peLK8p7cFWulFYDVigfF8dR7ccABbKZy5bpIodvqGlWnLl2U6fxgoBxzvMMnqCMGWgYqty9/W340aabhto32MR/W/ApTd8hOiNdN4ck99gnu8TurS2YdFa85/3HypVeRCXEU7wCd4PwdzvLx071IgMZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gw2xphWlCYN1y+gl6mor7MMYkRi4vPBzRRABXc+P7ec=;
 b=HlZNsG5LgjAzuV2Iz1LxDSjtBVjc7UY9HKSBwZ+lROIaKcQegv1XIyN+cvznckA9bltjwWJZJh9VOFSOfsw03/Mk/eFMmYICB3gIGcZmlgPHu94lxvXSIo5Ut/Uor1r2Ug0r4Y0CamK6/PLN0ZVMbc17ha6sEBXBmYFdXujvsnuvdJrKL8TCzrih0rPsrhrzXHPSZneisTfi7KX5HcutclsvtwSahxfXDpP2JIvNwzAZBQeF0GrHTD90pUz3IV8V8bFC4UQZxEjm0lcgZJzLWGERv/RVYb0VhV7OzuPRpfKamizWOihDXBCwUuwJcELleVXxVvdnced3rKsB4a+ihA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gw2xphWlCYN1y+gl6mor7MMYkRi4vPBzRRABXc+P7ec=;
 b=p6gHH+IKEEE/BgpYAdqTSbfz3N38Ys4u5o2QeAvGrznaoMZZ3zDi6yP0BzvLP7jsS4hFgxX/5Q6mG46lP4cqrzu9yDm5HlxQghUmNy2Gd/cIEvuYpEdiv44AkMPXDF9AoiI744OqYwKVtt051UUek49NE9vALT+nsEjxMWwwmsP7GosLlmCxih+ZnSF8comoiWLs4Ne/ZWAgarZxFELTbHwBgoz52OHZHbyxS9LI4ZvxmacRKhi2J665ED/+kXvIK2AtV1n32+g0j420Psfy9Z1+4ZSw37VCXTyDU6Aau/XowisQ2vl3fE6zDnnhxxtJQL2j2ghzcL1U4K/Omy3XyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da4592b3-b5f2-50d8-b474-9b2340b5bb81@suse.com>
Date: Tue, 9 May 2023 16:38:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 2/4] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1683131359.git.oleksii.kurochko@gmail.com>
 <d1a6fb6112b61000645eb1a4ab9ade8a208d4204.1683131359.git.oleksii.kurochko@gmail.com>
 <0533b045-f4cb-0834-ae88-9229bd816cf2@suse.com>
 <db6fe5a3db067ae3429d4b83766508233dfc9ca8.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <db6fe5a3db067ae3429d4b83766508233dfc9ca8.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: fc71fba0-48b7-47c9-4ff0-08db509b1322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RBMfnhB7XWS2RVUwy3QAw5//TgnIIApc2/92LM5RsA0kn0t+rF+AVE3Uv3Zygbp2CUxZNpSJesnpSZfzwyuxY1gjvDjAx6RvN3gsBQPG+PxrbQqTM1jhMxfQe6mYZg+pxJUM/zKvMaucF9p/u7/6Sy4x9hkrogyofP9aG5OqfoYXQmH6InbdPUGeHdd4mZ5QouBEjoszJXIsE7aPbpBAlGQ38Mbyz4+gm2x45noqZJuoowdHKR6q7MGXKUus1PlgMDB8vL9H1EAIg/m3JMIl3ukeMs9a0DpYKdcLLssPHabeWeSm0/PPca48kmFscE8Mp8Nzh455DniSGZW0hB7KQ6qP9eEom2MyWGIhDp9gngTdqdgBSRWqgwqCAH907lnYBHfKVNrwYl6V/jWs5hMc+z2ubCy8NVkOQIm1LE715dI7uYNPgUho7xWoj8XwOcjRLDpGEMMZxnjyN0Yhdbl0ai6ue2veKXLytbKCDL053GFY0+MgHUmfd2vCuN0veCPo3cXrCNY0PhE2wSQ/eGioOlQaA/zcaZgsTXVAvbi6QZUq4b+s6F9U7NeTwuocYUdvIguuV/K3LGSKcJD1KR8ba8xFmPDfEPILNFgN4Z4TsffXaSbnp/FljZEEdJh/Cl03Z8soajQe0N4dZZReqotgcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(396003)(39850400004)(346002)(451199021)(31686004)(6486002)(41300700001)(36756003)(31696002)(2906002)(86362001)(38100700002)(8676002)(8936002)(5660300002)(66556008)(4326008)(66476007)(66946007)(6916009)(478600001)(316002)(83380400001)(186003)(54906003)(53546011)(6506007)(26005)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVNrRmx6V3NkN3c4dEFYSzdMdHpFQlRjRTJyMlNSSGN6cHZaRllIWUhJK1Vx?=
 =?utf-8?B?UlhiVXBLeXVneVJPdkc1dTN3ZUNIdWZZZUpXcnZwRU81MmgyenlNaSs1aTRR?=
 =?utf-8?B?TU93cWo1SkJ5ei9qZXAvbWNzcWpNVjJNY0NZY012MlVBMDFKcW9neERKRVI0?=
 =?utf-8?B?eFRBbUdpaFI1R2J3OUxBMGJCM1BvQ1ZvSjJ3MXdnVlBrbVo0WWwzQ0dSTVkz?=
 =?utf-8?B?MUZOTGhvcnYzTThpdEViMDlRTnBTMHZaUUFkR1dBUTNyZCtjNlIyb09WYi93?=
 =?utf-8?B?ZnBMbnEzdTduWEhnQ3Q3WU53SjljMXI4ajgzS292MnBocFJTb2JieFB4aFVy?=
 =?utf-8?B?ZStTbFMxTEtQYy8veWFoemZHYkFJSXBkQWF1dXFieW5aNkVpa3UzdERIZVpL?=
 =?utf-8?B?UU9NQnF0NUdOV1AzWER0MkE2ZnB3eENYMVRSOTIwUG5IdDNaTmNEMGsvMjZ4?=
 =?utf-8?B?bHFXVGg0VjhKRmNzWFJwNVR6bkluTExERXluVDNDS29DTmF0U3NkcGhEd3Q1?=
 =?utf-8?B?RHROeVhIK2hZenpWNDJ3MzVPUDdIMHRqZFBYSlRPVHdrZmtqUVR2aThGSzRG?=
 =?utf-8?B?KzVoZkdmL2ZqYm1UcDY3QkEzSWdYdWRLY0kzMFZWak9mNDkxb00wZUl0RHg0?=
 =?utf-8?B?RUZHeU1sSGF2V3lxaFZDZEpxRmNRblpCNlYydHNaSVo1TGxGSzdlM244eW12?=
 =?utf-8?B?RG1rbDR1ZFRnYUVaL3Mvb1ZubEtka0NBZ0V3b21RWWVwY2xsc25sMGFaalhY?=
 =?utf-8?B?SjBSYk9hRUFXWmdXdHFwaTY0VVlwZXFZRENuck5naGZFcUFWV1g4M1EyL0pr?=
 =?utf-8?B?ektyVHBRbDlKSzlvb1J3TmFVcmNoN1Q5VDluSmJTaUJsRWRnZWZCOGpKMDVx?=
 =?utf-8?B?Ty8vNXZNUlJnTDhTdnZSaHc3VFc4ZlQ5L2dKa0ZjMnpPOHlJWmhOT3Z5ajZy?=
 =?utf-8?B?VDYzNlhybTBSNERoUEtRVHp3UURmZkZqT1lPUHQ4SDJQNWFDWXY4a0JON29m?=
 =?utf-8?B?Mys1SlJZZ0RNR2Qvb3BOYzFSeG9IcG42L2NRV3B6NFFXTkdOQnlCMWROTnQv?=
 =?utf-8?B?aS9VUngvbTV1T3MybGlQL0dkSnZJKzZPUFNTNGFBOGNCQkx4Ti9GeXNwemZa?=
 =?utf-8?B?c0JrUU9yV3ZwK2VheXlzQmdmM2lUUVhmUHo1TXlzY3ZEdXFodFNxb1hjbnI2?=
 =?utf-8?B?OFpGN250dHhsZ3N0MjRnY2JVZnIyZkR0RXlXek93aTUwaFVheE5hRE9nY29V?=
 =?utf-8?B?UjU1ZVVHLzhXR3hPQllBQ0VaZWRQamRPN01uQkFjSERtSEVtdUxXMTl0SjN0?=
 =?utf-8?B?UkJ5MnErVzN2UDRhcFJ2QUdaRi9FZUlaWEhTVUFzZzk4cy92WGxiSHNJbVZ3?=
 =?utf-8?B?RW91K3JGREdYd1NjQ2QwWUovemZ6SDZLYTFjVi9idjN2b0dDak9UY1NpZVFZ?=
 =?utf-8?B?c3lLeld5OXhQUlAyeUpScEswK3VuSnorMTd0NlowbDlHcXBvL3RyNllUQ3gr?=
 =?utf-8?B?VVJVdmRrM0UweFdRajZ2dHQ0MVRYcmFJY1lnK2NqT2h5cjA3KzY4MmRwQWE5?=
 =?utf-8?B?djRHeExidHJOZjR6aTJ2K3B0RXZBUUVmUHhyMmw0SnJFdzRzd1lHOXVFUWZo?=
 =?utf-8?B?bWwzN25xMkR0dXFxS0JXdkY0TnpyZ3B4eVM5bEVRdjNMbjVVa0VScU1zQkk2?=
 =?utf-8?B?anBuMTczZWtDSUJPL1dTSnFBU2grRlEvazhZRUc5Z1phNDRtN2xzQ2ZWUTJP?=
 =?utf-8?B?M3ltZzNiTytWbEdkRFhLb3ZEY0p5ekkzc3Y2QlNpSE5kS1kyaGhvNHRJRG5B?=
 =?utf-8?B?cW1jRjdxSFBoU1p0cnNzUndMUUt4MGJsaW1MRysxTmx2R0RacmxFUVlQOFFa?=
 =?utf-8?B?TUdBdHFISlBHbXMzVjU2aWxhaGNqWXpqMlNtS3BXRk5PdktEYUZtRFRhWG9j?=
 =?utf-8?B?MnhHbGRHTVRpckVzT2tJSk1YN0ZOQmxlMnVLeVRxYmc4ajVNUXVtenlrWEl2?=
 =?utf-8?B?N1VNYTFCK1R3UW80UmtKN3M1MDhnZmZTTis4RnZvRFA4VHhWWTl3b21SSHJM?=
 =?utf-8?B?L2ROT3ZyeWM4eG5ZYmxFTXZmNzl1YU4vYURKM28wSnE1MXdHN1RJVEdaZ04y?=
 =?utf-8?Q?IH8sF+Sfqggcp/qYv3htniHkW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc71fba0-48b7-47c9-4ff0-08db509b1322
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:38:37.5619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNgRRtNOqBn6yKh9Caio6Cn/QuoeyGTnMcCkPpOPj/fXoJ3nuH24uPNH0491FRP7jogvAIR3rLMKlg1HHqLwag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8629

On 09.05.2023 14:59, Oleksii wrote:
> On Mon, 2023-05-08 at 10:58 +0200, Jan Beulich wrote:
>> On 03.05.2023 18:31, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/page.h
>>> @@ -0,0 +1,62 @@
>>> +#ifndef _ASM_RISCV_PAGE_H
>>> +#define _ASM_RISCV_PAGE_H
>>> +
>>> +#include <xen/const.h>
>>> +#include <xen/types.h>
>>> =)+
>>> +#define VPN_MASK                    ((unsigned
>>> long)(PAGETABLE_ENTRIES - 1))
>>> +
>>> +#define XEN_PT_LEVEL_ORDER(lvl)     ((lvl) * PAGETABLE_ORDER)
>>> +#define XEN_PT_LEVEL_SHIFT(lvl)     (XEN_PT_LEVEL_ORDER(lvl) +
>>> PAGE_SHIFT)
>>> +#define XEN_PT_LEVEL_SIZE(lvl)      (_AT(paddr_t, 1) <<
>>> XEN_PT_LEVEL_SHIFT(lvl))
>>> +#define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) -
>>> 1))
>>> +#define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK <<
>>> XEN_PT_LEVEL_SHIFT(lvl))
>>> +
>>> +#define PTE_VALID                   BIT(0, UL)
>>> +#define PTE_READABLE                BIT(1, UL)
>>> +#define PTE_WRITABLE                BIT(2, UL)
>>> +#define PTE_EXECUTABLE              BIT(3, UL)
>>> +#define PTE_USER                    BIT(4, UL)
>>> +#define PTE_GLOBAL                  BIT(5, UL)
>>> +#define PTE_ACCESSED                BIT(6, UL)
>>> +#define PTE_DIRTY                   BIT(7, UL)
>>> +#define PTE_RSW                     (BIT(8, UL) | BIT(9, UL))
>>> +
>>> +#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE |
>>> PTE_WRITABLE)
>>> +#define PTE_TABLE                   (PTE_VALID)
>>> +
>>> +/* Calculate the offsets into the pagetables for a given VA */
>>> +#define pt_linear_offset(lvl, va)   ((va) >>
>>> XEN_PT_LEVEL_SHIFT(lvl))
>>> +
>>> +#define pt_index(lvl, va) pt_linear_offset(lvl, (va) &
>>> XEN_PT_LEVEL_MASK(lvl))
>>
>> Maybe better
>>
>> #define pt_index(lvl, va) (pt_linear_offset(lvl, va) & VPN_MASK)
>>
>> as the involved constant will be easier to use for the compiler?
> But VPN_MASK should be shifted by level shift value.

Why? pt_linear_offset() already does the necessary shifting.

>>> +    csr_write(CSR_SATP, 0);
>>> +
>>> +    /* Clean MMU root page table */
>>> +    stage1_pgtbl_root[index] = paddr_to_pte(0x0, 0x0);
>>> +
>>> +    asm volatile ( "sfence.vma" );
>>
>> Doesn't this want to move between the SATP write and the clearing of
>> the
>> root table slot? Also here and elsewhere - don't these asm()s need
>> memory
>> clobbers? And anyway - could I talk you into introducing an inline
>> wrapper
>> (e.g. named sfence_vma()) so all uses end up consistent?
> I think clearing of root page table should be done before "sfence.vma"
> because we have to first clear slot of MMU's root page table and then
> make updating root page table visible for all. ( by usage of sfence
> instruction )

I disagree. The SATP write has removed the connection of the CPU
to the page tables. That's the action you want to fence, not the
altering of some (then) no longer referenced data structure.

>>> +void __init setup_initial_pagetables(void)
>>> +{
>>> +    struct mmu_desc mmu_desc = { 0, 0, NULL, NULL };
>>> +
>>> +    /*
>>> +     * Access to _stard, _end is always PC-relative
>>
>> Nit: Typo-ed symbol name. Also ...
>>
>>> +     * thereby when access them we will get load adresses
>>> +     * of start and end of Xen
>>> +     * To get linker addresses LOAD_TO_LINK() is required
>>> +     * to use
>>> +     */
>>
>> see the earlier line wrapping remark again. Finally in multi-sentence
>> comments full stops are required.
> Full stops mean '.' at the end of sentences?

Yes. Please see ./CODING_STYLE.

Jan

