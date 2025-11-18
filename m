Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F65BC6C1F5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 01:25:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165428.1492198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLW0t-0001OF-Mq; Wed, 19 Nov 2025 00:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165428.1492198; Wed, 19 Nov 2025 00:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLW0t-0001Mw-JH; Wed, 19 Nov 2025 00:25:35 +0000
Received: by outflank-mailman (input) for mailman id 1165428;
 Wed, 19 Nov 2025 00:25:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3JJ=53=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vLW0s-0001MX-9D
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 00:25:34 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 410eaf77-c4de-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 01:25:31 +0100 (CET)
Received: from BL1PR13CA0274.namprd13.prod.outlook.com (2603:10b6:208:2bc::9)
 by BY5PR12MB4323.namprd12.prod.outlook.com (2603:10b6:a03:211::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 00:25:24 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::ec) by BL1PR13CA0274.outlook.office365.com
 (2603:10b6:208:2bc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 00:24:54 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 00:25:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 16:25:23 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Nov
 2025 18:25:23 -0600
Received: from [172.27.232.218] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 18 Nov 2025 16:25:21 -0800
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
X-Inumbo-ID: 410eaf77-c4de-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THlU1B/49kY+dx0T7Xm9IoBXWMX3OuEsofYrV+4m7HzQ8lUoNKc/4CSjBPKeLVk07NfCN9W6LksuBoM9USndvFU7qsDCQwkVhJS8/FEORDCTMtI8muvVGFW4/EWAKBl++2YHXTkEhMSB4tucG/dite6yW/XWn3nxmuTQE0C4SEVvNRRcPqFPJxDqFh6JzRFqeAZqh44ZiEsGM/n58FHdWg3EgHk0/eIsOT/0zCwYbmqF0PXARRccVA1RZGxz6TuecH5fE+lKvKgXWE2RQfpk3R8EpI6vE6SKrmO0+blXC29vPTc9ECXCDTpU0H458TSdCS6PLxVmtWC/tZsglVz3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nzs4L2+7DWg036yKvPvtOIUyaPcX4D0qZksOlz0ZG4E=;
 b=TIC91LLaX80TxpEysCRghya29sCi5HYZxCf3PF9UVOjBx3fJwYJtdJXEHOS8Mza17hlH+UtBibwK9cKItHwOfOxEGwjDdoaIYAMjG6k5zxUmPX6EXjP2xOzzCrqXfeZDvTNlYGaNn+zOfgzYMjKWs3rpGUVR5UX6J8YpVtPTGe8ZsmwJXW4wUIpEnNeQpnBBB8UgyXPi+Se+zKRNo4I1+1oMW3USq9r9+qhuGM4jokPyB2AGDN+9WOAEeD2gKTWGQvr1uMchdsqb2YggR8B5iQcc+aNj55K7+tFZTpgK0YE2WW4CeMjWdrQdRjxZZHgsqsY/5dTtW3lk6NEMML7MkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nzs4L2+7DWg036yKvPvtOIUyaPcX4D0qZksOlz0ZG4E=;
 b=f3WVgbvkJU41LsOjjBz4UB0L/BkX7G/aAsmnySCuCDCrSRYRbWmWxz52N9voOhYYPkHT/Gvj5azPKKdvYDZBrfvjaQT587SmtEAR9PltfbtkiSVCZ2D07TUcq+9aDzhC2ZGiNdcRvtRaWG9wvNBLrYYznvl337+7LFyZbgz2J90=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <29467e98-de94-414c-a6cc-8b49c8ed67af@amd.com>
Date: Tue, 18 Nov 2025 18:49:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] xen/vm_event: consolidate CONFIG_VM_EVENT
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Tamas
 K Lengyel" <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, <xen-devel@lists.xenproject.org>
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-8-Penny.Zheng@amd.com>
 <9ca0d80e-2566-4874-b4b3-914d8b99f33d@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <9ca0d80e-2566-4874-b4b3-914d8b99f33d@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|BY5PR12MB4323:EE_
