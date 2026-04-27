Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LmgKNFq72nFBAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FF5473D06
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294898.1571660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQW-0002HF-9J; Mon, 27 Apr 2026 13:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294898.1571660; Mon, 27 Apr 2026 13:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQW-0002Ci-4p; Mon, 27 Apr 2026 13:55:08 +0000
Received: by outflank-mailman (input) for mailman id 1294898;
 Mon, 27 Apr 2026 13:55:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf3886cc000f373@swg.vates.tech>)
 id 1wHMQT-00025z-PO
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 13:55:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHMQT-00E4x7-5v
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:55:05 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf3886cc000f373@swg.vates.tech>)
 id 69ef6ab7-bab6-0a2a0a5309dd-0a2a450acb66-18
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:55:05 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf3886cc000f373@swg.vates.tech>)
 id 69ef6aa4-56b3-0a2a450a0019-b9ff1c22a053-11
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:55:05 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dcf3886cc000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 13:54:41 +0000
Received: from julian.home (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E3A6B87720;
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
 q=dns/txt; s=selector1; bh=p+9OATvIj/CmW54/HXWskK4gEXXexqOmxFd4T2BcwBI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=RemcQgvYQXTSJZrI5SyVVKerGZZcTNulY8MgmmrR2ydLFFy5p74QkcAkngqTY4Iw3SbRYMZPf
 s8Xcj3bxVHgQ8mH37DGaxYRN4KNuYdFcq4fZH2b8j1H4CYhGfd4vHfkjM2xtj5KK4CRyi7nOm+b
 CiCa1f2icMPqGVItYh182mB33sQTPpjJMprjk4QS1UlIwgX5blEd7Q++on6OjNCt+x0uDOBQVrV
 2yGQWmth/m24NlbeW2x7opgC1DoKZlsQRGRTBsrOhvMpGz9HnVeUbfBUtcMVrTb8IHhQIMs5USL
 LB72WBhHci4MotF/gUZyAhYtau2zh0zOlxefB7HnGLdw==
X-Zone-Loop: b524d9d488a76f28a1974740f773b4e2db50bdbe555e
x-campaign-type: default
x-transaction-id: 9de87850-e808-416c-9a62-ec43452874a1
x-swg-uid: 01-c7f1319e-3d48-4a16-98aa-22b149f9a442
X-Mailer: Sweego
Message-ID:
 <1777298081.8631fc262581453bbf619ec5b2062170.19dcf3886cc000f373@vates.tech>
x-swg-bid: 1777298081.8631fc262581453bbf619ec5b2062170.19dcf3886cc000f373
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
Subject: [PATCH v4 8/9] hvm/ioreq: Negotiate extended destination ID support per ioreq server
Date: Mon, 27 Apr 2026 15:54:05 +0200
In-Reply-To: <20260427135406.1281424-1-julian.vetter@vates.tech>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.297a.584af6cfdad57c37.19dcf388578.dac24e8c4e346718=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777298081144
X-purgate-ID: tlsNG-4011c0/1777298105-47D788B7-61B6E7A8/0/0
X-purgate-type: clean
X-purgate-size: 19021
X-Rspamd-Queue-Id: 38FF5473D06
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

---=Part.297a.584af6cfdad57c37.19dcf388578.dac24e8c4e346718=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a per-server capability flag in XEN_DMOP_create_ioreq_server to
signal extended destination ID support=2E Repurpose the first byte of the
existing pad[3] as a flags field, and define
XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID (bit 0) for a server to signal it will
use XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings=2E

Track the flag in struct ioreq_server ext_dest_id=2E
hvm_ext_dest_id_enabled() returns true only if all registered ioreq
servers have opted in and at least one server is present=2E A single
server without the flag is sufficient to suppress the feature=2E

Lock the feature at domain creation time:
arch_domain_creation_finished() computes the levelled result into struct
hvm_domain=2Eext_dest_id using OR to preserve any value previously
restored from an HVM save record=2E After creation_finished,
arch_ioreq_server_create_check() rejects new servers that lack
XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID if the feature was already advertised
to the guest=2E

Persist the locked state in a new HVM_SAVE_TYPE(EXT_DEST_ID) record so
that migration preserves the guest-visible CPUID bit independently of
when the device model re-registers its ioreq servers on the destination
host=2E

On restore, ioapic_check() uses d->arch=2Ehvm=2Eext_dest_id (restored from
the EXT_DEST_ID record) rather than the per-server dynamic check, since
the DM has not yet re-registered its servers at that point=2E

Update xendevicemodel_create_ioreq_server() in libxendevicemodel to
accept the new flags parameter, remove
xendevicemodel_enable_ext_dest_id(), and fix the
xc_hvm_create_ioreq_server() compat wrapper to pass zero flags=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v4:
- As suggested by Roger, replaced XEN_DMOP_enable_ext_dest_id (v3 patch
  6), a separate DM op the device model had to call before starting
  vCPUs, with a flags byte repurposed from the existing pad[3] field of
  xen_dm_op_create_ioreq_server
- New XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID flag (bit 0) lets each ioreq
  server signal support at registration time
- As suggested by Roger level the feature across all ioreq servers=2E
  XEN_HVM_CPUID_EXT_DEST_ID is only advertised when every server
  registered before arch_domain_creation_finished() sets the flag=2E A
  single server without the flag suppresses the feature for the whole
  domain!
- Lock the levelled result at domain creation time and enforce it for
  servers registered afterwards, preventing a late opt-out from breaking
  guests that already see the feature in CPUID
- Persist the locked flag via HVM_SAVE_TYPE(EXT_DEST_ID) so that live
  migration preserves the guest-visible CPUID bit independently of when
  the device model registers its ioreq servers on the destination host
---
 tools/include/xendevicemodel=2Eh          |  3 +-
 tools/libs/ctrl/xc_devicemodel_compat=2Ec |  2 +-
 tools/libs/devicemodel/core=2Ec           |  3 +-
 xen/arch/arm/ioreq=2Ec                    |  5 ++++
 xen/arch/x86/domain=2Ec                   | 10 +++++++
 xen/arch/x86/hvm/ioreq=2Ec                | 37 +++++++++++++++++++++++++
 xen/arch/x86/hvm/vioapic=2Ec              | 20 +++++++++++++
 xen/arch/x86/include/asm/hvm/domain=2Eh   |  9 ++++++
 xen/common/ioreq=2Ec                      | 13 +++++++--
 xen/drivers/passthrough/x86/hvm=2Ec       | 13 +++++++++
 xen/include/public/arch-x86/hvm/save=2Eh  | 17 +++++++++++-
 xen/include/public/hvm/dm_op=2Eh          | 16 +++++++++--
 xen/include/xen/ioreq=2Eh                 | 27 ++++++++++++++++++
 13 files changed, 165 insertions(+), 10 deletions(-)

diff --git a/tools/include/xendevicemodel=2Eh b/tools/include/xendevicemod=
el=2Eh
index f15b35fa33=2E=2Ebc6764bd58 100644
--- a/tools/include/xendevicemodel=2Eh
+++ b/tools/include/xendevicemodel=2Eh
@@ -44,12 +44,13 @@ int xendevicemodel_close(xendevicemodel_handle *dmod);
  * @parm domid the domain id to be serviced
  * @parm handle_bufioreq how should the IOREQ Server handle buffered
  *                       requests (HVM_IOREQSRV_BUFIOREQ_*)?
+ * @parm flags bitmask of XEN_DMOP_IOREQ_SERVER_* capability flags=2E
  * @parm id pointer to an ioservid_t to receive the IOREQ Server id=2E
  * @return 0 on success, -1 on failure=2E
  */
 int xendevicemodel_create_ioreq_server(
     xendevicemodel_handle *dmod, domid_t domid, int handle_bufioreq,
-    ioservid_t *id);
+    uint8_t flags, ioservid_t *id);
=20
 /**
  * This function retrieves the necessary information to allow an
diff --git a/tools/libs/ctrl/xc_devicemodel_compat=2Ec b/tools/libs/ctrl/x=
c_devicemodel_compat=2Ec
index a46011cd17=2E=2E91366e250c 100644
--- a/tools/libs/ctrl/xc_devicemodel_compat=2Ec
+++ b/tools/libs/ctrl/xc_devicemodel_compat=2Ec
@@ -11,7 +11,7 @@ int xc_hvm_create_ioreq_server(
     ioservid_t *id)
 {
     return xendevicemodel_create_ioreq_server(xch->dmod, domid,
-                                              handle_bufioreq, id);
+                                              handle_bufioreq, 0, id);
 }
=20
 int xc_hvm_get_ioreq_server_info(
diff --git a/tools/libs/devicemodel/core=2Ec b/tools/libs/devicemodel/core=
=2Ec
index adf2c41a96=2E=2E49b9bf8a13 100644
--- a/tools/libs/devicemodel/core=2Ec
+++ b/tools/libs/devicemodel/core=2Ec
@@ -167,7 +167,7 @@ static int xendevicemodel_op(
=20
 int xendevicemodel_create_ioreq_server(
     xendevicemodel_handle *dmod, domid_t domid, int handle_bufioreq,
-    ioservid_t *id)
+    uint8_t flags, ioservid_t *id)
 {
     struct xen_dm_op op;
     struct xen_dm_op_create_ioreq_server *data;
@@ -179,6 +179,7 @@ int xendevicemodel_create_ioreq_server(
     data =3D &op=2Eu=2Ecreate_ioreq_server;
=20
     data->handle_bufioreq =3D handle_bufioreq;
+    data->flags =3D flags;
=20
     rc =3D xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
     if (rc)
diff --git a/xen/arch/arm/ioreq=2Ec b/xen/arch/arm/ioreq=2Ec
index b4211f0159=2E=2Ed45228717a 100644
--- a/xen/arch/arm/ioreq=2Ec
+++ b/xen/arch/arm/ioreq=2Ec
@@ -201,6 +201,11 @@ void arch_ioreq_domain_init(struct domain *d)
 {
 }
=20
+int arch_ioreq_server_create_check(const struct domain *d, uint8_t flags)
+{
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/domain=2Ec b/xen/arch/x86/domain=2Ec
index 1d458f1372=2E=2E68ff315460 100644
--- a/xen/arch/x86/domain=2Ec
+++ b/xen/arch/x86/domain=2Ec
@@ -25,6 +25,7 @@
 #include <xen/init=2Eh>
 #include <xen/iocap=2Eh>
 #include <xen/iommu=2Eh>
+#include <xen/ioreq=2Eh>
 #include <xen/irq=2Eh>
 #include <xen/kernel=2Eh>
 #include <xen/lib=2Eh>
@@ -1106,7 +1107,16 @@ int arch_domain_soft_reset(struct domain *d)
 void arch_domain_creation_finished(struct domain *d)
 {
     if ( is_hvm_domain(d) )
+    {
+        /*
+         * Lock the extended destination ID state=2E OR preserves any val=
ue
+         * already restored from an HVM save record (migration path)=2E F=
or a
+         * fresh domain, ext_dest_id starts false and the dynamic check
+         * supplies the levelled result across all registered ioreq serve=
rs=2E
+         */
+        d->arch=2Ehvm=2Eext_dest_id |=3D hvm_ext_dest_id_enabled(d);
         hvm_domain_creation_finished(d);
