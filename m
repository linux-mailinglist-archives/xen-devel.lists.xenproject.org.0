Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B1E94FE20
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 08:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775971.1186125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdlQj-0001Ml-Gp; Tue, 13 Aug 2024 06:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775971.1186125; Tue, 13 Aug 2024 06:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdlQj-0001K8-DH; Tue, 13 Aug 2024 06:54:53 +0000
Received: by outflank-mailman (input) for mailman id 775971;
 Tue, 13 Aug 2024 06:54:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nDAI=PM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sdlQh-0001K2-TB
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 06:54:51 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2412::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeb3f70a-5940-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 08:54:49 +0200 (CEST)
Received: from BN8PR16CA0015.namprd16.prod.outlook.com (2603:10b6:408:4c::28)
 by CH3PR12MB7594.namprd12.prod.outlook.com (2603:10b6:610:140::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 06:54:44 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:408:4c:cafe::c4) by BN8PR16CA0015.outlook.office365.com
 (2603:10b6:408:4c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Tue, 13 Aug 2024 06:54:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 13 Aug 2024 06:54:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 01:54:43 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 13 Aug 2024 01:54:41 -0500
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
X-Inumbo-ID: eeb3f70a-5940-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/nn03kclu5uom/r2nQ9RSzQ/dk38p3+fo5C4CzkYwk86/JAQyFwufFwmaPILD+DXmonBaIJDiM26a3VNyBfX4zQ5V/stlldHFeZJ16pH0Rlx8CjyVC0+WM76ezbaNM6n23sM8jSYfQfcPmpNY9B2u8PBHHc+fUieqlCsHNUJ1oRcwiTF2U4d7NmKnvlwrgwVhE8rqUhifT6A9MUx1s7dCZLBzrl/47UVwqv0wQ9nAUt6/fC2/a1Abbh6LKLuF+MWx3hagowxy04XafCe9FlySCyajro0TwHIDE/WMzu5X6vUgvPMNO0ONMsCJnMKOfpGpVno4sqdZT/Z8O+ad4zXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gEYzC4p7lmbhOVOKCWSfZsWmeQH6WoFt/UELB7HY/U=;
 b=exU3PDNqHkJfiC07XaZJV/HgJ/hxPO2+5WC4XwsilFmoRrSaEwcJ9Zj+hzVTJQ36nqXrCo/WdIELTR/XIArdVptxdDCxRQAUIZIoJJpJc5om++VHjeIa6QDbJBJlpFRtubuePVkXqNMj7RUsv1crg36FKoz9XqNBWDgY0riE1CzNnMyASZYv7f8X77d9h4Ey/0xZ+HNexvWIqHYs6wnNolZlUNNjtQSglpwYPasX/QBhPoBIrJ0NGOYnrVVwzlMbX7AwoLEVD9DIhgw2qnuRipLYCHSsQBlVJdkTc+nxu98LgW7azVsO5JfFQ6nS56yGE8E/B8xJuib/DZFHK99yOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gEYzC4p7lmbhOVOKCWSfZsWmeQH6WoFt/UELB7HY/U=;
 b=FHVy6Zk8uvT62SK0Ay9DpwLeacK2mncCUlb5g1JIfmTkpMtOXn+Zj4l4QAdpqWyd88W+P42/WtO39J11U+Pr0l0vhABVfOxLc/hzJIGZyR7CVsnXp+bCbUDnlFvSFtn7XjAkNAUiWG13qnFkb0ME8ZwEgkHTwVFmsJ1wDLIh3CY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6742a2b7-e987-4171-aff0-37f29159636e@amd.com>
Date: Tue, 13 Aug 2024 08:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] automation: use expect to run QEMU
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <cardoe@cardoe.com>
References: <20240813022153.1246072-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240813022153.1246072-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|CH3PR12MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a647d1-a91b-4bf0-eac2-08dcbb64cfe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1BpR0pqQXlZODVpcTlQMnJQcXl6SG5idm01Wi9sa1dUbm5MM2N4YllvV2p5?=
 =?utf-8?B?WG5FOXNHc09CRVkwVVdWbXU3SFBBZGhqSnQxVGJnYkYvU2J4dnVXTk9HQTN0?=
 =?utf-8?B?bGJpOFBmdkIyK1dmQUJaRlVaenZmUWZQWmFIeC9WMTdqWTF6bkxBQ2JYZkxZ?=
 =?utf-8?B?THRHTC8zejE0dTczM0J6K3BRc1lxYUhrZFcyRUNYY0doU3VIcnE3TnQ3VGJM?=
 =?utf-8?B?bWc4SVRGWU9qQ1paMERyNDJwbkdKOUxjNnRKbU41U1lNb3puQkhzWkRNSGZr?=
 =?utf-8?B?MjZCTk1YL2J4a05lSGNqbkxFSGJGdWVDV3NmVmtZWWF4RWZENEFLRmNUSTNN?=
 =?utf-8?B?ZFFEQWNPL2ZQcENkV0h1emhRZGl1ZWJha2dLRmIxblJ1bVNLZVNDWDAxV1NU?=
 =?utf-8?B?NmpGc3pObFAzNnZPbnFPODE3b0dwVGl4TDZpaTNUcWxGRjhBQWNJeG5ua1J2?=
 =?utf-8?B?Rjl1MWVUbXdJQ0dzd3lYMi9uV0hJWTdBZW4wNzdKcmhJU2VjUzNmaG1NbEQw?=
 =?utf-8?B?ODlGYmQ5MHdpWDdPUnBuaGZOdXRvZUs3YzQ5SHZrWFR1M09LbVgvZVlRamwz?=
 =?utf-8?B?cm1keWxtQWFHejFERHpOK05UWk5JemVOMVIxUTArZHVzUmtQL2xCcUlvSFJj?=
 =?utf-8?B?d3Nhc3VxNFgzcGtEOFRQV3h6d2c2bkJmN0dYVWEzUXpaelRKeW1ZdTNMR1Bl?=
 =?utf-8?B?S0t1anVLL0o5RmpUU2g2RG8yMWFMMSt1SmJCaytjQjJOR0hlODBzZ0hsVzRN?=
 =?utf-8?B?V1hqMU80YnFSZFBJV1pyQnNtNkdmYTEydGY2NjVVVThUa1JOcnpZQlBhc1lF?=
 =?utf-8?B?YmRXT0xjNlJER3I3dnJTSisvWGNuNHRwQ1BZRGpvR1pOc0d5TkZNUmpHK0FW?=
 =?utf-8?B?akQ4aG1wZ2VwZVpOS2NCMVJzTVUwZ2JILzEwb3d0MWJENnMrNzFGUnNiK2lx?=
 =?utf-8?B?T0R2c2NWU3R6MzlscEU2RDRCSVRTZ254Mk9ReS9NejBNbWJtY1dTM3lWYTV0?=
 =?utf-8?B?dndpZVVwUjdHYXltZ0docDZtOG5rTXRTRjZXVDdaSk5XL0RET1o3WGtuaFIx?=
 =?utf-8?B?akpvWm9Ua0NIdlRWNEFGWThFbjU0RnZxMXN5VjBmcWR6dVptZUVMWFhodFZq?=
 =?utf-8?B?ckpQTHE4aWFFSEc2a3dnQUN0VUpDVVlrY1FaNk5zV25pZndRaFYxeDdCVUFK?=
 =?utf-8?B?ZGx6aDJ1SUZ3Zm44MG9NblErWTF5VGtJNElFdnNBUnRzNzVYb3FLZUtSZGhU?=
 =?utf-8?B?RHBBcmhYUURZYUE2MndvZDlTNTVVQU1ZcytuTEEvZmZQTktsa05SMUlGZzVG?=
 =?utf-8?B?UkwyZEVHYkp0cVdiOUJZeTZMOXpIbXljK1M2bWZQdTFIY1ZvNjl4bEU5V3Ry?=
 =?utf-8?B?NkxxeGJKQlhuRXoxZWhPRVdCaU1HMk1ZMlRsQ1JvMERweHBRNGVTZSsrY1Uz?=
 =?utf-8?B?cHVvSjNocmUzejFTU0hiU2VGeTNRbnJoREkxdXQ4cktsdDQzR2VGSnZNalBa?=
 =?utf-8?B?Zit6SXBQMU40TEFQbGNxVlA0bnlvd1FUaFkwRy9taXZIM1VsWk1mb2dIVkZQ?=
 =?utf-8?B?WkZOU0tUK2xRaTJZRUR5R0xiNzVaSHBKbEZHRjRrbmZsUWpibjRabTJGbHRr?=
 =?utf-8?B?ZS9SSVh3b2s3WnVaK2U3bVZCQ3JKb3NJKy9tYUxOaklpWG45dUJjRXNtVEtK?=
 =?utf-8?B?enRhR2gzOTRqSVFRT2dWT2pyS3RhZFZRL1UyM2V0WitxSDI0VGRQekNLYW5X?=
 =?utf-8?B?ZVJBYkxqQ3o0Z3VYTXkrQ1BWTWtISGJMeU9WR1poVTVSQnpOZ042bmdOS25Z?=
 =?utf-8?B?TldmZzlKVFdINlhwQVZwRVovcmpBZVdkaWVVRzlNcEhRM2F0My9QWFRwTFk5?=
 =?utf-8?B?Tk5wNm1PTWlLT3dBdDJJOFNiVENaT2NMTkJGY1gwOForOXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 06:54:43.8127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a647d1-a91b-4bf0-eac2-08dcbb64cfe6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7594

