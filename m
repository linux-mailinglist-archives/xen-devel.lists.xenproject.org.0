Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMadBeWL5mmmyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B768A433B22
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286469.1567533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBI-00023C-RB; Mon, 20 Apr 2026 20:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286469.1567533; Mon, 20 Apr 2026 20:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBI-0001t0-IN; Mon, 20 Apr 2026 20:25:20 +0000
Received: by outflank-mailman (input) for mailman id 1286469;
 Mon, 20 Apr 2026 19:50:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEudv-0006Fj-3I
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEudu-00EW0U-GQ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:50 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68383-e002-0a2a0a5209dd-0a2a4507b9fc-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:50 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68399-229c-0a2a45070019-22cac1c5e3b8-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:50 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:48 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=koFa8R/DHakel9IV2KMPTxKRTbJ8TfNcl12DPKFVH1JiI3rspzg7HxrI0ViHsIbPHKOV/va3+idkiG3djIbuLqCLH44qjR9PXnY/PUwfOlLpdVnR4SeptBj/TiYbiZUlGgkz/4zT6VEAmmj71cMmLwAG9biIq28DQtFoRzJwKlM8E9aJ9UNx1p5lkCh+Lhy9sfGrDiUY5NywRhITlhjceEIXvpDcHxJtHFM1Qxnq9QFMCOwEcIew8vidxDoYtOvlE3xtTIsKx36WGVHt4LUDZIUmI+T6O7ovfzWDCdqVyatlu97iL7hF913AYHrjZMwQ+iOMCwIuC22SAcBvjydp9Q==; s=purelymail1; d=purelymail.com; v=1; bh=sFa1ro+z9ghGaluSF0Kirw4YvSvCfXXzB9G9AfNaXqg=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [RFC PATCH v6 04/43] x86/altp2m: Rename hvm_altp2m_supported to altp2m_supported
Date: Mon, 20 Apr 2026 15:50:03 -0400
Message-Id: <20260420195042.207624-5-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-ef75cf/1776714650-AF374C48-8025B929/0/0
X-purgate-type: clean
X-purgate-size: 5531
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.870];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B768A433B22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

Using a generic name for altp2m_supported makes it possible to indicate
whether altp2m is supported on other architectures as well. Even if other
architectures always support altp2m at a hardware level (like ARM), altp2m
might not be supported due to CONFIG_ALTP2M being disabled. Therefore, the
altp2m_supported function can be implemented on all architectures to
indicate if the hardware supports altp2m *and* if CONFIG_ALTP2M is enabled.

This is commit 4/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/domain.c              | 2 +-
 xen/arch/x86/hvm/hvm.c             | 6 +++---
 xen/arch/x86/include/asm/hvm/hvm.h | 4 ++--
 xen/arch/x86/mm/hap/hap.c          | 6 +++---
 xen/arch/x86/mm/p2m-basic.c        | 4 ++--
 xen/arch/x86/mm/p2m-ept.c          | 2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 1d458f1372e5..512b18d4010f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -698,7 +698,7 @@ int arch_sanitise_domain_config(struct xen_domctl_creat=
edomain *config)
=20
     if ( altp2m_mode )
     {
-        if ( !hvm_altp2m_supported() )
+        if ( !altp2m_supported() )
         {
             dprintk(XENLOG_INFO, "altp2m is not supported\n");
             return -EINVAL;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 86c12c0d1ef4..bc35efdf2c02 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1692,7 +1692,7 @@ void hvm_vcpu_destroy(struct vcpu *v)
=20
     ioreq_server_remove_vcpu_all(v->domain, v);
=20
-    if ( hvm_altp2m_supported() )
+    if ( altp2m_supported() )
         altp2m_vcpu_destroy(v);
=20
     nestedhvm_vcpu_destroy(v);
@@ -4566,7 +4566,7 @@ static int do_altp2m_op(
     int rc =3D 0;
     uint64_t mode;
=20
-    if ( !hvm_altp2m_supported() )
+    if ( !altp2m_supported() )
         return -EOPNOTSUPP;
=20
     if ( copy_from_guest(&a, arg, 1) )
@@ -4965,7 +4965,7 @@ static int compat_altp2m_op(
         struct xen_hvm_altp2m_op *altp2m_op;
     } nat;
=20
-    if ( !hvm_altp2m_supported() )
+    if ( !altp2m_supported() )
         return -EOPNOTSUPP;
=20
     if ( copy_from_guest(&a, arg, 1) )
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index e7c1364802f8..6406bb687718 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -702,7 +702,7 @@ static inline bool hvm_hap_supported(void)
 }
=20
 /* returns true if hardware supports alternate p2m's */
-static inline bool hvm_altp2m_supported(void)
+static inline bool altp2m_supported(void)
 {
     return IS_ENABLED(CONFIG_ALTP2M) && hvm_funcs.caps.altp2m;
 }
@@ -876,7 +876,7 @@ static inline bool hvm_hap_supported(void)
     return false;
 }
=20
-static inline bool hvm_altp2m_supported(void)
+static inline bool altp2m_supported(void)
 {
     return false;
 }
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 6918a00a2a25..563eba3c0d36 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -501,7 +501,7 @@ int hap_enable(struct domain *d, u32 mode)
     }
=20
 #ifdef CONFIG_ALTP2M
-    if ( hvm_altp2m_supported() )
+    if ( altp2m_supported() )
     {
         /* Init alternate p2m data */
         if ( (d->arch.altp2m_eptp =3D alloc_xenheap_page()) =3D=3D NULL )
@@ -546,7 +546,7 @@ void hap_final_teardown(struct domain *d)
     unsigned int i;
=20
 #ifdef CONFIG_ALTP2M
-    if ( hvm_altp2m_supported() )
+    if ( altp2m_supported() )
         for ( i =3D 0; i < d->nr_altp2m; i++ )
             p2m_teardown(d->altp2m_p2m[i], true, NULL);
 #endif
@@ -590,7 +590,7 @@ void hap_teardown(struct domain *d, bool *preempted)
=20
 #ifdef CONFIG_ALTP2M
     /* Leave the root pt in case we get further attempts to modify the p2m=
. */
-    if ( hvm_altp2m_supported() )
+    if ( altp2m_supported() )
     {
         if ( altp2m_active(d) )
             for_each_vcpu ( d, v )
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index e126fda26760..ce14066fedaf 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -128,7 +128,7 @@ int p2m_init(struct domain *d)
         return rc;
     }
=20
-    rc =3D hvm_altp2m_supported() ? p2m_init_altp2m(d) : 0;
+    rc =3D altp2m_supported() ? p2m_init_altp2m(d) : 0;
     if ( rc )
     {
         p2m_teardown_hostp2m(d);
@@ -197,7 +197,7 @@ void p2m_final_teardown(struct domain *d)
 {
     if ( is_hvm_domain(d) )
     {
-        if ( hvm_altp2m_supported() )
+        if ( altp2m_supported() )
             p2m_teardown_altp2m(d);
         /*
          * We must tear down nestedp2m unconditionally because
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index ddb4c7606be1..84159198f3a0 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -995,7 +995,7 @@ out:
     if ( is_epte_present(&old_entry) )
         ept_free_entry(p2m, &old_entry, target);
=20
-    if ( hvm_altp2m_supported() && entry_written && p2m_is_hostp2m(p2m) )
+    if ( altp2m_supported() && entry_written && p2m_is_hostp2m(p2m) )
     {
         ret =3D p2m_altp2m_propagate_change(d, _gfn(gfn), mfn, order, p2mt=
, p2ma);
         if ( !rc )
--=20
2.34.1


