Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68264867114
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 11:31:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685418.1066086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYFR-0006xF-HU; Mon, 26 Feb 2024 10:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685418.1066086; Mon, 26 Feb 2024 10:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYFR-0006u5-EZ; Mon, 26 Feb 2024 10:30:13 +0000
Received: by outflank-mailman (input) for mailman id 685418;
 Mon, 26 Feb 2024 10:30:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KjY=KD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1reYFP-0006tz-O4
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 10:30:11 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0385922f-d492-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 11:30:09 +0100 (CET)
Received: from BL1PR13CA0071.namprd13.prod.outlook.com (2603:10b6:208:2b8::16)
 by SJ0PR12MB6903.namprd12.prod.outlook.com (2603:10b6:a03:485::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 10:30:05 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::a6) by BL1PR13CA0071.outlook.office365.com
 (2603:10b6:208:2b8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25 via Frontend
 Transport; Mon, 26 Feb 2024 10:30:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 10:30:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 04:30:04 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 04:30:04 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 04:30:01 -0600
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
X-Inumbo-ID: 0385922f-d492-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVkfqPzrUQ0GsX0vNNDv6ZoeOa5eB8gIDn7aFxo4Qlq8CZZHm2A65X9Ndv/ltbxMPhUQKLYHkSsstaVhRwIyZDHv55QLviM2TvMJ7tJI1cXyHqHNCwR+ElfXfVXT0G9lygaEs7xW8DhkFBBLt4v4o2OOP03r3PpXrZXGnNCWamD30T3QRc7s7fXxt6Oguk+ag0Znokcrt7h1GtAq8g1MSAceyRzH29AXoHdxBXj/MGBZnuFoSTM0y6bwSoNl5qqa5HSmOjPR+NRf1v0YPV5qENrd5Chpv8i5LsElnUJLL401G9vIH4eWRGzSO+oFJTzALb/hHCxTxteXr6DF+It7JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeYIzwYxm9C6M/OnUbqDiodZbNcszOJVJa82PGgHvWE=;
 b=VmwZYRvW9GmgVoqwpJAmOu/hw6C8xVavHJ58hlW7/rzQjV9HWhXj0V7HqFViKxOKEfTStqV2kQOi4VJmmdLnOLcz5UHo8+E/H0NRovoP3RHP59eoEtF3gykfT5zQW7IyTF+6eaZIBcGhZdKmOpZkPPpS6fb0fx1WPYWEIsec+Kwc0ALP5LO5ipWRpWD7qiGEAEXRBu0KuxqQW8dB6s1qALjTGcDzrg5S+VhheqO1XVvJdoQcCQyE7C2hRkOgE594Ayhxm56b3xXfoCdlRRRGmPT8F0kp0FwxYP9K8oiES8a7Xd1+pLLYJmj3QbHhgUl/PeaRUNtOn6CRfLAiSldjIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeYIzwYxm9C6M/OnUbqDiodZbNcszOJVJa82PGgHvWE=;
 b=nNIX+e1lRAjgmNc9eHtXe0gAQOl8jwA/Jk8jwy7ZejDRNcTfpkSe+EcM9YAO8u870cTKR1rA3s2A0+z3lhSMNv5o0b0a1USDnQb6R+Qvh7vwGQmZN+cmrZ9gH5DmoTGWaDc3bSRr4rz/IL4iP9WobyZ8p7rhkKMPyiXUBqJwPzg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4c9bf719-7ad9-4739-9edc-eef06dcefb9f@amd.com>
Date: Mon, 26 Feb 2024 11:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240226011935.169462-1-xin.wang2@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240226011935.169462-1-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|SJ0PR12MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a97944a-6874-4bb3-ed91-08dc36b5e580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XOqYjKkxg1eO5bbGnwgxm3WysZMh3fpO75aB/tO104uTnzG9zDdw+A1eire4jCC/kNBrK4XD0to/itL9sloj210Z41ewAH0AUMablW/pWNHcJGNJyCs3mekSZWNH9i8TkMdKDrhCpq/o0gIMDEko9mAP8GhAO0hdVdAcEzCgRzOA2IYJVgqDShOEjcYLZMNfE/Ksq3tQRvZNOzwIKJB1TNB4xGFQJcGvpn/04Lt7ps9WYM0W8i8jCbO7fun3izca2mwviBR/63t+miO2MR5Tgo66FHF0DLHnJGA4DpaFtY7Me3CXicf291q1ecuXChHmetpVU5AIlwFTzRCNyK9rvP48SXDQWCPBKrHZmGFpmODlZ6sT+5JOuzJmaRcwqFKUMXLFG02CCFcE2HgFpBnrDM/OMz5Guy9eJDeDlmG9IFXhhiiIsOZnvcM7pJ/EHSNL3n2UiYigvnbrPiggDFDWRrACp1PNCkB99auECKmjdKTNNMFvxhd3QOGLOhxGSkCmVHR2hQ211oo0e+dJDueWL7/4mClxVgwBng2znddNLlsedX+J6HY+P/RTawdX7Km6qDfTY9180iZunL29p4SI0BCxPNte1vJ7i5cz7cmfyt4QBj+9Gvt+Zb+tswPoML4Vx4fwP7UDsvxXrZyRlM5uWfDjrs51sMUfpm8pmTYQHfeCEqxumwJh0mxhxnPFWO5qJT6nfY23E08QGS/j15XuaIy38FRXnW2yvM0xBdx/SPB9PPf18iz1enK+ZHd4gGdH
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 10:30:04.6711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a97944a-6874-4bb3-ed91-08dc36b5e580
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6903

Hi Henry,

On 26/02/2024 02:19, Henry Wang wrote:
> An error message can seen from the init-dom0less application on
> direct-mapped 1:1 domains:
> ```
> Allocating magic pages
> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
> Error on alloc magic pages
> ```
> 
> This is because populate_physmap() automatically assumes gfn == mfn
> for direct mapped domains. This cannot be true for the magic pages
> that are allocated later for Dom0less DomUs from the init-dom0less
> helper application executed in Dom0.
> 
> Force populate_physmap to take the "normal" memory allocation route for
> the magic pages even for 1:1 Dom0less DomUs. This should work as long
> as the 1:1 Dom0less DomU doesn't have anything else mapped at the same
> guest address as the magic pages:
> - gfn 0x39000 address 0x39000000
> - gfn 0x39001 address 0x39001000
> - gfn 0x39002 address 0x39002000
> - gfn 0x39003 address 0x39003000
> Create helper is_magic_gpfn() for Arm to assist this and stub helpers
> for non-Arm architectures to avoid #ifdef. Move the definition of the
> magic pages on Arm to a more common place.
> 
> Note that the init-dom0less application of the diffenent Xen version
> may allocate all or part of four magic pages for each DomU.
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
NIT: Generally, the first SOB is the same as author of the patch.

[...]
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index b3b05c2ec0..ab4bad79e2 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -219,7 +219,7 @@ static void populate_physmap(struct memop_args *a)
>          }
>          else
>          {
> -            if ( is_domain_direct_mapped(d) )
> +            if ( is_domain_direct_mapped(d) && !is_magic_gpfn(gpfn) )
I struggle to understand the goal of this patch and the proposed solution.
The problem with magic pages applies to static mem domUs in general.
A direct mapped domU is a static mem domU whose memory is 1:1 mapped.
Let's say we try to map a magic page for a direct mapped domU. That check will be false
and the execution will move to the next one i.e. is_domain_using_staticmem(d).
This check will be true and acquire_reserved_page() will fail instead (similar to the
static mem (no direct map) scenario). The only thing that has changed is the message.

~Michal

