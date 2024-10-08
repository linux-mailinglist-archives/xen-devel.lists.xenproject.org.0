Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1782A9958E5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 23:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813585.1226583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHPX-0001Gm-U9; Tue, 08 Oct 2024 21:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813585.1226583; Tue, 08 Oct 2024 21:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHPX-0001EG-RI; Tue, 08 Oct 2024 21:06:27 +0000
Received: by outflank-mailman (input) for mailman id 813585;
 Tue, 08 Oct 2024 21:06:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syHPW-0001EA-Nw
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 21:06:26 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ce53ac1-85b9-11ef-a0bd-8be0dac302b0;
 Tue, 08 Oct 2024 23:06:25 +0200 (CEST)
Received: from SN4PR0501CA0050.namprd05.prod.outlook.com
 (2603:10b6:803:41::27) by DS7PR12MB8289.namprd12.prod.outlook.com
 (2603:10b6:8:d8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 21:06:17 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:803:41:cafe::98) by SN4PR0501CA0050.outlook.office365.com
 (2603:10b6:803:41::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16 via Frontend
 Transport; Tue, 8 Oct 2024 21:06:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 21:06:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 16:06:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 16:06:16 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 16:06:15 -0500
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
X-Inumbo-ID: 2ce53ac1-85b9-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6aR+iqX8GmrhWnIsqEtaszg8NxctAY4puSJYsioIxY4C8Pwh7d2N02vazmal5yWFXoSSg5eI6gizu4rPCbbmf763edhohLYXqqx1hICU0xs2B5pQ8jmtSdqsFXmx0Uetj3uMgxvHYWrqBBn3PgdZjqgnG4pNE49RtdJDoVaFEdHhCxz09duiYYWxMXzCMKwfwTbv8kx9dHVv28a75otiFkHc4KuFujifwwkpbVoYpcz0ZwuT4TAzu5JjvxP6tfXbbCtwa6Wih1YOO8DVfvseDZWke0eMwUlnQOeeuR8W8j1ekaTHKuIdigiap0RNhwftUKXI22rZ0ewGiUzdpHDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDoDz8P6bipSX9y4XA4VIlW60nkGGhvmirxn2RWYrc4=;
 b=M7LJivlvIdmcfZ+wtT2QHszMNU0uZ4S/51EKAEkX7jpTcpGr/UvJrGhTIARIzrHXbnMJGTx+uU0Q0YNWTdM3BliCoWi8dlPGSFaZed0MgcTPX2qeaUdCdDuwQ53OBxKb4YcLwB6cTL8y4SUeLbCIHkOszQIikUdqCO3AuwA8iquR9SqKHrMJ9qLqfQUywZdPDWhLCuCkM6aan6gcbnJjf8hyrI7v4X3cr/XxIyib1r8wMltFFPrsnjz9IFKpoxpTwvSeICQ1YXjW+fExRlKZTdVSNOrLSrJwSk4DFPKQSqaQuqIj3mENaFbDfcpi89vkEsUZR2qImwx8asUI8PtK4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDoDz8P6bipSX9y4XA4VIlW60nkGGhvmirxn2RWYrc4=;
 b=iTM/TC/oB0uaCbyey+9GooA4nr6vUjiAa2PiIF89MIwiHhOjRogw6kd3O9UtecajPSrW/blwP8/UpCcwcQDx/eG9vOryWzwD06h72kEbkcmPYl7+4L0nW6eZ6sWvFyTaZrp0zLEUU2YnrhT5q4obA5ME4f0sJyj4l/bGN+tbULY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1ec34665-36da-44a2-af5b-7b770017ea53@amd.com>
Date: Tue, 8 Oct 2024 16:05:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 40/44] x86/boot: add cmdline to struct boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-41-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-41-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|DS7PR12MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: dcadecfa-aedf-4959-4831-08dce7dd0ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVNzanl2blZzb3hCbEp1NmN0OWNsb3hsUnZBMWRBYVBhbE9WVmtMOEx4a0Nu?=
 =?utf-8?B?dll5bEcwUVBRd2xXY04yLyt1VE1paEJZR1dpYkZhbjlqRHBzRUI4T2ZodmVk?=
 =?utf-8?B?cjZERnZtTFJOenArcHBYVk5FMXNUWThMRFNSc2lINlB0V2tGQ1AzNjVDME5D?=
 =?utf-8?B?ZmxXdDVMcjd0ZU43YTFUNDNIbktvditpMnFYc1VCRjlzMDgzNldxaTI3U0JI?=
 =?utf-8?B?TWR5ZWUyLytXRjZoZG5mVGRCM2lTeE9YR0tHU0NiQUJNVWhrVjgzV3YxZ2FN?=
 =?utf-8?B?S1ZGd2Q3eWZybEpJY2Y4MUJqVnlHWVhHL3lQa1pjalBRR3hCUGJCZlJKUzhm?=
 =?utf-8?B?Qm5nQnlCOW0yTEQ1bnhIT3IvbkwzSm9iWGhCeEM0UDZscE9OZThtcXdlMGVU?=
 =?utf-8?B?U3VTa3BIMCtCbE1CbDg1aS85VjBKUDBqd3hDYmtXTS9CeUpmRStiYnB4MWVT?=
 =?utf-8?B?VXdWOEs5dVd6OGl5Um1BYjRXcUhrRG9QVkFEQ1hVaEUvdHJIUlhseXU2Vnd5?=
 =?utf-8?B?N3ZlUGt2UTh3RkxGQmlCYXhDaVVFaGx4QU1XcitQSEdBUzJzYlJrQWUzdmxN?=
 =?utf-8?B?dGk1cmE3eXpPNVpDRnJrUU0yb0F6MnlJYWpXRnFFVlJGQXlXM0lXZ0RFYmtX?=
 =?utf-8?B?SExRZVczR1Q3aVU3Vjh6MGwzclZsQ20zTmhMeVNISFhtTmJvSFg4clJiN0ZL?=
 =?utf-8?B?Qmp6KzhMaWhUdXZxaFUvdUFXSzFWL09sSUdCVmJRN0xLQ2FNS3RXVE9SemFF?=
 =?utf-8?B?NHQxSW1wNWhIUXR1UEhrVW5FVkt2bCtBZ2V2d2hrZUlaT0I5NUVMUjZqalJG?=
 =?utf-8?B?RjB2M2tXbWhTRmhrcHNvM0hZVHdTVk4xZ3JicjhkMC9FeU0wYUR6aStxdjlT?=
 =?utf-8?B?c0t4R3drYWhsTDFZb0wxMzhQdXNPM3g0NS8reHVHWmx2VGhaeHE4SnhXN3hB?=
 =?utf-8?B?R3AwMFlzRHFwU1F4SWtyVlUycE91UmZNK2VvcnBtUjBJQ0ZFZFFTeEtUc0lu?=
 =?utf-8?B?aDVOTFc0RlNwQzQydWoySEt3dVB4RmlDZmhzT0Zyd3YvYlc2R3VSSk9VeUFD?=
 =?utf-8?B?dlB5c3NOMmtHTFpmeHhydnhQclFVYk1qeG5rck8wSlVCNDBGTlZ3RVhJM1pF?=
 =?utf-8?B?YW1oVkVUdUhFVEozay9Cclc4ZVlWOE5hNE5XZmV3N0hsZEZ2bEdGa0FHcDk4?=
 =?utf-8?B?UGJxc3oram9RbVNLZVlhL2hzL2FPYkxJelAxMjdpTzRVcG1DUDVJR3Q4Y0pJ?=
 =?utf-8?B?dDhuN251S0VhUjVSQ0xZdlcxOU8vbkhVdUdIb0dhN1FFWmJwN3padXZEeHpV?=
 =?utf-8?B?RDB2cTFjdk5zbWZ6NnJyNVBpUW5Dd3pHV3lHWGN6NHU2SUZELzhkVnhBSS93?=
 =?utf-8?B?eDBXaEM0Q08vNmtzV2tPblZxVEdpSlpHZ1dGTU5BVllmQ1JyMFA0Unp0SVdI?=
 =?utf-8?B?MGF3T0VYeFlZaGFBSjdUdHZQbEl6emRlNGloamF2YW5IS0Nadm44bUlKOG01?=
 =?utf-8?B?QmtEaTlnRllBMzZFSzJEdmJvdGdlM1VTbEx2aWcxOVR3eEs5WU5oZnhRWVhn?=
 =?utf-8?B?TkNia012T3VKTWFyOGEzb0JNNVM0RHEvbDRPdTJBZm5hNU9jbDI3LzAwaDJ3?=
 =?utf-8?B?b1FCZlRPOWVoQm5wMFhZZXBCVlNRVkJYYzNQUC82b2UrNy82dTRrSmZvM2Rp?=
 =?utf-8?B?akJPTnpPNWc0SUErYzdpL3Z2NmNocDJWUHk4UE13OWZDNWtlTHc1M2ZYcXZM?=
 =?utf-8?B?ejY1VUVpTWljb0ZqWUVXTkw4MXFtRkFxVE8xVk5hemtXNmdvK01xRjJXUitO?=
 =?utf-8?Q?diJEM5u33EerhTNdWiuB6Y1dBmwWIFuOaI0eY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 21:06:16.7686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcadecfa-aedf-4959-4831-08dce7dd0ccf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8289

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Add a container for the "cooked" command line for a domain.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/include/asm/bootdomain.h |  4 ++++
>   xen/arch/x86/setup.c                  | 18 ++++++++----------
>   2 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
> index d6264d554dba..00f7d9267965 100644
> --- a/xen/arch/x86/include/asm/bootdomain.h
> +++ b/xen/arch/x86/include/asm/bootdomain.h
> @@ -8,9 +8,13 @@
>   #ifndef __XEN_X86_BOOTDOMAIN_H__
>   #define __XEN_X86_BOOTDOMAIN_H__
>   
> +#include <public/xen.h>
> +
>   struct boot_module;
>   
>   struct boot_domain {
> +    char cmdline[MAX_GUEST_CMDLINE];
> +

1024 bytes for just dom0 isn't too much.  But when hyperlaunch has 64 
boot_domains, that's a good bit more.  But I suppose it isn't too much 
RAM for a modern system.  This is __initdata, so it increases the binary 
size.  I just want to highlight this in case others want to chime in.

The code changes seem fine.

Regards,
Jason

