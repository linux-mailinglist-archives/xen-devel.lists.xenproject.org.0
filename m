Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39E1D23687
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:19:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204424.1519092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJVo-0004Na-OX; Thu, 15 Jan 2026 09:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204424.1519092; Thu, 15 Jan 2026 09:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJVo-0004LC-Lh; Thu, 15 Jan 2026 09:19:28 +0000
Received: by outflank-mailman (input) for mailman id 1204424;
 Thu, 15 Jan 2026 09:19:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE43=7U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vgJVn-0004L6-1o
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:19:27 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47eb45ea-f1f3-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 10:19:24 +0100 (CET)
Received: from SA9PR13CA0171.namprd13.prod.outlook.com (2603:10b6:806:28::26)
 by SJ2PR12MB7799.namprd12.prod.outlook.com (2603:10b6:a03:4d3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 09:19:20 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:28:cafe::e2) by SA9PR13CA0171.outlook.office365.com
 (2603:10b6:806:28::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.3 via Frontend Transport; Thu,
 15 Jan 2026 09:19:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 09:19:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 15 Jan
 2026 03:19:18 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Jan
 2026 03:19:18 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 15 Jan 2026 01:19:17 -0800
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
X-Inumbo-ID: 47eb45ea-f1f3-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSJQGkIQsP+0Y9LCeT1w7e0M1rrTXt8YWip6b0WIDIAoUa5sAF+s7HUlfVpCHLPgLbmkf5RBHMTuAonPnV1A8w3WNRYNVM8wDlaSI+5gRdQ+CRdIW0tusFHw/wXjHWTxfjt2g93PEkr6ORK6FanLr5og49PpIGFu3P+zUiR45KeiEpuWqZxc3UvcSpo0lwhquFnpa4ShyA+bWSyc+61ngR7Zd1ApF0jCjOMwi0S6v9k7eIOG4uya0jYM+QMAEJMPcl97BGb8p1KUqcz00to8x57T8KVd/usoIYfINvJqVQz3Cf7X7pSWbOCZLVxMPJS9ED5dnr7PMLF3nt3tJe7K0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iH1wPPQQd26x/9jv9dNBM+QsAcaIMKkHjiCJ5AWGuPk=;
 b=G6N6UZdREwy4bc9N9KDwR8UfB2a45ZK80FfJNdAZuili4FdgfylJ/tH3glXknBudr+998VeyxRO0vSjPUATZl/1aKX3HbYZDWZou7L6eY18V9TJQhcltr2vUkAvzL2XNg+1lO4+nYYFMdY2k8BASvjqZNAsJVGLAOkPXm+e7hfeUn8Oh/uHfZMeuGo+JjzVgDOEQMQC2XiJQh7i18Z/6w6PRAZqzOMvQNe9ljAefpt/tBFtuLOVJ//w+pMSaKULIJAvSnPj17dEMcFbNFbCJ6rLxvh6E3v33/4k0vO0KjKGitf9pw3vJiMPHkvWXchyEd/OoLx7UhunCwHTLBiMVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH1wPPQQd26x/9jv9dNBM+QsAcaIMKkHjiCJ5AWGuPk=;
 b=C1f7WFoDKHcSCfs8b0mvWoeKES6fr3YlrugDmH3k/yVY+szUZ/33X3M3B48ePFk4wPXGsh+WFCX2gpVjp1ssrqarm4IHPnoHv0zEJDOgQAfUooB776+rvCfdx05lPhn0L+PnnO8p54B9oWCSeROLUc/AVt+C6kvP/aCZJt2r4UE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <9e811c32-0786-49fa-b54b-18c33104632d@amd.com>
Date: Thu, 15 Jan 2026 10:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] arm/mpu: Implement vmap functions for MPU
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260114142734.239197-1-harry.ramsey@arm.com>
 <20260114142734.239197-3-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260114142734.239197-3-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|SJ2PR12MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: c9183a1b-3d19-4711-9aa4-08de541729ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3BsN3g5RzY0Nm1BYWxib212aExOdWVpdmtwbmhXWFBGbTMycTAvODBJQ2Fh?=
 =?utf-8?B?ck4rZ2N0cFRMcXV4dnhQYnR1UTIwTEVBa3krcmNRQXFVMmhDdmIzV2ZxcUdz?=
 =?utf-8?B?ZnZaLzBXTGdjaW96ZlpIRlcxVHFvb2Vla2xDOTNvN0MyZEpCYjZLKzVJZnF3?=
 =?utf-8?B?emZPUHFuSVFlM0oxUUxiV2dralF2ZGVpQ201cUdyWUxzSXFnUGx1ak9TNk05?=
 =?utf-8?B?Qi9rWlBudGE2RTVoVzdVcGVoM2phS0JmQWVWS1ROT2FtcXhTbkNqak90TXZs?=
 =?utf-8?B?ZXRiOXVQVmxLWGlNeG9nQWpUdmQ3a3cvNDFET0JtYVFGa1REYmdqWVJIVzJ0?=
 =?utf-8?B?R1ZQWFNCL1FZNXRZL2lSZmJLRVNQbENWS2JueGZOWWt3ZEk2dnN2QVEyOEMx?=
 =?utf-8?B?eTh1bzUyYkQ2WDJuTGczank1RC95amRyeU53K3lYSlNXN0lDRllsNzkxelJy?=
 =?utf-8?B?WXB5a2tRQXozSG1DMjF1enFaMTVvS01aZUM5K29tOGNYNWxJR1ZPYkRjWVNh?=
 =?utf-8?B?aSs2TzZtZG0wb3cvQnRodTZhNjZlYnVvUVJOVnU2ZzlaR0RpYUJFRHVaYXE3?=
 =?utf-8?B?bU9oV2FoR2VjN1dqTzJPcW41YUxhQjBNb25NYU5rQU9mZFB5RC9ROStTdFQv?=
 =?utf-8?B?d3liZ3hCeWFSTjBpaVM0OXgzb0I4dERUeTRMNFV1VnVaaFVPb0FKaFU4Z2Nn?=
 =?utf-8?B?Y2Y4NG1VL29rbmo2d0IrQ2dIMno0clN5N0lzUmpmTEQ3QXFWeWVESG1mU2NK?=
 =?utf-8?B?c1E5YnFqWjdXVEM4KzI5ZnJDWUlsbEdlTjBZMXZNRjd4WUhleXBadFlmV0p5?=
 =?utf-8?B?UkNHb2NiSVBKVFRqZ3EwSlVTTGo3ZDFGYTBUWHJlblZKdjRsNmdFWDRMRmxj?=
 =?utf-8?B?WWVHNHhXRHQ2UWRVQ3JhZUY2RFpHc09RWUphdGpIVmN0UXFFS1BvVWY3L2JG?=
 =?utf-8?B?R0R6MjgzMkY2ZlJ5cE5ESlhOYW5hQ2FIUURoRnVxeWk4cXQvYU9mWTJ2VnJn?=
 =?utf-8?B?L1pZZ2w3ZFBTNUJrZmV5KzErY2NVNVpncnpHR2ZENmViVmpacXF6cDYzTUJF?=
 =?utf-8?B?d1RxZ1JSaFVrMVpreDJZbytPRG5ZZ0g1d05pMFlwQTB3VGJ4RlNwYzQrYzFx?=
 =?utf-8?B?d3ozQlhlUkh3OWJMZHN4ZTE2eDVrb25teUdJaWFOcWk2OWtqTVVCOWVnQlR5?=
 =?utf-8?B?Smc3dVRLRVg0Mmc4T09YOEZSMllXZnhqSDh2RWtpa2RhMURkMXBkK0JuL3RX?=
 =?utf-8?B?MzFsUUxDMGtoelc3V21jRHBZRmZjZGpsbVJHYytDRnR1elhrSzBhcGhGQlNQ?=
 =?utf-8?B?RUhhRCtibURvNVlsSmJ3SHNrclZqTGZTcWRuUDVhczBMZ1BEYzVYZXNjdFlp?=
 =?utf-8?B?Q0p5ZCtPTlJjZW9ETFhwMUNxeXNPcHl5QXoyVGt4L3kxVmc0bDNmS0hITytH?=
 =?utf-8?B?dzRpazh0TytqcS9zSFE3VnVZeEdRMzdtMFJwV2syUlo2Sit2K0REYmh2MUt3?=
 =?utf-8?B?RWZiMVhtczdkRmRlT2NWNWVvVGNrY0FEUGxNbXQwMDZTWDRqVU9aTmFvRkE3?=
 =?utf-8?B?WjlJOHNzWUtUMCtRSU9iUTdib3FnMG8yck9Zci9vQWdzY0ZOZUI5WmxuU2gz?=
 =?utf-8?B?TERnU3p3bHZpY095WTlseDlNK09BNUxnaCtxTVhnTmY0Z1M5YlFNWXFvVFpJ?=
 =?utf-8?B?OU5jK3kwbFdvbDlNMU53NEpzSysxUWgva0lvbldxRXRtRFlYd2tuV28yOHFI?=
 =?utf-8?B?MXQrSW9nckpoUXErSGxnSk9mOXR4SlhvcDQ2alA4UjBBZUVZR2YvUC9rOEYv?=
 =?utf-8?B?Q2ordlNwNFY1c2YxVXRPYzR5MDVEUElHc0dHNzRzQi9vMXd3dy8yWnp5S3Jh?=
 =?utf-8?B?c3JYNFh0ampZbXZTZnpPT04xbEI1eldqcXpjQVk2ZEdlMWgwdVVIR0Z2b290?=
 =?utf-8?B?VEFuRTB5RC9maUwvMGN1eUJla2F4Yk94V0xOUStvYjlDcXJ3QXVpcU5DeWR6?=
 =?utf-8?B?cVQ0M2h0Q1VHcC9GWVpBSlF1ckh4d3dQV1d1K1JaSUgyZkVIQkRXL1VyNVYx?=
 =?utf-8?B?aTVWY09DTFNscnE4aTNKUDl3a2JpakVZVXE3MTNhU0M5UHl6eTJldGhzMVo4?=
 =?utf-8?B?azVKenRaWklCT3FIaHhleXFCSGRVSS9mODJ1OFRRVTljcVVFdmw1NDI0cmdy?=
 =?utf-8?B?SHlwRE0xZUxCUUkza1VBakVBNS8xSzAzVGVvMEJkbEo4Ly9sZTQzUzFFWDF2?=
 =?utf-8?B?U2tUTEYwYVNURFdVYkx3cnVWTVlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:19:19.7085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9183a1b-3d19-4711-9aa4-08de541729ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7799



On 14/01/2026 15:27, Harry Ramsey wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> HAS_VMAP is not enabled on MPU systems, but the vmap functions are used
> in places across common code. In order to keep the existing code and
> maintain correct functionality, implement the `vmap_contig` and `vunmap`
> functions for MPU systems.
> 
> Introduce a helper function `destroy_xen_mapping_containing` to aid with
> unmapping an entire region when only the start address is known.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


