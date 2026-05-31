Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIQILdi6HGp+RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5926182A2
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323455.1589164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox5-0004mF-Rm; Sun, 31 May 2026 22:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323455.1589164; Sun, 31 May 2026 22:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox5-0004jF-OL; Sun, 31 May 2026 22:48:15 +0000
Received: by outflank-mailman (input) for mailman id 1323455;
 Sun, 31 May 2026 22:48:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wTox4-0004bc-T1
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTox4-00261G-A0
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:14 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba69-2eae-0a2a0a5409dd-0a2a45099642-26
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:14 +0200
Received: from [40.107.74.96]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbaaa-2497-0a2a45090019-286b4a60e9a3-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:14 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2972.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 22:48:05 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:05 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9haRMnW71ErQtKS09RyRZIN8yMlyMURA/o6+icTpkKp6dUeoOatFX6IGJD02ss64LH+XHsajk0d5mXvgSfYxXb6yEDX+zsT+Eey0GiIGmbYG19OS/lk2+8LHNlffII4SXLoGJZeLcrrwSmgSjOyUijqOmvWCLu5NK494vHHFwi5iWbIi1dEJVVcXslkViSQ/TmyyZQXrc2BH/wrq+Y8DR6nsikiDC8456SQDAat4tHd3hBLSKlcRKkNs6rfkwuBD9PxaEmnHsWC8qjaN0KaSdSIxd9gk7qJvytwF0oFtxs2lS4gdwyKqn3McBop2+xCfzWBk+OD9AwDRdm57BrTrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE6FuAerqw6orzqzu04p0kLbWxovloaphAeAZjKcIaM=;
 b=BLEvkN4y7G72GnrjmO6tIUDLJPSGucfFWcSSOM12slbD2A8a7XAgPdF1hGOm6u0+eEzL5dBLkg9YF8ilAujpdN8OLOgKxAn6Yq2gVT+EYuChQGYqq/+UPrHrbfh438pU91j8nr6aUuEXL7kso4Nw0HUSvt9kLY/FY1xRCjZy/X2FTCeuRhcSp93TjtDcFXj/fZZV85bzwZFR1MFRDGi2ONKSIzkoE42vwQkWdcBGVVe7ceAXOTuLKfwGzHPEz8w5LfK2kWOrI42RNlXjab/U1oetIcU7njYZt4Pmzyu8VICxea4kDf8xFoj2NuaK/EVW0zJbadRM9DCk/OhLiyWeSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE6FuAerqw6orzqzu04p0kLbWxovloaphAeAZjKcIaM=;
 b=aGq4e8hp4on7oFMNkaN+t3V0R5+zK0wHYv17LjdjizdNfjt6zslR2q71QZJ/50rdG654dZjotNnEq8JSONsmjt4KA3HVWJow41byPUVNl4AgZEgHvFrDnRbIh08rwomYdgjMKxbvd102MkuYcT1I/W4Kf6C9HVVBSjDZHkpO4iY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 03/24] xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA config option
