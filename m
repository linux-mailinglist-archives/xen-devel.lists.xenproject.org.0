Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 345B8A56E4A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 17:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905223.1313082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqatu-00015D-LD; Fri, 07 Mar 2025 16:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905223.1313082; Fri, 07 Mar 2025 16:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqatu-000125-IU; Fri, 07 Mar 2025 16:50:18 +0000
Received: by outflank-mailman (input) for mailman id 905223;
 Fri, 07 Mar 2025 16:50:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EBm=V2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqatt-00010Q-4V
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 16:50:17 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2413::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e2861d3-fb74-11ef-9ab6-95dc52dad729;
 Fri, 07 Mar 2025 17:50:16 +0100 (CET)
Received: from CH0PR04CA0063.namprd04.prod.outlook.com (2603:10b6:610:74::8)
 by SN7PR12MB7954.namprd12.prod.outlook.com (2603:10b6:806:344::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 16:50:09 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::6a) by CH0PR04CA0063.outlook.office365.com
 (2603:10b6:610:74::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Fri,
 7 Mar 2025 16:50:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Fri, 7 Mar 2025 16:50:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 10:50:08 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 10:50:08 -0600
Received: from [172.20.156.222] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Mar 2025 10:50:08 -0600
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
X-Inumbo-ID: 3e2861d3-fb74-11ef-9ab6-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbX3yLPJlREPIMJm2IjjGn1C66ynDObj7ue6yYmSh4iPfcIM254SiK5FLOxgyfeBlgcf4SUKGaCse/IqffIvu1A7HPMD4TCu0GrUQ+s8eZtXsHAdy3QqZ8sj3piWrZBOUrb3SfMRawuUmnLQzeL8Zl765Vx0eHfUv7iIBwibuiUFr9oQWGzgXYM5DBoLkdYet0viHlsYDb98gzu4mu3M9usTEbwHdgj8eFOZzRumTKTz9f8YSJT8akoE61QUgXA/nwlbc8biORhmdaWbPb92Om4gIJdr6B74/QlmKXcKrm+fNZ7ynvgg0ffCOh1skaNC44OfNC27m3aaSNjpzjLNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaMEf4hiqQ+SBwHKWaef253oG8EnBU5z73/RaAVxkn0=;
 b=vsTbkpK2fkSsWvjEnXRs0zAeHRRMvGffLRqb8uTEflSjObib6eRxLgRPBNCKWOfULhSGZ/Q7i7GySy8IRlfoR8lbQ/uaDYhV/Eh6AqHuscYh4WCpnTRYF18wUUL9LUrgC4VYDS36O+5HWdDpGtRu4xOYMiKPMMRZIQ5u8LXMxhyIGKLRh1PNb0UaB9TC2gIfsXj4tndK7M6SrKxfW6XVv7NcjSa6f1/PG8MtK07joPEnvzijLiBdBDmcLVIj7UNe61SInvfbBfqdhEzZfJY2cU2HMsYN8+OkYbgCPV6El+5l8uvMT8LjgZu8rtQ4TLp1QXNXTgECkHEV6CVsuX3evw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaMEf4hiqQ+SBwHKWaef253oG8EnBU5z73/RaAVxkn0=;
 b=D+BiLf6KU5zpwUokFxDjJjRDtk6t2YxB3UW4O30BKLHry0OH6wVKfStZQyxdjoVhOwxj2JznGFkQdc67Say/T2yEGPVIYFjN7WZTXxjvPIBkgAFn3odPbjVbsI+u2Y3GUJ+Y9DsRsn3vGPRVrhkTAH3WOtwiIRHftNl7VOBOp0I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <53ffb461-7497-40e6-b632-60230f41d9e5@amd.com>
Date: Fri, 7 Mar 2025 11:50:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/23] xen/arm: Add capabilities to dom0less
From: Jason Andryuk <jason.andryuk@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-6-jason.andryuk@amd.com>
 <alpine.DEB.2.22.394.2503061738430.2600338@ubuntu-linux-20-04-desktop>
 <8a8cf06d-4e2e-4d42-baa9-21cc6bf1f863@amd.com>
