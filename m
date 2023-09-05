Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7C8792432
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 17:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595773.929386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdYM7-0003h6-7v; Tue, 05 Sep 2023 15:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595773.929386; Tue, 05 Sep 2023 15:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdYM7-0003f9-49; Tue, 05 Sep 2023 15:52:43 +0000
Received: by outflank-mailman (input) for mailman id 595773;
 Tue, 05 Sep 2023 15:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdYM5-0003f3-Q3
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 15:52:42 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d5644d4-4c04-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 17:52:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7953.eurprd04.prod.outlook.com (2603:10a6:20b:246::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 15:52:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 15:52:36 +0000
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
X-Inumbo-ID: 3d5644d4-4c04-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5fgjzWAugmi1/QXYBpLKuR5DFsXtcVFcwqKqAyDXhmEJ78G0alW7KmnBHW7vb4PNIzpr+NrrJBwo6fmOOU0LvkWqsaduSL4WbRNBzLlDe2oft3i7AP6pFgEYDZUOUcfm9CJGqG4ScgIF5gWlN2RBcaSJbUFBRG8i7bcaLekQNYX5xNMq1n/nMKkSppTQootP+MKfjVncw4s82GwTgg77ilJ4Hh3+XYpSW0soYhXyV/VgigCUP63hyfxyguWIcCBm5RpFifxxKxlfl8+83oLwmgotZyMDIr9n3YBtWrr4GSHUmMjT0rt7HJZasPK9lo6y7E/j/i0Az91cGz49pS2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAiq6nDoxcQSexF9dVvEFeOM0Tr4rdbNV/KwAN1lTTI=;
 b=L7EGixHeo9pvYBO6zNRuJDLad+ObQegycP6LBwcTibLZU/h/kBLYFYBHfKWZF/whj0QCknsry+QBsET2gqLv+9navfrVw0u8PDAxZukvbFyKOa6k8YM0SRcYtxUEE4jVdAEkEHXdZhUXPv13XOqBywQFSRMaeM8K8Jdy6mIcuOufDBvoZ0f3wlncU1YTKy73hoQ7bNllDmkIcPMiNnye7Mr+H9LtM1fckSXoboby6fuBWvcquvK5MRjk557jN4NjUs9E54WS0uao0cAttQAvMKehIU31RPMlwjezS/c7tG7Fd6nVVjN/Ect5fVgs9OUTMg2k+rn1lO88P62cjI//8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAiq6nDoxcQSexF9dVvEFeOM0Tr4rdbNV/KwAN1lTTI=;
 b=2rOp3qnVdcJ96QB2eZx8zbfn6bScHp2O2yG0k/G7EuNJ28FwfoCfs+fE3ISiicfbLBofmPvL6GDu8Sffx/w3CER6Gl5SHUIDZU5//NVzPOCT5UwcXuK1C5dGHpv/CMI0LV84rC8nDNYOumeJ/mfuryF09a8oMhQ365WW+K7W+NV8s5DP9C3QyvaLS/ZHiJaDZPp241ChuiBFOpEqvKS7d5lNK9Qo320L3iMVPdtwm0eGrYSCjWW4D4J804EEYNvVzL+zx96a2Cw1OnRqHM+nEdeEOhNYQ60ULyoHrSbSbDME8ptSMj4yfGF0GHfuDXm3aU4TrNcl/T9owIuQds/F1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16496c4c-4c92-7ed9-a612-72e75f86798f@suse.com>
Date: Tue, 5 Sep 2023 17:52:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 3/5] xen/ppc: Define minimal stub headers required for
 full build
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693590982.git.sanastasio@raptorengineering.com>
 <dd3d9c5d9ec94f9e1747ccc0fbf82629a58bddcb.1693590982.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dd3d9c5d9ec94f9e1747ccc0fbf82629a58bddcb.1693590982.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f5d557-b881-4aa8-d694-08dbae281fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9D4K+KmC21H9I5qhouFRRIvC2YPDAWonPdYKcsgQtUMMWhtCxP/fPzLxKOg+MHJQXIR064SMrtb0028giAOWrW+jsLLbTj3S6J3v8A4iWlVKpc1v+0HXMtOFXLg0NM8TZ1PbMDtd3rD6Dd4JfGqxxM8Kt4CSKKNwN8TSrdzJWzWzpj1PX+s5qLkpZV7aVq2e5SYtPspWmTzgXpJdps2+rCusDPmfOCHjmHRcX/2xQkkBVBzFoBjmuqCPKrKpE6i9eC7JsmLu+EEu6gVfF6YY4fIicxo+Hz4sApbFA6HHk//W9kxYneBw4D0NTYIU9mSnZF9a0fLc3J4sXn+HynN9G03JutZhet8MBGTQOTMDKMlgYRQcItu7gYAlTsYaiY8rwHgutEmO4FfQ3rxmRyQ2A7ivMlyb192n5uPKV4j4YS706qqDrD6sZvN0QPZ06FWgtUzzTPO3NZ/SUGKQ5j8c8YPd7cbOQSmgSxsZ5tcX9PxkAfl6vRAMpFquLRzNjyKALa9z1NPhYcJjP2LVSN7OOTKLuadZgekIQRIvwxjAszIkzQ8S+NIzPIFORNKSwK/D5AzqTrlPLTQ8xqP6Ae+SlkCUdK0cSPRMs8n11MY4uZBIBxGzRUewoBahQ23eq0tMg28ZkYz9i3R2Fd8NRY83hQ0gkS+c4KNy/PpaE8bkZ8g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199024)(1800799009)(186009)(66556008)(66476007)(66946007)(31696002)(86362001)(41300700001)(316002)(6916009)(6512007)(31686004)(2616005)(26005)(6486002)(53546011)(6506007)(4326008)(5660300002)(8936002)(8676002)(478600001)(36756003)(38100700002)(83380400001)(30864003)(2906002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXFnOThsS3NWQ21ja3ZsbGpuQmovR0JINzBBZTcxemdnSVJ3VmVIaFFaMDl1?=
 =?utf-8?B?QlcxL3BIKytGb1lZOUZlWVZjRTZqQ0lqWCs3VVdlc0tGK3FpWG9GOTdpd0Nw?=
 =?utf-8?B?S0E0YmcrT0J3UnQ4ZUcxRHBnWi9USXRvTnc5T28rSnlBeDcxSUFCRFhET1ov?=
 =?utf-8?B?ZGtoMzdwYlgxM2g5RVFXNUNJODN0QUgxeWE4K2JMOVVpczArcVlkek45QjJ2?=
 =?utf-8?B?VFI4QmhCV1pSdE9FcjlYVWtxV250dGFrcXRsbnBORFZxR1N5K2pPSEhCN0h0?=
 =?utf-8?B?b3FJNktDNi9kMFllMzZKUWhGNkdORWZSS0V1QnBlNHpWMFBvWFFtSnNxTHRy?=
 =?utf-8?B?MEw4TUhWbEROUTNnbmhFWXdhbjc2ekcvdzJmbkJnU3ZUSkFpcnJjNElUaFY3?=
 =?utf-8?B?Qno2ZmwvUHhZMUlZdng3OHd5U2tndTVVRGh3SXEySWUyR1pxMXBSK1VRbTc0?=
 =?utf-8?B?a0g1bU9pUUN6RlVPOUZLaWdFR2U0NWhxeGdaSU5aOGx1SGtKZWx0QWM1eHl5?=
 =?utf-8?B?NlBETS9Wb1ZqenRiQlB4a3FSeVpVYTdlTTMzOGVraUlheG1rZFVTRWVKMk9S?=
 =?utf-8?B?NGJzK3N5UGVOdEk5cWRTQjJ6MStKbW8yM2EvQ0VCZXVmd2JmRGx3WjZhdmJX?=
 =?utf-8?B?OVJmRmppRy9la3RoRGtqeWxmdUJhSWFwRHRLTzN0NGU4M3hXUnh4WXdXRXZI?=
 =?utf-8?B?cnpkdmJtWTVhWEpWbWdiTXcwaEhEaGhweUwvLzJJQ1BGMlhSRnZYcld0TkRR?=
 =?utf-8?B?cG1mZzdMb2IvcGlhTUJOVHQxLzNHWXZqYUthdUQ2bFFkalN1QXBxWVk4ZW1D?=
 =?utf-8?B?cDVoYVdIL1hJS01rdW94RTNSN05Vd0dIRjd6MEhJTlc1dGRqZUNyV2hVREpM?=
 =?utf-8?B?cU1tSWVqcnpwemkvdTdyMGNyc2t5M1NtUDU4Y1hUdDNINDk4M3o1UWxvUnhv?=
 =?utf-8?B?b2p3OEVDZUxFSlhaWThleitiamx4SUhsUnVpd1JDamhWK2I0bVhlLzV1T0li?=
 =?utf-8?B?QzJJcXN3NEFoRGRkcTRDdVpWOUZ0KzRRYXlPVzBVanlnUFdaNG5OQlIrZk91?=
 =?utf-8?B?SXR2Ykp3RHpyR0RDajllTjdpK3J2dWZBTXc0K1pWS1hCK1ZvWHlCQTlLUlVn?=
 =?utf-8?B?OWFNY1lneUxEc294VXVXcXh2ejh6alFzY014YkRrUmNQT2k0N2cxQkc4N1Fm?=
 =?utf-8?B?UGtRL0JQcXFqd3RBenpIRUdKV05kTDRabnIxU2hxcnFpT0xodllCVGtBMG9T?=
 =?utf-8?B?bXVUdHpsR0YzeUdERHpsNzVhSHRSeE5lTWcxOTU3U2JGb3BpM0d2SkRVeWR3?=
 =?utf-8?B?Qk9kOU9tVDRVU2V5RGk4ZjJRSklxZmxLYklkQXdsUVV2SEZIMnU4U0NSVGti?=
 =?utf-8?B?SHRCeWpsTy9oKzdiM2VYQ2pIbGdWV21RKzFYa3QyWmdXL0FTWVJBQkhqbE1Y?=
 =?utf-8?B?YlMxRkJPU0FZbEYyU01qSlltNTZwTkRQdGVnVzYrTEZNWTkxSGQvRUU2QXdT?=
 =?utf-8?B?MUtJNndmdkcwcC81VFViaHJqeFNEWTJ3b0dHV3FPMldwODZvMGdVa2x3eVJQ?=
 =?utf-8?B?ZitzS2svLzRLWHdUWDFqRkFKSnd3ZWVOa09majlZdzRYN2ZRU3kvU0JqdENm?=
 =?utf-8?B?T25rS3dZU3B5U1RkM2pnVS9weU00ejBqMzU0NmVYR1dIUTlUazlXT3pWNk12?=
 =?utf-8?B?a2dyQnIwT2hKanpxQ0NCdXYyQWJpdUFaV2doK2NDTXNjSmUxNFJiOVQrM004?=
 =?utf-8?B?b05lNWk0WTVzdjhqdmdaZjVLbGNydjlVMDhLVzdFajVwd29ZclhXbkl5VlRG?=
 =?utf-8?B?eG5MRGN5UU9aUzk2Zjh5TWlnV1BxNVMyeTJjUllHalVGS2ZUalZHWlppUkNm?=
 =?utf-8?B?enVlRk5odkp2eW85ckI5cS85OGRLdG9PR3g0bHdWSTJIS3d3YWVHRGdpVkFL?=
 =?utf-8?B?SmZEc2svM1VLeUQrTUZFenZOMHROcDc1WW9xVU1LeDhPQS9aU2tzZUZHNmdM?=
 =?utf-8?B?SXI1bFcvR1lMckM0Kyt0M3lvVWVaTFRJcnVQK1B2WWFrQ2lMK1FUNEpEN1Rz?=
 =?utf-8?B?eG1JUVNZVFJIUUpKUXVQRml3N0xSQWhWRFVFR1lBVmloakw1RFgwVXc3bVNw?=
 =?utf-8?Q?33YiGxmt2fVM0BtGlpdC0e3dC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f5d557-b881-4aa8-d694-08dbae281fdb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 15:52:36.0739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0F0DTK/P0TJr1BAeFvRG64UiKr/BhQjjnF9c00Da7bf4OX6hQJNGtcElRK1YZ/S4Rx0FLAFGoJBP+7rrLQWOjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7953

