Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fSmlNQlHKWryTQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:14:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED19668A0B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:14:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=aF24DM07;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334126.1597238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXGsJ-0006cb-NW; Wed, 10 Jun 2026 11:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334126.1597238; Wed, 10 Jun 2026 11:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXGsJ-0006a6-JH; Wed, 10 Jun 2026 11:13:35 +0000
Received: by outflank-mailman (input) for mailman id 1334126;
 Wed, 10 Jun 2026 11:13:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wXGsH-0006AU-W2
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:13:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXGsH-00GqBH-CQ
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 13:13:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2946da-5cb7-0a2a0a5109dd-0a2a450880a8-22
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:13:33 +0200
Received: from [52.101.229.134]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2946d6-63b5-0a2a45080019-3465e5868771-6
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:13:33 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB6556.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 11:13:29 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 11:13:29 +0000
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
 b=vOVSRPQ30nPYvnHW7krgjG2/WV0y+S0dUUlSJIN2h7ZxYjtKFUGNkldxafBzBRvr40mEKWVRLml2E4Kx0+CkAWz6iQP2N0IzWouWSGlK3utGcklztXRo78aBZ9rl9iqhzUB0pgyogZ3HADm3/UGcyk0qyUg9YcvKLuGc9EltGZyixeMo70/Uw2aJA0vIw6xFqVinbpEcXPnq4qrNztu8U6FlLvqtVIBj/pFgVmsJB61MTEXEsBKMS+4SyIwACKfmG14JA0Y6kWjKfMCh/n60rmltb5YqxTiuIpvCRAJygfwrCKdlfxbDNKqfOFZYs8987YW9JqRrrqwiWDzJ9irfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FULNXB41nFxLdVdMIO10H4z2ozWVoFFKD0Vvei/1HYg=;
 b=IDwr+lp8LxHG+6ElHPR/zTchd9Wv+U8a8Ui9B/CALiMl3zwA/tjIIMyhTaR6vw+Pfyn/QX/wxE3XVHw4oAD1aUAyocb6p8o9JbXFfMly/kFJXPu0UURaCTA83J3FeDFBntsL8/tV1WMvKjaDQqCyB8ZOkZqd0bgpcl3GdVcaKd1Ybc9ZtsRSc3IXnA+mj6qgAxUTKdIGvS38FSDXuV9ez1Yj3rUSHsVmfI9qE2AsliJD2biupBHf6eH/XmBba2dNUNalg0/kvZUoKqwwBFTc8JdnKNOFzdOPNcOzeDCOvNHgTjYfGyk+qV2G/tZl47zOZRGlf4j90OF25Tka+FkThw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FULNXB41nFxLdVdMIO10H4z2ozWVoFFKD0Vvei/1HYg=;
 b=aF24DM07/0p0AyK2+yR5SJKUfqEEAhNJMLtlmGANHFAYYYNEzGaAMyPOuhgHBhHAdusjdpzw5qlQNqMAHZG3cxCOLkmWdlEsBNGkrWKsKxventu4DgFKBFRl1SHDbMTgMLf44KognVHsExC6esfzeA0YeqBJssTJxHgG1FEX0nc=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH 3/3] xen/sched: Make cpu_nr_siblings() architecture-specific