X-MS-Office365-Filtering-Correlation-Id: fc285d1b-cee4-43b0-7a2f-08de27022182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVhDRTFheThtZTh0dERFWjVTYmY2cml0UElQSC9RTHpuRS9aMG9WOXJ3VXVs?=
 =?utf-8?B?cjJYaDVKRE9ZSCsyMWdEWEN2akdGQkdWUEo2Y3g0MlBOWDJiOWUvR0MxUmZY?=
 =?utf-8?B?cXppaCtMUGhjbFE5ZHNtUkR6RjNFMlhHSlRXMjNiMTN3K1dpMXRnQTllRGhT?=
 =?utf-8?B?T0hQV3FpM3g5b0o5YVdLeXNNMG02VHpDZTVLQ3E0akl6ak5kWjRFZEFaZ3JS?=
 =?utf-8?B?cDM3MVBzN05HOHZaMlBNbTV0cHBGSllWb2NBMzBMekx4ajk4UFFYUmxDeVpz?=
 =?utf-8?B?S2w0dy9wQk0yVi9RWm9MUDRmU0RXSU11NGY5ZVZ6ZTg3ZXVMQ3NBejUxdmVl?=
 =?utf-8?B?RGlCa2R1MnJURDVOMW4xcEhYTFlPZkNsaXhYaXJBc0VDVTV4b2FmdU9pSExO?=
 =?utf-8?B?WkIwRjFSN0tpcE1LeGtlbmhxSXVNVHo1Q2IrVnI3b2ZiUWRtcFVBRkhnS0NX?=
 =?utf-8?B?dnRiYmpWbUFlZ0NlR2M4V3hkSDRVdDZJWVdsMTNwa2RHSXlVZ3Btaktlbk01?=
 =?utf-8?B?YkQzU0hzNWNJRmIwZGhBQUxkQmh5WjViSUorcEg3QjFudDcrWTJsdXJ1VWJT?=
 =?utf-8?B?VnpMSG0xSTRxUXhqM0FLQ1IyTkdUZFkyWEpObDRMY1JhQVBBSkpMZmhJRks1?=
 =?utf-8?B?aEthNXJXWVVIU0kxc0JsdStXc253Q2szbERFbHRLbkhSVnNaNlU2NmhQaWZm?=
 =?utf-8?B?aERwdUZkYzYzeGlHbGtoK1M5ekZHOFppcm10Q3duV0hueDRVU1cvbXlGUHc0?=
 =?utf-8?B?OWRmWVF0R0FjSEhWaWFXMlZZY29idFlPNTdSQUpZUGdpQ0Z3SWJ1Q3VVMGt5?=
 =?utf-8?B?Sko1MGNoUm9GTGtMditFYzVBMm0vMWVmVllSM053bkxQc3EwTUVQNHJxOTd0?=
 =?utf-8?B?VnhCOFlqRW9ENVFQaE1kcityb2s3b0VkdFQ2ck82dytKQXkwN3NSWFpya25x?=
 =?utf-8?B?Y2RWSmtjNXBtRTU0ZHJVZVRqcnNNN01hQklzdHB3RWxwbjZQRjF2cmFZbXF5?=
 =?utf-8?B?Ri9neHV0WGwxVjFkUDgzT2EvQzU4elV5MkJhaENSVG40bzNSenFFRnNVM1R6?=
 =?utf-8?B?MkJtZ0lGN1J3OVlZUDlUcGZoQlhmNzBKRVVCY21WQWl1NklCeFo3d0p3WU9u?=
 =?utf-8?B?b1Rxc2hVa3Y3VzhVZzZQMnZuNFp0Sm95RUluWmFRODFiZm9YRCt5WS9xQU5J?=
 =?utf-8?B?cGVtY0JNbjFyWGpBWGduMndoZTZGZnhCeVBPbGVQOSs2YVhzSGYrMXBGanZi?=
 =?utf-8?B?eElyMHNEdFdDQjFQRWV1NDNHQVN0Y3RWL01LYUhuUldxMmttaHB2WENQWCt0?=
 =?utf-8?B?dDVLQ1dxd0FjSnBwZmU0SUV4cjZ5V2FsOEw0Sll5RWV4ek5GbEt3MGFZMlUx?=
 =?utf-8?B?UUptcjEyS20wejY2RmhOWFNsNUE4ODM3bDNLVzVRbEhXSnE0S3ZOR1FWZk4x?=
 =?utf-8?B?RlY4R2FnZHd2QkZpOWlFU1ovQ094ZkJOOWNadkw3blJncnd2WEN0UmdpNlA3?=
 =?utf-8?B?SVNydHFNUXFkODMvaHhXVEZ5b0ZhMjFkQk0wcUtyVnBPbndRQVlWbDdCeUN4?=
 =?utf-8?B?ellkdHNUMnJkM3RtdG9ONHRWQVhtdkZJbFpJcnB6YkxUVy93K1ViTm9XbEdi?=
 =?utf-8?B?UzMzVmZ2M3hBUTBPUDFHQWNDQnZuUG4xRy9VeXBVSFh2eFIyc1BwUFF0d2Fm?=
 =?utf-8?B?Z0JqTGZEV0NSMFdseGduTkNDWVB1MkxFMC8xYU9maEIvV1puUEgvOUFrZlRZ?=
 =?utf-8?B?N3VkZ2dycS9NckhLa2VNUDNReVpuUTVaa3FycHJqSzBXZWczZEFNWTZxcHNO?=
 =?utf-8?B?bDJyYmhSU1F1NFRNVjc0Q0FiVmFGRE5PMVpycXlRa0FrdXorNnUwWnFLa1Rj?=
 =?utf-8?B?YTBoR3hNTWVlTWlkWVJoeDBhSkFpbWNGVXBtWXk4YUFtVnhWK0x4b2JWRlNB?=
 =?utf-8?B?eFdOMW9YNEpzekhQVjQ5b2huVlZMamduazFUMTlwT0QvTTV6azdBTy9nTmJW?=
 =?utf-8?B?T0l1RFpLa0JlZ29XTkllQ3cvRXhVaVRNQnFIL0hFb3BxY1VhQmVZaFQ0VVo1?=
 =?utf-8?B?bE9BeGpUQ3p5ejFlSXgzNnNEemFvVWlocmtwcXdXaDBKWGJUN1pzYzlCMklM?=
 =?utf-8?Q?8v3k=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 00:25:23.8369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc285d1b-cee4-43b0-7a2f-08de27022182
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4323

