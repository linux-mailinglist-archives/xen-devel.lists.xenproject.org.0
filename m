Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMBhKdFq72l3BAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5890F473D08
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294883.1571606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQI-0000Yy-5n; Mon, 27 Apr 2026 13:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294883.1571606; Mon, 27 Apr 2026 13:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQI-0000WO-2H; Mon, 27 Apr 2026 13:54:54 +0000
Received: by outflank-mailman (input) for mailman id 1294883;
 Mon, 27 Apr 2026 13:54:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf387e25000f373@swg.vates.tech>)
 id 1wHMQG-0000IA-HB
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 13:54:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHMQF-00G6Ry-UD
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:54:51 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf387e25000f373@swg.vates.tech>)
 id 69ef6aa6-5cb7-0a2a0a5109dd-0a2a450ab84c-22
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:54:51 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf387e25000f373@swg.vates.tech>)
 id 69ef6aa4-56b3-0a2a450a0019-b9ff1c22a053-5
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:54:51 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dcf387e25000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 13:54:39 +0000
Received: from julian.home (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id ACC1187586;
 Mon, 27 Apr 2026 15:54:38 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=M55ILyTYc2aw6HFK62qDDTDBBSTPjeQAoqU+/EWfFok=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=FhbavZ+jHbvlW71qdtQXujHX8KzmjJBkryM7txqtNTjytUph05GuHbiRzPk5o8kXzH1yYqteV
 1hIBO1mo1Z4/8CFHx+CxjCll1qGgAOog89FkMtXuRczuZtkNOz6D81Xhrs49RWT2bjxP9EwgiiI
 ZWL1j/4jpp/MHez9eMZBmf6lX66aKUSUk/XPjhx0XlGaf0aXaLkM0PTPmcYKRNGViXZf5wi+M5W
 LdKhVjBwZPx679g6GgdyGfbcIrW81hVbBFIm/6Qq+PW0qMPAS9QhWeZZcvVbLhTvOVcqpSlqDpi
 o/5Yupelezw4o85V01j4zS6Rbmj4+AnwFTS7hSmwPlvQ==
X-Zone-Loop: a4445c9258778274922d4e8b326bffba7c04a0539124
x-campaign-type: default
x-transaction-id: f79cca4a-7e5a-41ee-8d3f-74f172fd813a
x-swg-uid: 01-6e7e7490-5a7b-4903-9675-9c25475a6e66
X-Mailer: Sweego
Message-ID:
 <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387e25000f373@vates.tech>
x-swg-bid: 1777298079.8631fc262581453bbf619ec5b2062170.19dcf387e25000f373
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
Subject: [PATCH v4 2/9] x86/passthrough: Wrap pt_irq_create_bind() restart block in braces
Date: Mon, 27 Apr 2026 15:53:59 +0200
In-Reply-To: <20260427135406.1281424-1-julian.vetter@vates.tech>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2974.6d24ae21874b484b.19dcf387cc9.7f8b3253be24fb72=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777298078922
X-purgate-ID: tlsNG-4011c0/1777298091-CFB7F8B7-1FB5AF6C/0/0
X-purgate-type: clean
X-purgate-size: 4613
X-Rspamd-Queue-Id: 5890F473D08
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

---=Part.2974.6d24ae21874b484b.19dcf387cc9.7f8b3253be24fb72=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Enclose the restart/retry block in pt_irq_create_bind() in an explicit
compound statement to prepare for its extraction into a helper function=2E
No functional change=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v4:
- New patch
- Split out as a preparatory no-functional-change step to make the diff
  in patch 5 (pt_irq_bind_msi() interface change) easier to review
---
 xen/drivers/passthrough/x86/hvm=2Ec | 80 ++++++++++++++++---------------
 1 file changed, 41 insertions(+), 39 deletions(-)

diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrough=
/x86/hvm=2Ec
index b73bb55055=2E=2E691fa1b2c7 100644
--- a/xen/drivers/passthrough/x86/hvm=2Ec
+++ b/xen/drivers/passthrough/x86/hvm=2Ec
@@ -229,52 +229,54 @@ int pt_irq_create_bind(
         return -EINVAL;
=20
  restart:
-    write_lock(&d->event_lock);
-
-    hvm_irq_dpci =3D domain_get_irq_dpci(d);
-    if ( !hvm_irq_dpci && !is_hardware_domain(d) )
     {
-        unsigned int i;
+        write_lock(&d->event_lock);
=20
-        /*
-         * NB: the hardware domain doesn't use a hvm_irq_dpci struct beca=
use
-         * it's only allowed to identity map GSIs, and so the data contai=
ned in
-         * that struct (used to map guest GSIs into machine GSIs and perf=
orm
-         * interrupt routing) is completely useless to it=2E
-         */
-        hvm_irq_dpci =3D xzalloc(struct hvm_irq_dpci);
-        if ( hvm_irq_dpci =3D=3D NULL )
+        hvm_irq_dpci =3D domain_get_irq_dpci(d);
+        if ( !hvm_irq_dpci && !is_hardware_domain(d) )
+        {
+            unsigned int i;
+
+            /*
+             * NB: the hardware domain doesn't use a hvm_irq_dpci struct =
because
+             * it's only allowed to identity map GSIs, and so the data co=
ntained in
+             * that struct (used to map guest GSIs into machine GSIs and =
perform
+             * interrupt routing) is completely useless to it=2E
+             */
+            hvm_irq_dpci =3D xzalloc(struct hvm_irq_dpci);
+            if ( hvm_irq_dpci =3D=3D NULL )
+            {
+                write_unlock(&d->event_lock);
+                return -ENOMEM;
+            }
+            for ( i =3D 0; i < NR_HVM_DOMU_IRQS; i++ )
+                INIT_LIST_HEAD(&hvm_irq_dpci->girq[i]);
+
+            hvm_domain_irq(d)->dpci =3D hvm_irq_dpci;
+        }
+
+        info =3D pirq_get_info(d, pirq);
+        if ( !info )
         {
             write_unlock(&d->event_lock);
             return -ENOMEM;
         }
-        for ( i =3D 0; i < NR_HVM_DOMU_IRQS; i++ )
-            INIT_LIST_HEAD(&hvm_irq_dpci->girq[i]);
-
-        hvm_domain_irq(d)->dpci =3D hvm_irq_dpci;
-    }
-
-    info =3D pirq_get_info(d, pirq);
-    if ( !info )
-    {
-        write_unlock(&d->event_lock);
-        return -ENOMEM;
-    }
-    pirq_dpci =3D pirq_dpci(info);
+        pirq_dpci =3D pirq_dpci(info);
=20
-    /*
-     * A crude 'while' loop with us dropping the spinlock and giving
-     * the softirq_dpci a chance to run=2E
-     * We MUST check for this condition as the softirq could be scheduled
-     * and hasn't run yet=2E Note that this code replaced tasklet_kill wh=
ich
-     * would have spun forever and would do the same thing (wait to flush=
 out
-     * outstanding hvm_dirq_assist calls=2E
-     */
-    if ( pt_pirq_softirq_active(pirq_dpci) )
-    {
-        write_unlock(&d->event_lock);
-        cpu_relax();
-        goto restart;
+        /*
+         * A crude 'while' loop with us dropping the spinlock and giving
+         * the softirq_dpci a chance to run=2E
+         * We MUST check for this condition as the softirq could be sched=
uled
+         * and hasn't run yet=2E Note that this code replaced tasklet_kil=
l which
+         * would have spun forever and would do the same thing (wait to f=
lush out
+         * outstanding hvm_dirq_assist calls=2E
+         */
+        if ( pt_pirq_softirq_active(pirq_dpci) )
+        {
+            write_unlock(&d->event_lock);
+            cpu_relax();
+            goto restart;
+        }
     }
=20
     switch ( pt_irq_bind->irq_type )
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.2974.6d24ae21874b484b.19dcf387cc9.7f8b3253be24fb72=---

