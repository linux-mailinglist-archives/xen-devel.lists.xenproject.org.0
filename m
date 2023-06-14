Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CB0730432
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 17:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549014.857328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Sm4-0001gJ-QN; Wed, 14 Jun 2023 15:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549014.857328; Wed, 14 Jun 2023 15:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Sm4-0001eZ-N5; Wed, 14 Jun 2023 15:51:08 +0000
Received: by outflank-mailman (input) for mailman id 549014;
 Wed, 14 Jun 2023 15:51:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9Sm3-0001eT-JE
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 15:51:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 455f099f-0acb-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 17:51:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Wed, 14 Jun
 2023 15:51:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 15:51:02 +0000
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
X-Inumbo-ID: 455f099f-0acb-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gC0YdSkOOExGXKq2kXY8pspk8hVYJWZffVKNnCAfWrubhlulcpXLFwH0Lerzwy1mokLe6wdgQvsEGH7T64PdK59FWmjIEdhn291rpqP3XdraSNd1UB3MLK/XNLOmuTlUmbyx+FyOgke/Qp5ILjPPqUW5uckPWeMev3XNCid54A0I7FwjWB/ddyCtRI7O+F3vt2Bqt4PbfP5bqw/agXU4vHr31wX7gi9TiSfzFSLxNIDAIG6E6Bqt/XT+Fu/PNbwKtm/o2T/rSwjsV+VZp3wN8SEX8hmXoP3XFXBxQ+XzgCCsAVLb/FpA0UDfRC6CE6oJniHh8OIpxxOgfSUWpfcjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeHIlHKmwY1bKrJgC9kiwaBmKl6aT+BO47L1/JIGvL0=;
 b=VmJp2FyDvASyk+w2QvdPjwisVyHqMFH7ATFUjgZi2SrC7fT9c93sEmwfC8VbhbUifsFKI5DvT1SVlxP1fyfxau0ym6n/feBMrMKXoyaS5npv7jbTAasjT7ogoeRjd1Eiq2wP5J7PKEkFu8CG2dmwLrcbjXwdUJlSMFF5NGlPBfKeeDbEJEWzJtWWQqi2nCb/RmrHh+BgUoMAZyloRMsx8sBVcaI6A9ogxZMHtME3BItmJ6pFPSnK7WCi2zlexAYe7/B/hQt1Y0XSNPsjLUxhx6wIlVFh9oeHlittuqNjIHRuFJfJU9Xbjvud7ehv9vSXyzkh2krL/EJ7Bow8TChHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeHIlHKmwY1bKrJgC9kiwaBmKl6aT+BO47L1/JIGvL0=;
 b=NFspO1bE/KfS5VTWUrGMGc6pEI0hu3NfmAhe8yp3LW83EVqWaXCf40MCtN6cdJzgADty0pcvwvti3pKkMusNK2PDqPO+LIv+C7ekZ/7h33iu6IrgDw7yrdXidP96x3U2QDm+TqJz+jiAGVoNO5yMKnTeYJhi1yrHseoqUxWf9uUVG3MEkNZZzBA9Ci+mC671XIr26b88tOZQLolfvmU3l5ZbmQGhZAwgRW8p8XLTfYtWOMSRj/AgZnca6YAIbRn4LdFw7R6gRYT1Ab60GXnddUi4JaCfHfBALl06WsgzgOIueVXV/tOuNrVlGp+87uCDYdp/buJd0iCmG+g5Pe+riA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e04c4cc2-21b4-d508-94d2-5fb786df37b7@suse.com>