On 01.09.2023 20:25, Shawn Anastasio wrote:
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/device.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_PPC_DEVICE_H__
> +#define __ASM_PPC_DEVICE_H__
> +
> +enum device_type
> +{
> +    DEV_DT,
> +    DEV_PCI,
> +};
> +
> +struct device {
> +    enum device_type type;
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
> +#endif
> +};
> +
> +enum device_class
> +{
> +    DEVICE_SERIAL,
> +    DEVICE_IOMMU,
> +    DEVICE_PCI_HOSTBRIDGE,
> +    /* Use for error */
> +    DEVICE_UNKNOWN,
> +};
> +
> +struct device_desc {
> +    /* Device name */
> +    const char *name;
> +    /* Device class */
> +    enum device_class class;
> +    /* List of devices supported by this driver */
> +    const struct dt_device_match *dt_match;
> +    /*
> +     * Device initialization.
> +     *
> +     * -EAGAIN is used to indicate that device probing is deferred.
> +     */
> +    int (*init)(struct dt_device_node *dev, const void *data);
> +};
> +
> +typedef struct device device_t;
> +
> +#define DT_DEVICE_START(_name, _namestr, _class)                    \

Nit: Underscore-prefixed macro parameter names again.

> --- a/xen/arch/ppc/include/asm/mm.h
> +++ b/xen/arch/ppc/include/asm/mm.h
> @@ -1,10 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef _ASM_PPC_MM_H
>  #define _ASM_PPC_MM_H
> 
> +#include <public/xen.h>
> +#include <xen/pdx.h>
> +#include <xen/types.h>
> +#include <asm/config.h>
>  #include <asm/page-bits.h>
> +#include <asm/page.h>
> +
> +void setup_initial_pagetables(void);
> 
>  #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
>  #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
> +#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
> +#define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
> +#define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
> +#define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
> +#define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
> +#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)va))
> +#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
> 
>  #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
>  #define maddr_to_virt(pa) ((void *)((paddr_t)(pa) | XEN_VIRT_START))

