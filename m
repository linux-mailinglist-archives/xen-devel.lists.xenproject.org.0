Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ISZ3I3gJH2rodwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:48:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F9A6305DB
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:48:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=MQLaOuzg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325289.1590791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUSIJ-0002MB-Oq; Tue, 02 Jun 2026 16:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325289.1590791; Tue, 02 Jun 2026 16:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUSIJ-0002K8-Lu; Tue, 02 Jun 2026 16:48:47 +0000
Received: by outflank-mailman (input) for mailman id 1325289;
 Tue, 02 Jun 2026 16:48:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wUSII-0002K1-DP
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:48:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUSIH-00FO3p-KD
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 18:48:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a1f095d-e002-0a2a0a5209dd-0a2a450bbc6a-18
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:48:45 +0200
Received: from [40.93.201.54]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a1f096b-212f-0a2a450b0019-285dc936d2da-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:48:45 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SA1PR03MB6644.namprd03.prod.outlook.com (2603:10b6:806:1cf::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 16:48:09 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 16:48:09 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIZXcUNr/xyIjIWvz1duyWHJ637lb8x9r50EFLzgVsIrcSJtNY4+JpEUS0s2Ll0WrhLxV+WBKwEWlfN+4ISrqww1mVL5O80JRInzJfin7NayzGa3ikOE86z2FffMuSl6DbRARhqngeKZ0LsFiM4VgRn8nLlFZg5iQZFNFk5pn4sgV8c+oC8mno0vMDX7AHqj4NMtQxyEJki4WIx+m3E4LW+3dVMLMaxK9A9iCBVwF5PR/tj/ZRnyNmuJe6Z3vtxvZhdiqNhtE8jmWaFGMoCxn2fbeBOo80FMSmXaJQkH0agMwoBJ/Wiq7cKk3Dl+zASvnzjLt/l2JIa6X9dw+2P0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFwniLJgHNjuv3GtumbskrsdLdfIoEIljqy0NDCVTps=;
 b=gpMVj2GaNBaITKFbTAcjKCHqLNeQXKAe+lLdvKd1Y5TUMcCiVSC9bLV0P6nol2fOsV1EJGK+o2h0tk0BiiuLuBPUeyQgcHMBgEUuwexoWredQvtb5P5MtL3Xq3IlHi5DkYh8X+1rKIV1hylUkvxlCfZ3Xsw3QiQwezfCmhIbOQySxI/4Ap1++L+U6nFpSw/brzsXmy5jSJGBVhsFh9HjyDOhb3AD1+TnvDBdU1pOshavZnel8y3pSjP5cYTT5e/YeuJE9/wFlEZDEgs011dq+VSaA23lEhB5yY82KBtY/Ff7JI5orsgul/w4P0ftvMA9dse8PXX9go4ti8SQQQOHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFwniLJgHNjuv3GtumbskrsdLdfIoEIljqy0NDCVTps=;
 b=MQLaOuzgxS+YT/Fb2ivD8HggzKGCzLI3mN7gLJHt5a0JROE5uPcGBVPKgQzEZ4aEugZdEBi4PnQpnFII0LS3oHpOj8dHtHS/4uvKYQ83GOfoJ8Bqw7bGdH1OqeYFWOWAe3rshHqMUlHAwfvjhM5hgj1jr3zm2STX/xQmnT77VFk=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 1/2] Add lockdown mode
