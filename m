Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE0F6A21BF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501415.773173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9D-0002Mz-4L; Fri, 24 Feb 2023 18:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501415.773173; Fri, 24 Feb 2023 18:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9D-0002JF-1M; Fri, 24 Feb 2023 18:50:23 +0000
Received: by outflank-mailman (input) for mailman id 501415;
 Fri, 24 Feb 2023 18:50:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd9B-0001Wv-8v
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:21 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16941704-b474-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 19:50:20 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id o12so973145edb.9
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:20 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:19 -0800 (PST)
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
X-Inumbo-ID: 16941704-b474-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVRXkyrkP5QFPLk14BArykZPkRsSPQyM5ImGy6R3Rls=;
        b=H8CE5B8FtW7HBZUNB+eEIqli2ySexAbCBkHo2Fe4zsCgCRi+7hbLECKFyq8YQSxQzE
         i0fegid+8lkZ0/klzpIRgXk1CNkLYT4w1ehKTQDW9pl2sZ5eP8gr60HhyOjGug72FJWo
         W9ViG/CDuQ8iZNAZRy0it6FCzximnW+dQR3zm9xscua7kzystn+nrm5gzrckwW/VklyB
         n3CjOJAg7bnyJ0CXGjR/GZLFg0Sy4knGYEQTjuBDuH87xQ1dKigbHFpHTklHyT0hBd9V
         5V+ucOrWm1ScdsuiUIhfotC1hyPmz/++IjqBYGZSx24gWJxKyszeOepdJZ3wFHlDiOCe
         oW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVRXkyrkP5QFPLk14BArykZPkRsSPQyM5ImGy6R3Rls=;
        b=44Hyhd2TMpvQE9qPVIc/rUvLGzhKIt01AqTfY7e684CBmN+YrbRpbI89AKcFLBQMkN
         qp1jHK30f4w4C8uMPiGL6zNJu3q8jTWnM2124FjtY22eBbJAm5eF0E3JKQW8WHs+2jAF
         6YzuNp3F/KGZghH5t2zNQKABo6726/ldxv/xZV8Z1fJMvf6W8FFrRmUGmc4hmIfexiUk
         eDltB7cHPvXpTZ1yw4hRWp7WMHA66XZriyQ8vkSqWUrCPLaQNxxF91kaEvDFCW9oKyHm
         lBYvF4PoYnVxDO9gE1NV9A4Zz9mToQfgQzk65+Rsj1PJzVXR0VF3Yut7frIGB8o/ajH7
         HMAQ==
X-Gm-Message-State: AO0yUKX+3EkBVBSZJIHeMsMSBPH3U2ea2Gt5at0P69t5vXQptTA6W7/Z
	xbtwWg6KKnnUNPBiWZWJ0D4ABfpP5U0=
X-Google-Smtp-Source: AK7set+TpHnuQ8SG+/zZz97KRpdgwMkSwKqi4YH0qqP0s+IJ7pgKT8ycsnrT0kWyENH+iIfTU+higg==
X-Received: by 2002:a17:906:8d0a:b0:8f2:62a9:6159 with SMTP id rv10-20020a1709068d0a00b008f262a96159mr5518393ejc.2.1677264620157;
        Fri, 24 Feb 2023 10:50:20 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 03/14] x86/svm: delete header asm/hvm/svm/intr.h
Date: Fri, 24 Feb 2023 20:49:59 +0200
Message-Id: <20230224185010.3692754-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete asm/hvm/svm/intr.h because it contains only the declaration of
svm_intr_assist() which is referenced only by assembly.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - new patch, suggested by Andrew

 xen/arch/x86/hvm/svm/intr.c             |  1 -
 xen/arch/x86/include/asm/hvm/svm/intr.h | 25 -------------------------
 2 files changed, 26 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/hvm/svm/intr.h

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 9525f35593..d21e930af0 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -29,7 +29,6 @@
 #include <asm/hvm/io.h>
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/svm/svm.h>
-#include <asm/hvm/svm/intr.h>
 #include <asm/hvm/nestedhvm.h> /* for nestedhvm_vcpu_in_guestmode */
 #include <asm/vm_event.h>
 #include <xen/event.h>
diff --git a/xen/arch/x86/include/asm/hvm/svm/intr.h b/xen/arch/x86/include/asm/hvm/svm/intr.h
deleted file mode 100644
index ae52d9f948..0000000000
--- a/xen/arch/x86/include/asm/hvm/svm/intr.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * intr.h: SVM Architecture related definitions
- * Copyright (c) 2005, AMD Corporation.
- * Copyright (c) 2004, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- *
- */
-
-#ifndef __ASM_X86_HVM_SVM_INTR_H__
-#define __ASM_X86_HVM_SVM_INTR_H__
-
-void svm_intr_assist(void);
-
-#endif /* __ASM_X86_HVM_SVM_INTR_H__ */
-- 
2.37.2


