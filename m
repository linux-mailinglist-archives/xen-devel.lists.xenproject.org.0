Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DD17294D2
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:23:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545729.852248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YKe-0002AX-N8; Fri, 09 Jun 2023 09:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545729.852248; Fri, 09 Jun 2023 09:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YKe-00027z-KR; Fri, 09 Jun 2023 09:22:56 +0000
Received: by outflank-mailman (input) for mailman id 545729;
 Fri, 09 Jun 2023 09:22:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q7YKd-00027t-1j
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:22:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 357cfc1e-06a7-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 11:22:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Fri, 9 Jun
 2023 09:22:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 09:22:23 +0000
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
X-Inumbo-ID: 357cfc1e-06a7-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1tkPXcFE7mOfPtvZw/i8s4zl3J4xESU6yzzVbuDCnGzll0KMUbob+JKFlMr66fe8TTUIt3SjC/uCn6CcXzJpyWjxINdsCp3o3fzOsiUrGIo1g2BZs0JCZWcF7bUDOqcXcWkrFyImOsIwCFVqq44StmEyLXT9IY9aKIbJRDtxi3WyW9pG8qYzB3HpzNB50A+LGmVh/+WoMeo0W98WXgRP0Y4BabdZr068CGKSeW98nybhHtQGHDx8NGgqzZHY2wQ7AvyZEYA2TWED6PosmkbJLhlFCWI0WRGPgOOtpSS/fm0gEalJpFUOlHUV5uxxPg9lvuw2KOKo6iz606rpTR7iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSKU4UdbxaiRWFlrzwPHNShPPcIdaushNx1dN13n7rM=;
 b=cUHWcy9tVNgE4vr3T1Oix140NW+cuYjOxsqD/NAIjjQMBeXwr8OTUA7Zyk5wn0z3bMOGFp5KBI37E7+YqXpCb4G8ryeQo772qN9zieakdrfwpK6spqpbYSBhsPxoatiwqbkTpHULs6UbX2yHMdarKWaSY0Xhx8pDGLLqZGlH3nqCxrYSx559xyAqxmmnzTwS9xmzQo973LytfzPkbhdTnJO/nH7BHfDsDbxE4IpH5yM0Fyf6slaQdWdcN9P7wM+XzR9u2AjpUtAiIY3wlJdyL0bnA8Zp6ZFqGmxC148D/OTG1I9wwG07xXrGm1qgyI0wNIE9YOzIXHGbCN3N9jZ4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSKU4UdbxaiRWFlrzwPHNShPPcIdaushNx1dN13n7rM=;
 b=MJY/nlQCHQjFzYYqxRkcVFzGaXNk2bLHDeukbhaCwOuX0YifQA4LCPyXRaHCg4HErsLj14ZvjEnAP9Q3pVdydMoEDvvUbDcNEGAtj/L0Vl+p38EPzxujYeilRHbrgwF6UqjOYAOal48hfM8e5kgPyyAOU8cHleo1HJ3ESqy0KNDcWfS6iMEOL+B1bcH3r5lA8tn0lfcIOuEoc8+WrwZhiS8jSsv4S/KjzTys2yPeW1DeccoweTQ+jWT1XEsbqS3359LxvaSli/K1iLuvrzO4pq+G7zuyv7LguPqv9GH55OPprzdNn368YuPB0ButTlTyI/u02KOARNp/5OUl52ZreA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
Date: Fri, 9 Jun 2023 11:22:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on
 PaPR/pseries
Content-Language: en-US
To: Shawn Anastasio <shawn@anastas.io>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Shawn Anastasio
 <shawnanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
