Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DIkNmKcBmoHlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E15491B4
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309343.1580402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqj-0002WL-FA; Fri, 15 May 2026 04:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309343.1580402; Fri, 15 May 2026 04:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqj-0002Qg-7V; Fri, 15 May 2026 04:08:33 +0000
Received: by outflank-mailman (input) for mailman id 1309343;
 Fri, 15 May 2026 04:08:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjqh-0001yd-5f
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:08:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjqg-00GbfP-Hq
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:08:30 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c0b-2eae-0a2a0a5409dd-0a2a4504bda6-44
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:30 +0200
Received: from [52.101.125.129]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c35-1dec-0a2a45040019-34657d8136d2-7
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:30 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:23 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:23 +0000
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
 b=LRKDfWZzRHBANJNy49uEbFMb3rLvwdeb57/irzeo6WdfiA3gxykkTse40rL0mm3XidTwi5cz5AeUFsJ+BhY86kuGX2gXTRa9fkcmzHRC9S+xUuE79DH27T4R3fMsp3EhmX+c6yVs+Y0ZXzivJ5EH1dYP6riRrVSfXnplSwvDPhGPlVMY+r7/70G1KWO38rnwURELXx2UI7x2Jw2F/uIPRtAOgDDXZqsEPjozXvVdr2u0fFXZ86IHfeJ8XKOpLq6sTC/Os4Rypi6b/SS7W0a+5y0+T5oR1LmWX0xqO0EhkImlAj4FEMXxMSVYholWVNmfZsw+CZZ9tGH4HjNCe13LZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihotna9f+5bqGkkQOWVVME5/dELv08SRAliM5aVHxjs=;
 b=V7VKBFZ7QWs9lqLvfnNHp58L2+D2Z521RAVHcJ6SX1UQFrPaOLsikmdCtdalTVC7gcvq8F5aC2r4TJq+eKizgEybYlpI+51EW8aZhl5dzRCgdbdAhN2Hdhk74/xgIuyb7JCQnWcgWHYAWWGhQg6ENxj+bXhCt6vpDZE/9h7s4S84n7vbotAEe2bZT0amYEQh03RYe7CiZxWQG4vJI0nI7qFRSwKG+AqXD05NjVuVH2aDoGMArPNWcnJeXObS7opRzTTJ53k8uVpgJFbDkh3F4e4vfI1jsaTiEDgGSBEVXV/bMfwdEmcy1c7qJ6w0CGYJpQd4Ot5/ceHEuLd8xwuNPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihotna9f+5bqGkkQOWVVME5/dELv08SRAliM5aVHxjs=;
 b=KNW3CvgfQOw03hq0KYuZMiSXcLlHHlv1aQhLHhjCF0IDJbrWt+ORR/CNqA+LJNJ7JNbcc7wz4ZhQE/y+w/g9vXxoDFsarNar5wVDaEa2dApiUKjmKQV6GNEwTAT9SepGyYDllXTC7mPQT6YpBPYwJSMIl/h0xdrlyerz/YYmW+4=
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
Subject: [RFC PATCH v1 06/26] xen/arm/cca: add Realm granule helpers
Date: Fri, 15 May 2026 13:07:52 +0900
Message-ID: <20260515040812.983626-7-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0351.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0cf795-6dfd-449f-4b10-08deb2379b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4xOloNydJfkoTZbHuGUYSjjx5YR2Y+tlevsyTFdyUb1YpzEVkPjNHvoY0rRnPez2fnFGO5wSuTtQDPOBAMsuzgnQGJ2nVU17gS4YPDrvpApNOT7sYZx0fmNaSOpGrG1sftxySvqlucQP7lxHvT79KY1BwYgoLvz1+amv3QWFa6AST4b42VWN32ulTYk+JsHhVizNc0DEJGF+qIiS7hege9EzLGg9CP6YA/SJ6Ckx/WgiUV9pIkwlRPel+qACm0A4waCcjYNIoE3Xz8nXp32/7E6Ls0TpaXm7SJjKzLMKxak01vqGFndLR6YrE1qEAkL9TOVdG0Uz7qL/SIl9LgEa3KC3hDWOpQLgAfpZcDxeIRyhVXgB3dgC7KgUaLET67UtKTuBdkOT0/jJWLur/dqkGSYFQGjEi29BFRFVfI1H9BCuDl+Kox+DsL8I8BtI8Tv1Oe2vrd00A5ELAqfMKCuhGTvRpxkt3+1kpRROhmQ72N9+2loC2yTPmAt7I1O4RoDUSDkxyIK8GIOAfZ2ASDx8IHcIOkgabInEmpFiDijaG6pzLIMplR/V7OZbNFvpg+3+ZJ3W2Wqc36LKajbXVa4t4NJzlazJVvq7GEtF0GkyFY1pNvGcwxrs8ISIrPzCE+uwEVB4PIGG+z8taB8dQx73j5ojw0tnpXRg0+9A7bO6KELzt1KD7reu7SomCOOi/MGO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B/NmlldLWfuemefkQ0J1njZ9YxbgphWW3fwqvgtXV1A2nwrDJGjWn5crCGWA?=
 =?us-ascii?Q?W5INu6X05W1ZMH9ylng7jh5cT2XAEmL9m1aXbj4eU0szolDrV73JLYAC9mnj?=
 =?us-ascii?Q?brI7LFFmKDKY7IXaVEH0loCHFkocfBRcukMPMgu40p6couJhWRitlMIp41Mw?=
 =?us-ascii?Q?85jl2wxGLiJqjILMDV+YFPRlljpe2nnlsUqXD4WaqIJt6sPXa8dIA4bN9DKS?=
 =?us-ascii?Q?lpdDiJzZtg2VG04F2AA93/uz9HhFfZG/nVGeI8jq0Qe1zEPNImXlmPOVfwYl?=
 =?us-ascii?Q?j/UIfOqRxYFQtkyXG0aFD8JiNDXyU3+e/R4mAm2cMK3LQBgM4c0jtfEY3QYD?=
 =?us-ascii?Q?pZLaLI66KJhpzesw9xf/CA7Xzp1A1jw+eTOqMxmmfAKw9dVskPiN96tZt0fR?=
 =?us-ascii?Q?uip9qx4YyJKtm1Y9WVovW8xzLi42UicVm598TWOpPDFVgJQ62yqGIV2i7BcQ?=
 =?us-ascii?Q?1uW5SOJ1WWiAPyx+TojqFhDFbsRCPWi+ekV0pbwPKBhRphW5ysJytWnB93xz?=
 =?us-ascii?Q?mSFQS4FM9vViZND0VE7cKtNzDFK2I0qv5Y3fWusq+eoMBd3cgMLaaK+lSTyy?=
 =?us-ascii?Q?xPyDBeRWxYgxTB2Er5jC+OLX+nb6WOGNeHMhS7dWWIKFFTbLrfiWBUSW6ePs?=
 =?us-ascii?Q?boj6O+MztSd4KuChHEBcnitgYJGpbarUpAyes59Zfq1ilkoKqtdRDHlaXv3X?=
 =?us-ascii?Q?YlNn5HAaQeix28pj3qFGkyiVW5+nvOMomqPhmU3QG7M0cT6kybvnb0sDLfZ/?=
 =?us-ascii?Q?43wDrFX1K+ez7gq4j5ensaNWS45mCyhXkBo10NIl1nQQjdKipmWQFVgK3YHy?=
 =?us-ascii?Q?WJ6Lsmlo/3QZjNN8ZjaKQwu0dpYRlAlV1IS9XCTs4q40oj2558dH8nTt7QsB?=
 =?us-ascii?Q?if0TyjKOOeUxrCb3KDq3ZNjJUjjNlO6ZH1vRkiKlcfU3WHih0WwYzP840K3E?=
 =?us-ascii?Q?K3RC1hp8xhZl1Jg0WhtL2+08cVch7Bv+7EooCEtjyFjmYyOVB1udrXCy+H3t?=
 =?us-ascii?Q?gYv09v/6Do6k7z+BIENV04yCt86APrPpXCRY9Qrz/ZtApAX2RztIeWotJabW?=
 =?us-ascii?Q?eV160IpL63SWfj9bLCOKVwmChj+8CZrl1p+MVFBua9Y7mEHbyHaWORT+LxEL?=
 =?us-ascii?Q?S0EjnWmJW4YBGUJSigSOG2DZLKcp7qUWGvRhN417x+d7MkC1fQRnaJVdRcbQ?=
 =?us-ascii?Q?kDdXG7Aa3UKz/452bZxueHjzUpy+A9T+ZghJpcRx2zUgK/HPqQTpn7aUUrKY?=
 =?us-ascii?Q?vGF6MLQtDgg9ZOc5mv0u6yHg0Wd7l57bP6QY7onQ6zyIO4d5aTFP6nTRkJSL?=
 =?us-ascii?Q?mhlTMgopau4Ek9iC4vqA0iMUdZ2vrZDyihzY9P6uSqg9+yWNfhOTlZ31xl/F?=
 =?us-ascii?Q?u/JoAJ69OQ3AF3/8RMPXMdhxf8Sn8tc/NIG3qbmks5N9wb6SPlC0KJSAdgH/?=
 =?us-ascii?Q?yO1fv+VukYCd3v7lxXsPDBAooTSThaZ5leBlXaHW5jiXNjs4AL42kgI/wVCf?=
 =?us-ascii?Q?0gKiW7WwXF5es99awA1IZBgrrKw8RrLZ6sQRJT2QSysP9HVKFLYwXM7aTsI8?=
 =?us-ascii?Q?1ep7fGns8rQU0o0MXnwwR6FttnJdFm8w2NR2i5TFXwPuzMje+AxXOaD1V5dn?=
 =?us-ascii?Q?DfQiRQt/D+p4u1NgXJALPhP/r4J8IKBE8bTVZajM7V5nELLf4cIwfujW5RAL?=
 =?us-ascii?Q?VyxdW0Xe8TKjBB+DrEumbYNbmsM1bsmOxxZZALJnQVTIdRZJ+LtROIzEB+Cc?=
 =?us-ascii?Q?HoxaTx2O1yX8J3gfK8dywucEe3XJaOYN/sjtoMYn1gKixiQ7+SO6?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0cf795-6dfd-449f-4b10-08deb2379b4e
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:23.2284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLQcFzsyGfA4ofz/BDkAV+PlLZHi3RxBZO1KWm2KmhM3yKDSXfNg3scZtmjgKr2RgcvHyTv75J5cZRSSLFVHhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-ebf023/1778818110-41D7C3FF-ADB2B77D/0/0
X-purgate-type: clean
X-purgate-size: 5664
X-Rspamd-Queue-Id: 874E15491B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim];
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

