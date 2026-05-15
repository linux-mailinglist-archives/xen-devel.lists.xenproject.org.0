Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPa0B0SdBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B4F549277
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309494.1580585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjum-0005aT-Ci; Fri, 15 May 2026 04:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309494.1580585; Fri, 15 May 2026 04:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjum-0005We-6q; Fri, 15 May 2026 04:12:44 +0000
Received: by outflank-mailman (input) for mailman id 1309494;
 Fri, 15 May 2026 04:12:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjuk-0005Ho-Hl
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:12:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjuj-0052Pz-U0
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:12:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069d1c-e002-0a2a0a5209dd-0a2a4505c714-18
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:12:41 +0200
Received: from [52.101.125.85]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c47-aaa8-0a2a45050019-34657d55753b-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:41 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3682.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 04:08:37 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:37 +0000
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
 b=HA06MtBcnpkwE0Cqf2kjqUkO/DvAm2x3nhmIe+AMCI0v7Thz8LUADuRv7z18pWHuPDXsEHFXs2gQDKAERXCDlq/GGvKA7PRxdp3h8s5/fpJioH6T7twL5T/r5f6lIgedMUAypzLnzl3YZCEV4SSGlNZS+w2C0FHLkExE6W5HQdOaIcITegPYtoSOs/HlNH+7HJfY3NO61YPIxyWKDoxOMAscww6+czkY4KGrniIsXhwgZw9Mfju5mR//vOzShUFv7G+f6flkvLPGi6q/CHZhw1qZmGlFBUCMmlGxzlq6VpjgQzu0eW+KJjBk5YXnlkbReJaOydTgGAJ2cFGdHBYvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1HxX8zYRrTCNBvxhpZ+y28N68FN7W38vZ7TVisM/bg=;
 b=BfnGHp5+NGIW/3h41SWaBuhVNDgsWFtVh0q6uE0C7iZJyYekKPMTFUANsCO8H3LozPN6kZwcQhYgT/wV1mM1mg4rgw90xzja1IL10UcDCSjmTImQf0qSrw3EV5dSpbPa+18Bg9lRUhpO36bFjrFnFE8L2n9hWHkhZKQhZzTO3h6PCR8/smRZkWDMRS5VRZCpvg7xg4j68c4K4KdB9l+UuTDVPOir87tsvYpp4lGkk5hrwgZu/JckICeCnwjv8SpYnAaZGjQi0wfgRxyVp+2PvnXzWmNeVNlUY+8qYoCjZBfd14EQDt3HeASCYC6twyY66yc6ls92eZhUTFmcOGMc+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1HxX8zYRrTCNBvxhpZ+y28N68FN7W38vZ7TVisM/bg=;
 b=eVwsUKKXGQdWMYenem0IMSMvCQvBmh1ubaNwo67gQuPnuax6gSDRdxWJnhrRaGlSvSnR9i4lA65u324G/MBo1sUs2hDZkGuSvJ88OEVtrYd26uCQwDl8D54UVXd6JPItRdfL/lu/BRoh1q41zTsWBwoUHw80GTJENu0+IPcPnEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v1 21/26] xen/arm/cca: add Realm vCPU timer state