Date: Wed, 14 Jun 2023 17:51:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Shawn Anastasio <shawn@anastas.io>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1686667191.git.shawn@anastas.io>
 <d45855963671225b5e20cb0f26da1e7ec64427f2.1686667191.git.shawn@anastas.io>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d45855963671225b5e20cb0f26da1e7ec64427f2.1686667191.git.shawn@anastas.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8868:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d166ac-bf68-4ef2-e5ed-08db6cef27c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4lXhRH2j7b18z3m5mP0YTAHlwV3EjCdcbMONhsEpnCjnxxYMVkHEBZ2oNGdpjKURCvAtoEQnpyccKG+bwfO83z0vIjg8zvD7GMp4fqJacur7AbALCjnHzouJ3+UUdufNLajEwl1ohPM/CmBPwoCqL+fWS6QK4/yMoQrAJMUO3Z+D+NWY/hk+M//+iN/gLH7EC1Q6c1626U/Tc0LaBoEXWVUTxHJm92Ai9sFP59DbBaONyIiSdedqHiaylZUHlVXk+qzGjRaER2UN3htExl8GvOX02xByZ3Yo4qPjhIeMt5bwlPtw0adnXxYT+jbP4bHYi5pMY37CYlB9b32BDq8YLmVgVKybZs6anm/7XCDbjF5BrZNSIIvoNmhlTBmrAbPS4W8SY746Et7pS/J2f1FzreQ9eGEoctbqyI1crCUQFqPOs1HGy2rF8Is2BZZb0ZggYA7yBgUHqtKFRWUhZc0ad/VQcMA9If54BPpLY7NYJTAh/sCY5OXG8ZFTgpagP9I2Xk/ltesmU+t3IeV9QmxVmDOg7Kig4hcRdHe1ZtKbex9a4jJHVnClUxGLVsVCjBQdzbBp0Bm25YFEeW9FvTl+LCoVSQHeCJaaMD5n90c9l7uP2/XIPdtmadnVX3PYWy0CcOx9repF1hkWO5hiuNqIrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199021)(54906003)(5660300002)(66556008)(4326008)(8676002)(41300700001)(8936002)(6916009)(66946007)(2616005)(478600001)(66476007)(316002)(38100700002)(186003)(26005)(83380400001)(6486002)(6506007)(6512007)(53546011)(31696002)(86362001)(2906002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFpYUE5XQXhzTGwvY1VSdWVGc0luTWI0WlM4ZmwrMVVNdXlsVHIxeFpEbkdQ?=
 =?utf-8?B?K3hYQWF2VGlXRXpUNTVQMzg1dUlIaVhKKy81aEhCRnd2Z052SVlzN2Vzb3hG?=
 =?utf-8?B?NE1SZlg3TWYrR3gwNFYvdXpaUzJtU01xSmpENHpTWVVHZEZQSGNrMGZaZlg2?=
 =?utf-8?B?RjFUVmZIV1FOWFlhRGNTWDQ3Q0NIaVo1UU1mdzYwelU4Y1cvSlRQYmQzT2dq?=
 =?utf-8?B?ZUJZejQyUHJJSVkrNGhUbVJIcThFVW5ZdUcrSUR3MWNtZzZobm9LWG5YVHdY?=
 =?utf-8?B?bEJXM29YQkpIbU50bCtReExBUnE2RGRCU284NEhteTI4QUtSWGVPTDdLYTZO?=
 =?utf-8?B?UHZ6QUcyR3duUEZRZ3lGSFdFNGZjeXNDb2ovaFdJMzBWVjkxQ2wrQUM3WXl2?=
 =?utf-8?B?cEJYS2dwK2Rta3VKeXk0LzFibVZXVFNic25yTU9STzFwY05yMWI0dzJEWE9h?=
 =?utf-8?B?Q2Z5aTdmZmxkQ1FzNklUd1NHeEl1VFJ6R3NWanczWE5xVzVGYURSbG1QTmF0?=
 =?utf-8?B?RFQ3Z2I3STRObU9wQnl6QnpmZC95Tk9sWFF5YlRhMGpqdEhRaFUxYTBiUFBs?=
 =?utf-8?B?VUlWenM4T2haRm1KOFI3b2VCblcxWW42ZkZCSWNyczJRS0xORms2Nk0rbXFY?=
 =?utf-8?B?bUVlS3FsNjNrWlo2R3BhRElrRHdKYlpIQ3g5YUxmbkhjL3dhdGJhemtHaXAw?=
 =?utf-8?B?T0hmNGRLd3pYVzlseTNhZENMKzFCdmFRSWswMzZ3VUlZQ0tOczEwNDV3cmg0?=
 =?utf-8?B?bE9vQ1VvaWRmSHBxK1hqOExQUUlRbTE5RU0yVGpLajg3eWdnSjc4bHJzalZ3?=
 =?utf-8?B?TXdkalpMMExwL0NkMC80T2xPZS9jQWZOelhwcEtoMVhkTjI1ZlF2cFY5T1FY?=
 =?utf-8?B?MU9ad3lnRU9vaU5EZmdqYjhqVVJEZEEvN2ZnN0UrRXVqL1NTMTFlckhlQ0hP?=
 =?utf-8?B?QW5lSU1QaVFYYzdPQmk4RmJjWFFrdTZFWWhtS2NYVkg4SDhEdVQwZ1N2TytX?=
 =?utf-8?B?cjZmK3FVbGtMcTZORjBkbGtCQUNlV2t5WUJ1WFR6ZHhaWWR5c0hXdkNzSVBE?=
 =?utf-8?B?ejNObFo5QnowZkVMTnJKejhmUmxQZGF5aVJaOGtZTXVsVnc0NnJ0THhrUFg1?=
 =?utf-8?B?eG85WmlROWFKVWd0azRVR2Izd2tHNFNaVzBLMlBQQkFBbms0WlpDYTUwNkdv?=
 =?utf-8?B?cUZEUkxKSXNwbFZNTlNBaTI3bnBSNS9QdXpkczczUmJGbTJLc21jVnJJSkV4?=
 =?utf-8?B?OFNyU2ZwdG5FdHFaQkdxSWx6YU5HeTU0ZTFqSFJ1MnpBMlpuZjFmbVRlT0Nq?=
 =?utf-8?B?U1p2d2VPZ2xKNGVhN1JiVkRQSnhIc0cvUlNOdFNBMkxDQ0JTdksxWlA3MVBS?=
 =?utf-8?B?b1NhakhweGJSY2lQVzAyaUtyeTNRSk5WRWJMdWhXVTc2bGhzMEQ1bzgrY3Fr?=
 =?utf-8?B?dDRjZHZwL1lKZVZsek4xOTFxaW5CRjFDZjRROWtNSEY2WTVSb1c0dmpubVJk?=
 =?utf-8?B?U1RQaUxCOFJNQ3E5d1JTaTZpV2o1a1dTTDArSzlMZFRyVFREbDJjYnZOMnh2?=
 =?utf-8?B?MkpPcERmTVN1R0xPU1pWZHRwN1ExU0tHaE9wTVJ4MUkyUmtEeW9UOUNoTmRt?=
 =?utf-8?B?azQyd3VoWE1zMWI3bkpRTGp4cEc2c2RJdGMvcW8vUEQzcWZCOXAwSElzZ21G?=
 =?utf-8?B?V2FqMlJDT2kwSXdDVTByMmdwZlZWTUNieEFRNGJldHphUmtpOGVNcjBwTHdM?=
 =?utf-8?B?RlQrKzQ5KzlJN0JRaE5ySlhtQXJQMjZNR0c1bUlSd29XcmtCdGEyNityU0Ru?=
 =?utf-8?B?TmpGaWNSalp6ZXVPQWgwQitOQk5kL1VNTDNISGVNU2diY1lYaFpWSndKalE3?=
 =?utf-8?B?TEdxY0dqUWY4dzd0WVBDZ2ptUmNocDVyTGF4VFd4UVB3c3J3SHkraVcxR292?=
 =?utf-8?B?enVtditRQ3pFQ3RIMTJyK0VoWnF2NlZJdWphcmw2bFJ3U2JoVmRoaTkzQ0lE?=
 =?utf-8?B?d0tIUHJOL3M2eDNNWktndTRVbVlBaENlS1d6WUdXb3cwQ2lMQTJrUmxTTmlh?=
 =?utf-8?B?VFlwQXBnYm1FMDJzMEtRQzdRbVpFSHdKY0NmdHhqWit6cmlxZ0J6U3BzNk1X?=
 =?utf-8?Q?mU+nGiRJsCVKaLBkMBwRv9T+6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d166ac-bf68-4ef2-e5ed-08db6cef27c8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 15:51:02.5029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvKlCkDoH5NkvuEyKQyL2pnRkpePoanbMSdfte6HcQgMBy3l+kVGVeARJGbpPxpvkOG5+pcrzmJ2gH4hB0dTdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8868

