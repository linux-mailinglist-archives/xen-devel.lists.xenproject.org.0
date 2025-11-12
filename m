Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9727BC50DC0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 08:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159511.1487822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ4xz-0004TP-8w; Wed, 12 Nov 2025 07:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159511.1487822; Wed, 12 Nov 2025 07:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ4xz-0004S1-5y; Wed, 12 Nov 2025 07:08:31 +0000
Received: by outflank-mailman (input) for mailman id 1159511;
 Wed, 12 Nov 2025 07:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQc1=5U=bounce.vates.tech=bounce-md_30504962.69143269.v1-d068692f474a423bb6591a33a5e4c6c5@srs-se1.protection.inumbo.net>)
 id 1vJ4xx-0004Rv-Gv
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 07:08:29 +0000
Received: from mail136-17.atl41.mandrillapp.com
 (mail136-17.atl41.mandrillapp.com [198.2.136.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62a680f2-bf96-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 08:08:27 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d5vd5690rzPm0ZmK
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 07:08:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d068692f474a423bb6591a33a5e4c6c5; Wed, 12 Nov 2025 07:08:25 +0000
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
X-Inumbo-ID: 62a680f2-bf96-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762931305; x=1763201305;
	bh=Oa4yrycR7NIuFObzqDKHG41ZmuCJzPot29fGUbt2GPo=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=S7rkVGk4NzzMc0ty25NVhMX/EhcVew8Ob4VNw/upJv/qQanYMyaGKbhAxTs81dAZC
	 ilfhl58S68VkjJlFm+TMaSNcb+ACWsShm9VPOE7dJ0btyuUSkUohR5R3DLNlGtgsTg
	 npCrVykHtBf4aurJa+h2YRglJcUK5ST6kd4nEn9iHk2ZlJXyGWh7SYbt3XHUMY9GZq
	 aOWDki8LWD/Ul69G7UI14+bbmihWSV0R3x10a9uzFfaBDLKOGJUJMznkMl1ejQyUJk
	 ij0YBwFWvxzaGRla9YbpZEeaXyHhS4cUZdfNw5bqkfrcdeAqohAp63Oyn1TtkddUQd
	 Rny6FWxhOoiSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762931305; x=1763191805; i=ngoc-tu.dinh@vates.tech;
	bh=Oa4yrycR7NIuFObzqDKHG41ZmuCJzPot29fGUbt2GPo=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=CSaW4rK3iIQVvqUAoWd633BSSoDHptDkDEdj2ruoBlm5hPC/ufnF5yFixOOFIkwcD
	 yVh9/x34UBfXUSiN2xKtlq1aRWdVy3X7eUyLuB1Nhu+PLUPyxEG9iV0MRkvGV5dE+O
	 DL+w1lU+2yZnxqYgn1d1VCBlHvGftzY/KxMxPKTLeyZHkdyT5CVzL4WGjFXDHtFtQA
	 zsSbz5RYNU5h6hI5LgSDURVOrbiBczJIi5wqeGj7Zwl1RVc9Qf+6pVkz/kP6jxKL4W
	 4YoQMDFez2fdMUJ+GIjJBK/7qBhiGQPqXQw56qZfo21LzBUEkHN35QQ3fenwACL3Dm
	 ztHN7jggUy6YA==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20xen:=20Expose=20time=5Foffset=20in=20struct=20arch=5Fshared=5Finfo?=
X-Mailer: git-send-email 2.51.2.windows.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762931304036
To: xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Message-Id: <20251112070815.545-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d068692f474a423bb6591a33a5e4c6c5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251112:md
Date: Wed, 12 Nov 2025 07:08:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

time_offset is currently always added to wc_sec. This means that without
the actual value of time_offset, guests have no way of knowing what's
the actual host clock. Once the guest clock drifts beyond 1 second,
updates to the guest RTC would themselves change time_offset and make it
impossible to resync guest time to host time.

Since there's no way to add more fields to struct shared_info, the
addition has to be done through struct arch_shared_info instead. Add two
fields in arch_shared_info representing time_offset's low and high
32-bit halves.

Provide a new feature bit XENFEAT_shared_info_time_offset for this
functionality.

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 tools/include/xen-foreign/reference.size | 5 ++---
 xen/common/kernel.c                      | 3 ++-
 xen/common/time.c                        | 5 +++++
 xen/include/public/arch-arm.h            | 2 ++
 xen/include/public/arch-ppc.h            | 3 +++
 xen/include/public/arch-riscv.h          | 3 ++-
 xen/include/public/arch-x86/xen.h        | 3 +++
 xen/include/public/features.h            | 5 +++++
 8 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/tools/include/xen-foreign/reference.size b/tools/include/xen-foreign/reference.size
index 11a06a7a43..38e799617a 100644
--- a/tools/include/xen-foreign/reference.size
+++ b/tools/include/xen-foreign/reference.size
@@ -9,6 +9,5 @@ vcpu_guest_context        |     352     352    2800    5168
 arch_vcpu_info            |       0       0      24      16
 vcpu_time_info            |      32      32      32      32
 vcpu_info                 |      48      48      64      64
-arch_shared_info          |       0       0      28      48
-shared_info               |    1088    1088    2344    3136
-
+arch_shared_info          |       8       8      36      56
+shared_info               |    1096    1096    2352    3144
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index e6979352e1..dbd2cf9c76 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -676,7 +676,8 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 #ifdef CONFIG_X86
                         (1U << XENFEAT_vcpu_time_phys_area) |
 #endif
-                        (1U << XENFEAT_runstate_phys_area);
+                        (1U << XENFEAT_runstate_phys_area) |
+                        (1U << XENFEAT_shared_info_time_offset);
             if ( VM_ASSIST(d, pae_extended_cr3) )
                 fi.submap |= (1U << XENFEAT_pae_pgdir_above_4gb);
             if ( paging_mode_translate(d) )
diff --git a/xen/common/time.c b/xen/common/time.c
index c873b5731b..0f38b1342d 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -118,6 +118,11 @@ void update_domain_wallclock_time(struct domain *d)
     shared_info(d, wc_sec_hi) = sec >> 32;
 #endif
 
+    shared_info(d, arch.time_offset) =
+        (uint32_t)(uint64_t)d->time_offset.seconds;
+    shared_info(d, arch.time_offset_hi) =
+        (uint32_t)((uint64_t)d->time_offset.seconds >> 32);
+
     smp_wmb();
     *wc_version = version_update_end(*wc_version);
 
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index b31324f8d4..2f34fb409b 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -363,6 +363,8 @@ struct arch_vcpu_info {
 typedef struct arch_vcpu_info arch_vcpu_info_t;
 
 struct arch_shared_info {
+    uint32_t time_offset;
+    uint32_t time_offset_hi;
 };
 typedef struct arch_shared_info arch_shared_info_t;
 typedef uint64_t xen_callback_t;
diff --git a/xen/include/public/arch-ppc.h b/xen/include/public/arch-ppc.h
index 4ca453a284..5bb47e09d3 100644
--- a/xen/include/public/arch-ppc.h
+++ b/xen/include/public/arch-ppc.h
@@ -92,6 +92,9 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 
 struct arch_shared_info {
     uint64_t boot_timebase;
+
+    uint32_t time_offset;
+    uint32_t time_offset_hi;
 };
 
 struct arch_vcpu_info {
diff --git a/xen/include/public/arch-riscv.h b/xen/include/public/arch-riscv.h
index 168263b920..e502aade99 100644
--- a/xen/include/public/arch-riscv.h
+++ b/xen/include/public/arch-riscv.h
@@ -65,8 +65,9 @@ struct arch_vcpu_info {
 };
 typedef struct arch_vcpu_info arch_vcpu_info_t;
 
-/* TODO:  add a placeholder entry if no real ones surface */
 struct arch_shared_info {
+    uint32_t time_offset;
+    uint32_t time_offset_hi;
 };
 typedef struct arch_shared_info arch_shared_info_t;
 
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index b99a691706..598af31e4e 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -263,6 +263,9 @@ struct arch_shared_info {
     /* There's no room for this field in the generic structure. */
     uint32_t wc_sec_hi;
 #endif
+
+    uint32_t time_offset;
+    uint32_t time_offset_hi;
 };
 typedef struct arch_shared_info arch_shared_info_t;
 
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 8801930947..b48591c17a 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -128,6 +128,11 @@
  */
 #define XENFEAT_dm_msix_all_writes        20
 
+/*
+ * arch_shared_info provides time_offset and time_offset_hi
+ */
+#define XENFEAT_shared_info_time_offset   21
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
2.43.0



--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


