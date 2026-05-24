Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM0nDFBAEmpExAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B03675C0EF6
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318252.1586696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJI-0000Nz-TE; Sun, 24 May 2026 00:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318252.1586696; Sun, 24 May 2026 00:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJI-0000Lx-Lz; Sun, 24 May 2026 00:03:16 +0000
Received: by outflank-mailman (input) for mailman id 1318252;
 Sun, 24 May 2026 00:03:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwJG-0008U8-C7
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:03:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwJF-00BC9e-Og
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:03:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124008-e002-0a2a0a5209dd-0a2a4503cd2c-22
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:13 +0200
Received: from [52.101.125.93]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12403f-672d-0a2a45030019-34657d5d2f13-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:13 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB7274.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:439::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Sun, 24 May
 2026 00:03:09 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:03:09 +0000
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
 b=bbMPEwJbRaFnrcaQgbQ31+GBmkN1wqmv1jN0WiLSbxZPGxK1gp8UiazRoQMkIp8i/+s/AHAZiWuAQbx0AVfiE9bMCXZeG8GJOCwCE4mC/Bh5fSeU0GW35rCtC+ehRDXOOuNPvgTYNZI5wElzYnRMNpQVfjgejI/44xisxTjFm461xE+sw2vqvEa4mPmLCEsAILwxRaMrbI47U7kwoWUPWt4wgiiVV2A50QrDSXP7cDQIveRbNXnmle3r/xiIGomolfIH4OwzVUxkgymEPPB5B6+bXntUKdJLBHKEup8c4a5GKXKLeV42TDWZsc7gxqQf5JKqjv0uxQJN0jp2+FXBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFwOGfPyzWG9F7U0qyfrx8XENPksC2lqRTWEjzBLvZU=;
 b=kwOPPbsOkm/Ym8+lBSwC/G52Fk4zYAxLa8TQYhx37D0vCymYWlMPkquAcugVmeHP8PQBV55KgTnqE1DllSxXNtX3DZlXobiWLG1gS170SX0lKLtT6JvFCLTJmio40i6AtIuCTZ1w1ro3VshMvG96ltxdn7c1dUGbvwNmqGzE+0ZaQOnpzjd4s7GeYHJOdY3qVOd/EKkGcci2yjHuwKbnMBSbgsZnbzVm6Yo7G74K3/QfwEl6CITn7jmAZm6gYNkDfxiqS/cm13SoaOTLc9l0ksOb3OwcmYwk3BXf3S3DuZlLzVTdIhfI9o5CqeKdtTnlaOGQgbJ0HWE6XSNwp2iqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFwOGfPyzWG9F7U0qyfrx8XENPksC2lqRTWEjzBLvZU=;
 b=G/HDYjA3qlKlYyAsK2txh+Z3qcTQjx/KAbLnYfS4L4VKBWDbKBW+KMFuMsFBBE6BxcL42fWlgL83IjItGZvUWdlQCDZt13tqUoR7DjVHPDx9j5qZ0GjzmW6rPTnqnQbTY+iQ+BXX0ACGo/rCs4Jmd3MzsG9LN5VM2csWeH3AJ/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH 19/21] xen/arm: Balance Dom0 memory allocation across allowed NUMA nodes
