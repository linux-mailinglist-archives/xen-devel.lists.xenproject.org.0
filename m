Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96050A56AF9
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 15:56:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905090.1312852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqZ7T-0005Vu-Bd; Fri, 07 Mar 2025 14:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905090.1312852; Fri, 07 Mar 2025 14:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqZ7T-0005TX-8r; Fri, 07 Mar 2025 14:56:11 +0000
Received: by outflank-mailman (input) for mailman id 905090;
 Fri, 07 Mar 2025 14:56:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EBm=V2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqZ7R-0005T9-Od
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 14:56:09 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:2417::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45043500-fb64-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 15:55:55 +0100 (CET)
Received: from BN9PR03CA0561.namprd03.prod.outlook.com (2603:10b6:408:138::26)
 by MW5PR12MB5682.namprd12.prod.outlook.com (2603:10b6:303:19f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 14:55:51 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:408:138:cafe::2e) by BN9PR03CA0561.outlook.office365.com
 (2603:10b6:408:138::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Fri,
 7 Mar 2025 14:55:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Fri, 7 Mar 2025 14:55:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 08:55:50 -0600
Received: from [172.20.156.222] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Mar 2025 08:55:49 -0600
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
X-Inumbo-ID: 45043500-fb64-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYZRdj3g4SCm1r9h0MIRZhbXPPpcjDvmaTcR5oBxzh+V9Uxd4UVoTiGqTtjyjg1V9zxb2bkaQE9IneylU8oBjwinFKzP/xrL+7i5wjgxLaiYT4W8Gf1p/XbEL0yLIx+bOYhuORDlfeUXm64ihTKe1XHMW1V2BoF3menrc2D4EHJRYwWyFVD0VpQ7uraJ4OEWew2UlRk/ouyRi+cq0c+3OFeAXTlydj+Li9w8uOssJDZOYCcj2rpl0WkVj/zzRY6JPZA+lgFfM0XglZu/wpstd9K8simxygDr/h7CcG+Fz0+dtH5Z/GTFm1S2Vu0fSc6+ohgZXx9MamLYVI8EJYbNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFaYEivUuXyQSV+HkU/ttBd/P0Jev+Ka6o6RT4UJfI4=;
 b=WyCaL8xsum/EXQoKXgnMHtyHwhtlv6NGRTBBZ8Lb0EATL4EDTg6BGuUnd+P2KIia0YzpbMrg9YWY6xD1T5JbHN10xfxgVuesVUN1wKgv/oDW14yraTD0EABojRssk6Kv+jHF189pPjiPFq3sVpVIbY7IXiHgi11CTH4PUGCSjcBdUuQbnVoLrb0/6wXx1VoxYUHeU4ReBiiF/JMsxr7usTTZ8zFl7Nh47M8WgwRBBqa9TCbpaUN3wglrhOaK7GPGt+2rvML55i/y/O+ItJoj+E0YQJ8qxE/kCb1tmfidK+9XT3QrkSViyTAjw66rjlHeDLABilV3KOa2Ka7Pqw7Ybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFaYEivUuXyQSV+HkU/ttBd/P0Jev+Ka6o6RT4UJfI4=;
 b=MNkTOeMBRPMtcRmi/U+mTYAyd53X8EjwIZH7ZR8Ewun3sL2MIB9XfYXorhaUqMZT6fWNHsQdJ5xKivncdgFIA9+EAwKdqIVQeMaYQUVJesyzZMUFgYoJ55gc8zwF6rvTLrMojt02EF3qMp+yfmKeFGmnxgeENLDczxMI7SojsVo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <cc4e26f9-e198-4677-8873-343f49d0f1ac@amd.com>
Date: Fri, 7 Mar 2025 09:55:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/23] xen: introduce hardware domain create flag
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-2-jason.andryuk@amd.com>
 <eca6c919-043b-4e7b-a04d-639406ca1332@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <eca6c919-043b-4e7b-a04d-639406ca1332@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|MW5PR12MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2866b6-3562-4d33-bafb-08dd5d88270b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NElaNHA4Ynl2MFZvN2NYZjhEOUtrN282K2FCY0cxeDgxQmVNUkJJaDNQeW1F?=
 =?utf-8?B?NVZTNit0TDlyS3NiM2o3dW1vNzRuUDRnbU1jaldRKzVQNmtTUXVtNE92YnF1?=
 =?utf-8?B?TGpwRjNFTGpzUU54SWU1YngvMVd0bW1ibFBsaTVqYUhvdHRaMWNVOC95M3Ux?=
 =?utf-8?B?YTZRSFNPRjJvOUNCbVdIN3pwdXNwMDN5bnhZbjNSWWw4SDh3L3RpbEhNNW95?=
 =?utf-8?B?MXMwRTE2VVhVN1k1KzNvakk2T3hZZVMybjZlVElZeHZxQW5lQ1dTQllHNHBi?=
 =?utf-8?B?bi9lclRzc0hrNCtOME9OK2FvQlZreWxyVjQ3NjJ3MWE3ajEzdGhVNFlGM2l5?=
 =?utf-8?B?Q0EyZVBLSmJqQ1lhTmV1Z0hPZnltL2JIY0Naenh4RDBPQ0laSkR3M0Q5Ym1I?=
 =?utf-8?B?c1Y4S1VNSnREMW9sYkUyZEJlYmJwamZRWjFvblVXRHMwYThHUEkvZU8xTEk3?=
 =?utf-8?B?U0FwRndWWXcyQVpMREQxQ1g1VzQ2dXhxaFdlTWJZMlRWbmRTeC8wSVZRR0U4?=
 =?utf-8?B?RzBjYnB0VE5yOGp2c3UrV3FsTEpUVm9tSHYxTGdQbHNyL0lLdG9FazA2dFJp?=
 =?utf-8?B?TTYxQUhiOHpYVlhBQXZpQXk3U3RNTTh4SFRRMFlBekdUVk4yaEJiU1p1NGRm?=
 =?utf-8?B?eU9iRXZtMzREbVpMUWNMWjlzejNickNoOERHUDZJMlJUUmhjSTJxZ2g4b2ZG?=
 =?utf-8?B?TWhRM2xUS2hhVytjcm5ZdDM3TGRTNFA4SmFVaDd2d2YrZkRRVWlxUWhzblhJ?=
 =?utf-8?B?YVVYMzVUM1dhQ1NsYWFlbjA0Y0IxWjYvekJYS1kwbmRDVmZ6bUliZ0F3Z28r?=
 =?utf-8?B?T3p0V05mNTNOZ3IvblJZdFVhNW16UTRwQnF3REthNGlEeit5OElDYnpUNDlZ?=
 =?utf-8?B?dFJjMGVZaUx2OUVuc0F0ejVMc2VwNmlGQkNzcXdyOEZra1hNbE9oZEtQVmdr?=
 =?utf-8?B?L1lPS2NoSWJ4ZFo5enJSUjlmc1ErSGJ5dUFWTHgwN3JvRTF3ejBiU3pmcXhr?=
 =?utf-8?B?S3ZIYm04a0Z3NDRwNDVYcS9DNmVrelU3TjdXVlh1WXlWc1E5aS9Mc3UvZDdG?=
 =?utf-8?B?QUY4S0IySlplOE9GUHRTQXNtdmZpWHYrQzg1eVdDUWVkL3g4RXVza25PQmty?=
 =?utf-8?B?eld1Rjl0ODhMV3BTekpBc3RuOTRRb2ZGenlndW1xa1VZTTNGYXc4RHA3Rytx?=
 =?utf-8?B?MHBtQzdubENoa0oxUy8veVgvU1Bvb095dWFoN3JjNjEvYkUwSVlrOGFBb1pC?=
 =?utf-8?B?UlRVUHdobGxxV0xpbUI4VVdIZXdmSGVPNFVnRkFXWkFJWFRVOFBGL3FIQWZ2?=
 =?utf-8?B?VEU0YURzUVp1czVqZUgwUVhKTXhLMzRZeWF6ZEdmNVVPNzBqMWxzYS8vbjY4?=
 =?utf-8?B?VXhkWVB1NTI3cGcrbzZFK1czRUxFaEtPNVpUYlNkSDJuR3FsMVdxUWRWdVk0?=
 =?utf-8?B?ZEFROHpTaHkvT0ZsTnZERU5DUStYSGtzOHgxbjJMRENFOFg1T1dwTU9zblVL?=
 =?utf-8?B?bXBBWENUT2J2eTNRTU5hRGxUS1Y2TDF5aHB1WnNLSmhSTEZjWS9YaElqVStr?=
 =?utf-8?B?L2RBeUhtUzRkWmFyamlGVTF3aStONGlteDhIOHQwL2k1MkFqTUhISjVhM1ZI?=
 =?utf-8?B?WlZSZ3JBeU45R3BzZU1ybjVDSnFESUxueG9wMGZlTkVrZ2JLOHRLV2Q4ZURE?=
 =?utf-8?B?QmszUGVjdnowY1Bzak9qcmxaR1hkaWEydnVjRkZjZmdVTk1xMG96elNQbzZu?=
 =?utf-8?B?Z3RIUmdzTTdFTUVCTDVEMXpQQXBBMEhQNkRiL21kdDZiWnExL0ZNTnRMcDlV?=
 =?utf-8?B?Y0NOQ2F5YnkwS0dROSthS3RvOVhvNEQ3aGo4cElsZWFqVURSaXl2QmFONWlG?=
 =?utf-8?B?R1krbTdPRXE0dHB5Q2NLelhiZ3czb2Q4bXJJaWxLSWVLMWJmZGUvOVdTS2xi?=
 =?utf-8?B?b0Z4SkgwOXVqQWJLSGswSWtwemVndkFNc04zdG90NThnWXhvUXk3U1hIR2Jp?=
 =?utf-8?Q?gzWTPhOO8ar8ujNa/h26pCyzitXjpw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 14:55:50.8025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2866b6-3562-4d33-bafb-08dd5d88270b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5682

