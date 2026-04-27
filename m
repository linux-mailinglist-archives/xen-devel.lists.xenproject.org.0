Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JwNEtJq72nEBAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D455A473D2A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294894.1571651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQS-0001ug-Sp; Mon, 27 Apr 2026 13:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294894.1571651; Mon, 27 Apr 2026 13:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQS-0001sF-N5; Mon, 27 Apr 2026 13:55:04 +0000
Received: by outflank-mailman (input) for mailman id 1294894;
 Mon, 27 Apr 2026 13:55:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf388597000f373@swg.vates.tech>)
 id 1wHMQR-0001kk-6N
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 13:55:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHMQQ-005eBs-J5
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:55:02 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf388597000f373@swg.vates.tech>)
 id 69ef6ab0-e002-0a2a0a5209dd-0a2a450ac9a4-36
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:55:02 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf388597000f373@swg.vates.tech>)
 id 69ef6aa4-56b3-0a2a450a0019-b9ff1c22a053-10
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:55:02 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dcf388597000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 13:54:41 +0000
Received: from julian.home (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8F2F687780;
 Mon, 27 Apr 2026 15:54:40 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=fb9qQ4Oy3R3zTDsEr6x8vu/WfuHkFi3ghUo/wdwnt1Y=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=IqwssKnDVxCJpbbQKCAEJjw4WT4LRnOG6hBMv78r7DaF+EwglVun2Z4rVGSyinJbW9H5LWfIN
 u2Mp05URK1ubnDHLmDz+PU39UuJZE1jkBsUFOqsVOV/Jjozz2F06FsZHdlPhHBsVrJ5a2Hl7Teh
 Yj8Dm2SWQtBTdhVhz44cBS3AlMg5fjYXDQJb6w9za/OXGYkHLPGfqTTdAcde/Lw2FEQTUMekmI4
 X5p+koV1STvyieat9302NP3R6RL9OMvZlB2GGqkKTwmBPWEaj/ePhzrDqGP06NQreObh1oXcTDt
 zBHHvA51gUGra5t0nu8DKBBaG+vePt+LbJrELn+vNClg==
X-Zone-Loop: 336f26e275b72a81053cef767e6ae18783a3e15c6e95
x-campaign-type: default
x-transaction-id: 7c916762-bf9c-427c-8786-b205dece7fff
x-swg-uid: 01-04adf360-3bb4-4464-8ed0-3dde4819b018
X-Mailer: Sweego
Message-ID:
 <1777298081.8631fc262581453bbf619ec5b2062170.19dcf388597000f373@vates.tech>
x-swg-bid: 1777298081.8631fc262581453bbf619ec5b2062170.19dcf388597000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v4 7/9] x86/dmop: Add XEN_DMOP_{bind,unbind}_pt_msi_irq DM ops
Date: Mon, 27 Apr 2026 15:54:04 +0200
In-Reply-To: <20260427135406.1281424-1-julian.vetter@vates.tech>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2979.83d4fb820ba3c81.19dcf38841e.d33788981f0c79f2=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777298080799
X-purgate-ID: tlsNG-4011c0/1777298102-469768B7-12D4CAB3/0/0
X-purgate-type: clean
X-purgate-size: 16262
X-Rspamd-Queue-Id: D455A473D2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:teddy.astie@vates.tech,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.2979.83d4fb820ba3c81.19dcf38841e.d33788981f0c79f2=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add two DM ops for MSI passthrough IRQs=2E These new DM ops take the raw
MSI address and data fields rather than pre-decoded gflags values=2E Xen
decodes the destination ID via msi_addr_to_gflags(), including any
extended destination bits in address[11:5]=2E This means the device model
does not need to understand the extended destination ID encoding, and
simply forwards the MSI address it observes from the guest=2E

With these DM ops in place, redirect xc_domain_update_msi_irq() and
xc_domain_unbind_msi_irq() in libxenctrl to use
xendevicemodel_bind_pt_msi_irq() / xendevicemodel_unbind_pt_msi_irq()
via xch->dmod=2E The gflags/gvec arguments are translated to the raw MSI
address and data words at the libxc level using the standard x86 MSI
address format=2E

