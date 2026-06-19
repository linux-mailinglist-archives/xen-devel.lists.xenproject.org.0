Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8GZOM+r0NGoJlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F46A4714
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b="nWWXa7W/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341771.1602145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU04-00016Z-S2; Fri, 19 Jun 2026 07:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341771.1602145; Fri, 19 Jun 2026 07:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU04-00014S-KT; Fri, 19 Jun 2026 07:50:52 +0000
Received: by outflank-mailman (input) for mailman id 1341771;
 Fri, 19 Jun 2026 07:50:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waU02-0000eo-QX
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waU02-004dWx-7H
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b7-bab6-0a2a0a5309dd-0a2a4509caf0-46
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:50 +0200
Received: from [40.107.74.95]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4d7-4999-0a2a45090019-286b4a5fdda3-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:49 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB4024.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:185::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 07:50:46 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:46 +0000
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
 b=fLbfDZ7t62norsXxMyEkgvHmr/DBpT1YKmqLrukBtA1Fbxk/qREke6yoDcYXmARoEV8hWwfRA29Nqu2mcxABBuHFngWiQUC0hTaS6BDkx4F0W+xnNZIP5GunvD6AurLm5dn+WH+LLByJLjSXitta5IakBuNdV2kTQPJWIJl8I//d1WephQy7HbpnBSjIRRl9bd0gwvVqwOr2tfMFpCy5kYosV5ovUN5toV5JNmwim35uR6T4Rtqa7j/fmovcAQHWgHyP7vQn+nU6UXjQArrSSmdNR5j+3Gz0xhObaF2S1Bl2CzMlqrViv+Ypj/Ri2p1edQyFKbqXH03eGu+APpaaaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnnrNnjtKFwE173RdNIYBVM2GKwC3Mi9fLxil7K6r04=;
 b=Q7K54iL2zxlnBkacIPfisFeDe8tkyQZFUXluCXAGB14gpIf7aUlFMSlTnwh1GFLKccj+tPSFEH+Qn+NoeJsMPRAYiHjPlqM84H8/XupmUSrdGtkF6xMhkYQ47P4WmFglYKZEHyKt8+IdDDWDGsvWxRvSkQm0jaLlH/ZKnuJZJD/2OPDCwLeJRKoYAurRXJM2zgJyYKuEZmXq3HnQy+1+jhNBaGtSgXFUkHHBZ8kQ4YAQ56HP+HXMXUt3BSr+VeBLmaD0BBfyl6TCrtvXxjm0h88RpCO+rUMCLWv+rfrQrFaIGWeF+rDBaQ1L/Kdfg6ooLL1e6p+W7xsqOAbkGEO6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnnrNnjtKFwE173RdNIYBVM2GKwC3Mi9fLxil7K6r04=;
 b=nWWXa7W/+ArlGZ3PlPZXzZC476VYHHYq/HHr9v/PFds1dHPV2C9YWdcVoOvQqzcIgBbZdVXFockZNjqyn8AHFOBsEO/Vfz5SBx77EkmokgiSjqwv/5xs5CZK2udGWOnvqJneREyA1JRXBGCmLe2Bht1YUk1EtH2nAddFOFJw11s=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 17/22] tools/libxl: Fix vNUMA memory allocation algorithm to support ARM
