Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E18C6B725
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 20:30:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165291.1492082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLRPE-0007pH-4R; Tue, 18 Nov 2025 19:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165291.1492082; Tue, 18 Nov 2025 19:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLRPE-0007mN-13; Tue, 18 Nov 2025 19:30:24 +0000
Received: by outflank-mailman (input) for mailman id 1165291;
 Tue, 18 Nov 2025 19:30:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/+5=52=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vLRPC-0007mD-4v
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 19:30:22 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01c61953-c4b5-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 20:30:15 +0100 (CET)
Received: from PH0PR07CA0038.namprd07.prod.outlook.com (2603:10b6:510:e::13)
 by BN3PR12MB9595.namprd12.prod.outlook.com (2603:10b6:408:2cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 19:30:03 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::32) by PH0PR07CA0038.outlook.office365.com
 (2603:10b6:510:e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 19:30:02 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 19:30:01 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 11:30:01 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 11:30:00 -0800
Received: from [172.27.232.218] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 18 Nov 2025 11:29:59 -0800
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
X-Inumbo-ID: 01c61953-c4b5-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJzzujtLpy71viokKwn42N0IqeGUYBnhgPcGO4cNvYbYmwEx5DaPAqiIQ3+FIrmPVaw+a7Dx6zg6PouTmQ4qIaWE992h4CUT2IjkiVxkiE4V9xyUlHzYfKWDqvd973m8uH4AcTgnZxRyP/MeVc/k9eaFUn5qS0iUBVmKUmDEI0kigpXMtGF6SzeThHnR4Ltt3nfCd4O51a5k02ZkVj+zeq6dpPGyBGsRegdkLpbH63UVlfg1dZeBG4LnQKf1TTAaaycXG4nPbAjU/kw7aQDcrj7+uCXYWQdadDlmd7o/x/vqNHFdtVqUG45UvqUa4hr3X/IRWu/BsREb1ZUKNQxkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPMwguJp3iCVFCAU2IdtMUQbCsg8mF4I3n3hDYTdZEA=;
 b=w7FXpUbriRKUDLeGHqnULCy0KadN/B32e3TpFpkE44ujtjqpp1tHiKJ9t9ewQsAlkaOvhWKqVEs95VjRUw1YcCcnDDHd5+dRSqpwle4/17N0hNVJOnLIb4Owb0ymA9JY18cCL7m5sC2kEOYXAeqnxAot8NQ/GhFnlsF7Lau45Rb4EDMtxd+S3hoX/1Ha3gRErLhIm3dfy/V/4L1LllMVxLoGrJO5R9m6FQtaBsiBXSWTZPl9854cf+Q+6ThDdHIBTt4lkygw8ZQw+csJuYWtQ/z7LNcwYxITAYKsEYoI7kVdY1BxgGdKy0xmorEcjI7ZLZ1n0zaqMmwWFogdVlM/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPMwguJp3iCVFCAU2IdtMUQbCsg8mF4I3n3hDYTdZEA=;
 b=q+Z9VtEqLVNuVISK2N7D9S5piImacxKmKy6hWdaWfBKg0YsAVQ3+R2Ud1QtY70iI4kx4RFjnRx3GXb2HZFNbXCExAicUMz1N+6Bab5jGt2vfYWf0Sa77Sqm/vIH13qcHUuI1hzo98JTEV7AZbUajxU7G4Gz117EF2zw0tfNzSLo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <120bb273-60b2-4405-8db6-defc27715250@amd.com>
Date: Tue, 18 Nov 2025 14:29:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 28/28] xen/domctl: wrap common/domctl.c with
 CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, "Orzel, Michal"
	<Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-29-Penny.Zheng@amd.com>
 <c18cdb1c-f2b3-4eeb-b064-670c86e19e67@suse.com>
 <DM4PR12MB84511357C8F6FB1976244CA0E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <ea81a0f2-d3d9-41f4-ae88-1426123129a6@suse.com>
 <DM4PR12MB8451B211FB0F01DD1F744502E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <DM4PR12MB8451B211FB0F01DD1F744502E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|BN3PR12MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: ab3515fd-cdc6-4265-7e92-08de26d8de45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjV5dDRXazlCcXlNSVc3K09NODZCL2lJS01GQ0tKcHU3OFcvS25nYW5NYi8y?=
 =?utf-8?B?SEJRNzFzQTlPc2t2eEtmcDI5NDJGRXJSRWNnTFVkYUkwMzZhTFRndFdnRGts?=
 =?utf-8?B?RHZGTklWalRqelkrUVJXcS9aQW0vRGV4RmNsbWNLQ3VvOGt6QmhuZ1RoU25w?=
 =?utf-8?B?U2FZSW5RaXVzaDdnM2IyRGtzeWJvNnIzcEVWVTdxY2JjSFNOWkgzTlNqdlVy?=
 =?utf-8?B?R3c5RW0ybisvdVZvcXBhd0JtN1lUT0ZVVHdycUowbWdZSEFoUWZnVXc5MWlp?=
 =?utf-8?B?b0pMMHNIK2V2K09KeFpPREtCeWI2Vk9DWHcrSStvZ1lpZ0QyenhncXdCano5?=
 =?utf-8?B?aVdWY1UyU00zdEwwRURqSEpsc3BVelM1aGloakZxYkZzYkZKVUdPZE5PVWZF?=
 =?utf-8?B?YnlUOEhUaDU0YTZpeXZKT1dKVG9TZ3cwMDUxMDNjdk4xdWFPYTFmVEFUQmhZ?=
 =?utf-8?B?Y21Xd2V1TWFXSi9Kb2Y1bXZhK3dFd1VONURha0FmR29KeWdYYjVUTzB3SnNa?=
 =?utf-8?B?S3JURStoTk1NVmhINFRTeGM0TllXTUNZbXNESDFSTWZpNGQvVmhPZHlHZEgv?=
 =?utf-8?B?cE16eVhJS3JmcWQ1VWVsYUZ1WDZDTmVsWU5veG1EL0pDd1JaTlA5VVUrM2Z4?=
 =?utf-8?B?NngzdUNLb3N3RlFjMUlZWExza3lhZTgrcm9yMmFNcXdXMkZERU5hV0ZMVXhF?=
 =?utf-8?B?RW5nb0s2ZktKSmFwajNJTm1FSWNMazQxT05mYzF6VjhMVGxjYVFVcFlnckFl?=
 =?utf-8?B?RGY5M01pTEwrZUtWZEhaTmRsc3R0cEN0aGFTRUxwWTA1c2dZZm52a0xGM2hC?=
 =?utf-8?B?dDFxb1o0S0t0Tk1PNXZkUmVycnd0bmRUNHQ3eWdaa3EzaVlEdjZIaUMvSE5K?=
 =?utf-8?B?NW1UUFdIRnBtaWc0UnNzU21zRDEvd3BHeFNseVJOWXNPWDc4NHNhd2FZZkh2?=
 =?utf-8?B?Ym9wcVMwWFRwT3o5akdDWjQ0L0JGVTZ5WUhFM3R2VUgvNEhrWk9QZG5uWVAx?=
 =?utf-8?B?bWVoeFhhK1E3N3k2NzRiRmZmM2wwK0ZIV3JQc1pxYUlMdW1MNGRnL09Id29K?=
 =?utf-8?B?M2JMOHN3UmdJajBUSlBkazQxNytDa2RHekRUQ3RzSUNDNmhucUd5am4vS1dh?=
 =?utf-8?B?Z05PamdwSXJtM3pZQnkxVzZvdzJTY25Bc00vSitKZmNNNnJJK0VBYkpudzIz?=
 =?utf-8?B?ZW5Yc0NGcDVUUjJ3TlExT3J1ZWkwVlByUjBrWVdKOEpCMWtqektJNzMzM1g3?=
 =?utf-8?B?eWR5TWsrQk9Edks0dms1YjJ1NUJWZDUxRXlBR1ZaUHZFaklJT2FGaDgyalpk?=
 =?utf-8?B?RVlwZmIzdmR0Z2pSSjBBT29SR090cjJSeHEyT0hLeEtCRDloNCtwVlM1UE5i?=
 =?utf-8?B?T1BNVWtwakhINDN0TDNDTGRoWFdFRGtpWHZPRUs2VXd3SGJzNzdOOGs4UkZz?=
 =?utf-8?B?OXNRVW9rZkRkV3llMXZ6NElTZ0F2elExQlVXYzUweXVLRVBJaFI5bTRPbDJ4?=
 =?utf-8?B?Wms1M1U3SWtvNjVvNmw5dHNNc1pEQ1Y2cytRRnNSRldQMTdyQjR4Qm1ydkpR?=
 =?utf-8?B?RHh5Tlg2R2RWQ2ppQ1dyekUvRmd3OWlPUlpqTTZvS256M3dJYnVFdUtwWUdv?=
 =?utf-8?B?T25udEJWT3I1amtsMWtHV2NmNlpGRVdUQzUxTitkRTBxVXlGVGE3cnZLMHdx?=
 =?utf-8?B?Q0FxeENEOWRvMFRqVS9yWFE5K1ppQmozOTdyeUE0QWY0T1FRSEtSTWZTNVNW?=
 =?utf-8?B?OGhKMm5UWmxBQ3I2S01mdWl5VjUvUDl4ZHBMQURBUHJjSmUvWVVwTy8zY2M4?=
 =?utf-8?B?NExVek0rRmlWUFRiWlNseTA3bE4zV1JDc1dNMk9aRHZXaVcvMTdHRWRMSk5v?=
 =?utf-8?B?dThVdCs3ekFmbG1rVUZaYnp2NE1jZGhCbnNoNlZoQi9sR3VTRU1FbEJFck1s?=
 =?utf-8?B?RDArek9pZVVjSEtSd2kyOFFrSXB2dFU3TEJyMVNHdjkwZ1R4Vi9lL1dqL0di?=
 =?utf-8?B?UWRFUnZQK1VwN1JtaVFSakVuVnJtOFRCWmY2UjdldEtvZXBJdjNhRXdZbW4w?=
 =?utf-8?B?Ylh2aGV1UEhDNmhqZndFSTVwTFhnYko3Qlc2cnBqTWxDM0RZMzVDK3FDNXZl?=
 =?utf-8?Q?3z/g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 19:30:01.6195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3515fd-cdc6-4265-7e92-08de26d8de45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9595

