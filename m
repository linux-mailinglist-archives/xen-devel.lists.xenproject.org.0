Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF18568773
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 13:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362177.592135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93e0-0005RO-Qb; Wed, 06 Jul 2022 11:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362177.592135; Wed, 06 Jul 2022 11:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93e0-0005On-Nr; Wed, 06 Jul 2022 11:56:36 +0000
Received: by outflank-mailman (input) for mailman id 362177;
 Wed, 06 Jul 2022 11:56:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mwIU=XL=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o93dz-0005Ob-2Z
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 11:56:35 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae65c62f-fd22-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 13:56:34 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id o4so21733252wrh.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jul 2022 04:56:34 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 m9-20020a05600c3b0900b003a04d19dab3sm24634680wms.3.2022.07.06.04.56.32
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 04:56:32 -0700 (PDT)
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
X-Inumbo-ID: ae65c62f-fd22-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w2XRrjOrjpaz12Jeqf1YAACZjWuCue/f9szg5gZlJPQ=;
        b=IZHysttEe7MEPbju0JlvAoUIGig3WPZzCZLJeuYGs1rPsxY9YE4tCcD3uZrZ9e4ay1
         hr1Kxonrr6HjRjvHZJu7Qd/ZfFeb6f2DCXLEAR/nIm4cziU4XN+YJkGCZ9sexXkEBCbR
         at4yAa4jQ2dEFxPTvaduCWFe1f2N/7W15nH9q+pC71/GeSzt3REH7KGtPDro2IHw/E7A
         zxup0qNJundQP6y9fdu+wZfypO8Q4ohxIWtXczSM+LvsdtTHlW8gizUowxmrI5YXZdNd
         1aqfKMOCoJv/SoEYlOuLSj59np239ZRlL/9rwQleU842M8TmYplBeCeoPnFvJamGM8hp
         OaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w2XRrjOrjpaz12Jeqf1YAACZjWuCue/f9szg5gZlJPQ=;
        b=FcyL6DyitZYXNyX3mPEDdmZqLqPi+Lh7pomsTQ7Mdr09f9b15VuGjs7/nlF0B9UDKo
         m7T2MDwF/3j6dV8RX4bviVnrwPQa5GgpYWBzE5DH4o2olbmAWzd4SFU8uCNbaGyBw7eh
         kCMHDKG73L+I+qkOPNgOjQc+6yex4jKkfiWX3woOjoUIzx8+gbdEqgEaGtaCvXVUU+LD
         n56dqbvO3kY/WSykSiRWBCJGctmrL/gZyM5A266D7cbehzJED6wsAWEkJ3KysxVnBt1F
         sCCOAEfo8PfjVcaiNl3yDBFyCVszVUtahR2mOrYbkfnJevXaNW0OAOBCQM23lCP1pBsz
         rvUA==
X-Gm-Message-State: AJIora9hyG13DQUwY7c5SMnNcinmLXgRK4BaxGkI/nE+UQSYejWphEwX
	G9JLPnOkUn8SNMF0GjylVlWMYPNroGI=
X-Google-Smtp-Source: AGRyM1tnte5FApRyJIN9lWoXQzVY9CNfJ2DbDEOo3Uf1WWjqhQu0crczUM/SAf3Km7lvqTEBS8VvhQ==
X-Received: by 2002:adf:fd02:0:b0:21d:6f22:7857 with SMTP id e2-20020adffd02000000b0021d6f227857mr10506054wrr.633.1657108593186;
        Wed, 06 Jul 2022 04:56:33 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violation
Date: Wed,  6 Jul 2022 14:56:31 +0300
Message-Id: <20220706115631.654544-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the function prototype of show_stack() in <asm/processor.h> header file
so that it is visible before its definition in traps.c.

Although show_stack() is referenced only in traps.c, it is declared with
external linkage because, during development, it is often called also by
other files for debugging purposes. Declaring it static would increase
development effort. Add appropriate comment

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
Changes in v2:
- add a new line after show_stack() to make obvious to which set of functions
the comment is referring to.

 xen/arch/arm/include/asm/processor.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 4188ec6bfb..55f56b33bc 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -558,7 +558,10 @@ extern register_t __cpu_logical_map[];
 void panic_PAR(uint64_t par);
 
 void show_execution_state(const struct cpu_user_regs *regs);
+/* Debugging functions are declared with external linkage to aid development. */
 void show_registers(const struct cpu_user_regs *regs);
+void show_stack(const struct cpu_user_regs *regs);
+
 //#define dump_execution_state() run_in_exception_handler(show_execution_state)
 #define dump_execution_state() WARN()
 
-- 
2.34.1


