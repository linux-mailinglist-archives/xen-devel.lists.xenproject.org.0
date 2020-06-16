Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EDE1FB601
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 17:22:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlDQG-00011J-EH; Tue, 16 Jun 2020 15:22:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xJom=75=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jlDQE-000115-EV
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 15:22:46 +0000
X-Inumbo-ID: 39ed800f-afe5-11ea-b8fb-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39ed800f-afe5-11ea-b8fb-12813bfff9fa;
 Tue, 16 Jun 2020 15:22:45 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 87EA5A2F1B;
 Tue, 16 Jun 2020 17:22:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7EFD5A2F86;
 Tue, 16 Jun 2020 17:22:43 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id k520iwlHXV1R; Tue, 16 Jun 2020 17:22:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A3E14A2F1B;
 Tue, 16 Jun 2020 17:22:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id S-E8qDuhu-li; Tue, 16 Jun 2020 17:22:42 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7883CA2EB4;
 Tue, 16 Jun 2020 17:22:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 6459D214C8;
 Tue, 16 Jun 2020 17:22:12 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ZJhkWkqAVr-5; Tue, 16 Jun 2020 17:22:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id C3771215F4;
 Tue, 16 Jun 2020 17:22:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id U8Kp1bAsH24b; Tue, 16 Jun 2020 17:22:06 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id A637C214C8;
 Tue, 16 Jun 2020 17:22:06 +0200 (CEST)
