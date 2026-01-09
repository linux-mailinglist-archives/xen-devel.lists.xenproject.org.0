Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA8D0CA12
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jan 2026 01:34:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199282.1515863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veMuo-0004Q8-H3; Sat, 10 Jan 2026 00:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199282.1515863; Sat, 10 Jan 2026 00:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veMuo-0004Nw-EG; Sat, 10 Jan 2026 00:33:14 +0000
Received: by outflank-mailman (input) for mailman id 1199282;
 Sat, 10 Jan 2026 00:33:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vvd=7P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1veMum-0004Nq-M1
 for xen-devel@lists.xenproject.org; Sat, 10 Jan 2026 00:33:12 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef296f89-edbb-11f0-9ccf-f158ae23cfc8;
 Sat, 10 Jan 2026 01:33:09 +0100 (CET)
Received: from CY8P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:930:6b::24)
 by CH2PR12MB4038.namprd12.prod.outlook.com (2603:10b6:610:7b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Sat, 10 Jan
 2026 00:33:03 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:930:6b:cafe::db) by CY8P222CA0010.outlook.office365.com
 (2603:10b6:930:6b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Sat,
 10 Jan 2026 00:32:59 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Sat, 10 Jan 2026 00:33:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 9 Jan
 2026 18:33:02 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 Jan
 2026 18:33:02 -0600
Received: from [172.27.23.102] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 9 Jan 2026 16:33:01 -0800
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
X-Inumbo-ID: ef296f89-edbb-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHVfCkK3JHhDVJ0vvogfReXujRlOkJv+kiG04vTPW04G0/2CiQPruvWPoH/bVp4piHfr+0z7J4icopt4udT/m+XgALTfUUlC22c2ygHU2C/cIHKtZsHaTeFNvwyqACcdlJd5ZVcagOBjltMXoGc1+7n9KeALiqQFLIpBo3M0YmdgMtnRrNhBqD+vMhXag+85ykL7x+fjn63TB6ay5g7pvoGJJ3VOR9zMmEauwWwa28Fneop1yNNYO13ZUK6wRbZVnadRgEg6NXj/bidyv5KcNI6fKBU4O/Y/fhO+Quym+3VUVZU4nmGDWRyJNQpZyS99kJclc5h7vaBrAeOrWSezHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTPdD+wsNFbIreyF1eJxYrPMA7/rnYYOGUgwVpftcbs=;
 b=u6cHYBXqOSV0mEBGVa8lthAzvVE18jE491UdHcNcOOHjEEV+0BuXDZNUFKuu3fJOKDngKy/aGO1u2LQGlluP59ZZXlbqw11WKU7dos8mQqJqS0PexJNpBDRfDTLcSsU6nHuviwlZPnOeLU8Z197Y+Ap2E3ELvvLGg05pQm46VPALIWDKAx2n7Ht8mH8izOImzgAuN/H3wvhOSj5QpAkTjmWB69aUfZ/7GeAEHryyFUF+6eD4M29AamubwjzrSbZAOfpkd3ykbEA48KJwGBWvY4K1HgdFHWRRFv4gHCd2u0H1ahQm3up+aGgmhxZswW8OI42bECYtJYGuv2VrGl5d4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTPdD+wsNFbIreyF1eJxYrPMA7/rnYYOGUgwVpftcbs=;
 b=eyMEAUbagfq8PNehuLsTq45r/MrkURiEVa69yaQFii1ItCrURWSl2SYUvcWdM3mORPti9w9Y1t8PTBW+CRHPbKORMB3gHwVA4u8AhXzohc5IohzbY1EpM7F2XZs7AdSGgdKajiS94IFECarKpruHG3wiLEcF4BibOWJa5ObP4UM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1beace12-8364-4808-b817-7705f0dd9d79@amd.com>
Date: Fri, 9 Jan 2026 18:32:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jan Beulich <jbeulich@suse.com>
CC: Victor Lira <victorm.lira@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Grygorii Strashko <grygorii_strashko@epam.com>,
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
 <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
 <13a270cd-b0bd-4565-9158-0e1728aef84e@citrix.com>
 <7514a67c-d140-43b6-bed0-3467530a086d@suse.com>
 <fbe63318-b764-46ce-a377-dd4ce7229abe@amd.com>
 <83eedd0c-dcaf-4e28-ac0f-f4991f053350@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <83eedd0c-dcaf-4e28-ac0f-f4991f053350@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|CH2PR12MB4038:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc2c19c-cb31-4014-69be-08de4fdfd0e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXJraDFzcGJTdE1PS2ZSOThySlltYXEySzlQTFd6bk9Yc3RGM3h5YUhTTisy?=
 =?utf-8?B?YTIwRHhlTDBoSHV2b3E2MTJ1Y0QxRDJSMFRjaG5qb1hwUk1GMk95b1FOOFVq?=
 =?utf-8?B?N3NvaHZHWG9sUm9vU05qSXdtcjlBZkxFVXBFYmswZ29FdE5WNkh1dW5rSHdL?=
 =?utf-8?B?NjZMOWpmQ0xPMnN3bVlpNnJNOUJ1UlhNY0dHM0hBK29lVEFmSVVhcEM5amFt?=
 =?utf-8?B?VFBEejlqTjMzOTNMM0J1R0UwS2NsSmIwQWNsSW5YSVl4MGcwZFJFK1ZMbFJ5?=
 =?utf-8?B?UjBMeVpMRlN3M0VlUTVyZkNIakNzKzVRaTViZHlpYkNCM3JlZEJQRUhDcmFm?=
 =?utf-8?B?SVRua3dPSDR6dWlJczFrc054dmFpVVlsc1I5bmg0c0ZBYXVmaVNYVmd1S1hG?=
 =?utf-8?B?YmlPRTNSQzJkK0dvRHZVRnE5MHVHTG9NN1NCcXdvcTFvOGtPYytmb2VzeldT?=
 =?utf-8?B?K0tmNDNzZCtwOUpmemdZeHU1Mit0NTdYaUxFVURLcDZYcFZiVU5HNklzVWcw?=
 =?utf-8?B?T21xK2wwcnRCV3RFb0FCZUhQRWNPTC91QjlNL2l2M0J0UnNac2c3M2E0M3NP?=
 =?utf-8?B?SjczU3lJeFZYRUZUYU5kL0IrdC9SY1FJOGhnM3pWeVBENDB1SGk4aSt2RlRF?=
 =?utf-8?B?Q0k2b2VJa0lnNytFVVRYTjAycyswOHBoZjVBZFlnaGxQdW9QZ0pEUEdObXI4?=
 =?utf-8?B?cnF4cWlCb3dBeFpUOGxnNlhtTjZYaHl2ek54eWVQR0FRK1VvWGZEdzlPWDZI?=
 =?utf-8?B?ZnFlbG9VbSt3aDRBVzZMSlhSWUtHZ3dxTTJYOEFtd3JuMlhGZy9IOGw5NVZQ?=
 =?utf-8?B?SlMyakxSa3M5aWs0UnQ2SWtYWkp0M2tlenU1eUV4UkpNQmZwTndnamc5NzYx?=
 =?utf-8?B?MTJyaVNoNDZVc01jQU5RT05jWlFneG9KYmJSOGxMVExoUjMvTmtxQ3BuejJI?=
 =?utf-8?B?L295SWZTbGZMTTRqM3NtMjBhZ1ZXck8rOEtDbGlpb3F4OHlycWRMUUt0d2FK?=
 =?utf-8?B?NWtzNDNBbnhkQjlDM1BPbE9oYVhYcm40OFVNY0ZjMEFyWktvTXRSMlZYUjg1?=
 =?utf-8?B?VEYrSkFseVU3dVdKOWVZN3lNQ0lrTjBaWlVFS2pCemRFbUIyL292S1ZkbFVQ?=
 =?utf-8?B?eVp3OThGSWNqN05sV3hMMlhuZDQxVGlabFZGRloxWm1GOUszU0NVWThwMDBi?=
 =?utf-8?B?UDA1VmowanYwbFVUakpKZHpuSVNENTRxOVRidmlCR1NybEY1cTgrMDZKZEJo?=
 =?utf-8?B?ZGltMEJEaEtvaDBUZU9zaWVHTkNBY2VMZ2xRN3YzT1l1SjgxUEFEZExGbnVv?=
 =?utf-8?B?NmQ0UldvOTE2b3oxRklWVDdxTDZVbkd4eEZEdEEwaGNZd3BzS2pTUVVueUJt?=
 =?utf-8?B?WkxpZGdadXFuUm4wN1NSeXBSL1gwMWgraDgrUFVUVFVKV0VSVEpQT2FCcGZ1?=
 =?utf-8?B?NDJQV3BWTlRHaDVFNHNZMzRuQUthUGJLajlza2xTZmtSTlJjZTVaUWRZdWlQ?=
 =?utf-8?B?TW84bTFMV2hDb2tFNTlLWnhOQmxYb1FPbFlMODQreTA4b05TbWI1bTVuUUJj?=
 =?utf-8?B?UEQwYVdoL3gwNmxXVWg3YVUrcHNyaDluaEV3a1hhdVhOaTlEeDVoaDU5ZDBo?=
 =?utf-8?B?SjZ3NVlmVlowenlwTGpicFBOWUVyUHdrYW9pelBsOGFFdytnM3BXMkZ0Ymxw?=
 =?utf-8?B?NHRVRTJWNVhmRmlBTlNvWlRUTkJzT2plS21hV3NLYllIdGVaemRTWDJwMEJL?=
 =?utf-8?B?QUZKYVR0azVhZ2FCTjNCRDlpSTdSMkV0QVpsSUVBcnNvandLcXRjSVQ2RC9P?=
 =?utf-8?B?MGR3a2d1Vi80R2NyQ2tRMTNLUS9Zb0FHZXM5K2owVUoyeXNEVVRyaUJXWWRm?=
 =?utf-8?B?bUNiaFdJMzE0Wk1qQUNuVzRXOEs5cFNsUFZBUUdPT05VOGlBOHZVY3pqT2Nj?=
 =?utf-8?B?WlJmbmRKVzNYaHc2RU53dGdJd0ZTbnJWWmpiYk9IcDdOMEhiWDhhK1FhUFlw?=
 =?utf-8?B?aEI0elBNbno0TUpRRHJlU2N0Yjh0amk0SzA0bEJvWmp2R2hzR3REdDd2dmc5?=
 =?utf-8?B?UHFEYW5PSThhUFRuNHhzQ3lIMTlxWlJ4SFdLQmNsVXVMZFdHN0NDVEF3a2Y5?=
 =?utf-8?Q?ar/I=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 00:33:03.2986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc2c19c-cb31-4014-69be-08de4fdfd0e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4038

(trimmed the CC list down)

On 2025-12-12 08:22, Jan Beulich wrote:
> On 12.12.2025 02:34, Jason Andryuk wrote:
>> The alternative is section groups?  I'm trying that, and it kinda works
>> sometimes, but .attach_to_group fails when .init.text is involved.
>>
>> Here's an example that I think would work, I could make it to
>> --gc-sectrions:
>> group section [    3] `.group' [.text.vpmu_do_msr] contains 5 sections:
>>      [Index]    Name
>>      [   43]   .text.vpmu_do_msr
>>      [   44]   .rela.text.vpmu_do_msr
>>      [   45]   .altinstructions..text.vpmu_do_msr
>>      [   46]   .rela.altinstructions..text.vpmu_do_msr
>>      [   47]   .altinstr_replacement..text.vpmu_do_msr
>>
>> But I don't make it that far.  Other files blow up with tons of:
>> {standard input}:9098: Warning: dwarf line number information for
>> .init.text ignored
>> and
>> {standard input}:50083: Error: leb128 operand is an undefined symbol:
>> .LVU4040
>>
>> Line 9098 of apic.s is .loc below:
>> """
>>           .section        .init.text

Earlier in the file, there is
              .section        .init.text,"ax",@progbits
but the later .section .init.text entries don't have the extra string.

tl;dr: If I add "ax",@progbits to all the .init.text entries, the file 
assembles.

I opened a bug here: https://sourceware.org/bugzilla/show_bug.cgi?id=33779

Regards,
Jason

