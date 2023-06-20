Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56517368FB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 12:16:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551516.861103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBYOP-0000ow-Mm; Tue, 20 Jun 2023 10:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551516.861103; Tue, 20 Jun 2023 10:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBYOP-0000n7-J9; Tue, 20 Jun 2023 10:15:21 +0000
Received: by outflank-mailman (input) for mailman id 551516;
 Tue, 20 Jun 2023 10:15:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBYOO-0000n1-Qq
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 10:15:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59e0a451-0f53-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 12:15:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7478.eurprd04.prod.outlook.com (2603:10a6:10:1b3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 10:15:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 10:15:12 +0000
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
X-Inumbo-ID: 59e0a451-0f53-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMF4/Cq77LJDNTs6zCb6GHJdAezLfJGGBxn0fbnP+5Sp+Ewx96vqJPuw9o7+Kz/HOky2+Ubdvsaj+v+8HgFGUtdKmcPOC1WPKqxk2Z8qxR8RS5bOlnqRxHXQqD97kuPZRyREXeptdlPpQ2L1MwSJnw5B5SOTu1exNmOgR0oAmPDTw44R2mZFuWTmS98MPQC04R2rZAyHyRSskoJWYk+MUirDRDp6ia/ceh3L2fJLkvdVR9a4bOESwpsgxcvWu1TFmiRP1HYeYosMxEdRlwsKFbnPwllmFqzJOSPSVvoHz6bKHabl+KpOsNRJo+mnKpq4N88GpJLPdE1MJ3RgnsfAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkE51MezFCXOoCImZrVabYqeA0h+i4rhkezGS71W/jE=;
 b=UWxgNBKokn3URt02fTZCrl4iy7CLgM2x8UdrCS2NZ+mYZdqXAZZ2zYEBXyvi9xNXl9JfMYGiG0C2AVp6GENwfA4rsNnGCbzH5Ujkm1ncNZx69D47KeCqz6FUiEJzx6OfR/gzDJSeIICyhSddYs2QLgW0PW4E1c/MLEzsiJlji2fARIJO08U0z7csqtCamu49J62OtJLFSTTbRrV+E4yMKfVEJJlIZ3zEmNsTf3S4vWhtLUimFsMOx/OCxbFDp44a+jv+lewKBFJn3jQn6wddILw+plx0hi+xi+BRA+1kC5QFy+7cmVKJtNTdgXZBTZsWPjbUdxb7UuY/mqjgGVRlrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkE51MezFCXOoCImZrVabYqeA0h+i4rhkezGS71W/jE=;
 b=j3TGThBbwBFu5UnpIi4xpgY7LIe0PAHMQO+pCjEA0x4kn3o/o5X9hUvQcMTiodiFXEq/Ihh/AQc6K1tknXhPy4R/aJbSeu7o3S2kSsgb8v7bAvTQvcpHLoYWJZvYU878u2HaXKh7Uion7YtfwtLY998gCIl6e5Ih88lLbwiG71rhSCW26M8P7+Ci2rK673wGhVDEzhdyLXM9TlBd/dONSmI55kSm5cbHayAHAwQD8UjCTC0wmPl/kJMqrTOZcyzxvek6CFIoTjgmfpCBJBGNMbbqDcxFpSZr5bd+xWllW1+UIPas+8MAtDVXXRsW9KNR5AdJzOKfVof+l2vbv8WZwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5dc1965c-6d7d-16bd-09e5-85bc950ffea8@suse.com>
Date: Tue, 20 Jun 2023 12:15:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 73218ffe-7c13-4fcf-9d48-08db71773bad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rtFK1PmtBurF+R5ivbZA2qcCpxnH3f4hS2wZwyAeJNa41yCy46/y+W7zif8kND9bPC36zDMZlXUOMkqYP2qx63VJAeTWHTtTsrGoYF2LgaI+SOtmOpqZTmATrgT8Tm4KmMFeNLqqMbL7yHRb3rclWvONBCjXJwTK9+nl9rpl5BWUb5r3K/fB73Brk6reBhbkGpJ70wtRsMEMPkORXwlSQ5U3P/nPfWNvXlJurZaxJMOMBYcjk7IkO0UuUk/bkxrCCtwUxK/MVl1ikXXUZfeyzlzMspDsqKQS2mGOKUkWPC9aTcQjzG3034WTaAFYK+ep9MyfnAj/Ux/54Sem4z+0XVbLd7ytVbFMxsrqQFX0VS9Ju158sZptoIBoqF58lxuHw2j1NbysFHXZFM3YqXUUHmEOqPZAuf5og4B4wZZMhr0ZGC/ruxRlTk7BSZzRoajUuvFzlc7LDOnza3qfDU4W5y1ENpXywFhO+9xveyiltH2wqwbE0hAkt+nDZOtz1ia5czECxTufzx93JTlcsNF/edRzHYwDobWQ+SiFXT3ItpP3G/ggf2ldoRY15qE16XsGLCnlybtkE8xqOzH41W0nnBvhg5VviJfgv308V9CuRLzHubpIeAn6K1RjF4ejNHoYm/0qaqURpYAEy9GhJcYeFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199021)(2616005)(41300700001)(5660300002)(8676002)(8936002)(6486002)(2906002)(478600001)(316002)(31686004)(83380400001)(38100700002)(186003)(6512007)(6506007)(53546011)(26005)(36756003)(54906003)(4326008)(6916009)(66476007)(66556008)(66946007)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U01jYWhjVktsNnRJT0xXSy9JODI4NlRiZDFXWmxGWk9KM2JxYnp4NURjdldo?=
 =?utf-8?B?cjA2OE9wSFJybEt5QTZvcnNYT1RERUJENmF1UUkxbnA2THNobTBUN2hYaElr?=
 =?utf-8?B?aWlZbXNTeUJDVVU5V1hSdEtXcXo3UWQ3b242NFlDWFU5Z0dieDR1R2tmSERP?=
 =?utf-8?B?YVBaUkJ1blQ2YklqUXIrTGpsYnkxbVd5VmtTQ2pzblNBWjVvSWpXT0VJYmlp?=
 =?utf-8?B?U3FNNFlOakJWN2E1d2JNVmpXa0VGUkZDUXpRQ3VKN1ZIbDJ2WW1YN1U5TitZ?=
 =?utf-8?B?LzhhNUhKZ3J5eVJYRkYvUWpIbWxxSjZMR0pOQ0JvTUF5bjZGOVFDN0lLZ3Zn?=
 =?utf-8?B?cmtzRXZxVTFjdllkSFRrbWFnNk5ZR29PSEpoL2RaV0RPb21RLzNLMTgwU1dj?=
 =?utf-8?B?NDA4SEx0dGU3dXJva2VvUEJHWTFXeXVxSHlYU3IrTm54c01zVit1bEdjZGk4?=
 =?utf-8?B?THhnY3ptbTREWU9YZ0Q3QjBnT3NXVzJRNnBzVFRyZVk3ZTRWN0d1VE5xV1FP?=
 =?utf-8?B?cGsxdEFGdDBRSlFsWHBldDk1Z1FucUNaQUNzbkozY1RRTVNOWkV0Q2E5cnl1?=
 =?utf-8?B?L0FBTmNZOFZOdmdMUUE5M2lIa01iTjhiL2JpUGtpYlc0UEtnbFZITzRLNmRu?=
 =?utf-8?B?UVpmVlorSThDTU9GbytLeDVNdEd3K2RIc2U1VWZ6UEdDNXlYTGRLVGdDZ2Ru?=
 =?utf-8?B?T1VwQm5zNFE4bElYVjRmcEljcmFOZGhKLzFYdDVrQWNJT2paVHNjTmJ2M1Rt?=
 =?utf-8?B?MkRNRjVEeGNrZ2sxa2Q4WUduYm00QzhGRHVmNzRycS9QTm96R2p4VHRSWFJr?=
 =?utf-8?B?cHp6WVZ2dnNVS0NuYmhLNlVEUWQxY1c1ZDUyNXVCOXZhNnIzS3RHNk1keFY3?=
 =?utf-8?B?bjRtcThvZWtqazR6VDJwaDhMWjFQZXZZcUhUSTZzR1FxNnJQbC9HQzJOTDI0?=
 =?utf-8?B?MFhiUzJNVVVyRzFOU2t1bnkvSTdqMVl1U0ZrSWpmTjFzSWZKNGhmM0IvN25h?=
 =?utf-8?B?cTlPWjZhMFlTTGJEQXA3VXVrQmk5VFYrM0RYb3R6YVg2bXRKK1NUZ0Z0RlZo?=
 =?utf-8?B?N1J1WkFBY2lOY0FiUGZGT1JidFp3Q1R2L3E0ZWtrMXBlMGdaREVhaVY2UG5t?=
 =?utf-8?B?OFVpQnlJZFl5c2Nsd3E2dEt1dlA2ZFBpanlQbmxXR2VRTHo3ZzdhMzJwN1Nt?=
 =?utf-8?B?QW83NmVLTlBPeVZOUnNNVG1zdENGTWV2T21kQXkycjZISThzZm5GNUdTdEc0?=
 =?utf-8?B?SjhCZHZuTHdlS2N3d3ExdTlmNHA2VG40blZJYlBSSXcrMmFESkdrT2E4MzZQ?=
 =?utf-8?B?RDQ1TTRwV3Z3ekpkMmdwK0ZYUGpmYnlaVVY4Tm5DcUwxU0JJUUV3M2l0Unkv?=
 =?utf-8?B?MHlWWkUwYkZkbjNIeDBrZHh5TGl0MkJHbWJTRGhaYzBCSmJlcEJIL3psaVRT?=
 =?utf-8?B?N1dpQlU4bG9CQjhCVUtwZWZtT0s5cHBGVjlYK2pUaVJITGEwblJPb1Q1SEQr?=
 =?utf-8?B?S3NTR0lnazRtRkEyUEJkYWZoVk9rNFVZQ21qYUR2V3prTHRvRW9oWmtxeDhj?=
 =?utf-8?B?Rm1uSEY3VStUNEU3R3VLSjF1MmRjMDdzblQvNDhvcW9EdUpxOVd6dUVsNFFP?=
 =?utf-8?B?WmYyemxpNVh0OG9IUmVqSWR6aWV3Tkp0OFNUZVJXajEvOXk4LzdWdzRmSzZY?=
 =?utf-8?B?b3RtUFJETmNCbmFubExrclpwTUlVcU00ZmtjR1NjcG0zSGxaMTNuZDlTQmRE?=
 =?utf-8?B?KzIrQTIvNEVUUmJHOW1wcWZlMzRYNTJMcGpOaEFqa24rNGx0eEN0L1ZMRU16?=
 =?utf-8?B?bHpETEsrK3YzeXRZR1NiWjFsMW41TW9pNG9BOWJQWk5oSDF4ZUVUOGRhdlRB?=
 =?utf-8?B?SGR4OEFFanlZMk9COEczdXh6aC9SclhuVk00bFNaZDJKSkNuZ2tVQzN0VlJO?=
 =?utf-8?B?ZVRGRWtQTEdxa2RVVVF6UDhzZnlZWjN3MzRaRUhNQVV3RmMyakJEUldQTGR6?=
 =?utf-8?B?QzZzY2U0YjZHUVQ5dkNoWitsMUFDanFaM2k2Y2VmcDJpeVo4elFyOUNaRnRE?=
 =?utf-8?B?QUFuNTY4dXdJSExXQVNtRGdoSUVqTmN1T3RCdkRFaVVTL09ueDlZOFJiTzlv?=
 =?utf-8?Q?MnWeghvCjrxjs/kkj1Rpp6kpk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73218ffe-7c13-4fcf-9d48-08db71773bad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 10:15:12.0340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJ92+4buSZf6rSk6qW9SeeBqT16iwbnaSUPGkN0oDnT9KY5NfC5nr7W/Jo6gdermDFnUxpEm5ZYN2pfvk1rEBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7478

