Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJi9A2/WmGl+NQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B544616B0B6
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237617.1539922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYLC-0001fB-5w; Fri, 20 Feb 2026 21:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237617.1539922; Fri, 20 Feb 2026 21:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYLB-0001W8-S5; Fri, 20 Feb 2026 21:47:13 +0000
Received: by outflank-mailman (input) for mailman id 1237617;
 Fri, 20 Feb 2026 21:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtYL9-0008IG-15
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:47:11 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4f27749-0ea5-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 22:47:09 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso18920445e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 13:47:09 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm28940205e9.13.2026.02.20.13.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 13:47:07 -0800 (PST)
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
X-Inumbo-ID: b4f27749-0ea5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771624029; x=1772228829; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZOtH6QKJjtO5cu9aMfNJQCmxs/qiZNDuJ7ZYGgpThE=;
        b=FFmhL3IY2RNqLuaArvzpOVYyM94aSfmt7tTF+3HtrUkfRX8TxaBD0Q4NYkqgLfIUGb
         A2ujHHiktbOiffpXlqMmbUS9ZeOfWN8qdhUVucpZaHo1p/JJQOPbRv/nLCqfKV0XWGbr
         jLAtpjJBTk8fZIvdIhsBBlBOOkl3Ww8uGDMYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624029; x=1772228829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XZOtH6QKJjtO5cu9aMfNJQCmxs/qiZNDuJ7ZYGgpThE=;
        b=gbBUN78nq3rxf8SzyMjhqa2nHwfhqwyW7Fj2w+aOw/Vm82WSsOSUy+6VP/1LFYQoVT
         U5EPjsqMSIICdn/QJET5XS+m9h9A89YtT9MQREWGSZSGLnPOV3Fq6KxQSe0e0hyDwkWu
         6jBHz4u722NQ2TZ/Z6omEHJoUUaNgFJbG3gn+MS9rCsTx6/XCLtbE1fTNoBB3v42SM1u
         Kwgs71XM+F6qJjQlcYABUNxSogMc605J+YonrDOZmJvGVBMT88f5APCQEZ7epcQWTAtO
         6OSZ8oNT6nsR9k8+aU5ECYEdIYt1cI8s8HvxjsTawRkjdpuC8nQtAu4kBS+UMEz69a16
         w5wQ==
X-Gm-Message-State: AOJu0YzRINYD++V159sEYQMRwiSCfoXnmOTx3QOL1D/hViG1uEyzYI7y
	Dupd0gT9ADkwomDac/dV6sRX2TZzfLSl6KSYioXSYS3bGIWXovDy0vhFYOMMHmpE5f7nGSzFbPV
	I3siI
X-Gm-Gg: AZuq6aJOVCtaXM3gEEH2TZ35noajENnfyLW7ddKnByOy6L0jKIDvWD6/vDQMy787zJ8
	JI6hXGn9cEtlwpdOLklDNKCFqYLZg1lNV/1j3DM5pd2Q/aLb9Ycwl1eQ9Is0WtH1AUpu9tQpjoU
	c586RZUwaQPc1YR4IhzB3yVwfPV18E9UywzImHeF7rENlc7YceFUuauiw86684eVXn41azMK0TM
	dlY6TOWIXbiKC8ZrTAcrBodnAI5ph8QoKB2izMjc/x5p+f5OgfdJ/eYbM/Ea2uDEm1sYpPhng8z
	kq7POWK3gZJZHkiapAPT35V6JVkehdRgSaNWMD3RCq5aW7dq4Ijc7mgT3DEbfXdHCMovTSUp9Re
	Su5cBo8pJCneL7ckui2KBtryDv92C/t2Fmp64Bg7d1P1q+H3q4+CYVt+WwXrWllyhw8Ax5TroOF
	THY8jllhXVBRK//gzZO7ByZOQnyv3IqCJXUaUZubkII6WfqSTFLflUxqlSRKzXweG1qalldIo=
X-Received: by 2002:a05:600c:8b71:b0:483:7980:4687 with SMTP id 5b1f17b1804b1-483a95dd932mr16357815e9.17.1771624027841;
        Fri, 20 Feb 2026 13:47:07 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 07/12] xen/vmac: Const the key parameter of vmac_set_key()
Date: Fri, 20 Feb 2026 21:46:48 +0000
Message-Id: <20260220214653.3497384-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B544616B0B6
X-Rspamd-Action: no action

Eclair complains that tboot_gen_domain_integrity() is casting away
constness (Rule 11.8 violation).

vmac_set_key() doesn't modify the user_key parameter, so it can become const,
removing the need to cast.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/tboot.c      | 6 +++---
 xen/crypto/vmac.c         | 2 +-
 xen/include/crypto/vmac.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index 0b3d596690cc..5ae27f481f94 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -202,7 +202,7 @@ static void tboot_gen_domain_integrity(const uint8_t key[TB_KEY_SIZE],
     uint8_t nonce[16] = {};
     vmac_ctx_t ctx;
 
-    vmac_set_key((uint8_t *)key, &ctx);
+    vmac_set_key(key, &ctx);
     for_each_domain( d )
     {
         if ( !(d->options & XEN_DOMCTL_CDF_s3_integrity) )
@@ -241,7 +241,7 @@ static void tboot_gen_xenheap_integrity(const uint8_t key[TB_KEY_SIZE],
     uint8_t nonce[16] = {};
     vmac_ctx_t ctx;
 
-    vmac_set_key((uint8_t *)key, &ctx);
+    vmac_set_key(key, &ctx);
     for ( mfn = 0; mfn < max_page; mfn++ )
     {
         struct page_info *page = mfn_to_page(_mfn(mfn));
@@ -272,7 +272,7 @@ static void tboot_gen_frametable_integrity(const uint8_t key[TB_KEY_SIZE],
     uint8_t nonce[16] = {};
     vmac_ctx_t ctx;
 
-    vmac_set_key((uint8_t *)key, &ctx);
+    vmac_set_key(key, &ctx);
     for ( sidx = 0; ; sidx = nidx )
     {
         eidx = find_next_zero_bit(pdx_group_valid, max_idx, sidx);
diff --git a/xen/crypto/vmac.c b/xen/crypto/vmac.c
index f1f6d75f8eeb..c9914d2c7c1d 100644
--- a/xen/crypto/vmac.c
+++ b/xen/crypto/vmac.c
@@ -924,7 +924,7 @@ uint64_t vmac(unsigned char m[],
 
 /* ----------------------------------------------------------------------- */
 
-void vmac_set_key(unsigned char user_key[], vmac_ctx_t *ctx)
+void vmac_set_key(const unsigned char user_key[], vmac_ctx_t *ctx)
 {
     uint64_t in[2] = {0}, out[2];
     unsigned i;
diff --git a/xen/include/crypto/vmac.h b/xen/include/crypto/vmac.h
index 457f3f5dd6da..7574c4a3f328 100644
--- a/xen/include/crypto/vmac.h
+++ b/xen/include/crypto/vmac.h
@@ -161,7 +161,7 @@ uint64_t vhash(unsigned char m[],
  * When passed a VMAC_KEY_LEN bit user_key, this function initialazies ctx.
  * ----------------------------------------------------------------------- */
 
-void vmac_set_key(unsigned char user_key[], vmac_ctx_t *ctx);
+void vmac_set_key(const unsigned char user_key[], vmac_ctx_t *ctx);
 
 /* --------------------------------------------------------------------- */
 
-- 
2.39.5


