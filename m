Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95F992CBDC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 09:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756576.1165237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRRfe-0006Kn-ST; Wed, 10 Jul 2024 07:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756576.1165237; Wed, 10 Jul 2024 07:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRRfe-0006Hl-PT; Wed, 10 Jul 2024 07:23:22 +0000
Received: by outflank-mailman (input) for mailman id 756576;
 Wed, 10 Jul 2024 07:23:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=drOD=OK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sRRfd-0006Hf-5D
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 07:23:21 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:200a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 467fe8e1-3e8d-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 09:23:18 +0200 (CEST)
Received: from BLAPR05CA0024.namprd05.prod.outlook.com (2603:10b6:208:36e::20)
 by IA1PR12MB6258.namprd12.prod.outlook.com (2603:10b6:208:3e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 07:22:57 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::e2) by BLAPR05CA0024.outlook.office365.com
 (2603:10b6:208:36e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20 via Frontend
 Transport; Wed, 10 Jul 2024 07:22:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Wed, 10 Jul 2024 07:22:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 02:22:56 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 10 Jul 2024 02:22:55 -0500
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
X-Inumbo-ID: 467fe8e1-3e8d-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvN2wlHJwtD8jA70mobvNySEWUrUWKZ4aq/Tc0kVKgsLkl0Ypc1Sfk2WxvUW8zB2SIs4KWxVw/qtHnLAUJbyiiraulf7dujlUHhuGBhS/VcOwMP6f+GGEvArTP/RUlxDH9c+OXidNGK4/7a7c5gBa8WXN9TcuxrZZP+e7AH6kkeOJ7GJlAqzgddzcBbqk7DqJVMZWI5H8Qxv/BE7wnpRxO5IA/a6zMmQyoEME4MHoGTOIS50uLheL3zKDL/j9eq+s6Nmd9X4GXG1G2j8HUrw4vv8J505j1gkfAPgebclHxuoyiz3nI0Uol7IX2JrIvrbIg9mDhr1FxE3VKiUkAQmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fV38g6OJ/LHAbKa9O9ZMenMXM2d9knXiLnM1Snj1FLM=;
 b=bww07vMe7BfPETJJJeHU4SGUfxMgfEn4D18s39H5Os7U8wuVqZJlffuSkLabfCO48nS3PgOps0kokfdnIqqlD1GF0vrRHdJK5dMAtLzBiwBWQYheMs5m3/9Kz7ZaUR5uaSz1boRaN5mLKoCFIuGYfZ/MHlHdeqVesFdbplDVbW4j3zOvlz91dQSETAD4vzfiX6V5SHpgbRgnQoDY+X0J4ioMbHCadxJ5dDfdxaw07mgGvyhqzgYDkPL6ymY4xSEtrgu11tKMCwayELsCEL0EVnvM2NFt6HwD6WLqfg/nnVpf/5gTLkEJboIWDN6ps5vkPHFCfJQu2Uto9wr3lpug+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fV38g6OJ/LHAbKa9O9ZMenMXM2d9knXiLnM1Snj1FLM=;
 b=2ysu8Mujxin12xhdcgw87ow9K/AiXqQF8fUPHmtIbdcgRwM/89VCYtljo96orquSHD3lgsreQSveYa2rAgGyAwLiiE7GV120C0E2WBkH5UgSkEt1S2fjgftpLscBgHeeEX5km3E8JgCrnouO1pOiP4DiERNWImAuyQo2+J21ANY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <833ec798-5bd6-4bf9-bd68-21cae52359d3@amd.com>
Date: Wed, 10 Jul 2024 09:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] automation: Use a different ImageBuilder
 repository URL
