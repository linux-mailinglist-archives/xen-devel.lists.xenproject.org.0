Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3588D036
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 22:39:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698208.1089669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpEVa-0005dl-Jt; Tue, 26 Mar 2024 21:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698208.1089669; Tue, 26 Mar 2024 21:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpEVa-0005bx-Fp; Tue, 26 Mar 2024 21:39:02 +0000
Received: by outflank-mailman (input) for mailman id 698208;
 Tue, 26 Mar 2024 21:39:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfY0=LA=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpEVZ-0005br-1O
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 21:39:01 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 408339bb-ebb9-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 22:38:59 +0100 (CET)
Received: from SJ0PR13CA0089.namprd13.prod.outlook.com (2603:10b6:a03:2c4::34)
 by IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 21:38:55 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::44) by SJ0PR13CA0089.outlook.office365.com
 (2603:10b6:a03:2c4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Tue, 26 Mar 2024 21:38:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 26 Mar 2024 21:38:54 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 16:38:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 14:38:52 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 26 Mar 2024 16:38:52 -0500
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
X-Inumbo-ID: 408339bb-ebb9-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4ukPyC5A00Oyk2ZaHpqKCu1UPS0pz4mWPU8f25UuQoYSuHxEN+9NAo+uUWX9cDT+we5OBOrC11Lar6RllwrddlPxeLt7hSa4amGAfMWHi+/GUY9B/uMp2Ehu9ffy6d0Px65CgBI6SjQ7Vzn+E2yvJY84LbIh3mBjh5hGBwxw293Ui81YFPqIrGd+GCmNvRlgih8j0XgXgwEVO7bb2P/gE+S2A+2kxKzvEQrsvEmfmYlRv+wXmANp9C6KB6E44s3mxYVUujJkHrjUrUPqiHpWJ18UkPDYvYqvuuie7lq8Ym5WgmriAFaPJBnpdMyYLMyYLwC/G28jxNZfT7oSLmR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwtkrJN7ACGn2gJq6icIRADQJTBXKuFjDY6R+BJAPc0=;
 b=f3ASPla7EPbWmZzcMgx4MAiZ7jI18HmZ6ffgNmmCddJTu/wNEv9ETqPodbE5IfbKDlcQSV14p57TU0mHPv5BoTqmNogOsU31E+pFhYdrxcJQsa4yw1ptPvjNyswY/84UKjInvngd6EhCVtb+OBk63dMWBaLXPFrsXFhKmLiYyXyDL9havsJ9XuR/MwAo71a0SseKAMyxdX9u/swD3/yAUFthS+oAHE0QfFuL6OXWD1gkRa3zcbfLxMTeMXE9ffBMK57kicIm8buowWjqC5hDXAk1KkckLRe/N/RoEUVkp3ekDY6hIWlUV6c8e5pP74Qa+HdaHEU6DZ2jmvjSWTlWFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwtkrJN7ACGn2gJq6icIRADQJTBXKuFjDY6R+BJAPc0=;
 b=bZfMD31N0bj2m+Px5wffwXfVO56CpL/XFdQ0Qqp7O88gnfU55yz7Klp24ytL041zhYi/ZYmDEtRG6JmVcXyBWEfA2yoe0rpI8db+Lo4aZ6xlyWb0pxCy1NR0T7kvU27znYdlyFFl3cv6k/tQVhKxOngoogodA9Az+B0TXAwm/5g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 0/6] x86/pvh: Support relocating dom0 kernel
Date: Tue, 26 Mar 2024 17:38:41 -0400
Message-ID: <20240326213847.3944-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|IA1PR12MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: df90bb95-5e46-486c-e398-08dc4ddd22b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sLaUO67LZjY/qrL/SDnRjHfHsHDs/7NZAkzLcwidNhc8kKR7jeq598A4vWN2bMsnpmnA2h44mQIhWHOfN1rKvWNbKzFlQ5Lj16mkkUNTEGCiFA0y8U/MBoV3GbRoVv6wI4QM2YQsSE8E+Y+EZZwFzAfGQ5qj7t6gM6wvUhfjHxVPj6s2i3lkHVgaNkRRc2SJaRykQn482hy4oWxAnEgCWVhBU/HDDl0mt5I2Xi14sJALEFWproqM1HYXHVGhgGn/ersEi4aJzVnZQgoVhpi9RaL2inWFGLKxUJHXJ+3kBpdwmILbeUlP6lHhQu5z8qpywXRkfR42zlAKF52Bpc3MNcry/AClvlGGJpIL04/yhsjnkkkUat5MzBFp7+rU+hBd+VSF7INsZjxhlVCzCgACOcsGxzdi1rq6UrE4p1l4phJGdKJ6c/1sUbsuwFz/UV3RTG7zZNom7Mxs4D7z6j0DK417qtLECPf8+Oijk7QA04nyKuUP4cqF69B5Fc9612CSxzluVRk9v24tTwkrhKIEK1CpIJD/8bvKt0ibuZtfPYhh7KOKGf612cA6CXAYNdGXiwDQraAUxQMD8uHjg3p3K3fwdLWJKIxjIyDrLtU6Alyj6RWmujUf2hcsuZ8/FZgbzf9GBCvhOytvVBr7Hi0XEAyA4uqz6YHZc1wNo6cAC7282YZ3Ip0ZZCMRXt4ctp+mzJcnVztfg0KNOGprD9J7ooVFJqfWPHUXjmfCgSmRxrMtub0K7Dnp8XxutgC5Jt3x
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 21:38:54.2371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df90bb95-5e46-486c-e398-08dc4ddd22b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652

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

The first patch reverts "xen/x86: bzImage parse kernel_alignment" since
the alignment will be specified by the ELF note.

The second and third patches move MB/GB() to common-macros.h.

The fourth patch expands ELF note printing beyond just printing
integers and strings.

The fifth patch expands specifies the Xen ELF Notes are x86-specific.

The sixth patch expands the pvh dom0 kernel placement code.

I'll post an additional patch showing the Linux changes to make PVH
relocatable.

Jason Andryuk (6):
  Revert "xen/x86: bzImage parse kernel_alignment"
  tools/init-xenstore-domain: Replace variable MB() usage
  tools: Move MB/GB() to common-macros.h
  libelf: Expand ELF note printing
  xen/elfnote: Specify ELF Notes are x86-specific
  x86/PVH: Support relocatable dom0 kernels

 tools/firmware/hvmloader/util.h         |   3 -
 tools/helpers/init-xenstore-domain.c    |  11 ++-
 tools/include/xen-tools/common-macros.h |   4 +
 tools/libs/light/libxl_internal.h       |   4 -
 xen/arch/x86/bzimage.c                  |   4 +-
 xen/arch/x86/hvm/dom0_build.c           | 104 +++++++++++++++++++++++-
 xen/arch/x86/include/asm/bzimage.h      |   2 +-
 xen/arch/x86/pv/dom0_build.c            |   2 +-
 xen/common/libelf/libelf-dominfo.c      |  99 ++++++++++++++++------
 xen/common/libelf/libelf-private.h      |   1 +
 xen/include/public/elfnote.h            |  18 +++-
 xen/include/xen/libelf.h                |   4 +
 12 files changed, 213 insertions(+), 43 deletions(-)

-- 
2.44.0


