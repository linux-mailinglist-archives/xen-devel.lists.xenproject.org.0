Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE478D5C42
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 10:07:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733428.1139682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxIK-0008Ld-K7; Fri, 31 May 2024 08:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733428.1139682; Fri, 31 May 2024 08:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxIK-0008Iz-Gz; Fri, 31 May 2024 08:07:24 +0000
Received: by outflank-mailman (input) for mailman id 733428;
 Fri, 31 May 2024 08:07:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=svJw=NC=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sCxII-0008Io-EW
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 08:07:22 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbe250f6-1f24-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 10:07:20 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id A41A0189B2;
 Fri, 31 May 2024 04:07:16 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 9AB34189B1;
 Fri, 31 May 2024 04:07:16 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 6179A189AE;
 Fri, 31 May 2024 04:07:15 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: cbe250f6-1f24-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=yRmQ1XO4PP/T3eUSUNUUBjRlL
	OC4anerKWGpFiIymSM=; b=K/1zvroDJQilAzAKdKV0SA6ShmwQf0khKuzDfjRYV
	hSKesk4LaXFSyVtDX1fB24xt6W8gNukM0T44yd015AgVT69ZVgXsD7H9p7aDwtTo
	tBxc4gPtPcNflf0VoJnKt0z3hoWtFoIdRuynnflCoAvIlILMxF2CIbmoa1O5KbXZ
	Tg=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	xenia.ragiadakou@amd.com,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH RFC] ioreq: make arch_vcpu_ioreq_completion() an optional callback
Date: Fri, 31 May 2024 11:06:56 +0300
Message-Id: <20240531080656.2270399-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <376d2e89-da6d-49c2-90aa-aab4af6eb0d1@suse.com>
References: <376d2e89-da6d-49c2-90aa-aab4af6eb0d1@suse.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 CAD7A984-1F24-11EF-8941-B84BEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

For the most cases arch_vcpu_ioreq_completion() routine is just an empty =
stub,
except when handling VIO_realmode_completion, which only happens on HVM
domains running on VT-x machine. When VT-x is disabled in build configura=
tion,
both x86 & arm version of routine become empty stubs.
To dispose of these useless stubs we can do optional call to arch-specifi=
c
ioreq completion handler, if it's present, and drop arm and generic x86 h=
andlers.
Actual handling of VIO_realmore_completion can be done by VMX code then.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/arm/ioreq.c       |  6 ------
 xen/arch/x86/hvm/ioreq.c   | 25 -------------------------
 xen/arch/x86/hvm/vmx/vmx.c | 15 +++++++++++++++
 xen/common/ioreq.c         |  5 ++++-
 xen/include/xen/ioreq.h    |  2 +-
 5 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 5df755b48b..2e829d2e7f 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -135,12 +135,6 @@ bool arch_ioreq_complete_mmio(void)
     return false;
 }
=20
-bool arch_vcpu_ioreq_completion(enum vio_completion completion)
-{
-    ASSERT_UNREACHABLE();
-    return true;
-}
-
 /*
  * The "legacy" mechanism of mapping magic pages for the IOREQ servers
  * is x86 specific, so the following hooks don't need to be implemented =
on Arm:
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index b37bbd660b..088650e007 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -29,31 +29,6 @@ bool arch_ioreq_complete_mmio(void)
     return handle_mmio();
 }
=20
-bool arch_vcpu_ioreq_completion(enum vio_completion completion)
-{
-    switch ( completion )
-    {
-#ifdef CONFIG_VMX
-    case VIO_realmode_completion:
-    {
-        struct hvm_emulate_ctxt ctxt;
-
-        hvm_emulate_init_once(&ctxt, NULL, guest_cpu_user_regs());
-        vmx_realmode_emulate_one(&ctxt);
-        hvm_emulate_writeback(&ctxt);
-
-        break;
-    }
-#endif
-
-    default:
-        ASSERT_UNREACHABLE();
-        break;
-    }
-
-    return true;
-}
-
 static gfn_t hvm_alloc_legacy_ioreq_gfn(struct ioreq_server *s)
 {
     struct domain *d =3D s->target;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 8ba996546f..4f9be50fe7 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2749,6 +2749,20 @@ static void cf_check vmx_set_reg(struct vcpu *v, u=
nsigned int reg, uint64_t val)
     vmx_vmcs_exit(v);
 }
=20
+bool realmode_vcpu_ioreq_completion(enum vio_completion completion)
+{
+    struct hvm_emulate_ctxt ctxt;
+
+    if ( completion !=3D VIO_realmode_completion )
+        ASSERT_UNREACHABLE();
+
+    hvm_emulate_init_once(&ctxt, NULL, guest_cpu_user_regs());
+    vmx_realmode_emulate_one(&ctxt);
+    hvm_emulate_writeback(&ctxt);
+
+    return true;
+}
+
 static struct hvm_function_table __initdata_cf_clobber vmx_function_tabl=
e =3D {
     .name                 =3D "VMX",
     .cpu_up_prepare       =3D vmx_cpu_up_prepare,
@@ -3070,6 +3084,7 @@ const struct hvm_function_table * __init start_vmx(=
void)
     lbr_tsx_fixup_check();
     ler_to_fixup_check();
=20
+    arch_vcpu_ioreq_completion =3D realmode_vcpu_ioreq_completion;
     return &vmx_function_table;
 }
=20
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 1257a3d972..94fde97ece 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -33,6 +33,8 @@
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
=20
+bool (*arch_vcpu_ioreq_completion)(enum vio_completion completion) =3D N=
ULL;
+
 void ioreq_request_mapcache_invalidate(const struct domain *d)
 {
     struct vcpu *v =3D current;
@@ -244,7 +246,8 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
         break;
=20
     default:
-        res =3D arch_vcpu_ioreq_completion(completion);
+        if ( arch_vcpu_ioreq_completion )
+            res =3D arch_vcpu_ioreq_completion(completion);
         break;
     }
=20
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index cd399adf17..880214ec41 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -111,7 +111,7 @@ void ioreq_domain_init(struct domain *d);
 int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *con=
st_op);
=20
 bool arch_ioreq_complete_mmio(void);
-bool arch_vcpu_ioreq_completion(enum vio_completion completion);
+extern bool (*arch_vcpu_ioreq_completion)(enum vio_completion completion=
);
 int arch_ioreq_server_map_pages(struct ioreq_server *s);
 void arch_ioreq_server_unmap_pages(struct ioreq_server *s);
 void arch_ioreq_server_enable(struct ioreq_server *s);
--=20
2.25.1