On 2025-03-06 17:39, Andrew Cooper wrote:
> On 06/03/2025 10:03 pm, Jason Andryuk wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>
>> Add and use a new internal create domain flag to specify the hardware
>> domain.  This removes the hardcoding of domid 0 as the hardware domain.
>>
>> This allows more flexibility with domain creation.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> I definitely like the removal of the late_hwdom bodges.
> 
> However, there are several things to be aware of here.
> 
> First, CDF_privileged probably wants renaming to CDF_control, now that
> CDF_hardware is being split out.
> 
> Second, you've created a case where we can make multiple hardware
> domains, yet it is very much a singleton object from Xen's point of view.

hardware_domain still remains the check for is_hardware_domain(), so 
it's still a singleton.

A later ARM patch for the dom0less code adds a panic() if the device 
tree defines a second hardware domains.

> This might be ok it's addressed by later in the series.  One especially
> nasty bit of late_hwdom was how dom0 started as both, then the
> late_hwdom stole dom0's hw-ness.  I expect untangling this is more
> complicated than a single patch.

I didn't address the late_hwdom path.  I don't think I broken anything. 
But this hardware stealing is why I added the 2nd hwdom check in the ARM 
code.

> But, by the end, I think we do need to have reasonable confidence that
> only a single domain can be constructed as the hardware domain.

What do you think about multiple control/privileged domains?

>> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
>> index 3de5635291..b5e82578c3 100644
>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -50,6 +50,8 @@ void arch_get_domain_info(const struct domain *d,
>>   #else
>>   #define CDF_staticmem            0
>>   #endif
>> +/* Is this the hardware? */
>> +#define CDF_hardware             (1U << 3)
> 
> No, this one CDF flag isn't the hardware.  That would be the CPU we're
> running on.

:)

-Jason