On 2025-11-13 05:16, Jan Beulich wrote:
> On 13.11.2025 04:16, Penny Zheng wrote:
>> File hvm/vm_event.c and x86/vm_event.c are the extend to vm_event handling
>> routines, and its compilation shall be guarded by CONFIG_VM_EVENT too.
>>
>> Although CONFIG_VM_EVENT is right now forcibly enabled on x86 via
>> MEM_ACCESS_ALWAYS_ON, we could disable it through disabling
>> CONFIG_MGMT_HYPERCALLS later. So we remove MEM_ACCESS_ALWAYS_ON and
>> make VM_EVENT=y on default only on x86 to retain the same.
>>
>> The following functions are developed on the basis of vm event framework, or
>> only invoked by vm_event.c, so they all shall be wrapped with CONFIG_VM_EVENT
>> (otherwise they will become unreachable and
>> violate Misra rule 2.1 when VM_EVENT=n):
>> - hvm_toggle_singlestep
>> - hvm_fast_singlestep
>> - hvm_emulate_one_vm_event
>>      - hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,read_io,write_io}_discard
>> And Function vm_event_check_ring() needs stub to pass compilation when
>> VM_EVENT=n.
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>> ---
>> v1 -> v2:
>> - split out XSM changes
> 
> Isn't that split out patch also needed as a prereq to the one here? The one
> here on its own:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

