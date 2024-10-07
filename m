Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E26993582
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 19:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812267.1225004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxrzY-0001RC-94; Mon, 07 Oct 2024 17:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812267.1225004; Mon, 07 Oct 2024 17:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxrzY-0001P7-5V; Mon, 07 Oct 2024 17:57:56 +0000
Received: by outflank-mailman (input) for mailman id 812267;
 Mon, 07 Oct 2024 17:57:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxrzX-0001P1-66
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 17:57:55 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2412::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab927884-84d5-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 19:57:52 +0200 (CEST)
Received: from BYAPR08CA0013.namprd08.prod.outlook.com (2603:10b6:a03:100::26)
 by PH0PR12MB7885.namprd12.prod.outlook.com (2603:10b6:510:28f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 17:57:48 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::20) by BYAPR08CA0013.outlook.office365.com
 (2603:10b6:a03:100::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.21 via Frontend
 Transport; Mon, 7 Oct 2024 17:57:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 17:57:47 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 12:57:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 12:57:46 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 12:57:46 -0500
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
X-Inumbo-ID: ab927884-84d5-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1BdmLSraNUSL51R9np04LUwIHK5L4PMLX7AIq29B/DoS4YXgPcKIp96mZ9rbcL5XVj76G1m04yNs0pr1Kizo7WgwZkTC5MIdVbUDI5Lw7LbFG6OLNOQ6FeWesfGe0aemGUU42Lmr4a2q70aprho6UupUVtGsyTacC0HH7/w1WzPXmtnReuyb5A8P5zE54+DuV4zIyTyhBSJZre6y1gTlsgOow/OzsgKOsaet+dMeTTyib9DITWmWZ7CTnUWVlRgo5WcNPXiK9LpSoQQjgltrIqWOfJY/z6fwosqmMB+oFhe7THkjgtauVt/5N53ZRPdDRKeYv5BRnCzEt3da69Grg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw0w3/mNYMUZ902W+Tw8z6DhauJJdrSRxtFWJbURlv0=;
 b=HpBguyLzRcTkeC8TM5ROA6zaT0Rrsj3tpUa1zMXNfqhYCr/jc4u5r8SVQ4bSYYLuoZiUdLzbE765/FkjouCCfhWOjYMoVwstrpYV6/2bPGr8yD/tyY9k6ajhVcZ/gJ5u7T3ago0WYa45L7OMsNjlJ3KvsbC0NJGI+XnBgWPizkIrHaeilI6YBCGSRJjcmGWlk8RjpqR3swE6REa84YpoKjkCQkBWVuXfj8RBQ0v6Fe2drYd3uKvsr3eNl52yWnx1ghiTNAW/kfH+RSzWpa4XGPlQEHv8EfUA6dXvMZcU2AOH5N0FmnM1TJR+KPclg1pFu+E0eqCJgKC1IuTLUhFPpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw0w3/mNYMUZ902W+Tw8z6DhauJJdrSRxtFWJbURlv0=;
 b=YDaAfhiCsh6yyGZFD3P019U2jRD7SdSze6UvZjWJhdBZjJpD4n+GC+lHCHQlbU5Ru2IOEtti7w4WVKN3N6ZItzJOO6t7F+5fmcONBYmx05Oqtv10xVc8Zc+TBcee6aV8h+akqa36lLofxkhZmERoEsTMlXWONu+gM7HjmYba4gI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1e3d6e99-37df-4824-8702-3e8ae7a4923f@amd.com>
Date: Mon, 7 Oct 2024 13:57:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/44] x86/boot: move x86 boot module counting into a
 new boot_info struct
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Christopher Clark <christopher.w.clark@gmail.com>,
	<stefano.stabellini@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-2-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|PH0PR12MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: e40447c0-d378-43aa-3e17-08dce6f98d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjczcjJ1cW1EQ1FpZERqV29teCtiMDFjaFBkcUd5UFgxcWF6eCtBWFNJZVRu?=
 =?utf-8?B?b0hBa0tGMklDVmhCbm1CanJUMVVaL1dIRkQ4MzRaN3dBQXdpY3RoUDFYcVFK?=
 =?utf-8?B?Nnl6L000U0JFa1RadTVmQk9zMFNXN09BRFdYY3lrK05QM3lNdmw2KzZMMHdY?=
 =?utf-8?B?eXFkRGl0bVJNaWdDVGRUSzN1aDJldTh6RUpUaTVTWXhEbWlXYzFWNzdCbVBO?=
 =?utf-8?B?WmdIVWZ5MDRZdVZrd2F2ektGcWtOM1BzZTIrSmVwZlF1MklVaEhoQzVCcndv?=
 =?utf-8?B?RWk4OFdoSEUrcDZUSHo2ejllYlFHTVlIQWN0bjRxVDVEeU54bUNVTTNSMG5F?=
 =?utf-8?B?bnVSWlFDZDJXbHRSME5OVThrRjExY2Y0NVlOK3ViK0pjMzVZQVJaWTJ3YWsv?=
 =?utf-8?B?VW0wTkRhMnhIMkFON0FQTVkvYnF3WkpSQmZnRnBCNHRUZHlqRG1heGRudi96?=
 =?utf-8?B?bU9ScW1mZysvZm5JbEJYdisyTmpWUW85cmR2cnB2TzlPMGkzdGlCQlRHZ0Ri?=
 =?utf-8?B?KzQvemxUMktqanNqNjdhQ2tUZUpjcVNpdlZ3TWFBOUcwSVhvQVhNOTVzNWhY?=
 =?utf-8?B?RG8yYlRab3piajdYL2hPVDdnN0dIVXhJVTlGekk1bXVocmYvdjQ0cTRnUjhy?=
 =?utf-8?B?U0h5eVpTMXBKOUcrYldaVDFtWUUyYkloMVhmWGlYVXFIc1BkdGFPcUFhR3Ni?=
 =?utf-8?B?NjB0T0hTVnZVMUVsZENHQTZFRGl6djUyVkpaVFVMamUwL1gvckx2NGNiRHZ5?=
 =?utf-8?B?dmpXNzNuK1RMTThWbWZ5YkZPSDBMMGdzVFl6Q0lsMUtCQ0RlMmZEa05TR1p5?=
 =?utf-8?B?MjExMmtPclJXaDhwOEx6U2ZnUm1SWnl5Y2JiS1hvTUpIMU94Wm42NEhrSVF3?=
 =?utf-8?B?d1NIMEdmZExVWVRlUWtGRXRxRU5tSks5UlRRYlZnNlB5eWxoSnpITkRqNytr?=
 =?utf-8?B?Z3JVK1Z6NmxwaGowUjd4MUJvQ0prNjFuSGZXQWZDR1YwamlsVVVqS0FOUlRC?=
 =?utf-8?B?clpzNDlSNXF4YjJWWTliYk12M3YraHBPNzRkUUJXSG1YN0h3UVpOdTRzcWhy?=
 =?utf-8?B?Zy9pdFZsZFpMYjQ0ajUwL1pKa0pMV0RKd1F0aE9UNmlqSy8va3hkT3ZsNDNZ?=
 =?utf-8?B?ZFdEMERlWlZCRDdVcndnTUc4TlJGWU00QjhWdUVKMEVTODBuQ0hJWm9SNDRP?=
 =?utf-8?B?c3BCVHluMnpiSy9ZSU80a2x3d3lJSzNWV2JPUTZPUlE4VXQ5VXRNL0VrbTJk?=
 =?utf-8?B?ekY5TlRlN3RvcG85NUxjWHNZK0dkMk80MjltVkNkNmhNUEE3SWd1bU4wQXVF?=
 =?utf-8?B?anJGNHZkWHg5bWcxOThwVHNING0yMFVoM0NHU3grUWhMQ0FNOUF1ZENTZlJL?=
 =?utf-8?B?S3dzRWhaVXNobDd6dDdJZmQzME5uQTJSWnZEc2VuejVkSUlENHNSSVkwVG9Z?=
 =?utf-8?B?bSt2YkhjQnNwS2VrY0ZFQ1pFbTl3UUFVQ0IxZ1BJeVNDTVFvSm53Q3BXV0dq?=
 =?utf-8?B?SVBtd0J0QUhOYjNDdkRvRENrV3FHeHJlM1lxbEIxTGZDcE5iSTR1S3gxaVRs?=
 =?utf-8?B?aXlveTNmbzJZZSthRUdyODZNZGRPUFFXTjVnV3Bhd0NEUnQ4d0tPR3gwU3VH?=
 =?utf-8?B?bVQzK3pEWUdPek1VcXBUMWN2MjdLSDM1TitiRzhjTWZDbjY5R3VXQzV4bkNt?=
 =?utf-8?B?bHozZkpTc2pLZTEvcEtOQkZMZkY3Z3MvK0UvUE5lR1p2WXkzQTlqdVJOa3gw?=
 =?utf-8?B?cUpNbTRJTUxMTDNxT0s4MXNOclcwNElLZlp3bWgweDBmZUpUcklxWGlybmhj?=
 =?utf-8?Q?HQYETFsQj1AhOLcYzClqxVlj3vF+E4+9JdI64=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 17:57:47.4687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e40447c0-d378-43aa-3e17-08dce6f98d93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7885

