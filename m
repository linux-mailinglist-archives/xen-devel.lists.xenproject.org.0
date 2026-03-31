Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B6VAdYazGmePwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 21:04:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9129937058A
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 21:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269262.1558373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7eOA-0005MX-V1; Tue, 31 Mar 2026 19:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269262.1558373; Tue, 31 Mar 2026 19:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7eOA-0005Ip-R2; Tue, 31 Mar 2026 19:04:34 +0000
Received: by outflank-mailman (input) for mailman id 1269262;
 Tue, 31 Mar 2026 19:04:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7eO9-0004zj-BA
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 19:04:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7eO8-001kxS-NR
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 21:04:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cc1ac0-bab6-0a2a0a5309dd-0a2a450ba29c-0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 21:04:32 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cc1ac0-ef63-0a2a450b0019-d1558035cc59-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 21:04:32 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48540d21f7dso73088655e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 12:04:32 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a6ebsm66704905e9.6.2026.03.31.12.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 12:04:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774983872; x=1775588672; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wIJCzxQUgbccKwE9h7kA0JQ/lmT/FyjEkSXHOWHMIM=;
        b=J/q2I9aDKG3dYITZ/eEDII7l5hHiHyuGKfXVC1n6hf26W0FdJo8+4hQOkPd6954eLG
         x7vsAHhLfJVXu60HWGSZlISFwzinpwZEUqgWtA7bSpv0B/8nlcIXfTrvkUqUL3ApIUmw
         RcIGrVKIO3+tP1r3bVkulDMZ7gKkThdHgVEpYs3DSsrBz+kEl4FNXpcn8yFrCpdAdyrk
         31XTJL5LZyfAZBJEGM+idMeyfbc3ittCfuzdpigGQe8WaCR2v8RuxFuNQfomoZVBOwFj
         Mxhcp1zP+RWC6wLbcBQ5Nzv4hft4l0rCowU6eRkz637NagTpni8c9IVUa2Zr+fAXggW6
         XbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774983872; x=1775588672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5wIJCzxQUgbccKwE9h7kA0JQ/lmT/FyjEkSXHOWHMIM=;
        b=Ly2fQT9KXUzxkaeEh4jBCStGNEFdBqfboNUifc6tb/PJew99glUQdl/OSDIcscnMsd
         WqBLryxfY3Nd+a/l5oW7qWF6j1Id7GdrkdvOdcUcS/PBRnSupxrdOJGdkAtHjH3ggcUc
         yb30XpvipKuM0iPz7O7X8rBb8fzI0I8EaXrVvDYUTZcrqJNLTUudGb2NOQmhE8JeGHYj
         AhCuFQzktyARC+LyfaFDDTxSnXxpFpFR1ZfQMiqxusw/+qTt9VVpO8vV0kqXwfMA4Luv
         mliEg7PvqmNZLH2F76JhfxpYYNKhAy41/NivYnPXokcqGtcSzWHjQRocq0cmVWiPNTTS
         GBwQ==
X-Gm-Message-State: AOJu0YzFmq7bEr1TUUr45yt5jHKljqlmCneuxc+FBssPL+nSzJ176/gm
	oWsBNPN1HCBJ7Hijkr8TmuYcgFL16892EarLjq3fuO3BQ8MPfv1Lm58WJ7tKbg==
X-Gm-Gg: ATEYQzy0SckG6iGrwlzAxfvfU+tBaujQhO5L7rK6vVnnHeFgP73VldTVkMSqJIfVy5Q
	9uVZlJlCEcAJPFcXQqKaPmMnGrNjzlaCfE4mFvycrksm6HrwQBqBOY42IqW0JARR+ipdaKENP8c
	AvCksajPrbw7FjDDl7yuKhYw8uz4TRVod3PyNrCUF2EmquAi+ZUGNPnyXpRdGJIXngqr821LIsc
	zHeblJl1bZRA0fAt0YQ1ZL26yLS+xAxt9Y3EdXcHog6Cr3uIxukIvZqmF+s0ucqHLNMHmJNNDNR
	aY7gSngZTdFEeCx7l5t9nXksSjCxSvYdmtYtcef5LGPFrElJb6kA7wOk9uVHub+doXQpvb3TI/R
	CBo5cky3BU7EFtkKn9zx51Hnb36+ep5s8g4+JEyO9MOb/KAFXxYOUbQmXOsZS+aSBtdQE5/oPCl
	LBsJkq3CR+/oaw6QCcS7HaLfYGs9DkOZMCSmthDA6pGMPRJ0VEaabzWOit7HAXtJi5Jg==
