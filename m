Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EDAA66E28
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 09:30:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918608.1323261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSKj-0002lI-M2; Tue, 18 Mar 2025 08:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918608.1323261; Tue, 18 Mar 2025 08:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSKj-0002ij-JH; Tue, 18 Mar 2025 08:29:57 +0000
Received: by outflank-mailman (input) for mailman id 918608;
 Tue, 18 Mar 2025 08:29:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuSKi-0002Cm-Kq
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 08:29:56 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2975dafa-03d3-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 09:29:51 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so3218392f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 01:29:51 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395c8975b34sm17560128f8f.55.2025.03.18.01.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 01:29:50 -0700 (PDT)
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
X-Inumbo-ID: 2975dafa-03d3-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742286591; x=1742891391; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BTu9/BpyX023yFbCJu7mR4I20iD5ZNIw5rR/YcnfI+k=;
        b=l09SrUW1lXhgKtLe4JTBOCGZyghel3WQZbPS/dFcc1+Re7v7PUzooxXYf92WcToAbg
         f04xYFNVvehiUpH1J909XhequRiTDZQk5K6XsUNQSSvC1XiKwZFDeB/npAoBpBqaZO2T
         L817IeF0ydB9SlLvrSNDLO7t3rfM3NpFRTPNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742286591; x=1742891391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTu9/BpyX023yFbCJu7mR4I20iD5ZNIw5rR/YcnfI+k=;
        b=j/EV/j4dsi5bNoogbNKScAseJ4gwAnRo37y2IKbjvC01+5hdiBLhoTMa9C08w3EDCx
         QwkxcOhJY7F25eLs78Gioz2CvvvHaaTVTmALT/aXn3aPjancrt601IPFkoFug8P7DslB
         5HXUH83tGtUWjrmkzv472uBla6/dV3GIdMxsJ21PyUWwHp6wxfM50XIJT0H91Ed9/Y0R
         oyZzaQeOO1RMNhgiu25ImIhHUTATk0dqA4IzczS0EW9UOGFqWdFNB+tNSKkwYl/3Yj2l
         UhIwcYkAULXUMkCBf8aRRJMwKnP3z75jJIEq8ubPKlCRMG1BRCYn84vbSN1Cwk9uFZrE
         Abrg==
X-Gm-Message-State: AOJu0YzHy/YJjhPgqv7/vEIg7XOfqo43rk26cloa8b+ATr1hUV27ODT1
	KYwfoHMuUzQhrcxeyRpgqv+LVn6VIzP5bb1KTDpZpiL6qEcwpK96zbuOJd0AwaoWkaHVU5fxAhA
	o
X-Gm-Gg: ASbGncsKzv/axAqjeAPdMlwLT+h8w2HxZluGk5zOCXbiNeJ/ngp+oC7vLYQ4WkUXD6o
	/bMBAHpZd0vVHCCGwIIFi1HMsYCtUJldO2FWWR+3fVpXb62EiKXitUpbsczVdjDu6UElvDQoCh7
	2/tqGc5dNfknLYUuIMlBlVST8C8k4x55+Nq1EuM+eAAhER1K3/0x+aj6ONa+nM7aemWc41lDx82
	oZdv+MX4lNqXvQScBuhcFaMgTP/csFkz7KH4CtPe8NmOsWrApXgunfISwKCBBsN4PgVwuWAMUki
	eYxzY5yumczOR/yOtNS94XfNhvDRdPptk10XHOdE/o5+eZByhyF/r94=
X-Google-Smtp-Source: AGHT+IEIzqwAKrEOK/zJ9dzxOeKnhmfQnzj2x0BKwQohuIscM/gpAr/LxaGF93grrSxViE00scgxMQ==
X-Received: by 2002:a05:6000:25f8:b0:391:3f4f:a169 with SMTP id ffacd0b85a97d-3971e592812mr16513233f8f.32.1742286590999;
        Tue, 18 Mar 2025 01:29:50 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] x86/msi: always propagate MSI writes when not in active system mode
Date: Tue, 18 Mar 2025 09:29:45 +0100
Message-ID: <20250318082945.52019-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Relax the limitation on MSI register writes, and only apply it when the
system is in active state.  For example AMD IOMMU drivers rely on using
set_msi_affinity() to force an MSI register write on resume from
suspension.

The original patch intention was to reduce the number of MSI register
writes when the system is in active state.  Leave the other states to
always perform the writes, as it's safer given the existing code, and it's
expected to not make a difference performance wise.

For such propagation to work even when the IRT index is not updated the MSI
message must be adjusted in all success cases for AMD IOMMU, not just when
the index has been newly allocated.

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Fixes: ('8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT index hasn't changed')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/msi.c                       | 9 +++++++++
 xen/drivers/passthrough/amd/iommu_intr.c | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 163ccf874720..8bb3bb18af61 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -189,6 +189,15 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg,
 {
     entry->msg = *msg;
 
+    if ( unlikely(system_state != SYS_STATE_active) )
+        /*
+         * Always propagate writes when not in the 'active' state.  The
+         * optimization to avoid the MSI address and data registers write is
+         * only relevant for runtime state, and drivers on resume (at least)
+         * rely on set_msi_affinity() to update the hardware state.
+         */
+        force = true;
+
     if ( iommu_intremap != iommu_intremap_off )
     {
         int rc;
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index 9abdc38053d7..08766122b421 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
     rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
                                             &msi_desc->remap_index,
                                             msg, &data);
-    if ( rc > 0 )
+    if ( rc >= 0 )
     {
         for ( i = 1; i < nr; ++i )
             msi_desc[i].remap_index = msi_desc->remap_index + i;
-- 
2.48.1


