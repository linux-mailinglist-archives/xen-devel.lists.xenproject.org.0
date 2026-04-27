Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KAJJdFq72nEBAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A410473D07
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294885.1571614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQK-0000o6-DD; Mon, 27 Apr 2026 13:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294885.1571614; Mon, 27 Apr 2026 13:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQK-0000lP-A8; Mon, 27 Apr 2026 13:54:56 +0000
Received: by outflank-mailman (input) for mailman id 1294885;
 Mon, 27 Apr 2026 13:54:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf387f6f000f373@swg.vates.tech>)
 id 1wHMQI-0000fU-P2
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 13:54:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHMQI-00G6Ry-5f
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:54:54 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf387f6f000f373@swg.vates.tech>)
 id 69ef6aa6-5cb7-0a2a0a5109dd-0a2a450ab84c-32
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:54:54 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf387f6f000f373@swg.vates.tech>)
 id 69ef6aa4-56b3-0a2a450a0019-b9ff1c22a053-6
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:54:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dcf387f6f000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 13:54:39 +0000
Received: from julian.home (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 073B087720;
 Mon, 27 Apr 2026 15:54:39 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=W6jJeFHlnxQriqm4ULKsDBrsDCyMY1Q7f5BSbeqFbcU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=V7MxvOhePlTFu45csDwAzNIlBwj54zD+mZNspe3ooRDnNb5AyX7Qu1vPEOindNXbMjQCxspVG
 BkQjfF8uKrVMOwqV/NiheLAvajnQIL1i/qliFazKjprdmeXKwdsZPNXrBg+bV7XVpeUK8hqBDEF
 uhCALt/jO8nrTolasJuOoP9CuPXRL+6Tbda7JirHiNuWgAnR+OFAcdRC/RtZV2s50UqlUTvPUF4
 peKDnnVabv6hFmS4Wx1OgTu2Zi7AdK0lPwAzwL7uFVIqxZ+JI2j4UGYmadWhW0jHQ4vWgBUvWnC
 /iW6tuIL/Jyrc3s3uMgP6cEXplgkorQIVwhwxb61xFEA==
X-Zone-Loop: 6aeb684b3b03ddb97f269851a8e054cfd1874d6a8e8b
x-campaign-type: default
x-transaction-id: daa0c376-b8c0-4fc2-a6f0-daf148b1cec6
x-swg-uid: 01-695e8fc4-0d06-4f19-b360-195d6f63116c
X-Mailer: Sweego
Message-ID:
 <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387f6f000f373@vates.tech>
x-swg-bid: 1777298079.8631fc262581453bbf619ec5b2062170.19dcf387f6f000f373
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
Subject: [PATCH v4 3/9] x86/passthrough: Extract pt_irq_dpci_setup() from pt_irq_create_bind()
Date: Mon, 27 Apr 2026 15:54:00 +0200
In-Reply-To: <20260427135406.1281424-1-julian.vetter@vates.tech>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2975.a3c70ac1ac8036d.19dcf387e09.478a393e5b10a835=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777298079241
X-purgate-ID: tlsNG-4011c0/1777298094-47F798B7-C02DFD8C/0/0
X-purgate-type: clean
X-purgate-size: 4749
X-Rspamd-Queue-Id: 4A410473D07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:teddy.astie@vates.tech,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.2975.a3c70ac1ac8036d.19dcf387e09.478a393e5b10a835=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The setup preamble in pt_irq_create_bind(), lazily allocating
hvm_irq_dpci, looking up the struct pirq, and spinning until any pending
hvm_dirq_assist softirq has drained, is needed by pt_irq_bind_msi() as
well=2E Extract it into a static helper pt_irq_dpci_setup() that returns
with d->event_lock write-locked on success=2E Replace the open-coded goto
restart loop with a do { } while (true) loop and a continue, making the
retry structure explicit without a label=2E No functional change=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v4:
- New patch
- Split out as a preparatory no-functional-change step to make the diff
  in patch 5 (pt_irq_bind_msi() interface change) easier to review
---
 xen/drivers/passthrough/x86/hvm=2Ec | 54 +++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrough=
/x86/hvm=2Ec
index 691fa1b2c7=2E=2E19463c3406 100644
--- a/xen/drivers/passthrough/x86/hvm=2Ec
+++ b/xen/drivers/passthrough/x86/hvm=2Ec
@@ -217,18 +217,22 @@ static struct vcpu *vector_hashing_dest(const struct=
 domain *d,
     return dest;
 }
=20
-int pt_irq_create_bind(
-    struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
+/*
+ * Acquire d->event_lock (write), lazily allocate hvm_irq_dpci if needed,=
 look
+ * up the struct pirq for @pirq, and drain any pending hvm_dirq_assist so=
ftirq
+ * on it before returning=2E Returns 0 with d->event_lock held on success=
,
+ * negative errno otherwise (lock not held)=2E
+ */
+static int pt_irq_dpci_setup(struct domain *d, unsigned int pirq,
+                              struct hvm_irq_dpci **hvm_irq_dpci_out,
+                              struct hvm_pirq_dpci **pirq_dpci_out,
+                              struct pirq **info_out)
 {
     struct hvm_irq_dpci *hvm_irq_dpci;
     struct hvm_pirq_dpci *pirq_dpci;
     struct pirq *info;
-    int rc, pirq =3D pt_irq_bind->machine_irq;
=20
-    if ( pirq < 0 || pirq >=3D d->nr_pirqs )
-        return -EINVAL;
-
- restart:
+    do
     {
         write_lock(&d->event_lock);
=20
@@ -238,10 +242,11 @@ int pt_irq_create_bind(
             unsigned int i;
=20
             /*
-             * NB: the hardware domain doesn't use a hvm_irq_dpci struct =
because
-             * it's only allowed to identity map GSIs, and so the data co=
ntained in
-             * that struct (used to map guest GSIs into machine GSIs and =
perform
-             * interrupt routing) is completely useless to it=2E
+             * NB: the hardware domain doesn't use a hvm_irq_dpci struct
+             * because it's only allowed to identity map GSIs, and so the
+             * data contained in that struct (used to map guest GSIs into
+             * machine GSIs and perform interrupt routing) is completely
+             * useless to it=2E
              */
             hvm_irq_dpci =3D xzalloc(struct hvm_irq_dpci);
             if ( hvm_irq_dpci =3D=3D NULL )
@@ -269,15 +274,36 @@ int pt_irq_create_bind(
          * We MUST check for this condition as the softirq could be sched=
uled
          * and hasn't run yet=2E Note that this code replaced tasklet_kil=
l which
          * would have spun forever and would do the same thing (wait to f=
lush out
-         * outstanding hvm_dirq_assist calls=2E
+         * outstanding hvm_dirq_assist calls)=2E
          */
         if ( pt_pirq_softirq_active(pirq_dpci) )
         {
             write_unlock(&d->event_lock);
             cpu_relax();
-            goto restart;
+            continue;
         }
-    }
+
+        *hvm_irq_dpci_out =3D hvm_irq_dpci;
+        *pirq_dpci_out =3D pirq_dpci;
+        *info_out =3D info;
+        return 0;
+    } while ( true );
+}
+
+int pt_irq_create_bind(
+    struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
+{
+    struct hvm_irq_dpci *hvm_irq_dpci;
+    struct hvm_pirq_dpci *pirq_dpci;
+    struct pirq *info;
+    int rc, pirq =3D pt_irq_bind->machine_irq;
+
+    if ( pirq < 0 || pirq >=3D d->nr_pirqs )
+        return -EINVAL;
+
+    rc =3D pt_irq_dpci_setup(d, pirq, &hvm_irq_dpci, &pirq_dpci, &info);
+    if ( rc )
+        return rc;
=20
     switch ( pt_irq_bind->irq_type )
     {
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.2975.a3c70ac1ac8036d.19dcf387e09.478a393e5b10a835=---

