Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E72FA202CC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 02:01:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878255.1288424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcZyg-0003Y0-BL; Tue, 28 Jan 2025 01:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878255.1288424; Tue, 28 Jan 2025 01:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcZyg-0003SZ-8O; Tue, 28 Jan 2025 01:01:18 +0000
Received: by outflank-mailman (input) for mailman id 878255;
 Tue, 28 Jan 2025 01:01:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LT9m=UU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tcZyf-0002vW-9M
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 01:01:17 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2414::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f8f2f52-dd13-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 02:01:15 +0100 (CET)
Received: from DS7PR03CA0224.namprd03.prod.outlook.com (2603:10b6:5:3ba::19)
 by DS7PR12MB8292.namprd12.prod.outlook.com (2603:10b6:8:e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 01:01:08 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:3ba:cafe::10) by DS7PR03CA0224.outlook.office365.com
 (2603:10b6:5:3ba::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.23 via Frontend Transport; Tue,
 28 Jan 2025 01:01:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 01:01:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 19:01:07 -0600
Received: from [172.25.15.116] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 27 Jan 2025 19:01:06 -0600
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
X-Inumbo-ID: 5f8f2f52-dd13-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmbF3FlH7x9HNWP3YYHbwDpsSBiNqAhuou51GAztEEePO5GWBztp7Ql+G8tbVvgEg4zL7djFE7/Dd5c71WrzMa+cpS2jWfehYn88ukl2z6obcg6Hmd737zFxegHtY0y2EX7o7W7eS02qihPtD0kRzABFYz7+T6IFhU0rv998Lpn90iFuocJYwhC37geAl1C3ZYIxOQMbQrw79v9I6qu9x8obN7EH20IA2yqOBVTyHFH161GlPQz+WLpU8VQFRke5CH8cnNqpIFFeVIMl7+RRoyobutRk54iz7xy+rEu+u3PoRBWbsa2goHf4fux/DDkXjS8lUMsxGj4rRvcQTC4RlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwRU4nxk5uvPUHcrM/kNF4IzdzGLXo7Ym7SK0HWhYmM=;
 b=yAOsnDqH14NkzcHO4w4994E8kLdIsjyMaMU5X876aD2W/dNkZ6PQ1Cync6hRwGV/SIw6gPcTbpPOSP81gQGRUEAv8ISyCWD0JsUBCwKhzJ3aGtQQ/K0PFKG+olYGe3cfAJepeNs2zCMzHB7LlkqdduAxwuRmonojx6Cf5Gbmnsy7P2h7J6vAwLVEN+AOskt1uY9+mBatHKjaR6UlRCLuNKa5LPHGTlCBAsvgyteO7yyOMhqOKKR89PTENuvsg98KlQOPYZsrRLDzzWmD2Att+wlS8gCdcco09dBs4AfGL6NlqF3spEPO9gOADL25b10f31qo6Yn9J97xre7+6efZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwRU4nxk5uvPUHcrM/kNF4IzdzGLXo7Ym7SK0HWhYmM=;
 b=lOpBJXV2O7VqpRQBnmd5o0fvwNg3qc6/vCJhMmFhdP2CUvlZqBCYD/iav00xrjjGA9vIMU3VBbBj9XxbrSBlEB8qO9t7r3fTNX0UbxvS+/OkzDjoMfW70IBjpD5LQetPYZSSWgKSJIorcgc+HsS/6tx3dOWATkSjjGnwVRFO0rg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a49b67b2-87ff-49c6-a319-bb9b33ae8f04@amd.com>
Date: Mon, 27 Jan 2025 19:25:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/24] xen/console: introduce framework for UART
 emulators
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-7-c5d36b31d66c@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-7-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|DS7PR12MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: d0718031-caf3-42f6-febb-08dd3f373ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekJPcVlheUlGYTVWU1B4ZDhjQ3hPUTlTWTEyTldEbEpFbit0Sy9Lck1SNDly?=
 =?utf-8?B?b2RoalRydzZzemtRNmxjUlRhZDJpVjdZOGQ1OGduZUhCT0ZyZ25mS0ZGRllT?=
 =?utf-8?B?ZzdMaDl0dmRRb2FOcysxaGhHc1NaaE5TR1ZaRHlpTVVURDluSFdVODFLdGMx?=
 =?utf-8?B?ZVI2T1F4S0UzVTZFa0FSYXMvNVNaSTFxTkdkcWoxdEUvMHZrbUVaaXVHczRR?=
 =?utf-8?B?Vmo4aXMrV3l6WjkxZHBsNEhuSG96eGhZSzYveVMyRXlXeCtMc2tqakRlaDJN?=
 =?utf-8?B?NFZpVVkranpCbkxncXBWaDAwQm9hdmdUbVMzTFlUYkI0R1dwNVNDTjZuVllr?=
 =?utf-8?B?dnhtbUJUM3hqYmlXQWp0MmhBcUxaNnNXZ0tWZENXeWdnRnVoN2JUMGQ3NHZK?=
 =?utf-8?B?Wk55SDFGRXMvMURXOENsbnNleWxva2syWm1VQkN0UjV2ejYrZExkQzB2eG1H?=
 =?utf-8?B?cWIyWWtXUnJ3ZmxJZVVhUVlHUFZjTlBlSUhpUlIyeGZ2dEtGd0dCOVhleU12?=
 =?utf-8?B?UUsya0pjdUZBTFF2WGJEWlNpOEFLOEVRZTM2YWxJR1pGK3JTODVDVHZNT2JV?=
 =?utf-8?B?dkxhQ0xVZGJOSFNRckFEdUQwRFFJdmpUV2hFTmV4SHhJTDVrVjdJM045bGEr?=
 =?utf-8?B?cWRhUzZ6Q3VMeFJ1OTJjSUV6M0pkWDlBL2tCTDUyYnJXSmU1cDZlZE1pZEVo?=
 =?utf-8?B?VWUycnU5NWJ5Yno4YUQ1S3JwSmRNMGdZeWRuT2NGQWVlVGxRRit6SHcrckdj?=
 =?utf-8?B?V1VOa05IbFJ1cmF0NHB4eEpoN3VEcS94T0dLaXRUS3dSWVJNZ2c3UWNRWGIz?=
 =?utf-8?B?MTg3YzNwaGhPc3prTFM3OUN4aXVNSlZqLzlGZmdxUDFEbzE0cnRUQmg0cmI1?=
 =?utf-8?B?dHUvL2tUTHVQa3YxYVhicVFaV3liaXNkWU10WEl0by9ZY0FPRnJnVHEralZC?=
 =?utf-8?B?Z01VWTBzazVucmZRcTNGU1BuaHhzOG0yOXlsMHpPQ25GRHpraEhoWnd4aGM1?=
 =?utf-8?B?L0Nuc2JFVTRMY3ppWjhGOXRLUzNseUpqQVFBUEo4Wnp4MXV2SWdRa2puZFdz?=
 =?utf-8?B?MWdGa0k4WFp5MnFEQTZQdGRLd1ppTjRRbmxHNnQ0eGtrUWJZdCthZXEzRWZX?=
 =?utf-8?B?azZvQjhqTUdlSzc4VUR2SForcnVBQU5TdUlZY0wzSzR1OXhEL1lpK1l0cHpy?=
 =?utf-8?B?d0MrUnY3M3pvay9FYUNUbkNlVlkwNjBzbzZCaDNiQjFlNGFjYlVETVJ3RjM5?=
 =?utf-8?B?K1paeFM0cTNNRXkxdS9CVmgyaWVoTlNsWWhrWGp6QlRZeDhWTmd1YmlJTEJW?=
 =?utf-8?B?OXltdUdSYXdkNVZ0Q2RIdkJsU3puVkFvQ0x1bGlXejRwWWkvNThoclZqc1Jv?=
 =?utf-8?B?UUp1V3RRbGZoTlEwVmJNTmF5eGYyd2JKZ1AydFljbUNVOFNjVEFGcFNqUEtm?=
 =?utf-8?B?WEcvQUMrSGFBU0c4OXlyZk8rOUpQaEYvZUZ4S0RzYVN6VjI5U3F1eG15WFo4?=
 =?utf-8?B?MzFvbm5sY04vM1AyZ0hremg3SjloZlE4M1JGc3k2emYvTFZtM1dYVG9KTEdZ?=
 =?utf-8?B?czh3NVo3ZzJ2ZjRoQVZIQzNHRXRGaElMZVA3bDVZcW5zTVJwTnptdEpVZHE1?=
 =?utf-8?B?blVWT2M1QlR6b1dIYmFRUHJZYjM1c0Raem5NbG5uRVZrM2lyNUFwTDFqNzln?=
 =?utf-8?B?TmcvUVBlYkU3L0pqY21FNHp5UnZuZXlqMDRGRlNlbmxvdGQwc1dER0Q0U0sw?=
 =?utf-8?B?YzJjOEJhR0Z5d3VLaGNhSEhRRGlEK01tVHg0dDRQK2VmTUUzZEZFMjljMnk5?=
 =?utf-8?B?bEdGMHQxMUQzQnB6QlJnZzZoZWtkVytaZENyUFAwZklFS29TOHAwUUxhbmlk?=
 =?utf-8?B?N3FVWUxhR2NWOTZGOWlIV0ZqcGxtR1I4ZUxvL0lDOE5hbGF0QWNjZURBMHZP?=
 =?utf-8?B?VEw4Y1dxcmxUWE5pZGk1SVp2aENnWW52Zkc4OUNIS0h4d21CcFV2bnlUNjNi?=
 =?utf-8?Q?rtFr+wI2SI+8yHJG2YgLKVKugH4ynE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 01:01:08.4024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0718031-caf3-42f6-febb-08dd3f373ff2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8292

