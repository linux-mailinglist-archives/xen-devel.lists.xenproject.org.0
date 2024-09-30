Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A2798A841
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807458.1218945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI5V-0006Ry-NV; Mon, 30 Sep 2024 15:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807458.1218945; Mon, 30 Sep 2024 15:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI5V-0006Pn-Jb; Mon, 30 Sep 2024 15:13:25 +0000
Received: by outflank-mailman (input) for mailman id 807458;
 Mon, 30 Sep 2024 15:13:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svI5U-0006B5-Bw
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:13:24 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 887bc0ee-7f3e-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 17:13:22 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5398cc2fcb7so2120402e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:13:22 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5398fd3533asm677366e87.133.2024.09.30.08.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 08:13:21 -0700 (PDT)
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
X-Inumbo-ID: 887bc0ee-7f3e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727709202; x=1728314002; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Anb/qV3QvWfFTzlQtwYQiItrfm0IhRDXQls+NkaMkQ=;
        b=FtSmkNykxoUMPCFWPWIuayB2yYicM1bhqS0um/6JN1jbaWYNHsC0ynm8gXOimOw/+a
         Eh0mwjuAP+vviosueUcI1R+LKc12TQ3znl/I0zcW/TP3X6DZi0fg6wnnA9bNfoL2FqFC
         iBK4AWQYSz3v0mACXdkyksdMl00RopBf/rdUQs59Ih4UoWTuDd5k7RXFgAa3fMvq/OXV
         vgjeiYh5gMx7G4fKy5M6XSUuCQeTDP+ANFYhLYGexnL5LyLw9T0jRUQmDDtmdBuwsNHL
         mrONAG9K4XCC3cFiTVYMIA4FSpv/wci0Is1Hhcq4amqgghE2GGaypL2l/G8eDno1OodF
         KAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727709202; x=1728314002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Anb/qV3QvWfFTzlQtwYQiItrfm0IhRDXQls+NkaMkQ=;
        b=FVQYd/a5XfYTRtGHHQ5SgxRGD9NNYuUI0VDbUsq8QTY11Px6DkC4ZOAcvZadOJGZb5
         xKOSf8j5/D9Kby+3Xgq3yWfCali9RYoe1vPPURwR9DCP9KUyw38+s/n7pLACA3oPN6bN
         K8S7cr1B0W2WB6+RtxK8B9jqWX5kX9JLJUSxmIoEQJqvV8NS40H/88/Cobu5e1FxSiZo
         ToKu9IQzn3Z85vGnObRMh2dyU4SEjVzIwD+jXAu69+dT8hQ0AhW7KHV4l3Dz7pVBhTiw
         DUfURwD/wotBZb7uy/xUxMdzdB8+5Ubfffj00lbbjNgUSWLG772JRCQfUnEtw557IDf5
         hsfw==
X-Gm-Message-State: AOJu0YxsHyv0QuuxwVI4qa/rB6B2nH4nkqqwDO9C7fvY3edZLXqHCls8
	qx826kFHAp1DKNnxBjc34jVZV/vONvU/AmMD2UlDSxmlO5CycnZlZmbcCA==
X-Google-Smtp-Source: AGHT+IEvv/cClY1JjRAGYy2KS+jlTzv21dIRhvD6nZxZJJuE02sn9fbZEN6aMQVoJmUw1zoS5Rp+Ww==
X-Received: by 2002:a05:6512:3a89:b0:530:ab86:1e with SMTP id 2adb3069b0e04-5389fc33075mr6317279e87.6.1727709201568;
        Mon, 30 Sep 2024 08:13:21 -0700 (PDT)
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
Subject: [PATCH v1 1/2] xen/riscv: initialize bootinfo from dtb
Date: Mon, 30 Sep 2024 17:13:17 +0200
Message-ID: <f04a3cc3e543298f63845728c599410258a336ca.1727708956.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727708956.git.oleksii.kurochko@gmail.com>
References: <cover.1727708956.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse DTB during startup, allowing memory banks and reserved
memory regions to be set up, along with early device tree node
( chosen, "xen,domain", "reserved-memory", etc  ) handling.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 39375b3366..a8d8ef793d 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -28,6 +28,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
     struct bootmodule *xen_bootmodule;
+    size_t fdt_size;
 
     remove_identity_mapping();
 
@@ -54,6 +55,9 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     BUG_ON(!xen_bootmodule);
 
+    fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr);
+    BUG_ON(!fdt_size);
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.46.1


