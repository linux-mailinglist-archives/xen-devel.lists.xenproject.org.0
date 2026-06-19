Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id peI4IO70NGoalQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1579C6A4745
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=B3nmSa3N;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341742.1602092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzs-0006ii-Cn; Fri, 19 Jun 2026 07:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341742.1602092; Fri, 19 Jun 2026 07:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzr-0006fv-Vw; Fri, 19 Jun 2026 07:50:39 +0000
Received: by outflank-mailman (input) for mailman id 1341742;
 Fri, 19 Jun 2026 07:50:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzq-0006Wy-0q
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzp-00Dy3W-Dg
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:37 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4c7-e002-0a2a0a5209dd-0a2a450bbb74-20
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:37 +0200
Received: from [40.107.74.126]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4ca-5e53-0a2a450b0019-286b4a7e0f22-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:37 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB4024.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:185::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 07:50:33 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:33 +0000
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
 b=JJ9T8n4yMSbVQ6qtsu6OWyoQfnYu6M6eL7C7SUAcL+x4JrTR2i2hbqwbFgBqa3PyrF/xJsPyF4wl+3z8FUnJpfy+HG4ofhG2Ka7iI+TiANSXz3ECe6++swuP4idZaG5z4RNfZzckEWledoFCOgM953TMYXWYf114+jpha33MStnUWuawLeWOAb7JzftcE0Hg9DNdbNoInYrB9X3MzzBEoLjYITEL0GgId6fgUSVBmPewWaPLtFpwkqWkWpsR4HSLUnKFPG5M2OfsExEht/SkrniaGZeEnsP1eB+cvtfeIEwQtCRhqahETfGkpphf/VECw7VYe7RpDyW6/yAxXYy+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxE/LJsgLEOrbULLoyo2Fstd730hRv6gD0h0NlRuEO0=;
 b=Ut6C7UUfIPaL5RUJ8Xnf5DPnIkEAcQLTL7pNMxHG0NMOFbAL4PirOnYbh8b7mCtmThF4NfjEq8kwH0CPrcEq3/sxE7rDi8jKpwJU5y07NFFZNxQeSG7k26pECg7INeBSVWgdHl3m4cuvyz547yVcDKMxZWL27riD0jXji8tCWlQvwB1uriVylkfacpV9Q55gH3drr8j8JO8jGAe25u5dJSKUAq5V8IFZMddTtu2N0GQuruziG14UJnp76xfxWiGQr/uwX8dxSJqImJi+apnsa/BtPtQ/tS0kfDR+SftZHdOV8BZvgCdBS44hosIZOoa5H0Xf7G3pdQTB6fUp9p6YJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxE/LJsgLEOrbULLoyo2Fstd730hRv6gD0h0NlRuEO0=;
 b=B3nmSa3NToLaV8p7qD2OGRZBDd2HiocU81JnEo7UV2wJzumNkEZc7hGbkrsd6cTA4sSDaRc3o59/zi2iUBwvzbiKd2olaTmIpnAmpk87IEkSdubQimwdSNkw3YojuEBLzBramhR0/snEkaXsmwps17D5CKnmCEQR3BGlvdwcIZ4=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 11/22] xen/arm: Reflect physical NUMA node IDs in Dom0 memory DT nodes