Is it intentional that the additions don't align, padding-wise, with the
surrounding #define-s?

> @@ -13,6 +28,237 @@
>  #define __pa(x)             (virt_to_maddr(x))
>  #define __va(x)             (maddr_to_virt(x))
> 
> -void setup_initial_pagetables(void);
> +/* Convert between Xen-heap virtual addresses and machine frame numbers. */
> +#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
> +#define __mfn_to_virt(mfn) (maddr_to_virt((paddr_t)(mfn) << PAGE_SHIFT))
> +
> +/* Convert between Xen-heap virtual addresses and page-info structures. */
> +static inline struct page_info *virt_to_page(const void *v)
> +{
> +    BUG_ON("unimplemented");
> +    return NULL;
> +}
> +
> +/*
> + * We define non-underscored wrappers for above conversion functions.
> + * These are overriden in various source files while underscored version
> + * remain intact.
> + */
> +#define virt_to_mfn(va)     __virt_to_mfn(va)
> +#define mfn_to_virt(mfn)    __mfn_to_virt(mfn)

Is the comment really applicable? The only non-arch-specific file still
doing so is xenoprof.c, and I'm not sure you mean to support xenoprof
on PPC. PPC-specific files would better be introduced in a type-safe way
right from the beginning.

> +#define PG_shift(idx)   (BITS_PER_LONG - (idx))
> +#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
> +
> +#define PGT_none          PG_mask(0, 1)  /* no special uses of this page   */
> +#define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
> +#define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
> +
> + /* 2-bit count of uses of this frame as its current type. */
> +#define PGT_count_mask    PG_mask(3, 3)
> +
> +/* Cleared when the owning guest 'frees' this page. */
> +#define _PGC_allocated    PG_shift(1)
> +#define PGC_allocated     PG_mask(1, 1)
> +/* Page is Xen heap? */
> +#define _PGC_xen_heap     PG_shift(2)
> +#define PGC_xen_heap      PG_mask(1, 2)
> +/* Page is broken? */
> +#define _PGC_broken       PG_shift(7)
> +#define PGC_broken        PG_mask(1, 7)
> + /* Mutually-exclusive page states: { inuse, offlining, offlined, free }. */
> +#define PGC_state         PG_mask(3, 9)
> +#define PGC_state_inuse   PG_mask(0, 9)
> +#define PGC_state_offlining PG_mask(1, 9)
> +#define PGC_state_offlined PG_mask(2, 9)
> +#define PGC_state_free    PG_mask(3, 9)
> +#define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
> +/* Page is not reference counted */
> +#define _PGC_extra        PG_shift(10)
> +#define PGC_extra         PG_mask(1, 10)
> +
> +/* Count of references to this frame. */
> +#define PGC_count_width   PG_shift(10)
> +#define PGC_count_mask    ((1UL<<PGC_count_width)-1)
> +
> +/*
> + * Page needs to be scrubbed. Since this bit can only be set on a page that is
> + * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
> + */
> +#define _PGC_need_scrub   _PGC_allocated
> +#define PGC_need_scrub    PGC_allocated
> +
> +#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
> +#define is_xen_heap_mfn(mfn) \
> +    (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
> +
> +#define is_xen_fixed_mfn(mfn)                                   \
> +    ((mfn_to_maddr(mfn) >= virt_to_maddr(&_start)) &&           \
> +     (mfn_to_maddr(mfn) <= virt_to_maddr((vaddr_t)_end - 1)))

Please use (or, preferred, do not use) & and cast consistently on _start
and _end.

> +#define page_get_owner(_p)    (_p)->v.inuse.domain
> +#define page_set_owner(_p,_d) ((_p)->v.inuse.domain = (_d))
> +
> +/* TODO: implement */
> +#define mfn_valid(mfn) ({ (void) (mfn); 0; })
> +
> +#define domain_set_alloc_bitsize(d) ((void)(d))
> +#define domain_clamp_alloc_bitsize(d, b) (b)
> +
> +#define PFN_ORDER(pfn_) ((pfn_)->v.free.order)
> +
> +struct page_info
> +{
> +    /* Each frame can be threaded onto a doubly-linked list. */
> +    struct page_list_entry list;
> +
> +    /* Reference count and various PGC_xxx flags and fields. */
> +    unsigned long count_info;
> +
> +    /* Context-dependent fields follow... */
> +    union {
> +        /* Page is in use: ((count_info & PGC_count_mask) != 0). */
> +        struct {
> +            /* Type reference count and various PGT_xxx flags and fields. */
> +            unsigned long type_info;
> +        } inuse;
> +        /* Page is on a free list: ((count_info & PGC_count_mask) == 0). */
> +        union {
> +            struct {
> +                /*
> +                 * Index of the first *possibly* unscrubbed page in the buddy.
> +                 * One more bit than maximum possible order to accommodate
> +                 * INVALID_DIRTY_IDX.
> +                 */
> +#define INVALID_DIRTY_IDX ((1UL << (MAX_ORDER + 1)) - 1)
> +                unsigned long first_dirty:MAX_ORDER + 1;
> +
> +                /* Do TLBs need flushing for safety before next page use? */
> +                bool need_tlbflush:1;
> +
> +#define BUDDY_NOT_SCRUBBING    0
> +#define BUDDY_SCRUBBING        1
> +#define BUDDY_SCRUB_ABORT      2
> +                unsigned long scrub_state:2;
> +            };
> +
> +            unsigned long val;
> +        } free;
> +
> +    } u;
> +
> +    union {
> +        /* Page is in use, but not as a shadow. */
> +        struct {
> +            /* Owner of this page (zero if page is anonymous). */
> +            struct domain *domain;

Since this is a pointer, NULL (instead of zero) would seem more appropriate
in the comment.

> +        } inuse;
> +
> +        /* Page is on a free list. */
> +        struct {
> +            /* Order-size of the free chunk this page is the head of. */
> +            unsigned int order;
> +        } free;
> +
> +    } v;
> +
> +    union {
> +        /*
> +         * Timestamp from 'TLB clock', used to avoid extra safety flushes.
> +         * Only valid for: a) free pages, and b) pages with zero type count
> +         */
> +        u32 tlbflush_timestamp;
> +    };
> +    u64 pad;

uint<N>_t please (or unsigned int/long).

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/monitor.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Derived from xen/arch/arm/include/asm/monitor.h */
> +#ifndef __ASM_PPC_MONITOR_H__
> +#define __ASM_PPC_MONITOR_H__
> +
> +#include <public/domctl.h>
> +#include <xen/errno.h>
> +
> +static inline
> +void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
> +{
> +}
> +
> +static inline
> +int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
> +{
> +    /* No arch-specific monitor ops on PPC. */
> +    return -EOPNOTSUPP;
> +}
> +
> +int arch_monitor_domctl_event(struct domain *d,
> +                              struct xen_domctl_monitor_op *mop);
> +
> +static inline
> +int arch_monitor_init_domain(struct domain *d)
> +{
> +    /* No arch-specific domain initialization on PPC. */
> +    return 0;
> +}
> +
> +static inline
> +void arch_monitor_cleanup_domain(struct domain *d)
> +{
> +    /* No arch-specific domain cleanup on PPC. */
> +}
> +
> +static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
> +{
> +    BUG_ON("unimplemented");
> +    return 0;
> +}
> +
> +#endif /* __ASM_PPC_MONITOR_H__ */

From a formal perspective you'll need Tamas's ack for this file, so you
may want to Cc him. (Also for vm_event.h, unless the generic solution
there doesn't land first.)

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/p2m.h
> @@ -0,0 +1,105 @@
> +#ifndef __ASM_PPC_P2M_H__
> +#define __ASM_PPC_P2M_H__
> +
> +#include <asm/page-bits.h>
> +
> +#define paddr_bits PADDR_BITS
> +
> +/*
> + * List of possible type for each page in the p2m entry.
> + * The number of available bit per page in the pte for this purpose is 4 bits.
> + * So it's possible to only have 16 fields. If we run out of value in the
> + * future, it's possible to use higher value for pseudo-type and don't store
> + * them in the p2m entry.
> + */
> +typedef enum {
> +    p2m_invalid = 0,    /* Nothing mapped here */
> +    p2m_ram_rw,         /* Normal read/write guest RAM */
> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
> +    p2m_mmio_direct_nc, /* Read/write mapping of genuine MMIO area non-cacheable */
> +    p2m_mmio_direct_c,  /* Read/write mapping of genuine MMIO area cacheable */

Didn't you agree to drop at least what's clear Arm-specific?

> --- a/xen/arch/ppc/include/asm/system.h
> +++ b/xen/arch/ppc/include/asm/system.h
> @@ -1,6 +1,228 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) IBM Corp. 2005
> + * Copyright (C) Raptor Engineering LLC
> + *
> + * Authors: Jimi Xenidis <jimix@watson.ibm.com>
> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
> + */
> +
>  #ifndef _ASM_SYSTEM_H_
>  #define _ASM_SYSTEM_H_
> 
> -#define smp_wmb() __asm__ __volatile__ ( "lwsync" : : : "memory" )
> +#include <xen/lib.h>
> +#include <asm/memory.h>
> +#include <asm/time.h>
> +#include <asm/processor.h>
> +#include <asm/msr.h>
> +
> +#define xchg(ptr,x) 							                               \
> +({									                                           \
> +	__typeof__(*(ptr)) _x_ = (x);					                           \

Hard tabs look to have slipped in here.

> +	(__typeof__(*(ptr))) __xchg((ptr), (unsigned long)_x_, sizeof(*(ptr)));    \
> +})
> +
> +#define build_xchg(fn, type, ldinsn, stinsn) \
> +static inline unsigned long fn(volatile type *m, unsigned long val)            \
> +{                                                                              \
> +    unsigned long dummy;                                                       \
> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER                                    \
> +                   "1: " ldinsn " %0,0,%3\n"                                   \
> +                   stinsn " %2,0,%3\n"                                         \
> +                   "2:  bne- 1b"                                               \
> +                   PPC_ATOMIC_EXIT_BARRIER                                     \
> +                   : "=&r" (dummy), "=m" (*m)                                  \
> +                   : "r" (val), "r" (m)                                        \
> +                   : "cc", "memory" );                                         \
> +    return dummy;                                                              \
> +}
> +
> +build_xchg(__xchg_u8, uint8_t, "lbarx", "stbcx.")
> +build_xchg(__xchg_u16, uint16_t, "lharx", "sthcx.")
> +build_xchg(__xchg_u32, uint32_t, "lwarx", "stwcx.")
> +build_xchg(__xchg_u64, uint64_t, "ldarx", "stdcx.")
> +
> +#undef build_xchg
> +
> +/*
> + * This function doesn't exist, so you'll get a linker error
> + * if something tries to do an invalid xchg().
> + */
> +extern void __xchg_called_with_bad_pointer(void);
> +
> +static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
> +                                   int size)
> +{
> +    switch (size) {

Nit: Since the file looks like it wants to use Xen style:

    switch ( size )
    {

please.

> +    case 1:
> +        return __xchg_u8(ptr, x);
> +    case 2:
> +        return __xchg_u16(ptr, x);
> +    case 4:
> +        return __xchg_u32(ptr, x);
> +    case 8:
> +        return __xchg_u64(ptr, x);
> +    }
> +    __xchg_called_with_bad_pointer();
> +    return x;
> +}
> +
> +
> +static inline unsigned long __cmpxchg_u32(volatile int *p, int old, int new)
> +{
> +    unsigned int prev;
> +
> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
> +                   "1: lwarx   %0,0,%2\n"
> +                   "cmpw    0,%0,%3\n"
> +                   "bne-    2f\n "
> +                   "stwcx.  %4,0,%2\n"
> +                   "bne-    1b\n"
> +                   PPC_ATOMIC_EXIT_BARRIER "\n"
> +                   "2:"
> +                   : "=&r" (prev), "=m" (*p)
> +                   : "r" (p), "r" (old), "r" (new), "m" (*p)
> +                   : "cc", "memory" );
> +
> +    return prev;
> +}
> +
> +static inline unsigned long __cmpxchg_u64(volatile long *p, unsigned long old,
> +                                          unsigned long new)
> +{
> +    unsigned long prev;
> +
> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
> +                   "1: ldarx   %0,0,%2\n"
> +                   "cmpd    0,%0,%3\n"
> +                   "bne-    2f\n"
> +                   "stdcx.  %4,0,%2\n"
> +                   "bne-    1b"
> +                   PPC_ATOMIC_EXIT_BARRIER "\n"
> +                   "2:"
> +                   : "=&r" (prev), "=m" (*p)
> +                   : "r" (p), "r" (old), "r" (new), "m" (*p)
> +                   : "cc", "memory" );
> +
> +    return prev;
> +}
> +
> +/* This function doesn't exist, so you'll get a linker error
> +   if something tries to do an invalid cmpxchg().  */
> +extern void __cmpxchg_called_with_bad_pointer(void);
> +
> +static always_inline unsigned long __cmpxchg(
> +    volatile void *ptr,
> +    unsigned long old,
> +    unsigned long new,
> +    int size)
> +{
> +    switch (size) {
> +    case 2:
> +        BUG_ON("unimplemented"); return 0; /* XXX implement __cmpxchg_u16 ? */
> +    case 4:
> +        return __cmpxchg_u32(ptr, old, new);
> +    case 8:
> +        return __cmpxchg_u64(ptr, old, new);
> +    }
> +    __cmpxchg_called_with_bad_pointer();
> +    return old;
> +}
> +
> +#define cmpxchg_user(ptr,o,n) cmpxchg(ptr,o,n)
> +
> +#define cmpxchg(ptr,o,n)                         \
> +  ({                                     \
> +     __typeof__(*(ptr)) _o_ = (o);                   \
> +     __typeof__(*(ptr)) _n_ = (n);                   \
> +     (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,       \
> +                    (unsigned long)_n_, sizeof(*(ptr))); \

Not: Style (multiple previously mentioned issues).

> +  })
> +
> +
> +/*
> + * Memory barrier.
> + * The sync instruction guarantees that all memory accesses initiated
> + * by this processor have been performed (with respect to all other
> + * mechanisms that access memory).  The eieio instruction is a barrier
> + * providing an ordering (separately) for (a) cacheable stores and (b)
> + * loads and stores to non-cacheable memory (e.g. I/O devices).
> + *
> + * mb() prevents loads and stores being reordered across this point.
> + * rmb() prevents loads being reordered across this point.
> + * wmb() prevents stores being reordered across this point.
> + * read_barrier_depends() prevents data-dependent loads being reordered
> + *  across this point (nop on PPC).
> + *
> + * We have to use the sync instructions for mb(), since lwsync doesn't
> + * order loads with respect to previous stores.  Lwsync is fine for
> + * rmb(), though.
> + * For wmb(), we use sync since wmb is used in drivers to order
> + * stores to system memory with respect to writes to the device.
> + * However, smp_wmb() can be a lighter-weight eieio barrier on
> + * SMP since it is only used to order updates to system memory.
> + */
> +#define mb()   __asm__ __volatile__ ("sync" : : : "memory")
> +#define rmb()  __asm__ __volatile__ ("lwsync" : : : "memory")
> +#define wmb()  __asm__ __volatile__ ("sync" : : : "memory")