Reject the PT_IRQ_TYPE_MSI sub-case in XEN_DOMCTL_bind_pt_irq and
XEN_DOMCTL_unbind_pt_irq: all callers now go through the DM op path, so
the domctl sub-case is fully obsolete=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v4:
- Corresponds to v3 patch 5, but with feedback from Jan
- Redirect xc_domain_{update,unbind}_msi_irq() in libxenctrl to call
  xendevicemodel_{un}bind_pt_msi_irq() via xch->dmod, translating the
  existing gflags/gvec arguments to raw MSI address and data in libxc
- As suggested by Jan, reject the PT_IRQ_TYPE_MSI sub-case in
  XEN_DOMCTL_{bind,unbind}_pt_irq with -EOPNOTSUPP -> All callers now go
  through the DM op path, making the domctl sub-case fully obsolete
- Added the xlat=2Elst entry for dm_op_unbind_pt_msi_irq (v3 added only th=
e
  bind entry)
---
 tools/include/xendevicemodel=2Eh    | 31 ++++++++++++++
 tools/libs/ctrl/xc_domain=2Ec       | 52 +++++++++++------------
 tools/libs/devicemodel/core=2Ec     | 38 +++++++++++++++++
 xen/arch/x86/domctl=2Ec             | 10 ++++-
 xen/arch/x86/hvm/dm=2Ec             | 68 +++++++++++++++++++++++++++++++
 xen/drivers/passthrough/x86/hvm=2Ec |  1 -
 xen/include/public/hvm/dm_op=2Eh    | 37 +++++++++++++++++
 xen/include/xlat=2Elst              |  2 +
 8 files changed, 208 insertions(+), 31 deletions(-)

diff --git a/tools/include/xendevicemodel=2Eh b/tools/include/xendevicemod=
el=2Eh
index 227e7fd810=2E=2Ef15b35fa33 100644
--- a/tools/include/xendevicemodel=2Eh
+++ b/tools/include/xendevicemodel=2Eh
@@ -375,6 +375,37 @@ int xendevicemodel_nr_vcpus(
  */
 int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid);
=20
+/**
+ * This function binds a passthrough physical IRQ to a guest MSI vector
+ * using raw MSI address/data fields=2E Unlike XEN_DOMCTL_bind_pt_irq,
+ * this interface supports extended (15-bit) destination IDs by having
+ * Xen decode the MSI address internally=2E
+ *
+ * @parm dmod a handle to an open devicemodel interface=2E
+ * @parm domid the domain id to be serviced=2E
+ * @parm machine_irq the physical IRQ number (pirq)=2E
+ * @parm msi_addr the MSI address (includes ext=2E dest=2E ID bits [11:5]=
)=2E
+ * @parm msi_data the MSI data word (bits [7:0] are the guest vector)=2E
+ * @parm gtable the MSI-X table base GFN, or 0 for plain MSI=2E
+ * @parm unmasked if non-zero, leave the IRQ unmasked after binding=2E
+ * @return 0 on success, -1 on failure=2E
+ */
+int xendevicemodel_bind_pt_msi_irq(
+    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
+    uint64_t msi_addr, uint32_t msi_data, uint64_t gtable, int unmasked);
+
+/**
+ * This function unbinds a passthrough physical IRQ previously bound
+ * with xendevicemodel_bind_pt_msi_irq=2E
+ *
+ * @parm dmod a handle to an open devicemodel interface=2E
+ * @parm domid the domain id to be serviced=2E
+ * @parm machine_irq the physical IRQ number (pirq)=2E
+ * @return 0 on success, -1 on failure=2E
+ */
+int xendevicemodel_unbind_pt_msi_irq(
+    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq);
+
 #endif /* XENDEVICEMODEL_H */
