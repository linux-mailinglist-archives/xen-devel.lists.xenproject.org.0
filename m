Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPr3MdwThmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778CC100203
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223514.1531003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVE-0006cr-7X; Fri, 06 Feb 2026 16:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223514.1531003; Fri, 06 Feb 2026 16:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVE-0006XG-2G; Fri, 06 Feb 2026 16:16:16 +0000
Received: by outflank-mailman (input) for mailman id 1223514;
 Fri, 06 Feb 2026 16:16:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOVC-0005HV-PT
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:14 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27bc9eb7-0377-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 17:16:13 +0100 (CET)
Received: from PH7PR10CA0010.namprd10.prod.outlook.com (2603:10b6:510:23d::19)
 by CH1PR12MB9719.namprd12.prod.outlook.com (2603:10b6:610:2b2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 16:16:08 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::a2) by PH7PR10CA0010.outlook.office365.com
 (2603:10b6:510:23d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 16:16:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:16:07 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:16:05 -0600
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
X-Inumbo-ID: 27bc9eb7-0377-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/Up0Hp6fakxlzktGJH0t9/n8gGdORpWklY+8KO1WF07o27VJI54MhLbMkRX7VkOR9y5JjhH4Hh2JtG/L7JNFU/NRntHFxW8lW+UHBUrwz24oyRrY82AD9q+VDDm55w2/l3QZtYEJo1MWybyyUs57E9R3w1DE/YnV18qFi94dmcn16o63FCVjINTYPTHfJIwm/NTBsfwYYz4F1uLIPlcpKbM26Fs/SXXQR2OdjfjtRbOHb3SQsMkqox/AHqmA02u+sed+/IwTs2lJmFIYG7FujFup/isO32Q1irOk75Gtjr/BaBO9SY/PRAitvAyvYAWAgK1EecHKIESyq8N8jZZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQHgXMWkC3Mm8J2pKE1eUqP0egx2Jwst5WiZnP3oWB0=;
 b=Ks8KuTI4oUYf1+j+FssvYdUB5v5cG7423mzUXeuCxVp1ubWI8gB0YYw3CbuGIzMaPnjd9rL6R2vFFnLYPtgDxT0GMukp6bdmgkHTJG8n1vinGhMG8WubW7c8cr7Uf7BfKftVqzH2StBFeHolsM5qUqf3h8vN6v7CryPti2r5IzqAkouBntNCs3w5sw21pDSYPwT7DkixcJ/gy/Z9vl/IHXggGU/TtD94gl1AejabuaSAxXQWbB7K0Mh/106H1gNXtOlKu1R3LXzoZm+I5FSsN9sg8j/7j0WfEcQ7C8Yta2qHHLfQPiHyOhUAGxODetppv7V8X2cT5+WLNmLKurmw3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQHgXMWkC3Mm8J2pKE1eUqP0egx2Jwst5WiZnP3oWB0=;
 b=ymTfd69AIyaAnWuPnWCX51PX6c55rjGF0O3OPWS7wpYO5ije1blCk40diXP9VgL0t5R7iInV5MZxCH6TqvqKysdzeq0/d7wp9JBnTbPyciQ0zXuaJ+D7Yse50Pl27m7mGesb7HrUw9VV05RnoQr3kXeuhy3/T4YPAKGHThFMqDs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH 07/12] x86: Have x86_emulate/ implement the single-vendor optimisation
