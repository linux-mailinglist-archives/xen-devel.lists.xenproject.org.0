Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADz6KO6M5mmryAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:30:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4C2433BF3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:30:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287346.1567811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvGG-0004YR-9j; Mon, 20 Apr 2026 20:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287346.1567811; Mon, 20 Apr 2026 20:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvGG-0004W2-71; Mon, 20 Apr 2026 20:30:28 +0000
Received: by outflank-mailman (input) for mailman id 1287346;
 Mon, 20 Apr 2026 20:30:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEvGE-0004QR-K2
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 20:30:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEvGE-004xrJ-0s
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 22:30:26 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68cd1-5cb7-0a2a0a5109dd-0a2a450995c4-18
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 22:30:26 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68ce0-2497-0a2a45090019-22cac1c5b5c6-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 22:30:25 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1174183712; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 20:30:23 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=oGwrXRxo+8rDytkzsBudPYgJAfDqFQFXgDhS5gjW/b3psLDpu2NSmxb6pCHEMrOZhmr3L4qbYtWaHh5vp/lz1GE1/fssqthRgZ9gQ6tFT6XnT8e9UtLRxsie9BOwnO1nw8a3+M+oUGxNH6Db8bBNJMBGxgTxO20I8Uwsk56LEaWAmbQFgXKzQYs3bT9oqq/gcNnYrXHY8jnMwaT7rGN07EyTCU996y9N+Kwbe2CdGQZQJejGvy/jn/awCC/5cFsAz2GEmqeLPpkovzRRzIaYFR5yhEt67ar1ss7WN99XHxvJxHg4GPzU9KIVJABRweWWtTnftRdbkPU2trqzItrV+w==; s=purelymail1; d=purelymail.com; v=1; bh=Lr/7jgBlmzXiiMhb4wIsFSy3Z++fKD5Dugfwfpq6hO8=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v6 33/43] arm/altp2m: Add altp2m_set_view_visibility{,_locked} support
Date: Mon, 20 Apr 2026 16:30:10 -0400
Message-Id: <20260420203020.208184-2-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420203020.208184-1-Rose.Spangler@purelymail.com>
References: <20260420203020.208184-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-bad1c0/1776717025-93175A53-A29C2BAD/0/0
X-purgate-type: clean
X-purgate-size: 2633
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,elektrobit.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.851];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 9C4C2433BF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit adds the altp2m_set_view_visibility and
altp2m_set_view_visibility_locked functions on ARM. This makes it possible
to set the altp2m view visibility in common altp2m routines (namely,
altp2m_flush).

This is commit 4/5 of the altp2m view validity/visibility phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/altp2m.c             | 30 ++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/altp2m.h |  8 ++++++++
 2 files changed, 38 insertions(+)

diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
index 0e19e197e826..aa48c17e11a3 100644
--- a/xen/arch/arm/altp2m.c
+++ b/xen/arch/arm/altp2m.c
@@ -37,6 +37,36 @@ bool altp2m_view_is_visible(struct domain *d, unsigned i=
nt idx)
     return d->arch.altp2m_state[array_index_nospec(idx, d->nr_altp2m)] =3D=
=3D ALTP2M_VISIBLE;
 }
=20
+int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
+                               uint8_t visible)
+{
+    int rc;
+
+    altp2m_lock(d);
+    rc =3D altp2m_set_view_visibility_locked(d, altp2m_idx, visible);
+    altp2m_unlock(d);
+
+    return rc;
+}
+
+int altp2m_set_view_visibility_locked(struct domain *d, unsigned int altp2=
m_idx,
+                                      uint8_t visible)
+{
+    int rc =3D 0;
+
+    if ( altp2m_idx >=3D d->nr_altp2m || !altp2m_view_is_valid(d, altp2m_i=
dx) )
+        rc =3D -EINVAL;
+    else if ( visible )
+        d->arch.altp2m_state[array_index_nospec(altp2m_idx, d->nr_altp2m)]=
 =3D
+            ALTP2M_VISIBLE;
+    else
+        d->arch.altp2m_state[array_index_nospec(altp2m_idx, d->nr_altp2m)]=
 =3D
+            ALTP2M_INVISIBLE;
+
+    return rc;
+}
+
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/a=
ltp2m.h
index fbe66ad5536d..f8d0dd799a4a 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -40,6 +40,14 @@ enum altp2m_view_state {
     ALTP2M_INVISIBLE,
 };
=20
+/* Set a specific p2m view visibility */
+int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
+                               uint8_t visible);
+
+/* Set a specific p2m view visibility (with lock already held) */
+int altp2m_set_view_visibility_locked(struct domain *d, unsigned int altp2=
m_idx,
+                                      uint8_t visible);
+
 #else /* CONFIG_ALTP2M */
=20
 static inline bool altp2m_supported(void)
--=20
2.34.1


