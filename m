Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C022C755EED
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 11:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564319.881767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLK6u-00005G-VO; Mon, 17 Jul 2023 09:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564319.881767; Mon, 17 Jul 2023 09:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLK6u-0008Te-SA; Mon, 17 Jul 2023 09:01:40 +0000
Received: by outflank-mailman (input) for mailman id 564319;
 Mon, 17 Jul 2023 09:01:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLK6t-0008TW-FO
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 09:01:39 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88b983dd-2480-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 11:01:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9178.eurprd04.prod.outlook.com (2603:10a6:10:2f5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 09:01:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 09:01:33 +0000
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
X-Inumbo-ID: 88b983dd-2480-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+lseEvXg2sDlHJZz+c2KfYGYUrpyGzUNdI4ju5CwtNwOPRyq8DXFXt2oQiPBi3pMo1rbXKEETL3OR+faiZsyvmB2zWiuRSryfS2yYfFO7M6/xujXc9kMUYmkK3PgWT5wcrD/8m3dVOqMrG7jQonD8bRVGN8fmkReJaOBsl9a8dxfKOWPPyFSzztr8NWmAD1JBp/NERGPwrSS86lnTtI+zjc6EmYAFqeUd91Cb4Rz55NOWIFCBOIvnRQn5Rh3yksVAclaK/dY8FM2iwj00vG/P/oQR1Qe1co2t7TomUdOhH4ulhmrqPfCwSe9FAJuaomydYO09Yo2kGj9tXO5TdTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycCuWX7rcJOr+LuyEh7XbFJYRfebPP1oQRarrAyl83Y=;
 b=I108qU5i+1Gquoq6CITaxaRG8q86vKATDOQcH7LIl8TfGB5oEoiCNCLZhn71/WMIrgj1BgTJRa/prcVcDoaClj8jKrWPyscgMR3M6ACq5Om5HNz1W/tXkJCt/0aHv6eswooMnsaFfOcSLa+cMz8vWnQUenbgYWxHC1IdusbvIOoNfQlCWQPGV6cE4dOcBIRwbWXXwNrytziypA7UNfOBhKFV6xLm6CtFkvZ+cCzQ84OqkXDdyVfDQVmLmOROSaVtua2LMo/AyyuT6+0piijPo004PSjDKr13iKlC/fx5MIXraHISu0MMSwJDRPA78Cv4wCBhtvSLMtyjQHfHzO32Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycCuWX7rcJOr+LuyEh7XbFJYRfebPP1oQRarrAyl83Y=;
 b=MPIYPj3J8t6yKz14Q+gU8yP/JdmToe6U/nJ8fYBMLzQlmrVckl2ujfjIiW3CreiYSYnhDNzElOQEdMfx8TpabasBj2veNvfFb8bewOc0n9qPyCXIFvUa6ZLwIXUtmPhPaNPFRif/hx8B8qZMA61hGgiWWDorKJZcKzbK0dRR4YDcC1WzrP/wc1VOyKrBYiQIfk3F5ke/jgT/psf75RjXvBd4i20IilcVN7XwW2gwCLLjHNIDnSpJ3Ss7rD76sOrs+G00RGsPq9JgCSWxm1TX5d5S1rV1lrCC7N236iRgI89eExcvW3xWKj582D0YIFbIvO1XNjTJyVm57q+L2YEM4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ed67f73-2f03-4e45-3ca1-4e6f2e286ac1@suse.com>
Date: Mon, 17 Jul 2023 11:01:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3 12/15] xen/x86: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
 <78717a3ccee0517eab915156fc474394ae1dcf81.1689152719.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <78717a3ccee0517eab915156fc474394ae1dcf81.1689152719.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: 27266707-76a1-4f59-d1fc-08db86a46b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vqxTT0cXJ/SE3JhDES7PEwPXNvUq4gPEnDL9kuRB4SavWkUBczbeYHB3gwXpiihu6zfHUJgpm7ShyVIoChnsYZnYImHj1SRPYvbEtZBshJ4+ZxnEbt+6PB1SHZenVciKCFVBuxLgr1uq+vwn/6P9LE2dZaFzmytwF2/uYx77OfKQwBkSQwh9x2+MgYzUeAjf/A06AlxzBC9hS90hj6jbQ9rrNxQpTS7xTITjs7pz2mESbdzs5AUl9Ry3jeJanOwIy+yqcAmE3t5U12Q8Hk6uXYAIOuf+jiDo9BobWkoT+odHL1unbcttNH1y1VzKm3vD6PreQe5v7KlTsWCByyiWYALnzN5i/+iWzOPq/VCiiznTrDFZXgjlc9ofJq0K/wPvxvcAX0e7l1nfdxuL/2ygyIoxi76uApUapgcta3rSaJeT+L4S5DkNbNRfm5pWeEqH73MKn/k/sedTU9vrzIq5QhoxtQfIfhcNC8zvn74zB3SoP4OEWlfKMz2nnhRhi7MseUisLPfC+jmvDrZ7/PlwckzJdSkLlkVtQQbhgHnkZWrc+lVFvi/MQJrDOA1PVtR5m3wkGp7OXFIEB5YdWBZ5pSFOS3Vob8Dg+08Rn4bS6rIKB1cFVWT5PPNcmcOiEGukrmBFLiBi/AfcByjZ1QSDZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(396003)(376002)(366004)(136003)(346002)(451199021)(66899021)(2616005)(6486002)(6512007)(31696002)(86362001)(478600001)(26005)(6506007)(53546011)(36756003)(8936002)(8676002)(316002)(7416002)(41300700001)(5660300002)(54906003)(38100700002)(4326008)(6916009)(2906002)(66476007)(66556008)(66946007)(186003)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em1CWitnK0ZlSG1uM3BEQWRvaFVhaHMzTHdGTUQvazUvRFlMQVVNalhrY2hn?=
 =?utf-8?B?U3hSRlB6QTgwTmpSbmNkWjdzQVY1bWlDSVYzQ0xqVjZ1dW85WHNIdGhxZytY?=
 =?utf-8?B?a0dGbHQrd2gxYk0wSmxRUDVNTlphbnFXa2JWQzMyNGt2bzZMc003REUyTGNQ?=
 =?utf-8?B?RlBrR1Y1bVQ3VDJyaVczOThibzZ3bldWazQwT0RBM3VYakxGblJtZnJLK1NX?=
 =?utf-8?B?dlg2NXZ1TGNaRHlsSWtkaWc1c0VYSkZ2UFFGcldia1hoRTJxb0k0a0EwZHo2?=
 =?utf-8?B?eEx5QnUrL1M3bGl5RlRQYnhxVys2ZkxMT01VZzg2SHVORXk1cE1rS0p2amsy?=
 =?utf-8?B?Z09HRzZqSG0wU0JkWjVWb2RWZVhUYmt2UWNleDh6a2tZNnk0RWVDZVRPeDYv?=
 =?utf-8?B?VU5yd2FYOHF2YTcxaTZmMDFzU1ZwREZ1SEQ2enRYNVhwRE5OUk0xN2t3dXMv?=
 =?utf-8?B?R2diMXp4c2pncnBYakxBdHNPb293TEdHM3JTQmx6c200SFNTZGtvZEl2ZDBq?=
 =?utf-8?B?YkxYYjJuakVVRG1JM0o0MURlWDNYeWdPMlM4dmRtMU1jU2VvQWRVd3VuOEEy?=
 =?utf-8?B?alhLMW9SZHlYQkZhR1VhMjBwTjlLdHRQTkM2a3lhZHRBS2o2NjZOd3NTVHE1?=
 =?utf-8?B?c0EyUUR5MURJWFdobDF2RkpwUm1yQmVML01nVCtReWkwMS9FZGFYbmJKSFh5?=
 =?utf-8?B?R1Bjb0FrYXljYlBKUWNWRWtzcDR2RC9vOFRBWEhjeURKem1xOVN2QzFBYU51?=
 =?utf-8?B?VmFjQnpWbGdKbmdGcDUvS1U4dEthMmxlMmo5Z0h5bk5yaGZqbU85WlI1VWI0?=
 =?utf-8?B?QzF5bC9MWmtDaDArTmFFNndoMm9CbzdmY0pXOGZjemo4bkNuZzI1L25Hc1Az?=
 =?utf-8?B?d2cwSGtHM1dyQzVNYndoc0s4MHpucWRwcVIxSzB1bTVXakM4K05TUDdmS3RB?=
 =?utf-8?B?ZEJQeUpBZUIzQjlxOGlGd2tjUEV6MExXZDdVSU5zNkVNekJ4aDRETVpicDhB?=
 =?utf-8?B?Z1NsY0RHclV4R3JBUW9seW9pRVdUcXJmRXR0YjJyZmN2YXExVmZZamtEekxo?=
 =?utf-8?B?c1lpQVdSdWdPRG5lZ09ZU1FnRmJDMjQwdzJ0eWdRaDJuU1ZPYW43L0JTUWk1?=
 =?utf-8?B?QVZZWWRjek10Mms4YXBBK2VDZFpmQ1h1OVRtRlBTNis5V0FGWlA0VUpTeFVS?=
 =?utf-8?B?aWt6TVpwVy9ObFEzYVUzT0NsSlBNOVpyMGkybXFpeTNHOUJEUWRrZUhNaHB5?=
 =?utf-8?B?NVJsOUF6SGZENkxmQmV5QjVCMWcrZVhmdnNQQnBTWlloRnl0TkVQQUpNZ3BK?=
 =?utf-8?B?c1Ayc3huSTJyMy9TWFZUZm0ybEtJV2dPR0dHU2t5VUtJOE1PYU5oemhaWENk?=
 =?utf-8?B?N0RlcnUzd2lCZFdvN0tOd0VWQUhGcmF2RGZFNjFRamgvY2hoNTJXeXVZQU45?=
 =?utf-8?B?VEJoSndSV2pQYk0wMHkxYk9lNXd2ajBBSkFWT3M4TW9OUUxPOGhjN0MvMG9F?=
 =?utf-8?B?VlBKUzgxR1YrQXp3Zm1JYUFnNW04OXhKdm9QbENGU0kyK082cGp5RjVLUStz?=
 =?utf-8?B?NDNabkxzVS9tNzgySllkWDE3ZGhhVWZON0xDS2V0VDBPUXhoRVptdEZZSEhl?=
 =?utf-8?B?RkxpQ3M3cjdZMm9CMUwyK0RZdElLOWhjYWJYdDl4OHlMSVE0L1gyNkRiOG91?=
 =?utf-8?B?L09DV1g1L1E4cXhxd3FwcmJGUmpHZS9pUzJlZjQvck02RGE5eUdhUjl6UWJo?=
 =?utf-8?B?dzQrZTh2UlU3OFkrUVFBS0szV3VXRnFPWkdSMG9ReFRaVVpKcDVQMWxyM0k3?=
 =?utf-8?B?ME9PZVU4N2dqVm1nZUlrL2c4d2ZYNnhNVVIzRmIzbzdrVkpoTjQ2d05BcXF1?=
 =?utf-8?B?cktQWjU2L2VjM2F0L0REc3hhT3hzMFgwUVIwL0RTYUdtdlloWWVSZ1paWnpi?=
 =?utf-8?B?RVBPZmxSUVNIS0UxdW1DcjBKWXZvMzJOZ016Y3R0eXdhUmFEckpuYzcrYm9t?=
 =?utf-8?B?TFlHa3NlQ2JnTE9DUEE1K0ZYeWorWkFwS04rTXBvM2pyMmdoTFBLakFRWHND?=
 =?utf-8?B?bmV6MnVwbCtMRE1aU2lUMllRcDFjRkJHMDFWU2hnRXo2QmdSZUk5NUJJdFBN?=
 =?utf-8?Q?ewwJNXIJ1tIZU2vqd9qNlcD9o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27266707-76a1-4f59-d1fc-08db86a46b52
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 09:01:33.8113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDj4YPvGh0xA+I2hSb7RHEV7SliIYOTB5l06ELrR7KXGxOc6q4y9N3ZheY7jUe8zj0UutIkQm+wSwviWjPtzRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9178

