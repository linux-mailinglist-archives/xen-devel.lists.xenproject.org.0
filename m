Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1499542B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 18:14:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813317.1226200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCqQ-0004Np-1r; Tue, 08 Oct 2024 16:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813317.1226200; Tue, 08 Oct 2024 16:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCqP-0004Jk-Us; Tue, 08 Oct 2024 16:13:53 +0000
Received: by outflank-mailman (input) for mailman id 813317;
 Tue, 08 Oct 2024 16:13:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syCqO-0004Ja-4L
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 16:13:52 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20623.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d234923-8590-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 18:13:50 +0200 (CEST)
Received: from DS7PR07CA0023.namprd07.prod.outlook.com (2603:10b6:5:3af::28)
 by MN0PR12MB5858.namprd12.prod.outlook.com (2603:10b6:208:379::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Tue, 8 Oct
 2024 16:13:37 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:3af:cafe::3f) by DS7PR07CA0023.outlook.office365.com
 (2603:10b6:5:3af::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 16:13:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 16:13:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 11:13:36 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 11:13:35 -0500
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
X-Inumbo-ID: 4d234923-8590-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vwuayvcub7BGPPcMZ/xW/yNYRd+gxuqE/HoGp5t3eiEi4rPlROj4y8gTqCqGmHQ8DxGH2T58/Wjhrb9CXZYKGpPFyf2JFqGQk+7r/V/KOW5OlbIz2r99bN8teYOcrpbnbkREGCik9XWwznqwDegCo/o8tYPCYhNemS58W5esfOEfTxLNFhf6bQUV2e1CNCzFN/9QGdrzYcNUmyCzkhSm4UY8uadPz8ZvITNGy5XTY2sScRLUsa3fRnkG3vGHJfCv1KK/0q2uV3wcixqyeyqfNMIQzfKKshpWUha52RLhYQLuGwg+0L2Gy58hgoVFcBHWoXWRyiuwg8FddEa8hsC1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/wLgfdjPfry5iwOwVFF2Sb4MZxo8UqwRq36uhx649w=;
 b=it8AfOuPkMOqIZ7AJba1wxcRVa7mehtCc1kYVG2TDv0Lvn8zp4d5RU8jDfXzBi0wKi367mjQG1bzGfPgL2zTi+G3uld0qR8nrfMQ4PsoczstB/SNjWt0mo2d57zBib+VoBc2nurOZqw1ZpUJzApgeKLfP5m/33otICfnOw9SuEGF9N5Df/Chsb9J05HCo080Px/2dqqUgnKM7hJpIgIj8sXaBrKiTsnWR/9gr9TIQF2UkRJ5fJp9Sdf3HMihtNgnLi467mB/+UAp5CXcpTHyHg3+ZbNNJK8GlZMwiorxL5GbPFfSZTjJ58C39//qIGWR4v22rweW0EaofQXqVNb8mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/wLgfdjPfry5iwOwVFF2Sb4MZxo8UqwRq36uhx649w=;
 b=t1WEs+6M2PWMxQZ0I87kC267Z5adEfAx0Q70pmG6VDF4IOCu+PuJMCGBcfNAgaRHapwkCMKPNQvLUJ5IqdxfLuvEu48SPMeCNhVC5WpSsbj5uVORefDcKZ4siUdO4qyuNIYd2J3bvkkGtuDaIPJdq8IL7LRxRMUluGMHZ+EZGNE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <eaa648a6-c34a-47c5-a4fb-a3e56982abba@amd.com>
Date: Tue, 8 Oct 2024 12:13:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/44] x86/boot: convert xsm policy loading to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-21-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-21-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|MN0PR12MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c07a5f4-6e63-4ff3-66fe-08dce7b42ace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWdlQ1krTUUyVmd6Nktxb3dsYjVaUitwQ0NXQTB0aDFoYlQrRUMwRjd2anlZ?=
 =?utf-8?B?ZXNuakxrSXZUczdTRURPSnRYenk2cFJXNHlyQUxvZmdvQnBhUmErbFUyemYv?=
 =?utf-8?B?MnoveGpuZUR0aHkxM1BFK2g4cENmaHNPWVBWOGJjaDUyUzQxYmk3cTJWanA4?=
 =?utf-8?B?Mk5YT0t2QW9TOStFRnEzUEtUdVhFNmgvNUJDVWFBbFRZVkpyQjFPbnpLUnJu?=
 =?utf-8?B?UGdlRkhiNkZXcWxFdUREbk9oUU1VaVNCYlNiejd1ZXVVeU1rZ3JhTzVXem8w?=
 =?utf-8?B?QkpIbFhyRkpBNTVTNEdVSTRXblJ5RVg5Y3pOUzFXVXVnQytnd0NXK0ZnTGRD?=
 =?utf-8?B?TU9JcklQTGhza1NEQXhhemluZHhLbVVzOUFic2NwSFdDME44WTJXYm9CRVU4?=
 =?utf-8?B?VjZtR3B0a2l6bjlwTU5TMTlqMFdxdVJibjhwNVdKV2N0eEpSVWtMUHI5Vnd4?=
 =?utf-8?B?RWJVREN6a0VuNHBia1dKcVZPaGhNZU1hM25kK2owZ2ZaZVRLZDRvL01TV3hS?=
 =?utf-8?B?SE1LVkZiN3ZwclhDaWtTZWU3d2szNmdGM3VoSm5iblVuMGpwSlBsZVRpbTdK?=
 =?utf-8?B?MFdRYTBKMUcyN2tETmVYaHB1c0plQy9aSG1LZnkrYXZjQ2dJbC9DdEkxNW9G?=
 =?utf-8?B?anl1QStNTFY0Q1FFR004U2xRQmZKcVFkdkxtTEdKOE40ZEc1d212NU9IdUkx?=
 =?utf-8?B?c04xVDh0U3hmT2FKeDR6TVlPbjcrUVNzK2lWWXg5ZklUWHRjZjFFYlFXczcz?=
 =?utf-8?B?RDZaMjllVjNNSXhoblA2bENqL1VoZjhUQXJvQnQ2T2ZKcmtGTm1wdHhNaWYy?=
 =?utf-8?B?cWhzWUZtNUl4MkhiUThtZjRiVU45aThQaitBZkMrUjJWL1hmVS96TTJOZXJi?=
 =?utf-8?B?RjVWcUl2Y0xReTJBMXR5NHJYbWUrcmc5MTFWWVZRWG1jZHcrUUpCb1BZRGFt?=
 =?utf-8?B?ZkVjY2llbWc5bjdjWG5jUklXSFMrK2dHZHAxdGtxYjdyMHQ2M003alNVaVFu?=
 =?utf-8?B?Rm9MSW9ZK1FYSzdBbWlRazUrdHdIb3JqeHVOYnA4SDZwUHVZN09HZUNZU2Zh?=
 =?utf-8?B?Zm5vR1Z3c3d1bExBNkZwUlltZFZLRU1aeXBoQ3hHR0s0anV4dXplclhOL3JO?=
 =?utf-8?B?YjhBQzRndVNsTUlqcVhNelQwK0Z1SjB6RUloOVp2SUxiQXBFelNzejQrdkNo?=
 =?utf-8?B?bGhOZ1hYS0JlSytEWm9XUUpiQjk3NzhNd21FRURpYzBrNjRxYkpFQ1Z5SFMx?=
 =?utf-8?B?OWs4Rks4RWV5S1owMXY5SUswUExvV1RKckpvcnRYck4yZ1lHT2hYME1SRC9a?=
 =?utf-8?B?UmVSdmdjSXBpdVFlYkRiZzF5YnlXMER6amw5bUd5UTBVRGROTGFYWnYrd0Nr?=
 =?utf-8?B?SWNYbGc1SVJiNzd4cEI2YUNwSk5paXpTSWRTMUROL1BXNjRFQXZleDJlT3dH?=
 =?utf-8?B?K3djSXZLdEJSRElDOWZYUFNKWWIyRnNHUUQyYnhuaUltSTZ0L1pnUjJrTXNx?=
 =?utf-8?B?SmpvZnU1OVZ0WDlSRjJUa29xZlZqUmJ4OHZWK3YreGdGbWhqNER6cE94RjZF?=
 =?utf-8?B?RDZnRmJlMDZzb1lYRW4wNHBIajJ1OTBCTFpUYk9BQ1RKK20rMm1LYnZZNk9K?=
 =?utf-8?B?clhQaFQvSHBGUXZZak5abityMFZGajU1SmQzSzZLQ0tGdUpmdjVlZHR0WlVx?=
 =?utf-8?B?WkVBVTkrUVpQVGp0dkN6VU5mQUdLekk3QTVCdktTZ2trTXZHRnJPd1VYSUt2?=
 =?utf-8?B?TDFUQXFYUy9ZQm9QR2NhVmh0a0xmWU1paTd6bGtQRnQvanBJQm92Wm91UE9X?=
 =?utf-8?B?d0NSOTlPa3FDazZTUzBaNVd3Zno3MG5DMnI0UmJLNzJFTWRpRmVPRE5nR3Z3?=
 =?utf-8?Q?T5tTskbKu6CGg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 16:13:37.6973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c07a5f4-6e63-4ff3-66fe-08dce7b42ace
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5858

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Iterate through the unclaimed struct boot_module to see if any are an XSM FLASK
> policy. If one is located, mark it as an xsm policy.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> @@ -161,6 +162,14 @@ int __init xsm_multiboot_init(
>       }
>   
>       ret = xsm_core_init(policy_buffer, policy_size);
> +    if ( ret == 0 )
> +    {
> +        int idx = first_boot_module_index(bi, BOOTMOD_XSM_POLICY);
> +
> +        /* If the policy was loaded from a boot module, mark it consumed */
> +        if ( idx >= 0 )
> +            bi->mods[idx].flags |= BOOTMOD_FLAG_X86_CONSUMED;

Maybe xsm_multiboot_policy_init() should return the idx used instead of 
having a second search?  (Also, xsm_multiboot_policy_init() can't fail?)

> +    }
>       bootstrap_map(NULL);
>   
>       return 0;

The other changes look okay.

Regards,
Jason

