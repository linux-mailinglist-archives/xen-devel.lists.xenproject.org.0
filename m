Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN9uMhE/tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:45:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6684128755A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254120.1550129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15dC-0005AZ-FZ; Fri, 13 Mar 2026 16:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254120.1550129; Fri, 13 Mar 2026 16:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15dC-000570-Aj; Fri, 13 Mar 2026 16:44:58 +0000
Received: by outflank-mailman (input) for mailman id 1254120;
 Fri, 13 Mar 2026 16:44:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p3qR=BN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w15dB-0004GG-4W
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:44:57 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5170cf2-1efb-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:44:52 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-66391baf250so2038238a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 09:44:52 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66350b86008sm1394733a12.28.2026.03.13.09.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 09:44:50 -0700 (PDT)
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
X-Inumbo-ID: f5170cf2-1efb-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420292; x=1774025092; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WC9Q7UDifDEqfqwQFhunvL4KaBDnJAUUS0hjUL4t6mI=;
        b=ZP0kBdpNmwu+l6bfZZVSXm8+/xwfs5sdGlQZuz7GNKQGcT1FGN98IVpCFDn4h6IXLe
         NL2tcUsknjW8bv32fm/RvWD1N0ZEVFaTmcz+a4Wca/xHFVeAZpNldW/VNoQsVdLAahYH
         YIHWNuA3ddBNb04Jmn/IpeIjDp0TIYVZD3HP69ZypXotLmOtIyCUAhyauLVJIbTGtats
         S/NqkyhW/bijXWpCOiUzJpCUNPR8OMngEj2fasTCzAL5VGrecMhzn9SwBhgJfrTocIFZ
         3EB0XWyR33QgLPuldGIb2gEsgLRQ+ZLwYsIHal1hYBGytv5gfTNXD1AO/l+Jc8OrMXyG
         h3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420292; x=1774025092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WC9Q7UDifDEqfqwQFhunvL4KaBDnJAUUS0hjUL4t6mI=;
        b=iYYO95Imr3qq6V+Wp4AKKYUhYQ/Am/JPH6FoQ9Ig8CkjIM89Zc9t9PgwXaQf48BEUW
         2O8V9s6LFpG1+d5i7D9KPOi9jfS5KD1g74JUbcWP7l1heoRg/6OGVDl+buTtsiyPcuaq
         ev8QI8QNE2H1YCd5Kpz4wbxwAYW5AxBf40uS9jjPk23GBo7X+Bp3OXaVY15ZDV66muim
         UD+QYaa28sadRl7iUpj4xNBl4efVAcSs35Elhgpl666Qku+htwLKczqV/2Dbb7PS1az6
         Bj8InvYumc0kqneNzR6IjQYjejkMOa0Ejw/AoEisRq/6VtVcKKFx3KfgZMPz6IdIKFhJ
         zKMg==
X-Gm-Message-State: AOJu0Yw1XS7ovVLrROzkamAH/WwtbHW4XZUDBudLXdoJ2vZ4/zUt2CDs
	gQ7VCACm/75tuq5x1fXg2HppIpCmkYoTGk+VPg5PdbVV/9eF74SNHNXbBYQEeg==
X-Gm-Gg: ATEYQzzTtXyXTWq/x7BS497pHq/j/oUxx8BPE75RstKFy+Qc5HV/Y8tSh4ILFOmd/9V
	Q157VX7q/Wn35CpD+Pub0g78vBIhVvAcfIWx/7A62mF8z2fuODA/5bTywPtOl+OfbMps7yH+mEX
	5fKkuzJJg9Qty881my4fZ86cZkPuvsi43VE0bpg/mGCc7ecPwTF2cyYQABBn9YfAVFupn21FT36
	s/JCgAkyO1aEwvOuPzeW7vP989W8HhqCa2cIKcid0dU+72YVieqWOjPoaIE2Wv7PTxYXS2GHyzB
	LOUX9wW1O/1YsJhW93H5HHDYa7L+0Bdt+t4j9DYIhaNpwA27ms+NYUVv91ArlZ0dVNLC5qBvsOL
	TchZ+4KNsrYapoVmAzRbdTwHL87H9JgexGx89voGpdc2WjwS4/RQJwlIW9W3r4yk7hbtRR4z0Fo
	GnQlixKqAJbQDkF6WNwwHDrdoBvepAfkwEM6QxVvvmFtkYJPYn00tAzhJ+729pMAL5jg==
X-Received: by 2002:a05:6402:254f:b0:661:d0a4:ad45 with SMTP id 4fb4d7f45d1cf-663babb8965mr2319469a12.10.1773420291271;
        Fri, 13 Mar 2026 09:44:51 -0700 (PDT)
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
Subject: [PATCH v1 4/4] xen/riscv: init_csr_masks()-related improvements
Date: Fri, 13 Mar 2026 17:44:38 +0100
Message-ID: <b283d6a8d59d66010f6249161245e4a7f4219589.1773419622.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773419622.git.oleksii.kurochko@gmail.com>
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6684128755A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is no reason to use _UL() in define-s sitting in C file hence use UL
prefix instead.

Drop 3d argument of INIT_CSR_MASK() and INIT_RO_ONE_MASK() to reduce risk
of incomplete editing after copy-and-paste, or other typo-ing.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/domain.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 5f15dda88c8e..70d0e55ed1bc 100644
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
+#define HENVCFG_VALID_MASK (0xE0000003000000FFUL)
+#define HSTATEEN0_VALID_MASK (0xDE00000000000007UL)
 
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