+    }
 }
=20
 #ifdef CONFIG_COMPAT
diff --git a/xen/arch/x86/hvm/ioreq=2Ec b/xen/arch/x86/hvm/ioreq=2Ec
index a5fa97e149=2E=2E894a63c522 100644
--- a/xen/arch/x86/hvm/ioreq=2Ec
+++ b/xen/arch/x86/hvm/ioreq=2Ec
@@ -19,6 +19,7 @@
=20
 #include <asm/hvm/emulate=2Eh>
 #include <asm/hvm/hvm=2Eh>
+#include <asm/hvm/support=2Eh>
 #include <asm/hvm/vmx/vmx=2Eh>
 #include <asm/msr=2Eh>
=20
@@ -325,6 +326,42 @@ void arch_ioreq_domain_init(struct domain *d)
     register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
 }
=20
+int arch_ioreq_server_create_check(const struct domain *d, uint8_t flags)
+{
+    if ( !is_hvm_domain(d) || !d->creation_finished )
+        return 0;
+
+    if ( d->arch=2Ehvm=2Eext_dest_id &&
+         !(flags & XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID) )
+        return -EPERM;
+
+    return 0;
+}
+
+static int cf_check ext_dest_id_save(struct vcpu *v, hvm_domain_context_t=
 *h)