Date: Fri, 19 Jun 2026 16:50:05 +0900
Message-ID: <20260619075011.377116-18-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0086.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::14) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYTP286MB4024:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e5b81a-37b4-4612-cdf8-08decdd778f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|23010399003|1800799024|18002099003|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	YiSy+ByRyXlhONpACviD4LycWmpuYzZyy63APpOPmqd5FJe6Bk9PJpfk7sjsHf5Ta+3727V6IdmuJsF7eLyO1rLlIQ1ABXZf+8z08U1vWSKh2UU0j8fyi+w3hIDm1qYY61ta6pidF0p1F1yzNKBJncSMXqEKeq6Wh+XOcjDKQL2D6EWJAfDMk2LxI7yghTgako7ZjSqws4ydcQEv/RSqBCulpCQAFPyH4Lb+St4F7Ee5Oj9Zf7tsOy9U/ZL06aQgzKapsweiwYm6wRa+NLTpeoxJkoC9N5kZNpPIGfTQ71a/1HFVgchdCvDyySSuGxcBR20AZE8Byxkx3hBaLxjHrnmeq2txt4lXIaSMrT6gL8DSkcdAdaXYXKu7/SLeFn50fpTVk9GA12TxaVdfXfQWsa80Z/0SUTvjrjuKjhg/wcqj6i1sD2qFOPBl3X29x+Yx2uo0kJXhJFeZJc2CqCj6QW+bj8Wi+UWiO/qrxoZNXWeLohIR6EpiKu4lK3/YBd9srUgpGVPejcRC6wWUBkQTe0zGC6apbcqhfHDW86DmHIHsD65sLLlRN6DwcfMBeFVQjWCXbIjG371+EnusdRrWogVF6VNiFDvdu4WJj261GhOOABwqjDc5lzaZGsvhmsCluTqFDeRxgkmCyfxV0rOsFGgWpgN0lPglBdToQigwDQw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GGomvrLeFxyl/8Tp0OrDXPEyTmAQ4TwwUp0gQErJhWOQECCEE0K+4HgEgW65?=
 =?us-ascii?Q?NBrTHbG11Ie0iVGAtEUPX5t5cExT2TAbb8z58uFlj2C2pu46zmT2V+FN6IwX?=
 =?us-ascii?Q?g230+muHrKgsXIw7CbXDSZJmikgjcpWEy7+Jz2mt1aTSY+3Dil+Hky6atouy?=
 =?us-ascii?Q?ZOHjhvyoCgr75Ecr4ZQiIZGzfl2BGw33Q+Uxn8nXi5EGH8BAjUMtYQX8pV3n?=
 =?us-ascii?Q?jkKK5+/gf2V2hBS9gAQYeuqOahly4J3QaiPu4AEZpNCcbGUeXjVNSWhUs60g?=
 =?us-ascii?Q?vpJ3MpnqKklGpSYgXjihbOfObfd+u4FccoEVZsA41ti/a7xprZagUaQtQxCE?=
 =?us-ascii?Q?d0J5DT/0S8/ccZ8lp4lf59ZUmjhcK1fopkcxAEld1G/mz76/q6L7+FHJiciq?=
 =?us-ascii?Q?2ft7OyGFL8gHDWLpVfpLLN7dgB/3z1Zn1mRBPJCN/BFvDFvyyMVYXIpDAehf?=
 =?us-ascii?Q?iQrcRwUs362SUNlvkZgiey3fgccd9qUesm7pMn+o910vbh2ArlwG19yBU1JI?=
 =?us-ascii?Q?ykerxHzwjaG0AMC11UBY5r7xgSekVRV8+tpET2ZfRhq0beK+0yYDfIXOYpTr?=
 =?us-ascii?Q?vdUFUIItfWTVnBuYyEfS3yuWjCzPFcxz12kU4wTw0Z8H61dep0eH1dVshqeX?=
 =?us-ascii?Q?vEgsmdwTzBrvxQtClWWvKJ0KLBHAnC3qcZGCW98dQ3MH9gyBEDUK4yXfYCuy?=
 =?us-ascii?Q?Iz5oBJdBHX/zJf2XiQbdtA7lxp2QqupNqUQK0Z/0qkHtPiWlgiCsXWPJY71H?=
 =?us-ascii?Q?NJmfjXJQKrvSQvUq9EyMXOEi87VBt+gFj/LA1Jut+pI70S1UkqM9tzTmctOu?=
 =?us-ascii?Q?qbRUSHtUaUQHGujuyTFZl0UWXmWLNvDNAnOHG0XkkrlqNyztF4VA9VXZwF5U?=
 =?us-ascii?Q?HN1ztzmMteq6IbOfsM8bri8yoOQ0KNWkE2JCjXnX/wBCIS7wACCaTpwlAB69?=
 =?us-ascii?Q?gYpJJv24xoQcborXRmZbyH5o+OtJNdxmLoYZl+XZbMnW1bES16dTk3jUgYcK?=
 =?us-ascii?Q?/mheiMTG4HHPb27tW/QWJBYW6ojMyr4CTm2ohNbEg7o5XPnzhJNIHq8FvCUc?=
 =?us-ascii?Q?wEYtM0iAlV7v5h/v6uxtkP0JbDajE/ZeQhcfyAocjTj9fteJwdUjLTgGpNgz?=
 =?us-ascii?Q?CJHch2mnVtmgNF16XtouRGiNPFKgychxDuq9dhORC6jPWabLOQ9LmNRG4Zj5?=
 =?us-ascii?Q?tXPKlUtfYaKGWToDa+GexH45ri3BDaBHh+ZANfF6xSiDo+3yUPLL71Yh3j+j?=
 =?us-ascii?Q?4THtRdyLp3q4wzN8kXnVuzY0liYjRkLbeqDlX+ht/BIyYG/v5zw76PVTD5vR?=
 =?us-ascii?Q?1Ibp2otMqGYmrOf4mwFZFyEg0ykw1GSYlLO5sp9yNaK2uu0SACPObRlvUnJ6?=
 =?us-ascii?Q?01RydQywMWa6NHaz2P5vBfZMhSebOzWYrb/F7E46Jbg0dbPdH+OLoLgC/hs5?=
 =?us-ascii?Q?z9eclUZC+Q0TgW+MpjTHuoUUnXf9DBDoLgZtRF7BjnCUEa/u4X7O+bW1UBhw?=
 =?us-ascii?Q?SIsnqHSXcUYYi3xlNwOIZzIjrpss5xMjI+x534nNVb6CV+qFIMlb1s/oIYZQ?=
 =?us-ascii?Q?cGpoukPCaZHvPYxrqbtNC2ij1NSW38X0RImTd1vrZmt9H1xy4yMou5k4EeCc?=
 =?us-ascii?Q?IyT2ZJ5GZxGQpOgGKYUX0rTWH3KOV0nCgvazIFgzYrRxqELV6ZafRga67mV6?=
 =?us-ascii?Q?7834wGDVMoYw0ibPc9+LDFk4SJHeEv3heTnP8bACL+WYgsjCVaw2Z4ZsEqGo?=
 =?us-ascii?Q?5BpFg/5PnII9vxHNgLay/WlSPJKMa26oAS3RCqtKLOJiGjjRn0CO9wI+yUNt?=
