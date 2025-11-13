Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53906C577C0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:50:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161296.1489274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWlw-0001ae-Bc; Thu, 13 Nov 2025 12:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161296.1489274; Thu, 13 Nov 2025 12:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWlw-0001YH-8Z; Thu, 13 Nov 2025 12:49:56 +0000
Received: by outflank-mailman (input) for mailman id 1161296;
 Thu, 13 Nov 2025 12:49:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yybm=5V=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1vJWlu-0001YB-3x
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:49:54 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e9ee0f5-c08f-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:49:52 +0100 (CET)
Received: from IA3PR03MB8408.namprd03.prod.outlook.com (2603:10b6:208:546::19)
 by DM4PR03MB6096.namprd03.prod.outlook.com (2603:10b6:5:397::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 12:49:49 +0000
Received: from IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39]) by IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 12:49:49 +0000
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
X-Inumbo-ID: 3e9ee0f5-c08f-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJkvZMWuZWCn3C1D/tuqlxIHAaXS6AzWqbRjRddx2ojIJQEZw6XsF3i15pJ7ReJjvv5GmQQSHLXz6bu6rXpbe9y3NMHCCaFJADqPleYJsAOlOZyO1cYejR5ln+/ltldKpS7lfkcKM005mrBcTw9HBSVkgzx72j/000Bdh9eR4LfB7izmt1M+0cm6bUfDchC3roEp2XwaH7FR+zElWY6zgwDa61wEjyW7eb/IqXPcQo5mwqNNT71eitVFAToHTLP2aVah6I2zLWlmizZJfNgofNJUqALiwz6fANwIgkR/RytmrgHIR5OvN7QEvz/D80JZ3VUQ8taM2fFKBOW9mm1XaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfIFTluCdP1M3whKEs02d0wg3bEeRU13xFCW3SUGTgA=;
 b=YpwwEYwh3LgqUTzVHfM1e0ClEp1pfRRGpJj/YNSdNrZNiZ244HG4FwVPYDQ8XGb+NlA+L6niEEZPyMOz3QD3tyktUEeQdEROkcr0Lb4x58N/WiwR5Bt8Ql6vP3ZLTGeFMZ7MiAPssjOkPcb4w+ooEWfiEV85PkdQ+osk2JCUD01ab8AoI+YWlfX2BQHQqgwToVwxD9h6gQCFkq0MnvrpGXbaiwLn9cBrJ9ItWiXt9d3XczFQAbY4IntiuP09AiPQa6MGnQghiHE0gwdcy/XQu3sK4UhuzpHSjgfHfDfnJ7e75L/ubVWCChhRPj0U+XQWBlQ2gIDm1PGS8++4WVBbgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfIFTluCdP1M3whKEs02d0wg3bEeRU13xFCW3SUGTgA=;
 b=FD7uNDGgXn65WvTuXwsWvRramC60j4hWHyQMnioDcQsOogcelDFqZSvwh0QcgVTNCr/lnCS/KM3oUQeW+jY4gnofGSCziZ8zo1e7qOarI8FOp5W9yhYm7sop9X39Z22owkS9XQxOb1tSDpjc9fc3DBUz4qLs/ExtFf6TnJuI/4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Frediano Ziglio <freddy77@gmail.com>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v7] xen: Strip xen.efi by default