Date: Fri, 6 Feb 2026 17:15:29 +0100
Message-ID: <20260206161539.209922-8-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|CH1PR12MB9719:EE_
X-MS-Office365-Filtering-Correlation-Id: 721a540a-067c-4a0b-55e5-08de659b0913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lPPTS0ksCHxSz7MxxYUl84vcMYAzO8ElhpC9DzIPwMgPAmqVqcgyUpuBtOhf?=
 =?us-ascii?Q?IE1mmPnRJ/aVocbSrum1Oa9JSozS7gJ3KHjENQaCGQ8pJNvBaAGTTaPglLUH?=
 =?us-ascii?Q?tLIWg1GBylQrydjyt2L8nEUIFd7+hOoME+gRd4qzYmYiuLerPWiA/es87nI/?=
 =?us-ascii?Q?/xG1m1VmNBnhAMpZuucNYZ5jgLb6/24C4JyUY/0CqbbLhVnEOS9tpOXDt1DB?=
 =?us-ascii?Q?cHmS0M3JwUqZXUWjj9XiONAaahzEGbciBkmM9YB5yodcKpzWfOmoATkQ9VX6?=
 =?us-ascii?Q?rTmDS6jbAI+hm8nt8Qp2cPSPlfbTYbLYRGCqyU75BvHNzgpfU8qq8nzlCHzR?=
 =?us-ascii?Q?8bIAAbs06GbRLRoxwsj0sFryEQwCxV89mvsEIEK7NjMwjmq4rY8IWDTg7Jkt?=
 =?us-ascii?Q?TgpPJ0oZtt4eo8nx8wKXnO2wpjsJOIoToSdl7/y+MjyKUzPcDcmTTG7/FM6D?=
 =?us-ascii?Q?b8dWYWI/FDKLpdahRPyx0El1jWCfosZVq8ZHeLyhmd8U+ebWrjh38KkRX5X0?=
 =?us-ascii?Q?3Ll+0CaBMrIQInyVxBdiP9162iZuVpWQSOOYd/btCB5R5KjwUyBEu7pBdDfX?=
 =?us-ascii?Q?gDV4e6krvfQW3zxeS1/m4BA6iKQCPej6xRf8hj6xvf5ilvnpZXSnWNaK9gt6?=
 =?us-ascii?Q?kuxuEA68Q+/VnwTbvipxdukPT5yAzvabVtXt3FPEzXu78fokXib3EIDbCqmV?=
 =?us-ascii?Q?jEFcqp3CYLZCdzvMSai3GDu22BWAh9lhTMz5bKh34Ha12PUwT9HbrvttAO1u?=
 =?us-ascii?Q?fS/EQgdGKn0jj9SqMExbNmoNKTICi2ZDjMhDZfl15n0pbIzvEX1D/YoPqFv2?=
 =?us-ascii?Q?bVet0vXB4L7PODHSZRCgab0udPhzuL5FkFbfdQ9eJSOu0opySaiQe5h1VK4W?=
 =?us-ascii?Q?Gdi1KB1gFtWyZLO03ZFZwQMCuDT101qv3L6KBFrfcU+GTZaPCc9ifX/8QXMB?=
 =?us-ascii?Q?hxEvL6GJyyXYYUkHT3VIojjeaw8oSvx1dm2HQ50V9+53f8Gjb6ETxjImKweA?=
 =?us-ascii?Q?oIHnQ9hlb+KxT+TRBHbut3MK7Z+rX1lwtmrVEh0cvRZCHV7eOeJV/YLrBEES?=
 =?us-ascii?Q?X+MuVWgzw7oX1JLHx8/Nzku/xX05KNwK2SSr1kekW/HofLn2o7jTVyphNFoe?=
 =?us-ascii?Q?1sg8L0o1ZsDTFQk0pxjWv8d4BP4jCc21pYu3uf9d8HXDKPZNyjJ1UEjBwAsi?=
 =?us-ascii?Q?daGxhdsWZZnttrpdqnflOX6eHYljJ3Nka/lww/BRc7BLlPmtX0+43gyeZhDc?=
 =?us-ascii?Q?NcAOS+qexMTx5/WJfejBzYAD9O+scB6hmH9oiu5V4xsIs2r+oZ44Z0lX/3KR?=
 =?us-ascii?Q?YfIRgghE5bwDlCJimDC61bH69vuN/b2S8T185vYX55nrV6HtCm4ALVx0FUxI?=
 =?us-ascii?Q?s10+fcaxRbqIR3NOjdfciT86Chq8kVn2DtfngW8S/wYrv3ldWpyz21nfKKXI?=
 =?us-ascii?Q?+j/Ih/AbYnk/2qBKR6KGOscDtFeAnh6LFZxTZYGiFu7HGN9V97N+N+SLB29I?=
 =?us-ascii?Q?eBUdLZZ8L1U61EuSrhA8lC7/T5aQYIAa8tvrUqP6tWHIsbXInh2SqwYdA3lg?=
 =?us-ascii?Q?f5rqcHuHS+eBVj+7nMWanggOwiAdF5JnkJDDvc5vYYuDf1sVopiL40sl7N8S?=
 =?us-ascii?Q?Vdad6Uy7kXcK5XRspTkHBHmEHW2sug3h1BYxBOrXLX8j/59xj9Qv8UtlqfAF?=
 =?us-ascii?Q?27HDzg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u8zoQJns1sfnDdUl2aUmHBAi/HtiXT0w9JHbigeCtVkAt+/7d7rmgexo0MzDXlPvWUAwQFqax2JaacPQFaeZ5UbsKuCvsITlTcjNj6rKQ5wjTFpjJqeEFpRln6DxjKUYodHQ3FdNNQYMYni/K3g9+km3mb6VO2P+qNnoA5RB88jzGtfvXRbhxELfFtkBb8WELYJmQuhAVmCL1Xz9tMwFdBiZhDOrzgmUl0gZY7xfh2dy06qcs2GVVTj1j5pWV+y6NBxXM/m64S8D+AkKWKPxjuGN+kyX4LrkMOg0r2J5uwXVl0m2IJlejSSa537ErWk1sEmgtbBMrLkhLnyRez27iOZlxclm79L+dQZuUpMvOuqc4/YMMqE8G5+x1M/FMvcUlCMLTW+6sM0DL8sEeEW7xxmGF2eNeHxxm7oK42ss/koa6MJRWQVLA91s2Sm61DFT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:16:07.8985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 721a540a-067c-4a0b-55e5-08de659b0913
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9719
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 778CC100203
X-Rspamd-Action: no action

