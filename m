Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMjiDMnYDWqj4AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 17:52:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB3B59143F
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 17:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314121.1584118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjDF-0007hV-Kv; Wed, 20 May 2026 15:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314121.1584118; Wed, 20 May 2026 15:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjDF-0007ej-IB; Wed, 20 May 2026 15:52:01 +0000
Received: by outflank-mailman (input) for mailman id 1314121;
 Wed, 20 May 2026 15:52:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e46162869000f373@swg.vates.tech>)
 id 1wPjDE-0007ed-7d
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 15:52:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPjDD-00HDJ7-KY
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 17:51:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e46162869000f373@swg.vates.tech>)
 id 6a0dd876-5cb7-0a2a0a5109dd-0a2a4506cef2-44
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 17:51:59 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e46162869000f373@swg.vates.tech>)
 id 6a0dd89f-7371-0a2a45060019-b9ff1c22a30f-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 17:51:59 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e46162869000f373.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 20 May 2026 15:51:57 +0000
Received: from bazzite.gpn.vates.fr (88-175-170-134.subs.proxad.net
 [88.175.170.134]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 31834868D8;
 Wed, 20 May 2026 17:51:57 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=vVL24CTVrrepMXmhLSUTgF/J1TtkBVoPs1lVFbXAbqE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=ImvHycVpargEHRiWoLC+u+WBgtip+cTyz+90GLq3oe7tlpPzzz8TuPRIeHwvNkYlGoLMugHpD
 Px2etAyUf7XV1/JLYEzd/GAyHjaE2Y2pgPmgMfSwsiH+EzKQTmXYgpCGlHQofisB2BeKditgmSp
 OBsD7IE3ZaPy+a5dQv/PsVKMSXGZNOd17BKxvxPZjEkU1DjMX/gkAzwIdo6tIByYDTQeygusn3o
 jMO7brtT9+Uj01biOHOkIjt60Ssgf1qSkM8pOkH7EWloPUBWJL/CvsRyzNfR02CzZlF0s8mWW6B
 5Uie9iXJZAS7gWthzyx7xOxweGEqnODHNBIy/As0zETQ==
X-Zone-Loop: 959df66f18f2a21e91f4e0881fd64bb9dbaadc46d6bf
x-campaign-type: default
x-transaction-id: 5acd565a-b143-442f-8b97-ea55d02a6163
x-swg-uid: 01-23142679-b23f-4480-889c-59843510e477
X-Mailer: Sweego
Message-ID:
 <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
x-swg-bid: 1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
Date: Wed, 20 May 2026 17:51:31 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1070.9e5a0f0fefa47ed6.19e4616267f.17fafed23575f740=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779292317315
X-purgate-ID: tlsNG-16d1c6/1779292319-8D785D75-174FA97F/0/0
X-purgate-type: clean
X-purgate-size: 1984
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:email,vates.tech:mid,vates.tech:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CAB3B59143F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.1070.9e5a0f0fefa47ed6.19e4616267f.17fafed23575f740=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

__{put,get}_guest returns -EFAULT on access faults which causes
the injected cr2 to be off by 14 bytes (as EFAULT is 14) which is
incorrect=2E

Fix the computation by relying on copy_{from,to}_guest_pv which
reports the number of remaining bytes instead of a negative errno,
such that we can compute the offset properly=2E

Fixes: 70ad570b2799 ("x86/64: paravirt 32-on-64 call gate support")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/arch/x86/pv/emul-gate-op=2Ec | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pv/emul-gate-op=2Ec b/xen/arch/x86/pv/emul-gate-=
op=2Ec
index c2c699fbff=2E=2Ecacc171115 100644
--- a/xen/arch/x86/pv/emul-gate-op=2Ec
+++ b/xen/arch/x86/pv/emul-gate-op=2Ec
@@ -289,9 +289,10 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
         int rc;
 #define push(item) do \
         { \
+            unsigned int __value =3D item; \
             --stkp; \
             esp -=3D 4; \
-            rc =3D __put_guest(item, stkp); \
+            rc =3D copy_to_guest_pv(stkp, &__value, sizeof(__value)); \
             if ( rc ) \
             { \
                 pv_inject_page_fault(PFEC_write_access, \
@@ -359,7 +360,7 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
                     unsigned int parm;
=20
                     --ustkp;
-                    rc =3D __get_guest(parm, ustkp);
+                    rc =3D copy_from_guest_pv(&parm, ustkp, sizeof(parm))=
;
                     if ( rc )
                     {
                         pv_inject_page_fault(0, (unsigned long)(ustkp + 1=
) - rc);
--=20
2=2E52=2E0



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.1070.9e5a0f0fefa47ed6.19e4616267f.17fafed23575f740=---