Nit: Missing blanks.

> +#define read_barrier_depends()  do { } while(0)
> +
> +#define set_mb(var, value)  do { var = value; smp_mb(); } while (0)
> +#define set_wmb(var, value) do { var = value; smp_wmb(); } while (0)
> +
> +#define smp_mb__before_atomic()    smp_mb()
> +#define smp_mb__after_atomic()     smp_mb()
> +
> +#ifdef CONFIG_SMP
> +#define smp_mb()    mb()
> +#define smp_rmb()   rmb()
> +#define smp_wmb()   __asm__ __volatile__ ("lwsync" : : : "memory")
> +#define smp_read_barrier_depends()  read_barrier_depends()
> +#else
> +#define smp_mb()    __asm__ __volatile__("": : :"memory")
> +#define smp_rmb()   __asm__ __volatile__("": : :"memory")
> +#define smp_wmb()   __asm__ __volatile__("": : :"memory")

And more missing blanks (further below from here).

> +#define smp_read_barrier_depends()  do { } while(0)
> +#endif /* CONFIG_SMP */
> +
> +#define local_save_flags(flags) ((flags) = mfmsr())
> +#define local_irq_restore(flags) do { \
> +        __asm__ __volatile__("": : :"memory"); \
> +        mtmsrd((flags)); \
> +} while(0)
> +
> +static inline void local_irq_disable(void)
> +{
> +    unsigned long msr;
> +    msr = mfmsr();
> +    mtmsrd(msr & ~MSR_EE);
> +    asm volatile ( "" : : : "memory" );

That's simply barrier(), isn't it? Please avoid open-coding. (More
further down.)

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/time.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_PPC_TIME_H__
> +#define __ASM_PPC_TIME_H__
> +
> +#include <xen/lib.h>
> +#include <asm/processor.h>
> +#include <asm/regs.h>
> +
> +struct vcpu;
> +
> +/* TODO: implement */
> +static inline void force_update_vcpu_system_time(struct vcpu *v) { BUG_ON("unimplemented"); }

Nit: Too long line.

Jan

