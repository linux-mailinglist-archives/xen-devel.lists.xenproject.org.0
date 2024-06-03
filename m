Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4818D8158
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734883.1141009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5xr-0002Tr-Hk; Mon, 03 Jun 2024 11:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734883.1141009; Mon, 03 Jun 2024 11:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5xr-0002RC-F4; Mon, 03 Jun 2024 11:34:59 +0000
Received: by outflank-mailman (input) for mailman id 734883;
 Mon, 03 Jun 2024 11:34:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5xq-0002Qn-61
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:34:58 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d5a9d82-219d-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 13:34:56 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 412FF2A963;
 Mon,  3 Jun 2024 07:34:56 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 37BC12A962;
 Mon,  3 Jun 2024 07:34:56 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 330182A961;
 Mon,  3 Jun 2024 07:34:54 -0400 (EDT)
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
X-Inumbo-ID: 4d5a9d82-219d-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=HkS7PEf8kJUA2RxHxXS98LEBr
	MEt1ID9/ioAN+1BsYg=; b=QqwbSLPTK4nhdLFUwp4v1x2GmmVp2h+6EoIzXwYYj
	G1q9DTzCDsn1Aj9XyY1fig+lx566ZbI3r3Xp2NODp6S9yY6s36UK9WJCogtXezyT
	pccqmwcnn7aDZbvaayqnU7Vb3EY1XawYZ5GHitOi62MyBIsLyixtP6n8cCRqLbYG
	Zs=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v3 14/16] ioreq: make arch_vcpu_ioreq_completion() an optional callback
Date: Mon,  3 Jun 2024 14:34:53 +0300
Message-Id: <a0f9c5ef8554d63e149afd0a413a27385c889faa.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 4CB4C53E-219D-11EF-A092-6488940A682E-90055647!pb-smtp2.pobox.com
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
 xen/arch/x86/hvm/ioreq.c   | 23 -----------------------
 xen/arch/x86/hvm/vmx/vmx.c | 16 ++++++++++++++++
 xen/common/ioreq.c         |  5 ++++-
 xen/include/xen/ioreq.h    |  2 +-
 5 files changed, 21 insertions(+), 31 deletions(-)

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
index 4eb7a70182..088650e007 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -29,29 +29,6 @@ bool arch_ioreq_complete_mmio(void)
     return handle_mmio();
 }
=20
-bool arch_vcpu_ioreq_completion(enum vio_completion completion)
-{
-    switch ( completion )
-    {
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
index f16faa6a61..7187d1819c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -10,6 +10,7 @@
 #include <xen/param.h>
 #include <xen/trace.h>
 #include <xen/sched.h>
+#include <xen/ioreq.h>
 #include <xen/irq.h>
 #include <xen/softirq.h>
 #include <xen/domain_page.h>
@@ -2749,6 +2750,20 @@ static void cf_check vmx_set_reg(struct vcpu *v, u=
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
@@ -3070,6 +3085,7 @@ const struct hvm_function_table * __init start_vmx(=
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