On 2024-10-06 17:49, Daniel P. Smith wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
> 
> An initial step towards a non-multiboot internal representation of boot
> modules for common code, starting with x86 setup and converting the fields
> that are accessed for the startup calculations.
> 
> Introduce a new header, <asm/bootinfo.h>, and populate it with a new boot_info
> structure initially containing a count of the number of boot modules.
> 
> No functional change intended.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/include/asm/bootinfo.h | 29 +++++++++++++
>   xen/arch/x86/include/asm/setup.h    |  2 +
>   xen/arch/x86/setup.c                | 64 ++++++++++++++++++-----------
>   3 files changed, 71 insertions(+), 24 deletions(-)
>   create mode 100644 xen/arch/x86/include/asm/bootinfo.h
> 
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> new file mode 100644
> index 000000000000..a649500ee3a2
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
> + * Copyright (c) 2024 Apertus Solutions, LLC
> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
> + */
> +
> +#ifndef __XEN_X86_BOOTINFO_H__
> +#define __XEN_X86_BOOTINFO_H__

I haven't been following closely, but I think if we follow Frediano's 
naming scheme, it would be:
ASM__X86__BOOTINFO_H

With that (or whatever it should be),
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

> +
> +/*
> + * Xen internal representation of information provided by the
> + * bootloader/environment, or derived from the information.
> + */

I guess fine for now.  Should probably be expanded when it starts 
containing Hyperlaunch domain configs.

> +struct boot_info {
> +    unsigned int nr_modules;
> +};
> +
> +#endif /* __XEN_X86_BOOTINFO_H__ */

Regards,
Jason