Content-Language: en-US
In-Reply-To: <8a8cf06d-4e2e-4d42-baa9-21cc6bf1f863@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|SN7PR12MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: 07675f63-386b-412f-5aed-08dd5d981f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THJRMktTRFZhU05YN29XK0JHUFFLa3ZYd095cHBVNTFaWkFRdTYvVUdHZzRy?=
 =?utf-8?B?dktkUWc1Nmpoanh3RVBRQjU3d3RheU9hd0tjcUhveW5vQXdmV0pMQWx1UThI?=
 =?utf-8?B?RHBOUnUwd2hLck5xa0ZoNEdpNzNXK3VKRUNSSVZDajY3clBBN0FjSEhaaGRq?=
 =?utf-8?B?U3lmc0RIZXhjZnVHSkZKaTFkM21URjdjVllySTJVM1VJVXBsY1k3SEFzL2tj?=
 =?utf-8?B?NlFaU0xUcmlYMld1aWFadFJmemZ0dXhhZHg4RFJLOGpXeS9peC9JSENJK1NN?=
 =?utf-8?B?L0VGZGpOeGdMQ3MvNllyelJ6RUkwMjNGbGJSY3IvTnJJcGprN2VodVNiQ2tI?=
 =?utf-8?B?ODZRMlVuWWJ4NGNCdUczZmg2T3REcitHb3RUMGU4Mm9hcnBHNEFqOWI4SDFo?=
 =?utf-8?B?QUJMZTJMbm04Wm1ncW5LbnFPK0MwTDBoY0t1SW1La0ZpL0hpTUx4bTYvdENi?=
 =?utf-8?B?aDhFaDhDRE85bkIzZGpCVkc5bzViMVdlUXhFVmtuSkNpMUVtUHc4ZTBXZysr?=
 =?utf-8?B?Z2ZjaWxyOStiaUNQY1RwdXR2WVk4L3BqamJ5Y05jT0tGS3dwVzhhNXVuZ0tO?=
 =?utf-8?B?aHFIK01kczRBWUI4LzA3dGFYYXc3VkxGRGhxMmZ0NlVOa0lxV0d4YzlBeEpV?=
 =?utf-8?B?SVBHWnd5MjFoclVKRnNZdFRTRzlvc1hyZXI4SlRZOWRHZDB5TUxPaEFIczlx?=
 =?utf-8?B?OUNpeS9IdlBISEUySThmQmdUYnNnYjFZR2NkczhZZ3pCRFRCbVIrcG1nNHJq?=
 =?utf-8?B?cXE0M284K3lLMS94ZlYyb2RnaXl1VCtvN0ltcjYyNGJnK3FJa0ZxcDYxdlNr?=
 =?utf-8?B?ZmFWNWN3NEVKYjBjOHVvUm5sV3U2S0JhdFFHVHBxeEhFbDloS2luUWpBZ2I0?=
 =?utf-8?B?Y0RrT04zZS9maDI5SUl0SDRZSU1Ec21LSkZOL3N6U0s0allnK3NYYzBKZlQ5?=
 =?utf-8?B?dTZFN2lIbzJYT3Z0RUdXdDNYQThUS1ZxdmVTejdadVBsZEVLcDdUcFgzcW5Z?=
 =?utf-8?B?bUM4ZjFUNkliOE5kRlJlc2FiUzZ5dER5bTVQUUM1QjBiTnNNUXc3RDM4YW4z?=
 =?utf-8?B?Yk5NaEJPNWJ3RnNQcW1xTVhLLzdhdWdCWDJKOWZMbkdEMDd4NkFXR3hkRXNa?=
 =?utf-8?B?NWg0TlBxeUM3Ty9xZmNyeXZCamtqTS83U0gvQm0wOWRJV1J0RDUyVXVhMmdE?=
 =?utf-8?B?NDVmenBDNmFhY005TjhUTzdlV3VVYWJzN1k2Wk14Um1EaHl4d0xlUENYYW5T?=
 =?utf-8?B?bVI2ZTllWW1xRkN0RS9ubUJrK3E3ZEIwUE8wc2JYM0JBdmFGSTJuQWhDTE5q?=
 =?utf-8?B?all3ZUY0cE5UN0pOMG5OejI1dkNpOWJIQXg1dlQ4R1RLdW9uZWZGRm8rR25G?=
 =?utf-8?B?QUVRYmt1bkxhb2taMEZ0dk5ybWJLOEpiME9qbW11ckE5Y1RjNnZGZ00veEYy?=
 =?utf-8?B?ZExhVFdJVnVkUWFXTTdpTlNiL3pHbkY4a2wyWHE3OG1GR3g1UDJOcWc4blBH?=
 =?utf-8?B?K1UrMGFodzVSdWFxdFZKS0xhem9MQW41ZHBBMWdDWDVTMTJxMHlCTFAxRnNv?=
 =?utf-8?B?QzRmZEY3R0RWR0d0czZyNkM1Tm01SEdpL0xseG12aVlvWkJLUEVPSFJaT1ZC?=
 =?utf-8?B?aDg5ak5JUFErYzhXcmZrN29yVzA2bURKbmx5YVlNZnFEYUVaa0hZS3JPTzV5?=
 =?utf-8?B?eXBMNXJLRU9IVHVGN01tenRNZVJBazUzRWFnWmlOWWRGMlhMRmhzK09ZUUlt?=
 =?utf-8?B?TGhYSVJMYjVXTWVsTGovbGc2L0NGN2YrVlZXNTdRTzdLVDYzL2hyWkJyQldu?=
 =?utf-8?B?cXFjWEJJd081dUo4ZmVsT1JCbU14eUhTWVhKbTc5YlJsSWVQZ2lxcW5KV0N0?=
 =?utf-8?B?SHlhMWNITVFXOFhRZU1YcFRMTnVpWUlYbjM5ZVh3REROUGZLMkFtT1Z5eExx?=
 =?utf-8?B?NjdHUVNxZm1UQy9KeE50bzd6TTkyUGhoTVk0dFZvaEE3aFhkKzBFSk1sKzNF?=
 =?utf-8?Q?oPoiro2CmfX2gj84yWbOsTlkDwwFmY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 16:50:09.3365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07675f63-386b-412f-5aed-08dd5d981f0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7954

