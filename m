Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED36AAFA077
	for <lists+xen-devel@lfdr.de>; Sat,  5 Jul 2025 16:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034241.1407165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uY3rW-0006Gg-AC; Sat, 05 Jul 2025 14:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034241.1407165; Sat, 05 Jul 2025 14:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uY3rW-0006Dl-6n; Sat, 05 Jul 2025 14:27:30 +0000
Received: by outflank-mailman (input) for mailman id 1034241;
 Sat, 05 Jul 2025 14:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oLNU=ZS=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uY3rU-00055Q-2R
 for xen-devel@lists.xenproject.org; Sat, 05 Jul 2025 14:27:28 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c603b62-59ac-11f0-a315-13f23c93f187;
 Sat, 05 Jul 2025 16:27:26 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYWP286MB1974.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:165::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Sat, 5 Jul
 2025 14:27:22 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8901.023; Sat, 5 Jul 2025
 14:27:22 +0000
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
X-Inumbo-ID: 2c603b62-59ac-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ys7ouQXjJukv5QFgSsrYD8Rh9azgdrgel6H+KjBChBdstfXDahAUKhthz3az5kTaS8ZfvGJvnX6AR1zhybreIiytN/YAx1yW/UbQwaacDwThjHb0wSjaqYx5LdeeDf8bl/Wq5PPi+PlLM1LnuZ+Zh33/o5y75vPA16kfuc42hnSbuH0H+zYCbzW8YgjA3dO/5FI347MgvKSSJzBmo3DBReJpEx0+okfUGwzHxbpIrVDtduZfzRK1HC1KG9XqhvrVgQtC79ctriVyGL6n/0DKZMkPyr2CabfHu9kcBooO2hUh6RhxO55LQ30ySHxpgSzdnnIon8VNgGxtltkHCP8MMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nnrprq8cKz+z61aN0ctsSnuccFtU6U8bKDUu7U3f/8M=;
 b=Z8xwkc6rTSD2/xS5HwJCL7jjZNG6zR980hFIdCclrCk4nZ9YNppg5fZAVW03Q0lxxQiNbad5Th7+tXFUSy4nX+iuks5iPyIvGJw/HwaN1qnNZv52NRLrNhbNxcCDGnHIOONuQQ6nQz/xbp21cahi7hmKTf6dqZW9kSw3FWSpQzBkgwUDe8gnhegmY0+rNrRm2k/2oj+sWse6BQzrqIHQP9gQAM17c5pvrMcyn+W8OyYMPG9gg+l7b0XTM+FICfSJcJQuyE6IdPcq8HVHahNgjzqoUKuW2uyvhp6tjtQYFC3W0LhKU50nX99EX/QM0pLEW201/AekVF4M9WRnXFM/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nnrprq8cKz+z61aN0ctsSnuccFtU6U8bKDUu7U3f/8M=;
 b=ZtUSqfZyS316wF45bG7OmzgtLLiqvZ4ByYUZof+A72gfE7yryuLGSoyBJgaC2kBwKmGcA1sOm7SGTnaJfDh6HWyMGbocy+alhhcARhTao6zK9GRFrtcBeC/8jZZ/ysiDKor4pukusU2QbKXoq+xvWe+18udxhvZv2i+ugMDmO0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Koichiro Den <den@valinux.co.jp>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 5/5] xen/arm: Support ARM standard PV time for domains created via toolstack