On 13.06.2023 16:50, Shawn Anastasio wrote:
> --- /dev/null
> +++ b/xen/arch/ppc/Makefile
> @@ -0,0 +1,16 @@
> +obj-$(CONFIG_PPC64) += ppc64/
> +
> +$(TARGET): $(TARGET)-syms
> +	cp -f $< $@
> +
> +$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) -o $@
> +	$(NM) -pa --format=sysv $(@D)/$(@F) \
> +		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> +		>$(@D)/$(@F).map

Elsewhere we recently switched these uses of $(@D)/$(@F) to just $@.
Please can you do so here as well?

> --- /dev/null
> +++ b/xen/arch/ppc/arch.mk
> @@ -0,0 +1,11 @@
> +########################################
> +# Power-specific definitions
> +
> +ppc-march-$(CONFIG_POWER_ISA_2_07B) := power8
> +ppc-march-$(CONFIG_POWER_ISA_3_00) := power9
> +
> +CFLAGS += -mcpu=$(ppc-march-y) -mstrict-align -mcmodel=large -mabi=elfv2 -mno-altivec -mno-vsx

Wouldn't it make sense to also pass -mlittle here, such that a tool
chain defaulting to big-endian can still be used?

> --- /dev/null
> +++ b/xen/arch/ppc/ppc64/head.S
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +.section .text.header, "ax", %progbits
> +
> +ENTRY(start)
> +    /*
> +     * Depending on how we were booted, the CPU could be running in either
> +     * Little Endian or Big Endian mode. The following trampoline from Linux
> +     * cleverly uses an instruction that encodes to a NOP if the CPU's
> +     * endianness matches the assumption of the assembler (LE, in our case)
> +     * or a branch to code that performs the endian switch in the other case.
> +     */
> +    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
> +    b $ + 44          /* Skip trampoline if endian is good  */