Date: Fri, 19 Jun 2026 16:49:59 +0900
Message-ID: <20260619075011.377116-12-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0144.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::8) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYTP286MB4024:EE_
X-MS-Office365-Filtering-Correlation-Id: 46622172-f401-414d-ba13-08decdd7712a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|23010399003|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	67xne7Dn5mGa68qTM+JVO7esh0bnffZ5Wl/iUsGIW82Zj9d0LfTTfKDspA2ZiIEqEf2MHdfToxzJNAdYaqJ97Uy415s1uf+VlWPhxFNhYgeF8teuvgb+1fnWtS96j8AauX9fYRMYjajvcS8IEZ2BJ49Q25CwFlwlu6aZAvsqaJPySt2JXXwOVGSm6MQDEvz7Ih472mdiROr0qV7eqsAXHQ9smeZulnxYO2oeZ51262qzc3hcWJRsro8q1SfFdz7UWHGvOlEqNjgw0qy5Tn3Qh3CvZpaF0qefaPatFLKF1rBHnRMjLxjgtkTIevxgmoDzpK3gXhG/qlhSTNvd9IoUJJk4wgnXv0l+j9heUSkk6TQ0m84CZEMGl6FHMg3fAzrzOW5yjq7lU2AwqILL27TqpyKSgXxaiuarYF12fo9byQFtsMq2ne+XyNV+ppHdnuXLL/zuue9aEhzXW8qnb0n+PMiRH8xgXqME6gV9NYes/l6/LnAnUBGAyNTGJCI2stYNIEF+JN/kaxhFQf/9Jz4aOHjKX9eiZT6HBn2ss2oxgcGqJiMVcfYG5C7KVnxFJC7B3yWDxFE/nlK+p8aTfjDfo1zWVlUuovpFqUCSPns3f0iL8mYkY49NSiHE7JqtZzKWxrUfzG9Fbk9o74M8nKPKWCmhDKmKeIomToymT4RGavM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4YW8xV+kzBpOvSkwPk2JcwlPoVqv2p2CXuB8OFDSkvHYEtzVtD8Gcv+OmuBZ?=
 =?us-ascii?Q?1iwuDctleSzp50DvgtdcAaEDHjU+ukpsXxS1HZcQRklqjrc9rc9gDfMk/apl?=
 =?us-ascii?Q?MjnydvzJYZPdIRU+V0oKiqkVyy0+2xuLFSSAGF/9bU/MbRLINHxh+hYlSBos?=
 =?us-ascii?Q?wEFvWMSk/ciMN1X5wd9orVr6JfW2NwZcETnMuTvUa5UGfDPrYFXt95icUhck?=
 =?us-ascii?Q?z7d+oKpZDq6YqWU0rCVNsmBqQD9W9J7JszbMTr7hVzOFKn09XpZiRlYIsvnU?=
 =?us-ascii?Q?pBZl9syYiTEJbZs9kED3k2xlXZdJHASG4Yw+N5IF0ABeOsKVUe4C9A8UqxVo?=
 =?us-ascii?Q?jfsqvcSpO8ijxHIDO2WPyelvVbf2+qm+f4eg6pWHo0iln1z+CSlgKjZLJMSZ?=
 =?us-ascii?Q?owIGhIpKDz1NNeh895SLp6yV+FaUYT90vowZeEuJwAUGBVq2E2apLpAJJL2y?=
 =?us-ascii?Q?dUO14vJP15q9m2zuPpdI3yZtgIO/TEGJGQl6AYIh20ksQstekZxvWIicghcU?=
 =?us-ascii?Q?/Pzg0vV+A88FEf4TY+4StblesSVMJ07X01PmwiW+NCq/yZ7I57CUYPKhqZEd?=
 =?us-ascii?Q?iUGouhQDLp4Qi1QuxT9FDN5N0lZjgizeo4B+Ar4Em+R7/ZhZeqfx5CFOCS8M?=
 =?us-ascii?Q?1FfzB44bAT11Do1oMYJWhzd5q50XnZ+2ihEXZBUumNdTYWH50PWN3hndvtnR?=
 =?us-ascii?Q?j/oJAcEV07qBUsFuPbU5yn8TXeHd61h/BQHmD0FNrJgav6fLLxfayv5pohD/?=
 =?us-ascii?Q?687oaGKNEtfNde3i3RE5EdgFE1nc+OlqMgYlDpIWvQogna2bvkJCNoTSDs+P?=
 =?us-ascii?Q?kF9uBo0m7AwVgWulfpEYNHnbgoogP8ALGyXx3cLb9PkxxZx1aS1djToV1GKY?=
 =?us-ascii?Q?tZKmEA3Xalwx4hCDrfQGCUhJjKNU8ervYAq1aQU8bbpegICTW4sjuMB8szBc?=
 =?us-ascii?Q?n5AfKTeBLQ2ra4zdyT+vhOG6Yq0QDKMoquFEXVVFqW6zS8g3C1igBPi+IJbJ?=
 =?us-ascii?Q?sealPZ9ljjDNJmX1EgQv03GgBcfCxcRb3bpabq5XMsNNdasnh/xJ/adJtkVS?=
 =?us-ascii?Q?Vf5OK23OoUZtSjaNnlIdQ2lm8DyRa5izvokXX/VxG9WepBBP+dIXiXr3ojCM?=
 =?us-ascii?Q?ZoSN944vQunxxX44ZjENhL661TpdgkdM09vlAW9KCW6ocQ0E/zs/fboLdMq0?=
 =?us-ascii?Q?gLVO1HO1/xmQi0Y/9QYp+NV/JD3Et+GNBEpKnp/Beae/dLRf5tevc0i5Hsda?=
 =?us-ascii?Q?akhxRsbSC4sg7njDY3SHW9kybS/2soXAWxxmKg7TLq5p+FJqZDlVnl+Y86cq?=
 =?us-ascii?Q?hCoA7P+8zvV0MSd2iU9NZqUj1+OZ1XGrh1LIo5jiBi2pywtCNAxSgdYhnv+g?=
 =?us-ascii?Q?zSAoPH681PS3Ynk4c96GdpR2RFBAhyn+RZCB+3ogalHyQw9hR9couXUKApyo?=
 =?us-ascii?Q?OGTLDPDDWeHXoVkQT62pNpVgDB5Jx6nBtQQX1iwMatgRTBiJUETgjeIqjol/?=
 =?us-ascii?Q?WlrEuNJgYfHsoUuxS+jxn+2cC6Q9WiOJk+/yBPHSGKKa/MY6bdlYsR0ooLmJ?=
 =?us-ascii?Q?QkypDTosNbcG7BJwiFLFfVpIRaMLoVVid67N64h3qofiMgfisKW5iza/o0Lr?=
 =?us-ascii?Q?UFzU5EqrkPqAn6lPicl1RNHFdob1N0ERQ4Ea9Zyhqg/+ajg0CmYGR/wXP4yx?=
 =?us-ascii?Q?eJrl9n6wTMCDGMXfgJeuoG530hKuG4JvR6R2oFGg0b4nbPmM4s/DjC3Jq8g+?=
 =?us-ascii?Q?L891u9R1H20hpWZdedIw6+iFqp7tlNXm53Cboh2S0dP/okNq1C2LU465HQ9g?=