On 16.06.2023 19:48, Shawn Anastasio wrote:
> --- /dev/null
> +++ b/xen/arch/ppc/Kconfig
> @@ -0,0 +1,42 @@
> +config PPC
> +	def_bool y
> +
> +config PPC64
> +	def_bool y
> +	select 64BIT
> +
> +config ARCH_DEFCONFIG
> +	string
> +	default "arch/ppc/configs/openpower_defconfig"
> +
> +menu "Architecture Features"
> +
> +source "arch/Kconfig"
> +
> +endmenu
> +
> +menu "ISA Selection"
> +
> +choice
> +	prompt "Base ISA"
> +	default POWER_ISA_2_07B if PPC64

I think the "if" here is at best confusing. If / when ppc32 support
is added, a potentially different default here would make necessary
adjustments, yet imo would not be very likely to introduce this very
"if".

> --- /dev/null
> +++ b/xen/arch/ppc/arch.mk
> @@ -0,0 +1,12 @@
> +########################################
> +# Power-specific definitions
> +
> +ppc-march-$(CONFIG_POWER_ISA_2_07B) := power8
> +ppc-march-$(CONFIG_POWER_ISA_3_00) := power9
> +
> +CFLAGS += -m64 -mlittle-endian -mcpu=$(ppc-march-y)
> +CFLAGS += -mstrict-align -mcmodel=large -mabi=elfv2 -mno-altivec -mno-vsx

