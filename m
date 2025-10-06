Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3E3BBE535
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 16:26:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138275.1474036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5mAP-0003h2-Cg; Mon, 06 Oct 2025 14:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138275.1474036; Mon, 06 Oct 2025 14:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5mAP-0003eD-9Y; Mon, 06 Oct 2025 14:26:21 +0000
Received: by outflank-mailman (input) for mailman id 1138275;
 Mon, 06 Oct 2025 14:26:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yrnp=4P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v5mAN-0003dr-Fw
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 14:26:19 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6665909f-a2c0-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 16:26:09 +0200 (CEST)
Received: from BL6PEPF0001640D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:14) by SA1PR12MB8987.namprd12.prod.outlook.com
 (2603:10b6:806:386::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Mon, 6 Oct
 2025 14:25:58 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2a01:111:f403:f903::2) by BL6PEPF0001640D.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 14:25:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 14:25:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 6 Oct
 2025 07:25:57 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Oct
 2025 09:25:57 -0500
Received: from [192.168.178.136] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 6 Oct 2025 07:25:57 -0700
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
X-Inumbo-ID: 6665909f-a2c0-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjYNjODit6wOHPRDQ/m6hSlcD6LNaQ0YyITmcdviQdltXWapgVUZd9vTPhz9sTHe7TeoTfir9fb/tTLyZ3mDZ9yJvZelJgGtzSK15BAjwQD4l7gOiv8sUKksG/NCKW4nEFsUQK5KrzyJRtEaFgePbyGY1+5eIGSTDF2lEDmD1f28+YriH7mQpgRu7e+8B9C9oa9y0ekbdw+KKoOspm43S+gPY1ZprCIEkkboZtCfa17ONJQg0Wxi5DW4fYa9+2FfeP2Mq7zWVXSsR+3/cFeaZyEATPYB9uTfVMGQ8qlcDTUx1CuPOXg9Wg3+RREVPiw4o11ke20O0001d+ITO39Gbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXNi2F3lBh6QEsfG+e1WaJ6FUAT3iTE/YtO3Tw9GQMg=;
 b=yU0xjHXYSAkDb/SabGERPAjhgen6J/JCC2TDSeTYtRLoEPyqJDuKb0dxdBGlzAxKf8WzGLBuwIXcf1gv5LdB8nlw6PHUGZZsXBYpdyNiOOPIcLWVmFRT/z69iFdPXR3uqQXgH3Dgav6Ebz2UTigJhj4vanyW1QfAeYeOxYpSyarw+m3LFKRlPBXYryN4jEXWNG73ZLHkcCX5NK6nlZF27+PcaDvGLpT9lgI0oPasPbHQj3+xGOlUtWR8l8Qk2bmp509ftW1mteErOmDtHIA4LXBj8ta6AiP8aXwv72ZJGfeiDXw02lNbZhj7hFgsPnhqB0j+5TNn/7SiKR/4awdJiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXNi2F3lBh6QEsfG+e1WaJ6FUAT3iTE/YtO3Tw9GQMg=;
 b=V0rhydR5uHYCM2ApOsFaFlr3UR85TC08GI/LJICKmXeS8NMr2t5TNLlgMrRNeiM68RSRdoPsgncy8YfB213QKr9AaQtgGabhJaTaMVJgAkj7hax9zlTCjUHe7ShvSAuxmszs00CSBSPKRBS8RF4HK1PoKeRL8QCpkTD3fP6MA74=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <45fbc094-f90a-415d-abd8-8e1404251530@amd.com>
Date: Mon, 6 Oct 2025 10:25:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16
To: Yann Sionneau <yann.sionneau@vates.tech>, <xen-devel@lists.xenproject.org>
References: <aKiBJeqsYx_4Top5@mail-itl> <aKiBwEsogK420kwo@mail-itl>
 <05e9628d-83e5-4feb-881d-5854b72bd560@suse.com> <aKi6Foj-Lx_n0L6l@mail-itl>
 <aNEgTgis2JeyQ4HA@mail-itl> <8f6b8f08-ca62-467b-a6be-4d33208e5393@epam.com>
 <aNPyW5a7BHni-SuI@mail-itl> <32097dc9-761f-4319-9fa8-6bcb15c06a82@vates.tech>
