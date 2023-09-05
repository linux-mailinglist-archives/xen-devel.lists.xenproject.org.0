Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9087923B9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 16:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595744.929345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdXVb-0008G7-FH; Tue, 05 Sep 2023 14:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595744.929345; Tue, 05 Sep 2023 14:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdXVb-0008EC-Ch; Tue, 05 Sep 2023 14:58:27 +0000
Received: by outflank-mailman (input) for mailman id 595744;
 Tue, 05 Sep 2023 14:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdXVa-0008E6-4y
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 14:58:26 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8edb11d-4bfc-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 16:58:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8889.eurprd04.prod.outlook.com (2603:10a6:20b:408::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 14:58:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 14:58:21 +0000
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
X-Inumbo-ID: a8edb11d-4bfc-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXEraWyAKrObJhq++y8qlZLozIyAkJ6F9uCPMXs2bD4HhooRmwIzoTHnMVFEien+JrWUFbkdt7hBjA0y3kLuhne7s8BIMIBFjd1llhYXK0Cwnm6mUIklw6GsKPjHO5XKC64EHYR+QAvxO88wwi66gt1hAWw4aa3eSZLAMcLQxXbquGNNK18fHurwISx8IQoO+K+JH1QY+IbVNZmjfwMLP+g6PRe/jERSVe9MGsKGS1mXAG1/qYjvDsBCYmUg7UPVvdtqORUYKBtGlllV63Y9LF5bBwmrTBI+qnG2PbKCPJ2oPG9YH6CGE2Fhq1bZGllnx8lr/MxsU9TRYFAqIewFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kH8U8l8x3oH9VXoWQ8vgN+kErZjRLvzrKcTCOaCO2VI=;
 b=nFtsk8TaSuhqyM9hJpL5dqetHesDjXDVKEFSISih2QmNIKTagdRAROsHrlZjH9boCOjKTI9J6JAyIM2vJ3kdKXNMN7vZ65zZ3hmLQCpfAFCyVGPVD0TqsU7awdjtO70GM2egz3zTyJVYtFukz6RqcWGP8H+BoEWmdtvySViEpPyL43hLXTGi2QUenVCY0SKZfW6Kf9f1cbgTHSrqAOdIz+vt/DsExmRxaSdHM1Ph5faAKtwrXPDmjeRV0CWXR0q/CTHaBnztdHjKPjMw9AqKX/0nLxdDca8AyqNAy5puiueb8WahXasoRoWi+aQ1yQPYsZhfE2CFenCUoClQIT/9TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kH8U8l8x3oH9VXoWQ8vgN+kErZjRLvzrKcTCOaCO2VI=;
 b=v6niG8vHXe5ejO1dAW1vOi1rKKz5ISt0AyTTxnhHLgbFlmjztLxEBH3KasUXsQ/bDHSaz3qmD144P8gNfqmFwzn6j0ug/6TqUokh13vxcMJ8VWLjz8FWqI5woV+IzLVJDOtgYEDxi651F13OymhkR9VRoWxHp7Ro37MAikFAxlyMvjafLoG07AcnHKDskQoTQbFyK5K/aPxKVpBSzZsKnZZAPCwcWRMRl+uAbr0V6BuA9A1n1M9D3Y9iFpyVaj04pU2tp11oRIIH9dYe7t1kZQM0+RRpNSKbwh1LbkQ/ZdDJIt7aYCxJHJnTEOh5Ybjf8qU0iu7K7ozv/Hq7QEa59A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <692dae52-947b-5856-f1b8-5d9f03f78e6a@suse.com>
Date: Tue, 5 Sep 2023 16:58:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/5] xen/ppc: Implement atomic.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693590982.git.sanastasio@raptorengineering.com>
 <917dc5517b69657b48e69c4100234383f5c70e0e.1693590982.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <917dc5517b69657b48e69c4100234383f5c70e0e.1693590982.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 392c1e19-1b2b-4d5c-a27d-08dbae208bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cOqvlB7pnAWzLiOGGC8h8n/nc2v61AjEPR6jBnQq8I0f2DCoN570w6riqHDQPK/JHdDl642MahFx2mt/iELj5zKfsG2OkCoeiHFlvVCgCCw6eSRC/zTUdjvAkcv1sF84C/3Px7o7ZcQwOxwaFDHWdYz0bPHo0pclkjwAlV9gxQZRIcPF6aUX1baqJOc7NfgSBitAeasUU3iztVfAb8XqhCjGBrdrMfeKVqI3V9Z/YCR/YWlk42Uvj5GhomqaWZ9YIajDtOUMTLbXhkWUUdue8YuaClADiQqmngxb78B8aPet0QraVEM+//Q8lMrG0RwaP/CiZRyHShUb/L6eThESHDtC4jedCuxRTsaacJ+82Ev47vtUuKM2vnMir/rWkQOoCmb1Kls93Y1m8Er9UNG5uOvnGp9QJkk8Ys6dZ9r8+QXnVvogf5XLQLVNytutVTZaTTAC9yt9z00G/1xBJPZGQYurQ7W80v/6GwgoFW8D6ein9KXerGs5vCMNBHJfPTGhsSP9abmktWQsnbjl9njjxNvpYSpbiKxNnOssIrNteUnG25kKqcw+xXofqEXvCdloEVqzG5o4VNtlJZU2/3fxPghzNsqbFx8FKjuTut09iuMwqILs+k7O9AAP0W5agIoV3XDcV5SQL+3famj9+QQDGSS1R5MhvbYScj7vwg26w2zfdvbJB5ci70B3wgzPkY11o8HzghrcrjsP2JZiwsD5Wg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(346002)(366004)(376002)(1800799009)(186009)(451199024)(2906002)(38100700002)(36756003)(31696002)(86362001)(4326008)(8676002)(8936002)(53546011)(26005)(2616005)(66946007)(41300700001)(6512007)(66476007)(66556008)(6916009)(6506007)(316002)(5660300002)(6486002)(478600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2dxWm1kdzRycUtEaS90b3B6K3VvS2puNU9oWXZJSVFZa3hTQzVkejJFRDlk?=
 =?utf-8?B?OVpSc2RIWjhXVTIxc0RWU2NSK21YV0lnSisreG5rS1dEYnlJZFJwREYrWFp6?=
 =?utf-8?B?WFZ4WWxHMExCWWNpNHQxeVFONnhqby80NXVxNmxQME1na2xJaTdOVXZncXFw?=
 =?utf-8?B?amZhQk9pNnA4VStucThOa0kwSVhQdjI3MW9FampzRlJjOTNLU3ByZ21FZjI2?=
 =?utf-8?B?RzA0Y3ZNeG94N29XRHBhOTl0V3N2c1o1OFY1cVJjazhvUXhBN0xFTmg0SUtC?=
 =?utf-8?B?SnZlUmJjT3U2NDlkUDk5TkxITkQvMjRJY3dSOTV3eittR1cxOFR1K3ZCOUll?=
 =?utf-8?B?MkI3ZHhuSGFrMzlWQTJBVDBHSmFxRWF6S3dLZmo2RFdVbW1LWEJJblhEMEN6?=
 =?utf-8?B?UFV6SE1lcklFTDhraUlSNndBajA5SEVyUTVRV296UmtOU1dFcVpoN2FsUnUv?=
 =?utf-8?B?cGtpelVJcFJDdkRGb2xxY2c3SFpIYWVsQ2RodkZpQzRPUUtiRSsvV0lWTkxU?=
 =?utf-8?B?VnZvbWIxWCtQdWRwelU4NThQdi9qbkdNMU5LR082SmlDZ0hIL0xhQlc3dTNk?=
 =?utf-8?B?aTZqcUJvSHlXbC83OUxTQm9Lbi9WdDB3TDQzc2hPTmhXaFVtN2QrRm5ObEl1?=
 =?utf-8?B?NDlJSE5KcjU5VFIzQ2tXZUI5OHhGMjhmRllxeEtJK2prcG1TZ0IyUTl0R0JE?=
 =?utf-8?B?enAvdXpMNnplSUVHN1ZqaHlxcmZZWDluVnNzNnZMMTdXYzNRUWJMWVdPS0xC?=
 =?utf-8?B?RkE4TnFrdCtjZkQ5dTdScmxHOFdBR1VGV3djUGRKRFJ4WTVUU1p1eWlKWEtq?=
 =?utf-8?B?Mi9NWnQ1N2lOc0loUUZkSlpIdDM5OWZtemZWblBFVGluU2dlbUw0Z0ZGeith?=
 =?utf-8?B?S3lsUk5VS3FqM1VyaUl3OTVWbHhzZmg2M3dVUTgwcGw1UHFrQ1M1c3NtanBw?=
 =?utf-8?B?eEtYMkNaWnZUNmRTcXROb1RPNE5rTFNFZUtlYjhvR2F3VzY4WWR5UkxqckdK?=
 =?utf-8?B?dk1sR1Y3ZzhWSVMyaU1lZzl4VHJoakZhQzZLWVlZMGt1S2tkMWlFYnpWYmdk?=
 =?utf-8?B?Q0M5eGhTN2h0VU51NHBGZlJ2TnM3eFVDem5uRTg5eGpUaFEyZG9vZVBBQm5Z?=
 =?utf-8?B?aTg5aTR5NWR2K25vQ0EzSjhCRU9kaytrWnRkekx4UUtReGFqRGlvSmVZSW5y?=
 =?utf-8?B?eHFNa3BRVTFzZmo1TUk3Qld6Y1lrai9jYVhXSURuUjJjc29TSzVoUjFEdjZm?=
 =?utf-8?B?WEdsa215NHFBYU5TRjJHZDhwTGVHVk1NZ0V2SnVIZmJJOXFEbXpvbEN5cjJ5?=
 =?utf-8?B?YzVoM05DVjVIRm9sejhidzM1VjA0MnErV0VSZXBseUJhR3p2UisrZWs2U3l6?=
 =?utf-8?B?SW50ajhSL3oyUkhpME5hVlZhdndWNzBwZ29zeHFxdEkrbnFBb05mdkdHTEpB?=
 =?utf-8?B?SExoUitBZklTQWF4bXhDVlIvbG0yVzRUZGt1NGN1bk90NHBWbnhxVnI4NS8y?=
 =?utf-8?B?VWx6MEQxNUlyd2FMcytLNkQxZER3VGRGcEgxdTFSVHlRK3d1NEQycitZelRk?=
 =?utf-8?B?MXBaWjhEL0tqRXNzTXEvOWxueHRGSzAvS0YvQlB6d2lXNmFDV1cweXhkSTY4?=
 =?utf-8?B?UXpyQnA2V3VkSG84S1MyaU9PVEc4L0ZkQ1ZpRDVRMjNsTmdNV0VhbHN3MXRo?=
 =?utf-8?B?ajhmOVB0ZmFrL2pZbkd0akxZSE9TMXI2RG41UHhhWGtYVDJEcFlkbHp0eUFy?=
 =?utf-8?B?WmxVQUx2U0U4QTVIVEhLL3AwVFpSZjZaM212U2ZqZnV1S3h0OGNpZ2EwZHRr?=
 =?utf-8?B?amdkL1J3bHhJQms4TDRCTnFBWFRpVmhtamhzbWVFRlpqTHQ5ekpNa2ljMVlL?=
 =?utf-8?B?eEJtOVpnOFp4MHdpNk1ZREIrdkhyS1hHdHBHZjBUbXZHekxrNjFhQjQvNVUv?=
 =?utf-8?B?R0dESWpCck43bFVkZDZENDJFTlY3Y24vU3VwZW9LTmNXWlJyYjJ2UVpnKzVo?=
 =?utf-8?B?MFpDdGRqUDBtQVZkVzhyNWkxek83VlhQelFhYitDQWhhWHJDdVVtZm45Wk5Z?=
 =?utf-8?B?UmJtTXppd2kxNHZLNDlLWEJzTWUyc0Jvbi9FdTdveUJKeXVOVkkxSWI5V25W?=
 =?utf-8?Q?72PT0qPIKBg0cZ2G28R90uZzc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392c1e19-1b2b-4d5c-a27d-08dbae208bc2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 14:58:21.1021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/v5VKkr9FxNAVVj0Eom0puIJGSMJw438Z09YyxOru8XlkBtBEjrF55vXvWPNEy1ecJQEEKULZy8UoP2cd1VAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8889

