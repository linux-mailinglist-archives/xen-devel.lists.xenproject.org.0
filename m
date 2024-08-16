Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084C69545AB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 11:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778442.1188475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1setFp-0000jA-JZ; Fri, 16 Aug 2024 09:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778442.1188475; Fri, 16 Aug 2024 09:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1setFp-0000gk-Fr; Fri, 16 Aug 2024 09:28:17 +0000
Received: by outflank-mailman (input) for mailman id 778442;
 Fri, 16 Aug 2024 09:28:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JmuG=PP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1setFo-0000ge-48
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 09:28:16 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e88::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbfd898d-5bb1-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 11:28:14 +0200 (CEST)
Received: from DS7PR03CA0245.namprd03.prod.outlook.com (2603:10b6:5:3b3::10)
 by DM4PR12MB6565.namprd12.prod.outlook.com (2603:10b6:8:8c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 09:28:09 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:5:3b3:cafe::84) by DS7PR03CA0245.outlook.office365.com
 (2603:10b6:5:3b3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 09:28:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Fri, 16 Aug 2024 09:28:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Aug
 2024 04:28:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Aug
 2024 04:28:08 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 16 Aug 2024 04:28:06 -0500
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
X-Inumbo-ID: dbfd898d-5bb1-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXbITgBc6smELDw8AZD0zkv+RgwiEbq1CdGOkD1C5oYBn5MTqWCSZagP7Yu3VGocYER4q+6Sv6+Z2Zyena7NbC9ZMKhN+C2L9t0ydHX5soak/m9l/970MqvX/k14T1q7SC5JrZLHTv1+PNffKyYdM1TtJAEQbHf3yccenGvLvpvOgpyFD4HmWrcU7SkAzU2QzkTftfQJ5mKqrZSNwLSRP/uFjunZkrGQD+tq1b25e/BBLJ8W5q2/H6yZP4N4KWEUI97WPVfLfRo3qU7MAKjDFI2Wq+fz1rfLiWHnsrsGZE6B7VEtsNV8Eb11iM8myOAt7/mpebsiIT6ce2eqhs0oQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bra6CCrp3DnE2rw0HNPS4yYAQIPTe+xVNSb3Rx+LVXM=;
 b=pMgePXrR0GRgK67fxaiR9Khb1Jij0QdcHIGo0cSaBeCwrVEs8Y/oroT5IsqnHjKg8iRND5Ee422GKJHhNAc5wRMnvRk527CdaJdijWQFJEqFubXGLsjwY29nguS0Ba8TqfpBwQsJFuaDjl6tHoNbLPWIJVeBNNapB+onrYJV+mVGPI07hGq5cnbMQP45QhdnebOdOkspG6ujZCVlFKk+LZHkCXx/gIjTYsQYZXkBx2buwFQSkxfu+qsMC9JDn64TBnl5WM39nvpPY3dcjI8styVaptIqC4pqsQeRdm452gXJGQ6RiX0eWSUqW1JrDrkB0HKVLjg3GX+rA3adKFCGjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bra6CCrp3DnE2rw0HNPS4yYAQIPTe+xVNSb3Rx+LVXM=;
 b=Fegc/7ZUqUH5NHg1O4tq1vPnQGo6X0rWqIEqgKhmGOPNaRdEHv7v8ddh+UHSIKqeH9v0vQYzz8dqqpfnIsYPVeC/WqLTfXTZeI19Sugtt+x/zVNp4k46Vgw4Mxr9mYJqL+vnbgQlBizkXQiWObdjobMaMJP8XoqCxmwv1VtQwYY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <03682a1f-f4d1-4d07-ba86-8e9fc6ed044c@amd.com>
Date: Fri, 16 Aug 2024 11:28:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
To: Ayan Kumar Halder <ayankuma@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: <xen-devel@lists.xenproject.org>, Penny Zheng <penny.zheng@arm.com>, "Wei
 Chen" <wei.chen@arm.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <Volodymyr_Babchuk@epam.com>, <julien@xen.org>
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
 <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
 <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
 <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|DM4PR12MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d584732-037c-42a6-e88f-08dcbdd5bdd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWkrOUtuS3dTY1ZaM1hUbUp5V2d6NWtuWVV0UjNvUWdyVndwcW5OelRZSzdo?=
 =?utf-8?B?eldXSUkyQjdCb1dXYjhXb2l3dU82Sk9KM0Y4amJVZ0Nzc2E3c2Vkanp0T3FF?=
 =?utf-8?B?c3RGT1lDWnQ3QmhRWWZCQzVONnNnQ29pTWlkT0xuaU5Kb1I0WEcrQnpmSW0r?=
 =?utf-8?B?WEZIdElIVW1DaENoOUFVV1ZFNmJuK2I4OXExSldud3VISS9OU1luVjVIYnhh?=
 =?utf-8?B?aTFGMGhha1VVMzZMKzA3NmN4V3BFaXlFR0Vic1AwS2YwY1V0NXBWcTV5NlZ0?=
 =?utf-8?B?TWhqRnd3TVpZUVFKUkJheXE4aXRHNXR5OUVlbW1QZlhzNFpoTWdxSllvTlQ3?=
 =?utf-8?B?K3lOZDNSaHFEYWNNVFVFYnh2TVVEdXYvcUxvdk80dzl1U1dWTGZwTGdSRkFF?=
 =?utf-8?B?Q1g0R294UEdpK0twQVFMVUk1cFBVQUhFajZPaVpaNXFqOTNSQ1AwZU1MZFJF?=
 =?utf-8?B?cWROSzVEcWwwQXZpUk5LdURQeTYyb2cra0dnTTZTS1BHVGhJZzRDSFVYaWFl?=
 =?utf-8?B?VHNnQ3JxNi9QTWsrbkFOemdqU2NpRGMrMGpjS2RMR2dCQ3dJaUd3NklQeU40?=
 =?utf-8?B?Mjg5b0dIWjZhS2wwRWJpVEtKQ3FjUkk3bXdOVlUwcGlxa1U0L3oycFppQmZv?=
 =?utf-8?B?eTBRYnBvaTVTbzJpOVNuOE94NExyR3pSU3dxaDdzRXFxMDkzOVEzUkxSVkF6?=
 =?utf-8?B?QzFRdVIvTFExeHVUdFZNQ0Y4UTdQOWZnb0JCT1BISnVWejlyclNQbk5aWWt3?=
 =?utf-8?B?dDlnT3o2eUVCYUNmN0JWZ0FINXVudkdHNWNubUpnSk4rMk5TdFlvcE5BcFpp?=
 =?utf-8?B?OHdacmNYUnRDa3pqM05PM3RKWk1yeUFzZnlaQ3N1dDVSMFE1M0J2RGE2U2or?=
 =?utf-8?B?YXZiYnpQRFJ5eXZrOS9sMklSMGs3ZTEyQlAvb0dJUnRlcjI0dXU2MjJxdXR2?=
 =?utf-8?B?dVBIQmQrRWh4M3RKSVgxc0RmcTBTSG83Wkh5Ny9ZNDBRYUR1TjNRL0pRd3hR?=
 =?utf-8?B?Nmh6cVZjSHZtK3FkeW1nUWl6SXkvRm5WanRPdUZqL0RNbi9pSjBSdDE3MHUx?=
 =?utf-8?B?dmU1M0oyaXo3VU5OMmcxT0EyRjN6VVJoUWRiWm8vRzJCbXVBRDhaLzM4QjRY?=
 =?utf-8?B?L0dyZmNaN2xjc1U1TmRSbCs2VVRkZ2ljQ1NScDlRK05HcDVCRXVCV1RrSnAv?=
 =?utf-8?B?bVorcmdod1JlUzJPZXFkWWV2YzdPYklyT05ub1ZMc1daY3VDTUpQdHI3ckx2?=
 =?utf-8?B?ajBKQkI3ZWpoa0k3ZWg3ZzFza3MzYVNnS3hSOWVzWDJQOXd5d2dETFYyWExn?=
 =?utf-8?B?R0xIdGVvclJvcDA3MldLekpyOFNoOE5CR2xTTU9DM1ZHMVVnckIzNzRvTmJB?=
 =?utf-8?B?aXNJS2pZK1J6NDdtTDNkaFYwUWhyQzBtUmw3N2dGVzVSWVM0bjFibVRTK0g3?=
 =?utf-8?B?alZzY0R0L0VPQzdWVkp5K28ycGRjb25kVFVQLzBpNW0vdVMxRFNoTWRZUTUv?=
 =?utf-8?B?U0R4NVhGSTRHQmozZHkwY3Rxdnl6ZW9jeUlLQ29Sb2JMaFFVMWFnbC8rcTc5?=
 =?utf-8?B?ZWhSU09pblNlcU84K2FvVld6czNLeDIrQzZ2N2QzMTF4RVhURk0zSHJrNWFT?=
 =?utf-8?B?Tk5rSnVzaUxVVkozbjg5VzYzeEpRTkdHYW1WUUlFbWQ3WU9uTFEwSFZwVnNJ?=
 =?utf-8?B?encvNGlwOE01ejh2SFZ2ekRHYmtjR21hQ25vU05Pci9VN2lCTEtNakY3aUJS?=
 =?utf-8?B?dXlwTE9VbFFJTVlnRys3VktQSU1COTZoVlo2ZTZsd0NvZnlsZlNuSGxMRWdV?=
 =?utf-8?B?UVZlWm9acnVhZTlISmEzS2lITkRnN0hwVFd1NFJab3oxd3VFaHhXWVBDblMv?=
 =?utf-8?B?dVpxeXA0M0x2akZJYStnRzJOWGFhOXBCdG5Bd3pGSWE2WkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:28:08.9688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d584732-037c-42a6-e88f-08dcbdd5bdd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6565

Hi Ayan,

On 14/08/2024 14:33, Ayan Kumar Halder wrote:
> Hi Jan,
> 
> On 14/08/2024 12:35, Jan Beulich wrote:
>> On 14.08.2024 12:55, Ayan Kumar Halder wrote:
>>> Hi Jan,
>>>
>>> On 14/08/2024 07:37, Jan Beulich wrote:
>>>> On 13.08.2024 19:13, Ayan Kumar Halder wrote:
>>>>> From: Penny Zheng <penny.zheng@arm.com>
>>>>>
>>>>> Introduced CONFIG_VMAP which is selected by the architectures that use
>>>>> MMU. vm_init() does not do anything if CONFIG_VMAP is not enabled.
>>>>>
>>>>> VMAP is widely used in ALTERNATIVE feature to remap a range of memory
>>>>> with new memory attributes. Since this is highly dependent on virtual
>>>>> address translation, we choose to fold VMAP in MMU system.
>>>>>
>>>>> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
>>>>> only support in MMU system on ARM architecture. And ALTERNATIVE now
>>>>> depends on VMAP.
>>>>>
>>>>> HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP as speculative
>>>>> attacks are not possible on non MMU based systems (ie Cortex-R52, R82).
>>>>> See https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability.
>>>> While I'm not an Arm expert and hence I'm likely missing aspects, I question
>>>> the one (Spectre-BHB) vulnerability there to be sufficient to draw a
>>>> conclusion towards the usefulness of branch hardening. I would advise
>>>> against encoding such a connection in the Kconfig dependencies.
>>> AFAIU, to address 'Spectre' like vulnerabilities 'branch hardening' was
>>> added.
>>>
>>> See https://lore.kernel.org/all/E1fNadD-0000fz-9r@rmk-PC.armlinux.org.uk/
>>>
>>> And from
>>> https://lists.linaro.org/archives/list/linux-stable-mirror@lists.linaro.org/message/F4MGL4WT2R7T54NLRDGKFRQNSXF3DZGD/
>>>
>>> Spectre is valid on MMU based systems.
>> Since then various other issues / flavors were found. I've been focusing
>> on the x86 side of things, but I'd be very surprised if some didn't
>> affect other architectures as well.
> 
> We are talking about Arm here as "HARDEN_BRANCH_PREDICTOR" is specific 
> to Arm.
> 
> https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability 
> covers all the flavours and it does not include Cortex-R82 or R52.
> 
> It says the following :-
> 
> "Cortex-R cores typically use a closed software stack. In those 
> environments, applications or processes are strictly controlled, and 
> therefore not exploitable"
> 
>> Plus branch hardening can be a pre-
>> cautionary measure, too, I think.
> 
> The first two Arm non MMU cores that we wish to support in the 
> forthcoming series is Cortex-R82 and R52.
> 
> As seen in https://developer.arm.com/documentation/ka005109/latest/, it 
> explicitly states the following about R82
> 
> The Cortex-R82 implements the faulting feature (FEAT_FPAC) but is not 
> vulnerable. The Cortex-R82 behaves differently than vulnerable A-class 
> CPUs when speculatively executing past an instruction that authenticates 
> PAC, and that behavior does not allow the attack software to create the 
> "oracle".
> 
> We can re-enable branch hardening if we know there is a valid non MMU 
> Arm core which is vulnerable.
> 
> Let me know if you are ok with the rationale.
I'm ok with your rationale.

I have one question for this patch. Why can't we use CONFIG_HAS_VMAP to conditionally compile vmap.c, like:
obj-$(CONFIG_HAS_VMAP) += vmap.o
and get rid of VMAP_VIRT_START guard on an entire file?
With this config in place, it seems strange to use VMAP_VIRT_START as a guard.

~Michal


