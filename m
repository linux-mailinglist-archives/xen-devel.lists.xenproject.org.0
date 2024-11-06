Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E39BE5D3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 12:42:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830782.1245881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eQK-00088d-3i; Wed, 06 Nov 2024 11:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830782.1245881; Wed, 06 Nov 2024 11:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eQK-00086D-0o; Wed, 06 Nov 2024 11:42:08 +0000
Received: by outflank-mailman (input) for mailman id 830782;
 Wed, 06 Nov 2024 11:42:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nbp=SB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8eQI-0007RL-Cl
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 11:42:06 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2436fafd-9c34-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 12:42:03 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37d447de11dso5035966f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 03:42:03 -0800 (PST)
Received: from fziglio-desktop.lan (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e7465sm18840783f8f.53.2024.11.06.03.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 03:42:02 -0800 (PST)
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
X-Inumbo-ID: 2436fafd-9c34-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzUiLCJoZWxvIjoibWFpbC13cjEteDQzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI0MzZmYWZkLTljMzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODkzMzIzLjM1NDM2Nywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730893322; x=1731498122; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMi0+FOW37XSiIpmJo9yDY5hKngxNrldiecxy5czma8=;
        b=FWItkgwT5PVvTxvtaicZroIZynwnZSAPU5Kdo7JJ4TBbiooKy2/QP8+b8crtAaCMYC
         8UeNDaT7++vh5wGlZjS+5fV+NhmZbnhv1Mg0iNOiJmK3FHVO4n9seCZVZo47ujsCV8cr
         i7Rmb0bN+aGFBPKbIWKffmCF+leCel31E+SI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730893322; x=1731498122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMi0+FOW37XSiIpmJo9yDY5hKngxNrldiecxy5czma8=;
        b=kszxBd9SOvb/obITSBWmPnceBMd4v1WzEKcioD36mknOwO8GKbKCN3OyXSJJhUN6tU
         kvGG1KMIMBgoG06Vzt3MoSvBeWcDo4nPg5qcV2AlSf+k4BWQXcu1Kqn5OXyu73Uu3Cjo
         US0D1XB40YCdHobC37cQ3TPy5AEveLc+TjizLgOnpIWnlh43CoU/2Wc1xCfpCNuVj5Cs
         3eWfeWkWoN9RXIf2Xmrf7ARlEFcgqMODJeiXOxZc/9lqkfbRCFYL1SFIvBWmBCcvc65y
         IeA1wH0PWjnPliju8sUS0W93380XV4dBVjNBWSVXCNV+esvgZyTWjS+yNE72xUOrhUhL
         HQpg==
X-Gm-Message-State: AOJu0Yyw/UZ0OBf4FkYS6wE48XaRDcgExOA5B70AF3oGWdapi+hKQWRr
	s9qAXM1vuTuAnT2qD9pPsqaRj3rE8LkhlRO0AbfNsO7/HV+esGLQ2w3aQA80dRoj/H1f+RJRO2O
	n6HA=
X-Google-Smtp-Source: AGHT+IGJpNvzHflsKJ3yMWA/g3GWreDCCpsXVONWpKrd2U0D7czGn7NehhOveo3/szy/NQY6a7X/Gw==
X-Received: by 2002:a5d:584a:0:b0:371:8eb3:603a with SMTP id ffacd0b85a97d-381be7d6144mr21054824f8f.27.1730893322493;
        Wed, 06 Nov 2024 03:42:02 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/3] x86/boot: Fix build with LLVM toolchain
Date: Wed,  6 Nov 2024 11:41:50 +0000
Message-Id: <20241106114150.1432512-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106114150.1432512-1-frediano.ziglio@cloud.com>
References: <20241106114150.1432512-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This toolchain generates different object files.
Object have 3 additional sections which must be handled by the
linker script.
Added sections need to have special type so we put them in
separate sections as linker will copy type from input sections.

Fixes: aa9045e77130 ('x86/boot: Rework how 32bit C is linked/included for early boot')

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/build32.lds.S | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index 9b29f0184f..1e59732edd 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -66,6 +66,15 @@ SECTIONS
        *(.comment.*)
        *(.note.*)
   }
+  .shstrtab : {
+       *(.shstrtab)
+  }
+  .strtab : {
+       *(.strtab)
+  }
+  .symtab : {
+       *(.symtab)
+  }
   /* Dynamic linkage sections.  Collected simply so we can check they're empty. */
   .got : {
         *(.got)
-- 
2.34.1