Date: Sat,  5 Jul 2025 23:27:03 +0900
Message-ID: <20250705142703.2769819-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250705142703.2769819-1-den@valinux.co.jp>
References: <20250705142703.2769819-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::9) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYWP286MB1974:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e0c3ca5-72a8-4c0d-2ec1-08ddbbd00e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d2kAyN3UUiVqQngOtNUdEtfvxACZeEVJDX8MUwuhX9oBnbPTXF3oxIpXtaOn?=
 =?us-ascii?Q?SNZF6wLXoX46FiGPxALymdmDszxqKpysi+YbSz1vU4j7L5caFRdx8YIDH4cS?=
 =?us-ascii?Q?CfomUXtswu5IkUwLalCf+AEyGMu7GbrZW38uVyDs02+FJqzbAGwPMzoFFicj?=
 =?us-ascii?Q?Q1zeiOgEBnx8OwzLp9i+at9hEsMeOyQ9npCtI6u+IOzfwaNfUCWBMDWNaTEC?=
 =?us-ascii?Q?u9DKRFFtkRPKc462gFNNifUxJFn+UTzUYCZkZGJo+WrOr+YLM8UVu2QpZMjs?=
 =?us-ascii?Q?24GwG7kXNdj6lgNT/r1bLQMaejOIHvUzcm/E0MKRSNTjeLyRxsJlXt15EDHj?=
 =?us-ascii?Q?enMfXQnKEIRrghgSyjYXdCsJuyzjhD9sRRfnMZrl0c9U+zMsH2Yani9sQBrF?=
 =?us-ascii?Q?87BMBhLzK/31aIX1OLdk6JdzqiF3oUQfyUG2+evoZ/xEzloY8VMl8EvppT+z?=
 =?us-ascii?Q?703GAi91iqQd/bc6wYNXPUN1wFoJRIPdSQBssIZNCfXJ3r3MVCdWsFjoBi7n?=
 =?us-ascii?Q?tXiLjGLcIcD4nykm+xDajy3BjEmIRwnhGRvyQ1kcBo97xkU6tZdrRKkM2c7/?=
 =?us-ascii?Q?5yFC3htN9ercCFCzdTF676b8jSLrh+m4Iycj7XLtheykloSZXxMyhAx2oq3+?=
 =?us-ascii?Q?ix9ousvLVY+HTrL9UKPfyAbub+7TQNPkxv1+T6HcWZzHeP/JYDHsPQstw9Au?=
 =?us-ascii?Q?KVZO5/kmvqtqTcxkaY7Wv3fmtd64Mpqi+7nxvRrmIRKrvGJiWwdRplxfwdEg?=
 =?us-ascii?Q?UZyqeXq2N9RTeO4CnHXrnN24UtTt2y08RAXP84YnZisI/N9WN/vAbcrLQBbb?=
 =?us-ascii?Q?ZDGdsG4RsWoiHhL6qDbfuriesXb5bqFxKkp7Z6jie0YDy/e/7QSn886N5G+Y?=
 =?us-ascii?Q?0yKg6ZEj//WvIgHGd52Nyd8SJInhxKkmShYbB4OXn9ZRxipnC8qEbwuH2bj9?=
 =?us-ascii?Q?4TS5fWDseI4H848TuDNRE5NPpG6wAF4PeGtwi3XOX6exYXIzN1o8II9HLIUh?=
 =?us-ascii?Q?GXUprhKxbWSKKRWbbJw/7UeGcl2p2he7KRXLheEcTj0R5ZSv4tL6JREg6xdn?=
 =?us-ascii?Q?hJQ1pT0NVGERv2mIwqbqqntFr4/Nx6NmZswEvycrIAQcZYE5itb618StDcuy?=
 =?us-ascii?Q?s4Jo3l5PEXSdXH9uLoHwD8nHkDF+9m87Y/qshwGlVtVMB0C9Y1s8UIjI0tP4?=
 =?us-ascii?Q?21z9BYZ6nTpJpNQKlb/WqowjZ7DN87Vn8moDdXPqbR+qZ9Fugfmy88EJSEZC?=
 =?us-ascii?Q?GTII6fMfGIsb7pY1ry86kJBhDjf129oOIfC1MMOumrXAgMBsMPFHqGzpwmIY?=
 =?us-ascii?Q?Mx26bsmprcIGs8MU0tq0kDpNRPNmYEQw7E+pWZ6TyLXxiN4CL/OSY/rjkCZS?=
 =?us-ascii?Q?G1I05Ee5RlX2TnafSH55wOs8b5FQR36z4bjfqZPJeG6TGGNfiQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VInN9cuWmqw/hGEJmcHBTZURivVpx3b+12ANScVUCG8i3Z1zvymcAs4WrNB9?=
 =?us-ascii?Q?2SmAjfuS/CMTcXsE4s6V2Iji3e/tv9lpTusFtCF9fKS0c4YcojempYoP+2d8?=
 =?us-ascii?Q?1bFpjGASszEJ0Z5qEjfbw1TQvhKWKSONTb+CxaPZ8BWYN7fZl71Xjw3fXNuc?=
 =?us-ascii?Q?Y6mNHAcNxHBSvmjLuHSfkaD0fTCW4cdmgv931Uy9zYFTOlBO4C7QSC2yRSW/?=
 =?us-ascii?Q?4u+gcJIcKufL8/3mJc9sJDUirzDnmSqcw/QYsRYhIIXNbI0e9KlaP7d2djCQ?=
 =?us-ascii?Q?gbx1/O1ko0bX7q/u4rlsUmpYuK0fuKQuMlUjCflrNwoTxS3429xIFRjpxWyj?=
 =?us-ascii?Q?E0URvcxTIgHDmSdSZQPAEDMo/+qkHkshnAfVUyntl64KIxPXh+gYw3wuRJ4B?=
 =?us-ascii?Q?IuLhdGiBZY/CQ776n7gCq/UWxgw+maO4Vihd4BiSAGm6bV2KRd9ZXVD31lMS?=
 =?us-ascii?Q?So3OyBEC0FqxmNTT6ZDDe8948d8TRNL2LE8BD7iDRCETMTu3/vxsNoTdEA0E?=
 =?us-ascii?Q?T7ftwZoRm+QOSOXtiRUFkF/AcKW8833NzCJmz704PRaEHEksZdtEhU+AYF8x?=
 =?us-ascii?Q?OIk6b5+eA8/A3itZkEfuFbwobBggSCJivXrqGLNC2P5HpJ5VUFmhFeO/F500?=
 =?us-ascii?Q?TY9y4+mwEb90xtNQszzz/9X0L+FlZgoipMFw+KNx6LOvnA8Z0T+eS1vFpxaP?=
 =?us-ascii?Q?4hVWq/lwBn7MjKVTJMmu1uAEEvZJibHJfI1atIDI8EnB1HOPkEFLH2vfwEXF?=
 =?us-ascii?Q?/qEIJc4D13ibiQBHGNgvYj1zTJ323iNC17fEXId9VRTEkZmxxSfuKmNUHPst?=
 =?us-ascii?Q?/b2Dk0xhr27rZ5eRZqlf4Ejpw3yK0RFRpS/l4K5vVHB7i41qWOo9fhqRMsdE?=
 =?us-ascii?Q?ekWIsK8nVMIeDiD/E7onm7wBt+7AV/eL70LCwO7mTnO+n4OSmZySPomvQ7lA?=
 =?us-ascii?Q?EWMhJUS4JMk9O6A1Rv9XVv3kAKFrIXRhUOLE+cv29F0ebXH4pb4WD1uPy3VL?=
 =?us-ascii?Q?JzfVnWDUQG0VGMkXt+f5WiV5+JKnuxlNhDk3o4UHb9+le3fzDY5iOm7+Kqpp?=
 =?us-ascii?Q?OMpkfdFeZCi1Gr/guspcrb2PkQSGt7e8bI1vpIJJ+efDxWTqfkKwSOzkgJHg?=
 =?us-ascii?Q?C1omkEFutWASUW4vsTSvOp29j0O0Ecl9XAec+xk2Y2kHY1vSGkxC+8W18NNU?=
 =?us-ascii?Q?IGnNtZGh+yiRCTbF/vcVJf/DOyNJwc/Ndz9bTh5F25kHnIxSNmjVVibUXsIJ?=
 =?us-ascii?Q?dP2/YVqSqN/WeBlhQ5us3TB9TG/MSYbWDzzKjkMLHv0Ifcj0bGiBlAZPXf4M?=
 =?us-ascii?Q?Wqz5Iuc0D6vtiV6gjC0TGm/XvZT8dSWzGGq7Lw4cA8BCqgE3k3V9CCOHLIu9?=
 =?us-ascii?Q?6KcQxNgwtl1Leax/7Iqb1dYLs1dA8inzFYTu2gpiJzlwjDYzTIP08aXnf1o7?=
 =?us-ascii?Q?HWyx/hr8vJLkRl/Su3A4+Ogv/79a3vCSI7JufWQKrZjTmKlToiZk8/Lzp5bC?=
 =?us-ascii?Q?QjSk4ACPu+YlqjXpnDsrrTTNZjIesbBsu0P/tHjDwmxhvZ/qS1RXz7eFLwJ8?=
 =?us-ascii?Q?FD16uwmmfx8KzcFoUJVZMNg3Ht2epAQmsvLWMaZlg3coUYQmvce9yDnBhe4O?=
 =?us-ascii?Q?ADdWQkJ0NSTLC24C41LvYkk=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0c3ca5-72a8-4c0d-2ec1-08ddbbd00e12
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 14:27:22.1140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHNhY70+QhFJfRmtUesGYkVPllbh3LVagZW+u3pCZsarITwG+f8cCkMduGGReFH8h0FP0KKhTu+FX3QgxxJhvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB1974

