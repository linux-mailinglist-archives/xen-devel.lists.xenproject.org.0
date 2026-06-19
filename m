Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1gSxFuv0NGoNlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FB16A471F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=Kg1p8imN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341788.1602163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU09-0002Ct-F2; Fri, 19 Jun 2026 07:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341788.1602163; Fri, 19 Jun 2026 07:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU09-00025M-21; Fri, 19 Jun 2026 07:50:57 +0000
Received: by outflank-mailman (input) for mailman id 1341788;
 Fri, 19 Jun 2026 07:50:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waU07-0001iO-7l
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waU06-004dWx-Kp
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4db-bab6-0a2a0a5309dd-0a2a4509a6d6-8
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:54 +0200
Received: from [40.107.74.95]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4d7-4999-0a2a45090019-286b4a5fdda3-5
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:54 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB4024.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:185::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 07:50:50 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:50 +0000
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
 b=ygEqAl0TLfLBtVXmteKuIEWkuNPQens2j/wc3PGSakNOzCyaqRiaWwu3MJEYVWfhDAxIMVDwd6WaEcdZ7s2Rg7BQ1ttWhwjIa5NqLEj+QsacuBroOKdbIn7pqn+ojmAZM7ley5dMtK5tt7sC9SU3Sr05i6IWvgX5zSJh0y/6wvzpwnATlpqDMjV2A775f5YyJGuKheocBtCX6Lh7IcybEgl+Ape0vlnYaL8UzGZGWw+pxv6HQMDKG1t451cQNS6BMMxj91RDFvJFXpzjEgN0m+0HpSIB+ExTfRw2NzbiUtKJX8tVX/1yP/jEvlSUpXD+xY91ESbNgmmHAmSf2pgjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7UlpS6apa4vpx3dkvWRk85jIONXnUZGoFgJW/UKF7A=;
 b=NYfCYn/6bkVPlx5ZHRmycc8vSGBZx5D8g33FQpT+FPVSi/CfjqXPyK8I+/rp1kr+mXmrk5qLM4M9J7+KQVaSzJv7zALo2O3lSG/fyJ4shTdllZgoC4H8ep90htzDDZWekLX98I6Pc1AQJk0O40fFx60mSd4lB9SsEQ0O4G8KxyY6v9LiA/gnA8hI09NQsjAV5Atmlv43uwPkVzkL6Gx/RFtZ0KkduJDPjDLiWD3znVQWfvn+mbiYK4rNlhFYO7xTau3QP/YOAIhRhs2oHpL7iuHQor1Rox3meqmicVDQAovEZO2J5mCkPR/rJmZRVUgRlUllnL0VDwqHys0CUWAiRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7UlpS6apa4vpx3dkvWRk85jIONXnUZGoFgJW/UKF7A=;
 b=Kg1p8imNZNDZL4Gw0NbRrd0+bINztee1qsJyMAVsX/PTuO+5uVlQit6m8HtV6yiMxn8/J2z8ISlxjz4oywLQjedzFuTau2k6Xn4CTxRiG+hZgY3w17W7/o+FyvRZAp4m6Lq8psZIpd7Rn3X7KaMGisYhwWrbRwFX0GbYzJ8zFyw=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 19/22] tools/libxl: Add 'numa-node-id' property to DomU memory nodes
