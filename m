Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9BDA59790
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 15:28:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906519.1313937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tre6l-0004Dh-AL; Mon, 10 Mar 2025 14:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906519.1313937; Mon, 10 Mar 2025 14:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tre6l-0004CB-7X; Mon, 10 Mar 2025 14:27:55 +0000
Received: by outflank-mailman (input) for mailman id 906519;
 Mon, 10 Mar 2025 14:27:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vjn7=V5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tre6k-0004C5-2b
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 14:27:54 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20624.outbound.protection.outlook.com
 [2a01:111:f403:2408::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d79932d6-fdbb-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 15:27:50 +0100 (CET)
Received: from PH7PR02CA0001.namprd02.prod.outlook.com (2603:10b6:510:33d::18)
 by BY5PR12MB4147.namprd12.prod.outlook.com (2603:10b6:a03:205::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 14:27:44 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:510:33d:cafe::aa) by PH7PR02CA0001.outlook.office365.com
 (2603:10b6:510:33d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Mon,
 10 Mar 2025 14:27:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 14:27:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 09:27:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 09:27:42 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 09:27:41 -0500
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
X-Inumbo-ID: d79932d6-fdbb-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayhD6TlHJcTdF3RpvwQfdKGfGr2j5vyd0nfkKQ4xJkX9C/mzDZoEmxLc1jXpZrB2qcjzZqZM96mTimwJif7zVxVLG3w5dHjtn3mZTYqxh1GwT1j4GHN0bRrPKAQzobd4n4DLFLdM5sVUcxBaXYpxy0fChBC4ol/eLKRw1mtwjnOvZgoLvITeurD/Ait0KC7c1YThs7yXrnJ6OTGgCBYCd75T2I/iQyWmRrQJl9A+A35utFq0RlxYZUC60hNzb/NAjUlqtBCHRG9MFKmnxYgaYa3f8pen3CE97WqkxQ/UCcqgoeuGPgffC04RWLld7feu6xyF/VIctEkVOfaX+9i8Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geaTB8mPm2fWaiIupQ1JAg4MkRjVCDpL2PfsvtAKg1U=;
 b=C47KSUKWDOJNFu4aYp1wnrHgTi0TErHSpb2rw4YkmOzbgveyB33i4E+7UekuvJh/Kbpu8+tPIUbpUtXZfuXN29rAKewtM4+RkkNbVOnS2MHFx0mLQQ9Ub0BTSKba/nNaPusVKV2otlYe61IeE9nAPqo6lmv7LHHZKDZeQ9foZHgUFvsnLqupQou2qkLampU88wpK9VUMVqs5e+FKZpLsmj+PYS9JPyVf7KLS59ici4y4F1SmNEn3J9x92TUUV+TQxm0J9Shbh+Vp9UTNhiOyidnr7Y6bqRZS2qKCrc4qtqN2x9vE/czfRwEXH40ku4q9Dw2CcpWbupoQeaq1bT4C4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geaTB8mPm2fWaiIupQ1JAg4MkRjVCDpL2PfsvtAKg1U=;
 b=F+h9+MyhnnoIuSYvaFoOy4KHGfDcIc7bt424PRjBpUpTj0l0hAHhdWSbOlNnwr/n+hlZ7zcnty5wIhod2jTvE8ny+T8McBBCucqXt/u0+UIdYRMxctKxi+VWBrsCfpPZYlytrI+52vXlnEBHyZ1L9A7xU9+3mJ/+y5uWgTU3xhU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <11eda21b-a864-46da-8527-38888f3c0115@amd.com>
Date: Mon, 10 Mar 2025 10:27:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/23] xen/arm: dom0less seed xenstore grant table entry
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-9-jason.andryuk@amd.com>
 <93fdeea0-495a-40c7-936c-749e75a3d728@suse.com>
 <664ca238-cb5a-491a-b588-a9f300d84199@suse.com>
 <a0d2e94b-7d11-4f4c-9941-dfb43af99147@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <a0d2e94b-7d11-4f4c-9941-dfb43af99147@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|BY5PR12MB4147:EE_
X-MS-Office365-Filtering-Correlation-Id: 0218aa8c-7c7d-4224-7e0c-08dd5fdfb8ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFdRNjY0a0hsd3Z6alN5RjhwcFVoS2JGVmYxMnYzK2xZU2I3ZjdZeFdhZE5R?=
 =?utf-8?B?KytjZHkyK0pnbnovMjAyWW84UDcwaWtFYUNrMXpKTWdYRitYQU5zM1pnbVRT?=
 =?utf-8?B?SDh3b3pzWldPckk2eitpbVd2V1VvWkJ2blJ6K0EwbDFkRUFndFVKeDhleGI4?=
 =?utf-8?B?NmwzMlpjTzMzQlh4TFFyOFcvNG5YSG9IZlNyYVZEWHV4aXhwMllyRGtQMkZi?=
 =?utf-8?B?bnBITU5MK1dGMUN1Ti94dis2VjBxNTZiY2J5UmJLRnhnMlAvN0dxYUhyWmdw?=
 =?utf-8?B?MUdsZ2xDTnlWaHpKS3ZWSXRjWVN4RFI3dWxPb25EMjZ3ZGxkVXZkdXlmTGpI?=
 =?utf-8?B?WnlLaENyTUZDZVpnTXlSdW50aGgvUkxiakQ0cTFXekREaVBOUEdWeXE5ZzIz?=
 =?utf-8?B?ekpyaFNFV0ZNbi9wbWR2ZkJyaW5JU2g3NUtJbmNtK2oxcGVERE82eEZjbnpz?=
 =?utf-8?B?RXhmSFJYdFRCZkRhdG9GL2MwUlhDbVRlME8waTVGSUp5alV5SGdET29URXZI?=
 =?utf-8?B?bzBsUEFZVjhRUTV0Ryt4RWo5RVpMRTNSaThpSlZBbWFVOTBkNmJaZ1RSV016?=
 =?utf-8?B?b1FNZ0pUcVo1ckZuSzEwTjJiRUZSa3gzMGRpUDdMUmQ1SjJMN2tERVhkSFh1?=
 =?utf-8?B?ajdzMkJudUdWNnlGWjdIWUtuYW11eXpESUxiS0lwZVo4OHREbngwaG04YnRB?=
 =?utf-8?B?blUwZmV2QlhMM3VTeElCbGU5NDVoSlVySmV5T08ydjE3YlNTcnNsZmprN1hk?=
 =?utf-8?B?Y0s3S2dWTnNLSmRCUTc4WmZqaWQ1TDE1Q1V5cUpDcjBwZThBTTBPQkZONDMy?=
 =?utf-8?B?bVgyTk1TUEJRWW5iSGlNcHhHak5tREtYTjkzS0M5VkVXWE4wQWp6eEJHU1VX?=
 =?utf-8?B?dXlJa2gzMnUrSW1WWXJyNUhkRG1NTEZlVlY4UUY4azNEb3pPcEVZalhRS0Rh?=
 =?utf-8?B?K2VRSVdWekRZTlVmK2doMUFnRVY4MG0vVEo5NWlxaXc5Ukt6UmFDSXNtd3lK?=
 =?utf-8?B?ZUNvZTdvWEsrTkJPMmV2NVpGT1c3amhTLzZKVUp6dTRmRUFabnowR05tSDFl?=
 =?utf-8?B?NVhXR2FXWDFPOHE0d2lBZG9MT3NWbm4wYzZxVEIzd1JiZjZhWFpJTVFzL3pZ?=
 =?utf-8?B?UVZ0MFNIYkt1RFgyN3JYNXQxK2F2YjRJSnZJREVibVBrZlNkQ3ZJQ2Y1UlFC?=
 =?utf-8?B?R01SWVZJWFpjVFVBOXU2UGZSd0xwKzFHWnJNOGNJc3ZQVENicW1pTy8xR0Jp?=
 =?utf-8?B?NkRYRWp4VXR2T3ZySHlQUUs3YUdMRVFvcWdmeUNaamt2RmtsTEtFOW5xdDBz?=
 =?utf-8?B?ejBBOEhYbFVsaFFsM09nV2FBMThSVlBGSzZIVzdhdlJkV2ExNjBwUTgwdUpL?=
 =?utf-8?B?dnI5b2pKZ05hTVpTVDVuV0k3SE5zZldyejZlOElyZWorZlprYTFJeTNrckts?=
 =?utf-8?B?RWViS2ZzdUxRMDdyMUxjczlJZUw5M2hWbG04cTVMTDF4YUE2cXA1ZFBWKytQ?=
 =?utf-8?B?Sy8wSENDTXNQKy9PZWRkcGk5MnRVQUtVWFJ1QlFqN2toUHBIWHdVcXVQNVVQ?=
 =?utf-8?B?K2tTOE94N2VUMkNWMktuZGFacUsyMkhlMTRJTndXSHN0VVlIVkpUUHBZckJO?=
 =?utf-8?B?cnhJYlhYTWxmMm4vR3JlMUtUVnhnajJaQlFtS2JrUDNpWWZDYU01SXBZSDhs?=
 =?utf-8?B?Qk5zWmx3QUpldHdIS2pQR2F3b0N6bEZuQy9FcmJjc2hVKzZQemN5cWNrVWtM?=
 =?utf-8?B?K2ZCbkR2OVlHQmgrdXVHZmhXRWU4eTg1djJib1liUTVaZ3ErNzBKN29XMUQ1?=
 =?utf-8?B?Z3RTd2RNMXBSTmh0WHNQUlhJUk9jY05QZElTdXNCVDdOc3FHLzY2ZEtjWWVJ?=
 =?utf-8?B?M2tXNzE3cTJXTkFCQzNxRlRQdEYrUlZjYVJFOUpTa0RMR0xabzcvNEIvYTdR?=
 =?utf-8?B?OSt3QVdMR2dqVHI3WGQ0eG5kNTROWmhhOGg3M1NHd3l1MU1JcmtPa25ud2Fh?=
 =?utf-8?Q?OsgEjAL/ktYV+UZ9iF85MW13zoVTjs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 14:27:43.5417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0218aa8c-7c7d-4224-7e0c-08dd5fdfb8ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147

On 2025-03-10 04:21, Jan Beulich wrote:
> On 10.03.2025 09:17, Juergen Gross wrote:
>> On 10.03.25 09:01, Jan Beulich wrote:
>>> On 06.03.2025 23:03, Jason Andryuk wrote:
>>>> +    shared_entry_v1(gt, idx).flags = flags;
>>>> +    shared_entry_v1(gt, idx).domid = be_domid;
>>>> +    shared_entry_v1(gt, idx).frame = frame;
>>>> +}
>>>
>>> In common code there shouldn't be an assumption that gnttab v1 is in use.
>>
>> But isn't the grant table in V1 format until the guest potentially switches
>> to V2?
> 
> Strictly speaking it's in v0 format initially. But yes, I see your point.
> Provided this function is made clear that it may only ever be used on a
> domain that wasn't started yet (perhaps proven by way of an assertion).

Yes, this is what I was relying on.

If d is still passed in, we could do
ASSERT(!d->creation_finished);

Hmmm, the function might could be marked __init, too, I think.

struct grant_table and shared_entry_v1 are defined in 
xen/common/grant_table.c, which is why the function lives there (and 
it'll be useful for hyperlaunch).  To avoid unreachable code, I guess 
I'll wrap it inside #ifdef CONFIG_DOM0LESS_BOOT.

Regards,
Jason

