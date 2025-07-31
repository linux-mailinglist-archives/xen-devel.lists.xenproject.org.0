Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C45BB1748C
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065993.1431395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVk6-0005G1-Qq; Thu, 31 Jul 2025 16:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065993.1431395; Thu, 31 Jul 2025 16:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVk6-0005Cm-NA; Thu, 31 Jul 2025 16:02:54 +0000
Received: by outflank-mailman (input) for mailman id 1065993;
 Thu, 31 Jul 2025 16:02:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVg6-0001FB-CR
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:46 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bee2649-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:43 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-55b85413019so600238e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:43 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:42 -0700 (PDT)
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
X-Inumbo-ID: 3bee2649-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977523; x=1754582323; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEOkzQdBxpbC9Okf9MXfHH5aCeAaO0EgwJT3GQlkxY4=;
        b=YMKEAMhjuWtxzRUxAneynLhqIVice5DnDqxQLQ9PET6hiML/XzAmi46VWrMsVCvru8
         UiNes28DBwPfJUU5HdW1EEC+JUvsuG1PzqCesS/dGJcGNSqYXp/XOcLks3pEYDR/mJRb
         uoEK3AznXY3hQ1kiwPtzDP+lcWDQxlSdw4EJV1qnPZeAQz93nNPdmiHfuMhBCGMIIl8B
         EEGiMvSEtU5GjB/BEdKpYsWUR7Q0OP86HZOXzwWRCGwSoXl5zYqHUEaxa5SwGsvlEdKC
         1yFRj7wyUxWvdYZN8malKe4pFL9aIxCnorZpYGM2C57KEwsutSiVgkpLecW9vvKnTZug
         R7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977523; x=1754582323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEOkzQdBxpbC9Okf9MXfHH5aCeAaO0EgwJT3GQlkxY4=;
        b=kHT5W+crpdEDTf1O4S3YmiDOpsJd3eZbJ2QWXkKl3liyNannwqQ0dwOF5m2A+NVp9A
         inzS9uUKcsInAJSUxAN4KTXwuuxckwrvu7WWwxMNmx6KpkTGFMSDnbjBSA1JliAJevTA
         JoRngTx/q3teaOQxuw5nV6DlZw4onRqjoPLw1TQDO/76i9cecqU4Umfngk6od9OmkPWI
         cElrmMlzTs73kCuli6VuLK1WyweLCMpGOP664IZbqsDI92u3e/PjagV7Gw3kowiLSFiw
         l5KKXo4P3jAPNfa/1Q1LhrikAO/EBkR11jWm8iccnwl0M3gKtAIvim6CJBc5tdwKrfz3
         5lBQ==
X-Gm-Message-State: AOJu0YyzEHnU7RKaO97nR2fx/9Olt12mnPETE6gXOhljUPjirZUYRFN6
	zwObndqd2yKW4KeYompu/HNptSm3+wzPy9kNXy8WQ1l1f45zy8jkoUIfF2v8dg==
X-Gm-Gg: ASbGnctyniT0zI4z1ObHCFuhwviRRowzsN/iqQ7cb2X0O7XZffAct8N38KB0ET62T40
	0aXfkGb0EAWdSw/0PiAt3nSmOejAO0PqHKtGVt+oSeuHy5hb3FjbH2KOQvjnY/jUlS/YJ/6wtY7
	2Fknv59k1MlHQZtNAx3p5N2BV0KBfBP4wP/99oDJw521IFGcgWWaFttHWMCm0mnMAnnOsbk+Tbu
	49QYXSem1z/wMwWpviyq8+PJFJri9C0L4bGzS8l2Z8gZXZiYLcZGrLjT53IcJr/+enUp5tqdIkZ
	+JpCDNdYICtjqz3U15ZuRC2/g1v3g5coUjwfPjLLdkdkZJ3+MIf7F2+JLEcPdjpo9P07YlDGM8t
	SQYs1RTReZ3Wwxsua0qqWx4JHrIgQy57k2KStwCfAHzuzbbidjtU0h7xmTWWCpw==
X-Google-Smtp-Source: AGHT+IFLTOuKuRf2T7tNGueoS/xGQR2k3DSUUMxZkxu+W21mtiv+Yw78Y6yFbwkuLfLx9uu1tuhAbA==
X-Received: by 2002:a05:6512:3ba7:b0:554:f72c:819d with SMTP id 2adb3069b0e04-55b7c08ec37mr2819368e87.43.1753977522774;
        Thu, 31 Jul 2025 08:58:42 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 09/20] xen/dom0less: abstract Arm-specific p2m type name for device MMIO mappings
Date: Thu, 31 Jul 2025 17:58:08 +0200
Message-ID: <b9f7a13262cb3b482fb3d5cbbee6c72781fbfdc2.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename `p2m_mmio_direct_dev` to a more architecture-neutral alias
`p2m_mmio_direct` to avoid leaking Arm-specific naming into common Xen code,
such as dom0less passthrough property handling.

This helps reduce platform-specific terminology in shared logic and
improves clarity for future non-Arm ports (e.g. RISC-V or PowerPC).

No functional changes — the definition is preserved via a macro alias
for Arm.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - New patch
---
 xen/arch/arm/include/asm/p2m.h          | 2 ++
 xen/common/device-tree/dom0less-build.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 2d53bf9b61..bade1eb71b 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -137,6 +137,8 @@ typedef enum {
     p2m_max_real_type,  /* Types after this won't be store in the p2m */
 } p2m_type_t;
 
+#define p2m_mmio_direct p2m_mmio_direct_dev
+
 /* We use bitmaps and mask to handle groups of types */
 #define p2m_to_mask(_t) (1UL << (_t))
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 6bb038111d..5b97bf0343 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -185,7 +185,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
                                gaddr_to_gfn(gstart),
                                PFN_DOWN(size),
                                maddr_to_mfn(mstart),
-                               p2m_mmio_direct_dev);
+                               p2m_mmio_direct);
         if ( res < 0 )
         {
             printk(XENLOG_ERR
-- 
2.50.1


