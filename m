Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F2D3C450
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 10:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208594.1520749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8U7-0008BQ-4s; Tue, 20 Jan 2026 09:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208594.1520749; Tue, 20 Jan 2026 09:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8U7-00088s-20; Tue, 20 Jan 2026 09:57:15 +0000
Received: by outflank-mailman (input) for mailman id 1208594;
 Tue, 20 Jan 2026 09:57:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DmLw=7Z=bounce.vates.tech=bounce-md_30504962.696f516f.v1-70b618fda82a4fdbb498f2bbe6cc4cfc@srs-se1.protection.inumbo.net>)
 id 1vi8U6-00088f-Ac
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 09:57:14 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fb9e75d-f5e6-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 10:57:05 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dwN5q75QmzBsThRd
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 09:57:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 70b618fda82a4fdbb498f2bbe6cc4cfc; Tue, 20 Jan 2026 09:57:03 +0000
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
X-Inumbo-ID: 5fb9e75d-f5e6-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768903024; x=1769173024;
	bh=Td0Zid5VRB//BT4blpV+a0Bp1YjYVTUOReb8gVRMSpo=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Zxm2CT2jenf+t5q/lL9QnFFTk5hSJDke2hTTltjYub+smaxnDOTckFYAPFL47KGFD
	 NE1kl/IwtA0RXqXwwLX2fi3DwBjP2YWUQ0I6M48nQULcomCUc+04vsao7+zxDAosS6
	 KWIGopjEelFz2rvotypGKW7+x0HomrU1x21jZyfiVQnlX2dyGOhlD9QcosL4nawKsx
	 0JccFGN9ahmdXfTRZY2/ioOBmduiZzp2L2tjLghCwcE7CAl7gLGenlLts4Flbi8P4l
	 R0evcjQkW8cFq96PhT6K7ZdLLs3GfCTqlakq08mAFCSxN97V+KisR2NEmOyOhKLNKa
	 u9cn04BsncwNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768903024; x=1769163524; i=ngoc-tu.dinh@vates.tech;
	bh=Td0Zid5VRB//BT4blpV+a0Bp1YjYVTUOReb8gVRMSpo=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=hM/YMPOs/d79kosY60VD4H9o52ivNVHz/EU/RxQXO9JhGOXZmY/nH1UxsPRcfaNSw
	 GyiYkx6sJgjiL5U+ZLDqnTg/E2Waw0KsRoQmdAfd4NRvPtStFO2NfuqB7R4J98uVFz
	 pZ7vWjxVhME9dB6COqS3kxifo2E9uJfNpvOpmlY1xuv9ejdMmvj1eDxU0rMzjiTR/7
	 OoDahEsyjGcY5tAbcAkvD1tfX7l8bk0JQg/3Sl33U2FbGFyFpUC41FNtNXtuJNEwUs
	 SFSdrW2Sh5/PGjmPGFKTp1pO4YOuXHOUBkH2/6jkMgAjoISjzyU9R6wBQmEGQwdvaY
	 rVa8RcjGb3TJQ==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2]=20xen:=20Expose=20time=5Foffset=20in=20struct=20arch=5Fshared=5Finfo?=
X-Mailer: git-send-email 2.51.2.windows.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768903022467
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
Message-Id: <20260120095657.237-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.70b618fda82a4fdbb498f2bbe6cc4cfc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260120:md
Date: Tue, 20 Jan 2026 09:57:03 +0000
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
v2: Remove unnecessary casts.
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
index fb45f81399..44af6f8f04 100644
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
index c873b5731b..6f1a8a11c2 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -118,6 +118,11 @@ void update_domain_wallclock_time(struct domain *d)
     shared_info(d, wc_sec_hi) = sec >> 32;
 #endif
 
+    shared_info(d, arch.time_offset) =
+        (uint32_t)d->time_offset.seconds;
+    shared_info(d, arch.time_offset_hi) =
+        (uint32_t)(d->time_offset.seconds >> 32);
+
     smp_wmb();
     *wc_version = version_update_end(*wc_version);
 
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index cd563cf706..4360f9835b 100644
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
index b5e1a940a5..42ade11171 100644
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
index 360d8e6871..286bf92473 100644
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
index a7bf046ee0..401583383c 100644
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


