Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87F7662213
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 10:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473465.734087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEong-0005f0-ER; Mon, 09 Jan 2023 09:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473465.734087; Mon, 09 Jan 2023 09:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEong-0005bz-Bt; Mon, 09 Jan 2023 09:50:40 +0000
Received: by outflank-mailman (input) for mailman id 473465;
 Mon, 09 Jan 2023 09:50:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEone-0005bt-UQ
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 09:50:38 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1118a50e-9003-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 10:50:37 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id bq39so12138925lfb.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 01:50:37 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512361000b004cb27d8edd1sm1535009lfs.85.2023.01.09.01.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 01:50:35 -0800 (PST)
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
X-Inumbo-ID: 1118a50e-9003-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Jj8LyZa6YPi4Y5Mz4SQwLw+I42jookzrxO26/BlN8E=;
        b=llpOJVMyHx+hqMj5pMpxIXiU+htmQ7fma61iraWV72ZjNHDWRIWSllbF+5ubvNGIfS
         K3l9U7PtOK5+zYjsGx9cpnpX0hjMLkMegvEaLrt9h8dxVcJoW0eiN1RUdgqn0+qVn1vb
         BnRK10fAYiohdPbq9dOmiiWbZD0ptqa7BX3ClMOdXwzJz8yVqMdsBjlwqECqh/tzZFGM
         3QG9JrWIBHDL2Xs1lVXwyDeWGLQtfE5C9RvyyVF++fI+ntJGuXbm1wr63ZU+qMvHSO01
         Q8ARP0/eziV9SerpRxMp0OBNJBcXKRV8d5jg0Di3wYWsGPGCoXPY8Sr0vTP9ihb2+flz
         FYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Jj8LyZa6YPi4Y5Mz4SQwLw+I42jookzrxO26/BlN8E=;
        b=P2cTZeTkiWpwOiEGzY61D8saRF3fDyNXHUhkg7FoofzHW4ykA3XEy1UHWKro/ZteJA
         1j3Z0UMloZ3R/Jfa3ZXNIO8bJ3BQnQhszDjra3tMl+dvPo9nTQgzuk9ceObwBWFumnTZ
         5MBA8W0T/PUCrEIu1tjc/Fr2NMRAhLNvFG/X2a9X5CEmHd90dVl6Q2UegSVCVR1XEcV3
         DAG5hrXcuetDTqjBZBAqCDi2cR5EHrr+fxit5TbyYuJffocZBQmaPVg1wzLwckoDBjLo
         D4mFlowRrb0D7JyNmNZYWIL1pL0wB+URKxrqc3mQgn4c37/4WU7azTjeNfPbyUIE7ONe
         ZukA==
X-Gm-Message-State: AFqh2kpqjK3Q+kXI8mfltGrw3uv1sQ1IObGMFJaBlwgBqKG1FFnsksE1
	EIp9JSuvwQJh7VI83Uglm5ErVy/c796gg1lP
X-Google-Smtp-Source: AMrXdXup80ZX2b/beLFfkhYOyCb8R29k7q8npzgK5+aPorkhb7HhFH98ZY/WPMv4yf4i0qwHpyHASQ==
X-Received: by 2002:a05:6512:2393:b0:4a4:68b9:1a00 with SMTP id c19-20020a056512239300b004a468b91a00mr21786223lfv.40.1673257835889;
        Mon, 09 Jan 2023 01:50:35 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] automation: add qemu-system-riscv to riscv64.dockerfile
Date: Mon,  9 Jan 2023 11:50:32 +0200
Message-Id: <8badde729e97ef6508204c5229199b7247c7a3da.1673257832.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qemu-system-riscv will be used to run RISC-V Xen binary and
gather logs for smoke tests.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/build/archlinux/riscv64.dockerfile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/build/archlinux/riscv64.dockerfile b/automation/build/archlinux/riscv64.dockerfile
index ff8b2b955d..375c78ecd5 100644
--- a/automation/build/archlinux/riscv64.dockerfile
+++ b/automation/build/archlinux/riscv64.dockerfile
@@ -9,7 +9,8 @@ RUN pacman --noconfirm --needed -Syu \
     inetutils \
     riscv64-linux-gnu-binutils \
     riscv64-linux-gnu-gcc \
-    riscv64-linux-gnu-glibc
+    riscv64-linux-gnu-glibc \
+    qemu-system-riscv
 
 # Add compiler path
 ENV CROSS_COMPILE=riscv64-linux-gnu-
-- 
2.38.1


