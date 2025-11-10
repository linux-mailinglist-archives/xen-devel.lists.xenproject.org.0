Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88710C47944
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 16:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158486.1486839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITxE-0002ip-GK; Mon, 10 Nov 2025 15:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158486.1486839; Mon, 10 Nov 2025 15:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITxE-0002gU-Dh; Mon, 10 Nov 2025 15:37:16 +0000
Received: by outflank-mailman (input) for mailman id 1158486;
 Mon, 10 Nov 2025 15:37:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0MZ=5S=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1vITxC-0001gP-Ug
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 15:37:15 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20fa4008-be4b-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 16:37:14 +0100 (CET)
Received: from IA3PR03MB8408.namprd03.prod.outlook.com (2603:10b6:208:546::19)
 by PH8PR03MB7217.namprd03.prod.outlook.com (2603:10b6:510:259::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.15; Mon, 10 Nov
 2025 15:37:11 +0000
Received: from IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39]) by IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39%5]) with mapi id 15.20.9298.007; Mon, 10 Nov 2025
 15:37:11 +0000
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
X-Inumbo-ID: 20fa4008-be4b-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iH8IuLcZd8gTib2KrqnLMUMJ+kuc6qZ5yjCIQDO6eBJN7rUUFWvOao20/iMW4H3RjHdbqq+ORxbYU22D9vj+G8Bpxo39sFU0HJe8ws7t/izJ85GWqovOhlwOTkpC3RFS8+7oJmisrKUv2ocgm2XMC7IaPCyvlX9id+G1M0CMnTQpxm5KWnUciOIp1saO9GJZ2CheuLMBYylSdhaw8yU9LVmeuXdmSGgNH8shVp95PO+vrS9FELd7hIFbUqa2DnrbVGCMxLLKsibBZ1KEMFrWPrFI+KXlANKtEpE1JMXWqXnwI2gpAscCciTGD0bPzHbZDUYrwH+7yBy5xGvFsxi9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6K6aaajrW8VIEhu3i/NZpMFo2SqpymsLAqSBqEjiJc=;
 b=cCyvQny/22QLw15bGMSL+ejOD6p4TQLgYfNFzQDk5w+7paJQcsksXFe3sAA2hxOQxsO9U5dxguvvZ8jcXZYvre0nf4lBUyK4Ip1wjOOirLFumnh3RK1/YeiS0sp9JKP6LglN10ZEqfMNwUdNuIfPM2R14bZNXUMZeV+KKlKWOb5VeJgHjaOdbNI2boolyhBxwRPzGgFYDHN4CVZ+MR8EIQKgcmwMxB6Ryn/HEiM+QeAK0ng8pveGpEtnRxuEtW5b5wybhiYC3uFA9ttcXoJcou6mvxCc42THYz40fVH9gjfeAtaq156t+id9hjEY1EAGgLIdMhZiD3XlkZhVUvsM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6K6aaajrW8VIEhu3i/NZpMFo2SqpymsLAqSBqEjiJc=;
 b=LDlA3UVXS9+UMn91JRfgUMxdyjL8S/posocAd1IhbagGToSLhSpipBLDIQYpWirERW0Xdo1qQuOylWZn8wP+d8J7geYnt8kW35X/c1iKYD8snro5pOzvLTyujPN/YQhp1doB9+h8bkv3t2L15CNvPCLsRK4r07ccj5fkF1TBFzQ=
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
Subject: [PATCH v6] xen: Strip xen.efi by default
Date: Mon, 10 Nov 2025 15:37:07 +0000
Message-ID: <20251110153707.84879-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0698.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::11) To IA3PR03MB8408.namprd03.prod.outlook.com
 (2603:10b6:208:546::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR03MB8408:EE_|PH8PR03MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cbaab37-ebcd-49cd-4aea-08de206f03d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j6zs/uejU69gJD9sWqio6NKx3jnpEbO5LMZB0doL0xkud4+8f6UMQ5hepES+?=
 =?us-ascii?Q?zkKL5CodETYOxddgof/Z42FKlWmlf9fT68ncwqpqOeeCS1t1gL+M/qITbOuP?=
 =?us-ascii?Q?1EYcELKJUFOQgXhy5P290LMa3S71CoD3EHQD5Za9CC7RqJ+QsV9kIdGHnsR2?=
 =?us-ascii?Q?Cthgca/mK6mSDZ1786KPSMhVftjFzgTW8yxRbRBpRRsnO6gM2npdl+dIrtW6?=
 =?us-ascii?Q?53xKLVnsDQ9YTUDvQDno1seIMEPvYJHWS2f6+Seul/abzIiGkrNAOFtE4O6J?=
 =?us-ascii?Q?rxeqbeMvEkywSYgcRgjB/oFnXYUK0hrCjWNuqFxFLDFLQP2kAUYYXms/uH4M?=
 =?us-ascii?Q?Ajkf/gnFfE60utAa+1oFe0SCC/pNWPQQkVgHJ/3GieYTgp/XYjtBvd3w5wtf?=
 =?us-ascii?Q?RvVDTjPNubi6GZ4q1DvDq839OQwT477XnNIUcVW9+A0EnVBmRnrw0ME/UEuw?=
 =?us-ascii?Q?R//e/LZfjw8df+m1QcnwCJmJJAm78rF1YJanmyuFaDcMsDrzwAr2UiuaU/ZN?=
 =?us-ascii?Q?b/BlYtQRj+03FNDJjCHyx3swv39zkqcVpfi+fk3emhuWUojQVxXKW79XMifo?=
 =?us-ascii?Q?yFhdlY+k4KtPcHOFeqdGSP/M56Jrx+wEwherDOy/pjb/JYYZ73PunIQKfBgN?=
 =?us-ascii?Q?nz5UtXPGAl2Lv+xImmCYb4o3TENsCt8RZa6vU01TR4q7mu+GaSVw2W5OeKEh?=
 =?us-ascii?Q?+z47GpA64M8MVGaJRFa/QiNVsBZ+rAastB+1uyQzvQW551I4Gt+DnNGw/ldv?=
 =?us-ascii?Q?p3/S9YlEXIIzic67ylic2zfP5V7DTr2J33A83u+b14gEmg/laL3O93sVryDF?=
 =?us-ascii?Q?FEM7iFOZQIJVFvZc5sL498SB34s6QxNp+DU89oW+urf+4vGvQov1FYqQJAbG?=
 =?us-ascii?Q?chR+KwO/XC52WIfIZllYzsc+Qnk8bzs69+6R71p0Z7PbO9q7pbRJCL8ksJOv?=
 =?us-ascii?Q?AfsIiauCjFY34RiG0CovkKjx9BGwuhGLFv61lfxY4yZvhsjPg69Dg0IQVlxq?=
 =?us-ascii?Q?sK4YsMCfY5tFLfOxxpp8/Fvhv2rtdT+eptddUHqAL+c2Fb95na/9ApbFKsbd?=
 =?us-ascii?Q?IMYubEmb5p0OZSWKlBsBWpJzfkGBjPcRNGgJtKleMaJNp2wWTrTYoLLxRHYS?=
 =?us-ascii?Q?odd895tweIdTyIqV7VrwDJHbEsuBxHM3fNMUsm3kPHdt1PwyuX5HLNzTpyPP?=
 =?us-ascii?Q?4RURw1zu8VEmWpmGdt0ApUQtBIb+V6zca5zwV+/4gJUmbK3D3BVwP/+pD1eS?=
 =?us-ascii?Q?sXThnMmqhM2H0Ht7oTW+kZn1xTjRBbNZYE5IO5aarxCvWTlErEILwp6onTt5?=
 =?us-ascii?Q?IPrHvJx7GhPinwYYGjM/KPt/httuestze0E1joUc5emJRBumT4UB1Wpyh0EE?=
 =?us-ascii?Q?3jzb2dGd9BERlny/rV8SikVNlYXyQDYPr+p66q+M6+gOmxS8EOftodtHgljE?=
 =?us-ascii?Q?FFCslkgEB2URQ8DUYVlGgKU4fl1OIWEF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR03MB8408.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QGjAn5icXD7fPz2xNZmRScQQ74GpKFSwaLDtxcmyvlFk3ZXWPIDCze54zh4b?=
 =?us-ascii?Q?Emk7j9FWIbd+xrbqyhM+zhZ/kD67GOnmdGIpDiE5JKx/OOmri02NSV0YqlYE?=
 =?us-ascii?Q?V6wKJ96VS9DPluVapErHC9mvT9CFhufVBHydyLlekxElBrgcNWKKGDZzV3D8?=
 =?us-ascii?Q?7LV14+jfFYhc4iV9X6qTvRA2QeT7OeCpp9U5xE/a9AzzIfy8wLuwfFULm4WZ?=
 =?us-ascii?Q?nc2/5P2HZDY4V+LvCCzawYuyYhrGDPz3f3Be27IdLf1wrcsXg8hDdaMOkPtE?=
 =?us-ascii?Q?5VPhAv7zxjMyuTvDz46tsAKgSEOLMJyHNoIgnNK+SlAlkUvFg50ZDidpoPTy?=
 =?us-ascii?Q?SH+4c3Ikf+5e0JBYANNQRKQgW4KNJEn9jkUqnXH9TxRPVBBBkhaulH/5uq5N?=
 =?us-ascii?Q?hIVr6vfWn9R6DfgIdEIlx3aluAzzdUTbStSVLWjdwX1YCfbEaQGYEsCEY8LG?=
 =?us-ascii?Q?Qdixs/h/1aSxxCc3RkF7ELI+so/oyGaNfk3rzxrmMKB2dOvNnnfUK7mIe2r9?=
 =?us-ascii?Q?WomwWk47yDG2i8887uAMxBFk0q+cXCCrHlv4OTUolZ3HjNQZK/4lbchjzeer?=
 =?us-ascii?Q?Uv1h52hKLAt9r/tNQ/DD3ttNDnHw4PsxvB9F+prVFZaC3NSdSIRinl+kyhfs?=
 =?us-ascii?Q?ZjlqufPmUCofa1exH9Qc9/qVaQvb9roBgadFPuXZZwb5sl/GARjRpv/brneT?=
 =?us-ascii?Q?c+2o78upnViJG42cDa5pt0wu1KrCdblJ+BpDPHNhm3icgWIYvBl4F0LcPw5D?=
 =?us-ascii?Q?L4BjVWN21spO6LNW4QkKurxHGu0NlqajwJHRGSr+mwkVauTsJl0HZGC74U31?=
 =?us-ascii?Q?W2eGN5ikEUmWklNLV8q8OIjD9glrtYOaROJAeNd4im8vTprqbZA2Ap0aDA3l?=
 =?us-ascii?Q?6G2YKM6rE7sLpCEYQNZs2q+4qPpN7W0MsU4JX5tMNwKVAaw0YiHD++ud452P?=
 =?us-ascii?Q?fsfd4fT0Y3Z8CeHn+ElaWk7k9pTgfaM3z1wWBAYqKcDX9bVAMvwcibMvcNG0?=
 =?us-ascii?Q?OyYCsKtBJGUzkluAZaHmW6TVbYAHrlPEl2N4pkxJqvMRcDoTp4FjptSwvVew?=
 =?us-ascii?Q?K+Yg+M39jXmhI74cpU8AuSWe1tYrnLmtBYhyqsRgGBaKRges3yyxV6NqISMR?=
 =?us-ascii?Q?dFEWn1zypaSsD0bKH0UZV0eS99Lgjy7jEcIETdrkEET0BwLj+hZWNMlwa1bz?=
 =?us-ascii?Q?cd+zfsvw06XXWyLJMdLbPW4Z8cnbOk5e/MsdjgEL7LEhBNKJZehRoIpFyjRK?=
 =?us-ascii?Q?0+g+naeiEfMMHfoPTn6oMmLqke6audrKjIEE+nFMHaG9rEkbJ25pc+92upEX?=
 =?us-ascii?Q?5gWzhxXWIovduVtrM5An0/YMI+Ylu9fqpl953HGwW9s0E7Mv9x3YY1RJNCkD?=
 =?us-ascii?Q?e3jFhj9y+3pBMQdVlhy1xT0y2OvceDIn364+ZH5PpK9JlBCgPn3KNHWpSuAG?=
 =?us-ascii?Q?ySkBmT2l1Z/OYNmo68c43ysdj00Jj3E2BTsHkfDyc+mGphd1TgIax+eJ9w+9?=
 =?us-ascii?Q?7zNFTUkjfp9xyFNsrhZIlz4OnayJ2Rq0aNxz2VXptTd8rfA6kR9liW73YveG?=
 =?us-ascii?Q?Q/fqkFTfBAVr7jIku+esuTb4N+9ea1uhe0k1YCww/qf1ij8X5IkerpzgNF1A?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbaab37-ebcd-49cd-4aea-08de206f03d3
X-MS-Exchange-CrossTenant-AuthSource: IA3PR03MB8408.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 15:37:11.1965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zT1FeLIIEYDwoRofcF7p3++ZFT7tGO3n8hbUyEuO/xwOXpsMnvwB3HWm+LDS4hLMbAUnx6x+qTHwgwkUxYM2alhURRVypA+/23DesU8poQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7217

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
---
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 19 -------------------
 xen/arch/x86/Makefile | 11 +++++++----
 4 files changed, 10 insertions(+), 37 deletions(-)

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
index 407571c510..270800694c 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -228,12 +228,15 @@ endif
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
+	$(STRIP) $(TARGET)-syms.efi -o $@
+else
+	mv -f $(TARGET)-syms.efi -o $@
 endif
 	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
-- 
2.43.0


