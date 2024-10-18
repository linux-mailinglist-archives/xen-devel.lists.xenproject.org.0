Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DD29A40C7
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 16:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821985.1235986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nfj-0003Ay-3Z; Fri, 18 Oct 2024 14:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821985.1235986; Fri, 18 Oct 2024 14:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nfj-00038n-11; Fri, 18 Oct 2024 14:09:43 +0000
Received: by outflank-mailman (input) for mailman id 821985;
 Fri, 18 Oct 2024 14:09:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paTR=RO=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t1nfh-00038Q-KD
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 14:09:41 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2416::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c2b471e-8d5a-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 16:09:39 +0200 (CEST)
Received: from SJ0PR05CA0115.namprd05.prod.outlook.com (2603:10b6:a03:334::30)
 by SJ2PR12MB8159.namprd12.prod.outlook.com (2603:10b6:a03:4f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Fri, 18 Oct
 2024 14:09:35 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:334:cafe::48) by SJ0PR05CA0115.outlook.office365.com
 (2603:10b6:a03:334::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.10 via Frontend
 Transport; Fri, 18 Oct 2024 14:09:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 14:09:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 09:09:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 09:09:33 -0500
Received: from [172.21.242.153] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Oct 2024 09:09:33 -0500
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
X-Inumbo-ID: 9c2b471e-8d5a-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOT+JscgytH/tHjWQP8KtkKvZ7hEw3yA3Z/VBB6m/1VRTNVaLNG1x19siY6HVKXpZXiJVo+FsbHk2UmAUPmNcK6pPWZoUsmu8acg1MmVIe7g1unCECSYnK4cTIhZ6DBTgmjEV9azJZjYOq4G5OelJBo8EWchUZjO1JGNxRZJLE5BOPtGQu43TKo/YEa5bk0SV5ytmVjVK/ybtbHqfohQY8N30KuxukQMmJJjwOCGsBZIgqCF0jaWHUcP3YKOd6BCAVRZt4OqEl3XLm3l/M7kg44qwWvlJwId9aLv7hnpdJKyGiMvqVIQSBBmm7V+9Xc2k4tyr0TbmVlGrl9zMhPICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+o1gKyVaiKlpwwJXfggBVrbogXfkx/SrodavCyaR8EM=;
 b=PEJ09QBVNrPpoIq6D+7ZiiQbSYGW8JrWtyhl2itm3pJCt/v+fwSH91BR7wjCLKj+x8XQ+N9/wF3tQpcZ28sxgw8pqn4bJL0d4UxxyizgdtDR9RwiUJ+5boVR30bh0SnRLPQYBrujwzuRiQQKBXNOLwb8/iLFSUmPO2SIoMUtsqiY9H27gJxsQq4LvnZTlWxbnPVmjZnkDqP3q/ir3EJstxOb5BKqEje2OXpKTDn0BBF97bLASVRhL+Z3ofyRCThV/YesNlkecrnrDIPoT1dW4UGLEAZ3J9EViUXAzwqIE/GPiGZ+0YWq3HTF8ujOM+UHw2D1YkA6f/mhNOvblsfCeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+o1gKyVaiKlpwwJXfggBVrbogXfkx/SrodavCyaR8EM=;
 b=2Xaasc59zx4/2UJ4V7Gxkre8REbsE8yveujCXIPms7O7lG26KyIUDLxPFT5icoN+1NEyhjol1j05yYd7v01PltwCfcrxxZjTJGt7bZ5u0jPY5muSzjiVtuQbH4h9Mv0W1yHW42wu/kzmGx1GC4wGg/AtoHCWeGlmnlXzL8ahftQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <acbb1045-237e-4570-b7a1-ea3283d344ef@amd.com>
Date: Fri, 18 Oct 2024 10:09:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/44] x86/boot: introduce boot module interator
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-15-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241017170325.3842-15-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|SJ2PR12MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 6326b442-f78f-4811-be34-08dcef7e7eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cldEYWZFdXNqcjFSMmE5THI0WTJ3VCtuTWhZbzVHZkZxdWYwRXpVSFpWRXF3?=
 =?utf-8?B?eE55VDZDVUlhUWV4V0F1dm1kWCtuWnlocFV6TjZjZG9XUjI0NVVkRDFXMUVn?=
 =?utf-8?B?RloreHBqaDRJTTNhRzY0T2I2VTZiQlFrN1I4TjZWcWptZ0U2RzRjaVdLVUFq?=
 =?utf-8?B?L0xva1dKWGV4dytScUdRQjRkOEpFQm9yU0lOclh1REZCblpMWHpWbi9ST1RS?=
 =?utf-8?B?VExvbDcwSXpJM3dkRHIwQjM1cU1MYnlxMjA3azBXUFNwcEZNVVBMdktvU2pO?=
 =?utf-8?B?VHdRbnRMMGwrQ21XWTBleE5OTHJ3cnRwM3hqUWU0YkZqQnQ5WStBZ1YwK2xn?=
 =?utf-8?B?MXlXU1AzTlI2a1RsYmJ1S2VZcnRLNk5CL0lLUW5pY1ZVRDBCWFR1Um9HeG5t?=
 =?utf-8?B?c1ZLUytyNFd3djNSRUxmK2Q0b0x4NzBvNHhiVVJvOTNEWERnZWQ2elpra3h2?=
 =?utf-8?B?OU9JV0RQNjZKK3JsL3ZTZFh0SDJUeEd4aWIvd0xsMWZYblJQeTdJb2VhNUxj?=
 =?utf-8?B?dmI2SkNPTXBNVElRN2k5Q3lzYTRjYU9renJmUGwvbHRrWDRIK2VBWUZEL1Ba?=
 =?utf-8?B?U0dqKzJLalhlM2s2STVzSHg0UEFZZ2pRTG1DNDNMajZPRXdSNDRBblhhMWRz?=
 =?utf-8?B?ZGY1YzdIdVYzRk9WVmNNTGdCUXBNRDhWNUxNbGRZYVdqYW04dkhXcEhHRHFH?=
 =?utf-8?B?VnY1bW5JaVpPOUhkTXhIM3Y1THFtblY0QllIZmFIaGk1YWZJSW5YUnFIOE92?=
 =?utf-8?B?MmtNeDJUUWNxUEZCM3NPd1RXK0k3bmhQTDJQTDdBSXhsYnlLcWNzZnZDZ2NZ?=
 =?utf-8?B?NWJndHNMQ3g4OENiY0JkT1NPcXllYXpRTlpSVEQrT3FmbGxYSzlta3lRcU1P?=
 =?utf-8?B?OVV1TGV2d0xCelpxM0tETm9YTGRDSVA2U0pjbnV1K0N1R0g4aExFZkFQT0hk?=
 =?utf-8?B?STdaZDAwNGUzRXhjTXhEeEtkWWdvZFBNYzdYVWljZlpXTElzVHd5Wi9qdUcz?=
 =?utf-8?B?SEpLVC9zOGJQMUttNk92NlVDTmswWkFwT0VwdTNsejFzWEpTVHNQNUxmRjMr?=
 =?utf-8?B?dXVpcEF3VndGRU15UjYyczdKUTA5SFEvNk5zeDMyQUxCNTZhdnZmaFFuVTVP?=
 =?utf-8?B?bXQyTmgyQjgxWk1IdWdmVkE4WC9RNkk0V3B1Q2I0TVk1SkY3ZEJpL1NmZG1D?=
 =?utf-8?B?NVpxd1FWT3BXSkFaQ0NqWS8xQyt1QXIzemlUTFlPSzJmM1NUZVZYVm9MVmgz?=
 =?utf-8?B?V05tY1VxSU4yZUJJRy96SXdHbExiODYyMUZTckJIV1o0eGMyZlR5d2UvNTFl?=
 =?utf-8?B?ekJCWjkwVUdzSnVYK2NpRnZ2Mk5UV1h3NndjODcxWlJLMGM4S3I3L3JBbkor?=
 =?utf-8?B?NmVXQ3c2SmZHVDBVS3hnTjFUcE40cHFjSnpWc3hsdW16a0J1L3VzRjlsdEo4?=
 =?utf-8?B?dWwyTjhSZTIvVnhRd0dOUk8yTmsxcjRJTEJ5L0oyblcwOEo4cC9oZHFKTVFG?=
 =?utf-8?B?QjVRVUF0dGRrRUVpR2wwZi9kT0srUlVSRndJcGFUdFRMZ1E0ZmU2YkVsYTBR?=
 =?utf-8?B?UXU3bG50VVJLY3UyZWtHMllVQTNoQVFOWXArMEllL0RuL0xOaHNxdW4vRE11?=
 =?utf-8?B?ZGVaQTEyUWFzdU0rZVg3dUxaakJYUVRNT3N1ajl3dFNUL2ptengzR1R3cGhD?=
 =?utf-8?B?RDJaWStxVUt0NUdFZ0pSZ21YNWJQY0FENkUrVkNGYi9UbEkzMHZRZ0JzKzZQ?=
 =?utf-8?B?VTJudDZiSEEvVmVyUHM5WFFaUkxYYVhMY05xY3lrWlorNkkyU21ybngrUlZ1?=
 =?utf-8?B?ZmJKZzY0U09OcEdTd21YbTc0SElMWUUzQlJPSGF5Qms2M2lTUUcvN3UzUjd5?=
 =?utf-8?B?bDRFY1p0QzlhZEI0VTZESFFMYjRKUDZJOWZ0eW0yTDR5RHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 14:09:34.8791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6326b442-f78f-4811-be34-08dcef7e7eb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8159