Date: Fri, 19 Jun 2026 16:50:07 +0900
Message-ID: <20260619075011.377116-20-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::16) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYTP286MB4024:EE_
X-MS-Office365-Filtering-Correlation-Id: 476c450d-3a21-4c01-7fa3-08decdd77b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|23010399003|1800799024|18002099003|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	lJ++pdsUneYnUqSJ6pVWSjru69IiCKHYSQmjAfaVxgKGDh3bpCPnCrqt/wnx2311RQP67QHvAuATGwR6ysM2wXB4n5HpBidLKkV/Oq8EZTG8nAuqr+rZ+x/+glc1C2UZyP5DymwcUP5hfcRZsIMNx/sccqiM40RdBccW3S72IDgEbkJRPYT5Zw5eXLY7XxyZqVzxdZ46rSdJB2Ec1ZxnmZxXJCkwytayRmSeMHb6fDpNZWf53XAFN0os6zk3+ACWNCM3QY+rC9hZ/58LrdrvgBs9CSR9BAiuRP7ExBV6zy+ADNDHSL2PVCAoHxRjeRUQTEc/V//1pWpi9xoVhpfsYCBUeWat8Volzip3RMj7GNUr6t9WEoZIonRXRIv8KE7C/CX3NdmsEbHm33ptgc+lJ5Fa04riWa3wYaOgcNUoOTft8M5Bff1iNyx3YbP0rg7lRd5dv+Bekj2JxrvLez9sR9oiwaMcRqB8A+cby8TmXXgNV/WsH9DHWrhM7UnGYDEGLp7Kbz0O1La7WtsLvmtxBWkMfhv1l7p/mrxSko5quIFDVA9YY3QFrJO3UBbH/U5/GKJPcIBpc5pOy4sI/wnncah+4SBSLzsy1YN7d2Bwt5c9yP0F8XrDhCIlh4NNVvEnfabcExOIWHweH7AUevuDwjvYFFno0nZO9zbtNY3Scxs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CjmWsd6Xmv0AHw1u8xatLJeC0B+I7/FDcRdd32jPKSIcgDHv0SDfRj0edgiK?=
 =?us-ascii?Q?tl6mQOxteoEnGj/BCifvTYbY47r5FWKxrpFJRc7zcscI+0iV70ikN1DW4u8T?=
 =?us-ascii?Q?Ou6VR+qB3H8MbrCQ2lVV5utE1GOTfYk9lAUIOZru3r91eG6cjCUfTdC+eUSX?=
 =?us-ascii?Q?IiTBQEEqEK9C4JfirSPXVMHrVxWk86PJBv6opdVnZVL1ZjLH9NJYn4ppMzUK?=
 =?us-ascii?Q?rkxYEfNjvBrqTsDBs/dRu3+dKOz5V+sp7I23vLNRaTMQC4qJ86M6BanD5oY8?=
 =?us-ascii?Q?IqWHh+dwuO3LypThSroNqm3OdJo4XfalqqCLo2lH2J0ZdbNWMEXQZSI5Zv/q?=
 =?us-ascii?Q?E5eGYfeAZT5NNtWOghr+OLrpmrOXyxVdzdX82SpUOCHDafI6byY5turhZT8/?=
 =?us-ascii?Q?vptLE32zUHkiZKf7O64ln3WixIyuZeCLmYsPsC6kBLxfMYNVnN6ZhXcsZrcQ?=
 =?us-ascii?Q?1LyL1MzalsDrK2ItgAVw0oxvIMjeE7gRVKI4Fb3ZuwNZCPae5ATnKnP12nB/?=
 =?us-ascii?Q?PAgIaJAiX+iYMgYkxrpgiKgn1vTkB1+hooONcD/DGDY+tRu3XtpcmKkgqCp9?=
 =?us-ascii?Q?GyBQYfy89WJ53zJwXxxa5TEjHDFeimy982KgGoDSdGgSho0NYnFam3KsDbHn?=
 =?us-ascii?Q?80VOjTH0YYVugOwWaHALyi2rBHKLj4d5IfnJiVLhCmSO360QDbOkb1dRI49L?=
 =?us-ascii?Q?4lSb4PviL1WU10Rsgjf+RV8LNeAmOj2Bb4xpeZ3ChhIcb38BYZ1nqfHJHuQI?=
 =?us-ascii?Q?pZGsqULUlDz17oeJZrPcVG5k4T55QLciy+oQ6zTAgS1b31JvFHqRkChCJqBq?=
 =?us-ascii?Q?MdsSkEof2m0VoBCrctMnPJJ6isI5m2tygNlMkYBpe54UjfYc6sRMriBa5U7C?=
 =?us-ascii?Q?lCOMRzC8zqyxmBSdRRHEx/A0mOSJsXhln283gqsOFaV3GmH0na5HIWG4p1nH?=
 =?us-ascii?Q?gdwLNyWxxIBWO+SbAOtwm6GF+koh7XO3riu/KFZI5WrpQJKvbr7IUJ+cPQob?=
 =?us-ascii?Q?lVmqTGBg4J8GjoHR4K29cyR5qkcu1Y04ptjZjpTv4bqoF+4O97i15p9SrvFf?=
 =?us-ascii?Q?b4Ce0YFPVOquAJY2ut7O3P9fU03o5ebcFTYzeL4tBAKCVyIzV0b2KGIi71vt?=
 =?us-ascii?Q?l6hDIIzzJ70FMxxcVeMjK7VdZsO1/D4elf4WuJVArKEQ4NB2LvknscMDDmNh?=
 =?us-ascii?Q?Q7OlR9HKkSAt3rt3d2w/kgQC3dKPIgLcaJ7AHoOHJlNfioOmAcSjGdKK1+gB?=
 =?us-ascii?Q?pLo9BsEFNSHuydxAmVBBpVfLv3c8YH1osrD/RRNB4vqIlAhTUQ/puyFkPGkZ?=
 =?us-ascii?Q?oLEmiDjDhpJMIbjUCVM9hIV62d9PHh/Vo92SjvAFhRqTfXXQJ0tnDNlfjAg8?=
 =?us-ascii?Q?IBKYuo2qwZ1ZLmuejFmwJjRc1ZuLvvXx0kJ+srNDYL9ZGOw1I4v3sUyor3yX?=
 =?us-ascii?Q?RZV6dMeLaG1wk/8tkc9Hdkm0BciGIvx5WjrTFKNWq0YykWxGta76/oPJfynB?=
 =?us-ascii?Q?ctJNhFQn0jYjMsKyWd79/Z21MjToxvHU0FVsbsqAGEqdlexZZuDGWH8opXXB?=
 =?us-ascii?Q?JWderPdacYAQKawW6zFRVJmOvK53INhsQLMgWuZVAjRVueEDIMrEA29kVAXl?=
 =?us-ascii?Q?mt4PrCfYI/Ab92KprzG+rkzYdJlxyOs52eqyo+IuBHBmXJEyHUEKxDoC2yQi?=
 =?us-ascii?Q?ujaztKsMWHuWgwdU5LnokqRqVALQgU0RZAqKCcbwLh741DQnNsnmEojp/UkF?=
 =?us-ascii?Q?Mwk//363PJ+fyHO+0TEU+aln6yPGg0myJrV5Ns1+xac5Zb7nmA+gg9kaExbS?=
