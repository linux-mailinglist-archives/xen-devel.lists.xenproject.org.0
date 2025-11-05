Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2442FC36606
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 16:39:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156269.1485489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGfaV-0004hG-Gh; Wed, 05 Nov 2025 15:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156269.1485489; Wed, 05 Nov 2025 15:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGfaV-0004fC-D0; Wed, 05 Nov 2025 15:38:19 +0000
Received: by outflank-mailman (input) for mailman id 1156269;
 Wed, 05 Nov 2025 15:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LQE8=5N=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1vGfaT-0004f4-CK
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 15:38:17 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71b04a17-ba5d-11f0-9d16-b5c5bf9af7f9;
 Wed, 05 Nov 2025 16:38:16 +0100 (CET)
Received: from IA3PR03MB8408.namprd03.prod.outlook.com (2603:10b6:208:546::19)
 by SN7PR03MB7274.namprd03.prod.outlook.com (2603:10b6:806:2de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Wed, 5 Nov
 2025 15:38:12 +0000
Received: from IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39]) by IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:38:12 +0000
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
X-Inumbo-ID: 71b04a17-ba5d-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kv2riC2p0IsOS2R8daFtwipQMEVBCt3P0nGK0pFMNG1yBD5l1KFlw4wfcXzAY7I3R7XGYqTrD4TEuYfFmIJ3ArgQV+BfW+mH527ARU6tNIrSj6Xy+G1evrQ45P7WfmcLG+wUUdTbTpyO+fCoYBp3VTR2giRzse2tq04lJPy4fe417DM9LAkogLnBaua1CC8f5x+x0MHqwpFfWu/l9xSYDBFCN1KvI+c8sX3JXajTC4ZhFAInxpn6CnUtVM5gyHsTY/HokjMShRQRrBbLtbNXgPsYZ/PLSqNGL1qB+obdrDV76ecrKxQBXG6n3u7qNKXTMq/aaxnl261aBspTbwIykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xr/Jgw2Am4qysIvxH3wQiBZP+IxqXV/L6Jxm9tgoLB8=;
 b=PZUIui12N6Mb446jjY+3qqjgmUmFKAGXW31+ul9a6qD1i0iOn90/sJjCqGyYEKHp3I0AWmyg2eMmy3TqnEjB3OsYtoxtHvdfuWIC2BZ/ARb1gP2cVLM0gnteApcG8daH6uiIEm/5Xwi1164kTGehLUh7Q7PiEC0XPD4KgEJ2Yjig/HVLX6v8rEvcaBvHMPSI+H4lm9xMRtVVSzIWP57e0ZcKmxW1u9d+OK4lTFNOlaAn3CtCNkvZjUEPE7F13j1cwAKGUCUDG8NphgqzY5CCgDy6ZxlFEoLhXI96POP2xcclsXsqu0RRWq2ZvHg5Qch/xb5lR7GAXaExHMPHxX3SsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xr/Jgw2Am4qysIvxH3wQiBZP+IxqXV/L6Jxm9tgoLB8=;
 b=TOSgWlmdu94Jn7v8vW+PyFSk8E1rk9CDI9Tqa1lFZbZ2c7mOW+f9Xz48oPilA31NZsnbV9jO8LkkZTQUzWwX1uBeMC/Ms3sdT8+4laDgBaRpmCpvCqoBwW+4MBzHzP8vHEhXe3oJOj6eMAD0iw0q7iJHlLN2wKEMstVKxCAgquM=
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
	Frediano Ziglio <freddy77@gmail.com>
