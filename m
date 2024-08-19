Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CB8956477
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 09:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779334.1189080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfwhs-00058Q-4C; Mon, 19 Aug 2024 07:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779334.1189080; Mon, 19 Aug 2024 07:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfwhs-00056F-1I; Mon, 19 Aug 2024 07:21:36 +0000
Received: by outflank-mailman (input) for mailman id 779334;
 Mon, 19 Aug 2024 07:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GkhL=PS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sfwhq-000569-9G
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 07:21:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20613.outbound.protection.outlook.com
 [2a01:111:f403:2415::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a89d0883-5dfb-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 09:21:32 +0200 (CEST)
Received: from MW4PR03CA0173.namprd03.prod.outlook.com (2603:10b6:303:8d::28)
 by DS0PR12MB7512.namprd12.prod.outlook.com (2603:10b6:8:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 07:21:27 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:303:8d:cafe::15) by MW4PR03CA0173.outlook.office365.com
 (2603:10b6:303:8d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20 via Frontend
 Transport; Mon, 19 Aug 2024 07:21:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 07:21:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 02:21:24 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 02:21:23 -0500
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
X-Inumbo-ID: a89d0883-5dfb-11ef-a506-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOPwQKYM5Y+KF1jwzZVmWt9fc88W7sgr0KSzowFu0vQcH14f3yIfaIHOaiBfdB9GTkcEMHvwiGsG9BOrkLW6/VOl0qKfolfPGHBZV+E1LFhN1FpzTIwCHJrRHAwuGTDP9Nyxt87+5tx1BCC0ScOgtc42Cdm+BEkGb3YbgJlkmvokP0xh98f3EIRo+Mfp0GWkpmLSuAqJSfoe1trzcIKTSqlTJGSSw4VwqsqxOJvJly4JfykNx04e//87BKZ0D1h4/Td7uQgrbdreI5nF1jAKyoUdCu9Ot+C4tzigGXK54Ok1hGDPZ99NVSTIU80f/CQ/fqYG7yV3tRJpiVwORY8s6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owSHQt++GDUIzcfbaQOyKqgXTC8RTfyyNb8huWdpvrc=;
 b=mZSeO2MHHSDK68Cuo5Rbt6Po9Aax6+8OIrN9K0eV1Mi1cCmNFhNiNABZ9SRbIotuRrX799ntScaRPMGCWpY1sVDc3L2ShBVlOOoVwpKWpYR32oHMg3pAL+SYjm30UQGpVwaDXfA2A1mCjA6Fy9FjD0xRmxxMcWsFeHE/PPvAP52+PnWzyXZ4uXiO89Lf5BpY/Gx889usttaB85rskMeMdRt7ECbZy29dg51Ynq/Q1kvmSAMt9qt3emulJl1FytlyuLJvW0WQOExFzm/CkOWci68Ubrnv/nong2FYM95AjlRsfQo1oeIi2wtAUwNBdKp689eZj3JkDAVf85KuSHyQnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owSHQt++GDUIzcfbaQOyKqgXTC8RTfyyNb8huWdpvrc=;
 b=uZ7cnPGFCs1DVfm/gRzrWFwQ8VpXtTzWuruDTXOCU0GDJr/9sHSIODdiBzyDnolGv+utTVcnXmFBxOU93/qYi77pyncmKgfrLrumQvpdisP8JjB7/ap4TN14kXYcZcdQdjC3jowci2SpsfSbDqJPEXbYfUOwqh1rLfNY3ODDb+g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6d2fbe22-8866-4769-95d0-a5a8613a5936@amd.com>
Date: Mon, 19 Aug 2024 09:21:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: restore CR filtering
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
References: <alpine.DEB.2.22.394.2408161642220.298534@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2408161642220.298534@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|DS0PR12MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 96df61d8-bfac-4bd2-c0ae-08dcc01f89df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXZEV1VkTmRON2pQamhJSk80ZUYydEFaK0FhSnVFaVJ0Z096ZVBYaG5OY1NJ?=
 =?utf-8?B?Nkc4VG13WUd4YTBBWTI5b1NDbzNoaUhYS1VpYVBGM2FERmYyNHZlbjUyRk5Z?=
 =?utf-8?B?S3hnTm5TNXljcGVhbUdyUmVnaVdvemI0aW9OQTN3RXBraERCVnBUcFpFMGZl?=
 =?utf-8?B?ZHNnMzR6RTRoZ0xBams1ZWdBQ3czcnA0NXFGeXYvTkZuMTBWd0dQY0kzSUpS?=
 =?utf-8?B?cWdOSlFhSTNCeFRhNGpkcXFOWm5tK2RwMVlSUG9CdlQrUjExaWJJZW15U240?=
 =?utf-8?B?ZXVKaG5yUFUwYUdEWkVPbEwxTXpHb0EwNFNGT0pMOXBvRGJZbWxYM2lSODJv?=
 =?utf-8?B?aHh5b0t6UnBRV2w0RjlWMFN6clVKb3cvVmUvSmVhSkhWYVFFM3J1UTcyQkJx?=
 =?utf-8?B?SFdSQ1ZRWEpEQUc4ZGc3amZIdUM1bnhKM0xVbGVvRzAvR0V2U1BBMFhoQTN4?=
 =?utf-8?B?OWRwc0dZVnN6ZXpKS2NsdEJBT3hqeVQxcVpGWXFsaTNZRnEzTTdIc2hzSWRP?=
 =?utf-8?B?SGlCdmdQYk9YZ05QNVFlNDlBWU56NkRyRklrWHlSald2aHQ3amZKaUs5YTkr?=
 =?utf-8?B?R0t2bVNvQXJjR0puQTdFUWlUVHoxbVFjeWNhTEdMYWg4dXYwZDJIVExJSWFL?=
 =?utf-8?B?VTFRak5PeC96YTRSNkpvc1VCcGwxY3JJNDJ1UmhySlhhRGFOVEFsMDEyNkpG?=
 =?utf-8?B?cm5RWU1qL0pxei9MT3FMTFh2SGRhZnkyL3psdGJBdVhkYkNMdEx5Qm9VSnVV?=
 =?utf-8?B?dlcya2pQL0FLY0FGd3J1VHkraGtDVUdtSHIrMVFSV2VSKzFRaWhjTVRtMFlU?=
 =?utf-8?B?WUg0QUpwSE9VYVNKQXdqNHRuTEVEV2ZIZTl5eHJDd1k0Y0tvNG14UzU1QXpN?=
 =?utf-8?B?OHFhb2swTlA4UnRocGd1VUNHaDJyMVZleWY1YjlmbjdiNUhaRXVHUjYwemEv?=
 =?utf-8?B?NkRsUUFraHVySWpiS01QZGw5TGZnQklLS3NkZXF2alRLN2liOTIyQlVMQlAv?=
 =?utf-8?B?TUhIV3JxcCtIMys0a2h2RHMrOTJzTWo0QnJjaUVwc3BTamh4UVJTOHBzR0Jr?=
 =?utf-8?B?dyttcWdjTGRmT0IyK1BzNzRTRmg4YWozWWs5eDJDZko3L2poTjRCVGhmb3hJ?=
 =?utf-8?B?d3pNK1NqSElBc3ZrckxscWlvdCtqN0ZLdDVRSFkwU0pXS2xVR0lOT0xacnZw?=
 =?utf-8?B?MGo0RjFNOEtXMmdFaEVTTEhGTlNBQlNhWXpxY0lKNWF5Z3pyeWdqTGduUENI?=
 =?utf-8?B?TXIzcGp5OCtRQ05VbHVxc2RrUGx5THpDM2pRdXhiMW5uN2xvWUExUEtjendR?=
 =?utf-8?B?UFM2TlE2RnV6ejhKV05ET3hTTXRZYmlIaEgyeGJScTZPcGNxcE1rb1pzeFlL?=
 =?utf-8?B?UGRydW1KUlp2OFBqSTd6VlRPNXFKaUNPNkV2RWZJaDRkckl4a2lwMkRGcUt1?=
 =?utf-8?B?UG5uSjB6cW45U1B2Q05aVXdsRHcvWkZ5a2V3TmNDeHdmYThPRlBQa1c5YU9S?=
 =?utf-8?B?eHRUVW1tdGgwTk1JOVdCS3Y2L3JsSHRBZzBBZXAvOU82UGxLRXkzclVPUTBX?=
 =?utf-8?B?d2hHRnlOSi83WWIyTXRQZktxMVp6bFhKOGlIaldrOUxRdllDZXlZTUJNVTk2?=
 =?utf-8?B?U1YvcTlsSThnR0lzSmp3SXlUT01sR3FZU0hRQkxlL2dxRUNLaXQ0OHVyTlNU?=
 =?utf-8?B?ZnNWd0JJZXZldWQ3Y25xSERZd2t5TXc3Zm45WEJNZkR2cUtteTlNMWtKc3Vq?=
 =?utf-8?B?ejZGTVhGcVhwR2c2bnZDdWlMNUdhNlpBRG16dk12ekM1bThDUHdPUUxocjVW?=
 =?utf-8?B?MnNIT2xhQ3ZzRmg5dTVMdWI2ajZGUFcxRDZUTyt3N3RVZVZqVjhiQjNXK2xq?=
 =?utf-8?B?Z1V1dXNPQ2FnVU1PU0hTQ1V2QUVZUlFHbWlmUnRadkQzR0M4N2JuRHhRQnpy?=
 =?utf-8?B?ZitzV0ZXOGR4T2NVOFFTV3NsTmU5YWJicUlQSHE1NXZETlpxaEZtLzlZZTMw?=
 =?utf-8?B?Wjk2UVRLZzFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 07:21:26.8023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96df61d8-bfac-4bd2-c0ae-08dcc01f89df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7512

Hi Stefano,

On 17/08/2024 01:46, Stefano Stabellini wrote:
> 
> 
> After commit c36efb7fcea6 ("automation: use expect to run QEMU") we lost
> the \r filtering introduced by b576497e3b7d ("automation: remove CR
> characters from serial output"). This patch reintroduced it.
> 
> Fixes: c36efb7fcea6 ("automation: use expect to run QEMU")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 5359e0820b..343b71d5ac 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -89,4 +89,4 @@ export QEMU_LOG="smoke.serial"
>  export LOG_MSG="Domain-0"
>  export PASSED="BusyBox"
> 
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r//'
> diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
> index bbdcb39f1a..a3ccbbd7f4 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
> @@ -96,4 +96,4 @@ export QEMU_LOG="${serial_log}"
>  export LOG_MSG="Domain-0"
>  export PASSED="/ #"
> 
> -../automation/scripts/qemu-key.exp
> +../automation/scripts/qemu-key.exp | sed 's/\r//'
> diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
> index 0094bfc8e1..a781022d48 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
> @@ -109,4 +109,4 @@ export QEMU_LOG="smoke.serial"
>  export LOG_MSG="Domain-0"
>  export PASSED="BusyBox"
> 
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r//'
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> index 68ffbabdb8..3c32a676ff 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -149,4 +149,4 @@ export QEMU_LOG="${serial_log}"
>  export LOG_MSG="${dom0_prompt}"
>  export PASSED="${passed}"
> 
> -../automation/scripts/qemu-key.exp
> +../automation/scripts/qemu-key.exp | sed 's/\r//'
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index eb25c4af4b..a13bd8ee04 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -220,4 +220,4 @@ export QEMU_LOG="smoke.serial"
>  export LOG_MSG="Welcome to Alpine Linux"
>  export PASSED="${passed}"
> 
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r//'
> diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
> index ccb4a576f4..3c02771914 100755
> --- a/automation/scripts/qemu-smoke-ppc64le.sh
> +++ b/automation/scripts/qemu-smoke-ppc64le.sh
> @@ -25,4 +25,4 @@ export QEMU_CMD="qemu-system-ppc64 \
>  export QEMU_LOG="${serial_log}"
>  export PASSED="Hello, ppc64le!"
> 
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r//'
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> index 0355c075b7..7ede5a5d8a 100755
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -16,4 +16,4 @@ export QEMU_CMD="qemu-system-riscv64 \
>  export QEMU_LOG="smoke.serial"
>  export PASSED="All set up"
> 
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r//'
> diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
> index 37ac10e068..81e7dba329 100755
> --- a/automation/scripts/qemu-smoke-x86-64.sh
> +++ b/automation/scripts/qemu-smoke-x86-64.sh
> @@ -24,4 +24,4 @@ export QEMU_CMD="qemu-system-x86_64 -nographic -kernel binaries/xen \
>  export QEMU_LOG="smoke.serial"
>  export PASSED="Test result: SUCCESS"
> 
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r//'
> diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> index 0666f6363e..ed44aab0f0 100755
> --- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> @@ -65,4 +65,4 @@ export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x4000000
>  export QEMU_LOG="smoke.serial"
>  export PASSED="${passed}"
> 
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r//'

I compared 3 pipelines:
1) one before c36efb7fcea6 (https://gitlab.com/xen-project/hardware/xen/-/jobs/7566986885)
2) one after c36efb7fcea6 (https://gitlab.com/xen-project/hardware/xen/-/jobs/7603830706)
3) one with this fix (https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7603783403)

In 1), there is Xen log + Linux log in Gitlab web page
In 2), there is no log at all
In 3), there is only Xen log visible

I think we should aim at restoring the original behavior i.e. all logs visible.

~Michal