X-MS-Exchange-AntiSpam-MessageData-1: YtCIvSH9n7gQTw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 476c450d-3a21-4c01-7fa3-08decdd77b0c
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:50.0339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZYNakjY/P81VuF+0VFdWQ3l+UFSyRuWjBzd7yPlvvxNaciHim2vFJ4zMDS/JlJSdljlzF8nWgolG3RhpiVa7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB4024
X-purgate-ID: tlsNG-bad1c0/1781855454-F6BE6744-B1AF2686/0/0
X-purgate-type: clean
X-purgate-size: 3897
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
X-Rspamd-Queue-Id: 09FB16A471F

Add the 'numa-node-id' property to the memory nodes in the Device
Tree passed to DomU. The NUMA node to which each memory node
belongs is determined based on the virtual NUMA configuration
specified in the xl domain configuration file.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 tools/libs/light/libxl_arm.c | 50 +++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 7e9f8a1bc3..6eae33cdd2 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -670,25 +670,53 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
 }
 
 static int make_memory_nodes(libxl__gc *gc, void *fdt,
+                             const libxl_domain_build_info *b_info,
                              const struct xc_dom_image *dom)
 {
     int res, i;
     const char *name;
     const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
 
-    for (i = 0; i < GUEST_RAM_BANKS; i++) {
-        name = GCSPRINTF("memory@%"PRIx64, bankbase[i]);
+    if (dom->nr_vmemranges == 0 ) {
+        for (i = 0; i < GUEST_RAM_BANKS; i++) {
+            name = GCSPRINTF("memory@%"PRIx64, bankbase[i]);
 
-        LOG(DEBUG, "Creating placeholder node /%s", name);
+            LOG(DEBUG, "Creating placeholder node /%s", name);
 
+            res = fdt_begin_node(fdt, name);
+            if (res) return res;
+
+            res = fdt_property_string(fdt, "device_type", "memory");
+            if (res) return res;
+
+            res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                                1, 0, 0);
+            if (res) return res;
+
+            res = fdt_end_node(fdt);
+            if (res) return res;
+        }
+
+        return 0;
+    }
+
+    for (i = 0; i < dom->nr_vmemranges; i++) {
+        uint64_t start_addr = dom->vmemranges[i].start;
+        uint64_t size = dom->vmemranges[i].end - start_addr;
+        uint32_t nid = dom->vmemranges[i].nid;
+        uint64_t regs[2] = { cpu_to_fdt64(start_addr), cpu_to_fdt64(size) };
+
+        name = GCSPRINTF("memory@%"PRIx64, start_addr);
         res = fdt_begin_node(fdt, name);
         if (res) return res;
 
         res = fdt_property_string(fdt, "device_type", "memory");
         if (res) return res;
 
-        res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                                1, 0, 0);
+        res = fdt_property(fdt, "reg", regs, sizeof(uint64_t) * 2);
+        if (res) return res;
+
+        res = fdt_property_u32(fdt, "numa-node-id", nid);
         if (res) return res;
 
         res = fdt_end_node(fdt);
@@ -1365,7 +1393,7 @@ next_resize:
         FDT( make_cpus_node(gc, fdt, info->max_vcpus, ainfo) );
         FDT( make_psci_node(gc, fdt) );
 
-        FDT( make_memory_nodes(gc, fdt, dom) );
+        FDT( make_memory_nodes(gc, fdt, info, dom) );
 
         switch (info->arch_arm.gic_version) {
         case LIBXL_GIC_VERSION_V2:
@@ -1716,10 +1744,14 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
     if (res)
         return res;
 
-    for (i = 0; i < GUEST_RAM_BANKS; i++) {
-        const uint64_t size = (uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT;
+    if (d_config->b_info.num_vnuma_nodes == 0) {
+        for (i = 0; i < GUEST_RAM_BANKS; i++) {
+            const uint64_t size = (uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT;
 
-        finalise_one_node(gc, fdt, "/memory", bankbase[i], size);
+            finalise_one_node(gc, fdt, "/memory", bankbase[i], size);
+        }
+    } else {
+        LOG(DEBUG, "vNUMA enabled: skipping memory node finalisation as nodes are already populated");
     }
 
     if (dom->acpi_modules[0].data) {
-- 
2.43.0


