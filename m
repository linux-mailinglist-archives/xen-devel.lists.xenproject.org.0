Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PqiCeSL5mlOyAEAu9opvQ:T3
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DDF433B10
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286499.1567657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBV-0005Jo-BK; Mon, 20 Apr 2026 20:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286499.1567657; Mon, 20 Apr 2026 20:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBT-000529-Co; Mon, 20 Apr 2026 20:25:31 +0000
Received: by outflank-mailman (input) for mailman id 1286499;
 Mon, 20 Apr 2026 19:54:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEuhC-0006RL-7I
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:54:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEuhB-001Dle-KN
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:54:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68454-5cb7-0a2a0a5109dd-0a2a4503cb20-14
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:54:13 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683b0-672d-0a2a45030019-22cac1c5ed78-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:51:13 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:59 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=jyLGAcgSR6t3hWjZwx7uMdSZpDIEbDwOYrxRjZ+6+Pmnt+aGAD6SoaShwQ8Bh72FF/ZmLSkOEyMUmN8BRirbhRoeBFIfazMHKmCrxMjAFwx/yzGpaQ0mbb9RrWlmOJQHkxIkN4PqwHUIzB3jOzUL0msJjzV83RZa6Esbjl/YL0mdEQrBS3anCTZ7e7D46NS1gTT9ystRQGXHfAJAPzOw8Mko+V5/qI3nx8GFJ3WjNwvQhX3f/YjOSq34iw99Gn92mGx2e3Q6K+wn+C6fhdCHMWLQ66/A9JrUy27mm5LmMkMMa4+iNTBTsjChRchweB+RANnfHW9RjIdbu4el42TwBA==; s=purelymail1; d=purelymail.com; v=1; bh=REsQIKHl7J7AKoiHPZNWVFk+81JDE53ulC3Q/fRj3U0=; h=Feedback-ID:Received:From:To:Subject:Date;
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
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [RFC PATCH v6 26/43] altp2m: Add altp2m_set_vcpu_idx
Date: Mon, 20 Apr 2026 15:50:25 -0400
Message-Id: <20260420195042.207624-27-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-33051d/1776714673-48FD6938-BEA2AA01/0/0
X-purgate-type: clean
X-purgate-size: 1731
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.902];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 99DDF433B10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit adds the altp2m_set_vcpu_idx function for both x86 and ARM.
Since the altp2m VCPU index is stored differently depending on which
architecture is used, the altp2m_set_vcpu_idx function makes it possible to
set this value in an architecture independent way for common code routines.

This is commit 3/4 of the altp2m_{get,set}_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/include/asm/altp2m.h | 5 +++++
 xen/arch/x86/include/asm/altp2m.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/a=
ltp2m.h
index bc695018e62c..f001e022a213 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -29,6 +29,11 @@ static inline uint16_t altp2m_vcpu_idx(const struct vcpu=
 *v)
     return v->arch.ap2m_idx;
 }
=20
+static inline void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx)
+{
+    v->arch.ap2m_idx =3D idx;
+}
+
 #else /* CONFIG_ALTP2M */
=20
 static inline bool altp2m_supported(void)
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/a=
ltp2m.h
index a1b078783b3e..b3d348386a00 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -60,6 +60,11 @@ static inline uint16_t altp2m_vcpu_idx(const struct vcpu=
 *v)
     return vcpu_altp2m(v).p2midx;
 }
=20
+static inline void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx)
+{
+    vcpu_altp2m(v).p2midx =3D idx;
+}
+
 /*
  * Alternate p2m: shadow p2m tables used for alternate memory views
  */
--=20
2.34.1


