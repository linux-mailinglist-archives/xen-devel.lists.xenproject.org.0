Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3603CCB38A6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 17:58:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183093.1505875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTNVZ-0006r2-PL; Wed, 10 Dec 2025 16:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183093.1505875; Wed, 10 Dec 2025 16:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTNVZ-0006ok-LM; Wed, 10 Dec 2025 16:57:45 +0000
Received: by outflank-mailman (input) for mailman id 1183093;
 Wed, 10 Dec 2025 16:57:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11gW=6Q=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vTNVZ-0006oe-1g
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 16:57:45 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 574dd5ee-d5e9-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 17:57:43 +0100 (CET)
Received: from BY5PR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:1d0::18)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 16:57:35 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::7c) by BY5PR04CA0008.outlook.office365.com
 (2603:10b6:a03:1d0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Wed,
 10 Dec 2025 16:57:35 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 16:57:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 10 Dec
 2025 10:57:34 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Dec
 2025 10:57:34 -0600
Received: from [172.17.249.106] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Dec 2025 08:57:32 -0800
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
X-Inumbo-ID: 574dd5ee-d5e9-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dh9/FZtenJqrBrxs6BmfFLVUd9v3zOfpL9tH/Sa3bvvKk6UJ+lO35yKGkXhHnY6pSWVpDLm54Al2l27aaq3IORmN4p4572moF6Sbtik6dUv/p5xVf/95k/8PRs56mHgDm3dtP/hYZQnwlJH3g80Jr59rzzlTNi2ug4PEXtmUzCyiB2RNrhsOZYlreP/8tA+5xkWKkxaeAnUjQMYrUuo+a5f28u0G43+y+bk0bDFhoJF53c+mv6O2TRecSOpPG76qi56zrFt2Wyx3HZp9793MlHrDj1pikFdgn3G5LFMs2q4n97xcYYOHBbCpcC2p7ssJJb/SgASROCGF5wgBUg+9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQz/FFAFUrmwb/tx1E8h2JuWA0WJCGIpZB66hVqwGpc=;
 b=ufDIPBpOIozXC9TZB/0zJCSAd/Sr52fV3DLS8IrPXNwJpxhhlPY7gPkeCC6baIlkP3xnD2nDA2fkDdJT/Vn0PUWvqJmP4S6xpqAyvkpcTcV3hDxSwn9zv1zuVyY0bAf58BUCEb3dallcIlo2BPBZ7Fvd3NNm+Rpv5Glv4Qi+H2If/6xMKDlJMnulkHLX4R3Nv0MM4n9WVwl3JHjQ7zkGVM977S0SaVygGEe6vN0elyK0Hy41xDLmQYGDNn9PV94qWJRo4tm6ptcD19lpI8C/JeGeQpS0trilAu4SLCKiLYM2oHAf4w848tX5QmtPztlDapqDNniNxNPwW1bFpkW9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQz/FFAFUrmwb/tx1E8h2JuWA0WJCGIpZB66hVqwGpc=;
 b=EhAgkKjhtfwHA9xPxUvTBWAgtkPle71MZqjJ69jSCd6yJDX7KbF7bebCo3/l4wUAmLlKUSG88VBGoIRtwmT+d1FrtqToPHPM/Ff2eCuSUPjPmniZbWys7bmPkuaejA5kY1jEvFc/hhRkUgHFgqT1JdgTOFnDQym8NfBX6OnJxrA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <974c3c29-8f58-46fd-9ffd-4c574525f66c@amd.com>
Date: Wed, 10 Dec 2025 11:57:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jan Beulich <jbeulich@suse.com>
CC: Victor Lira <victorm.lira@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Grygorii Strashko <grygorii_strashko@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <a734eeb0-c3f2-4880-86ee-7eeeb7beeacf@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <a734eeb0-c3f2-4880-86ee-7eeeb7beeacf@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 2723a6de-74ae-466b-e698-08de380d37d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGRvaCs1cERUMjg2ejUwc2JBRURGZ1lLMmVWTkpVVUtEYVJEQzQ4M3h3YUI3?=
 =?utf-8?B?QVFzWWhuSEhBMUVXVGdZMDhjdnhyUjJkajQ5U0sxRi9qa2NJelNhL3dEYVBG?=
 =?utf-8?B?cUhOdVc0L1pMNWtYbFBxbkpnSGM5RXpNTy9xLzk2Zzc0dW1QU24wVWkyb3ZJ?=
 =?utf-8?B?YlQ1Tm5wSkdrTGNweFJMM0k5SWJ1RGc5b0lZOHY2REFicUVxU3FaRGduOUhC?=
 =?utf-8?B?S29FWEhvU016eVlSbW9ReDZnMFpPbUNoKzJkUUpucmQ4Z21aamtpQkFPY0dO?=
 =?utf-8?B?VE1QMVo2UlhHNWJ4YXdySU8rb0ZRZjNvSzFXeGJlbzhrSk01b3pNakdkS01P?=
 =?utf-8?B?SUJPTGJnNFhGcEdTcmZvMzRQd3VlVjMxWllsL1dkb1ZHR21UMjFMUGJTUktH?=
 =?utf-8?B?bFhMVmFkc0JpZDduQnphRi9wdU15bENjTUowZUozMHFjUzFjc1c5K1pwamV5?=
 =?utf-8?B?OWFidG8xS2hnbktUSDBOcG83andRNkowQXFjRUlSc2dhVzA3NnVBZWFoMHg2?=
 =?utf-8?B?Y3p5amdQRXJUek9jNDlxeFo5YTRBcS95WE5aSjcxRVo0SGs3aUxOUGNReTlu?=
 =?utf-8?B?UXFBRGN2bnpzNkdDalVQRjZPendPSGxLbURLOTNrQkVEK2RJT3V0Z0JZTXFT?=
 =?utf-8?B?cXpVV2RRNER5UHdPYmdYcGZFd2JFQk53SnFNdTJaRVFiSVY0ZEJMYW1TVTMr?=
 =?utf-8?B?emdGakdaMFRqN1hQNkEvdW9ZNDdlZXBUcTRhYnZTVTByVlhHY1FTdi94c21W?=
 =?utf-8?B?VThzOE1aRVZLVzBXaHN3d084ekZsUUhrZThFZC9nRi95YWQ2Snhnd0IyKzkw?=
 =?utf-8?B?aDhaMVZaVkxhbEZPRlBIcDFsQlV0MFd0SmlJN3dpVG0yMno0ekNkcmZKSmRl?=
 =?utf-8?B?SnJBUzVjN1diMlFoMHQxdGxua0N1R0lxbzA3SlNWYXhXbFIrZ1Y1YUxwUkhQ?=
 =?utf-8?B?ZzZaYjlRbE5kQlV4Y1RRQ2VYU2NTZlVubTJqaHhqaXROVFAvYUNGWjJWMGdO?=
 =?utf-8?B?VXF3dHViUjhwRmtKVHNxaytJNnh6N281b0Jpcjd3bGxzQ2dyYmRBRHd2bklv?=
 =?utf-8?B?WG16QnExbU0rZ0pQWU9YcXpidjRaTUh6c1ZpUnF3VEVOaytncjlnUzZnWWwy?=
 =?utf-8?B?bys4T3J6cGd5S1FJSHNBNVRyb01CM05lTEZXbWZWUFhkR3hFOFdNOHBCMCtX?=
 =?utf-8?B?MitaNmhlSmhidHQ3UmdWOVczVHZSdkl2YzhxaWtPemtGL0o0Z0tYTGlwcmRv?=
 =?utf-8?B?bTlVY3pOVWJsT3JiSkNKS1FQVFlxZUptYkFXRHN1cFA1eUlkV3BGcVVmRVpi?=
 =?utf-8?B?b3FSYVZTWS9sdjNRd1RUMTVHNnVKVGhmRWFKUXZ5TWZNZDlsdEs4bk0zUTdF?=
 =?utf-8?B?YXFnMnk2VXhhd25iTzRNeXo5ZmlGSHJNNXNycGRSdmtWRDVreHE2QTBuY1Jy?=
 =?utf-8?B?ZmxLWUFNYlc5NEFMT290ZEI3c3FQcWhKNFFGTzA0Q09RaEU5R1NuMFBzWWFt?=
 =?utf-8?B?Wmg2NDN1UjJxWVNSbXBNL0NGQ242UUUvcXFHZEQwMzZaZGt2aTRidE9kRG4v?=
 =?utf-8?B?djd1ZmpFaWk5bk1PTDQrRHhxc2ZycktVUDFGY0VlVWJKRmhPWkU0akU3MThz?=
 =?utf-8?B?Q2oyYUVsMHJ0S2xsVEw4VXprcURSUWEwZytaOWExNE9UVHVxUHo3bzlXQ1hs?=
 =?utf-8?B?RkY3OFZib1R3SjdDbTlucTVaSzNDMFVnaS81THFnaGdMK090N2JXVU1ETnY3?=
 =?utf-8?B?Q0wwT3NWK3k5cVhFRmdYcVZwN2pGZkxwOGgvMUZ1UWtKUFNibG5UdUVVT0JF?=
 =?utf-8?B?QjZnSlk5MUpNN1VscTZ6NUt2dElzam53K1dEdlJEeFMvbE9hUmR2T0M2elVm?=
 =?utf-8?B?VW9lbWM5Q3hOL1RzbVI2RnpJVkVnd1k0T3FNRE1TbVRSUHRVRjVlM1FnZy9L?=
 =?utf-8?B?STdJa1FMOWsyY2lZS0NTODlYWCtSK1E2NzdxdGlYUGVZaEJWTFhDaUJkY05h?=
 =?utf-8?B?UDRWS0VOR050MVlCOFFqdlhIUmU1c2JKS2FzNzE0a045T2xwNFAxWTlhTGpF?=
 =?utf-8?B?bjRSMUtoYmgrd3Yvak9mVWkraXF4M04zQUVoT2t1RmpSTjJGRjNMVXI4cUQr?=
 =?utf-8?Q?hp7o=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 16:57:35.4346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2723a6de-74ae-466b-e698-08de380d37d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941

On 2025-12-10 03:17, Jan Beulich wrote:
> On 09.12.2025 22:47, Jason Andryuk wrote:
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -469,10 +469,13 @@ all-symbols-$(CONFIG_FAST_SYMBOL_LOOKUP) += --sort-by-name
>>   
>>   include $(srctree)/arch/$(SRCARCH)/arch.mk
>>   
>> +XEN_FINAL_LDFLAGS-$(CONFIG_GC_SECTIONS) := --gc-sections
>> +
>>   # define new variables to avoid the ones defined in Config.mk
>>   export XEN_CFLAGS := $(CFLAGS)
>>   export XEN_AFLAGS := $(AFLAGS)
>>   export XEN_LDFLAGS := $(LDFLAGS)
>> +export XEN_FINAL_LDFLAGS := $(LDFLAGS) $(XEN_FINAL_LDFLAGS-y)
>>   export CFLAGS_UBSAN
> 
> Imo the introduction of XEN_FINAL_LDFLAGS would best be a separate, prereq
> change. That could then also go in already while the KEEP() issue is still
> being sorted.
> 
> The appending of --gc-sections should then also be truly appending, so make
> sure that e.g. anything set by arch/$(SRCARCH)/arch.mk wouldn't be purged
> again. IOW I think ahead of that include we want
> 
> XEN_FINAL_LDFLAGS-y :=

This all sounds fine, though with Anthony's response the variable name 
may change.

> 
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -680,4 +680,13 @@ config PM_STATS
>>   	  Enable collection of performance management statistics to aid in
>>   	  analyzing and tuning power/performance characteristics of the system
>>   
>> +config GC_SECTIONS
>> +	bool "Garbage Collect Sections"
>> +	select CC_SPLIT_SECTIONS
>> +	help
>> +	  During final linking, garbage collect unused sections.  This will
>> +	  reduce the size of the final Xen binary
>> +
>> +	  Only supported for ELF/Multiboot xen/xen.gz, not EFI xen.efi.
> 
> This last sentence is x86-centric, which it shouldn't be here (or it should
> say that this is an x86-only aspect).
> 
> I also wonder whether this wouldn't better live next to CC_SPLIT_SECTIONS.

If I put it immediately after CC_SPLIT_SECTIONS, menuconfig puts it as a 
top level option:

│ │    [*] Garbage Collect Sections
│ │        Architecture Features  --->
│ │        Common Features  --->

I thought Common Features was a better place for it.

Also, I think it should probably gain " if EXPERT" as well.

Thanks,
Jason

