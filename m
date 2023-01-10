Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1969E66456E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 16:58:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474799.736159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFH0b-0005lp-KW; Tue, 10 Jan 2023 15:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474799.736159; Tue, 10 Jan 2023 15:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFH0b-0005jI-Hg; Tue, 10 Jan 2023 15:57:53 +0000
Received: by outflank-mailman (input) for mailman id 474799;
 Tue, 10 Jan 2023 15:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFH0a-0005jC-4R
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 15:57:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2042.outbound.protection.outlook.com [40.107.6.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88c1b9a9-90ff-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 16:57:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8147.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 15:57:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 15:57:49 +0000
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
X-Inumbo-ID: 88c1b9a9-90ff-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dq1wicav9BQVE8MDHlBgk+XxmNZ+eu75xmWxHjw3bqat/FgSb771DBkZLItnHYfUHZ9MRZO137dkqBggJUtswsJmpYqHkEhv53LIcjrvtB2ReIGeXr35OHSEIzOtHjQbGoeDOInCO8KY6mrnurmZsJDs+qFNxJPPaQj4qUAe47zwubG3sakqOCP0qmHFBQGOxQIDQETArHmbR5jjjxkXORCNw79f4F3cBVog62M8BtzmpGVjuiUi4yEMsSg9MPQ6uB15l6JC02NTFggoWaYPuy7qMB8pa5hvL5hW7TDhrIC+cDNd4+I59q7r21q8Zy6M4o0kEoabHGPb8GzH+yFozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaQPbytk+9sWancaNFfbsyIA0wu03ZervPJ+QZzmKQY=;
 b=EdKxGGJ1aKpQEhepsQ1+TNtPvyvjXpr96wk4uSRxYVYFpLKIVa2yMymmrwYilTev996+608phBAqa4Vyfz/OfJPBwmZ+2lV7ULLoM6EA6u8SgVYSUvq0CNDrWMt4Hz9YCfkhtMwQkc9qmfqCfsssmazauSeYabLOQ/SXLPYTRhTL8XlNVu+dZT902dxHaommDRHbQMDwqawC9/8Z9Nis4tHTmEP8rt9tJ0ObMdQrnE1yH7Eh/v5joet0gdpP1MJ4cge0gxM9Hh/BXRNPPjOk0fnjLH7Bw4f03NoQRrEIFWfGcInac80E5ibA6GC6ttJS99IVAIzHxtEGbUVELk6nJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaQPbytk+9sWancaNFfbsyIA0wu03ZervPJ+QZzmKQY=;
 b=oVA2rLnhOHIuZj+yj+XGluUOKZPtNAwDb/j1iCRmKAFt64DUMAKDtx82igfwW09VrIsNFyzEBsogiiqFa2FBllnlvjgVRKrCzsbElJJJloPtf+G0q++9G7gjtBZ5Mo5WpcEK5fVG+fy0k6O2lAAyFzSVoE60FNDvaBhEpaTnYJBuJUeAVWotzGE7Zk/6dD2zqRgqehNHiyOUAOn3FfhEE4PctH2o3ui2cXrAIeXSrgTogiP0x2g+1kWqHPZuHU1kuxkOe0dlhz9NtH4Q0FRzBx3drI7H+hNMryST9YdhQ3+BsOc/kr1PV9EhS1BCJsHC+rReW+RzhE/sg/nxVlzXhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2420503a-48d3-f975-beea-7e37e4ecd04a@suse.com>
Date: Tue, 10 Jan 2023 16:57:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/6] xen/riscv: introduce early_printk basic stuff
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
 <25cd3586fa51980279f25a82eed5ded1622bc212.1673362493.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <25cd3586fa51980279f25a82eed5ded1622bc212.1673362493.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ef407a-9da6-423a-7c6d-08daf3236be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WOPOGoK+8yPcRUxCc2IoUZA5ghrOoK2EK7kbsdyGiyyjuWXBSel1Kiz8ApN6G0d1bGBCNBCbExKAhdAfhdLc/25OxEGUp6+OC/frMkQ02vM+wvF8XTHKQZHV3iaWmm/M96CwTmPVPHpVL8T8e4OCLbXL1ILkQTIUm4XGsN7eTtaXOKpVOD/tkOmXWItqvaZPd2NUFSeCUUy9uhqg8IdDp84BxZwtywpR96o5dFdAXwiiXqLLvdE1HYL44x3sZMAp4xeNG06bNmyEBir6C2uNOuPBBbRKuzLWyFJ6jHdRYgMTIMfCElj7Bp33O4JfqPFu8nrWGvjEcSCtBshcsAkA0ZZOE9mytIg7Tcm3j3EtAPa2HjRBD2lmsftWmDe1C1EHBAxiYyzpKdGaWsea7Jj9yTTteGXYl+R9msC/k+jBmIeAXiKicazxLYYtjo701r4iQr85id3Z4T7i++QIdSwgisTlNElRwFglOTHCA8PPNsxxZrGWD7B9GcIiNZ4h2dsZsjzUhj6SnguUM4ak5CqkDToDB3q1tF4WuvAM3I1X9DCSQ+yuw/aUlfHqR3xMVNqLawBgPqAQKV981EYJzqAlOGp3+FOx5quRq+iVVX3UrEvaomxMwuYioP4Cyyhc7rtQU3DKkJZdFW63kEuLOGCD5Zv8OAWBLxMJrDo7Rfgl78sogQJIip41MOyiTNmtGM0/R3FxvN9zonS/KUproDxlhq8VRM1cJBMH/g9Eih287gQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(7416002)(4326008)(316002)(6916009)(8676002)(66556008)(66476007)(66946007)(54906003)(26005)(6512007)(2616005)(38100700002)(31686004)(86362001)(186003)(31696002)(36756003)(53546011)(478600001)(6506007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnMzQnJaNTRUcWlPVHozbUw0VFdJS1ZBSFRjVmNpN2w0VFhTZWdIeVZJWnQv?=
 =?utf-8?B?UVBXcmlLNXVya3VoT2tvbEpQaGVvTHVqUjYyRDFhZEI0bmZIeHhYRE8xYjFn?=
 =?utf-8?B?R0Y4SFBqK3BNRHltMHcrMUhDMERjZERwUzNtY1IzcGxnbzRUci85NkVneXpm?=
 =?utf-8?B?V0oxL1ErbXU5eFBpWnVCMUVGZGpHMlJaSnpJSmY2cEQ1d01YWkdFZ0lBckFX?=
 =?utf-8?B?R0llbytnT1J0cGFKM3l1N1VWZzJTOGgwWGpobFIwZ2kwSnZrTHFnUnIzZlkz?=
 =?utf-8?B?dFd2YjdjZ1hOWHA4UGVPNUJvaE9aZEduVldQNmRnYi9scC9rd0dyVUtIMmE4?=
 =?utf-8?B?Mk5nWlhCOGdGSEZYbUwydGhxMVlPcUE0Q1RiZXdxaGEwWHRrN25TMVVsKzBo?=
 =?utf-8?B?bEdKMW9xWkJhV28yMFY3cUhmL1JhdkpVY0xWWm9nUkRjWFRhaUdjc091N1hj?=
 =?utf-8?B?Mkt5N1ZIT0hOZ004eDhXR1QzUFFUSi9KWlpZdTlPQVhHZkZST3pWbVU2aUo2?=
 =?utf-8?B?YWd0RE51VU50ckhUK29VcFNTbnFIeER3ZjhUZEh2Nk9zWHk0SHlKWmZFbnc5?=
 =?utf-8?B?Nm4rWjgxUFpaWjFBNXAxVm1UMEtDTnpOSGNxWUNueGZFWWw0NVpYZllobW5w?=
 =?utf-8?B?K1dNdTdZYTZ1TnZ0YVJhekRKbk1sQ0pVdTZDRXgvdm5Celovem93cG9pM3BO?=
 =?utf-8?B?TG4vVldHZlg1VXJFZGVIMHJIcERLNEJhby9NMlVvMVE1eWtWbHZpTkdKZUd4?=
 =?utf-8?B?d29sblg1Um5yMFJ5SmxPMnJhMHhvSlhsWUttMnRGYXR6amM2S2VhZlpkRXJC?=
 =?utf-8?B?bG9ZanhYclFQcDFRU0pHUE9ML1RIcGxmYlE4N3h4S2ZsditMeHNUcWZFa1Na?=
 =?utf-8?B?ZjRLaGVoaGEwZ0MzcUVkK0VJK0pDNWx1QStCVjhJUzRFK08xanhoZVJMUkVO?=
 =?utf-8?B?RWVHVGwvUVdlSnpNVXNHMk12bGZNMlFNb3M5NGtyNmllMnRNMEFidVF5ektX?=
 =?utf-8?B?ZnFQYWNYYlpiQzc3NTR3VWJIYkNnZ3Q5dmZ1Uzc0eTJXKzBQYnVQTWNMcUhv?=
 =?utf-8?B?VUZiNHQ0ZWFGM2QxVUZrSDBFWmVpa1pLSHo5VStOOUkxOXMzZzZ2VjE0d0dw?=
 =?utf-8?B?OUczOTJDNUgyYVNlc2ZTUHZoYXFSc1krMkVCNUJPQnpUcHJIK2JBcEp5RTRM?=
 =?utf-8?B?WUR5MXFhZUpPdTA4N2ZkN3hSUXlkN0FoYXhuMnA5VndtVG5UdWVIWGV0UHpK?=
 =?utf-8?B?dlpjbHI4cmRrMk1YTmFtOEYzY3BIMy9OMm5rNE1EWW9RZTJsN1ZFRVRidEdy?=
 =?utf-8?B?L09ReDMxZU9uc045L2RPODNLdzVML1dwMGVnTkNTTExzWlhkSzUzQjdnZTlX?=
 =?utf-8?B?eTE0Ui9lQ3N6b2pIZU9sTUpCTlJlTG5FUWdKTjlQTExJcVVPS0E4TDFqSWZn?=
 =?utf-8?B?YUVSM1VEcUExK3k0VE81WjFtbzk4VFlYSVh6dGpTdmZjSXNBenZoQ2NvNVNy?=
 =?utf-8?B?SjFFdmhKc0pGaWxpYzZzWkhCNjBWYXJCR0t3cFVjdVdSTnFxUFA4UE51K3pO?=
 =?utf-8?B?RVU4YUFLSnlrUHoxYVdEWm4weDFmdUJtaHNBNVo0K1g5ZjY2bFpaaUcycXNp?=
 =?utf-8?B?WWRVYTFUc0Z5dGl6dFhhejIvRktFa0xhWGNzRy8ybmI1RjVxamU1eUZBYkNa?=
 =?utf-8?B?VnFUK0g3NDRCbjlGNFY3a3kvTzR6RjZpSVBWc1E5R0JPbGg2WElJQll2Ui9U?=
 =?utf-8?B?QmF6U0srdENkOVNKYURac1N1emVvNDlNbGp6dGJ0cklvNVlwQVhaeEhSSjVH?=
 =?utf-8?B?WTY2WElIeGVVc0hheDZhTDgxbmpVRy9CQ0YvVGNwNDNKZEFnVnc4WDIzTjlt?=
 =?utf-8?B?azFTNmwvMFdxU1Jza3FhdVhQa1Q5dUsvU2M3Ukp1ZVRDd1k0RXd2bTF1dzJq?=
 =?utf-8?B?TDI0UjRFOEdqWXlxS3duMFhyL0lWQVFEb04xZ3dHUkozUVk5dWs5STVQUlR0?=
 =?utf-8?B?LzA5OVdXOHJ3R1ErSzRkV1F6MkhnR29nZ1RRVmRwN1A3S0RwaC8xNEZXdk5u?=
 =?utf-8?B?U05nQmxvTzJ6QzB6Q0JMcXpFWENjMWhCU1pWMkgwYmxZdkdxOE03VTN3YzY3?=
 =?utf-8?Q?0e6TNHFTY/ILhMJ/4nhgryQGd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ef407a-9da6-423a-7c6d-08daf3236be5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 15:57:49.0484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrSlNZrl38slOoNVqoKRr67fwLjtL0onONaMsS7rwIjc29p3D2RZ+zAQGJWwWMkEDUNvy+NARnzYA2H8OWROhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8147

On 10.01.2023 16:17, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/Kconfig.debug
> +++ b/xen/arch/riscv/Kconfig.debug
> @@ -0,0 +1,7 @@
> +config EARLY_PRINTK
> +    bool "Enable early printk"
> +    default DEBUG
> +    depends on RISCV_64 || RISCV_32

You're in a RISC-V-specific Kconfig - do you really need this line?

> --- /dev/null
> +++ b/xen/arch/riscv/early_printk.c
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RISC-V early printk using SBI
> + *
> + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
> + */
> +#include <asm/early_printk.h>
> +#include <asm/sbi.h>
> +
> +/*
> + * TODO:
> + *   sbi_console_putchar is already planned for deprecation
> + *   so it should be reworked to use UART directly.
> +*/
> +void early_puts(const char *s, size_t nr)
> +{
> +    while ( nr-- > 0 )
> +    {
> +        if (*s == '\n')

Nit (style): Missing blanks.

> +            sbi_console_putchar('\r');
> +        sbi_console_putchar(*s);
> +        s++;
> +    }
> +}
> +
> +void early_printk(const char *str)
> +{
> +    while (*str)

Again.

> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -1,12 +1,16 @@
>  #include <xen/compile.h>
>  #include <xen/init.h>
>  
> +#include <asm/early_printk.h>
> +
>  /* Xen stack for bringing up the first CPU. */
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>  
>  void __init noreturn start_xen(void)
>  {
> +    early_printk("Hello from C env\n");
> +
>      for ( ;; )
>          asm volatile ("wfi");

While this is only context here, it affects an earlier patch in the
series; this wants to be

    for ( ; ; )
        asm volatile ( "wfi" );

Jan

