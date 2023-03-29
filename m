Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C816CD917
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 14:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516238.800040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUZk-00067i-W6; Wed, 29 Mar 2023 12:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516238.800040; Wed, 29 Mar 2023 12:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUZk-00065L-Sb; Wed, 29 Mar 2023 12:06:48 +0000
Received: by outflank-mailman (input) for mailman id 516238;
 Wed, 29 Mar 2023 12:06:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phUZj-00065E-J9
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 12:06:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d26830d-ce2a-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 14:06:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7735.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 12:06:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 12:06:43 +0000
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
X-Inumbo-ID: 2d26830d-ce2a-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFb8vFoGe6D3qywZ6MaMsawWhdHJP9CuQTjDxYQoKv9M5WBNbb2A6oCO7zhmeVjJYqHlPTiZFZRXNxALs2AH2hP64p74OzePpytAV2NYACYEzUa8gUWeGrss0wOwg7ZaVgtSak70aoBzMzpA2R/Bwi62etATHr0o1pHA7MHGjRHDIq6qwg7/iKosv7/apSoa7JgL3s8j0bop66svacMle8/pnNwq/n+C/ypZFkqHRzqg78E6o9rzoTXJXXR/BR0MAWIv2YkEb1WAZXjJzI01RwF9bj0XckkUo5eT9qJbdj2/zA6/2Kmo/KC1IFk2Zb2HYHMIphaTNeMYO91FVLSxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C184tFCrsDO43lZbwFwhZRV6RvW9yUSnFb0tMDnXM8Y=;
 b=Qfql7FGlDRDDRG6H3exVftwLi7K8qHCq48IzcaWvS9kVfIVG01i4undzC5oIiFVr9LnOGkiL03l24ytOZcTOSp3r2g+G95lErX1Qyku4CupSzn0LkBqko9wa1Mdjkj5pvYbyBQlDJUpHqhQdY28YFO8CDgyosu84rXg1AsFIaLxXq1+uZr9LL8bmKk/evQ+9kFOXvozZXP1iBD/YJirtMxDpZVhCCyHjZuCEJHoOa3pPkZTYPt/YHeaFQZ2t8jJHJjrJOw6LPQcebKl9piuoq7A7NZoGGtSN+8Ba7rUlpr4Tu57LUqTzf454UPNPxwgo5SvbM69SqX/3pDnzL8+2cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C184tFCrsDO43lZbwFwhZRV6RvW9yUSnFb0tMDnXM8Y=;
 b=G63vP8dDcxGYt56QUSt8/oEN0QSDn0UNwZfXWGb44vK/C6fMf9vdo8JvWt0TlLVjFxYMIW2CWv7V8mx7JVdJg4twspD7WrLxS4oB0WtuEDLJfT05GMSJvnKQm8PZCLbJeot2j6gRdM1dBXVY8DjQ3PoFTUHdYPLcqsrVaUKUw5sSsLyzUMk80f6vB12N57aEP3UNjplHV5Rprb1VxODXW379iGoTz3nhIf/D8brwmJ8CEP1MeW1uvd8lSXQaQf70ysjMiMYqaUpec400beVDBisquYr10KGvI0z0hf4/ETotvms/19hBFJU8iKIvgJjQts0TX0n/FgN6qqt3YTF0Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <621425bb-03ad-1a5b-f53f-553eeefebf44@suse.com>