+{
+    struct hvm_hw_ext_dest_id s =3D {
+        =2Eenabled =3D v->domain->arch=2Ehvm=2Eext_dest_id,
+    };
+
+    return hvm_save_entry(EXT_DEST_ID, 0, h, &s);
+}
+
+static int cf_check ext_dest_id_load(struct domain *d, hvm_domain_context=
_t *h)
+{
+    struct hvm_hw_ext_dest_id s;
+
+    if ( hvm_load_entry(EXT_DEST_ID, h, &s) )
+        return -EINVAL;
+
+    d->arch=2Ehvm=2Eext_dest_id =3D s=2Eenabled;
+
+    return 0;
+}
+
+HVM_REGISTER_SAVE_RESTORE(EXT_DEST_ID, ext_dest_id_save, NULL,
+                          ext_dest_id_load, 1, HVMSR_PER_DOM);
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/vioapic=2Ec b/xen/arch/x86/hvm/vioapic=2Ec
index 527cc770b7=2E=2E7d037a53e1 100644
--- a/xen/arch/x86/hvm/vioapic=2Ec
+++ b/xen/arch/x86/hvm/vioapic=2Ec
@@ -24,6 +24,7 @@
  *  Ported to xen by using virtual IRQ line=2E
  */
=20
+#include <xen/ioreq=2Eh>
 #include <xen/types=2Eh>
 #include <xen/mm=2Eh>
 #include <xen/xmalloc=2Eh>
