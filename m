Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC289B45E2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 10:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827167.1241692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ike-0005Bb-E9; Tue, 29 Oct 2024 09:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827167.1241692; Tue, 29 Oct 2024 09:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ike-00059N-B3; Tue, 29 Oct 2024 09:43:00 +0000
Received: by outflank-mailman (input) for mailman id 827167;
 Tue, 29 Oct 2024 09:42:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNzX=RZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t5ikc-00058l-Q5
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 09:42:58 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dc917b1-95da-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 10:42:57 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5cb6704ff6bso6850564a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 02:42:57 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f029511sm459385966b.62.2024.10.29.02.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 02:42:56 -0700 (PDT)
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
X-Inumbo-ID: 2dc917b1-95da-11ef-a0c3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730194977; x=1730799777; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xL/UlbFPjBRTTlLpTkNVMDwoMWbBYpkFEHzclxK8YBo=;
        b=N1i5qdcYa8cQIiA2kbq6PS7JbFiGyXvk9Ro6KLA+LIMNFzNHLuloOHBkdhYs3//sxu
         EsF+SruVmiSl/+C29LSjctyXvs+P+0nbB+KIjS8PGdVXwjDiQ1Trlt/twBKLiM+i+kDo
         gD1bN84mHC1OcdHUGM4O8yN/pZm2X9H8Rhous=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730194977; x=1730799777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xL/UlbFPjBRTTlLpTkNVMDwoMWbBYpkFEHzclxK8YBo=;
        b=t2Dl7wqn//4D7kYsPCcWdt1tu2iPC/02Jlyc9ivFasFzyfqXOrXfrcHj3RvZlU/N8l
         ttlg6lpQ6iBwP/4zUkuyf/UZowrOBVX5K4yqctG2Rz0XTCo2fnHc3p9jel2ZdN74xcoM
         1KeEkL45kPB5yOxxR7VBlKH0aS7QmwSBWO87fobZZ7U8T4S0u0VCQSDXtVzcn5nBkkps
         lrs1b4Wsh6UyGeI5XcuDbsh3hAd7uY8Abs2IQZQLihXhfKbth4PTVkuMOBBHcuhK+QIb
         3lxWJfaF3x4VPaeXCxoiRK+F7zLYwIB3RRXA2j7ZnD6G1fL0VbcvQPmiuYVUtf9iYYEN
         Xeaw==
X-Gm-Message-State: AOJu0Yz/dSJfotWCaNXM6qUJ5e/sC3LKrzhjRglHll7ODRkRO5kBi7q/
	eyyC5D0hm330gY4/FZLiJlTcJRZDaG39/EkVSh2aK9IndHRAzIWoQgZ676n65afgvlt8xboUvrN
	c
X-Google-Smtp-Source: AGHT+IEio22AWrj+X2xaIVMPhThhLcl8UOyFNAbZ9with0OcbvQ4Zp4Z0qm0FHHD59gtSLKsE449AA==
X-Received: by 2002:a17:907:9487:b0:a99:c0be:a8ac with SMTP id a640c23a62f3a-a9de5ee477dmr1113535966b.37.1730194976764;
        Tue, 29 Oct 2024 02:42:56 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/pv: gate setting per-domain slot to XPTI being active for the domain
Date: Tue, 29 Oct 2024 10:42:54 +0100
Message-ID: <20241029094254.38659-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's possible to have XPTI not active for all PV domains (active for domUs,
inactive for dom0), hence don't gate setting the per-domain slot on the
presence of the per-pCPU shadow root page-table.  Instead set the slot based on
whether XPTI is active for the domain.  This avoid pointlessly setting the
per-domain slot if the shadow root page-table won't be used by the domain.

Fixes: 0d3e7f0b6bf0 ('xen/x86: support per-domain flag for xpti')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 78a13e6812c9..fd6bb3663027 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1902,12 +1902,11 @@ void cf_check paravirt_ctxt_switch_from(struct vcpu *v)
 
 void cf_check paravirt_ctxt_switch_to(struct vcpu *v)
 {
-    root_pgentry_t *root_pgt = this_cpu(root_pgt);
+    const struct domain *d = v->domain;
 
-    if ( root_pgt )
-        root_pgt[root_table_offset(PERDOMAIN_VIRT_START)] =
-            l4e_from_page(v->domain->arch.perdomain_l3_pg,
-                          __PAGE_HYPERVISOR_RW);
+    if ( d->arch.pv.xpti )
+        this_cpu(root_pgt)[root_table_offset(PERDOMAIN_VIRT_START)] =
+            l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
 
     if ( unlikely(v->arch.dr7 & DR7_ACTIVE_MASK) )
         activate_debugregs(v);
-- 
2.46.0


