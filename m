Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E0EA84EE0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 22:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946337.1344277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2yxg-0004FL-GG; Thu, 10 Apr 2025 20:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946337.1344277; Thu, 10 Apr 2025 20:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2yxg-0004Cd-DT; Thu, 10 Apr 2025 20:57:24 +0000
Received: by outflank-mailman (input) for mailman id 946337;
 Thu, 10 Apr 2025 20:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Tv=W4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u2yxe-00042M-RN
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 20:57:22 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2009::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62bf843e-164e-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 22:57:17 +0200 (CEST)
Received: from IA4P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::6)
 by CH1PPF16C2BD7B0.namprd12.prod.outlook.com (2603:10b6:61f:fc00::607) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.25; Thu, 10 Apr
 2025 20:57:02 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:208:559:cafe::c7) by IA4P221CA0008.outlook.office365.com
 (2603:10b6:208:559::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Thu,
 10 Apr 2025 20:56:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 20:56:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 15:56:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 15:56:45 -0500
Received: from [172.25.231.87] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Apr 2025 15:56:44 -0500
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
X-Inumbo-ID: 62bf843e-164e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GV/bS8lpGk/4y5nycwNYhYDOr5/Uy0JzFeD92kgXXjCPzUwHenKdxy+ktJPKzMF7vJLSrgVpG6gZToUD6ia2LcQ4fDMaiidUbDjP/fme3sZ1TIiCK2FAe5SvzPkBsxA1XSspgcg5r4yQgSmIsyHFE7TRV5fQmmp5a5LVkg0OkKKkx4cmWkg6kJXy673YQIRUkUr+XFN+1f2kPQEe6hjqT1zv+nMQ3OOGFKgk787bpSddA5SU0/FkfDrrQSmlaPSsfeLLZxJsGysl9y5gKCT9ROxHp2+NxdozLBjBU8hnjYIThohpvCWH+X8SpfdOdxVJk4wugVdrLz4ecBk16Zze1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BkwjW2bc9cIfjxF6BGMr1rI3Ay3yWUXqJSKgGEh344=;
 b=ijgZ29KVsm7LT2Nc5OquTwK/JA3xDDcZ8h6+24gKwInSSBQmY4pBethgQF0hfS/KCOXjleEhESS6ArWvqlDZt/SduPHnbwluX5sKVV7zLg4hj84zjMRLvKgNijm6kky174YmeEOTF2Lq7FdQ8z/donHxJwqXzBGK9oXYh3NS3MRYix/vjb8bkyfXtwJIwSnG8XWrSncLchgBMY/BSVq8i+umUE4GQSlw6LefKJiDZOC6jMwrrY3P9hxfGSW5+b+q9UtS8e/Q98T5bNV+yBMl+8UGx6LFPeKHP5cqe2dtZ0+FhneHNnp3vuhuiLny0fL/J5tzzGhsBIxNsrldLS0V6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BkwjW2bc9cIfjxF6BGMr1rI3Ay3yWUXqJSKgGEh344=;
 b=oW8XwKo5kPokIusy0oePF2/bh9qLz1pnHJLqretuzI285ssGmqI4R4+jLGdPT6NPiiFzDtgRErCBSCEBW3aKpXRqJPxdCCL8uT9DPzZx8xOGlTDKFmFpAG1AVEYbgQNGdy7R2hzd+PL/I/wNi6/J/0nIT0sxCzLrmqwLGEv7pjk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <644cdc5a-b96a-4e43-ae7a-4cadda1d1084@amd.com>
Date: Thu, 10 Apr 2025 16:56:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] x86/boot: introduce boot domain
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>, Alejandro Vallejo
	<agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-2-agarciav@amd.com>
 <141229a0-2cd2-4886-b5e5-02c85b0ca5ab@suse.com>
 <7fa754f8-d785-45d8-b9da-de5c85bc793b@apertussolutions.com>
 <f0a14866-0f38-4f8d-8e11-993a58c7da7b@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <f0a14866-0f38-4f8d-8e11-993a58c7da7b@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|CH1PPF16C2BD7B0:EE_
