Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1FC8B7BB8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 17:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715017.1116447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1pV2-0006fb-MO; Tue, 30 Apr 2024 15:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715017.1116447; Tue, 30 Apr 2024 15:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1pV2-0006dQ-JA; Tue, 30 Apr 2024 15:34:32 +0000
Received: by outflank-mailman (input) for mailman id 715017;
 Tue, 30 Apr 2024 15:34:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ve62=MD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1pV0-0006dK-W5
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 15:34:31 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2226ac60-0707-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 17:34:29 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-43716ff5494so61248561cf.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 08:34:29 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 n8-20020a0cfbc8000000b006a0d1b1ecc3sm1758025qvp.59.2024.04.30.08.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 08:34:27 -0700 (PDT)
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
X-Inumbo-ID: 2226ac60-0707-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714491268; x=1715096068; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=34PMgtoaf8o3Vg7/Sgvqf/mYgVt7JD3V1DRhLWohI0Y=;
        b=e9INaAhwhSc6ydiMma0yqoi38tkrkvDVc7IHoFFSgxqHraZSRFpp/PgCSpQYi07E7b
         pn9qRQlEemipyNgXx7eynaspmmpNuQBuiYnDDxr9G+QfF9qEO9iZgtyGe3hUhrTCYAs6
         m2WvfwWLWgAi4gaiC7AaIqmYCp79C5yfHS/ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714491268; x=1715096068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34PMgtoaf8o3Vg7/Sgvqf/mYgVt7JD3V1DRhLWohI0Y=;
        b=Zc3FqzlF6y1CCVw6Kn+5h0ZBUpVPty68dgtEEM95KqCkTL6JywCoKDfOKu89Vvp1z6
         2hGK9oNnDITjefls/XRwO+BDKmgYndK6DSiS04r0qtcv2aoTFbVMCp6LiVMxaGNfzdC/
         Wo/6cN1+JW24rfz5iQ9CaoIHBjQ5R8hIoZTSERvDttMvl5M/Rr1C/mJ+ASDYrWIfpQ7d
         wRsGgAnCZLlY6tWOUfxeJzpa7i3/SRiytKrJjfQz/6TQTaXUpVuFEeDzMo8fU3dm3rR1
         cJCpUUyrfCNvWY7QoKuasEZ5dolBlj1WT1HQdEAM2ZXkWlPNzZ6yHCpCRJS4sXmSWVYF
         3dLQ==
X-Gm-Message-State: AOJu0YxbCeykUBRiPxv+YJtdiyvLECIeBEUz9qwQLtRijZV5j4n92hTF
	/iKHxq/NYRn2BBjv3U+8PjRyNHUWY8LHIxifzntHxH1wG9csoWLQEC4qh0gnkmg6/k+IYPIpoHJ
	/
X-Google-Smtp-Source: AGHT+IFCQgQeI14XB2JTLFzZ/Mj4dGcOcUJFDR3ZFMOm1EOXkXqITukM0jnHBxXTc93G0N9BLylUSg==
X-Received: by 2002:ad4:4ee4:0:b0:69b:6b28:f941 with SMTP id dv4-20020ad44ee4000000b0069b6b28f941mr5952674qvb.20.1714491268248;
        Tue, 30 Apr 2024 08:34:28 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19] ppc/riscv: fix arch_acquire_resource_check()
Date: Tue, 30 Apr 2024 17:34:23 +0200
Message-ID: <20240430153423.80875-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

None of the implementations support set_foreign_p2m_entry() yet, neither they
have a p2m walk in domain_relinquish_resources() in order to remove the foreign
mappings from the p2m and thus drop the extra refcounts.

Adjust the arch helpers to return false and introduce a comment that clearly
states it is not only taking extra refcounts that's needed, but also dropping
them on domain teardown.

Fixes: 4988704e00d8 ('xen/riscv: introduce p2m.h')
Fixes: 4a2f68f90930 ('xen/ppc: Define minimal stub headers required for full build')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/ppc/include/asm/p2m.h   | 7 ++++---
 xen/arch/riscv/include/asm/p2m.h | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/ppc/include/asm/p2m.h b/xen/arch/ppc/include/asm/p2m.h
index 25ba05466853..f144ef8e1a54 100644
--- a/xen/arch/ppc/include/asm/p2m.h
+++ b/xen/arch/ppc/include/asm/p2m.h
@@ -81,10 +81,11 @@ static inline mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn)
 static inline bool arch_acquire_resource_check(struct domain *d)
 {
     /*
-     * The reference counting of foreign entries in set_foreign_p2m_entry()
-     * is supported on PPC.
+     * Requires refcounting the foreign mappings and walking the p2m on
+     * teardown in order to remove foreign pages from the p2m and drop the
+     * extra reference counts.
      */
-    return true;
+    return false;
 }
 
 static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 87b13f897926..387f372b5d26 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -79,10 +79,11 @@ static inline mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn)
 static inline bool arch_acquire_resource_check(struct domain *d)
 {
     /*
-     * The reference counting of foreign entries in set_foreign_p2m_entry()
-     * is supported on RISCV.
+     * Requires refcounting the foreign mappings and walking the p2m on
+     * teardown in order to remove foreign pages from the p2m and drop the
+     * extra reference counts.
      */
-    return true;
+    return false;
 }
 
 static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
-- 
2.44.0


