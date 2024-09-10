Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F04349737C3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 14:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795508.1204893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so0BK-0003tg-Iw; Tue, 10 Sep 2024 12:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795508.1204893; Tue, 10 Sep 2024 12:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so0BK-0003rE-GD; Tue, 10 Sep 2024 12:41:18 +0000
Received: by outflank-mailman (input) for mailman id 795508;
 Tue, 10 Sep 2024 12:41:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Cw=QI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1so0BJ-0003qt-3x
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 12:41:17 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e88::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7b35706-6f71-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 14:41:16 +0200 (CEST)
Received: from PH7P220CA0054.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::11)
 by IA1PR12MB6458.namprd12.prod.outlook.com (2603:10b6:208:3aa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 12:41:08 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::56) by PH7P220CA0054.outlook.office365.com
 (2603:10b6:510:32b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 12:41:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 12:41:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Sep
 2024 07:41:06 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Sep 2024 07:41:05 -0500
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
X-Inumbo-ID: f7b35706-6f71-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jn/UzQG3WX7hTy+G5aNm/SIc2oG6i5Ai4weYDwQ8jEOXI1jFkEfeBxNa3TVdTVcFekglJ51oLEor/uUdZlYSc98tFXyA0SkNAekXUqI5ukC1mIenzXJNXUXZg0GBikq0uqcI9Qf8OtxcS3f6nx0KxG4ogeqn5cvJIYj8Vck5/1Ob5dHdHe9yBZSnklgRMdYG9nDJcJFOEKNzo4es2gbu5u+rcSYZ8NDTHKlRkgc+b1yhrT8wfBHSHx2/rjLE9PxR9fiQtKn3hETRXq2dp0eYFPts3k6WtFQi/X5MPuoDYW+Vm8PTNgDb/04M312mTeMlxKptWC1H5UBnE2XVL4Fy2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZb+u4r4gIfS+0t+qR0IrXiDBggjmoGPYnnET1dxixA=;
 b=toQ8iUjHezhKZhQxwb7EgqbbYLlxevaB+WpskWwHYGmB2fnd4OGZZPWJHa5CTujNWKtfHbL/sLZxojQrkyoBh1TC67T0kkKReXbQIAWr0dlanl6V5IlqewDoYpTW+I41LwCxIzolMsoGaAUw3uuGPO8f/Xaud3SSZ42xNOvPFxTOAJaFjL+IEJPzVlCESMn1LVlQwtKPbbSSQ1nlnOlgVSKqStCvaEaYFI3G5eI12wmvDPSK11FAJGwhRJV2/G9VjFVW2hXwMOlydO8dmuGiZe96I2yNOUv0k0NfISpzBRRkKFAFDN6tldnN/KdJXnJ1nNEW+UU27jLkDnP8qARv1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZb+u4r4gIfS+0t+qR0IrXiDBggjmoGPYnnET1dxixA=;
 b=ft5rCxECombUcPM5X+2LBUhCiSbT2hqsgL0rRsUkUOSOoEgvbTDpk+K2RFAQWTaE9VM4fNdLWLULtEGiEqYRPXudHMvXQdAhPSaHIDDNDKcqBYhMduMhKdlid43GffzrPhKPkKCbXKRTsxhc1VBe9V6R9NBLdM+Gf37qPZEzH7Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <30aa5f45-c954-47c4-ab39-4929ddef3f9a@amd.com>
Date: Tue, 10 Sep 2024 14:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add Assumption of Use (AOU)
To: Ayan Kumar Halder <ayankuma@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20240906101318.1419954-1-ayan.kumar.halder@amd.com>
 <57632c2f-82e6-49bb-b989-e75c95070b03@xen.org>
 <46b9567e-d27c-467b-b21d-65d63b6cd1e2@amd.com>
 <5de31172-8319-4cd3-9486-a6992a5cdc22@xen.org>
 <880e0578-c27b-45d3-8ed6-91ad648fa735@amd.com>
 <c308f03b-247d-4fd9-a9b4-f630d8a22bee@xen.org>
 <alpine.DEB.2.22.394.2409091252570.3672@ubuntu-linux-20-04-desktop>
 <d3ebe193-4228-4fda-b7f8-0849c41ed999@xen.org>
 <e44de6a0-de56-4fbc-90d9-c3dd2f623b57@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e44de6a0-de56-4fbc-90d9-c3dd2f623b57@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|IA1PR12MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: d4210c01-3271-42d6-7a30-08dcd195d753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2kvY1MvY2ZTUE9ld1dUZGQxdVQ3L05PRUkwV0hmRE1uNi9wLytEVTFOeWdI?=
 =?utf-8?B?MGZpNEhZWWgrMlpkM2FlcXN3bHo2ckVsVFNnVm96MTZTZm9KT3ZETXBiNUV1?=
 =?utf-8?B?dFVTRzIyMXFPZnhPZU8rMXkxRkVReXUrQkJoS24vck5OQjBSb2ZJRG1SQXNk?=
 =?utf-8?B?NDhtb1ZBWWJjNUxydEJaQ0VhdWZmR2dmU2R3MVpFc0xRVlZzUDJZV0FHTnlV?=
 =?utf-8?B?TnlyN2RueGFBVEdtK21zS3BOaHBGd1dmTzd1c3dHVmIzM1orQVNWVWM1TmZT?=
 =?utf-8?B?MmFPVE81L2JpUE1LYW5vV0dEa1dFTjQvYWx2M1dldUM5WVVKMXFXNDF6cEVi?=
 =?utf-8?B?UmhadE5qMjdDSkJLVFFXSGNUVnF1U3NEWVgzYjJlWHBybFlqdlFNdlF5QmNz?=
 =?utf-8?B?UmYyLzBqN2FZSnBLYklqMG5lNWJXT1E2UnR5QWYvRXhPOWZOVDFPRkxiVk04?=
 =?utf-8?B?SzlEejJGaU5XN3g3eTVtNDlZSlRtZk9xYWt3RzA4NlFjaE41ZGdDU3dlN1RY?=
 =?utf-8?B?WmEzcHAvRHRrTFVRSElQaEw2empNWGF5ZDBMMEpUSXJha2JsRnAwWXAyOG51?=
 =?utf-8?B?M1VzZ3lLaXdoR205SC9NN09CZnR0S1p4d1NMaWFyYVBIcHdMTlF2UEhwcXhw?=
 =?utf-8?B?TytsSTZoYWdNTzRpVEZ3QUFVdnlkbVZsK1M0aXdtb3ozZ0FteGsxV1VLYzlO?=
 =?utf-8?B?K0VZejU3bm9XSG1vSGUrdkpKTmQwSzlmS3RVL1U2aEN3QWF5NE8zc0g5aFVr?=
 =?utf-8?B?djJySGFraWpMalZycXlPSGZMamZzNGRxamwvYU1tT2RPM1J1b2g1NTZKbUVO?=
 =?utf-8?B?UnV2NmxyN2NIU2lMemw1WXlaTUpwYkNWenpzWFJ0S3d1N09DekdQeVJkZDFB?=
 =?utf-8?B?ZkpDV2toNXl2bzJGYlpLdjlISy9WazBFMUdra1QwMFBObGFISUwrSGMva3BZ?=
 =?utf-8?B?alh6Rjhsa3p6bTlvK1o5ZFBSSG02MUY2dFdJbEs0OFpianRCTXRSTUNBWGU3?=
 =?utf-8?B?aGZEWWtxNEZxWlYrK005UVRtTzZrZVBYQ011VXVuOWJoVDIvdGFrVUo4WWlt?=
 =?utf-8?B?YmZwVEdmMGRSTXhwUSt0TEZ6VFYxeSt5RGY5eTdOVXBVby9Qell0UVF2UVg5?=
 =?utf-8?B?djJFSExBN0ttMGxvUGlENS9EYUd6NmpVUXVwQ3Rtbm5xQ3dnM0ZSY3pOU01m?=
 =?utf-8?B?NVViMkw4MmdjT0V0OGNDaVdzbnRuYTZuUXlRY3VuWWZZbUFqSzRMTlNCd3pj?=
 =?utf-8?B?VFZwaTJtNmQzU2VjSDVQU0xXZmJQK0JqZEJmMFE0R09xMC8zZ2tWaFpRU21m?=
 =?utf-8?B?eWluSkVqbVNhTkdlUEdNQTNncWVmR25TNUFjNkhwWkdZcS84L09MdWN0OEgz?=
 =?utf-8?B?eDExN2x4cSsvSWRsS2psaitxTUoxdjNqb2Fzcjd4a2hRbHFFblFWaW9CeG9Q?=
 =?utf-8?B?YXhvV2YxcW5PQkIwUjVpaG9CTmo4SjN6bVQ0M1BQblRZMUY4NEljWVcyMzdu?=
 =?utf-8?B?WDFaRXdWdmhSL055YVBwekRIUHZqeGV5Vkx5N1FyL1NKamlSZTZsRGk0MmJS?=
 =?utf-8?B?N2o3ZWtvdUVqUFRsK2JTdkZhM2l1NWExS3NNR2VnYy9UVUp5Mi9xS2Y2ZFBM?=
 =?utf-8?B?VysrWS9IdEowM0xFU3B2REk1ZVJmL25sUFRGR2xUbitLQWJNUW16eEpOemV1?=
 =?utf-8?B?ejN3U0pWRVBQZFZ1Z1ZtbkxBUk5yV0V3ekZUamQxSUNFWTJDeEl6MEpoWENP?=
 =?utf-8?B?NWZDdmMzSTF2cTg5VjdkTjFidmRhZm10VE9oMGRBRGhmM25yMTdNbTNDRmZl?=
 =?utf-8?B?L1F4K1l6ckNsQitDZXVTVGp3VWdNYnI5VTYvbU1HRVpHOG9VS3VIcERSY3lv?=
 =?utf-8?B?VHYwOTE1RjM4Qk5iOHVsNlhiSmdqK24vSGgxWHFSc2ZRQnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 12:41:07.1891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4210c01-3271-42d6-7a30-08dcd195d753
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6458



On 10/09/2024 14:16, Ayan Kumar Halder wrote:
> Hi Julien,
> 
> On 09/09/2024 21:59, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 09/09/2024 20:53, Stefano Stabellini wrote:
>>> On Mon, 9 Sep 2024, Julien Grall wrote:
>>>> On 09/09/2024 10:50, Ayan Kumar Halder wrote:
>>>>> On 09/09/2024 10:11, Julien Grall wrote:
>>>>>>
>>>>>>
>>>>>> On 09/09/2024 09:56, Michal Orzel wrote:
>>>>>>> Hi Julien,
>>>>>>>
>>>>>>> On 08/09/2024 23:05, Julien Grall wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> Hi Ayan,
>>>>>>>>
>>>>>>>> On 06/09/2024 11:13, Ayan Kumar Halder wrote:
>>>>>>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>>>>>>>
>>>>>>>>> AOU are the assumptions Xen relies on other components (eg 
>>>>>>>>> platform,
>>>>>>>>> domains)
>>>>>>>>
>>>>>>>> Searching online, I think the abbrevition is AoU rather than 
>>>>>>>> AOU. This
>>>>>>>> would also match how we abbreviate in Xen (IOW if we use a lower 
>>>>>>>> case
>>>>>>>> letter from the expanded name, then the letter in the acronym is 
>>>>>>>> also
>>>>>>>> lower case).
>>>>>>>>
>>>>>>>>> to fulfill its requirements. In our case, platform means a
>>>>>>>>> combination of
>>>>>>>>> hardware, firmware and bootloader.
>>>>>>>>>
>>>>>>>>> We have defined AOU in the intro.rst and added AOU for the generic
>>>>>>>>> timer.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>>>>>> ---
>>>>>>>>>     .../reqs/design-reqs/arm64/generic-timer.rst  | 19 
>>>>>>>>> +++++++++++++
>>>>>>>>> ++++++
>>>>>>>>>     docs/fusa/reqs/intro.rst                      | 10 ++++++++++
>>>>>>>>>     2 files changed, 29 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/
>>>>>>>>> docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>>>>>> index f2a0cd7fb8..9df87cf4e0 100644
>>>>>>>>> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>>>>>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>>>>>> @@ -116,6 +116,25 @@ Rationale:
>>>>>>>>>
>>>>>>>>>     Comments:
>>>>>>>>>
>>>>>>>>> +Covers:
>>>>>>>>> + - `XenProd~emulated_timer~1`
>>>>>>>>> +
>>>>>>>>> +Assumption of Use on the Platform
>>>>>>>>> +=================================
>>>>>>>>> +
>>>>>>>>> +Expose system timer frequency via register
>>>>>>>>> +------------------------------------------
>>>>>>>>> +
>>>>>>>>> +`XenSwdgn~arm64_generic_timer_pf_program_cntfrq_el0~1`
>>>>>>>>> +
>>>>>>>>> +Description:
>>>>>>>>> +Underlying platform shall ensure that CNTFRQ_EL0 register 
>>>>>>>>> contains
>>>>>>>>> the system
>>>>>>>>> +timer frequency.
>>>>>>>>
>>>>>>>> The wording in [1] (not yet merged) implies that CNTFRQ_EL0 may be
>>>>>>> It is merged:
>>>>>>> https://xenbits.xen.org/gitweb/?
>>>>>>> p=xen.git;a=commit;h=51ad2c57a2d21b583a5944a0dc21c709af022f3c
>>>>>>>
>>>>>>>> invalid. This seems to contradict the Assumption of Use. Can you
>>>>>>>> explain
>>>>>>>> the difference?
>>>>>>> The requirement you refer to is written from a domain perspective 
>>>>>>> and is
>>>>>>> about Xen exposing the frequency
>>>>>>> to domains via CNTFRQ and/or dt property. In case of a presence 
>>>>>>> of dt
>>>>>>> property in the host dtb, Xen could for instance decide
>>>>>>> to emulate CNTFRQ instead of relying on the domain to parse the 
>>>>>>> dt at
>>>>>>> runtime.
>>>>>>
>>>>>> AFAICT, you can't trap CNTFRQ access. So what you suggest would 
>>>>>> not work.
>>>>>>
>>>>>>>
>>>>>>> The AoU on the platform (hw/firmware/bootloader) is written from Xen
>>>>>>> perspective and is about the platform
>>>>>>> exposing the correct frequency via register. This is Xen expected
>>>>>>> behavior on the platform. In other words, the platform should
>>>>>>> expose the correct frequency via register.
>>>>>>
>>>>>> Xen is able to deal with broken CNTFRQ_EL0.
>>>>> Yes, this is correct if the user provides "clock-frequency" dt 
>>>>> property.
>>>>>> So I don't understand why we we would want to make an assumption 
>>>>>> that it
>>>>>> shall not be broken. What do you gain?
>>>>>
>>>>> Refer https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/
>>>>> linux.git/tree/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml 
>>>>>
>>>>>
>>>>> ```
>>>>>
>>>>> Use of this property is strongly discouraged; fix your firmware unless
>>>>> absolutely impossible.
>>>>>
>>>>> ```
>>>>>
>>>>> We wish to put the onus on the platform/firmware provider to 
>>>>> program the
>>>>> register correctly. Otherwise, we will have to document it 
>>>>> somewhere (may be
>>>>> safety manual) that User needs to provide the "clock-frequency" dt 
>>>>> property.
>>>>
>>>> I think you will have to. The integrator may not have the 
>>>> possibility to
>>>> modify the firmware.
>>>
>>> Without getting into the specifics of CNTFRQ_EL0 and clock-frequency,
>>> given that this is one of the first AoUs, let me clarify the spirit of
>>> the AoUs.
>>>
>>> When we say that Xen is "safe" we mean that it went through thousands of
>>> tests so we are sure that in this specific configuration it is as
>>> bug-free as we can reasonably make it.
>>>
>>> "in this specific configuration" is important. Changing the
>>> configuration might expand the scope or invalidate some of the tests.
>>> Think of moving from a board with GICv2 to GICv3 as an example (we are
>>> actually targeting GICv3 for safety, so this is not a great example,
>>> but just to explain the point.)
>>>
>>> So the AoUs are the set of assumptions Xen has toward the rest of the
>>> system to make sure Xen operates "safely", with the word "safely"
>>> defined as above.
>>>
>>> Of course, Xen could totally work on systems with different AoUs (see
>>> the GICv2 vs GICv3 example) but it would be outside the safety
>>> parameters. In a way, it is similar to "security supported": there are
>>> a bunch of Xen features that should work fine but are outside of
>>> "security support" for one reason or the other.
>>>
>>> If a user wants to use Xen on a system that breaks one of the AoUs, they
>>> can, but we wouldn't promise it is "safe". For instance, imagine a user
>>> running Xen on a GICv3 system if the safe version of Xen only validated
>>> the GICv2 driver. Similarly to "security support", sometimes it is a bit
>>> of a judgement call and it could be argued either way.
>>>
>>> In the specific case of CNTFRQ_EL0, if we think Xen can be "safe" on a
>>> system with a broken CNTFRQ_EL0 (thanks to the clock-frequency DT
>>> property or other mechanisms), then we can remove this from the AoU. We
>>> would probably have to have a different AoU about the presence of
>>> clock-frequency. Otherwise, if we think we cannot really promise that
>>> Xen is "safe" if CNTFRQ_EL0 is broken, then it is better to leave as is.
>>>
>>> Keep in mind that users interested in safety, they are very likely to be
>>> interested in the safety-certification of the entire system, which
>>> includes the hardware as well. It is very likely that users will choose
>>> a safety-certified board, which I am guessing would have a working
>>> CNTFRQ_EL0. This is just a guess, I don't know the relationship between
>>> CNTFRQ_EL0 and achieving hardware safety certifications.
>>
>> Thanks for your input. I am open with the idea to require CNTFRQ_EL0 
>> to be valid. But I think we need some consistency across the safety docs.
> Agreed.
>>
>> In this case, I think it would be inconsistent to mention 
>> "clock-frequency" in the requirement.
> 
> Yes, I see your point now. So the requirement should just state.
> 
> "Xen shall expose the frequency of the system counter to the domains in
> CNTFRQ_EL0".
> 
> The AoU will complement this requirement
> 
> "Underlying platform shall ensure that CNTFRQ_EL0 register contains the 
> system timer frequency.".
> 
> It makes sense to me.
> 
> @Michal , any inputs.
In other words, keep this AoU as is and remove the following:
"and/or domain device tree's "clock-frequency" property."
from the SSR. I'm ok with that.

~Michal