Date: Fri, 15 May 2026 13:08:07 +0900
Message-ID: <20260515040812.983626-22-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0199.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3682:EE_
X-MS-Office365-Filtering-Correlation-Id: b07babc4-817c-4a47-4075-08deb237a25e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gCxWD0qqo83L5Ufb2aAHhhXJw0kiaYADHGww+IabmlnXTxhy3aVL4CQ1WY6Cr+sj4MpjQc+1zB0bC4cneapY/64uqg053ohGQppVd6n5Fvh/Wk3dRIP//CZNnyyAxHH/k6YEStx77USHkrzjkX1AmGeDQQoNbySs1inVMZOe34GxkCQL87JXqnobZVt+uVBDHiI8q+XZiEziRvWehquITQBVXxuF3KPy1t0azSJ+G+y6JP3WKYVAqs5SDiJ95VM8D+7Bt1XDfu93jY69B15pb6lDnQbAY8hVbdLOMEAIkpNVESfQ+aplFegzQ4AqGNbiFBURZFnHox/dc5qIG4wFTv5A/2yZUneAdKm4gja68Sedmb305RKKSiwWJej/PrdryjxH+sHlMnNPjDODbc4V11B3X7ZgDTGFFJY1eeZecemg6BUbVutnE0SnK4B4REWsXY6tOPrXmgyHTWh0Mg8a384VRf8krMNkJb5l5qc880uAp8C9n77+QiGLi2KHmkHE8Q4S3O6rDn6x5p4krd8xjPZUSbbl22R/8IJd+sxzqMzMygnCYix8ScznIGSGutnatvUpfQHNv0IUWJcKxyRbtZVIgi68Z1jchW/WblCQJZ+4UBZbj5vtEEIb3gNksx7AONj+mp+97ZPpywhiM5tC3lbNUaBXDC1FB1r9X85UHKM9HDR/EKH+UevJ9sMwxjcZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DugzqyTVf8ARuSvcvzjrMgw+T33dx7qJzt6Py7SMbbXBVcGPYG7J1mmBiueh?=
 =?us-ascii?Q?kE0n6wvB0h8rjri8V5oo1mWrlVy0nrGtC6079oXB9pGVZO/LLayYAU1YGazM?=
 =?us-ascii?Q?2FCmOKe825TelE4eBMRJTFGB5EynNpbmD8VZgV4JQpZgzdp6gQLBn0a1wdPQ?=
 =?us-ascii?Q?SoqO1tkIWTj8gmjxSxucQyrissJOSGzzh+Be3G3kFp0GmJiu+O2aFvmiIm3m?=
 =?us-ascii?Q?LRz1CqzX+lZW0rfGX2PVBwJPekiGix/amiMyOBKxxAUZb2LdXgPe4MacQBnp?=
 =?us-ascii?Q?Gisq2GElWWhB/iWaXbAlnOajn4gQeuyr9qA987u7llHxHF62nISVRYuy6Z2+?=
 =?us-ascii?Q?ga7e31eqUjl3yQ4Zo1qSKRdKfaUOt4oGV0P436+G8gjPiDXnjUNzW9JLoLDE?=
 =?us-ascii?Q?NhI3mG+apc0XTR45ZxAunGwnJcfh1VScnJ7noEyl07M93i7zM37zcSZc3+IG?=
 =?us-ascii?Q?mQCltgINoOUEfAi6mfUDjLH3YV1/aHd7u2th5C6qie/52k6eXst7CkOxUa6f?=
 =?us-ascii?Q?T3MdB7hsDYJ2ZZ3pGzAIIvE0JpqqmvjTbgvQjTgGCZZPegIjqwYvhz8PKMVm?=
 =?us-ascii?Q?wOykq/l085MHCJOZiolfXVS8iL5bZg3vZuIgpXovk+J4Of5jJtgoKrh5/34+?=
 =?us-ascii?Q?VkLMxnvNbiD/vXvg86qIetvPMFifewHlx8PKVRr0kI/2C2H/qXU0ABXQvWQm?=
 =?us-ascii?Q?hAkrpFwbD91NNI88N7qraL94A+9fzVm1P4xqu5D3/eHS8JLmyCz9hjOxbdmh?=
 =?us-ascii?Q?fymhNEh1p22FzNH512olapgXUVzXcSmeqg6UJ3lahlx5OcujPl9Wi0oC6ZJB?=
 =?us-ascii?Q?n67NZ4Pu3uDfwDA7CpI9ceJNpf5zs52aed76JFo/BxANoI9v24kYhzVUHlWY?=
 =?us-ascii?Q?bx+7qv6qz8b2SBCYOUW74wnJIcGi9omen8oBhylZiLGVjbgorH+dd5o5HkX/?=
 =?us-ascii?Q?ff4YhJYbuhtF99OOS8/OdHf5evHgJbv9cdzCDxwlZqVjP7xdx4XVH3wmScER?=
 =?us-ascii?Q?B1czQQJvQrnVQYScy96AZ9ulhSFKt5ucZdNlqlomswrL/tzF02hOWzJil1gR?=
 =?us-ascii?Q?IBVr9CbA9BeV+C+5woub5Y1RZOy7759ezzlSzoxv8aRUDUHPtXdhma/ySb7D?=
 =?us-ascii?Q?WilmIFHIZ0FLcP4JG02woNoVu4EtMODglYDP0gZOx4r+BAnDArAbvONeAHQy?=
 =?us-ascii?Q?4gCBg1348h3Nx9Dk0iTx1ImT8+zk1zwBrHf14fI/Qz5swCzM/EZenlqTTK4c?=
 =?us-ascii?Q?6l6uQ0VzYfanHqClLYukmyE5yUpKBoZrdFKsqCbYi3nrO5CaDmfW4JI2UJnX?=
 =?us-ascii?Q?peHbY9lbuDtxz8OXrkTJnmwCgL8UQwyyO8wetf3C6QMJQKbXhqKsLI37zO6S?=
 =?us-ascii?Q?VbehUiTpwCvS/Ylhaeetg4H8Z7ODMEsRCDaIE3o6sSy6L2R1/Df5lN3+s1cr?=
 =?us-ascii?Q?JReMLNsPr1kXEWua9tOIAm2YBj8XJz/f21z+YU+veMYeAvSP9XjJw5C98xyQ?=
 =?us-ascii?Q?ltNdF3P0HsYPNVyuG6vjtdqDwmiavcP3J09m1fMCNyhg0CZZw2u++s/exxBf?=
 =?us-ascii?Q?I69NYU3RxZ/lVybZ0Rjl1uFViVdU+ylAzc7jagpoKRBrwebHiMznM2jDQfDV?=
 =?us-ascii?Q?lT1pS6daKOUPWPqYBCkrU7YN+yKwCOIVVAotGO2yv+Nhvk9VTHB8cmcCQ9FG?=
 =?us-ascii?Q?0QGivBQnbN8mG4iTtsemrvpyIoBp1jdve68r1C62BFD5UPAKH7qtv9rxG+ww?=
 =?us-ascii?Q?w8FPe2Vha960e+u84OdBwJRO4nd641ZumldBejPATExUMG1n/8Uc?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b07babc4-817c-4a47-4075-08deb237a25e
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:35.0998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KsTTGNOggb+QQLG0E6/tx8aQQkyD5iaqdN++L8oieSOfwqg32OC6OhPjrJ1vN85owwjO3/9B9rfTLTPw3YMVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3682
X-purgate-ID: tlsNG-c201ff/1778818121-D8979443-C291BDD8/13/0
X-purgate-type: clean
X-purgate-size: 7100
X-Rspamd-Queue-Id: A9B4F549277
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Keep Realm timer state separate from the normal guest timer registers.
The RMM reports timer snapshots on REC exit.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/Makefile      |  1 +
 xen/arch/arm/cca/build.c       | 10 +++-
 xen/arch/arm/cca/rec.c         | 90 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/cca/state.c       |  3 ++
 xen/arch/arm/domain.c          |  6 ++-
 xen/arch/arm/include/asm/cca.h |  5 ++
 6 files changed, 112 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/cca/rec.c