Content-Language: en-US
In-Reply-To: <32097dc9-761f-4319-9fa8-6bcb15c06a82@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|SA1PR12MB8987:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa296f5-d390-455c-ff1c-08de04e44467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dld4OE1HRDI0OUJXZWZFNWlZRjJXdEhMN3NCQzNXK3BveEFEMTk3S1FOcldi?=
 =?utf-8?B?T1dEWGFVcTlWeGJ5VGhFNytCdXlneERzaUlHRDZURTl4OUwwQXNKc1Z2akFW?=
 =?utf-8?B?eDlqaUxyMlFBUVRCLzFNeTNrSGFGTGJ0N29FUHNDSDlLeG9MdWFUbUt6VmFR?=
 =?utf-8?B?YWJmOVhrS3JJc3c4V2lCdjF3WXpwT1ROWVBHbVRuNTBlSVA2S2J6QU9YZnFL?=
 =?utf-8?B?TDMyK29MS25tbjFxQXJuMFBONXNSM25kRndyN1FtMTRMUzFKYmJQYkg4eGZX?=
 =?utf-8?B?WXEzVFk0VjhxRkJKZDhmMjlmS2U4SW9pLzd2YzJnL3plSkpwUVo3cVhycGE4?=
 =?utf-8?B?NW1sV2Q5RWV0a3BEdHdQYlFEci94YlpOQjh6LzhHK2JTRGtYMUxzMWRSUEgr?=
 =?utf-8?B?OWpRcnpUaFhtS0JGdVMzQkcxL21leHBvMldldkxtNFhacFpIQy9PM09DRmhk?=
 =?utf-8?B?TEkvZnpYUGRzeUwyWGR0eXpXbWMvQkxtL1pwM3A5SXpjd2RLcGRUVHZIRWZ1?=
 =?utf-8?B?dkVMbDRGTUFyKytPSGY3NnJoWExnK01id3lMVHJ5ODJpZXpyUkdoazdwT2hR?=
 =?utf-8?B?cGN3K3FtZlhDZm5ablgrZER2MkpHUDNINkljTjJxQ0RoaE5BTmhhMGVqL0FH?=
 =?utf-8?B?YVhJbnFlNk5HcGVKcmhPSEdHVmErVjhybWRBVDJZaHF1U0xheENhUy9qRm45?=
 =?utf-8?B?OE5sRldTalVhTzB0NUJlY0tRSkhTUjhhTm5kSHQ3NkNqUVc2bWVvWDNDcHFz?=
 =?utf-8?B?L3VaY0pwTTIwdCtabkkzR0hNd3NQVUZ0Yncvak5mVzdKYkxuekNCOEN0eWJK?=
 =?utf-8?B?eU5JL1NzVXdLL2M4ZXVuaHpWZGJsUHVuUmh3ZHIvdUliUmM3YjVIVXBQYTdT?=
 =?utf-8?B?eURMQlBJS21hMHljdlBrb1dockZUYWxad0hhOHh4RDlKajRhZ2FTVGdsL1Rv?=
 =?utf-8?B?UGovaWdiMmduRXUwbmlQcXFyT2ZPS0JoSFo2UEcxL3RGMHkrVUZ1QlB2T0c2?=
 =?utf-8?B?c3VuOWNRVVNtOWNSbHpDVk0wVFFuMFNPTlJLMGJ5dGkxc0t2ZnJBYzYzbUxG?=
 =?utf-8?B?WVc0TGNxL25veDJhZUk5VTBxQTB4cWY3dU5jOXZjdWVZQ2k0K0tqcVU4Zzc1?=
 =?utf-8?B?a2lrZ0lucEZnb2ZYTGZLaHcrcEUxNFJ5SENEd25UWGUrRnhJRW1OVk1nMFh2?=
 =?utf-8?B?NDV2ZmE5V211b092ZzZrNUJJSDM5V3JRS2VGeGhxelFwTGxIbUlUdmNwd3pT?=
 =?utf-8?B?VmRlZm1tODVDZkU1b3BOOUdjVDUycWdKTWNIR0lncTBXdUswZVdwUy9kcVVC?=
 =?utf-8?B?R3hkTFFPQ1dVYkxGeW9oY2dMNUxkeU9CRm0yc3VKQ0tWL0R1ZDNTYVd3aFJM?=
 =?utf-8?B?eGlzdjV2UW5xcjNvR3dXNHpRTlNDRy9XNUo2NzVrV0xHWllKWTRnd0lpYUpp?=
 =?utf-8?B?aUU1Q3JaQXBscDlHa2dTdXpJVVM1dWhSZ1VWMnJwakM2YjkwQWhSbk5kZk1E?=
 =?utf-8?B?Y0hxUEJaTjZnVGxFZTB6ZUdBVVZnSnRyWjdqcEt6UUpkd2ZMTGdlQzNWaVZx?=
 =?utf-8?B?aTEzWWtvd2VKOFZLTXozU2tSV0ZwREVoQ2FaNzMxbjlkMWQ3Ulh5SlJpU3Bu?=
 =?utf-8?B?RGU4dkNuUVMrNitIQmt0bDVjUVZrbXZLUE9EV001eXl2ZWUrMHRnSXlpenoy?=
 =?utf-8?B?N2NQVmJkZjBuSkpFRWVWMjBGUEloLzh1Rk5LRlJiMU95K3pJdUNvdmVzb2VC?=
 =?utf-8?B?aUE2V2NFOXdBMUpXTzIyaGVtWVVVa1pHZDdBRWEya3BzWWhMOTBWVjBhRlB4?=
 =?utf-8?B?RFFUa1VqQVNqYWxvUm5ENWFxNUFkNkJ4NHpETnlCb2d0M0FGUWxYZ0ZURmF6?=
 =?utf-8?B?MEs1ZDR2Rk9XaU9oRXNKaVluUkdyd2diSStiY1ViZ3g1aW9BdFNoNHk5OWhV?=
 =?utf-8?B?aWVoSWErY25HejU0QzBhUzJxUmhvTEt5ZDFNa2VsdXlwRGlTVHhiWFBmQ2ZM?=
 =?utf-8?B?UCtXVHJadXFuSHVnTlZxUlpRSnM1RXhSN3l6SmFHRWlvYXZGZ1RiV2VLR1Ew?=
 =?utf-8?B?N3JYQmVITk1BQWtsdzhNV2cxR0lPelcxVjNUUVB4cEFLTHZ1VnJPcUMwZURC?=
 =?utf-8?Q?rRqZxocc9r/TUwsj5XMS2QzbH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 14:25:57.9478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa296f5-d390-455c-ff1c-08de04e44467
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8987

