Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBAA9EBE05
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 23:47:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853402.1266883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL8zt-00087N-Rd; Tue, 10 Dec 2024 22:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853402.1266883; Tue, 10 Dec 2024 22:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL8zt-00084a-Np; Tue, 10 Dec 2024 22:46:29 +0000
Received: by outflank-mailman (input) for mailman id 853402;
 Tue, 10 Dec 2024 22:46:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/ZW=TD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tL8zr-00084S-Ew
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 22:46:27 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:200a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94f8413a-b748-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 23:46:25 +0100 (CET)
Received: from BY5PR17CA0068.namprd17.prod.outlook.com (2603:10b6:a03:167::45)
 by IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 22:46:19 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:167:cafe::41) by BY5PR17CA0068.outlook.office365.com
 (2603:10b6:a03:167::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Tue,
 10 Dec 2024 22:46:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Tue, 10 Dec 2024 22:46:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 16:46:17 -0600
Received: from [172.28.102.118] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 16:46:17 -0600
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
X-Inumbo-ID: 94f8413a-b748-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/u33+/uEyTRcYjudWTLzoyngQyU5j9LHkMBa/qmrJTpXUOygrImDVVGaLWZu7KVLepPq3NN1nzlh2Q08xma5l4i84xQwxwL8KZl7flMu6tps+aKNctrmwwSl57Yg8e22onGlJX63aKnHCq3pa9C7gGXZ1qW23LGyKtz15ZbPRpeek5JTjBLciZmLuBgoaDHHfPbLZBX7vyYf44QQ/G2BrcLTh+4m8cG+8G/WHqVxn6fE7NrVsIEBXwpeKfanlbIJit2P0RZkXVsG6W34Qfwqxzfy9/aaQZz9BnQAVmlCzodlad0UOf36FhNNh3QFLc6xdKu6F9y1r81u8RUyHv+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r79r4zDLpxcaMFheGyKd3Wb6ZfryLky/aY/0Wn0XtQc=;
 b=a+tvlKkNQu7Ax9L6+E4o8kzITXaa0kPX2hzHQAUtbvfyiOPPa25nzH2gRUwnzq7SeEgmBo3+g/F5mCNSfF6KP4X7h2E9/F78ldWglWyK5pwQ46Re3jqqpgjyVgW/fbQ5t+24Yr6r3sCZYiFd8iZaHnNNEmLkxHvr6WDwwz9nQu83s1/KJWengkt7hYyFh+fDN8e93stWf3WEFiYnS2rNoNx94qdE1xxQPQNfdI++QaeuMblqhuOh60nYWXaG5eTa7L96gwPctVwfU0ZKJg9uKL4GoLOfXLfU0QJ4aM8L3O5jdOaQOUE+bJdCVmmy3Yb/mV1MTvduPtu7hXVA7Xyt7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r79r4zDLpxcaMFheGyKd3Wb6ZfryLky/aY/0Wn0XtQc=;
 b=vNiseCnxflngo/e0nDJGZlnkYKyIroc+N/fNU/yIR2oKbCxWowf8lQrEOlZxojcMJ9qtt5FV94YZ/FgDiVs6eoJRqb/4gFwqPCttSbB6cx5a+QHLuYy1DdxGTDma3OOSBNiaHtRGYRgS61Zran15GigmwrZ5kUUQfDjo7EpG3kk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1b55c7eb-3e39-43d1-80d2-2d4caf6a0c76@amd.com>
Date: Tue, 10 Dec 2024 17:46:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 34/35] xen/console: enable console owners w/ emulated
 NS8250
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-34-e9aa923127eb@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241205-vuart-ns8250-v1-34-e9aa923127eb@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|IA1PR12MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: 308f0978-f5d3-40b8-32bd-08dd196c7659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cC92dkl1NFRJUUNMdmNPbWoxb2cxNktFZVdVVFg1TmNmZWlCR2lQMFVXNDRW?=
 =?utf-8?B?V0JPUXljSVNTUTRlZEorMFlrQlFEVGI2RHk1b1Z2M1p4NmNTWnhWcURNeXBB?=
 =?utf-8?B?MkMzcURSeWs5dTVHeGxmYlMvb0NSdWVmNTNvV2NMWjlQYy80cGxNMWNFdDlw?=
 =?utf-8?B?M2thWGNSMEV4QVhmMFlMWkJkVDF0cW0zRFN2TUd3WmFNZWhaUWtTRWMrMkc0?=
 =?utf-8?B?RnZQRTVvYURwTWRHZ1l2UnB5cUk4azcvUE1YcEYrdEFJL0dFLzIrVVJuQXhT?=
 =?utf-8?B?dDFvSnZVckpIV2JrcDFJVVZxOFlETGx1U2ZYMHhQbU1VWGpMeTYzVzhhSGVX?=
 =?utf-8?B?c2t1cS9iYWhjL01RVjhKMHptWHJFZFlZVHZ4cWE5a0tOUGpaNDhpYjhoOWxD?=
 =?utf-8?B?K01OQjY2SURISmtOdWRBYThmUWlBaGNhRFZtNGlhYzNNNTB0bTR4dmlENHY5?=
 =?utf-8?B?WTlrV1dFRmFLN2VyNnBpRXQxcnBPL2FXRjl4R2VDTlVLbDdvTW5NOUcydnA4?=
 =?utf-8?B?L0g4US9vbmlYcFJYVjROdVZxNFIzRDJRaklSSVhOSzk1WEdRUks4NlJnZ2VJ?=
 =?utf-8?B?Skliem92azBkWVJ1dGlUd09CdGJpajZMbVBya0l3QVJleU9OZGF5TUt4ODNp?=
 =?utf-8?B?VE1OTm4wN2NtY2tycFduRVpRck5FSHRqSit2WHdQaUJZTW0yYUpoMlU5QXl0?=
 =?utf-8?B?MmovWSszOXhjL05BK1RjTUM2RjZLeW83a01ta1ZSWTM0UkRKRC9ZMlhFd3Jn?=
 =?utf-8?B?Y2VndVExNHYrYW5Cd3NKOHJIUlNKdjRCWnJkNXdyT1ZGVm1IV1RZSjhNMkxP?=
 =?utf-8?B?Zm1vSy9jWXhhL2ZJeXZlUjF1eE04UjJjWGdEeDk1T0habkpQd3lhcDFwckdu?=
 =?utf-8?B?QTV2ODFYeDh0cDR0QUsyQ2gvUXJDaVZkR2o0dVhyRDE2Q2xPdyttNVZINnBo?=
 =?utf-8?B?YmxCL21WZzJnZHNKOGVveGRhazlzclM5WUZYQng4UVpxck9nSURQR0dMUVJz?=
 =?utf-8?B?dWNLaUtZcldXdEpZaGxzeENYRFp4eE9MMHVMeUdhSkhPZWR4UmhDc1pBSnIx?=
 =?utf-8?B?YWxqbmhYUW0vMllSUktGMCthZWg2NVFRQld0eFFPVEoxaFg1czBrZzlFRFNY?=
 =?utf-8?B?U0w4VXAzNnhDY3g2b0tQSmxFVkRwWFZESCtOanZ6dHEyM2thYmgzSnMzZzFp?=
 =?utf-8?B?VnJBdzgzMlorbXdHbjRYL2dralpOVDdOYVhnTW1sTW9LSUtwYjNaQ1NrdDVm?=
 =?utf-8?B?UDBBcThBNis3ZWRFaUtvYWJJODRUU0NsdGVJMThDUms1UXROU0Juakp4eVZF?=
 =?utf-8?B?NlpmZ2V2WnZtUDlJZmRoazMrSERpWHhHKzc2UGZza0RSdkwzeHRSS0VJUld6?=
 =?utf-8?B?RGtKWXZIYlRWSzYySnhVNFJqT2V1SElXVlZkRGYvUjk1L0hadXpoODhjU3Uz?=
 =?utf-8?B?NE5GSmlYVkV4Tzg3MjVGVXVFN1U4akNRMGhoVUVYREtvY2NZZ0U2VlB5ZGdv?=
 =?utf-8?B?VFVGNFZPeXl0dUk5c1QwYkN5cXgyeG9tUHV5azM2YVZCckV4MHRES2drdmdS?=
 =?utf-8?B?YXhIWTNkVjlsQVJRc0ZDZW4xZTk4QzVKWkh6S3IrRjV5M0Q3djRpNS80bnVH?=
 =?utf-8?B?cEJHQWEvQThlL0lvZkhpZkRTOG1CbXA3TUpxaUhDaThLVEc5Z1lPNExIdE9Q?=
 =?utf-8?B?UndKcmVrUnd3RFdUaWZRaWxnN0t1WTB5d2JlUWd5MFp3WmtVcWVHMjB0ckRr?=
 =?utf-8?B?THo0OXJCMGd2SXFWZi9DZ2cvU0xXVGczblRMWEJaOG9FSTNiUHFTdWxMT1Na?=
 =?utf-8?B?Q3BmM1dLcjdvc2o4OG84V1lyS2FZYnhoblgzRjF3RDg0bW9vNVpZL2hURGhL?=
 =?utf-8?B?and1UEVkVW96bmlqd08xSmM2SVZyUnBTUHN5YlI0Z05CVzlvYVFjeDNMMnNa?=
 =?utf-8?Q?YctFbeZ65cs5YjWUo0HMuCHHJyOG16mx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 22:46:18.7635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 308f0978-f5d3-40b8-32bd-08dd196c7659
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6604

