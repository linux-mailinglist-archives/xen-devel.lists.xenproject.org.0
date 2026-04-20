Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCgeLOaL5mmbyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9770433B5E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286498.1567651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBS-00052W-Rl; Mon, 20 Apr 2026 20:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286498.1567651; Mon, 20 Apr 2026 20:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBR-0004rZ-Ii; Mon, 20 Apr 2026 20:25:29 +0000
Received: by outflank-mailman (input) for mailman id 1286498;
 Mon, 20 Apr 2026 19:54:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEuhC-0006RK-5O
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:54:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEuhB-008XBJ-IS
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:54:13 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6842b-bab6-0a2a0a5309dd-0a2a4501dfd2-48
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:54:13 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683b0-c1f2-0a2a45010019-22cac1c5ed76-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:51:13 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:58 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=ckCzk1RLU5H7o8z98jVbNDtfQVfZx3Dgw741GYACJI5hgysSvN+Ozn9xSf0uu4iuwrQwTm3N6RmSleU2HQTtR0TDOAK2uI2ywKgBYLOA9nMN0bn8GSpOaKFgs5cDw8y/PGLJvnaMLR+pNzODuL8ep5d6RJu2L5wj4YppD1uk1gNKUQKbHobOUaebMEwE07nLyR5RAO0KM1dWc9LoO41CpL2+q5LSzoeeLurU6d44lXjJ8AcocwNoasw3nL0Lue0VE9e8xOPvvO2Dw8sCsB4DZJfzgsOIQJfa455onP1lGj0Cpp1Qau9P/AsKRQK946Kx2Gr1A1bsZVEE/q24lS696A==; s=purelymail1; d=purelymail.com; v=1; bh=sJtt5sv+KSdQzbFQSigMs7fjAJ9VYApzYG1/06R78L4=; h=Feedback-ID:Received:From:To:Subject:Date;
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
	Sergej Proskurin <proskurin@sec.in.tum.de>
Subject: [RFC PATCH v6 25/43] arm/altp2m: Add altp2m index to arch_vcpu
Date: Mon, 20 Apr 2026 15:50:24 -0400
Message-Id: <20260420195042.207624-26-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-d62444/1776714673-BEA61FF4-CC81A8CE/0/0
X-purgate-type: clean
X-purgate-size: 1940
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:proskurin@sec.in.tum.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.888];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A9770433B5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit adds ap2m_idx to the VCPU struct on ARM. This makes it possible
to track the current altp2m view being used by a VCPU.

This is commit 2/4 of the altp2m_{get,set}_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v6: This patch was originally part of the "arm/p2m: Add
    HVMOP_altp2m_set_domain_state" patch from the v4/v5 patch series.
    It has been extracted into its own commit to make the patch series
    easier to follow. If it would be preferred, this commit can be squashed
    into another commit.

    Added support for the CONFIG_ALTP2M option.
---
 xen/arch/arm/include/asm/altp2m.h | 4 +---
 xen/arch/arm/include/asm/domain.h | 5 +++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/a=
ltp2m.h
index 5a217f48b103..bc695018e62c 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -26,9 +26,7 @@ static inline bool altp2m_supported(void)
 /* Alternate p2m VCPU */
 static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
 {
-    /* Not implemented yet */
-    BUG();
-    return 0;
+    return v->arch.ap2m_idx;
 }
=20
 #else /* CONFIG_ALTP2M */
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index 9e69d62086cd..4d497a21b648 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -249,6 +249,11 @@ struct arch_vcpu
     struct vtimer virt_timer;
     bool   vtimer_initialized;
=20
+#if CONFIG_ALTP2M
+    /* Alternate p2m index */
+    uint16_t ap2m_idx;
+#endif
+
     /*
      * The full P2M may require some cleaning (e.g when emulation
      * set/way). As the action can take a long time, it requires
--=20
2.34.1