Date: Wed, 29 Mar 2023 14:06:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1679934166.git.oleksii.kurochko@gmail.com>
 <93da6ba381604748e2c71e2ebd35e80798ec4bb2.1679934166.git.oleksii.kurochko@gmail.com>
 <0a16b79e-8292-6947-24d4-dd027113943f@suse.com>
 <f83cf0373bdcf31d6d273d53949cb81f54f74d5a.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f83cf0373bdcf31d6d273d53949cb81f54f74d5a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: 896bddd0-2677-4f6e-7a8a-08db304e0ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NfthtHcxrMkHnCDsnaa/mBjTHe+2tlkKOZIPb2cncJsaZsNu8QoSq+k3UAgQXV5hCCRTcWKF3XQAenr97uCYxjSpmFlZdosQBp77xp+Rej5xYt+CR9eI0XpPTjRhwuOWpKtttgpTwEIZQAG3fb09wMtuUdYHCNeqOy4IKqfoCYNMFgTAFbisG6kpOexBfAGzZ4/Qn4Ja7Ago1QVLmY48PoCMcfrKI/S1EOwtNA4g0drKmsaKInHhuG5kEwrwtL/g3RyPBvnvxVlU5CbP5bWtCreFby9MEoNIN7D60culsu/2sBuqkc3rVXt/UW/WMHqpImiqm+rs5ZdzgKim8lRMEYEPaD6CXv00EiiHu/bwLEEvjO3nFRzWsWvy31QaYeHP4oOZbxXx1D+PFF6Kq5VLH5mPQSUkrg8izGyyUf48K5jcBKCXSMcRcwzgtu+gUsSGuehusm6RyH4mdx3WWF8GST2y0UJJBVPQWBHVC7d4JPLng9rgXS077tTvWOWnaSjLQgkCt0h8NEDKbE/NtF/MC4u2DKRDDk1hv7WCJsaGevd/E8kN4WF9jlAkhLnAvMG4tvelWNlNARDn3avLVNic8/yQbNYWk/i3iNoWVWj+jhlueBBaqF1/Hr9plfNzYcvl7QVsS8dkmH4HPkWhkCFtJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199021)(83380400001)(31686004)(26005)(53546011)(478600001)(316002)(54906003)(36756003)(66946007)(8676002)(66476007)(6916009)(66556008)(41300700001)(31696002)(6506007)(86362001)(4326008)(2616005)(6512007)(966005)(38100700002)(6486002)(8936002)(2906002)(5660300002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjNBRHpGeUpCMzV1NnpMTFZ3VVJUSWdDMTRiYXYrQTdEL2wxS1FvU0JmZVlr?=
 =?utf-8?B?L2QzNmU0cGt4aDVLRG1zTDVKUFlXSTFwakFnOFN4VkU0RkpLTW5GZjk5YWQ1?=
 =?utf-8?B?eDhqRkU3ck1KOFdZcXNuUm95NWQ4emFBbnhpMzVDenJ4OUFLMEp6aHUxNksr?=
 =?utf-8?B?ZXZWUHdUS0x6L0dOUHV5VndXSHhEb1Fibm9CckFKSGJZa0x0WjFyeHJrRFVy?=
 =?utf-8?B?ZEhrbkpjZ2hIb0VlZjJxeU10N09saHIzbTI5WUErODVYSXhLdTl3VnZHY0FL?=
 =?utf-8?B?dHNDK3J1QnJYektjTXRzaWZ4UGZlcG1rL0hzY1pORzZzSXRWNURQSXBvdHJw?=
 =?utf-8?B?WUorT0I2anFKOC9YVTdtVGRrekx4SUYrYVkrSnh0MUJicDV2a0ZJQ2tFVVBP?=
 =?utf-8?B?RTJ0amNzOTRGTXpQay9TZ2RxYWNJRlU2WlRGTFBxTUtibUpEd0wrRVVMWk5K?=
 =?utf-8?B?S3RXem5NSm5laHp0S28xOG1zYXJiZlRkajFwMGZNclk0U29aV2JjVDhqaUdU?=
 =?utf-8?B?ZzdOM3lQMURzYkl4Slc1Q0lkeEdUWXZBb2lRT1J1aXpzT0NsUTNsWmFLVGw1?=
 =?utf-8?B?K2I0WDI2M3F1WTU2bXI4V2FOdURIdy9FdVJFNGF3aER5QjI0UWtJM3IwTXNx?=
 =?utf-8?B?THVKczNKZ3BsVFhqdEVoYWNaY2kvY1ViVkxFRW1SSTJCcGx0R2U0WVl2c1hH?=
 =?utf-8?B?T1JBVnF6ZmlhK0NXeXE0NFBvY0k1QU5zaDFxbUVaWlVPS0lUTkNEdDZXT1pT?=
 =?utf-8?B?ZG9BeDNteEVyNXZKZVB0dUw2OVFVWityZGpDMWU1NjQ4TGcxZW1Lc0RnSHVV?=
 =?utf-8?B?VEg5K0hSV3Azd3krK2RVelZGeUpoaXVLVitMZWwwS3QyOTVRVEF3SGk5Wnd4?=
 =?utf-8?B?NlhKZWNqWHNZNDJGd2RMRERjcGFEek1JRTBYaFkrblFHbnlKRERGWUd0ejA5?=
 =?utf-8?B?ZmRxbGJ1UWN1UE9YMEQxczZRNTVVbEZvNWFtM2d6R0d4OFYrT0h6dTdibFZ4?=
 =?utf-8?B?OVRQN0dJblBCZVVLNlcwOGV0a1RTTXA5SXVHUGlVU2JmNzFTalFpSWtibzNj?=
 =?utf-8?B?OWR4OURXWWxvVFhjKys2V09CNlFkZWVRK29XcFBoL1d4VUY1MEFTckVSM0Vj?=
 =?utf-8?B?T2JyZ2k4eHBTUndtelorR3podmdYVHp6emw5VzBLd28xY3A4VUVGTktodENV?=
 =?utf-8?B?NDRrNkUrbzhybG81QmZ3RUxaMWhSOFVoU2IzcFZzRGF6UkNHYmpCL2ViaytY?=
 =?utf-8?B?bVdhUU5pY3dFWEYyOC9TODlmVU5PeG1wdnhYU0JrZGVtbi9nYld6bVZFa2Fo?=
 =?utf-8?B?L2ZaZ0gyZHk2K21uTm9rRmhzT2J5QUNSbWV5QXgzUUd6dzZaMThsVk4rN0VL?=
 =?utf-8?B?OXVHdDNiWk1pUGgwSnZnYVJlR2RYQW5rYWEzbkNLOG9Ld21wK1ptMXRyT1Aw?=
 =?utf-8?B?Skx6Q2VvSnVpY01HbmJPZ2pjYk5Md2JrRDVpMnR6b3ZkRC9SMzlQQ2czUDFE?=
 =?utf-8?B?S0U5T2hLaHNpM1B1cVRyc3ZGb01qRGxBaHBVQTNSZlFJTVRadk5xQVJ2aVhQ?=
 =?utf-8?B?b3k2b1Q0VHVZbUx4MkRLWkFlNUZKUUcwRmhGM21EWFNiODVYOUF5Lyt2UWN0?=
 =?utf-8?B?ZVpnY0tWVmkyUDE4elV2VzJabGVTWGtMRlZXYXZyZ1gxZUVPVVJpWkpzWEhp?=
 =?utf-8?B?UUpWS2lsRmRYRlUrYnlpdzhXZVhOYTRlRVpaNm44dEQ3KzlYcUhJWHBvU0FW?=
 =?utf-8?B?eFJqZ1FvQ0h4aXlXd2hHUUo0SUt6Z0ZZL2NmbEFoVW9WR0hMVW1pMXg5RCs4?=
 =?utf-8?B?VDZWWlVSd29pTUJWTk1KL095dmVEcjJvRGgwWFNwc081TXF5aUwzMVQrMlk1?=
 =?utf-8?B?aTBZK1NCWkRjbGtBRGVoRkljbU9lcXQraVlnd0kyc2xQV09MMmlERkxaVGxn?=
 =?utf-8?B?b1g2VGxTTlN4QW95OWNUWGhtMDRyM01mTk5xTjg1VFhxSkhSRm9sU1ZuV2RF?=
 =?utf-8?B?VFRVN3I2bWpRTUZhQlk5MlFham5Mc3g2MUdVZnUyUkwvNWVNWStuM3J6dERQ?=
 =?utf-8?B?SnJhTDVlYXFrRUIycEJpRjg4YXRyV2NNOUFaVHRpRmFmR1FMaEZPQXNQdUFX?=
 =?utf-8?Q?6phkZVA2d0W2Icn347VeboRCR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896bddd0-2677-4f6e-7a8a-08db304e0ff7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 12:06:43.8264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpnn71tWDS//R/WJX5q9xQ0XpSUfBrYQpVS9cU7DZGhXC1gwimodjGo+zUJbePuFz2VuWC7o3HS4ksEUrEweTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7735

On 29.03.2023 13:43, Oleksii wrote:
> On Tue, 2023-03-28 at 17:34 +0200, Jan Beulich wrote:
>> On 27.03.2023 19:17, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/mm.c
>>> @@ -0,0 +1,277 @@
>>> +#include <xen/init.h>
>>> +#include <xen/kernel.h>
>>> +
>>> +#include <asm/early_printk.h>
>>> +#include <asm/config.h>
>>> +#include <asm/csr.h>
>>> +#include <asm/mm.h>
>>> +#include <asm/page.h>
>>> +#include <asm/processor.h>
>>> +
>>> +#define PGTBL_INITIAL_COUNT 8
>>
>> What does this magic number derive from? (A comment may help.)
> It can be now 4 tables as it is enough to map 2Mb. 8 it was when I
> experimented with bigger sizes of Xen binary and verified that logic of
> working with page tables works.

Since this is connected to Xen's image size as you say, I guess the
constant wants to move to a header, and then be used in an assertion
in xen.lds.S. That way one will become easily aware if/when this 2Mb
assumption breaks.

>>> +struct mmu_desc {
>>> +    unsigned long num_levels;
>>> +    uint32_t pgtbl_count;
>>
>> Nit: Style (as before please avoid fixed width types when their use
>> isn't really warranted; afaics unsigned int will do fine here and
>> elsewhere below).
> I will change it but I am not sure that I fully understand what is an
> issue with uint32_t.

The issue is simply that ./CODING_STYLE says to prefer basic types
whenever possible.

>>> +void __init setup_initial_pagetables(void)
>>> +{
>>> +    struct mmu_desc mmu_desc = { 0, 0, NULL, 0 };
>>> +
>>> +    /*
>>> +     * Access to _{stard, end } is always PC-relative
>>> +     * thereby when access them we will get load adresses
>>> +     * of start and end of Xen
>>> +     * To get linker addresses LOAD_TO_LINK() is required
>>> +     * to use
>>> +     */
>>> +    unsigned long load_start    = (unsigned long)_start;
>>> +    unsigned long load_end      = (unsigned long)_end;
>>> +    unsigned long linker_start  = LOAD_TO_LINK(load_start);
>>> +    unsigned long linker_end    = LOAD_TO_LINK(load_end);
>>> +
>>> +    if ( (linker_start != load_start) &&
>>> +         (linker_start <= load_end) && (load_start <= linker_end)
>>> ) {
>>> +        early_printk("(XEN) linker and load address ranges
>>> overlap\n");
>>> +        die();
>>> +    }
>>> +
>>> +    calc_pgtbl_lvls_num(&mmu_desc);
>>> +
>>> +    mmu_desc.pgtbl_base = stage1_pgtbl_root;
>>> +    mmu_desc.next_pgtbl = stage1_pgtbl_nonroot;
>>> +
>>> +    setup_initial_mapping(&mmu_desc,
>>> +                          linker_start,
>>> +                          linker_end,
>>> +                          load_start,
>>> +                          PTE_LEAF_DEFAULT);
>>> +
>>> +    setup_ptes_permission(&mmu_desc);
>>
>> ...: Why does this require a 2nd pass / function in the first place?
> Probably I misunderstood Julien and it setup_pte_permission can be done
> in setup_initial_mapping() but here is the reply:
> https://lore.kernel.org/xen-devel/79e83610-5980-d9b5-7994-6b0cb2b9049a@xen.org/

Hmm, yes, his option 2 looks like what you've implemented. Still I
don't see why the permissions can't be got right on the first pass.

Jan

