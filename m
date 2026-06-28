Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nTxTBJelQWoBtAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 00:52:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED4E6D52FA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 00:52:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=a8paXXfr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347109.1604999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wdyLb-0002Xx-Ip; Sun, 28 Jun 2026 22:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347109.1604999; Sun, 28 Jun 2026 22:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wdyLb-0002VA-Fx; Sun, 28 Jun 2026 22:51:31 +0000
Received: by outflank-mailman (input) for mailman id 1347109;
 Sun, 28 Jun 2026 22:51:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wdyLY-0002V4-Rz
 for xen-devel@lists.xenproject.org; Sun, 28 Jun 2026 22:51:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wdyLX-00AZNI-Kj
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 00:51:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a41a53c-2eae-0a2a0a5409dd-0a2a4503b814-18
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 00:51:26 +0200
Received: from [52.101.229.92]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a41a56b-ec1a-0a2a45030019-3465e55c9ad1-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 00:51:25 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB7033.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:430::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 22:51:20 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0159.018; Sun, 28 Jun 2026
 22:51:19 +0000
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
 b=azUxOqPjcF5oQl5Ucsg5iWg1T1D00QmsS6rVG5E5vf4fpxL12junA3GGWYUY9J+i7DcsGPZ9aQjWt0BrCskBQim6UqEl6zvuSrJ213JJicLhZjsFK9CB8HAF8uLJBjqmRY8cILuZj7aPP6efSPz8DmfOJePHufRdCPCk0N4KJHti6lnRSEBbo0oT1ZNeD31EA2bflpsKbEVwEdSmbbvhWZeUXRNKZek8A98IrrYkc145dj7LWW8DgGaY2LUE3IDpOMOHFSONaRU0RlaJGvxWY2lZQjxhKOcx9dWv6cNd8wDIGYtk6/bAreEY/wTcVavPqt3Z7k5phc/5zNIXTQ9vzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/BPrknx8bZKBuNEgIZ8AT8lWBSgwhZWCT+D+P2y8Pw=;
 b=ohZexVH5vOBFJkCqTNjWI3YPhQaF5BhdLgOfo4DVOF03BfooGSEG8Y8lfyhAYkESX6UQMlYcwJODa03U+XUCsPP1vcd9hiRn45H4FNfClI2SRydd4jn1fkSuu4Wjz0x30efr94RpGtYPOLS3oycLQN7jebGDH5ibbRUnD6E86QlLK7/Lx8tCcW+FDSxcnp8AmtJnNnX/TbHQiqcNEUGuZWTucjvT4dCQozQh+1kh1goVDl3ImZlkHd56/upELl/kwNtkujXE811I1ZLb6Haw0o5Fdb6tcN6QcwzYsCYYFeQUXmGx3ANnJwWmrU5xuKF9SdIDSRqlt55fO/dvcvfYgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/BPrknx8bZKBuNEgIZ8AT8lWBSgwhZWCT+D+P2y8Pw=;
 b=a8paXXfrTqxz+m7zmTMvnBK7zJxp46tPpIe/rgtOyHQk3fryEMyKTKWw0hA2+1Zf5y9DcOa2mlBCS3tMhkmT8LgChaeNEoWkaJlEtqORQObnEdFvJQZuwlA83rRZtv0gcI7XM9pHD8NXQAjyI1KaMO9AcahTyhx8eWkxWm+cYYY=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH v2 1/1] xen/arm: fix sparse cpu_possible_map calculation on SMP boot
