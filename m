Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GahlGer0NGoClQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8DC6A4704
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=alZW4t6U;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341799.1602172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU0B-0002hV-H9; Fri, 19 Jun 2026 07:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341799.1602172; Fri, 19 Jun 2026 07:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU0B-0002ds-Ca; Fri, 19 Jun 2026 07:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1341799;
 Fri, 19 Jun 2026 07:50:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waU09-0002IP-Ks
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waU09-00Dy7y-0w
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:57 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4d0-e002-0a2a0a5209dd-0a2a4506dc90-34
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:57 +0200
Received: from [52.101.125.91]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4de-b690-0a2a45060019-34657d5ba6ec-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:56 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYYP286MB6155.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 07:50:52 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:51 +0000
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
 b=GgpPST/KyND+N9IkKwWxU73BInLmcW2Ok8OwWiWPeYFOJkQY3BPlAIMkDRM4R/rBfz8/jVrFjmdcmEz5z5n3mTHc1P1kno/sa5qZ5JY514DVswFSZGhjdjLoqJ1KA/q92FUi+etD+xTrxxzTv6CE6CdUd/mChFr52NspTKpsRszpl5L8IsPfUpS+bDaax5rb50bp2JOBa+gPA911ZOCZQ5Z+OBRPI4g2mNVHeSGB3tigvUKJq+7UrJYYDBsIMWz5jezpEg7CgOZCDpmPzTRFn6ycfKkR5J+RgIiP4lCfRWiYtGQJUIMbAahK5lSJU4JbhjtwELiCYCqn+8Qq7SYDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSvaKno6wKGF5JB9lrdTQaier2MX8kOfEf4CgdZcZTA=;
 b=MFM8OShu5kyLEOXmumAoeRHWYHDHFv/+zlT1cfFJn1Tu53fBww5mAJBkCxvcKoQw8oH1fsNEgOJrQVqDGalA99AIJEb5ezKHlABsjfjaxD+YcqoycNzhqklTkn5MS0A3lF7iJVG+5qCrjk93RRkzC612uS2rM/5DNJsRxE6mwcMHwzjbmOLYzJQ3A8cY7UIwmLuBVoaw7qnL5lgdnsbqQiDD8Ag+76HUwIz67JASQzMM0vK5dtRVNXrOeab/1j9AUxiamiTUW/dSFOVHablHqdvEbdoWyDwa9NVJgQle3ysyuKY0ZPwPOPr3QuBqgw9yaqaZjKpTc6jLoLWxmf5P4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSvaKno6wKGF5JB9lrdTQaier2MX8kOfEf4CgdZcZTA=;
 b=alZW4t6UV9cfo20eBA19EC+4EKurM+Rq8ZWxDEY0nhKFdHKNDVofFtGnUc+8/sZDGVNCmqBz7dQcieFFqy5dBs5Caioj8iopl91WSrYGqHsT/z7MqehpxuqJs7qAYIlyw5CAlT2wTJhO9/ccwZt0OsiZAC0hvCwMfPuscN4C9Sk=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 20/22] tools/libxl: Add 'numa-node-id' property to DomU CPU nodes
