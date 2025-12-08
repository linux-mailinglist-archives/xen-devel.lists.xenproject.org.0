Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E1ACAD4CA
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:40:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180570.1503745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbT4-0000H6-EC; Mon, 08 Dec 2025 13:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180570.1503745; Mon, 08 Dec 2025 13:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbT4-0000FK-AU; Mon, 08 Dec 2025 13:39:58 +0000
Received: by outflank-mailman (input) for mailman id 1180570;
 Mon, 08 Dec 2025 13:39:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9FtP=6O=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1vSbT3-0008Rh-Ey
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:39:57 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61bbd835-d43b-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 14:39:56 +0100 (CET)
Received: from LV9PR03MB8368.namprd03.prod.outlook.com (2603:10b6:408:364::10)
 by CH1PR03MB8167.namprd03.prod.outlook.com (2603:10b6:610:2b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 13:39:52 +0000
Received: from LV9PR03MB8368.namprd03.prod.outlook.com
 ([fe80::d8cc:b839:3d79:59d3]) by LV9PR03MB8368.namprd03.prod.outlook.com
 ([fe80::d8cc:b839:3d79:59d3%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 13:39:52 +0000
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
X-Inumbo-ID: 61bbd835-d43b-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dornyFdXjOYGhhjI4NvVTIBemT3VWirMl+S8HYbnJpcEXVlSpc3Pctpg1Nn6I58xxl4Pf5CVruzZuJzPJX+o3r3VYVyKclMi5XMnrh5VbruJkcQT58B1BKSgD5xd7UILBMNgV+gsuKl62M3UuotwVv8Gl6s3N8ViKUHGT/GZGKoaBHL3tcJzyKpnvG1EKAlSZTp0YX+haBzwZR9nPV4n81brHeFAvjD60NbRPRLEt1I2JqciNgpd1ket4YijyeEPI1YWG1cFBl3SzpoBFuskywncdMbuAfhZT9SHjcRTnNPR0RMOCKHe4zJTFyRuzQNzYGAKj/zkrebKulVebByhiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=au0EvkHErkBhFyp+np2g5Y4yKiCVAKiLNFKJGeXlVe8=;
 b=WmInhflzYmBaB/mDlpYd5UY76ceF/FFgcrCIh7DzzJmDim3ZKNEFZ8R6Y9icAM9b6JIWf9l7XAQL1IzbIrIvAyBUQ4rO3RJSeRxU7V4HpCEoCE61I+TuD+XI7tyU0Ua5CI1a83b8EIKcHlPj09aea1wTnVTlZVW9SoP48Xl/QkApxyWAHL2wn8krdAG6vw7sOOc2/aiBQkJpujyLfDtlwjZ4Pqg5krJBBs5pPDPIwLsHS4esPnEbB5jc85GpKHsfFEtWEcUa9PyMHn3R09D0QgAuY/F7eJWYSW48VznKo4QXeO2ka+lURRu1NnjiGR+wGmzpFI0IXjhY1dsPGoZh4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=au0EvkHErkBhFyp+np2g5Y4yKiCVAKiLNFKJGeXlVe8=;
 b=oGAEriD56k+xmbdPw7D4cOpsXq/232Rt9okC3yY/2Cp9R0ey0JxgIzMVkXuK4jjcpdpzcym+Z5pdBm6DO4UD7bF83kKjfGcc8mtNeK9xOu0yYuuwgrgpB8nlaLtX95smJqt/HY6o02EU9PTBcJrF4eACpJwZr9UwKg6R7zSet+g=
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
Subject: [PATCH v10 1/2] Do not attempt to workaround older binutils
Date: Mon,  8 Dec 2025 13:39:42 +0000
Message-ID: <20251208133945.61375-2-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251208133945.61375-1-frediano.ziglio@citrix.com>
References: <20251208133945.61375-1-frediano.ziglio@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0240.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::11) To LV9PR03MB8368.namprd03.prod.outlook.com
 (2603:10b6:408:364::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR03MB8368:EE_|CH1PR03MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b4b36f-d86a-418a-bc35-08de365f4424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9Ldjiw7DO3vNZN2IhPxpz4BrawpcP+H2mVQrSqIA8yEhCBykW2IteSLUABST?=
 =?us-ascii?Q?lRKlUmIdhOFHSCeK9zStK21KTyMWE5GMRulmx2EMKBgHbOOaQP3wfiIOCMKB?=
 =?us-ascii?Q?/PoGPnS7sqkkSaXcFO3hkhXZzK4SYOFmsUYzyRMoq8ImEsZCd9tt/FCAts9E?=
 =?us-ascii?Q?+sORa18xtH32w27KYnn3CuoW9n4GVnkM+pcsN66tV7mOt8vdD7BjcZEE/Fnb?=
 =?us-ascii?Q?OKnjbsrQOBhL4mmPNyPhXmMjshtHgwUmJO5RSp8WgE3faBcKnCMcatU6TpYt?=
 =?us-ascii?Q?KMn7ohasXHfeKRUyWC1AX7sR3mMwlDf5zdHxuj3wYsXUUgo4p6V02vf+eKJz?=
 =?us-ascii?Q?WfZOUuYhFxDEYLixyJXYhGBLfXgoTi6GpnLTGRegdMClFM8pVDmEiH9L2dAb?=
 =?us-ascii?Q?yN+3XoNXrTPbAjgX4vgNCOQoNF++STcaleWDGJckBkIgBKkyvykvglVjIxh+?=
 =?us-ascii?Q?K6i7iG8pw6269ODSQxrG284s6J9t0rNdmJThiiLYBmTIdT8TndnYVHDkzk5m?=
 =?us-ascii?Q?Ofh3/00VkLg1ygbYwxBEkLCnXUyyekU4/hd3RP1go1NUXoA37qrj3sGv6LK+?=
 =?us-ascii?Q?mFRYIk0RA4ssPw2YyH6peKJeJYq6hhVI33Raz8JZWet50XS0uXum7Z8rWgON?=
 =?us-ascii?Q?ebP1ynzGaWOd/JmC7XBFd3hb2tDM/C8OK8VlzfcqWj3VKyIM5SkblxkelJWl?=
 =?us-ascii?Q?eVH74peOBBwDiZ1iAblRw+zkb7ms5jfXhNf2a0/tKFyYoYMHVfG9tZEHjaQT?=
 =?us-ascii?Q?atJxl2XHZU/eyxAZsDgxuQyHeNbctKp3bPsjb0U4RPYk/+hJD/LcFlUyX7/8?=
 =?us-ascii?Q?mYOYF58SsV6JUvAwUFa4Zb7Os7F+iqdv5gLSbvR9edGJjfnLsDXgeMgQbK7r?=
 =?us-ascii?Q?uMURGni2U+vvKqJUiLgFJY5DSH4Q1SEB5v7i/vzPMKiPly4FG8rOltiYqumf?=
 =?us-ascii?Q?/2HYaOyMXE3wL8KZS+1z7yL+A/i7U/xdlYOGZlU/JEyUQ4G/i+7BtfQ6ptNi?=
 =?us-ascii?Q?o+wl6ZnvIHDA3ZL437H3Osdhvd2Md5GDnSxxNnfAX7z3gnqcnGeBh9j+/995?=
 =?us-ascii?Q?4YdyovgO++2XYwExBaNDPD2vuDlzQbDqNlNdcPYiNcoQ3Hct1KNRNukDpZ7m?=
 =?us-ascii?Q?nxU98lFLfmnise/0nqh+A1QKuvxlOn6hG+fZMrKkZSNIwqJq+wQNaFWbOznz?=
 =?us-ascii?Q?dieOfhVsnrPnHDVDlqAru3s83PKvaRIHjKF6zXaJse8vG3GP4no/S+fJ4jKb?=
 =?us-ascii?Q?GImFiUL37lsrzrSKP73ZSvI3ujGdJ6TwJFnJMplnoqZb+Bg7V3INB2KbdY7J?=
 =?us-ascii?Q?7Cpw7BWaDuLKWahfErZJOZewpRlrmQXrxhb8WsAPgv0viB75gGrChL8svbbH?=
 =?us-ascii?Q?unoIJXv53kXzd6ZJyx+86S8o3c2m3mUDHZDeWnuMN9Qv2WNK96KX57Z7Y3gp?=
 =?us-ascii?Q?85Ab9DLHubr17iWHrZgFGpkk3jD2l5ow?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR03MB8368.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fO0ewK2ZhoqirFArUA/3ZEdx3uifn93cfvXNZZyWDCpVEfM4O7i1mRsQ05/V?=
 =?us-ascii?Q?MeUG95ZcXBiH3Pkn8tn4iESRDNpaUz3qfF61IgbUaLtEf8JxqX6dj3gbEJVD?=
 =?us-ascii?Q?wE0V90jG8M24Nlc2tZvKypUbgOdJpODybt9lu8t692IXHRHK2OxX5c7ySxiR?=
 =?us-ascii?Q?FxhSgGHiLk9ZXtVn1C381d4lDqrkJKsj23gBI8j/3m7dFg+q0RwxIzF9zkSL?=
 =?us-ascii?Q?YdnEdOuON42DfUCI7JQ+F6qD1zSA6G7kFCrl6WgdaBGjI2peqQayeYl+ftb6?=
 =?us-ascii?Q?txt1Fi4Wo5Vn9pGeR1Gk1iAF4ri6XRzlsj1cx/HgKyIRJ4aFI1+GOOHCB1RZ?=
 =?us-ascii?Q?BbL89bUuLFHYg4hpDQGsePTOGm3mG2PQVDlJ9Sb4yrMXwr/w/5y4FS32mjG6?=
 =?us-ascii?Q?0H5Ze2JLCG60M/WWjV8dv4NTpdlorDXqfY1rC+M0v9Syh8uPLTAcWCqxpYMj?=
 =?us-ascii?Q?Vfa1GbzmcAZWDoiK02d+0QLAcvtfggQPhPfOc6bNQuVnb/UgjWEZ7ZUnE14F?=
 =?us-ascii?Q?CNwhkoAhI7bDtYydkjpslLjJ2MTyjZpriV1iZnwLIgFvKCDPutfTtIBeB7KK?=
 =?us-ascii?Q?EEnxLIOEb9cvzpvi4YAOafGedJ8bME9ZF8vVYsxGqLq9XT83UVilgnRaR2tT?=
 =?us-ascii?Q?Wq9l2cnNGSFS1ZADo8IKvcb/uNpT79FS29mdAGoVw7NTZ3afehH+2xXO1tKt?=
 =?us-ascii?Q?pj9AgsWd3yCwuqhMx7+hHt5aooklSfD8WWyLHKnw31gLwGFW7MwsU3UCCyks?=
 =?us-ascii?Q?81RdPyG8oqcv9hXWHPpSXmxAG0tdqj948FtslQELDWQwKwZAZBNiLv3my2cg?=
 =?us-ascii?Q?HKJat26mi+j7Av1OJQFA2zqPFVnbr3MqFTPo9GJX80Z7PoC6xpmW11Y2Vbof?=
 =?us-ascii?Q?tHYRs6qD5MmiCUEs66vpiU1Z+yzxOmTTW9Jlk6tQP0Vb2JrTYfwjzDVBU89q?=
 =?us-ascii?Q?4VaXm0Vy1Buju0WOD/DS/CgQSTedT6uhLS6x7q485Scr7Mtc/F2WUs038bLE?=
 =?us-ascii?Q?tm9M7B8dAUTsFXKlmmd2+7S2wgZBu91152GUDPj6S8BDuYvaHyfAIx50+X31?=
 =?us-ascii?Q?iXUX5qkIjGhrmzaJEDgZ7CNJb1apN4aZL2a16HKmnd43lxpLjyiO3pQrWvNc?=
 =?us-ascii?Q?aCUjT7rXOXNDfmJFLJ9INmhUNpTQzTqL1RsAjf87E1t1jtsl2VgHYsnL7jCQ?=
 =?us-ascii?Q?pEBM3oBIVKiC8jYPXkTzAln2XxBmD9Wi4DbS2EzFAsxidtBEOqsThrLGHxJV?=
 =?us-ascii?Q?WDEiI7ttQzysD0oN+ajvvM4/YnxFZ/kft7V6Lvab5xYYVCdvLr2uHCWsHdN7?=
 =?us-ascii?Q?vZJkDKvrjLPekWLPetvTOZ7/MyDj7iQuJq87LxIP1DBSv5+BfKgSLFka2Wy+?=
 =?us-ascii?Q?EUsWZEPqx2HxVVmodPpHQlSw3qFFh4kT+l9saUiIHKvWO3vhJDGVOtVTVzim?=
 =?us-ascii?Q?2bv3/xznDUdOvFIrNSKrZ2B32Y/0wLRBlCxGnO3RfNKzhBUxx+5sLdn4R8kV?=
 =?us-ascii?Q?F622T0SywKE9MeaiJ0kDOHRSVcvB6AT1PQt9bHRR9br94Ko4Y8pVLYp1e9I/?=
 =?us-ascii?Q?MokKzaiXXIAw3l/XHihWzhVl72+ayR5OP1+qKqgBPwPmS6ORdCEkh2FpbNh8?=
 =?us-ascii?Q?kw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b4b36f-d86a-418a-bc35-08de365f4424
X-MS-Exchange-CrossTenant-AuthSource: LV9PR03MB8368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 13:39:52.7977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kc/NoZ4sgXujANvk1pL9aBbwMVfBC54Ek1SOCKoU2/pbqiw8bCXFGkfodRtoH5jLXgnv2gy5/iUtQLfB2YlAHcN21NbpgKUFkqFryOaQ8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR03MB8167

From: Frediano Ziglio <frediano.ziglio@cloud.com>

Older binutils versions do not handle correctly PE files.
It looks like they could work if they don't produce debug information
but they mess the PE file in other way like putting invalid
flags in sections.
For instance they set IMAGE_SCN_LNK_NRELOC_OVFL flag which should be
set only if the number of relocations are more than 64K and not on
executable (while xen.efi is an executable).
Although some UEFI implementation do not check for these minor flags
we should not allow building not working artifacts.
Also different tools will complain about the format (like
objdump and strip).

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v9:
- explain one of the broken flags.
---
 xen/arch/x86/arch.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 16368a498b..10eb8e4292 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -88,13 +88,6 @@ EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10 --enable-long
 LD_PE_check_cmd = $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o $(efi-check).efi $(efi-check).o)
 XEN_BUILD_PE := $(LD_PE_check_cmd)
 
-# If the above failed, it may be merely because of the linker not dealing well
-# with debug info. Try again with stripping it.
-ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
-EFI_LDFLAGS += --strip-debug
-XEN_BUILD_PE := $(LD_PE_check_cmd)
-endif
-
 ifeq ($(XEN_BUILD_PE),y)
 
 # Check if the linker produces fixups in PE by default
-- 
2.43.0


