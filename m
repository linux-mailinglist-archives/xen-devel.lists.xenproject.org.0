Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B897194E7EC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 09:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775382.1185600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdPag-0008S2-At; Mon, 12 Aug 2024 07:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775382.1185600; Mon, 12 Aug 2024 07:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdPag-0008QR-83; Mon, 12 Aug 2024 07:35:42 +0000
Received: by outflank-mailman (input) for mailman id 775382;
 Mon, 12 Aug 2024 07:35:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dTGf=PL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sdPae-0008QL-Ib
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 07:35:40 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20627.outbound.protection.outlook.com
 [2a01:111:f403:240a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7711cde0-587d-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 09:35:37 +0200 (CEST)
Received: from DS7PR03CA0025.namprd03.prod.outlook.com (2603:10b6:5:3b8::30)
 by SA1PR12MB6725.namprd12.prod.outlook.com (2603:10b6:806:254::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Mon, 12 Aug
 2024 07:35:33 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:5:3b8:cafe::88) by DS7PR03CA0025.outlook.office365.com
 (2603:10b6:5:3b8::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Mon, 12 Aug 2024 07:35:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 07:35:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 02:35:31 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 02:35:30 -0500
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
X-Inumbo-ID: 7711cde0-587d-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bj4m1oXr7MH0Fkg8tAHSUjdx3EE353dRbPJw7AIz8aNUf6IP5PuW2Kb9HulneR6JSRNfHF1GBWjEcYRIKxmHaLpyqXtM8LmpX6cGwvT+Gv7YwbrdfTzr7xq7mxJJfYzXirjyJebeNoNCM7h+DyJBYtlJPmqguyEWsvTOO/UKIXW7cxlff/X/YsT4uMgiKiq3V4GdgTaJJXxLD+vvC69fbRcfdi2LJ53O2vsAP58UQbncWllH6fVNuKS/EjEraMhUV5C0nMk2pmKtR+dWzXjoBLpJ2fiG5z053U5r92CbeAnCpkgvXy2emp6TDuV5XjZO/4m6SM7lqqt+U0sSJG5OOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmXqXIQcNe6nb7ai1cQ1cYGkGPs2Yvha26R08eg1O18=;
 b=DQ1hZ0f/sqX/mf8dO8Brc5a/6Ex/lQyGw/PXL19CiAGhspgwAzviNQ1Tn1qAmILfu3l+m0TSInxwlwqGo05rGjAqNYqwW3PnLiL1fLXETlqEvjEE+nb8uvessnqLlojjKxNIAEzXF582FJmkS43fhlYhI3kqD5lRya8FvA1w6/2y7riLfNN+Yqk/XpYsni3Gd3i+mLl47RkUm8OvrNuC8/XGxF5MiXzp1ulBCpojvSNn3hWHoQMCYAUWheIaNlaYwhISN3HVv/Hqj6SMwj9fp2ctCpRHwQCpuq+OO/U72apeXFadF8HlWnvvA/cx9Jyv+j5PWaQMS8DD7TJ2gSBFrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmXqXIQcNe6nb7ai1cQ1cYGkGPs2Yvha26R08eg1O18=;
 b=0yHCt7+loRbo/xGHD0PQqZgeYSuyNBL5v7kwLZPOyiUDX3F73kboEMOrrVlYJbPRnOpNucNPl+qeC5hFFOvyku+b/HdnhDOZp0SBzivebOgaS9dOyflpUbFqYvtqPVg7adSvIzmMKo5fMB5zC8QF3UcTktJv5ovE8gTJLmkHF1Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2baf9636-93f2-4f70-9e22-266002302d56@amd.com>
Date: Mon, 12 Aug 2024 09:35:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] automation: use expect to run QEMU
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <cardoe@cardoe.com>
References: <alpine.DEB.2.22.394.2408091700560.298534@ubuntu-linux-20-04-desktop>
 <20240810065920.415345-3-stefano.stabellini@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240810065920.415345-3-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|SA1PR12MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: ac907cea-ea8e-4121-4cb6-08dcbaa158ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXMvMERhY3FtRVJsWDdTRFN4WkJhUk90Skh2TDlzQWxMbXMwVmJXLytyR2RU?=
 =?utf-8?B?K0pjZUEycHh1RDV6b1d2YkF5NU1sWHFRZ0JEUW1NaWxPVWdTZjBhNEloRSti?=
 =?utf-8?B?T1ZoS1lVOEtRVkMzRVNxTVI2OXdkMUlzalBnczZqTncrQjZhQlJqVjh1Tm1P?=
 =?utf-8?B?K0NjNEtrbTIrY1VUcSs0VVpaVTRsSEpzMFovdnVtczV0SzlhdDZ4dHF4aEhQ?=
 =?utf-8?B?TmpCZklDQnpYbFk1RGxSOWhpYXJkQ2M5NXRNT2JiY2tqaWs3UWFrRmxXNnl3?=
 =?utf-8?B?akJIYmYwcFNiL0VTSytMTUJCZFdiTk15VmFEMGFCcmRxOEZBV054aktwVm8y?=
 =?utf-8?B?Ulk0Vmh3amU3Z2tsZ2NWemk2YjNxRFBkaW0xdXRodFZQRVJNcVZCYWRpR0dq?=
 =?utf-8?B?VHd2MnpSN3RHR2xPVC94VEkrL2FlbW9tNTArSjNnU3hJMzlEK0RZL3Biak5w?=
 =?utf-8?B?d2VRTXpIZVFNbUdZekJubk9YQjNqa0oxQUtGbTY0MFVFSkI3WXpETllZd0Iy?=
 =?utf-8?B?QndQRUpOM3EraFpFYVdxVmxQOHdtSFJRdU1kS25FWGNQcThGRHNqUzRJOUlw?=
 =?utf-8?B?MDJjYzVUdUFBL1NhYTMxZUNPcStqV1ZiYWFEcG15ZjJsNEZQSGhWcFhIQms5?=
 =?utf-8?B?cnZiYmRDbFFJOE5jZUtLY1N3WEFzYWN1SWIvQ1FQM2x4aTk4a05DVnNPUkxh?=
 =?utf-8?B?S2VYU0NtbDJkNG9TNmh4a0w3T0dLRzZHUnE2Y2ovNXZZbktCWnVaZjRHM1l6?=
 =?utf-8?B?U0N2ZnNESy9CSXNDZ0swRWl0alJUZlA1VUlsY2xobHRzc2QzWFpWd1h6RjVI?=
 =?utf-8?B?R0NlL09zWlA0VjhFYTI5T2V0MEpkK09jK2JYeHZBdmJRMU54VEltdDZ5R3dC?=
 =?utf-8?B?dXVCL2lvU3psY3JZMzdWK0dPa1paMHJ0bUNtNEZ3dFRwenJxQkNaeCswU29N?=
 =?utf-8?B?ZHFOQm5OeXlRQXlNb1ZNMWljcFYzSlR0UnZId3ZqQVZMek9rZ2V5U1Z3Wm1t?=
 =?utf-8?B?VFpYeVB4enJuZzc5UzFCc2h6MEFwWnJ6dktoZy9uRmdCVVN6WjlaeXNJYzcy?=
 =?utf-8?B?anJ3R3FIZzRQcW9kaVVnK3YvdXdtOSt0VytwSTh0Z1pBaERlaTd1UEZaZzNT?=
 =?utf-8?B?aGtQVkZvd1FwRGVJMTIvUzBZU2pzT1NBcVZldGpkN0srdW5WUGl5d0pRVFdP?=
 =?utf-8?B?NzByNHovVGxSSERpb3k2VW9jdzFuM1VGRU5CU2JBZ296alBNUm5vUCtEUy92?=
 =?utf-8?B?VUN1RkZiRkwzdUpVc2IzRGFFRWNHL0N5cjZpLzRqWG5nRklteE9xdzhjWGk2?=
 =?utf-8?B?S1htZ0E3SkM4dVdLQmg2U2NXUUhRMGZlbUpLREtBcklzVU93VDlaVHJuUFpP?=
 =?utf-8?B?WUFBZWlGeW85cWxDMGVab0lZaGtyUEgxNmorNStGTHNscC9lQ05IYjJneFNK?=
 =?utf-8?B?REh1MUFTMGl4RzMvdUk5NFNVS1lZamNWTSt4SmR6RGFRcjdRM0pGOExDeXZq?=
 =?utf-8?B?eHdwcnVKU2x1YUhPM29SaEtUaGNzcU5hRjJoVmkvVExYeFFFRUdPK2lEZDRn?=
 =?utf-8?B?NmdwWE1ndnI3eGRpb0NnS1VpS3ZROVlnOTVudFl4bUNYd3pRSERJZGpXU0lz?=
 =?utf-8?B?RmNaZmxaQkFTdmJROHBZYi9Bam9PcXp2cm1Rd29GZ2lZbk9qRlZpUjc5MWZU?=
 =?utf-8?B?TkdsQWUwZjJJLzRkY1M5OUVkenpabXBsVGRLWGZ4TWpTRGdjNGg1U0pCczRR?=
 =?utf-8?B?djZrenp5S00yS2dENDkrT21ESWx2SG5rRGZWUnlzSHM4Rk95bnZsTFZKV3d5?=
 =?utf-8?B?aFBIazUwNW1tWGE0UEdpSkx5WTJHRi85bTVxL2g1eGgvcFhGalZoUkVEY3V5?=
 =?utf-8?B?bUpueGlHMFFnZ0pPUHB5d1IybndZTThkZHJ0ZDUxa3lsSVYxNTlreVNRWEFZ?=
 =?utf-8?Q?/zLhqlqJtoy7g/eC4Gm/+qhT3YC3vuWr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 07:35:32.3676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac907cea-ea8e-4121-4cb6-08dcbaa158ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6725

Hi Stefano,

On 10/08/2024 08:59, Stefano Stabellini wrote:
> Use expect to invoke QEMU so that we can terminate the test as soon as
> we get the right string in the output instead of waiting until the
> final timeout.
This is a great improvement.

> 
> For timeout, instead of an hardcoding the value, use a Gitlab CI
> variable "QEMU_TIMEOUT" that can be changed depending on the latest
> status of the Gitlab CI runners.
What is the current value of QEMU_TIMEOUT? I don't see it being mentioned anywhere.
Could tests define this env var if needed? What would be the precedence then?
I'm thinking that some tests don't need a very big timeout that otherwise is necessary
for longer tests (e.g. xtf test does not need to wait 720s). 

> 
> Note that for simplicity in the case of dom0less test, the script only
> checks for the $passed string. That is because the dom0 prompt and the
> $passed string could happen in any order making it difficult to check
> with expect which checks for strings in a specific order.
I use expect in my local testing too and I search for both strings. More below.

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  automation/scripts/qemu-alpine-x86_64.sh      | 15 +++----
>  automation/scripts/qemu-key.ex                | 42 +++++++++++++++++++
>  automation/scripts/qemu-smoke-dom0-arm32.sh   | 15 ++++---
>  automation/scripts/qemu-smoke-dom0-arm64.sh   | 15 ++++---
>  .../scripts/qemu-smoke-dom0less-arm32.sh      | 14 +++----
>  .../scripts/qemu-smoke-dom0less-arm64.sh      | 14 +++----
>  automation/scripts/qemu-smoke-ppc64le.sh      | 12 +++---
>  automation/scripts/qemu-smoke-riscv64.sh      | 12 +++---
>  automation/scripts/qemu-smoke-x86-64.sh       | 14 +++----
>  automation/scripts/qemu-xtf-dom0less-arm64.sh | 14 +++----
>  10 files changed, 97 insertions(+), 70 deletions(-)
>  create mode 100755 automation/scripts/qemu-key.ex
> 
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 8e398dcea3..24b23a573c 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -77,18 +77,15 @@ EOF
>  # Run the test
>  rm -f smoke.serial
>  set +e
> -timeout -k 1 720 \
> -qemu-system-x86_64 \
> +export qemu_cmd="qemu-system-x86_64 \
Usually (even respected by analyze.sh) exported env variables are written in capital letters

>      -cpu qemu64,+svm \
>      -m 2G -smp 2 \
>      -monitor none -serial stdio \
>      -nographic \
>      -device virtio-net-pci,netdev=n0 \
> -    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& \
> -        # Remove carriage returns from the stdout output, as gitlab
> -        # interface chokes on them
> -        tee smoke.serial | sed 's/\r//'
> +    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0"
>  
> -set -e
> -(grep -q "Domain-0" smoke.serial && grep -q "BusyBox" smoke.serial) || exit 1
> -exit 0
> +export qemu_log="smoke.serial"
> +export log_msg="Domain-0"
> +export passed="BusyBox"
NIT: one empty line here for readability

> +./automation/scripts/qemu-key.ex
> diff --git a/automation/scripts/qemu-key.ex b/automation/scripts/qemu-key.ex
NIT: usually expect script have '.exp' extension.

> new file mode 100755
> index 0000000000..569ef2781f
> --- /dev/null
> +++ b/automation/scripts/qemu-key.ex
> @@ -0,0 +1,42 @@
> +#!/usr/bin/expect -f
> +
> +set timeout $env(QEMU_TIMEOUT)
> +
> +log_file -a $env(qemu_log)
> +
> +match_max 10000
> +
> +eval spawn $env(qemu_cmd)
> +
> +expect_after {
> +    -re "(.*)\r" {
> +        exp_continue
> +    }
> +    timeout {send_user "ERROR-Timeout!\n"; exit 1}
> +    eof {send_user "ERROR-EOF!\n"; exit 1}
> +}
> +
> +if {[info exists env(uboot_cmd)]} {
> +    expect "=>"
> +
> +    send "$env(uboot_cmd)\r"
> +}
> +
> +if {[info exists env(log_msg)]} {
> +    expect "$env(log_msg)"
> +}
> +
> +if {[info exists env(xen_cmd)]} {
> +    send "$env(xen_cmd)\r"
> +}
Does not seem to be used at all. For now, I'd suggest to drop it.

> +
> +if {[info exists env(passed)]} {
> +    expect {
> +        "$env(passed)" {
> +            exit 0
> +        }
> +    }
> +}
As said above, in my local testing, I search for both strings (after all we should test that dom0 works too) as follows:

if {[info exists env(dom0_passed)] && [info exists env(domu_passed)]} {
    expect {
        "$env(dom0_passed)" {
            expect "$env(domu_passed)"
            exit 0
        }
        "$env(domu_passed)" {
            expect "$env(dom0_passed)"
            exit 0
        }
    }
}

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

