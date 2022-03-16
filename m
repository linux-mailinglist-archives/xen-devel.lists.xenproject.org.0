Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF224DAC82
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 09:34:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291080.493836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUP6T-0001d0-UC; Wed, 16 Mar 2022 08:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291080.493836; Wed, 16 Mar 2022 08:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUP6T-0001Zg-QV; Wed, 16 Mar 2022 08:33:57 +0000
Received: by outflank-mailman (input) for mailman id 291080;
 Wed, 16 Mar 2022 08:33:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUP6S-0001Za-7t
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 08:33:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d077ebae-a503-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 09:33:54 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-Gn67vANxMUmxTsI0yEnTgQ-1; Wed, 16 Mar 2022 09:33:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PR3PR04MB7419.eurprd04.prod.outlook.com (2603:10a6:102:80::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 16 Mar
 2022 08:33:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 08:33:51 +0000
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
X-Inumbo-ID: d077ebae-a503-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647419634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r3RmQ94xFfnXTaaoSOp59U6P1GkjQhDbFvLtOFBCVPs=;
	b=gnnC4iKwaSXFYQ+iOh1CRltGE9+v81n5CdfYGMJhkqYsjViFteRYPWuMzA6y6xNsP8ozGK
	bSj5ZYVr1LEF8bu0YwpIPsxuGnrilcFfNFrrrlJ7lSSn0YDCFh8kNvntlT2zx3H92hu9RA
	Brc5P2GH0rLxuiH8s6KlyilxvDmUMKM=
X-MC-Unique: Gn67vANxMUmxTsI0yEnTgQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5MgNjqpR5C7qJrsWy1gj1wMIlTRo8/P16H3ajQNfGL6c2ZPEhu0HNtUikq6YUpa4qTjb8/Y1XpgfAl9VeZZ8BCNSQ48HRpePpSW5ouVPJV7pQqo+gIyvfcq9qY5IM3V7r/vsKFpQxmYNyEAsBuFU++VkUWgkQtK2GWwEbE2kZ3sbOhr2KulK8Ni3D3g5OYcA3vQkdS7pDykwbeX/xYa8jAvq8XnJ6kH2o+5kj83bpeLlr+KiR3IMvaLgB5ThAynuD8Vfb45E2+freNX8r8g5S0Tga7OcTn6SIiEE8BxurRbL5oR1kVxnVsyQvsN+XsXYRU1x6fTnXXHeovlNHRacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3RmQ94xFfnXTaaoSOp59U6P1GkjQhDbFvLtOFBCVPs=;
 b=AuYygo2I5MbFuHkEfk5FwHf4GM95bXbantTVdA5QA1BUDpaMVFY9LSapuctiPTQXUbEZTIWJ95/Ou3DkHaA6fWmeAgGnjaoOGjrehbiNZajIppwBvCIWvf5UIuMallLjDqYws6dSSn7s8g30ImipNhss1YpGFeZrmLc+tlP+2g+Y2I8UIqOYVZ+NGpQAXzZx2B4y94pNp1vaNt437ytu3Dem+7r6jBx+ZOD1A5YNNk79nkHgJycduGwpxZws0L+i2NDXV6iNin8pxQfAMThPbevudxLdKtas6L9yFYs0Vn+ebH5NHM6MG/tGhkGycR+flDVjBLMH1tpjMbZfrsxuBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <345b2f17-5fba-5dba-f7f5-c1634fc69a6e@suse.com>
Date: Wed, 16 Mar 2022 09:33:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/cet: Remove writeable mapping of the BSPs shadow
 stack
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220315165340.32144-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220315165340.32144-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77f235d0-d971-4714-d548-08da0727b2d1
X-MS-TrafficTypeDiagnostic: PR3PR04MB7419:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB741977F66A04E9B3143F65ADB3119@PR3PR04MB7419.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zjpg1tjdDt1Cdv2URofSAv9nrpKXCYH8Hs1QNp+Li8hLIXVc/5NABW83EC9fBUbC8EvmH0plVG1/uU9QmC0wQxdfWm1+Kyayc+5EPyDk5gppt1q5k5D3wAWb77vykMcfz3kfBN/QDHQ7vpwYT7Jf37JDW2scSPwAK12RjlDB9ilmEULbpBgU2pvsN7YaAZAjCxy0+AWuiuCUd8dx6UbdNhE1nO/b0JJY4NGCXBZrs6Gv98Bp64RKruGoyteyZViY7V6+9gCzrf1IwwjoPMYEXdjtT1vTu4l0dCyDunQO0WmKAGNGSQOuE00K073gg4Vxcyl0S/WMNyXW/VsUEoHVU9+zAjcOMqcwRHV8StyejlshkZCc5OHujO5PXV5LBzvH1+Jqs1wVnY0jbPzBigeq8vusPnBmk66vbV+G+uRupf8e5mLDhEFW0KAzASx09uwuD4YhnxIpb9/r3gGbEM75BBXxkOub/JGzqt1+rNJjaVeABzuUA1seMpPR9DsfQj+kEmctFMn7DjAsx7AeEnxNW74/+6HzKw2pW5H49tXuo4/WE/R0hOjg/o1LLoVywj7hUMSDf7t+fduWLLiO1Bz/c1L2aSZnCnMGLLISPKNJsr3ODLUHiAS62VfJ83cQSJqJ6VHmHt2GHlIdaxWdKOyF3Ty+0ePBT5nCv3OO03/RSADhqDV/oJuyUylFJKnhyT+EcSBd3pkmWJAU4H5ntRkYs58hs891NhEBlHQso1tzQvY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(5660300002)(8936002)(38100700002)(31686004)(2906002)(6486002)(8676002)(4326008)(31696002)(66946007)(66476007)(66556008)(54906003)(6916009)(83380400001)(186003)(26005)(2616005)(6512007)(36756003)(86362001)(53546011)(316002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkRxa2VCcDV5K0JkVmZmUEhoOFFWY2NETHBPZlo4VXUrdWdnUkJFQk56eXlP?=
 =?utf-8?B?cllXcTBQemN3NEMyREoxM2pUNzgrUyt3UlNzdnRGZ0Zqd05LVjZGU1FYRHNp?=
 =?utf-8?B?ZWhjUnVSM1RSNnZpODE0aFNESElJckVWQjViNmpTUytRV2NrVzExaG5kMGxY?=
 =?utf-8?B?S1VwZEMvenRjUldpdTd3TnE3Y2JDd1FhcXNSZk9hV1JyQktEZUVUcFdwbnhs?=
 =?utf-8?B?WGs3NjJ0N0JSMWN6ZysyeVJUMXBGNUhEa2dYY2paVU9RaHBWR2t6T1gxRWI4?=
 =?utf-8?B?LzJiQ0hGazdzV2FUYndVWG5YeUJYb1NDYjdtOU9YZ1pMWkY1eDQxOUlTMEhp?=
 =?utf-8?B?N3dHWXd3eXIyYWdZeExxV2sra0xaR3lqRVh4S3QzMHMwZ0lJRmpNVVlkQkox?=
 =?utf-8?B?T0IwbVJnYlhsSnRNYjA3TkpGRW5nRWQ1Z0I5Ym0xNXdMWTRRUDEvTHU3SXhO?=
 =?utf-8?B?K3pZbG5UQXo2YjhTdGRpZDJxL2ZaTit6RHg5K20wQit6OVNSOHFkbW82YnNy?=
 =?utf-8?B?RFovUi9kVWxNUS9mT1Bia2xhM0cxRS9PRWQ2OUx0U0NCWllwbEZ3S1hQL25y?=
 =?utf-8?B?MUc5WG9yWVBIbWNGcFBDOWRhVnBBM0tiaGljOHZqbFp4eGtEaVhLOGM1bFdp?=
 =?utf-8?B?QVJyK2lyT211YmZCSmFNK29idCs1N3dLUmh1U0prNVRwOWhnL256WnU1OUpN?=
 =?utf-8?B?aGRRSzVvaCtUMzBTb2NERDJIbFlPNCtidS8vblp1Q2hnT0FQaWxyRHlCaGc5?=
 =?utf-8?B?ay9JdSswLzE5SzUzQ3BXbGhIbWp0N1hteFdxUmRRZjMva2w1Y0Jxb0orYzd3?=
 =?utf-8?B?YkQvTWRGSFQ3a2xEK053Ky9LOTc3UWY5SERNQithWDMrNzQ0VlVta3ZQVGpB?=
 =?utf-8?B?MUYwK1VWa1RaVXYwZFBoYS9PSWI3YzdaaFVwU2ROSWhXQ1hXRkxQY1hIOUQ2?=
 =?utf-8?B?QzZNdEl1aWJMWjg3THNFYW11ZnVtMUkwQlhrbkhMVmhiazEybXlBZFdYL2px?=
 =?utf-8?B?SEVadDhzSVJ0dzVYWkc5aUxSREdtZ3N1djVROEQzV1Erc09aOGVLTWlMR1hP?=
 =?utf-8?B?dlpZd0lGSWNFU0R4OFJibkF4c0xmWFcvTFMyMGxXQ04rUjcySjBCNVhQeGEy?=
 =?utf-8?B?T0t3aERiZEk4Wm1BVnhZanNTZGIxWWZDVDgvYnJLNTJUMWZhQ3hzSURQMU5v?=
 =?utf-8?B?SHBWR09lM1FTOUFOWnh6Z3VKZ3RlaW1CcUlqUXQvVWllUU50WXVyc01CVW1I?=
 =?utf-8?B?SUJSbUFiS0F6MXRkYWZnNXIyTHg0bzVLT2dBK3BKQ2hibWxWY0h0U2dkSWtx?=
 =?utf-8?B?MjQ1b1phOHZWa3YrOU56WTZzQVRrT0xwK0VpNnlyVExncW4wZlF4WGJuTkk1?=
 =?utf-8?B?VzJYT0podVFTYVVueDh2Tis1Sm1lcWVqNDV1VW9JWUpMVWV5NFR6d1AyUFNG?=
 =?utf-8?B?YnV4aFA1dWlXZUR5NCtBSHpPM1lrVWNRUVUrRThjWlo5R0hhTVoxTjhjMU9Y?=
 =?utf-8?B?blRHMDkzaW1XV29hNm5CcDNPRndWVThzVmNPSVBCcXFKZUh3TGV5NUpNSVVB?=
 =?utf-8?B?Qyt4WGx2QTFoNGNKeFFRQUZBekFPTllkNENpbHUwTTV3TFQxMkYxUHBWRXZi?=
 =?utf-8?B?MzZXZnZhL2h1NUp0TS9HVDg0c3Bvd29JY3FJMmd1Z3VYQUJOenA4cUhNckln?=
 =?utf-8?B?RXJEa1JMQnZ2V0ZuZHdtakpRQ2FjSVRrL3ZkTm1KeExzSFg1ckpKMU5zcG5U?=
 =?utf-8?B?VUpsNitRd01qT095S1cwZmNKZnNXWTJUdytKMEdEc2dFczV1QVNOMWFTVlVn?=
 =?utf-8?B?VUtUc3FEZ2FWVVBLalV3aStTWXMyTm5MUzN2TFMzTkc0RDNkTW9xRXgyTVM4?=
 =?utf-8?B?aU5ZYjFKMkEzcHNRbzRQS09UWlJSenlrWFkzVGdyWHh3RTNUbGhGa2N3bTlW?=
 =?utf-8?Q?r9tYWznmIMxZZhC54cd6hLr7QEnJ5UNb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f235d0-d971-4714-d548-08da0727b2d1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 08:33:51.2967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgsWQRT9xRsANCfJLUnd3T10jZuI/gfuNmZA0/XAdzSmZfCaTZVlajn1Gd0oXoPC8PuTeYx0lSxTSxeCEteYWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7419

On 15.03.2022 17:53, Andrew Cooper wrote:
> An unintended consequence of the BSP using cpu0_stack[] is that writeable
> mappings to the BSPs shadow stacks are retained in the bss.  This renders
> CET-SS almost useless, as an attacker can update both return addresses and the
> ret will not fault.
> 
> We specifically don't want the shatter the superpage mapping .data/.bss, so
> the only way to fix this is to not have the BSP stack in the main Xen image.
> 
> Break cpu_alloc_stack() out of cpu_smpboot_alloc(), and dynamically allocate
> the BSP stack as early as reasonable in __start_xen().  As a consequence,
> there is no need to delay the BSP's memguard_guard_stack() call.
> 
> Copy the top of cpu info block just before switching to use the new stack.
> Fix a latent bug by setting %rsp to info->guest_cpu_user_regs rather than
> ->es; this would be buggy if reinit_bsp_stack() called schedule() (which
> rewrites the GPR block) directly, but luckily it doesn't.

While I don't mind the change, I also don't view the original code as
latently buggy. (Just a remark, not a request to change anything.)

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -148,7 +148,7 @@ cpumask_t __read_mostly cpu_present_map;
>  
>  unsigned long __read_mostly xen_phys_start;
>  
> -char __section(".bss.stack_aligned") __aligned(STACK_SIZE)
> +char __section("init.bss.stack_aligned") __aligned(STACK_SIZE)
>      cpu0_stack[STACK_SIZE];

I guess the section name was meant to start with a dot, matching
the linker script change? You should actually have seen
--orphan-handling in action here ...

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -215,8 +215,9 @@ SECTIONS
>    } PHDR(text)
>    DECL_SECTION(.init.data) {
>  #endif
> +       . = ALIGN(STACK_SIZE);
> +       *(.init.bss.stack_aligned)

No real need for the ALIGN() here - it's the contributions to the
section which ought to come with proper alignment. Imo ALIGN()
should only ever be there ahead of a symbol definition, as otherwise
the symbol might not mark what it is intended to mark due to padding
which might be inserted. See also 01fe4da6243b ("x86: force suitable
alignment in sources rather than in linker script").

Really we should consider using

    *(SORT_BY_ALIGNMENT(.init.data .init.data.* .init.bss.*))

While I can see your point against forcing sorting by alignment
globally, this very argument doesn't apply here (at least until
there appeared a way for the section attribute and -fdata-sections
to actually interact, such that .init.* could also become per-
function/object).

Then again - this block of zeroes doesn't need to occupy space in
the binary. It could very well live in a @nobits .init.bss in the
final ELF binary. But sadly the section isn't @nobits in the object
file, and with that there would need to be a way to make the linker
convert it to @nobits (and I'm unaware of such). What would work is
naming the section .bss.init.stack_aligned (or e.g.
.bss..init.stack_aligned to make it easier to separate it from
.bss.* in the linker script) - that'll make gcc mark it @nobits.

> -       . = ALIGN(POINTER_ALIGN);
>         __initdata_cf_clobber_start = .;

As a consequence, this ALIGN() shouldn't go away. The only present
contribution to the section is as large as its alignment, but that's
not generally a requirement.

Jan


