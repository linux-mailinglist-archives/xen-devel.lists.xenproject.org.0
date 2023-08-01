Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1526476A7D1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 06:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573526.898504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgqc-0001yb-PN; Tue, 01 Aug 2023 04:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573526.898504; Tue, 01 Aug 2023 04:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgqc-0001wG-Ln; Tue, 01 Aug 2023 04:19:02 +0000
Received: by outflank-mailman (input) for mailman id 573526;
 Tue, 01 Aug 2023 00:13:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4lv=DS=gmail.com=raj.khem@srs-se1.protection.inumbo.net>)
 id 1qQd17-0007Yy-4m
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 00:13:37 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 414c6172-3000-11ee-b257-6b7b168915f2;
 Tue, 01 Aug 2023 02:13:35 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1bba54f7eefso39462175ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 17:13:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ea8300b001b8c3c7b102sm9160290plb.127.2023.07.31.17.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 17:13:33 -0700 (PDT)
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
X-Inumbo-ID: 414c6172-3000-11ee-b257-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690848814; x=1691453614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUFItuirOVPJCbtBystcht3mbxhNZnp6hC1vcTbgIWQ=;
        b=g4l/cMUxkTocSYYbqSa4Kr4GL8OndltKGe18dhbWtXXBcu5LRWbh3iWJMnbCSrNhuP
         s1qwEb0i+pxo8jDwEBf9XhgHt0VGOqnpLjNJIzELUN8ByoPHGzDA3rChjSBQCjJuTNmO
         Q81WoR1YVrlUtHtRKRIBlLV9bBGTC/yrWxF2Ozor+1MckGk6KRmfW9KRz78lDhrLOKmV
         sKt+WaexQHGwOEN1QWpLP+aBaGqkdCH/GkNejNIopkvclCfdOs1llwq21oN9DiXeaJAP
         mAHuUG0E++qzUwbvR3Nd8q0rIRs2+ZYx+/4I5452Cyk3RO8dIV2ee4N6IMsX1w44n8O/
         FgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690848814; x=1691453614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUFItuirOVPJCbtBystcht3mbxhNZnp6hC1vcTbgIWQ=;
        b=i7pSGFUmaGKdxcCbKcxmGQZFDtf/DGhE4TdQO+dDESbFJe1TAWUUozL1oc5YqOudhp
         m6bNdID2dxe+czj59l4nBMAMBLmpkTLXZkcqShEkwJqPvlfK/ewmJKLAdLWHVAUlQjVb
         FOkX0LiRKVA4pAx37o74eQOVVAkXJLGGcVcn0ywIWnBxU4LNtwj2Ra2Rcgqk3/RJUOVe
         z4K/veP2dnywXH7K96Y2Skkk+qLWyaYSzCJnquUtglRJBberGrpwPUaATVHI/25izqNO
         KMeTfsRoiUCNaX8ELEG1R4yq7Vr/l6DKR72FkzRcgrVhSa0kxCKi6BWuudzADr3YKYoS
         63IQ==
X-Gm-Message-State: ABy/qLbYr3pYFrlsMBKKWjidj5OB+aXYLKjlCI8cokSEUHY7af1fKilM
	v2hzB9zKHjnHFNVsipJJDcs4ErAILBl7sg==
X-Google-Smtp-Source: APBJJlH7rAUhoXCdbru0CWT/GEfhYM8bsWPRlsV0sb/xjZ8HY3XcI0zymX5ckofHgoeAbv0RwdsROA==
X-Received: by 2002:a17:902:e5c5:b0:1b2:676d:1143 with SMTP id u5-20020a170902e5c500b001b2676d1143mr15089937plf.15.1690848813956;
        Mon, 31 Jul 2023 17:13:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] arm32: Avoid using solaris syntax for .section directive
Date: Mon, 31 Jul 2023 17:12:58 -0700
Message-ID: <20230801001258.555944-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assembler from binutils 2.41 rejects this syntax

.section "name"[, flags...]

where flags could be #alloc, #write, #execstr
Switch to using ELF syntax

.section name[, "flags"[, @type]]

[1] https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html#SEC119

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 xen/arch/arm/arm32/proc-v7.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
index c90a31d80f..6d3d19b873 100644
--- a/xen/arch/arm/arm32/proc-v7.S
+++ b/xen/arch/arm/arm32/proc-v7.S
@@ -29,7 +29,7 @@ brahma15mp_init:
         mcr   CP32(r0, ACTLR)
         mov   pc, lr
 
-        .section ".proc.info", #alloc
+        .section .proc.info, "a"
         .type __v7_ca15mp_proc_info, #object
 __v7_ca15mp_proc_info:
         .long 0x410FC0F0             /* Cortex-A15 */
@@ -38,7 +38,7 @@ __v7_ca15mp_proc_info:
         .long caxx_processor
         .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
 
-        .section ".proc.info", #alloc
+        .section .proc.info, "a"
         .type __v7_ca7mp_proc_info, #object
 __v7_ca7mp_proc_info:
         .long 0x410FC070             /* Cortex-A7 */
@@ -47,7 +47,7 @@ __v7_ca7mp_proc_info:
         .long caxx_processor
         .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
 
-        .section ".proc.info", #alloc
+        .section .proc.info, "a"
         .type __v7_brahma15mp_proc_info, #object
 __v7_brahma15mp_proc_info:
         .long 0x420F00F0             /* Broadcom Brahma-B15 */
-- 
2.41.0