=20
 /*
diff --git a/tools/libs/ctrl/xc_domain=2Ec b/tools/libs/ctrl/xc_domain=2Ec
index 01c0669c88=2E=2E7e3b7a0dc6 100644
--- a/tools/libs/ctrl/xc_domain=2Ec
+++ b/tools/libs/ctrl/xc_domain=2Ec
@@ -1677,6 +1677,21 @@ int xc_deassign_dt_device(
=20
=20
=20
+static void xc_msi_gflags_to_addr_data(uint32_t gvec, uint32_t gflags,
+                                        uint64_t *msi_addr, uint32_t *msi=
_data)
+{
+    *msi_addr =3D 0xfee00000U |
+        ((uint64_t)((gflags & XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) << 12)) |
+        (gflags & XEN_DOMCTL_VMSI_X86_RH_MASK ? (1U << 3) : 0) |
+        (gflags & XEN_DOMCTL_VMSI_X86_DM_MASK ? (1U << 2) : 0);
+
+    *msi_data =3D (gvec & 0xff) |
+        (uint32_t)(((gflags & XEN_DOMCTL_VMSI_X86_DELIV_MASK) >>
+                    (/* shift of XEN_DOMCTL_VMSI_X86_DELIV_MASK */ 12 -
+                     /* MSI data delivery shift */ 8))) |
+        (gflags & XEN_DOMCTL_VMSI_X86_TRIG_MASK ? (1U << 15) : 0);
+}
+
 int xc_domain_update_msi_irq(
     xc_interface *xch,
     uint32_t domid,
@@ -1685,22 +1700,15 @@ int xc_domain_update_msi_irq(
     uint32_t gflags,
     uint64_t gtable)
 {
-    int rc;
-    struct xen_domctl_bind_pt_irq *bind;
-    struct xen_domctl domctl =3D {};
-
-    domctl=2Ecmd =3D XEN_DOMCTL_bind_pt_irq;
-    domctl=2Edomain =3D domid;
+    uint64_t msi_addr;
+    uint32_t msi_data;
+    int unmasked =3D !!(gflags & XEN_DOMCTL_VMSI_X86_UNMASKED);
=20
-    bind =3D &(domctl=2Eu=2Ebind_pt_irq);
-    bind->irq_type =3D PT_IRQ_TYPE_MSI;
-    bind->machine_irq =3D pirq;
-    bind->u=2Emsi=2Egvec =3D gvec;
-    bind->u=2Emsi=2Egflags =3D gflags;
-    bind->u=2Emsi=2Egtable =3D gtable;
+    xc_msi_gflags_to_addr_data(gvec, gflags, &msi_addr, &msi_data);
=20
-    rc =3D do_domctl(xch, &domctl);
-    return rc;
+    return xendevicemodel_bind_pt_msi_irq(xch->dmod, domid, pirq,
+                                          msi_addr, msi_data, gtable,
+                                          unmasked);
 }
=20
 int xc_domain_unbind_msi_irq(
@@ -1710,21 +1718,7 @@ int xc_domain_unbind_msi_irq(
     uint32_t pirq,
     uint32_t gflags)
 {
-    int rc;
-    struct xen_domctl_bind_pt_irq *bind;
-    struct xen_domctl domctl =3D {};
-
-    domctl=2Ecmd =3D XEN_DOMCTL_unbind_pt_irq;
-    domctl=2Edomain =3D domid;
-
-    bind =3D &(domctl=2Eu=2Ebind_pt_irq);
-    bind->irq_type =3D PT_IRQ_TYPE_MSI;
-    bind->machine_irq =3D pirq;
-    bind->u=2Emsi=2Egvec =3D gvec;
-    bind->u=2Emsi=2Egflags =3D gflags;
-
-    rc =3D do_domctl(xch, &domctl);
-    return rc;
+    return xendevicemodel_unbind_pt_msi_irq(xch->dmod, domid, pirq);
 }
=20
 /* Pass-through: binds machine irq to guests irq */
diff --git a/tools/libs/devicemodel/core=2Ec b/tools/libs/devicemodel/core=
=2Ec
index 8e619eeb0a=2E=2Eadf2c41a96 100644
--- a/tools/libs/devicemodel/core=2Ec
+++ b/tools/libs/devicemodel/core=2Ec
@@ -645,6 +645,44 @@ int xendevicemodel_nr_vcpus(
     return 0;
 }
=20
+int xendevicemodel_bind_pt_msi_irq(
+    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
+    uint64_t msi_addr, uint32_t msi_data, uint64_t gtable, int unmasked)
+{
+    struct xen_dm_op op;
+    struct xen_dm_op_bind_pt_msi_irq *data;
+
+    memset(&op, 0, sizeof(op));
+
+    op=2Eop =3D XEN_DMOP_bind_pt_msi_irq;
+    data =3D &op=2Eu=2Ebind_pt_msi_irq;
+
+    data->machine_irq =3D machine_irq;
+    data->data =3D msi_data;
+    data->addr =3D msi_addr;
+    data->gtable =3D gtable;
+    if ( unmasked )
+        data->flags |=3D XEN_DMOP_MSI_FLAG_UNMASKED;
+
+    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
+}
+
+int xendevicemodel_unbind_pt_msi_irq(
+    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq)
+{
+    struct xen_dm_op op;
+    struct xen_dm_op_unbind_pt_msi_irq *data;
+
+    memset(&op, 0, sizeof(op));
+
+    op=2Eop =3D XEN_DMOP_unbind_pt_msi_irq;
+    data =3D &op=2Eu=2Eunbind_pt_msi_irq;
+
+    data->machine_irq =3D machine_irq;
+
+    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
+}
+
 int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid)
 {
     return osdep_xendevicemodel_restrict(dmod, domid);
diff --git a/xen/arch/x86/domctl=2Ec b/xen/arch/x86/domctl=2Ec
index bfbc35c08b=2E=2Ed80a33fe40 100644
--- a/xen/arch/x86/domctl=2Ec
+++ b/xen/arch/x86/domctl=2Ec
@@ -574,6 +574,14 @@ long arch_do_domctl(
         if ( !is_hvm_domain(d) )
             break;
=20
+        /*
+         * PT_IRQ_TYPE_MSI is obsoleted by XEN_DMOP_bind_pt_msi_irq, whic=
h
+         * passes raw MSI address/data so Xen can decode extended destina=
tion
+         * ID bits=2E Device models must use the DM op path instead=2E
+         */
+        if ( bind->irq_type =3D=3D PT_IRQ_TYPE_MSI )
+            break;
+
         ret =3D xsm_bind_pt_irq(XSM_HOOK, d, bind);
         if ( ret )
             break;
@@ -602,7 +610,7 @@ long arch_do_domctl(
         int irq =3D domain_pirq_to_irq(d, bind->machine_irq);
=20
         ret =3D -EINVAL;
-        if ( !is_hvm_domain(d) )
+        if ( !is_hvm_domain(d) || bind->irq_type =3D=3D PT_IRQ_TYPE_MSI )
             break;
=20
         ret =3D -EPERM;
diff --git a/xen/arch/x86/hvm/dm=2Ec b/xen/arch/x86/hvm/dm=2Ec
index 3b53471af0=2E=2Eac70cb6405 100644
--- a/xen/arch/x86/hvm/dm=2Ec
+++ b/xen/arch/x86/hvm/dm=2Ec
@@ -7,6 +7,8 @@
 #include <xen/guest_access=2Eh>
 #include <xen/dm=2Eh>
 #include <xen/hypercall=2Eh>
+#include <xen/iocap=2Eh>
+#include <xen/iommu=2Eh>
 #include <xen/ioreq=2Eh>
 #include <xen/nospec=2Eh>
 #include <xen/sched=2Eh>
@@ -350,6 +352,8 @@ int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_relocate_memory]                  =3D sizeof(struct xen=
_dm_op_relocate_memory),
         [XEN_DMOP_pin_memory_cacheattr]             =3D sizeof(struct xen=
_dm_op_pin_memory_cacheattr),
         [XEN_DMOP_nr_vcpus]                         =3D sizeof(struct xen=
_dm_op_nr_vcpus),
+        [XEN_DMOP_bind_pt_msi_irq]                  =3D sizeof(struct xen=
_dm_op_bind_pt_msi_irq),
+        [XEN_DMOP_unbind_pt_msi_irq]                =3D sizeof(struct xen=
_dm_op_unbind_pt_msi_irq),
     };
=20
     rc =3D rcu_lock_remote_domain_by_id(op_args->domid, &d);
@@ -607,6 +611,68 @@ int dm_op(const struct dmop_args *op_args)
         break;
     }
=20
+    case XEN_DMOP_bind_pt_msi_irq:
+    {
+        const struct xen_dm_op_bind_pt_msi_irq *data =3D
+            &op=2Eu=2Ebind_pt_msi_irq;
+        int irq;
+
+        rc =3D -EINVAL;
+        if ( data->pad || (data->flags & ~XEN_DMOP_MSI_FLAG_UNMASKED) )
+            break;
+
+        irq =3D domain_pirq_to_irq(d, data->machine_irq);
+
+        rc =3D -EPERM;
+        if ( irq <=3D 0 || !irq_access_permitted(current->domain, irq) )
+            break;
+
+        rc =3D -ESRCH;
+        if ( is_iommu_enabled(d) )
+        {
+            read_lock(&d->pci_lock);
+            rc =3D pt_irq_bind_msi(d, data->machine_irq, data->addr, data=
->data,
+                                 data->gtable,
+                                 !!(data->flags & XEN_DMOP_MSI_FLAG_UNMAS=
KED));
+            read_unlock(&d->pci_lock);
+        }
+        if ( rc < 0 )
+            printk(XENLOG_G_ERR
+                   "XEN_DMOP_bind_pt_msi_irq: pt_irq_bind_msi failed (%ld=
) for %pd\n",
+                   rc, d);
+        break;
+    }
+
+    case XEN_DMOP_unbind_pt_msi_irq:
+    {
+        const struct xen_dm_op_unbind_pt_msi_irq *data =3D
+            &op=2Eu=2Eunbind_pt_msi_irq;
+        struct xen_domctl_bind_pt_irq bind =3D {
+            =2Emachine_irq =3D data->machine_irq,
+            =2Eirq_type =3D PT_IRQ_TYPE_MSI,
+        };
+        int irq;
+
+        irq =3D domain_pirq_to_irq(d, bind=2Emachine_irq);
+
+        rc =3D -EPERM;
+        if ( irq <=3D 0 || !irq_access_permitted(current->domain, irq) )
+            break;
+
+        rc =3D -ESRCH;
+        if ( is_iommu_enabled(d) )
+        {
+            read_lock(&d->pci_lock);
+            rc =3D pt_irq_destroy_bind(d, &bind);
+            read_unlock(&d->pci_lock);
+        }
+        if ( rc < 0 )
+            printk(XENLOG_G_ERR
+                   "XEN_DMOP_unbind_pt_msi_irq: pt_irq_destroy_bind faile=
d (%ld) for %pd\n",
+                   rc, d);
+        break;
+    }
+
     default:
         rc =3D ioreq_server_dm_op(&op, d, &const_op);
         break;
