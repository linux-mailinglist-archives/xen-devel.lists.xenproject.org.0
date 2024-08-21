Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E81C959EB6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 15:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781146.1190708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sglS7-0004WK-8U; Wed, 21 Aug 2024 13:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781146.1190708; Wed, 21 Aug 2024 13:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sglS7-0004Ti-5O; Wed, 21 Aug 2024 13:32:43 +0000
Received: by outflank-mailman (input) for mailman id 781146;
 Wed, 21 Aug 2024 13:32:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFRG=PU=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sglS6-0004Ta-CW
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 13:32:42 +0000
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d63f5ee1-5fc1-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 15:32:40 +0200 (CEST)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-45006bcb482so33938811cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 06:32:40 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bf6fef332dsm61890646d6.124.2024.08.21.06.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 06:32:38 -0700 (PDT)
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
X-Inumbo-ID: d63f5ee1-5fc1-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724247159; x=1724851959; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cn/bGe/oHUUjmOljNT3DkkYcezh2XDSyAST19X6GM9U=;
        b=dfH3R9t4w84ImMChzMkbe0zOprEzYXPOFvW44wLbe71aCKyI1si1wA/jlpLPjl41kv
         yJsLSxPNlGQKjgw9GOrLdkZ3MU2Moy8SwgQnGhkGuRYZhqwGtGW8yQ0NsPY1QrDPR3zw
         vSVTD8KO3UZF8Fr3yUkxatldIaGxB8H9a+A3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724247159; x=1724851959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cn/bGe/oHUUjmOljNT3DkkYcezh2XDSyAST19X6GM9U=;
        b=mm+7X+XW2n6M4rgsJexTEheKjvMKJSVsgN/+gGbZq/+TUBCybGwZgNulDK0M3Hi3RF
         cBiSbpHbvNi8KlENiJg8tsOCeDvXEp7I3Lbwq2k0DWLXq/ZQF5F3hcl96lmJS6HMsMbw
         QgONtLE/5qqkf/eUr4n5ma9XoySoVUX9f15a3l5vV3J6UqVg5FYsGTB7IUk+BkV+2CWb
         VF3sgF9M8pHHQUkC3n0oe0xg50GdZtNHs6MkdLeimKzvoENq4qzy5W47LLLt4alRlalA
         Pyde6cM2PdNVNE8tc3n5EESC0VKg1E9HO37BY1rvyeHU8ivEo6p1P7VxfvXgk5A1fC7S
         Grhg==
X-Gm-Message-State: AOJu0YxBpu47SgXKa2jqknVWKzpyx10G8qFtuquklHV+kVcQO59NCKEU
	GvQiOedKmN65o5HFF9gnj2b+NKxjLlElkZhYZpVXn+1MqwSA9oSlDhd83Lv0eKP/H3Yk9xawVbE
	H
X-Google-Smtp-Source: AGHT+IFWdhs+p8FzkWdlX7Rqq4rVGsyw+2EvGc5zCsnmN41WFHhxv12yyLCKE6AEMzqqWeLkCM2UsA==
X-Received: by 2002:a05:6214:3a85:b0:6c1:547b:418a with SMTP id 6a1803df08f44-6c155df40bcmr33700786d6.36.1724247159197;
        Wed, 21 Aug 2024 06:32:39 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] Restore memory used for IP computation
Date: Wed, 21 Aug 2024 14:32:22 +0100
Message-ID: <20240821133224.198923-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to write in some location but no reasons to not
trying to restore what we potentially overwrote.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index d8ac0f0494..3e1e9e05b6 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -418,13 +418,17 @@ __pvh_start:
          * absolute stack address as the native path, for lack of a better
          * alternative.
          */
-        mov     $0x1000, %esp
+        mov     $0xffc, %esp
+        pop     %edx
 
         /* Calculate the load base address. */
         call    1f
 1:      pop     %esi
         sub     $sym_offs(1b), %esi
 
+        /* Restore clobbered stack */
+        push    %edx
+
         /* Set up stack. */
         lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
 
@@ -468,13 +472,17 @@ __start:
          * this page for a temporary stack, being one of the safest locations
          * to clobber.
          */
-        mov     $0x1000, %esp
+        mov     $0xffc, %esp
+        pop     %edx
 
         /* Calculate the load base address. */
         call    1f
 1:      pop     %esi
         sub     $sym_offs(1b), %esi
 
+        /* Restore clobbered stack */
+        push    %edx
+
         /* Set up stack. */
         lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
 
-- 
2.46.0


