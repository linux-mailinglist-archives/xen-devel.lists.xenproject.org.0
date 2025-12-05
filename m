Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D6ECA851F
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 17:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179258.1502851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRYNd-0004Ji-Fb; Fri, 05 Dec 2025 16:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179258.1502851; Fri, 05 Dec 2025 16:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRYNd-0004ES-CJ; Fri, 05 Dec 2025 16:10:01 +0000
Received: by outflank-mailman (input) for mailman id 1179258;
 Fri, 05 Dec 2025 16:09:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3Xi=6L=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1vRYNa-0003Yi-Nh
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 16:09:58 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7bda416-d1f4-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 17:09:58 +0100 (CET)
Received: from LV9PR03MB8368.namprd03.prod.outlook.com (2603:10b6:408:364::10)
 by DS1PR03MB7941.namprd03.prod.outlook.com (2603:10b6:8:21c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 16:09:54 +0000
Received: from LV9PR03MB8368.namprd03.prod.outlook.com
 ([fe80::d8cc:b839:3d79:59d3]) by LV9PR03MB8368.namprd03.prod.outlook.com
 ([fe80::d8cc:b839:3d79:59d3%3]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 16:09:54 +0000
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
X-Inumbo-ID: d7bda416-d1f4-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZ02MXwNnW4zYydpvhRtrsIaNvNMCvrCBIL+8dcMNyR3sGkznsbPm0nwZyzAkDOT7wpZjkrQy7REEhZdC/7Dooj7U9Qg88H56ZzetzlhwYTTJykW8NDR6tf/s8IzllD7E/8r0jP5rqGQTxogtuoxEK3dREwAx1u23g0XMgtTQ65eyW4AbBOVMSPbhc4sg/Bx/ZPAEc/SyYai3CVjP16576qebRM2mshp4lBxVicGLxpfZpSiKfe3vpMt+D3zCMepGNXiCWpcR84uRXIvsoJxRft3a5W28MQ2398H86uEvF+yegicCr1E880s3nH1b/qQMRNL7RBHSQivzueKkMPV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+l/LKg3YfOQU+0AyKjgO2lBUesaworZ7t9S44g86cY=;
 b=gHuoRbFDTzmK6XIsWj+Ql6TUj6J6t3NBaUQzrn5Fxdk/V7Z78cMUSyS6XQmojNmXUR6Vqt/AiXXfsgrJDb+/BvjGL0T6TLo+JdACoPxnMxCUaI2aPYJzOUL/pw/5wetkB6QPPoQLhlqCujC4qOmJ3i7j8Y7UJ37N5ukHB8NY6EEf8lfsJu8/JOsI8C+fdbTPT2L5+EHXIO0MsyA+KO1qlyrwnZDCjGe7jcTxQugnVo9BAU9eb4nbG3b9QOiZEp3L06HVdmT9yFKKtsMABMuJ/VF3NfMnsa3JDdhmvaMv/SUOczV1BubtzRTEdUSMLuiFtS2OJOwC04QdPIKJHcEULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+l/LKg3YfOQU+0AyKjgO2lBUesaworZ7t9S44g86cY=;
 b=SWOhFq6nxRvQXmU+0JEX0THIgRBOl7jgVfck+gqEyLVNlxWsQssEaCchgkez496c3GzlCQbtBaYvQnQ4NXTYflwtK8/QXWrwXjla9SfsnzBUlUzZeNgz/qFOwnzd5DaANcBtFQfkfgvs0+YKVWMbUWpkmWA9mGgG6snT7AP+BbY=
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
Subject: [PATCH v9 2/2] xen: Strip xen.efi by default
Date: Fri,  5 Dec 2025 16:09:40 +0000
Message-ID: <20251205160942.46694-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251205160942.46694-1-frediano.ziglio@citrix.com>
References: <20251205160942.46694-1-frediano.ziglio@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0199.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::6) To LV9PR03MB8368.namprd03.prod.outlook.com
 (2603:10b6:408:364::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR03MB8368:EE_|DS1PR03MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 630795c7-ddc9-43a3-71b3-08de3418ba1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VUv5E0s4JaBSKP4cLbkXJfgUG2tQdkMtw7QdK6uMQ7t/HAA649NpQoojX6fn?=
 =?us-ascii?Q?lUpBj5E9CAlA6jAIE0nAUZ+nh84K1EwwKZ2KrPc4ltWobKoPeLw3O3hANLks?=
 =?us-ascii?Q?a0MMN1qCbI0QCSmzAem+alJRzYb1mareZzffWpSMBxeXEYfUhLmfdYfVzI0U?=
 =?us-ascii?Q?yfHzXSIMqelP9+NygjEShgJXlUSMzIcq2rHZofBaGiSSA1qpldtttlTHohXZ?=
 =?us-ascii?Q?EJtxZg21lCgTlipTgtmLXnauZ7WvnrjUy2J7sAZdrrMxbP0ws0BeVud2GSNM?=
 =?us-ascii?Q?jvHTLEFuGwvODn/sG52snZiFQG9NJuCprqn1nGCgRlBtfouEOkRxxL/uAWjA?=
 =?us-ascii?Q?n2OdPmGdh7brcdDM12JRp7CXahuXvou1Zf82Z6SvYzh+Cl7vN7+3W4vbi4g/?=
 =?us-ascii?Q?urBoY8KJOcC58gzQD5jtRR0ciM6aU3SNgppWUS4VV8K0kUsPrAeeU6Jj301J?=
 =?us-ascii?Q?E/gkVzXJr+eh4Y4B9q0LjSO//lndJ1OJIz4T0m0SALECpuHZdlQHe7jHn7dD?=
 =?us-ascii?Q?UIlNpejorohHN5iPh4AEESqx64DHYpmcUvr+3g7Nhlf++DEaR+vCNrLpOBfd?=
 =?us-ascii?Q?qFFSvvcSAoJXLzZpLX0WhZCDFymcCb9iAwV1+NHre/jY97gA/MHeGEv1sF4a?=
 =?us-ascii?Q?kz0Mn9vEQxRfS+//yv1Bz70L7FXV+PvmZHPo8sOcDEvPhMvBgM57h3IR5nek?=
 =?us-ascii?Q?5D8oX4FQZTw6Ej17scD4rK8hbTScxMhx/GIzrNPcZh4IJ0toZgVP+SjOUMl7?=
 =?us-ascii?Q?zaEQzguCnL86N9ba7l5DIkjD4V7o78e5LRTqSCWU1GN+m6lEcI9jA7+EU1lj?=
 =?us-ascii?Q?1qU0r6F7wk4rS7O5cSp34WF6/ZZznMHX6BRG9pI5UUfGg1Nb/9fwWr7HL5+R?=
 =?us-ascii?Q?rXbKED9XsT9LO1r/EaeqA9UhbPv19w1afw0wFNfOPLmGWub3PaHiceX/FPpZ?=
 =?us-ascii?Q?54+t6GdKnBP8+N4ryK1m5SRchzMRluyYPs1ifM6HGYpyqsOeIlmy5KcfDikr?=
 =?us-ascii?Q?J9uuMQXtPgDTdHZk2tnSDMhYoKLOlAh7TTvP2q2FWqOodoC7v+ZK/PANiSB5?=
 =?us-ascii?Q?8H1i2arpMbjl/rXVNpeVXWZrrU/wWmEeNBncccmU3JRClQI51+80ffEhmf85?=
 =?us-ascii?Q?/Vlzr9Yyx3sj6ImlU5gvcjLVrkhXzKpK9Xn67cpvtZKKHfKmHH3AxTOCTmHO?=
 =?us-ascii?Q?VrZvbZUr3C4s29nTdo8rwVSddnvMpf+DCATmzfB3A3GlIu57iHMN4oSc+vYX?=
 =?us-ascii?Q?2qp7tc6dOS2tSf4q7SWJoR6sVX/ISeuXnudX1NImHNKMVDJqE1QQUyxfIFMt?=
 =?us-ascii?Q?/JPXMryhbTa9OusGs5CcUK3BaCaRMH9zlhEce+DJanNuhZH3LA0u7jGW8fjn?=
 =?us-ascii?Q?1p5HkBiVKdZFNxG2RNE1wM+DyY2TEYYCXShZrCxQAtD0gKwQzQ1Nn0uJCmGD?=
 =?us-ascii?Q?kYfQUkIPCAv7RMYEQYR2KnYXRGDtP+lR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR03MB8368.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O4IcYVNrFybGQHy1+Ss0B/4ZBe1+FUFEIf7ucOijXFFfzbO63iTcfvMJtqN+?=
 =?us-ascii?Q?8Ao5Kwz41h1jT2WgmNIwpim0/X429wBCtUmQtqGD+sypZKGeMQq+aefe0lU4?=
 =?us-ascii?Q?9OLigh3fApZxgYnLj4J7sSAF0i6+HjjKDJ39/l5bkHU3PcqyYtGr3Vm0k2Lg?=
 =?us-ascii?Q?CsBfplWWRESVB2NSllibAXtTCsx44pcsm6eFP42pPdAeYspTUyFvsntv3Htt?=
 =?us-ascii?Q?zVtpJD6nKPBFtIghzrnHZ+Qo4pXjwj/E+GmqBhOyiJy/D7GvrjxQRz3BpoBu?=
 =?us-ascii?Q?NmIyfhfT54ZIPxlaxFTNRnvDokxrzrt9jdm4o2Lr/Psii3lpBo+qYwZb69+r?=
 =?us-ascii?Q?nQ87Ma8t8nNs/LRtP2CaI/y8c3l+BTSJRNtKOq8UR127CLmPjsbfdoC+0xaH?=
 =?us-ascii?Q?6QxOvg8rseEOn5IL8bL38gg0URr7A2XsWkDuyDyRUtAQX9POrU+0UQtfY9DX?=
 =?us-ascii?Q?aYXo5fG3tyHzkLw5WTog/bo0zg+yKBoMYReSZ639ezFr9JSoWUG4bSkIRXa6?=
 =?us-ascii?Q?k41VsxsrTpAf4NMjrn4NQj22Lm9mjmz4GodL/PxRUUYXbyo4Jt3og+w8QrAT?=
 =?us-ascii?Q?VEcIS5Nsn80bku9tU7/pbzMn/EYx+/2Yh4RbYhY5x8enIh5RW85Rbr4Zj+j1?=
 =?us-ascii?Q?YTm+kNjPvvjsNrhUJPsg9boCQ7iLTzXhfyeNRDfLDucccoop9GEUibSo7BeI?=
 =?us-ascii?Q?DiQlGLXuhWpM4aH0ynvrnf95jsNUELAEADZfTCkLmVnekzN4mrC8JiZWLFyE?=
 =?us-ascii?Q?U+m5eY+SoCaACao7m3lvgqVVHy2tHJFhFC6XZUi/xwqfvLTyiZkJy3sAyyQU?=
 =?us-ascii?Q?Iew+pQT4JY04ky/Hrh+fSnYvcchtws9wQTVkhdJ2GrkpHE875uOELZgrfZ/v?=
 =?us-ascii?Q?G1RpADBPLxilta/vYGtbhv2NBdYalGsIhulEdDBvcNFUsEXSI4n3wF+Rm/J6?=
 =?us-ascii?Q?fNQbdNdW2AO+eSMigsOoWsWOAQgBB4/Rr+8XY0it/gzyXE2RdXhB9JzAwu0N?=
 =?us-ascii?Q?SnSPWnXhLirw25hWrLaQht6vLTmDJdERYRKx+3j1Atk1CzdOSKcANptfmZzL?=
 =?us-ascii?Q?Vq1Gun2c2+xvj7OFZQv1kMlUf2UKhXorSMZbOLZoU0H+4aaEplvg+TWulYpv?=
 =?us-ascii?Q?KyV5t9KmnEZl9RcLmcrOIgo8IVGXOP97zcxKMrSs2U6hP9vrM5WJ/pouEjF3?=
 =?us-ascii?Q?6MKVxjySLSHNE9bqAZIli+kCE7j+/A6xu4SzXMxIReM33i6dxGw6+bvnU79+?=
 =?us-ascii?Q?DRLJJUkoI9G8P/4H4HbdQg35Eev4AIG1wqOxF7LwYgQZsf1/Ynub9O4irdx8?=
 =?us-ascii?Q?SYhdON5H8J8QHqmPm7ljB5QhKOwowszCxRQk09SEI1akOKAiEtf5DciaJkO0?=
 =?us-ascii?Q?RPweTa87W+bmSm/MAGT/gHBpsx+L1G72tbeq3GLjDQQU4kqt2kT3UMWgUqZu?=
 =?us-ascii?Q?sAgb43hGnAWMi+6giA2lfH9F4harvFN/FlLfzcxpOiYeE9YsYE1NFz2/vq23?=
 =?us-ascii?Q?usGAf6CGejHeEu3TeVcYJFZEdRp2waT2CrMCKglTwCPeTnX+rkGzjB79q4VN?=
 =?us-ascii?Q?V5ZKEORdREMETv7wihFre4tYao92DVRsdXop2komoS/KoX/z7qa9//jprzL1?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 630795c7-ddc9-43a3-71b3-08de3418ba1a
X-MS-Exchange-CrossTenant-AuthSource: LV9PR03MB8368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:09:53.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fesUoVmjNBTyx/Uwl/Bp8vRE/4u0ElWhg7z0eafoGG9QYqEuDMXWBbd4++6x6JqQ3mLV2St/PVovTpeGj0j/jVFnmCsZPj+oUiAJZB/9qHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7941

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

Changes since v8:
- rebase on master;
- clean xen-syms.efi file.
---
 .gitignore            |  1 +
 CHANGELOG.md          |  3 +++
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 25 +++----------------------
 xen/arch/x86/Makefile | 12 +++++++++---
 6 files changed, 19 insertions(+), 39 deletions(-)

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
index 3aaf598623..f26ec5b538 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -38,6 +38,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
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