@@ -643,6 +709,8 @@ CHECK_dm_op_remote_shutdown;
 CHECK_dm_op_relocate_memory;
 CHECK_dm_op_pin_memory_cacheattr;
 CHECK_dm_op_nr_vcpus;
+CHECK_dm_op_bind_pt_msi_irq;
+CHECK_dm_op_unbind_pt_msi_irq;
=20
 int compat_dm_op(
     domid_t domid, unsigned int nr_bufs, XEN_GUEST_HANDLE_PARAM(void) buf=
s)
diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrough=
/x86/hvm=2Ec
index 026534530f=2E=2E6fb4f8b7dc 100644
--- a/xen/drivers/passthrough/x86/hvm=2Ec
+++ b/xen/drivers/passthrough/x86/hvm=2Ec
@@ -21,7 +21,6 @@
 #include <xen/event=2Eh>
 #include <xen/iommu=2Eh>
 #include <xen/cpu=2Eh>
-#include <xen/ioreq=2Eh>
 #include <xen/irq=2Eh>
 #include <asm/hvm/irq=2Eh>
 #include <asm/io_apic=2Eh>
diff --git a/xen/include/public/hvm/dm_op=2Eh b/xen/include/public/hvm/dm_=
op=2Eh
index 2bf0fdc1ae=2E=2E43571b7713 100644
--- a/xen/include/public/hvm/dm_op=2Eh
+++ b/xen/include/public/hvm/dm_op=2Eh
@@ -444,6 +444,41 @@ struct xen_dm_op_nr_vcpus {
 };
 typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