Date: Fri, 19 Jun 2026 16:50:08 +0900
Message-ID: <20260619075011.377116-21-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::9) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYYP286MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d66ad6-c34d-4545-e68f-08decdd77c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|376014|18002099003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	oBNGTfBNGSjL6YbZPe7HpVzH7B5jOK1ZtJ8rHon19FRpvP/kOjG1Aiicw6BPqWRF5nEEC1VtVWJX256ZDIQ/ZbHRaxCmwiCVcdKOGg8y8pdmmfTq+gvd795t6Ot2XQkTJ491Hermv4Pcrw53wBEJJ2C6jtYbPFwiS3IWj4Ejx+8rd72OERolimLrH2dtI/zSwJuxLkYJ4cCVpixQy7eBKNvzJIJAhmw2woCZeLDZGnmoYb6NqbblyNwEmhvhCaRnigDLhS1anw7ixXdE2/K1d/Ei851bVPkoH+UG4v2X1ceBKqM/yMVt4VNCoqvtsMATiG/EsXBPbyxC6koyj8vtBqMQ3Knf/RmkybnRIOw1gEI5MvjuI4GZHKI7n6YbJ2YP9+uAiHHonDsG3q6HQIhFmKNLMo5Pcs3ML20CFwMQXywK7h/pccjGh3GwOnHXH7cpErOBYjStEy+EB4Qu1iysTchr0I17U2zdil/K+RN8D4hXZG2Y+x0i2b4lUfE5EtCjDD0i6OIDc5Jep+0F9+MjOanL55bMgROs9AhgN8H4/Ooc4pxifZXrZMPNLp09yArEuFzMBhxxBoag4mOB1LXAhnt1ySRDJ/MyII4MPffHJ8xP1OqfVQ2hg8gE2RebR31uRISJYkrTYPBGDDAc1zxyYA2ThAqWDn2P2v/R6Nqyhbk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0K8XUAkxO/BHtbKdrGK9J/41R9S/dC9dbrpi/xbLibnxkeHy6+mu8ARVGF6b?=
 =?us-ascii?Q?SyqhSfVby0hU2PH9/RO0iLAaBvvWOwWAbMhDvtXONZNrT+ZFWL6lkF775Idp?=
 =?us-ascii?Q?Un+MtGiNE496jwxFCNb/aCU1RQa8dkLz6RxF4PMlei24hPkeRZN5KBAeKbky?=
 =?us-ascii?Q?zWJQYPZ/Jy2w6GUhIgwWY+2+36g8PLenAAXwAN3L82MbpYXp3NyqeJdNIL/r?=
 =?us-ascii?Q?dQFr/GR+FQfr7meIu/2m6cmB4X/8CEXli+vH2nLqvkBDayR8UOVDASIjPg2Y?=
 =?us-ascii?Q?pXgsXBL8j72cRRUFlzQjYlb03qn+Id8UGbMy2pSGZeYuZSYPI0YGxKMrbA46?=
 =?us-ascii?Q?jPtpSy03HOIuRn/sKxN5gL3wDRdSHR8uaUUymOlRayd5F4BoxsK6211RwGf9?=
 =?us-ascii?Q?iVD9jdx1Wzp/1mm5SGd372cRndQhbZASJK2WSpnJ6oAAUO9049YG557Fve6i?=
 =?us-ascii?Q?YmMerG0QAoo7pYRk2r0REyrgJKL+uov4j3xkoBVcCZMwgl0Ci4T+D3VTOgD8?=
 =?us-ascii?Q?j3l9xW90Q1unQHXpPSiJt93riL19vmsfY/p240hgprvpc7Tsa/4yNKyDniNB?=
 =?us-ascii?Q?Wd8JA3m8JlSYFos9625nDVGvxbG10lMpoYkRH/1tb2br6Rb59wqCaH62O3yD?=
 =?us-ascii?Q?UPRuEyv4mktG6EDv0grarLdfVj/tdnTS3L1qJv8+NlLdkRfslIr9vWY/68d0?=
 =?us-ascii?Q?qGDhmUyejnq/6nppeLAyOG+jR2YUgDywVfc3gad9I1jqgozFcPdDZp0EhPui?=
 =?us-ascii?Q?CMSbpBYhgzYFT/qYfK3nnbTEV+fN3IwdtDR0XI9opsdY2BEGwKdySMMFtuoj?=
 =?us-ascii?Q?9Kofj62D1css7U3sFCupRmSozXnxtxxE+nH0u1UkqdVW2eNnmn39x8nBelDP?=
 =?us-ascii?Q?8Q0RnMS2+D25F1Hjduq90siyUcSraxmj3iZrNAT9wkGb4cmcOOY2l5Q6Ie71?=
 =?us-ascii?Q?F7uZrZLMJMfT/2biPw5TprBtnxb1M/1OlLKrm48IJ8byfGJnCDV1QPDfcwL2?=
 =?us-ascii?Q?gtgFwRQmZuwoYPscV/cXIrsHpojZGyzbnbAhDKh+yDWsCwWBWhxPgvE4sti5?=
 =?us-ascii?Q?8obaxQH/UfVljjaO4XaElWalM9+cTjAQbPzumeay9qjPnfY3cXRq/0aUNmh7?=
 =?us-ascii?Q?Pd2bN4fDKkiuEFSVtgC236WGyFB2aMTV1YcD60XusmYEwp9u9/+pWIDiiAIa?=
 =?us-ascii?Q?kp9aXX0PqqrPSZ/JQ3hLVmEH0HzvYkp8NbWPr0LfKkXDmRZL+RpQtYtg6KZT?=
 =?us-ascii?Q?jDLeCLUgcytF5phXG+etLidtiYwQlW+Kr7wNa76CIAeu5Qu0fDIkFZfTiEgH?=
 =?us-ascii?Q?i0YSPDvqKkJJao7l1nNbrWe29DnGCYC1wihmEOHPrbA69lsO1DJIjvQmwmdu?=
 =?us-ascii?Q?gMBsjEvoI3/3q9Z4f4NTAgqf8hbdGrCRWm+/DwE5gdhv10Yp8lO5xAV8h9y6?=
 =?us-ascii?Q?4mLkkugTx6IxAYedn8BChbHCucYETwEGqeFhAwpsgk2Q8v0FPVEuDq7Zxy7I?=
 =?us-ascii?Q?gDHiLzJZDBivsv87U9xx1SP6gllVTwrzk8h7aYAM1HU/00qPdvxYBPsE/m3A?=
 =?us-ascii?Q?DBEa23g+boeOTAb7H0cSFA7NMxQQsV9jPeo1R68br6ZQG9rU3tYTLoZNTSx6?=
 =?us-ascii?Q?ki4J4nvtL8tAmH/tBk0v+chu9PIIywrTAmMC3uIP4fObSz598yZgIJurQ1ax?=
 =?us-ascii?Q?cibTH6FGzsq/5DKskGfvwcJ87x8krNBJMPlu30Sp/0fgBCiDe0PqDRwK24m1?=
 =?us-ascii?Q?P48602Z5eGGDR4cs+Mj2sL9WJEdnmtYO/u3UQs9VQdBBa+Ay2rhXR/FvDLcj?=