On 2025-11-18 02:51, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, November 18, 2025 3:14 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; oleksii.kurochko@gmail.com; Andrew
>> Cooper <andrew.cooper3@citrix.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Orzel, Michal <Michal.Orzel@amd.com>; Julien
>> Grall <julien@xen.org>; Roger Pau Monné <roger.pau@citrix.com>; Stefano
>> Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v3 28/28] xen/domctl: wrap common/domctl.c with
>> CONFIG_MGMT_HYPERCALLS
>>
>> On 18.11.2025 07:43, Penny, Zheng wrote:
>>> [Public]
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Thursday, October 30, 2025 9:40 PM
>>>> To: Penny, Zheng <penny.zheng@amd.com>
>>>> Cc: Huang, Ray <Ray.Huang@amd.com>; oleksii.kurochko@gmail.com;
>>>> Andrew Cooper <andrew.cooper3@citrix.com>; Anthony PERARD
>>>> <anthony.perard@vates.tech>; Orzel, Michal <Michal.Orzel@amd.com>;
>>>> Julien Grall <julien@xen.org>; Roger Pau Monné
>>>> <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>;
>>>> xen-devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v3 28/28] xen/domctl: wrap common/domctl.c with
>>>> CONFIG_MGMT_HYPERCALLS
>>>>
>>>> On 13.10.2025 12:15, Penny Zheng wrote:
>>>>> --- a/xen/common/Kconfig
>>>>> +++ b/xen/common/Kconfig
>>>>> @@ -646,11 +646,13 @@ config SYSTEM_SUSPEND
>>>>>        If unsure, say N.
>>>>>
>>>>>   config MGMT_HYPERCALLS
>>>>> -   def_bool y
>>>>> +   bool "Enable privileged hypercalls for system management"
>>>>>      help
>>>>>        This option shall only be disabled on some dom0less systems, or
>>>>>        PV shim on x86, to reduce Xen footprint via managing unnessary

