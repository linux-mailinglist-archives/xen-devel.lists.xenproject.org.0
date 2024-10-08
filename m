Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CED6995879
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813525.1226503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGrB-0000sf-Il; Tue, 08 Oct 2024 20:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813525.1226503; Tue, 08 Oct 2024 20:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGrB-0000pd-Fy; Tue, 08 Oct 2024 20:30:57 +0000
Received: by outflank-mailman (input) for mailman id 813525;
 Tue, 08 Oct 2024 20:30:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syGr9-0000pX-L4
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 20:30:55 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20614.outbound.protection.outlook.com
 [2a01:111:f403:2412::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35e8cf53-85b4-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 22:30:53 +0200 (CEST)
Received: from DM6PR05CA0055.namprd05.prod.outlook.com (2603:10b6:5:335::24)
 by CH3PR12MB9124.namprd12.prod.outlook.com (2603:10b6:610:1a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 20:30:48 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::61) by DM6PR05CA0055.outlook.office365.com
 (2603:10b6:5:335::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 20:30:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 20:30:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:30:46 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 15:30:46 -0500
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
X-Inumbo-ID: 35e8cf53-85b4-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxufrTSf1LsBpQdbl5qM4QLXS/TJ8oREV1hlmPOoNn1b7PCSBSHva6NqEzRGHlA7ZwJAoHlokreq2Ql2jI+gPA1k3ZTCMzper5F6ZltlHKhklIKcLZDiL/B4Roh1BUrejAGj/kTiR5bKxC67XgNI2qKVhCpKjQa0aU87mSc8nujwKfLQOeXTFYTIPFszxJXIL7QSJKsbuzi3wSbX5R8HVijKiQf+DiXuKvnfSe+WA1z/dVTuCR6zxxHGhqqBJJIm/6fvf9MrxISCuAWqiPMfA8Yicub/wV5DK2VhGRuVq2VVqMP+gmJCzmTTNlXg5xbMxtSSbvHDmLqKhsTbL57f0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2Z5yRJm24XLUVVZ5YpJ0Bc6MGIe3htTRfRZ94mxDC4=;
 b=s+DL5nDXOUax5KGg/Re25o+8NIpl6S3FzqyQWxfpPdYTYcEQ3mR838mj7wuZO/2+Len2QkH1Mgf7jcr7qqKwaCvrisTibeu9uz0H5KHJSSyFDPqpzyjgOsIfET5AxRqSGnTUMQMHV4BpTRAIAbEqk+XlpODNJZJn0ww7DVDU42tt+FOgrBH7G72aDZg83u99/3qx+SEVDUX9SKwXKJrB+t/ED+3HLUC4YWiK1yMhs8GXMqTOhaXAELDPxVHDvCMprJVpSVAjjc4+HZzFLHAAErnfHWsaS4fxIhYNcZQGFC/cgXtZzeAjlpgQg6qZCLPvZlnEFWb5VbABlWgwGNUzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2Z5yRJm24XLUVVZ5YpJ0Bc6MGIe3htTRfRZ94mxDC4=;
 b=PB18FdgMzHujutxFygr7WqEsxgXIbph5u5FpBNacagjWf4Y2IMAJaBdr+0JL3H7tBkyJo5h4w4U/E1XTtgZYoJMWXtKJddaUQYh1/JFpsrEhjNGEKO0KAPjWzrlwWto0eH8+LEiKaumCS7LpkdJdBQic4HIuEP7wGp3QzbkekI8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f77904b1-dce2-41cd-ab74-fca75a0a147c@amd.com>
Date: Tue, 8 Oct 2024 15:30:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 38/44] x86/boot: introduce boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-39-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-39-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|CH3PR12MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: 7318ee63-d1dd-48cd-c241-08dce7d817d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjlnRm9qUGcyODNHcjJjcEg2WTdubjNxcldhZnJCRGZBMk1yektUR2NuQ1N2?=
 =?utf-8?B?Q1VJUUZpOE1EUitsaURlRWx3b3dVUUNwTTRiZ3BhOGFOZTVQQ3EwS2VGL1dD?=
 =?utf-8?B?b0l1R1BxK2hyWnVuV3hLNWlKbjJJbnZ0STBoRkxkTDRqUDFpSkdTKzAzZFFm?=
 =?utf-8?B?OS9LeW5GUkNFNWovTmluMGVFSHFUdURQNE0yZm4vanN3WUs1NFVoaW1haXVO?=
 =?utf-8?B?VUhJR3lvRW9lMEN6aTYwbEUvL2ZSVW9zOXBqS2w5dkw1YXprYkpQYlFPdGtB?=
 =?utf-8?B?Z0pPOGNCZVpWQkdFSExxZkkxTGVmcHQ3Vm9PYnh2blg5QjJhU3EyUXRQa3Ji?=
 =?utf-8?B?eFhLUmVJZld2Wk5XM1B2S3MvdVVPS3hVeWlLTGlPb3VNc3JXd2IyMkdKQ2Mw?=
 =?utf-8?B?dlpacllVZnB5ZFVBT29zV1lrSnp5QWhraU1HNEpyWmgxbjdFQmExQkI1Z0tp?=
 =?utf-8?B?MG41RXd0MXZiSUJSc0RwOGFWMFgzWlloOTk3OW16eFQzUzVVdzhhWlFmOGV0?=
 =?utf-8?B?eUFHbFZ3SWkvc3NGK0FTQnR6Wm5rdjQ0VWJSUmhGNVF1ZStabzNUSkJHQURN?=
 =?utf-8?B?MEsvVDFHRFl3WkVJMEVtMFFYZDZxTVUyRzhwZEExR05hZTN3S3RNSkZQQldF?=
 =?utf-8?B?RVNuQXlPQVNZMWt0aGxsR2VvOWV5T0VCR0ovWkg4RlhkTXBiNVk1SU5obEVt?=
 =?utf-8?B?enU3MThBdkJTVGJxRGN6WnFjZHVXM09jU2tkenlEdVhETWJ2NGlWRlFneCtV?=
 =?utf-8?B?bWtsVUNoUWFySGdYc09jL0hxb1Y4Mm5vK0w2YUhyZkxLU2x0eVJnQVU2Kzla?=
 =?utf-8?B?QVhpUTFqcUM5TzVUeEFxU0xJdkpQRzZqMU9aWHFCVU9IVUlxdFBBODVNbTB3?=
 =?utf-8?B?Z25LS2dFSXpIZVBmUVlqaHdFVzFBUmk3RnR5K09xNUdnZWlBNjR6ZFVmNTBp?=
 =?utf-8?B?cmR5d3RYRmNvTHUwUUlsYW9ONmFyUGVsZ0gzRURhbnErM21zOFNsd2lTSnhh?=
 =?utf-8?B?ZXN0a1U5M1htMnZpNXl1RXpwaEh3Uy9KaXIwd05HRUxHM0tvaGhiaGcyY1Nw?=
 =?utf-8?B?WjV2bVVnRnJVcXptdUNzRXh0RndYUFBQN1ZrenY5QnBRZ3Jwcno1WnM1RUNy?=
 =?utf-8?B?Z0h2aXpoWlREbXozT0ZucDM1VEFTYzIvZVJlN1pJU1NFMUMwQVMwSTd6YU1L?=
 =?utf-8?B?VVFvanEzUFNiSndZNXZEeWYwT2tOa3RweklxMkxGR0hNWExTN0NKd1k1ODkz?=
 =?utf-8?B?cTJPNmdnMWdyaDdDOWYrU0podmprbzhTRjdmZVZ3bThXZStEa2IzbTJVSFUw?=
 =?utf-8?B?TDNiR1VhR01VQzlvNFkxZUhGdFVKSjN6dTdXd2JPNGx1VE1FTnFZUXpKQ29Y?=
 =?utf-8?B?WlZzNEZzdUJrajlra2I5L0ZQYURwZDM1MEhsekFOVXVWVE83NDh5RFExSU1I?=
 =?utf-8?B?SkdTZmxab3dqOXcxVXdWbXRxSi9POWU1cEhwR2htUmpsMGxSY2RqWkxjYVUr?=
 =?utf-8?B?cTFkOFZRS0ZWMmJnM1ovUmRFbDVmMUZEV0dLU2djYzBWTTYwRlRKckJjSnFp?=
 =?utf-8?B?a2l6a3NRSU5aRE5vMHRaaWlrOXRHZnRmWWpzbTVzWEViTWdGaEkyQlFiSDBj?=
 =?utf-8?B?SmlxRk4raU1zWG1qdmRPMGNCdGlWQU5odUprdmZ1TFc0aTB2Z01ld3ZvVTBL?=
 =?utf-8?B?ZnlqNk5EZ0d0czdwT3hXNDBXS1pNcnpXWFdhK04zMXhaODNab1FTeHY2Zjcy?=
 =?utf-8?B?YmxnNGVMOVNHUmYzM0dqdEZFS0NBaWhKNUR5eElwU1lpN2lmZFFkaWhaamR0?=
 =?utf-8?Q?i0ONXCPCYLiupYiqjqSXwm4sc6PAzi90GLXbI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 20:30:47.6457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7318ee63-d1dd-48cd-c241-08dce7d817d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9124

On 2024-10-06 17:49, Daniel P. Smith wrote:
> To begin moving toward allowing the hypervisor to construct more than one
> domain at boot, a container is needed for a domain's build information.
> 
> Introduce a new header, <xen/asm/bootdomain.h>, that contains the initial
> struct boot_domain that encapsulate the build information for a domain.
> 
> No functional change intended.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/include/asm/bootdomain.h | 28 +++++++++++++++++++++++++++
>   xen/arch/x86/include/asm/bootinfo.h   |  5 +++++
>   xen/arch/x86/setup.c                  | 24 ++++++++---------------
>   3 files changed, 41 insertions(+), 16 deletions(-)
>   create mode 100644 xen/arch/x86/include/asm/bootdomain.h
> 
> diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
> new file mode 100644
> index 000000000000..4285223ac5ab
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/bootdomain.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2024 Apertus Solutions, LLC
> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
> + */
> +
> +#ifndef __XEN_X86_BOOTDOMAIN_H__
> +#define __XEN_X86_BOOTDOMAIN_H__

ASM__X86__BOOTDOMAIN_H

With that:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