Open code the vendor check through the policy as a one-off. The emulator
embeds amd_like() in macros and is called in MANY places. Using a
local variable (cp->x86_vendor) makes it a lot smaller (300-400 bytes
smaller). So treat this as the exception it is and let it use the policy
rather than boot_cpu_data.

Also keep the current behaviour of using the policy vendor when
compiled for userspace, where cross-vendor configurations are expected.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/x86_emulate/private.h     | 10 +++++++++-
 xen/arch/x86/x86_emulate/x86_emulate.c |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 24c79c4e8f..95f2015c44 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -15,6 +15,7 @@
 # include <xen/kernel.h>
 
 # include <asm/cpu-user-regs.h>
+# include <asm/cpufeature.h>
 # include <asm/endbr.h>
 # include <asm/msr-index.h>
 # include <asm/stubs.h>
@@ -30,8 +31,15 @@ void BUG(void);
 #  define X86EMUL_NO_SIMD
 # endif
 
+/* intentionally avoid cpu_vendor(), as it produces much worse codegen */
+# define x86emul_cpu(cp) ((X86_ENABLED_VENDORS ==            \
+                           ISOLATE_LSB(X86_ENABLED_VENDORS)) \
+                               ? X86_ENABLED_VENDORS         \
+                               : ((cp)->x86_vendor & X86_ENABLED_VENDORS))
+
 #else /* !__XEN__ */
 # include "x86-emulate.h"
+# define x86emul_cpu(cp) ((cp)->x86_vendor)
 #endif
 
 #ifdef __i386__
@@ -520,7 +528,7 @@ in_protmode(
 static inline bool
 _amd_like(const struct cpu_policy *cp)
 {
-    return cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON);
+    return x86emul_cpu(cp) & (X86_VENDOR_AMD | X86_VENDOR_HYGON);
 }
 
 static inline bool
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 7751a67130..308ec3579f 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3104,7 +3104,7 @@ x86_emulate(
          * in fact risking to make guest OSes vulnerable to the equivalent of
          * XSA-7 (CVE-2012-0217).
          */
-        generate_exception_if(cp->x86_vendor == X86_VENDOR_INTEL &&
+        generate_exception_if((x86emul_cpu(cp) & X86_VENDOR_INTEL) &&
                               op_bytes == 8 && !is_canonical_address(_regs.rcx),
                               X86_EXC_GP, 0);
 #endif
-- 
2.43.0


