Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804BDBF2406
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146536.1479005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH6-0005zQ-KW; Mon, 20 Oct 2025 15:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146536.1479005; Mon, 20 Oct 2025 15:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH6-0005sv-Fg; Mon, 20 Oct 2025 15:58:20 +0000
Received: by outflank-mailman (input) for mailman id 1146536;
 Mon, 20 Oct 2025 15:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsH4-0004DQ-28
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:18 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97a5e038-adcd-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:58:17 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo998559666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:17 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:16 -0700 (PDT)
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
X-Inumbo-ID: 97a5e038-adcd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975897; x=1761580697; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CweJfrPabX9qr27+BJlL85E9LD+o5VwLJH3d1PbUUo0=;
        b=A1rJLV2Bojo32TjohZAYcakLk8owctkKxGQ+iyjit0dOpz7qTJWYRzEWhEZO74YVlA
         eKPUnUEC36B/sV1nDJJZPvZhIB/EW4kk4hN+UxnRwhN6hc6CGz5h+dVwM7daXcSfxPUS
         Fz6QaApOblqYOQs4zrJIP7GIMkYYCvbAXOd2ElFuEr4F7DiqfD7jfUhYP2cQ98Lus3P1
         SUE7a5lt9Lb0b56GPvQ+2XM0854v0LUW9S6bAqdfFMNRBzXXvzTj3TZCztCNYEHckTHM
         zVUALk5xZFDtK7F0k/Hy+6WlXQy9EitzhhIp2OAqaOljfBPyekKSfCcWvFpPtgWRC4VP
         xNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975897; x=1761580697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CweJfrPabX9qr27+BJlL85E9LD+o5VwLJH3d1PbUUo0=;
        b=vo8/Ud4NNfCnsN8zTYQdziGVGOXwy55E+3dSidu/5dQqYlP9gYNUiahXoNphouoSCs
         5naVNV6GCzKsGhWiKrV0ylCly61BkNuRPq7N/m+8FCZ2PNLj7nVgK/Fmbel8W4YPnIP5
         21vL7TTQa92OWD0EZHKN+pXrQCbUZ1w8+ohK4hNWJ9RMkYKPp9XurxyFBwbV5QIBMiCx
         vKqJ49hnLLYcFkVaT938DcXtBvgyUk73SaQZFr2SVJMasTAoblmxasedA8Ealzn9KzhY
         yB3uIGQeT7EZ5gSQqYca25P9SGbrW7yag7/uqBhmsuocrOtKV3OKQUthFPqtzOWodX/2
         Rzyw==
X-Gm-Message-State: AOJu0YwxBpJBAQGy80GpHETUQyt0rfOx3tZMn29Dn68AueV/p4dlS1bW
	ly851M1HDzS5RYAXEmLgWY9vjNU4914Rb3Rm9w5lyym9hQE0T4DK1fSnmS5Q8A==
X-Gm-Gg: ASbGnctIaLzX0a2P7nGeZZn2+og9U6/LdLm+3JufSzz/6DtfiTjkjYPGUy1ebXErFN6
	NBf0xarXBlOgPVVpAoR9fjkKO2n/ESsGBMlKo/pDakUN2hPrZq3lWyfraJgTK2KHM+Q6ahyGYS6
	AFysOUPWvXaFrg87n19/yC6R1wh+Sviv5/Bu+ZJxG/SasmD9VqJmvUJEc6/KrKLuqGK17dUIBiC
	hrqjvO0EOq4sodYwDGAmwJWL7wwgCrGEvEau5BrNUNFcHq79wGDN7NUZvcT4bm4/7h6ZYvOdQGv
	48XKpaOBjFwSDtgAIILfAgAQJhPBK9z0ZxenWzcoz63VxrZDbJ8fpt8aCqwpzzC6XB5CM3H2X0v
	BmGZQD9/vr8bR5B64ujlyHeGmtlKvUAEumNg1kTLd+De4vT/Dv0yt8Ifku9vDZNAqqmrfwd1p/R
	t8ScAxK1NnHMBv8OzprAGl50KVYxnOzU/Z1D9188RlK0BSoxw=
X-Google-Smtp-Source: AGHT+IHoIhJtsof26UvSvFaoP8y38nf7VSxnKgXGly/gx12d4R9mgwEIQTznUSFJA/rx/fkav7aYaA==
X-Received: by 2002:a17:907:1c9e:b0:b40:6d68:349a with SMTP id a640c23a62f3a-b647493fe5dmr1583199466b.39.1760975896477;
        Mon, 20 Oct 2025 08:58:16 -0700 (PDT)
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
Subject: [for 4.22 v5 06/18] xen/riscv: introduce pte_{set,get}_mfn()
Date: Mon, 20 Oct 2025 17:57:49 +0200
Message-ID: <15707c6a76bb3ac4680499dfd1272d6161a126e8.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce helpers pte_{set,get}_mfn() to simplify setting and getting
of mfn.

Also, introduce PTE_PPN_MASK and add BUILD_BUG_ON() to be sure that
PTE_PPN_MASK remains the same for all MMU modes except Sv32.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4-V5:
 - Nothing changed. Only Rebase.
---
Changes in V3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V2:
 - Patch "[PATCH v1 4/6] xen/riscv: define pt_t and pt_walk_t structures" was
   renamed to xen/riscv: introduce pte_{set,get}_mfn() as after dropping of
   bitfields for PTE structure, this patch introduce only pte_{set,get}_mfn().
 - As pt_t and pt_walk_t were dropped, update implementation of
   pte_{set,get}_mfn() to use bit operations and shifts instead of bitfields.
 - Introduce PTE_PPN_MASK to be able to use MASK_INSR for setting/getting PPN.
 - Add BUILD_BUG_ON(RV_STAGE1_MODE > SATP_MODE_SV57) to be sure that when
   new MMU mode will be added, someone checks that PPN is still bits 53:10.
---
 xen/arch/riscv/include/asm/page.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index ddcc4da0a3..66cb192316 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -112,6 +112,30 @@ typedef struct {
 #endif
 } pte_t;
 
+#if RV_STAGE1_MODE != SATP_MODE_SV32
+#define PTE_PPN_MASK _UL(0x3FFFFFFFFFFC00)
+#else
+#define PTE_PPN_MASK _U(0xFFFFFC00)
+#endif
+
+static inline void pte_set_mfn(pte_t *p, mfn_t mfn)
+{
+    /*
+     * At the moment spec provides Sv32 - Sv57.
+     * If one day new MMU mode will be added it will be needed
+     * to check that PPN mask still continue to cover bits 53:10.
+     */
+    BUILD_BUG_ON(RV_STAGE1_MODE > SATP_MODE_SV57);
+
+    p->pte &= ~PTE_PPN_MASK;
+    p->pte |= MASK_INSR(mfn_x(mfn), PTE_PPN_MASK);
+}
+
+static inline mfn_t pte_get_mfn(pte_t p)
+{
+    return _mfn(MASK_EXTR(p.pte, PTE_PPN_MASK));
+}
+
 static inline bool pte_is_valid(pte_t p)
 {
     return p.pte & PTE_VALID;
-- 
2.51.0


