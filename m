Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFC49712B0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 10:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794041.1202713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snaC6-00072p-Cq; Mon, 09 Sep 2024 08:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794041.1202713; Mon, 09 Sep 2024 08:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snaC6-0006zT-9J; Mon, 09 Sep 2024 08:56:22 +0000
Received: by outflank-mailman (input) for mailman id 794041;
 Mon, 09 Sep 2024 08:56:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a5xe=QH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1snaC4-0006yR-CH
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 08:56:20 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e88::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 600de7c9-6e89-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 10:56:18 +0200 (CEST)
Received: from SN7P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::10)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 9 Sep
 2024 08:56:12 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:124:cafe::6c) by SN7P222CA0020.outlook.office365.com
 (2603:10b6:806:124::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Mon, 9 Sep 2024 08:56:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 9 Sep 2024 08:56:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Sep
 2024 03:56:04 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Sep 2024 03:56:03 -0500
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
X-Inumbo-ID: 600de7c9-6e89-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hfyl5Uj8GcCgi08Meckpvwyg8sMJyYSWL87b7TYNDM0ZayfYLXNXChfuEu4OSaiTVRdnw/Lmpq5xPSS6dVxLoqQM0R6y6TdF0DWuU/SR+te77d/WrG7fG+YVMQYAxF4wCtapnTBB0OKR2EitfcjLW5wfY8TRvxnQqOWSV1yJwHmuBhHt74Fx/En5yqUBZQbhIgUPNQfb+qYH1EmFhkvQUXeZgnb+d4OWKcjaV/OIxXzer6iVzsw64xkqEanMW0hwq+dmYzUdqu8WDoWOtGE4aE0DAfIoUMb1RMRM6M2633kl58slDGy79u01O7eqEMuiT85oiV+Bzc4uz6XKWkcSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsXomQWMxd1pbY+PeGBXuELqpawhMvuaMKVUB5S4wpo=;
 b=Y9XC0tWuOgb5NqEIY65KJ+nXBIhn0zzljK/7UNOJrMFz7lkIC6rvU9BwTayryfJPOuzLBiJlD4auHiS2H8LayGF5YE/t/3N449GK4hJqh89ZS6CSCjp8lSPokBng3qekpjZkTIBHCsoP3xIbL88mCikHwYWXJbVuZqxlUnGLHQq9fNUlGOKeSNzoqlp01WqwOuaQyF9QBziZQvlaU12HowqK3k5IsMFRsQ+cuUp7q4fCY4+IsFLWtbBn51AEOxhBmkQBe7yyu6HP5ex+lGywltcgQAw6u7kV/Jm7pmqaUYOcz4U5Hbxe6LgjiGEBAWxB9FQnEtditm55jHK+oYu7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsXomQWMxd1pbY+PeGBXuELqpawhMvuaMKVUB5S4wpo=;
 b=SxFdQeDidb7JqeuDlRlOM0CcGlDX7PF2/lDEsxqI3EXu1p1/RzcH2sao96Cc3umy+hTGJsEp58Jc/CueREz5Z8AXSe1unZaOskWhRMV5rdSdYCVfLQfpye7sz27MZkRCTTkitU1lyfPryImbiaGjMLmlO3tfYhgTaBNCqxLEc3o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <46b9567e-d27c-467b-b21d-65d63b6cd1e2@amd.com>
Date: Mon, 9 Sep 2024 10:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add Assumption of Use (AOU)
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20240906101318.1419954-1-ayan.kumar.halder@amd.com>
 <57632c2f-82e6-49bb-b989-e75c95070b03@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <57632c2f-82e6-49bb-b989-e75c95070b03@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d6c47f-32ff-48d2-c617-08dcd0ad3d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHNxMUlzNWFjSU9pdVU1UDVHNGRDT0FmVmp6ZnFsaHhQUVprSEFWdUhmZ213?=
 =?utf-8?B?Qk9NUy9uSEVnWFlocEZuc1RkbE1CenZ0NmZMeVl2cTF0VmxrdVoxODlFbXlH?=
 =?utf-8?B?eFd4VW9sa1B2MFFFL2NIYU1EQ0VPQXlzUVg1eG0waFdSdGNKbVNTVlJBWEla?=
 =?utf-8?B?NWpmTU15aWtMLzFXNVlPNE9TbEk5T01JYUw1cEVwUWQ5QThGMXBOZnRzTlRh?=
 =?utf-8?B?OGFyU0hHb1dicXNFaE14WVEzK2QyVGZLeWlBQkVVUnpOSmtaZytyQXlldFF1?=
 =?utf-8?B?bzFBSDQyaDlRRDNTeFJaV2pCUkJYTnB5RThvZ0t1c1BSOEdRVjlHYndrbkhF?=
 =?utf-8?B?SlV0Z2NOYVZUSlBLOEp0cHhPZ0MxM0RiWExFRFZBYlNic2QvVUJ5U2hvOUNM?=
 =?utf-8?B?OTFTbmpTMyszUzBOVU91QmR3YXIxV0xtNTdGTXJ5WTdPblROSGovUnVaYW1z?=
 =?utf-8?B?Y21YMHliWk5Oa05uaVBsclEzWmhFUXF1ZVBLTkFLcmlrbjgxRElOTE1YMjRO?=
 =?utf-8?B?WFk3YWpJZjgvVHRmMmJvenlVa284YnI5Y05DVUhUdEZWSmlDSTVWQjM4N3BC?=
 =?utf-8?B?MEVUYVVIYVQ0b3dXb2dYQ0VHNmxmaGxUSjZjenc0aDJxTnU4L08yQ0x6S1hR?=
 =?utf-8?B?bVRUNVJqRTZISUpOREQ0NEVuYXdES3QvRFdjcjBlOS8zVnBZT3RMZ2dqV0xZ?=
 =?utf-8?B?VW1tYlRub29KZXdwSjJGdktCKzdHTmQyeEIvRVY0T2NaUThFRnNWV29nWWxK?=
 =?utf-8?B?eFQ5M3Y4OXVrWnM4U0xsVHRUblJOcHRHVUIxRTBPdkxwYlppVnQ5YWxVMmFK?=
 =?utf-8?B?dmJ4RmozLzhMNFRrdnJDbjZpbm51OU1NaEI5OFJhOE1FUk9SV1ovYmRVa0t3?=
 =?utf-8?B?cmFLOCtRL2NBU3VyWjNtcllGNEFtU3hkdzBDZ1BQYmJaUkRHR3lMbEI1VGs1?=
 =?utf-8?B?YUh6djVZQTBwanQ1VS8raWJHWFg3ZjdDZklTZ2htRDB5SG0wbFo2OVcwRk55?=
 =?utf-8?B?V2g5ak9sQjZDcDVIbzVYMndXS0YzV21ub3JYZUUrWklHbDdkQ2FhV2JROU1p?=
 =?utf-8?B?VHF2KzBSL2dhSk9XMy9ES2pQYzZVVG5qa3c4bklodWVqZ3FXbGZwd2ZLR1dV?=
 =?utf-8?B?SFhOejFhYzZuODRoU29qYUY4dEJQZ2R5UHhYWVM4eThqb3VSWjF5WnlOSEZV?=
 =?utf-8?B?RDhydmxpeis0RFI4eXZPMjRScjNvMk5lanNlclUwV1N2WHd6bmR0dklreTB3?=
 =?utf-8?B?TkVyck00SXZlc05QR3dwSEFhdHVBMXpZYUJ4YlFnUkxDMlJNK2d1VEI1RUR1?=
 =?utf-8?B?UHYrUVhqU2JVQUErOEd2Ry9xd3N4cGxzVCt1bEdwZHFXVU1UejRTSHVsZTBt?=
 =?utf-8?B?VjRnQnNBdldtMEczYXBySS84RlUrOGlMbzcxQ0pQQUxKbkdsOUw4dS81VWVh?=
 =?utf-8?B?YnNBekhWSENxL3dCR1B1M3ZOVVZ4N0J6a3M2YStiOWx1Z2ZjOGdOMFhiSnBu?=
 =?utf-8?B?U1I4ZHd1MDM3QkhaUFVPQ1dnK2ZQWnkxbmxCQmJrcmdXL0JuMnVHT01vRThF?=
 =?utf-8?B?SUt0UmNQUjRFakpaVzNaVzlCeE5SaitNekx3TnVzeU9ZcXg1cG93Ni9zbEJK?=
 =?utf-8?B?TFFnZ3pVMy9XVTZXYnoyalpoT1NMRGVrWU41UWczVDROSzB5VE15MnQ0V1M5?=
 =?utf-8?B?Rms1b1E3VUljd3NGWjhuQlE1MTJxVURFakRNM3ZGb3lnRmZaRHFidXlsRmpz?=
 =?utf-8?B?NXBQelczNUo2VTlwMG1PQ1VES3BPeThTcys5QnVJOGQ2SWYxTDFTZzhIRzNF?=
 =?utf-8?B?ZDUxdlp2Lzg4cTdGVndOVzFOY0c1SlV3bHhWdG5zOHI4WjRyeW9jeTVHY242?=
 =?utf-8?Q?07G8eaC41mGGL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 08:56:05.4823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d6c47f-32ff-48d2-c617-08dcd0ad3d44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373

Hi Julien,

On 08/09/2024 23:05, Julien Grall wrote:
> 
> 
> Hi Ayan,
> 
> On 06/09/2024 11:13, Ayan Kumar Halder wrote:
>> From: Michal Orzel <michal.orzel@amd.com>
>>
>> AOU are the assumptions Xen relies on other components (eg platform, domains)
> 
> Searching online, I think the abbrevition is AoU rather than AOU. This
> would also match how we abbreviate in Xen (IOW if we use a lower case
> letter from the expanded name, then the letter in the acronym is also
> lower case).
> 
>> to fulfill its requirements. In our case, platform means a combination of
>> hardware, firmware and bootloader.
>>
>> We have defined AOU in the intro.rst and added AOU for the generic timer.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   .../reqs/design-reqs/arm64/generic-timer.rst  | 19 +++++++++++++++++++
>>   docs/fusa/reqs/intro.rst                      | 10 ++++++++++
>>   2 files changed, 29 insertions(+)
>>
>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>> index f2a0cd7fb8..9df87cf4e0 100644
>> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>> @@ -116,6 +116,25 @@ Rationale:
>>
>>   Comments:
>>
>> +Covers:
>> + - `XenProd~emulated_timer~1`
>> +
>> +Assumption of Use on the Platform
>> +=================================
>> +
>> +Expose system timer frequency via register
>> +------------------------------------------
>> +
>> +`XenSwdgn~arm64_generic_timer_pf_program_cntfrq_el0~1`
>> +
>> +Description:
>> +Underlying platform shall ensure that CNTFRQ_EL0 register contains the system
>> +timer frequency.
> 
> The wording in [1] (not yet merged) implies that CNTFRQ_EL0 may be
It is merged:
https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=51ad2c57a2d21b583a5944a0dc21c709af022f3c

> invalid. This seems to contradict the Assumption of Use. Can you explain
> the difference?
The requirement you refer to is written from a domain perspective and is about Xen exposing the frequency
to domains via CNTFRQ and/or dt property. In case of a presence of dt property in the host dtb, Xen could for instance decide
to emulate CNTFRQ instead of relying on the domain to parse the dt at runtime.

The AoU on the platform (hw/firmware/bootloader) is written from Xen perspective and is about the platform
exposing the correct frequency via register. This is Xen expected behavior on the platform. In other words, the platform should
expose the correct frequency via register.

However, even if the frequency in the register is correct, the host dtb might still contain the "clock-frequency" property.
Even though it is stated in the bindings that this property is about overriding broken firmware (which in our case is not),
in real life scenarios, the property can still be there and can match the register. This is because the host dtb is created by the user, not platform.
Even in Linux dts base, you will find lots of examples of device trees with this property. How can Linux know if the firmware
has been fixed already or not? This is why we want to give possibility for a user *not* platform to provide a dt property.



> 
>> +
>> +Rationale:
> 
> This seems to be a bit odd to have an empty section. Can you explain why?
That's the format we decided to go with. It's been documented in docs/fusa/reqs/intro.rst.
While AFAICT it is not strictly required for OFT, in the future we can decide to write our own parser to
present the requirements in a nicer form that OFT exporter. Then, it will be easier for use if each
requirement defines the same fields (I agree it's a matter of opinion but that's what we decided to use).

> 
>> +
>> +Comments:
>> +
>>   Covers:
>>    - `XenProd~emulated_timer~1`
>>
>> diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
>> index 245a219ff2..aa85ff821c 100644
>> --- a/docs/fusa/reqs/intro.rst
>> +++ b/docs/fusa/reqs/intro.rst
>> @@ -38,6 +38,16 @@ The requirements are linked using OpenFastTrace
>>   OpenFastTrace parses through the requirements and generates a traceability
>>   report.
>>
>> +Assumption of Use
>> +=================
>> +
>> +To fulfill one or more design requirements, there may be underlying assumptions
>> +on one or more components that Xen interacts with directly or indirectly. For
>> +eg, there may be assumptions on the underlying platform (hardware + firmware +
>> +bootloader) to set certain registers, etc. The important thing here is that
>> +anyone who validates these requirements, need to consider the assumption on the
>> +other components.
>> +
>>   The following is the skeleton for a requirement.
>>
>>   Title of the requirement
> 
> Cheers,
> 
> [1]
> https://lore.kernel.org/all/20240829113120.3980270-1-ayan.kumar.halder@amd.com/
> 
> --
> Julien Grall

~Michal