diff --git a/xen/arch/arm/cca/Makefile b/xen/arch/arm/cca/Makefile
index 0e66280012b7..b473132c1a67 100644
--- a/xen/arch/arm/cca/Makefile
+++ b/xen/arch/arm/cca/Makefile
@@ -4,3 +4,4 @@ obj-y += rmi.o
 obj-y += sro.o
 obj-y += state.o
 obj-y += build.o
+obj-y += rec.o
diff --git a/xen/arch/arm/cca/build.c b/xen/arch/arm/cca/build.c
index 29eb0c6057b0..18e825eec83a 100644
--- a/xen/arch/arm/cca/build.c
+++ b/xen/arch/arm/cca/build.c
@@ -851,7 +851,7 @@ static int arm_cca_create_rec(struct domain *d, struct vcpu *v, bool runnable,
     struct arm_cca_rmi_rec_params *params;
     struct page_info *rec_pg = NULL;
     struct page_info *params_pg = NULL;
-    bool rec_delegated = false, run_created = false;
+    bool rec_delegated = false, run_created = false, timers_created = false;
     void *va;
     int rc = -ENOMEM;
 
@@ -872,6 +872,11 @@ static int arm_cca_create_rec(struct domain *d, struct vcpu *v, bool runnable,
         run_created = true;
     }
 
+    rc = arm_cca_vcpu_timer_init(v);
+    if ( rc != 0 )
+        goto out;
+    timers_created = true;
+
     rc = arm_cca_delegate_granule(page_to_maddr(rec_pg));
     if ( rc != 0 )
         goto out;
@@ -913,6 +918,9 @@ out:
     if ( rc != 0 && rec_pg )
         arm_cca_free_or_abandon_build_page(d, rec_pg, rec_delegated);
 
+    if ( rc != 0 && timers_created )
+        arm_cca_vcpu_timer_destroy(v);
+
     if ( rc != 0 && run_created )
     {
         arm_cca_free_rec_run(v->arch.cca.run);
diff --git a/xen/arch/arm/cca/rec.c b/xen/arch/arm/cca/rec.c
new file mode 100644
index 000000000000..8314a7a45d95
--- /dev/null
+++ b/xen/arch/arm/cca/rec.c
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/lib.h>
+#include <xen/sched.h>
+#include <xen/timer.h>
+#include <xen/xmalloc.h>
+
+#include <asm/cca.h>
+#include <asm/time.h>
+#include <asm/vgic.h>
+
+struct arm_cca_timer {
+    struct vcpu *v;
+    unsigned int irq;
+    struct timer timer;
+    register_t ctl;
+    uint64_t cval;
+};
+
+struct arm_cca_vcpu_timers {
+    struct arm_cca_timer phys;
+    struct arm_cca_timer virt;
+    struct timer wfx;
+};
+
+static void arm_cca_timer_update_irq(struct arm_cca_timer *timer)
+{
+    register_t ctl = timer->ctl;
+    bool level;
+
+    ctl &= (CNTx_CTL_ENABLE | CNTx_CTL_PENDING | CNTx_CTL_MASK);
+    level = (ctl == (CNTx_CTL_ENABLE | CNTx_CTL_PENDING));
+
+    vgic_inject_irq(timer->v->domain, timer->v, timer->irq, level);
+}
+
+static void arm_cca_timer_expired(void *data)
+{
+    struct arm_cca_timer *timer = data;
+
+    timer->ctl |= CNTx_CTL_PENDING;
+    arm_cca_timer_update_irq(timer);
+}
+
+static void arm_cca_wfx_timer_expired(void *data)
+{
+    vcpu_unblock(data);
+}
+
+static void arm_cca_timer_init(struct vcpu *v, struct arm_cca_timer *timer,
+                               unsigned int irq)
+{
+    init_timer(&timer->timer, arm_cca_timer_expired, timer, v->processor);
+    timer->v = v;
+    timer->irq = irq;
+    timer->ctl = 0;
+    timer->cval = 0;
+}
+
+int arm_cca_vcpu_timer_init(struct vcpu *v)
+{
+    struct arm_cca_vcpu_timers *timers;
+
+    ASSERT(!v->arch.cca.timers);
+
+    timers = xzalloc(struct arm_cca_vcpu_timers);
+    if ( !timers )
+        return -ENOMEM;
+
+    v->arch.cca.timers = timers;
+
+    arm_cca_timer_init(v, &timers->phys, GUEST_TIMER_PHYS_NS_PPI);
+    arm_cca_timer_init(v, &timers->virt, GUEST_TIMER_VIRT_PPI);
+    init_timer(&timers->wfx, arm_cca_wfx_timer_expired, v, v->processor);
+
+    return 0;
+}
+
+void arm_cca_vcpu_timer_destroy(struct vcpu *v)
+{
+    struct arm_cca_vcpu_timers *timers = v->arch.cca.timers;
+
+    if ( !timers )
+        return;
+
+    kill_timer(&timers->phys.timer);
+    kill_timer(&timers->virt.timer);
+    kill_timer(&timers->wfx);
+    XFREE(v->arch.cca.timers);
+}
diff --git a/xen/arch/arm/cca/state.c b/xen/arch/arm/cca/state.c
index d85a20a9e7d2..03e0d1d2382b 100644
--- a/xen/arch/arm/cca/state.c
+++ b/xen/arch/arm/cca/state.c
@@ -51,6 +51,7 @@ static void arm_cca_reset_vcpu_state(struct vcpu *v)
     v->arch.cca.rec = INVALID_PADDR;
     v->arch.cca.run = NULL;
     v->arch.cca.run_pa = INVALID_PADDR;
+    v->arch.cca.timers = NULL;
     v->arch.cca.rec_page = NULL;
     v->arch.cca.nr_aux = 0;
 
@@ -439,6 +440,8 @@ void arm_cca_vcpu_init(struct vcpu *v)
 
 void arm_cca_vcpu_destroy(struct vcpu *v)
 {
+    arm_cca_vcpu_timer_destroy(v);
+
     if ( v->arch.cca.run )
         arm_cca_free_rec_run(v->arch.cca.run);
 
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2d9469f388c6..d2ee90248a44 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -113,7 +113,8 @@ static void ctxt_switch_from(struct vcpu *p)
 
     /* Arch timer */
     p->arch.cntkctl = READ_SYSREG(CNTKCTL_EL1);
-    virt_timer_save(p);
+    if ( !is_vcpu_realm(p) )
+        virt_timer_save(p);
 
 #ifdef CONFIG_ARM_32
     p->arch.joscr = READ_CP32(JOSCR);
@@ -265,7 +266,8 @@ static void ctxt_switch_to(struct vcpu *n)
     /* This is could trigger an hardware interrupt from the virtual
      * timer. The interrupt needs to be injected into the guest. */
     WRITE_SYSREG(n->arch.cntkctl, CNTKCTL_EL1);
-    virt_timer_restore(n);
+    if ( !is_vcpu_realm(n) )
+        virt_timer_restore(n);
 
     WRITE_SYSREG(n->arch.mdcr_el2, MDCR_EL2);
 }
diff --git a/xen/arch/arm/include/asm/cca.h b/xen/arch/arm/include/asm/cca.h
index 5e6b11a3693d..323988b379ba 100644
--- a/xen/arch/arm/include/asm/cca.h
+++ b/xen/arch/arm/include/asm/cca.h
@@ -29,6 +29,7 @@ struct vcpu;
 struct arm_cca_rmi_realm_params;
 struct arm_cca_rmi_rec_params;
 struct arm_cca_rmi_rec_run;
+struct arm_cca_vcpu_timers;
 struct page_info;
 
 struct arm_cca_rtt_record {
@@ -99,6 +100,8 @@ struct arm_cca_vcpu_state {
     void *run;
     paddr_t run_pa;
 
+    struct arm_cca_vcpu_timers *timers;
+
     struct page_info *rec_page;
     struct page_info *aux_pages[ARM_CCA_MAX_REC_AUX];
     unsigned int nr_aux;
@@ -114,6 +117,8 @@ int arm_cca_domain_finalize(struct domain *d, gfn_t base_gfn,
 void arm_cca_vcpu_init(struct vcpu *v);
 void noreturn arm_cca_vcpu_run(struct vcpu *v);
 void arm_cca_vcpu_destroy(struct vcpu *v);
+int arm_cca_vcpu_timer_init(struct vcpu *v);
+void arm_cca_vcpu_timer_destroy(struct vcpu *v);
 
 void *arm_cca_alloc_rec_run(void);
 void arm_cca_free_rec_run(void *run);
-- 
2.51.0


