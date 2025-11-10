Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5BEC46BBF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 13:59:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158349.1486691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIRUE-0003x5-Ak; Mon, 10 Nov 2025 12:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158349.1486691; Mon, 10 Nov 2025 12:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIRUE-0003uj-7b; Mon, 10 Nov 2025 12:59:10 +0000
Received: by outflank-mailman (input) for mailman id 1158349;
 Mon, 10 Nov 2025 12:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0MZ=5S=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1vIRUD-0003ud-3W
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 12:59:09 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b2561e7-be35-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 13:59:07 +0100 (CET)
Received: from IA3PR03MB8408.namprd03.prod.outlook.com (2603:10b6:208:546::19)
 by SJ0PR03MB7150.namprd03.prod.outlook.com (2603:10b6:a03:4eb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 12:59:03 +0000
Received: from IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39]) by IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39%5]) with mapi id 15.20.9298.007; Mon, 10 Nov 2025
 12:59:03 +0000
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
X-Inumbo-ID: 0b2561e7-be35-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RT8uYT5qv1JbuhDHpR3UGR2nvEx7lvbZQsFXvyeoVsG2EX05LU9zA9TSD2mmjvEOqKuR8Gm9LpIRbucD4eKj9nMX4ud38Z4br0egb2O9L92//jx/ZLsb2cbIqbxcy493h2nRdkSH54QutCNB/VkWiz4bBAk+u8eh2C+yijuWZnI2iyWUv8mvqwN22XfRFzwpoYVWHwYcaqKnMkz66hMQZy4YK5wMFX6FEHBuUA45VhMz4sxwmPrqV28WvkzVKimSVgSVHKgMFhSIpnQY4SjKnsdfdUuygnENyOK9emCL4cHu8XlgvYLpV4jZ7EMFG579M3skZ5vAC9RZbWrl+cxh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgnsOP1yOnWrKA6YRpqlH9/do+T3aNwg6qIwmyShu3k=;
 b=Pmto2NOCsialzCF0wcm60sH42hmtgN7pMmxGZuZVxbXKBQC7VNG6IiuGSuKzev6Sj+Xj965cjQFVOH32o/VyZguNuiAU2PMvFUPFN0733NwwHd/TDljNpATCxc8umoq8nQzTUjed4B09/mU1l/QtnlR9xjcm1jYiRDcyNOXnJOofp3XzSYU4ABn7HENkQK7wv0BbD9R2J8/T+yJC3ot7ybn6njiIN8rUQwLwKW+NtXhfEs2G9XVk6pkNUTZ9evvvr2Up/5vb0QIJDXuNT44HGU3L16R6GWKtZ+1ST5lxMnszazF3HKyz+BvekqDQKTfK+Sfb1Ize1NaZjQ6cQavTjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgnsOP1yOnWrKA6YRpqlH9/do+T3aNwg6qIwmyShu3k=;
 b=yAJGP1J5jh7fgC5ykGUZvAkd59Zqn/3KZ0vacy4yNiMbxNWOmmn++9Ln2426LbfOkV85F5MIfGapJBU7kWDgbmN+kCN9lFvAVPjOb3sro8sMT53jXhUo6UwJcJOwwHuNVSWTt6KiK6jQMFnsBMtdQ3Et1t/uv84z6Ll4Ci8qaAk=
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
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v5] xen: Strip xen.efi by default
Date: Mon, 10 Nov 2025 12:58:59 +0000
Message-ID: <20251110125859.78124-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::7) To IA3PR03MB8408.namprd03.prod.outlook.com
 (2603:10b6:208:546::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR03MB8408:EE_|SJ0PR03MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: d0cbb7d3-02a0-4b96-543b-08de2058ece7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YL3x+JUbfz3c3h81f+0dQkIYjbnHMc0H+/G4i5pZOItzQrBF1ZmuSvFFk3uI?=
 =?us-ascii?Q?QS1DVKWtLboBqQ3MqhW720i3Mw05LqgRdLz2kLG4NlSmfRpaWw1Y14fAwjX3?=
 =?us-ascii?Q?e6DXN3O/LWvi8d8b9w/bXYJANtCKQaCPLrunT/N9LaW11xVmh81xVd4NOtyF?=
 =?us-ascii?Q?Ue6HoCV8O84WmIpJ6v2Yp+00rH06XJS3owsmbl5p+CtNCvvYH0sCBV7b6axg?=
 =?us-ascii?Q?atpVnssnfP3iHyGtl0XXt2reqJKLmmzZP1L3DIiChwMYkRvWi2YX76H8nn3V?=
 =?us-ascii?Q?Ikow8HM32HyJleFb01R5xhkomPmo6peeJde9e2E/SfSYy2SUGqbZe/9OIP92?=
 =?us-ascii?Q?VnYey6u1QGxvr9/NrRtOpJaXpGdI9e1njcAnRAwC5yEflDDvNr/p5rsGtFF1?=
 =?us-ascii?Q?rC+I8EtpISQY9eoIgNRhu4cIkwx2NroZOQ1PvWRf1cBe4f5JTGkHCgIjnGWK?=
 =?us-ascii?Q?VjQbtKwohXsLK7HSwCjA5Nh2Na5ECx0i9rnLvuC9WwjWNWzQik0CMbiqIXym?=
 =?us-ascii?Q?sMUHqwQs9qVcAWttFE6xEIGeC3CM66+XS7VQTAPxJJ2WwId3Arld8s3QJtsP?=
 =?us-ascii?Q?8m0efssX9dzUQ+Rr8x5JvKoKyjxnY1yKF4094TZwUIGMCyQaRnXx+1XF49RM?=
 =?us-ascii?Q?ZVk0BpsGzrkh80NBX1TUpwsWBMj7+eMw9M5Y+r2V5csPgnHrRaoR3R0Z5YuO?=
 =?us-ascii?Q?K5Ng7ki9+g3ecWZjTPuvhoI2OJWO3/kEX31hIXWTiB4LhXUZitSkKEXomfKp?=
 =?us-ascii?Q?DJjli8hbeg4CUDKJOc5VifsegZQDbDBT5xFdk+gXiaDbEeZCW7TejakqEZDX?=
 =?us-ascii?Q?3xY7tx7fBR6yhFoQuNyAZzKJqsYj7OQ82A+XGBc9dTn2nVKrDMiGGThO1IT8?=
 =?us-ascii?Q?cPMchO/A6BeNKO+KlnpMALB0RbhaJAI7wRQd8seihi4nUe4bIm0IgbYTDT3W?=
 =?us-ascii?Q?fXIYUiIjIAYvL2pquIydmFggZcMpsAdexdB0zK+1sEpF8yQyYp8CXYARv3KZ?=
 =?us-ascii?Q?sxyAXqCWtXvamjxSm1pFLVtrpySFG8z5W0f+82TgfcN1RR2AROOA9n3ZoZJO?=
 =?us-ascii?Q?7Zn3BFzm7W9kbZ9Wz3NxNbMUX9g/Imlb4sgxUoZPceT+u1Y4l+5Q/NQIm3wp?=
 =?us-ascii?Q?OJfkM0X6CCkQNNCUaAr0ge+SRgAFl9Zw9luDxrgUhAAcGxShxKQjUEQaKyui?=
 =?us-ascii?Q?SCG0TSolv+d6SENzapcNuOmH4z+gVltgajcXbCQiAx10ThIFtZfdoAm40Ekx?=
 =?us-ascii?Q?FFBP7YGhwQOVlPTmY/vTJcp0O7qDVcN1pFWUL3j2N2PXj/vIcv4KXTx0l3Vt?=
 =?us-ascii?Q?qyIks6ITEtxLDUM9jMJTLCoq8VEbDJtzuPr28/pXzB0f9+sE/nHvy+Ypfidk?=
 =?us-ascii?Q?ifwcleuWJErgNyrc56b5b/6ls/Rfxq8XTh7cHtAv47lw4Ar2tXKD10niOIPf?=
 =?us-ascii?Q?NXyyndRNvp83veOMDH1dH9fA2dWxkF3k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR03MB8408.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wuLjdQUPtxAdyxMEewqCpYbEJPvcSuSe47lwmFfqiUd3TdHpRouHAOHMzf7L?=
 =?us-ascii?Q?mdyb+d+qeQ4relQwQe3ptVeMsYKemjvHmn5NBOL4GNZXRBXzaCHEbRkVqiZ6?=
 =?us-ascii?Q?0VDdYxKbmvB/XQ/Nw1FkGf/pnLDcKPFMUVaf8ucanROUBq/ddN6Q7g349pys?=
 =?us-ascii?Q?njEZsSrxlFlnFtRY0N/nXCgg8QOPaAWP0VTGYEsUb8vxQG1UyQVFeekmLqqF?=
 =?us-ascii?Q?X2/11w7XtiFGjUXPe7pXuPjLEZDldKc/B+zdF3YkqM3zIa2GlfIflCWHOK98?=
 =?us-ascii?Q?vyfgCt5qn5hO+KGuIOq2RqWDuH0S3t3J/l0uIsU5MeBv4o1wv71wuRmk4UGf?=
 =?us-ascii?Q?LcCq0NvM4M8l/k48PqxWGAadO002MqPhozCzIqCsaVgxsRPQQbE3bDWCDGkt?=
 =?us-ascii?Q?dZiJKbIDuO7dhN/elLJPVn0Rkm909G27r5i0vrTqhCzOSkuGzjX9mGrYhAGb?=
 =?us-ascii?Q?PVp0NQfVHAXxNMyRfeCNyLjBUqYfKNHirFlU679r675xnzALQT1+5FCiZezW?=
 =?us-ascii?Q?GmkF9j2RWGiKVXCAOrBzevnTdM07lTEGc+vVPaHpEQf42S+tLU+0lHOpwv/z?=
 =?us-ascii?Q?5jxAvEzKRnzfDBg3MoQvPQlpKgMsCt0nXqiLWKfTRZudrp0+hvkfWLHDqKLJ?=
 =?us-ascii?Q?idWeW/3C1QLyuxu4nNxZAekCS13mboDr3aYltY0Glb6WmpM2ch+1TQa0YLCV?=
 =?us-ascii?Q?jIPFbi/Aonl53HEeZntgv2r4mx+fH4xDpI/NVvsOe0TbjNPLG+gURmcFLTYc?=
 =?us-ascii?Q?YGRV5RwlmXOZJz/lF109Q69TMnDvY/LfFlkGoDDqzvA5xWlebKIJ+IW4e/kJ?=
 =?us-ascii?Q?32bEbJFMlo13A4cOkKkhPJdNFiWqjHMH9vPmgULiUqzF5jRrmXXZpa2DbCgU?=
 =?us-ascii?Q?+TkArlOUOFhYGyVuGUIMZLRKo+vCtPWCjWBqrWr8/7G+b1YUYGERY9CRtWej?=
 =?us-ascii?Q?4pj4AMcQdXAq5iTTLgkBPrDsA7SI2w9NcciRBpV05if3O3khmzbzPoBk9IwG?=
 =?us-ascii?Q?8cN9JSOJ05dkMABLNNm4mdtn/gqJm6y5cf/CsCMOHwNVY9eSrNon5EJilAC7?=
 =?us-ascii?Q?zFbKBy+jSsGkiqpICmKtuYorcuJP1ToTwDLjdVZD4T6xoAooqEHeAPvBPl2T?=
 =?us-ascii?Q?5+4Xgu1LYTutQgqnJ3tLe61myQ1YXlMCNImUKp2VayymIgf190oP/v2fDzZD?=
 =?us-ascii?Q?kM+rEr4Gct1kwMExjpgM5ZF2OBg3m2JVbU/MmJxtsa6FrVCQSOrC4RHI6ZPn?=
 =?us-ascii?Q?9hkGPwOPvoRcIluUz/kfcZHtinerM9WYzKP89vwAjPjBrmCSB14+A1eqQ3Lu?=
 =?us-ascii?Q?PCoh7j5Ha2Zxn/Ak7azE6fWSMWX/S6QKmrLNGKwY0rIyrwJe26RPOobmsIRT?=
 =?us-ascii?Q?qG4V+kS4XJ7fsY/B/cX9UcH4D1vVOe+1P/Z7kZZh8WbIRHknItMcoHYTXDAQ?=
 =?us-ascii?Q?KUrrh4oaz3unMyz3NULOU5HnA8KpzLcgrqkUxDtG4WgDIHNgf/aE/05wnNj6?=
 =?us-ascii?Q?9qyK9cH/lzGddUumeGALWhGw3Y+Kaf6qeNnwTOY3/cVncY3z8m/nrGJPbblw?=
 =?us-ascii?Q?fp7y0dRIUNIg2hT0SOfDUZg5peiLTDXZDz6gFg9TU3esfo1RuvPENwDJtwoo?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cbb7d3-02a0-4b96-543b-08de2058ece7
X-MS-Exchange-CrossTenant-AuthSource: IA3PR03MB8408.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:59:03.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/Glwe8dfwpUWIr38kh4+cpsXljNdsi83jkhUtjZr9tc6o+j0EEQXReBb6g/GGh6pSipsztlA+DaTFWBdGp72lEAogYIlfn7AEwyjkwVsqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7150

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
---
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 19 -------------------
 xen/arch/x86/Makefile | 16 ++++++++++------
 4 files changed, 13 insertions(+), 39 deletions(-)

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
index 407571c510..51d8084693 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -228,17 +228,21 @@ endif
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
 	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
-	      $(note_file_option) -o $@
-	$(NM) -pa --format=sysv $@ \
+	      $(note_file_option) -o $(TARGET)-syms.efi
+	$(NM) -pa --format=sysv $(TARGET)-syms.efi \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
-ifeq ($(CONFIG_DEBUG_INFO),y)
-	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
+ifeq ($(CONFIG_DEBUG_INFO)_$(filter --strip-debug,$(EFI_LDFLAGS)),y_)
+	$(OBJCOPY) -O elf64-x86-64 $(TARGET)-syms.efi $@.elf
+	$(STRIP) $(TARGET)-syms.efi -o $@.tmp
+else
+	mv -f $(TARGET)-syms.efi -o $@.tmp
 endif
-	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
-	$(SHELL) $(srctree)/tools/check-endbr.sh $@
+	$(SHELL) $(srctree)/tools/check-endbr.sh $@.tmp
 endif
+	mv -f $@.tmp $@
+	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
 else
 $(TARGET).efi: FORCE
 	rm -f $@
-- 
2.43.0


