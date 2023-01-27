Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A45CF67E82D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485687.753086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPeg-0005PD-4c; Fri, 27 Jan 2023 14:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485687.753086; Fri, 27 Jan 2023 14:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPeg-0005Ma-1P; Fri, 27 Jan 2023 14:24:38 +0000
Received: by outflank-mailman (input) for mailman id 485687;
 Fri, 27 Jan 2023 14:24:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N8iV=5Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pLPef-0005MU-C5
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 14:24:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 529cfffc-9e4e-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 15:24:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Fri, 27 Jan
 2023 14:24:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 14:24:33 +0000
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
X-Inumbo-ID: 529cfffc-9e4e-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQHxNsirJRnehuXKWFevR+NK6n5/k72LKj2Yf08a6oeUSjl/7PzukefwqD7Wh6S2U/nG8muepY51Ce3fSfbh7+iUzEqol0m23E0u6Lx/GbLZq4vll7087ljBlQSqghAavEOMML1nvvG1UNDWCYBKKNZRLtw/eNkE4+MVqfZOopSpMFiwP2MJo7UA0OSdLki8TrTdspLRkPqsNertFfq/enI/O02hPk56mONHSCSqvyoWpjw4YL/pfUdSnQs1lv6k5A3YkFG2VnY5GDgmsKPexEFbt3beyQDWezQClNOolF19oZ99hhto8ctx2zZoTH86Ft6U2YPY6IjA4N645EZQcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39S+I3MneBJhbeyryLlr5sj2mu3nP26wl0wNCoY0Ho8=;
 b=oKYQYcQGiKfCBv9aAjr3yDttxGHODFvkKX6HGPz31/mwQZNHNufUKhC8E21WdDKpkZosXkZrRNHigind9LhVrDSWh/0Jrn/46qAHY8jXM6zIgCx1om58Y5AqRkUOInCVuPdPdUJj/8zcMxUR+b8yl4GIQ3qwM5CYLw8mFWJooVuvwkp8eDluxVGPxYNLwbN/s9OxD5S8s1oMdRtKWMwX94JGPYNLCpogE4h3IkXH1frL8WxEaNdkm4lJJZFDqrb2KS4ObZBb4W7B6JNOAnZYx9BZHdcXxy+RrDUXNrZnOW+bHX87a5qkMKikDQSZA4kR+v9suJAJQVqD40S/PKq37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39S+I3MneBJhbeyryLlr5sj2mu3nP26wl0wNCoY0Ho8=;
 b=CtX6ZwAaKWuiIqJ2GEEYhbX9pFxvZxvHpMt+X0jSo88dkFNvUBVHXXXxhmzSt1ziwrqaSanFVeRxY4KwaxfC+DQkQ4YWCzC5eICLDt0jdg3mhZr1Blw1FDqMIY3+AO+EzxMSe3GWUvFi2S3C9vNkJ655nSMCS2nXpiQsFieByhtNFrFgzVUfblwSo+lmt8mCyFze880WKQDtkUfXpIzJ/MsEK1IqjZPkj/+yREg6lyHci/cUdqpI1H00fXuRHhnJ3Hb5GTpnkL2C/9jNPu8fnajNGmMyiU+6kZpUQgcYYDXqzEITVra5KoYPuxae1IahsXrrOSyRfSd/VSblLDynmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75328420-0fbd-92ae-40c7-9fee1c31c907@suse.com>