X-MS-Exchange-AntiSpam-MessageData-1: 84qGtomQo+JdqQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 46622172-f401-414d-ba13-08decdd7712a
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:33.4489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wMkl0+aSy6+1qB6b/UKkCB9hsE/tQvoFtk5etyF17GMDznNPD0kpfiqXNdHTIuev/4fSRUeKJwYYLAU2uJSjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB4024
X-purgate-ID: tlsNG-42698a/1781855437-4DDF800E-5B61E1C7/0/0
X-purgate-type: clean
X-purgate-size: 6863
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1579C6A4745

Extract the physical NUMA node ID for each memory bank allocated for Dom0
and apply it to the corresponding memory node in the Dom0 Device Tree.
This implementation maps the physical NUMA node IDs directly as Dom0's
virtual NUMA node IDs.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/domain_build.c           | 22 ++++++-
 xen/common/device-tree/domain-build.c | 88 +++++++++++++--------------
 2 files changed, 63 insertions(+), 47 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1dcb5b3455..7ad53d85b5 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -195,11 +195,26 @@ static bool __init insert_11_bank(struct domain *d,
     int res;
     mfn_t smfn;
     paddr_t start, size;
+    nodeid_t node = 0U;
 
     smfn = page_to_mfn(pg);
     start = mfn_to_maddr(smfn);
     size = pfn_to_paddr(1UL << order);
 
+    /* This code is temporary */
+    {
+        struct membanks *mem = bootinfo_get_mem();
+        for ( i = 0; i < mem->nr_banks; i++ )
+        {
+            if ( start >= mem->bank[i].start &&
+                 start < (mem->bank[i].start + mem->bank[i].size) )
+            {
+                node = get_numa_nodeid(&mem->bank[i]);
+                break;
+            }
+        }
+    }
+
     D11PRINT("Allocated %#"PRIpaddr"-%#"PRIpaddr" (%ldMB/%ldMB, order %d)\n",
              start, start + size,
              1UL << (order + PAGE_SHIFT - 20),
@@ -225,6 +240,7 @@ static bool __init insert_11_bank(struct domain *d,
     {
         mem->bank[0].start = start;
         mem->bank[0].size = size;
+        set_numa_nodeid(&mem->bank[0], node);
         mem->nr_banks = 1;
         return true;
     }
@@ -234,7 +250,7 @@ static bool __init insert_11_bank(struct domain *d,
         struct membank *bank = &mem->bank[i];
 
         /* If possible merge new memory into the start of the bank */
-        if ( bank->start == start+size )
+        if ( bank->start == start+size && get_numa_nodeid(bank) == node )
         {
             bank->start = start;
             bank->size += size;
@@ -242,7 +258,7 @@ static bool __init insert_11_bank(struct domain *d,
         }
 
         /* If possible merge new memory onto the end of the bank */
-        if ( start == bank->start + bank->size )
+        if ( start == bank->start + bank->size && get_numa_nodeid(bank) == node )
         {
             bank->size += size;
             return true;
@@ -261,6 +277,7 @@ static bool __init insert_11_bank(struct domain *d,
             mem->nr_banks++;
             bank->start = start;
             bank->size = size;
+            set_numa_nodeid(bank, node);
             return true;
         }
     }
@@ -271,6 +288,7 @@ static bool __init insert_11_bank(struct domain *d,
 
         bank->start = start;
         bank->size = size;
+        set_numa_nodeid(bank, node);
         mem->nr_banks++;
         return true;
     }
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 30a59abfa7..c3452a4037 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -504,15 +504,50 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     return res;
 }
 
+static int __init make_memory_sibling_node(const struct kernel_info *kinfo, int addrcells,
+                            int sizecells, const struct membank *bank)
+{
+    void *fdt = kinfo->fdt;
+    int res = 0;
+    u64 start = bank->start;
+    u64 size = bank->size;
+    __be32 reg[DT_MEM_NODE_REG_RANGE_SIZE];
+    __be32 *cells = &reg[0];
+    nodeid_t node = get_numa_nodeid(bank);
+    char name[32];
+
+    dt_dprintk("  Bank: %#"PRIx64"->%#"PRIx64" Node:%u\n", start, start + size, node);
+
+    snprintf(name, sizeof(name), "memory@%"PRIx64, start);
+    res = fdt_begin_node(fdt, name);
+    if ( res )
+        return res;
+
+    dt_child_set_range(&cells, addrcells, sizecells, start, size);
+    res = fdt_property_string(fdt, "device_type", "memory");
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "reg", reg, (addrcells + sizecells) * sizeof(*reg));
+    if ( res )
+        return res;
+
+#ifdef CONFIG_NUMA
+    res = fdt_property_u32(fdt, "numa-node-id", node);
+    if ( res )
+        return res;
+#endif /* CONFIG_NUMA */
+
+    res = fdt_end_node(fdt);
+
+    return res;
+}
+
 int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
                             int sizecells, const struct membanks *mem)
 {
-    void *fdt = kinfo->fdt;
     unsigned int i;
-    int res, reg_size = addrcells + sizecells;
-    int nr_cells = 0;
-    __be32 reg[DT_MEM_NODE_REG_RANGE_SIZE];
-    __be32 *cells;
+    int res = 0;
 
     if ( mem->nr_banks == 0 )
         return -ENOENT;
@@ -527,54 +562,17 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
 
     dt_dprintk("Create memory node\n");
 
-    res = domain_fdt_begin_node(fdt, "memory", mem->bank[i].start);
-    if ( res )
-        return res;
-
-    res = fdt_property_string(fdt, "device_type", "memory");
-    if ( res )
-        return res;
-
-    cells = &reg[0];
     for ( ; i < mem->nr_banks; i++ )
     {
-        u64 start = mem->bank[i].start;
-        u64 size = mem->bank[i].size;
-
         if ( (mem->bank[i].type == MEMBANK_STATIC_DOMAIN) ||
              (mem->bank[i].type == MEMBANK_FDT_RESVMEM) )
             continue;
 
-        nr_cells += reg_size;
-        BUG_ON(nr_cells > ARRAY_SIZE(reg));
-        dt_child_set_range(&cells, addrcells, sizecells, start, size);
-    }
-
-    /*
-     * static shared memory banks need to be listed as /memory node, so when
-     * this function is handling the normal memory, add the banks.
-     */
-    if ( mem == kernel_info_get_mem_const(kinfo) )
-        shm_mem_node_fill_reg_range(kinfo, reg, &nr_cells, addrcells,
-                                    sizecells);
-
-    for ( cells = reg, i = 0; cells < reg + nr_cells; i++, cells += reg_size )
-    {
-        uint64_t start = dt_read_number(cells, addrcells);
-        uint64_t size = dt_read_number(cells + addrcells, sizecells);
-
-        dt_dprintk("  Bank %u: %#"PRIx64"->%#"PRIx64"\n",
-                   i, start, start + size);
+        res = make_memory_sibling_node(kinfo, addrcells, sizecells, &mem->bank[i]);
+        if ( res )
+            return res;
     }
 
-    dt_dprintk("(reg size %d, nr cells %d)\n", reg_size, nr_cells);
-
-    res = fdt_property(fdt, "reg", reg, nr_cells * sizeof(*reg));
-    if ( res )
-        return res;
-
-    res = fdt_end_node(fdt);
-
     return res;
 }
 
-- 
2.43.0


