Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C3B78C657
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 15:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592243.924940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaz0p-0005ql-5s; Tue, 29 Aug 2023 13:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592243.924940; Tue, 29 Aug 2023 13:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaz0p-0005nL-2L; Tue, 29 Aug 2023 13:44:07 +0000
Received: by outflank-mailman (input) for mailman id 592243;
 Tue, 29 Aug 2023 13:44:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qaz0n-0004TH-SU
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 13:44:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1da2c62d-4672-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 15:44:03 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB8016.eurprd04.prod.outlook.com (2603:10a6:102:cb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 13:44:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 13:44:01 +0000
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
X-Inumbo-ID: 1da2c62d-4672-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fADXHw09g4fvwGl77vC5dKOMUKagUk9vXecZnpwwxOPovzDot872k4hKcaeMBYA55hGGfu3q+CKm2ZxWV05GqrKW4Arx2f/svb3jMOMvmciOJJQmtC8UE7tAw24xh9JvnVzXcWautuo3MYIIMvTl1xFTl7Eflb0HfumS55WjIfME+VtJ5w9YGJ6HEt1W7zN1goM9J6biREMkC9q9oHlNQvrn337S0+LuD4AfLhoJx+al4J7ebleyWwZ8Q39tkC8pFAryURtnoms1ixtYAlSkiqYz5AvG9EokRh3DCOqDh+yARu/MUMhCVf+f+YX9gBEfYUBECWbIz4pYzMz41BqjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoXXWUlVS2d4Iiw7y+yEjRosJH3R8CJunVfjrBiz/R4=;
 b=NJiGAsPJEuLdALMvOEH+8CNhgJpwAeYK1s4Yu+4BhKfcY03W/lmLCgwcfPb6CzYLNKlLWNmf0dykVGrF1/Jjl1ln0T4U1gdnP8A7yQ0KHUrlJGgNgr46n+6dX802YLBAJQn+YWFzyxEdKXzBtPm4s3rcO47zxuFq8E+a2GZ08kYqH10vg4BY6lmh3n1dYJqM/mbxOZvYYs7Is/VRalXU5IFQsy10shMF1gxQ+i+kBTm2gC0DnFjSacY3qleJbmc0VF6zvhSg+FlxhoFusUecfaGaaFa6+c3txDRgN8vpUYj2YYTX0JWQ61KVB7vsPmIWAZQ6bhUY+ceDH5injeo7TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoXXWUlVS2d4Iiw7y+yEjRosJH3R8CJunVfjrBiz/R4=;
 b=WgYWpFbMA02yTJK300WHX+qVGLodJCmLyXNEz6a9wbAcsrs8sFkYPEKg1Zj8IrWEXkVl4gCEr03Kot34ay4c00rxU7QzEEv6a8AtDZQf4dKLAz1Q918jGwIwjDiABhkJQXjYLXxyN37xweFe+0bZ8VGhyCIIeE0qAagx9+GWnLL0fxcF1NWNez/QoeqV2pkjcVeoHlJkVstmKksZQ8DmSJji7/RitqlaTIrq6qKFQwU1PJTOCqL4EIxvyHpSTFTXfjtmzzW09AwBKM83pZS3SCSQ9F/nD0pw104nz5LNNWJl7lDkXrsM7Xg5K23DgIJ6N5bPAzCrr0fm8BxduQcMOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <257cd320-fe81-f1be-f3e5-ef43e539660a@suse.com>
Date: Tue, 29 Aug 2023 15:43:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/8] xen/ppc: Implement atomic.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <6d97bdeb1c114026105e72c6ee6e1b024565bf95.1692816595.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6d97bdeb1c114026105e72c6ee6e1b024565bf95.1692816595.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd331ff-ab28-4f87-6a62-08dba896007e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uE2HC9VVLrlAlwrRKsjhDIEm+GdDbC2brnPOQy0ZjiQLGgMYm19G7zylCgFgQQFJm3bePnFcn7AVyim7bAbKbLqpQkJFtVXjX3qN8/eqtat30UKJI7BV5gvzQVXElboy0JpPLaudiWSbz3KVcdxPokULF3/MPRkd9DgcqK0upctky5gasTQ59+/VriRHB9KZ+Kjjm+r51/McC/2JuK2Z8pzFf9B99nvRhaRTX4Y806zePvD9FwQMOaZv2g1ILoh/FlFUUzAretorZTcWH6EAm4rtZAJAwb9Isn0g92mmcKeTeUcfljW1VP/IDba/nqnPzbsbk5/Cevav6CRWH/ONhcbvZa357AKsTEVbiyXgUl+72x+ldZasBSRXA4cqqRpMYI1mW3OR8zM/XcL04BFLjAFjGIsKA8F7PHGb6aCEgxgbRHCh8WnP3MbZgsvjRVXi+0E0hNgtdMRCvFMdUe9ujo7N1kod/16IIT/Ojjiew6SEeFA/e69j7y5sfGEe2ZbuKHbD3roGp54nsB0k0p/Le7cTOk+tjYL5u/vfY0JJrMd5FmqiyBrpqzyueepVBztVXF419tI59JOIqRMEcd2v+0IiOS7VqvX5F+KA0epaLR1fqpUbizJpr5h35ReQJuwTb412denIDKIr3I0Dham/xL69b/QtknkE3j8v/xyRx0s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199024)(1800799009)(186009)(8936002)(66946007)(53546011)(31686004)(478600001)(6506007)(66476007)(66556008)(6486002)(6916009)(316002)(38100700002)(41300700001)(6512007)(36756003)(26005)(8676002)(5660300002)(31696002)(83380400001)(2906002)(86362001)(2616005)(4326008)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am5JQm9RU2FhYmFvTngzdGJqSFR1VWdpdzVrZ2VELzhldlpuN2FlcStpcjNu?=
 =?utf-8?B?ekkvbjlNdGpSd0FPMSt5K0J5aUUzUXVOWVFpejNNZXp2NUcydEdFVXlGazVh?=
 =?utf-8?B?QkdUV1F2dUhmdG1GSVNpUVpkd1k5dW9mbEs3cDlNWnZ3TWNEdXJNMmZkSmZ1?=
 =?utf-8?B?VDY1Q0cwa0xic25BYWhlYkVDcDJFYW90TDNFTEJQS2JFMzlJNGFWUEdRS2Fx?=
 =?utf-8?B?UStERk5DUlVuNlZMeFN0RjBwdHVNREs0RVhhQnJpVURneS9QVEpTcDJFT3RT?=
 =?utf-8?B?M1BydTFlZ0hsQ2JRWlZDVHJzZzM3WHNLbWpkNlZHcUtVT25GSi9PbXpTdEhx?=
 =?utf-8?B?RkhlMzZRcUh0WHBucUZobjgwMTVxUVNUZnBWWFA4TXN2MkxKWXVVcllpY2o4?=
 =?utf-8?B?VWFWVWdSa2Q1Z2pYaHM4STZsa3QvSVhaRnFwOTQxa2grbzQ5Y1hSVW9HRkZV?=
 =?utf-8?B?RGxjVnVhbE1udWN0L1k0VXZaczRzMmZPZCtPN0lzTHg1VGxwNDZvZUFPaDRo?=
 =?utf-8?B?NEs1aHB2eG9GRHBCek5LSWhUT2tKUHcxV0orOS9Na1dlU1pTaEVmNHMrbk9L?=
 =?utf-8?B?V3l6L1E3d2ZXZXAyc1UzMEd2RmdGZDFkR1ZVa0d2bnNScHhGZWFLckJrZnVm?=
 =?utf-8?B?Ynh1N0EvekZzd0dhU04zYXJ4dUJkSkFqSGswR2RCdWY5eUNxUThWVnJBd2l2?=
 =?utf-8?B?RXMvUDdJWFhBZlhZeXBvakszM1piSFlHK1d6a0NoY0JFWlNTZ2tjdTRRbHZv?=
 =?utf-8?B?UXhMYTRqeU96R3NhQSt5TW1IMU5vbVhWZnhaVVQ4aGlKSTZncWhEVVhySHV1?=
 =?utf-8?B?bmd0YXZKZjRJSzZWWG5Iekd1ZkQxTG82Z2twS3p5eE9DWTlrR3J3L0JmRG1M?=
 =?utf-8?B?YTdtdkdIUjZteDN0TFg5bHIvL0NaTEZOcFF6VDI5amp6cWhOcTBUWDkwazhk?=
 =?utf-8?B?M0VERHVTRVZuOTVNRUtPMVlVNWNueGlVWCtESE5qNzdZK1p5dElPUGVMWmx6?=
 =?utf-8?B?YzNVdVhrSUFVUFZ0NUt0Q2NhNUZ6UW42WGpTZUZkTmRQWkQxRlpqbldYU2kx?=
 =?utf-8?B?YzdnVXJmb2puS2lJcE0rcVdaVkNIWE80dDE4OFY1WXZSR3Q1cFJJVDl6M0wv?=
 =?utf-8?B?b3pMeFFyeUxWVGgwY3d3T1lhRnk2bGFVWTc0WW5wWVJPN29xNkdZeGFoQmpZ?=
 =?utf-8?B?cS81YTRiZktDdEJIdmxoV01JdERUbHNxN2hwOGdVWDRRanBnVmdhNTJyOTJi?=
 =?utf-8?B?L1lvTnJqSi9rRmlLM3JiODF1dWRtWUYxNytwZDJtbm1Jck8veUNOc0RBbGc5?=
 =?utf-8?B?WFk1WmRwQUQxeHB5ZXY5L01QeWtKNllwaG9zRGNHcnp1K3ZadnVOMnlpS2gy?=
 =?utf-8?B?RENBZnlDU0ZtVjVMYytVcHAvbUFpL0E1WS94ZnI0ZHBIK0Q4UVpucnZpdEZE?=
 =?utf-8?B?a3llb2xlY0hPei9jTUpGTFE4c2lyZVFzRzZxc1Y3MERaTnRmelpvMzNlSTZJ?=
 =?utf-8?B?R3hCY0RPUHFwcWVUbS9PYWRZSzY0U0h0KzNyT2Z1TE0zV2JhWlJBWnF1Y3Jo?=
 =?utf-8?B?cjk5WkF2TVkzRDNCSTMwQjVrd0h5S21udG1lZW40eE5waFB0NlZUZVhNUCtN?=
 =?utf-8?B?dVZISHBNc3RiWFNIdkxVMTQ0SDhyTnk3bG44MGt5ZExnME5VTDhWTjBLdnBH?=
 =?utf-8?B?VlJ2MHB5RE41N3BYRWovZDY1TXdJbFNmNEdwU1BzQSs0TVJmYlhVVGVPa1dI?=
 =?utf-8?B?OVZtQjFTUlMrWTRoN1haSVNQeE9mb0twSFBxcmFhcUxpSENyc29jTGhmYSt0?=
 =?utf-8?B?czM3OHl3dGE3Z0lic3J5WE5rdVYvSzR2WW1odUI0c1psQTZtZzNLQmU1Yk1r?=
 =?utf-8?B?NTZTYXhBbUxOTUI5NTN1dDJybVdPS1djaXVZdGRZTitIamlKakJNSFUzQUN2?=
 =?utf-8?B?UUVmck9Ba1FXQmtQaGRodW8wQU5aNzFwd211aWxuTVJodzh3Z0xsYmNtVlNO?=
 =?utf-8?B?TjFYcStRL2YwRElTdTFROS81NGU4NSs1bE9PdVRNaUhsMkJLWWp0aEwzUGZL?=
 =?utf-8?B?UHlURWdVN1RHaEhxc1lyaHZPbGcrQkNWaFNtb3NiL3hBY0tqa3k1eS9RZExX?=
 =?utf-8?Q?SSwpkPsDUVa03Pkrc8x6QjYli?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd331ff-ab28-4f87-6a62-08dba896007e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 13:44:01.1045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpMqHOQzPv7qJC0vgbRA8YR+Utx+xFP3BU3CQx2yKjGttWwxylmSXelMq9UO2oqFQO7CRtIDXLD7QeuRhEUMdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8016