Add the memory-tracking preflight and the single-granule delegate
helpers. Realm-owned pages have to come from fine, conventional
tracking regions.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/Makefile      |   1 +
 xen/arch/arm/cca/granule.c     | 150 +++++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/cca.h |   5 ++
 3 files changed, 156 insertions(+)
 create mode 100644 xen/arch/arm/cca/granule.c

diff --git a/xen/arch/arm/cca/Makefile b/xen/arch/arm/cca/Makefile
index aaa04e3b914b..7f20d43323c3 100644
--- a/xen/arch/arm/cca/Makefile
+++ b/xen/arch/arm/cca/Makefile
@@ -1,2 +1,3 @@
+obj-y += granule.o
 obj-y += rmi.o
 obj-y += state.o
diff --git a/xen/arch/arm/cca/granule.c b/xen/arch/arm/cca/granule.c
new file mode 100644
index 000000000000..d2be4d240f19
--- /dev/null
+++ b/xen/arch/arm/cca/granule.c
@@ -0,0 +1,150 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bootinfo.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+
+#include <asm/cca.h>
+
+#include "rmi.h"
+
+static paddr_t __init arm_cca_l0gpt_size(unsigned long features1)
+{
+    unsigned long l0gptsz = arm_cca_rmi_field_get(
+        features1, ARM_CCA_RMI_FEATURE_REGISTER_1_L0GPTSZ_SHIFT,
+        ARM_CCA_RMI_FEATURE_REGISTER_1_L0GPTSZ_WIDTH);
+
+    return 1ULL << (30 + l0gptsz);
+}
+
+static int __init arm_cca_verify_memory_tracking(paddr_t start, paddr_t end)
+{
+    while ( start < end )
+    {
+        unsigned long category, state;
+        paddr_t next;
+        int rc;
+
+        rc = arm_cca_rmi_granule_tracking_get(start, end, &category, &state,
+                                              &next);
+        if ( rc != 0 )
+            return rc;
+
+        if ( category != ARM_CCA_RMI_MEM_CATEGORY_CONVENTIONAL ||
+             state != ARM_CCA_RMI_TRACKING_FINE ||
+             next <= start || next > end )
+        {
+            printk(XENLOG_ERR
+                   "ARM CCA: memory [%#" PRIpaddr ", %#" PRIpaddr
+                   ") is not fine-tracked conventional memory\n",
+                   start, end);
+            return -EOPNOTSUPP;
+        }
+
+        start = next;
+    }
+
+    return 0;
+}
+
+static int __init arm_cca_create_gpts(paddr_t start, paddr_t end,
+                                      paddr_t l0gpt_size)
+{
+    paddr_t base = ROUNDDOWN(start, l0gpt_size);
+    paddr_t stop = ROUNDUP(end, l0gpt_size);
+
+    while ( base < stop )
+    {
+        int rc = arm_cca_rmi_gpt_l1_create(base);
+
+        if ( rc != 0 )
+        {
+            printk(XENLOG_ERR
+                   "ARM CCA: failed to create GPT L1 for %#" PRIpaddr "\n",
+                   base);
+            return rc;
+        }
+
+        base += l0gpt_size;
+    }
+
+    return 0;
+}
+
+int __init arm_cca_prepare_host_memory(unsigned long features1)
+{
+    const struct membanks *mem = bootinfo_get_mem();
+    paddr_t l0gpt_size = arm_cca_l0gpt_size(features1);
+    unsigned int i;
+    int rc;
+
+    for ( i = 0; i < mem->nr_banks; i++ )
+    {
+        paddr_t start = mem->bank[i].start;
+        paddr_t end = start + mem->bank[i].size;
+
+        rc = arm_cca_verify_memory_tracking(start, end);
+        if ( rc != 0 )
+            return rc;
+
+        rc = arm_cca_create_gpts(start, end, l0gpt_size);
+        if ( rc != 0 )
+            return rc;
+    }
+
+    return 0;
+}
+
+static int arm_cca_process_granule_range(paddr_t start, paddr_t end,
+                                         bool delegate)
+{
+    paddr_t cur = start;
+    int rc;
+
+    /*
+     * arm_cca_prepare_host_memory() checks that host DRAM is fine-tracked and
+     * has GPT L1 metadata before any Realm-owned granule can be delegated.
+     */
+    if ( start >= end || !IS_ALIGNED(start, PAGE_SIZE) ||
+         !IS_ALIGNED(end, PAGE_SIZE) )
+        return -EINVAL;
+
+    while ( cur < end )
+    {
+        paddr_t out_top = INVALID_PADDR;
+
+        if ( delegate )
+            rc = arm_cca_rmi_granule_range_delegate(cur, end, &out_top);
+        else
+            rc = arm_cca_rmi_granule_range_undelegate(cur, end, &out_top);
+
+        if ( rc != 0 )
+            return rc;
+
+        if ( out_top <= cur || out_top > end )
+            return -EIO;
+
+        cur = out_top;
+    }
+
+    return 0;
+}
+
+/* DEN0137 2.0-bet1 - D1.1.1 Granule delegation flow. */
+int arm_cca_delegate_granule(paddr_t granule)
+{
+    if ( !IS_ALIGNED(granule, PAGE_SIZE) )
+        return -EINVAL;
+
+    return arm_cca_process_granule_range(granule, granule + PAGE_SIZE, true);
+}
+
+/* DEN0137 2.0-bet1 - D1.1.2 Granule undelegation flow. */
+int arm_cca_undelegate_granule(paddr_t granule)
+{
+    if ( !IS_ALIGNED(granule, PAGE_SIZE) )
+        return -EINVAL;
+
+    return arm_cca_process_granule_range(granule, granule + PAGE_SIZE, false);
+}
diff --git a/xen/arch/arm/include/asm/cca.h b/xen/arch/arm/include/asm/cca.h
index 6bf644fbcee5..c35d51f750a3 100644
--- a/xen/arch/arm/include/asm/cca.h
+++ b/xen/arch/arm/include/asm/cca.h
@@ -2,6 +2,7 @@
 #ifndef ARM_CCA_H
 #define ARM_CCA_H
 
+#include <xen/init.h>
 #include <xen/types.h>
 
 /*
@@ -79,4 +80,8 @@ void arm_cca_vcpu_destroy(struct vcpu *v);
 void *arm_cca_alloc_rec_run(void);
 void arm_cca_free_rec_run(void *run);
 
+int arm_cca_delegate_granule(paddr_t granule);
+int arm_cca_undelegate_granule(paddr_t granule);
+int arm_cca_prepare_host_memory(unsigned long features1) __init;
+
 #endif /* ARM_CCA_H */
-- 
2.51.0