Date: Mon,  1 Jun 2026 07:47:33 +0900
Message-ID: <20260531224755.9481-4-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0065.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::14) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYWP286MB2972:EE_
X-MS-Office365-Filtering-Correlation-Id: a5947373-07bc-4148-3ce7-08debf66adab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	f1XizHRWDgi/q5p4k6ds/+pPedi3vcWp+sM4VUN/+aLxbew8Uj930n2ZvFqqIj3Ud0qVlYJTe0rDRbGpOodfjXXb1f+pq5BkTN0peJtjiCkXmry7R9RGnHwrL3V06KS5VkyVdkFhQBVc+U5JEn5T8s2YiUwTu5bGVUNGAMxTCFWzdmW1mOwrrx2cSueZUA61dyeg+n6bd+TiiqGrYysxi+Vuv0WXnZNE0FygQpYYjbmq0eAUi7P2OEyziA1T5B1pb8z+IweGs4/5Sxzy6Lh6O9nUAAmyl+lhMvqCijK68oSEnuEOKl57rI0+ndZfhPV88Kqon1S/t2KbgCoDj70NI6iLVM6YVfQOmz6vOQJ+4TyVZ4KbPQ1VN0871yzpQDO9KuyU2fEJkE1oENHGehwSzr4fpn9v5gZSoMZJWhVsNcWUBzdZV9EthiMaUceXvG7UBhLuQ6hnMMk8e734zruRBrix4OH1oNOrr9c5hjqErr48Wm+wYd35G4vzH76Hl/3I7rGgDTJJlHbgENTrpAk0DMs9ER/uf5b4usSPkp1tICEFFUESM15svO/FS/cPtuPf44UnHbjkY3o/LEhALpV4UH0V37bJOBJN+z/zudIywmz2Eq+ZeKAV8F7WQd5Z48IF6uD9zePonuR0qrccjrIQxOe8R2S0cuKY57GIbeudi0XIV/9++M7xXEtizJphAwbG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7gvA4o/jo6nimHWCT+zPxvLfcPtG1TdyfBCmd1GEe6K3F4eXDwJQIP/MUr57?=
 =?us-ascii?Q?HOcqVd7m5Lev9OA92JavTAfttbp6wwWsgB8w7ozNCOGJpHMaYP4S27pnFjqw?=
 =?us-ascii?Q?ISfbx0u9hE3PbTgdnuv5nt16WVFQ93pCrbmf45OQd5U9SpYSMe1UxqKTwfzd?=
 =?us-ascii?Q?Va6v1V3U54EzCKQzTehOSkfFP0ZirPQkDlYnERF/39Fh7TCqjBd8rQcUKqNM?=
 =?us-ascii?Q?nc9zqNCHdREStgepD1IYS6rG20sDMboym9jQr0h3cEMk685wJ8xmeUWEYCnH?=
 =?us-ascii?Q?4h7gRWs2b1jQLUotCvfxWYouI14Rv95VGS1bUb9MUihMxqrw12GkCHWLFDFv?=
 =?us-ascii?Q?qMkmj96Zksc5dH0erAWOn6dhva/LSwq8NLOpaMCV3X7sux5vm72u4/+E/4yL?=
 =?us-ascii?Q?zcT+d+3RZ5Xtst9U5QlymH1N1XVYyjCLOr7Xzkji7ZwJWtjTZkwcM56M6lb1?=
 =?us-ascii?Q?6U/bvEErhZYEQn9dtsrHFg1f1Kw7BoJVjNA2cToKTq0lZVOzNJqbGuFrKgN9?=
 =?us-ascii?Q?NbatolF5R7qYLyNjBUoO8uwECfZPuOn74sdLldpAw875k8PUvrlc8kHvVlh6?=
 =?us-ascii?Q?rT9X9XLapIeXCEewqOPQjxN9O4vvd+dOwAxRyAurJf7k9rqfLm3F/+ypIsWr?=
 =?us-ascii?Q?/sq3ZHx0+Qj7EO7eyKU5EMea9CmiLAj3LBsTdlCVBZObjv26NCDZJY3JcrTr?=
 =?us-ascii?Q?dacGivbWQbu1gAW1ruDX1uPVp9Gq+dNKoqiEUj8kPwbVYJ6ZFBcqWTNpD4Dz?=
 =?us-ascii?Q?Y4czV1dDVT3U250tUFwKAPAr+tgrryPyDizJulEj0Mh59b2SJRYr5KpC0vRR?=
 =?us-ascii?Q?Up0T6jGES9Vc/Ly8RzwEVo3WTo0gN2MdiApG/2O3+uFJ4ac13edve8QgGyfx?=
 =?us-ascii?Q?a/djBZEt60ORXF+NzXlPiY8L4bVClORMlt8481vd6Ez7jz885cDeGb/s0jkG?=
 =?us-ascii?Q?NPvFbZHCvFnPHFo9B3uDmTuk8nVbTxCIrMhMy3lfTm4vTNA6N7XC5fTn4QJT?=
 =?us-ascii?Q?qBnZS6msbarRN0UQ/knBBq5DuXzf4QqrZIh7xcY+zFKTPepRg05np/BINjb5?=
 =?us-ascii?Q?/i6+ezFz+By6QUA8iwON1ecu0ONNtjtmTI0Lc1muQ3PeARg91KcqPlPCm+2d?=
 =?us-ascii?Q?655xTThYs4mq0/dLgC4T66qMPv0iK3K/mBmM6t5CaSCGcm2gedmj1MWc1GXY?=
 =?us-ascii?Q?ldlNj/kZOXlHOpz7PudMel9S48kNrImtAYUgwP/pTtmWfE7HNnvTCPRohH9x?=
 =?us-ascii?Q?L03y1xlJ+8doaWahm+0VRD6pkKmf3UmXLZ46jPYHfU13TDv9oRDXFNv+hssc?=
 =?us-ascii?Q?gB/Mu8mP2c02GTq68F2hFYsZKYclvmrkmHlmbUCqVNBG1QEHVpt18D/A6Jf+?=
 =?us-ascii?Q?A1pPedPtFWfNM36e9/QXmmZF8Go2BjoJXYZG1aAjwBLlyoccHJsJHLApFwkr?=
 =?us-ascii?Q?TjMmgpoYrRwg2IhsJWu+sKkq+/meAaHLqxENkeMh/Bl3Y/56NGF/11hXrzrR?=
 =?us-ascii?Q?92nCn7h68Xwg6FN4nJxmkTT9Y0vDMPVjUCxrxM8Wz4+ujJtT0faayCCi7GNM?=
 =?us-ascii?Q?k9BCQZW8JEoraCb8IUIb1ALPrHNfhONThlubC3dgV829DfDmZf5KXi/Vbkpi?=
 =?us-ascii?Q?EJxNpEP0oDeOu6EMR0P72o5HgDayZJrk6tR9ge0W6V8Nhmz44TkdBNRWLoNR?=
 =?us-ascii?Q?tSC7rAbByqtulqnmOLfgaYQGVWEa8EAA1L1eRix487SbrLGR7dLFEUX/5ko/?=
 =?us-ascii?Q?zSu/ew+JMd7z53vpAY/agaLk8GuVHidN7ADhqefI/SVsfSExNFd+Wl6IM8T5?=
