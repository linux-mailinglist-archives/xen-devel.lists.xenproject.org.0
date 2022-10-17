Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C06960171C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 21:13:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424560.672082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okVXp-0002Ph-Vy; Mon, 17 Oct 2022 19:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424560.672082; Mon, 17 Oct 2022 19:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okVXp-0002Ks-Os; Mon, 17 Oct 2022 19:13:01 +0000
Received: by outflank-mailman (input) for mailman id 424560;
 Mon, 17 Oct 2022 19:13:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/1i=2S=citrix.com=prvs=2822150b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1okVXo-0002HD-Ho
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 19:13:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4fe2e1e-4e4f-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 21:12:58 +0200 (CEST)
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
X-Inumbo-ID: b4fe2e1e-4e4f-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666033977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=3xz6EapRYQ8Fq100GycK8t7tBLACDmNaRcneaz+jMYU=;
  b=WcFgxBqMVFotnGy+6pgnZFuwpAXUUgK7MZB9MnbBhshm6qyaYQU22BHU
   rV8YpJxD1RQsqMSnnl/Y6x5nHqzyfyKgi5xBYN20Gqw82xWrAwxil21Du
   PaRCeBICPxKsSXJh7Mzsmu6Wp7mHrcuzuFw50NH6HqRwFp9OnSJyNlCT2
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 82941464
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ASbhN46gKFI9U3uHyKlbXEaNMX17brhtdUexiu?=
 =?us-ascii?q?6ucsGfUl6mq9fgcCa95VXk6Z2cg+JsCT87dIK/hR2lo1aTMpqcRdC0qbbba9?=
 =?us-ascii?q?ML8jXdDsEdh0got7YTDm+eGxa96EqShD8hztsQ/Qs6ClDEHlkbm7waH7WG8G?=
 =?us-ascii?q?D/sfEhyUH/qkf4XmNGi54QvZhV9d5/T3i7rKkFnYMtekEl+kHxUpPyWbWFSN?=
 =?us-ascii?q?WBatcRp5sI0y+7nXA2X2W26sNl3O+Hy0Ws6jrqgd+NMm95ZRW9rDiPWRoOmI?=
 =?us-ascii?q?2VnAtMKlDE0aCcQT08n1SHPghHCSouinHd4hOQH6eVhpH/CTxbS0oIdu1fXF?=
 =?us-ascii?q?AizDVWXqwkerL28YlGpz0cRuKy9056ksWy40m6r8qECH5JjbHCHVJ1DCqIMG?=
 =?us-ascii?q?P5h+I+uJuU64SZFM3c+XX44IRTBgVwH7rxW0CXv82reKfUo4rlyUtsG1hRmM?=
 =?us-ascii?q?awlIKS7HWBvu8eYBiqbow0zN6WEB/mRK3uLF8YbG4HwiOXdyyz7xl22Q2Pq+?=
 =?us-ascii?q?Ro7dZYr0U4CgssW2SdzfIrFWH/cSXc/XBdW26Jyr3qufZ6vXu1txVp/zfFQ6?=
 =?us-ascii?q?rXu15oBBh0QPJn8vQoC51z1ObJK7LmOp0iQXHz+hughbEXGWKtwjgIf2KOi/?=
 =?us-ascii?q?X3xyQ9EEhoqUa6d5W+XUpzoU65fRLjr45vRqbXVBtxd+ocw1nzV8lEFtw1xC?=
 =?us-ascii?q?tFwE1fendfXTcE8QdtOvsPSWufl4D4cx0JL2qQf026t48JAdMl+pZioVZByc?=
 =?us-ascii?q?0TugxuoCQEm3gY5EAiAaYqa9flre5OMPrXP+5wZxY91HFPtk9Onlqw513aNs?=
 =?us-ascii?q?hzTSk5tng+PxwOvOc4dL0rHk2zAUlS9RVWtCYUYHafvVHBfnJuitCI3ZlLm1?=
 =?us-ascii?q?UfeL7S2TG/FPt+sYQWrMSGHRjbt68fGrlyP+20o7w3DLZFMni0BE2JrrCzmy?=
 =?us-ascii?q?pqReXVL3nYZIRxnC0pJdESiYM1CIjtxUQJxMb19BrGraofPXi0yiFgO4EA6D?=
 =?us-ascii?q?PKuPtnSWYen0ZeqbliyhbaYXuxCwM6iHTWxYy4n3SnivIZ+s+jeK5+/73KUB?=
 =?us-ascii?q?+HrUnERIJc19mcylj0k87xB5RHY+hBxY2rif122IFObQjRvJ/7CHGWjAqvmE?=
 =?us-ascii?q?5L9//cb4O7HLkZcQNgNI4y1tsFPyURPZbV5sD3Ntz1SvgXTqeDHOGi0DSC9c?=
 =?us-ascii?q?0+XBxhhsYZurJfKabWeLsi3AN9E9WAFoLpDJwVeKdcWjb9fZjH2uOl1MoA0k?=
 =?us-ascii?q?W/aBiI0NCYvYwYPg2FR537m9wWr4lZDmjtW3l8D3bjkwSL5Nwul7pOoLEluE?=
 =?us-ascii?q?mHO2IGDP4SNakCfSrzl+1DIlN2dZE9Rxfm/V0dZtUvZyUuuVtLNCzZ/Fguqc?=
 =?us-ascii?q?qAZEJPoSWjdRNmDN8hN05FMCWuEww+PVSkI344kbqbNSnBzyMPsSnXOLQIHo?=
 =?us-ascii?q?i+9THd+ZMHzhoeXwd8FJbf2psjTIjbjVpm5CbhFdg8rtBrfxtNV48TL8tkkD?=
 =?us-ascii?q?elPwTlWuDzVcUSiuTQev4LRizkE8o7x/8omJFwS1lTKQAkDEghUl2Bb12xtD?=
 =?us-ascii?q?7ouiyHudhji9C8c6ticegu9H3oIPfC2gOlvaQNyQy2QVUYiVEhDVYupEGX9I?=
 =?us-ascii?q?i0o1y8Nm/imah04QiLvU7CKls0/P5lPLk1v+lYCoWw+e9tGkIU4V2UUK8Tfd?=
 =?us-ascii?q?OEh9netU6ByLPhN49yIj5v9AqxVeB/UTK83Y5D+vxuGAWfP3zVxM78jYZ6Ru?=
 =?us-ascii?q?bUfukDRQW1h02O6Mt89Y4BB0qm+XmJ+FHhxuLH93ykK7Zsc7rMPI+QhhDZGa?=
 =?us-ascii?q?ZeYatgfj+oCmCCKN0DUgwmvNfkGAU+EXXiruh5SKxVtMQVTJ27Gxn9YoQXyk?=
 =?us-ascii?q?C37D9zexqmgrBg1wmPViEAH4wjiQ6HPGyFLDK8KP4PcH4EvNSwaj+HsayvuD?=
 =?us-ascii?q?QIz4iDifk8SfghnDwzWjc7ZTYDLiU/5tyEN7RcWi5ZxzRWrzYlj9R8DFV3nu?=
 =?us-ascii?q?2Wh/5g/nK8c0E/IWwyfF56s6Teuz8WH5p42GcK4raFhi00SLFHA+pwhBZCqK?=
 =?us-ascii?q?8y4y6KtcQ+CzDgfSmrXf//2wyaP11ht11ZldD7DdFj4RUl23gkyqxRHlDtn/?=
 =?us-ascii?q?OpOVfDYqAKzIaEYnHEAvEclh7MfYv1qKwBNMs8qPzNIZtjYruG0Yq0a0SXiS?=
 =?us-ascii?q?FnEKiEYpgeg2zxCrRkBFVi2igYj/df+Zy/p6byTpsf12uIN11Q1uGKi6rwS+?=
 =?us-ascii?q?Qo3J0qJ6l3eahMHvoCdEmYlgJ9/n8o8wjXUhDVg2l8Q8PwpHPIWJKAgwtNXL?=
 =?us-ascii?q?ycJKtzWwjC9gbEza2JtlNaBplrYV7jk7rInQCX7dgJjRymKyNBSluiidCT5G?=
 =?us-ascii?q?jZ5si8vxDB8YPHd/cLipc2iyj+D0vByC7iD/QLZIJOseZDtW1EY56UALRiUS?=
 =?us-ascii?q?MF0FQCqsuFhsrbgh/3fMYhcg6VhOY6Q+Nft3QhO0V8auRzGThytwxJwckFAv?=
 =?us-ascii?q?bcsgeTJcqwE3zFP5q38dNqhA2FV06ypTdesWDtU00Z00X3m09M5l0ur3ke+1?=
 =?us-ascii?q?2EfZcz/Ym3/WVnP+fns5ziV12wv3QyUIvBnWFsYVrNqP5Z9ZvbVBLDbAqBhB?=
 =?us-ascii?q?gVdLoiHW8//BY7d5e1LoAbyOSJqxKQKhvy+KE0qR5zqwbPunkcnMcaYObz1F?=
 =?us-ascii?q?uWrAsGV5C9HaTs6B+zaQuQBh6DFVqnqhhimSybr2C9raCQMkpTxQHPXDCnnY?=
 =?us-ascii?q?tSad63os+URZyOVV0G0dGDQr0D4Vo5Zr37MhV+JCJY7nZ1bveYjnHyuKHtTB?=
 =?us-ascii?q?+PxqpnJpASC2AqGElLDjvS2YxeVumhL0N+Ru19fbkE5hBZbSDxQvJjI19y/o?=
 =?us-ascii?q?wmkxCM1w6yNl3b6f+xaKstx9y5Y2bwIpjFz05paFybmPwdy/IzfPwSt/E7vX?=
 =?us-ascii?q?dCT/g2yvh0o59A6tcs27Ig76ZhyXd4K5tUMpKtBp0hrEG4DA9Bbop1usC1Mf?=
 =?us-ascii?q?uLfzu+O4KgXwKz5D/WiB7MUXmvT34p7VFoN0w=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.95,192,1661832000"; 
   d="scan'208";a="82941464"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH 1/2] arm/p2m: Rework p2m_init()
