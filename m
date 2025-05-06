Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBC0AAC718
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 15:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977321.1364351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCInF-0007UF-RH; Tue, 06 May 2025 13:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977321.1364351; Tue, 06 May 2025 13:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCInF-0007O5-NE; Tue, 06 May 2025 13:57:09 +0000
Received: by outflank-mailman (input) for mailman id 977321;
 Tue, 06 May 2025 13:57:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=15Tu=XW=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uCInE-0007Kz-9u
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 13:57:08 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffac07aa-2a81-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 15:57:08 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a07a7b517dso3697614f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 06:57:07 -0700 (PDT)
Received: from localhost.localdomain (172.74.6.51.dyn.plus.net. [51.6.74.172])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b170e7sm13503239f8f.86.2025.05.06.06.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 06:57:06 -0700 (PDT)
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
X-Inumbo-ID: ffac07aa-2a81-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746539827; x=1747144627; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWG+dt0wyO1enTyXwSRlDk2xHqo7Oq+/vleaC2X1ZwA=;
        b=R2YyHV1qURPWx5gSMgKJ3Ri0BgWEpMAS1yaZCYPI5Pgs7v1GjFENxX1aiS4KTpD6J2
         n/RYqgpzB0+SY22GAQBHTu8rcWmDEUTpPRGGvhFkkADs8V42U/R7AkF4YD1vijbwbCxE
         hQ6tQIKnWHBkq52J23hpSIry+hdWY70kakM/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746539827; x=1747144627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWG+dt0wyO1enTyXwSRlDk2xHqo7Oq+/vleaC2X1ZwA=;
        b=xGC0MNu0Ls+sziQD1IqN8e9pTGTfPG7bR43Nd8nvLth9VAEgykiXPlCcOAAMu37qAa
         MgiumZGZlnNbKjW9CeXCoB+PtSSa4+fnV0NG+wD/A8oVhFjOfsFXdsYTiMJdXGbj1jz2
         opYWR8xfQCSjtsbWttRRw61WoSI+Sq/jer3yoi5BGbuIEilNoteqDBf55612hY9SCODT
         IHNTh1YWkiF+5RLaMJc7fUYDDt3SpG5C6XnUifTbJy02eiSWylEq9HyLQEng7+r/HT8X
         vXEIjf4bw+0aQgFxsuG3kZoc+DGSMESzpLVxyAPp5BxR2qEH/MLkeYSLXbCTQZh4KWyj
         PJ1g==
X-Gm-Message-State: AOJu0Ywl1YsymUYJ0NA28ff154UlHuog3CeGU4o/JKpm5h46BcfNHF9U
	MhVksXpQVMF93rVEXUKUAuMi+vV+jhBxwEKLVwKtgQPfz4IvgBPZgdOlk+xiSGODqUbWMb3EsHJ
	/+Rk=
X-Gm-Gg: ASbGncsbwm0UnJd3Na5OrElPwoEZXR5l6eAOPRcgoohyxcB6dP/LmkG9Ner0jgxjdJm
	3VzUwlpmnGs+zbh9w5sVtrKbjshGdddTq4qYTnSXY2zwXrY2PIuIO0ByeBtazNW3No8iwjADL1h
	iN0eHxgEjfSBfwtEygA0UXWiOujZPlhRPEsGr8srYpFFkxLPsO5KnD8tmR0JoEqwJuddO0G69ra
	3VJvvjjFH6DS9Q5bvCDJQAKkPAv3VpYYps7og/CduJwOxRVfR8sJY1lOEuvRQ4f+LsyJq1nMTAT
	PLR6vmnB13TaFIv6jqkK6pu1Pv4VGNsYgMca4blulGqfCETSPFvEpzHYdb+2c3p7WWQZw+BOcb5
	3Xzmx5Q==
X-Google-Smtp-Source: AGHT+IHL81vJGNVKRVxyHaIk0RB+9S39F7pqwL25wYoQY3mFV86ajXU0B5bpXDTrHMxFnSIwtM+oxw==
X-Received: by 2002:a05:6000:4282:b0:39d:724f:a8ec with SMTP id ffacd0b85a97d-3a0ac1ff687mr2972154f8f.44.1746539826664;
        Tue, 06 May 2025 06:57:06 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/4] xen/lib: Export additional sha256 functions
Date: Tue,  6 May 2025 14:56:50 +0100
Message-ID: <20250506135655.187014-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506135655.187014-1-frediano.ziglio@cloud.com>
References: <20250506135655.187014-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Lagerwall <ross.lagerwall@citrix.com>

In future, some code needs to generate a digest over several separate buffers
so export the necessary functions to do so.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/include/xen/sha2.h | 10 ++++++++++
 xen/lib/sha2-256.c     | 14 ++++----------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/xen/include/xen/sha2.h b/xen/include/xen/sha2.h
index 47d97fbf01..ea8bad67e4 100644
--- a/xen/include/xen/sha2.h
+++ b/xen/include/xen/sha2.h
@@ -9,6 +9,16 @@
 
 #define SHA2_256_DIGEST_SIZE 32
 
+struct sha2_256_state {
+    uint32_t state[SHA2_256_DIGEST_SIZE / sizeof(uint32_t)];
+    uint8_t buf[64];
+    size_t count; /* Byte count. */
+};
+
+void sha2_256_init(struct sha2_256_state *s);
+void sha2_256_update(struct sha2_256_state *s, const void *msg,
+                     size_t len);
+void sha2_256_final(struct sha2_256_state *s, void *_dst);
 void sha2_256_digest(uint8_t digest[SHA2_256_DIGEST_SIZE],
                      const void *msg, size_t len);
 
diff --git a/xen/lib/sha2-256.c b/xen/lib/sha2-256.c
index 19e8252188..896a257ed9 100644
--- a/xen/lib/sha2-256.c
+++ b/xen/lib/sha2-256.c
@@ -10,12 +10,6 @@
 #include <xen/string.h>
 #include <xen/unaligned.h>
 
-struct sha2_256_state {
-    uint32_t state[SHA2_256_DIGEST_SIZE / sizeof(uint32_t)];
-    uint8_t buf[64];
-    size_t count; /* Byte count. */
-};
-
 static uint32_t choose(uint32_t x, uint32_t y, uint32_t z)
 {
     return z ^ (x & (y ^ z));
@@ -131,7 +125,7 @@ static void sha2_256_transform(uint32_t *state, const void *_input)
     state[4] += e; state[5] += f; state[6] += g; state[7] += h;
 }
 
-static void sha2_256_init(struct sha2_256_state *s)
+void sha2_256_init(struct sha2_256_state *s)
 {
     *s = (struct sha2_256_state){
         .state = {
@@ -147,8 +141,8 @@ static void sha2_256_init(struct sha2_256_state *s)
     };
 }
 
-static void sha2_256_update(struct sha2_256_state *s, const void *msg,
-                            size_t len)
+void sha2_256_update(struct sha2_256_state *s, const void *msg,
+                     size_t len)
 {
     unsigned int partial = s->count & 63;
 
@@ -177,7 +171,7 @@ static void sha2_256_update(struct sha2_256_state *s, const void *msg,
     memcpy(s->buf + partial, msg, len);
 }
 
-static void sha2_256_final(struct sha2_256_state *s, void *_dst)
+void sha2_256_final(struct sha2_256_state *s, void *_dst)
 {
     uint32_t *dst = _dst;
     unsigned int i, partial = s->count & 63;
-- 
2.43.0