X-Received: by 2002:a05:600c:821a:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-48883307a37mr12050905e9.0.1774983871796;
        Tue, 31 Mar 2026 12:04:31 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/4] xen/riscv: init_csr_masks()-related improvements
Date: Tue, 31 Mar 2026 21:04:19 +0200
Message-ID: <8eb8327bfb2f273cd0fa32ba65e84bb79e8607d4.1774863161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774863161.git.oleksii.kurochko@gmail.com>
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1774983872-BBEA2112-8AF259C0/10/73395122804
X-purgate-type: spam
X-purgate-size: 2953
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9129937058A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is no reason to use _UL() in define-s sitting in C file hence use UL
suffix instead.

Drop 3d argument of INIT_CSR_MASK() and INIT_RO_ONE_MASK() to reduce risk
of incomplete editing after copy-and-paste, or other typo-ing.

Use _VALID_ infix instead of _AVAIL_ as the mask identifies architecturally
defined bits, not bits available for software use.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/domain.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index c327f44d07ca..c77be3b827eb 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -42,10 +42,10 @@ struct csr_masks {
 
 static struct csr_masks __ro_after_init csr_masks;
 
-#define HEDELEG_AVAIL_MASK ULONG_MAX
-#define HIDELEG_AVAIL_MASK ULONG_MAX
-#define HENVCFG_AVAIL_MASK _UL(0xE0000003000000FF)
-#define HSTATEEN0_AVAIL_MASK _UL(0xDE00000000000007)
+#define HEDELEG_VALID_MASK ULONG_MAX
+#define HIDELEG_VALID_MASK ULONG_MAX
+#define HENVCFG_VALID_MASK 0xe0000003000000ffUL
+#define HSTATEEN0_VALID_MASK 0xde00000000000007UL
 
 void __init init_csr_masks(void)
 {
@@ -57,25 +57,26 @@ void __init init_csr_masks(void)
      * fields that must be preserved. Any write to the full register must
      * therefore retain the original values of those fields.
      */
-#define INIT_CSR_MASK(csr, field, mask) do { \
-        register_t old = csr_read_set(CSR_ ## csr, mask); \
+#define INIT_CSR_MASK(csr, field) do { \
+        register_t old = csr_read_set(CSR_ ## csr, csr ## _VALID_MASK); \
         csr_masks.field = csr_swap(CSR_ ## csr, old); \
     } while (0)
 
-#define INIT_RO_ONE_MASK(csr, field, mask) do { \
-        register_t old = csr_read_clear(CSR_ ## csr, mask); \
-        csr_masks.ro_one.field = csr_swap(CSR_ ## csr, old) & mask; \
+#define INIT_RO_ONE_MASK(csr, field) do { \
+        register_t old = csr_read_clear(CSR_ ## csr, csr ## _VALID_MASK); \
+        csr_masks.ro_one.field = csr_swap(CSR_ ## csr, old) & \
+                                 csr ## _VALID_MASK; \
     } while (0)
 
-    INIT_CSR_MASK(HEDELEG, hedeleg, HEDELEG_AVAIL_MASK);
-    INIT_CSR_MASK(HIDELEG, hideleg, HIDELEG_AVAIL_MASK);
+    INIT_CSR_MASK(HEDELEG, hedeleg);
+    INIT_CSR_MASK(HIDELEG, hideleg);
 
-    INIT_CSR_MASK(HENVCFG, henvcfg, HENVCFG_AVAIL_MASK);
+    INIT_CSR_MASK(HENVCFG, henvcfg);
 
     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
     {
-        INIT_CSR_MASK(HSTATEEN0, hstateen0, HSTATEEN0_AVAIL_MASK);
-        INIT_RO_ONE_MASK(HSTATEEN0, hstateen0, HSTATEEN0_AVAIL_MASK);
+        INIT_CSR_MASK(HSTATEEN0, hstateen0);
+        INIT_RO_ONE_MASK(HSTATEEN0, hstateen0);
     }
 
 #undef INIT_CSR_MASK
-- 
2.53.0