Date: Tue,  2 Jun 2026 17:49:10 +0100
Message-ID: <20260602164911.2684471-2-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260602164911.2684471-1-kevin.lampis@citrix.com>
References: <20260602164911.2684471-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0541.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::12) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SA1PR03MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e215f14-2cbb-4844-b1a7-08dec0c6ba01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	r0l9nWCJE/DFZ0EKj246orpxkkJc85j3IR/TnJrwIuzBuqY3basNtNgEEzs//uxeQmWvV0S7Kkr9C0F5tLlc31eT8Tvo443JfplKFZjkI/rMU2izlD2y2oZNVJIhPEIF5Rn2zMNRu7kLGc3X+b8tQJunWySTsDnez3BoYbr14vhk1POh72mvtzNMGc1xk/dSy3/FyVHV21u81RMkK71NjaOTc2t03qfIWzc+WujqRZU56OFgo2BjdTW/ScaItExn5qcckLk+FMU0AR6IjNCkyNdxaIErsVUDudNgu0088YlaKZlN22uufG4i4WsAXHkqb1mVIbEwKbAPQY8nubdFDxaIIzPpaNJwjWnG4FPIUb9Ozk2R/pWojirEZnEipJXYKVym92+d0h1CD2H2Zp7CUiYqZdKO/ohQKNrzNjAjUtXmewrdufPkm2tPtE46Wddll0QsAtYtccNWWFSDmKpY+uIfXYKEgcAbsTLcXx6PMTXtOpZEXAdmjgdH1XHar/uhL5UNZxG1wl7XtsayLxsmf2WUO/uKCCaOvQvzcTWQIkjrLcVFEwA1bL6/ZYcLTBifeg0Z2/jyfcjDg15LXIl2tMVaGBU50NotQw6oyLx78V3DmsBo7BPnm2JdpOucMIyuhQ+XJTxGBa+L7DkQZR2Cy7hNbdFuej9icq1tipJqXde3smABVp4aoDTepEoX943P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p2fk12XerfJWQovYiyqel+60UTRgwuHEC55/qFCwK82gDKLkv/KOHRSPtikF?=
 =?us-ascii?Q?BXuy8p0Dig7jCL/TdPEGHDrJIlxE22RoSMnO4ruR6BQ0tz3mh/seU3b7G2bc?=
 =?us-ascii?Q?tpP6qHS6Nk9RZHCIbBKwY1iN6miW7tm8ebQ+m0ECw6qoPvEfE2X7b9QfjFD0?=
 =?us-ascii?Q?fzEBBLzzTpVy05/CJsNdUnzQ/1I1uhgG4wXRFx27dfLVbfhcYZMK2rV/Gp56?=
 =?us-ascii?Q?uVASaQBglAnbakBiDqNUbjvcrYQ+IqfaazOnW0E2+bCcQRIIVdt1ENHc6onv?=
 =?us-ascii?Q?y9syPtqUJ84xUxMXT6VMpoaC1+swWMS6KHBdwI9pudV3gtiBCpnH74PnAZjf?=
 =?us-ascii?Q?Ig8GiCvFMAZ7r1n08bInwTKxtxL+jufm26nFNABwK/v00C3vrk3UMYJPI2/n?=
 =?us-ascii?Q?+39yFsfmMgOhK8YXNrvW1rxR5ngpIEs4pPoLfYy9xbtqfQ11uh2IjdMpcByp?=
 =?us-ascii?Q?eyCDkhyPLQGt90qcMJNVz3MBU8pIum19uLNa3LLcuV2PkUUBiKE4iwuYxZi7?=
 =?us-ascii?Q?Ujj1Yo88D9iWDVbgyCTgXZL91Y1Fu2saHwBKGceOjCUSiM8kh76OvE7j4tx3?=
 =?us-ascii?Q?YPWRCrZHem0q30+ulpC7QJQOfuNhgBgUXUsEyLbXIlQ6yrbBgve0B3w86Xfz?=
 =?us-ascii?Q?qwgRztMjemTk9h8XonlC5ELRgMrpLG9obbSUW0tb15MkFZKkD6Io6/VX5taA?=
 =?us-ascii?Q?Is1avwIGfHseq3i8zqC9wiU3TzTasTZDHJf23VlLP5bzTYwHLP0Dh8FIZICT?=
 =?us-ascii?Q?6tht/Bc2RW8IcRZCa+BuawMP9ElTzDGulpi96YiJnosvc7V3M1cmsMnyj+EQ?=
 =?us-ascii?Q?cOiK+u/GS5rO39hniJH/2AmCwM/KLCWHWY2396X/lsRMOhSmyMqKVYCVBiwm?=
 =?us-ascii?Q?B9zWwqSBhDHpvsx+o+8Ep+NDB5j00LA8+LKUc+Qt0VKZC8gk2vmMiR5Jo1EQ?=
 =?us-ascii?Q?Jk3b3lkQkjA5I28us4/PRnCBdWMBWy+pV+zpTipxCrTYHfHNGAeaswaVXviQ?=
 =?us-ascii?Q?KLOwmT9xjsa4cbzJ+hRb6lqhIMntSTcymkubx+MwksxPHsJyoyOBuQ4tTZ/o?=
 =?us-ascii?Q?vUkM0AwwvhY+a0j1v1xW5NHSTpCLLQYUfH8AtHVTPpO3QOl1fiVx8UYTnXOD?=
 =?us-ascii?Q?/bOeBLTtj6/9ohJ0jwOlK4upc9o/SgCIV+w6R7AO/0M7itwR3vvpTpGC8WYE?=
 =?us-ascii?Q?UykaM66rHycguvmRiqaR6/nkO4VlozlkzSjaXKp/Y3Y5RZ+aukTAfyMQCGcC?=
 =?us-ascii?Q?Z07DwLTPeyWI+qJmXhMaRkF4B1WAZg8XUCFdGxlvt5n6F1V44REOJ02kRJ+N?=
 =?us-ascii?Q?yzl5GMAXbB25IVujSq5e/cF77KBwL93NOC1wimc5am2lKGtMzs5b6UP5C14n?=
 =?us-ascii?Q?JFF62VdhUuFF3fHWYvutQWY4K+ruugxGcMSdhK365//h/zoVsP41IsES1A7h?=
 =?us-ascii?Q?Hb5O6YhFimRwiXCzyiDvkKJFiR3CI0Jl+OxkYiU0+MPIYMtM7B2KY9bwV1gr?=
 =?us-ascii?Q?UmPCZxefXj5dILV7eQGaPSQF2UrxqAQjXG8G0+7iACwY0k8i2IUxi/6Nt0uB?=
 =?us-ascii?Q?5+sIG2A2A4CgJCuHPM97/Crwe9U8lioV/3985SNG++xlfa8Wa04mu3/dfccs?=
 =?us-ascii?Q?SLIXRgPt5qa8QJ7BjfJ25E314FzuAmluj889EXYBvu/C9uIFjT7ofSE696dW?=
 =?us-ascii?Q?WkF5mjKBgU/SrNqgm5chglN6ojjapcSz+c0eIHrC1gXY3JIxWS7PhJce411e?=
 =?us-ascii?Q?dak3Y9livg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e215f14-2cbb-4844-b1a7-08dec0c6ba01
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:48:09.0894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/h+clwiUjEH5wxvjgvMIPZJva8j8BYAlBW8hc8y/PrdF+RBGIUgV8TcBVDxphYPOxX6NMYkYG3SzQNeBr2XxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6644
X-purgate-ID: tlsNG-42698a/1780418925-12971F3B-63E02016/0/0
X-purgate-type: clean
X-purgate-size: 5051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7F9A6305DB

