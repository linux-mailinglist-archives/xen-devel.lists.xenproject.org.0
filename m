Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80667B820BA
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125589.1467556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08E-00014s-PM; Wed, 17 Sep 2025 21:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125589.1467556; Wed, 17 Sep 2025 21:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08E-0000zg-K3; Wed, 17 Sep 2025 21:56:06 +0000
Received: by outflank-mailman (input) for mailman id 1125589;
 Wed, 17 Sep 2025 21:56:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz08C-0007Lt-EW
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:04 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19f4cffd-9411-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 23:56:02 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-267f0fe72a1so1859475ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:56:02 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:56:00 -0700 (PDT)
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
X-Inumbo-ID: 19f4cffd-9411-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146161; x=1758750961; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+LjsUjHhvVbZESumoiysJfqjc0SNUhGIIys/BFmCGk=;
        b=Rb9Bxxa75/hl3ERzSiyFdmDc6UaMxadvnL0g0kFkTPtBkNVsjwaoj46a20MFhK4mfP
         vt5WJEqX7qWydFIn0XinYLaumMsOGJc9zFo6rtsMKBgR6qkkiyBTq8P79gtUn7MVD9oX
         1a+n3BjsJLlXJiw1wJIp4bCfhpXbP6zMROEpJb/3tTpoySHRKQHKUkjp33CYtmAUnPDW
         yR70f1YbL7XO2mfbZYoxGjtbIyEmT2Jn+WMydR4Gw11aBrSCYX0KB4pR30f7iLUV47zP
         mtZdZuKU2mBHX5ZR2Hh/QumW8j141M5l20ONCDiKM6ROQ6e2XE/CJd7E7jYxjUffixH2
         fh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146161; x=1758750961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+LjsUjHhvVbZESumoiysJfqjc0SNUhGIIys/BFmCGk=;
        b=LBywySMLMnafwVPXMgRWdNx5Dd2+eZJcquTPxHJ6mnBRF52C6yPIcSe+cUTa6mmq8A
         pdOl1PS3D3cuxkwbXdKSjkN+3k3ONRDQYY+/m7xVp562zFueNG5TXbodOHqFmRQIjFQU
         k67fTjfEVGqqEEKvY+Iv0cIQX61LNkXVF2oR1yikfO0F2kGsnUP2VJUvTmYXWpZLQmoh
         ExBKAir7xQ09Dp1Z9vimfW8CM7ckOPm9OJv3zNrZDDfMtsUtQkHfaXguSrToXHG2iOaR
         ZuqvuHmyS9i4E5KafnRHXVz+cu8LfrXkgzUaVYLQoQIqZIggCtyjeQhEJUlkpjt/XVo9
         CAiw==
X-Gm-Message-State: AOJu0Yz3HPtT/06UIDOydrRcpwiT/i5DnYj3tv/q3yFTYwXN8Efab+d/
	hCQ40oNWWIWlZI79o8FseaP3n+SZ+i+BaLnvOmVhJlC4BFp8CuyxcI4bEyqhaQUH58I=
X-Gm-Gg: ASbGncsSTrAGTXPWWdWo4iDtA4lOp9CY5yZRAstRp3FiOecWKwUvZwg33XS0z2INFuA
	zilyNqQJ4rsWk2lkDUYVMtVisKvnWTx6PTomKz9K3OTEjmyKUS1FUKmC5PEuqaRvN1ZS/5Cya0x
	2EoRmRpa/wFjsMpGqQrq01jGvHQQo+wKx8VGRK596z9ZHCGZiC2HvfaQHbvymUTMeHtlrdX1EB2
	8IaNooXkvA9t7VAJ6avvn+fWMc21oqs3oPR/GSAQBX+q7Vqck7U7e9CayD2BPlMhckYCiLEp/XE
	e1BhIK91YKTj6BXcxGFt5jTic3m9Isk0njZ+b4qcUnDqAVqJvBp9dVvrZkMawm+yza7rEwixMkS
	ZCmTQRxnY8G4/kbwAR1Vs63VRBlG7srV/hOFvESgtBVDa
X-Google-Smtp-Source: AGHT+IGNPLadatCVRmi8Phsax/VmTFL+UZNvj6wraEgXA5r4ZJ+TzygZwFd7i7FiUN3kSaK5SnrXFA==
X-Received: by 2002:a17:902:fc86:b0:264:70e9:dcb1 with SMTP id d9443c01a7336-26813cfc1edmr43504565ad.56.1758146161001;
        Wed, 17 Sep 2025 14:56:01 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 08/18] xen/dom0less: abstract Arm-specific p2m type name for device MMIO mappings
Date: Wed, 17 Sep 2025 23:55:28 +0200
Message-ID: <e1735e1d3e27fe7c4c9eddb59cc8d78b61d3f5d3.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce arch_dt_passthrough_p2m_type() and use it instead of
`p2m_mmio_direct_dev` to avoid leaking Arm-specific naming into
common Xen code, such as dom0less passthrough property handling.

This helps reduce platform-specific terminology in shared logic and
improves clarity for future non-Arm ports (e.g. RISC-V or PowerPC).

No functional changes — the definition is preserved via a static inline
function for Arm.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Introduce arch_dt_passthrough_p2m_type() instead of re-defining of
   p2m_mmio_direct.
---
Changes in V3:
 - New patch.
---
 xen/arch/arm/include/asm/p2m.h          | 5 +++++
 xen/common/device-tree/dom0less-build.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index ef98bc5f4d..010ce8c9eb 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -137,6 +137,11 @@ typedef enum {
     p2m_max_real_type,  /* Types after this won't be store in the p2m */
 } p2m_type_t;
 
+static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
+{
+    return p2m_mmio_direct_dev;
+}
+
 /* We use bitmaps and mask to handle groups of types */
 #define p2m_to_mask(_t) (1UL << (_t))
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 9fd004c42a..8214a6639f 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -185,7 +185,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
                                gaddr_to_gfn(gstart),
                                PFN_DOWN(size),
                                maddr_to_mfn(mstart),
-                               p2m_mmio_direct_dev);
+                               arch_dt_passthrough_p2m_type());
         if ( res < 0 )
         {
             printk(XENLOG_ERR
-- 
2.51.0