=20
+#define XEN_DMOP_bind_pt_msi_irq   21
+#define XEN_DMOP_unbind_pt_msi_irq 22
+
+struct xen_dm_op_bind_pt_msi_irq {
+    /* IN - physical IRQ (pirq) */
+    uint32_t machine_irq;
+    /* IN - MSI data word (bits [7:0] are the guest vector) */
+    uint32_t data;
+    /* IN - flags */
+    uint32_t flags;
+#define XEN_DMOP_MSI_FLAG_UNMASKED (1u << 0)
+    uint32_t pad;
+    /* IN - MSI address (includes extended destination ID in bits [11:5])=
 */
+    uint64_aligned_t addr;
+    /* IN - MSI-X table base GFN, 0 for plain MSI */
+    uint64_aligned_t gtable;
+};
+
+typedef struct xen_dm_op_bind_pt_msi_irq xen_dm_op_bind_pt_msi_irq_t;
+
+struct xen_dm_op_unbind_pt_msi_irq {
+    /* IN - physical IRQ (pirq) */
+    uint32_t machine_irq;
+};
+typedef struct xen_dm_op_unbind_pt_msi_irq xen_dm_op_unbind_pt_msi_irq_t;
+
+/*
+ * XEN_DMOP_enable_ext_dest_id: Signal to Xen that this device model will=
 use
+ * XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings, passing raw=
 MSI
+ * address/data fields=2E Once called, Xen will advertise
+ * XEN_HVM_CPUID_EXT_DEST_ID to the guest=2E Must be called before the gu=
est
+ * starts=2E
+ */
+#define XEN_DMOP_enable_ext_dest_id 23
+
 struct xen_dm_op {
     uint32_t op;
     uint32_t pad;
@@ -468,6 +503,8 @@ struct xen_dm_op {
         xen_dm_op_relocate_memory_t relocate_memory;
         xen_dm_op_pin_memory_cacheattr_t pin_memory_cacheattr;
         xen_dm_op_nr_vcpus_t nr_vcpus;
+        xen_dm_op_bind_pt_msi_irq_t bind_pt_msi_irq;
+        xen_dm_op_unbind_pt_msi_irq_t unbind_pt_msi_irq;
     } u;
 };
