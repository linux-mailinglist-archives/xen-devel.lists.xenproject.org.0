Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4E3C98B3B
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 19:21:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175952.1500541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ8WC-00071F-Vx; Mon, 01 Dec 2025 18:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175952.1500541; Mon, 01 Dec 2025 18:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ8WC-0006yk-RN; Mon, 01 Dec 2025 18:21:00 +0000
Received: by outflank-mailman (input) for mailman id 1175952;
 Mon, 01 Dec 2025 18:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2MM0=6H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vQ8WA-0006ye-Vz
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 18:20:59 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a33266e-cee2-11f0-9d1a-b5c5bf9af7f9;
 Mon, 01 Dec 2025 19:20:56 +0100 (CET)
Received: from MN2PR04CA0028.namprd04.prod.outlook.com (2603:10b6:208:d4::41)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 18:20:51 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:d4:cafe::9c) by MN2PR04CA0028.outlook.office365.com
 (2603:10b6:208:d4::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 18:20:54 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 18:20:50 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 12:20:48 -0600
Received: from [172.31.77.70] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 1 Dec 2025 10:20:47 -0800
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
X-Inumbo-ID: 7a33266e-cee2-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEOF4oz3QZ93rQQqLCdqepRsU6E2mTxvxn4aQDrdxQPxBsVCvKxSzZpii6JTxwm8jM85Bu+kxwJDxBm9frLtDYSCCCQ36qJHe2SseRlGsH+QCo3bt8W6I2JDQlQ3mz1msIfWxSnoudTAldlUoEzsJh3p1lu5rHHe+EdPoWaNAECEDGG/yWtujlyFrRweG/sYLaDpOUZXOeW5D++JNuZA7SZpMFA58IthnFK2QbZDiReewdWhzJfUNxGBMhLj3+TY0vkf4XkpXnC9yFi0UC2kMXYucc/QKT68psVKjtR5prp+vk/4AuLSZ0UgCG2LfSdPNaX3TnP007Duood9Nhn3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I52DyuTMlAwzXRPy6YzI1itobKzOSJLCLxnFKBFnQTQ=;
 b=EyyWRruGmCYqkOuWKIk4DDtKMpF36hZt6UMh7u55PL7M7OVZBWxP/VitinL0rl6xk36HSQa1nYzTUOsZ/bDXOMYj6x0kMagygD5P51kx6v9JRyUWsKsZVa9fLSD2oT4Lx1Um1ZCGZKSkP+gnV7vIGPrDk7pL/OGkJv87FMUS97koZ+twXepdh+VEQx3J/wg/40yLi9mHqDipIUxBk7nSZzDMjH5n8iRefjEqQWgZaY1OUu3vbHFIgZepQMEEopeRq30r3WnEFHX5rQAvYoxAksEkLhmsdcpu0woHVfUtuVulnbxBP8YL/+i4lmB/EuWMLgp87sOI+ktF+t6DHsvOCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=invisiblethingslab.com
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I52DyuTMlAwzXRPy6YzI1itobKzOSJLCLxnFKBFnQTQ=;
 b=pmhWN4QRX1Lh6bu3P5Bzi7BltIK6Z8nRlDziILcIMcJ9w3mXZ8H+4rcjhUtoHDG0UqhME59bdEwfjABrFCwvTJIGIyG/xKvh7gOHw+nlMeOzIhstJf0tXRWWzifbxBcmtzXogA7In9XDbFayYs25WyRU7IhMXrt08rRJxRI2lI4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <fb1e5c6f-cb0e-49d0-9e96-8e778573f49c@amd.com>
Date: Mon, 1 Dec 2025 13:20:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
CC: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Yann Sionneau <yann.sionneau@vates.tech>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <20251119224731.61497-1-jason.andryuk@amd.com>
 <20251119224731.61497-2-jason.andryuk@amd.com> <aSul6qAYTSOSFJR3@mail-itl>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <aSul6qAYTSOSFJR3@mail-itl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|SA0PR12MB4416:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab1479c-3fbc-41c0-9a33-08de31065b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|30052699003|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzVBUkNOUy9MWUdRc0ZEQlBXdDZ5WkxUbFIrRWJOQ0tVTkNCUWtXdUVjVWdJ?=
 =?utf-8?B?Ym9RRTkybUpvV1pnSmRZb0NwT1lkTjQvVld6d0czNzZsaGJZQ3IvWHZFUXFr?=
 =?utf-8?B?Z2hxbzcyYUsrNDlTR2RaNTY2TmFWRzdJQlZsVFBuWE1sZXFoWDJoQlY3SlBi?=
 =?utf-8?B?ZGlydXRXTmU0UkticWM4WTQ2WEN1cnJXNlFBSTRDWjZwZngrU3pYQ2x5U1FT?=
 =?utf-8?B?bkFtd0E2dGkwM09pZG1lRm1lbTlqT0VrSldYSzNHNkw3U2RybkVrdStxZzJv?=
 =?utf-8?B?YUFlVUxra1RJUUpPNGNCdzNJZFRIUVVQR0pPckRkSEtsLzB2VEoyQitSb091?=
 =?utf-8?B?TVAvWDl4WkpmQ05zZEJkMEtWeXJheFVsZDhEdTNLSW5ZbUt1VitYK3pFa0F2?=
 =?utf-8?B?V2YwaGdEK2JlODY4Q05XVFBZOHVBejlSdWFiY1MwRC9GZXFSMWNIcHFqWkJr?=
 =?utf-8?B?c2dQRjc1bmFPeml0S0lGK2VkWjFxRys0R3k3VTRjTWRNOTJUdlhkdzF5cFpw?=
 =?utf-8?B?ZUU3M3ZWMm45ODNEVjUyckc0RXE5cE9BVGlYT3NpMC9GTnFVWXRrRmk1bTA3?=
 =?utf-8?B?Z2FSSkEyVHBJVTJPSTRvbGFka1BQbGU5Q25EeUxnYTc2cXRVMGlpM1gyQkxn?=
 =?utf-8?B?MytYTkI1SWRnZTBHazdadVFPODVzeUVxTDNRdFNqcmJXeTRjU1hIQW1GL3kr?=
 =?utf-8?B?Z1RacUlnYVIvVklkYVlNQ3JKNW9NcHp2dzlETWdCVEJMcUIzOTBGWVNGQVVm?=
 =?utf-8?B?V0gyZzRnejVBYW9NNmYrekZ2MDJFaCtZL0pkZmlSb3FwcXpHQ3BoYy9jbEpC?=
 =?utf-8?B?aHdRUjJPQmhzQlJwMEhTMVZyNzJVelJQOWludVBPNjdMK2EzdWZWWThBcWhE?=
 =?utf-8?B?QzVJZ2FmQkpFeld0d1NzRUNBQUZHVVlLK2JFUUxNN3VnZEhuKzc2d3grUnZy?=
 =?utf-8?B?V1h2bWdTRlhPY2xLQ0V4ZXQwSExWdnh0YmNJUzlWNXdyNWwraVMzYlJNQUVO?=
 =?utf-8?B?eTUwTUxtV3dJUERDUUN0MFY4L2QzK3UybTNUU1FjNGdsNTFzZW5OaWltdXYz?=
 =?utf-8?B?M2NRZlN6WHpUcFdadGR6VkdjY1AzdUhPbUFmcHIyNENnR1lZckJQWHFoWWpn?=
 =?utf-8?B?dENlSWNPdzRVMmp6Zng1dDNXVmQ2elUyS3ZzNDdDOUJld0xURDl4ZGkwbXAz?=
 =?utf-8?B?eHFsYVpuU2ZBOXcxdGN6WldZQXh1Z3h6TFV4VWhsMlN3MzFSa1QzVnhpM3ZK?=
 =?utf-8?B?WUk1VEVSNjV3eWRQdHFmbmZkcjB4T29HZ3kvRC9aOTJReEFiclRyc3dZSGlm?=
 =?utf-8?B?SnlETHVZVkZyTHdOSFdpWm1TOU9kOHZBTCs2TWFwMTlrSy9aZk9sTnFrd3ow?=
 =?utf-8?B?bUtGVWswckNNMTd5OUlmSWVXVm10Q2M0L2lzeUE4NEpOWWo5K05xclY4RGk1?=
 =?utf-8?B?K21Td1B4SFFrRWRQbmZPMzNSQUhCdjlxZlBzdytabEdkSkVWZlVBZmRhMWxi?=
 =?utf-8?B?YS9iOWRCREpBeXdoY0JwMk5uMWJGM20yanFhZUZEZDRDVC9QV3NCUzZYU3J2?=
 =?utf-8?B?eXhjcEZNSm5MUDUvbkgrRVBMd2dvUlRvVjR3cmxjVTJoRkRQdGY2eGZpQkRS?=
 =?utf-8?B?aXN1SWZ0QVN4WExxSE0xa0YrT21zMHRRL0hDVHUvOUZzemJxWFdmYjMrK0Jk?=
 =?utf-8?B?ZTk5TkhtVUFJWXIzb3pPUWZqMGk3QndoK3hkYmN6S0N2Nm1WMEFqTklLU0JG?=
 =?utf-8?B?NTQ5V204VVpnTUlWWTR1c2Q3TjJTMzZaWU1PalI1NCsvNXQ3QXljY2xNSlY3?=
 =?utf-8?B?dStxWEpEam5XMkluWjRsS3BvdUJUaDdMeXloK0RQOFkvcUVCWFRLeWJjb2JR?=
 =?utf-8?B?Y2d3bEZPampEYjlOWlNLY1JEMHZSN25FYk9jRTZBR0FjYjBLY29lWXQzQXRI?=
 =?utf-8?B?NVpLSEpMbXl4R3pWSjltOE11bXZReEx6c2hqZlhCK2ExcGZnWFVmR0RMUnNs?=
 =?utf-8?B?alRtK3ZDQmFCbC9qa1FKOVdsSnRSY3B5YWFGVjdubEkyVzVFVWZ5Q1FEMitz?=
 =?utf-8?Q?pA7pnp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(30052699003)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 18:20:50.7077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab1479c-3fbc-41c0-9a33-08de31065b7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416

On 2025-11-29 21:03, Marek Marczykowski-Górecki wrote:
> On Wed, Nov 19, 2025 at 05:47:29PM -0500, Jason Andryuk wrote:
>> The goal is to fix s2idle and S3 for Xen PV devices.
> 
> Can you give a little more context of this? We do have working S3 in
> qubes with no need for such change. We trigger it via the toolstack (libxl_domain_suspend_only()).
> Are you talking about guest-initiated suspend here?

This is intended to help domU s2idle/S3 and resume.  I guess that is 
what you mean by guest-initiated?  The domU can use 'echo mem > 
/sys/power/state' to enter s2idle/S3.  We also have the domU react to 
the ACPI sleep button from `xl trigger $dom sleep`.

AIUI, libxl_domain_suspend_only() triggers xenstore writes which Linux 
drivers/xen/manage.c:do_suspend() acts on.  `xl save/suspend/migrate` 
all use this path.

The terminology gets confusing.  Xen uses "suspend" for 
save/suspend/migrate, but the Linux power management codes uses 
freeze/thaw/restore.  AIUI, Linux's PMSG_SUSPEND/.suspend is for runtime 
power management.

When you call libxl_domain_suspend_only()/libxl_domain_resume(), you 
pass suspend_cancel==1.
  *  1. (fast=1) Resume the guest without resetting the domain
        environment.
  *     The guests's call to SCHEDOP_shutdown(SHUTDOWN_suspend) will
        return 1.

That ends up in Linux do_suspend() as si.cancelled = 1, which calls 
PMSG_THAW -> .thaw -> xenbus_dev_cancel() which is a no-op.  So it does 
not change the PV devices.

We needed guest user space to perform actions before entering s2idle. 
libxl_domain_suspend_only() triggers the Linux kernel path which does 
not notify user space.  The ACPI power buttons let user space perform 
actions (lock and blank the screen) before entering the idle state.

> We also have kinda working (host) s2idle. You may want to take a look at this
> work (some/most of it was posted upstream, but not all got
> committed/reviewed):
> https://github.com/QubesOS/qubes-issues/issues/6411#issuecomment-1538089344
> https://github.com/QubesOS/qubes-linux-kernel/pull/910 (some patches
> changed since that PR, see the current main too).