To: Stefano Stabellini <sstabellini@kernel.org>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20240709122117.48051-1-michal.orzel@amd.com>
 <D2L0YQOMMQ3G.GLD8N5NQ50JS@cloud.com>
 <alpine.DEB.2.22.394.2407091645320.3635@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2407091645320.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|IA1PR12MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 19cb9fac-ff3b-4777-e901-08dca0b11f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TW82clpWWEZ2NmNZSjUyZ3BjYXcwUnhoQURtS1RtTXltdEFzL0hzNkhzRHV6?=
 =?utf-8?B?TFo5V1NYUUIyZjVnU1BCWVpYS1d5V0N4bmpqWjZzSVE1K0FmTjZuWlQxYlB1?=
 =?utf-8?B?TnZEUTljeHRnd0RjRjB3ZHdpMW43VldNWEdSYkNDTXpORlpKQngwNnpPTCt6?=
 =?utf-8?B?RDVKc2tTKytRaWpOcm5hcHgwU1JvRmlTOTFhRzRqQmZLazZ3aU5UQlgrcW9o?=
 =?utf-8?B?c0Y4Vy93ODhHYkR0VjhveUFSenBiY1luM0JnZ05DQ3psTHhCTmRiSmpkUVFa?=
 =?utf-8?B?RlBTQ24wejhZZXRvMFVSTWxOR0kraHNEVHo2bEVFdkREME51cjFNR0VGSVJI?=
 =?utf-8?B?c1c0WGtpdzlDWnFESjRKUlMzRTY0TTBHOS9kNFBFRXpqZXlKaGVOVXdTY2g3?=
 =?utf-8?B?ZE9RSUZxRDRUQTRSd3MvZUMzSVNaSHhlK0pWM21iQ08zVUZWZ29veHNhdm9D?=
 =?utf-8?B?MFI3VEdGRENTVER2WWlJZ2gwQUUzUVVGUzVqaVJOSUxpZmVJUEcvdnVGNG54?=
 =?utf-8?B?SERYMyt4TnFHOXZ0MmlLL3k0S1lBTS9QMlpCa1BaRVpRSytpb2hEMndsdUVZ?=
 =?utf-8?B?UjlFMllYWXVjL2FLb0xaRGxyTTNuWEpqNndDVUE1YkhqZnRYUFYwK1I3d0NB?=
 =?utf-8?B?RDZHUWJWbTk0VUxKZGtabHVXZ2xySjdRTVp1dDdSODhrczdwemxiZ1VYWGds?=
 =?utf-8?B?aWpUZTZTWGJzcGtxazExNDRoR0M4VUIyVHZwZG9VTTVWUTQvQ2k5ZTRQQktW?=
 =?utf-8?B?SDlxWFEvYUtVTDh1VjZQNGlyY0U0R2tZdXRFdTh5bmp5Um5KWFR6REdDSGlZ?=
 =?utf-8?B?MTNRSGZvWnYzL3l4QWlkZUFEbWN1dzU2ODhlek9sbVNrSHh5dWVDMjZVY3kr?=
 =?utf-8?B?UXdKY2g3Z1dQTHM5dmtaWnhFdlJwSHFhclVpR1hRWDZGOWhPUHI2REMrOUdw?=
 =?utf-8?B?VWpYMHk5Q1RIelVaNEw3eTNseWxVRnpjSlhuRCtXRjltL2RNcCtQdHRKYkRr?=
 =?utf-8?B?S3ZzdzZpMDZ4SVFxOVhpeDUyL0JEckdVek42UitNY01EYWczcDRaRm5ybW5E?=
 =?utf-8?B?ZDRvL2VJZlV1K3ZzVVZ5cHhKaW9aU2NiVG41Z0RUS25NY2JNYnU4ay9EZlg5?=
 =?utf-8?B?MlRteWNVMXNsZEN3RzB0NHFVcGVwVDdhZ2ZpMkpEdFZ1dW9lR0UwZnlhZVNy?=
 =?utf-8?B?LzlCblRCWGRJQTZpeXhxWWIwZnFHVEN5ejlqemhMYkxpVi8yTmFDaWxFdWZo?=
 =?utf-8?B?c3hxQWkzbGFLU08vWWcvd05MOUFKMXVzOEhuVEU5K3dnUlJjSjYrbkpwSFNU?=
 =?utf-8?B?UWRjVFNmMWhZQUkxUkt2djV5S0ZwSjI0ZlFmRmZ2eVM3b3UrL0w4VjhyR2xh?=
 =?utf-8?B?aFpBYUlwd1U2VCtQdmI4U1h4cVptOTMyTXFqeFJLQUNyWmt3cXNZSCswbnYx?=
 =?utf-8?B?YnJscGxtS1RkOEVZSjBPSXA3aVJ3YTNEaGpvMGllR1gyQWc1dzRuRUo2UGRo?=
 =?utf-8?B?bkZkcjZjY0I1Q1FWNGNoTXArQWdPNXNyZW9rNTVKT29PQWpsSTdqVDl3VjdK?=
 =?utf-8?B?YldVVWNDVm5aZEJ6L2QvRUFmazZjK21ncW1uVEJqUnQxZ2pkUkRLcWlybUpT?=
 =?utf-8?B?MmNIdllPTVlTVXhqeC9lWWthUmdlcVphMkV3R0dlVzlSc3NONnp0NmkyWUph?=
 =?utf-8?B?UUZvcnhOT3VMbTNwRW5LREVFU20zZEN1VHZzbUpZODNKemsycVdYNDFWM1No?=
 =?utf-8?B?L09NalRMS1NHSmtzeUdkUEVXZzZjVnpRWFRZUjFKeVlmM3hmK0pyWnkrckpq?=
 =?utf-8?B?SXVZeTRhRnFoKzF2cFpxMXFTeE1jS3RmYkNCTDBPbGd5VWY0ejBoaDVWWkFX?=
 =?utf-8?B?aTBpdXhsKzArdnVUVlBhN2ZWZXB6REQwYlFhMnpWelpyT3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 07:22:57.0040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cb9fac-ff3b-4777-e901-08dca0b11f13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6258



On 10/07/2024 01:46, Stefano Stabellini wrote:
> 
> 
> On Tue, 9 Jul 2024, Alejandro Vallejo wrote:
>> On Tue Jul 9, 2024 at 1:21 PM BST, Michal Orzel wrote:
>>> Switch to using https://gitlab.com/xen-project/imagebuilder.git which
>>> should be considered official ImageBuilder repo.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>>  automation/scripts/qemu-smoke-dom0-arm32.sh       | 2 +-
>>>  automation/scripts/qemu-smoke-dom0-arm64.sh       | 2 +-
>>>  automation/scripts/qemu-smoke-dom0less-arm32.sh   | 2 +-
>>>  automation/scripts/qemu-smoke-dom0less-arm64.sh   | 2 +-
>>>  automation/scripts/qemu-xtf-dom0less-arm64.sh     | 2 +-
>>>  automation/scripts/xilinx-smoke-dom0less-arm64.sh | 2 +-
>>>  6 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
>>> index d91648905669..5b62e3f691f1 100755
>>> --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
>>> +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
>>> @@ -73,7 +73,7 @@ UBOOT_SOURCE="boot.source"
>>>  UBOOT_SCRIPT="boot.scr"' > config
>>>
>>>  rm -rf imagebuilder
>>> -git clone https://gitlab.com/ViryaOS/imagebuilder
>>> +git clone https://gitlab.com/xen-project/imagebuilder.git
>>
>> For this clone and all others:
>>
>> You probably want "git clone --depth 1 <url>" to pull the tip of the repo and
>> not its history.
> 
> That's a good idea. You can add my
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Ok, I'll send a v2.

~Michal

