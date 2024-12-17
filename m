Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D559F511B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859438.1271601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVM-0002KD-C8; Tue, 17 Dec 2024 16:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859438.1271601; Tue, 17 Dec 2024 16:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVM-0002HA-3z; Tue, 17 Dec 2024 16:33:04 +0000
Received: by outflank-mailman (input) for mailman id 859438;
 Tue, 17 Dec 2024 16:33:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BizT=TK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tNaVK-0001J8-4y
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:33:02 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 949a6394-bc94-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 17:33:00 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3022598e213so53711211fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:33:00 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344175b51sm13179021fa.69.2024.12.17.08.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 08:32:58 -0800 (PST)
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
X-Inumbo-ID: 949a6394-bc94-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734453179; x=1735057979; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COLAwTsK8KOA8E4uFs654fi6y7eVlKrSbKVPVTbpnco=;
        b=NaK7mWP6EZMPweL9iugUHTaLO+teOF83AGwg6IDibgUM0OHcD/vR6HCfQTSV5BrLCw
         HGIW1AANkmHhm4A5c2fuIXK/Svfu0VKvgxGbytXImW1MMuaaezVAe6gljQVsypU19tSz
         s9oWg3dwuZECs8As1WbnrLWjYQV61jzwyGlTGa09Pf7ypT/QpZnDypgSlQ7xpU7V0i59
         PPakavBmkyqM/nsSI8VzYmf/IN/MCM8VsfLrycUpx+B+I1btbnI5dzQUMpna05hwMDe5
         ufgFxN3uPSS5OTCjb9yNq36XGFmJZzBRBkCBKJozYcTInOJ63UD1tMLegAlbE7O62L+m
         fYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453179; x=1735057979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COLAwTsK8KOA8E4uFs654fi6y7eVlKrSbKVPVTbpnco=;
        b=J+w1YctXCundEK2PMJvqQwgtlZId6re9DptKp3L+IF/zvUdLnB5/XzjOCxHrNjgOom
         2oAthi1DjumyD1iXV2AkRcx59nxea3lU/vVSIE0APa8J7LBZCmxmmRgbpenWxo2GEVjz
         sl3CqCe5PaBdxGPMnW++K7efNm32Nss1la+tA+dlD48Chn2NnWs4QkUD7HSo61gDw5LB
         +5Jvb1Vgvaym39yRsuP2lfIrfPiYSFw9Wnk/kjDLrG1rvcF00MlWe2OaY0C0Xnpj3+UY
         YW3vkmkxdbJEuruKw2rpGnnKoNsiY/ApcZC3swP8fT6ANaxjG7BhJKCt/NNx5y0+Pnka
         HJWg==
X-Gm-Message-State: AOJu0Yzgjz1sSOZe/Q/CyW6ABt7EiHGLJW7GPaBVaufRFxljX1bkFrOs
	hCZqBYEwJSKTqARr6XKgDUyvO8RywWjpHp9Ot2TVDuLkiuKFh1Ns4RxQ4wc8
X-Gm-Gg: ASbGncv21dsGTVJit3hNcl3hXw8dfYWtY3c0PIb/5GtdjvUizhEJWKUozzTpNLuypwu
	WUMCxHTBw7StrUh8XImXIDAqBg9p6FzeqXDA5CHvSrDf6fvoPTRrj8XgOBpY1g3P25afCgDDyaO
	L1poEHn6nMtJiJtqmcs7fdhMAm1tPP/CJI5Rx0BLSSG7dJvopL+cLBpIco+azK27C0DdxdBocfO
	eVIkYVer9ZWHZLFgvFtCirQEWu5v5xDZ/qdRSbmyLnMa5zgH06DbrdjAQ==
X-Google-Smtp-Source: AGHT+IH72GX86NpSR4Ud+2h/3T7SlD9ypv7lg2VcJ8D2evWfj3ikKjxJXjIxUtwidPHtH/IE8TKVbg==
X-Received: by 2002:a2e:be25:0:b0:2ff:56a6:2992 with SMTP id 38308e7fff4ca-302544cd514mr49542241fa.37.1734453179235;
        Tue, 17 Dec 2024 08:32:59 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 4/7] xen/riscv: add {set,clear}_fixmap() functions for managing fixmap entries
Date: Tue, 17 Dec 2024 17:32:48 +0100
Message-ID: <46bd4f5cd2f41e8f0d00be3bdd9887e57dfdcdc2.1734452721.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734452721.git.oleksii.kurochko@gmail.com>
References: <cover.1734452721.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce set_fixmap() and clear_fixmap() functions to manage mappings
in the fixmap region. The set_fixmap() function maps a 4k page ( as only L0
is expected to be updated; look at setup_fixmap_mappings() ) at a specified
fixmap entry using map_pages_to_xen(), while clear_fixmap() removes the
mapping from a fixmap entry by calling destroy_xen_mappings().

Both functions ensure that the operations succeed by asserting that their
respective calls (map_pages_to_xen() and destroy_xen_mappings()) return 0.
`BUG()` is added to trigger a failure if any issues occur during
the mapping or unmapping process.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - Fix code style: ident if-condition properly.
---
Changes in V2:
 - Update the commit message.
 - drop local variables from {set, clear}_fixmap(); use if (... != 0) + BUG().
---
 xen/arch/riscv/include/asm/fixmap.h |  5 +++++
 xen/arch/riscv/pt.c                 | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
index 818c8ce07b..e399a15f53 100644
--- a/xen/arch/riscv/include/asm/fixmap.h
+++ b/xen/arch/riscv/include/asm/fixmap.h
@@ -32,6 +32,11 @@
  */
 extern pte_t xen_fixmap[];
 
+/* Map a page in a fixmap entry */
+void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags);
+/* Remove a mapping from a fixmap entry */
+void clear_fixmap(unsigned int map);
+
 #define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
 
 static inline unsigned int virt_to_fix(vaddr_t vaddr)
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index 2ca23206f4..aea9f97a5a 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -8,6 +8,7 @@
 #include <xen/pmap.h>
 #include <xen/spinlock.h>
 
+#include <asm/fixmap.h>
 #include <asm/flushtlb.h>
 #include <asm/page.h>
 
@@ -433,3 +434,18 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 {
     return pt_update(virt, INVALID_MFN, nr_mfns, PTE_POPULATE);
 }
+
+/* Map a 4k page in a fixmap entry */
+void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
+{
+    if ( map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags | PTE_SMALL) != 0 )
+        BUG();
+}
+
+/* Remove a mapping from a fixmap entry */
+void clear_fixmap(unsigned int map)
+{
+    if ( destroy_xen_mappings(FIXMAP_ADDR(map),
+                              FIXMAP_ADDR(map) + PAGE_SIZE) != 0 )
+        BUG();
+}
-- 
2.47.1