Implement ARM DEN 0057A PV time support for domains created via the
toolstack, utilizing the newly introduced XENMAPSPACE_pv_time.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 tools/libs/light/libxl_arm.c | 185 ++++++++++++++++++++++++++++-------
 xen/arch/arm/mm.c            |  14 +++
 xen/include/public/memory.h  |   1 +
 3 files changed, 167 insertions(+), 33 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 4a19a8d22bdf..33251520c07a 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -684,6 +684,40 @@ static int make_memory_nodes(libxl__gc *gc, void *fdt,
     return 0;
 }
 
+static int make_resv_memory_node(libxl__gc *gc, void *fdt,
+                                 const struct xc_dom_image *dom)
+{
+    int res;
+
+    if (strcmp(dom->guest_type, "xen-3.0-aarch64"))
+        /*
+         * The stolen time shared memory region for ARM DEN 0057A is currently
+         * the only user of /reserved-memory node when a domain is created via
+         * the toolstack, and it requires both the hypervisor and the domain to
+         * be AArch64.
+         */
+        return 0;
+
+    res = fdt_begin_node(fdt, "reserved-memory");
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#address-cells", GUEST_ROOT_ADDRESS_CELLS);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#size-cells", GUEST_ROOT_SIZE_CELLS);
+    if (res) return res;
+
+    /* reg 0 is a placeholder for PV time region */
+    res = fdt_property_reg_placeholder(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+                                       GUEST_ROOT_SIZE_CELLS, 1);
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 static int make_gicv2_node(libxl__gc *gc, void *fdt,
                            uint64_t gicd_base, uint64_t gicd_size,
                            uint64_t gicc_base, uint64_t gicc_size)
@@ -1352,6 +1386,7 @@ next_resize:
         FDT( make_psci_node(gc, fdt) );
 
         FDT( make_memory_nodes(gc, fdt, dom) );
+        FDT( make_resv_memory_node(gc, fdt, dom) );
 
         switch (info->arch_arm.gic_version) {
         case LIBXL_GIC_VERSION_V2:
@@ -1519,6 +1554,9 @@ static void finalise_one_node(libxl__gc *gc, void *fdt, const char *uname,
 
 #define EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
 
+/* As per ARM DEN 0057A, stolen time memory regions are 64-byte aligned */
+#define PV_REGIONS_PER_PAGE  (XC_PAGE_SIZE / 64)
+
 static int compare_iomem(const void *a, const void *b)
 {
     const libxl_iomem_range *x = a, *y = b;
@@ -1530,24 +1568,92 @@ static int compare_iomem(const void *a, const void *b)
     return 0;
 }
 
-static int finalize_hypervisor_node(libxl__gc *gc,
-                                    libxl_domain_build_info *b_info,
-                                    struct xc_dom_image *dom)
+static int get_pv_region(libxl_domain_build_info *b_info,
+                         struct xc_dom_image *dom,
+                         uint64_t *start, uint64_t end,
+                         uint64_t *region_base, uint64_t *region_size)
+{
+    unsigned int npages = DIV_ROUNDUP(b_info->max_vcpus, PV_REGIONS_PER_PAGE);
+    unsigned int len = npages * XC_PAGE_SIZE;
+    uint32_t domid = dom->guest_domid;
+    xc_interface *xch = dom->xch;
+    unsigned long idx = 0;
+    uint64_t size;
+    int rc;
+
+    if (*start >= end)
+        return -1;
+    size = end - *start;
+    if (size < len)
+        return -1;
+
+    for (; npages; npages--, idx++) {
+        rc = xc_domain_add_to_physmap(xch, domid, XENMAPSPACE_pv_time, idx,
+                                      (*start >> XC_PAGE_SHIFT) + idx);
+        if (rc)
+            return rc;
+    }
+
+    region_base[0] = *start;
+    region_size[0] = len;
+    *start += len;
+    return 0;
+}
+
+static void get_ext_region(uint64_t start, uint64_t end, uint64_t *region_base,
+                           uint64_t *region_size, unsigned int *nr_regions)
+{
+    uint64_t size;
+
+    start = ALIGN_UP_TO_2MB(start);
+    if (start >= end)
+        return;
+
+    size = end - start;
+    if (size < EXT_REGION_MIN_SIZE)
+        return;
+
+    region_base[*nr_regions] = start;
+    region_size[*nr_regions] = size;
+    (*nr_regions)++;
+}
+
+static int finalize_extra_regions(libxl__gc *gc,
+                                  libxl_domain_build_info *b_info,
+                                  struct xc_dom_image *dom)
 {
     void *fdt = dom->devicetree_blob;
-    uint64_t region_base[MAX_NR_EXT_REGIONS], region_size[MAX_NR_EXT_REGIONS];
-    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+
+    /* For extended regions */
+    uint64_t ext_region_base[MAX_NR_EXT_REGIONS], ext_region_size[MAX_NR_EXT_REGIONS];
+    uint32_t ext_regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
                   (MAX_NR_EXT_REGIONS + 1)];
-    be32 *cells = &regs[0];
+    be32 *ext_cells = &ext_regs[0];
+    int hyp_offset;
+
+    /* For pv regions */
+    uint64_t pv_region_base[1], pv_region_size[1];
+    uint32_t pv_regs[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
+    be32 *pv_cells = &pv_regs[0];
+    int resv_offset;
+
     const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
     const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
     unsigned int i, j, len, nr_regions = 0;
+    bool pv_region_pending = true;
     libxl_dominfo info;
-    int offset, rc;
+    int rc;
 
-    offset = fdt_path_offset(fdt, "/hypervisor");
-    if (offset < 0)
-        return offset;
+    resv_offset = fdt_path_offset(fdt, "/reserved-memory");
+    if (!strcmp(dom->guest_type, "xen-3.0-aarch64")) {
+        if (resv_offset < 0)
+            return resv_offset;
+    } else
+        pv_region_pending = false;
+
+    hyp_offset = fdt_path_offset(fdt, "/hypervisor");
+    if (hyp_offset < 0)
+        return hyp_offset;
 
     rc = libxl_domain_info(CTX, &info, dom->guest_domid);
     if (rc)
@@ -1572,8 +1678,7 @@ static int finalize_hypervisor_node(libxl__gc *gc,
         } unallocated;
         uint64_t unallocated_size = 0;
 
-        unallocated.start = bankbase[i] +
-            ALIGN_UP_TO_2MB((uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT);
+        unallocated.start = bankbase[i] + ((uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT);
 
         unallocated.end = ~0ULL >> (64 - info.gpaddr_bits);
         unallocated.end = min(unallocated.end, bankbase[i] + banksize[i] - 1);
@@ -1581,7 +1686,7 @@ static int finalize_hypervisor_node(libxl__gc *gc,
         if (unallocated.end >= unallocated.start)
             unallocated_size = unallocated.end - unallocated.start + 1;
 
-        if (unallocated_size < EXT_REGION_MIN_SIZE)
+        if (unallocated_size <= 0)
             continue;
 
         /* Exclude iomem */
@@ -1605,14 +1710,14 @@ static int finalize_hypervisor_node(libxl__gc *gc,
                     if (unallocated.start > unallocated.end)
                         break;
                 } else {
-                    uint64_t size = iomem.start - unallocated.start;
-
-                    if (size >= EXT_REGION_MIN_SIZE) {
-                        region_base[nr_regions] = unallocated.start;
-                        region_size[nr_regions] = size;
-                        nr_regions++;
+                    if (pv_region_pending) {
+                        rc = get_pv_region(b_info, dom, &unallocated.start, iomem.start,
+                                           pv_region_base, pv_region_size);
+                        if (!rc)
+                            pv_region_pending = false;
                     }
-
+                    get_ext_region(unallocated.start, iomem.start, ext_region_base,
+                                   ext_region_size, &nr_regions);
                     unallocated.start = iomem.end + 1;
 
                     if (unallocated.start > unallocated.end)
@@ -1624,38 +1729,52 @@ static int finalize_hypervisor_node(libxl__gc *gc,
         if (unallocated.end >= unallocated.start
             && nr_regions < MAX_NR_EXT_REGIONS)
         {
-            uint64_t size = unallocated.end - unallocated.start + 1;
-
-            if (size >= EXT_REGION_MIN_SIZE) {
-                region_base[nr_regions] = unallocated.start;
-                region_size[nr_regions] = size;
-                nr_regions++;
+            if (pv_region_pending) {
+                rc = get_pv_region(b_info, dom, &unallocated.start, unallocated.end,
+                                   pv_region_base, pv_region_size);
+                if (!rc)
+                    pv_region_pending = false;
             }
+            get_ext_region(unallocated.start, unallocated.end, ext_region_base,
+                           ext_region_size, &nr_regions);
         }
     }
 
+    if (!strcmp(dom->guest_type, "xen-3.0-aarch64")) {
+        if (pv_region_pending) {
+            LOG(ERROR, "The PV time region cannot be allocated, not enough space");
+            return ERROR_FAIL;
+        }
+        set_range(&pv_cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                  pv_region_base[0], pv_region_size[0]);
+        len = sizeof(pv_regs[0]) * (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS);
+        rc = fdt_setprop(fdt, resv_offset, "reg", pv_regs, len);
+        if (rc)
+            return rc;
+    }
+
     /*
      * The region 0 for grant table space must be always present. If we managed
      * to allocate the extended regions then insert them as regions 1...N.
      */
-    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+    set_range(&ext_cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
               GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
 
     for (i = 0; i < nr_regions; i++) {
         LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"",
-            i, region_base[i], region_base[i] + region_size[i] - 1);
+            i, ext_region_base[i], ext_region_base[i] + ext_region_size[i] - 1);
 
-        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                  region_base[i], region_size[i]);
+        set_range(&ext_cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                  ext_region_base[i], ext_region_size[i]);
     }
 
     if (!nr_regions)
         LOG(WARN, "The extended regions cannot be allocated, not enough space");
 
-    len = sizeof(regs[0]) * (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+    len = sizeof(ext_regs[0]) * (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
         (nr_regions + 1);
 
-    return fdt_setprop(fdt, offset, "reg", regs, len);
+    return fdt_setprop(fdt, hyp_offset, "reg", ext_regs, len);
 }
 
 int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
@@ -1698,7 +1817,7 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
 
     }
 
-    res = finalize_hypervisor_node(gc, &d_config->b_info, dom);
+    res = finalize_extra_regions(gc, &d_config->b_info, dom);
     if (res)
         return res;
 
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0613c1916936..4741472ea1a0 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -180,7 +180,21 @@ int xenmem_add_to_physmap_one(
     case XENMAPSPACE_dev_mmio:
         rc = map_dev_mmio_page(d, gfn, _mfn(idx));
         return rc;
+    case XENMAPSPACE_pv_time:
+#ifdef CONFIG_ARM_64
+        ASSERT(IS_POWER_OF_TWO(sizeof(struct pv_time_region)));
+        if ( idx >= DIV_ROUND_UP(d->max_vcpus * sizeof(struct pv_time_region),
+                                 PAGE_SIZE) )
+            return -EINVAL;
+
+        if ( idx == 0 )
+            d->arch.pv_time_regions_gfn = gfn;
 
+        mfn = virt_to_mfn(d->arch.pv_time_regions[idx]);
+        t = p2m_ram_ro;
+
+        break;
+#endif
     default:
         return -ENOSYS;
     }
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index bd9fc37b5297..4daa703e882e 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -217,6 +217,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_machphys_mapping_t);
                                       Stage-2 using the Normal Memory
                                       Inner/Outer Write-Back Cacheable
                                       memory attribute. */
+#define XENMAPSPACE_pv_time      6 /* PV time shared region (ARM64 only) */
 /* ` } */
 
 /*
-- 
2.48.1