On 2025-03-07 11:40, Jason Andryuk wrote:
> On 2025-03-06 20:40, Stefano Stabellini wrote:
>> On Thu, 6 Mar 2025, Jason Andryuk wrote:

>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less- 
>>> build.c
>>> index 5a7871939b..068bf99294 100644
>>> --- a/xen/arch/arm/dom0less-build.c
>>> +++ b/xen/arch/arm/dom0less-build.c
>>> @@ -12,6 +12,7 @@
>>>   #include <xen/sizes.h>
>>>   #include <xen/vmap.h>
>>> +#include <public/bootfdt.h>
>>>   #include <public/io/xs_wire.h>
>>>   #include <asm/arm64/sve.h>
>>> @@ -994,6 +995,34 @@ void __init create_domUs(void)
>>>           if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>>>               panic("No more domain IDs available\n");
>>> +        if ( dt_property_read_u32(node, "capabilities", &val) )
>>> +        {
>>> +            if ( val & ~DOMAIN_CAPS_MASK )
>>> +                panic("Invalid capabilities (%"PRIx32")\n", val);
>>> +
>>> +            if ( val & DOMAIN_CAPS_CONTROL )
>>> +                flags |= CDF_privileged;
>>> +
>>> +            if ( val & DOMAIN_CAPS_HARDWARE )
>>> +            {
>>> +                if ( hardware_domain )
>>> +                    panic("Only 1 hardware domain can be specified! 
>>> (%pd)\n",
>>> +                           hardware_domain);
>>> +
>>> +                d_cfg.max_grant_frames = gnttab_dom0_frames();
>>> +                d_cfg.max_evtchn_port = -1;
>>
>> max_maptrack_frames = -1 ?
> 
> Yes.

Actually, -1 is already used to initialize d_cfg.max_maptrack_frames.

Regards,
Jason

