Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F11B88F166
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 22:56:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698730.1090773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpbEj-0001fy-Oe; Wed, 27 Mar 2024 21:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698730.1090773; Wed, 27 Mar 2024 21:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpbEj-0001dc-Lw; Wed, 27 Mar 2024 21:55:09 +0000
Received: by outflank-mailman (input) for mailman id 698730;
 Wed, 27 Mar 2024 21:55:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWcJ=LB=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpbEi-0001dR-LR
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 21:55:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab82006f-ec84-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 22:55:07 +0100 (CET)
Received: from BN8PR04CA0035.namprd04.prod.outlook.com (2603:10b6:408:70::48)
 by PH7PR12MB7453.namprd12.prod.outlook.com (2603:10b6:510:20a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.30; Wed, 27 Mar
 2024 21:55:03 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:70:cafe::52) by BN8PR04CA0035.outlook.office365.com
 (2603:10b6:408:70::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 21:55:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 21:55:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 16:55:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 16:55:01 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 27 Mar 2024 16:55:00 -0500
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
X-Inumbo-ID: ab82006f-ec84-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFloiD0pFAPMy1HkCthm5GyPGjFVubBQFmDYcKWsgfboQuTXvsxWkfexWzko7mcFZeTh9jb0CKKygnNQadZQ5PzCeIpfGZ6gRxoxMhlzcQfIxlhOH7V3YkO+g051prS3acGX5t8SYeXE85mauDMMaBbpnDc7cgHDHh+B51BYO3F85HyFeXDz/pY9RMHYx4Ruk93Dwh2SAeeospxMcKjihI5c1Gwr3+nyxocawT59zCNwRBjhew7GmBMcATqeqYEzlY3P6NbidBWbhgLRRpscdhOOOwGYF6HuEz+VS/mNpcirpBkmrQZm7Y4gtfU5/JW2EwgvPpN04ZV13NqhYwvk1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JGDFLL2Mbk36fV41ml7871DsjzHeNM5Ecm0pDvDuaM=;
 b=E9A/+bOl5YE5Q8iEn86/S95OmJK5gM/IKtC6nXeNe8TaDIjctO6CDc0sPyZKd9G9845jr5+SIMV8gIU3N0fL0uvP2vwRdABXjPqj0U9lN54uOf71nMXaehB/dVzM5NtCqV45Y6yFybmJYIz6mhGycXTGfzY01P1QVsGt2WlCXQRwOOrEapIiJc45jtojZmZgwTod746k7ilm6tcnu6ec31qCj+94VEVno9IPhmeeiLUQI70PmlvUe86g1AoQsAmw+FTnAHCyZAVf4X+p5fg0+MACfau+JwJQb10p5i22nFF7Mkz4fzKVq94E637c98swF2+0UM8BRJeP/NqR3ubvaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JGDFLL2Mbk36fV41ml7871DsjzHeNM5Ecm0pDvDuaM=;
 b=hdVu0LKQAuq7/g3aKCbAbvbjdefPBK3aCNr+8TUBbLxqDcP32HdjimqkAf1X34Mh/dI0AzvZyEN4rBMywO91HScJwUoQGtGgLh7Y7HXGGLqFU80XR3YeU7Hhgud+4W85cVGvseIBxJ+WOKIKmiZf/tmppG3KAFmZMlPdy8gz9bc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 0/4] x86/pvh: Support relocating dom0 kernel