X-MS-Exchange-AntiSpam-MessageData-1: ME7zVVKXaKIHZg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e5b81a-37b4-4612-cdf8-08decdd778f0
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:46.4854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPxEWfK/N2iBr35j+fYsVJwj0FNrrXZ8znzDAS56tSmQEILO2ol1fiSEUIBvcrVIDGiPQq3OqFu41k4csCN4rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB4024
X-purgate-ID: tlsNG-bad1c0/1781855450-2D9D6744-46C2C895/0/0
X-purgate-type: clean
X-purgate-size: 1586
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 819F46A4714

When creating a domU with vNUMA enabled, the memory allocation
algorithm was dependent on x86. Fix this logic to make it
usable on ARM as well.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 tools/libs/light/libxl_vnuma.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_vnuma.c b/tools/libs/light/libxl_vnuma.c
index d181574782..70a92a7598 100644
--- a/tools/libs/light/libxl_vnuma.c
+++ b/tools/libs/light/libxl_vnuma.c
@@ -259,8 +259,12 @@ int libxl__vnuma_build_vmemrange_hvm(libxl__gc *gc,
     xen_vmemrange_t *vmemranges;
     int rc;
 
-    /* Derive vmemranges from vnode size and memory hole.
-     *
+    /* Derive vmemranges from vnode size and memory hole. */
+#if defined (__arm__) || defined(__aarch64__)
+    hole_start = GUEST_RAM0_BASE + GUEST_RAM0_SIZE;
+    hole_end = GUEST_RAM1_BASE;
+#else
+    /*
      * Guest physical address space layout:
      * [0, hole_start) [hole_start, hole_end) [hole_end, highmem_end)
      */
@@ -268,10 +272,15 @@ int libxl__vnuma_build_vmemrange_hvm(libxl__gc *gc,
         dom->lowmem_end : dom->mmio_start;
     hole_end = (dom->mmio_start + dom->mmio_size) > (1ULL << 32) ?
         (dom->mmio_start + dom->mmio_size) : (1ULL << 32);
+#endif
 
     assert(state->vmemranges == NULL);
 
+#if defined (__arm__) || defined(__aarch64__)
+    next = GUEST_RAM0_BASE;
+#else
     next = 0;
+#endif
     nr_vmemrange = 0;
     vmemranges = NULL;
     for (nid = 0; nid < b_info->num_vnuma_nodes; nid++) {
-- 
2.43.0