Date: Wed, 10 Jun 2026 20:13:20 +0900
Message-ID: <20260610111320.133784-4-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610111320.133784-1-taka@valinux.co.jp>
References: <20260610111320.133784-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::7) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e34474e-4a06-4ae5-6483-08dec6e14ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|23010399003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	/XXh1U4It6k3QAcsjNUORrHgwEv6XVYDvbZnKr6sxysS/tP0i/Uapi5nuOJtLYug60BaDq44Cra/UnS3j2LqiQ3wIjqAZZjFNYnsAP5N1sRUbD3nIO/yld4KtO7SHnGX/iLKigmK9Ds7JUkW+nonkqpVI2v8qkp5OZct8nv4Eb7QJmKseIJ7I6XCiH0lhuCX8iX9glA8PpbmK9sEipbuTsrzd5dSPdwDx1DWxCA8rRD7uynHZy0RtPvazVGaH5u+kqusqNMnW0jQhzMzm+jUUsIOxjEHfW0WrfgrX7q6n4UECvooEfJoR8CYehxtBNwXuc38zS+Lmptd8YsCQdzTAGzf6gHdxTyNStooEffrPXSWBCfPHGYgM3ivtJvB6QQWyRj7yPaNHZeGzvZL16SL3PFNA4g3Lw5I45drb/AUucruPwc2xKbKUg0aWQLqGdJ4yrxWGPOD/panQjotANbb3fLIHf6muecKv7Z5IIcVx/z3sozfw9nCSbOTYOXBkYrfkge+ZNL0vqQmleu1kF/qi/Z3DhqFVPGTGxEet06nKE86xdTqDD3YPxJdvKWYtPPjQWGzzaAmGffkGvN+oXsx0H4jf0ShKhSdvqmWmG2sBX517au/WJuSHOIqK/wZBfIVdbLKmsm7Y0dsNEsV+zAR/gVnBN3/MKPS/Ibgkn4m+IMuMYBkRmXpkHU73cXkr6RY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(23010399003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VUAFPo3zIJ9ebqE1xwMDJS4IaJEL97d0EVO+VhrQg40dtv72XGch5SRkZgco?=
 =?us-ascii?Q?9pCK/zPJv/lxHmKzRdQyaXGnMilMV1s75vmH4FeuirACUOrYKvhuWP3LZjsV?=
 =?us-ascii?Q?EaniY0pM0srxGaMHobrd0LcF5zrjcpagFZNrcjMUoFfKlOvoTerKAswe0pSX?=
 =?us-ascii?Q?YFg67/UvUc5XQjk8Tl+oEq4k7Raj9EWz9a0GqOFxagbOXoyE91mtPub1duAc?=
 =?us-ascii?Q?hREy25q077BmBRFIdQgmlIiLRPNCVDXdyRtnUfrNkN2Bx/rnW20vgeynB29Z?=
 =?us-ascii?Q?s6neBPErk7OZYsZK+WPt32NUi2Wsle3KgVqFEZ6pXhoKTtze/9dy/x774yYC?=
 =?us-ascii?Q?Suk7UkFVAaG4nQe+EshUWQahn8Q6nPgo8QmlwLEzksn17PrpcM8dOPHf2+Kp?=
 =?us-ascii?Q?GWTIs1haSphAtU+MxXD6HqWkQQXoKfLW4XXl35/cPoMlm+69npf2i1/mbYMs?=
 =?us-ascii?Q?HPpnyEV2utCFjBkZPf8SLdwyMj365omuGjYvVd2fROXKjJrywZUxXBgPzbg3?=
 =?us-ascii?Q?5RMuRrVUEpu3eHAhovbBrI99KLiGhdgz/0hnhLzqYQ37VI6xiJ7frcs5AFWu?=
 =?us-ascii?Q?iZx/qSq/QMFQ7/OSpRV9v863p6fYWOReeYxtCAS2rZj+6vtSxJjHJGOLh88G?=
 =?us-ascii?Q?gvCGWfphXQe5ZT19z+9aYm86PoIih4Rf41OK499HxIrzMAi8A5lbwkakBKXF?=
 =?us-ascii?Q?TcaMyLjsafeFVK3H0hG05HkZhFgKJdIOsyDwGM9RUoQCgpWTcOoae6cHWKwl?=
 =?us-ascii?Q?CUB3iYijEfkUxTrhf/L9pFciRtZtQc08GZ6Gcteu1L+IJTEJRKLulYiagOoJ?=
 =?us-ascii?Q?nMBur+0tRqwW06/cZ59JvD4928uobpSJ/MGp9s4WPAl+Rlgs7d5TC0qhjE8p?=
 =?us-ascii?Q?9M3v8YBrGaGc3SssFWbzy2xLevCQdmSV2HSrb7wmj/afeL3xdRaDRMMZ0Dnb?=
 =?us-ascii?Q?5q6U2nH3Gyf0GStNWrXzDjiX5NQxR7lKk2Halj4Hpe7EiTD8bJxcp+LYoxC/?=
 =?us-ascii?Q?qyJjetI0MZmt11/HkVLuyWY+QfcB+GXE/fcgIsxVv1aPShwVHK+0tmiE7xMe?=
 =?us-ascii?Q?H4/hbUwUcwVOOrbeyPmgWPZCtBerz4mquY0BXf/DpH/PhYCcg5LbXLMrWcuj?=
 =?us-ascii?Q?jNXFfxquR7MHtxKlDrGLsnX4GQVitW3CrlhyVEnYjF57FMhHnWGzZijov1zQ?=
 =?us-ascii?Q?YIewXUOIH5+fsSMCvxH+ji/nsd16so+vb/nESxiM4qlHH0cs6BcAUjYWLuTK?=
 =?us-ascii?Q?4ElvRk9/VxezeWvS5d06kxdpAQTkFWns+aYvht5eQbBDrxzUv4yacdgxcGTA?=
 =?us-ascii?Q?NSdYlzstpXDqG7za+E8B+fQxCheeI7nRBOEtdCYD1OxF6CyzHDEwi7VjRhV8?=
 =?us-ascii?Q?ehji9Y2Kp6KAzJInKys1T0/VQiP9azeu9cpRLgGiKCCbcRhbWJNPp5ZKDtVk?=
 =?us-ascii?Q?gCNMMA2751P9Vc0HgX6Q2PSbvxG+Uo8FY/BEA15VmTXPDJjbosKsXovTtftb?=
 =?us-ascii?Q?w55hslpyZuTlIj770I8ykB/U5VpKxG3iwboSoQlZM7Rs7+BqvuDc0vRZdfox?=
 =?us-ascii?Q?YMjZE5faBqaI0WtDTJ9mis7iK6akJtqfyeV8WT2iqQgMPdi+Drz8e/twyDW/?=
 =?us-ascii?Q?oIQga5a7Pw/h0mDf55j5YRTSbLX+6EvaFttYJ0L3G/HgIDcz0a/7b2H9aQWv?=
 =?us-ascii?Q?rwa3csiDg2TJC+Whsqm89UlaoIGTq1R08N5uh/giXEh0vkLbCycbbOX4rwBk?=
 =?us-ascii?Q?dmzSrlQDe65QBDxrW4bV/ssZRN89qcALkIgXfzVuqayEABhgjRENdtFo5DNd?=
X-MS-Exchange-AntiSpam-MessageData-1: Lc3KGPaOeWHR/w==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e34474e-4a06-4ae5-6483-08dec6e14ced
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 11:13:29.4732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRRiL1zFvj6d1IyZAzce1W70odoC5fHQmIM4KE4/BmAnd9uM25JbrFQQhOdnpzfJV7dcFBOEO3xSRIWopl5V5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6556
X-purgate-ID: tlsNG-c1860d/1781090013-C5784DB1-68BCA8E8/0/0
X-purgate-type: clean
X-purgate-size: 3311
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
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:taka@valinux.co.jp,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: 5ED19668A0B

Make cpu_nr_siblings() an architecture-specific function.
This patch provides the implementation for x86 and a common
version for Device Tree-based architectures.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/common/sched/credit2.c           | 23 +++++------------------
 xen/include/xen/cpu-topology.h       |  2 ++
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8ca6799a81..9758060129 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -106,6 +106,7 @@ extern void intel_init_arat(void);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)
+#define cpu_nr_siblings(_cpu) (cpu_data[_cpu].x86_num_siblings)
 
 unsigned int apicid_to_socket(unsigned int apicid);
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index dcce1e361f..2d93944824 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -29,22 +29,6 @@
 /* #define d2printk printk */
 #define d2printk(x...)
 
