Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KQrFiv8CmqA+wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 13:46:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4FD56BE45
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 13:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311798.1581941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOwQi-0003Ko-WC; Mon, 18 May 2026 11:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311798.1581941; Mon, 18 May 2026 11:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOwQi-0003Ip-Sx; Mon, 18 May 2026 11:46:40 +0000
Received: by outflank-mailman (input) for mailman id 1311798;
 Mon, 18 May 2026 11:46:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gabi.qs.mail@gmail.com>) id 1wOwQh-0003Ij-GK
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 11:46:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOwQg-008rSm-SN
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 13:46:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6a0afc1e-e002-0a2a0a5209dd-0a2a4503b5e0-10
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 13:46:38 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6a0afc11-672d-0a2a45030019-d155802ea803-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 13:46:25 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so17331485e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 04:46:25 -0700 (PDT)
Received: from fedora ([212.231.230.22]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5694fbfsm436926785e9.6.2026.05.18.04.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 04:46:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779104785; x=1779709585; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8wbuIG4EBH33GZQGMZ+MnP2b/U10Ac10M+ofDb1KR8=;
        b=n+fo7ZRV5kY/15MKn09j5a9AphDASi4qSfLKGWyO6VdIoYCusJtcc5h0PNW+HOrSvW
         B5WU3etGky0Fplrjrku7mjJ4A76/7fEGmEXaQEzOpy+qEQkDxpVX9Ei5OexaMKsPv3yn
         iSy5fpoUoZuJd0b7x2ZkTNjknG4eNuXuWzrxiX/Ow+/euJYxbXcurzP0bQGpx80k8DGY
         zhcDVtPED8JElnbr1Gno8IayyOtesZmb0eknrqYR0LYlwNXaYNSu0B67sHPYbC0/dR1h
         8JOLGGoOOXuuvyw4eGKUPw3Wg2kENQRoea7iZzBgi65/6XbwAzYD2jhSv1x5RgwB+Nr4
         NAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104785; x=1779709585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8wbuIG4EBH33GZQGMZ+MnP2b/U10Ac10M+ofDb1KR8=;
        b=C0YtSoAGd4OYRXylohBwAuL9wTptEW5t02Ni8G16lbEpBHQK87B1bnCQFrnZgarZzc
         AnPPPQHUuNdBx6VaJ06PERkE9oscT9FfsDZlCavin9BDoAoELtmOELFVmB13OZeZFFWj
         kMxlurPPZ63p0OBQ5tw1UJ57y2u4nGpxkjJ6hwXTxWi+PthTH9HryHF1wdQqKz5axWYX
         9AAP7iLsfYMt5E6wBbJG3JMi7mctGBQmSyczzFzNGcfnbU6V9zWXb/P2blC0a6RW7fJ3
         uimiKQjuiUfqYXqUuMyrjuK6xDPpDURUTSfDYX2/zv9VSE+CcMtWGKyf5e0lqB1S5ARA
         Bltg==
X-Gm-Message-State: AOJu0Yzf/8g6ASKyJuELCaQfzO899bQdKX3CQd2gBQ+4LPc6U3s7ti3D
	4xkEnFScUpfvxOkEd0bOpicZJqCDqWz9OpoZw73nmzajfwqZzS70fVbWhCVpJY51rfQ=
X-Gm-Gg: Acq92OGgkXtlX6yge197beP8MMfXvRGO2kwTlqIIPpNX3u+rMWgz6m5C+z64Y3mPBj2
	uD7PPqhiIxyqlCeOBsf+IRgf5w3/SQrymQq/ucs6R1xUBi2m3BwDcGWKbk8GptpxptjemRJxyQ/
	eIit5nl4vC+HwRkjWbZFfxWDZhc7Ikuk/d+vER91IB29S4GmCA2EPTLWb9YtMxWYh+0spRgIsm6
	r4eaBWtdgtWJZTy+YNGgMr6p87cQYJxBOMa/cJJgjGcYehThrb2/x7EN7rsvgGIqsBUN3QOaBR9
	ORmBm2fsbO4KDa7VHm67my++UXubTnPg8DqTuvkdvzepQ8agtJc67QLlt1px/QSaHZFb7fU6ZCo
	jo1AzMCnKGQYVxHomcKbAxzAtjbNttPPouhZpIgJKRo6xtHlaaxjZNwcSujfLT8DCXDrxau0MHZ
	FcpZy8z4otNGe+MAOaMZtfzJYfSOYt7Mg=
X-Received: by 2002:a05:600c:1914:b0:48f:d620:c27f with SMTP id 5b1f17b1804b1-48fe4dac5efmr221386485e9.4.1779104784988;
        Mon, 18 May 2026 04:46:24 -0700 (PDT)
From: =?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	=?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
Subject: [PATCH v2] arm: Fix PT_PT table descriptor value and comment
Date: Mon, 18 May 2026 13:45:52 +0200
Message-ID: <20260518114552.29687-1-gabi.qs.mail@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2ef09a6a-f78f-47a5-8ffb-cd03cb51fc1b@amd.com>
References: <2ef09a6a-f78f-47a5-8ffb-cd03cb51fc1b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779104786-3B360938-8F9F34D4/0/0
X-purgate-type: clean
X-purgate-size: 2246
X-Rspamd-Queue-Id: BC4FD56BE45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:gabi.qs.mail@gmail.com,m:gabiqsmail@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[gabiqsmail@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.979];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[gabiqsmail@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Per ARMv7-A/ARMv8-A ARM, bits [11:2] of table descriptors are ignored by hardware. The original comment incorrectly described block/page descriptor fields (nG, SH, AP, NS, ATTR) which do not exist in the table descriptor format.

Set PT_PT to 0x403:
 - Bit 0 (P): Valid bit (required)
 - Bit 1 (T): Table descriptor type (required)
 - Bit 10 (AF): Access flag (future-proof for FEAT_HAFT)

Hardware ignores bits [11:2] but setting AF prepares for ARMv9's FEAT_HAFT. Using 0x403 rather than minimal 0x3 provides forward compatibility while avoiding unnecessary reserved bits.

This updates both arm32 and arm64 for consistency.

Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>

---
Changes in v2:
- Apply fix to both arm32 and arm64
- Use 0x403 instead of 0x743
---
 xen/arch/arm/arm32/mmu/head.S | 2 +-
 xen/arch/arm/arm64/mmu/head.S | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/head.S b/xen/arch/arm/arm32/mmu/head.S
index 5032e6c075..cab7be0621 100644
--- a/xen/arch/arm/arm32/mmu/head.S
+++ b/xen/arch/arm/arm32/mmu/head.S
@@ -8,7 +8,7 @@
 #include <asm/page.h>
 #include <asm/early_printk.h>
 
-#define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
+#define PT_PT     0x403 /* AF=1 T=1 P=1 (bits [11:2] ignored in table descriptors) */
 #define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
 #define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
 #define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index c3cb262e88..375d703d9b 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -8,7 +8,7 @@
 #include <asm/page.h>
 #include <asm/early_printk.h>
 
-#define PT_PT     0x743 /* AF=1 RES=11 SKL=1 IGN=0000 T=1 P=1 */
+#define PT_PT     0x403 /* AF=1 T=1 P=1 (bits [11:2] ignored in table descriptors) */
 #define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
 #define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
 #define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
-- 
2.54.0