On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce a driver framework to abstract UART emulators in the hypervisor.
> 
> That allows for architecture-independent handling of virtual UARTs from Xen
> console driver and simplifies enabling new architecture-dependent UART
> emulators.
> 
> The framework is built under CONFIG_HAS_VUART, which is automatically enabled
> once the user selects a specific UART emulator.
> 
> All domains w/ enabled vUART will have VIRTDEV_UART bit set in
> d->arch.emulation_flags.
> 
> Current implementation supports maximum of one vUART per domain, excluding
> emulators for hardware domains.
> 
> Use domain_has_vuart() in Xen console driver code to check whether the
> domain can own the physical console focus.
> 
> Note, arm/vuart.c emulator is not hooked to virtdev-uart framework because the
> emulator is limited to the hardware domains only and was not designed to own
> the physical console input. Updated arm/vuart.c APIs to have 'hwdom_' prefix
> instead of generic 'domain_' to avoid possible confusion.

It might be good to renmae xen/arch/arm/vuart.c to 
xen/arch/arm/hwdom-vuart.c and then use just the shorter vuart prefix 
instead virtdev_uart.

> Signed-off-by: Denis Mukhin <dmukhin@ford.com>


> diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
> index 20050e9bb8b32bd16c2da76c2c3e0f68dab89394..355719c3af67683c153a4f7a35dad4944992846e 100644
> --- a/xen/drivers/Kconfig
> +++ b/xen/drivers/Kconfig
> @@ -19,4 +19,9 @@ config HAS_VPCI_GUEST_SUPPORT
>   	bool
>   	select HAS_VPCI
>   
> +config HAS_VUART
> +	bool "UART emulation framework"
> +	help
> +	  This selects UART emulation framework.

