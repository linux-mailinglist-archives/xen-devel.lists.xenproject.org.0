Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B227770A5
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 08:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581825.911245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTzQj-00024T-MF; Thu, 10 Aug 2023 06:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581825.911245; Thu, 10 Aug 2023 06:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTzQj-000218-J2; Thu, 10 Aug 2023 06:45:57 +0000
Received: by outflank-mailman (input) for mailman id 581825;
 Thu, 10 Aug 2023 06:45:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8LQy=D3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qTzQh-000212-ND
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 06:45:55 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe59::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85a72b89-3749-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 08:45:42 +0200 (CEST)
Received: from CY5PR19CA0034.namprd19.prod.outlook.com (2603:10b6:930:1a::13)
 by MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 06:45:46 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:930:1a:cafe::37) by CY5PR19CA0034.outlook.office365.com
 (2603:10b6:930:1a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 06:45:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.77) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Thu, 10 Aug 2023 06:45:46 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 01:45:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 23:45:34 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 10 Aug 2023 01:45:31 -0500
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
X-Inumbo-ID: 85a72b89-3749-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNKGXb9/ZI4rUunDiwSpMRsrcksHNxVy3LKrT5hwGTyGt5LfxO2ldnm0pLOOX/ZZBc8kqAHFLZt5NwQyWfr9iTxirtKgdo6Yf3kXBNgoD6tLXYEC/wMib4r8fDAFkEmSdvLwmgXy6/QpS90hkWTvydguX8zOmMMCCEq7tEOftagplmB/2rDxsbTCfc95dBfribsu5xWbHpXAflG9jpWjy4TkFQzV4hE1ULs0VTfhZajlEcGTyUVRQEpnGXoe3z+37I2B1lCvtv8cV40oOIzwk9QUm1LsNQ6AdlE7lNPVGlC9PkXEdoNe5x3yaRPpGyje73ZhxSuwB1zWBlUHs3aunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R87u6pIYt02/RYsjsUdIkzY9niQNjr9GCe7BLv+qUqg=;
 b=ZN2+9J0+qMsALOO5vQ4OiU5M1SfDjUMygrKL5yFTmB4cwfQCOZOgihmDPQITdR3uSurJS2QgU87WRasVJNcAURXb4TPbsvVw+8rpKNTWoawnYOFwU8vMwe9c2XkTZ/Cwk4M6mBCzoMPnne0o+C+u2NrMfUwI14dLgzxAdxP3oB5Yv42iY+tiaQBuejRv1PzDhqETWQmz5o+ITxHWOoKS6IEHffPLVqL3xFPU4fOGDRhlgBMRPm3pddlpNKIruPeNUelu5gh++LxndNCiYENyovvAUX8DXUEW7UdNIhJtZFkfqHX/qmge+k0j/nwiC41zshNG38EFl99n8fzgapSNzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R87u6pIYt02/RYsjsUdIkzY9niQNjr9GCe7BLv+qUqg=;
 b=YrhuCT4hy1gi5bh9wz2HUdEQghoRHw5JkGnQxjt4yur27W4BiLJcgPuzzY3ET3Uh270XTKaAqpFPDMJxBH8bAGXPkTlG/zvv7F784WJSBT7BRKj/Lk3/d6FWgrhmXEZP20vAa3iDQC+nirTYI7HwGln6+JUIaCYTVFtuDn9NtAQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e43d31f4-5349-f750-6b6e-fc08c1aa5b67@amd.com>
Date: Thu, 10 Aug 2023 08:45:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Moving Dom0less to common, Was: [PATCH 0/5] Fine granular
 configuration
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Luca Fancellu
	<luca.fancellu@arm.com>, <jbeulich@suse.com>, <andrew.cooper3@citrix.com>,
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <wei.chen@arm.com>,
	<rahul.singh@arm.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<george.dunlap@citrix.com>, <christopher.w.clark@gmail.com>,
	<dpsmith@apertussolutions.com>
