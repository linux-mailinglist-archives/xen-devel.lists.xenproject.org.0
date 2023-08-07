Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4F877288E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 17:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578601.906189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1ng-0006xJ-6J; Mon, 07 Aug 2023 15:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578601.906189; Mon, 07 Aug 2023 15:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1ng-0006vI-1X; Mon, 07 Aug 2023 15:05:40 +0000
Received: by outflank-mailman (input) for mailman id 578601;
 Mon, 07 Aug 2023 15:05:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT1ne-0006f2-LB
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 15:05:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd2e6a1d-3533-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 17:05:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9355.eurprd04.prod.outlook.com (2603:10a6:10:36b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 15:05:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 15:05:07 +0000
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
X-Inumbo-ID: dd2e6a1d-3533-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLOpJuZSrPeDdmo7PsXy3rIX6DUynsldbsKsu6f+DLcoYyd8ms38IEpDMtbv9RvtPwzQleE2YT4QdFYLZD+6v4bGmiSriwQv4nmhTjFK1z/NqEJTd41/swNebUa1kAIoyb5mY7dqQafUyU/zfUJEENjjjH76GQkb0M8CtEJUHDDtF1OFe8BuEEC8IvdpOvnahvIFYsa3QgbSw+Y/nTWb7K66bVEwHOKA+LQCM4OqsxIkWfMaGpkD2i7A7a36XH98mL7YWSXmMAzhMJbxOAXHHIqQQlgcCJCOoq3TEvA+1oJfTaDdU0OBcJoTPDm9GJ0ZQ7iZdvi77j0XYX90/bdNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCpIa/iskW6jITbUOFS8+hhzk/xiY6ob/s6idhQe1J0=;
 b=THaRbgwsukvrVu1w7U4OTI5QQDSshP+OsV+Mvjv+vZh2lFZGKNCRmZBqtcH4lCS9KyCBLDuwa0KogjRDwDG0aU0AeBLUbBZ94x3OlNBE+77OhV8YPGy8CxMqsFWU/WhvWULWA4lOSso2uKqF22QgYMWaZlHGVE19KK+1P6qK/v0Rjxcwy0yo8oM6baob/QlaOPP05No6wkY4GsLe1tDNRMM0EkrTdUzB8TM8ykqiJGFCwVN/8R7799ZpyS1n8I/BGpuX4QGFz/fXi2xLp5UzZ6BVKLYMguVichlhZAkjp570YMYTj438G7ojP94Rmo4E2xieYUrT1ow7koMtTaDxLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCpIa/iskW6jITbUOFS8+hhzk/xiY6ob/s6idhQe1J0=;
 b=T9e+hzaaXbiRPlgfJvA7yvqXOsmzQ8rrwhNjHcI96TSUjxemshaxYcE2Ogyg3DQBuIV8pmBRoWKz3afjt5sfoI0lixRb7rvBrpUAf88s4g2Ew23HthEsqs4hdI2Ml+fxjsU9Tn/vTIMtn82iX83pi346sYvLXM6UB62A0QwJqUtQSkQfsROK0gv394EOt84bpMxyib00BB5/UHvscDxdH2a46sECbmbMNkfreCr556K8W7m3BVGTFYyaQDd/4whqKSuJ0wgzeNAmhFCnCoouNPYeBAtlhchik8SRp0+MKB4LaOG3EYLrrfu9mG0dkrYwaHUfcsuS0UZPY0Y5oUVUEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8cf5b42d-a80d-a8de-b564-8b45c97474c4@suse.com>
Date: Mon, 7 Aug 2023 17:05:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 4/4] xen/ppc: Implement early serial console on PowerNV
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690934409.git.sanastasio@raptorengineering.com>
 <3176762c2eb09d01d65a348e296a94cf0356ff46.1690934409.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3176762c2eb09d01d65a348e296a94cf0356ff46.1690934409.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: 8371602a-3bc3-47df-a093-08db9757afba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oGs8GnZ1kI0VzI1Wr2wOcrgcz6NoH4vBH5cu81z/U2ZsyvgDIumt/rq0hQfNFz5bMlDNjMNBLcuCxm8gwocA5uMRBPcRg6XGL0rzeU/HbMX4LjrDiPn9P/Ng1hEV7oOmn8K7linXbKrUuBwEdX2o5JCGVLYvPWeTSyzlvBXm5jV7jy657pPqvxzfjni+P7+I9DfSj+WGBBTZsqBywkSuxjT7gVTFmEVW0ygMSUVrSTtthFSxoK3yfrL31eybbiqwWomCL9TgGZIHPMVWEXtEFRjj85NA/6R+XUQuF2mv+vDJt0t5Bfjc3pcjVWb3phS5H1fUbS9B+VO+MJUrqrw8X9kl21mNFwgqtXjM0RUIE1dFyoaOnrGMcRbTyuyIpl30Idxl0IwGgqReJHdV9R6HPHWCXioOHqpvWtfBr7gr/NpZHlrysRPxqlVXc5R+Z2nlUZaELVD+PnMWw1lGp2CiFJ8MITTVClsiM/7v14xovtZHmG9yur1JhGQKTMDz/DTLKYW+09rEjFWzgIUPwE7IQAWAT1pX/i6QWu4UnnrUVrTbtyOC32487YYWCg8+GjQ+RGTbaK4wzqaUm+E+T3BzdVlAFPyXJtPo26zujT146HSGGhFHzh2AQjr4Ceow3Vg/lJP8WQVhGLv8V4ttbctkbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(366004)(396003)(1800799003)(186006)(451199021)(41300700001)(26005)(2906002)(5660300002)(31686004)(8676002)(8936002)(2616005)(6916009)(86362001)(316002)(478600001)(31696002)(6506007)(53546011)(54906003)(38100700002)(6486002)(66476007)(66556008)(6666004)(66946007)(6512007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUIvZzVXOHpicWJWNzhyMUZ5MGZtNzNnZTV5V2ZNQjFGd2FrSkt1OXBVQzZn?=
 =?utf-8?B?Um82dWtML3hQcXZZMSsxVzIwZWdBMUNMaGtMM3VFUkI5NlY0bWdLRWVNUFhJ?=
 =?utf-8?B?TFp5R1VSMzRaQzRtTUpINEI1Znd2Q1IxS0NCaHQrd2JULzJnQm5tdkhDekRS?=
 =?utf-8?B?UFNiYm1NeEp5bGMwcFU0SzlBekd4WkRXOEpXWko3dkpNZHZJNVJDL3NKM1NT?=
 =?utf-8?B?bE5BUUNIYkMzRUxiekVMTkkxOEVaQzdnK292ek9OeFVRSjdlLzM4bTlNQmtL?=
 =?utf-8?B?OXJhREsyM2F6TzlxVDFSKzJoYWUvQkp4eFU5eUZINlRCNXF5ampNS2RvYW1z?=
 =?utf-8?B?bUQ5bkxQbjk3RGtEU0Z1TUtncTRWdy9NM1U3K2FOWjFrRmV0MkpDYStING1N?=
 =?utf-8?B?WXFldG93QkVpZEc3WGlRcGh4eklOR29oQnI0ZGRnMGdHWjBYVnVzeXBiZWtr?=
 =?utf-8?B?ZVVPUWNzZ01WN1dSYlpCUjN2WmI5Z0RrVGI4SjJDYVA5Wld1bmhqakEwRnZU?=
 =?utf-8?B?bEg3L2draGF5SVVmN2lYVHFTMjB6MU9aclZBWlVjZzBkVmhDbnNEZDB6aXA4?=
 =?utf-8?B?RUY1STdoREdtenlsejFJTHJpNSt6YzRjaXpYL05WOHY1MjdHMlViNDJXM0JG?=
 =?utf-8?B?T2VrKzhmUHZicHpMUEVZQnVBeVlBaU1adlJDak5pTTRHSHpLaUhzbXZNcHY5?=
 =?utf-8?B?UUZvTytJSFRwdUpRZVkxNkptVzI3eVBtdUFUNkZJWEx2YUxCdVluczN3VUo4?=
 =?utf-8?B?Q05OR05uYll5Nld5dlpqYjcybWlkOU9obXgzeE1mS1ZibDhVZlU5MmRYOXFB?=
 =?utf-8?B?b2RtcjMvay9FbzdyYjduUkg0RUFJWkZsVXVrdnpia1ZoZWxLK2Z5MWErMlVC?=
 =?utf-8?B?ZXdWa0FzcGRON05JNG9GVnJndVpnYnZ2YWo0bjJTSlJJd2REVXA0RXNsbDd6?=
 =?utf-8?B?b2pBQ0YwMWNrTk5WdVExR0ZDZkFxN09GLzBOaTRWNkhzamU1VkExN0NXYkVs?=
 =?utf-8?B?cURPWXdNa0ljKzhnQ0pkQkMxVm1uS0Q2ZGhDT1pDZGdWZ29UbldDU05oSExx?=
 =?utf-8?B?cUJGM3U2emhwQWxZTURscHNDRDZ4d2d2NEFZbnV0UnFHLy9pOTluNUR2RGRB?=
 =?utf-8?B?blFkVllpU1gvclA3bWRpZEQreUVicTdSdjIwV2J3MlZ5M05NeHhSa1lIMW5r?=
 =?utf-8?B?OTc5MFhDUGhaTS9uVG11ckkrWE43TFNVK1ZyWm1SMGZCN2RlQm5CK0dxem1D?=
 =?utf-8?B?NzB3aS93WUVZQXZVY1JNUitpRXU1QlJwOGJIM1E0ZEVDd2tBVVNXWkIzZGxM?=
 =?utf-8?B?UnVITVkybDdSVDV4RGtkNVRoc1JnU3RnaXBSdWJ4WGVNNVRHRU1OVjlydDh1?=
 =?utf-8?B?WXBHcyt3QUU0RGE5TkdnOGVRTE5MaVQ3d09zKzl3bzRLeVFPZlhUNHNtaGt3?=
 =?utf-8?B?TFB4N3dHQmdQenI4dVIzWlBuVktkSFhDc2RFcFZzcnI2TW13MVRyYWU0MEdF?=
 =?utf-8?B?clNuQy9ScGtubkgyWUJ1T1UzZVhFZ2lOaUwraGpSM3V2TU9pVzFXanlpVjdr?=
 =?utf-8?B?eFlFYll5SGpIY2d0eVAydFdCOFJxbWMzVFdjaTg0c1VUTklDYW5RVlNXd1Jx?=
 =?utf-8?B?NVFFRlRWZzVURU1PTHlhaVhyU01Ydkhqdm9mandua2pyYUY4Rmp4QldxZXBm?=
 =?utf-8?B?R2ZsaGt5VkVVNTJMSkh2SDFPaHhTamFiQ1ZJWHd0L0VhamJ3a0JxbW1ydTJk?=
 =?utf-8?B?ell4WHhqaFR0Ym91WjNETThNaXlCWktLZm51MTBZN3M1UzFzQ1Y0MDVvQ1V5?=
 =?utf-8?B?SjJRMTNEbWlyT1kwK2x4aS93enRNUGtWVTZ4TDJ1cXhtdFFSWnIwd2ExWTVU?=
 =?utf-8?B?Z0xDdzAra0VrVzhUK3pPcGgySjJ3UUZjcUl4WGRWUXZVKzR6TUF2aTRmNExN?=
 =?utf-8?B?VFVmL0k2akRBUm5GUVh4cVZ5cWt1N0ZmL3EzRzJnWjMrMFI4RXJiNllHeDJl?=
 =?utf-8?B?dTJuNFJWSHk3SmloK01QMTA5VkFheFA1VjNyZ2IxSWVYanhSc3Q1RXRhbjJ6?=
 =?utf-8?B?VGV5b0R5dkVBUmhnSWI2OUg3WDBiZlFtUGlyTmluMnpROEo3SlU1VHduUERS?=
 =?utf-8?Q?Yfv/ZZxDnx8BwqYdx7pNEJ27a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8371602a-3bc3-47df-a093-08db9757afba
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 15:05:07.0505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bFE3Zo+qbSob9yP1/Ff5Cx2WFwPQ79y895OVkqCLNID9YExKa/WZFidSMfA3mdTGPMnQHLvHEhJu2lUhD4ptw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9355

On 02.08.2023 02:11, Shawn Anastasio wrote:
> Implement the OPAL firmware calls required to write to the serial
> console on PowerNV systems. Unlike pseries/Open Firmware, the OPAL
> firmware interface can be used past early boot and as such the relevant
> functions are not marked as __init.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Constraint as before and with two nits
Acked-by: Jan Beulich <jbeulich@suse.com>

> @@ -20,8 +22,20 @@
>   * Load the address of a symbol from the TOC into the specified GPR.
>   */
>  #define LOAD_REG_ADDR(reg,name)                                              \
> -    addis reg,%r2,name@toc@ha;                                               \
> -    addi  reg,reg,name@toc@l
> +    addis reg, %r2, name@toc@ha;                                             \
> +    addi  reg, reg, name@toc@l
> +
> +/*
> + * Declare a global assembly function with a proper TOC setup prologue
> + */
> +#define _GLOBAL_TOC(name)                                                   \
> +    .balign 4;                                                              \
> +    .type name, @function;                                                  \
> +    .globl name;                                                            \
> +name:                                                                       \
> +0:  addis %r2, %r12, (.TOC.-0b)@ha;                                         \
> +    addi  %r2, %r2, (.TOC.-0b)@l;                                           \

Strictly speaking the - want surrounding by blanks, but I wonder whether
to PPC eyes these constructs look more natural without. Please clarify.

> --- /dev/null
> +++ b/xen/arch/ppc/ppc64/opal-calls.S
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Adapted from Linux's arch/powerpc/boot/opal-calls.S
> + *
> + * Copyright (c) 2016 IBM Corporation.
> + * Copyright Raptor Engineering, LLC
> + */
> +
> +#include <asm/asm-defns.h>
> +#include <asm/opal-api.h>
> +#include <asm/msr.h>
> +
> +    .text
> +
> +#define OPAL_CALL(name, token)  \
> +    .globl name;                \
> +name:                           \
> +    li      %r0, token;         \
> +    b       opal_call
> +
> + _GLOBAL_TOC(opal_call)

Any reason for the leading blank here?

Where necessary I again think these small items can be taken care of
while committing.

Jan