On 2024-12-05 23:42, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Enable console focus for domains w/ virtual NS8250.
> 
> Code change allows to capture the output from the guest OS now and send it to
> the physical console device.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/drivers/char/console.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index a26daee9c4c4b1134d0ae3d105ffdb656340b6df..798dfdf3412a2feef35e72946d6c59bee59a9251 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -41,6 +41,9 @@
>   #ifdef CONFIG_SBSA_VUART_CONSOLE
>   #include <asm/vpl011.h>
>   #endif
> +#if defined(CONFIG_HAS_VUART_NS8250)
> +#include <asm/hvm/vuart_ns8250.h>
> +#endif
>   
>   /* console: comma-separated list of console outputs. */
>   static char __initdata opt_console[30] = OPT_CONSOLE_STR;
> @@ -627,6 +630,8 @@ static void handle_keypress_in_domain(struct domain *d, char c)
>       {
>   #if defined(CONFIG_SBSA_VUART_CONSOLE)
>           rc = vpl011_rx_char_xen(d, c);
> +#elif defined(CONFIG_HAS_VUART_NS8250)
> +        rc = vuart_putchar(&d->arch.hvm.vuart, c);
>   #endif

I think it would be nicer to just use a single name and avoid ifdef-ery. 
  vuart_putchar() is generic and matches domain_has_vuart(), so that 
seems good.

You can then have a default stub that returns -ENODEV for when an 
implementation is not built.  (This goes along with Jan's suggestion of 
a common, default domain_has_vuart().)  Something like:

#ifndef vuart_putchar
static inline int vuart_putchar(struct domain *d, char c) {
     return -ENODEV;
}
#define vuart_putchar vuart_putchar
#endif

and ARM can do:
#define vuart_putchar vpl011_rx_char_xen

x86 would need to change its arguments, but that should be straight forward.

What do you think?

Regards,
Jason


