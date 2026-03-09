Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CKjH5m9rmlEIgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:31:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E007238DD2
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249410.1546907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlP-0006Ri-C6; Mon, 09 Mar 2026 12:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249410.1546907; Mon, 09 Mar 2026 12:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlP-0006Mu-7P; Mon, 09 Mar 2026 12:31:11 +0000
Received: by outflank-mailman (input) for mailman id 1249410;
 Mon, 09 Mar 2026 12:31:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Suo=BJ=bounce.vates.tech=bounce-md_30504962.69aebd88.v1-441784b254ef4839bf5042d28ceb1d2a@srs-se1.protection.inumbo.net>)
 id 1vzZlN-0005Rm-S6
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 12:31:09 +0000
Received: from mail133-21.atl131.mandrillapp.com
 (mail133-21.atl131.mandrillapp.com [198.2.133.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d85bf670-1bb3-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 13:31:07 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fTxFN0mS4z1XLF8g
 for <xen-devel@lists.xenproject.org>; Mon,  9 Mar 2026 12:31:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 441784b254ef4839bf5042d28ceb1d2a; Mon, 09 Mar 2026 12:31:04 +0000
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
X-Inumbo-ID: d85bf670-1bb3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773059464; x=1773329464;
	bh=yBW+Fz2L+XcrjXyP9HkaoTV/8bPAxt7aYNJZwU0t0XE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Xp5sdVjacc8RnFuJfvcwe/ETbTNzpRkkisANXtaG+bzfnCJCTnHgu0a52lBF5xaQm
	 9I6r45bJF7sle0zkAau8V8Qz625BoaABloS3uIVZYlCT2HpAN2ip/w499YIodnudLi
	 pKJg1OOWdw3dsMLn41ltdBg8I27RyAk6QLWisSzIluNlrC9q5iN25+3prPNktHr+/c
	 hiRPu6/qaA2lTVYXFi1XBPfsAAOjYFNQIhWGbcJHRj3mxMI9whVJ41O4IfZZwGY99S
	 og25ajL4U9VNjrnBY9bVnCmypEnWDc3sAh2rosxZM0H0oEYvbamYcZpVGymiuxbsfq
	 390Y1somR984w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773059464; x=1773319964; i=julian.vetter@vates.tech;
	bh=yBW+Fz2L+XcrjXyP9HkaoTV/8bPAxt7aYNJZwU0t0XE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=K4A7jHYikj0Wkbrr2AKIEeyof7Rq8okhJSvjsk6pwZDMfA3sBluTQdl91wwTm74xK
	 JEhHOxh6IP9/0Eoi0bUduHJRP+2itT4u7+emMqbGGm48BdA6pzJj+gnDetw68ltFfR
	 5gjQInr3qaSTYVRBoM6q9ZeREdvOMvf51a3fkGKEjWKw2ElrHoh5OTbgpy/jJBJdBX
	 rPkQnucPDz8WjCKAt8YTV9sB9i38KecEFMN3xIgHX6w7R3RgejpKEaEXvVEMkv0niP
	 rgi2ixNZS295D20Dst9Whsdw3065WciTgevDdQQvojunNwQj+SCuprzlwoYNXcGl7A
	 NFhcxTqpk7V3Q==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=205/7]=20x86/dmop:=20Add=20XEN=5FDMOP=5F{bind,unbind}=5Fpt=5Fmsi=5Firq=20DM=20ops?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773059462800
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Julien Grall" <julien@xen.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260309123055.880050-5-julian.vetter@vates.tech>
In-Reply-To: <20260309123055.880050-1-julian.vetter@vates.tech>
References: <20260309123055.880050-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.441784b254ef4839bf5042d28ceb1d2a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260309:md
Date: Mon, 09 Mar 2026 12:31:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2E007238DD2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_HAM(-0.00)[-0.362];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Add two DM ops for MSI passthrough IRQs. These new DM ops take the raw
MSI address and data fields rather than a pre-decoded gflags values. Xen
decodes the destination ID via msi_addr_to_gflags(), including any
extended destination bits in address[11:5]. This means the device model
does not need to understand the extended destination ID encoding, and
simply forwards the MSI address it observes from the guest.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in V3:
- New patch addressing feedback from Roger
---
 tools/include/xendevicemodel.h |  37 ++++++++++++
 tools/libs/devicemodel/core.c  |  44 ++++++++++++++
 xen/arch/x86/hvm/dm.c          | 102 +++++++++++++++++++++++++++++++++
 xen/include/public/hvm/dm_op.h |  23 ++++++++
 xen/include/xlat.lst           |   1 +
 5 files changed, 207 insertions(+)

diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
index 227e7fd810..0d5d7b0ff1 100644
--- a/tools/include/xendevicemodel.h
+++ b/tools/include/xendevicemodel.h
@@ -375,6 +375,43 @@ int xendevicemodel_nr_vcpus(
  */
 int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid);
 
+/**
+ * This function binds a passthrough physical IRQ to a guest MSI vector
+ * using raw MSI address/data fields. Unlike XEN_DOMCTL_bind_pt_irq,
+ * this interface supports extended (15-bit) destination IDs by having
+ * Xen decode the MSI address internally.
+ *
+ * @parm dmod a handle to an open devicemodel interface.
+ * @parm domid the domain id to be serviced.
+ * @parm machine_irq the physical IRQ number (pirq).
+ * @parm gvec the guest interrupt vector.
+ * @parm msi_addr the MSI address (0xfeexxxxx, includes extended dest ID).
+ * @parm msi_data the MSI data (vector, delivery mode, trigger mode).
+ * @parm gtable the MSI-X table base GFN, or 0 for plain MSI.
+ * @parm unmasked if non-zero, leave the IRQ unmasked after binding.
+ * @return 0 on success, -1 on failure.
+ */
+int xendevicemodel_bind_pt_msi_irq(
+    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
+    uint8_t gvec, uint64_t msi_addr, uint32_t msi_data, uint64_t gtable,
+    int unmasked);
+
+/**
+ * This function unbinds a passthrough physical IRQ previously bound
+ * with xendevicemodel_bind_pt_msi_irq.
+ *
+ * @parm dmod a handle to an open devicemodel interface.
+ * @parm domid the domain id to be serviced.
+ * @parm machine_irq the physical IRQ number (pirq).
+ * @parm gvec the guest interrupt vector.
+ * @parm msi_addr the MSI address.
+ * @parm msi_data the MSI data.
+ * @return 0 on success, -1 on failure.
+ */
+int xendevicemodel_unbind_pt_msi_irq(
+    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
+    uint8_t gvec, uint64_t msi_addr, uint32_t msi_data);
+
 #endif /* XENDEVICEMODEL_H */
 
 /*
diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
index 8e619eeb0a..4a52fe4750 100644
--- a/tools/libs/devicemodel/core.c
+++ b/tools/libs/devicemodel/core.c
@@ -645,6 +645,50 @@ int xendevicemodel_nr_vcpus(
     return 0;
 }
 
+int xendevicemodel_bind_pt_msi_irq(
+    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
+    uint8_t gvec, uint64_t msi_addr, uint32_t msi_data, uint64_t gtable,
+    int unmasked)
+{
+    struct xen_dm_op op;
+    struct xen_dm_op_bind_pt_msi_irq *data;
+
+    memset(&op, 0, sizeof(op));
+
+    op.op = XEN_DMOP_bind_pt_msi_irq;
+    data = &op.u.bind_pt_msi_irq;
+
+    data->machine_irq = machine_irq;
+    data->gvec = gvec;
+    data->data = msi_data;
+    data->addr = msi_addr;
+    data->gtable = gtable;
+    if ( unmasked )
+        data->flags |= XEN_DMOP_MSI_FLAG_UNMASKED;
+
+    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
+}
+
+int xendevicemodel_unbind_pt_msi_irq(
+    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
+    uint8_t gvec, uint64_t msi_addr, uint32_t msi_data)
+{
+    struct xen_dm_op op;
+    struct xen_dm_op_bind_pt_msi_irq *data;
+
+    memset(&op, 0, sizeof(op));
+
+    op.op = XEN_DMOP_unbind_pt_msi_irq;
+    data = &op.u.bind_pt_msi_irq;
+
+    data->machine_irq = machine_irq;
+    data->gvec = gvec;
+    data->data = msi_data;
+    data->addr = msi_addr;
+
+    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
+}
+
 int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid)
 {
     return osdep_xendevicemodel_restrict(dmod, domid);
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 3b53471af0..3d530d948f 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -7,12 +7,15 @@
 #include <xen/guest_access.h>
 #include <xen/dm.h>
 #include <xen/hypercall.h>
+#include <xen/iocap.h>
+#include <xen/iommu.h>
 #include <xen/ioreq.h>
 #include <xen/nospec.h>
 #include <xen/sched.h>
 
 #include <asm/hap.h>
 #include <asm/hvm/cacheattr.h>
+#include <asm/msi.h>
 #include <asm/shadow.h>
 
 #include <xsm/xsm.h>
@@ -322,6 +325,25 @@ static int inject_event(struct domain *d,
     return 0;
 }
 
+static uint32_t msi_addr_to_gflags(uint64_t addr, uint32_t data, bool masked)
+{
+    uint32_t tmp = (uint32_t)addr;
+
+    return MASK_INSR(MASK_EXTR(tmp, MSI_ADDR_DEST_ID_MASK),
+                     XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) |
+           MASK_INSR(MASK_EXTR(tmp, MSI_ADDR_EXT_DEST_ID_MASK),
+                     XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK) |
+           MASK_INSR(MASK_EXTR(tmp, MSI_ADDR_REDIRECTION_MASK),
+                     XEN_DOMCTL_VMSI_X86_RH_MASK) |
+           MASK_INSR(MASK_EXTR(tmp, MSI_ADDR_DESTMODE_MASK),
+                     XEN_DOMCTL_VMSI_X86_DM_MASK) |
+           MASK_INSR(MASK_EXTR(data, MSI_DATA_DELIVERY_MODE_MASK),
+                     XEN_DOMCTL_VMSI_X86_DELIV_MASK) |
+           MASK_INSR(MASK_EXTR(data, MSI_DATA_TRIGGER_MASK),
+                     XEN_DOMCTL_VMSI_X86_TRIG_MASK) |
+           (masked ? 0 : XEN_DOMCTL_VMSI_X86_UNMASKED);
+}
+
 int dm_op(const struct dmop_args *op_args)
 {
     struct domain *d;
@@ -350,6 +372,8 @@ int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_relocate_memory]                  = sizeof(struct xen_dm_op_relocate_memory),
         [XEN_DMOP_pin_memory_cacheattr]             = sizeof(struct xen_dm_op_pin_memory_cacheattr),
         [XEN_DMOP_nr_vcpus]                         = sizeof(struct xen_dm_op_nr_vcpus),
+        [XEN_DMOP_bind_pt_msi_irq]                  = sizeof(struct xen_dm_op_bind_pt_msi_irq),
+        [XEN_DMOP_unbind_pt_msi_irq]                = sizeof(struct xen_dm_op_bind_pt_msi_irq),
     };
 
     rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
@@ -607,6 +631,83 @@ int dm_op(const struct dmop_args *op_args)
         break;
     }
 
+    case XEN_DMOP_bind_pt_msi_irq:
+    {
+        const struct xen_dm_op_bind_pt_msi_irq *data =
+            &op.u.bind_pt_msi_irq;
+        struct xen_domctl_bind_pt_irq bind = {
+            .machine_irq = data->machine_irq,
+            .irq_type = PT_IRQ_TYPE_MSI,
+        };
+        int irq;
+
+        rc = -EINVAL;
+        if ( data->pad0 || data->pad1 )
+            break;
+
+        if ( data->flags & ~XEN_DMOP_MSI_FLAG_UNMASKED )
+            break;
+
+        irq = domain_pirq_to_irq(d, bind.machine_irq);
+
+        rc = -EPERM;
+        if ( irq <= 0 || !irq_access_permitted(current->domain, irq) )
+            break;
+
+        bind.u.msi.gvec = data->gvec;
+        bind.u.msi.gflags =
+            msi_addr_to_gflags(data->addr, data->data,
+                               !(data->flags & XEN_DMOP_MSI_FLAG_UNMASKED));
+        bind.u.msi.gtable = data->gtable;
+
+        rc = -ESRCH;
+        if ( is_iommu_enabled(d) )
+        {
+            pcidevs_lock();
+            rc = pt_irq_create_bind(d, &bind);
+            pcidevs_unlock();
+        }
+        if ( rc < 0 )
+            printk(XENLOG_G_ERR
+                   "pt_irq_create_bind failed (%ld) for dom%d\n",
+                   rc, d->domain_id);
+        break;
+    }
+
+    case XEN_DMOP_unbind_pt_msi_irq:
+    {
+        const struct xen_dm_op_bind_pt_msi_irq *data =
+            &op.u.bind_pt_msi_irq;
+        struct xen_domctl_bind_pt_irq bind = {
+            .machine_irq = data->machine_irq,
+            .irq_type = PT_IRQ_TYPE_MSI,
+        };
+        int irq;
+
+        rc = -EINVAL;
+        if ( data->pad0 || data->pad1 )
+            break;
+
+        irq = domain_pirq_to_irq(d, bind.machine_irq);
+
+        rc = -EPERM;
+        if ( irq <= 0 || !irq_access_permitted(current->domain, irq) )
+            break;
+
+        rc = -ESRCH;
+        if ( is_iommu_enabled(d) )
+        {
+            pcidevs_lock();
+            rc = pt_irq_destroy_bind(d, &bind);
+            pcidevs_unlock();
+        }
+        if ( rc < 0 )
+            printk(XENLOG_G_ERR
+                   "pt_irq_destroy_bind failed (%ld) for dom%d\n",
+                   rc, d->domain_id);
+        break;
+    }
+
     default:
         rc = ioreq_server_dm_op(&op, d, &const_op);
         break;
@@ -643,6 +744,7 @@ CHECK_dm_op_remote_shutdown;
 CHECK_dm_op_relocate_memory;
 CHECK_dm_op_pin_memory_cacheattr;
 CHECK_dm_op_nr_vcpus;
+CHECK_dm_op_bind_pt_msi_irq;
 
 int compat_dm_op(
     domid_t domid, unsigned int nr_bufs, XEN_GUEST_HANDLE_PARAM(void) bufs)
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index 2bf0fdc1ae..fd0f3a6a99 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -444,6 +444,28 @@ struct xen_dm_op_nr_vcpus {
 };
 typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
 
+#define XEN_DMOP_bind_pt_msi_irq   21
+#define XEN_DMOP_unbind_pt_msi_irq 22
+
+struct xen_dm_op_bind_pt_msi_irq {
+    /* IN - physical IRQ (pirq) */
+    uint32_t machine_irq;
+    /* IN - guest vector */
+    uint8_t  gvec;
+    uint8_t  pad0;
+    uint16_t pad1;
+    /* IN - MSI data (vector, delivery, trigger) */
+    uint32_t data;
+    /* IN - flags */
+    uint32_t flags;
+#define XEN_DMOP_MSI_FLAG_UNMASKED (1u << 0)
+    /* IN - MSI address (0xfeexxxxx, includes ext dest) */
+    uint64_aligned_t addr;
+    /* IN - MSI-X table base GFN, 0 for MSI */
+    uint64_aligned_t gtable;
+};
+typedef struct xen_dm_op_bind_pt_msi_irq xen_dm_op_bind_pt_msi_irq_t;
+
 struct xen_dm_op {
     uint32_t op;
     uint32_t pad;
@@ -468,6 +490,7 @@ struct xen_dm_op {
         xen_dm_op_relocate_memory_t relocate_memory;
         xen_dm_op_pin_memory_cacheattr_t pin_memory_cacheattr;
         xen_dm_op_nr_vcpus_t nr_vcpus;
+        xen_dm_op_bind_pt_msi_irq_t bind_pt_msi_irq;
     } u;
 };
 
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 9d08dcc4bb..9236394786 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -107,6 +107,7 @@
 ?	dm_op_map_mem_type_to_ioreq_server hvm/dm_op.h
 ?	dm_op_modified_memory		hvm/dm_op.h
 ?	dm_op_nr_vcpus			hvm/dm_op.h
+?	dm_op_bind_pt_msi_irq		hvm/dm_op.h
 ?	dm_op_pin_memory_cacheattr	hvm/dm_op.h
 ?	dm_op_relocate_memory		hvm/dm_op.h
 ?	dm_op_remote_shutdown		hvm/dm_op.h
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