Just for my own education: Besides the expected effect, -mstrict-align
also appears to imply -mbit-align, which I'm not sure is intended here.
Could you clarify the intentions for me?

As to -mabi=elfv2, it looks as if this limits us to gcc12 and newer.
That's fine, but I think it wants pointing out in ./README (which has
a section for this kind of information).

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/config.h
> @@ -0,0 +1,63 @@
> +#ifndef __PPC_CONFIG_H__
> +#define __PPC_CONFIG_H__
> +
> +#include <xen/const.h>
> +#include <xen/page-size.h>
> +
> +#if defined(CONFIG_PPC64)
> +#define LONG_BYTEORDER 3
> +#define ELFSIZE        64
> +#define MAX_VIRT_CPUS  1024u
> +#else
> +#error "Unsupported PowerPC variant"
> +#endif
> +
> +#define BYTES_PER_LONG (1 << LONG_BYTEORDER)
> +#define BITS_PER_LONG  (BYTES_PER_LONG << 3)
> +#define POINTER_ALIGN  BYTES_PER_LONG
> +
> +#define BITS_PER_LLONG 64
> +
> +/* xen_ulong_t is always 64 bits */
> +#define BITS_PER_XEN_ULONG 64
> +
> +#define CONFIG_PPC_L1_CACHE_SHIFT  7
> +#define CONFIG_PAGEALLOC_MAX_ORDER 18
> +#define CONFIG_DOMU_MAX_ORDER      9
> +#define CONFIG_HWDOM_MAX_ORDER     10
> +
> +#define OPT_CONSOLE_STR "dtuart"
> +#define INVALID_VCPU_ID MAX_VIRT_CPUS
> +
> +/* Linkage for PPC */
> +#ifdef __ASSEMBLY__
> +#define ALIGN .align 2

I think I did ask for the same on RISC-V (yet sadly it's still .align
there): .align is notoriously ambiguous. May I ask that you use .p2align
(which I think is what is meant here, else .balign)?

Jan

