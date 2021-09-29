Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D7841C553
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199073.352908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZPG-0000oD-0N; Wed, 29 Sep 2021 13:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199073.352908; Wed, 29 Sep 2021 13:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZPF-0000mN-SL; Wed, 29 Sep 2021 13:13:53 +0000
Received: by outflank-mailman (input) for mailman id 199073;
 Wed, 29 Sep 2021 13:13:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVZPF-0000mA-06
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:13:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 169cc90c-2127-11ec-bcfe-12813bfff9fa;
 Wed, 29 Sep 2021 13:13:51 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-WOIg97fLNrqFzSoAqQtHEw-1; Wed, 29 Sep 2021 15:13:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 13:13:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 13:13:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0109.eurprd04.prod.outlook.com (2603:10a6:20b:31e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Wed, 29 Sep 2021 13:13:48 +0000
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
X-Inumbo-ID: 169cc90c-2127-11ec-bcfe-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632921230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tZu5l7MohBWThL4D4aCcbxZpD036n9ZohT52VmFvYFE=;
	b=e2xohw6Zc32sgvCWh0kK1RK4w1I0TJKfeSrtfRwkUoMsd4Deurwr6CvPVoEULS0oz9Mx6R
	nTAF8uGW5FIfeET0yxPuDwHzhdjl70ITjge6aNkb4bcdlnQLJZT6AVFQHIrgQUKkR1np7C
	9A5qT+ObAzMVnJQ3zHhWcH457bLmssE=
X-MC-Unique: WOIg97fLNrqFzSoAqQtHEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+Rikq+LTX/UwQp7WaEpQONCOFK00ku5+GfhXga7RcKwwrbnFDl79dxF8Ac1GGQfZxApemiooJBq6xvV3f6kIBPBWwItAEWsreFHdigKryfN3QsONtlsmKEUX2Mu0g0PUN4Leq1ey0xzH+NQxVcCukOUCUaqbGQYriSHaQd6HPsYkKfhGXyUuwFAZ+KwK6poovjP4W9YB8HAoDzCP1ChRJHfGq2KEsS0hZQcLcc6xvH0sfcTAVgjVFcGjsvh/Z9iOwMmya+YMamfBUexypOU8YkJNACiMEmJNHsXNDzruBEqaivIjPscq7+WmL5IShU/q8z2pooPwAzHcFL5EhO2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=w1MgNXQPIZRI2m7FHe+SKi50wAOF1utIT72Ti22BWx0=;
 b=Eg24EybU/QF+yhw6CmwU4Bhw/3Twfq8tXgD+7kueMKjGCKQZbfpyYe49pC6rU1MyIt/KHTgnCU/caw4cPnpVkbudqtZ+1E+vXwhc1VaX8uj56AG82C6FHFn7vkDA1EXIu4Wx2RmsS56+OZOWxxZaoA+BBGdGDxZ0H3nGNcwEjcbT84rbiQKZgSeqxR3y8lOandvhiiDbSRl/KAWnjKvePB7PX6OHFFeDzrPxwNFlGDDzw0qI/g34FTKgLxBIbnOy17PvGmz70m3hVHYvp0FfnFKeTj10DdxE3rFOtjoDMoB0tL5L8Tvesjq203gubCTuY2i809kPglRr2PvF5YJiGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v4 2/6] x86/PV: properly set shadow allocation for Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