Subject: [PATCH v3] xen: Strip xen.efi by default
Date: Wed,  5 Nov 2025 15:38:08 +0000
Message-ID: <20251105153808.20278-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0231.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::17) To IA3PR03MB8408.namprd03.prod.outlook.com
 (2603:10b6:208:546::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR03MB8408:EE_|SN7PR03MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a406fc2-4703-4d65-2645-08de1c815480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tRCrF1w+jpiJ0uJan+EuExioFmR6tHJ1AnUaUTTVd2E6PSjz0BcqjnOyCuEJ?=
 =?us-ascii?Q?WXD3DH8bLm3hVnXFwnzc70ZYFzrnkGJ6hwxFQ145AzlkdZz0GCaIQp0aq8vz?=
 =?us-ascii?Q?8LvTd/8BXS95ED6f90cyzhzb+dk5Fp8OC/FCjRSL9CiLOkgDinGqpQlZRDLq?=
 =?us-ascii?Q?fN4lqg3J52Uw/titJZF74NQNfaqpBgAZOyGHFOekkCbLWxjkV2MYgEgK/AxN?=
 =?us-ascii?Q?fAX89eEOMU5gF4dk+o/WK43mcoFTKnr91A4Z/oAISg/k7AsT/FqoK10W+BoI?=
 =?us-ascii?Q?Bu4ZO9F4078ur2lvF1wQxj2O2+vRfkTtfR+3wlzdIlIFsYgPMx4/Ld540A5m?=
 =?us-ascii?Q?1M4SaraMadByupdo+SS3L7oa7qb/saDQwAOVm5vtOs1BcL7yvxc//BmHG0p8?=
 =?us-ascii?Q?TD8xXO4M3XZ15sm1a8Pdncn2CSI3Ud8fTDRR5thshO52fKuBUJpeGeF8sOm+?=
 =?us-ascii?Q?A8Vzj1clM4kmOFLKrsrxMy5CfIIoWn5mix8vUJRvkTJMnSFymQWiq0FAX0iy?=
 =?us-ascii?Q?FfSv6xiYDauOS9VMT7jVPtrOKuJaeO60lxdwuUkPyWIkn3D7Aj90y16vJAhp?=
 =?us-ascii?Q?BXdcsrSuNh3i8fWTTtRTwKu1LeCYARHVkZhhOrr0exOpXF94gazm1GvLQKiz?=
 =?us-ascii?Q?2YrWk78Umbxwd7QbPhfQhpHuxRdrDn6QFdIxsV5m5rXFxj84CU4nzY1O3nwF?=
 =?us-ascii?Q?/b6F4rUS+Np9+LanC9qwSXQg3cQFnvyunjZl/HPSRcflvXV0A8rHepjuxc4w?=
 =?us-ascii?Q?rgEtr992GjAShUWXboUqq6uGG93B5ivYfB3Qv/zDVi3VaKhc0rN4uX4wvSk5?=
 =?us-ascii?Q?9LnTm6rmzIOXKDHdt2qbNIXUoyU2lKosdwHyMPfozpLueXy7qSZVSDbGfDm1?=
 =?us-ascii?Q?R5obRPJTldxVvp+gderIldYZIR7nSMo8MLVtitvXesTyojcOllMtTRgBng+M?=
 =?us-ascii?Q?lzl5U3ebHlzaGnZuuyym/FxpRPbltiLaGmhNzLSRr43Gzkj6/TR/JuH35O32?=
 =?us-ascii?Q?LmsKwWGMGKDQhP3ClzwObGAfonw2VCrofUNsFtVqcTpeEVS5jTPJhVGAhNPF?=
 =?us-ascii?Q?2PkSuOmc1bgv8K5EyVjZIvNi6TLWk7P+JOvuqXfsjl7HKpcB02hWQDT2egsp?=
 =?us-ascii?Q?GQockMvDNYCsw/oauP233Mkol6x+cgDaPMLbtSyiFIX3fwwMbFDFcHPUgii6?=
 =?us-ascii?Q?yG7ECeMUYDZMrIYfO4O1XxmrLUSr7ZXwlc2N7Fjj+gKYVKdhusd+5TC0cmZH?=
 =?us-ascii?Q?Pk7YGi4V7uD8Nyhe+dWF0t5yEAwFB2awJSggmByprnUL4AaUVX9x+UW6u/Vi?=
 =?us-ascii?Q?xpILIg9USGAx7W8RCZSxZz4eb/PyBq2hTJ2LGUoE1G2ifgNsUcG+M0s+BNLx?=
 =?us-ascii?Q?VOao/Fu4Hf8CIn88xCM9bLcDwwfKoNw361+BbTDmEWgsQbn2fWzSMAYalTEc?=
 =?us-ascii?Q?PF6te2kMo7vi2ySgXEXWMCKO5NoYuPdM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR03MB8408.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2JoFFLWpiPa7v4ndsP2ztYDZWiO9SOuNX0wjb/H+wXo8u8jxM2nTyi2NaXQu?=
 =?us-ascii?Q?N42pc4MdtP1IUx+7X3YhDNE9FDxpcbYbqKH6BY3t/U6gXPzhKLZfIERTfcfE?=
 =?us-ascii?Q?BQvKD4bBYd+Vp3pgVfjgwDiIHdrTOyXHGkyxVIZBJxKTx2s78881nM526QcW?=
 =?us-ascii?Q?pk48jxEVtCT2MtkuaTsyplhxP7zyQ2nyQIe2MmgvfU+2W5HYZ8mrYSVXg7OA?=
 =?us-ascii?Q?7TCXfqIpTqapCXSyJCWDZIZPrQvNrbittKWN9jYLU6YfIR/LHNrlzfF0QaLe?=
 =?us-ascii?Q?wk/UNgJum/tNp9w6qzbeYlmTDuoy/hOihJJ9Kt56KUWnfRflfD7LFACozVoF?=
 =?us-ascii?Q?CYLAzytyDamQn4g3jglMlzNZMqzqIfciptAapo+Zytn5KUoXDDleFfW31mGK?=
 =?us-ascii?Q?Ozu/1G4F+bT6kQ4duk1CbG6y1wudAYEZCPOuCrptYeeX+n6K8SpbksQ383uL?=
 =?us-ascii?Q?69BkHaO+7woiy93JLM44ETLeVS5MBg25gUhx/baISqTo0QPZkMS/mEMaSc/x?=
 =?us-ascii?Q?1B7rtwABFQn0rgtrLtTRPjDTm9T1wF5uDm79tkE1rBPVGmCVHIUgaa9EaeDx?=
 =?us-ascii?Q?GnpQNC/5+zFFz2Fg4Ji9FpekaL+1qPe76Y+R3+B8fU3x3XUtnSn1Xw/sF81G?=
 =?us-ascii?Q?Dtp17u81RCzhqqklvlns+5Obi5sIXdlisBvyCj1vsyrLo1mALLZktHQ/2iOA?=
 =?us-ascii?Q?YO0zOmJRo3AkT8A5Cdce55Ta52lodNCEtFxl9Bjc1+cn8n2MZtR6JkUJiutK?=
 =?us-ascii?Q?pHoiYFTgMCi91AlvbNTXkzwiKMNnLo7e/KIdFPfREnjHhMOP9WPgA4z8yXZC?=
 =?us-ascii?Q?v5UT5Rx6VBOxxMEeZVkLaT+zjksnYSY3hmTzEYVhfxqmKLSVuwDLqKYX8uni?=
 =?us-ascii?Q?oo6G9vRgNKy3gQZQfOEv2bouqyZps9RQsTVpYJMbC50xGPMXfK1FQrQil8F3?=
 =?us-ascii?Q?MpZxHjxhPHjYf02qO/9EImjN4gLOLT1gnwZFYMeYBvUz3k/kKXibvYDQf0BJ?=
 =?us-ascii?Q?tAxyIRWglqEp9UYteQ9zTjWnkedWcp7GrYVZTfkZf9a2RI1GhatTbbnCchZS?=
 =?us-ascii?Q?upO/52ehqpg9UqTs0UkvvtirDtQWkZhF6A8GqcCl6Pq0+DGmkuYfnrLbGqLT?=
 =?us-ascii?Q?pAhGfDzn8TFm2whTG1DIb0LVoZfkybThQGWmAUCe3JA0pBZ0JXK6KKgXlJfP?=
 =?us-ascii?Q?raFHzp4d1hlKzHbBy2ZRdvfMs13xejIzeIEEU8G1/zmIMex9R8loZaT4nS0D?=
 =?us-ascii?Q?chTC9uLwFyjECdYhpa07ZBejGtNOnrbOp1jebXazOqUJxAQGMaUWduCvz7YG?=
 =?us-ascii?Q?X2EwNzpXp2VBzpPbomjEldNWg97VWwrL9xP5Al0om1CQZGFt9Qhe0cWXH8Cl?=
 =?us-ascii?Q?yayTb6P2Mea6RABkXPf1vm1h1yyd2tn3s7VQOqoGFIp7CENDzMlssqoE4C0A?=
 =?us-ascii?Q?TMRKxmnK3kHTiPmLi4cAPXclS0kNEkwJYlT11FAiuzMrLraZV537s1T1RCav?=
 =?us-ascii?Q?jkuI7A7HNCDCGmQniVEtYHdqxgXEGe/cg4BkxuvueqA4j8pTpOMzINP05AO7?=
 =?us-ascii?Q?TIII+aTR4kTYBCq9pMz2CcLz/9ChuFqeM3eNv+BGpoeGYD2ZvAUaVLXuh2W+?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a406fc2-4703-4d65-2645-08de1c815480
X-MS-Exchange-CrossTenant-AuthSource: IA3PR03MB8408.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:38:12.7653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrwV/v4ZrMnmf8FtY0AFOXz2flyfXfFbIJZIj7SIGFr62/TNZt3tgLnqEdAsCdNUNshbvynW+RCNtceAqckK1pXSvIy8VCojyRZDh+ptzpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7274

From: Frediano Ziglio <frediano.ziglio@cloud.com>

For xen.gz file we strip all symbols and have an additional
xen-syms file version with all symbols.
Make xen.efi more coherent stripping all symbols too.
xen-syms.efi can be used for debugging.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- avoid leaving target if some command fails.

Changes since v2:
- do not convert type but retain PE format;
= use xen-syms.efi for new file name, more consistent with ELF.
---
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 19 -------------------
 xen/arch/x86/Makefile |  9 ++++++---
 4 files changed, 9 insertions(+), 36 deletions(-)

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
index d900d926c5..58ee10ee3e 100644
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
+	  Saying Y will increase the size of the xen-syms and xen.efi.elf
+	  binaries.
 
 endmenu
diff --git a/xen/Makefile b/xen/Makefile
index ddcee8835c..605a26c181 100644
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
@@ -535,9 +519,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
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
index 407571c510..c118ab7b7d 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -228,14 +228,17 @@ endif
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
 	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
-	      $(note_file_option) -o $@
-	$(NM) -pa --format=sysv $@ \
+	      $(note_file_option) -o $@.tmp
+	$(NM) -pa --format=sysv $@.tmp \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
 ifeq ($(CONFIG_DEBUG_INFO),y)
-	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))cp -f \
+        $@.tmp $(TARGET)-syms.efi
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@.tmp
 endif
 	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
+	mv -f $@.tmp $@
 ifeq ($(CONFIG_XEN_IBT),y)
 	$(SHELL) $(srctree)/tools/check-endbr.sh $@
 endif
-- 
2.43.0


