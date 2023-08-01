Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C387576B2F3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 13:19:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574087.899284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQnPI-00089h-7r; Tue, 01 Aug 2023 11:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574087.899284; Tue, 01 Aug 2023 11:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQnPI-00086I-57; Tue, 01 Aug 2023 11:19:16 +0000
Received: by outflank-mailman (input) for mailman id 574087;
 Tue, 01 Aug 2023 11:19:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQnPG-00086C-Pf
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 11:19:14 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe13::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dc30a1a-305d-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 13:19:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7959.eurprd04.prod.outlook.com (2603:10a6:20b:289::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 11:19:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 11:19:10 +0000
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
X-Inumbo-ID: 3dc30a1a-305d-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4hYImOk4wVT/YiAp0rC5Fy+dtYsZIEfMMdFmnAIc2DRO5HO6oGA/TrnmRsgXDJLg+xlRvZE/aJKqouV97+YgXAlKac/Q3p3JcnnUprwDGIBwePRzk3DYLDacXDW4r5WEw1UXyTxMLBpWU87YudkYXbRkwX30MF1y1n828Sn6lNh0WWZK8EtQqSDWNuHj7I79h3nw+W9pu527aMPiKr7+P7dPriJK+owKtOU3tCI/61kDGq2/L2HYlkxnU3/5NR+fDyAh4biUCnermFW2C2YIS0HULeuP9QXv/VNcOP/BL+1WIQ12/S18SZSlyK6i9dI1RVOPh/g/ERwtg/5udpBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enT4m1wrpXUknXwT+jQ4JN1Ee92JCTLa1Ujmdd4kd7c=;
 b=cmEiMU4dLfywa8w/hk5lBMapfIVEJ9bEoFTXobt6oTyJ+/UaYqmQ6G76DMsbuA5CElRXqsPzDDYLd1hQDdygw6XBtaaxqZtX+Zj736YDrhcR/WaH34ojet2eMTW1JY+fdZKXERICLIfEEpjDr1dg/vnQIk7vOVV6yxGK6fLnQe5CoRZ/18x3YD5PF96LOD8E3OuVvscz6nJpgEn1pP5st3OwZFc5mEYyYWSINoa5ZvZgE71DBONbUnfaeVdp6UvZ2h9cIcfvzVMVoBIiU/NXhG3VprzaxC0SxLwePutj32T1wPPxzGHR92O5C7febZLrqpu+HfBQc/qGrZtVh3RAEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enT4m1wrpXUknXwT+jQ4JN1Ee92JCTLa1Ujmdd4kd7c=;
 b=TIfVWd+N1dNT55/f9TkTy3T41rd9ahxjUGEXB09aYwbQatJsuiu5eu1fO8DVv40R+ZahA/Ihq8+41UVwtYVnsA0KkFs2FyG7RNXnZWMMW7/5PmOXe0GxfRCAD1E8XeFckpej1C/oZCjbfBfOWjF5LF3AOcnrnYblz76dGlOhSMboDJfZ2NbEEvN5SgKFUq5cJPcMJTFkG93B1Rxl+XPGm4j1bQuhaoXcKmCEcrchDtHw/PVxaLdHgKwr9AUmcKrsow+h6Z6VD5asmOmhiUWUTFTwRBtV757/Wlz9/V5pLV46UGCRsqQART4ghF3y7ye0lbagwNudoWdBqW7a9dV4Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41b33115-274c-7172-f100-85d6a4f1d538@suse.com>
Date: Tue, 1 Aug 2023 13:19:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 5/5] xen/ppc: Implement early serial console on PowerNV
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <3023ad320b42fa3787bb71a9cf83b34965668fe9.1690579561.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3023ad320b42fa3787bb71a9cf83b34965668fe9.1690579561.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 318968b5-31ae-4a0e-46f3-08db928120d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lS20hl5ap2sFm7KPHhxzLsL/qM+Ly9lqN3VQhAP9DKqAODNGu3/42t1oFbnoNx60CYL8hE3eqgOLNSGxYVRrlYduOUNtFkpFQS/S8j8OQlNuoMPC8o3/7e6Yf2tz+EOSNsRh88+TmJtsfCmdZ8LW7+KhxPpU1l8W/6Bsqxx64mP5ncTbRSPTs9CBBAT8lo+o2Z0tJha8fNyTOEc/qI87xn77urbEmXbNcptoiS9zOau29fusLCd3Dk4wi5QbuowJvXW3akl2ojWeC3ryNRJqei5Q7NwQS/N9EpbzD+8TS6NcxywMgrGR9oSHx9K6QoLo0GHrCe/vv8le26bayTN+nCsuHlTDk4qshXego3g844T4Ke3eR/lCMzugGE59l33VPm1HCMGoNNzDxenZy0czOvd25Ywo6DG+z9nsVl1b1TM+v81kivuzLqgqDdI8HaZ4tpwhv7b9B2FGNnxryvAkJgdMmXRDZR7gAKOrD/VY0VNHsyuwkQ9wu1Otpg5MGDvmAy7KejVLzI36XyPuvuFcvjU2EzRlhyIIVSX1rTpcC5tIloxAk1ktHtWuX7G2M6gw4Mce6Km/tpL20coWPNq7UBpxWl07inkSVLmLASdqMquMRAvy94UyGF7EF6APMhZk4L2BJgTwSQh9BQtcwasdTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199021)(54906003)(6512007)(26005)(6506007)(6486002)(36756003)(8676002)(8936002)(5660300002)(66946007)(66476007)(66556008)(53546011)(4326008)(6916009)(2906002)(2616005)(41300700001)(478600001)(31686004)(86362001)(186003)(38100700002)(31696002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjZ2RnRvb0tGSkM0OTZUN0lUSHA4QmFrRkhJKzE3d0N6SUZqNmNYVDRWcHlM?=
 =?utf-8?B?cTRHblhPTW91UVhxbEo2M1htdW05d0pTQ2N6T1RIQkVrMzEwS2V0eXVwc3Fx?=
 =?utf-8?B?Q1gwMmViRmdWVDJFYmdGNzNuYXJPWWRIWlcxU0wwa1JzRktUQXk5K281MmVu?=
 =?utf-8?B?M21JYjFkV25XeWRDY2R3S2dEL1pnRnJSLzc3TEJpL3BxNnZ1RUcyY2pBRGhE?=
 =?utf-8?B?SHlkUUM3NU12dStWY05zR2lPTTZXc1UwQUliYXFncVk3TENDSy9tV0RtTmdu?=
 =?utf-8?B?WE5yaEhMTnNsSll1VVNzUlZ2Zy9nQWNwajFVVG1MTzE4Nm5kdEJEQUhZamRW?=
 =?utf-8?B?M2Uya2JKWVd5OXhxdm5LdG9xN1VETm5nMHhlT09Jc1ZOMkhaVTBmUnBtaDMr?=
 =?utf-8?B?QVJWS1F5TTZpd1hsSmJFWkYyajZKVmFJUmlURktOU1RNa1o0ZGQxd0tLWGY1?=
 =?utf-8?B?MlRjT25YeW51cUxyNW1PbkZjSTUzcVBveW5JQVpBMVQ2NXZSR05uNEYzeDFM?=
 =?utf-8?B?NGQ0UjJNT042eWd3V01kTS9VdlZleUl1SWVxTVF4RFJXZ2dLcS9YWUJYMnhN?=
 =?utf-8?B?WWhNZTBpTXp3THllRC9LNDdiNy9xWVIxMnBtQytvZjVJYU15K3RtYkp6UDFF?=
 =?utf-8?B?OFg4VGMyam9oUXNCM3AyRUY5RFZrdUpJSmhwakRjMkdraS9ITlJtTmFBaGNs?=
 =?utf-8?B?VFZ2L252bzY4UER0S1ZDeFFjNUErSXFhVVNRTlVtRFlBSkFzODNNZzlRTEF2?=
 =?utf-8?B?ZkdzeUVJMnRHQ3l1bzJkelZVelY4d2xXV29zRTVaRytmNkJRcVA4U2x1bTg5?=
 =?utf-8?B?UkRsY1REUUZydVBkVFlOYnhRRHNMejdraEYycTJtaDhobFpEcUdFVkRJRzRW?=
 =?utf-8?B?VHI1RWorbXJzaWsyaFZvenJ3VnBhM2RjV25tQVpPdHVEd3M3ZGl1QmNMLzha?=
 =?utf-8?B?NWlqdHR3QnhiZmlibXJyWHNSZkliTUJwRkI4RVM1YmRMVVppMDRoc2ZYK01G?=
 =?utf-8?B?aU9wNk1pTk9Ub2FWazlxamlTT2R2L2taQndHd0hmOExnYjR1MnZkOTBsd1R0?=
 =?utf-8?B?Nk1ObGNteVlvSzFJMWdqTzhDQVZDV0RGd241aDR1LzV5d3hoVlNNTGxOZUly?=
 =?utf-8?B?eGVielFoaElSVHc0di9jR3BqYzBSdUJha3VWUy81UnVJaXRoczNvR2dNZzVm?=
 =?utf-8?B?ak9TaHV3V1dxR2ZqMHJQWnlSQXozNmxvRThGdzdmMldtcmUzTWM4TGxjZk1H?=
 =?utf-8?B?RzdGT0k1ZXBsVFE3VUgzdnRPVjV5NVRadURCVDhaY2hVZGo5Z1NWSGYrNTJ3?=
 =?utf-8?B?enU0YktvaDMrUG1VM2tFTHhJMitNQkF2d3FuNFdWMTkxNU1Ia0tFM2tscU9a?=
 =?utf-8?B?VHgzRDE4N21vVzFFQm9jYytMTzdBOEtZalMxaXNBcEUyN21qdDAydCs4b2p0?=
 =?utf-8?B?K0ZqV2VoK0VGY1plS0pDSVJTbmNRU1RhaUluSG1oOWYxdmlHMUVNUTJzYTkz?=
 =?utf-8?B?S21CelY5QmJlbC9YT2h6QmdQOTNha3FzcHJxWFBJNEFmWWhZSTlVV2R6WFhX?=
 =?utf-8?B?L0kxdUNWcU1sU1BpZzNiVGdUOHU1MU1ncjlBYnZOSitKcUhYZ1ZSTUlDUE9h?=
 =?utf-8?B?ZExuRStFSTVTTWtzcXpRaExzcElQbnRFSW5NNGh2Zk9FMGtRMUI4TC8wdXV4?=
 =?utf-8?B?T1NDdlQyakxKNDlDQk9Kd2NPR2gzYnhSY1hRZnZBaVFlQ0JGam8rUVVOTi81?=
 =?utf-8?B?Z3RlbWxIMC9CdVRudWZPb0krSW1UOXlJUmF0QVJYRGJtRGJaUjRWQ1RlbzZV?=
 =?utf-8?B?MjdzNTZ1ajZqNmNhSCs3cks5VTV3cjZHVDR0WEhoNEtNaWxCVTRTd1VoUWVw?=
 =?utf-8?B?SWJVSUg0Q0VrVXBhdjh3aVlrSWxGTEJObzF5MmFSck52bFR5d3BzY3VFUnhl?=
 =?utf-8?B?SnVqQWhkODg0RFAwaTg0c2VYNHd1MWozaERlaGp2VVFhWm1YZ2wxeUVWQm1q?=
 =?utf-8?B?a2pqUU54NFN5bG5NQ0M4TnRHdFZpSjZQYUJ5cXE5ZXFJQTRFYnFTTGkwbXBy?=
 =?utf-8?B?eHNnaGFqQ2hScm9ZajBsL1lteEZMbWM2ZXpkb1p3NElqYUtSOE1uY3Nqa0pv?=
 =?utf-8?Q?uYXUK3LhBBi5tmbT6FEVZ4YaS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318968b5-31ae-4a0e-46f3-08db928120d1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 11:19:10.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCYDmChxSSMHXiZTZ2RFU2RMgcoFcL1VZAjA48GoLWikwQvA+M8Oim12mUVyrJQR7gIV5l4K554JrsYu/xlQMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7959

On 28.07.2023 23:35, Shawn Anastasio wrote:
> --- a/xen/arch/ppc/include/asm/asm-defns.h
> +++ b/xen/arch/ppc/include/asm/asm-defns.h
> @@ -23,6 +23,18 @@
>      addis reg,%r2,name@toc@ha;                                               \
>      addi  reg,reg,name@toc@l

Noticing only now, because of the issue ...

> +/*
> + * Declare a global assembly function with a proper TOC setup prologue
> + */
> +#define _GLOBAL_TOC(name)                                                   \
> +    .balign 4;                                                              \
> +    .type name,@function;                                                   \
> +    .globl name;                                                            \
> +name:                                                                       \
> +0:  addis %r2,%r12,(.TOC.-0b)@ha;                                           \
> +    addi %r2,%r2,(.TOC.-0b)@l;                                              \
> +    .localentry name,.-name

... being widened - could we gain blanks after the commas? Down here
(to match the code in context) another padding blank after "addi"
would also be nice.

> --- a/xen/arch/ppc/opal.c
> +++ b/xen/arch/ppc/opal.c
> @@ -8,9 +8,28 @@
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  
> -/* Global OPAL struct containing entrypoint and base */
> +/* Global OPAL struct containing entrypoint and base used by opal-calls.S */
>  struct opal opal;
>  
> +int64_t opal_console_write(int64_t term_number, uint64_t *length,
> +                           uint8_t *buffer);

Would this perhaps better be void *, eliminating the need for casting
in calls of this function?

> +int64_t opal_console_flush(int64_t term_number);
> +int64_t opal_reinit_cpus(uint64_t flags);
> +
> +static void opal_putchar(char c)

Can't this be __init?

> +{
> +    uint64_t len;
> +    if (c == '\n')

Nit: Blank line please between declaration(s) and statement(s). (At
least one more instance below.)

Also please add the missing blanks in the if(), seeing that otherwise
the file is aiming at being Xen style.

> +    {
> +        char buf = '\r';
> +        len = cpu_to_be64(1);
> +        opal_console_write(0, &len, (uint8_t *) &buf);
> +    }
> +    len = cpu_to_be64(1);
> +    opal_console_write(0, &len, (uint8_t *) &c);
> +    opal_console_flush(0);
> +}
> +
>  void __init boot_opal_init(const void *fdt)
>  {
>      int opal_node;
> @@ -45,4 +64,10 @@ void __init boot_opal_init(const void *fdt)
>  
>      opal.base = be64_to_cpu(*opal_base);
>      opal.entry = be64_to_cpu(*opal_entry);
> +
> +    early_printk_init(opal_putchar);
> +
> +    /* Ask OPAL to set HID0 for Little Endian interrupts + Radix TLB support */
> +    opal_reinit_cpus(OPAL_REINIT_CPUS_HILE_LE | OPAL_REINIT_CPUS_MMU_RADIX
> +                     | OPAL_REINIT_CPUS_MMU_HASH);

Nit: operators on continued lines go at the end of the earlier line.

> --- /dev/null
> +++ b/xen/arch/ppc/ppc64/opal-calls.S
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Adapted from Linux's arch/powerpc/boot/opal-calls.S
> + *
> + * Copyright (c) 2016 IBM Corporation.
> + * Copyright Raptor Engineering, LLC
> + */
> +
> +#include <asm/asm-defns.h>
> +#include <asm/asm-offsets.h>

Would it make sense to have asm-defns.h include asm-offsets.h, like
x86 and Arm do?

> +#include <asm/opal-api.h>
> +#include <asm/msr.h>
> +
> +    .text

Is any of this code still needed post-init?

> +#define OPAL_CALL(name, token)  \
> +    .globl name;                \
> +name:                           \
> +    li      %r0, token;         \
> +    b       opal_call;

I think the trailing semicolon wants omitting.

Jan

