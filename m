Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A7664FED6
	for <lists+xen-devel@lfdr.de>; Sun, 18 Dec 2022 13:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465602.724401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6sZu-0007Ay-Ji; Sun, 18 Dec 2022 12:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465602.724401; Sun, 18 Dec 2022 12:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6sZu-00078U-G6; Sun, 18 Dec 2022 12:15:38 +0000
Received: by outflank-mailman (input) for mailman id 465602;
 Sun, 18 Dec 2022 12:15:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oNcc=4Q=neowutran.ovh=xen@srs-se1.protection.inumbo.net>)
 id 1p6sZs-00078O-TZ
 for xen-devel@lists.xenproject.org; Sun, 18 Dec 2022 12:15:37 +0000
Received: from neowutran.ovh (vps-eb112777.vps.ovh.net [51.83.40.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac893927-7ecd-11ed-8fd4-01056ac49cbb;
 Sun, 18 Dec 2022 13:15:34 +0100 (CET)
Received: from localhost.localdomain (82-65-208-184.subs.proxad.net
 [82.65.208.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by neowutran.ovh (Postfix) with ESMTPSA id 5E24760BCE;
 Sun, 18 Dec 2022 12:15:34 +0000 (UTC)
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
X-Inumbo-ID: ac893927-7ecd-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=neowutran.ovh;
	s=my-selector-name; t=1671365734;
	bh=zP4nE79QK6FlGUc7KX5q7eIL2zycoSjLlBmj2jo1BvU=;
	h=From:To:Cc:Subject:Date;
	b=tm8rMWl/90zPnnNFtzzl7wH3H88z/4fGUEebssbVBlQoeHZ/DfweXcWradk/UUArM
	 xlcQo07YfO501XVXfmVL66GC2MTz+eAQVWX3QN1M+dvJClmjNtCe/cndbbI3mmld4f
	 orLDV4ctADTRWp7nb3hUqvQu32XV0H/ulvM4MLjjiqRDEHdlvinMIFxa9nv869+8jL
	 Zj8p/B/z1op4v9EkIGS84MGRULBJURyqNc7Qx3PnGt/uK7Bnj4FJKRidqCtvcaG7mG
	 5oq0YzOKz7b5bN2YZogyk87LW18Q3+YkLzChcFHPBvsqjMt13lNd15LcRYJPYTLyul
	 Do+A1CDqNgIbN9uvsXm8MSQ5ukKJHO9RT9gX1469baaKx94bASrnYNJK4jO/c9Irfx
	 mE3LDOE2d7/7Ma5NDaiXSHpOlcBmNRbuoB7+wnn42vinXCI40U0K2s0ngXi2/hC0dP
	 /2KaWAlpoVOkpQFAT+BhbpEkPlB75ysfhLZa3wkE1FI4QtI16nDkhtERdpV1oK5QlI
	 OIuBtWVa6+nQz/9ZrFsltI0xEbY0Why05Nephzzl9oMK9eX7Y6LqhP4ImOLdYBUjs2
	 vVIvoRlEKd+j6Lv4lLMhVz/98nalEqCuuWPHUBgIs+80p18Fkm8qG5di2WyQcng61x
	 xXmb71/Wzszidf9T2ZYZqhnU=
From: Neowutran <xen@neowutran.ovh>
To: xen-devel@lists.xenproject.org
Cc: Neowutran <xen@neowutran.ovh>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] Bug fix - Integer overflow when cpu frequency > u32 max value.
Date: Sun, 18 Dec 2022 13:14:07 +0100
Message-Id: <d018f50f439c4d8dff8add022d28698a2af3c320.1671365645.git.xen@neowutran.ovh>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen/x86: prevent overflow with high frequency TSCs

Promote tsc_khz to a 64-bit type before multiplying by 1000 to avoid a
'overflow before widen' bug.
Otherwise just above 4.294GHz the value will overflow.
Processors with clocks this high are now in production and require this to work
correctly.

Signed-off-by: Neowutran <xen@neowutran.ovh>
---
Changed since v1:
 * smaller commit message
 * using uint64_t instead of u64
 * added signed-off-by tag
---
 xen/arch/x86/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index b01acd390d..c71e79e019 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2585,7 +2585,7 @@ int tsc_set_info(struct domain *d,
     case TSC_MODE_ALWAYS_EMULATE:
         d->arch.vtsc_offset = get_s_time() - elapsed_nsec;
         d->arch.tsc_khz = gtsc_khz ?: cpu_khz;
-        set_time_scale(&d->arch.vtsc_to_ns, d->arch.tsc_khz * 1000);
+        set_time_scale(&d->arch.vtsc_to_ns, (uint64_t)d->arch.tsc_khz * 1000);
 
         /*
          * In default mode use native TSC if the host has safe TSC and
-- 
2.38.1