Date: Fri, 27 Jan 2023 15:24:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/14] xen/riscv: introduce exception context
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b38790-628a-4d16-3b33-08db00723594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sUInzmr7pLV8gb+oksUH7xykZ8Vzi7Cdj8K87SYJeWMY6ltWbdL35qNt/fzovw7VfVDWigI5ZevXticbCkt79ccK6IdEl9925dnRi7ApxIZv+cWcJeDcDgrgUuEWcmfBS9F6pZyMmLMPIkGK52GFodbZNu2kztzCK4BLlLMojdQ/IMDLXALvxwXhAbKIgp/KBSYpKuq9pF+knxewYuoQUCrPFM3T4e8jo5nB4/faWPeM2xVQ3WRMa9WutHO4s49hv/q/0arlsSxyjwQD9FhdEbHuc6dAdprQAE3+l8GlHxHkUoqod6PITga0sOIBYUhMqpfat1ssWpiaMRhRi7rOHKZKhA5VcAEraP9WBMxqQF0qKJ87CuMuXlqJ62TutY4zTUeujHGz8awk4yCHXsQqhIXskegomYa6L2eQJs34bCu/VCgybaaXnDnUN2cuSWQ/IWfaXwVlOhClJax3D5/Ry4cG+97KQ4Vn6GjQ0mtXdTmiOtb4Ima3vU0cdChagxndcWBD9yol4K3r2g6AbJ4TUIJyAx0LQsiKMgfzLiN4hdGb5qb5kbwLxxpVODxZcyMEPThnjIRrg0JE/aY1zfezreBCAKX4Cme7q/4EkwMEwOwNJa32nVwqleXohMAylMCzYMIM+92J9JrMwb2pSbJVNg0qhKVfc6BGbN7bLgUs1GGIpdiIVrV9beT8oGzNzFQaJpKL6Kw4PdoY62LAVyowoRSaVR8CrS1OyD9f5Yg+LKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199018)(316002)(54906003)(36756003)(2616005)(66946007)(38100700002)(6916009)(6512007)(4326008)(186003)(8676002)(478600001)(66556008)(26005)(86362001)(66476007)(53546011)(31696002)(6486002)(6506007)(31686004)(7416002)(2906002)(8936002)(41300700001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVp4dTBpeXJXbGs3Y1JVNnBGR2gxR3FiQVdlZlhzby9TMk44YnVTdGZzZURO?=
 =?utf-8?B?UUd2YlV5Nzk2MzRWREtxRUw2Y1NvZ1RCVThUOFdzclpOWWtVQUJNSFNCdlZC?=
 =?utf-8?B?SkZhYmtDandlSDk0MFJTZzFtYVlPcEtnSDZxTVM2Q0NPazdzaGNNVWlUMElJ?=
 =?utf-8?B?clZ6OXduNTl5M3JEYVJmZ3VwM21qdnB6cDcvYmoyTnZFMC9UY0dpK2lnR3Ni?=
 =?utf-8?B?Q0NRT1V0dHluNWJnU2dnS0RzUnBPSU9aQW00OFFmaDNuTnh1YnZYS3BJS3JM?=
 =?utf-8?B?Z2JkOGdjSEh5WE9yTjRGTnhUMHY2TFA0bHRnUTNTQm9lTlNYeWhNRUtxcGM4?=
 =?utf-8?B?RUhRck1DVC9yVVZRdkpScUpkUGtjTERzeWZiK3V4S3lPU3crR00wT0libUpa?=
 =?utf-8?B?elV2RmFSWXVuUm5mSnI2Y1MxZDlnQ3pLcjRDMm9xallGdVNKZEhPUC9MczN1?=
 =?utf-8?B?UFNlSEVEcXNVVmh1UWRGMHJOZWxhTnlTNWh0dmdhOG9XeXdrcXBBMzJOeVNm?=
 =?utf-8?B?Q2M2d0FRSmxFS01SVEVRb0lYTjZNK3hpRjlGclZ5OW4wNzJ3UGpCdlVjQzdB?=
 =?utf-8?B?eDJpMS9yeER0eFRJakpFc3puaVNQSy9zSVV4VWdxbnAybmZQaWpBaXgzSnQv?=
 =?utf-8?B?cEgrR3dEZU5RSGN1eGloamtEWjN0ckZ6dkk1enhlRW95bEpnNHA0NmpJNUww?=
 =?utf-8?B?cUpHNVJQeEs4RlF1SVNwbyt2VmlHOThSYWROVnlTenE5TnRuSVNUOFJRaVBq?=
 =?utf-8?B?U2M0RExZdTcxUS92eTRYazFVWWhlTnlQSld6NnBhdG0rT2d0Kyt1VUNpS1Ba?=
 =?utf-8?B?TDRtbmJSU3BLcDVZY2E5N0ErM3Vzbml0K3V3dHBWT0F0QzVOSFNaU0tMSWZk?=
 =?utf-8?B?ZWtrRFJpMU1PZVM1d21CekY1ZzkyTXQ5QXZ4L3dHZW4yckdHd01qQU5FM0xH?=
 =?utf-8?B?VXNLcEdQMDhnQ3lQZXVxUVJoTDVNU1RQYktMMG5ZQnQ1V3NIWG1xUjNtSmlk?=
 =?utf-8?B?TEo1R0t6djVWeFBHNW5hbzkvLzRsN09Lb01iclkwTzFyZVVmTmdYNVRyTFZO?=
 =?utf-8?B?ZVhza2pvKzNORUF1akR1aHNqUkJlcVNYZ2ROM0ZIRk1nbFdtaERQcS8wTlZE?=
 =?utf-8?B?TFFqUmlCd0NLeXZZd1VmclFzMFJIVVhBR09laU9hcW8xZlhLazNjWG9XWjQ4?=
 =?utf-8?B?VExRNjR6WHZZbElDY1dVcXY4bGt6cjFhWU1rbDExUk9mQW5kZmRXaXFyYzJP?=
 =?utf-8?B?b3NMeU5FbDJobVhXNE96Rm9CdWw0MFdNMXNzWkdHc2UrU1lBT2xpZzd1ZWYr?=
 =?utf-8?B?eDVFaWM4SWNMZGVGZ3pCNEhLU1VsckFBRmxFQXhmSkxYTjhSRDBGbllONDdI?=
 =?utf-8?B?ZkMwamczdml1WldDeTNvcnM2eTB2Q1BUMDBYN1VkTG9SZ1J1MTlRVmw1b1dQ?=
 =?utf-8?B?bHRSKzBIZHQvM2h3ZzZ5aHp1VU1VaTA0bGtKV25QdlhCMXVxenJ2citiMUh1?=
 =?utf-8?B?Y2NjMDdBUVp1NEpXUnJaM3RqdnZ2MzkzSXJ6SFZGekh5SWpXTWJGTkc4WFF1?=
 =?utf-8?B?TXE5Q0x4T3U4V3NGMUVZdUFTRTdjcmZkVXFhY2FRM1JscVQ5aTJUZ0FXUU9F?=
 =?utf-8?B?UXRldWVRR1FXaVdkV1M5czB6UlpTRXJMVE50TEY4REluOEp3YkFxWC9CR01h?=
 =?utf-8?B?WnY1dzBGenJqR0JzcDJKZll3NVBwRXJ3eFBtd1RQMjNtSE5RWXE4M2lmdkZC?=
 =?utf-8?B?Rld5cEgzeDlXZGZ3YStZdm1wWlplTlVGek9nY1o3QURWQWhpRWNXRmVRMHph?=
 =?utf-8?B?Zi93a1dURlk2SisyeU9kY2dXSU10UHRBN0ZrM21oTzkwNEoySGkvL2RnbG54?=
 =?utf-8?B?ZnNvd1RHb0dBTzQwbEVZL1oxZE0yWDc3cWpEWVFDNDZEY1JTdUZzeU9POWh1?=
 =?utf-8?B?VUp0NzVTc0JyTzNsTThyNDhpTDhWR3BseWFCd1VGbUZVSlYzaTlQUkFjRUla?=
 =?utf-8?B?dXRva0RRYzBDZkM1Y0RvT1NTQ3R0emZCMHlJZlNza2pkWEFHMTdJNnk3cjBs?=
 =?utf-8?B?QWhLM0RzSEwyY3ZWVW1KMW95cWVKalFsMnlaZ0NXV2ROUiswbStjbE1nMGg3?=
 =?utf-8?Q?tXleW01mntpO5s8Y+F/7noem0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b38790-628a-4d16-3b33-08db00723594
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 14:24:32.9798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzowZ6itbaRxukYLiIJlB8e0vBzFzD8ZxUsaENqbl4P4Q3M69A3OchUfBHS2t9fjsWhYOpwE3cXWLPuj0AO8RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9176

On 27.01.2023 14:59, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: MIT */
> +/******************************************************************************
> + *
> + * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
> + * Copyright 2021 (C) Bobby Eshleman <bobby.eshleman@gmail.com>
> + * Copyright 2023 (C) Vates
> + *
> + */
> +
> +#ifndef _ASM_RISCV_PROCESSOR_H
> +#define _ASM_RISCV_PROCESSOR_H
> +
> +#ifndef __ASSEMBLY__
> +
> +/* On stack VCPU state */
> +struct cpu_user_regs
> +{
> +    unsigned long zero;
> +    unsigned long ra;
> +    unsigned long sp;
> +    unsigned long gp;
> +    unsigned long tp;
> +    unsigned long t0;
> +    unsigned long t1;
> +    unsigned long t2;
> +    unsigned long s0;
> +    unsigned long s1;
> +    unsigned long a0;
> +    unsigned long a1;
> +    unsigned long a2;
> +    unsigned long a3;
> +    unsigned long a4;
> +    unsigned long a5;
> +    unsigned long a6;
> +    unsigned long a7;
> +    unsigned long s2;
> +    unsigned long s3;
> +    unsigned long s4;
> +    unsigned long s5;
> +    unsigned long s6;
> +    unsigned long s7;
> +    unsigned long s8;
> +    unsigned long s9;
> +    unsigned long s10;
> +    unsigned long s11;
> +    unsigned long t3;
> +    unsigned long t4;
> +    unsigned long t5;
> +    unsigned long t6;
> +    unsigned long sepc;
> +    unsigned long sstatus;
> +    /* pointer to previous stack_cpu_regs */
> +    unsigned long pregs;
> +};

Just to restate what I said on the earlier version: We have a struct of
this name in the public interface for x86. Besides to confusion about
re-using the name for something private, I'd still like to understand
what the public interface plans are. This is specifically because I
think it would be better to re-use suitable public interface structs
internally where possible. But that of course requires spelling out
such parts of the public interface first.

Jan

