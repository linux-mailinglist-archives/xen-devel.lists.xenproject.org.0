Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE6A59716
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 15:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906483.1313907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trdo5-0007Fx-8U; Mon, 10 Mar 2025 14:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906483.1313907; Mon, 10 Mar 2025 14:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trdo5-0007Dy-5X; Mon, 10 Mar 2025 14:08:37 +0000
Received: by outflank-mailman (input) for mailman id 906483;
 Mon, 10 Mar 2025 14:08:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vjn7=V5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1trdo3-0007Ds-0K
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 14:08:35 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2414::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25bb03dd-fdb9-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 15:08:33 +0100 (CET)
Received: from BN9PR03CA0530.namprd03.prod.outlook.com (2603:10b6:408:131::25)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 14:08:27 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::bf) by BN9PR03CA0530.outlook.office365.com
 (2603:10b6:408:131::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Mon,
 10 Mar 2025 14:08:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 14:08:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 09:08:26 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 09:08:26 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 09:08:25 -0500
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
X-Inumbo-ID: 25bb03dd-fdb9-11ef-9ab8-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9Y7Yr0UC52vmSF1VzpdUWSjsVUS4ZnTdYt4bn/UkgwDIM/mcFQ1kXopTAMsXSSV43vFlTJqK8SxxjnpYxqb+Dst/ovWr0yqwPaJZAfB1J3wfr93JX9eXc6f9XhBU1PXk9TCxwCAbfKQpOmX2WxWEPPxeLWxKf7rYNGLe6tyHFVOnyUcJW2+PiIFANeZqArFfYH2Fc1YLIj+dhCvyCRhbwiN3cM0lNZcEjWEt0fAJTYqSTsFrDWIyLfhOp2rbnFP3xPQ6lmzYs1kZL6D69aQ2SYnmkmqH2rC37iyTB4tVvMKrgVgSuhTVIfM2gRFIaRNFhe2DCmin5htyxWojQ8cLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdEKG3qGFChkZMm+IJrY7AJtUUvY1IHQN3x+lbK+tjQ=;
 b=xph24kukvoEt1xVlGMi/mJEwzM/1uV4USQUQfLeWC0PDxZm5uTI6k7oUFlkLPEhjRqYZOJo82lZJSp4Zx3jX0iZXs3YYT3dIHrHDI0V+VItzU/h4z4NEwmMIP0eRacZb/sOp6tfaSbd5ReusC6rYyUIaDQR6xJ/y5EwT2skS+hQtFIJKUd0eTNS0xtS6t+9QNpjQM51TkmZZefutEmgeJ8CrFVvN1Owvx9K5f7zMdww6gfNqRtT8ySZgaYvymCHKSzHoMBIxGMz+hdWl+0hBl/XVeS9xesxj7aZ4N7AuAsCiDeFFqe+z1Hg4zAnRR5/dlW8VtQ67Wsqhj8GLRvfjuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdEKG3qGFChkZMm+IJrY7AJtUUvY1IHQN3x+lbK+tjQ=;
 b=cpHLQOuFpZmNK2NuEb/HJudR64BldDfeKKEsfkAyt74EDYc8yMMKPpPLAIdYA/SpD5RwC6Jgddjaf6V1RUVdnGkEqSNZ+0lFIWEYLpWA6cw9xTbqEQJI7JOrvkjF7PP5SzDrlX/4UDHjWtji9F/CFD+Wl3t5NEj46n03mUuMcjU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6b23bb53-eaf5-4dc6-9192-d4a26bec290c@amd.com>
Date: Mon, 10 Mar 2025 10:08:28 -0400
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
 <cc4e26f9-e198-4677-8873-343f49d0f1ac@amd.com>
 <75335424-eef1-4d52-a86a-caefdf4b0623@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <75335424-eef1-4d52-a86a-caefdf4b0623@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8e47e9-d23b-4f01-bce2-08dd5fdd0761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFJqdW5GZFNNaW1mUjF6UGt5OU9ad0Y0VzVQdERvZ2dzclRKRjk5UExaZlRY?=
 =?utf-8?B?ZUVZTnN1ejBudm5QeHBLWWtTTzFnb013c0xTdWNoVU95SjZpWHV3NlI2amU3?=
 =?utf-8?B?UWUyMmhCbEFYbEhHVUVuM0ZLRXovS2Y0YzFCTTM5N1IrcVN5cEdSVUJTQlpa?=
 =?utf-8?B?L2NQbG9CSEFNbDg0RTBEL0tzS2lMMnVQU2wxUTdoUzlpWnFqS0pWSDRnQnRL?=
 =?utf-8?B?V3BOV0ZDaU53S3A1MmJzYzN0REJLQkpSV2NqeUxSVkpxREp3Ylh6Mm1QWUhJ?=
 =?utf-8?B?WjZ2Nzl3WU5ad1V0SEx4NVdWQ2wwL0Zpd1NHSER6d2N4cmMydHF0YlBBS1dQ?=
 =?utf-8?B?R0NodEZMcXFWTEFOV1MyVFZMK1dQcG4yeTVaSVJSOU9tZnp1UkN5aUJ5aDgz?=
 =?utf-8?B?M2lYdDNENkNIS04ySnFTQ2VqcDB3aEFUdUIyZ3g1UGkxWVA2S0VIL1lyOGh5?=
 =?utf-8?B?ck5iM3Z4L05mWXdrRUc5ZXFGWHZpNmdoTVNtN1JROWh4Qld3N0RKYmVSR0Yy?=
 =?utf-8?B?Skh3UVVXcjJIUmNZeHIvVm9DMnpQRjNtV0U0UzBKS0toT01ycGMwNitVbmhG?=
 =?utf-8?B?emZFbEJubHZ2cU1vSWhUbGRNa3pqdDdEUmhwV2dIbmlxTjhoSHpELzZqWlU4?=
 =?utf-8?B?SnJUVm9WNzZUVnZSYXIzQTJDbytEVmVjY0VqaEk0RklpWjEwSkpwWStDeWR0?=
 =?utf-8?B?YThtaVhSdDJoTDFXNVNVVFNvcW91bnVjSGp6Q1R3U2Mzazg0NkZzTjF5NFFW?=
 =?utf-8?B?NHRNYWpudmtZWnZTQnIwU1JnbTlXUW5Na2MyMTRicWY1a0NiUVllNFhQMHZi?=
 =?utf-8?B?SEhEQVIxbnFBVGl4d25UTjI3a081UEpTMnBnTi9QNm5vUzVwU3l3OWd1dVBJ?=
 =?utf-8?B?aGhvSE1WbkRsVGdKU01kZG5tZUoydkNjNzE0eXI0LzlEUUdCV09XTUZjYlk5?=
 =?utf-8?B?NkNrOE9oMGY1cEVBeGd5amJMeFhrZFVWMU5TNFpVSHRXRTBKb3NNYW1RMm9D?=
 =?utf-8?B?RHhNY1liMWxWWVhjSis5a2c2Vy9FdlNBcGZyeWY0eEFhRjhMc05Ud3NYYnN2?=
 =?utf-8?B?eUpVTk4wNzNiTnNEZ1RwdFFiVlJQeEdmWWhvY0RrSU1qcWIycUY5NS9aazJ3?=
 =?utf-8?B?THd0NS9uTHJ4ekJoeE9xUXBEYmpxTndsWStGZ1ZoUDhSZVZRS096MVYvNHND?=
 =?utf-8?B?MXJPV2kxbkFWd2hHY0lGL2RkS2t6eEEycGJBeTJjdVkyeSsyVlVlYmJ5dDVr?=
 =?utf-8?B?emgweWNKYjFIL3IwSk12NDdNamY5TytEV3RHTmdyNm5MSVlIOGdMcXE1TzI5?=
 =?utf-8?B?QndrYVFzMlVIR29vWjVMc0hhSU9rSi9VSHNrNVVnSExoNUk0VlNVVFJQOE8w?=
 =?utf-8?B?OVNZSVE4QmF2V2g2K3U3SDEvY2tvVGxjUlVJWVQyWXlOd1l6SEJ2Z2xLR3Ja?=
 =?utf-8?B?WVExNktPMG93QXBzZ2hjbmlMTGErckYrOUJCNk9nazExOTZtTzJ6NGtsOVRv?=
 =?utf-8?B?UllHckp2TW0xUmR0dTBFdkhNRFJyN1pGVUFoRTlNeGlVL2lWOEJ3Y2FqYy9v?=
 =?utf-8?B?ek10RU5qZm9LdkZEbjlqV3JzelU4Sy93djBCRmJIR2Jza0tCaWhXMVUzY3VZ?=
 =?utf-8?B?Z2k5VVM1V3hvenU2dlZoZ3l4WUdybGFyWS9Kd21icWRjOFhSVTVlU00rSXUr?=
 =?utf-8?B?RXVCR1VJZ0JUMFYvRHpSNFZxamdjaTJLNnE3emdLcXhWQXFkYWl1ZjNTVFlm?=
 =?utf-8?B?ODczQmZsc2lUNWRxbXJFT1F0bm9ZT1d1UVM2Vlh5V0ZnTlpWQ09EVkdGdW9i?=
 =?utf-8?B?MDJNRS9yNzRFSTRBTkNUNmtGTUQ2QUxyUFA3QzI4eGtCd2ovdzA5RGFpdUNk?=
 =?utf-8?B?N3BwR3Z3QXVrbXR2V0hOMnJnOTUwbitEUktOak56aEJ0eW1uL0NwQzFTdFky?=
 =?utf-8?B?aW1TVy84T0xvSGxoZmNNaUFtd3VZRTRIR3NscU56QVhCM1ZNRGpCS2JSY21H?=
 =?utf-8?Q?Z4vazc8PWfxXis3m9XkA8dSk8ukqb0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 14:08:27.2266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8e47e9-d23b-4f01-bce2-08dd5fdd0761
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6051

On 2025-03-07 11:26, Andrew Cooper wrote:
> On 07/03/2025 2:55 pm, Jason Andryuk wrote:
>> On 2025-03-06 17:39, Andrew Cooper wrote:
>>> Second, you've created a case where we can make multiple hardware
>>> domains, yet it is very much a singleton object from Xen's point of
>>> view.
>>
>> hardware_domain still remains the check for is_hardware_domain(), so
>> it's still a singleton.
> 
> Multiple domains can pass in CDF_hardware and latest-takes-precedence
> for hardware_domain.
> 
> That only exists because late_hwdom is a bodge and relies on stealing.
> 
>> A later ARM patch for the dom0less code adds a panic() if the device
>> tree defines a second hardware domains.
> 
> Another option might be to strip out late_hwdom, and do this more
> nicely.  I have little confidence that it works, seeing as it only gets
> touched to fix build issues.

I don't want late_hwdom to hold up ARM side changes.  I'm not using 
late_hwdom, so I'd be fine removing it.  But until Hyperlaunch is 
merged, removal seems a little premature.

> Either way, I think the common code wants to be ultimately responsible
> for refusing to create multiple hardware domains.
> 
>>
>>> But, by the end, I think we do need to have reasonable confidence that
>>> only a single domain can be constructed as the hardware domain.

Would just an addition check be okay?  Only allow the late_hwdom 
behaviour for dom0.

--- i/xen/common/domain.c
+++ w/xen/common/domain.c
@@ -704,6 +704,10 @@ struct domain *domain_create(domid_t domid,
          if ( hardware_domid < 0 || hardware_domid >= 
DOMID_FIRST_RESERVED )
              panic("The value of hardware_dom must be a valid domain 
ID\n");

+        /* late_hwdom is only allowed for dom0. */
+        if ( hardware_domain && hardware_domain->domain_id )
+            return -EINVAL;
+
          old_hwdom = hardware_domain;
          hardware_domain = d;
      }

CDF_hardware is a Xen-internal flag, so it's not something the toolstack 
can pass in.

Regards,
Jason

