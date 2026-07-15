Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dRTBFfeNV2piWwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 15:41:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC7D75ECDF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 15:41:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b="BO8Z1/si";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1363138.1614954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzrB-0008WG-AY; Wed, 15 Jul 2026 13:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363138.1614954; Wed, 15 Jul 2026 13:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzrB-0008U2-7Y; Wed, 15 Jul 2026 13:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1363138;
 Wed, 15 Jul 2026 13:40:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f660249d4000edb5@swg.vates.tech>)
 id 1wjzr9-0008SI-Cr
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 13:40:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjzr8-002mfL-Od
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 15:40:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f660249d4000edb5@swg.vates.tech>)
 id 6a578ddf-bab6-0a2a0a5309dd-0a2a45099892-40
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:40:58 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f660249d4000edb5@swg.vates.tech>)
 id 6a578dea-be1a-0a2a45090019-b9ff1c22916f-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:40:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f660249d4000edb5.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Jul 2026 13:40:53 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0782381F5A;
 Wed, 15 Jul 2026 15:40:53 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=IYUxAUY+XUVrfvgMnF3AcIUyUaG4Dpyw2dYT3Z3A3Aw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=BO8Z1/siGNiVLYP8MliraOfVv0WezqdHoN2ynTqNf1p/nDz5Js/dZuB903NOwoVcz2utloVQn
 MVf5Zx5QYIEhMbHEmJwR4HpYony9TjuQZO2UvipsCS2V/sHjr0M9NyPYslJ4YHfhrMtU8qQqKk8
 2LpzQRwRPOJhDRrEdSZc9MzYyHbl29uqQrspPdxlgBLI0IEGL6/x7UrZiTZ7+yfiaFZIPGQrG+n
 ZGioTRQWpJkOLg40cd69+O3o1H0hTfStXQfeiuRjRIeQZE+If4kw7iU7kZMXxoBamaXpeMNdVqb
 cl5HkOHAnsFYW5lzwZM+JYNWXl+eztkMM2s9ykOUWtxg==
X-Zone-Loop: ed2350d586bedb6d5137f39db10d58a630329a1e3aa0
x-campaign-type: default
x-transaction-id: 9cbfeea0-89ee-4a48-9a2f-18f220b71af7
x-swg-uid: 01-0ac4104e-828d-4284-9190-5d09a9dc5283
X-Mailer: Sweego
Message-ID:
 <1784122853.8631fc262581453bbf619ec5b2062170.19f660249d4000edb5@vates.tech>
x-swg-bid: 1784122853.8631fc262581453bbf619ec5b2062170.19f660249d4000edb5
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
Subject: [RFC PATCH 2/2] vvmx: Reinject TDX instruction exit reasons to L1 when emitted by L2
Date: Wed, 15 Jul 2026 15:38:29 +0200
In-Reply-To: <1784122772.8631fc262581453bbf619ec5b2062170.19f66010afa000edb5@vates.tech>
References: <1784122772.8631fc262581453bbf619ec5b2062170.19f66010afa000edb5@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.891.1691f3a2d28ce8c7.19f66024750.264e79b43cc33c9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784122853200
X-purgate-ID: tlsNG-bad1c0/1784122858-BE2C4034-782739D8/0/0
X-purgate-type: clean
X-purgate-size: 1197
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:from_mime,vates.tech:mid,vates.tech:dkim,vates.tech:email,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:from_smtp,lists.xenproject.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AC7D75ECDF
X-Rspamd-Action: no action

---=Part.891.1691f3a2d28ce8c7.19f66024750.264e79b43cc33c9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Reinject the exit reason to L1 rather than failing on "Unhandled nested vme=
xit"
which leads to a L1 crash that can be caused by L2 by executing one of the=
 TDX
instructions=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/arch/x86/hvm/vmx/vvmx=2Ec | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vvmx=2Ec b/xen/arch/x86/hvm/vmx/vvmx=2Ec
index e4cdfe55c1=2E=2Eb2ad7db332 100644
--- a/xen/arch/x86/hvm/vmx/vvmx=2Ec
+++ b/xen/arch/x86/hvm/vmx/vvmx=2Ec
@@ -2496,6 +2496,8 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *reg=
s,
     case EXIT_REASON_INVEPT:
     case EXIT_REASON_XSETBV:
     case EXIT_REASON_INVVPID:
+    case EXIT_REASON_SEAMCALL:
+    case EXIT_REASON_TDCALL:
         /* inject to L1 */
         nvcpu->nv_vmexit_pending =3D 1;
         break;
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.891.1691f3a2d28ce8c7.19f66024750.264e79b43cc33c9=---