Date: Mon, 29 Jun 2026 07:51:15 +0900
Message-ID: <20260628225115.9337-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::12) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 754311c2-86d6-42ca-9edc-08ded567c4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|366016|1800799024|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ON9fBDA1+Ssm5vphh7l2pW+wPqZXcp0eNbTNDvuPXecuDJhubC64+gkgPoMFP/K//hUgeVlf/NPQUMdTedSO8jtbRNlYosa/8j5NRuCn2iCnx8d8wTUf7RwP5+SxLKlLmE0ktxbHHf2JWqwAAKz2KhfFvPbairF1/dSrsLMh7C/ocysgUPg/q2IbEGlVNb6YqEqgRWmR7oI8oYTAFJo/R4QGmaF2KUWC//Msn3k9mcwikSq8L/2ZtGSk3cOEs18MSad6Vp/b+ZqfguAEhMyyDPcaftOOmofs0VD2Mu6Dx0zMwvB6DuAvrp7agyBDtXhycd+Fysk08FYuqVXEOpt7jsfpnNf3SoSusvP/I20NP7cVDoKZ1vdvadNbuQzXiyZjWyfpva28emYKStsVt8g2rNr/LgYVIDojcvMYrmujKgAS7icmee7UvGCKN6lUBIrLtzWqV8Zy7S2xdHoJmkDF9iJlZvuniP8zOK/kqzIodZFVQGbeOkmLFsJMl9a/2GxJWlQ+DAueQQ06+Y+ARfZhgLLROX5TiwCQSCGFCJ+oXdnOyzIiSM7aIP1ynOCmg4cjQK3fmDledyTZBR2xj39lgFHlJEMK14WknULCSUfQD7/i1fq6LXjGfrHpmAM5+nZPSb2d/v6HGMIpcRwcgy4rTJYGlDYYWjHPBYsUkWKSgwE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(366016)(1800799024)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m5cgmS+k8s6KcMtnmPuLHxJYpni6BLnX6yCKmVGFHU0/12OGr8KubD7l+Pou?=
 =?us-ascii?Q?YApe3gi+/wGiRirppaXY65YMM9Prc2oF4+QHeyp0PAkF3Sk02y2K8QzL7RDR?=
 =?us-ascii?Q?2GGCpsiVouIn8ta1r07538UBNbQHyB3SkD6RYeX7dPwaC92QRGNHpG3dqk3P?=
 =?us-ascii?Q?fzUzhHne6nmlcqqHhYUP16QeGDZ+OLJyGtLCf1fqHDquOj5VDydTvIKPnfqG?=
 =?us-ascii?Q?QY540/5HFcVEPymEGSOi7XHTwPR0gfIyquAzZD3TUashuFJtir+b2+UBUhSO?=
 =?us-ascii?Q?ANArxje7D+8tSXNU2JEElRYqoNUsQziXtqNz8JjaN/uTkJngwMAXaXrHHhRc?=
 =?us-ascii?Q?1maDwZOCaSbt0elxAoEO+EZiNd0ac8CxHpPGStRWlwgfE1E6sgoQBXZvBPs1?=
 =?us-ascii?Q?HbAn50SSZz07Lt4k7Pzt2VSapuZYEf5aaHADUeSlAenCuEmXH622qWKEcge0?=
 =?us-ascii?Q?ZEUX6sFUh7EcQshD1PfT12ZQZsNmXwClJIOErAdOrZS6AhZ2sq5C9pL4gPUo?=
 =?us-ascii?Q?evTZJ9jJ5KLxuwH/4DfV4o53pQocMJKWF337qF7c9GlRFv45a7vfzyUFFdQc?=
 =?us-ascii?Q?p7ZPAo1nkvzPf7pKjJSOxTBhPzFAx2emrD1y3ZwwDDwc3/eNix9aYZ0vGRQG?=
 =?us-ascii?Q?zrYdo2NsJUYm5rUP51/iI3VnUFLeW+LAnNg8vGcPZGL2PsWrpWIIUnGoxMyZ?=
 =?us-ascii?Q?Rbs8MkUXVi+aqBjHIwsu9ic1xohB4jhnYDIP7F9GdlGDVOCI8OMhY6NCV+Fw?=
 =?us-ascii?Q?yKxE2WzZi/Tmc53LLHFJ549+r51q30YVj6rjcyi0RY0ryXKRpUdzNK1vV6I8?=
 =?us-ascii?Q?evdbTyDei0meASarE8hT8XSiQFD6SeI/rUGaRxdHJoYnrBZjtqVOGMRYgQI5?=
 =?us-ascii?Q?jIpAWadoEYdQmE2+TH+QQhTg9azewEAX1cgXl26ebOpI3eMSy3wh/yzanm0P?=
 =?us-ascii?Q?P5HDm8/9UgVu7SyYzukZfwtmcHM+uR1rEDDm+87UeiGzGmtx5dqbuPzZLhGs?=
 =?us-ascii?Q?a8YNEP1AOn6iyG07Mj6mugM6eG09OlzZQeYLFe/ssKp5X9Dj+0tKxkSfkZ1b?=
 =?us-ascii?Q?wfwUVOChNZBHA+1R2U64ka7YMaFTfm25lDllkQgyXEqm0e9of2ubjLx/wNIg?=
 =?us-ascii?Q?1gTDLys8IzIlF2SJAQteIRukQwHUjBlUAKfpOmIYOvHYVkcdHRPdM0dNq9/Z?=
 =?us-ascii?Q?KCiJoX8gFrGLuO/ATgSwlDeP05SNnlkYC7VInfcPOFcHXUK9XdwcNZGMVsu9?=
 =?us-ascii?Q?FN5kFoCj7TmqlldOmky9l0oLYS9Iyc7FFMgnztRDdyZ8j1Tbnnn2rU1ibBy6?=
 =?us-ascii?Q?0TKYzkvfpQE7TlKYVtuyEuqTl3q6uC9wpnaCGzOU/fJz3c43Jrm91WYnQ15C?=
 =?us-ascii?Q?2bFpf+WQ3TnhiH2EOrn4dz5T0vnRH+F+5Af1W/d/3kivNUJRCid7BbsJgCGb?=
 =?us-ascii?Q?aoVf9bP97ah6e1sj/oNWHpdUjM7xiE2qb4t/6yVTzXujTjlQdT+0nDZIpJe4?=
 =?us-ascii?Q?mmSIg0kW10IK2bIwaeRPfMGDxM+T4qWNl8tYX7NJBl+OGaWPfMLMaLzU4hUr?=
 =?us-ascii?Q?tDokaVwqJw4+1rJ3uaiCmw+aOSJH4eHzUZY2H7tPvTAlMqDgZGIOX/PJZULr?=
 =?us-ascii?Q?02EZmaGFE17a+L2gByp1isKoNyYSBIsK3RwukSfXPyEr/jHYvxs6UBUJv82K?=
 =?us-ascii?Q?qjPYGbm8CYdJxLIV3osCPlFolLGzkn1W7DeA90v2aHnOX10GB3gGbQdXsFtL?=
 =?us-ascii?Q?Uyp51nB85UzB52aF2sy0s4G2LnYOGf3FI5JLPX7/pVRQYTTOIQesnIhd6eeI?=
