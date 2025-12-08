Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD90FCAD4CF
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180571.1503756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbT6-0000Yx-SZ; Mon, 08 Dec 2025 13:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180571.1503756; Mon, 08 Dec 2025 13:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbT6-0000VP-OU; Mon, 08 Dec 2025 13:40:00 +0000
Received: by outflank-mailman (input) for mailman id 1180571;
 Mon, 08 Dec 2025 13:39:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9FtP=6O=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1vSbT4-0008Rh-O4
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:39:58 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62b415d1-d43b-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 14:39:58 +0100 (CET)
Received: from LV9PR03MB8368.namprd03.prod.outlook.com (2603:10b6:408:364::10)
 by MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 13:39:56 +0000
Received: from LV9PR03MB8368.namprd03.prod.outlook.com
 ([fe80::d8cc:b839:3d79:59d3]) by LV9PR03MB8368.namprd03.prod.outlook.com
 ([fe80::d8cc:b839:3d79:59d3%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 13:39:56 +0000
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
X-Inumbo-ID: 62b415d1-d43b-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3ge4m+Lns3VQ4MDrxBIc0vYajZOKTjkoqEm33IF6eBD0wzTxAZoJKSqGghNKhUyQGlp/xjHeRKFolCoRl2xzb7Lo2kyts/56owpKcy4vfKabS+vxNZ25UiyX4+3P4I/Dtn8/sHUOaLtbaxbuD/nLTNegw+ga8idYQqvs7R0CC8Mm5qjfjQo1t4ITedPpy4KswMEuNcE71qHOmY5w3X0C/XvaFVcBXNdE4aF1OTx1KU+bwhE4Y2RFQHzcl8Nx09GuPLlJfJFGtMWAmbvH1tx9HQ5EI2zn/U5uJUYgvQyUDVZ+Rp3YqMtXIS0MDuBn9En5l7qRrL30DV30x9tNx1yfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hwt0ODOK0ft0XIgWnKDYFNLWivP2iS3A8knl7sO9MQw=;
 b=JdrEQlbawObQ9wOJ73ju/zFF6vj9zOjQiMtGPjKV9Xm7dUDDG49LJ1p3xfw4BBb6/leZ/RNki2TRNGZ8QUtJuJV2IoWH3K2vjAv2zAK8jcAokcgxVhPcDrtGGrtCo8C+AXX30QicGDWj+3xNMPE1mldITZKLaQQgzAweVAsk6WuD02VIdgK6NSTQH5OJzk9VRQ7s3U6m/lOhsqUxQUdsWiAWlphvrZC52Q4oETPMwq0Q9ij5LmofMyXIM07sSLBCyvH7Lhr/2u5XIJtAGaJX0+LQ9NE9iTrgeAKG+wiA6WvE5QmpTmcAS2RvOqffhe1vpCtVyHVbzTP9lvKCAWAwLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hwt0ODOK0ft0XIgWnKDYFNLWivP2iS3A8knl7sO9MQw=;
 b=qdCLENhbmFZsiR/lKwO0PGqQFRO2NxsVOuJYt5XMOvYZOeARPRcVwHmKndU5Xe8N9Dh2Y4iTSR1Lb3ZhwBDcFt9tlsIVqrDenKomnfC16PU7Jjn/4bfLaY0sGho7OlocUBx/YgXeZLO1V6WzReooijT8jZrlir11CKbrsag1JCs=
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
Subject: [PATCH v10 2/2] xen: Strip xen.efi by default
Date: Mon,  8 Dec 2025 13:39:43 +0000
Message-ID: <20251208133945.61375-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251208133945.61375-1-frediano.ziglio@citrix.com>
References: <20251208133945.61375-1-frediano.ziglio@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0164.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::13) To LV9PR03MB8368.namprd03.prod.outlook.com
 (2603:10b6:408:364::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR03MB8368:EE_|MN2PR03MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a36237-4e96-4758-9df3-08de365f4619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iVUouOUB64wSpSEsxZayN9BPrnL9P8w6AQaVv/iLqdTA63PHe77MeAugk9xI?=
 =?us-ascii?Q?ztKIyyU0k7M2SVJk8E/78O+7w5O9FqFpJcAMFhp5SRUE519lZaXURryOeuOD?=
 =?us-ascii?Q?xtCWCjF9r2lupttle4+LGcKRuvQp+r0TfQ54hndKyatFG+wbzbzlj7vuucHo?=
 =?us-ascii?Q?clTsrBeLiN/VcHKUzReU4MaNPsOuxRVWNFvxSWAOBfbmmpvRWdlSJnRppTa+?=
 =?us-ascii?Q?nmBSuqXrNtyWnJmOoc5M+Qyx286pP/YYP9/DLAXJB0BV2Q9bE+EyMmgjoTVZ?=
 =?us-ascii?Q?wX4NhTooIVG6iB2scokxEeXZWJyypuGH2jw+pBHu+LK/rw0xjVLknSuMn8eJ?=
 =?us-ascii?Q?GA3V+Uh/gAFhUQezJVgP31AXiuWhboGw5IHdbdIOIpsdwVLNnvkMxQMkDP9B?=
 =?us-ascii?Q?vKpY9ecz6c0vG/drneMx2mX7xyb4uyDw7Z6YS1x7YR38bZSs2VPwJFBupeNJ?=
 =?us-ascii?Q?P8A3KR8UCcFLabIoNKWHCygfhO6wpPtB48FGfmU+d63ffipaaoe7QExIdekU?=
 =?us-ascii?Q?LJqrGDxe9v+W/9mJB78Kk/YgsjqximyCgrxSlJGvuJ/Sk58NVlnkN1Wfzvuc?=
 =?us-ascii?Q?8V+F5zw2XzRTt76w5b+zRkllqoMqyGEX4a/s05IuyNnp5l9cr29QCzYW451C?=
 =?us-ascii?Q?lnnFGbuuoT2iEJPXYDfW7VTKpqBPMkq3FEihQXfadeCFEmHGCADVGxKH5s6W?=
 =?us-ascii?Q?TY1W9ZjBGqBE99khJHTADeMMARMCTujc95eQ3QRL9O6WYyxqnJToU+cwP5bh?=
 =?us-ascii?Q?CLawZN+AFoOmIpc4SeE7XPQEFwj4wKw8o5WFAgPn6br2Yqe6O5sY1OikOBvw?=
 =?us-ascii?Q?wuitECUJTIvUrRmUdLx4dkYoxgSTMIqXyOVy5IWDS3fsYm/iq5bKzCIvLPwC?=
 =?us-ascii?Q?VtEW0R/Q94K/RpD95RrKQOhbrUCFzchc6YvJGQrVuu7+ahhqpiakaC07JPDW?=
 =?us-ascii?Q?J3lMYVMMBPyuZtnOrw98suDGHaa31SuTDE1Yo9tPKt7zCGe0KCROkV1jVEny?=
 =?us-ascii?Q?uA9UIn0DtE5gPK/oo7xDUFd496r9m4716BM0xdJQt7ppGGsZKvXpTJfM/vQR?=
 =?us-ascii?Q?NMYJjQlIT1Z+YqaXFvpQ7KrBFbIeZWq7ItXt1KxqB3LNePdJR0X5FLYV6+Uc?=
 =?us-ascii?Q?7+CckR4afhDQIRz6xC/L1GoTI6Yu8wELIZE8Euecoiiu8Ukkb6kXTGG0xzwF?=
 =?us-ascii?Q?+pXqxkqqTI0QeoHi/+UNJVHMWdp9yEisX5UoYm2YYNPkS5ANHtAk1EqPueu4?=
 =?us-ascii?Q?whu//ewkdRiTG4xoJBc7Kv3c8e2fvfgemOLI9zRUHlNNMXVjGqMIewNIUCIB?=
 =?us-ascii?Q?yPOo9RP86uW5MMeHCQtA05ADso1yQEYhvUJ6uYB2mECeX+Clq5xfUI6mMEKV?=
 =?us-ascii?Q?A8GfPetY4x+R6edqhpWDFUFtqxFFeHZ7px3EW22XhqiLXPKy4A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR03MB8368.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MthyO5P9ir06sShUU2PcNL9qVj4ztlTk9oDUyUz3p6fTq+32FBItftGh0BR1?=
 =?us-ascii?Q?koj9LLYhox5z/yRojJ6DjPe46LkR5zpeuazQ7QAzVeH429HDZT9poJQZyZAq?=
 =?us-ascii?Q?Jo0dDBMYeoMzlC+6OVmIDBDQis6HpNtp5eOcSma8m6Ml50DDhgZj1LZD4Cep?=
 =?us-ascii?Q?+mclrUs0IR2eXV2ek4y/cyzo2PQJt8G16UnFn6PiXmt0vWzfUc5e+T77lLBR?=
 =?us-ascii?Q?O/m/QYnrLH7u2Z1QXDOsxaaZMiCd2JfD6Z+5rtFgO1xDKV4hLl1biFP2BQ4F?=
 =?us-ascii?Q?w6pseQ8gFew9+m0hjeesHlsWfjF6q8KMC4Mp3W0hskifFE11kX852NnNn4kS?=
 =?us-ascii?Q?x3OqaBYLxDWRBLXDgX6pz+wRbOo2Y3A/6/mUAyLmtMbkCVewVkPwqfFhO5Tc?=
 =?us-ascii?Q?FFwj2ZcJAOONmYEpg5esmhn8Xc+NzVh7IMJfkbX/cQyOI7E2wHuNJ17ed00K?=
 =?us-ascii?Q?s3resDe9w3XxMj4IyhsjbakV4i5tl1bOI1U0gE7RegTniMtsFfNsQlpFGXyz?=
 =?us-ascii?Q?5tYR39VTb/WhYYDYYxNeWH+ku3IKwSxjjEDDqj/oObjbwno7wa7j0i/nSneL?=
 =?us-ascii?Q?gL+jjkivZAHCG9pjYMg/jDSnzvHFbjcgb8sr9sa4uoYDuSXM/Y+xQ9cjQ3zo?=
 =?us-ascii?Q?5UzDAvFCEqnvEXnBm5VGiNwaXslvpApsqo4p2KN2coF940zZNwdEg4QShASA?=
 =?us-ascii?Q?zbaxYNMDjtwY2nFI6Kk4jTpQ+v2mQk2H1axL0jki8CyHwXxPCtjFjzjF8Nv6?=
 =?us-ascii?Q?SzaNXGpBHwHJXtmUpDq0LJ9JAcZ5mCaEqSNXsJmsGfIgXD6VL/Q8gonJluEc?=
 =?us-ascii?Q?Jvq6gvthkfjz+hXBj9LaPpa2kb4v9IfRxs9SnAelG7QaPL9VaYiCfQfFRrdZ?=
 =?us-ascii?Q?QUGWztoUwcaR3goavo/cxWs9TzZSViynip3xtTAxPLTP8V8M0UhIcY5x+zbj?=
 =?us-ascii?Q?U9hG2bbjuaJiCOK3TVJBxR5VD46h8NA/C/s+3K7ne+ujvfXt4FCngna2K+AK?=
 =?us-ascii?Q?ISIuNf062c8orby1Tz0LjGEaqRaVsQAfzqB7gbdvr4Z6+3JuZ9GpuTFkMxf7?=
 =?us-ascii?Q?dVH0iPxfSirG/4e8aaHbywnxbf/stcpgeAMvfmmKKEw7eNo9f0jyeDV23O1Q?=
 =?us-ascii?Q?ey5hotVcK3nDfZLGRNllk1JiSQZxzlNBLzcwbidJi1cvXDaTnsJgVnP2UKVW?=
 =?us-ascii?Q?H7Yp6REMRdfAVRfLUVlCeV7dNZ1E29eBe2RqlCRrbHmt1gHy7YlL2r1SpY23?=
 =?us-ascii?Q?jNqqXqqPWiPVx2FE2C8y8Wd+g93pNC2AQwB/KhyIbS9aTaRT5/fUAs3CfMU1?=
 =?us-ascii?Q?SqwhJjoqi2i8S+UnIXhT2jySZx/8tqJ60suILkQffCMVQ40Wn4FtqTpKb+Nj?=
 =?us-ascii?Q?TGOvi6HtDP/vJzhP3tjKd50ugG6dIwIWTDV+/Gl/kw6i7m6cJuNu7iKGlxMr?=
 =?us-ascii?Q?laISMqcz3TRVN/ckya+Ifbo9rd1X1tuw3Y7bNDoRFdIXEElZBpFwINPnUfDT?=
 =?us-ascii?Q?R2n+Br7JHt/QJbCN0nuujA5SvQLTXdtDxG9lCg2Hr7O4ksbeRZziH+FPA8QD?=
 =?us-ascii?Q?0BDW/QK70htnvumZP1IPsQaxbB3LYpVa5/eWgaeIUuBL8pPG7qyVqHLrTswp?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a36237-4e96-4758-9df3-08de365f4619
X-MS-Exchange-CrossTenant-AuthSource: LV9PR03MB8368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 13:39:55.9739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNJwHRWVmu+eux/qz1Xnk4ebtAdSqeHh1sWDSNeZ+i7o2WU0PfEQasz9ZdeMeHT7LjhB5UELWDecnvGALcpQ+UlaFr+DxRXFDClSR1aHaRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5008

From: Frediano Ziglio <frediano.ziglio@cloud.com>

For xen.gz file we strip all symbols and have an additional
xen-syms.efi file version with all symbols.
Make xen.efi more coherent stripping all symbols too.
xen-syms.efi can be used for debugging.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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

Changes since v8:
- rebase on master;
- clean xen-syms.efi file.

Changes since v9:
- Move changelog change to 4.22.
---
 .gitignore            |  1 +
 CHANGELOG.md          |  4 ++++
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 25 +++----------------------
 xen/arch/x86/Makefile | 12 +++++++++---
 6 files changed, 20 insertions(+), 39 deletions(-)

diff --git a/.gitignore b/.gitignore
index 57d54f676f..f282192b3e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -223,6 +223,7 @@ tools/flask/policy/xenpolicy-*
 xen/xen
 xen/suppression-list.txt
 xen/xen-syms
+xen/xen-syms.efi
 xen/xen-syms.map
 xen/xen.*
 
diff --git a/CHANGELOG.md b/CHANGELOG.md
index 3aaf598623..d15988fe1f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ## [4.22.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - On x86:
+   - The install-time environment variable INSTALL_EFI_STRIP no longer exists.
+     xen.efi is always stripped, while the symbols remain available in
+     xen-syms.efi.
 
 ### Added
 
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
index e6cf287425..c2f1f84aae 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -491,22 +491,6 @@ endif
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
@@ -524,18 +508,15 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
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
index 300cc67407..ee787068f8 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -232,12 +232,17 @@ endif
 	$(MAKE) $(build)=$(@D) .$(@F).2r.o .$(@F).2s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
 	      $(dot-target).2r.o $(dot-target).2s.o $(orphan-handling-y) \
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
@@ -281,6 +286,7 @@ $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
 clean-files := \
     include/asm/asm-macros.* \
     $(objtree)/.xen-syms.[0-9]* \
+    $(objtree)/xen-syms.efi \
     $(objtree)/.xen.elf32 \
     $(objtree)/.xen.efi.[0-9]* \
     efi/*.efi
-- 
2.43.0