"unnecessary"

>>>>> -     hypercalls, like sysctl, etc.
>>>>> +     hypercalls, like sysctl, domctl, etc.
>>>>> +     Be cautious to disable it, as users will face missing a few basic
>>>>> +     hypercalls like listdomains, getdomaininfo, etc.
>>>>
>>>> This is still too little, imo. For one I'm not sure "users" is quite
>>>> the right term. I'd say it's more "admins". And then, as mentioned,
>>>> there are a few domctl-s which are usable by DMs. Aiui device
>>>> pass-through may also be impacted, which imo will want mentioning
>>>> here as well. Or else, if there is an implication that DMs aren't to be used when
>> MGMT_HYPERCALLS=n, that is what would want calling out.
>>>
>>> How about
>>> "
>>>          Be cautious to disable it, as admins will face missing a few basic
>>>          hypercalls like listdomains, getdomaininfo, etc, hence leading to
>>>          have an impact on xl-device-passthrough and restricted DM.
>>> "
>>
>> Much better. However, why "xl-" and why "restricted"? Neither aspect matters here,
>> unless I overlook something.
>>
> 
> Later, in hyperlaunch scenario, device passthrough is still needed, but it's not current device passthrough mode, which depends on xl-tool-stack to de-assign it from hardware domain and re-assign it to guest. It will be limited in boot-up stage, and configured via device tree only. FWIU, we may reuse VPCI framework, but commands like "xl assign/deassign xxx" will not be needed anymore. PLZ correct me if understand wrongly, @Andryuk, Jason

Yes, this is correct.

> 
> And DM, like QEMU, is still applicable, but only supports a new machine type, "pvh".

vPCI is used to assign the PCI devices to a PVH domain during boot. 
QEMU is present and provides virtio devices, but it does not play a role 
in PCI passthrough.  So far we've used independent PCI segments for vPCI 
and QEMU/virtio.

Anyway, maybe something like this for the help text:
"""
Management hypercalls provide the means for dom0 to manage the overall 
Xen system and other domains.  This includes the hypercalls needed to 
construct new domains.  In a dom0less or pv-shim build, they can be 
omitted to cut down on the Xen binary's size.  However, this comes at 
the loss of significant runtime functionality.

Unless you know what you are doing, you should enable this.
"""

Regards,
Jason