X-MS-Exchange-AntiSpam-MessageData-1: 6UfVOQeeUB0IvA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a5947373-07bc-4148-3ce7-08debf66adab
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:05.4972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67P3iszXhtee3EuLqWyZSE/XY51hoUz/q6FX+oYZa99h/+b+8nQww/mxyQeI6yJvJPeYcLWitl5xVCUPVCB42Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2972
X-purgate-ID: tlsNG-bad1c0/1780267694-89B7BA53-FDE4CDC2/0/0
X-purgate-type: clean
X-purgate-size: 2722
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AC5926182A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce the CONFIG_CONFIG_DEVICE_TREE_NUMA configuration option for
Device Tree-based NUMA support. Selecting CONFIG_ARM_NUMA enables
CONFIG_DEVICE_TREE_NUMA, which in turn automatically selects CONFIG_NUMA.
While this option is currently restricted to the ARM architecture, it
is designed to be selectable for RISC-V and PPC in the future.

This patch also includes the necessary compilation fixes required when
building with CONFIG_NUMA, and creates a single fake NUMA node to ensure
Xen can boot successfully at this stage.
---
 xen/arch/arm/Kconfig   | 8 ++++++++
 xen/arch/arm/setup.c   | 4 ++++
 xen/arch/arm/smpboot.c | 2 ++
 xen/common/Kconfig     | 4 ++++
 4 files changed, 18 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 79622b46a1..e67219e949 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -99,6 +99,14 @@ config MPU
 	  systems supporting EL2. (UNSUPPORTED)
 endchoice
 
+config ARM_NUMA
+	bool "Device tree based NUMA support (UNSUPPORTED)" if UNSUPPORTED
+    select DEVICE_TREE_NUMA
+	help
+	  Device tree based NUMA support. The "numa-node-id" property in
+	  the CPU and memory nodes of a Device Tree defines the NUMA node
+	  to which they belong.
+
 source "arch/Kconfig"
 
 config ACPI
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 6310a47d68..c0202d9ff6 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -351,6 +351,10 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
     /* Parse the ACPI tables for possible boot-time configuration */
     acpi_boot_table_init();
 
+#ifdef CONFIG_NUMA
+    numa_initmem_init(0x0UL, 0x1UL << (PADDR_BITS - 12));
+#endif /* CONFIG_NUMA */
+
     end_boot_allocator();
 
     /*
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..d1651fe7dd 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -47,8 +47,10 @@ integer_param("maxcpus", max_cpus);
 /* CPU logical map: map xen cpuid to an MPIDR */
 register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
 
+#ifndef CONFIG_NUMA
 /* Fake one node for now. See also xen/numa.h */
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+#endif /* CONFIG_NUMA */
 
 /* Xen stack for bringing up the first CPU. */
 static unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480ee..89fa7d10c7 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -188,6 +188,10 @@ config VM_EVENT
 config NEEDS_LIBELF
 	bool
 
+config DEVICE_TREE_NUMA
+	select NUMA
+	bool
+
 config NUMA
 	bool
 
-- 
2.43.0


