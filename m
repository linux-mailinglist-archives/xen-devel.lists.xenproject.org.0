Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471B37A0875
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602396.939054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgntk-0006ea-Dc; Thu, 14 Sep 2023 15:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602396.939054; Thu, 14 Sep 2023 15:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgntk-0006cW-Ax; Thu, 14 Sep 2023 15:04:52 +0000
Received: by outflank-mailman (input) for mailman id 602396;
 Thu, 14 Sep 2023 15:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgntj-0006cQ-A2
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 15:04:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c6467c7-5310-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 17:04:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8128.eurprd04.prod.outlook.com (2603:10a6:102:1c8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 15:04:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 15:04:46 +0000
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
X-Inumbo-ID: 0c6467c7-5310-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j21l50denBlfnEaNhh1uouCHRpSsHg66IIvXRFL8ggIpZsBMnGedsr4htbaLbVurmbZmu/BCD+yzjQTJpeIhRsVbgGMxehM86r7kBP1jvsjUoKijcpF8azOi0eOaaIR9F7zxvqOH5dF5IJuUIEaL/A+enmZkCujnL4pVeuBRxHcJ1CRVt5l2SMMJrQm5stOAMeJKnJlTAm8CPwgxZZvQdaxMDhIJ2Ce7MVAP1hqguUmu09VmcFVVMJmN0mVcNs2wWlWR99XQgZyB6MfnKUPim4+dlXB2FqV0XxTpg2bEPv6hobEPGy0UE8HblNGXtTF6jH3jFj80Hcpk+VT3PmKT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzS8i1c2PHkHzQGnN0faVQ8EXIBq/oQYBS2vj1yzVJE=;
 b=LmLBsc+QXmmzPYK7oK2huMkrqyZIyFHbufbjN7gIXFsYGgbLBhPmuI3tDc73/3hWLt8FkLA4iZz8ZlBxQgufMt+Uu2ThkJXpprqD+IcgCY8vv5fnmhUlDUhww4hw4Y32V9z5D0rkUN/TjX3YLeBRDYutym0LOU16HRHD/aASMcJkq9ylomibDqgnYyAwgGz4/bPLAJvjcNkZPVER5SakKv6j8pcwpqKKCx1AJxCgv9wIFHVegySCU3c5XilcnrNcxqdsOInrHI2Q6S8FClu/4ZPxzzdyb3676IZH4Loll8IKVRyOSPvo9/ILxDvr5RcPX3VRMKENLSZW5iGA4jau5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzS8i1c2PHkHzQGnN0faVQ8EXIBq/oQYBS2vj1yzVJE=;
 b=bLizh0Q0t8vhUY4LHA/rCTQmcsufWS0/ZcRPe5MmojC71CmLEy7clwdgWZEHfuKdhAVQhvhdKqmEk7eUQAIfEabqTN+ZSCWw6VDEHadN0iyWF24UeQtRlNObejwrOJKtqOtnzXmVBQpXmye6vaiCdU0bcyuXmU7WnahzG55Tk6byWpFjWyzxmMZ+WfxdsFyuQByjmN7Pp18LLTpEbWQnGa+zdjPo5LDlkMau89r66PMdhhXZiQvz9ppbUuX/vg/Zn9d2OMZP9TftkcPz8AOHIVIDmcF+eCetDj/I2bI5n61CvgyV+8aiK4Htv1rzTJvmWRC5XKyK0ebrehPCItL86w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e71b915-bec5-2430-3304-f6f46842359d@suse.com>
Date: Thu, 14 Sep 2023 17:04:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/5] x86/emul: Add a pending_dbg field to
 x86_emulate_ctxt.retire
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230912232113.402347-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 91375c42-88e6-4500-b01d-08dbb533eee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h5y0qySXapEmzu2N9fiWAK8ap2rSMxYHXBOuN2jk16zeSB8YDBvnSLMXz1/lzVdP3zi11yycx01redGrAM28+MecFB3GQ8qGryqJ5Y4JKenZVd2c/LrghRXB7VZFWxDCaHTMplFuI2idGmYdxqXsp3pJWDBRAdTfzsweT0PFDqDgMQZeOTWFsx7JA7Gn/ybSxhXFNpozUqibyTEj+W2doEeAcaYdoFzAlmwQgtTXME2bJuMCmNgbCFxjbeBsaABX88GgPh8R9MZouFl6PC06F391Xq02Dle7ghmzqHSycwdepCU41f76b3lzg4dims1yunkjgQvTeG7f4Ioka/ZnyOTjXP+iaJsXzDGIRgGg82Fnl0ah1X9lTy1qV9jNkfGHN8vfkwOkPswa8hCFxO3OJxCUZ7gpDqRGluAUEgWudDeoYX++AQ/MB0z77whbVXvQ+8ROxwe8V6BjtIm29Tj0YXJojfyu45cstjDW1aWmIkNZrzH9pOWPD9VOQ4qrCLBqNYhSiFb9zZaqxxKPxAoJohn/hwBMJlix5jZobGenHA+LgZfMqDdIbxTP3mrbPzSrvKlGMNQNpcsaPdIAnSfACMwFX2z2V++LNMeWfArP/1iSr5niqLUOEYgtHEXqAgrlRNOv1MLl0FIVlioe9pCFsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199024)(1800799009)(186009)(478600001)(6666004)(6486002)(6506007)(53546011)(2616005)(26005)(2906002)(83380400001)(66476007)(66556008)(6916009)(54906003)(316002)(66946007)(4326008)(5660300002)(41300700001)(8936002)(8676002)(86362001)(6512007)(36756003)(31696002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUo5djdVNDZqQ0s2dkZCNVU2MVFmUXNsU3UwQkd4UCt2Mm5CalY4L29CU0N0?=
 =?utf-8?B?OEJoZEZJajlTMXA4SmxUdUFoN29lcUplenVZS2wrM1FxdDBGOUZjTjJJUGVT?=
 =?utf-8?B?N3NTTGF6M3I4cjNDYWtpdW5MdEFOZ1BTZ2U3R2ZRRmZ2VkVYRWNMV1hZbFJD?=
 =?utf-8?B?UGlvakdmd2JyWFBoTTFxd2J6TWE2NitZYlVFU3hFODFqNWdFSHNoTmdMb2Ja?=
 =?utf-8?B?WDZTNDV6ajFHbW9UUnpwVnJkSnF5ZlhBd1FoRTdrOGUwcHduSlBSaWdQZkFv?=
 =?utf-8?B?eHlKMnVtcE1qeHViNml5WlNXVVo0bVFmbUFFOEJaTlJSTHZzMWVXNncweEEx?=
 =?utf-8?B?M2VJVjdjVUhOeDNsQzZnTnMvM1I5Z09ZSXU4dGdjalVOSkZKdFJ0ckpXSmpI?=
 =?utf-8?B?RVZnczFtZm81Y1BwdU9nR09FWlBFc3FCRi9oV1BkSUdWNVlhWDc5K0YxejVj?=
 =?utf-8?B?ZzRNNk5JZndZR291anhWeEF6QWp0YjFDMmJaZm9veE8rbi9tQlFQVFJFeWl1?=
 =?utf-8?B?cUpsQmRyamdEcTdqMjRDMFlGcHlyTThmdjNZU2JTVG1hVjZNTGl6SFR3UHZX?=
 =?utf-8?B?aEFJSC96Z052ZDNlTXYyODlUODNLc1BsVXd0cFRaTXhPVWlmYWtYTEZGWHEv?=
 =?utf-8?B?azhMUjJ5UUlHckNnVkQyUW5ldFlZQmFVb3RRMWNrTmVGeTdyT3JmeFl6NG9L?=
 =?utf-8?B?anVwZ0RiOHRSYUQ2QjQ2R3B1cGpEV3RCaXhtdW4rV1VVd3NLNkU2QTFRWDYz?=
 =?utf-8?B?akpESGtOdStGYi9nNUZvcVBlSGVaNXVZVkFVbXVIa0JxSmhXWDdaa2Z1Z2xv?=
 =?utf-8?B?d0oyZ25iUGxjTGhKUTJ1SGNqb3NPUWpNUnNUemhGMUFjVjBjZjZOcUROUDQz?=
 =?utf-8?B?YzhINmhobC8wUVMxSWR4TUNaQnp6cXE1bU53SGhsS0JrOWVxV0dxZDR5VERX?=
 =?utf-8?B?ekZ4a3d2U0poWWJaYzJvMVNkZitLY1ZpV2dtN0xWRGVjTUNMLzkzQkxBL09R?=
 =?utf-8?B?dDZPOWxLcW1jSTlDT1hqaGhHbjlhNmtOQW1LcDREN2VPWkNGSWVqdnJTKzQ1?=
 =?utf-8?B?clRoNmF3V3BkdHpwZFZBQkNacGJzTitqdkRRb0hiYUE0OWRwQjgvRzFEci9u?=
 =?utf-8?B?NTdNeGRNMFJ1Z1ZoZ0xwT0xJUEdqS1FkYmgvWXFTRUwrMzJoNWwwcG9QWXoy?=
 =?utf-8?B?K1hNb2R1Sy9pQ05KUDRsY0pGUE1YMHlIQ1M4NUVMNUYvQTlLbFowN1J2cWl0?=
 =?utf-8?B?WTBqYk9ETUhQVjhYdWJTcmpOVGhjSDJkYUt3V0RvQ0pNWkdVNmwvUytqSzRq?=
 =?utf-8?B?ZkNXYStCV2h2YTZDZVlyTXA3aDNKc1NHNE9XSFJxb3ZUREV5QTUzS2NVaGcx?=
 =?utf-8?B?U1ZZSUNqWjdDNHNzMFJUa2hxdHhqL0xiSy9tS3B4YVcwalltck12bEFoM3cz?=
 =?utf-8?B?UmtPVjhLQ0MzaFRZVktRV3NjT0JVVXkzQS9GUDBHMks5YkFTdktkRmlSZGpq?=
 =?utf-8?B?b2toMVZsZWpxRForejh1V1BOU0UyZTBhS00vdUE5RXRBaHc2VTRBazNONXJ6?=
 =?utf-8?B?UFRwVXB4OXVXSEkvZkJ5ZjhUL2owblN4YzJCK3o5Y0cwYnhKYzhmcHdDeEEw?=
 =?utf-8?B?TU1MVUxZRWVueUtGQVhNU25aeFdlcHNQSWxIdFJmZndndVZRS3VBR29ZV0c0?=
 =?utf-8?B?eDk3N0lMT3FqYTcrYitSR092ZW1tSUpUcGVZbmNLajIrKzIrNkN4UEFFOXlZ?=
 =?utf-8?B?bVJJdG04TkNpSmlkZUp1YjFkdVAvelFMbjljaGR1OW45emZzTEhIN2FGUTly?=
 =?utf-8?B?N0szenh2ek04d2hrNGZBQUZyYURCWXR1dFUzVEtPcVBUdXJwYTdka1JPenlN?=
 =?utf-8?B?SEw3cFFyaW90QXVnK1ZDVlBWcWUzaThwRmtsTUVNbm1RUE5SR0ppbmZmS0lu?=
 =?utf-8?B?UzFNQmtSaE9NSVVyODU3SDdIeDNzWHRWSHVjQURqL0FCb0dmTnI0QU5wZ1gv?=
 =?utf-8?B?YkpUeHdlMENKUU9CMUE5bnRLZHZPb05sQUhnNHVpaGp2dEhVMWFRRnlOWHAv?=
 =?utf-8?B?QVZic0xwUDNycW00MldZYU1UaTV0UWR0RjRMVC9wTHR5Yk56aDRUN3pldE5l?=
 =?utf-8?Q?Zxabr+NyTihW2gFGlnttAvwOF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91375c42-88e6-4500-b01d-08dbb533eee7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 15:04:46.0423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZZyjxEV3uexCwxEBj94+pqmZxUULoniWyfAypFAZ0RWu7yZkdccL0AkVkf4TIveOI8xTNGHXpVvkt1EAaLWTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8128

On 13.09.2023 01:21, Andrew Cooper wrote:
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -8379,7 +8379,10 @@ x86_emulate(
>      if ( !mode_64bit() )
>          _regs.r(ip) = (uint32_t)_regs.r(ip);
>  
> -    /* Should a singlestep #DB be raised? */
> +    if ( singlestep )
> +        ctxt->retire.pending_dbg |= X86_DR6_BS;

We set "singlestep" about first thing in the function. Is it really correct
to latch that into pending_dbg without regard to rc? (Perhaps yes, seeing
the comment next to the field declaration.)

> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -588,15 +588,26 @@ struct x86_emulate_ctxt
>      /* Canonical opcode (see below) (valid only on X86EMUL_OKAY). */
>      unsigned int opcode;
>  
> -    /* Retirement state, set by the emulator (valid only on X86EMUL_OKAY). */
> +    /*
> +     * Retirement state, set by the emulator (valid only on X86EMUL_OKAY/DONE).
> +     *
> +     * TODO: all this state should be input/output from the VMCS PENDING_DBG,
> +     * INTERRUPTIBILITY and ACTIVITIY fields.
> +     */
>      union {
> -        uint8_t raw;
> +        unsigned long raw;
>          struct {
> +            /*
> +             * Accumulated %dr6 trap bits, positive polarity.  Should only be
> +             * interpreted in the case of X86EMUL_OKAY/DONE.
> +             */
> +            unsigned int pending_dbg;
> +
>              bool hlt:1;          /* Instruction HLTed. */
>              bool mov_ss:1;       /* Instruction sets MOV-SS irq shadow. */
>              bool sti:1;          /* Instruction sets STI irq shadow. */
>              bool unblock_nmi:1;  /* Instruction clears NMI blocking. */
> -            bool singlestep:1;   /* Singlestepping was active. */
> +            bool singlestep:1;   /* Singlestepping was active. (TODO, merge into pending_dbg) */
>          };
>      } retire;
>  

DONE has wrongly made it into here, as pointed out for patch 1.

Jan