This would not affect host s2idle - it changes PV frontend devices.

Do you libxl_domain_suspend_only() all domUs and then put dom0 into s0ix?

>> A domain resuming
>> from s3 or s2idle disconnects its PV devices during resume.  The
>> backends are not expecting this and do not reconnect.
>>
>> b3e96c0c7562 ("xen: use freeze/restore/thaw PM events for suspend/
>> resume/chkpt") changed xen_suspend()/do_suspend() from
>> PMSG_SUSPEND/PMSG_RESUME to PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE, but the
>> suspend/resume callbacks remained.
>>
>> .freeze/restore are used with hiberation where Linux restarts in a new
>> place in the future.  .suspend/resume are useful for runtime power
>> management for the duration of a boot.
>>
>> The current behavior of the callbacks works for an xl save/restore or
>> live migration where the domain is restored/migrated to a new location
>> and connecting to a not-already-connected backend.
>>
>> Change xenbus_pm_ops to use .freeze/thaw/restore and drop the
>> .suspend/resume hook.  This matches the use in drivers/xen/manage.c for
>> save/restore and live migration.  With .suspend/resume empty, PV devices
>> are left connected during s2idle and s3, so PV devices are not changed
>> and work after resume.
> 
> Is that intended? While it might work for suspend by a chance(*), I'm
> pretty sure not disconnecting + re-reconnecting PV devices across
> save/restore/live migration will break them.

save/restore/live migration keep using .freeze/thaw/restore, which 
disconnects and reconnects today.  Nothing changes there as 
xen_suspend()/do_suspend() call the power management code with 
PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE.

This patches makes .suspend/resume no-ops for PMSG_SUSPEND/PMSG_RESUME. 
When a domU goes into s2idle/S3, the backend state remains connected. 
With this patch, when the domU wakes up, the frontends do nothing and 
remain connected.

> (*) and even that I'm not sure - with driver domains, depending on
> suspend order this feels like might result in a deadlock...

I'm not sure.  I don't think this patch changes anything with respect to 
them.

Thanks for testing.

Maybe the commit messages should change to highlight this is for domU PV 
devices?  struct xen_bus_type xenbus_backend does not define dev_pm_ops.

Regards,
Jason

>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   drivers/xen/xenbus/xenbus_probe_frontend.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
>> index 6d1819269cbe..199917b6f77c 100644
>> --- a/drivers/xen/xenbus/xenbus_probe_frontend.c
>> +++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
>> @@ -148,11 +148,9 @@ static void xenbus_frontend_dev_shutdown(struct device *_dev)
>>   }
>>   
>>   static const struct dev_pm_ops xenbus_pm_ops = {
>> -	.suspend	= xenbus_dev_suspend,
>> -	.resume		= xenbus_frontend_dev_resume,
>>   	.freeze		= xenbus_dev_suspend,
>>   	.thaw		= xenbus_dev_cancel,
>> -	.restore	= xenbus_dev_resume,
>> +	.restore	= xenbus_frontend_dev_resume,
>>   };
>>   
>>   static struct xen_bus_type xenbus_frontend = {
>> -- 
>> 2.34.1
>>
>>
> 