Message-ID: <803917ef-2bd2-0223-8bf8-23d129baf277@suse.com>
Date: Wed, 29 Sep 2021 15:13:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0109.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8351a5e-cdb8-4dfc-cd92-08d9834af985
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB435240EA1B7503B0E87B2C8EB3A99@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZFT817FByKbhEIlq1RcaVsOLMYzAg0sqRhFpzHfMhIpiBWgCn6ZBxnpBPxX075otoV+peuGYE8sspYV4hYj/fvACK/mlTyJGdzXJHgc+6vbvj3h22SGocC8SJIDgNhmFi0i/mVMdWQ9+ii+Caqtsx7ceVFyMfp8I4HonC3BPgbbLDzoIo5hptX312nTI85iMXtwhkfzdjoP6KWk17eDiLMwd9p7+Y4ND0k9cjx5WAQmPHg6FzI32qKXaVRFTDMky1Xpi4v+F3UbxEdNMzZ9Lf5mADbClzxE+p9LOEhloih/0E26PnAp2A9gpR0Tl28gFF9l+LiuMNtxSeqZMAWRH1/CrKdfcWnYqb9NWaLKXNwXarRpISvue/suLFG01dRARlI+Ga777fC24QxXgv4n8/I6c/SNPRrZBKrQSiMogERYZQ5A2xUjMaJBQDKm+E8vSGQA1tzODTculvBdNmS/MHWniz8Nd3hKxj8W4DCz/6OXKb9v3cb4gFE3qBxsWVs8/GxxBSF4f0YO3LylxySYCQNGRvHPW1BT3us4YJFHumuXSm8Vo+3ikWd9+Ki/9vjMKV6vjGqdCG6e8bxRP682XZyUySFIT8Z0tTlRa6vjioNvU5oXiQ9dv3Zaa3S5Wxb2fo1DsX7m/F76HFbp3M7PS+ooc++fzvzqsPQZXxs28dIZtQ9CA0/NpOjpq0nQhoJf6aeu9jv4bKaimLtw1U10Mf68uEgJFd7MEKJLjm5oYbVU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(83380400001)(6916009)(5660300002)(38100700002)(54906003)(8676002)(956004)(8936002)(186003)(26005)(31696002)(316002)(86362001)(66946007)(31686004)(4326008)(2906002)(36756003)(16576012)(66476007)(66556008)(508600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fg7GhRs2ZXn+VCjAw9y+GOkRxFxywyhwnSgJZ7GFqnlS6gjDrxd/hrEPI4Xs?=
 =?us-ascii?Q?xIN7HOKxZj4JBeO0AE64v7LvF38d+qxNxWtKyewMDALIMBVnawiwGe3qi0be?=
 =?us-ascii?Q?XLvAYD3W0jYlNKt+M9mR3AXbJfP6JvSR+Bi1AsmStFUvrWcqHawoW8r7VdZj?=
 =?us-ascii?Q?L22cBx+zDjfl/qk64KlACs+44gdZ63/O5mhUE1si1ZE2cxTv88W97sMOZoii?=
 =?us-ascii?Q?rlj+GXT/70859p+zmXnut8Fs9ooubwohWEEtfQpFeFh/GCIpPq9+iSmBHEbp?=
 =?us-ascii?Q?tXcy5WBhKMA5LJPfB4iW/7yCyLet4/M/5sF6QFUVBIVs//0q9MMzXml4MjjN?=
 =?us-ascii?Q?DWLwgd7B/7otkdTpN4xiFj041uGudixDqjOgFFwXJICFPEr1SdWdtgE49R+J?=
 =?us-ascii?Q?35sUU7lJuP1Uqa3VaBsMEEsdXKEQIFk95Rdpg+HHfMLo/dMRkC3DtPu36/pA?=
 =?us-ascii?Q?1ovUvhOpO1DVxVuj19tx8rpSPYdcL/Z3h8W9XWpq0/mdi69xXabIVlrGARzH?=
 =?us-ascii?Q?/DLGetotFHpV/ycJv9XFmlEoaOsTexYohC3cyy/mZ8LvPcd22zShOs3ZgTYX?=
 =?us-ascii?Q?6eiNuSJxLArSzTJ3YsxjKWGjBpZngH1ByxhIBhdio2GG4ZGZsCImZYW6Caum?=
 =?us-ascii?Q?kvD8bEOKCcrL76qrJHZtsCJdV+WeH3NMYeCU6IL2gkvFGeEX9WFUk8FVTcFG?=
 =?us-ascii?Q?6tLYdu2sUPCv5KSk9iqEHlzw+w7FtOJ35wzjddMnP4q9xgkxmslG6KKC5DBs?=
 =?us-ascii?Q?8PRepUB1wneBNQemtakCJBlJWpS7al2zc16w5LxjtMJgkytocfyuJPFkiB74?=
 =?us-ascii?Q?NwGmWXcCkivEJfVVUxa1MfuXugjag5mUel3AfbxTuq3gFAg5Ny3u5Kumrm2X?=
 =?us-ascii?Q?/71DQ+I3NpPkJUGE2LFjf73lav+NfrxR4ZbbrJh8E16K//jUt1bjufvOVqmI?=
 =?us-ascii?Q?PFGanFl8tCw6UNG/QJXWhqAa9UbBt7sl0fSKTxA2EXzIdW5fcil0nFTnWrrc?=
 =?us-ascii?Q?Mlpr50F40LZyl9r/c0SRXgOyu4T0ptAB4++2+G3z5bBwNHk+lYRKwKCHfiJ9?=
 =?us-ascii?Q?wmGy9YQ/b9xilpSqr47mMp7oPTy+4jMnd0yQf/r7WCHGPPnsuO3HVEJ5zTwd?=
 =?us-ascii?Q?5qS5mKQ3N7Tcme4UfDVX+n7NYZLzPd/uvnzRdAnoEv/y6ltvhU7Ryl4L5arx?=
 =?us-ascii?Q?ns7hvRj6WmMIhVEWfb33hvelJCltIJlGj0cZ+Set/oKTNpxL/7rxrIeb5cMy?=
 =?us-ascii?Q?lHxaNnljGLr+VBO2841pKO46rlVtVtxiYz8F6c5aUZVc8HlMN3dMRoJIlPYn?=
 =?us-ascii?Q?QWgcUtn3VmRbvwuakOYee/q3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8351a5e-cdb8-4dfc-cd92-08d9834af985
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:13:48.7289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPTuO0/Kqn+RYdyiMuQHaPNYdf7MebcM5k3oCr+aB6i8LP5TT5ZpCSdbc49jX2D+b2DfZG7jRl2YdBqS5h40FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

Leaving shadow setup just to the L1TF tasklet means running Dom0 on a
minimally acceptable shadow memory pool, rather than what normally
would be used (also, for example, for PVH). Populate the pool before
triggering the tasklet (or in preparation for L1TF checking logic to
trigger it), on a best effort basis (again like done for PVH).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Tim Deegan <tim@xen.org>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
v4: Also fill pool when opt_pv_l1tf_hwdom is set.
v2: Latch dom0_paging_pages() result.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1298,7 +1298,7 @@ int shadow_set_allocation(struct domain
 {
     struct page_info *sp;
=20
-    ASSERT(paging_locked_by_me(d));
+    ASSERT(paging_locked_by_me(d) || system_state < SYS_STATE_active);
=20
     if ( pages > 0 )
     {
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -21,6 +21,7 @@
 #include <asm/page.h>
 #include <asm/pv/mm.h>
 #include <asm/setup.h>
+#include <asm/shadow.h>
=20
 /* Allow ring-3 access in long mode as guest cannot use ring 1 ... */
 #define BASE_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_USER)
@@ -928,8 +929,22 @@ int __init dom0_construct_pv(struct doma
     if ( d->domain_id =3D=3D hardware_domid )
         iommu_hwdom_init(d);
=20
-    /* Activate shadow mode, if requested.  Reuse the pv_l1tf tasklet. */
 #ifdef CONFIG_SHADOW_PAGING
+    /* Fill the shadow pool if necessary. */
+    if ( opt_dom0_shadow || opt_pv_l1tf_hwdom )
+    {
+        bool preempted;
+
+        nr_pt_pages =3D dom0_paging_pages(d, nr_pages);
+
+        do {
+            preempted =3D false;
+            shadow_set_allocation(d, nr_pt_pages, &preempted);
+            process_pending_softirqs();
+        } while ( preempted );
+    }
+
+    /* Activate shadow mode, if requested.  Reuse the pv_l1tf tasklet. */
     if ( opt_dom0_shadow )
     {
         printk("Switching dom0 to using shadow paging\n");


