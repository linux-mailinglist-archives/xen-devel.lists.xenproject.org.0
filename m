Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B338FCA1D4B
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 23:34:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177181.1501560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQvQC-0002p3-8g; Wed, 03 Dec 2025 22:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177181.1501560; Wed, 03 Dec 2025 22:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQvQC-0002mt-5x; Wed, 03 Dec 2025 22:34:04 +0000
Received: by outflank-mailman (input) for mailman id 1177181;
 Wed, 03 Dec 2025 22:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGbu=6J=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vQvQA-0002mn-HF
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 22:34:02 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 284fd19c-d098-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 23:33:59 +0100 (CET)
Received: from SA9PR13CA0070.namprd13.prod.outlook.com (2603:10b6:806:23::15)
 by DM4PR12MB6158.namprd12.prod.outlook.com (2603:10b6:8:a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 22:33:52 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:806:23:cafe::84) by SA9PR13CA0070.outlook.office365.com
 (2603:10b6:806:23::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 22:33:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 22:33:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 3 Dec
 2025 16:33:51 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Dec
 2025 16:33:50 -0600
Received: from [172.31.77.70] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 3 Dec 2025 14:33:50 -0800
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
X-Inumbo-ID: 284fd19c-d098-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiBnQa7lTpXtdtV4FqVPVJOz8qPW32RM3U8Dk5ZzV9plWrvC7TrURYF0JvlI6WhKjMquKVYWSQ9AvcOapRua6jc2kAE4+1UYID5DdqoLVL+HiSU45+l4956J6D8c4GWPhjIaSRMmQM1Q57o129ux10D9Fm/ZPo0ceOId2J34edJZZEgvw7jES1zkLAWxhnmnETtyvl6OKquad8ffH9Ao9CyfXqmyFfinFaCe9f2eYR5shA5gy3zp+ma8tP945DbWx8mmA9Nx0lKLw1dAbvN9WWbVXfIglYhla7NodXF50K5nNA1aCteQTsuL3QsHj5CrGRDFGh2p5pUVnGVi9LUSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wMUjIOgBaaeqtG0iX+BgpwxQMFFHvUc/PUYaR6KRgI=;
 b=PrlJ9eK3E9NoCsHbyt7JplrOtyd2WTp7xpPmAycUfanPR1bSfIWdMiDmt4lKU3cqpwmVAbHGpmnNG6Sy2KJxDnktnTY6KtRPh584RBMci/enQ5dXM0mfpsct5m7ev1dmw4y7ZSn/Wo2UpKfuRe9UX6xEWPVmE6oE1GUpD7CbCJ/fuxQDv6Q+Ra/qArGHHI0MJPL1phdG6tlJmX1X6bwCMaZOzGIG/rENrX3kPhjIW0Zug88F5AYixsLYEsPnNRIDTqOScKgjfS6lfNfLbxvQc24Wsq906lFpSH2pmMF+LWYpRU09zDpyC3B/Wd+8v313Lhi1GDzEhix+WC/G77QN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=invisiblethingslab.com
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wMUjIOgBaaeqtG0iX+BgpwxQMFFHvUc/PUYaR6KRgI=;
 b=xbDPHEYuK9pKubbHEJnisAObYJ8+8qlmap2F64Rj7KJwttSQw59dZlcpVM3dfIAMZspVeLYX5ejxoe6D8dK6mfhgyjPgjEwvYz1NIFcJYeK4VvJY2SYz8j3w/xGWAq0Tb60G+yxz4aphK+pLq/TPzCD7H5TqAIRl+eyN9iIgcfk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a1e7acec-b437-427f-ba76-5a264df689ef@amd.com>
Date: Wed, 3 Dec 2025 17:33:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
CC: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Yann Sionneau <yann.sionneau@vates.tech>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Daniel
 Smith" <dpsmith@apertussolutions.com>, Christopher Clark
	<christopher.w.clark@gmail.com>
References: <20251119224731.61497-1-jason.andryuk@amd.com>
 <20251119224731.61497-2-jason.andryuk@amd.com> <aSul6qAYTSOSFJR3@mail-itl>
 <fb1e5c6f-cb0e-49d0-9e96-8e778573f49c@amd.com> <aS4Tw7hUJDw6Jt_9@mail-itl>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <aS4Tw7hUJDw6Jt_9@mail-itl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|DM4PR12MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e1ec43-af7e-4ccd-2495-08de32bc08f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|30052699003|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2tZa1lZaFNmQ3hQR09XVWhneld5WGxmSCtzWkdQaVM5eUx6SS9FOGcvdFNX?=
 =?utf-8?B?TUE4N0gyY2hzVFhkOWFXd1kzaDNkY1g1aVNGblcvK0FHa3JzMlYzb1RmNkJ5?=
 =?utf-8?B?elBTd3BZR2Q0KzFkUVFYZGRyNUR0L3BhVkJxWUUvdHYvZHFiTzIyWjQ1cHp6?=
 =?utf-8?B?ZHU1RGZlcXdET1AwaVQ4K25lb1N4eFUyK1UraThKT3RvM0x2NWlDVmtMbjdo?=
 =?utf-8?B?cVM1QmRKWGNwTHV4ejNkQThGRXQweWxlZURqd3g5YTk2ZFoxSmllUVRJeXFQ?=
 =?utf-8?B?c1IvOENoelkvb0hSanFXcHduWlB6QlFlMStEU1cwWTZxcjZ3VHArcGNrSXh3?=
 =?utf-8?B?T2dqODI3dDVuSGlTdkk4NkVSNG8yNkk0SlZlMEFLRDBLRHdnV1VTU0UzT1dk?=
 =?utf-8?B?K01IQVlLdXRBT0Q1ekJhVmovaFkyMXZDR2JVSm81MlEyUU44dkF5L291a3VV?=
 =?utf-8?B?NnpkSTQ4RHpJb0RJNUJhd0lUQ1BkQmhpY1NmS2E5VEd4MFNwVVkwbmdSSktx?=
 =?utf-8?B?TFZGV1Y3c0ZuUkRFajBVUmQvU2p1ZU1seDg5MU5uejZ0WFl2OXI3VW5CV2Qy?=
 =?utf-8?B?aGNhYW5tU2FKazdRc2JTcXgxdUhFalJycFRMU2tzbmVlVGNJdjV3R1l6dHlR?=
 =?utf-8?B?enJBb0tqRWd3V0dPTEJsUXV6bStJMmZXWG01d0hKbTBjVTRlMW1Sb3J6Znd2?=
 =?utf-8?B?Y04rMi9jYTd3QUpsL3Y4RFQ4ekp6NDhkeEhHcUVSc1p6djVJMGs2UEhCSmR4?=
 =?utf-8?B?SklKemx4TmVIK1dmcXlDZUZaVHJPVXdPL2dVTzY3dVJrOTB3Mjl4Q3AyZENU?=
 =?utf-8?B?cHN6L2FlOUxWY0NxOEdTWkxwQmRoSEp6MCtqQlI4cGNuSmlDT3pmSWwreVVT?=
 =?utf-8?B?NlQwdVlZUWlPVUhZSDkwUWVKbHpnUnFvZk5TbUViK28reXZVUWFCaHdsaW9z?=
 =?utf-8?B?SlJxcGR1MUJkTzd1c1VYTWpSQ1ZyazNUdWtpM2g5VkNwamUxMHh1WFpmTjBw?=
 =?utf-8?B?c1MzaHkzaWZkWnkwanZ4eUFpcWNZakxaRnV3K25RYlBuazBmRXNFcVRxRUJY?=
 =?utf-8?B?Q29nVUlaNEpGSGZLQkVIcDVhd3c2OVAwSFBYZTJkRU5YbjhtK2VLZHFLT0Z1?=
 =?utf-8?B?ei9aNDlFZVY0OWRWUXc4Tmc4RXRwbmQwUHJ0VFkwZW1OUDhnWGZTMW9xdm80?=
 =?utf-8?B?NE5WOHYyYWVGamc3U2xRaFM3dHc4U0FRR0t2T2JhbngyU3pOODdWWmNGVk9I?=
 =?utf-8?B?c01hWWY1bGwwOHZnMng2cHo5U1VQMDQwTUxlVzRRaGZBblJZL3MvTWJGeGIx?=
 =?utf-8?B?RkdJSmwyNFovV29uT1RQNlpRTE52c1ZZekJjeUhSWWYxMjFzVGRZUkd3S0RC?=
 =?utf-8?B?ci9heE5aMjlKOExJS0FKNHF2R0RzajNMVTlXa3Erb09oZ3RQeEliUzBsYWZo?=
 =?utf-8?B?TGFvcThzNXFRRWc3a3A1QWFIWFZzZ1o4Q29zTEJ5cmV0b05kTjlkSHl4aFBF?=
 =?utf-8?B?eUI3aHhSU253NlhCRGZvY1ZLRWFFc0xscGM0VE1SSGo0QlNvYzkwUWRibFV4?=
 =?utf-8?B?MjdWYytaV3ZZbENEOFBlUk9Gekl6M1hqNGFJL2M5R0xKeWtjelhYQ1VLVTZ6?=
 =?utf-8?B?azdBMmJYbTV3MXQxTDFHRWl2QWtkM0RMUmg1c2dqOHZSQ3dWbkdrd0IyZmpQ?=
 =?utf-8?B?TXNOTFAyTXp4T1pSZCt6MWdMTURZMktEZVlZVVpFMW1TK05Ia0Q2UTBvd0hp?=
 =?utf-8?B?TVpOTk1vZ1lIaG5iZXJIS2p0ekZpVWNWT0Y1VUNUcmRva1VTaGU3ZzNQRXRp?=
 =?utf-8?B?cXJmSWdRWXlxN042VTFSeDBrNHB0L0RaT3FReVBURzBjTTlqa1FWRW1KWWFZ?=
 =?utf-8?B?R09DQ2NYTGNZeld4WFJWbDRUb1ZONnNiNkhNUUJZcjFNZ2NwSjlBZVk5a1ZB?=
 =?utf-8?B?N2x0NGE3TlA5RWMvVmE1RmR4TlAydEwzWWhRVGN1TkZ6WStHVnNxVHFDTzFO?=
 =?utf-8?B?blBXc2JONUxTSi9pNlpiQzdzYWQveDdMN0MvTDhoNnFSd1MxMVpOTGc4YTU4?=
 =?utf-8?B?NTJ5VGU3Z0dKL3dWUDdCSDVaelkrUC9xaUVHNis2Ylh2dW4vWnhpN2h6YVVQ?=
 =?utf-8?Q?371g0aQ4Wf0lkHEUX+lY802Ph?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(30052699003)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 22:33:51.7850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e1ec43-af7e-4ccd-2495-08de32bc08f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6158

On 2025-12-01 17:16, Marek Marczykowski-Górecki wrote:
> On Mon, Dec 01, 2025 at 01:20:40PM -0500, Jason Andryuk wrote:
>> On 2025-11-29 21:03, Marek Marczykowski-Górecki wrote:
>>> On Wed, Nov 19, 2025 at 05:47:29PM -0500, Jason Andryuk wrote:
>>>> The goal is to fix s2idle and S3 for Xen PV devices.
>>>
>>> Can you give a little more context of this? We do have working S3 in
>>> qubes with no need for such change. We trigger it via the toolstack (libxl_domain_suspend_only()).
>>> Are you talking about guest-initiated suspend here?
>>
>> This is intended to help domU s2idle/S3 and resume.  I guess that is what
>> you mean by guest-initiated?  The domU can use 'echo mem > /sys/power/state'
>> to enter s2idle/S3.  We also have the domU react to the ACPI sleep button
>> from `xl trigger $dom sleep`.
> 
> Ok, so this is indeed a different path than we use in Qubes OS.
> 
>> AIUI, libxl_domain_suspend_only() triggers xenstore writes which Linux
>> drivers/xen/manage.c:do_suspend() acts on.  `xl save/suspend/migrate` all
>> use this path.
>>
>> The terminology gets confusing.  Xen uses "suspend" for
>> save/suspend/migrate, but the Linux power management codes uses
>> freeze/thaw/restore.  AIUI, Linux's PMSG_SUSPEND/.suspend is for runtime
>> power management.
> 
> Indeed it gets confusing...
> 
>> When you call libxl_domain_suspend_only()/libxl_domain_resume(), you pass
>> suspend_cancel==1.
>>   *  1. (fast=1) Resume the guest without resetting the domain
>>         environment.
>>   *     The guests's call to SCHEDOP_shutdown(SHUTDOWN_suspend) will
>>         return 1.
>>
>> That ends up in Linux do_suspend() as si.cancelled = 1, which calls
>> PMSG_THAW -> .thaw -> xenbus_dev_cancel() which is a no-op.  So it does not
>> change the PV devices.
>>
>> We needed guest user space to perform actions before entering s2idle.
>> libxl_domain_suspend_only() triggers the Linux kernel path which does not
>> notify user space.  The ACPI power buttons let user space perform actions
>> (lock and blank the screen) before entering the idle state.
> 
> I see. In our case, we have our own userspace hook that gets called
> before (if relevant - in most cases it isn't).
> 
>>> We also have kinda working (host) s2idle. You may want to take a look at this
>>> work (some/most of it was posted upstream, but not all got
>>> committed/reviewed):
>>> https://github.com/QubesOS/qubes-issues/issues/6411#issuecomment-1538089344
>>> https://github.com/QubesOS/qubes-linux-kernel/pull/910 (some patches
>>> changed since that PR, see the current main too).
>>
>> This would not affect host s2idle - it changes PV frontend devices.
>>
>> Do you libxl_domain_suspend_only() all domUs and then put dom0 into s0ix?
> 
> Yes, exactly.
> 
>>>> A domain resuming
>>>> from s3 or s2idle disconnects its PV devices during resume.  The
>>>> backends are not expecting this and do not reconnect.
>>>>
>>>> b3e96c0c7562 ("xen: use freeze/restore/thaw PM events for suspend/
>>>> resume/chkpt") changed xen_suspend()/do_suspend() from
>>>> PMSG_SUSPEND/PMSG_RESUME to PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE, but the
>>>> suspend/resume callbacks remained.
>>>>
>>>> .freeze/restore are used with hiberation where Linux restarts in a new
>>>> place in the future.  .suspend/resume are useful for runtime power
>>>> management for the duration of a boot.
>>>>
>>>> The current behavior of the callbacks works for an xl save/restore or
>>>> live migration where the domain is restored/migrated to a new location
>>>> and connecting to a not-already-connected backend.
>>>>
>>>> Change xenbus_pm_ops to use .freeze/thaw/restore and drop the
>>>> .suspend/resume hook.  This matches the use in drivers/xen/manage.c for
>>>> save/restore and live migration.  With .suspend/resume empty, PV devices
>>>> are left connected during s2idle and s3, so PV devices are not changed
>>>> and work after resume.
>>>
>>> Is that intended? While it might work for suspend by a chance(*), I'm
>>> pretty sure not disconnecting + re-reconnecting PV devices across
>>> save/restore/live migration will break them.
>>
>> save/restore/live migration keep using .freeze/thaw/restore, which
>> disconnects and reconnects today.  Nothing changes there as
>> xen_suspend()/do_suspend() call the power management code with
>> PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE.
>>
>> This patches makes .suspend/resume no-ops for PMSG_SUSPEND/PMSG_RESUME. When
>> a domU goes into s2idle/S3, the backend state remains connected. With this
>> patch, when the domU wakes up, the frontends do nothing and remain
>> connected.
> 
> This explanation makes sense.
> 
>>> (*) and even that I'm not sure - with driver domains, depending on
>>> suspend order this feels like might result in a deadlock...
>>
>> I'm not sure.  I don't think this patch changes anything with respect to
>> them.
>>
>> Thanks for testing.
>>
>> Maybe the commit messages should change to highlight this is for domU PV
>> devices?  struct xen_bus_type xenbus_backend does not define dev_pm_ops.
> 
> Good idea.
> 
>> Regards,
>> Jason
>>
>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>> ---
>>>>    drivers/xen/xenbus/xenbus_probe_frontend.c | 4 +---
>>>>    1 file changed, 1 insertion(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
>>>> index 6d1819269cbe..199917b6f77c 100644
>>>> --- a/drivers/xen/xenbus/xenbus_probe_frontend.c
>>>> +++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
>>>> @@ -148,11 +148,9 @@ static void xenbus_frontend_dev_shutdown(struct device *_dev)
>>>>    }
>>>>    static const struct dev_pm_ops xenbus_pm_ops = {
>>>> -	.suspend	= xenbus_dev_suspend,
>>>> -	.resume		= xenbus_frontend_dev_resume,
>>>>    	.freeze		= xenbus_dev_suspend,
>>>>    	.thaw		= xenbus_dev_cancel,
>>>> -	.restore	= xenbus_dev_resume,
>>>> +	.restore	= xenbus_frontend_dev_resume,

I was double checking before sending a v2, and I have questions about 
this.  I purposely switched the .restore callback since 
xenbus_frontend_dev_resume() handles the extra case.  It was added in:

commit 2abb274629614bef4044a0b98ada42e977feadfd
Author: Aurelien Chartier <aurelien.chartier@citrix.com>
Date:   Tue May 28 18:09:56 2013 +0100

     xenbus: delay xenbus frontend resume if xenstored is not running

     If the xenbus frontend is located in a domain running xenstored, 
the device
     resume is hanging because it is happening before the process 
resume. This
     patch adds extra logic to the resume code to check if we are the domain
     running xenstored and delay the resume if needed.

It was after b3e96c0c7562, so .freeze/thaw/restore were already present 
for domU xen_suspend() handling.  So the .resume handler should have 
been used.

This is for the "domain running xenstored", so dom0.  So maybe this was 
called for a dom0 S3 suspend/resume?  But as stated above this is patch 
changes PV frontends.  Maybe the change was for Xenclient/OpenXT - 
OpenXT has netfront in dom0 connected to the network driver domain.  But 
without netback changes, I don't think that would work today?  As it is, 
S3 in OpenXT has been disabled for years as broken.

Ok, yes, dom0 S3:
https://lore.kernel.org/xen-devel/1367413042-13987-1-git-send-email-aurelien.chartier@citrix.com/

 > This patch series fixes the S3 resume of dom0 or a Xenstore stub
 > domain running a frontend over xenbus (xen-netfront in my use case).
 >
 > As device resume is happening before process resume, the xenbus
 > frontend resume is hanging if xenstored is not running, thus causing
 > a deadlock. This patch series is fixing that issue by bypassing the
 > xenbus frontend resume when we are running in dom0 or a Xenstore stub
 > domain.

I don't think setting .restore = xenbus_frontend_dev_resume will break 
anything for a domU.  It handles a case which doesn't trigger for a 
domU.  Removing .resume, a frontend in dom0 will not be touched, so that 
at least cannot hang.

Does this all sound okay?  Does anyone think I am missing anything

Regards,
Jason

