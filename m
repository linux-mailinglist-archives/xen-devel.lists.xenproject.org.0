Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2CE9A052D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819722.1233148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t108U-00058S-3n; Wed, 16 Oct 2024 09:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819722.1233148; Wed, 16 Oct 2024 09:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t108T-00055e-UG; Wed, 16 Oct 2024 09:16:05 +0000
Received: by outflank-mailman (input) for mailman id 819722;
 Wed, 16 Oct 2024 09:16:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8GJ6=RM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t108S-0004r9-UK
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:16:04 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44274d92-8b9f-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 11:16:03 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2fb59652cb9so22534091fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:16:03 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a000129eesm391451e87.259.2024.10.16.02.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:16:00 -0700 (PDT)
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
X-Inumbo-ID: 44274d92-8b9f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729070161; x=1729674961; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUi2WJJTrylVj2kHi62rhC3wT5w2qKiq8sfSJLHijNw=;
        b=OLfcMp6jd2wJO/AI0zZN8EKwpcGZWnN91cXbiVSQurhvxjfxfoHL5Zw61726NK1cnf
         Sy70v2dmbMhH+hBvctyKPi+WLd6B2e83TF/yQOOMYpBYwRQ4e/iTucHubSeFDbNFe//+
         9mz1Wk2Vuag+Xv7Ry4c5r+h2z4qoJB7eUck/9vN5YDjKaeEY6x8aK72NQINoc8hZNgd/
         Bgry8MDOGjilT7nHrDtaXsmzJyKJwTfDvJcUE6Tw/iLJ5XEE82AUDB5lv97j9ICys0wv
         GPdeHtjlLZxGWGFjNF7H5nE6PhothGPUAh4277Epf2jv0CvwUe8xj8H3EHJhklOr0eEW
         4bIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070161; x=1729674961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUi2WJJTrylVj2kHi62rhC3wT5w2qKiq8sfSJLHijNw=;
        b=oeq0c166YrWarczeVLbMAhyN3hS0oMsx09nCFlMQYTU1J1+vBvQitusJ/vXNVGYE88
         dWvrguzlKTNNPdmoBVdRDOW8QIyxfIrJ/9lRI2aQ2QpXM6F3dcUcCxzidq6x0pjjf1OG
         Np+5fkpO8vV1G9wUFyc98GxjlWdyXNctLwmeaHLYc99xeZZcNeBJAxJq4PJ+RVfGGhS6
         3hMya0lb+b00Ubg7nUMcXGjvo5efB2ZmgROtw1lxeUH1EtVTPEI2edZ6vvGznGHZ8ggx
         x8ZGPJXHjEsw7yU6dfI9eY8Q1oNrA2v7LW4d0TKYYZ8uMzQ4GT6Gr+MWAuH0aXnVHJqm
         AyZQ==
X-Gm-Message-State: AOJu0YwDPq8CCLz9ftLrWSZF7MgS5RKMCnoFMO9+sbrh0IbvFyScmLWW
	npKS42OY1L+ZINMcQfsoZP7VTZxmYihS8obMxvxCZTzC8RHC538Hw2Qbmw==
X-Google-Smtp-Source: AGHT+IER3QcgvTjxn2/fyXoLjy8xB7tf/OJVdzSVEvhg72jqpoBa/NoQ/kGK1cJewxHeYkXQQOSFOg==
X-Received: by 2002:a05:6512:6d2:b0:539:f4c1:71d3 with SMTP id 2adb3069b0e04-539f4c17406mr6039710e87.29.1729070161226;
        Wed, 16 Oct 2024 02:16:01 -0700 (PDT)
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
Subject: [PATCH v1 1/5] xen/riscv: add stub for share_xen_page_with_guest()
Date: Wed, 16 Oct 2024 11:15:53 +0200
Message-ID: <3dfd4bdf6584e73ecdbff5a66fdbaec68e31cc3c.1729068334.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729068334.git.oleksii.kurochko@gmail.com>
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To avoid the following linkage fail the stub for share_xen_page_with_guest()
is introduced:
  riscv64-linux-gnu-ld: prelink.o: in function `tasklet_kill':
  /build/xen/common/tasklet.c:176: undefined reference to `share_xen_page_with_guest'
  riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `share_xen_page_with_guest' isn't defined
  riscv64-linux-gnu-ld: final link failed: bad value

$ find . -name \*.o | while read F; do nm $F | grep share_xen_page_with_guest && echo $F; done
                 U share_xen_page_with_guest
./xen/common/built_in.o
                 U share_xen_page_with_guest
./xen/common/trace.o
                 U share_xen_page_with_guest
./xen/prelink.o

Despite the linker fingering tasklet.c (very likely a toolchain bug),
it's trace.o which has the undefined reference.

Looking at trace.i, there is call of share_xen_page_with_guest() in
share_xen_page_with_privileged_guests() from asm/mm.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/stubs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 5951b0ce91..c9a590b225 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -2,7 +2,9 @@
 #include <xen/cpumask.h>
 #include <xen/domain.h>
 #include <xen/irq.h>
+#include <xen/mm.h>
 #include <xen/nodemask.h>
+#include <xen/sched.h>
 #include <xen/sections.h>
 #include <xen/time.h>
 #include <public/domctl.h>
@@ -409,3 +411,11 @@ unsigned long get_upper_mfn_bound(void)
 {
     BUG_ON("unimplemented");
 }
+
+/* mm.c */
+
+void share_xen_page_with_guest(struct page_info *page, struct domain *d,
+                               enum XENSHARE_flags flags)
+{
+    BUG_ON("unimplemented");
+}
-- 
2.47.0