Date: Thu, 13 Nov 2025 12:49:45 +0000
Message-ID: <20251113124945.25343-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0687.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::13) To IA3PR03MB8408.namprd03.prod.outlook.com
 (2603:10b6:208:546::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR03MB8408:EE_|DM4PR03MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ebeae1-4226-4107-039b-08de22b32197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hXlVR/TQR+ONrHIcB8yiy1fy1ksiF7BXs+M3flUSoPHeTpG8gHfAgtqjIgHz?=
 =?us-ascii?Q?XCmDR2qUQ4Aw/iqFHDVoCcpXQydC3c/Xc7HS6lQ3XDGXKgSjXgC8J/Atyckm?=
 =?us-ascii?Q?0leePgUB4RvFuvjDZwoSawbLKo+7tjOHkA/pQXCZTXBbJBBn9SFrC8olYIbR?=
 =?us-ascii?Q?BOXP0aMeeKGS4ey43ZeuzPjinefJ9nbOS2knium4c5yTerfj9u5KeflPIs/T?=
 =?us-ascii?Q?NGxstC1Jy0zpxbEZyshb3cFifP32kWhZadoCBYYenczm9/R3ZSGqGN0yCY1p?=
 =?us-ascii?Q?nhrjxIgl1YEMCykYgZDqUNs32hFVnQKOnDHb/mY8SwzkWjrmP6WihRY8FJ1J?=
 =?us-ascii?Q?XeGAHtUgRzbItApmo5pWRj9FlWo/n3dqG/EgkJ75veCkvX+h21H1zKTkTwkQ?=
 =?us-ascii?Q?1yQ2bo/oVsX6BBAzHqKAGY7tyMUY1fzbmwQoEgiPU3UsPQTZuh66bmih3OIK?=
 =?us-ascii?Q?gjxvf0KRw9X8cdezNCJvUTEysjicmer3WWInizLZCplMWOF1pkabe6nL5mfs?=
 =?us-ascii?Q?bIPyQK1t6v43wQ3yd65M9H6osWF2gNXNmRBzYeu0pes+fiLsOFaL01ayCWHD?=
 =?us-ascii?Q?RJ6oIu4bKN+lRXJvTZB0y4FeTZ9JshXBiWBnRoH63pSMY+PpIpMXCZJEZsqq?=
 =?us-ascii?Q?yJTgRzzLEVxlCs0rbt/xuWZU4D8//zzevJ42YiPEtxxrdfTfliV6jyQYzTlI?=
 =?us-ascii?Q?aRo8dtpLuYyrTVKBB5ICAy9xeupDGQHnyEPHSpoA2T2fuchnD5hE3s1BlUsB?=
 =?us-ascii?Q?NhhI9wdEbSVn6X6dKFwvsW0HAJcYYTqJw5Cub1T5BBs36Kyu893nPGMFdLwu?=
 =?us-ascii?Q?uETBkWIWTEifhD8Qw5lXn5xjfsYgVD/0QdRGNvcA6AhkymoSmeaBAWkVcY6m?=
 =?us-ascii?Q?+FsKV/jMi4qOOS7a9sYO6GdEPcxYOXd1sa4aHawm/eZ8yM3JKoTEju3RM823?=
 =?us-ascii?Q?vErITCWPZSu7/hIoDotfa8TmNghShcehnjndU6vaI5GFcyKFg4bjGpPO9apB?=
 =?us-ascii?Q?4SWUD6//pxB1fgv8awXgAQfw9zSY6T6bLKM7oMQ8CF6y494sFx1O2xzrZkXm?=
 =?us-ascii?Q?pNRrePeW/PV+8cmW3M6iOEyc/bvp1BP08boz174TZGAGFenlO0Z5FEGpqvWW?=
 =?us-ascii?Q?9GStrx4WaAtR1BCYRcnccPcQ/SmRqNm/j70VkRf5s9ad1MqxVug9BXH/sZTy?=
 =?us-ascii?Q?MhVw+80dltRQtf6w/EPovthBbyBHkKKgbKHNo5z7f8wash7b5lAeXPleGm13?=
 =?us-ascii?Q?/inmUa++Ejka9sp10YQIEvFmYrlphKMmXErNpCj/PRcMOa/pivcIqZJxQR3R?=
 =?us-ascii?Q?/pP/H8geA4+FMzwj/cFVE12DrBiDfIp2jKf54eR1Pe8sj15ZkcOu+q6z/4rh?=
 =?us-ascii?Q?z4WXsFI5x9SPQBuRu8zOxml53tehXvZdYmeLwNW/Phi3KyRvxw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR03MB8408.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nzLcIeSOtQ+/CdAS3BbSLjzsMWKc6E6BpYgE5dhWNqGMdqIr9zYCYC7q53Bg?=
 =?us-ascii?Q?zDzzyv7hxYHTM1eJMz32H4XxoqRD/ihTe/s2cRZBiOfV/lshInlSaX5evmlc?=
 =?us-ascii?Q?xhEb+rommsDAtyouUyyC4WBZy3fSo3N+xlzk+pGscMDfY3UYuxDhw0OVzb+O?=
 =?us-ascii?Q?g86y7w2a6uyDRel4y8PuWA9912AlOwDfSJ/bLM1ntJ63CuUKrpu1BvJ3N7Eh?=
 =?us-ascii?Q?KZDzIvzn7Q43WNa/vJW1Hru3FPzt1dXYMboPQyacn2lJeismSOWDPtPqogZo?=
 =?us-ascii?Q?0Yd2XHNY4R9f4BK2e+XGhI15khN5XW2/k81o16GaluNGk86UuL9qMioufdd/?=
 =?us-ascii?Q?gJF6VI2ANeV4lohIxNARKxFelpFjVqVpIos4rBJH0VLQxw21keYJkoVak/rx?=
 =?us-ascii?Q?Ha3tc4rCjiuj7yGZ5llG6ox5bxKAfcMzUajzip9WqRHoQGMSTIXmmzltKrLi?=
 =?us-ascii?Q?T+UYaM8gYENHEPDQiO92fPYy4FlB/j2yZShGsyHLkK3Y2nEx8HUpHOGhcGPb?=
 =?us-ascii?Q?5YCS1l+qD7DDFSLaDdCDWyX7H/B11evzwVacQptDkcweL3P3GZV79Mu8/EXQ?=
 =?us-ascii?Q?Ci/xrah7s4lI+c5pBlT6MF447Mn/LaYsucGVNpKLfOGxuR8Xs6+XTEOF96xt?=
 =?us-ascii?Q?gkT3LInjvF+c93vA0xLVIMlmBz5LWMd2522ia163vPbKOF4Wzz2vffhJ+0DI?=
 =?us-ascii?Q?vmGc+cQM1EK1Mm1vYOb2+alQ3hIFIqVkA9mm78GVM4bqX4M1AqROuytAqhiS?=
 =?us-ascii?Q?+5VoBGxi3MKaWOdXuC2+emjH25hLOy184Vxo/XiUI26l8+rTjLmzdrjgr2Yl?=
 =?us-ascii?Q?EyNl/GTvweZog7r+P8flQuQIjT3Gu7ZZJ7LjdGSaCJ35Mb+k67VwUkGKzO5x?=
 =?us-ascii?Q?7zGF9iSrcQwI5l4tG3ozXSNZFQIZXQsW80Nh6Gm/STCKyHysww5WqDOZw7qy?=
 =?us-ascii?Q?Ev0b/ZfAE/5Y28Eqnu5Nbs00OnKgCdhT3B5b5wolHnXvYygwopprvjKft09Q?=
 =?us-ascii?Q?zdxWm6rNZ/w8xDmjYwtoSSEUxJHQC56BIarrAVgEHOzkKYD53szaipWDA+DX?=
 =?us-ascii?Q?aG0zPtBELi22OPOtg7l8N2RkIvfJOJoI44/4HVMx4r/f028/PlDjv6fDyuge?=
 =?us-ascii?Q?9BHB1w4283G4Pu6SWxepxNcvJBYf0ve60iTLfsOA4EifA7snc3iofTYa6zrP?=
 =?us-ascii?Q?IZ99t0j6bw2nr0DkjvkGaX029j3beq1slVKDxXQJNbbcq1MaZQRIKYU45Yz6?=
 =?us-ascii?Q?c06+bbBD1txzjHUsQ3YuXMzI0xS6s/6aOiflQK+4JY5VcgNFQhC+JNK+sHiO?=
 =?us-ascii?Q?pDcpT5l6IewRb1fShcAFZ3lcb4yknnrXJ2MfklOS2MPhOSwyO10I3/CWFWmD?=
 =?us-ascii?Q?7MLOkC6z9hEwjvkP05XXDO9f2KyXDWV6R1A6A5eoG+04sv4slBKn9q831FPL?=
 =?us-ascii?Q?st0yN14wIIfw7YpvgibSO6q0g0nNEcdKT3IccpfXKkDJH8H2Zh8Y1uZaOfDW?=
 =?us-ascii?Q?VeUShiy1/A6tvhhs04L7uzVkKAB4xdlIW55EjWRjaLe8RsZwTXRaNB9lLPv5?=
 =?us-ascii?Q?H9oAL0h+z5Kbgjc89ev9xTr/Ui/9PVGm4nDdAkx2udhL/Usa71wxh6cYdkIE?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ebeae1-4226-4107-039b-08de22b32197
X-MS-Exchange-CrossTenant-AuthSource: IA3PR03MB8408.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 12:49:49.2498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqpf537Ddg2YZmnTKAfcgskLXoAgQg0lbfy+7lbzd8eF3Yul5HKZnKSGwdkBMqUWBSrJSemAq8aS1DewFmjpHIdQtugwGRKK3WXTgfW31IM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6096

From: Frediano Ziglio <frediano.ziglio@cloud.com>

For xen.gz file we strip all symbols and have an additional
xen-syms.efi file version with all symbols.
Make xen.efi more coherent stripping all symbols too.
xen-syms.efi can be used for debugging.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- avoid leaving target if some command fails.

Changes since v2:
- do not convert type but retain PE format;
- use xen-syms.efi for new file name, more consistent with ELF.

Changes since v3:
- update documentation;
- do not remove xen.efi.elf;
- check endbr instruction before generating final target.

Changes since v4:
- simplify condition check;
- avoid reuse of $@.tmp file.

Changes since v5:
- avoid creation of temporary file.

Changes since v6:
- install xen-syms.efi;
- always strip xen.efi;
- restore EFI_LDFLAGS check during rule execution;
- update CHANGELOG.md;
- added xen-syms.efi to .gitignore.
---
 .gitignore            |  1 +
 CHANGELOG.md          |  3 +++
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 25 +++----------------------
 xen/arch/x86/Makefile | 11 ++++++++---
 6 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/.gitignore b/.gitignore
index d83427aba8..213972b65c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -222,6 +222,7 @@ tools/flask/policy/xenpolicy-*
 xen/xen
 xen/suppression-list.txt
 xen/xen-syms
+xen/xen-syms.efi
 xen/xen-syms.map
 xen/xen.*
 
diff --git a/CHANGELOG.md b/CHANGELOG.md
index c9932a2af0..3bdcc3b47a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -65,6 +65,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
       for hypervisor mode.
 
 ### Removed
+ - The install-time environment variable INSTALL_EFI_STRIP is no longer
+   supported, xen.efi will is now always being stripped.
+
  - On x86:
    - GNTTABOP_cache_flush: it's unused on x86 and the implementation is
      broken.
diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index 11c1ac3346..c66b18a66b 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
 Once built, `make install-xen` will place the resulting binary directly into
 the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
 `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
-match your system). When built with debug info, the binary can be quite large.
-Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
-of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
-to any combination of options suitable to pass to `strip`, in case the default
-ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
-unless `EFI_DIR` is set in the environment to override this default. This
-binary will not be stripped in the process.
+match your system).
 
 The binary itself will require a configuration file (names with the `.efi`
 extension of the binary's name replaced by `.cfg`, and - until an existing
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d900d926c5..1a8e0c6ec3 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -147,12 +147,7 @@ config DEBUG_INFO
 	  Say Y here if you want to build Xen with debug information. This
 	  information is needed e.g. for doing crash dump analysis of the
 	  hypervisor via the "crash" tool.
-	  Saying Y will increase the size of the xen-syms and xen.efi
-	  binaries. In case the space on the EFI boot partition is rather
-	  limited, you may want to install a stripped variant of xen.efi in
-	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
-	  docs/misc/efi.pandoc for more information - when not using
-	  "make install-xen" for installing xen.efi, stripping needs to be
-	  done outside the Xen build environment).
+	  Saying Y will increase the size of the xen-syms, xen-syms.efi and
+	  xen.efi.elf binaries.
 
 endmenu
diff --git a/xen/Makefile b/xen/Makefile
index fc9244420e..5ed029fed1 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -493,22 +493,6 @@ endif
 .PHONY: _build
 _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 
-# Strip
-#
-# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
-# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) below
-# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
-# option(s) to the strip command.
-ifdef INSTALL_EFI_STRIP
-
-ifeq ($(INSTALL_EFI_STRIP),1)
-efi-strip-opt := --strip-debug --keep-file-symbols
-else
-efi-strip-opt := $(INSTALL_EFI_STRIP)
-endif
-
-endif
-
 .PHONY: _install
 _install: D=$(DESTDIR)
 _install: T=$(notdir $(TARGET))
@@ -526,18 +510,15 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 	if [ -r $(TARGET).efi -a -n '$(EFI_DIR)' ]; then \
 		[ -d $(D)$(EFI_DIR) ] || $(INSTALL_DIR) $(D)$(EFI_DIR); \
 		$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_DIR)/$(T)-$(XEN_FULLVERSION).efi; \
-		for x in map elf; do \
-			if [ -e $(TARGET).efi.$$x ]; then \
-				$(INSTALL_DATA) $(TARGET).efi.$$x $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.$$x; \
+		for x in .efi.map .efi.elf -syms.efi; do \
+			if [ -e $(TARGET)$$x ]; then \
+				$(INSTALL_DATA) $(TARGET)$$x $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION)$$x; \
 			fi; \
 		done; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).$(XEN_SUBVERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
 		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
-			$(if $(efi-strip-opt), \
-			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
-			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
 			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
 		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
 			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 407571c510..a154ffe6b2 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -228,12 +228,17 @@ endif
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
 	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
-	      $(note_file_option) -o $@
-	$(NM) -pa --format=sysv $@ \
+	      $(note_file_option) -o $(TARGET)-syms.efi
+	$(NM) -pa --format=sysv $(TARGET)-syms.efi \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
 ifeq ($(CONFIG_DEBUG_INFO),y)
-	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) \
+		-O elf64-x86-64 $(TARGET)-syms.efi $@.elf
+endif
+	$(STRIP) $(TARGET)-syms.efi -o $@
+ifneq ($(CONFIG_DEBUG_INFO),y)
+	rm -f $(TARGET)-syms.efi
 endif
 	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
-- 
2.43.0


