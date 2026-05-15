Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKxMKkOdBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EDD549276
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309492.1580572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjuj-00057c-Vo; Fri, 15 May 2026 04:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309492.1580572; Fri, 15 May 2026 04:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjuj-00052z-Pg; Fri, 15 May 2026 04:12:41 +0000
Received: by outflank-mailman (input) for mailman id 1309492;
 Fri, 15 May 2026 04:12:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjui-0004xX-Mx
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:12:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjui-000yVE-38
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:12:40 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069d26-bab6-0a2a0a5309dd-0a2a4504b2a4-14
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:12:40 +0200
Received: from [40.107.74.93]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c44-1dec-0a2a45040019-286b4a5dedd0-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:39 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:34 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:34 +0000
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
 b=EaMLNYa3RCkFZn9Ou4MuWZ+BQTd/LdhEIwfzfGqgN7UErUp8lTxNkvaWhju0Xt6Uli6fnfLkGGSKT2FHTdc2TdOlfwJK/IKiDnMzjH6ZRluf7ySroD5LfIE9zoazbLZWp3Wku3Tk8yOxI47yDFB5i4NI21efzHz9DD0HsZ+vTek+wE6nsdujp63chsFClXviI3y9Uscn/9Td68YsDzAhOhycqumaspe5+BqUimkkkmWDQdaHZF/gwwQrKATl7QBSoeCjsMKDPtHulpQL37mHhrbfvCo/4feGOditlqmRXel3WUtRNKc8zE6SpEBqxAimTqvakmzNEexRNfoAjRHOnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEdXsCdriXn7T5hiFjbS6jzjWemTNnbeU0cz8lWbPus=;
 b=PrDcd/wYAL0OdhAwxUSTkPisMnEu/FSLf150+HLudg2uwI8a9hPlLfcqoeVqJkZekGRwHQjM81/hTeBkY5QutHkZ5gnl1VWb0adoJVlgLRF5drH5keN2amwF6FUMqqdcRjnqXW8/BtDWnuwaGxerCXA+RsTfuD4btZij7iuuvBG37TdelvJSwyBO+HnO/ChMTW5mMID7Fsivl+FELVA+z1GSIcZhlTZHYrlzakSOts1vl+MHIzHnHGgJAeBdIcxet0HSgLz95ermsOqu6iCpWoqRzQ++RBWofU0hvWDnXA3ULKZE/FcaTzFIEnqzuray3eDwGmIfnJcuhKb5v31bMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEdXsCdriXn7T5hiFjbS6jzjWemTNnbeU0cz8lWbPus=;
 b=QR0/ATtgGo8OYIdmXHLZdPhHEHQY9X6s6MnP1LAyHZTlZutJNZDyIUO69VKuU0kcJ95eqKK6+eBK8JODa7XYHoWcq9LAKW4XgrSWpJgYI2vixzdYi2F/kS6RV/xhY2FLAogSeiXvHiNZRH8qTymX282mwr+WRm5+nD5aHNcF3fc=
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
Subject: [RFC PATCH v1 17/26] xen/arm/cca: populate Realm DATA granules
Date: Fri, 15 May 2026 13:08:03 +0900
Message-ID: <20260515040812.983626-18-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: e605dfe3-f4a1-45dc-bca5-08deb237a07a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Bj2zXttabehEEd/UdabDsCpV2yv5f/IEvr1gxNje3iBuAL68C8lwVfj3B2hxvBysQPnPHXTVf19owy66K/A+HlJJhwxNBkBLme2t4lyzOnErs2kv4KEkH4TneUglebPLPVfguP2WdjCrZ+J78Hj0PvkB9lZmBy/qytngxvRaiqgRJZ2fj+xRz3+9JaE4Iohndmil5Mut2T4SDNengq6ex5BxoZSubTF7cpr0MkyoZsl3BfADa5k5GyuXPQjYyHR8N+OTYTz6LHrJOpf/OY99+r6l0Sir1AzZ2KKjKofGyjBhaMfa6NMEvF6JnBrDgttOCA6vX4IKeX+EGWxsPVEj6iA21/akOn5uFOWrMSyH4QQYjLZID3HueaYRPdFQLYPupI8h9cvENh28bSgcDgJ+rbvwQGgshZ+aOKtoIb2rBPuAP6cAAuO+9kkZy40dhkYyGgaCZ12U8/MY/XQudO2qqNK639cP5krLfEl5rmKfRoFKYJg//d2O5uNEkMNU/6oTmsyJ70l7FotsWgMiJQd/remU/UP4Iu9DJnrw6m2uYVbjs+Xci9RCajlQmQ7zHifI4Ef3fFCqMyuTMtdCv8c2G+Sg8Le1TtMwD1RJmXujsGDkrYDtmlowDqfFm3QhQku70lZu3iZrsjoek2gNFUu1PezVqwZz8I/8sLRuU8/6yc6aFMpPs9OL47H9iYSh7Thp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SyVUP4/IPCsdCMd15WMwfOp+ZtHVhAQytaLtho/vz5+nIYaOQNkjPHQrv4Of?=
 =?us-ascii?Q?v0/zSaGiK5PGt4aS8bnSVVF6MSH8yXbiLpquigqbfqAateOcHPAdIrp1lvC/?=
 =?us-ascii?Q?mtwu3yb8q1eE89tfvdhLIyXfITDubbj82JumzIAves/82FA+LXBmSp27s519?=
 =?us-ascii?Q?yWobfVVkgirMHB8GllXo6n7HWIXK+IVkwfSz4sUdI0AVDnuifejq5wa6fSEs?=
 =?us-ascii?Q?fVT8cf65f4GK5CHTpYzr890ntSb5p4EPCa5MqBSQwN+R11OAPuaqHf1UiQCZ?=
 =?us-ascii?Q?+Pi0fCmrLLknY5xtMmA1dG9YXu19jqTWEPiAnDXEZpsLbmWfcKYt6qgV6b+j?=
 =?us-ascii?Q?gx1mH7C879caBF5t/t3XdtBf7fi35PPR6e6M8yZalex3k7Kx08yFFBIIhMZV?=
 =?us-ascii?Q?yBYaMBu4QDomoPjBczDmv5SxEIy0TxuxCGkbUmOZJP2N4ZZuWj88tPIsykyg?=
 =?us-ascii?Q?6n2BmINIvlKzqhxCyDognHuf5794WLM/vkr7vG3r6fcU5Y2wE3pG/dUfcVho?=
 =?us-ascii?Q?TnAyfd19+duh9oU0/BOIRugklyOt+SZto/Hi8w7nX7RXdrqSbim2YNkuEdSk?=
 =?us-ascii?Q?zDK4GLJQB1AZk44wPNXsd+OkAKqagsQp45XOEHbt4ouGORwmQN/j7X3PQviL?=
 =?us-ascii?Q?UG3mz9Zf+9WLTK7ilu2nQQX1YLMN5u0EDES+KEkze0FYQ12slkDdkMXIrb1z?=
 =?us-ascii?Q?sOpuP1Hr17QbKgkvfJUayZBu7lUeALMcZXCwzRKP0JN/FEe6Nyb75LS3dF4e?=
 =?us-ascii?Q?hKSn+R3TuWifrLxNSNjXuEudXe5I7X8Z+BNhPYoRWmjZV6gBBoinmFxQ8ZNG?=
 =?us-ascii?Q?4u+s8/oeJKseAQqjs8zrDtNeD4d0q3jYVrzVbIEHAqKIrq6tXGEGOtEkFWHf?=
 =?us-ascii?Q?Aej7217mVbeZ+gefweaXv5Sa03P8vgiTxTRZWcJuUPBxDURWigptznPr/LLv?=
 =?us-ascii?Q?z7/yRNjX4UG+ng6+OZ3taV5wt3lj5ilYvuMluOTuIb3j4DcWSyCknn1GIgos?=
 =?us-ascii?Q?0NShI8peRT9eFMmHohjF/awqcp7MDzBvvIXUyJcdeDWff2P6P/3tkr8vzT6g?=
 =?us-ascii?Q?/b4a0D8PGmiDi1EH3koJBm/z8KsaY5BOpFdKFSbONy8QZUQLG8Tvy8mlUlYe?=
 =?us-ascii?Q?OP8yWFwk7KrUoNAXBIwXUlcC6EHnFl4giGAkvQAN2/WlImLj0FVdtIhfdozy?=
 =?us-ascii?Q?R0pY1H0fBJSlLosYAqnd8a1Nus4JhPU9NPgBL8EGOKQMjh32qf0yZU53P7lI?=
 =?us-ascii?Q?hsKzPjZ+bOw5PjxtAHu7XdHYba1BBLUpXqLHlwOSB3D3VUrq5zFDKg5MN33A?=
 =?us-ascii?Q?JwEqL8ZjHaP7y4G+6PZYICzUuKZFngzacECOpt0jhUPiIW5PZt5qhMyOL8Gv?=
 =?us-ascii?Q?GnnAh5C9Q1N8DpVZTZuu3LNUtNBunY4GolGAafy5/By9Ui2JdguoEiLOaPuo?=
 =?us-ascii?Q?w1moMOQ/LQ3R3a0z22IAANsne+oHA3bQ1D9UFagHBQzRqjzdgYQhO6kL6W8Q?=
 =?us-ascii?Q?6Ybiw7UCH1QQQTyDBiGMB/eQ84vW3VeMyMkfRTykE8aRR+sR0M430N01aG5c?=
 =?us-ascii?Q?IjJsMj6vePhV7SSCuASprQL6A4Rp9Ic95y0rzXiE4fCY9Nn9ya9cQL5Vjx9v?=
 =?us-ascii?Q?TLvAFaKNJxBECFHcTjdhyDkamgpGz3f7fzXkyrGhR5MWmakhdotAMsvqT8xQ?=
 =?us-ascii?Q?nqjBnS+/w0EljZvloWtETG67KqWQTpQtAtpNNp/7UMNGGzoXUVUYmDHNKC8Z?=
 =?us-ascii?Q?AvH4BpNWuCHmNsgtXImB/1ahSVk3lxfAlNpu7f7nMilRl5ebT7fe?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e605dfe3-f4a1-45dc-bca5-08deb237a07a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:31.9085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaKEkwrk4Xet+1ljFxLabMxIlJE/N1cJDZ2cB3DgbkKRId1rSH76Md0Y/lv1A+DkSq99284reELpOB3EtR2B4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-ebf023/1778818119-435683FF-6B50311F/13/0
