Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB266C46997
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 13:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158299.1486651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIR2j-0007r5-Lj; Mon, 10 Nov 2025 12:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158299.1486651; Mon, 10 Nov 2025 12:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIR2j-0007oK-IV; Mon, 10 Nov 2025 12:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1158299;
 Mon, 10 Nov 2025 12:30:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0MZ=5S=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1vIR2h-0007o9-74
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 12:30:43 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 120657c0-be31-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 13:30:42 +0100 (CET)
Received: from IA3PR03MB8408.namprd03.prod.outlook.com (2603:10b6:208:546::19)
 by CH0PR03MB5986.namprd03.prod.outlook.com (2603:10b6:610:e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 12:30:39 +0000
Received: from IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39]) by IA3PR03MB8408.namprd03.prod.outlook.com
 ([fe80::8d7b:218a:6264:2c39%5]) with mapi id 15.20.9298.007; Mon, 10 Nov 2025
 12:30:39 +0000
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
X-Inumbo-ID: 120657c0-be31-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9pXjzLlVesrR/c+j0O7LZfciBexbFSryJBefeEIAuxxl0r6HqmC085jPZiUOFfQ6CwmLN2TH2LO080WNV6WKQI4pnZR7L91F2Syke03SCBa+9SvtfJDo8k0A9qgfaUWcKjmvWlppCT0/iMM1SllaqwMJeanjVnx+FF0RxwDwuiuLJjgSv35PKPbr1ZAnV8xnhDv+/6fx5KAwfsu8Y43Yyn56SA4ftSHY20b5PX2yBrB1pAMe2iVUoGKCVKfm9cZ+S5puPrYAt9tnBX111pAVo9bDC5PmhfsIHO+fbwUbAwn00tFnsZKjHlAX48HRW3noeEEuHWifZjvtYA2N55C5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXPtymH/2fKyiqONi5yxmZtMyuXsg1x7d7EZSTzJA3A=;
 b=WFqZNATfK43xrySt25E1bb5fIqkxbAywPyFFIo82dJGED7H58ZpQqOq7YlwAjyA5QAEPhOjp++LfUNt0NIAl+l7uKYu7ZJHx0csQEbu7AlHC/tZD/FpEXPUVrWkfXZ9Z61NgKHzTIAAOHIBMnFQ4HmdYN1zZ19i3qGVBb1K/bGs/EStnZ6fslyGDprUQsdRt5od/yP8IamjIJwtplW+6zpmJ73uvi13Zi3AkVsfLwFf5jAtdOe1dNpvHo5mEzDH7RiRrI7vwd1puac81rXArsXnoDbmZg4J0Uaasy6gX2Onck+3w2vpfe2+X5WnX6Jvc6UHvqdUszYVVsV8mrwBpyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXPtymH/2fKyiqONi5yxmZtMyuXsg1x7d7EZSTzJA3A=;
 b=PYGuBDCQVsQxucwt8fSpx4eLRYyxkX7TZ8+7deUfHijdvijAS/yhTWGLbVRzvlk5K55WfGuKCKOhRZHG5KjqwsW99msTATPHydOutkbz5r47yVhe75UDjvakVRDdoTyerZEPClMn1kXJxinlCCA/+GiCkiuvpVeLxQ9Q0ouD+2c=
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
Subject: [PATCH v4] xen: Strip xen.efi by default
Date: Mon, 10 Nov 2025 12:30:34 +0000
Message-ID: <20251110123034.77692-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0502.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::21) To IA3PR03MB8408.namprd03.prod.outlook.com
 (2603:10b6:208:546::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR03MB8408:EE_|CH0PR03MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2e5e6b-7cc3-47ab-2928-08de2054f4f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xW16HDU/xvTImBcjybuPKSl+B9NcbiV8fjr0FJ7iazfZk5cEvbHKO5FQWnD6?=
 =?us-ascii?Q?iAVE1snEwkoJJe5QcPdQDbjFfWF2pO4I4IUvcIDV1z8WYKYYbYAD/xFnohJH?=
 =?us-ascii?Q?LEcxDnX47178MPMP8tmP2COk5LX/b9JatwDyHSQ12DuJFot0qOFeHE8DAwZo?=
 =?us-ascii?Q?3KzCylJ80zCGJexZ37/mheOgKRcZqr24/VlOHaNTQAmYqvGP3HBTbKd1rYCe?=
 =?us-ascii?Q?Nk6r6kp2l4jlv1CPSs0gW1f6JhRP521CMNRJOBcp6fGEImZ3PayPtJxARvve?=
 =?us-ascii?Q?YcCY4i2v0L62ti3G+amLyTMbQ4p44n3242CIy41kCu8sha6kBrJHx72Us5aD?=
 =?us-ascii?Q?4L0qQpVcYaozB4foFu+SL78dzIxYuoi74uSfqR03bElvWOzVVAc017F8SQqz?=
 =?us-ascii?Q?ietqqe4d7kOyQzpae0W63mSjp6PbjwaTdEr7qf5JukNVOFjaexcoNQXdLMNd?=
 =?us-ascii?Q?SyRB47y5rAalYkspbN+L2P0IM/A+cwR6Tu1BnLPCuMdsPf45/JdfaxTPhpP2?=
 =?us-ascii?Q?sD5E5d4oA/Do0yZB+fCgKOXgJCd3AlK102pJn7Q2olF2pA33Ez3wafb6XjlA?=
 =?us-ascii?Q?UALxflckQZmGAqqd9gcBGqicr+XuMA+eSJNa8BxLOZyRGUzNafset66SixOZ?=
 =?us-ascii?Q?8b3+tVp3Tw1mgKtW6ZFEoeAI8yrFWdBLd6eNI2VM+g1AnzMwfvcbC9i+uLnK?=
 =?us-ascii?Q?Epr2B/apvz3389i34yH3kUmue39b1QQF10f3mAGAG6oS9ywTrTppnMi08wbe?=
 =?us-ascii?Q?Ti/ccLzHdqj51LIDRO43AjyKiwYczJXIehE93zrOhDq6m43iuoqysST811tB?=
 =?us-ascii?Q?uMZo7OoZjFQOuLyGrQPWtuRFLb5DaxLOYYKOmNIA3FrunZBF0HlgUIEpl2U7?=
 =?us-ascii?Q?6ZErkCwKER8pVPgyOm30ljaShIGKurUurHBHbChkJONyfiqbDWdLezQoAasp?=
 =?us-ascii?Q?y04JRHmRxSmZKXIvr8VJWmPrffMo1W1KjjMXDDruBtkBva7c4g85OoKka6Ue?=
 =?us-ascii?Q?ZXvNXZTa2mmZdiF7Sq2NXDcXBKqP6mF/QW/fEbBrJ2KR7YqC7W1lpHksxL7L?=
 =?us-ascii?Q?8aN/9DbTvEAaKyNjMEsYCIzvSuqiGUyKaLv3GjfDPheylp+5KJLCcZ2Cx5EX?=
 =?us-ascii?Q?ROQbmqkI3hE1a60nZE4P17JdNFcahnxCKI2bWhlSFmkwbUuP2SF5taAlLvwn?=
 =?us-ascii?Q?g6BX5yf05PfnFzlXjuq2vPj5o4d+N8/kb1NFtHx9ouJVi/SYGssFYjldFTqK?=
 =?us-ascii?Q?sgAcV0oSMbaF7r1kvE2yNwG448ePNy5uVqfwOQ9aPolyZRUrURRk69fuKPVb?=
 =?us-ascii?Q?A7nGZJCs+phfdnx0zKcoLL1a4bARM74jL5zVwo8pneIGSEUUB39WPTrDiUmW?=
 =?us-ascii?Q?ZZct4onllFJEUsovzUPbGCMKSQOYHpevqrJcuAP6HVyjJlJ19vB1tqyKfV78?=
 =?us-ascii?Q?O61Crvr5SvRbRLSM246XIbRJwCgPaCVY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR03MB8408.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PZfPN4Qw/hjVSl6fmlizuZa7F/ZMoSmg3vYNnqJKJwZyEs0wj/88J8+lNzdB?=
 =?us-ascii?Q?vxHa7q+JI4ClB4Qk09gGuk+o5ZtAWH0n0Qe0E67Ou0QkIq5Ga4qzY7EuEOsM?=
 =?us-ascii?Q?YinfZaFuBku6Manpq8qzewfgDQXC8YNJcmYvbG96xFyuTn5r322VY6bKyId4?=
 =?us-ascii?Q?VwnYECoF5VmjkdJ0u4aUNxudfHUGzfl88F4B72mZEXZnPHsQN/J/apSOTnLC?=
 =?us-ascii?Q?HNArsRYHc0Htd26NvQ2Tf3TK74cZKXtcl3wsk/Zq3UIEF8len0BFFmdQDhdB?=
 =?us-ascii?Q?Kf46Bzs8EluMVup8CAtO/mODk0OQXetoHLtpuDlVyGf92KJEA/Vs+wS+CoLv?=
 =?us-ascii?Q?wylv3sGCKH225s66o3Zgkio+yb5xZTuUOCxhdR1wDXQBde55nByJAZXInwCi?=
 =?us-ascii?Q?GCzsEKZq6eebFUUpiPzYpJqk+iYfTnhO+JFrN1qcY4I0vc5edb8oJqchtRxJ?=
 =?us-ascii?Q?mlSvgX3yISCTAAFG6R42gSKL3SWLE23RnvLRmfZ30QSebFlXlhwBEYZqiNnk?=
 =?us-ascii?Q?FmnkZwCHb8benJ179tJc+YF6hb2tmXTmIWOF/UtDktQDZE+Zy5i2Dm4U0+Oh?=
 =?us-ascii?Q?xtkVJRgyb23plOoXZkFoGoM9LLT9YQkokXyhsfXeskcOugFkGQ4iAo17XpOa?=
 =?us-ascii?Q?oBCoCJYWJ0eFdCBxcZ958pvmHa7hWH+2CjL1MCcwFF6yuApWA2sMexUZYbVZ?=
 =?us-ascii?Q?twZRbqvcb1ZMCTPYjWmsLnbAYAwYyurebcVXtGzO2QDWL5GpU3AC2706RNpa?=
 =?us-ascii?Q?yPtyDHcOekF61T9AS1+6vD+9LBAbolMBcR+9DwrFqgrilRoNXjN+kEPvavnD?=
 =?us-ascii?Q?nl3gQBSBpKgZ4X/rI2tWzFUNeDzBeaDF57yFbFAueslOPYKXUewXXUu6pzia?=
 =?us-ascii?Q?+jOwaC1DHPMb+SDDQpHbspe1cx0WgsJrge/w+k1RHmthEy5BJkGsuBcSLpCx?=
 =?us-ascii?Q?2TphMuJmbvvratiXXWNr2+/jCrwq5BT5vksIJ2MGsSBRKGLIWctnOvYs/Or6?=
 =?us-ascii?Q?PwdNd/hN+AfPnnU+ziCwYlz/l8uv6aC+mrOHZMCZhokQH9HZv9pe45muCiqg?=
 =?us-ascii?Q?pb2LyJPvWj0H/5gKvlIFquvEgtiO5iF38VoCPiUz2yOl0/emjcwK2NCHOgag?=
 =?us-ascii?Q?S0OT6Nlwh2uAteS5IgZS2Q5yY8qMx+R/VOfVvR1fC3YQXSHKP4LkmOsGUx4I?=
 =?us-ascii?Q?KUjSy+yIIkHBECVAB7VVxPSYI2u6iKLBBCklAN7SfLkHnp3PCV7Y5JLkmEzN?=
 =?us-ascii?Q?lt2HruYjK2JqTurQ6MpMIMXKbDy45QYNYwdIRZE9SmkcI23MH/YRZo45xDcM?=
 =?us-ascii?Q?PSHckNOk6LAetDbgkXjmsK0cuNi5x94ioXZQZGSj8BomsBX2gARVMV2nRu8u?=
 =?us-ascii?Q?dbNg0DS8Q/xta1aDhTsSpynWv1m7ysZzztW8+NpMKys0npvT4j2zFzKWdv00?=
 =?us-ascii?Q?wJvLfP0aySDsSFjLEK3pmAJ6YvLrmfUbNi5eWJHzk5keNRR910OoncQw4uvX?=
 =?us-ascii?Q?yCCK7nPhdHZFqzgO1BtGDloYXHO/rCQ/sgsaLUdNT8PgKzgB+3EJaFvqZK8b?=
 =?us-ascii?Q?gErzIpIYTe+PWyuxUqNphHmHVNj4ca2VWnot5qeR4DlSMhfjrcl2GEolOuYF?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2e5e6b-7cc3-47ab-2928-08de2054f4f8
X-MS-Exchange-CrossTenant-AuthSource: IA3PR03MB8408.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:30:39.3754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S208RIfObJaSCE/94lmtcqcysRSGUt8SNqYW65C6Qm8VURZSlGS6Wzcxx8dEvwV+s+8Y+/9t/rbEuZ0Rtq1TJo50qPA7MPG57DwRew5qIwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5986

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
---
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 19 -------------------
 xen/arch/x86/Makefile | 16 +++++++++++-----
 4 files changed, 14 insertions(+), 38 deletions(-)

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
index 407571c510..31ea1da5bc 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -228,17 +228,23 @@ endif
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
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) \
+		-O elf64-x86-64 $@.tmp $@.elf
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))mv -f \
+		$@.tmp $(TARGET)-syms.efi
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) \
+		$(TARGET)-syms.efi -o $@.tmp
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


