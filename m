Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AEA88065E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 21:59:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695609.1085482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgY3-0007lA-40; Tue, 19 Mar 2024 20:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695609.1085482; Tue, 19 Mar 2024 20:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgY3-0007jd-1O; Tue, 19 Mar 2024 20:59:03 +0000
Received: by outflank-mailman (input) for mailman id 695609;
 Tue, 19 Mar 2024 20:59:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7vt=KZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rmgY2-0007jV-6N
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 20:59:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82344811-e633-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 21:58:59 +0100 (CET)
Received: from CH0PR07CA0019.namprd07.prod.outlook.com (2603:10b6:610:32::24)
 by SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Tue, 19 Mar
 2024 20:58:56 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::11) by CH0PR07CA0019.outlook.office365.com
 (2603:10b6:610:32::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Tue, 19 Mar 2024 20:58:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 20:58:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 15:58:54 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 19 Mar 2024 15:58:53 -0500
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
X-Inumbo-ID: 82344811-e633-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCD51Sjl7PR/+Lu3KseQRF6qdvMH21K0FJ2c1SCh3OxJgaPuhh1WNhV2cYocClcqWZ2BIgpE8PkaXObAudQJ14Pa0WUQud+R2JQAdtXlJp3qgemJVTVxpsfi0mI0ywwHS/OFq9BMNOd5VImaqOeRvp3jCly3drDTYlmCJtwJcbuFFxFsCPZCdvHMC8mT/K6MKYp9tDMJ3Ue20IAqZBbmrGY0cjSjQpPRvaywQpy3afLUNo98v6Bx9pbaggdYn3kPRStYf6dNAXCh1KbwwhJRjaqrguijIF9SHgbKIN0+eUu3vskWAZoUVaBgHIUhz4ntGiw6EZlBfE4u3TUIDAkNIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5YAuNKX+8+Yiih2W/K6aknxT/lxBQ5etRwHBsz3KVc=;
 b=eFWI8/Bd33p2so4weUn5Vta8lTWuOt3OXR6mNSwaWL+dO7Zecs8HMHuv7m9IZqdh0hU3Q4hJKIBCatQcSE6t3xpwQx8tDjnsGkFHEFxwC14FDV87Rkk3yzkRCoLkIFNkR6NJKdEtCr8xlgAD252eQ3/jdXVuFisPeWFzJGUf/K/1CeIIQYec9w+D02Tq8VoOHYhijFFquA5Z//xmeFP4RC4nPq2lumPdGokIvgaflwyqnVPbyyZ3AlJwMnsMftLhVVnxobUK/dMS24M5ju36B6nFmRRnEEs1IGFEGoLnkXe+ueaINh+/1aBZr8hWEbBUyuqEUN2sVHYO/Jke7sqnGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5YAuNKX+8+Yiih2W/K6aknxT/lxBQ5etRwHBsz3KVc=;
 b=ifWSK4y9wNuWoilePtEXN4EeU/05cvTMe6Sw4cUjbTLbhqEzn7g/KqypDPP6F8GUZomejGq7utVUAaPJjLD9vHcrIFESJN5vsthz2cKBE1rfH81JKXXAokdQHTSQctg76rhQzxpK2ma9K8bPdG6QqZal53mZ8qthUa0nGDY1lw4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/3] x86/pvh: Support relocating dom0 kernel
Date: Tue, 19 Mar 2024 16:58:46 -0400
Message-ID: <20240319205849.115884-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|SA1PR12MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9d7c9f-3467-4409-878a-08dc48576391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h/0fM7ufLsoPG5LDrpVJuCkdeNtjZ/T0k6/q4QFj71ppO8Gpl/B8uBbHNueXJFGtHgKS+yaLY0y/gX6TmYZcFviBrzeHU4upHxqHovls/Tdbag7TRlwtB4rVcEZGqZiGYwhDhYIlzmO75DPvBs/d9lviZWN1BtslOQroJ94+kHGLKUJJbtTfTuN24yQwgg23jiZi0laZ1wx/BCmh/e/b9eaRZZmgYlRK1bOD0qkHYmHYW6KpAZ9nc/o9z0ygqGqqznM6jHJTtBY8sH6piSuiMC5NVxpO7QwTmQesUuqFxuQR/kGZvoJ2RKbtN77sc4u5SDopehefuWkUk+VVPNPZDaZQpyiQH03kB6pX/ppNekRBg3mdqUyPVpy0KeOD/GT3QgYsU/rBese6HSCCiHzK3OGWkRJwbdMoUuK6Or0G/JUPmeBjo6Z1UZTqmDW4/yy1zh97YFC3oGdc3/Zs9tAUm6eTD3VrJHWlQunvn0bXSsxoIsguKROEo+14cVE0AodEXX6FuvHZERbD9dhI9w1I5J+uhYXGl8rM1JJxuoyG6CR+fCilwyQWElBMKO2PVvBs//5ewJuL+Qwkmi0Ky5NcjrrSo6VebIVgTztMoTGQitOnITtkjBB5cJDnF0dPEvoABvvZYAa4N2J+1wXZ2G6424IbQoBFDuiyMzPknAYfoxaHm0QL9FdkMc7CQv0+y7UKayjKichvkQYdeJS/tfptVUFCik3dahak1GuHJVVws2Pp5aq4PTyRrW3xCogMzjvk
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 20:58:54.8979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9d7c9f-3467-4409-878a-08dc48576391
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7366

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

The second patch expands ELF note printing beyond just printing
integers and strings.

The third patch expands the pvh dom0 kernel placement code.

I'll post an additional patch showing the Linux changes to make PVH
relocatable.

Jason Andryuk (3):
  Revert "xen/x86: bzImage parse kernel_alignment"
  libelf: Expand ELF note printing
  x86/PVH: Support relocatable dom0 kernels

 xen/arch/x86/bzimage.c             |  4 +-
 xen/arch/x86/hvm/dom0_build.c      | 98 +++++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/bzimage.h |  2 +-
 xen/arch/x86/pv/dom0_build.c       |  2 +-
 xen/common/libelf/libelf-dominfo.c | 83 ++++++++++++++++++-------
 xen/include/public/elfnote.h       | 18 +++++-
 xen/include/xen/libelf.h           |  4 ++
 7 files changed, 181 insertions(+), 30 deletions(-)

-- 
2.44.0