X-purgate-type: clean
X-purgate-size: 4337
X-Rspamd-Queue-Id: 40EDD549276
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim];
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

Move initial guest RAM out of the p2m, delegate it, and map it into the
Realm with measurement enabled.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/build.c | 124 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/xen/arch/arm/cca/build.c b/xen/arch/arm/cca/build.c
index 10f61b5038ef..8e607e97b99c 100644
--- a/xen/arch/arm/cca/build.c
+++ b/xen/arch/arm/cca/build.c
@@ -664,3 +664,127 @@ static int arm_cca_build_rtts(struct domain *d, paddr_t base,
 
     return 0;
 }
+
+/*
+ * DEN0137 2.0-bet1 - D1.2.3 Initialize memory of New Realm flow.
+ */
+static int arm_cca_create_data_pages(struct domain *d, gfn_t base_gfn,
+                                     unsigned long nr_pages,
+                                     uint64_t *rmi_result)
+{
+    struct page_info *scratch_pg;
+    void *scratch;
+    unsigned long i, work = 0;
+    int rc = 0;
+
+    if ( !d->arch.cca.data_pages )
+    {
+        d->arch.cca.data_pages = xzalloc_array(struct arm_cca_data_page_record,
+                                               nr_pages);
+        if ( !d->arch.cca.data_pages )
+            return -ENOMEM;
+    }
+
+    scratch_pg = arm_cca_alloc_host_page();
+    if ( !scratch_pg )
+        return -ENOMEM;
+
+    scratch = map_domain_page(page_to_mfn(scratch_pg));
+
+    for ( i = d->arch.cca.nr_data_pages; i < nr_pages; ++i )
+    {
+        paddr_t ipa = gfn_to_gaddr(gfn_add(base_gfn, i));
+        struct page_info *page;
+        p2m_type_t p2mt;
+        mfn_t mfn;
+        void *src;
+        struct arm_smccc_res res;
+        bool removed = false, delegated = false;
+
+        page = get_page_from_gfn(d, gfn_x(gfn_add(base_gfn, i)), &p2mt,
+                                 P2M_ALLOC);
+        if ( !page )
+        {
+            rc = -ENOENT;
+            break;
+        }
+
+        if ( p2mt != p2m_ram_rw )
+        {
+            put_page(page);
+            rc = -EINVAL;
+            break;
+        }
+
+        mfn = page_to_mfn(page);
+        src = map_domain_page(mfn);
+        memcpy(scratch, src, PAGE_SIZE);
+        unmap_domain_page(src);
+
+        rc = guest_physmap_remove_page(d, gfn_add(base_gfn, i), mfn, 0);
+        if ( rc != 0 )
+        {
+            put_page(page);
+            break;
+        }
+        removed = true;
+        d->arch.cca.build_unrecoverable = true;
+
+        rc = arm_cca_delegate_granule(page_to_maddr(page));
+        if ( rc != 0 )
+            goto err_page;
+        delegated = true;
+
+        /*
+         * TODO: If plain RAM should be left out of RIM, have the toolstack
+         * pass explicit measured ranges (kernel, initrd, DTB, etc.) and use
+         * DATA_MAP outside those ranges. Do not infer this from page contents.
+         */
+        rc = arm_cca_rmi_rtt_data_map_init(
+            d->arch.cca.rd, page_to_maddr(page), ipa,
+            page_to_maddr(scratch_pg),
+            ARM_CCA_RMI_DATA_FLAGS_MEASURE_CONTENT, &res);
+        rc = arm_cca_build_record_rmi_failure(rmi_result, rc, &res);
+        if ( rc != 0 )
+            goto err_page;
+
+        d->arch.cca.data_pages[i].ipa = ipa;
+        d->arch.cca.data_pages[i].pa = mfn_to_maddr(mfn);
+        d->arch.cca.nr_data_pages++;
+
+        put_page(page);
+
+        if ( arm_cca_build_should_preempt(++work,
+                                          ARM_CCA_BUILD_PREEMPT_PAGES,
+                                          ARM_CCA_BUILD_FORCE_PREEMPT_PAGES) )
+        {
+            rc = -ERESTART;
+            break;
+        }
+
+        continue;
+
+err_page:
+        if ( delegated )
+        {
+            if ( arm_cca_undelegate_build_page(d, page) )
+                delegated = false;
+            else
+            {
+                d->arch.cca.data_pages[i].ipa = INVALID_PADDR;
+                d->arch.cca.data_pages[i].pa = page_to_maddr(page);
+                d->arch.cca.nr_data_pages++;
+            }
+        }
+
+        put_page(page);
+        if ( removed && !delegated )
+            free_domheap_page(page);
+        break;
+    }
+
+    unmap_domain_page(scratch);
+    free_domheap_page(scratch_pg);
+
+    return rc;
+}
-- 
2.51.0


