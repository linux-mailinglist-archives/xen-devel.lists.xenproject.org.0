Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKtMOeWL5mmZyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEE0433B50
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286481.1567594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBM-0003OG-Gk; Mon, 20 Apr 2026 20:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286481.1567594; Mon, 20 Apr 2026 20:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBM-000395-39; Mon, 20 Apr 2026 20:25:24 +0000
Received: by outflank-mailman (input) for mailman id 1286481;
 Mon, 20 Apr 2026 19:50:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEue2-0006Io-1u
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEue1-009YnP-El
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:57 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68397-bab6-0a2a0a5309dd-0a2a450c91e4-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:57 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683a0-62f1-0a2a450c0019-22cac1c58764-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:57 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:51 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=hLkAmez4qADkQgPiLxVKCyXQHyZXHCXUDQuAtPsEcn5oyyyULtkq23OwHCcGeenyubTn+eD+u8YaFbQcZzR2Op52LtyFZVSLGazBkvPj/t4WhHJ4A7j25n82nN5uAT2hRG56/sZMvRJmjIgFkXZKt7iZ89fQhiLbzI4lW0MU2aev83BQ4cyZ5vvKxXKJm+S41L3wNlj6lVB0pPvMXp23xjH52MXcQQky5zIjIeDGI1QZecNLywtfbkcWe4FjDhyte6PSNIsTftOQONAdu1T9E9V6RB2oS1vO5tGNK6GIQMmvQ1Ine5iS/K6LiIKmBx4WS8zxewRRE09TbK2GuJTW/Q==; s=purelymail1; d=purelymail.com; v=1; bh=v+7IFQCHZ3Oct1VjiErGm8hGsBkg24/rQNxOY8ewkgI=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Sergej Proskurin <proskurin@sec.in.tum.de>
Subject: [RFC PATCH v6 10/43] altp2m: Add ARM support to do_altp2m_op
Date: Mon, 20 Apr 2026 15:50:09 -0400
Message-Id: <20260420195042.207624-11-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-d25034/1776714657-6D161CF5-C07D9204/0/0
X-purgate-type: clean
X-purgate-size: 4553
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:proskurin@sec.in.tum.de,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.873];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 9BEE0433B50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit makes the minimum required changes necessary for do_altp2m_op
to compile on ARM. All altp2m commands in the switch statement are gated by
CONFIG_X86, with a default case of returning EOPNOTSUPP. This allows future
commits to move the #ifdef CONFIG_X86 down as support for ARM is added.

Additionally, a call to do_altp2m_op is added in the ARM HVMOP code.

This is commit 2/2 of the common do_altp2m_op phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v6: Replaced patches 2 and 3 from v4/v5 patch set with this patch.

    Made HVM_PARAM_ALTP2M read-only, following the change to the x86
    implementation in commit 0291089f6ea8. The DOMCTL to enable altp2m on
    ARM is implemented in a later commit in this patch series.
---
 xen/arch/arm/hvm.c  |  9 +++++++++
 xen/common/altp2m.c | 29 ++++++++++++++---------------
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
index 86e49bf47403..7c778795a280 100644
--- a/xen/arch/arm/hvm.c
+++ b/xen/arch/arm/hvm.c
@@ -5,6 +5,7 @@
  * Arch-specific hardware virtual machine abstractions.
  */
=20
+#include <xen/altp2m.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
@@ -23,6 +24,10 @@ static int hvm_allow_set_param(const struct domain *d, u=
nsigned int param)
 {
     switch ( param )
     {
+        /* The following parameters are read-only. */
+    case HVM_PARAM_ALTP2M:
+        return -EEXIST;
+
         /*
          * The following parameters are intended for toolstack usage only.
          * They may not be set by the domain.
@@ -123,6 +128,10 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARA=
M(void) arg)
             rc =3D -EINVAL;
         break;
=20
+    case HVMOP_altp2m:
+        rc =3D do_altp2m_op(arg);
+        break;
+
     default:
     {
         gdprintk(XENLOG_DEBUG, "HVMOP op=3D%lu: not implemented\n", op);
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index a43b3a3e34b3..6481fae1ed12 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -9,8 +9,10 @@
=20
 #include <xsm/xsm.h>
=20
-#ifdef CONFIG_X86
+#if defined(CONFIG_X86) && defined(CONFIG_HVM)
 #include <asm/hvm/nestedhvm.h>
+#endif
+
 /*
  * altp2m operations are envisioned as being used in several different
  * modes:
@@ -18,13 +20,13 @@
  * - external: All control and decisions are made by an external agent
  *   running domain 0.
  *
- * - internal: altp2m operations are used exclusively by an in-guest
- *   agent to protect itself from the guest kernel and in-guest
- *   attackers.
+ * - internal (x86 only): altp2m operations are used exclusively by an
+ *   in-guest agent to protect itself from the guest kernel and
+ *   in-guest attackers.
  *
- * - coordinated: An in-guest agent handles #VE and VMFUNCs locally,
- *   but makes requests of an agent running outside the domain for
- *   bigger changes (such as modifying altp2m entires).
+ * - coordinated (x86 only): An in-guest agent handles #VE and VMFUNCs
+ *   locally, but makes requests of an agent running outside the
+ *   domain for bigger changes (such as modifying altp2m entires).
  *
  * This corresponds to the three values for HVM_PARAM_ALTP2M
  * (external, mixed, limited). All three models have advantages and
@@ -97,7 +99,7 @@ int do_altp2m_op(
=20
     if ( (a.cmd !=3D HVMOP_altp2m_get_domain_state) &&
          (a.cmd !=3D HVMOP_altp2m_set_domain_state) &&
-         !d->altp2m_active )
+         !altp2m_active(d) )
     {
         rc =3D -EOPNOTSUPP;
         goto out;
@@ -122,6 +124,7 @@ int do_altp2m_op(
=20
     switch ( a.cmd )
     {
+#ifdef CONFIG_X86
     case HVMOP_altp2m_get_domain_state:
         a.u.domain_state.state =3D altp2m_active(d);
         rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
@@ -394,9 +397,12 @@ int do_altp2m_op(
             rc =3D altp2m_set_view_visibility(d, idx, a.u.set_visibility.v=
isible);
         break;
     }
+#endif /* CONFIG_X86 */
=20
     default:
+#ifdef CONFIG_X86
         ASSERT_UNREACHABLE();
+#endif
         rc =3D -EOPNOTSUPP;
         break;
     }
@@ -406,13 +412,6 @@ int do_altp2m_op(
=20
     return rc;
 }
-#else
-int do_altp2m_op(
-    XEN_GUEST_HANDLE_PARAM(void) arg)
-{
-    return -EOPNOTSUPP;
-}
-#endif
=20
 /*
  * Local variables:
--=20
2.34.1


