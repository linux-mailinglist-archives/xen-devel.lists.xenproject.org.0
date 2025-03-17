Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB6BA6583E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917509.1322409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDSz-00053Z-0U; Mon, 17 Mar 2025 16:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917509.1322409; Mon, 17 Mar 2025 16:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDSy-000527-T3; Mon, 17 Mar 2025 16:37:28 +0000
Received: by outflank-mailman (input) for mailman id 917509;
 Mon, 17 Mar 2025 16:37:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4wc=WE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tuDSx-00051z-RC
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:37:27 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2406::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b8dda08-034e-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 17:37:26 +0100 (CET)
Received: from BL1P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::14)
 by DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Mon, 17 Mar 2025 16:37:21 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::99) by BL1P222CA0009.outlook.office365.com
 (2603:10b6:208:2c7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 16:37:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 16:37:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 11:37:20 -0500
Received: from [172.24.79.67] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Mar 2025 11:37:19 -0500
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
X-Inumbo-ID: 1b8dda08-034e-11f0-9aba-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogoT8aXI3yDtpjYWY1+aYBlptyVYgQj3/NU7eyLoc84lxxmvTE+nwxc1dEGaIXL//4pEMbPkbL2e5eTkgJ5023MjUF3+png3JwrTD3NsKQmpqFvPU1lVuuP2TX/I3EYZaM3HKm3cYm+qoemGhQ1vpqPXrwCjmMMhG+MRhizAC98OsRbSakObi3j3cBLTvhpr6CZfK1hX/oS/7cVJ+iJkD3aDGL5CUXzhnWvFkN3oD04uQHKzHGEjzlbRBkP1FdkK/OrKk+5JjIMoYSVz55pWcv5EodJyoFoHuuEHFSa/kXzS2tO6IMAFU+iZmRD0doa8aMgyxw6G3Wga8p8ib/yfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDJYWTcfnZ31VuFH5iGTJG2LI/i+KQLO7hgmYkxFWJ8=;
 b=fp3YWdB1zs5TOdPVwhO6GG/sVt1v5Orj6BsyLTo4wlMwm8qX5DtdcGY8cOiDKvq8sGt0AtmitrKBs6gjWN9rZ1MdHLMbOfjgoF9ekO3z//MvyJaxVMFzo/J6Ju4vYhg0cfnJs6vBXJJm99Sn91C126xrQZeAOUc96UXIK4DdZJNfTzdEuo6SNAv2ThTUMuufSEul6l5SvsqfTBeO2GRhde4rGaQZJu9c5Vg5tzmI9+WkgaaumhvvqlQvtyMKPRFGOHg1/8nwh25d59uvI/8KAf2e75i1ZLx5dLcQTa3pWe1BgaF/nKGqtV7mBXc0j82sJ6wSL016xULerqjKhVwmfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDJYWTcfnZ31VuFH5iGTJG2LI/i+KQLO7hgmYkxFWJ8=;
 b=D3s2EwUqiXMz87aHo3Z9lTtMJPJ9yNQhXW4Hws9DxVv/fTz1NGuwVcDRYZCewAcBrGtFBW1J3YNcx3uRYTq6i7o3pyKCMJNAbmX2m2I3YooP/39Fy3X4cy3vCR4SeRBIus+EqbD4W/v/5yakTuEowXvf227pLsN4yVrXWfaebaE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3360d9dd-9be5-4ae3-8c9a-f35e1873058b@amd.com>
Date: Mon, 17 Mar 2025 12:37:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/23] xsm/dummy: Allow sysctls to both hardware and
 control
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-20-jason.andryuk@amd.com>
 <9ca3ec40-7b90-444c-a682-bcb5f17bd3d4@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <9ca3ec40-7b90-444c-a682-bcb5f17bd3d4@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|DM3PR12MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e83b0e3-e49b-4a57-6b89-08dd6571fd45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ek4wNjVCdVdicitrVnBQc3VOZWh3UWdVK1ZLWUlFc2JITUo1b24yQzNndkx6?=
 =?utf-8?B?djBpOVJCT3hYcnUrTFM3N0xyelhsTjZhTGFIQ1lhYllidUg5NlFKSTc3bGVL?=
 =?utf-8?B?Ri9kZVF6N1YxNERIcFhWejJGUDhrczF1dVo4UHB3bUFQblNndlg4SUZxYlBu?=
 =?utf-8?B?bGpudVhRb1lLWStSZFUyYm9MTDNldDVmVmYzaFJMYldmaTUzMnpyNjkzZlFR?=
 =?utf-8?B?am5FbkpLVUlzYnNvSjJGOGZuZFBVU3VQanE5K09RZ0V5VUM0SjZ1ekdkVW9L?=
 =?utf-8?B?OVZrYy9OYmhZbzVUY21SQnl3NXRhK0VPYXJrbjBHdWp4NmgreXdudHhENi9X?=
 =?utf-8?B?K1NBNUdBNlkwdGlPWW9FNHNjR2dmeDlNZU5SQmtNcTFHQVpqY0NpRGluMXhB?=
 =?utf-8?B?bFl5ZCtlYjRXRS9yL0FPRkcrRUdWRldzL25TWHlKUzdJdEVPV3JwMm1tYlpZ?=
 =?utf-8?B?YlloNzVsVkE4SzN6cGlzVk83b0tJTTAxL3FJVWNjdzFWWjY2NTVPV1B2Yktr?=
 =?utf-8?B?SW9CcURmZDVNQS9ZM3lSMmYwQkRYZnpXZzROTXg3NXVwQmlYOXZSUnpycXdI?=
 =?utf-8?B?ajhBY3gyeWVabGE1L2ZaOVlXRTlpMTRaR1k2SkpDeTRSb3B1Wk9jeWtsL2tq?=
 =?utf-8?B?TjFNZ3M4SHRMNEJJSEk4cTBBWFJZbFZWallUNmExL3RkOXNBWFZJSU9TSEpI?=
 =?utf-8?B?YWZxcFFDbFlTT21kN28wdStodzFNczRJWlZhWnNxamJyVWpHRDQweUlzbkZL?=
 =?utf-8?B?NWhFeDRHOEQxOHFmNTNzaW5JS1NhVDN1b3IwSGJEZG5UMU9lSENaZEVnNFUw?=
 =?utf-8?B?RzNnWGVmeG9vekh1MEdRbzNFVldxUzhnWEpDS012dW1LUElFZWp0dk9CM0dj?=
 =?utf-8?B?bWRBeVB6NVVxZFFPQVdiM3F4ZEpRTmxXNlVZM0dMdXR5S3JaL1prOVI4QzBB?=
 =?utf-8?B?VFFsTEtKWjdFalZWVGdIMXd0RXVvc2hLaFd0NWR6L3FVYXNmd2ErQ093UXI3?=
 =?utf-8?B?d1E4RXkvdEhJbHlkdVBWeXk5eTZiSlpKSVNYWlRCYU9rM0l5Uy9UN0x4aU9Z?=
 =?utf-8?B?aWIySVhDYjFBRWIrak5PWTU4dXAyOE83bDR5bHhRVGdwdkpjRDM3UUx2YkEr?=
 =?utf-8?B?bkFVV2lET1ZqYnQ1MEJTWFRrM0VSS0RYWkVDMlZRNk9rZWNKR1hJR1pDYjF3?=
 =?utf-8?B?NC9HQ1hySTFEUm9DTWRDZHhPR3hPek0zYWdIYk03c0FLajkveEJIUVNXTlBF?=
 =?utf-8?B?ZTE2YW9oYXFPL1VaU3NJL09BVitvWGJTUTBuWlRaVlBZeEo3aFcydzdzQm1v?=
 =?utf-8?B?NjNvVSszOWN1M2w1RnYwN3BSd1pkaFNJWnF5T1NJYjk0R3VXb29hUDRSdXdF?=
 =?utf-8?B?NStpVEZnYmVManU4MVVZempweFRUcmE3SG1xdy9Gek5sZjh2N1hPT1hhcFdP?=
 =?utf-8?B?NCtBc0dPQUNtWEt5WXZhMzZpQ1FLK0hVRjREdTV0UUt5MjZsNnR1UG10R3NT?=
 =?utf-8?B?dWgyZVQvR1Y0Mnl5NGVuVU1UblhFeWh5VVhWZER1bGtFWFVwTWk3aFYwRkxD?=
 =?utf-8?B?RTZ0YTlHaGQyaUhUbWhuOVV6Tk5JNXZtRHlBdXY0WmxvUE53OXAzbnZ1bmhL?=
 =?utf-8?B?bXVoZk5tUTdwaGYvVWo2WEZBU1hFWTRDZG5tQXVhakttRjczbW1WejRUZytl?=
 =?utf-8?B?c0w2T2NkNmdJNStZQjZ1ZWwvYml0eSsxUDAzQVlNQ1N4QnhpWVpHMDRVWVhE?=
 =?utf-8?B?NjR2MWk0VnlDMkNBN2RoMXhwdjJQNVRjd2hObzA5amthOWtvVkF1RlRIOHE0?=
 =?utf-8?B?dUFZdGJxQzg5bEcwa2xLK0o5YllJeEhEZ0J0Uy9aaXErN1RCSEZpUU9oQ2pE?=
 =?utf-8?B?d1lubm43c3RIaDJIbW42a3pjWjFPN01zK1diUlRJOCtzZ0IwVDJDaW03cVRn?=
 =?utf-8?B?RzVYRWJsQythRTh5NU1Wd1llR3RneGdZL2RxQnpuR0p6YUVGS0pWZzhHSEty?=
 =?utf-8?Q?02kaxZn+NOtUlucVopAHqNqKfMJOUU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 16:37:21.0904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e83b0e3-e49b-4a57-6b89-08dd6571fd45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9416

