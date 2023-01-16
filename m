Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7E066B7C4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 08:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478338.741487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJYF-0007zS-Ge; Mon, 16 Jan 2023 07:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478338.741487; Mon, 16 Jan 2023 07:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJYF-0007wq-D3; Mon, 16 Jan 2023 07:05:03 +0000
Received: by outflank-mailman (input) for mailman id 478338;
 Mon, 16 Jan 2023 07:05:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W85+=5N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pHJYD-00077f-Vk
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 07:05:02 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17fe312e-956c-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 08:05:01 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id v30so39457275edb.9
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 23:05:01 -0800 (PST)
Received: from uni.router.wind (adsl-67.109.242.224.tellas.gr.
 [109.242.224.67]) by smtp.googlemail.com with ESMTPSA id
 v15-20020a056402184f00b0046c5baa1f58sm10990824edy.97.2023.01.15.23.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 23:05:00 -0800 (PST)
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
X-Inumbo-ID: 17fe312e-956c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpFKQyBz/d1EHnJYrbWB9uWY4J6FRm55N2ci72k9mak=;
        b=fstejPwJ4VDhCtYQDIAR7deIFG0CNd1qnz8sEUjV7iOuZNi9W+tIlxax5FWBDgQchi
         vl4Kncwjg+M40qUwzCErbWQcWY05Blp5f5b6wwuLPKzstAUfIEihspP86vQz0n05GEWC
         HSwxPkZwfOzTewVGX6qlB8adj6V3IRPesaTqtqM65B2efVWY1nu59l8Tbq3fVaG6pWhr
         G36ReBaRw25wXJ5/KGNQS9zmjFo8peHj6YBLHWdpY3zFHJfnX+h4WXoZd80jiyiWmE17
         zreqbFNUT5Tq//YPa8x8uDHpN2EN3ui7tUdoL3VwAikkoLJ98U04zJXmTY0vRN+1rLkU
         NGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpFKQyBz/d1EHnJYrbWB9uWY4J6FRm55N2ci72k9mak=;
        b=oSJfZJ6vT0FHf3wzf+9MJM2J8MzncoXXPiv5N6FBlzwF15QJ1c11IHiUjgzdyUcb3/
         ppCyysmfSo+9L6lCXwAIJHHpz8M074A6KTloOifsomayxTFWqm7FXbe7HBpzHjYI449S
         yucjDBONT3jlotKVsxqDRt0w7dxv2Rztv0/DTqr8WbEtS4SfQVKtjdqyU/BTlxJW8+bm
         685z8Jz2u/WyZh6TKhxSUrbmwaa3p3zAyVg4NdUmZkxfBvCDVrrQ1rsWIpjSAJcW3YSe
         iqfLwLSTHFJN/x8vi6BuCaTqqCcYYrM+hUIatfNWQsNdrOcx5y99cNP5RaMsXythjGOQ
         GMuw==
X-Gm-Message-State: AFqh2kpyktgq5fepoC71nP0yhbLndfjLS3sherXvZ8Erkdw1OnKWt87H
	dl/wgs1Z6kV9pBRcUHZlRr8utDb1JyU=
X-Google-Smtp-Source: AMrXdXuf/XxEfoHGwGw1ENaSPe9IGLDSq5yqMvSGhWEq+9x088+3yFDlog7T3dGMjfvZh4IoOt02Yw==
X-Received: by 2002:aa7:cb94:0:b0:496:6a20:6b61 with SMTP id r20-20020aa7cb94000000b004966a206b61mr29625347edt.22.1673852700440;
        Sun, 15 Jan 2023 23:05:00 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 4/8] x86/acpi: separate AMD-Vi and VT-d specific functions
Date: Mon, 16 Jan 2023 09:04:27 +0200
Message-Id: <20230116070431.905594-5-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230116070431.905594-1-burzalodowa@gmail.com>
References: <20230116070431.905594-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions acpi_dmar_init() and acpi_dmar_zap/reinstate() are
VT-d specific while the function acpi_ivrs_init() is AMD-Vi specific.
To eliminate dead code, they need to be guarded under CONFIG_INTEL_IOMMU
and CONFIG_AMD_IOMMU, respectively.

Instead of adding #ifdef guards around the function calls, implement them
as empty static inline functions.

Take the opportunity to move the declaration of acpi_dmar_init from the
x86 arch-specific header to the common header, since Intel VT-d has been
also used on IA-64 platforms.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - move the declarations of Intel VT-d functions to the common header,
    because Intel VT-d has been also used on IA-64 platforms, and update
    the commit log accordingly

 xen/arch/x86/include/asm/acpi.h | 6 +++++-
 xen/include/xen/acpi.h          | 7 +++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index c453450a74..6ce79ce465 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -140,8 +140,12 @@ extern u32 pmtmr_ioport;
 extern unsigned int pmtmr_width;
 
 void acpi_iommu_init(void);
-int acpi_dmar_init(void);
+
+#ifdef CONFIG_AMD_IOMMU
 int acpi_ivrs_init(void);
+#else
+static inline int acpi_ivrs_init(void) { return -ENODEV; }
+#endif
 
 void acpi_mmcfg_init(void);
 
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 1b9c75e68f..352f27f6a7 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -206,8 +206,15 @@ static inline int acpi_get_pxm(acpi_handle handle)
 
 void acpi_reboot(void);
 
+#ifdef CONFIG_INTEL_IOMMU
+int acpi_dmar_init(void);
 void acpi_dmar_zap(void);
 void acpi_dmar_reinstate(void);
+#else
+static inline int acpi_dmar_init(void) { return -ENODEV; }
+static inline void acpi_dmar_zap(void) {}
+static inline void acpi_dmar_reinstate(void) {}
+#endif
 
 #endif /* __ASSEMBLY__ */
 
-- 
2.37.2


