Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EB0C58740
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 16:44:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161804.1489665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJZUY-0002ZQ-Bi; Thu, 13 Nov 2025 15:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161804.1489665; Thu, 13 Nov 2025 15:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJZUY-0002XQ-8D; Thu, 13 Nov 2025 15:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1161804;
 Thu, 13 Nov 2025 15:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yybm=5V=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1vJZUW-0002IC-4p
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 15:44:08 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96896883-c0a7-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 16:44:07 +0100 (CET)
Received: from IA3PR03MB8408.namprd03.prod.outlook.com (2603:10b6:208:546::19)
 by PH8PR03MB7305.namprd03.prod.outlook.com (2603:10b6:510:251::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 15:44:02 +0000
Received: from IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39]) by IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 15:44:02 +0000
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
X-Inumbo-ID: 96896883-c0a7-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqw7BwEcJlG+tKzuDcZCcvQ/vAeOqF64weshL4UbQOiQP5skZqx+FW8jpwm9CXY9fANgmzn5cHy3oqq9dIDC0sDFeBuDucfpcZvd4tvT3gRH7wHZWbO/pNavNPrTa8a7OMXcsZQBHLZbGZfMf1IxNJqLv4lQJi9F3dqK7MTEXYSDfnekuukqo1CGFXOUI6uxr/hHG5A3ez2PgBVI9gu+UaoJ5u2+BQpHjxPlRn+wa9KQH89gfEl15X3e8jrPP6VxUCaOMyvJB83gwBqJybphUMOjG96LtcAppMTvU8fquuw78dkEVHF6FhIBd6JrHmqRvJlC1Oo5x3DBUhcMgovOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNHKH8ocm99RO+7pL30uBKNKBB9icjcrkfVRuEb0iDk=;
 b=YQHr/2FLG4I0E6cvjH3dRYf4yGqGDr4/YkCSoLNTRxj4+J7vMb+fd/ZtTZ5p4g6z22E9qGbpDrKdUmM3qJbRpEiQVnHkPJnEzqu1csGma5oTysNAzYJVkROa6OEEjT3N3kBlFCqzl40aXiehXVKpIS3CRb3xMMBQJOOp24zmQJFCKC7qrUFpDgdYDZFu/8bfM2uxw9uoAX0ksjWjKIE+LLOUh1Wn6cFAnpsA4MeOddyji0XqPRvEQamklIRxfN2BThKr2LkrGznEErW9dQzbQYT29VdNJ1YC3B44Owzz2sONTogqWOwGzEUhoB9b9U4cOBR4PMp2UH9bNXDLRPC4Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNHKH8ocm99RO+7pL30uBKNKBB9icjcrkfVRuEb0iDk=;
 b=pj6aMqtu/Z2Etasuk5SVeiFKtA1AiwOAKp54IkZloC51oxDY19kSJxvdH4mc/u4dfxq0kFvlm2C03t6WS/siQ8so4Ao4zJ9TDSFQhZOUZZTGwTQE6COFgtdJEjuzhd9kZgPVxGcY35+wIEnccB1Q+GPBaU0ny90Zy4ggRXLqZ10=
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
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v8] xen: Strip xen.efi by default
Date: Thu, 13 Nov 2025 15:43:58 +0000
Message-ID: <20251113154358.28704-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0244.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::15) To IA3PR03MB8408.namprd03.prod.outlook.com
 (2603:10b6:208:546::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR03MB8408:EE_|PH8PR03MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 36463af5-d01e-47ab-ee7a-08de22cb7874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qiqA5rRkmZD9zC2+34PJNOBwcFyFxABuq/PDDkAZl9vpecP+uRkve+npzM03?=
 =?us-ascii?Q?6XV7x0QKUdyPZUDFIGfnOvM7pu6SVAPS0PZux/nCHn+MvGbenAK9h0yQH5VQ?=
 =?us-ascii?Q?7Vwtkbg/2+vACP4HRaMDBP2dZ06cEqHRvIS8BmG5RyDan+ifQwfz0Hehj5g3?=
 =?us-ascii?Q?bcRNoOpIONXCUVKHTGDHjXuau/7uBakXv31BwMBFwefSBT8cKJvgT3UtIpNh?=
 =?us-ascii?Q?iW5FdC7mqzFW17SvS/12k58kbW6jfWC4Pf6a7G7+gFfhDlZDSO1W4PV3VkRv?=
 =?us-ascii?Q?DFDea8z3/Qdz2CFH7F/ObtGeuyJNcLPc5In77xyCuxhIUuFZ/5qkKtRu22vz?=
 =?us-ascii?Q?GhwRnupzOxd4NaAiAMabf9HRfME8M1AmupcbncxqP03w8iDrAufh9rcRZ4fo?=
 =?us-ascii?Q?j5pSveu6s47poYy1V+Eac2ZxR6M1NnDaOQ9FKtDrWkrORXRqt9ryedWFC2q1?=
 =?us-ascii?Q?TKcfzztXKD8JAL4gMS9ldTg2oONSdknbWgnVSQQdN0aq6i2bN/+PqJFcqvrM?=
 =?us-ascii?Q?3oKy4NYDOH13p5jdAHpUDkAT6BBi+HDdvzp+E1zpLJrEgrez6NeOuRxKGHAb?=
 =?us-ascii?Q?3rgPNonkXahdw1mfY8nC+h83WMlFqCIVp0/ZtuGbixY0oZHR2nDjdzq0/b+g?=
 =?us-ascii?Q?vHUkPpqzKDOCshI2pAk+Ahsaq95alFlX78eV99UvoJRB1Wat/YzaE3CIMZvs?=
 =?us-ascii?Q?KInqYWgdqHcXwD2mGGYXakTge9iIhIRHQDkHWUbXEfzGiwUVPmOnlrOz8HEg?=
 =?us-ascii?Q?KItWrouoToYNGFXCAN8g4WkBwkFW6HAfoBzLvYyyRRfm9Oe1e3Pp93oOTRDW?=
 =?us-ascii?Q?ULOMwXCYcHjhCwQXFjZq/9BW3k7KFdhYl+bzO8L4nw2hIBHsBwIvCZu3jpEE?=
 =?us-ascii?Q?t8iLwVAHj8f8MvOq6Cxf1rkZNPdxYCNazuagfzLyxQFQzaogD24Yk9cXUhB4?=
 =?us-ascii?Q?nDnnAHXfgrIloDbed/3gTh+uUuF1bQUH1WwMmuwckssGhmN3cOZ60zma70B/?=
 =?us-ascii?Q?HNGzPPjhiuos0v8i+KaxsEgPvH+gs4YjqkzrLywWAX0EyXQqkSrRgI0x1P03?=
 =?us-ascii?Q?Qm08wwBRoHk21bOX8IECjB8AbKwjwh50SOdz7iGZZvuEiRfahC+Apiw/atU4?=
 =?us-ascii?Q?TD62DZCdxIYcHzh3WsgHIFBDSfuf8xqigUhp75J8JQgWuDsNIaFO67DhxkB7?=
 =?us-ascii?Q?MS5FQJ7iSTcwl4ESsQChEb+nJkXcsetuAjLHY1ahA/AbkmKv0gWDEoG4+mGV?=
 =?us-ascii?Q?Y2O1HFS518jihL/i5EV/2Ulm22RWrjDDde+706wwHrjI/RYUpSzW0En/iJ6M?=
 =?us-ascii?Q?un1KF4+SiAd6SALbXjzhQLwvStSXH+8UPXeih0fy07pjPQIf3smyDl2Y7Hms?=
 =?us-ascii?Q?CS/z+o77afq3k7ge5ZF0djZ+ZwGFQz+nItUZskaNePHF7Cn57A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR03MB8408.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VwfS5D0mK2+QnSU3HV8w8M5/EPn/6VZznokqgf/PNEsNsETvWMaNieClkQnZ?=
 =?us-ascii?Q?WKCPQDfJoE5RGIjBPni+P77hMDhuPayrx05Y/bjFl350HEv6UCDv9rpLozhI?=
 =?us-ascii?Q?4+U9UD6N25nqvPgMtlkybeqZQBSKI52IsIs64m0JNt/74nAIn+ft/oETmrlL?=
 =?us-ascii?Q?Hjvqonm0q9cZVVh86CQJyFouXb/Dtx7qQJKQE7QE1yMNBCgr2hz7ZKzI3IxX?=
 =?us-ascii?Q?MJ0Wc9+FTrQxbATSNhJ9OCI284R4HJyHcp/avPJd/TMXzSpBJ7dn07MfRvHZ?=
 =?us-ascii?Q?OEJsE1+iCXxp0x4H12ExqE6n5cOvR6i/yvOtAJZlJ0tsV22vchp77bz+BfEP?=
 =?us-ascii?Q?VXrP3MOwDX8DqNxcU+BySEa74PKKp7qdJvn/1eG8E69mZsl10Tl7+HcO79SF?=
 =?us-ascii?Q?22QBM1Pm09Kg6hlruz+ytFuIqDC+8ZzJXabuno4wL/GK9mFd7CiPCIKqhZv1?=
 =?us-ascii?Q?fKU8lVcKwO4PRekfnXAltVzac/nmcBpxFDnwwZJX8Wd806sOByZNieUGyX7U?=
 =?us-ascii?Q?zpuJp6Bf9YWEO9tch+no+R5cx/6PGdoNAGmc5tRfJqajRrTKNr0vDN22DKo9?=
 =?us-ascii?Q?o967aZbyv8XG8QbTtivjQvd2IAlluwItdBbYdWVq5gfIO2YBsr+SAcDdzPSU?=
 =?us-ascii?Q?Nf7GhzFvkzkL25IEfBaPWI0abHuXeLmuKDFQl99h8sgsfiYBYC00JLsFQF4s?=
 =?us-ascii?Q?uHNltie8NRQGIz6AhQ1hCWG/8WVbTy8+WNqjRoN0/PgpvoeTezd7vwapVOdC?=
 =?us-ascii?Q?AcgCzqna1BcmLLQQeesfIfnEjrId+i929Hl7hC+1simfKS/vrbgJBOwjj4SA?=
 =?us-ascii?Q?xkV0pgD+hUzlIovdDODxrxJp0LmYQ3T1HvsFrj5NWNN3VhVB5elVoot2lYgs?=
 =?us-ascii?Q?0S/2x/QrTW9sF2Pwe8lKA4LWofLyaNG435qxwLK99g3haYYsXdcV2pFGkuJW?=
 =?us-ascii?Q?IC++vXozv/bj2VQYC/FyY61JUzzAZLHXKrxpCi2RQpEFsAdFtsfL0uhEKcbR?=
 =?us-ascii?Q?mfU0tPu/00P60UYXeaihF63O7U+GsT51xC504G7H/t6xs/8LHy3lh6THXkXx?=
 =?us-ascii?Q?x9m46MScsU05I5B4c4IYPYAZ+m3r2y04IQFPlvDzJO+4ST8ixehav88S4Rl8?=
 =?us-ascii?Q?V4VGw9ZJRhaNB+gh0pnrKio0vXpWuOoQPhE7Obw90vMoVoBJ4TEDMS+lTA+O?=
 =?us-ascii?Q?11w1d8xcXcaEPbXVfVkN3kIIPOchxNG6M7VI2XDZa7aaXPFHlU+/nLD1HmvE?=
 =?us-ascii?Q?PY8gcMzrFipfW3KrO7n/NUijk9OEMb9vZgn/U0/FNmSB+mUvrxbRkvxIkVim?=
 =?us-ascii?Q?qainNaNlgCBhpUiiu6gmURQfHlGHImoNodnVUbFwlbeQencHooOote9emnxM?=
 =?us-ascii?Q?pELY/vawpmEC4wuIoJXO3dnxJ+8wvmggSb+0ddg6CMfByE5QlZJAa6M4RPa3?=
 =?us-ascii?Q?3IZUG73NzIXSqhnDgP/qnOEVcPYa4apFh6VmkC/p6i2OLjOK0EOo6kzb0sBL?=
 =?us-ascii?Q?QqiIk14kCWq3RqOJLb/UEvyTVrhP++1jdQ5d81/cMw/yM/JTzRLNOR3bKjAo?=
 =?us-ascii?Q?MhJT2RvJIkLlpGXWvyulVykCw40g7ZjxckHl4mVe0X4vgvPeyNCpjGO9zyj5?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36463af5-d01e-47ab-ee7a-08de22cb7874
X-MS-Exchange-CrossTenant-AuthSource: IA3PR03MB8408.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 15:44:02.8381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nn6pAe1UPwn8IoeTh13r7UhSZf+kl10lF9X6e/rYKNaCxgzpVnlkIWiP77MOZcl/ZTAyemdcuOo7tHZ4xt1Anmw3U9/dRTpu9NRPx/WkUmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7305

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

Changes since v7:
- move and improve CHANGELOG.md changes.
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
index c9932a2af0..bc16e316e7 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -34,6 +34,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      BAR for HVM guests, to improve performance of guests using it to map the
      grant table or foreign memory.
    - Allow configuring the number of altp2m tables per domain via vm.cfg.
+   - The install-time environment variable INSTALL_EFI_STRIP no longer exists.
+     xen.efi is always stripped, while the symbols remain available in
+     xen-syms.efi.
 
 ### Added
  - Introduce new PDX compression algorithm to cope with Intel Sierra Forest and
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