X-MS-Office365-Filtering-Correlation-Id: 50754845-9440-41ae-e82a-08dd78723c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3FRaGlLOHlwcHhxVlp1TmE5R28wT1VyVENueXAvYTFpK1cweTFJUHFzOGtU?=
 =?utf-8?B?cHVyQVpVazIzWldOT2k4RGZTQ1dlODRZNVVLNjd1T1dIRHRWeGRVNUlIcmNx?=
 =?utf-8?B?UHV3eCtOdnJDS0VIcjdpM1Rtc3FtVWVrb21VN09zMnZ3SVFBK0U3S0JCSmFG?=
 =?utf-8?B?WHBwT2daNy9Vd0VTYlJqZkVKQ3hxc01kTkFweUJ3MVZ0aTFRaFNwZG1MSS9s?=
 =?utf-8?B?M0dTb2JWUW9TeldERmdSaXFpQmlQT1hZK24vQnNnUTZncHJHcmZ2WjJocW0y?=
 =?utf-8?B?UFBBc1d3MDhiMy9lZkNUOEhhMWh5SDN2VVV1cUlvOFcvZkkzOGZMOWhPNlky?=
 =?utf-8?B?V3FnQ2UyOUhiVkJIRWV4a1V0anVmYUg2REdualk3bUMxQm9UdUVJNGxaT0Ra?=
 =?utf-8?B?byt6WGtXN0xIZ2M3dHNjM2JtamhGSldibjhaMmNFUklOckphRVB3U3ptUkpX?=
 =?utf-8?B?SUM5VjRGb05TS2VMYzhWTExVb2N5Y2xxaG5xdzBlS1Y5YUxUZXlWRnZtdmxC?=
 =?utf-8?B?KytWbkE1QVYyUlZ6cU85ZkZobmJzMDA5ZjFCNnR3dVlvcDdWN2JyNlRMR2tP?=
 =?utf-8?B?WThhQTVXZENIUlR1NDRWMXg5ZEljV3k0UlF2endpbkVYbnFuM1BzOHlKVCsw?=
 =?utf-8?B?ejdWNlBTYzNjMVkwVTVzUlliSzJJcTgvbnc4MU5SeTVqZDhndVM1aXpNMHcx?=
 =?utf-8?B?YkZnNnhxU205ZjZJdWtDcWpwWHNKb1EydlNjRG9JTEZvR29qcitJanBOVkg1?=
 =?utf-8?B?VVdLSEJic1ppYjRiTnJ1b3NJVHh0d1ZRcHVJTkt1aUdpR0ZIZk0vU0hKSldy?=
 =?utf-8?B?WHpiMnBTVGJ4d3RlUXlQU1RnUjByRkF6dUpFSVpEdC94ck9XZUx5TGxjeUlK?=
 =?utf-8?B?eGp5VkZwNWRvZnJCR0pRbzBGaG1PdVlBdk85Mk94eVgzVGd6Y0FFcEozRUNL?=
 =?utf-8?B?a1lhUE5KUGdnQ0x1Um14aGQ1VmF5TDhPZVdubVFCLzZoTG1hYTZZOGhST2E3?=
 =?utf-8?B?RjJqVnU5eW5VbTJPQXVTbFlLRHNBbW5VSTJqd1RCS21zRDkwWiszM2NjMzdQ?=
 =?utf-8?B?bTdOWVRwL0ZBK2hOUlp0ZFU5TXdLNDU5dkp3clBYQ2RVeFlwZUdOZlBkZ0Z2?=
 =?utf-8?B?M2VVSDNxV0Q4dmVOajd0WHhOZS95ZytqSDRMcGF0d1hmUkp3T3pLMUtITUJ0?=
 =?utf-8?B?WGl5aG4xWVFXZ0wrWUFOSkV2LzhQVnpHaitZd1pVSjM1V2FNZFYzQlVxYy95?=
 =?utf-8?B?cW5SbFdlSnhhKytvZkZVcXRCQnMrQXNXcTlnS3ZpaEQvdjg1OGNWeC9jRlhs?=
 =?utf-8?B?TGhZdkc4akFzVEh3c2orRDZQLzEvQUVJRENENHl5SUk0U0Q2L09Nd2xuTEVR?=
 =?utf-8?B?N2lFdXU5SityZFFjOVdjZS90czFwd3NPdlRuRld3T3JxNmVuWVVHOWRNV3lm?=
 =?utf-8?B?RFFQV3FMcHhUT2dpSXQ3dk5LNjhSRjB0OS9IOGg2R1NTdXJFTGNUREtlcnI3?=
 =?utf-8?B?L1NuVlU5SHpzUGtlcE5RUmU0ck5iRUxhTG5XRU52WE5qcm9WdHlzb21RSTFw?=
 =?utf-8?B?b0xMbDBrSUg3UjIvUVRDWUxjUlVjSUtaTk4vY1lCYlZkQmNXdEF0bW56WUJM?=
 =?utf-8?B?NXZuS3lVYklzM09KU1NvaWpHajJYUFhFOGNtT25RVVo0S2RjN1U3dDMrRldI?=
 =?utf-8?B?UjJtRnU3eEhDTUVYYVRRdzRDV3IwZWRPUDdESFM2U0ExR3pNRXRzSTRxN1NF?=
 =?utf-8?B?NDIzZ0FGVnJSSmpxTTE0OHdiZi9lOHJCVnAzY1k2aTBZTGIzN1c0VlJqYkY2?=
 =?utf-8?B?ZXdsT3RTWTJxeUk0QTBmTEZJa1JDVURkaVlvU29zSlRiVG1uK28xSnU2bG9h?=
 =?utf-8?B?bmZQaXF5bE9RRkhJVU42d0E3QWxYOSs4UDlIUEtTYXFXMk9HYnZpNlRSK3or?=
 =?utf-8?B?b1JxMFVjRXRPeWlLdVgxdmk3dWFzc0tEUXRURkQvSnNvVW1SMGJUSE9lSmUw?=
 =?utf-8?Q?F3UBstaKpitzxqexb1KK765W2CVbwU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 20:56:59.2589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50754845-9440-41ae-e82a-08dd78723c7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF16C2BD7B0

On 2025-04-10 11:01, Jan Beulich wrote:
> On 10.04.2025 15:09, Daniel P. Smith wrote:
>> On 4/9/25 02:24, Jan Beulich wrote:
>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>>
>>>> To begin moving toward allowing the hypervisor to construct more than one
>>>> domain at boot, a container is needed for a domain's build information.
>>>> Introduce a new header, <xen/asm/bootdomain.h>, that contains the initial
>>>> struct boot_domain that encapsulate the build information for a domain.
>>>>
>>>> Add a kernel and ramdisk boot module reference along with a struct domain
>>>> reference to the new struct boot_domain. This allows a struct boot_domain
>>>> reference to be the only parameter necessary to pass down through the domain
>>>> construction call chain.
>>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>>>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> I have to object because the meaningless rename is going cause
>> significant pain in the rebase of the follow-on series for no improved
>> code clarity.
> 
> Sorry, then an incremental patch undoing the rename that happened (with
> appropriate justification) will need proposing - the patch here has gone
> in already.

Coming from a Linux background, ramdisk seemed more natural to me.  But 
looking at hvm_start_info, the fields are called module there.  And 
since we shouldn't tie this to the Linux naming, the more generic 
"module" name seemed fine to me.

Regards,
Jason