X-MS-Exchange-AntiSpam-MessageData-1: +aUwm8omcbcWKA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d66ad6-c34d-4545-e68f-08decdd77c26
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:51.8491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDb7khJSqZHo0BKAp0Gi+s5nEQwGe9yCGm1drIy78Ju0JvGpV2p4TGTjXMtG7SanS6pHQBL0S4aDIy+U/dm8wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB6155
X-purgate-ID: tlsNG-16d1c6/1781855456-B13FD853-7FFE8061/0/0
X-purgate-type: clean
X-purgate-size: 2356
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
X-Rspamd-Queue-Id: BE8DC6A4704

Add the 'numa-node-id' property to the cpu nodes in the Device
Tree passed to DomU. This information is retrieved from the
virtual NUMA configuration in the xl domain configuration file.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 tools/libs/light/libxl_arm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 6eae33cdd2..4b0ed99229 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -571,7 +571,8 @@ static int make_chosen_node(libxl__gc *gc, void *fdt, bool ramdisk,
     return 0;
 }
 
-static int make_cpus_node(libxl__gc *gc, void *fdt, int nr_cpus,
+static int make_cpus_node(libxl__gc *gc, void *fdt,
+                          const libxl_domain_build_info *b_info,
                           const struct arch_info *ainfo)
 {
     int res, i;
@@ -586,7 +587,7 @@ static int make_cpus_node(libxl__gc *gc, void *fdt, int nr_cpus,
     res = fdt_property_cell(fdt, "#size-cells", 0);
     if (res) return res;
 
-    for (i = 0; i < nr_cpus; i++) {
+    for (i = 0; i < b_info->max_vcpus; i++) {
         const char *name;
 
         mpidr_aff = libxl__compute_mpdir(i);
@@ -607,6 +608,17 @@ static int make_cpus_node(libxl__gc *gc, void *fdt, int nr_cpus,
         res = fdt_property_regs(gc, fdt, 1, 0, 1, mpidr_aff);
         if (res) return res;
 
+        if (b_info->num_vnuma_nodes) {
+            unsigned int vnode;
+            for (vnode = 0; vnode < b_info->num_vnuma_nodes; vnode++) {
+                if (libxl_bitmap_test(&b_info->vnuma_nodes[vnode].vcpus, i)) {
+                    res = fdt_property_u32(fdt, "numa-node-id", vnode);
+                    if (res) return res;
+                    break;
+                }
+            }
+        }
+
         res = fdt_end_node(fdt);
         if (res) return res;
     }
@@ -1390,7 +1402,7 @@ next_resize:
 
         FDT( make_root_properties(gc, vers, fdt) );
         FDT( make_chosen_node(gc, fdt, !!dom->modules[0].blob, state, info) );
-        FDT( make_cpus_node(gc, fdt, info->max_vcpus, ainfo) );
+        FDT( make_cpus_node(gc, fdt, info, ainfo) );
         FDT( make_psci_node(gc, fdt) );
 
         FDT( make_memory_nodes(gc, fdt, info, dom) );
-- 
2.43.0