This can be hidden, so just:

config HAS_VUART
	bool

> +
>   endmenu

> +int virtdev_uart_init(struct domain *d, struct virtdev_uart_params *params)
> +{
> +    int rc;
> +
> +    ASSERT(__start_virtdev_uart);
> +
> +    rc = __start_virtdev_uart->init(d, params);
> +    if ( rc )
> +        return rc;
> +
> +#if !defined(__i386__) && !defined(__x86_64__)
> +    d->arch.emulation_flags |= VIRTDEV_UART;
> +#endif
> +
> +    return 0;
> +}
> +
> +void virtdev_uart_exit(struct domain *d)
> +{
> +    ASSERT(__start_virtdev_uart);
> +
> +    __start_virtdev_uart->exit(d);
> +
> +#if !defined(__i386__) && !defined(__x86_64__)
> +    d->arch.emulation_flags &= ~VIRTDEV_UART;
> +#endif

I think this is only called at domain teardown, so you don't need to 
clear flags.

> +}
> +
> +int virtdev_uart_putchar(struct domain *d, char c)
> +{
> +    ASSERT(__start_virtdev_uart);
> +    ASSERT(d->arch.emulation_flags & VIRTDEV_UART);
> +
> +    return __start_virtdev_uart->putchar(d, c);
> +}
> +
> +void virtdev_uart_dump(struct domain *d)
> +{
> +    ASSERT(__start_virtdev_uart);
> +
> +    __start_virtdev_uart->dump(d);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

> diff --git a/xen/include/xen/virtdev-uart.h b/xen/include/xen/virtdev-uart.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..fbe48e513996404d793d011747b3f40c236a6a57
> --- /dev/null
> +++ b/xen/include/xen/virtdev-uart.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN__VIRTDEV_UART_H
> +#define XEN__VIRTDEV_UART_H
> +
> +#include <public/xen.h>
> +#include <public/event_channel.h>
> +#include <xen/types.h>
> +
> +struct virtdev_uart_params {
> +    domid_t console_domid;
> +    gfn_t gfn;
> +    evtchn_port_t evtchn;
> +};
> +
> +struct virtdev_uart {
> +    int (*putchar)(struct domain *d, char c);
> +    int (*init)(struct domain *d, struct virtdev_uart_params *params);
> +    void (*exit)(struct domain *d);
> +    void (*dump)(struct domain *d);
> +};
> +
> +#define VIRTDEV_UART_REGISTER(x) \
> +    static const struct virtdev_uart *x##_entry \
> +           __used_section(".data.virtdev.uart") = \
> +    &(const struct virtdev_uart){ \
> +        .init    = x ## _init, \
> +        .exit    = x ## _exit, \
> +        .dump    = x ## _dump, \
> +        .putchar = x ## _putchar, \
> +    }

Are multiple types of uarts for a given architecture expected?  If only 
a single implemention is needed per-architecture, using defines or 
wrappers seems simpler to me.

Regards,
Jason

