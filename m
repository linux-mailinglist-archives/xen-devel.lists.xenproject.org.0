Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566E4A128FD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:44:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872857.1283849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6V0-0002T7-Tj; Wed, 15 Jan 2025 16:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872857.1283849; Wed, 15 Jan 2025 16:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6V0-0002RS-R6; Wed, 15 Jan 2025 16:44:10 +0000
Received: by outflank-mailman (input) for mailman id 872857;
 Wed, 15 Jan 2025 16:44:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppZO=UH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tY6Uz-0002RM-SS
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:44:09 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20619.outbound.protection.outlook.com
 [2a01:111:f403:2406::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef96ce88-d35f-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 17:44:07 +0100 (CET)
Received: from MW4PR04CA0192.namprd04.prod.outlook.com (2603:10b6:303:86::17)
 by DS0PR12MB7900.namprd12.prod.outlook.com (2603:10b6:8:14e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Wed, 15 Jan
 2025 16:44:02 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:303:86:cafe::bc) by MW4PR04CA0192.outlook.office365.com
 (2603:10b6:303:86::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 16:44:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 16:44:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 10:44:01 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 10:44:00 -0600
Received: from [172.27.3.102] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 10:44:00 -0600
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
X-Inumbo-ID: ef96ce88-d35f-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQU4mGOhNS13pgpnG5yq9pC7o+IveirGuNnk+48phq8TMEsLhLEagS9HmcnH6mPxcqwdkQJd8mr715k8sFb3HHO0yecyhpAoczNNijkxfi3amAWuklFUC/NwBrBv59UUX1O/e367SvX3kzztKshPwGY6RDKYnj7JfuqGvRBE2jXPJMuEVrJOd5ejARLq1j8dXgDMwFYk5N0D+3Y6XJPMZRJYABlK66YlhdXj1DX424kwEF3Q9wNoeTXHSxRHVYK1PNkiHsIICxGpAzeCtFHjBZW4wqm26g0HmBoz+9M4Oa0Huca853JqYJLd1fLKbncpkm/eybECA8LeyXhzxMj80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cko+wENQ4hiN1t9FapAtca+2BCIFrcWK1gLMVkYQU+s=;
 b=L3l74cDL8QA4c/Y587DAxm0eDkft0PassY1vRj8gKPwG+GRV5WthykwiUpaZI0etqoNLd3GPM4e7nJCV0Yx3az3S7O9hR/zHujOJAwZ4X1K7SBKcNSbHU9ozJL+rXr+SW8g7kLS2O8TrIlQvVA37CvxRE82mT+bQ1eil6BzxwzkGWVv2omPoUSl9aPHP4DAYvKreFaPs2cs/QF0x27n8zWDXa8zfzts7ZWf2Wzh1jV/pJT6n4wKPAHoxmSWO0i4TBibnXpvniwlzW3HSCdBvEjsnbbDOUTheRHnlXXwzxxY7luiQsQBDtRDK2RASytZaWHFODrsiR+T+bauKZe0y+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cko+wENQ4hiN1t9FapAtca+2BCIFrcWK1gLMVkYQU+s=;
 b=GlOshT3O+iEMCnFbdD1lijjXauTymwdUm0LEQpyBfTLgUTiWdz5jSSDh6n3aW2ysmhzPZQBZUAQKnI1Xm9mcd3JnwA5HoIbGeCJ6hi7TJSBjzhr3X8OBRRCnoPz+akBJn5bigo9uL3pPdfV4At6e8zcwkDuEbthJUJ9LQAihbEk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6a57fb93-5172-485e-b4e1-7c545aca871f@amd.com>
Date: Wed, 15 Jan 2025 11:43:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-11-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241226165740.29812-11-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|DS0PR12MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f52f5c6-2fb8-4047-0e62-08dd3583d0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXN0aHpjNDh2YVA1eDBiMENyZVViNm1DUWVrZjgwakZxb3JPbHdYckg5SjlU?=
 =?utf-8?B?dk1lS3RVeXJ4cTAzK2lsQjM0RG9ma2ZPbi9taElJYk9KQmZna0NwUlhQRWQv?=
 =?utf-8?B?S21RbjBUY2RZYis2Yy8wMWNkTGRIY0tEbWVIcHNCQm9DcWpzYmxHcnpXOTNF?=
 =?utf-8?B?ajVKeFM0U2szd3RFcVVCcHo4R05NNysxMUtrY0dncnE5NG13b245TlVhTURs?=
 =?utf-8?B?U3p6bEVVR1ZqS1JZWTlHajAybWZkY25YZVlpck9sZjNxU1FNdzhBZ1k0VmI5?=
 =?utf-8?B?OTJYR1ZHNktTZEdHa1JVRitGZlVuZGloMmt3UW13K3JNWXRUcnJ4MVZQYVhi?=
 =?utf-8?B?Z1p5ZXVrRERGZEZtOWdLMGtjRnpOQjZjSVNTVndaTVg0am5TVkIvbjR0OFhJ?=
 =?utf-8?B?d2t5TzV5R21QUjlSRnVKdE9hMTAzUVdHZ0t0aFFsd1U4akZwY290ZWpDQksw?=
 =?utf-8?B?RmJJMUhidURoRXlYamhwZWdlTGllRTFsRlN6cytJcXFaVVNlNGoxVFNKUVZB?=
 =?utf-8?B?NWZKTGdVNlF4aEFmRFVjaXN1YlRhOG5lbitJY1BaWFZVYW5EYTlEYWtERWxm?=
 =?utf-8?B?VUJBVzhFL0RDbEJnLzFJcTBqcElqbjFVME53cHdZU0NsYmFyU0dkWnpNSENV?=
 =?utf-8?B?cGF3Y0RNYUVMOXZPT0d6V2xPcS9EUVVYQjRlelp6dnBDbmdMU2x1MVI5WUlJ?=
 =?utf-8?B?RjZ4RkJ1RnVreW1MQTFkUXNlOTNrU20zenVLUE1yMEh2d0wvTUVIc2VIbEhQ?=
 =?utf-8?B?YVhuWVJrNmZiUnpxNEkyN25ROEdoQ0F3NndHeWZHSmJCOUx0bWpVN2NSTGE1?=
 =?utf-8?B?eEVGcTdIM1VWTmFBVG10bFNnUmR6ay8vdUsxY2tkMlN2QS9YeHVHZnpOakVZ?=
 =?utf-8?B?aEMyWGV1NVNOT1dWYzB4VXJKTnU5dGZ2MlptTXozaC9veWFJYWlZSHZWbllT?=
 =?utf-8?B?RHM4VjQyTTZiaHowSkU1bFg2eExEMnlFKzZqTzN3T2VDMkZudGhXSEptajRU?=
 =?utf-8?B?bWc5TGltRDNCODFGM3RKcDBqVHRGU0M2Y0FYdHhXSE12RnNCMS80NjRXSU9F?=
 =?utf-8?B?dTJ0YmtvVzRoTHNBZmRWZHNjQktxT1pWODNPNjBBSDE5SUtEb1NzbWNGNnpZ?=
 =?utf-8?B?MENWUjM5Uk51NFh6blNqSFZINlR6SDRVNmlnUzdjZHlIZUR5U1NMQ2NFR1Mv?=
 =?utf-8?B?NTkwZnpBYkJ1dFRNdDVDYnkrV2R2cm83TEM3cU81QWoyNHcwdW44RDl0RE9t?=
 =?utf-8?B?cTM1QnVMWlRYZmpsak5tU3Axa2ZmdzNRMk9IOE5FclpQTXVyeFRtYk1sVXpC?=
 =?utf-8?B?Q0J0b1kzZWRKK0hSMDNMOXFDYkphSU50VzVLVUYxTWFaeVpCQktNU0NPZ2h0?=
 =?utf-8?B?N2N0UU9JWHB4cGNQc1dvRkNSa1F3bWp3c2w5dDdTOE54RHh6eW01cS9IY3B4?=
 =?utf-8?B?WXdPYWpIYmtPVm9FblIzOXllVGhtY3N6cG80bDVka0V6elhkRGZQMjNOblN3?=
 =?utf-8?B?cUJTVmE5d0d2bzRCV2wyNUNleGhpK0Q1RHlGc1pwWnZwalNkeUdaV0plTWFM?=
 =?utf-8?B?M0FQWU95QjEza3RyYVd2NEtZMlBoSmx1VStoVHZxelVjRW5STTJtMFRCcVN0?=
 =?utf-8?B?RW91N1NaN3h0RzdxbC9vUDFsZDhUZTEyVVcva3Rkd1dWY1k4K1NwenJtWEtI?=
 =?utf-8?B?V2djQmcvckFJcEcxQUVzaXJpeFB1SXYySkdtajM4KzFPUHFnRjhCVGNyTVRv?=
 =?utf-8?B?MklsY1pqdWs4dzlFUFhNN1NuNUVKYmhER0IySnNTcG9OL2FLenJ3QlNRNmpH?=
 =?utf-8?B?d2FqRzlwcGJITktaN1U5bytaR0hOZHdlN082Wkl2dTN1UHFjNDd5Q25tdXZT?=
 =?utf-8?B?Rk5aNE1VdGd0UkNFK0oydW9hb2pCbmpHYXFIT0FvU05uZjhRRlg2dGloTGo4?=
 =?utf-8?B?RVVIeEgzS1VTOVB2UmRCS0owcGxORUtYZXNZM2tnS0NldWhycDA3RlNaZUVC?=
 =?utf-8?Q?ffNTP8S7udXWkyg1REzAEYLGTtxOAU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 16:44:01.7927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f52f5c6-2fb8-4047-0e62-08dd3583d0fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7900

On 2024-12-26 11:57, Daniel P. Smith wrote:
> Look for a subnode of type `multiboot,ramdisk` within a domain node. If
> found, process the reg property for the MB1 module index.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v1:
> - switch to nested else/if
> - dropped ternary name selection
> ---
>   xen/arch/x86/domain-builder/fdt.c | 26 +++++++++++++++++++++++
>   xen/arch/x86/setup.c              | 35 +++++++++++++++++--------------
>   2 files changed, 45 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
> index 1094c8dc8838..27bc37ad45c9 100644
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -119,6 +119,32 @@ static int __init process_domain_node(
>                   if ( ret > 0 )
>                       bd->kernel->fdt_cmdline = true;
>               }
> +
> +            continue;
> +        }
> +        else if (
> +            fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
> +        {
> +            int idx = dom0less_module_node(fdt, node, size_size, address_size);

Your next patch has the hl_module_index() parsing you want moved into 
this patch.

Regards,
Jason