Date: Wed, 27 Mar 2024 17:50:58 -0400
Message-ID: <20240327215102.136001-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|PH7PR12MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9bd374-7da5-4b47-c9c7-08dc4ea88e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6wuKSjbm38MKPAWQeLjRrdhTrj61vXp+ifHTWw4f6WGngaEu9rk5nxXWU+iCBAUz/uevR3QybvAc7XFGWML8lCeqHDpJDVXo+eOq+rvtvZW/XGHCHQT9GiI3mV5kVyv2qSdbHOao+KO9cpc3M8sMEIh51YXovLA9FRM0jsKxE9xj06CqzrVBIyuimnteUPvuoBTlIjLx/Go9hajU/Ynr+pvcH3XfFXKqvNw29XhET03Fmf16HSvgh2LEHxyiVbs0LR7qfuEzhK7MPUE4RTzlDUWVaoeaRGosIHgdgbL4MilNRCzz7rsfZpjrqD2MSUawtld0oeEKgoFV6HjvHFse0a0ly5f9KZvk0Mzlf+ZKYO3FP0Y5QCh8mKG+OQJ/WqSg/B8Lw9/Ve9UIv/lyk3nn7PUvgMObVKkMRY7ZaxPzlV8xXc7+fbD64bd2E8XvBwaRrlt+Es/vd7Ts8rxIn+ElqEjobztfm85RBUupZQBPm3zUYJVdvcuZCAXEZoakD16RStYNL1Bo2rp5cjPya3J3nvEbJuSQtWufGhQoGiRXRi8vkuECB4BEZ8q7zOo2hiGZZXPF2+YwKMvy+I/a4JYarRjPaodbV9FdI9S6GclCtpH5tqOyZP8WiOu/n2ZlszqzTQfDhwMyar5sWRqA4jU82B4g9eFV7LeWkwAawRCpQCV5KXUyHVPkWM6gOxSsH01DxqmGWhGPOjC+1YzEaCKo50aLbmZURw0Uq/H8Vym8FgFHcLdCOIGp3Hs0bIO5AQDx
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 21:55:02.4785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9bd374-7da5-4b47-c9c7-08dc4ea88e16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7453

Xen tries to load a PVH dom0 kernel at the fixed guest physical address
from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
it can be configured.

Unfortunately there exist firmwares that have reserved regions at this
address, so Xen fails to load the dom0 kernel since it's not RAM.

The other issue is that the Linux PVH entry point is not
position-independent.  It expects to run at the compiled
CONFIG_PHYSICAL_ADDRESS.

This patch set expands the PVH dom0 builder to try to relocate the
kernel if needed and possible.  XEN_ELFNOTE_PHYS32_RELOC is added for
kernels to indicate they are relocatable and their acceptable address
range and alignment.

v6:
Choose the alignment from the Note if specified, or the Maximum PHDR
p_align value if greater than PAGE_SIZE.  Otherwise, it falls back to
the default 2MB.

Patches from v5 commited:
853c71dfbf xen/elfnote: Specify ELF Notes are x86-specific
7d8c9b4e8d libelf: Expand ELF note printing
8802230bfa Revert "xen/x86: bzImage parse kernel_alignment"

The first and second patches move MB/GB() to common-macros.h.

The third patch stores the maximum p_align value from the ELF PHDRs.

The fourth patch expands the pvh dom0 kernel placement code.

I'll post an additional patch showing the Linux changes to make PVH
relocatable.

Jason Andryuk (4):
  tools/init-xenstore-domain: Replace variable MB() usage
  tools: Move MB/GB() to common-macros.h
  libelf: Store maximum PHDR p_align
  x86/PVH: Support relocatable dom0 kernels

 tools/firmware/hvmloader/util.h         |   3 -
 tools/helpers/init-xenstore-domain.c    |  11 ++-
 tools/include/xen-tools/common-macros.h |   4 +
 tools/libs/light/libxl_internal.h       |   4 -
 xen/arch/x86/hvm/dom0_build.c           | 108 ++++++++++++++++++++++++
 xen/common/libelf/libelf-dominfo.c      |  35 ++++++++
 xen/common/libelf/libelf-loader.c       |  15 +++-
 xen/common/libelf/libelf-private.h      |   1 +
 xen/include/public/elfnote.h            |  16 +++-
 xen/include/xen/libelf.h                |   5 ++
 10 files changed, 186 insertions(+), 16 deletions(-)

-- 
2.44.0


