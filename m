Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2F59A052F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819723.1233159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t108V-0005NB-C1; Wed, 16 Oct 2024 09:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819723.1233159; Wed, 16 Oct 2024 09:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t108V-0005LR-8o; Wed, 16 Oct 2024 09:16:07 +0000
Received: by outflank-mailman (input) for mailman id 819723;
 Wed, 16 Oct 2024 09:16:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8GJ6=RM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t108T-0004r9-L4
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:16:05 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44c55a29-8b9f-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 11:16:04 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-539f2b95775so4121713e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:16:04 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a000129eesm391451e87.259.2024.10.16.02.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:16:01 -0700 (PDT)
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
X-Inumbo-ID: 44c55a29-8b9f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729070163; x=1729674963; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTo8wcoBAnZWVL6JY0i7rOCMbKVxaD9bONOTGNKU9j0=;
        b=C2cAA6GZr+IRir0BpoKtgIeq9vxBXkASqUuKhHDfWjUW8xpbf619sAIPRX4oh8aQwo
         38y9neezO0KcnrmiYbsdzWYwGPLyflyoXBF5KA7UYO1PR/S23nvfBk36kyEiNwYdQWh/
         JSKplRCW3zR7e7wOP6Og9tUsK81Jv0RFlmQFObHr/KAoXFF8jYZU5nJJkZSX/FGIQg2+
         lG53A0YXTeEipLzj+OsIBbZllTCt1IWTf5rDEL3hDNeKz+5vNT3470/YO3CLzgYZvMFr
         NODx42L/ojBUgAzrIuzV6jLiTVwoafclyRPd33jtoUyohtW96BiEA/gKcXHG3iI3I30Y
         V7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070163; x=1729674963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTo8wcoBAnZWVL6JY0i7rOCMbKVxaD9bONOTGNKU9j0=;
        b=XT/4qknI1gm3xEKUVyk+OpybGkd5ydNMUH8FtXa1plRe7z3PQGgHTp6/RAOa11nn9r
         PC5qkS9fftJeMTSwyNmcLZihPh1RY0TKOXN/zAur36sKE/Hblwn3cLaiiqqthbLVJf3U
         sKN4R4QKdBKy/GjwbE2u9HIwRUrBxUpMaYLSDnrSRbDUJPsxKHCtPdz6Nvf7Q1rtjlDk
         Vv1J2MUKFPCMOt1XmpXwhGyTpzzfeob2HwqFLjMDjGHlEv2oK4JY5AlLueaovrhlP9hl
         pu5ZZW9eZcN0dI4lU+2qw5w+PJXYbpoL0sHxSCyS0Afh4sXcVKrZSYOJy3h6ZIs46cS0
         KuKw==
X-Gm-Message-State: AOJu0YyMwYuZLlm8h9KPXsGtAOaauTYrTf9YU72o4YWBK8dZgCK//cLq
	pot3rcidG8vs96ld7g7bT5DpFueTHHG5IWIEUFdOKrx5v7g86Mke0Z5otA==
X-Google-Smtp-Source: AGHT+IGiD8tLBcbs6M/QvfKxQOuo5Zgnq6pEzPkd4C4CIXLglaZ+oIXatCYihqviEWs7KjcKGIUlFA==
X-Received: by 2002:a05:6512:220d:b0:539:8a50:6ee8 with SMTP id 2adb3069b0e04-539e57282b1mr9234525e87.57.1729070163190;
        Wed, 16 Oct 2024 02:16:03 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/5] xen/riscv: implement maddr_to_virt()
Date: Wed, 16 Oct 2024 11:15:54 +0200
Message-ID: <ec04dca87144194f5b3ecb9a78d142d370c9193f.1729068334.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729068334.git.oleksii.kurochko@gmail.com>
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the `maddr_to_virt()` function to convert a machine address
to a virtual address. This function is specifically designed to be used
only for the DIRECTMAP region, so a check has been added to ensure that
the address does not exceed `DIRECTMAP_SIZE`.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/mm.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index ebb142502e..0396e66f47 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -25,8 +25,12 @@
 
 static inline void *maddr_to_virt(paddr_t ma)
 {
-    BUG_ON("unimplemented");
-    return NULL;
+    /* Offset in the direct map, accounting for pdx compression */
+    unsigned long va_offset = maddr_to_directmapoff(ma);
+
+    ASSERT(va_offset < DIRECTMAP_SIZE);
+
+    return (void *)(DIRECTMAP_VIRT_START + va_offset);
 }
 
 /*
-- 
2.47.0


