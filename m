Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68421CB92F7
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 16:49:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185514.1507625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU5Nw-0005k7-7O; Fri, 12 Dec 2025 15:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185514.1507625; Fri, 12 Dec 2025 15:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU5Nw-0005iG-4h; Fri, 12 Dec 2025 15:48:48 +0000
Received: by outflank-mailman (input) for mailman id 1185514;
 Fri, 12 Dec 2025 15:48:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aL34=6S=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vU5Nv-0005iA-1H
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 15:48:47 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a1bb3ee-d772-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 16:48:45 +0100 (CET)
Received: from CH2PR10CA0028.namprd10.prod.outlook.com (2603:10b6:610:4c::38)
 by SA1PR12MB7104.namprd12.prod.outlook.com (2603:10b6:806:29e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 15:48:40 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::4d) by CH2PR10CA0028.outlook.office365.com
 (2603:10b6:610:4c::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Fri,
 12 Dec 2025 15:48:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 15:48:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 09:48:40 -0600
Received: from [172.30.226.132] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 07:48:38 -0800
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
X-Inumbo-ID: 0a1bb3ee-d772-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqBwcgbh7wbkBRKhShzeZV4n3NTv3a9A6GIVmABJMpRkKQ5QQ8jwfJJSajV8WRuqF6oaGemQSBxq/uTuh4CA1hFvD5xtwmAioYErc9tIdKNZGDuRMuW5zihOKL4hgR5ZPagd3yuBxHTHJ0qaJ38XU+zaG6HtNyILxp6g/1R9JoH/R7j+DpxwooOsjq6FHDrhe+1m3YDVXlVxsCOx8jT7W15slMIt/gWTSz0JLWuDMJFopaeuSAybBBSPpFIPV+67PRNI6EnTgteEIMaHnVQXbNQ7az70IL9v5/7Ue6/P3bAU8d25j9zaa3NJ5BDp49pQ/U4p34USNtGRTqTvSQ5F9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGED0SPw2F+RX+4VLZMafAG3AQ7Q0Z6jdtZk+j+A/Co=;
 b=Zlia2y3jUsVhEjMogSiSurTevvu5YiDIaLEMyxXeeXvrh+zHJ+Gi1hKYvGiOcgT+HB2CewqFgBEj5+OxG8ikXDKoxUDWcj5tSENAACitjCPvYXvi+c9eWjwUZcGgRk1m8rNukLqKMOhYydSh2AkrWK1AA+NoYBU9GHStu/NRk5AnZxa1ToPFOfMKscosJ2X5O1cUaBh6GCh/M7f2HQAbXL/p8Uwys5lYmaAprMxSN9tMAOR74fnlN0Ns3OvEmH2d5Da0HOoaBMKdGmZhfrR1jcNLQg0npw7Sz4cVf/vZQ70+99QVoxP0TW914MT+itX1jcKyGcfCxrH8kn/w2mwrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGED0SPw2F+RX+4VLZMafAG3AQ7Q0Z6jdtZk+j+A/Co=;
 b=iHpgV0o6+khV81U4azRAnplaKyie/jXQE/rtXQPJ+luV/jUmbEwbXNXnRmRGAROg4kFaWiRaIpqM6BMAE1SuTOIEZYemQCc8855W+rLPJPlmBnodu6RVsZ4prXU69Exr1AIjeran7prSY8niJXUi9Yd0YeoifpovhFA91guKiHM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c2d3da12-7bcb-4a61-a495-a09c4d4123c4@amd.com>
Date: Fri, 12 Dec 2025 10:48:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jan Beulich <jbeulich@suse.com>
CC: Victor Lira <victorm.lira@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Grygorii Strashko <grygorii_strashko@epam.com>,
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|SA1PR12MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: ec372efb-1cb1-46ed-81c4-08de3995ec00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXdYOVJjMVhBZjR0VkNsUHhIZHFjdm4vKzRjd3E2c1VZSVJtYWEyUFNXa2lT?=
 =?utf-8?B?ZWVhQzVPSGd3TU5VckxZZmIweHkzUno4UUhheHp0MWVuQUFkSjJMalQwZERV?=
 =?utf-8?B?djF2NmdOSW02UW55YlhuSXBLL01MZUdTaEUxVVcxKzRIdm5iY3AwUmdHRDF2?=
 =?utf-8?B?VUxpbUhIZjk5TngwSFpvTWxoYStrcGM1TDBGOUZIdlBjN2FScHZjZ1NZUDEz?=
 =?utf-8?B?dGFMbGJCMGRRb1k5MFprQW8yVUtZdnc0UUJkcmR1RmNVa0hwOWtNT3g2SmFN?=
 =?utf-8?B?cVBpTG95d3FHUkNsdmEzbjR1RVhnbUJIb2FIazUxL0Q0RkxnRGFzZlFveEZS?=
 =?utf-8?B?OVNybTVSTlJHSm1tTmtMeVF0Z1cvdnpoRFB0dkZKaXBTMHVQc1lyZ0p5S1Bw?=
 =?utf-8?B?akdtYjVpaWloNjRxNVN2Y1p5NEkrYlVIRkVnVS8ySXZsN1YybWJjZXkvemxq?=
 =?utf-8?B?TXR3eWJ1L3d3OXZMbDJqUVJBQXJBaS9mNDl6Wll6U1pFZTl5Y3FMdDNLMzln?=
 =?utf-8?B?YlVXditmMlVHcytFcXViQzdqZ2VWZjZUSGR2blBYNGFLdkMvUlBBSUt4cUhl?=
 =?utf-8?B?QWNBQnVTc1pOemxyU3JKZC80ZG1EV0MyQ3M0WVZRV1pHS1VMbEp6cWE3NmFa?=
 =?utf-8?B?VjY5Y3dINXBoR3hjdUNHaFlEUUI3ZCtWdlo0SE1QWTdaZkdGUHZVQVhsTENn?=
 =?utf-8?B?L2tNUW1vSUdzQ0NrQTlybzdKRHhqWVF5aGRCL2p4NS94SitsRWhPQSszYlRz?=
 =?utf-8?B?L1RzTXZFRzJlUlRrSk9YTENkUWtMcmNOaElYZ0kxTVh6Q2VIMEU0Mk1USEN1?=
 =?utf-8?B?eHk1aTBlOU5renF6QWxIN1VIY2Q0djh0dGJ0Ukg0MXJQU2MzY3Z0U2FaTWtY?=
 =?utf-8?B?TVVkMUtmcjZoeDAwUThDZ3M0TzdDU2Y2b2d5M1MxOCs4TmxVSHhDR2M2Vmx3?=
 =?utf-8?B?SHZzK1BxekpWKzZVZWd4MVpaa3BDYk92bVBPL0loQy9VeTR6bWRSa0I4bjZP?=
 =?utf-8?B?QVBNVG5YOGhDRTExdlZTSWVGREdrL21iY0hvRnJoZHdRNzEwUFdkeGs2Z2s5?=
 =?utf-8?B?L0s5M0RlR1F6OWNKbll0YSs1U2Z5RlhaRGZXdWpVbHJQRzRpdkwveDdoUVF0?=
 =?utf-8?B?MG1nM0JNTHVXRmFpQ0lITmZPa0xmU1lOUmtOa3d5d2lWLzByTWcxWWZ3RlAy?=
 =?utf-8?B?SjlrU2s4N08xYi9CUERnVFMrTzZjQktwOW8wNjVSTnJtUXU1d29rRGtlRHB4?=
 =?utf-8?B?RzM2Tk9VR21CSFJyL3NxMTZMWjlhR1EzZ2w0QkM5QUFveDdTL1Z1dnIzZ2l4?=
 =?utf-8?B?L2hMVHVUMWlMcjlMYW9JWDN4YXhpYVhScnlHck1VVW15bWhXU2pnb0U3dzh1?=
 =?utf-8?B?cnZEaG0wQVdmYWpSUkdsNTdVdXZWVTQ3TDRLeEVkeEJZZjQvSFpuNm4zTmVR?=
 =?utf-8?B?Ui9YVWFuUkZvdEh6TWx2Z3lDeWorTjRpVFNvNHVqeFVQWGJCQXp0dGcvcnBI?=
 =?utf-8?B?OTJuRTc1eXhZcEJUMnZqcmhDYzlpdDBNbGxnWFdsZVZia3RWOG42T2pqSDlw?=
 =?utf-8?B?NWVmbUNvR0dqNjB0dFprUnk0Y1dweFZycHUvUzkxc2xrWGl4YXBBSUovOURo?=
 =?utf-8?B?SCtCTHkvcnZ3QW5FemMxVWU5ZytUUVB4blVYbyttS3JJZmpGOFF6eGdvL0Zu?=
 =?utf-8?B?YXZDZ2EzRXFKeTQyRDBieXJCSkk4T3FUY0FuamZqUUMybllseVkrQ3UzWmNB?=
 =?utf-8?B?OWkvK2ZXUkhFM2M0M25rYUJib25lYzQ3SC9BTUVUNGU5cVBRaFlxNTBHdWps?=
 =?utf-8?B?QmRkV0dha3FPOTFuZEpxSDhuU21Rdi9ubDBGNGxjbjluT2UwRkhHQjgxTkJQ?=
 =?utf-8?B?bWhJc0dhSGppaHA0dDF5YU1lSkVrbUJuVjlYd3I0V051RERFMWF5V0tlRmt4?=
 =?utf-8?B?SGRNQ0hidnlTTnJHTFJQTkErT2xacnQyZ1J3TEZiT3pVWW16eEljVUxBMlJw?=
 =?utf-8?B?T0xXRnAvQ2JHSTdYOW5xQXgyS2RoSndSQlVqa21IaWQzd2pnQ2kxbENIUlBp?=
 =?utf-8?B?QUpaM1c3ZlVyR2E4dXVuUkJpbDZzditnV21NMUFJLzUrSDJqV3R2eTZtUlpK?=
 =?utf-8?Q?fYwY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:48:40.4934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec372efb-1cb1-46ed-81c4-08de3995ec00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7104

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
>>           .globl  setup_boot_APIC_clock
>>           .hidden setup_boot_APIC_clock
>>           .type   setup_boot_APIC_clock, @function
>> setup_boot_APIC_clock:
>> .LFB827:
>>           .loc 1 1150 1 is_stmt 1 view -0
>>           .cfi_startproc
>>           pushq   %rbp
>> """
>>
>> diff below.  Any ideas?
> 
> I haven't looked into this in detail yet, but ...
> 
>> --- a/xen/arch/x86/include/asm/alternative.h
>> +++ b/xen/arch/x86/include/asm/alternative.h
>> @@ -90,25 +90,31 @@ extern void alternative_instructions(void);
>>    /* alternative assembly primitive: */
>>    #define ALTERNATIVE(oldinstr, newinstr, feature)                      \
>>            OLDINSTR_1(oldinstr, 1)                                       \
>> -        ".pushsection .altinstructions, \"a\", @progbits\n"           \
>> +        ".attach_to_group %%S\n"                                      \
>> +        ".pushsection .altinstructions.%%S, \"a?\", @progbits\n"      \
> 
> ... wouldn't you need another .attach_to_group here and ...
> 
>>            ALTINSTR_ENTRY(feature, 1)                                    \
>> -        ".section .discard, \"a\", @progbits\n"                       \
>> +        ".popsection\n"                                               \
>> +        ".pushsection .discard, \"a\", @progbits\n"                   \
>>            ".byte " alt_total_len "\n" /* total_len <= 255 */            \
>>            DISCARD_ENTRY(1)                                              \
>> -        ".section .altinstr_replacement, \"ax\", @progbits\n"         \
>> +        ".popsection\n"                                               \
>> +        ".pushsection .altinstr_replacement.%%S, \"ax?\", @progbits\n"\
> 
> ... here? Or alternatively use the 'G' section flag to the specify the group
> name?

The '?' flag puts the new section in the previous group, so it doesn't 
have to be specified.  I have used 'G' and %%S with similar results. 
The example vpmu output above shows that is working.  I can't get to 
linking with --gc-sections yes to see if %%S is no longer necessary with 
proper groups.

The problem is "the current function" needs to be assigned to the same 
group, and that is what I hoped to address with .attach_to_group.  From 
what I can tell, the function-section is not assigned to a group without 
.attach_to_group.

> As to debug info, I wonder whether playing with groups behind the back of the
> compiler is going to work well. Iirc it groups sections itself, too. Did you
> look at the generated assembly with this in mind?

The generated assembly differs only by the presence of .attach_to_group 
for build vs. doesn't build.  Is the debug information expected to 
differ according to groups?  (This is all new to me).  I have more to 
look into, I figured I'd post what I have in case anyone had seen it before.

Thanks,
Jason

