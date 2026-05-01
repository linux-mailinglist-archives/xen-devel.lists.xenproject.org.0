Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qeizCTVn9GnFBAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 10:41:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E634AB199
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 10:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298579.1573761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIjQC-0004s2-Vx; Fri, 01 May 2026 08:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298579.1573761; Fri, 01 May 2026 08:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIjQC-0004pL-Sz; Fri, 01 May 2026 08:40:28 +0000
Received: by outflank-mailman (input) for mailman id 1298579;
 Fri, 01 May 2026 08:40:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wIjQB-0004pD-6a
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 08:40:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIjQA-00BT7p-Hd
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 10:40:26 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69f466f2-2eae-0a2a0a5409dd-0a2a4501e39c-6
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 10:40:26 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69f466fa-c1f2-0a2a45010019-d155dd2bd4ee-3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 10:40:26 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-44985f4ab0fso687483f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 01:40:26 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8ea7cf6asm3622211f8f.8.2026.05.01.01.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 01:40:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1777624826; x=1778229626; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qHyImPMpP5f7T3SzA9ViYvBqtERzuKjGfwrkNJWUECc=;
        b=jF3/tg1BY5Ai/bPz47PvUBKFQ11qJOjB1LxOAR8BcDf7yzYNKnmS1NzXSBAwr0sND+
         E5uPJ3gCuQvLoOxzb9sKyArZqP0EEqfUbcwEZWpiJG0SmMAbnZNg0xo3zcQMbNCaAYk9
         jcJKbIcJXxahHSYaY7YOsmdQFlthUgC0281vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777624826; x=1778229626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHyImPMpP5f7T3SzA9ViYvBqtERzuKjGfwrkNJWUECc=;
        b=ZKk3CzXbIIbQ2Y9rN2LlRBBd40w1+29sqhhdtn+Br/FATU7mNWl4QaqlBLFy088b8a
         QXXUkbWp/p90TEXtqxxfTf88KnbC5m70ShoXWVHtkctHgLMqaDBglyR27+G11rPwqK6X
         kxZc3IhEzxS3ejsZZJH9jsDw2ZP4HMcnN1OG7MH8RvrE7vrj6q2uZQU3XNZ0VgsILl5M
         Sa+cA8153uv/fWOz6G5rHDJexueuOV5m/PeX1IxWmiX9YSc9SfkrwH2j6LifuFX6agm4
         A0fWA/sK1ceHt5KaSB/KfXtpFg90b/nnukkrN/d836I5ZXYCne8+oYeGxfoSLoq7vW34
         6iug==
X-Gm-Message-State: AOJu0YyJEdIvMoBc16KaIQlBarcdV8NB3MIiW7dDOyuGYhX7rIQE6O9K
	5xI4yp3HaHiXIgO+RDyttByg89RU//w4pTDs/iZ0mdyo/BkiHqaCE+56Se2Rc5tdCXsMB5AVXWe
	j7EdCsi0=
X-Gm-Gg: AeBDievkhXI+yc91jBVbzYQ4tw7n4eGWQwOsKb2kzWnt/z5UVV2xNSH1LcERulkObAP
	Hzyl8eYIZdPvz8xQB4dkf6vgUTn2mUezW1pQ+SUoVdmma2GcMuhpeOuaxgcroilde9BXTSusMd9
	1ZxKnTdLZKICA0Oy+PT0uCRfdv1stv60i3pIiCdSrYgJkVBEZrTlTFGyrzh8mxJpKtUxoAnpWmY
	R+Ep+d7r9/3OBJy14/uN6mmOJbWaCc/mT7B/s8sf1QfI/b61a/ftddr0lHiNlCJnX5fN251pIDk
	IoHQYYZRAqiR6QM94Ih3rkYfBFV0rDxjiWHjwJvQfjKAaiRd0zLpcfe9jLLhIrR4UBxOPeNwYBr
	nG0nBWhF7msv2UxkViP/5uPpt7fs/2g+kxrokPH8CRnn2B6B8ojcEB+Xmz7ZjpqN71tDt3pqTUD
	1LYkfHjeFk9HBwwXs7E2QJ0zw1tlP4fhZ22r3aRXCMLL0/rveAaqLBGkQ2G7UUETt6TxYp6Ib+f
	X3S+/NRsAq24UhZsuPn13+XMw==
X-Received: by 2002:a05:6000:2f8a:b0:441:1cf9:4f06 with SMTP id ffacd0b85a97d-4493fed64c0mr10420396f8f.31.1777624825478;
        Fri, 01 May 2026 01:40:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/pdx: Undef the correct macro
Date: Fri,  1 May 2026 09:40:23 +0100
Message-Id: <20260501084023.1195353-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1777624826-B6265FF4-2329BAE9/0/0
X-purgate-type: clean
X-purgate-size: 936
X-Rspamd-Queue-Id: A2E634AB199
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:luca.fancellu@arm.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,vates.tech:email,citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

This was caused by a renamne during review.

No functional change.

Reported-by: Luca Fancellu <luca.fancellu@arm.com>
Fixes: bd0b3a876d80 ("pdx: allow per-arch optimization of PDX conversion helpers")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/x86/include/asm/pdx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/pdx.h b/xen/arch/x86/include/asm/pdx.h
index 6be7e1185eb1..6c10234ecfa9 100644
--- a/xen/arch/x86/include/asm/pdx.h
+++ b/xen/arch/x86/include/asm/pdx.h
@@ -57,7 +57,7 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
     return offset;
 }
 
-#undef PDX_ASM_GOTO_SKIP
+#undef PDX_ASM_GOTO
 
 #endif /* X86_PDX_H */
 
-- 
2.39.5


