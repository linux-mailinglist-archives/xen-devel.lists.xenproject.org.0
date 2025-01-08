Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BC3A05EA6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:30:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867330.1278889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4w-00005p-71; Wed, 08 Jan 2025 14:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867330.1278889; Wed, 08 Jan 2025 14:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4v-0008Px-P6; Wed, 08 Jan 2025 14:30:37 +0000
Received: by outflank-mailman (input) for mailman id 867330;
 Wed, 08 Jan 2025 14:30:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4t-0006o2-VF
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:35 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f8f7ced-cdcd-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 15:30:35 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d3cf094768so5012916a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:35 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80676f9acsm25274285a12.31.2025.01.08.06.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:34 -0800 (PST)
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
X-Inumbo-ID: 1f8f7ced-cdcd-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346635; x=1736951435; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUfOuSNmcurg2d9XIPxdnWgBS7aMlQNtn0OCR0xuots=;
        b=KAp/Wh8fFn7W/oBMia3fYMEt6rAOJJslo1nF/01QBdi6xL/iAR1Oe0AqHgB7+oO9wM
         V1rizFUeQzCdiw/1JG/1pzbwI9EHhXf30zV9DjKVXC36lggPEB2L9yeI3Tv9u+U65x54
         9mw6gXb1mLLWGcIYWuTdIlhFSEGNBY9ppyvcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346635; x=1736951435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUfOuSNmcurg2d9XIPxdnWgBS7aMlQNtn0OCR0xuots=;
        b=rM/CAui3HkSyOVs6NtGVhVTsnhf+PzebqbLHYepOTVtVsknNvZKMyLGOXL/VypR/Lc
         w2Q1lFFxfDX9fmkrrciWNTfhn0NRX+TkdY0LvT06YuwCJvCyjy4C9KCcHEHhvSabck51
         Y1FM83TwAuxBQxJrkJsytj7Zc8zDMLpki2S0x4k3zuV4ewrtZzkoJ5YXBYDodBA7f0kf
         qW7aA1SXD8AoSdbljHbuDgxibn5zfOEYt+NFQvGLTA4GZo3sxEkFRJ5cD6ar7HroS2EB
         2ya8rsTqNgkP5Y7Wa0zgnb8AdN5BTNBt55dE77GK1bJjF3w97QfjDuGP2zLGrIPIB90D
         DCuw==
X-Gm-Message-State: AOJu0YyMr0TPx23unGPg3eZrJBIWCJJ1Zt0tUe2WyyjSoN3CYbvNNth5
	Ldh6ZiCpfOS0oZycmX75gCHVAnVizNBVxXd2+J+zDDpPmLdlwEE5tHNESm0LJSsblkEcC05ntbC
	+
X-Gm-Gg: ASbGncsrxL5lNYw0oYa+/vFzD24c+1ghLB2FeHjCmiCNKlbQAJrMrkAp+OCITATySwC
	GPFfC8o8lWEwNCi87QCcIspR2f/XplJr1n48tJFLMAt6V1QRf+MEMErOnQ+dQiD3nAMKcLlqYs2
	WfgKsfcllliBY3naO29dBCdbbc8pYtysbdB83tpx135gi4DpPl4l/KzflJVtahooerXWAvkT1nv
	Oq3OWg1hjZ/Ciw6gC/ak1IlEnxdxqb3hoIb7m8hcpocyKwumoj1J8xiHv03Q03ZDHI=
X-Google-Smtp-Source: AGHT+IF2DvwpaRgZK7HzfqN6mxE1GSwGuQVr3ugA4OWrViS+868nKyrdujXICXFEMX53cvhmiF1lZA==
X-Received: by 2002:a05:6402:13c1:b0:5d0:ea2a:726c with SMTP id 4fb4d7f45d1cf-5d972e069b5mr2756697a12.8.1736346634609;
        Wed, 08 Jan 2025 06:30:34 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 11/18] x86/pv: untie issuing FLUSH_ROOT_PGTBL from XPTI
Date: Wed,  8 Jan 2025 15:26:51 +0100
Message-ID: <20250108142659.99490-12-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic gates issuing flush TLB requests with the FLUSH_ROOT_PGTBL
flag to XPTI being enabled.

In preparation for FLUSH_ROOT_PGTBL also being needed when not using XPTI,
untie it from the xpti domain boolean and instead introduce a new flush_root_pt
field.

No functional change intended, as flush_root_pt == xpti.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/domain.h   | 2 ++
 xen/arch/x86/include/asm/flushtlb.h | 2 +-
 xen/arch/x86/mm.c                   | 2 +-
 xen/arch/x86/pv/domain.c            | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 7c143d2a6c46..5af414fa64ac 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -281,6 +281,8 @@ struct pv_domain
     bool pcid;
     /* Mitigate L1TF with shadow/crashing? */
     bool check_l1tf;
+    /* Issue FLUSH_ROOT_PGTBL for root page-table changes. */
+    bool flush_root_pt;
 
     /* map_domain_page() mapping cache. */
     struct mapcache_domain mapcache;
diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index bb0ad58db49b..1b98d03decdc 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -177,7 +177,7 @@ void flush_area_mask(const cpumask_t *mask, const void *va,
 
 #define flush_root_pgtbl_domain(d)                                       \
 {                                                                        \
-    if ( is_pv_domain(d) && (d)->arch.pv.xpti )                          \
+    if ( is_pv_domain(d) && (d)->arch.pv.flush_root_pt )                 \
         flush_mask((d)->dirty_cpumask, FLUSH_ROOT_PGTBL);                \
 }
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index c321f5723b04..49403196d56e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4178,7 +4178,7 @@ long do_mmu_update(
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
                     if ( !rc )
                         flush_linear_pt = true;
-                    if ( !rc && pt_owner->arch.pv.xpti )
+                    if ( !rc && pt_owner->arch.pv.flush_root_pt )
                     {
                         bool local_in_use = false;
 
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 534d2899100f..5bda168eadff 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -368,6 +368,8 @@ int pv_domain_initialise(struct domain *d)
 
     d->arch.ctxt_switch = &pv_csw;
 
+    d->arch.pv.flush_root_pt = d->arch.pv.xpti;
+
     if ( !is_pv_32bit_domain(d) && use_invpcid && cpu_has_pcid )
         switch ( ACCESS_ONCE(opt_pcid) )
         {
-- 
2.46.0


