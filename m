Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFWhCQ7+jWm0+AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A8512F50F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229479.1535485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRW-0007ji-5t; Thu, 12 Feb 2026 16:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229479.1535485; Thu, 12 Feb 2026 16:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRW-0007ce-0x; Thu, 12 Feb 2026 16:21:26 +0000
Received: by outflank-mailman (input) for mailman id 1229479;
 Thu, 12 Feb 2026 16:21:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqZRU-0005jV-1g
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:21:24 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df39c846-082e-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 17:21:23 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so40458f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 08:21:23 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e5c635sm13938426f8f.37.2026.02.12.08.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 08:21:22 -0800 (PST)
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
X-Inumbo-ID: df39c846-082e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770913282; x=1771518082; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boVLzqeW8TB014ODFlHRq6lW2fSrAobM0ZB96ecUZjQ=;
        b=YhKYtxRHG6R5fVNwC1+ZSp1sWgFvijRu81Nvhx3JxTN6mC3olsA4TK2uwBJC3btsOp
         vSqTySyl9A9cajYipCRYQS+FlBPkYQdvI8KaNXtAcd/+5xxs0uAx6nTc19i/Z1Sd5dLB
         xzwnLBhFqdLgKuH48oLHxJzRSWnWWn7WZRL1Z2h6rdPF/ZD863dyqTVCCku6vaMVE/Ad
         BD4Oa09xgmoE/Or8TYiwrE0YEy+MggzXdi8cPl39I5+bEk1FORw3pndAdqLZ/Yukons7
         CggRiFEdCVqpF1KxrQsINUBlmQyqIURpZxHjhPXDArZpOHWQJn6O4F9pwdotjtUgEAkR
         kzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770913282; x=1771518082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=boVLzqeW8TB014ODFlHRq6lW2fSrAobM0ZB96ecUZjQ=;
        b=gxPlZBDVsvL67LBff53g9AvO1Qzxhi2RnbUubvqKqGCgL16b1DAxXeNfYqUYkx4/zf
         w8PtRF5FsRUkPiw7XB6/9OxrgbDSkx1VvRKyFyxnr+lGlTuLuxhMEjvycZzA983dh6q6
         kOnwW022brsAvQaOtxriIOBPgLd1KGfj5Se3Jw+kmMGHeVI2F3UG29TmxImZAJ1dbYoP
         lfDrT2TG8L+M/UU1oVchhBTQINAWQO3kclHfknz7HW9pLk4neAUWEjEyBRWpSO1Q+Qvt
         7UAc+YH8mqm5f93UASFSBXFxKzLZwdY4agSmbEQ1fTq+TqoEAVTWLkzGnmXeVU/tbHjx
         Z9bw==
X-Gm-Message-State: AOJu0YxHaF3TYkuO6smXdj6DoQtzrvjbU+IyRa26auFfXoUcCi1hJTHU
	K+qtL+chfSId9G4QQcMcMHm5f/snslOBOC73hOFStSYwGZxC97Dyqt7XmZEGzklR
X-Gm-Gg: AZuq6aKMjh8m0hcXrpX0i5UL/fFjlykWpPX2wIYVfd8DTryMejky9g+OF2klZrXgs0S
	q7bPcS9ztiILJvOKueMhc/4QhrUDJuwmtc6Lhn6KfyATyoRjAtcJktb48ZYEsGxpQQTkbIjcu8T
	SdVSHs6cPb2nLIHEpi1oF2ctSZD1lRF2P3msx8RX8PuagZbgU9cWff0q6UTGuM0yKTkIZhENKCD
	vJw/xlJAzhu9ZbpXWV3FHmidqR8nZIyeumAS26/SfyQU4LKz6WmdYRF91shVabha/z4tiSqGGiB
	DaA18GDYIx/Tu8YpqqW5C/xd36ix63okGIUvJNZxPG63PPBK5c1sgW4+BtAEgm2p85je3wVoqKg
	nWQrQWQtcU7oMWZ5ilW/vJUxVYR9CXpphggzvqPHtfP5Xy3wmLigZ/teGCfxZK/gHU4odSsBOfw
	f0mECVVi7cv2ZfJ3B5+XljxlVQJxw1OJ2FmJXEHApulefolKeFiPsUygOtzgsjze95j3Mx3mIeo
	e8I
X-Received: by 2002:a5d:5d8a:0:b0:436:3732:cfa6 with SMTP id ffacd0b85a97d-4378f16d7ffmr5166470f8f.53.1770913282360;
        Thu, 12 Feb 2026 08:21:22 -0800 (PST)
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
Subject: [PATCH v1 6/6] xen/riscv: enable DOMAIN_BUILD_HELPERS
Date: Thu, 12 Feb 2026 17:21:07 +0100
Message-ID: <6ab04f3584e45795dc82c25f62a6c950913f5c7d.1770821989.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770821989.git.oleksii.kurochko@gmail.com>
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C4A8512F50F
X-Rspamd-Action: no action

To enable DOMAIN_BUILD_HELPERS for RISC-V the following is introduced:
- Add a global p2m_ipa_bits variable, initialized to PADDR_BITS, to
  represent the maximum supported IPA size as find_unallocated_memory()
  requires it.
- Define default guest RAM layout parameters in the public RISC-V
  header as it is required by allocate_memory().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Kconfig           | 1 +
 xen/arch/riscv/include/asm/p2m.h | 3 +++
 xen/arch/riscv/p2m.c             | 6 ++++++
 xen/include/public/arch-riscv.h  | 8 ++++++++
 4 files changed, 18 insertions(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 89876b32175d..12b337365f1f 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -1,5 +1,6 @@
 config RISCV
 	def_bool y
+	select DOMAIN_BUILD_HELPERS
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select GENERIC_UART_INIT
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index c68494593fd9..083549ef9640 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -44,6 +44,9 @@
 #define P2M_LEVEL_MASK(p2m, lvl) \
     (P2M_TABLE_OFFSET(p2m, lvl) << P2M_GFN_LEVEL_SHIFT(lvl))
 
+/* Holds the bit size of IPAs in p2m tables */
+extern unsigned int p2m_ipa_bits;
+
 #define paddr_bits PADDR_BITS
 
 /* Get host p2m table */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index f5b03e1e3264..62bd8a2f602f 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -51,6 +51,12 @@ static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
     .name = "Bare",
 };
 
+/*
+ * Set to the maximum configured support for IPA bits, so the number of IPA bits can be
+ * restricted by external entity (e.g. IOMMU).
+ */
+unsigned int __read_mostly p2m_ipa_bits = PADDR_BITS;
+
 static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
 
 static inline void p2m_free_metadata_page(struct p2m_domain *p2m,
diff --git a/xen/include/public/arch-riscv.h b/xen/include/public/arch-riscv.h
index 360d8e6871ba..91cee3096041 100644
--- a/xen/include/public/arch-riscv.h
+++ b/xen/include/public/arch-riscv.h
@@ -50,6 +50,14 @@ typedef uint64_t xen_ulong_t;
 
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
 
+#define GUEST_RAM_BANKS   1
+
+#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
+#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
+
+#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
+#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
+
 struct vcpu_guest_context {
 };
 typedef struct vcpu_guest_context vcpu_guest_context_t;
-- 
2.52.0


