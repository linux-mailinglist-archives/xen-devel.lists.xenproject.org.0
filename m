Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5526B383BD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 15:31:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096056.1450864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGEn-0004Pb-NU; Wed, 27 Aug 2025 13:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096056.1450864; Wed, 27 Aug 2025 13:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGEn-0004O6-Js; Wed, 27 Aug 2025 13:30:53 +0000
Received: by outflank-mailman (input) for mailman id 1096056;
 Wed, 27 Aug 2025 13:30:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEsR=3H=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1urGEm-0004O0-CB
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 13:30:52 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2414::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a6c7a67-834a-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 15:30:48 +0200 (CEST)
Received: from PH0PR07CA0096.namprd07.prod.outlook.com (2603:10b6:510:4::11)
 by DM4PR12MB6493.namprd12.prod.outlook.com (2603:10b6:8:b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 27 Aug
 2025 13:30:40 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:510:4:cafe::f4) by PH0PR07CA0096.outlook.office365.com
 (2603:10b6:510:4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Wed,
 27 Aug 2025 13:30:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.0 via Frontend Transport; Wed, 27 Aug 2025 13:30:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 08:30:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 06:30:38 -0700
Received: from [10.71.195.192] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 08:30:36 -0500
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
X-Inumbo-ID: 0a6c7a67-834a-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jm6DPZWSj5x135IPaoLKOrmpP4keOju77pCMDNqU/L3ZC949wLWI05gx+Q828z4UAo69gJBibAfTTn0uZLgEvZedPBpTwJwLOEfgEsDZ7kycAkdbw0aoDA5L0ljzQjxQEIf2rrWYv0kZ0OeUY4J3pwAM/bwGCI4oDVWLhfyIbqoIbJN4i3kEv+4jXlYy1kufuG41cpIHRPLyEI7KPNh/Ean5gB0wPxXHtnUz1PE8Ndka6LjIjSKpr2Zd1NFM8o9OpYpqyM2Y1M9BCWr72Yt+MSJY3lAsIPUS4PORLOg3Z/JhM7AXIrxsgVFE38NusPzCx22+T0Cr8HeUMdQACIadqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vbf0In1LnKfwEYSPb8BqJXhdDpOjyfrFv4TtDjUmTjg=;
 b=bD+kw3edNGk/gKf/coqipUw26gY7EoWnD9x5tQxh2Yc9avhKH5/lRUns5cp/UFRhdfIwrgJloyPQzDUAz6iMAdQ2JMuGorzTdrOgkamv002xe0gg+N7aTFwo56RG1Grf311Z88rCYvSsO+j60OCQaLgmQ2AhF5xsvma9p1T6QLRIQVXdbS/jqfuhAvy1EuQY/SpBo2lG2YEXdZu6jnrLKqt60Zku5dqAZCEizfecMLA5IGDKQkOG2eLkvQxnT75cGF0br+XHzTl4LmiyxF0Pp9Dy9r1l83wYYXMFCDrB+JkRtOLI0nCAuvWlGA/m6d4/P2pXkz3X6tuij2qIlAPFFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vbf0In1LnKfwEYSPb8BqJXhdDpOjyfrFv4TtDjUmTjg=;
 b=h0kw99AT5HlGruJ9CEpNyKKIoD2lu0b/FbKQoEnwAzkOsVh6ywaFWK9XkbQw0b/czbPbilCLT0Hupp1yjq6xFCOT0N7SuTWaXWvrZ1OajP3Xmik1R1zQqDbTPZ7uY5eh1HE3Rfo7tIVVyWPHSrex8gjgppdgH9Zs8OEGN//bDiI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <70d3d5b3-68f7-4c4e-98df-f41176e58582@amd.com>
Date: Wed, 27 Aug 2025 14:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen/arm: map static memory on demand
To: Hari Limaye <Hari.Limaye@arm.com>, "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Luca
 Fancellu" <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Chen
	<Wei.Chen@arm.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <c85ac9d6da3c13dabd26627faac90ea95feb3f95.1753864612.git.hari.limaye@arm.com>
 <b12b9c9c-069c-4c45-adc6-5b7026f812f7@amd.com>
 <7EDCD060-4EC7-4727-B524-225A5FB7A0B7@arm.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <7EDCD060-4EC7-4727-B524-225A5FB7A0B7@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 8645c28e-76fb-4ee0-ebe8-08dde56de9f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzNTU292SXVQbW1YKzJPR2V1RHMyRXdCb01mM2xHZEYvdE5PdVpOUTRITDlo?=
 =?utf-8?B?THRnVVpza3JjOVRLZUJGbWY3YitZcmVZVEdpbFVONHQ4TXZlTEtja0E5eWxC?=
 =?utf-8?B?L2dtc3pYRGFBLzBuNW1PNmNkakFkUUlnNFQvQkVQZU0xVm9ZUFl3OHpGdnhW?=
 =?utf-8?B?TFpYNW4yTVBQUDhqeXIwam90QlpYZlhGeGhZUHNFdUJrRzNWaDlYYVpaTWd0?=
 =?utf-8?B?UFFGQW1jN2FlLzM2Y0ptOUR0eHJYbS9CbEdySUZjUVV4YmYvNGdsNmhJSHhw?=
 =?utf-8?B?SFZQdElKb01lRmxGb2dSMFhmdWkrR01LbDdCeGY1TG5qY0Q2cUFMd1YrbzJD?=
 =?utf-8?B?MDY0Um1aUlFjU0l1TzlQQjI1V1YxejdVMzN2WjhYUzBTR3hqNmxKMXF1YzlH?=
 =?utf-8?B?MnVDZm81ZW9DVGpLbXpXODBhMkZIRHBKWTE4VUdWZjBsSjJBdW1pRDQ4Y1BK?=
 =?utf-8?B?VHdBK0lkbkJtWnNMQmJ1YnJmcjNQbWFPTHBjZjY5TXduRDNvQW8zT2NxOXk3?=
 =?utf-8?B?SHJxS1hsWmhiMUhqYzV6RTJkOXdURTdpY3JmUGQreDRwNDBVaGVJRlhYemw4?=
 =?utf-8?B?VlZCMHhDY3gzRUhITUlqQmVhSkUvcHFNNDN1YU9WYXdYVFhHR3gwaTlNZm5m?=
 =?utf-8?B?VUZaZEYvVGlHVVh2UWZBa1UxUHMxUEJNbG1tNTVqQUdhMWdwM09UU3lVa0NX?=
 =?utf-8?B?NlhCZUtzMlNSdE02dUNMRnZWWjZVbGQ2T3MrVVlNZmx3eUw0ZkppdUVjb0Vr?=
 =?utf-8?B?MVpoQnpUbjl4aHEvUkc2QlZQdVFDT2lxMVZ2b2pNYUsyQ25mbzMxSnVZWndG?=
 =?utf-8?B?ZUxOR2UzREJ4L3RaQXcrcmhXbGR6dXZZODBVdCtadnB2TUlIZ0Y1aWpZQUw4?=
 =?utf-8?B?QXkwQ0F5UTZLZUNhNEkzbGVDNXd6eCtTZE9RNHRKUldhdTV1amZ6c2R0U0lS?=
 =?utf-8?B?ZjlwUnVRSnVIMW0rREc4S2FXQmtpWjB1K2RmVnZGU0dVNHhCU1d3R0o0em1B?=
 =?utf-8?B?Z1hHcmx0UlVzMFRWQmxkaVVuTnFaeXBDSmM5Y0FpM1FPbzB6aDJyNXdsTWxN?=
 =?utf-8?B?K3RaVDlXMEM2NzB4MVRJSHlsQ3JWNW5kbSt5Q0FxSW5meDZLbkxoOHU1ajNh?=
 =?utf-8?B?Z010dU15elJKU2h3cnV0TmlzcDZOdkFseDNEVGJiNFNJYS9VdFNhY1Eyb0Fv?=
 =?utf-8?B?elF4MERFMjBJMUhEaUlrZE5pRSsyd0tjbm4xUEhmRjBYVVhDdmZ1emJ0OCto?=
 =?utf-8?B?enBNbGRQU2VuRXg1Mmd2ODZvQ09iY3hreXJqKzBxR3FjTW04VFd3UFJBUDhW?=
 =?utf-8?B?Q3hZRC9NS0k5L3kvVWxLbjB1TGx2K1J4Z1d4S1UyWmRCK3kvMEtiaXNpTi9D?=
 =?utf-8?B?TjdWN3FremMvK053OGo5Ykc4OW5JU0dnV2tsUXh0T3cyWjRCbURoN3NTaHI0?=
 =?utf-8?B?akxlc2NwRS8yOU9SODVpaURENWgzc1NITGpBWi9ncWw1WWtJVkF3L1VEb29j?=
 =?utf-8?B?ZzhtN2haMWlRUjBBOWdmeUZ4NFJSRTErUXFmY1NjdHFZYWh0RThyeXhER3VU?=
 =?utf-8?B?d0dIdVpxd2VhNmpKekFWN0tTeWt2M1dpZzRrdy9CaFpTeHJQaUU5UGJqdVdw?=
 =?utf-8?B?MEVUby8xNXkxSlhPb25Ya1g5OHRnVE9BcnZIalhDUHhheXF5TkxKVmRaamxx?=
 =?utf-8?B?OHQzZGpKaUVFVnFVT25JSUZPQ0lSYU9BbEFCRTRucXh6V1RSZC9vRTQwRlBJ?=
 =?utf-8?B?K2Y4eU1rbVNUdTZ1NEJnTmgyckN6WlRzcU05c3o5eXNWZ0ZYVVVuQU5XYThQ?=
 =?utf-8?B?YWt2M3JvTlJlZlhENFJZNWl2Zm1vVVMvZTZhcnowS3pxRVl6ZERNREh1bUly?=
 =?utf-8?B?QjFMQkFzdURtaWU4a3M3RStaWllBTlpHN01HeENnOFVWcXZVeDBDYUM3OHUv?=
 =?utf-8?B?NXlZSHBxNnBsUmxNUHZMeFVNd0JZc1NMVERseVdIbHdiY09yUW9hS0lobFBq?=
 =?utf-8?B?UnlneVNuM3RpOFNQMDRPUi8rM1FVRkRIeHFyQ0lVbzB2NVlWalZoUGtVVmcx?=
 =?utf-8?Q?3oWedq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 13:30:39.4447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8645c28e-76fb-4ee0-ebe8-08dde56de9f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493


On 27/08/2025 13:31, Hari Limaye wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Hi Michal,
Hi Hari, Michal,
>
>> On 22 Aug 2025, at 08:50, Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 30/07/2025 10:45, Hari Limaye wrote:
>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>>
>>> In the function `init_staticmem_pages` we need to have mapped static
>>> memory banks for initialization. Unlike on an MMU system, we cannot map
>>> the entire RAM on an MPU system as we have a limited number of MPU
>>> memory regions. To solve this, transiently map the static memory banks
>>> for initialization.
>> How does this correspond to Arm32 MPU (R52), where all of the RAM will be
>> covered? I don't think 'transient' mappings will be needed there but all of your
>> work targets common (i.e. not only Arm64) MPU code.
>>
>> ~Michal
>>
> Hm fair point - when this series was submitted to the ML, I had no knowledge of the intention for all of the RAM to be mapped on Arm32 MPU systems and imagined that things would be more aligned here.
>
> Are happy for this to remain common for now? Or would you prefer it to be split off?

Let's split here between Arm_32 and Arm_64.

As discussed on Matrix, for Arm_32 we are mapping the entire static 
memory as a permanent MPU region. In light of Julien's comments and 
Alejandro's patch, I will revisit the approach in some time.
However, I don't want to create a dependency for this series.

We can realign later if needed. :)

- Ayan

>
> Many thanks,
> Hari

