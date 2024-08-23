Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8BB95D3FE
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 19:05:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782503.1192018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXjN-0004wJ-0L; Fri, 23 Aug 2024 17:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782503.1192018; Fri, 23 Aug 2024 17:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXjM-0004tb-TV; Fri, 23 Aug 2024 17:05:44 +0000
Received: by outflank-mailman (input) for mailman id 782503;
 Fri, 23 Aug 2024 17:05:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kBLJ=PW=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1shXjL-0004r8-Kc
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 17:05:43 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed7acc3a-6171-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 19:05:41 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso3577961a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 10:05:41 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3eb329sm2311240a12.55.2024.08.23.10.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 10:05:40 -0700 (PDT)
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
X-Inumbo-ID: ed7acc3a-6171-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724432741; x=1725037541; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFEkl0EMoN1DvmJO1HoJ/u/U+K3mFLD5lcEOzlHVel4=;
        b=UCiVZZg1bJTFmbBpU01imLK7TmyVi6D7DcnZTx7wKIuD96xdWYUsByjyuz0WnEdtV3
         CAbLLrZUdXazikE81I3kXtlQNyKJ6a68RgPfg500e6Xk5zeTDMBhoBa8a9FkWkL4MW4O
         R4ACI+WozH06pXnqWrXckRKhdMomE9pTyOB+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724432741; x=1725037541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFEkl0EMoN1DvmJO1HoJ/u/U+K3mFLD5lcEOzlHVel4=;
        b=XgedvPSjn7u+qBt2XJdxyDjRR0WUSuT/70psMKpwXyZI3FMD1ZyKzwALPnegjHi3eb
         IlD9AQ5RCn1dogG0pd10pc+xo6R7ykv84irbyr+NfKAvZ8MFY2Y98DNUm5a6kyMPDHcF
         Y6iOAIltMxPDnpSrhTY9xmzbxaXqzP3xWk8LO2EadnUR7YEQE79HjniFCp2+MaJldRCL
         SCzTWkPB3cvGXHXW5g/3xFQQ52mVw4g4uTuBGh84WUsA7ChxVsFTobotdQBlDc59WhUc
         NiKeLjQBCl4hCUqBKyTMk3aYnjMzoAYmpne4MjcdkYavXoVpE7ajUzmmKA8uCaoxgWnJ
         Pbww==
X-Gm-Message-State: AOJu0YzYaM/0eaq2BaQOOLc46oe+1EL8ZMPFKc6LgPjU0y2OIRNi/ZsO
	Xa3tHDUpTAGn5BhiSXsUknJwd8Oqc4ZrqK8ej3RvcG6foJZzy/PD0UeLi4ut3P3ghekzvLM+KJB
	7
X-Google-Smtp-Source: AGHT+IH6FyymKyCPUj5/UdPZsLtONLq48URxhfGe+UappiQ0B70aRoGrd/MjeFqdgoKUW8HST4a5Pg==
X-Received: by 2002:a05:6402:1d49:b0:5a2:fc48:db12 with SMTP id 4fb4d7f45d1cf-5c0891758d1mr2240292a12.19.1724432740912;
        Fri, 23 Aug 2024 10:05:40 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	Javi Merino <javi.merino@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2 2/3] libxl: Remove unnecessary buffer zeroing and zalloc()
Date: Fri, 23 Aug 2024 18:05:04 +0100
Message-ID: <ab2cb7430109e345ed6a294d9e8b2329bb373d2a.1724430173.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1724430173.git.javi.merino@cloud.com>
References: <cover.1724430173.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When reading the console, xen overwrites the contents of the buffer,
so there is no need to zero the buffer before passing it to xen.
Instead, add a NULL at the end of the buffer.

While we are at it, change the zalloc() of the buffer back to
malloc() as it was before bdf4131 (libxl: don't leak buf in
libxl_xen_console_read_start error handling, 2013-12-03).  The comment
in that commit message says that the intent of the commit was to
change malloc+memset to zalloc(), but only for the
libxl_xen_console_reader struct, not for the buffer.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 tools/libs/light/libxl_console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
index 012fd996fba9..f42f6a51ee6f 100644
--- a/tools/libs/light/libxl_console.c
+++ b/tools/libs/light/libxl_console.c
@@ -780,7 +780,7 @@ libxl_xen_console_reader *
     unsigned int size = 16384 + 1;
 
     cr = libxl__zalloc(NOGC, sizeof(libxl_xen_console_reader));
-    cr->buffer = libxl__zalloc(NOGC, size);
+    cr->buffer = libxl__malloc(NOGC, size);
     cr->size = size;
     cr->clear = clear;
     cr->incremental = 1;
@@ -808,7 +808,6 @@ int libxl_xen_console_read_line(libxl_ctx *ctx,
     unsigned int nr_chars = cr->size - 1;
     GC_INIT(ctx);
 
-    memset(cr->buffer, 0, cr->size);
     ret = xc_readconsolering(ctx->xch, cr->buffer, &nr_chars,
                              cr->clear, cr->incremental, &cr->index);
     if (ret < 0) {
@@ -818,6 +817,7 @@ int libxl_xen_console_read_line(libxl_ctx *ctx,
     }
     if (!ret) {
         if (nr_chars) {
+            cr->buffer[nr_chars] = '\0';
             *line_r = cr->buffer;
             ret = 1;
         } else {
-- 
2.45.2