On 12.07.2023 12:32, Simone Ballarin wrote:
> @@ -378,10 +378,10 @@ static void __init calculate_host_policy(void)
>       * this information.
>       */
>      if ( cpu_has_lfence_dispatch )
> -        max_extd_leaf = max(max_extd_leaf, 0x80000021);
> +        max_extd_leaf = max(max_extd_leaf, 0x80000021U);
>  
> -    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, max_extd_leaf & 0xffff,
> -                                          ARRAY_SIZE(p->extd.raw) - 1);
> +    p->extd.max_leaf = 0x80000000U | min_t(uint32_t, max_extd_leaf & 0xffffU,
> +                                           ARRAY_SIZE(p->extd.raw) - 1);

Why the 2nd of the U additions? I ask in particular because ...

> @@ -768,11 +768,11 @@ void recalculate_cpuid_policy(struct domain *d)
>  
>      p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
>      p->feat.max_subleaf = min(p->feat.max_subleaf, max->feat.max_subleaf);
> -    p->extd.max_leaf    = 0x80000000 | min(p->extd.max_leaf & 0xffff,
> -                                           ((p->x86_vendor & (X86_VENDOR_AMD |
> -                                                              X86_VENDOR_HYGON))
> -                                            ? CPUID_GUEST_NR_EXTD_AMD
> -                                            : CPUID_GUEST_NR_EXTD_INTEL) - 1);
> +    p->extd.max_leaf    = 0x80000000U | min(p->extd.max_leaf & 0xffff,
> +                                            ((p->x86_vendor & (X86_VENDOR_AMD |
> +                                                               X86_VENDOR_HYGON))
> +                                             ? CPUID_GUEST_NR_EXTD_AMD
> +                                             : CPUID_GUEST_NR_EXTD_INTEL) - 1);