Date: Mon, 17 Oct 2022 20:12:36 +0100
Message-ID: <20221017191237.11079-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221017191237.11079-1-andrew.cooper3@citrix.com>
References: <20221017191237.11079-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

p2m_init() is mostly trivial initialisation, but has two failable operations
which are on either side of the backpointer trigger for teardown to take
actions.

p2m_free_vmid() is idempotent with a failed p2m_alloc_vmid(), so rearrange
p2m_init() to perform all trivial setup, then set the backpointer, then
perform all failable setup.

This will simplify a future bugfix which needs to add a third failabile
operation.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/p2m.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index f17500ddf3a3..6826f6315080 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1754,7 +1754,7 @@ void p2m_final_teardown(struct domain *d)
 int p2m_init(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    int rc = 0;
+    int rc;
     unsigned int cpu;
 
     rwlock_init(&p2m->lock);
@@ -1763,11 +1763,6 @@ int p2m_init(struct domain *d)
     INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
 
     p2m->vmid = INVALID_VMID;
-
-    rc = p2m_alloc_vmid(d);
-    if ( rc != 0 )
-        return rc;
-
     p2m->max_mapped_gfn = _gfn(0);
     p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
 
@@ -1783,8 +1778,6 @@ int p2m_init(struct domain *d)
     p2m->clean_pte = is_iommu_enabled(d) &&
         !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
 
-    rc = p2m_alloc_table(d);
-
     /*
      * Make sure that the type chosen to is able to store the an vCPU ID
      * between 0 and the maximum of virtual CPUS supported as long as
@@ -1797,13 +1790,20 @@ int p2m_init(struct domain *d)
        p2m->last_vcpu_ran[cpu] = INVALID_VCPU_ID;
 
     /*
-     * Besides getting a domain when we only have the p2m in hand,
-     * the back pointer to domain is also used in p2m_teardown()
-     * as an end-of-initialization indicator.
+     * "Trivial" initialisation is now complete.  Set the backpointer so
+     * p2m_teardown() and friends know to do something.
      */
     p2m->domain = d;
 
-    return rc;
+    rc = p2m_alloc_vmid(d);
+    if ( rc )
+        return rc;
+
+    rc = p2m_alloc_table(d);
+    if ( rc )
+        return rc;
+
+    return 0;
 }
 
 /*
-- 
2.11.0