From: Ross Lagerwall <ross.lagerwall@citrix.com>

The intention of lockdown mode is to prevent attacks from a rogue dom0
userspace from compromising the system. Lockdown mode can be controlled
by a Kconfig option and a command-line parameter. It is also enabled
automatically when Secure Boot is enabled and it cannot be disabled in
that case.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/setup.c       |  1 +
 xen/common/Kconfig         |  8 ++++++
 xen/common/Makefile        |  1 +
 xen/common/kernel.c        |  4 +++
 xen/common/lockdown.c      | 56 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/lockdown.h |  9 ++++++
 6 files changed, 79 insertions(+)
 create mode 100644 xen/common/lockdown.c
 create mode 100644 xen/include/xen/lockdown.h

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 19ee857abf..fd45a929f2 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -13,6 +13,7 @@
 #include <xen/kexec.h>
 #include <xen/keyhandler.h>
 #include <xen/lib.h>
+#include <xen/lockdown.h>
 #include <xen/multiboot.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480ee..c56326ff11 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -668,4 +668,12 @@ config PM_STATS
 	  Enable collection of performance management statistics to aid in
 	  analyzing and tuning power/performance characteristics of the system
 
+config LOCKDOWN_DEFAULT
+	bool "Enable lockdown mode by default"
+	default n
+	help
+	  Lockdown mode prevents attacks from a rogue dom0 userspace from
+	  compromising the system. This is automatically enabled when Secure
+	  Boot is enabled.
+
 endmenu
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 6018e25614..285e14b454 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC) += kimage.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
 obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
