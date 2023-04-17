Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D206E4A7D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 16:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522169.811383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPOh-0005xF-Gr; Mon, 17 Apr 2023 13:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522169.811383; Mon, 17 Apr 2023 13:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPOh-0005up-Dz; Mon, 17 Apr 2023 13:59:59 +0000
Received: by outflank-mailman (input) for mailman id 522169;
 Mon, 17 Apr 2023 13:59:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poPOf-0005uj-Nf
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 13:59:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21b60862-dd28-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 15:59:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6880.eurprd04.prod.outlook.com (2603:10a6:803:130::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 13:59:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 13:59:53 +0000
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
X-Inumbo-ID: 21b60862-dd28-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIco0W6QMAdSGT7T/pPGb/1MwHuT2Ht7HgmrLBfuIMdj0emjl3ZgkDntj4d4F9ggS7ViyUXfQiosz/jVx323G1V79PBKvpn9HtpoqQrSyZpzHXth1Bp7cwEl0mlZ6Rf/eB/H38lePpep83JOU9RGpUsaaAFA6+hwKKNw9+tbORSJvC+vPn5UmrKdUqLwhlCXAo7kvwxGSmpghPcs+EVdOcDJ/PxHLh1T3nKchM0XcgLHw1dBcMY7EHwe5Gob6w8+Vu5lIZhnjEmg/QlxB2y4f2TvcKvle0h8XNSEcpi+gOe7trDqXWAp3myyBD3+KV0XNjKlSPC/fgghxpaHU3NxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pFd26Z/80a3lrZcFVycKkST+rPq1jiwNT5VLcBrdBU=;
 b=X9kLNOkyzEmNAOjaz313/svuG1hhzpg74n2motMSb0AzMHjwSzRAGQOBcvSTidzWiCgZ3jE9Q+ZK3tBxINMWw4SKd5rlpWrEzT5yEF+CK6pX8bKPysKA+OB5TEUOMuKAgDhB3DFte2yCjNbKK75QmA0C2d0+lyN0wmG9FkYZN3iqwjAtYLaTFJtR+rLTSAKMIl9QSU1nwpBrnKoAttRVJUhZp9yHNnF0o2QW6SbJQ9/aif5ApI/cNWsPpGEQssSZxpWHY0dQgjE4EUFIcqorfwl09fvhCYGrJLwoOjrKlFh1uVoaGT8UrW6vEvZBg+6Jxuv5ptvoQHpH7JWL4CxCwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pFd26Z/80a3lrZcFVycKkST+rPq1jiwNT5VLcBrdBU=;
 b=Goy34wQLLOXpmEeuKSh2ECDbNT0SRmrAXmXMg9+8CC2PB44Kbc0JZo6xATgH0yh1kOBCW7wCkcCdakyhQP/d9SPjLu45E08BoTtD8Qj785dF7XIeeadd/iMJ9LLftdtdveMIl6BWxsPbW7HRPr2Iw16Kx0estu/PJM5078H/OaSlB53zhxUXW7T+4dzc5a5sfa4mGlx+qupV1PLKm2bAt0f3QBek5ursa0oN29mFBUoLKiteE/OYpGMUnVcYXHjDOJOpakppXxw+R0GUncPSg3GeyvlY0GY88mzoXdaXNkEmCDy7ry4E3CWD+wphW+UpBHeXeLxlkLmVa2nw7WP6zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d83288c5-6247-ef7d-b9ba-8bf24c7831ac@suse.com>
Date: Mon, 17 Apr 2023 15:59:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] x86/livepatch: Fix livepatch application when CET is
 active
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230417135219.3776777-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230417135219.3776777-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: df72c81d-7af2-41a3-1204-08db3f4c04f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nT39LLhnZ1Wrr+dO0oquBwOV0ch01h5fmvRukbOzbk8b0p1mVjKBW5CAsdqfvQCrflllOlrsnBQkg3cjfsJjSbWvU/BesP/qFDkv1zojsWRNDIYseKxZtZqy2B2ZwtpGrTnaGgFsxRq/K1R1/N6iBxUp/18oU5/T8lYFELsEg2c/wdVER/Boji8Vl3mOmDb7Z617CpaEAhDEFssB2O4q2Q2NX0n4j4V6CX1q+V6hFk2W7QprrrGzNTD61glLX4uChCcgbti7qHCqzXbIfzVepfAcN4uU0JuKNwr6mF+hZZSxRBLYc819aI3B7VR1EkXHQ3J9wlRjx7ncJ23i07JELe4f+wTOqk0n5NhhcHhdXvudw7GpTEY8k7WtHCOwZvqqEmx6Rglt7WaVRbXgmOZYNUXBMT2/x4IjHxfOlaPs0WG7fkyGriiJeCxcw9OzjfkptFGNY2zWrA4/JML5zu3fuLRpHFf6IRVkHd3jgqLwB9pO2Fc0/qOOoVdFDZzXTLe2VWVWHLOaCsdDBh7UZ6yOYvnBxK3hubUooJNKy0Pf011dqynihVRm0gJ+1eOJnufCmER1JspI4y+DmmP8bgam+nPWBTE8nMGvv8rc3Hr6PovuluRZUZZAPpyf5vi6Qp2i0/bfndMOWPxX6NUeYWgYEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(366004)(39850400004)(346002)(451199021)(6486002)(86362001)(478600001)(31696002)(2616005)(36756003)(83380400001)(26005)(6506007)(186003)(53546011)(6512007)(38100700002)(6916009)(66946007)(66476007)(66556008)(316002)(2906002)(4326008)(8936002)(8676002)(5660300002)(31686004)(41300700001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ykd2Q3RBMUlPcHVMcVFKd3Noa01sRlNiZ2MxRlhDNHdDbFFwV29SNmw1blM0?=
 =?utf-8?B?cXlTVjlBNkxOSzkzMnlCYldhOWNab0FpdGxpWm9uSHpsRjdWQi83MCtRVTZP?=
 =?utf-8?B?ZXBjUDNTbXFZakRyby9iMkx4dUNCY2VQMVBLVW9tbHg1K3VjVm8yREVpckYz?=
 =?utf-8?B?ZTdiSHBPK3RoZFZOdWFlMldJYmswb25jK2ZHTmhmSVJoVmpCYVJPT25hWUIw?=
 =?utf-8?B?ZUxpSXBhZjJEU0NqVzVUbFFtVHdmaXYvdUFSd0VaRVFpR2s2aHEzRjR2NklB?=
 =?utf-8?B?S1pUem9xMG44dE81ajlNc09NREFUcFBxMkFiVmVENERNOEZTeFkrMFJRY0RC?=
 =?utf-8?B?TXVSbzNSbkNTcFRkY0Z3c1dDN0JSYlpkNmFyRlo2Tlhqd1M4QzJmaFRPaW94?=
 =?utf-8?B?TWFjYjhtZytyRnI3LzZ2RVl2OURyQmR1aDlZTmwyZ0xnRktVeDJ2QnhOMkRa?=
 =?utf-8?B?RVhodXJaNTkwU3UrdlhhSHhFT1UrNDExK1M2SGZONDVaeGZ1M3BBYXYrYWpm?=
 =?utf-8?B?MWVOR1hWSGR5dStha050b0U0Z3B0Qk1wUE1MTGtlSmxxV1BIWEFDNUpzNXp2?=
 =?utf-8?B?UisxVmtUWS81T0huTVY5Zm5KWHR0L0JQdmZKMEN3YURuVVBMQnd0NHpCaXBn?=
 =?utf-8?B?SFJTTzE5c29UbVozWTNsaGQwczJ0U1VTS0dCTm14MTZmUlNUK2ZVblNIcFpr?=
 =?utf-8?B?ZWgzRkZGOUcxaUVnLzU5V3I4MDZVTHRTS25zemRKUlVncGVLZzhtaVA1VHB2?=
 =?utf-8?B?ZFZrS0RGenNLNllxQzVYTjkxTFZPR3N1cDVCWEhaNDkzcU9WbXNVTzRiVkkz?=
 =?utf-8?B?VXRBaEJBWmtMY25iajhObGZmZElCVWJ6L0RtTEl0NTVLSDNneGdPYUdJSmRW?=
 =?utf-8?B?bjlCQ29MWEI4NDlZT1d6ejh4Ynd5ZmM5ZWU3N0F1TFNTNHM5QVAzeUk3dlNE?=
 =?utf-8?B?QWtMbU01aEtzZjFvTXFTb0RCMytpRUJDL3pmQ0JEcWJrU280VFdUV3RCU2Z3?=
 =?utf-8?B?VjlIWVVSa2NTbUY5UWRhRFRuQ3E3U05aV2s0YmJQWFBjUVlsaGIrYmJiRHNq?=
 =?utf-8?B?REFFY1VQSGU5T3krYXpCUWF0eDh5SDc1L2hOd3ZtUC9KMlU1MXhZL2h1cG5k?=
 =?utf-8?B?LzJHK3puZzRubGllTVltRE4vR05mblNsc2lSbVRmZjlsNzBlc01IdVNnN1c0?=
 =?utf-8?B?Vzh3OWlpNjBuTWxZNHBIY3V3dmtqZUZvaVFRa2k0MUU2ZzFUN2sxUVBpdnE5?=
 =?utf-8?B?WUJMNTl3Z1FlbEwya2VsdUR0UEJTSU9XUkN3L0psaURBOFdQekNwMjhlRmty?=
 =?utf-8?B?bGthUVBNNXg0dTVZUDJweFhyUWl3a1NhbTY1cDcySXhIaVJWOStSbVQyVFBm?=
 =?utf-8?B?bWRMOEpUajVQWHN3TitSVzA0VzJKQ2FwRVZJYy9lTzcxSTdPMnJYYmFia0o5?=
 =?utf-8?B?S1l4ZEJrZGFpQ1cxT2VSRnpsMzkrWjFvT1lZN01ITGhmRHR3ZTlZZDMxR2E2?=
 =?utf-8?B?K2NlanNBQlpHQVhocXFuV2hadEZWM0REcG9WTE1SKzFheWt2U0VIVGJTTlFO?=
 =?utf-8?B?elcwVHFmdk9hTlc3Mk51ekVIenU2Vk9SVmlPY2JaTEVOUkI5ZTZuS0ZxbVdG?=
 =?utf-8?B?U3JWcjArcFBlWE0rRDg5bUtkSWhPRG9vTkY2aGlBZi9UQTR6amJzOTRybmt6?=
 =?utf-8?B?aS9sVXVabWg5dVg5NEkzSCt6Qnd2R2NEcFJSR2FnS1VPbk0wZVdzZ2VwK3Zw?=
 =?utf-8?B?UDVyZGFvQ0RhMnZldHVNV1FoSkRnVG84VWdaVkRua1VBendldjR0MDdzd1Az?=
 =?utf-8?B?a1JKa0lxQWhNdFJ1YTVibTRFOU1vWkdxMEdiZkxTWHp2WHNJN0k3YlMzOWJ0?=
 =?utf-8?B?cGh5VEFFMXd1Mk14ekJFemdIZXh5b25POHFMNGVNUWhQOS9iRy9XaVhBcWx1?=
 =?utf-8?B?NWxWV1RXUGt2c0VOaVVXam5qYjlMYWROcUx4R1pkQ1JpZTMwdkQ3MWNEV2Ur?=
 =?utf-8?B?bW11OEk1Tis1KzYwaG9jUWxWeXBtd3o4RWNTWGNHZWxOL2VpcXJaRjBkSElM?=
 =?utf-8?B?dkh4eHd6ZWRBM3lmQ0V2K2ZjcUxPSFU4eWdGYlBTRDJhbnZnc0hFSzNnT2li?=
 =?utf-8?Q?hlR9pBW6dSpxwigPJkHnBExBT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df72c81d-7af2-41a3-1204-08db3f4c04f0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 13:59:53.7554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sC3x2xvDwfJXgdorBCoNH/fK0IlL185Fp60/aRBSaOxMKctIxnv/bJzbol8pqiO+zOZq/DnrWbtHCgBpsVFdrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6880

On 17.04.2023 15:52, Andrew Cooper wrote:
> Right now, trying to apply a livepatch on any system with CET shstk (AMD Zen3
> or later, Intel Tiger Lake or Sapphire Rapids and later) fails as follows:
> 
>   (XEN) livepatch: lp: Verifying enabled expectations for all functions
>   (XEN) common/livepatch.c:1591: livepatch: lp: timeout is 30000000ns
>   (XEN) common/livepatch.c:1703: livepatch: lp: CPU28 - IPIing the other 127 CPUs
>   (XEN) livepatch: lp: Applying 1 functions
>   (XEN) hi_func: Hi! (called 1 times)
>   (XEN) Hook executing.
>   (XEN) Assertion 'local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu))' failed at arch/x86/smp.c:265
>   (XEN) *** DOUBLE FAULT ***
>   <many double faults>
> 
> The assertion failure is from a global (system wide) TLB flush initiated by
> modify_xen_mappings().  I'm not entirely sure when this broke, and I'm not
> sure exactly what causes the #DF's, but it doesn't really matter either
> because they highlight a latent bug that I'd overlooked with the CET-SS vs
> patching work the first place.
> 
> While we're careful to arrange for the patching CPU to avoid encountering
> non-shstk memory with transient shstk perms, other CPUs can pick these
> mappings up too if they need to re-walk for uarch reasons.
> 
> Another bug is that for livepatching, we only disable CET if shadow stacks are
> in use.  Running on Intel CET systems when Xen is only using CET-IBT will
> crash in arch_livepatch_quiesce() when trying to clear CR0.WP with CR4.CET
> still active.
> 
> Also, we never went and cleared the dirty bits on .rodata.  This would
> matter (for the same reason it matters on .text - it becomes a valid target
> for WRSS), but we never actually patch .rodata anyway.
> 
> Therefore rework how we do patching for both alternatives and livepatches.
> 
> Introduce modify_xen_mappings_lite() with a purpose similar to
> modify_xen_mappings(), but stripped down to the bare minimum as it's used in
> weird contexts.  Leave all complexity to the caller to handle.
> 
> Instead of patching by clearing CR0.WP (and having to jump through some
> fragile hoops to disable CET in order to do this), just transiently relax the
> permissions on .text via l2_identmap[].
> 
> Note that neither alternatives nor livepatching edit .rodata, so we don't need
> to relax those permissions at this juncture.
> 
> The perms are relaxed globally, but is safe enough.  Alternatives run before
> we boot APs, and Livepatching runs in a quiesced state where the other CPUs
> are not doing anything interesting.
> 
> This approach is far more robust.
> 
> Fixes: 48cdc15a424f ("x86/alternatives: Clear CR4.CET when clearing CR0.WP")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

One further remark, though:

> @@ -5879,6 +5880,73 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>      return modify_xen_mappings(s, e, _PAGE_NONE);
>  }
>  
> +/*
> + * Similar to modify_xen_mappings(), but used by the alternatives and
> + * livepatch in weird contexts.  All synchronization, TLB flushing, etc is the
> + * responsibility of the caller, and *MUST* not be introduced here.
> + *
> + * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
> + * Must be called with present flags, and over present mappings.
> + * Must be called on leaf page boundaries.

This last sentence, while wording-wise correct, could do with making more
explicit that it is the caller's responsibility to know whether large page
mappings are in use, due to ...

> + */
> +void init_or_livepatch modify_xen_mappings_lite(
> +    unsigned long s, unsigned long e, unsigned int _nf)
> +{
> +    unsigned long v = s, fm, nf;
> +
> +    /* Set of valid PTE bits which may be altered. */
> +#define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
> +    fm = put_pte_flags(FLAGS_MASK);
> +    nf = put_pte_flags(_nf & FLAGS_MASK);
> +#undef FLAGS_MASK
> +
> +    ASSERT(nf & _PAGE_PRESENT);
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE) && s >= XEN_VIRT_START);
> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE) && e <= XEN_VIRT_END);
> +
> +    while ( v < e )
> +    {
> +        l2_pgentry_t *pl2e = &l2_xenmap[l2_table_offset(v)];
> +        l2_pgentry_t l2e = l2e_read_atomic(pl2e);
> +        unsigned int l2f = l2e_get_flags(l2e);
> +
> +        ASSERT(l2f & _PAGE_PRESENT);
> +
> +        if ( l2e_get_flags(l2e) & _PAGE_PSE )
> +        {
> +            ASSERT(l1_table_offset(v) == 0);

... this.

Jan