Date: Sun, 24 May 2026 09:02:07 +0900
Message-ID: <20260524000209.292370-20-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0190.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::10) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 3771ee30-d235-430a-b1e8-08deb927d71b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|1800799024|5023799004|3023799007|6133799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	J4cYOY36nVc8IgqOLKu77NZZ7gIulWg9ummMo+vDp8Gfdo+1N6L4huyxerdC5I4pc4KcoKbPLg989HVsctm8IVdIK/I3KPRonRM712B2hmrhxkvvmdLTWg62eIvyrJx+VpqqU524pw/Z0efbQ0/yu+8gQKjl14gFYxE4JfE2JldZ+j5gF1QFHilBX/zIwMpkkpFbuM9zC+uQMcUa59p+5OCz5AM4aEb1ixUW2lwoUaGaQ5SWnTAU5rLgy/XfG6dPY8Se0hIxezCPTEPar5TeVDHaq6b/kF+B4PbUKGM6lA36kXYjoS/nyQBwxzHklXYZvcGUYh3b1z1aYFYj+rDo6uK9KmqWl1imDS31M0ECC46m7o1VjLq6Dx8hF1jYRVxl9fnV8q4Vv/Q6jBgjct946JkOw7whwLgiiiJdrFOm5vKjxOvvPOxx/lgcNku3kHD+zW76Snt0tfILFYn5TFLnX1FYCKDV3dcLCWoYbUmQPvICDvGPiIN1BGd/7NplUBfoj4ODySnnzjDXyptDn4k/RDknTA/99Llklq6l01zCng2GOvjgioEiCIXkIigdn1gqvwVR2pFsXXQ07Cqtd2dCFLF/6qEXD+5EMMDYeNn2oP5vSkoznbNAaSgfgVPvmpw/nQEFE3qeNsRUKVnB3uY37f7TlfXi0ar7S6Dp/mcFz84pAH6RqwTNuvoIZ3C236p8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024)(5023799004)(3023799007)(6133799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QqbSxH24mN1wUTXhdw8ewsA4mv7ANKQoQ0Zyw58BBgz5IEn2XT502vXh5/0m?=
 =?us-ascii?Q?IIkdstchwoiTrL56j3jwGTeC9ZvLYdgFppkwTtba9bXZ5qEO4ye30gLOp5LC?=
 =?us-ascii?Q?lf2Vbcrg32hstmp36qGFyJtJrH1aXxyLh3hOlvcecWGO6m2NR92OQHNF8atM?=
 =?us-ascii?Q?ROIg883OKNp/8bwCY+KX/mU66I/4bMAerRAxATL8acH0l6h5uTeJh++WTxcd?=
 =?us-ascii?Q?oLq1RPC5E4G4a7/eH+5jJGYKmXapIa3S6SBW1HJ3mAYIpNgR83BGjPtO4T4I?=
 =?us-ascii?Q?d7thqsrrpwZ7cHdkxXd0onnshKZP5c8MPiDeO165SgDjacoJZC8jLIwGGTQl?=
 =?us-ascii?Q?IsHvT2cvt/FYzEfzzj130IOGWZItW0mzIZuIGsSwTATwXc5EDvTQnQq9sszn?=
 =?us-ascii?Q?fvPI++NVecYKowuSZqZeGzh4uONbL6COTxpR5g2Qj6rRDtrTuXc3SWrbaC68?=
 =?us-ascii?Q?BphwtLIJrvLMlm/6BVcLXBtEHTi2Skdam8NAm6CRA3zM5se6yYwTO1Jz4C9T?=
 =?us-ascii?Q?TImZC3DnIbv/6tbHOJ/Ys9rGQfHtDGhTsOBsZBzzeEOhbTQcS2VNNFt1DsQl?=
 =?us-ascii?Q?1Y+/2GDNDcSuv26AbORq5Pwn34/82kH8WkqGAUnXw2Kcnkn2PGgUKe13a03C?=
 =?us-ascii?Q?GwitU8StkT5DDyOVcuuHh3DrZOUpE0g7U6ex7OFu/+ZijfoVhNthTjmDaBEz?=
 =?us-ascii?Q?U3Xq7EdunX8q1ig7VTajJIzLxGWXCN0A5+eOThX9L+BxjNhzHfdBMsgCZ6nY?=
 =?us-ascii?Q?stLszvTIZWl3hxZijiCoDUAPM0GyEHNz0Npfcm3NJP08pADgiYMual1DCF6a?=
 =?us-ascii?Q?WehjSTIyOJFHApimP+QDu+n+s8kxLdkT2ruzmTXv2GaXWLkzEufsRflB2AjC?=
 =?us-ascii?Q?+2+HRZUbLrudXr8Q35AkB0WjG/+csDSVxRMINUYOquwwrZoHTwHm83+LhP6v?=
 =?us-ascii?Q?fR/DnYmxZJXXtovP+VsiPZJeFpabARUBK2RUNj+wtkxw4TAUNJN8WZtSvKYk?=
 =?us-ascii?Q?u3EpYPuqrUV+Uj2ALAF8d5rjWNGPY4DLZrmY/Sgq7tFoJBjdceDKzxcoKxVO?=
 =?us-ascii?Q?p4sJNtsBwxXW/YaYSoB6v7kTEckaHfjtkrzY7/6lYf1IHipt7AJb1wZgC5Fv?=
 =?us-ascii?Q?j/Qg+ZdqVaqRLQL73ZV6UHwY+BCDmMFKQ/Xnme7OkQ5jUSe48gsuZoYiTwV7?=
 =?us-ascii?Q?1jkLew0BhdD+Tdosh+alJV5hVJcowb2LlEyTdXK07+0evLgWHao7g3/B/zm5?=
 =?us-ascii?Q?F8kn8QWXXWkcm/TseTlj/AxZqwxYyDE3mPrs/eaJZZ5XFbpuzEPm2e+pbZY2?=
 =?us-ascii?Q?AdIEn5sBEC+pG0TZFFYoyh+E6P+NdCfXP1WBEUpWnopN+t/zCBctSL7KdNHC?=
 =?us-ascii?Q?1aCX8N2RCQWC7tdWJTFpBei3VIFmslfeDZl4+spySQVbBgytxo0mBsYYAX1Z?=
 =?us-ascii?Q?MWRaj1ZZ/YHPm/Cyw13cSnH+8iuvUfCVAibWLCqs8NZS0Ez7dSiMlbDskPoL?=
 =?us-ascii?Q?XsueVgBTAbC+G9xuQNWbcNnaRLw/m9dXQTek1s8iEAajGtpsu1tCEf2SQb5J?=
 =?us-ascii?Q?syLTOSFVEDxFgRsB11gKMypHzGkL588lDNBIZMYONmZdXmqQa6vlenNKdtKw?=
 =?us-ascii?Q?7zGP5nGTM6wtcYhwhUUhewGz06w8L4mwjwr6PABLXtiXxs7EmBWNaANAphrJ?=
 =?us-ascii?Q?sxcRW+SCyRJDOFIuCgxYETq9LGNc2REeswlYMdnn8OKP/ACqqvK1+lynz7tW?=
 =?us-ascii?Q?MR3fTBM6ELPaUmGn3Sm/RGtNcp74iz4bxs7sKOfQBE4laf71bTaXpkkEWaj9?=
X-MS-Exchange-AntiSpam-MessageData-1: N8tkEqXc4sI4fA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3771ee30-d235-430a-b1e8-08deb927d71b
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:03:09.7953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Vuzhg4SQQIdwrDCTF/wLI9+wgp+bDPHoKjhMi8dw843E788/WJVpXu9X7u+YwaE9S6sEoK07gnGhhQhpl2Ajg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7274
X-purgate-ID: tlsNG-33051d/1779580993-3754F938-FA7CA0E2/0/0
X-purgate-type: clean
X-purgate-size: 14953
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B03675C0EF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allocate memory for Domain-0 exclusively from the permitted NUMA nodes.
When multiple NUMA nodes are available, distribute the allocation in a
balanced manner across each of these nodes.
---
 xen/arch/arm/domain_build.c | 275 ++++++++++++++++++++----------------
 1 file changed, 150 insertions(+), 125 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2bf4b37f89..7960dcd33a 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -180,33 +180,19 @@ unsigned int __init dom0_max_vcpus(void)
 static bool __init insert_11_bank(struct domain *d,
                                   struct kernel_info *kinfo,
                                   struct page_info *pg,
-                                  unsigned int order)
+                                  unsigned int order,
+                                  nodeid_t node)
 {
     struct membanks *mem = kernel_info_get_mem(kinfo);
     unsigned int i;
     int res;
     mfn_t smfn;
     paddr_t start, size;
-    nodeid_t node = 0U;
 
     smfn = page_to_mfn(pg);
     start = mfn_to_maddr(smfn);
     size = pfn_to_paddr(1UL << order);
 
-    /* This code is temporal */
-    {
-        struct membanks *mem = bootinfo_get_mem();
-        for ( i = 0; i < mem->nr_banks; i++ )
-        {
-            if ( start >= mem->bank[i].start &&
-                 start < (mem->bank[i].start + mem->bank[i].size) )
-            {
-                node = get_numa_nodeid(&mem->bank[i]);
-                break;
-            }
-        }
-    }
-
     D11PRINT("Allocated %#"PRIpaddr"-%#"PRIpaddr" (%ldMB/%ldMB, order %d)\n",
              start, start + size,
              1UL << (order + PAGE_SHIFT - 20),
@@ -293,7 +279,13 @@ fail:
 }
 
 /*
- * This is all pretty horrible.
+ * Allocate NUMA-aware memory for Dom0 with 1:1 mapping.
+ *
+ * This function distributes the requested Dom0 memory across the allowed
+ * physical NUMA nodes in a balanced manner. It implements a multi-pass
+ * scavenging loop to allow nodes to dynamically back up each other if a
+ * particular node runs out of memory, maintaining a balanced distribution
+ * while ensuring the maximum amount of requested memory is satisfied.
  *
  * Requirements:
  *
@@ -308,155 +300,187 @@ fail:
  *    below 4GB, so that it can be used by non-LPAE enabled kernels (32-bit).
  * 4. Some devices assigned to dom0 can only do 32-bit DMA access or
  *    even be more restricted. We want to allocate as much of the RAM
- *    as we reasonably can that can be accessed from all the devices..
+ *    as we reasonably can that can be accessed from all the devices.
  * 5. For 32-bit dom0 the kernel must be located below 4GB.
- * 6. We want to have a few largers banks rather than many smaller ones.
+ * 6. We want to have a few larger banks rather than many smaller ones.
  *
  * For the first two requirements we need to make sure that the lowest
- * bank is sufficiently large.
- *
- * For convenience we also sort the banks by physical address.
- *
- * The memory allocator does not really give us the flexibility to
- * meet these requirements directly. So instead of proceed as follows:
- *
- * We first allocate the largest allocation we can as low as we
- * can. This then becomes the first bank. This bank must be at least
- * 128MB (or memory size requested for domain if that is smaller).
+ * bank (Bank 0) is sufficiently large to hold all boot modules.
  *
- * Then we start allocating more memory, trying to allocate the
- * largest possible size and trying smaller sizes until we
- * successfully allocate something.
+ * The memory allocator does not really give us the flexibility to meet
+ * these requirements directly under NUMA topologies. So instead we proceed
+ * as follows:
  *
- * We then try and insert this memory in to the list of banks. If it
- * can be merged into an existing bank then this is trivial.
+ * We first calculate the total size required for the kernel, ramdisk, and
+ * DTB to establish a safe minimum size constraint for the first bank (Bank 0).
  *
- * If the new memory is before the first bank (and cannot be merged into it)
- * and is at least 128M then we allow it, otherwise we give up. Since the
- * allocator prefers to allocate high addresses first and the first bank has
- * already been allocated to be as low as possible this likely means we
- * wouldn't have been able to allocate much more memory anyway.
+ * We then enter a multi-pass outer loop that runs until the full memory
+ * request is met. In each pass, we dynamically calculate the target allocation
+ * amount for each remaining active node to ensure a balanced distribution.
  *
- * Otherwise we insert a new bank. If we've reached MAX_NR_BANKS then
- * we give up.
- *
- * For 32-bit domain we require that the initial allocation for the
- * first bank is part of the low mem. For 64-bit, the first bank is preferred
- * to be allocated in the low mem. Then for subsequent allocation, we
- * initially allocate memory only from low mem. Once that runs out out
- * (as described above) we allow higher allocations and continue until
- * that runs out (or we have allocated sufficient dom0 memory).
+ * For the initial chunk (Bank 0), we try to allocate the largest possible size
+ * as low as possible, honoring the 32-bit lowmem/DMA constraints. If it fails
+ * to find lowmem space and the domain is 64-bit, it falls back to highmem
+ * without violating the minimum size needed for the boot modules.
  */
 static void __init allocate_memory_11(struct domain *d,
                                       struct kernel_info *kinfo)
 {
-    const unsigned int min_low_order =
-        get_order_from_bytes(min_t(paddr_t, kinfo->unassigned_mem, MB(128)));
-    const unsigned int min_order = get_order_from_bytes(MB(4));
+    paddr_t todo = kinfo->unassigned_mem;
+    nodeid_t node;
+
+    unsigned int max_chunk_order = get_order_from_bytes(MB(128));
+    unsigned int min_bank0_order;
+    unsigned int lowmem_bitsize = arch_get_dma_bitsize();
+    bool is_bank0 = true;
+
+    struct boot_module *kernel_mod  = boot_module_find_by_kind(BOOTMOD_KERNEL);
+    struct boot_module *ramdisk_mod = boot_module_find_by_kind(BOOTMOD_RAMDISK);
+    struct boot_module *dtb_mod     = boot_module_find_by_kind(BOOTMOD_FDT);
+    paddr_t required_size = 0;
+
+    nodemask_t exhausted_nodes;
+    nodemask_t valid_nodes;
+
     struct membanks *mem = kernel_info_get_mem(kinfo);
-    struct page_info *pg;
-    unsigned int order = get_allocation_size(kinfo->unassigned_mem);
     unsigned int i;
 
-    bool lowmem = true;
-    unsigned int lowmem_bitsize = min(32U, arch_get_dma_bitsize());
-    unsigned int bits;
-
     /*
      * TODO: Implement memory bank allocation when DOM0 is not direct
      * mapped
      */
     BUG_ON(!is_domain_direct_mapped(d));
 
-    printk("Allocating 1:1 mappings totalling %ldMB for %pd:\n",
+    printk("Allocating 1:1 mappings totalling %ldMB for dom0:\n",
            /* Don't want format this as PRIpaddr (16 digit hex) */
-           (unsigned long)(kinfo->unassigned_mem >> 20), d);
+           (unsigned long)(kinfo->unassigned_mem >> 20));
 
     mem->nr_banks = 0;
 
     /*
-     * First try and allocate the largest thing we can as low as
-     * possible to be bank 0.
+     * Calculate the absolute minimum size required to fit the kernel,
+     * initrd, and DTB inside Bank 0
      */
-    while ( order >= min_low_order )
-    {
-        for ( bits = order ; bits <= lowmem_bitsize; bits++ )
-        {
-            pg = alloc_domheap_pages(d, order, MEMF_bits(bits));
-            if ( pg != NULL )
-            {
-                if ( !insert_11_bank(d, kinfo, pg, order) )
-                    BUG(); /* Cannot fail for first bank */
+    if ( kernel_mod )
+        required_size += kernel_mod->size;
+    if ( ramdisk_mod )
+        required_size += ramdisk_mod->size;
+    if ( dtb_mod )
+        required_size += dtb_mod->size;
 
-                goto got_bank0;
-            }
-        }
-        order--;
-    }
-
-    /* Failed to allocate bank0 in the lowmem region. */
-    if ( is_32bit_domain(d) )
-        panic("Unable to allocate first memory bank\n");
+    min_bank0_order = get_order_from_bytes(required_size);
 
-    /* Try to allocate memory from above the lowmem region */
-    printk(XENLOG_INFO "No bank has been allocated below %u-bit.\n",
-           lowmem_bitsize);
-    lowmem = false;
+    nodes_clear(exhausted_nodes);
+    nodes_and(valid_nodes, d->node_affinity, node_online_map);
 
- got_bank0:
+    BUG_ON(nodes_empty(valid_nodes));
 
-    /*
-     * If we failed to allocate bank0 in the lowmem region,
-     * continue allocating from above the lowmem and fill in banks.
-     */
-    order = get_allocation_size(kinfo->unassigned_mem);
-    while ( kinfo->unassigned_mem && mem->nr_banks < mem->max_banks )
+    while ( todo > 0 )
     {
-        pg = alloc_domheap_pages(d, order,
-                                 lowmem ? MEMF_bits(lowmem_bitsize) : 0);
-        if ( !pg )
-        {
-            order --;
+        paddr_t last_todo = todo;
+        nodemask_t active_nodes;
+        unsigned int active_nodes_count;
+        unsigned int nodes_left;
 
-            if ( lowmem && order < min_low_order)
-            {
-                D11PRINT("Failed at min_low_order, allow high allocations\n");
-                order = get_allocation_size(kinfo->unassigned_mem);
-                lowmem = false;
-                continue;
-            }
-            if ( order >= min_order )
-                continue;
+        /* Filter out exhausted nodes to find active candidates */
+        nodes_andnot(active_nodes, valid_nodes, exhausted_nodes);
+        active_nodes_count = nodes_weight(active_nodes);
 
-            /* No more we can do */
+        if ( active_nodes_count == 0 )
+        {
+            printk(XENLOG_WARNING "Dom0 NUMA: All specified nodes are completely exhausted.\n");
             break;
         }
 
-        if ( !insert_11_bank(d, kinfo, pg, order) )
+        nodes_left = active_nodes_count;
+
+        for_each_node_mask(node, active_nodes)
         {
-            if ( mem->nr_banks == mem->max_banks )
-                /* Nothing more we can do. */
-                break;
+            paddr_t target_per_node;
+            paddr_t node_todo;
 
-            if ( lowmem )
-            {
-                D11PRINT("Allocation below bank 0, allow high allocations\n");
-                order = get_allocation_size(kinfo->unassigned_mem);
-                lowmem = false;
-                continue;
-            }
-            else
+            /* Target chunk size per node */
+            target_per_node = DIV_ROUND_UP(todo, nodes_left);
+            target_per_node = DIV_ROUND_UP(target_per_node, MB(128)) * MB(128);
+
+            node_todo = min(todo, target_per_node);
+
+            while ( node_todo > 0 )
             {
-                D11PRINT("Allocation below bank 0\n");
-                break;
+                struct page_info *pg = NULL;
+                unsigned int max_order = get_allocation_size(node_todo);
+                unsigned int order;
+                paddr_t bank_size;
+
+                /*
+                 * Enforce a maximum chunk cap of 128MB for all allocations
+                 * except Bank 0
+                 */
+                if ( !is_bank0 && max_order > max_chunk_order )
+                    max_order = max_chunk_order;
+
+                for ( order = max_order; ; order-- )
+                {
+                    unsigned int memflags = MEMF_node(node);
+                    if ( !dom0_affinity_relaxed )
+                        memflags |= MEMF_exact_node;
+
+                    if ( is_bank0 )
+                    {
+                        unsigned int bits;
+                        for ( bits = order; bits <= lowmem_bitsize; bits++ )
+                        {
+                            pg = alloc_domheap_pages(d, order, memflags | MEMF_bits(bits));
+                            if ( pg != NULL )
+                                break;
+                        }
+
+                        if ( !pg && order <= min_bank0_order )
+                        {
+                            if ( is_32bit_domain(d) )
+                                panic("Unable to allocate first memory bank below %u-bit\n", lowmem_bitsize);
+
+                            pg = alloc_domheap_pages(d, order, memflags);
+                        }
+                    }
+                    else
+                    {
+                        pg = alloc_domheap_pages(d, order, memflags);
+                    }
+
+                    if ( pg || order == 0 )
+                        break;
+                }
+
+                if ( !pg )
+                {
+                    node_set(node, exhausted_nodes);
+                    break;
+                }
+
+                if ( is_bank0 )
+                    is_bank0 = false;
+
+                if ( !insert_11_bank(d, kinfo, pg, order, node) )
+                    break;
+
+                bank_size = 1ULL << (PAGE_SHIFT + order);
+                node_todo -= bank_size;
+                todo -= bank_size;
+
+                if ( todo == 0 ) break;
             }
+
+            nodes_left--;
+            if ( todo == 0 ) break;
         }
 
         /*
-         * Success, next time around try again to get the largest order
-         * allocation possible.
+         * Prevent infinite loop if a full pass across all active nodes
+         * yields zero progress
          */
-        order = get_allocation_size(kinfo->unassigned_mem);
+        if ( todo == last_todo )
+            break;
     }
 
     if ( kinfo->unassigned_mem )
@@ -464,14 +488,15 @@ static void __init allocate_memory_11(struct domain *d,
         panic("Failed to allocate requested dom0 memory. %ldMB unallocated\n",
               (unsigned long)kinfo->unassigned_mem >> 20);
 
-    for( i = 0; i < mem->nr_banks; i++ )
+    for ( i = 0; i < mem->nr_banks; i++ )
     {
-        printk("BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
+        printk("BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB) NODE:%u\n",
                i,
                mem->bank[i].start,
                mem->bank[i].start + mem->bank[i].size,
                /* Don't want format this as PRIpaddr (16 digit hex) */
-               (unsigned long)(mem->bank[i].size >> 20));
+               (unsigned long)(mem->bank[i].size >> 20),
+               get_numa_nodeid(&mem->bank[i]));
     }
 }
 
-- 
2.43.0