@@ -597,6 +598,7 @@ int vioapic_get_trigger_mode(const struct domain *d, u=
nsigned int gsi)
 static int cf_check ioapic_check(const struct domain *d, hvm_domain_conte=
xt_t *h)
 {
     const HVM_SAVE_TYPE(IOAPIC) *s;
+    unsigned int i;
=20
     if ( !has_vioapic(d) )
         return -ENODEV;
@@ -617,6 +619,24 @@ static int cf_check ioapic_check(const struct domain =
*d, hvm_domain_context_t *h
     if ( s->ioregsel > VIOAPIC_REG_RTE0 + (ARRAY_SIZE(s->redirtbl) - 1) *=
 2 + 1 )
         return -EINVAL;
=20
+    /*
+     * If any RTE uses extended destination ID bits, the EXT_DEST_ID save
+     * record must have been loaded first (restoring d->arch=2Ehvm=2Eext_=
dest_id)=2E
+     * The ioreq server re-registration by the DM happens later, so use t=
he
+     * domain-level locked flag rather than the per-server dynamic check=
=2E
+     */
+    for ( i =3D 0; i < ARRAY_SIZE(s->redirtbl); i++ )
+    {
+        if ( s->redirtbl[i]=2Efields=2Eext_dest_id && !d->arch=2Ehvm=2Eex=
t_dest_id )
+        {
+            printk(XENLOG_G_ERR "HVM restore: %pd IO-APIC RTE %u has "
+                                "extended destination ID bits set but "
+                                "EXT_DEST_ID is not enabled\n",
+                                d, i);
+            return -EINVAL;
+        }
+    }
+
     return 0;
 }
=20
diff --git a/xen/arch/x86/include/asm/hvm/domain=2Eh b/xen/arch/x86/includ=
e/asm/hvm/domain=2Eh
index abf9bc448d=2E=2E895b2e12ba 100644
--- a/xen/arch/x86/include/asm/hvm/domain=2Eh
+++ b/xen/arch/x86/include/asm/hvm/domain=2Eh
@@ -102,6 +102,15 @@ struct hvm_domain {
=20
     bool                   is_s3_suspended;
=20
+    /*
+     * True when XEN_HVM_CPUID_EXT_DEST_ID was advertised to the guest=2E=
 Locked
+     * at domain creation time once every registered ioreq server has opt=
ed in
+     * via XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID=2E Persisted in HVM save/res=
tore so
+     * migration preserves the guest-visible state independently of when =
the
+     * device model re-registers its ioreq servers on the destination hos=
t=2E
+     */
+    bool                   ext_dest_id;
+
     /* Compatibility setting for a bug in x2APIC LDR */
     bool bug_x2apic_ldr_vcpu_id;
=20
diff --git a/xen/common/ioreq=2Ec b/xen/common/ioreq=2Ec
index f5fd30ce12=2E=2E56a7eb8282 100644
--- a/xen/common/ioreq=2Ec
+++ b/xen/common/ioreq=2Ec
@@ -641,7 +641,7 @@ static void ioreq_server_deinit(struct ioreq_server *s=
)
 }
=20
 static int ioreq_server_create(struct domain *d, int bufioreq_handling,
-                               ioservid_t *id)
+                               uint8_t flags, ioservid_t *id)
 {
     struct ioreq_server *s;
     unsigned int i;
@@ -683,6 +683,8 @@ static int ioreq_server_create(struct domain *d, int b=
ufioreq_handling,
         goto fail;
     }
=20
+    s->ext_dest_id =3D flags & XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID;
+
     if ( id )
         *id =3D i;
=20
@@ -1350,11 +1352,16 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struc=
t domain *d, bool *const_op)
         *const_op =3D false;
