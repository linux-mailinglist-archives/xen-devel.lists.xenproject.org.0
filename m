Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DBBC47938
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 16:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158464.1486818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITwA-0001ix-Sk; Mon, 10 Nov 2025 15:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158464.1486818; Mon, 10 Nov 2025 15:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITwA-0001gV-Q7; Mon, 10 Nov 2025 15:36:10 +0000
Received: by outflank-mailman (input) for mailman id 1158464;
 Mon, 10 Nov 2025 15:36:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0MZ=5S=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1vITw9-0001gP-13
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 15:36:09 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f53e5bdb-be4a-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 16:36:01 +0100 (CET)
Received: from IA3PR03MB8408.namprd03.prod.outlook.com (2603:10b6:208:546::19)
 by PH8PR03MB7217.namprd03.prod.outlook.com (2603:10b6:510:259::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.15; Mon, 10 Nov
 2025 15:35:55 +0000
Received: from IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39]) by IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39%5]) with mapi id 15.20.9298.007; Mon, 10 Nov 2025
 15:35:55 +0000
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
X-Inumbo-ID: f53e5bdb-be4a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6z0vToHpaYimQDo4axHHLDf3u9I5Ylp2PI7LJhO38U9utfrMewpb0ilS8aw1Xqdn74rFeaAJHgx1/TMWEEKDwMha3un59kLMEcs+WON4NmXNvBKBl8VOUPyAncrRMlhqFRG5y0VnDsobXg8oWiMjejR/kmeBTV7lBqZAE4yfMj5/emu9NrHZlximSztt5gZl8xEdyRPZrvWdo4u4EwHYymHSwCmG2JBApyJzpNKADnG0Lkeq/VvoAex1zKPqTJsBtFPYevyTmKqG1T5kTcR7VVKxFJ3Gr2Lg7fnXArPZ+HVImx04ksoCyiNJfLDT0e9Jsr1RTardM2JLSmv0L1CEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgnsOP1yOnWrKA6YRpqlH9/do+T3aNwg6qIwmyShu3k=;
 b=p6/Vj+hqNOqeQBhgriq1i/smjPeqGfiOCjo7ZV6liixoFXvd+bUGQvhVn5h2zMRdmcWz7vhMDfY7Bihla/3wCBYFe7UrSQKIJRcncPuxwaGedt+m2/qStPjXnY7h2XoGimStO6hxv27BcLwc4S5vKQPwyCDi0qg+5u5rWI6yo8esWy42pAgjOtl88N6v9P9qse0gDKPq7wtQ3v3pJMIChAxNfKd1MY2Upc6hmMmtvbwNqplGieijg4zJuaYXEhgUY+GEpzqfThp6IsyNlC7zPbMN5xFGrW6EgNXz6Bki/PPWXbTJkbw+VulWWGcRGBxFWhKmFCqd/uQRaaAfNe8Hzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgnsOP1yOnWrKA6YRpqlH9/do+T3aNwg6qIwmyShu3k=;
 b=yMfGsKRVjCOikrohsyi7OKwTqUKXM6tu4l2B7/3pRgTeANOjPJk6Jucf+X7/wi5j8ah0MJQDkqS+C5Tsn+A+tn8WUa5VyY3cOR8PU53QPDbRfhRrMbImTwSqKtTJsTWEA/YbC5FTEiL1kqeVOTo/SQtdLM9a8BNsHJqe88ZNcCc=
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
Date: Mon, 10 Nov 2025 15:35:51 +0000
Message-ID: <20251110153551.84813-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::22) To IA3PR03MB8408.namprd03.prod.outlook.com
 (2603:10b6:208:546::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR03MB8408:EE_|PH8PR03MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: a44041dc-c924-4d46-151d-08de206ed6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JFhZBsLcIqDpaBpi3NB9DH0BUBXbrE+IEIRXzNCzSM6/Si7ihZFto2FOQMh9?=
 =?us-ascii?Q?Ybsz73NPnpe+7/q+KAy2g87Yoj3yE/Lr9lmF7cpWQ+XO8X55fuDp3gS7WVmw?=
 =?us-ascii?Q?i9WKeGIEqdnoC9JIMISwQ/NGyh2PVjEITSXsRF+rzsLE+z494DfiFK7ZHuBl?=
 =?us-ascii?Q?8h2R93UgpTQ6ZhSMmSMH6S+jKX0mMa/61HXnDXO7kAy35hon+Qlk/FChN/O/?=
 =?us-ascii?Q?EKC+Sh+hCJ7Q3QQFNpPRMEJVC/xGgkKxxTT9H1wPzyH3kFWBocPYQxo18PSW?=
 =?us-ascii?Q?BnUIi75vZBWCgcFce64AcceUhC508sfSFsHznshZ8WQGDYTgSpGc/6SgaGNQ?=
 =?us-ascii?Q?ZJDgwnX0VV0plcfLbEIkfQMI3n4OSOsIFUh+UWhJbhHplJe9vhfrcIdQqjgd?=
 =?us-ascii?Q?sHd1UsSLbosj4B62a9/ITKu241iJoXAn6J14L7aGiPpmfY4NGsZ4ehrjvo3Y?=
 =?us-ascii?Q?AnOcl76TqmDyMkmuke2McGHWTCSj8Mt66QtPJ7eidLgKqb7n7cUdHQXP1yAx?=
 =?us-ascii?Q?950hxCSbacyR9UtiIAlyPpAc82kL6h1P9LlaIJ6znbkuIqFBJCnejvx4DHb2?=
 =?us-ascii?Q?7X8pTQQF2h6Ce3KdRsxVOmj4Gmwr+tyMjJyTPgwdW4cemOQ9qiJn1m0LjEju?=
 =?us-ascii?Q?/xJfd5QHKnwk3OtAE57D8M/3mcohpkRTRThtzNZ0zQL92lIAkM7dqJRMHR89?=
 =?us-ascii?Q?qIRKNQluIu58D14d6ZNk5XQrO6abEhBBpPhF/Ef284gOVhEIzE+NJRRfmBuM?=
 =?us-ascii?Q?J2JMBPmhpH1v+NOci8bizL/+6LLIX5tWUB3vhb+4tZfG7i79gl3n18hEsItO?=
 =?us-ascii?Q?cJcxVi49mDKLAyu0k3rkrxieVETfUz8WKLmQFgUXEsLz2/cn0MtOU+mII2dB?=
 =?us-ascii?Q?NappdBXIk5dex2cgMpVBZkDgqDHr5NfDYXcK/P64P4ON27xq0opA0Acsf5ct?=
 =?us-ascii?Q?7TJj2MDIrWsiR7Fam/mtvdXIToCfDs2FlOONgm+1l7lgkAQDPKfzrdwg8DH2?=
 =?us-ascii?Q?KUbRfgi1vRiFlxW0io94AsmeQFUI94f0b7/n4sQijETc5tEIKwnQprkVtBpb?=
 =?us-ascii?Q?3VbvuJVDPWwRe2OA6ng96f2xDnXgmXmen9FuALue159geFGocz1lhJEPevH1?=
 =?us-ascii?Q?0Q6D1NqlmlzcumOCzZ3uwuU0YB6gyBfcw5oqhrIDA+ck8YA1MNrCQcN09EoB?=
 =?us-ascii?Q?4D3R41C1rxT3jlqb2dOmvlLFcTmYVfoa9oh/+E1TthnudHSQxPpfF/hFWbc3?=
 =?us-ascii?Q?UQv/oHsxvWPRq3Ij0X7q+RGh7zBxY6n1XEn1PNHTSTC4Y5ZCItlWQyWyFL5H?=
 =?us-ascii?Q?w6wjKE3i8RbyEMAMrI46D5Vo2OF1Gvam7o3dYXqElhvCIxJdtEr493PEVWqo?=
 =?us-ascii?Q?Dij+sMD89btr/6wymvbWe2XCHF/3JIWW98GhJOXG3CeF63YSHA0C6rMsxwA3?=
 =?us-ascii?Q?Wq4GMF5FeSAqqi1Tet/i54DOkKirZj1l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR03MB8408.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N1T5uSydZEEY1cY9moU0dicN9kJNox4m01YFhNhcvZIGUSukdjyIgIYun5VJ?=
 =?us-ascii?Q?6pGUfXko6fejw+uvq3vQOWfnsfvspNFpH//lu385Pg3kLcz4jRmha83zyJjd?=
 =?us-ascii?Q?hSKWOqEN/yHyREBtE8i1cblVKNVyKkvvNuf+6NwQVx+yG7Oa8D0T+Bd5M7+7?=
 =?us-ascii?Q?LXPAlK/GwSaPr2EO4A7DO5DuIfyB+lPLXsPBJThuuHKjc5BnXs0kANH9cw2e?=
 =?us-ascii?Q?I/6j9JS/mFkBdKLjv5bVuaSrpc1gUmZ3dFqP08G9xPGHW29bcUyaqRPYd/5S?=
 =?us-ascii?Q?FLWT3/zlkQeonr8Ro5suIzj/VCPxAfOVZgLVffSXBPz2i4RgZofxLh9i5qQy?=
 =?us-ascii?Q?+BiFznBOoaPiqkD/rrEH4m3zy+fYSvUainG+9QUvVBuZLwIk+lFPz3RMRvjX?=
 =?us-ascii?Q?V4gv99JS9EGk8CaohpVbE3Wgr1GjDMascVSBHpj7jOsH/buTaZ/g5HmPWLBh?=
 =?us-ascii?Q?yQS81dQMkOl41V+gkFH8W5cxTO74Uj3sXMgHLYtaLcNiKTT4+5koXWG/MxIl?=
 =?us-ascii?Q?i/3BX3JgwtoJ4biLaf/Mu8OKqwayzXBo00aAScCROmZfETNmmpQtia1vT1oa?=
 =?us-ascii?Q?SEVfve6U2MZew1qUX1smGI9sowNanOsrygLsqWD5TqR+cPZqfMPXUXe8ytWq?=
 =?us-ascii?Q?oQcplKdjTH0PKItNcRX7n0iDU75RgxnpqkFJ+zajtaR1jrYahjypzgSswKrq?=
 =?us-ascii?Q?6ParXNDlBzjrYYG8+xVjvq+hu4e6cejgsjNUfPUnr4WxMPrXMyK4bvmy+cFA?=
 =?us-ascii?Q?0Cf2zkR9pd/Cxh/fxRKgPVwM+V919m0CbC3EYByvQ1TYAaBt4cckWmjnhR5F?=
 =?us-ascii?Q?b7ZS7V23StkKmsFdd35KZanvRYOQnYxwzQBHb8WUc2d3HcOh6SSnTKEfHTC2?=
 =?us-ascii?Q?gzhzbWIgvsICuCdqKvmxjsLhPkzK5tr7aTT46lwmhtsMpo/l3dRNo4+3RWxU?=
 =?us-ascii?Q?/W5UTNwRfw989TsQb2pg5b12CSpX2CB35uO2Bvoy7sWwODYFnzM8XAsplDua?=
 =?us-ascii?Q?LSotB5KBIfe7OJXG5Iuj8/n0dRvmadf4mOthagDKc8+qj7tb1dyZ2VGSdAjM?=
 =?us-ascii?Q?XtkbUPmVMsuuZwh3BoDs5X/+HXDGe8MF/WhkH9breXCjigdVBCPxMZEBAZpQ?=
 =?us-ascii?Q?eq6MOQRuui0+9S1uzPBxbSO46hhoTDC6Q5WicQFl3b6D+5vQhwyBJwO5Y/P/?=
 =?us-ascii?Q?nzpA7ny/BT1HVTnenWARVdbPH9P3BvbuN5eG1XAfx8H4wdWe6Tw8i/sUvpGQ?=
 =?us-ascii?Q?VsDeBhR6LEm5pbgoi8Q6AW/1zXvD+bixCAFasAfhX9O00TZP4ygOn2MoXMR/?=
 =?us-ascii?Q?DB/bkrWaRLWXdmGZPFa3Y4K4s8LTHmW83BOu6mLtBJfdHXfc2Szu/wwjO2sb?=
 =?us-ascii?Q?bc0Mu+NBzPd0UN+0ropwdXvVefFgl0v8Qja9nxNQALnyIYjVljUQAPhjoJkr?=
 =?us-ascii?Q?8jiqqMJZceLOK9uOVEu40MHdwqo/Zxav2BEs2yynQ6ZXKTWGCvw/JTdNFMBQ?=
 =?us-ascii?Q?4jXFLIX57pJuWbiouqE5K/mMaIzRhcd/dgBeIlx0bUeMFYXjg4X9IUUTq21x?=
 =?us-ascii?Q?7y5L5X514JQYd4WYISDOql2mowvvxZxpAu3SZ3kOvEvNBrnChLVupiU3DwRL?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44041dc-c924-4d46-151d-08de206ed6ba
X-MS-Exchange-CrossTenant-AuthSource: IA3PR03MB8408.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 15:35:55.4782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWntoSvWjQJqm45t7j7B5rmUP3G3dMbv1hJB6nzDkAoU5jwd8ykp+C/lKAXoF9ftXEhrCZqFq9dO3QOzDTAzxJr6ao7yu64fV1VBxtMnlLI=
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