X-MS-Exchange-AntiSpam-MessageData-1: YiuuSrgpJkVrKQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 754311c2-86d6-42ca-9edc-08ded567c4eb
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 22:51:19.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aScKuj3KiYLfuVW0yfwkNnVVrCB0UoGRR3g8JD1uRmWoZlEGpjv+ygFDvXZFTFFIH1LmNbw2R5/t5bmdM3uJYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7033
X-purgate-ID: tlsNG-33051d/1782687086-B53815D1-209D0770/0/0
X-purgate-type: clean
X-purgate-size: 2813
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:taka@valinux.co.jp,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0ED4E6D52FA

Currently, during ARM Xen's SMP initialization, if there is
a Device Tree error (such as an invalid 'enable-method'),
cpu_possible_map can end up being sparse.

The issue here is that nr_cpu_ids is calculated in a way that
doesn't properly account for the maximum CPU ID when the map is
sparse, causing a mismatch. For example, if cpu_possible_map is
0xff0f, nr_cpu_ids becomes 12, but the actual maximum CPU ID
is 15. Xen's common code is built on the assumption that
'CPU ID < nr_cpu_ids', so this mismatch can break things.

To fix this, modify dt_smp_init_cpus() so that if the
arch_cpu_init() call fails, we don't consume the CPU ID slot.

Changes in v2:
Fix an issue where cpu_logical_map(0) is cleared when boot CPU
initialization fails.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/smpboot.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..0ab9619398 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -191,6 +191,14 @@ static void __init dt_smp_init_cpus(void)
             continue;
         }
 
+        if ( hwid != mpidr && cpuidx >= NR_CPUS )
+        {
+            printk(XENLOG_WARNING
+                   "DT /cpu %u node exceeds the max cores %u, capping them\n",
+                   cpuidx, NR_CPUS);
+            break;
+        }
+
         /*
          * Duplicate MPIDRs are a recipe for disaster. Scan all initialized
          * entries and check for duplicates. If any found just skip the node.
@@ -224,24 +232,19 @@ static void __init dt_smp_init_cpus(void)
             bootcpu_valid = true;
         }
         else
-            i = cpuidx++;
-
-        if ( cpuidx > NR_CPUS )
-        {
-            printk(XENLOG_WARNING
-                   "DT /cpu %u node greater than max cores %u, capping them\n",
-                   cpuidx, NR_CPUS);
-            cpuidx = NR_CPUS;
-            break;
-        }
+            i = cpuidx;
 
         if ( (rc = arch_cpu_init(i, cpu)) < 0 )
         {
             printk("cpu%d init failed (hwid %"PRIregister"): %d\n", i, hwid, rc);
-            tmp_map[i] = MPIDR_INVALID;
         }
         else
+        {
             tmp_map[i] = hwid;
+
+            if ( i != 0 )
+                cpuidx++;
+        }
     }
 
     if ( !bootcpu_valid )
@@ -251,10 +254,8 @@ static void __init dt_smp_init_cpus(void)
         return;
     }
 
-    for ( i = 0; i < cpuidx; i++ )
+    for ( i = 1; i < cpuidx; i++ )
     {
-        if ( tmp_map[i] == MPIDR_INVALID )
-            continue;
         cpumask_set_cpu(i, &cpu_possible_map);
         cpu_logical_map(i) = tmp_map[i];
     }
-- 
2.43.0