... you don't do the same here (or else you would have to further
switch to e.g. using 1u, to please min()'s type checking).

Just to mention it (I think that U wants dropping for now), in the
earlier case if you switched to UL, you/we would be able to switch
from min_t() to the type-safe min().

> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -383,7 +383,7 @@ int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
>  
>      if ( !vector )
>      {
> -        int pirq = ((addr >> 32) & 0xffffff00) | dest;
> +        int pirq = ((addr >> 32) & 0xffffff00U) | dest;

This is fishy, not just because of the use of plain int, but even more
so ...

>          if ( pirq > 0 )
>          {

... with this following. It leaves unclear what negative values would
mean. I think pirq wants to be unsigned int (pirq_info() expects it
this way, albeit far from all of its invocations adhere to this rule),
but the situation isn't helped by XEN_DMOP_inject_msi not having any
comment whatsoever on the meaning of the upper half of the uint64_t
addr field that's being passed in.

I'm inclined to omit this hunk for now. I'll look around some more,
and if I can come to a sensible conclusion I may then submit a patch
just for this.

> --- a/xen/arch/x86/hvm/stdvga.c
> +++ b/xen/arch/x86/hvm/stdvga.c
> @@ -39,22 +39,22 @@
>  
>  #define PAT(x) (x)
>  static const uint32_t mask16[16] = {
> -    PAT(0x00000000),
> -    PAT(0x000000ff),
> -    PAT(0x0000ff00),
> -    PAT(0x0000ffff),
> -    PAT(0x00ff0000),
> -    PAT(0x00ff00ff),
> -    PAT(0x00ffff00),
> -    PAT(0x00ffffff),
> -    PAT(0xff000000),
> -    PAT(0xff0000ff),
> -    PAT(0xff00ff00),
> -    PAT(0xff00ffff),
> -    PAT(0xffff0000),
> -    PAT(0xffff00ff),
> -    PAT(0xffffff00),
> -    PAT(0xffffffff),
> +    PAT(0x00000000U),
> +    PAT(0x000000ffU),
> +    PAT(0x0000ff00U),
> +    PAT(0x0000ffffU),
> +    PAT(0x00ff0000U),
> +    PAT(0x00ff00ffU),
> +    PAT(0x00ffff00U),
> +    PAT(0x00ffffffU),
> +    PAT(0xff000000U),
> +    PAT(0xff0000ffU),
> +    PAT(0xff00ff00U),
> +    PAT(0xff00ffffU),
> +    PAT(0xffff0000U),
> +    PAT(0xffff00ffU),
> +    PAT(0xffffff00U),
> +    PAT(0xffffffffU),
>  };
>  
>  /* force some bits to zero */
> @@ -70,15 +70,15 @@ static const uint8_t sr_mask[8] = {
>  };
>  
>  static const uint8_t gr_mask[9] = {
> -    (uint8_t)~0xf0, /* 0x00 */
> -    (uint8_t)~0xf0, /* 0x01 */
> -    (uint8_t)~0xf0, /* 0x02 */
> -    (uint8_t)~0xe0, /* 0x03 */
> -    (uint8_t)~0xfc, /* 0x04 */
> -    (uint8_t)~0x84, /* 0x05 */
> -    (uint8_t)~0xf0, /* 0x06 */
> -    (uint8_t)~0xf0, /* 0x07 */
> -    (uint8_t)~0x00, /* 0x08 */
> +    (uint8_t)~0xf0,
> +    (uint8_t)~0xf0,
> +    (uint8_t)~0xf0,
> +    (uint8_t)~0xe0,
> +    (uint8_t)~0xfc,
> +    (uint8_t)~0x84,
> +    (uint8_t)~0xf0,
> +    (uint8_t)~0xf0,
> +    (uint8_t)~0x00,
>  };

The changelog for v3 says you did drop the changes to this array.

> --- a/xen/arch/x86/include/asm/hvm/trace.h
> +++ b/xen/arch/x86/include/asm/hvm/trace.h
> @@ -58,7 +58,7 @@
>  #define DO_TRC_HVM_VLAPIC           DEFAULT_HVM_MISC
>  
>  
> -#define TRC_PAR_LONG(par) ((par)&0xFFFFFFFF),((par)>>32)
> +#define TRC_PAR_LONG(par) ((par) & 0xFFFFFFFFU), ((par) >> 32)

Perhaps again better to switch to a uint32_t cast on the lhs of the comma.

> @@ -93,7 +93,7 @@
>      HVMTRACE_ND(evt, 0, 0)
>  
>  #define HVMTRACE_LONG_1D(evt, d1)                  \
> -                   HVMTRACE_2D(evt ## 64, (d1) & 0xFFFFFFFF, (d1) >> 32)
> +                   HVMTRACE_2D(evt ## 64, (d1) & 0xFFFFFFFFU, (d1) >> 32)

Same here then.

>  /* K6 MSRs */
> -#define MSR_K6_EFER			0xc0000080
> -#define MSR_K6_STAR			0xc0000081
> -#define MSR_K6_WHCR			0xc0000082
> -#define MSR_K6_UWCCR			0xc0000085
> -#define MSR_K6_EPMR			0xc0000086
> -#define MSR_K6_PSOR			0xc0000087
> -#define MSR_K6_PFIR			0xc0000088
> +#define MSR_K6_EFER			0xc0000080U
> +#define MSR_K6_STAR			0xc0000081U
> +#define MSR_K6_WHCR			0xc0000082U
> +#define MSR_K6_UWCCR			0xc0000085U
> +#define MSR_K6_EPMR			0xc0000086U
> +#define MSR_K6_PSOR			0xc0000087U
> +#define MSR_K6_PFIR			0xc0000088U

This entire block can be dropped rather than adjusted; there are no uses of
these constants. I expect they're a remnant of 32-bit Xen, which has been
gone for a decade.

> @@ -459,10 +459,10 @@
>  #define MSR_VIA_BCR2			0x00001147
>  
>  /* Transmeta defined MSRs */
> -#define MSR_TMTA_LONGRUN_CTRL		0x80868010
> -#define MSR_TMTA_LONGRUN_FLAGS		0x80868011
> -#define MSR_TMTA_LRTI_READOUT		0x80868018
> -#define MSR_TMTA_LRTI_VOLT_MHZ		0x8086801a
> +#define MSR_TMTA_LONGRUN_CTRL		0x80868010U
> +#define MSR_TMTA_LONGRUN_FLAGS		0x80868011U
> +#define MSR_TMTA_LRTI_READOUT		0x80868018U
> +#define MSR_TMTA_LRTI_VOLT_MHZ		0x8086801aU

Same here.

> --- a/xen/arch/x86/x86_64/acpi_mmcfg.c
> +++ b/xen/arch/x86/x86_64/acpi_mmcfg.c
> @@ -50,7 +50,7 @@ static int __init acpi_mcfg_check_entry(struct acpi_table_mcfg *mcfg,
>  {
>      int year;
>  
> -    if (cfg->address < 0xFFFFFFFF)
> +    if (cfg->address < 0xFFFFFFFFU)
>          return 0;

This check is bogus and would better be corrected. Such a correction
would presumably deal with the Misra violation at the same time.

Jan

