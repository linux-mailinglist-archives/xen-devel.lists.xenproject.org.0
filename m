Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011069768AB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 14:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797377.1207301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soiaS-0000O6-J9; Thu, 12 Sep 2024 12:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797377.1207301; Thu, 12 Sep 2024 12:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soiaS-0000Lg-GD; Thu, 12 Sep 2024 12:06:12 +0000
Received: by outflank-mailman (input) for mailman id 797377;
 Thu, 12 Sep 2024 12:06:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDyH=QK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1soiaR-0000La-Mw
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 12:06:11 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63bcc248-70ff-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 14:06:06 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d13b83511so105114966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 05:06:06 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c727e4sm736744766b.126.2024.09.12.05.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 05:06:04 -0700 (PDT)
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
X-Inumbo-ID: 63bcc248-70ff-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726142765; x=1726747565; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1avzml2gqf4G2aGZdxquF6dxjsb2OMfibeJnkpnGFDU=;
        b=XcXyHz5n7inb480NxtzUqwqDY74yxqYZLAyiLI9mtF3BU3TvnJzbqHbRab8kFuzDZx
         p9wbjtw0aQGfUIYHUnVZNIwoKmuuWXJgZyK1Sn2Hhp5ZJbTE0EPAi4vSCUC9rmmznigJ
         mN6vVnS5/pfvD1dtn1d2tKIeQJst8cXYY139U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726142765; x=1726747565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1avzml2gqf4G2aGZdxquF6dxjsb2OMfibeJnkpnGFDU=;
        b=PSR/mE4dNW5TYRvvIT66x6fkltjVZ2C+58l+Pr5+NRKMwYr07nGSLIpQ9/1GYxySzz
         eGAbLw55yeh7wb69tCd8W9kuwtI2OoMUz2HfK1Y2Sa7kFSscrEpYR3elMmWE3MP5DrOQ
         s4w8vG9Sr0zVj6hZ5gh16DGm2qfU6aaebHqKKSvQpFmyoHlXkq7q/VyBSl7ICrZqq6rO
         HyR/RHbYwUFyQkRinadzvnNT0+XrB3hm9zTQIrR2T/Axqh5GpLVWCua1ztD3H9F0CHG/
         4LpC7R+LK30NJJQku6GkU6AVzwcV9eWhjS85PHLe4AHGR1mWbLaBg/lStBCcpahYQLtT
         pmIA==
X-Gm-Message-State: AOJu0YyTeYKiD8QmSJ6c45aAdlUTkPqcJc2UpswT64lxvmSgwF3zsZUK
	lJ8uhwXsYpLkwuSLd0uiJSe261mD9W4pV8rVWVs9JtRNEMxjhY+UzI+U1FsDDByo6ABTXPjAO1d
	a
X-Google-Smtp-Source: AGHT+IH82cQ1XC0MzbJ73T++jFFH3TVwf2H0MbE7jfB5C0qg6KKBNE471TFj+vgthPpdRQ5sPwLXlA==
X-Received: by 2002:a17:906:c104:b0:a86:817e:d27a with SMTP id a640c23a62f3a-a9029678d5amr215785066b.61.1726142765243;
        Thu, 12 Sep 2024 05:06:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/hvm: Simplify stdvga_mem_accept() further
Date: Thu, 12 Sep 2024 13:06:02 +0100
Message-Id: <20240912120602.1677194-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

stdvga_mem_accept() is called on almost all IO emulations, and the
overwhelming likely answer is to reject the ioreq.  Simply rearranging the
expression yields an improvement:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-57 (-57)
  Function                                     old     new   delta
  stdvga_mem_accept                            109      52     -57