-/*
- * TODO: Abstract this properly, and figure out what Credit2 wants to do with
- *       the fact that x86_num_siblings doesn't even have the same meaning
- *       between x86 vendors.
- */
-static unsigned int cpu_nr_siblings(unsigned int cpu)
-{
-#ifdef CONFIG_X86
-    return cpu_data[cpu].x86_num_siblings;
-#elif CONFIG_DT_CPU_TOPOLOGY
-    return cpu_topology[cpu].num_siblings;
-#else
-    return 1;
-#endif
-}
-
 /*
  * Credit2 tracing events ("only" 512 available!). Check
  * include/public/trace.h for more details.
@@ -884,8 +868,11 @@ cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
  * Additional checks, to avoid separating siblings in different runqueues.
  * This deals with both Intel's HTs and AMD's CUs. An arch that does not have
  * any similar concept will just have cpu_nr_siblings() always return 1, and
- * setup the cpu_sibling_mask-s acordingly (as currently does ARM), and things
- * will just work as well.
+ * setup the cpu_sibling_mask-s acordingly, and things will just work as well.
+ *
+ * TODO: Abstract cpu_nr_siblings properly, and figure out what Credit2 wants
+ *       to do with the fact that x86_num_siblings doesn't even have the same
+ *       meaning between x86 vendors.
  */
 static bool
 cpu_runqueue_siblings_match(const struct csched2_runqueue_data *rqd,
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index f268069449..ea5518bb16 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -25,6 +25,7 @@ void dt_init_cpu_topology(void);
 
 #define cpu_to_core(_cpu)   (cpu_topology[_cpu].phys_core_id)
 #define cpu_to_socket(_cpu)   (cpu_topology[_cpu].phys_socket_id)
+#define cpu_nr_siblings(_cpu) (cpu_topology[_cpu].num_siblings)
 
 #elif CONFIG_DEVICE_TREE_PARSE
 
@@ -33,6 +34,7 @@ static inline void dt_init_cpu_topology(void) {}
 
 #define cpu_to_core(_cpu)   (0)
 #define cpu_to_socket(_cpu) (0)
+#define cpu_nr_siblings(_cpu) (1)
 
 #endif /* CONFIG_DEVICE_TREE_PARSE */
 
-- 
2.43.0