+obj-y += lockdown.o
 obj-$(CONFIG_VM_EVENT) += mem_access.o
 obj-y += memory.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index fb45f81399..8351f55cde 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -14,6 +14,7 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/hypfs.h>
+#include <xen/lockdown.h>
 #include <xsm/xsm.h>
 #include <asm/current.h>
 #include <public/version.h>
@@ -217,6 +218,9 @@ static void __init _cmdline_parse(const char *cmdline)
  */
 void __init cmdline_parse(const char *cmdline)
 {
+    /* Call this early since it affects command-line parsing */
+    lockdown_init(cmdline);
+
     if ( opt_builtin_cmdline[0] )
     {
         printk("Built-in command line: %s\n", opt_builtin_cmdline);
diff --git a/xen/common/lockdown.c b/xen/common/lockdown.c
new file mode 100644
index 0000000000..6e9df36baa
--- /dev/null
+++ b/xen/common/lockdown.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/efi.h>
+#include <xen/kernel.h>
+#include <xen/lockdown.h>
+#include <xen/param.h>
+#include <xen/string.h>
+
+static bool __ro_after_init lockdown = IS_ENABLED(CONFIG_LOCKDOWN_DEFAULT);
+ignore_param("lockdown");
+
+bool is_locked_down(void)
+{
+    return lockdown;
+}
+
+void __init lockdown_init(const char *cmdline)
+{
+#ifdef CONFIG_PV_SHIM
+    lockdown = false;
+#else
+    if ( efi_secure_boot )
+    {
+        printk("Enabling lockdown mode because Secure Boot is enabled\n");
+        lockdown = true;
+    }
+    else
+    {
+        while ( *cmdline )
+        {
+            size_t param_len, name_len;
+            int ret;
+
+            cmdline += strspn(cmdline, " \n\r\t");
+            param_len = strcspn(cmdline, " \n\r\t");
+            name_len = strcspn(cmdline, "= \n\r\t");
+
+            if ( !strncmp(cmdline, "lockdown", max(name_len, strlen("lockdown"))) ||
+                 !strncmp(cmdline, "no-lockdown", max(name_len, strlen("no-lockdown"))) )
+            {
+                ret = parse_boolean("lockdown", cmdline, cmdline + param_len);
+                if ( ret >= 0 )
+                {
+                    lockdown = ret;
+                    printk("Lockdown mode set from command-line\n");
+                    break;
+                }
+            }
+
+            cmdline += param_len;
+        }
+    }
+
+    printk("Lockdown mode is %s\n", lockdown ? "enabled" : "disabled");
+#endif
+}
diff --git a/xen/include/xen/lockdown.h b/xen/include/xen/lockdown.h
new file mode 100644
index 0000000000..b2baa31caa
--- /dev/null
+++ b/xen/include/xen/lockdown.h
@@ -0,0 +1,9 @@
+#ifndef XEN__LOCKDOWN_H
+#define XEN__LOCKDOWN_H
+
+#include <xen/types.h>
+
+bool is_locked_down(void);
+void lockdown_init(const char *cmdline);
+
+#endif /* XEN__LOCKDOWN_H */
-- 
2.52.0