Date: Tue, 16 Jun 2020 17:22:06 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
In-Reply-To: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
Subject: [PATCH v1 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: KAn5ItxMsuAqHW3ZzkheyNf1oni9hhQhQ0/T
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Provide an interface for privileged domains to manage
external IPT monitoring.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/hvm/hvm.c          | 170 ++++++++++++++++++++++++++++++++
 xen/include/public/hvm/hvm_op.h |  27 +++++
 2 files changed, 197 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5bb47583b3..9292caebe0 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4949,6 +4949,172 @@ static int compat_altp2m_op(
     return rc;
 }
 
+static int do_vmtrace_op(
+    XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    struct xen_hvm_vmtrace_op a;
+    struct domain *d = NULL;
+    int rc = -EFAULT;
+    int i;
+    struct vcpu *v;
+    void* buf;
+    uint32_t buf_size;
+    uint32_t buf_order;
+    uint64_t buf_mfn;
+    struct page_info *pg;
+
+    if ( !hvm_ipt_supported() )
+        return -EOPNOTSUPP;
+
+    if ( copy_from_guest(&a, arg, 1) )
+        return -EFAULT;
+
+    if ( a.version != HVMOP_VMTRACE_INTERFACE_VERSION )
+        return -EINVAL;
+
+    switch ( a.cmd )
+    {
+    case HVMOP_vmtrace_ipt_enable:
+    case HVMOP_vmtrace_ipt_disable:
+    case HVMOP_vmtrace_ipt_get_buf:
+    case HVMOP_vmtrace_ipt_get_offset:
+        break;
+
+    default:
+        return -EOPNOTSUPP;
+    }
+
+    d = rcu_lock_domain_by_any_id(a.domain);
+
+    if ( d == NULL )
+        return -ESRCH;
+
+    if ( !is_hvm_domain(d) )
+    {
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    domain_pause(d);
+
+    if ( a.vcpu >= d->max_vcpus )
+    {
+        rc = -EINVAL;
+        goto out;
+    }
+
+    v = d->vcpu[a.vcpu];
+
+    if ( a.cmd == HVMOP_vmtrace_ipt_enable )
+    {
+        if ( v->arch.hvm.vmx.ipt_state ) {
+            // already enabled
+            rc = -EINVAL;
+            goto out;
+        }
+
+        if ( a.size < PAGE_SIZE || a.size > 1000000 * PAGE_SIZE ) {
+            // we don't accept trace buffer size smaller than single page
+            // and the upper bound is defined as 4GB in the specification
+            rc = -EINVAL;
+            goto out;
+	}
+
+        buf_order = get_order_from_bytes(a.size);
+
+        if ( (a.size >> PAGE_SHIFT) != (1 << buf_order) ) {
+            rc = -EINVAL;
+            goto out;
+        }
+
+        buf = page_to_virt(alloc_domheap_pages(d, buf_order, MEMF_no_refcount));
+        buf_size = a.size;
+
+        if ( !buf ) {
+            rc = -EFAULT;
+            goto out;
+        }
+
+        memset(buf, 0, buf_size);
+
+        for ( i = 0; i < (buf_size >> PAGE_SHIFT); i++ ) {
+            share_xen_page_with_privileged_guests(virt_to_page(buf) + i, SHARE_ro);
+        }
+
+        v->arch.hvm.vmx.ipt_state = xmalloc(struct ipt_state);
+        v->arch.hvm.vmx.ipt_state->output_base = virt_to_mfn(buf) << PAGE_SHIFT;
+        v->arch.hvm.vmx.ipt_state->output_mask = buf_size - 1;
+        v->arch.hvm.vmx.ipt_state->status = 0;
+        v->arch.hvm.vmx.ipt_state->ctl = RTIT_CTL_TRACEEN | RTIT_CTL_OS | RTIT_CTL_USR | RTIT_CTL_BRANCH_EN;
+    }
+    else if ( a.cmd == HVMOP_vmtrace_ipt_disable )
+    {
+        if ( !v->arch.hvm.vmx.ipt_state ) {
+            rc = -EINVAL;
+            goto out;
+        }
+
+        buf_mfn = v->arch.hvm.vmx.ipt_state->output_base >> PAGE_SHIFT;
+        buf_size = ( v->arch.hvm.vmx.ipt_state->output_mask + 1 ) & 0xFFFFFFFFUL;
+
+        for ( i = 0; i < (buf_size >> PAGE_SHIFT); i++ )
+        {
+            if ( (mfn_to_page(_mfn(buf_mfn + i))->count_info & PGC_count_mask) != 1 )
+            {
+                rc = -EBUSY;
+                goto out;
+            }
+        }
+
+        xfree(v->arch.hvm.vmx.ipt_state);
+	v->arch.hvm.vmx.ipt_state = NULL;
+
+        for ( i = 0; i < (buf_size >> PAGE_SHIFT); i++ )
+        {
+            pg = mfn_to_page(_mfn(buf_mfn + i));
+            put_page_alloc_ref(pg);
+            if ( !test_and_clear_bit(_PGC_xen_heap, &pg->count_info) )
+                ASSERT_UNREACHABLE();
+            pg->u.inuse.type_info = 0;
+            page_set_owner(pg, NULL);
+            free_domheap_page(pg);
+        }
+    }
+    else if ( a.cmd == HVMOP_vmtrace_ipt_get_buf )
+    {
+        if ( !v->arch.hvm.vmx.ipt_state ) {
+            rc = -EINVAL;
+            goto out;
+        }
+
+        a.mfn = v->arch.hvm.vmx.ipt_state->output_base >> PAGE_SHIFT;
+        a.size = (v->arch.hvm.vmx.ipt_state->output_mask + 1) & 0xFFFFFFFFUL;
+    }
+    else if ( a.cmd == HVMOP_vmtrace_ipt_get_offset )
+    {
+        if ( !v->arch.hvm.vmx.ipt_state ) {
+            rc = -EINVAL;
+            goto out;
+        }
+
+        a.offset = v->arch.hvm.vmx.ipt_state->output_mask >> 32;
+    }
+
+    rc = -EFAULT;
+    if ( __copy_to_guest(arg, &a, 1) )
+      goto out;
+    rc = 0;
+
+ out:
+    smp_wmb();
+    domain_unpause(d);
+    rcu_unlock_domain(d);
+
+    return rc;
+}
+
+DEFINE_XEN_GUEST_HANDLE(compat_hvm_vmtrace_op_t);
+
 static int hvmop_get_mem_type(
     XEN_GUEST_HANDLE_PARAM(xen_hvm_get_mem_type_t) arg)
 {
@@ -5101,6 +5267,10 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = current->hcall_compat ? compat_altp2m_op(arg) : do_altp2m_op(arg);
         break;
 
+    case HVMOP_vmtrace:
+        rc = do_vmtrace_op(arg);
+        break;
+
     default:
     {
         gdprintk(XENLOG_DEBUG, "Bad HVM op %ld.\n", op);
diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm_op.h
index 870ec52060..3bbcd54c96 100644
--- a/xen/include/public/hvm/hvm_op.h
+++ b/xen/include/public/hvm/hvm_op.h
@@ -382,6 +382,33 @@ struct xen_hvm_altp2m_op {
 typedef struct xen_hvm_altp2m_op xen_hvm_altp2m_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_op_t);
 
+/* HVMOP_vmtrace: Perform VM tracing related operation */
+#define HVMOP_vmtrace 26
+
+#define HVMOP_VMTRACE_INTERFACE_VERSION 0x00000001
+
+struct xen_hvm_vmtrace_op {
+    /* IN variable */
+    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
+    uint32_t cmd;
+/* Enable/disable external vmtrace for given domain */
+#define HVMOP_vmtrace_ipt_enable      1
+#define HVMOP_vmtrace_ipt_disable     2
+#define HVMOP_vmtrace_ipt_get_buf     3
+#define HVMOP_vmtrace_ipt_get_offset  4
+    domid_t domain;
+    uint32_t vcpu;
+
+    /* IN/OUT variable */
+    uint64_t size;
+
+    /* OUT variable */
+    uint64_t mfn;
+    uint64_t offset;
+};
+typedef struct xen_hvm_vmtrace_op xen_hvm_vmtrace_op_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_vmtrace_op_t);
+
 #endif /* __XEN_PUBLIC_HVM_HVM_OP_H__ */
 
 /*
-- 
2.20.1


