Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DDAA570A3
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 19:36:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905326.1313196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqcYh-0007WJ-V1; Fri, 07 Mar 2025 18:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905326.1313196; Fri, 07 Mar 2025 18:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqcYh-0007TX-S6; Fri, 07 Mar 2025 18:36:31 +0000
Received: by outflank-mailman (input) for mailman id 905326;
 Fri, 07 Mar 2025 18:36:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EBm=V2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqcYg-0007TN-Ry
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 18:36:30 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:2418::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 104bb1e0-fb83-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 19:36:20 +0100 (CET)
Received: from BY3PR03CA0013.namprd03.prod.outlook.com (2603:10b6:a03:39a::18)
 by SA1PR12MB7040.namprd12.prod.outlook.com (2603:10b6:806:24f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 18:36:16 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::aa) by BY3PR03CA0013.outlook.office365.com
 (2603:10b6:a03:39a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Fri,
 7 Mar 2025 18:36:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Fri, 7 Mar 2025 18:36:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 12:36:13 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 12:36:13 -0600
Received: from [172.20.156.222] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Mar 2025 12:36:13 -0600
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
X-Inumbo-ID: 104bb1e0-fb83-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=is8uSy0zNvmyO//9lEL/xeCb4uMK/2Q7qJZMoVXcSohLYc0JvvSPVecDAMojZeQzHD16Dpe2Nf9LKBXeOLZe9L2mK38eq1pi9dg5dh+RjyZaCI9GTeOr7+TzPtx9lbbK/ZpvCyqx5QTqCMshEv/DqYgCw9cLwlc/fXDGKjxdo8xrFUy5g2f8LA/c6JqGX6Ruvb3JjpZDHaHXjG82GHU5UrzeoaEcyYXwtFYLPoYhCI0znEOfzKBtxls09acPPD0mj7OOcf1tEiltH04qCbKxv/1dszeaCUXqBVrp9VycvU3sH4U79kOACkVVXsxXOKv9I96BN6Ypp94undUeAR1pbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0q+rxR/oDa6kXpXFSCptbEN9+6EcP1t4CN77c4LBSA=;
 b=qoAzDsrpzIBq3DQIJFUMGvuCboIBoqrCQz9QAw5zgbkrKDF5+AFqwfw3kAAwbn4MBgKjCH+90SeTcUiEEi7Yk7Kqo3LIDIs08Os5eRy+CQ1hUHolAmEOnkiSzdj9nfodvTH0K+FSURFDF5iIyGkj8eq0hUF95URCvOkPmPzs8/lNuh9BLveuveyhSTaAAGenvQX4UfeVmJQxom9q8dBAuR29lge9TVhLjNdIk0C2b+JtJV30hB9MxaLAPi2wz9XXXY2gXELKbZLaR//CDzVZwmdhDYxTiL0EA+dOI2cnVDEsHhPM/GOHP+TsTwd0+/5GPoo+TNVPDyiMjHKq7HMA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0q+rxR/oDa6kXpXFSCptbEN9+6EcP1t4CN77c4LBSA=;
 b=PKCFddiKInDiqdZ9axEm7RdMugWjoNtSiDwh4F8veh4G0b+71/cs3sO5wlL7kR+pBRJ+kdYd+P3UhMBq9jUg+GfDRc1YtbWdCcX93dL4dVGrArmZwY9njd1LxmDc9abPl18zuBo1/0ZzH4TILu5/r5vIJeQb/EXdd6Oc0PFF7RY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0781c22a-36b8-45a8-b478-fc73405ea96b@amd.com>
Date: Fri, 7 Mar 2025 13:36:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/23] xen/arm: dom0less delay xenstore initialization
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-11-jason.andryuk@amd.com>
 <alpine.DEB.2.22.394.2503061758220.2600338@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2503061758220.2600338@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SA1PR12MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: d14fc24d-8611-406a-1b87-08dd5da6f1aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0xLRitIMkg4Q1IwN05nME90UWVtc1FwVWNNL0h3M285MDc4ZTR0ZW53NGNq?=
 =?utf-8?B?cmFsS2dIN1pFZVN3YnlHWklwTUxxRzJYZjVhN1VKS21aT0Uwb2V0aDc4dzJB?=
 =?utf-8?B?YnozL2ZQb0piQkF5ZnZFV0pjdGJnb0Zobm53NWVEV2VCcHNKcW55cWszeXVa?=
 =?utf-8?B?MnJpVWlUS1BrQjlEOVdVbG1CL0Z6WFZXdWZ6bTRoRUVsZGxJUEsyYjMvc2xG?=
 =?utf-8?B?Ky9ZRXR0d09KUEtYemF1Y2hhNTZpOTRHbTR1QlppaUNDbFJ4ZHdSY05hblpo?=
 =?utf-8?B?L0xVcS90d3hRMzltc2p0RHIrNmVPM0VYSVNzWkFZRDRTa3llVVBWZ25Bck1n?=
 =?utf-8?B?NjVRQUhGRnlSYU9saVpxQ0xxOTdQN0xYWDZUSTRVZStlZkhWKytiN280eGRj?=
 =?utf-8?B?dy96bi9wWjE4UVpYd2d0NzVlL3ZtTUc2eXUxUFBiZERYMFNZWFR0Uzk2V3hN?=
 =?utf-8?B?VThrTEpsamVkVDVoYjZOY1RTNkVobXVxc1BOSEhvaVVRdFBwNEcrME1HNnJZ?=
 =?utf-8?B?UzRhVS8zSWEvQ1VlTmFBTVA2c3QyTnUzaVcxMmpwRTJsQjRqcUxVdjZzMVky?=
 =?utf-8?B?ODh0aW1meDM4b0RpNWhhZ0pwNDZZbG1zN3A3ZVJZd1B0TVRjNDBxMDJrYmcz?=
 =?utf-8?B?SWhjQmNkNnVxaDZwUStTcUV6TWRKSmpuUHVRV0RNaG8vcWhLSGhTcGd6TEsv?=
 =?utf-8?B?N1UyWktnRlFTcU40VFpVTGtMaTkwamZKbm9ZaytEWitKTzJpRldROVpadERZ?=
 =?utf-8?B?ZXd6aUYvY2xhclpKMU1RejZGaE1KM3lVcy9qZkNKYTNqZ3N6QkI3M0tBNEJL?=
 =?utf-8?B?Q1pWRzFJMGZBVlZkVFVpbTRiY0ErYWdSeG4vY3pFTnFTK2xBdTB1ZE52NXhm?=
 =?utf-8?B?V0JUVUgrSzNSeEozay9vK1I4UndSVkJmZ2Q2c2RtVlBVR1plNGlna1dWRlNV?=
 =?utf-8?B?d0t6V0R1cy96MlJOQ1BzRzhNQWJvZnlmYzVaSk1WV2V0a3Urc2hUWnBYcGtu?=
 =?utf-8?B?YTBKRWc1TC9CLyt5cWZTQkxkV1NpREw5cWNuWTF6Ly9Ia2xaOWp2czJXWldy?=
 =?utf-8?B?NmdyejhYRm9oYjVQL0xFeERRUmw3dUlZSCtRN2U0VWxHKzdIQk5IeEhmRkFT?=
 =?utf-8?B?YUsrN205TlE5U3lZc2ZZaFA0Qno1VEU4TzNyT25qemZ2cHN5QVBleEtyb2Fj?=
 =?utf-8?B?b1B3NFlsZTNqazlYa2ZBMS9GUmlZLzU1SG1pSXVEVUNqbDd3MGR6dFZQczNT?=
 =?utf-8?B?UVBDQlc2YTNXUDBrMkNoeFN3N3ZuMGE3UFJoUXlXbWZiUm9YZDY1c0Jpb1h3?=
 =?utf-8?B?d2ZyNndjd3ZrWnFEY0EyYVFwZ0EvREF0alEvR2c4SFdnUXl1ZVFXSkViaklo?=
 =?utf-8?B?eGt0U1o1Yml0ajVFOHR2OEJwNGdpK3hBVWJiVkdPRkhIREtpVllaRllNNDVQ?=
 =?utf-8?B?eE1MRWNXd080ZEFuYUlXaWE2RUdybDY1dDdVaGZVbFluakVQRFZSVWhpdSsv?=
 =?utf-8?B?Z2lqQXJabVpLZ0NvUThCd1diaVR6WFBmb2QzbDVnTW00Vkxmc0ZDd0F3NStD?=
 =?utf-8?B?enZlcTdLUWRpaHZLZURvQUl5VEM5WVFEV1pualM2WXVRVm43Q2lIQlFzQlpI?=
 =?utf-8?B?ejVTY1lIU29HQm9rTys0NmdkWmhTRGZqUnIxOC9Yb01FR05UUVlZZ2NvcHdY?=
 =?utf-8?B?Vi90Vmp6MEJZWktXRmNZUmwvUS9aVnZzbUQ4NFdlbWFzRHhUOExSV0RqdlRm?=
 =?utf-8?B?cmhFekhxTnlTTzlMOVdFME9xWnFRTnoxZHlCTEZmZXpLVW1mOTFmYm10V29P?=
 =?utf-8?B?dS9KbGRUWUVrVjVneVN6aGZPRFpvQWlxVDFJZFloOEptNzdRazdxSnBNU1JW?=
 =?utf-8?B?SjY4SmFYRUQ5Z1RzUVRoZzJMS3BQQnFMT3RVNXIyUHQ2aEtoVytmbktWaUxk?=
 =?utf-8?B?em11bWlGSDVrSGFkZFFNWTJUSFAvZDkrZXdmU1BNeVZjclQ4WUNCcEk0bXB4?=
 =?utf-8?Q?GpKDyoGRRFPza3nJ9MNOW2MXDbiZ2U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 18:36:15.5171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d14fc24d-8611-406a-1b87-08dd5da6f1aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7040

On 2025-03-06 20:59, Stefano Stabellini wrote:
> On Thu, 6 Mar 2025, Jason Andryuk wrote:

>> @@ -697,7 +703,7 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
>>       int rc;
>>   
>>       alloc.dom = d->domain_id;
>> -    alloc.remote_dom = hardware_domain->domain_id;
>> +    alloc.remote_dom = xs_domid;

This...

>>       rc = evtchn_alloc_unbound(&alloc, 0);
>>       if ( rc )
>>       {

>> @@ -767,16 +769,10 @@ static int __init alloc_xenstore_params(struct kernel_info *kinfo)
>>       struct domain *d = kinfo->d;
>>       int rc = 0;
>>   
>> -    if ( kinfo->dom0less_feature & (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY) )
>> -    {
>> -        ASSERT(hardware_domain);
>> -        rc = alloc_xenstore_evtchn(d);
> 
> This patch looks correct. However, I don't understand why you didn't
> keep the call to alloc_xenstore_evtchn in alloc_xenstore_params.

alloc_xenstore_evtchn() needs to be delayed so that xs_domid is available.

Regards,
Jason

