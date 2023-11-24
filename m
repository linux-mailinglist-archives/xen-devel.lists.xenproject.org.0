Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD9F7F71F5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:47:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640498.998817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Thx-00022i-Cs; Fri, 24 Nov 2023 10:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640498.998817; Fri, 24 Nov 2023 10:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Thx-0001zL-9i; Fri, 24 Nov 2023 10:46:49 +0000
Received: by outflank-mailman (input) for mailman id 640498;
 Fri, 24 Nov 2023 10:46:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTJ-0006hy-Cv
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:41 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7c33535-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:41 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a00b056ca38so243303466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:40 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:39 -0800 (PST)
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
X-Inumbo-ID: a7c33535-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821900; x=1701426700; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9g8XJvXceN+LKbnSsjmmA9nK3GbE+uM4xbSpxuIFeFA=;
        b=OWKBXiScXFjkE8ARZS7zfqGjv9pPMhMOGawWNYrsNHnMCk63u5V34Q5LeaeHX884eL
         aPNsUF98ajfwmHIiTRDxPINtIyiEVy9cm/XMGCEbAte1VewOglC1viOtIDWvuO/G5mo1
         VV+xVCI6p4mdp7SnNbuGbP+Nzc8maSVRZ1QzqzfSI6ZkeyB5FPK9RT7KHIQCK+krk32u
         SOGDNV/j8yvI4S+f4LoIPtbqLKnJP/lkIPCSgUHyP17O+tyXjEvlJhBqs/xS71xWkXM/
         KzvMdEYL529EhH4vYttuUX9Le7twtCaO+DVy5Ceg7EVgNwz4bNd+9dds0jDus6bKk2i8
         wIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821900; x=1701426700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9g8XJvXceN+LKbnSsjmmA9nK3GbE+uM4xbSpxuIFeFA=;
        b=nJJ9gA527tNVx/3kqKeCZGTrsA7b76W3EKrrumi/8/yXe/jr0+w/OqXvv82PPd/BuX
         uWeXS1aujbtCVaxHP7zNP14uD1tB4bH+B3sYve6zsY3yfZddxN6eJM91nrXZSVwV7dmv
         07+7DUl1VJMWgltQsnYVhLfZvdk7TtIiCmX9Em/fI0cPcrFhOt68U9KuD3QlrYzywO/F
         b7tt2Mt/GD2KnO+MHrrhMNtPLNDOanIadyBktZi8lrvo6P1KCW9mchPS0rXateOawkeb
         3frlghtRcP+GqfNCilt24MvNC3wZR/Ka8YeqLpmphIcW2pN38ZfSsEGL4kn4HokHL2j5
         r66g==
X-Gm-Message-State: AOJu0YzewTdy2rE2jpdivfEcHTTHYiGlRsZEbvLWr6lU87VMpQ4RiSO3
	kkK4Jz+M0W/oYICNimz0MLM6gk7UxqWzYQ==
X-Google-Smtp-Source: AGHT+IFkhEVq1Zkgib05dna2HJ+QkOBxYxZNOJFEkC8rVWydgHS3i40ZDia5EJjHZwgOtC4fN8rAAQ==
X-Received: by 2002:a17:906:218:b0:9de:24d:f245 with SMTP id 24-20020a170906021800b009de024df245mr1426447ejd.12.1700821900174;
        Fri, 24 Nov 2023 02:31:40 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 29/39] xen/riscv: add definition of __read_mostly
Date: Fri, 24 Nov 2023 12:30:49 +0200
Message-ID: <7fec1c9f906ee120ebae606de59f9f70efb79aff.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of __read_mostly should be removed in:
https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/

The patch introduces it in arch-specific header to not
block enabling of full Xen build for RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 - update the commit message
---
 xen/arch/riscv/include/asm/cache.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
index 69573eb051..94bd94db53 100644
--- a/xen/arch/riscv/include/asm/cache.h
+++ b/xen/arch/riscv/include/asm/cache.h
@@ -3,4 +3,6 @@
 #ifndef _ASM_RISCV_CACHE_H
 #define _ASM_RISCV_CACHE_H
 
+#define __read_mostly __section(".data.read_mostly")
+
 #endif /* _ASM_RISCV_CACHE_H */
-- 
2.42.0