On 01.09.2023 20:25, Shawn Anastasio wrote:
> +static inline atomic_t atomic_compareandswap(atomic_t old, atomic_t new,
> +                                             atomic_t *v)
> +{
> +    atomic_t rc;
> +    rc.counter = __cmpxchg(&v->counter, old.counter, new.counter, sizeof(int));

I can't seem to be able to spot where __cmpxchg() is defined. (I really
only wanted to check why it needs the 4th argument, which here rather
would want to be e.g. sizeof(v->counter). If it can't be omitted.)

> +    return rc;
> +}
> +
> +#define arch_cmpxchg(ptr, o, n)                                                \
> +    ({                                                                         \
> +        __typeof__(*(ptr)) o_ = (o);                                           \
> +        __typeof__(*(ptr)) n_ = (n);                                           \
> +        (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long) o_,              \
> +                                       (unsigned long) n_, sizeof(*(ptr)));    \

Nit: Stray blanks again after cast specifiers.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/memory.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) IBM Corp. 2005
> + *
> + * Authors: Jimi Xenidis <jimix@watson.ibm.com>
> + */
> +
> +#ifndef _ASM_MEMORY_H_
> +#define _ASM_MEMORY_H_
> +
> +#include <xen/config.h>

As mentioned before - no need for this explicit #include.

> +#ifdef CONFIG_SMP
> +#define PPC_ATOMIC_ENTRY_BARRIER "sync\n"
> +#define PPC_ATOMIC_EXIT_BARRIER  "sync\n"
> +#else
> +#define PPC_ATOMIC_ENTRY_BARRIER
> +#define PPC_ATOMIC_EXIT_BARRIER
> +#endif

Is this correct, considering that we have no CONFIG_SMP and assume SMP
in all cases?

I'm sorry for not paying attention earlier.

Jan

