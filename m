Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 064539516AA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776849.1187046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9TB-0004Fd-7o; Wed, 14 Aug 2024 08:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776849.1187046; Wed, 14 Aug 2024 08:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9TB-0004CO-2Y; Wed, 14 Aug 2024 08:35:01 +0000
Received: by outflank-mailman (input) for mailman id 776849;
 Wed, 14 Aug 2024 08:35:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxPN=PN=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1se9TA-0003IY-2G
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:35:00 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16bf59dd-5a18-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 10:34:58 +0200 (CEST)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-690af536546so63569377b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:34:58 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4c7e05595sm407786785a.122.2024.08.14.01.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 01:34:56 -0700 (PDT)
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
X-Inumbo-ID: 16bf59dd-5a18-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723624497; x=1724229297; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9liPXw8F8uWc1T2M5e5K9juxcl/gQEIllOyVhjRgClo=;
        b=YZuTbeCi/FYg66M3taI8SEwHanJvd8Hx+Kqafh0DrF6FR5XeQi0iHXZguxdTN4wYtg
         ilT1QxuJDth8LjAMJJkbjElrTpq3T5r9ilp2ZEqsZT3HbczaHj4jzqI42yrxRZX/QAqZ
         jYJq5ByXGFQlPdz0+uuRMFr3LGqd6W4eodr10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624497; x=1724229297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9liPXw8F8uWc1T2M5e5K9juxcl/gQEIllOyVhjRgClo=;
        b=cT1p6z05tWzlCXlHvUrWfgcKHAfFEk1DS9gMy0pHEE929Fqbfy4njXt8hkSJ3WZvje
         WjKJauE2+BVnPopvdXPbMbV5H3KcgMhQkZr6Wt9vh25Kav2xXkxH19J4x0z45dFbJOVq
         7tn/Uw+2HbgH8Xf8IzeBu+G1lpk2rfq5+iaSMT5YNdCJHDOypJzT6uzz6b6afM2xOnlI
         I9pNBL+CkoI1M+A6ARUF8lCiOOhO3T3z8PZ2VASdwIOgguqS3IG3VuHla2Eq65OQqUcn
         Bg4wxcCtWUOuE3Dd2nG5zQBbfK8DD4CpT6ZmD3ZdiIjLCDjOTopeBZpalt+NLV8uYgLR
         vZJw==
X-Gm-Message-State: AOJu0Yz/uNKJO0RnpqZnmyiPqq8uZt9NmAmy4cHrZkKdVCimaSBuf/oz
	sjKOSDLo3i+MW7VjCF8fjHLA3EagGrFuQzIVRM2xdP55sypNnwOo5dgB+XQeqRoPs2KCKE0Cm5q
	W
X-Google-Smtp-Source: AGHT+IGMUyQiPtuxz+T1VQxDgT44hXZVi7vkaynauzor/OZHJNJzRTZJWR2TZztIUfw3xi2fMzeBPA==
X-Received: by 2002:a05:690c:2512:b0:648:3fb2:753b with SMTP id 00721157ae682-6ac976454c9mr21427057b3.24.1723624497101;
        Wed, 14 Aug 2024 01:34:57 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/5] x86: Set xen_phys_start and trampoline_xen_phys_start earlier
Date: Wed, 14 Aug 2024 09:34:11 +0100
Message-ID: <20240814083428.3012-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814083428.3012-1-frediano.ziglio@cloud.com>
References: <20240814083428.3012-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No reason to wait, if Xen image is loaded by EFI (not multiboot
EFI path) these are set in efi_arch_load_addr_check, but
not in the multiboot EFI code path.
This change makes the 2 EFI code paths more similar and allows
the usage of these variables if needed.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 5 +++++
 1 file changed, 5 insertions(+)
---
Changes since v1:
- Do not remove other hunk, used for BIOS;
- Slightly improved commit message.

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 16830f636f..af598a60bf 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -240,6 +240,11 @@ __efi64_mb2_start:
         jmp     x86_32_switch
 
 .Lefi_multiboot2_proto:
+        /* Save Xen image load base address for later use. */
+        lea     __image_base__(%rip), %esi
+        mov     %rsi, xen_phys_start(%rip)
+        mov     %esi, trampoline_xen_phys_start(%rip)
+
         /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
         xor     %esi,%esi
         xor     %edi,%edi
-- 
2.45.2