=20
diff --git a/xen/include/xlat=2Elst b/xen/include/xlat=2Elst
index 9d08dcc4bb=2E=2E6dc5f5796a 100644
--- a/xen/include/xlat=2Elst
+++ b/xen/include/xlat=2Elst
@@ -98,6 +98,7 @@
 ?	grant_entry_v2			grant_table=2Eh
=20
 !	dm_op_buf			hvm/dm_op=2Eh
+?	dm_op_bind_pt_msi_irq		hvm/dm_op=2Eh
 ?	dm_op_create_ioreq_server	hvm/dm_op=2Eh
 ?	dm_op_destroy_ioreq_server	hvm/dm_op=2Eh
 ?	dm_op_get_ioreq_server_info	hvm/dm_op=2Eh
@@ -116,6 +117,7 @@
 ?	dm_op_set_pci_intx_level	hvm/dm_op=2Eh
 ?	dm_op_set_pci_link_route	hvm/dm_op=2Eh
 ?	dm_op_track_dirty_vram		hvm/dm_op=2Eh
+?	dm_op_unbind_pt_msi_irq		hvm/dm_op=2Eh
=20
 !	hvm_altp2m_set_mem_access_multi	hvm/hvm_op=2Eh
=20
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.2979.83d4fb820ba3c81.19dcf38841e.d33788981f0c79f2=---