References: <20230808080010.3858575-1-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2308091243280.2127516@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2308091243280.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|MW4PR12MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: a18ca832-33e4-40db-c133-08db996d6cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mBctEQiSyqHUDLDUAPVxXceCxJ26ttum10AhKDhYAe+TiIbr9vivakWHMog8yH1sRoArFLaFgLLla0ZQU31LpG8WnpbbSpk6sLQ7cOKAcIwbCW7K5ViGBQEe0d2ace8QqTWd1GyGB9W+O+tAKzcGHtlpbDWBPUI0Eh3EYN5JrGHYFo9b7WsHLzHtr3bs/AmNoQ2LvVs2+cPGDN9YSA6MweH3JzOSYa3xkFwt+U4wKp0Oe7ogt7n4UaRCp8DUTKd2eyqOK1WQidyvb4xOy10GuqrQWtUgfKiMBLvagUzZSHeUhfTjbjZ6SgglwY9mkxClkSP/1YBCpwxuS73kwMqYSigJlh0iqfsVpwj0iHMWmFbskqz9OOtzwzo3JnrVa44ph73eo1Le1SAZqCePnaZZoymyDLXkolrR9+bfbArZAvALTPWN9/JJ9NorGXGM8v8nyReFNLjUJuMwJLZ0pnVfi3PxArKVwbajdqRjgaMnOOUGNNdUQ9NNQRAVvP5n7wFxvc2g0/Vl0SI7wZC4wh3hCP+3zDauyhdFhVCHmLcf/jXruo8bObYED4EYuR5ZH0UZhwnQW5tu0j9XCyP/9VD2puLC3hS8NeDkpMAmOib8N9L5/Gm/0Z2iEJkf+azkiuCILEuMFGLp53I3k1FIMFG8UhZxdrAggikv9PCM9FLZjGNVMx02tiiwXtbj9VeeQJV6LGOqKQsIrV15DEA7xNQPUcyV+OAbP34VdI9XKJfLZiH8gNduYBsmxpgoyJVGId+XpwIBQr8iALPFDGiFWfkYE8ufc4CiF74qxswGgkz+tqzmLG8GpLOgjQnD6x7LjI3O
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(186006)(82310400008)(1800799006)(451199021)(36840700001)(46966006)(40470700004)(478600001)(36756003)(110136005)(54906003)(2616005)(81166007)(336012)(356005)(70586007)(70206006)(4326008)(82740400003)(316002)(16576012)(41300700001)(8676002)(8936002)(36860700001)(5660300002)(31686004)(44832011)(7416002)(26005)(40480700001)(31696002)(47076005)(966005)(2906002)(53546011)(426003)(40460700003)(86362001)(32563001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 06:45:46.0100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a18ca832-33e4-40db-c133-08db996d6cef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7165



On 09/08/2023 21:51, Stefano Stabellini wrote:
> 
> 
> Adding hyperlaunch and x86 maintainers.
> 
> 
> Hi Luca,
> 
> This patch series is very timely. You might not have realized but we
> were just discussing with the hyperlaunch guys to move dom0less code to
> common.
> 
> Your series is a great step in the right direction. However, we don't
> want to move the dom0less code twice because it would make 'git blame'
> very hard to use.
> 
> I wonder if I could ask you to move the code to xen/common/ instead. I
> am not asking you to make it buildable on x86, as that would take more
> work and also something along the lines of this patch series from
> Christopher:
> https://patchew.org/Xen/20230701071835.41599-1-christopher.w.clark@gmail.com/
The question is whether we want to move everything related to dom0less parse/build to common.
There are parts that make sense only for Arm. Also, a plain move might not be what
hyperlaunch wants and what Daniel described in his plans for the future. FWIU, hyperlaunch
wants to operate on flattened device tree whereas the majority of dom0less build/parse code
is done using unflattened device tree (FDT is used at the very early stage of the boot and is contained
in bootfdt.c). Maintaining two sets of parsers is not the best idea.

@Daniel,Christopher, what is the reason of using FDT and not DT on hyperlaunch?
Is is because there are parts of configuration that you want to probe early (e.g. XSM module)?

~Michal

