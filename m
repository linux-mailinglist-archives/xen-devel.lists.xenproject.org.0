Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177395B7D9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 16:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781884.1191389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh8NE-0000qS-8y; Thu, 22 Aug 2024 14:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781884.1191389; Thu, 22 Aug 2024 14:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh8NE-0000ox-6H; Thu, 22 Aug 2024 14:01:12 +0000
Received: by outflank-mailman (input) for mailman id 781884;
 Thu, 22 Aug 2024 14:01:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkBN=PV=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sh8NC-0000or-R9
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 14:01:10 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9ae65a5-608e-11ef-8776-851b0ebba9a2;
 Thu, 22 Aug 2024 16:01:06 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-6bf6755323cso4338276d6.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 07:01:06 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162d4c109sm7872586d6.49.2024.08.22.07.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 07:01:03 -0700 (PDT)
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
X-Inumbo-ID: f9ae65a5-608e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724335265; x=1724940065; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X5khW8YaAwwfMgjgw8nuSi309AnsACpyZ2iwYQQbG3M=;
        b=DnWje7/BYvjbQJSLbIRFp0xqMC57AyRcMlfg9Sl9eiGu6J5B5U8tBIg2xEYqJbDxBM
         x7mSpA4t1Bbfh+X0aTykbFYXl2IPYpqLAefwFt8Geu2ftYrKt6noM1GK55mG3TR3vzwi
         z4LP+pMqkaswlvNKdE2hRIspS6aWdSydJgMxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724335265; x=1724940065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5khW8YaAwwfMgjgw8nuSi309AnsACpyZ2iwYQQbG3M=;
        b=tsbi78xfF6DbtmUW6Byd/zecIQeWjI8a3MUFTekvBa9wt3ht9801ztUgvg3/aAU/RS
         Y8noSzBYeGfHtI8/6sH0Km/ZZZ27oreJpMoA+Flsu6A+Rm0ysQR2+tW8ITglyaj/dfHh
         Hu7Bl1P8NGzwCuR9HKc7bIRYe9uXuY/qpdf7djUlNtJ0ufaB1nPPgcDkAcCu0CcHRVc4
         EbIlI5SProPYJ2+YJoTWoguezO9M9/0XuSYxp6aiC6oFgr6GkLO0zDskJ31GXWBpRI85
         hKqlffWU3kBV+a7wxuWXbZztB0WaQzf8otTrbc5E5nj+Leb1HzMHJSb6mo/6u0mkugOs
         6FLw==
X-Gm-Message-State: AOJu0YyBLear8Gq8BLHY+pyWlz6mb1i/bkb9oeUjmSJZRihDN/NN4KVr
	M21ai6UABQZLI3/gPGcqBDDud11L1xkW5LtwxDNb3hAdugFM3HclEPsLRCKH18C/xO+ieMyLEvo
	g
X-Google-Smtp-Source: AGHT+IFTwIfHUxyJqPhqRnhQRnWSCdyuMoNRg5aSCiDzJIKW0BzQcLD+qPzatTyU1NObIezm7fa3KQ==
X-Received: by 2002:a05:6214:4612:b0:6b4:4585:8e43 with SMTP id 6a1803df08f44-6c155d9d07amr74983806d6.31.1724335263878;
        Thu, 22 Aug 2024 07:01:03 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] Restore memory used for IP computation
Date: Thu, 22 Aug 2024 15:00:43 +0100
Message-ID: <20240822140044.441126-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to write in some location but no reasons to not
trying to restore what we potentially overwrote.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)
---
Changes since v1:
- Rewrite magic number field instead of some possible BIOS area.

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index d8ac0f0494..9b7e7b4e51 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -415,16 +415,19 @@ __pvh_start:
 
         /*
          * We need one push/pop to determine load address.  Use the same
-         * absolute stack address as the native path, for lack of a better
-         * alternative.
+         * stack address as the native path.
          */
-        mov     $0x1000, %esp
+        mov     %ebx, %esp
+        pop     %edx
 
         /* Calculate the load base address. */
         call    1f
 1:      pop     %esi
         sub     $sym_offs(1b), %esi
 
+        /* Restore clobbered magic field */
+        push    %edx
+
         /* Set up stack. */
         lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
 
@@ -463,18 +466,21 @@ __start:
          * relocatable images, where one push/pop is required to calculate
          * images load address.
          *
-         * On a BIOS-based system, the IVT and BDA occupy the first 5/16ths of
-         * the first page of RAM, with the rest free for use.  Use the top of
-         * this page for a temporary stack, being one of the safest locations
-         * to clobber.
+         * Save and restore the magic field of start_info in ebx, and use
+         * that as the stack. See also
+         * https://lore.kernel.org/xen-devel/20240814195053.5564-3-jason.andryuk@amd.com/
          */
-        mov     $0x1000, %esp
+        mov     %ebx, %esp
+        pop     %edx
 
         /* Calculate the load base address. */
         call    1f
 1:      pop     %esi
         sub     $sym_offs(1b), %esi
 
+        /* Restore clobbered magic field */
+        push    %edx
+
         /* Set up stack. */
         lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
 
-- 
2.46.0