which is best explained looking at the disassembly:

  Before:                                                    After:
  f3 0f 1e fa           endbr64                              f3 0f 1e fa           endbr64
  0f b6 4e 1e           movzbl 0x1e(%rsi),%ecx            |  0f b6 46 1e           movzbl 0x1e(%rsi),%eax
  48 8b 16              mov    (%rsi),%rdx                |  31 d2                 xor    %edx,%edx
  f6 c1 40              test   $0x40,%cl                  |  a8 30                 test   $0x30,%al
  75 38                 jne    <stdvga_mem_accept+0x48>   |  75 23                 jne    <stdvga_mem_accept+0x31>
  31 c0                 xor    %eax,%eax                  <
  48 81 fa ff ff 09 00  cmp    $0x9ffff,%rdx              <
  76 26                 jbe    <stdvga_mem_accept+0x41>   <
  8b 46 14              mov    0x14(%rsi),%eax            <
  8b 7e 10              mov    0x10(%rsi),%edi            <
  48 0f af c7           imul   %rdi,%rax                  <
  48 8d 54 02 ff        lea    -0x1(%rdx,%rax,1),%rdx     <
  31 c0                 xor    %eax,%eax                  <
  48 81 fa ff ff 0b 00  cmp    $0xbffff,%rdx              <
  77 0c                 ja     <stdvga_mem_accept+0x41>   <
  83 e1 30              and    $0x30,%ecx                 <
  75 07                 jne    <stdvga_mem_accept+0x41>   <
  83 7e 10 01           cmpl   $0x1,0x10(%rsi)               83 7e 10 01           cmpl   $0x1,0x10(%rsi)
  0f 94 c0              sete   %al                        |  75 1d                 jne    <stdvga_mem_accept+0x31>
  c3                    ret                               |  48 8b 0e              mov    (%rsi),%rcx
  66 0f 1f 44 00 00     nopw   0x0(%rax,%rax,1)           |  48 81 f9 ff ff 09 00  cmp    $0x9ffff,%rcx
  8b 46 10              mov    0x10(%rsi),%eax            |  76 11                 jbe    <stdvga_mem_accept+0x31>
  8b 7e 14              mov    0x14(%rsi),%edi            |  8b 46 14              mov    0x14(%rsi),%eax
  49 89 d0              mov    %rdx,%r8                   |  48 8d 44 01 ff        lea    -0x1(%rcx,%rax,1),%rax
  48 83 e8 01           sub    $0x1,%rax                  |  48 3d ff ff 0b 00     cmp    $0xbffff,%rax
  48 8d 54 3a ff        lea    -0x1(%rdx,%rdi,1),%rdx     |  0f 96 c2              setbe  %dl
  48 0f af c7           imul   %rdi,%rax                  |  89 d0                 mov    %edx,%eax
  49 29 c0              sub    %rax,%r8                   <
  31 c0                 xor    %eax,%eax                  <
  49 81 f8 ff ff 09 00  cmp    $0x9ffff,%r8               <
  77 be                 ja     <stdvga_mem_accept+0x2a>   <
  c3                    ret                                  c3                    ret

By moving the "p->count != 1" check ahead of the
ioreq_mmio_{first,last}_byte() calls, both multiplies disappear along with a
lot of surrounding logic.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/stdvga.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index d38d30affbff..c3c43f59eead 100644
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -69,18 +69,14 @@ static int cf_check stdvga_mem_write(
 static bool cf_check stdvga_mem_accept(
     const struct hvm_io_handler *handler, const ioreq_t *p)
 {
-    if ( (ioreq_mmio_first_byte(p) < VGA_MEM_BASE) ||
+    /*
+     * Only accept single direct writes, as that's the only thing we can
+     * accelerate using buffered ioreq handling.
+     */
+    if ( p->dir != IOREQ_WRITE || p->data_is_ptr || p->count != 1 ||
+         (ioreq_mmio_first_byte(p) < VGA_MEM_BASE) ||
          (ioreq_mmio_last_byte(p) >= (VGA_MEM_BASE + VGA_MEM_SIZE)) )
-        return 0;
-
-    if ( p->dir != IOREQ_WRITE || p->data_is_ptr || p->count != 1 )
-    {
-        /*
-         * Only accept single direct writes, as that's the only thing we can
-         * accelerate using buffered ioreq handling.
-         */
         return false;
-    }
 
     return true;
 }

base-commit: 6e7f7a0c16c4d406bda6d4a900252ff63a7c5fad
-- 
2.39.2