Hi Stefano,

On 13/08/2024 04:21, Stefano Stabellini wrote:
> 
> 
> Use expect to invoke QEMU so that we can terminate the test as soon as
> we get the right string in the output instead of waiting until the
> final timeout.
> 
> For timeout, instead of an hardcoding the value, use a Gitlab CI
> variable "QEMU_TIMEOUT" that can be changed depending on the latest
> status of the Gitlab CI runners.
> 
> Note that for simplicity in the case of dom0less test, the script only
> checks for the $PASSED string. That is because the dom0 prompt and the
> $PASSED string could happen in any order making it difficult to check
> with expect which checks for strings in a specific order.
I think this comment is no longer true and needs to be removed.

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> ---
> Changes in v2:
> - add empty lines for readability
I can only see it being done for one script.

> - changes qemu-key file extension to exp
> - drop xen_msg that is unused
> - use capital letters for exported variables
> - check for both dom0 and domU message on dom0less tests
> 
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1410820286
> ---
>  automation/scripts/qemu-alpine-x86_64.sh      | 16 +++---
>  automation/scripts/qemu-key.exp               | 51 +++++++++++++++++++
>  automation/scripts/qemu-smoke-dom0-arm32.sh   | 15 +++---
>  automation/scripts/qemu-smoke-dom0-arm64.sh   | 15 +++---
>  .../scripts/qemu-smoke-dom0less-arm32.sh      | 17 +++----
>  .../scripts/qemu-smoke-dom0less-arm64.sh      | 15 +++---
>  automation/scripts/qemu-smoke-ppc64le.sh      | 12 ++---
>  automation/scripts/qemu-smoke-riscv64.sh      | 12 ++---
>  automation/scripts/qemu-smoke-x86-64.sh       | 14 ++---
>  automation/scripts/qemu-xtf-dom0less-arm64.sh | 14 +++--
>  10 files changed, 110 insertions(+), 71 deletions(-)
>  create mode 100755 automation/scripts/qemu-key.exp
> 
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 8e398dcea3..5359e0820b 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -77,18 +77,16 @@ EOF
>  # Run the test
>  rm -f smoke.serial
>  set +e
> -timeout -k 1 720 \
> -qemu-system-x86_64 \
> +export QEMU_CMD="qemu-system-x86_64 \
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
> +export QEMU_LOG="smoke.serial"
> +export LOG_MSG="Domain-0"
> +export PASSED="BusyBox"
> +
> +./automation/scripts/qemu-key.exp
> diff --git a/automation/scripts/qemu-key.exp b/automation/scripts/qemu-key.exp
> new file mode 100755
> index 0000000000..9f3a3364fa
> --- /dev/null
> +++ b/automation/scripts/qemu-key.exp
> @@ -0,0 +1,51 @@
> +#!/usr/bin/expect -f
> +
> +set timeout $env(QEMU_TIMEOUT)
> +
> +log_file -a $env(QEMU_LOG)
> +
> +match_max 10000
> +
> +eval spawn $env(QEMU_CMD)
> +
> +expect_after {
> +    -re "(.*)\r" {
> +        exp_continue
> +    }
> +    timeout {send_user "ERROR-Timeout!\n"; exit 1}
It should be send_error to send the string to stderr

> +    eof {send_user "ERROR-EOF!\n"; exit 1}
> +}
> +
> +if {[info exists env(UBOOT_CMD)]} {
> +    expect "=>"
> +
> +    send "$env(UBOOT_CMD)\r"
> +}
> +
> +if {[info exists env(LOG_MSG)] && [info exists env(PASSED)]} {
> +    expect {
> +        "$env(PASSED)" {
> +            expect "$env(LOG_MSG)"
> +            exit 0
> +        }
> +        "$env(LOG_MSG)" {
> +            expect "$env(PASSED)"
> +            exit 0
> +        }
> +    }
> +}
> +
> +if {[info exists env(LOG_MSG)]} {
> +    expect "$env(LOG_MSG)"
> +}
> +
> +if {[info exists env(PASSED)]} {
> +    expect {
> +        "$env(PASSED)" {
> +            exit 0
> +        }
> +    }
> +}
Given that this script treats both LOG_MSG and PASSED as optional, if a script
does not define PASSED, it will just continue until timeout. Might be worth making
PASSED mandatory. Something like:

if {[info exists env(LOG_MSG)]} {
    expect {
        "$env(PASSED)" {
            expect "$env(LOG_MSG)"
            exit 0
        }
        "$env(LOG_MSG)" {
            expect "$env(PASSED)"
            exit 0
        }
    }
}

expect {
    "$env(PASSED)" {
        exit 0
    }
}

In any case, you can do the changes on commit:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


