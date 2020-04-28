Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF561BB692
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 08:31:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTJlW-0000F2-5g; Tue, 28 Apr 2020 06:30:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wX7d=6M=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jTJkl-0007z5-Ly
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 06:29:59 +0000
X-Inumbo-ID: aea86df2-8919-11ea-b07b-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aea86df2-8919-11ea-b07b-bc764e2007e4;
 Tue, 28 Apr 2020 06:29:59 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x4so1372373wmj.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 23:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/xdW9TlF14cno7Dox1YULYIivWRvz4pvd3kbVi7j+L4=;
 b=LFE04p88MpHoPldLuBL/ef/Ua1bNp9e+y/AioN8MiM9U5SHhMHb2oaOuIHdrgUrfvp
 OwWz5i3q1Tu4LjPp1sZH+uewJSXti8ttRSe8d4o4Yu9774I62ekPt4PWwGGhSWeKwURe
 Ujhqmqn4J7uo8NwSOeHNm7zB07nEI89ZLHKzkvQ6aAibNYyiRGvStPM8fWwvmlIgeLf0
 kL5lPAGouNRIDqC54gdYhcUeIT8+TvQlmoaylTU7gdf5GOflOAULoHvyg0STXeW1JqD2
 b3Wb8+3KZ0w1uJGCNf8Yoy4RhiJJW0ZhIBUJTUGabjsPKXlvUQHvXTzw9rBHXagIZJky
 8iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/xdW9TlF14cno7Dox1YULYIivWRvz4pvd3kbVi7j+L4=;
 b=RQ+aRrLA2DpPXB1QVykAnR26xrUDjC0lGMb0qPmX/x6uW0Re9tV1UZn5BlVK+XZ85E
 E5To4QvS9hjJ15zHwQ25u7QSPYRWta0Uz91/CGKEXuoPkw7BhUMUsyGCDncAtYTPJKGz
 LqYtvBHq7FwvV4wepJhoF+CUwAzj61/3MXYTrn3kX/hxTdCtsAkLh8xaQ1Q5f/K1qAUB
 xDc5AlmDuWgnij1cDBwVRnp00wMqNAGagzSon6vAiNJR/aaY18pB1NKO3B7uJqO4MCNc
 TFdiGc8ygkQ4GVAsAWbMFN/Y2khc93LtB2R+g289RmXCYnlbuV5qxg/8s7PbO/gOVpXA
 /GJg==
X-Gm-Message-State: AGi0PubY9upUSytV46+pHkCCcZl0puaKxYSJ3DRjCUbm9hwM25WYkkBU
 3pT5t2ZJoAPVcautz2iD6sw=
X-Google-Smtp-Source: APiQypJjAWImZKi6yyETe7bMvdVFmRMyX+Q/xhJCHdWzOGMOtz5pIllYGMr6MRFpzeCK7ibGxixnWw==
X-Received: by 2002:a1c:8106:: with SMTP id c6mr2746244wmd.88.1588055398259;
 Mon, 27 Apr 2020 23:29:58 -0700 (PDT)
Received: from localhost.localdomain (public-gprs351065.centertel.pl.
 [37.47.2.154])
 by smtp.gmail.com with ESMTPSA id a205sm2030564wmh.29.2020.04.27.23.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 23:29:57 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] Fix undefined behaviour
Date: Tue, 28 Apr 2020 06:28:46 +0000
Message-Id: <20200428062847.7764-2-gorbak25@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200428062847.7764-1-gorbak25@gmail.com>
References: <20200428062847.7764-1-gorbak25@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 28 Apr 2020 06:30:43 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: artur@puzio.waw.pl, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, jakub@bartmin.ski,
 marmarek@invisiblethingslab.com, Grzegorz Uriasz <gorbak25@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
---
 hw/xen/xen_pt_load_rom.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
index a50a80837e..9f100dc159 100644
--- a/hw/xen/xen_pt_load_rom.c
+++ b/hw/xen/xen_pt_load_rom.c
@@ -38,12 +38,12 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
     fp = fopen(rom_file, "r+");
     if (fp == NULL) {
         if (errno != ENOENT) {
-            error_report("pci-assign: Cannot open %s: %s", rom_file, strerror(errno));
+            warn_report("pci-assign: Cannot open %s: %s", rom_file, strerror(errno));
         }
         return NULL;
     }
     if (fstat(fileno(fp), &st) == -1) {
-        error_report("pci-assign: Cannot stat %s: %s", rom_file, strerror(errno));
+        warn_report("pci-assign: Cannot stat %s: %s", rom_file, strerror(errno));
         goto close_rom;
     }
 
@@ -59,10 +59,9 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
     memset(ptr, 0xff, st.st_size);
 
     if (!fread(ptr, 1, st.st_size, fp)) {
-        error_report("pci-assign: Cannot read from host %s", rom_file);
-        error_printf("Device option ROM contents are probably invalid "
-                     "(check dmesg).\nSkip option ROM probe with rombar=0, "
-                     "or load from file with romfile=\n");
+        warn_report("pci-assign: Cannot read from host %s", rom_file);
+        memory_region_unref(&dev->rom);
+        ptr = NULL;
         goto close_rom;
     }
 
-- 
2.26.1