=20
         rc =3D -EINVAL;
-        if ( data->pad[0] || data->pad[1] || data->pad[2] )
+        if ( data->flags & ~XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID ||
+             data->pad[0] || data->pad[1] )
+            break;
+
+        rc =3D arch_ioreq_server_create_check(d, data->flags);
+        if ( rc )
             break;
=20
         rc =3D ioreq_server_create(d, data->handle_bufioreq,
-                                 &data->id);
+                                 data->flags, &data->id);
         break;
     }
=20
diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrough=
/x86/hvm=2Ec
index 6fb4f8b7dc=2E=2Ef7f7c02076 100644
--- a/xen/drivers/passthrough/x86/hvm=2Ec
+++ b/xen/drivers/passthrough/x86/hvm=2Ec
@@ -21,6 +21,7 @@
 #include <xen/event=2Eh>
 #include <xen/iommu=2Eh>
 #include <xen/cpu=2Eh>
+#include <xen/ioreq=2Eh>
 #include <xen/irq=2Eh>
 #include <asm/hvm/irq=2Eh>
 #include <asm/io_apic=2Eh>
@@ -455,6 +456,18 @@ int pt_irq_create_bind(
         uint64_t msi_addr;
         uint32_t msi_data;
=20
+        /*
+         * Refuse the old MSI bind path when extended destination IDs are
+         * in use=2E The caller must use XEN_DMOP_bind_pt_msi_irq instead=
,
+         * which passes the raw MSI address so Xen can decode the extende=
d
+         * bits=2E This old path only carries an 8-bit destination ID and
+         * would silently misroute interrupts to vCPUs with APIC IDs > 25=
5=2E
+         */
+        if ( hvm_ext_dest_id_enabled(d) )
+        {
+            return -EPERM;
+        }
+
         msi_addr =3D MSI_ADDR_HEADER |
                    MASK_INSR(MASK_EXTR(gflags, XEN_DOMCTL_VMSI_X86_DEST_I=
D_MASK),
                              MSI_ADDR_DEST_ID_MASK) |
diff --git a/xen/include/public/arch-x86/hvm/save=2Eh b/xen/include/public=
/arch-x86/hvm/save=2Eh
index 483097d940=2E=2Edd70ce18c6 100644
--- a/xen/include/public/arch-x86/hvm/save=2Eh
+++ b/xen/include/public/arch-x86/hvm/save=2Eh
@@ -627,12 +627,27 @@ struct hvm_msr {
=20
 #define CPU_MSR_CODE  20
=20
+/*
+ * HVM_SAVE_TYPE(EXT_DEST_ID): domain-level extended MSI destination ID s=
tate=2E
+ *
+ * Records whether the extended destination ID feature was enabled for th=
is
+ * domain at the time guest vCPUs were started=2E This allows migration t=
o
+ * preserve the setting across hosts without relying on the device model =
to
+ * re-register its ioreq servers before the guest's first CPUID query=2E
+ */
+struct hvm_hw_ext_dest_id {
+    uint8_t enabled;
+    uint8_t pad[7];
+};
+
+DECLARE_HVM_SAVE_TYPE(EXT_DEST_ID, 21, struct hvm_hw_ext_dest_id);
+
 /* Range 22 - 34 (inclusive) reserved for Amazon */
=20
 /*
  * Largest type-code in use
  */
-#define HVM_SAVE_CODE_MAX 20
+#define HVM_SAVE_CODE_MAX 21
=20
 #endif /* __XEN_PUBLIC_HVM_SAVE_X86_H__ */
=20
diff --git a/xen/include/public/hvm/dm_op=2Eh b/xen/include/public/hvm/dm_=
op=2Eh
index 43571b7713=2E=2E73f33b3c46 100644
--- a/xen/include/public/hvm/dm_op=2Eh
+++ b/xen/include/public/hvm/dm_op=2Eh
@@ -39,18 +39,28 @@ typedef uint16_t ioservid_t;
  * XEN_DMOP_create_ioreq_server: Instantiate a new IOREQ Server for a
  *                               secondary emulator=2E
  *
- * The <id> handed back is unique for target domain=2E The valur of
+ * The <id> handed back is unique for target domain=2E The value of
  * <handle_bufioreq> should be one of HVM_IOREQSRV_BUFIOREQ_* defined in
- * hvm_op=2Eh=2E If the value is HVM_IOREQSRV_BUFIOREQ_OFF then  the buff=
ered
+ * hvm_op=2Eh=2E If the value is HVM_IOREQSRV_BUFIOREQ_OFF then the buffe=
red
  * ioreq ring will not be allocated and hence all emulation requests to
  * this server will be synchronous=2E
+ *
+ * If <flags> contains XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID, the server will
+ * use XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings, passing
+ * raw MSI address/data fields so Xen can decode extended destination ID
+ * bits=2E Once any server sets this flag, Xen will advertise
+ * XEN_HVM_CPUID_EXT_DEST_ID to the guest=2E Must be set before the guest
+ * vCPUs are started=2E
  */
 #define XEN_DMOP_create_ioreq_server 1
=20
 struct xen_dm_op_create_ioreq_server {
     /* IN - should server handle buffered ioreqs */
     uint8_t handle_bufioreq;
-    uint8_t pad[3];
+    /* IN - server capability flags */
+    uint8_t flags;
+#define XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID (1u << 0)
+    uint8_t pad[2];
     /* OUT - server id */
     ioservid_t id;
 };
diff --git a/xen/include/xen/ioreq=2Eh b/xen/include/xen/ioreq=2Eh
index e86f0869fa=2E=2Eec78b63942 100644
--- a/xen/include/xen/ioreq=2Eh
+++ b/xen/include/xen/ioreq=2Eh
@@ -54,9 +54,35 @@ struct ioreq_server {
     evtchn_port_t          bufioreq_evtchn;
     struct rangeset        *range[NR_IO_RANGE_TYPES];
     bool                   enabled;
+    bool                   ext_dest_id;
     uint8_t                bufioreq_handling;
 };
=20
+/*
+ * Return true if every registered ioreq server has opted in to extended
+ * destination IDs (XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID) and at least one
+ * server exists=2E A single server without the flag is enough to suppres=
s
+ * XEN_HVM_CPUID_EXT_DEST_ID, preventing misrouted interrupts=2E
+ */
+static inline bool hvm_ext_dest_id_enabled(const struct domain *d)
+{
+    unsigned int i;
+    bool found =3D false;
+
+    for ( i =3D 0; i < MAX_NR_IOREQ_SERVERS; i++ )
+    {
+        const struct ioreq_server *s =3D d->ioreq_server=2Eserver[i];
+
+        if ( !s )
+            continue;
+        if ( !s->ext_dest_id )
+            return false;
+        found =3D true;
+    }
+
+    return found;
+}
+
 static inline paddr_t ioreq_mmio_first_byte(const ioreq_t *p)
 {
     return unlikely(p->df) ?
@@ -137,6 +163,7 @@ bool arch_ioreq_server_destroy_all(struct domain *d);
 bool arch_ioreq_server_get_type_addr(const struct domain *d, const ioreq_=
t *p,
                                      uint8_t *type, uint64_t *addr);
 void arch_ioreq_domain_init(struct domain *d);
+int arch_ioreq_server_create_check(const struct domain *d, uint8_t flags)=
;
=20
 #endif /* __XEN_IOREQ_H__ */
=20
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.297a.584af6cfdad57c37.19dcf388578.dac24e8c4e346718=---

