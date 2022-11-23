Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89549635966
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 11:14:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447500.703788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmlu-0000gh-9h; Wed, 23 Nov 2022 10:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447500.703788; Wed, 23 Nov 2022 10:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmlu-0000dv-6Z; Wed, 23 Nov 2022 10:14:26 +0000
Received: by outflank-mailman (input) for mailman id 447500;
 Wed, 23 Nov 2022 10:14:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5PS=3X=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oxmls-0000dp-L7
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 10:14:24 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20613.outbound.protection.outlook.com
 [2a01:111:f400:7eab::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 993568f2-6b17-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 11:14:23 +0100 (CET)
Received: from DM6PR07CA0127.namprd07.prod.outlook.com (2603:10b6:5:330::28)
 by SA1PR12MB6895.namprd12.prod.outlook.com (2603:10b6:806:24e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 10:14:19 +0000
Received: from DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::ca) by DM6PR07CA0127.outlook.office365.com
 (2603:10b6:5:330::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Wed, 23 Nov 2022 10:14:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT115.mail.protection.outlook.com (10.13.173.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 10:14:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 04:14:18 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 04:14:07 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 23 Nov 2022 04:14:05 -0600
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
X-Inumbo-ID: 993568f2-6b17-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1BE9fzVoy9XaCa88NdOoUaTW7FVehB/MxgNci7+VhnmA1vWlyPiEiL4biA9gkVgikRQEmZF0465H6Ruhd2X0diXjJEO2U15DErKrxtCuT+m/Z9YjQZueLoMSVvdvGhhI5eyWTzzvclAmBOypYOxSonItEO83YpS6R37UdD8mpvZx2nM6OU2gpcvgmizIc3eKUMMobwnvuO7+V6gmcbB6OGmfmdosoqVZWk8/PC7T3Xx4Egpsv1HH7S1mRD/PyobXpys6JxXE1dYIAiEZLPhMrwYEEKhsybN4atv5G7MlmVJNuf9hHgUQNLehol/6CHU8tVm85CgHooN9MXlB9oCFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3kgZAqvvWTRbTmHnVDl2y358/unH8LQ7vS1FDMUYY4=;
 b=b4AkhCw2mNG2yoLYvyOYGNy8Y3J6HTtDi2eElMIMg6nr2dCVERExkvbkbMM9kA8rk3GIBZMZzjsJVR+U9Y1O57HRXxEEom89VeFyM9qGPeFSSoSfEG4Vr3FVOSekWp4sC9FTs0xidAqXkTRLi1ysoSdHNQU6i1wwOiuxtgs0THBkcyyp2899sy1bgtwTfn50fAHfQ9QFxuOWmCGy6ywimsYPWr25kqYL+wUJCBZmdmX/wlYSpRrifXOxDaoE3z2sxiC2elwrSoGUKGfke6/IUx4r1g75SMcEkkPndaR2coJzq02yfNgxLYe2fwQOtIid3XCp/jIGBngVoM8XJA7AQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3kgZAqvvWTRbTmHnVDl2y358/unH8LQ7vS1FDMUYY4=;
 b=UzoBKCAYvuGe4BvADbteL9vKxOSUwrn5Tag4dvH4P3ZVr7i+fjnjnzf0l2yyarfuG+43eHskL0joXSTVS6Y/U24fRMhjTLa0UirOCncV/M39ph1L7IldT2qx/d2ThClkhgVrZLzAr7NjvO1cx+GwFVmKBv7451fHduuFlVonKJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <cf68a696-29bf-aa05-ea8f-5c13ca181286@amd.com>
Date: Wed, 23 Nov 2022 11:14:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Community Manager
	<community.manager@xenproject.org>
References: <20221123040315.1480112-1-Henry.Wang@arm.com>
 <20221123040315.1480112-2-Henry.Wang@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221123040315.1480112-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT115:EE_|SA1PR12MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 98232559-0720-40b4-6b64-08dacd3b7bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tWqF+TeVH1OQMQ8gLo4NTYsmUoNjY99YJiXFsC2HuYLaegSEIk2hXcwXeob+oK37LoVnKJNUVfeiu1GhgTRRkjB479bXgJeItoTrMV1dBDSUteDd2WipVM5gGBQ4a4I0A/evonlrHID0004eauZMFkZ7RVQ9BGH08kbuC1G9pdP2x2YWnDAb2aqQMO0ZrNCrMteO9ViLPpFkXLYCZY8u65M3hvtsAqtBSwEpUv5ivro6Zj3RVHEa1OK4QPyoPIoMiaguOhTaLqkQ0N3UKuxlfZB6Oy6pjzEaHs6JkFCDQ6IxLkxSQLJ/6ofJhnjRXXqUqmsHpaB1k6Ip4fnfZE3v37wipFBKuLdna92IaUmGCN5Lx9eMunvYWK9O/UTNzrBzkRjxEQ/gsXhUsI4xiPHHJP9C6cJfUL4CmmvwHlZrG+sEqmpbHfsfOBBspiCCcf+1pn+YfgGWVpnSTRoq0LqQIGiMgHdErLpVNhliVhEcvJRNtdEEBlMKy/aU4tX39uLeEzIV94Vp9Ij8HwNT2aZcbJvj66XLSwumT+Gq3I+M0U8UiJxaX4Djj3jxfZAQMdD9SpuWx0r6vXOupmKFW1RW8G9qVSREW27CKRb6TGSjhNjkMgUhh5EGPIVEKXT6P82b6WKqmMJIfjDjQ1tlK6wdBZdvo4g169nSWun9dsTS1mw+9fhaoIR6E8DDIzNuP95RcH0CxJPhGmOHGuR8TvOGpsBG96kbZhHd+UjSqo9l8WwsqviwiJdhrjHQMBB3GmMr3i2kNiXU7fVC+ittFrruSqcR2jk5/eY7Lj5Beub5G4KlK9r6Cue/KR0ga2g+OHmVQG2YmuK2M1+qahuvBMNPDXSuKpNjG9LGnpSRaGHp4DmnHijxKxviIU5/qQWZ7lSt
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(82740400003)(8936002)(356005)(81166007)(186003)(336012)(5660300002)(26005)(86362001)(40460700003)(110136005)(40480700001)(53546011)(54906003)(316002)(16576012)(2616005)(82310400005)(36756003)(31696002)(41300700001)(70206006)(8676002)(4326008)(70586007)(31686004)(47076005)(426003)(478600001)(83380400001)(2906002)(44832011)(36860700001)(59356011)(219803003)(207903002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 10:14:19.0569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98232559-0720-40b4-6b64-08dacd3b7bdf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6895

Hi Henry,

On 23/11/2022 05:03, Henry Wang wrote:
> 
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v3 -> v4:
> - Use the corrected sentence for VIRT_SSBD and MSR_SPEC_CTRL
> - Clarify that the virtio-mmio toolstack for ARM is only creating the
>   device-tree binding.
> - Remove the "initial" in i.MX entry.
> v2 -> v3:
> - Move the uncertain release date to patch #3.
> v1 -> v2:
> - Correct wording for two x86 entries (clock frequency calibration
> and SPR & ADL support) following Jan's suggestion.
> - Add missing Arm entries from Oleksandr.
> - Add missing i.MX entry following Stefano's suggestion.
> ---
>  CHANGELOG.md | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index adbbb216fa..8fa8b198b3 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -4,16 +4,43 @@ Notable changes to Xen will be documented in this file.
> 
>  The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> 
> -## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> +## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging)
> 
>  ### Changed
>   - On x86 "vga=current" can now be used together with GrUB2's gfxpayload setting. Note that
>     this requires use of "multiboot2" (and "module2") as the GrUB commands loading Xen.
> + - The "gnttab" option now has a new command line sub-option for disabling the
> +   GNTTABOP_transfer functionality.
> + - The x86 MCE command line option info is now updated.
> 
>  ### Added / support upgraded
> + - Out-of-tree builds for the hypervisor now supported.
> + - The project has officially adopted 4 directives and 24 rules of MISRA-C,
> +   added MISRA-C checker build integration, and defined how to document
> +   deviations.
>   - IOMMU superpage support on x86, affecting PV guests as well as HVM/PVH ones
>     when they don't share page tables with the CPU (HAP / EPT / NPT).
> - - Support VIRT_SSBD feature for HVM guests on AMD.
> + - Support for VIRT_SSBD and MSR_SPEC_CTRL for HVM guests on AMD.
> + - Improved TSC, CPU, and APIC clock frequency calibration on x86.
> + - Add mwait-idle support for SPR and ADL on x86.
> + - Extend security support for hosts to 12 TiB of memory on x86.
> + - Add command line option to set cpuid parameters for dom0 at boot time on x86.
> + - Improved static configuration options on Arm.
> + - cpupools can be specified at boot using device tree on Arm.
> + - It is possible to use PV drivers with dom0less guests, allowing statically
> +   booted dom0less guests with PV devices.
> + - On Arm, p2m structures are now allocated out of a pool of memory set aside at
> +   domain creation.
> + - Improved mitigations against Spectre-BHB on Arm.
> + - Support VirtIO-MMIO devices device-tree binding creation in toolstack on Arm.
> + - Allow setting the number of CPUs to activate at runtime from command line
> +   option on Arm.
> + - Grant-table support on Arm was improved and hardened by implementing
> +   "simplified M2P-like approach for the xenheap pages"
> + - Add Renesas R-Car Gen4 IPMMU-VMSA support on Arm.
> + - Add i.MX lpuart and i.MX8QM support on Arm.
> + - Improved toolstack build system.
> + - Add Xue - console over USB 3 Debug Capability.
Looking at the "Added" section for the previous releases, we seem to mention the changes to CI (automation/) as well.
Because there were quite a few changes done in this release, adding at least the following, can be beneficial (something to consider):
- gitlab-ci automation: Fixes and improvements together with new tests

> 
>  ### Removed / support downgraded
>   - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options
> --
> 2.25.1
> 
> 

~Michal