On 2025-03-17 10:36, Jan Beulich wrote:
> On 06.03.2025 23:03, Jason Andryuk wrote:
>> xl queries SYSCTL_physinfo for the physical cpus:
>> domU:~# xl list
>> libxl: error: libxl_utils.c:817:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus
>> libxl: error: libxl_utils.c:817:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus
>> libxl: error: libxl_utils.c:817:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus
>> Name                    ID   Mem VCPUs        State   Time(s)
>> Domain-0                 0   800     1     r-----     130.0
>> dom0less-1               1   400     1     r-----     130.3
>> dom0less-2               2   800     1     r-----     130.3
>>
>> Hardware and control are both privileged.  Allow them both access to
>> sysctls so they have insight into the running system.  This is coarse
>> grained permissions for the dummy policy.
> 
> In an earlier patch you alluded to the control domain being guarded against
> the hardware one. Shouldn't hwdom be limited operations retrieving info,
> but refused to make any changes to the system? Or maybe some kinds of
> changes are to be done by hwdom, but then shouldn't be possible to be made
> by the control domain?

As an example, with ACPI living in the hardware_domain, it would be the 
domain to issue XEN_SYSCTL_pm_op to upload cpufreq data.  But then 
control domain should be in charge of controlling how the system is 
running by setting cpufreq parameters.

>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -194,9 +194,10 @@ static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
>>       case XEN_SYSCTL_getdomaininfolist:
>>           return xsm_default_action(XSM_XS_PRIV, current->domain, NULL);
>>       case XEN_SYSCTL_readconsole:
>> -    case XEN_SYSCTL_physinfo:
> 
> Didn't you add this line just a single patch ago?

Yes.  The previous patch was a minimal change.  This patch is a maximal 
change.  I thought this could be rejected and didn't want to merge the 
two.  Though XEN_SYSCTL_physinfo should be handled better even for the 
minimal change.

This patch may go too far, hardware domain does have legitimate use to 
some sysctls.  For a coarse, base policy I went with allowing more to 
hardware domain.  Hardware domain can't be untrusted, so I erred on the 
side of more permissions rather than fewer.

Regards,
Jason

