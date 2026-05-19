Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILzUJrKMDGr0iwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 18:15:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57211582170
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 18:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313213.1583435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPN6I-0007sH-Te; Tue, 19 May 2026 16:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313213.1583435; Tue, 19 May 2026 16:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPN6I-0007qR-Qw; Tue, 19 May 2026 16:15:22 +0000
Received: by outflank-mailman (input) for mailman id 1313213;
 Tue, 19 May 2026 16:15:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4105277b000f373@swg.vates.tech>)
 id 1wPN6H-0007qK-7T
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 16:15:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPN6G-00DJsn-JY
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 18:15:20 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4105277b000f373@swg.vates.tech>)
 id 6a0c8c97-5cb7-0a2a0a5109dd-0a2a450bd980-2
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 18:15:20 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4105277b000f373@swg.vates.tech>)
 id 6a0c8c98-212f-0a2a450b0019-b9ff1c22b549-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 18:15:20 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e4105277b000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 19 May 2026 16:15:17 +0000
Received: from leducb (182.136.141.83.rev.sfr.net [83.141.136.182])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 926978684D;
 Tue, 19 May 2026 18:15:16 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=teqjXE3tkmZ9cojzz0pTGknvHaVWTahpc3tDyhhfebE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:feedback-id;
 b=D+3lt53woS3bT1rUSSUt+d79+A/oodZnX9UdGtZJ51np80WsDsDjvYqoOoG8vGuJmgwj2dynn
 QB7Pfl/XPKDJG4zk9sOwyWRwZS4+Ma6v7MVA0HY4v20oDQZ83BSpZCwRzKDT4V1S+uo7OvRrzgr
 HggFRPj2+ejgGVQwlxwinsxgTAZlnSKDqwC99r6EMy/RWCWGa6lDRDNp5yfuopkQp0nMWCBR0KM
 DJXnrXaTqRmJlA44tNb+yOCG0OdPxWc59qEpN0QiApbXrZWqnZVFBjkQmplIXEM8xJCj4aXnxiQ
 lJUg9giB7GS/gB1szzHF2VFIkgiLsReT7VttpCdn6Rmw==
X-Zone-Loop: 12082eaabae1ec0f85cdbbabbdd681f162d1904d40cb
x-campaign-type: default
x-transaction-id: 7e66f6f7-0931-4fe6-a605-f577e1eccb32
x-swg-uid: 01-594f6c10-167d-47ea-b3d1-dc147c62644c
X-Mailer: Sweego
Message-ID:
 <1779207317.8631fc262581453bbf619ec5b2062170.19e4105277b000f373@vates.tech>
x-swg-bid: 1779207317.8631fc262581453bbf619ec5b2062170.19e4105277b000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen/riscv: fix sstc init to write vstimecmp instead of stimecmp
Date: Tue, 19 May 2026 18:14:44 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779207316857
X-purgate-ID: tlsNG-42698a/1779207320-23374F3B-07CA67EE/0/0
X-purgate-type: clean
X-purgate-size: 785
X-Spamd-Result: default: False [0.82 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vates.tech,wdc.com,gmail.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[baptiste.le-duc@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,vates.tech:mid,vates.tech:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baptiste.le-duc@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 57211582170
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the comment above initializing of CSR_VSTIMECMP should be used instead of CSR_STIMECM.

Fixes: 25e032730690 ("xen/riscv: allow Xen to use SSTC while hiding it from guests")

Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/arch/riscv/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index 8769709e52..10b7e35f13 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -101,6 +101,6 @@ void __init preinit_xen_time(void)
          * Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
          * ULONG_MAX.
          */
-        csr_write64(CSR_STIMECMP, ULONG_MAX);
+        csr_write64(CSR_VSTIMECMP, ULONG_MAX);
     }
 }
-- 
2.54.0