On 2025-09-24 10:28, Yann Sionneau wrote:
> On 9/24/25 15:30, Marek Marczykowski-Górecki wrote:
>> On Wed, Sep 24, 2025 at 01:17:15PM +0300, Grygorii Strashko wrote:
>>>
>>>
>>> On 22.09.25 13:09, Marek Marczykowski-Górecki wrote:
>>>> On Fri, Aug 22, 2025 at 08:42:30PM +0200, Marek Marczykowski-Górecki wrote:
>>>>> On Fri, Aug 22, 2025 at 05:27:20PM +0200, Jürgen Groß wrote:
>>>>>> On 22.08.25 16:42, Marek Marczykowski-Górecki wrote:
>>>>>>> On Fri, Aug 22, 2025 at 04:39:33PM +0200, Marek Marczykowski-Górecki wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> When suspending domU I get the following issue:
>>>>>>>>
>>>>>>>>         Freezing user space processes
>>>>>>>>         Freezing user space processes failed after 20.004 seconds (1 tasks refusing to freeze, wq_busy=0):
>>>>>>>>         task:xl              state:D stack:0     pid:466   tgid:466   ppid:1      task_flags:0x400040 flags:0x00004006
>>>>>>>>         Call Trace:
>>>>>>>>          <TASK>
>>>>>>>>          __schedule+0x2f3/0x780
>>>>>>>>          schedule+0x27/0x80
>>>>>>>>          schedule_preempt_disabled+0x15/0x30
>>>>>>>>          __mutex_lock.constprop.0+0x49f/0x880
>>>>>>>>          unregister_xenbus_watch+0x216/0x230
>>>>>>>>          xenbus_write_watch+0xb9/0x220
>>>>>>>>          xenbus_file_write+0x131/0x1b0
>>>>>>>>          vfs_writev+0x26c/0x3d0
>>>>>>>>          ? do_writev+0xeb/0x110
>>>>>>>>          do_writev+0xeb/0x110
>>>>>>>>          do_syscall_64+0x84/0x2c0
>>>>>>>>          ? do_syscall_64+0x200/0x2c0
>>>>>>>>          ? generic_handle_irq+0x3f/0x60
>>>>>>>>          ? syscall_exit_work+0x108/0x140
>>>>>>>>          ? do_syscall_64+0x200/0x2c0
>>>>>>>>          ? __irq_exit_rcu+0x4c/0xe0
>>>>>>>>          entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>>>>>>         RIP: 0033:0x79b618138642
>>>>>>>>         RSP: 002b:00007fff9a192fc8 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
>>>>>>>>         RAX: ffffffffffffffda RBX: 00000000024fd490 RCX: 000079b618138642
>>>>>>>>         RDX: 0000000000000003 RSI: 00007fff9a193120 RDI: 0000000000000014
>>>>>>>>         RBP: 00007fff9a193000 R08: 0000000000000000 R09: 0000000000000000
>>>>>>>>         R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000014
>>>>>>>>         R13: 00007fff9a193120 R14: 0000000000000003 R15: 0000000000000000
>>>>>>>>          </TASK>
>>>>>>>>         OOM killer enabled.
>>>>>>>>         Restarting tasks: Starting
>>>>>>>>         Restarting tasks: Done
>>>>>>>>         xen:manage: do_suspend: freeze processes failed -16
>>>>>>>>
>>>>>>>> The process in question is `xl devd` daemon. It's a domU serving a
>>>>>>>> xenvif backend.
>>>>>>>>
>>>>>>>> I noticed it on 6.16.1, but looking at earlier test logs I see it with
>>>>>>>> 6.16-rc6 already (but interestingly, not 6.16-rc2 yet? feels weird given
>>>>>>>> seemingly no relevant changes between rc2 and rc6).
>>>>>>>
>>>>>>> I forgot to include link for (a little) more details:
>>>>>>> https://github.com/QubesOS/qubes-linux-kernel/pull/1157
>>>>>>>
>>>>>>> Especially, there is another call trace with panic_on_warn enabled -
>>>>>>> slightly different, but looks related.
>>>>>>>
>>>>>>
>>>>>> I'm pretty sure the PV variant for suspending is just wrong: it is calling
>>>>>> dpm_suspend_start() from do_suspend() without taking the required
>>>>>> system_transition_mutex, resulting in the WARN() in pm_restrict_gfp_mask().
>>>>>>
>>>>>> It might be as easy as just adding the mutex() call to do_suspend(), but I'm
>>>>>> really not sure that will be a proper fix.
>>>>>
>>>>> Hm, this might explain the second call trace, but not the freeze failure
>>>>> quoted here above, I think?
>>>>
>>>> While the patch I sent appears to fix this particular issue, it made me
>>>> wonder: is there any fundamental reason why do_suspend() is not using
>>>> pm_suspend() and register Xen-specific actions via platform_suspend_ops
>>>> (and maybe syscore_ops)? From a brief look at the code, it should
>>>> theoretically be possible, and should avoid issues like this.
>>>>
>>>> I tried to do a quick&dirty attempt at that[1], and it failed (panic). I
>>>> surely made several mistakes there (and also left a ton of todo
>>>> comments). But before spending any more time at that, I'd like to ask
>>>> if this is a viable option at all.
>>>
>>> I think it might, but be careful with this, because there are two "System Low power" paths in Linux
>>> 1) Suspend2RAM and Co
>>> 2) Hybernation
>>>
>>> While "Suspend2RAM and Co" path is relatively straight forward and expected to be always
>>> started through pm_suspend(). In general, it's expected to happen
>>>    - from sysfs (User space)
>>>    - from autosuspend (wakelocks).
>>>
>>> the "hibernation" path is more complicated:(
>>> - Genuine Linux hybernation hibernate()/hibernate_quiet_exec()
>>
>> IIUC hibernation is very different as it puts Linux in charge of dumping
>> all the state to the disk. In case of Xen, the primary use case for
>> suspend is preparing VM for Xen toolstack serializing its state to disk
>> (or migrating to another host).
>> Additionally, VM suspend may be used as preparation for host suspend
>> (this is what I actually do here). This is especially relevant if the VM
>> has some PCI passthrough - to properly suspend (and resume) devices
>> across host suspend.
>>
>>> I'm not sure what path Xen originally implemented :( It seems like "suspend2RAM",
>>> but, at the same time "hybernation" specific staff is used, like PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE.
>>> As result, Linux suspend/hybernation code moves forward while Xen stays behind and unsync.
>>
>> Yeah, I think it's supposed to be suspend2RAM. TBH the
>> PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE confuses me too and Qubes OS has a
>> patch[2] to switch it to PMSG_SUSPEND/PMSG_RESUME.
>>
>>> So it sounds reasonable to avoid custom implementation, but may be not easy :(
>>>
>>> Suspending Xen features can be split between suspend stages, but
>>> not sure if platform_suspend_ops can be used.
>>>
>>> Generic suspend stages list
>>> - freeze
>>> - prepare
>>> - suspend
>>> - suspend_late
>>> - suspend_noirq (SPIs disabled, except wakeups)
>>>     [most of Xen specific staff has to be suspended at this point]
>>> - disable_secondary_cpus
>>> - arch disable IRQ (from this point no IRQs allowed, no timers, no scheduling)
>>> - syscore_suspend
>>>     [rest here]
>>> - platform->enter() (suspended)
>>>
>>> You can't just overwrite platform_suspend_ops, because ARM64 is expected to enter
>>> suspend through PSCI FW interface:
>>> drivers/firmware/psci/psci.c
>>>    static const struct platform_suspend_ops psci_suspend_ops = {
>>
>> Does this apply to a VM on ARM64 too? At least on x86, the VM is
>> supposed to make a hypercall to tell Xen it suspended (the hypercall
>> will return only on resume).
>>
>>> As an option, some Xen components could be converted to use syscore_ops (but not xenstore),
>>> and some might need to use DD(dev_pm_ops).
>>>
>>>>
>>>> [1] https://github.com/marmarek/linux/commit/47cfdb991c85566c9c333570511e67bf477a5da6
>>>
>>> -- 
>>> Best regards,
>>> -grygorii
>>>
>>
>> [2] https://github.com/QubesOS/qubes-linux-kernel/blob/main/xen-pm-use-suspend.patch
>>
> 
> On my setup I get a weird behavior when trying to suspend (s2idle) a
> Linux guest.
> Doing echo freeze > /sys/power/state in the guest seems to "freeze" the
> guest for good, I could not unfreeze it afterward.
> VCPU goes to 100% according to XenOrchestra
> xl list shows state "r" but xl console blocks forever
> xl shutdown would block for some time and then print:
> Shutting down domain 721
> ?ibxl: error: libxl_domain.c:848:pvcontrol_cb: guest didn't acknowledge
> control request: -9
> shutdown failed (rc=-9)
> 
> Do you think it's related to your current issue?

idle=halt on the Linux command line addresses the 100% CPU usage.  Or 
alternatively C2 needs to be implemented for guest vcpus.  I forget 
preceisely, but I think the 100% CPU is because there are no C-states 
available and Linux/cpuidle won't use halt by default.

To wake up, you need a wake up source.  The ACPI buttons presses will do 
that:
xl trigger $dom power
xl trigger $dom sleep

However, I think without changes, domU s2idle/S3 will detach all its PV 
devices.  Naturally they don't get reconnected on resume.  You can hack 
around that to skip the detach.

Actually, maybe we just need:
--- i/drivers/xen/xenbus/xenbus_probe_frontend.c
+++ w/drivers/xen/xenbus/xenbus_probe_frontend.c
@@ -148,8 +148,6 @@ static void xenbus_frontend_dev_shutdown(struct 
device *_dev)
  }

  static const struct dev_pm_ops xenbus_pm_ops = {
-       .suspend        = xenbus_dev_suspend,
-       .resume         = xenbus_frontend_dev_resume,
         .freeze         = xenbus_dev_suspend,
         .thaw           = xenbus_dev_cancel,
-       .restore        = xenbus_dev_resume,
+       .restore        = xenbus_frontend_dev_resume,
  };

b3e96c0c7562 ("xen: use freeze/restore/thaw PM events for 
suspend/resume/chkpt") changed from PMSG_SUSPEND/PMSG_RESUME to 
PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE, but the suspend/resume callbacks 
remained.  But freeze and suspend being identical doesn't seem correct.

This would leave xl save/restore/migrate using the hibernate 
freeze/thaw/resume.  S3/s2idle would no touch the PV devices, so they 
would still be present on resume.  Maybe there are cases I am not 
thinking of though.

Regards,
Jason

