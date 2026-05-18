Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DyeLSB/C2r8IQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 23:05:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6E7573A35
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 23:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312239.1582384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP59M-0007IX-Kp; Mon, 18 May 2026 21:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312239.1582384; Mon, 18 May 2026 21:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP59M-0007GW-H3; Mon, 18 May 2026 21:05:20 +0000
Received: by outflank-mailman (input) for mailman id 1312239;
 Mon, 18 May 2026 21:05:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gabi.qs.mail@gmail.com>) id 1wP59K-0007GQ-Ln
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 21:05:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP59J-009coL-JP
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 23:05:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6a0b7efc-5cb7-0a2a0a5109dd-0a2a4504ccc0-16
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 23:05:17 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6a0b7f0d-1dec-0a2a45040019-d155dd31b507-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 23:05:17 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45ae6a0e523so1431151f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 14:05:17 -0700 (PDT)
Received: from fedora ([212.231.230.22]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a17a22sm40443669f8f.22.2026.05.18.14.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 14:05:16 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779138317; x=1779743117; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agHCrwJYP0DCxaiVVTnVqUVT8BS6ccgDGvOgzoEs3C4=;
        b=iNx23pqOp5n8Zstd1aSEz+UOlJ6s0IWCLpGRKuk9gv6+NPTb+KeGyXfB+mJh5Zq7kg
         uZBbE8lZQNfTDVKiDHg81fRL8YWXIZcqME4Hajezhq4kavOTFL1JjC+HZcnD3gfDVKg2
         oScj7lsWjBykG5mVYTuRqqOvyCMnFlz69pUllcIzubwLgoN4AR1GC1Bykd8MOzIUe3xf
         D8Gg+dxBQnPHUOPzI/9Y/Du/vsUdVNdMmAFPHfmdyFWAZHVHFANBke+Oh1lPfH3oa7b/
         8maf6QEwXb0hJ7qQBENTG831Sivk4h9epXKdZ22/bVebOx9aEYFjAoChx63LUIKwGzWT
         kQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779138317; x=1779743117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agHCrwJYP0DCxaiVVTnVqUVT8BS6ccgDGvOgzoEs3C4=;
        b=SHnuBss08wuC1uNuWLrHJdMmuhf7mt0I8PWN/CdQ95xMnSVFf7UGrZ4GDZsw6NdjyW
         oe57w7QuD2a91mlc+UOIPJHlFEkRqWvY80ENJ2ooF9C7tZHOmkFUx6kMZwLDsuWCz7Ub
         qSY1x0YRE8+MYlUILVJaE5RqDfKQnxoYs7fzQVqfnQMiT5g1YrEnhKbk7+hqFDDD87TU
         4ycSxMxxXxgG6oi308Qc6j9BiNQQpd6han9iYsfv2Wl6TUUEmwwmAYpJnDMlWkJvjaTr
         BCgpksU/V9KK5b3qPCjePU7f7W1SquPczsjmE3ZsR8pHNvrE1CnUollRcoyk3M/SXoNI
         2heA==
X-Gm-Message-State: AOJu0YzyMU1Rj6SBXHdD8U1S61fOlo0wHBtU4aOsSbzoe0qNCqCWBAAk
	3mA6U2YCxZijH7MIXCDbyYuLf5wtYb/+NLBz1ODha+vRlPhDtJH9hca6g8aSrlWYQ1A=
X-Gm-Gg: Acq92OGaasIoxL2d+Z4iiwvWoJwzut1gPK3qEEUMfk2/TFmDhtoVfa5C/n2DRjNBVDj
	Ry163sHFT61XbKNcXhbA86dVVT1xPYv8KlMCvyqVkQAJIPxtvS6885phK22pUNuBBmPRKICPN7b
	QBZl3vBPck+7JC/SRO45O5M4wEgVFfyh6KkngY3UkRNpHPFN1ZDGlCPSWu37sRPDyfARPvnI8Oo
	WRj+Cde6srod8MBtgztmJrK9pNVk0+9ryZ2gBBwSkuPVwCYaJdPNStwtRjkNQfnaoxSJ7aKkQoW
	mFLpLYEeaXfkYm0g8oyucprb0yqan7/U5mqRAjTXxi9kDpjIcsj6mE8K/J6UM8xPRZPpFjW2G1G
	SZzA3OUmnO8ZOhS3r68TRr9BLr/gyqi1IK9iRYM8sZPadCbAHXtp/8xKVJFxJhHQWlD3cA97bF9
	8A87b7I8PowZFk9LbXF6zCR7U5fCKtrtU=
X-Received: by 2002:a05:6000:400f:b0:456:15fa:9eba with SMTP id ffacd0b85a97d-45e5c5a56f7mr25710079f8f.43.1779138316581;
        Mon, 18 May 2026 14:05:16 -0700 (PDT)
From: =?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	=?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
Subject: [PATCH v3] arm: Fix PT_PT table descriptor value and comment
Date: Mon, 18 May 2026 23:00:08 +0200
Message-ID: <20260518210340.81347-1-gabi.qs.mail@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b0a7dbdf-775a-45e2-bee4-d234ca21c002@amd.com>
References: <b0a7dbdf-775a-45e2-bee4-d234ca21c002@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1779138317-28F753FF-7C68DAAE/0/0
X-purgate-type: clean
X-purgate-size: 1929
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:gabi.qs.mail@gmail.com,m:gabiqsmail@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[gabiqsmail@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gabiqsmail@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6B6E7573A35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Per ARMv7-A/ARMv8-A ARM, bits [11:2] of table descriptors are
ignored by hardware. The original comment incorrectly described
block/page descriptor fields which are not present in table
descriptors.

Use the minimal valid encoding for table descriptors by setting
PT_PT to 0x3.

This updates both arm32 and arm64 for consistency.

Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
---
Changes in v3:
- Use 0x3 instead of 0x403

Changes in v2:
- Apply fix to both arm32 and arm64
- Use 0x403 instead of 0x743
---
 xen/arch/arm/arm32/mmu/head.S | 2 +-
 xen/arch/arm/arm64/mmu/head.S | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/head.S b/xen/arch/arm/arm32/mmu/head.S
index cab7be0621..3731322f7e 100644
--- a/xen/arch/arm/arm32/mmu/head.S
+++ b/xen/arch/arm/arm32/mmu/head.S
@@ -8,7 +8,7 @@
 #include <asm/page.h>
 #include <asm/early_printk.h>
 
-#define PT_PT     0x403 /* AF=1 T=1 P=1 (bits [11:2] ignored in table descriptors) */
+#define PT_PT     0x3   /* T=1 P=1 */
 #define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
 #define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
 #define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index 375d703d9b..8e514d2114 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -8,7 +8,7 @@
 #include <asm/page.h>
 #include <asm/early_printk.h>
 
-#define PT_PT     0x403 /* AF=1 T=1 P=1 (bits [11:2] ignored in table descriptors) */
+#define PT_PT     0x3   /* T=1 P=1 */
 #define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
 #define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
 #define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
-- 
2.54.0