If I get this right, $ and . are interchangable on Power? If not,
then all is fine and there likely is a reason to use . in the
comment but $ in the code. But if so, it would be nice if both
could match, and I guess with other architectures in mind . would
be preferable.

> --- /dev/null
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -0,0 +1,173 @@
> +#include <xen/xen.lds.h>
> +
> +#undef ENTRY
> +#undef ALIGN
> +
> +OUTPUT_ARCH(powerpc:common64)
> +ENTRY(start)
> +
> +PHDRS
> +{
> +    text PT_LOAD ;
> +#if defined(BUILD_ID)
> +    note PT_NOTE ;
> +#endif
> +}
> +
> +/**
> + * OF's base load address is 0x400000 (XEN_VIRT_START).
> + * By defining sections this way, we can keep our virtual address base at 0x400000
> + * while keeping the physical base at 0x0.
> + *
> + * Without this, OF incorrectly loads .text at 0x400000 + 0x400000 = 0x800000.
> + * Taken from x86/xen.lds.S
> + */
> +#ifdef CONFIG_LD_IS_GNU
> +# define DECL_SECTION(x) x : AT(ADDR(#x) - XEN_VIRT_START)
> +#else
> +# define DECL_SECTION(x) x : AT(ADDR(x) - XEN_VIRT_START)
> +#endif
> +
> +SECTIONS
> +{
> +    . = XEN_VIRT_START;
> +
> +    DECL_SECTION(.text) {
> +        _stext = .;            /* Text section */
> +        *(.text.header)
> +
> +        *(.text.cold)
> +        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> +
> +        *(.text)
> +#ifdef CONFIG_CC_SPLIT_SECTIONS
> +        *(.text.*)
> +#endif
> +
> +        *(.fixup)
> +        *(.gnu.warning)
> +        . = ALIGN(POINTER_ALIGN);
> +        _etext = .;             /* End of text section */
> +    } :text
> +
> +    . = ALIGN(PAGE_SIZE);
> +    DECL_SECTION(.rodata) {
> +        _srodata = .;          /* Read-only data */
> +        *(.rodata)
> +        *(.rodata.*)
> +        *(.data.rel.ro)
> +        *(.data.rel.ro.*)
> +
> +        VPCI_ARRAY
> +
> +        . = ALIGN(POINTER_ALIGN);
> +        _erodata = .;        /* End of read-only data */
> +    } :text
> +
> +    #if defined(BUILD_ID)
> +    . = ALIGN(4);
> +    DECL_SECTION(.note.gnu.build-id) {
> +        __note_gnu_build_id_start = .;
> +        *(.note.gnu.build-id)
> +        __note_gnu_build_id_end = .;
> +    } :note :text
> +    #endif
> +    _erodata = .;                /* End of read-only data */
> +
> +    . = ALIGN(PAGE_SIZE);
> +    DECL_SECTION(.data.ro_after_init) {
> +        __ro_after_init_start = .;
> +        *(.data.ro_after_init)
> +        . = ALIGN(PAGE_SIZE);
> +        __ro_after_init_end = .;
> +    } : text
> +
> +    DECL_SECTION(.data.read_mostly) {
> +        *(.data.read_mostly)
> +    } :text
> +
> +    . = ALIGN(PAGE_SIZE);
> +    DECL_SECTION(.data) {                    /* Data */
> +        *(.data.page_aligned)
> +        . = ALIGN(8);
> +        __start_schedulers_array = .;
> +        *(.data.schedulers)
> +        __end_schedulers_array = .;
> +
> +        HYPFS_PARAM
> +
> +        *(.data .data.*)
> +        CONSTRUCTORS
> +    } :text
> +
> +    . = ALIGN(PAGE_SIZE);             /* Init code and data */
> +    __init_begin = .;
> +    DECL_SECTION(.init.text) {
> +        _sinittext = .;
> +        *(.init.text)
> +        _einittext = .;
> +        . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
> +    } :text
> +
> +    . = ALIGN(PAGE_SIZE);
> +    DECL_SECTION(.init.data) {
> +        *(.init.rodata)
> +        *(.init.rodata.*)
> +
> +        . = ALIGN(POINTER_ALIGN);
> +        __setup_start = .;
> +        *(.init.setup)
> +        __setup_end = .;
> +
> +        __initcall_start = .;
> +        *(.initcallpresmp.init)
> +        __presmp_initcall_end = .;
> +        *(.initcall1.init)
> +        __initcall_end = .;
> +
> +        LOCK_PROFILE_DATA
> +
> +        *(.init.data)
> +        *(.init.data.rel)
> +        *(.init.data.rel.*)
> +
> +        . = ALIGN(8);
> +        __ctors_start = .;
> +        *(.ctors)
> +        *(.init_array)
> +        *(SORT(.init_array.*))
> +        __ctors_end = .;
> +    } :text
> +    . = ALIGN(POINTER_ALIGN);
> +    __init_end = .;

Up to here I think I agree with all uses of ALIGN(), but ...

> +    DECL_SECTION(.bss) {                     /* BSS */
> +        __bss_start = .;
> +        *(.bss.stack_aligned)
> +        . = ALIGN(PAGE_SIZE);
> +        *(.bss.page_aligned)

... the one between the two .bss parts looks unmotivated. Within
a section definition ALIGN() typically only makes sense when followed
by a label definition, like ...

> +        . = ALIGN(PAGE_SIZE);
> +        __per_cpu_start = .;

... here.

> +        *(.bss.percpu.page_aligned)
> +        *(.bss.percpu)
> +        . = ALIGN(SMP_CACHE_BYTES);

This one is an exception, as it is intended to separate the read-mostly
part such that there's no shared cache line.

Jan

> +        *(.bss.percpu.read_mostly)
> +        . = ALIGN(SMP_CACHE_BYTES);
> +        __per_cpu_data_end = .;
> +        *(.bss .bss.*)
> +        . = ALIGN(POINTER_ALIGN);
> +        __bss_end = .;
> +    } :text
> +    _end = . ;
> +
> +    /* Section for the device tree blob (if any). */
> +    DECL_SECTION(.dtb) { *(.dtb) } :text
> +
> +    DWARF2_DEBUG_SECTIONS
> +
> +    DISCARD_SECTIONS
> +
> +    STABS_DEBUG_SECTIONS
> +
> +    ELF_DETAILS_SECTIONS
> +}