On 23.08.2023 22:07, Shawn Anastasio wrote:
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/atomic.h
> @@ -0,0 +1,390 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * PowerPC64 atomic operations
> + *
> + * Copyright (C) 2001 Paul Mackerras <paulus@au.ibm.com>, IBM
> + * Copyright (C) 2001 Anton Blanchard <anton@au.ibm.com>, IBM
> + * Copyright Raptor Engineering LLC
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */

License text again despite the SPDX header?

> +#ifndef _ASM_PPC64_ATOMIC_H_
> +#define _ASM_PPC64_ATOMIC_H_
> +
> +#include <xen/atomic.h>
> +
> +#include <asm/memory.h>
> +#include <asm/system.h>

I can see that you need memory.h, but I can't spot a need for system.h.

> +static inline int atomic_read(const atomic_t *v)
> +{
> +    return *(volatile int *)&v->counter;
> +}
> +
> +static inline int _atomic_read(atomic_t v)
> +{
> +    return v.counter;
> +}
> +
> +static inline void atomic_set(atomic_t *v, int i)
> +{
> +    v->counter = i;
> +}
> +
> +static inline void _atomic_set(atomic_t *v, int i)
> +{
> +    v->counter = i;
> +}
> +
> +void __bad_atomic_read(const volatile void *p, void *res);
> +void __bad_atomic_size(void);
> +
> +#define build_atomic_read(name, insn, type)                                    \
> +    static inline type name(const volatile type *addr)                         \
> +    {                                                                          \
> +        type ret;                                                              \
> +        asm volatile ( insn "%U1%X1 %0,%1" : "=r" (ret) : "m<>" (*addr) );     \
> +        return ret;                                                            \
> +    }
> +
> +#define build_atomic_write(name, insn, type)                                   \
> +    static inline void name(volatile type *addr, type val)                     \
> +    {                                                                          \
> +        asm volatile ( insn "%U0%X0 %1,%0" : "=m<>" (*addr) : "r" (val) );     \
> +    }
> +
> +#define build_add_sized(name, ldinsn, stinsn, type)                            \
> +    static inline void name(volatile type *addr, type val)                     \
> +    {                                                                          \
> +        type t;                                                                \
> +        asm volatile ( "1: " ldinsn " %0,0,%3\n"                               \
> +                       "add%I2 %0,%0,%2\n"                                     \
> +                       stinsn " %0,0,%3 \n"                                    \
> +                       "bne- 1b\n"                                             \
> +                       : "=&r" (t), "+m" (*addr)                               \
> +                       : "r" (val), "r" (addr)                                 \
> +                       : "cc" );                                               \
> +    }
> +
> +build_atomic_read(read_u8_atomic, "lbz", uint8_t)
> +build_atomic_read(read_u16_atomic, "lhz", uint16_t)
> +build_atomic_read(read_u32_atomic, "lwz", uint32_t)
> +build_atomic_read(read_u64_atomic, "ldz", uint64_t)
> +
> +build_atomic_write(write_u8_atomic, "stb", uint8_t)
> +build_atomic_write(write_u16_atomic, "sth", uint16_t)
> +build_atomic_write(write_u32_atomic, "stw", uint32_t)
> +build_atomic_write(write_u64_atomic, "std", uint64_t)
> +
> +build_add_sized(add_u8_sized, "lbarx", "stbcx.",uint8_t)
> +build_add_sized(add_u16_sized, "lharx", "sthcx.", uint16_t)
> +build_add_sized(add_u32_sized, "lwarx", "stwcx.", uint32_t)
> +
> +#undef build_atomic_read
> +#undef build_atomic_write
> +#undef build_add_sized
> +
> +static always_inline void read_atomic_size(const volatile void *p, void *res,
> +                                           unsigned int size)
> +{
> +    ASSERT(IS_ALIGNED((vaddr_t) p, size));

Nit: Stray blank before p (several more below).

> +    switch ( size )
> +    {
> +    case 1:
> +        *(uint8_t *)res = read_u8_atomic(p);
> +        break;
> +    case 2:
> +        *(uint16_t *)res = read_u16_atomic(p);
> +        break;
> +    case 4:
> +        *(uint32_t *)res = read_u32_atomic(p);
> +        break;
> +    case 8:
> +        *(uint64_t *)res = read_u64_atomic(p);
> +        break;
> +    default:
> +        __bad_atomic_read(p, res);
> +        break;
> +    }
> +}
> +
> +static always_inline void write_atomic_size(volatile void *p, void *val,

const void *val? (But then below also don't cast away constness.)

> +                                            unsigned int size)
> +{
> +    ASSERT(IS_ALIGNED((vaddr_t) p, size));
> +    switch ( size )
> +    {
> +    case 1:
> +        write_u8_atomic(p, *(uint8_t *)val);
> +        break;
> +    case 2:
> +        write_u16_atomic(p, *(uint16_t *)val);
> +        break;
> +    case 4:
> +        write_u32_atomic(p, *(uint32_t *)val);
> +        break;
> +    case 8:
> +        write_u64_atomic(p, *(uint64_t *)val);
> +        break;
> +    default:
> +        __bad_atomic_size();
> +        break;
> +    }
> +}
> +
> +#define read_atomic(p)                                                         \
> +    ({                                                                         \
> +        union {                                                                \
> +            typeof(*(p)) val;                                                  \
> +            char c[0];                                                         \

Using [0] here is likely to set us up for compiler complaints ...

> +        } x_;                                                                  \
> +        read_atomic_size(p, x_.c, sizeof(*(p)));                               \

... here. Can't this simply be c[sizeof(*(val))]? And do you need
a union here in the first place, when read_atomic() takes void* as
its 2nd parameter?

> +        x_.val;                                                                \
> +    })
> +
> +#define write_atomic(p, x)                                                     \
> +    do                                                                         \
> +    {                                                                          \
> +        typeof(*(p)) x_ = (x);                                                 \
> +        write_atomic_size(p, &x_, sizeof(*(p)));                               \
> +    } while ( 0 )
> +
> +#define add_sized(p, x)                                                        \
> +    ({                                                                         \
> +        typeof(*(p)) x_ = (x);                                                \
> +        switch ( sizeof(*(p)) )                                                \
> +        {                                                                      \
> +        case 1:                                                                \
> +            add_u8_sized((uint8_t *) (p), x_);                                \
> +            break;                                                             \
> +        case 2:                                                                \
> +            add_u16_sized((uint16_t *) (p), x_);                              \
> +            break;                                                             \
> +        case 4:                                                                \
> +            add_u32_sized((uint32_t *) (p), x_);                              \
> +            break;                                                             \
> +        default:                                                               \
> +            __bad_atomic_size();                                               \
> +            break;                                                             \
> +        }                                                                      \
> +    })

Nit: Padding wants to align the backslashes.

> +static inline void atomic_add(int a, atomic_t *v)
> +{
> +    int t;
> +
> +    asm volatile ( "1: lwarx %0,0,%3\n"
> +                   "add %0,%2,%0\n"
> +                   "stwcx. %0,0,%3\n"
> +                   "bne- 1b"
> +                   : "=&r" (t), "+m" (v->counter)

I notice you use "+m" here, but ...

> +                   : "r" (a), "r" (&v->counter)
> +                   : "cc" );
> +}
> +
> +static inline int atomic_add_return(int a, atomic_t *v)
> +{
> +    int t;
> +
> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
> +                   "1: lwarx %0,0,%2\n"
> +                   "add %0,%1,%0\n"
> +                   "stwcx. %0,0,%2\n"
> +                   "bne- 1b"
> +                   PPC_ATOMIC_EXIT_BARRIER
> +                   : "=&r" (t)
> +                   : "r" (a), "r" (&v->counter)
> +                   : "cc", "memory" );
> +
> +    return t;
> +}
> +
> +static inline void atomic_sub(int a, atomic_t *v)
> +{
> +    int t;
> +
> +    asm volatile ( "1: lwarx %0,0,%3\n"
> +                   "subf %0,%2,%0\n"
> +                   "stwcx. %0,0,%3\n"
> +                   "bne- 1b"
> +                   : "=&r" (t), "=m" (v->counter)
> +                   : "r" (a), "r" (&v->counter), "m" (v->counter)

... why not here (and again below)?

> +                   : "cc" );
> +}
> +
> +static inline int atomic_sub_return(int a, atomic_t *v)
> +{
> +    int t;
> +
> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
> +                   "1: lwarx %0,0,%2\n"
> +                   "subf %0,%1,%0\n"
> +                   "stwcx. %0,0,%2\n"
> +                   "bne- 1b"
> +                   PPC_ATOMIC_EXIT_BARRIER
> +                   : "=&r" (t)
> +                   : "r" (a), "r" (&v->counter)
> +                   : "cc", "memory" );
> +
> +    return t;
> +}
> +
> +static inline void atomic_inc(atomic_t *v)
> +{
> +    int t;
> +
> +    asm volatile ( "1: lwarx %0,0,%2\n"
> +                   "addic %0,%0,1\n"
> +                   "stwcx. %0,0,%2\n"
> +                   "bne- 1b"
> +                   : "=&r" (t), "=m" (v->counter)
> +                   : "r" (&v->counter), "m" (v->counter)
> +                   : "cc" );
> +}
> +
> +static inline int atomic_inc_return(atomic_t *v)
> +{
> +    int t;
> +
> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
> +                   "1: lwarx %0,0,%1\n"
> +                   "addic %0,%0,1\n"
> +                   "stwcx. %0,0,%1\n"
> +                   "bne- 1b"
> +                   PPC_ATOMIC_EXIT_BARRIER
> +                   : "=&r" (t)
> +                   : "r" (&v->counter)
> +                   : "cc", "memory" );
> +
> +    return t;
> +}
> +
> +static inline void atomic_dec(atomic_t *v)
> +{
> +    int t;
> +
> +    asm volatile ( "1: lwarx %0,0,%2\n"
> +                   "addic %0,%0,-1\n"
> +                   "stwcx. %0,0,%2\n"
> +                   "bne- 1b"
> +                   : "=&r" (t), "=m" (v->counter)
> +                   : "r" (&v->counter), "m" (v->counter)
> +                   : "cc" );
> +}
> +
> +static inline int atomic_dec_return(atomic_t *v)
> +{
> +    int t;
> +
> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
> +                   "1: lwarx %0,0,%1\n"
> +                   "addic %0,%0,-1\n"
> +                   "stwcx. %0,0,%1\n"
> +                   "bne- 1b"
> +                   PPC_ATOMIC_EXIT_BARRIER
> +                   : "=&r" (t)
> +                   : "r" (&v->counter)
> +                   : "cc", "memory" );
> +
> +    return t;
> +}
> +
> +/*
> + * Atomically test *v and decrement if it is greater than 0.
> + * The function returns the old value of *v minus 1.
> + */
> +static inline int atomic_dec_if_positive(atomic_t *v)
> +{
> +    int t;
> +
> +    asm volatile( PPC_ATOMIC_ENTRY_BARRIER
> +                  "1: lwarx %0,0,%1 # atomic_dec_if_positive\n"
> +                  "addic. %0,%0,-1\n"
> +                  "blt- 2f\n"
> +                  "stwcx. %0,0,%1\n"
> +                  "bne- 1b\n"
> +                  PPC_ATOMIC_EXIT_BARRIER
> +                  "2:"
> +                  : "=&r" (t)
> +                  : "r" (&v->counter)
> +                  : "cc", "memory" );
> +
> +    return t;
> +}
> +
> +static inline atomic_t atomic_compareandswap(atomic_t old, atomic_t new,
> +                                             atomic_t *v)
> +{
> +    atomic_t rc;
> +    rc.counter = __cmpxchg(&v->counter, old.counter, new.counter, sizeof(int));
> +    return rc;
> +}
> +
> +#define arch_cmpxchg(ptr, o, n)                                                \
> +    ({                                                                         \
> +        __typeof__(*(ptr)) o_ = (o);                                          \
> +        __typeof__(*(ptr)) n_ = (n);                                          \
> +        (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long) o_,             \
> +                                       (unsigned long) n_, sizeof(*(ptr)));   \
> +    })

Nit: Padding again.

Jan

