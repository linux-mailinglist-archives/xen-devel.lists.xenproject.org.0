Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD908CB3C29
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 19:30:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183166.1505951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOxH-00053D-G5; Wed, 10 Dec 2025 18:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183166.1505951; Wed, 10 Dec 2025 18:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOxH-00051E-C7; Wed, 10 Dec 2025 18:30:27 +0000
Received: by outflank-mailman (input) for mailman id 1183166;
 Wed, 10 Dec 2025 18:30:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=unxu=6Q=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vTOxF-0004ng-Q1
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 18:30:25 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b5a0a7b-d5f6-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 19:30:25 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso7699205e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 10:30:25 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a886affb4sm1696105e9.3.2025.12.10.10.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 10:30:23 -0800 (PST)
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
X-Inumbo-ID: 4b5a0a7b-d5f6-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765391424; x=1765996224; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXlGQkwfcCxQQOprXhg3Avtbe6KMUEWZIGR1FuxDrBM=;
        b=jWpgI23WpVKistLs/0n37uNhuTJiWeNj8nnqBp7TZwKd4cb14P4cCACxhfiSV5yd/Q
         vU/4cXe76vAPJlax9L6rfE14OoQFzs7dgmKQ3TFezmOeW3BNkmUVupCg/KXalRCROHTb
         d8MuBZPSOqAUx0150oTjabgptaTKq/PB1KG98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765391424; x=1765996224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gXlGQkwfcCxQQOprXhg3Avtbe6KMUEWZIGR1FuxDrBM=;
        b=XRHubag904gUhkDTtPIA8mlcFPJ5rqLhIftr6i0OGAyVUW5YJPxke7K3qfIlgOCCfD
         nO30FugR3juQseFERNmd6itYrusiX2WZoFRfY5Ndo6MWIVwwhQIpPvi14m9wb3/KVfeh
         OzsFgVI4BBgNWDjX2MZrIX7q1SadYr3WJRN5MQbOMclSoXCghYXHfQ4N7z9z+sKyXat4
         3tRixgJTkmC/gPUfSppIKo30x2b4qvEqYAD+/p61jHtDKgQdkM8WmCa+3tB7RpeMRMWY
         VhVSQv9LifoHMnj+TAXFv5k0qElf98Lcczzk2BJNyIGamiOS5Q8NwG6Bd4poUnaPTGLp
         2NCg==
X-Gm-Message-State: AOJu0YzVR3Yyrerg1cJrteYYned5eCPUfbGE2SP6q3wrs7Az080YpIl0
	PeuISky1J6G6ItaE3w//fBu4h8pOwLYQMC6iAzFdta9fHhskFIurDIjt4ulqry5+ODJmqM/05qG
	uwdKx
X-Gm-Gg: ASbGncu/dFDUkjsR4OuQifAFS98L+U0FW8B4swVzIMFDf3cHMGI000E6mXwvk9w8HW+
	bRDgS2lQrhjs/6Z6nexkRoU49ZCc8/4WWLPFJXMMG18nHJ/Lh+2X2qXJn509l149ISELL2TOTRH
	MtuMRVGTwVeXWoOh6jJPRl+ZJnTP00+EqSjR7CqQd96/KjA3gB/7grAuP/DPiZXekHx4GjxNSLg
	rwlxFVrrZTmM/AMU85C9jxOTlxKFCxPB9UZpH3OPBcmTaaQojjmbJk+awsE6m+o6Hr+SuVzl5VK
	SeU6WRsPZnx0TqbRmdu42dRPRGadFk1/9fZ6AEVlwQ7fAE/fyC2VY/V1EOtWW7+HWP0Gza7CdYH
	yteg/QNx2gF0EEFRBdUmOt6Gf/v9Jwp6ovmmGn10l2wCTh9Jk/NdG1qtdJ3MXg1QOCeSHZpItgo
	uxWucsvFlgYCgSxPHulP11vVOhHr7kL6Mdvq3aIOGjlCt7XxAQWhZ+dD0uWIfc2M087D/PdrWL
X-Google-Smtp-Source: AGHT+IG6IxhUYRlqB9519aXljEJ/a6K9eF2sKqb96XyJ+RfzgRL02xBb1EsXo11siJK5f5VrHBFIFw==
X-Received: by 2002:a05:600c:540f:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-47a888cd013mr4093975e9.15.1765391424407;
        Wed, 10 Dec 2025 10:30:24 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 2/5] x86: Name parameters in function declarations
Date: Wed, 10 Dec 2025 18:30:16 +0000
Message-Id: <20251210183019.2241560-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the wider testing, some more violations have been spotted.  This
addresses violations of Rule 8.2 (parameters must be named).

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/mm/shadow/common.c | 8 ++++----
 xen/arch/x86/pv/emul-priv-op.c  | 2 +-
 xen/include/xen/livepatch.h     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 423764a32653..f2aee5be46a7 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -69,11 +69,11 @@ const uint8_t sh_type_to_size[] = {
 
 DEFINE_PER_CPU(uint32_t,trace_shadow_path_flags);
 
-static int cf_check sh_enable_log_dirty(struct domain *);
-static int cf_check sh_disable_log_dirty(struct domain *);
-static void cf_check sh_clean_dirty_bitmap(struct domain *);
+static int cf_check sh_enable_log_dirty(struct domain *d);
+static int cf_check sh_disable_log_dirty(struct domain *d);
+static void cf_check sh_clean_dirty_bitmap(struct domain *d);
 
-static void cf_check shadow_update_paging_modes(struct vcpu *);
+static void cf_check shadow_update_paging_modes(struct vcpu *v);
 
 /* Set up the shadow-specific parts of a domain struct at start of day.
  * Called for every domain from arch_domain_create() */
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 225d4cff03c1..08dec9990e39 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -40,7 +40,7 @@ struct priv_op_ctxt {
 };
 
 /* I/O emulation helpers.  Use non-standard calling conventions. */
-void nocall load_guest_gprs(struct cpu_user_regs *);
+void nocall load_guest_gprs(struct cpu_user_regs *regs);
 void nocall save_guest_gprs(void);
 
 typedef void io_emul_stub_t(struct cpu_user_regs *);
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index d074a5bebecc..3f5ad01f1bdd 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -62,7 +62,7 @@ struct livepatch_fstate {
     uint8_t insn_buffer[LIVEPATCH_OPAQUE_SIZE];
 };
 
-int livepatch_op(struct xen_sysctl_livepatch_op *);
+int livepatch_op(struct xen_sysctl_livepatch_op *op);
 void check_for_livepatch_work(void);
 unsigned long livepatch_symbols_lookup_by_name(const char *symname);
 bool is_patch(const void *addr);
-- 
2.39.5