On 2024-10-17 13:02, Daniel P. Smith wrote:
> Provide an iterator to go through boot module array searching based on type.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v5:
> - documented help next_boot_module_index
> - switch to unsigned int for next_boot_module_index
> - changes identified that BOOTMOD_XEN was not supported, so added support
> ---
>   xen/arch/x86/include/asm/bootinfo.h | 29 ++++++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index 5862054b8cef..3010e6f4af9c 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -62,8 +62,35 @@ struct boot_info {
>       struct boot_module mods[MAX_NR_BOOTMODS + 1];
>   };
>   
> -#endif /* __XEN_X86_BOOTINFO_H__ */
> +/*
> + * next_boot_module_index:
> + *     Finds the next boot module of type t, starting at array index start.
> + *
> + * Returns:
> + *      Success - index in boot_module array
> + *      Failure - a value greater than MAX_NR_BOOTMODS
> + */
> +static inline unsigned int __init next_boot_module_index(
> +    const struct boot_info *bi, enum bootmod_type t, unsigned int start)
> +{
> +    unsigned int i;
> +
> +    if ( t == BOOTMOD_XEN )
> +        return MAX_NR_BOOTMODS;

Your earlier patch "x86/boot: convert mod refs to boot_module mod" put 
xen at bi->nr_modules.  You'll want these to match.

Regards,
Jason

>   
> +    for ( i = start; i < bi->nr_modules; i++ )
> +    {
> +        if ( bi->mods[i].type == t )
> +            return i;
> +    }
> +
> +    return MAX_NR_BOOTMODS + 1;
> +}
> +
> +#define first_boot_module_index(bi, t)              \
> +    next_boot_module_index(bi, t, 0)
> +
> +#endif /* __XEN_X86_BOOTINFO_H__ */
>   /*
>    * Local variables:
>    * mode: C