References: <cover.1686148363.git.shawn@anastas.io>
 <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ff0088-a4fa-48f1-f9a7-08db68cb082b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SHPtIrGztU0aKvf79Pc2JtobHI9MVChaGzzXoZ3csHF889bBvH2mltXjnrn1pHIp3XPyEdLtUHhyDGDbImrLENVUZu5wqMffYDJ5SYxGhqeKnhXZQe36PynT8alykJdzZHkOr/MlrRLgNmcAIsE9z4IuhqbnMoRgz/J3z1g4Mr2zwNSykl8tM5LzVnfAKkEPUVL3EljPWcxH0lRDapBFNYba2z5tcW7lsLaPPeV5X3+sqJGJKQFxsWgx9aJbKaV8CiLL8qallZE6RdM+WDPNPqc7j9C3winirsVP/vPGw7XqiGnnObZw+zNtxSPtbGV0jqVqagSNcNcLLwS76+ypnMLxWHotEMHBfi21ROtH9xUBihV7yQjT504UqHciCuwSUqZsXv6TPidbot+uZcN+UNHCYS+s7KUA3YDaqxnhrpHC3QSWx/grT4dJAnQLiOye7gQkAblPxvBHYUa8nzSIqA7wCs6iPm1NqHB4YZGgmQy7Fo0G3kCir5WHLo2GO7JMtKmO44qpfMJYwtE5g7KdYSHxxgYvKqog7AoTfZQWX8aJp+qjAcoHk57TR5oxrJxen5hGecA8PHcNDvaD/cqGC9pD9WlifFnmOKCHzohxjl4oMgJJ1awd7QP5dOzesdhSev+g+xAko3CM+O35XhLVmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199021)(66556008)(66946007)(66476007)(478600001)(54906003)(8676002)(5660300002)(36756003)(8936002)(31686004)(6916009)(4326008)(316002)(41300700001)(6486002)(38100700002)(6512007)(6506007)(53546011)(186003)(26005)(2616005)(86362001)(83380400001)(31696002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2xTWVphR1FzQ2tJd09ydnVEY0k4UEVnc3hqYVVYZWhrSUdGKzhPNDZQbDR4?=
 =?utf-8?B?a2RwYTJMcWY2UEFLNndmRDVRRlMyK1kvaUlFS1Z5QmNESmRTTGZ6ek5pWnJy?=
 =?utf-8?B?Ri9lbkEybkFDeXNxbnErTWY4Ump0ZWVvd1BMcEhzNFdJcFJLR3FCcnAva3p2?=
 =?utf-8?B?VWtOdHdRcXlZaEVHamdWbUxEY0FIOFhJVGhuNkUrZ04zajFuUjdJeENWcUlR?=
 =?utf-8?B?azlDdWY3WjA4UFpQUzVwOThOUkNQVDZ0YVNLbEpYdXlZU0Z1OVdVZ0ZOcm4x?=
 =?utf-8?B?SGkyUWkrNldvVWpmZEoxM3lJSmJkVW9KYWttcWtNamhza3dia1VxYTZOd01p?=
 =?utf-8?B?VjAvVUx0L05RaDA2MC9kN0twczRuay9kWldTRjdSaENmL3lucjVqci9nMVZZ?=
 =?utf-8?B?U2drRDR4NjBZR1orRmFxd25tZFhZUlZFMmlWeGlONUIvMFZCcFdkQ09KT0Fa?=
 =?utf-8?B?YWRQVnlwVEhncUtPTWg1eEFQTVNTc2hDVmtlRUp1dVlJNDA0ZUN3Mm5heTB2?=
 =?utf-8?B?bVY0RDM3dlZjNnJMcTFZa3RMa2htaTNMM2hJYWlodk9FQ2FlQzQySkxDVVdM?=
 =?utf-8?B?ZWNsUzlkNlVqakUzS2VGNE9UTHNVUFBlbWFJeGpRNFdHMUg4RXl0YXBaYndQ?=
 =?utf-8?B?MkR1M2lnY1hVR2VSbkQwb0xmbm4rZUpPY2hUTUhKdXRaN3E0dEhSOFdTM29I?=
 =?utf-8?B?ZTQ5WXIxZDh3OW0rajdKR1YyM3Z0WEJRbWl0Yk04UGJySy9DVUZOazZ1YmF1?=
 =?utf-8?B?WW1RVnZEQkkzakFGUFRnRTNUZmVjRmQxbDNLUnljdDBxL0lLZnA5L2JzNHl4?=
 =?utf-8?B?WVV5WlF3eGgxWVIwSS9PYkxGTlN5emV3SlZOc3l2Q1J3RE9pMklaNi9KWjVI?=
 =?utf-8?B?T3pYNm1jYUgxUkpPajlRWkY3cWhYQXd6eGMxd3lRZzhiWkhSMWF2Y2dUMzgr?=
 =?utf-8?B?MmdkV3luWllkeEhvelZvdVdxalVjUzJ6WHpSNFZIOUVwQkRlWEE0OFpvUVVz?=
 =?utf-8?B?WFl1dUw5SGtBWVhrcWZpM3dobURhSWxHTkFJMnNtWW5LUzNkWVB1TnhZU3F2?=
 =?utf-8?B?L2Y1bHBCeHZhU0s1T3JtdFhzTGdtbWE4c0I0bHAxSDJUL3BSb2dVSjdWUFhu?=
 =?utf-8?B?djJjOVJPaml0SjR5SDczcTl5VFNEWXprQ3RjdXd2VTE4dU9MMUUwbnBBUmVI?=
 =?utf-8?B?bEM5cmtNL0R6MXViM3pFRzU4NHR3UERCc1FKSCt0cmFIb29GcHg3WjdJQ2Z3?=
 =?utf-8?B?T1JXWko3OFNkdWhYL09FK0VVZjF4WElSM1NHblpYWlN3VC83TitkcjdvTndl?=
 =?utf-8?B?MVF0RmFRaU13WDlIMGkvdmZnTVQ1VUdRdXIxK1hSSXRJeVdtOUcyTlNUbXJF?=
 =?utf-8?B?ck0wZDhYTGhCaEtZMlVmckFqcytpczVQU1VtZXNtcUZsU3NKcC82WVBIanNx?=
 =?utf-8?B?akFrV002RUJjT0FuOXVNSVc1MTV4VG1xYUF2WG53dEEzQ2FBcHVtVlZtVnRj?=
 =?utf-8?B?R29IR3hBNWI5YUpGTlpRNHZweW9QWUFoZUlJWnh6VDdTU1dnbHYxTnBTQ2R4?=
 =?utf-8?B?Nm5KRERJMXlXUUg3ZUV3WjNHRHZHMVN3N0gwQThxRzdpUHhtUDJLWCthb2Fk?=
 =?utf-8?B?VVZBTzBWY2JpdFRRbDB5a0JIRXhzU0J2UGVZQ0J6SzFBZXl3OFUra1ptUUQz?=
 =?utf-8?B?YVhxZlJ4YXFvT08rYUlEbU95ZWtBeUtSbERJSzgzUkswTGRHTVVHbkxUK3Rr?=
 =?utf-8?B?NjNabHpnbzY2L0pGL0lOelZTQnpqZ0J5cUw2UnJVRkp0TXhKN0tSbVZSa2d2?=
 =?utf-8?B?VGVieUhXdVU1V0Y0azlTbWZZRFhQV0tYQWlhSEMrdG1nQmh1NzFQZUREWFVZ?=
 =?utf-8?B?ZFlkUk5VaDZ6dUsreHh6WjZ5ejBMLzVWQ2x0bVdFOUJFOEJjSFZQcENYSnJW?=
 =?utf-8?B?SzBHTStiTjRzUkl0YWFtbHdQRlZlVGI3d0RkNEdmUDQ1NGxnNzh5MTlUYmMz?=
 =?utf-8?B?YTRhdGYrMSs5K3FYcVJkZGw3YVB5UnlJUk01VlVISFZhVHNLSHR4MHBxRGxj?=
 =?utf-8?B?STF2RmM4MFJLTm9scUpuUGtLK210bUNwMjBXNThqUC9oQW8vZDhqcG5leE51?=
 =?utf-8?Q?nnZZ1d0w01EiyGYBe5UEoxAiS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ff0088-a4fa-48f1-f9a7-08db68cb082b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:22:22.9830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEwsycf3DDEuNRw9Du+4h/JNGPzUIe011QVdKPzytxRc+T7jsWIMCc4vZrVixL8/9J8cyoi4HsOrfGDShBLOIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8053

On 07.06.2023 17:06, Shawn Anastasio wrote:
> On typical Power VMs (e.g. QEMU's -M pseries), a variety of services
> are provided by OpenFirmware, including an early serial console.
> Implement the required interfaces to call into OpenFirmware and write
> to the serial console.
> 
> Since OpenFirmware runs in 32-bit Big Endian mode and Xen runs in
> 64-bit Little Endian mode, a thunk is required to save/restore
> any potentially-clobbered registers as well as to perform the
> required endianness switch. Thankfully, linux already has such
> a routine, which was imported into head.S.
> 
> Support for bare metal (PowerNV) will be implemented in a future
> patch.
> 
> Signed-off-by: Shawn Anastasio <shawnanastasio@raptorengineering.com>

Just a couple of nits:

>  xen/arch/ppc/Kconfig.debug               |   5 +
>  xen/arch/ppc/Makefile                    |   3 +-
>  xen/arch/ppc/boot_of.c                   | 122 +++++++++++++++++++++++
>  xen/arch/ppc/configs/openpower_defconfig |   1 +
>  xen/arch/ppc/early_printk.c              |  36 +++++++
>  xen/arch/ppc/include/asm/boot.h          |  31 ++++++
>  xen/arch/ppc/include/asm/bug.h           |   6 ++
>  xen/arch/ppc/include/asm/byteorder.h     |  74 ++++++++++++++
>  xen/arch/ppc/include/asm/cache.h         |   6 ++
>  xen/arch/ppc/include/asm/config.h        |   3 +
>  xen/arch/ppc/include/asm/early_printk.h  |  14 +++
>  xen/arch/ppc/include/asm/processor.h     |  54 +++++++++-
>  xen/arch/ppc/include/asm/string.h        |   6 ++
>  xen/arch/ppc/include/asm/types.h         |  64 ++++++++++++
>  xen/arch/ppc/ppc64/asm-offsets.c         |  55 ++++++++++
>  xen/arch/ppc/ppc64/head.S                |  59 +++++++++++
>  xen/arch/ppc/setup.c                     |  20 +++-
>  17 files changed, 555 insertions(+), 4 deletions(-)
>  create mode 100644 xen/arch/ppc/boot_of.c

Unless required, in new additions we tend to prefer dashes over
underscores. In filenames it is pretty rare that dashes really need
avoiding.

> --- a/xen/arch/ppc/Kconfig.debug
> +++ b/xen/arch/ppc/Kconfig.debug
> @@ -0,0 +1,5 @@
> +config EARLY_PRINTK
> +    bool "Enable early printk"
> +    default DEBUG
> +    help
> +      Enables early printk debug messages
> \ No newline at end of file

There are many examples of this throughout the patch, which you want to
take care of.

> --- /dev/null
> +++ b/xen/arch/ppc/boot_of.c
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */

By default we mean to use ...

> --- /dev/null
> +++ b/xen/arch/ppc/early_printk.c
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

... the more modern form of this (GPL-2.0-only). Anything deviating from
that may want justifying in the description.

Jan

