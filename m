Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58D0A654F0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 16:05:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917146.1322127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuC18-0001Je-GI; Mon, 17 Mar 2025 15:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917146.1322127; Mon, 17 Mar 2025 15:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuC18-0001HA-D2; Mon, 17 Mar 2025 15:04:38 +0000
Received: by outflank-mailman (input) for mailman id 917146;
 Mon, 17 Mar 2025 15:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4wc=WE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tuC17-0001Gy-HD
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 15:04:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:200a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22a0d507-0341-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 16:04:35 +0100 (CET)
Received: from BL0PR1501CA0034.namprd15.prod.outlook.com
 (2603:10b6:207:17::47) by MW4PR12MB6952.namprd12.prod.outlook.com
 (2603:10b6:303:207::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 15:04:27 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:207:17:cafe::66) by BL0PR1501CA0034.outlook.office365.com
 (2603:10b6:207:17::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.28 via Frontend Transport; Mon,
 17 Mar 2025 15:04:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 15:04:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 10:04:26 -0500
Received: from [172.24.79.67] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Mar 2025 10:04:25 -0500
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
X-Inumbo-ID: 22a0d507-0341-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHTgssDo8HI649DclZAZDLBUfi/OeKZLw/I0+Tqmhu4ITZbc49tpHz6EgN0Z+4kTuJCqI4wDk0nY9c+jZkUs97z1fRMtfVz+R0elmjEK1Rm2lw0720CtV75V97IZ6KPqQnIKGBgx/KQG0rpFv8zF4yQJGkBK5ulDnCDZSQwsOcI5O5uo88gf6z1Hh8Lwivn+xK/Rg7F+3i/Mn+fpyKC79kZGgYvqe4di+dE53yz3jOmQb314+BESVrnt+5sOEOZC0uZ0mj5uzSGfuGuxiCS3TcskO+PeqLUSXBe0A7Io0HtaMZ1+c0TktY3xE46c8JIrRTinAjITxQG9dWKUfli9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ll7WWcHIk5jMdkgWMJiBL2PgtHt1OJxUrcDlsr83cs=;
 b=u4kOhvCR96QuZL2nG3UBnvggpfMnWUaz1HuRieY0n3TbzG1uR63gF+6j3LwuO3t7HLKHlMSj1xelnl2SFiCJD9sKqj0+eUrJBvikyQSWRLcuhMYeBIVXhESrAVW/hJLj0ATOF5GqkkL8ZO4VpdY8UpBAXTS/x3R/G/1LvJQORF609YEZUI8h54ZToRmA/cN82UYQtfrg4zpE+ycaWOl1dvtzoUsGX57H6+p8RP08vpDguklHDv96jMlDfW5e2edr9jw6qJ3O5jLpxrD4rrEUkFCicNUlWabaikIu1VAJ123j3qZrla5r4K3lKCNUz/v0vuRsuvZWlKKyRg8ksOMdsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ll7WWcHIk5jMdkgWMJiBL2PgtHt1OJxUrcDlsr83cs=;
 b=vpjBizV3srucdLgh1MslIfLmcYhkEJbRwrafOWHA+nM2Vdumq8bcmljsrSXgAKqsDaUGWlPfo5a8j1e0IUfnDPxlPBlO1BUhNfaTlxgjhvQjXsGxgytddQ2NOpVRUq/Pk1drZDqhjilxxnVbzewRjfFpOc6sUObvNruyUTke8Ds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a6bd6175-32fb-4da5-b70d-70e8dabadf66@amd.com>
Date: Mon, 17 Mar 2025 11:04:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/23] xen/xsm: Add XSM_HW_PRIV
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-16-jason.andryuk@amd.com>
 <095042a0-94c1-4f86-b6df-836a7107efa2@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <095042a0-94c1-4f86-b6df-836a7107efa2@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|MW4PR12MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d60bae-4767-463d-7ec8-08dd656502a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXY1ZEJCMkNGVTlpcFI1cDNHdkJzNUx4MHBTaVJHS1RYNHBoRjNlTTl3UkV6?=
 =?utf-8?B?YWNCNDNmZmVWK001M3hDSGpwR0tjeGUrL3pUZHI2UnJGUnR6bVFOV0hrNmE0?=
 =?utf-8?B?QnF5L0VWOVNPbERmd1NDUVFCN1VQMEFYMjBmMi9LZm9IdDVESTcrYjJpVkFT?=
 =?utf-8?B?SEFidjRrR1RIYmloajJGN0I3WFdiZlFHN3lsanFTS3JuaXBTcTBFL1NZY1NT?=
 =?utf-8?B?UnRGV1NNOXBMeEZqZ1dUY1dlWUFEb2xDNHV6RGJwZXRwSmsrZkVhY2Fubk8y?=
 =?utf-8?B?STMxZEw5N29Xd3NEWEZLd0dkYmNHMnJrNlBETXRmWXU1WjZZb3ZQaVJxWVZW?=
 =?utf-8?B?Q2w5RFVQUUU3b3I3N0ZraEV1QlhUT0xkMGgwdUNXTUlkb0NRU0x4ZmIrYkxM?=
 =?utf-8?B?M0dQV2U3UStvWHY0eE9DbXNnTVo5T3ZNenFrTXF2dEwvNkVVcDZ2TTl3OUkz?=
 =?utf-8?B?NXUrWGZ3dDkveFpVK3FYTDd0dGEvNzZrTmRGWFppZ1lGVWwyMnBvbzExNGpk?=
 =?utf-8?B?cGpudWRwZE5HbDg1Y2gxOUpPNnZQdWhxQVhucUF1KzZ4TEVLZ2E5NnpCdW1p?=
 =?utf-8?B?TmRrdDlnWmMwTVp1RndKNXlXNUZmdlVVVmROWHhWMDNyRmlNbXYvWEdSeUNz?=
 =?utf-8?B?SWRWSDBreFNuOHBMVGp6NWlSbzNHKzE1eHhWZUhNSW1VL3k4c0FhRjBrMnhv?=
 =?utf-8?B?c3J6WVdvZWRyR0xJNU9DbkZaWkxJay9pVSttakduSVZQNHhpUlJjRjhDazRk?=
 =?utf-8?B?WVNsaUZrYklsMFd4aVJPNkN3bWk0QXhKRld4NzBhTnlTZmRHa1ZoMWcyVVdO?=
 =?utf-8?B?ZDlvVjBDbFk2RjNHbDRXMThPSnNYWWxsc0pVY0J1S0ZkQlV1VDVJZzBWTU5V?=
 =?utf-8?B?WjRaUEJKZmxUa2NaQS9jQ3NIWlVlZTU2dTNnS1pHVmlmOTJSV2JPRHJQQ21M?=
 =?utf-8?B?dFBreHZ5ZzczRnp6N3FqY2xhakZmcThNMDFsTTQrMUdtQXVybHNIeldpTHRW?=
 =?utf-8?B?enU2RTcvRkVONEUycGowWkg2Ui80QTE5YXFQVHc3aEs5RmJtMXZWWHhhOHFX?=
 =?utf-8?B?Y09wOTJMekN3SDZmSHU3aFZWcW1QNXhXcmc4eFhtYVRkZjlEUGpEOTlFaEtB?=
 =?utf-8?B?TEI1bUhwN3A0Q2VRTll1Y0lxeGszTy9CcVhNaUY4cU92bnhYaVBpRkpCakk0?=
 =?utf-8?B?a1dlWCtFZ2lRUUtyQUk1MGR1bTNaQ1VXMGFFaFR3UGZ2aWdKTll1MmVPV2l4?=
 =?utf-8?B?RitOMGFPZm1xekNiTjNrbnh3Q1pSV1RaK1NwYkYra3VDeUMzMXFrVVhhdWVj?=
 =?utf-8?B?M1RVbnF5cXNPNlgvUk5ZU1VBZ1ZHSjNrVnF2eVE5aGZKWktjQ3NldXE4OC93?=
 =?utf-8?B?UU9ETFpEMFdNM0NsMFpjQktDaFRPK1o3TEY2MFNqRFBCQWNFQ2lXcVNRWjhv?=
 =?utf-8?B?R2NGZ1JrSkxNb0Rsb24xendEZ3drakZhS3BINWsyNXJjQldpREhIZDllSW1N?=
 =?utf-8?B?L0g0dkJBa3ora1lmMlFQTjJaL3h6SXY4cUdCOU8zV0xxNDkxcUcyaXBUSThp?=
 =?utf-8?B?WWYxT0dWNkxRdmN6dGNXeUlmUmx3czlOVkZLYUI4UTNBK3VNczJYYldBR3ZR?=
 =?utf-8?B?R09yc0NaTUZKS3RDMTdJNDRRZ0VkTXNwckJYWjdDOHNPdnk4UVFMSEhPUExj?=
 =?utf-8?B?T2R1aXdUZGJVd1lIbFRVOUNtd3NqN0lWK1BoMVI2NUx4ZjM4ZFdOMWE4K2RM?=
 =?utf-8?B?VURLSlhMd2hCRWozZHBNS05uYk5Hd3IwREJmTVlNYVV3N2FxNzRadFdUQjZ2?=
 =?utf-8?B?dGh0N0JmMStvZ1ppcXZKYlRycWNxeWdGTml0dk84NHBqcmRYQ0o2N2cvU0Ro?=
 =?utf-8?B?MUY3aTlNdnBDWE5sYzBobW9MdCsvVlFnYTlKV0xNdGFjREsrZk1qL1Z1UXdL?=
 =?utf-8?B?LzJXNEtWamZLeWlteHF2dnVkNXdpY3VwQXpVeHZQWXlCQ3pUdG5mWmdUMkNm?=
 =?utf-8?Q?JuojLZPEih+V0wLXCmRGphtIkXVcVU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 15:04:26.5484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d60bae-4767-463d-7ec8-08dd656502a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6952

On 2025-03-17 10:22, Jan Beulich wrote:
> On 06.03.2025 23:03, Jason Andryuk wrote:
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -95,7 +95,11 @@ static always_inline int xsm_default_action(
>>               return 0;
>>           fallthrough;
>>       case XSM_PRIV:
>> -        if ( is_control_domain(src) )
>> +    case XSM_HW_PRIV:
>> +        if ( is_control_domain(src) && action != XSM_HW_PRIV )
>> +            return 0;
>> +        if ( is_hardware_domain(src) &&
>> +             (action == XSM_HW_PRIV || action == XSM_DM_PRIV) )
>>               return 0;
>>           return -EPERM;
> 
> Hmm. Isn't DM_PRIV a property applying to the control domain (besides
> any stub domains), but not the hardware one?

I ran QEMU in hardware domain to provide devices to a domU.  I thought 
QEMU would better run in hardware domain than control domain.

Regards,
Jason

