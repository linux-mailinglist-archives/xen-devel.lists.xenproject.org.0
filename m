Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE199B4649E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 22:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112387.1460677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uud94-0007lW-Et; Fri, 05 Sep 2025 20:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112387.1460677; Fri, 05 Sep 2025 20:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uud94-0007k1-CG; Fri, 05 Sep 2025 20:34:54 +0000
Received: by outflank-mailman (input) for mailman id 1112387;
 Fri, 05 Sep 2025 20:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2T6=3Q=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uud93-0007jv-MT
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 20:34:53 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2412::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2a04292-8a97-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 22:34:47 +0200 (CEST)
Received: from BN9PR03CA0716.namprd03.prod.outlook.com (2603:10b6:408:ef::31)
 by DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 20:34:38 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:408:ef:cafe::8a) by BN9PR03CA0716.outlook.office365.com
 (2603:10b6:408:ef::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.20 via Frontend Transport; Fri,
 5 Sep 2025 20:34:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 20:34:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Sep
 2025 15:34:37 -0500
Received: from [172.31.134.167] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 5 Sep 2025 15:34:37 -0500
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
X-Inumbo-ID: c2a04292-8a97-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chK6wPY/LmsWa33NJA5hoy5dryqTW5HjaIYVtmuFkJqWC3bg4fsA7dQBiOphIhgYqW/NrryuQiMFKsUPyaUwnO9qXimmUnk1RECHy+gkAKTeM5LmLC9EX2oifvAeAP9JafUDVAoaqfBzG4TFE3RqVOE5PAvOeA0Ca5Z8HliiAj9KAPH4hY7XQjCr7FdkAFTouaBcTy5ODS8JUUVvYn6IkVyqhVz6mkscoM3SXF7S/05KeNeO/vbUjdnFmtBwmZPpr7N3A0BwmINbDdLY4+VmDX2cN/H5PQa9Bm/pb+UT1LBkglJb39Yk4/uLX69qCy78l//VULw05sDcp8CxWIhJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXR19HnIZvKmkNP3t9Sh2qCcg+esTHU0+stLKmvAasM=;
 b=FZQ8wnGc5z3t4BxZWfHKX5x50XJvSlYejtAvsJVyw8GAMM+ffTs/PDrBoJq1rGXZAt0kOi2F24g4qeMqW2fOxRfuowTkas3xRSyy/xWWAWKeGRkCpv0kq4X9rs74zygY3QMQrafUfaoVLQkIQEQrd1IRXx3IaT3aWGSUjsAYxNFpXWhTauL4V/9pyV49eUMHFiBi+ZMG+llIIpwq5wghzNeVqENENSGYXQbdzIHHE3l3IB71/M44koyVWEYeGfk/lTS/K6w+xSDwp0pq6szKLIjDNVAsf9CySVF2QZL/JrhOEfD3tQmVIdS3lgoKyr5pOCgMypL2nYixvRwH3zyZOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXR19HnIZvKmkNP3t9Sh2qCcg+esTHU0+stLKmvAasM=;
 b=jnpgQmfOAIba6oOTIbg6qBt6MFKghiLE2v+TctCJA1oftC6XSHPZrV3WXT+We6pWxn3OA0gWxPBWF39A02u0yjG7c1Nwi7A/s2FAVAaKIBoiZwibcyt/V2ngq7vV9VDy2Y8upp7F9IueS46lbDdLbaRIOMcaikdd8tQdXnUgJOU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a60f0e63-8f3f-4833-84b0-30ff763699d6@amd.com>
Date: Fri, 5 Sep 2025 16:34:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/apic: Avoid infinite loop in
 io_apic_level_ack_pending()
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20250904215137.135529-1-jason.andryuk@amd.com>
 <57fedb53-18b7-4d81-acc8-2756a899ef90@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <57fedb53-18b7-4d81-acc8-2756a899ef90@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 75620421-e07e-4b9e-4cc6-08ddecbba25d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1RCWHZUNlREM0Y5K254d1o4dHc0UENnY0oxWU5kejhtZUN4OHNVQUlMSWMx?=
 =?utf-8?B?QkpnU2JSallXVFJydUZBUUIxNlRPZ01xSUlJUGxHNjRlcHFyTlFLUFVSSmww?=
 =?utf-8?B?YTZWVE8vTXRaaFN4MDBER3g2c2dNYis1MUxjUTh1K1VkSU9RK1hsczRNODFv?=
 =?utf-8?B?cVRzeUVpNDVXY1VmOG51clhUbXlqNUp3aDFCTms5SUZjOVF6bVYwMHV2cDRl?=
 =?utf-8?B?MXoybUZSUVByNDZiek1TeVlZUEs2T2ptSWduQ2E3bmdnNzlYa01XaCtEYVBF?=
 =?utf-8?B?WE45S25sNCtUWU1CdkVMdDdhejdPL3UxN1luTjlwdTBmRUZMV3luYWdXT0F3?=
 =?utf-8?B?R05aMktkb0N2L3Q5aCszSGNPS3dIUHl4a2xYWUdyczloOVRyNTJZY0Vhbk1P?=
 =?utf-8?B?YWFpVzhOK2NlYVNoTjEvWVd6Z2EwalZJVktDWVNQYmJFSHFidEVKMmZWYnRP?=
 =?utf-8?B?ZkVqZ1FKU0pFdlNGODJFd3IwcmFWRjB2Z1Q5eVZHOFRBa0FuNEpBazY0bEox?=
 =?utf-8?B?UnF0aUYyc1lwQ0JTNksyUGxBSmhhWmZQbjh6SWw5YjFGTndIVkd1dHBjUSt4?=
 =?utf-8?B?SFlVR0lEbjFaWHQ3ZkJ6OWEwRWFPd1QvNVBDdVFrUWNLTE9GSXFjeWFDS0hL?=
 =?utf-8?B?UlNwbFV2Sk1xdFZIcWlaenBxenJLcCt1Y1RSZ3pkZTc1dTVlTm0rb1RGbktB?=
 =?utf-8?B?OE5sMnFFOVNMbklwWndaQjFHYldqZzVCeFUxN3FPY3VGaXZWTndEaGQvcGlv?=
 =?utf-8?B?WCtkMmZaRWRLUVlaOXVQbmxxeGlGZ2N5OHV3eEhScWg3bk5IdFJoWWkxNUdO?=
 =?utf-8?B?aVZZWkV3R2hXa3RLeUJ3cUk4VVlPbGxHc28ybXZWS0Rxa3ZJTVduTWVJVGlJ?=
 =?utf-8?B?S3RPbEh4ZEVQZlZaa24zLzR1aDFmalNiVkpoNVR6REtuZVFjaktlYkVsdVVv?=
 =?utf-8?B?QUxzeklUVEhMVk8zbHphT2VaVnJIV0Z3SzgwMVl6QXU4YlhyUVkwL0hxeklQ?=
 =?utf-8?B?WVpCQk9HODdHQWRYVWg2NFE0bnErVzN0a3lBVGE5S244K2J4RGY2ZjMwRjRK?=
 =?utf-8?B?Nmw3ZUVzY1ZYK1I2MUhPRGt6U1lPOTlUa1BnbFNhRTlTL2JFcjhqSEFiLzM4?=
 =?utf-8?B?YTBGTVpRY3lhUlBxbXkzdFZaM1ZDaWJDUktJNGV6L1k4cjU0eFE3cWQ2K3JY?=
 =?utf-8?B?Sm9vUGM5TkFPM2Q4eTFKejEyemJBYjhqTlBONFl0bEMrM0tEWG5jK20yZDJu?=
 =?utf-8?B?TzhpbVU3MUJudUNqakJzc3FPSHIwUjJBV2hmd1NmemR3SXJHWHFhZW5qRHNr?=
 =?utf-8?B?SmlyVktCRHJMa2F2LzRGRHpBSzFTOEVkVjFSTWZkTVgrbHVSRTZPQjgrby84?=
 =?utf-8?B?MGtOOS9aZVVyZGd0YUxWVEhscmh6NUU4ZjRCQ2duc1ZIVWtadmt4TmtzNzBK?=
 =?utf-8?B?Q0FzbDZJMmh0VytaTjVoWnhqdk9vRkEyUWpPdmI0STliMUVsK2NFemJhMUlq?=
 =?utf-8?B?ZkZPQUFwait0aUlJZ0FZaVpBeiszV21qaGRBRXdSUHQ3VEp5WXNWQzczbS9t?=
 =?utf-8?B?MWVDNG0vU204M3VTYjdUK2JlVFhmY1NPdTJPNENqOEovRkRpNkM3MEJoN21K?=
 =?utf-8?B?eklqVjExbHJoQXlGVG5mSTJXVjdQcDVxaWZpbzN4VW5FQUlTdXI0cVk5NVBs?=
 =?utf-8?B?a3Y2Qkl0cG1aTXY2U0k4My9SYmRaeG1KZHEwUWQzYmcrVG0xblByaFZ2QVpL?=
 =?utf-8?B?K2pMTDFsbjQ0VFZaRWwrVTVzUVh4VHU5cjV6YktKYjBQc1Irdk0velRmZDJJ?=
 =?utf-8?B?ODg0WEp2Y0lRdE5RektUTXNlMGZDU2hXeXdUYkZlVEtTZUxKazRlMDh5ZjRS?=
 =?utf-8?B?T1llZGNJUmFPcXIvRnpNRU1lZzVtWXF6RVZwdndSbWhOdmxXYlo1YUNXYWR1?=
 =?utf-8?B?aFcvRWEzWHlrbXFoZnBtVTZyRWQ2ckdTQTFLekRYaWJJcGdoWnZmUlB6L21i?=
 =?utf-8?B?dmZqSGsyd29Uc1hvSTg4Y1RheW1UYVNPOHc1WFZDUUM1TldJeVdzR3dUeGxn?=
 =?utf-8?Q?z5p5tt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 20:34:38.3108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75620421-e07e-4b9e-4cc6-08ddecbba25d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8218

On 2025-09-05 03:39, Jan Beulich wrote:
> On 04.09.2025 23:51, Jason Andryuk wrote:
>> io_apic_level_ack_pending() will end up in an infinite loop if
>> entry->pin == -1.  entry does not change, so it will keep reading -1.
>>
>> Switched to breaking out of the loop.
>>
>> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> Noticed during code inspection.
> 
> Well spotted, just that ...
> 
>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -1715,7 +1715,7 @@ static bool io_apic_level_ack_pending(unsigned int irq)
>>   
>>           pin = entry->pin;
>>           if (pin == -1)
>> -            continue;
>> +            break;
> 
> ... we shouldn't terminate the loop here, but rather continue with the next
> entry in the list (if any). Hence presumably why "continue" was used, without
> achieving the intended effect.

Ok, makes sense.  Though after the sending the patch, I was wondering if 
it was an unreachable condition, and we should not end up here with pin 
== -1.

Thanks,
Jason

