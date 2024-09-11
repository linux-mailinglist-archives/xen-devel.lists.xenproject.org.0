Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EC974F3A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 12:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796367.1205936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soKDU-0003uv-DH; Wed, 11 Sep 2024 10:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796367.1205936; Wed, 11 Sep 2024 10:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soKDU-0003tB-83; Wed, 11 Sep 2024 10:04:52 +0000
Received: by outflank-mailman (input) for mailman id 796367;
 Wed, 11 Sep 2024 10:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TDmC=QJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1soKDT-0003qL-1L
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 10:04:51 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47b35375-7025-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 12:04:49 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f762de00e5so44921661fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 03:04:49 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75bffc9d6sm15338281fa.42.2024.09.11.03.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 03:04:46 -0700 (PDT)
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
X-Inumbo-ID: 47b35375-7025-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726049088; x=1726653888; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51h6mv9upk5WS3+HO2CH9gJt0hUadUltKpdY2DpAkkk=;
        b=XYq+3+vZBv1hlaZP1ei4lYXlKI4Gz9L4mlQ8pDosmgDaYjZg+U34uQlcWElB+XW43e
         527U7TJhq4yKfNfWS/f6Rlq2g8/igDZ22CXnQr4kzGwFFjqFDDbXlyuJThz47MRH2Qrf
         sEn5e0SzPfP9eG9UXuzwvoGj3J6BMEw/0U21vPMIS+S+N63es1CfjET5Eku1nd2SK1bg
         6pGtahKiRAstzj1fgEPNqqLlkWh3iHSFp3SQ+sri5gk6ualprKAiFkZUohIyE8f1VzIr
         fH73dsZ2ep1QALINGEVA9XcRqDkBWpDtLjB+SqwRE0NN1ayyhrBv+u8EfK3R+WzPcLJO
         T5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049088; x=1726653888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51h6mv9upk5WS3+HO2CH9gJt0hUadUltKpdY2DpAkkk=;
        b=GXDb0GvdY2XH5/3WHT2P+hSly9fVI9z0gSe1RlWJuWjUEuLOqJ6/ncx4UcyXBUjeJ2
         A8wioghWMzUmqnyvRmFxvxW6UEc732yH3vrqgHB5V/YU30dvcBxmpXB6DhdgWc2jxe4W
         y/oi27aOjnGdxFB/tQ+qybnR7r3MQx7tMi3upImTePEgnclaVDD9343Aei7kKKzDd83X
         zJgliUo5Ejaz5iMKdAE3NuV8YbL09N69F5vC/78zyWoCcfG30rc+mMCprdtxqBOPCOtG
         ABngUA6Lb3sbpnEs/DxbmQ4veMojDVwoTxoiTBZ7UhF/u4KFrZyWDHjIe0qC3eo9jyQJ
         Ik5Q==
X-Gm-Message-State: AOJu0YxkQ9n0nxMHbryboEADzyEVFRDxXpzxQG3NzV1waTOyoWU0mAXt
	Cq3954Z6o9rMIcO5dsHCaXwXeaLKcRTgu1HqZK/tJDxnR3JsGqMsSgd5dA==
X-Google-Smtp-Source: AGHT+IFtURDxmmmkXrMW8kYcmGmr0+GgnZ/nYXwDfQ16ITmkabL2/OoUzSmAJNKchBAH+jSNw5et0g==
X-Received: by 2002:a2e:be09:0:b0:2f7:7ea4:2a1e with SMTP id 38308e7fff4ca-2f77ea438damr8569441fa.28.1726049087107;
        Wed, 11 Sep 2024 03:04:47 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v1 1/3] xen/ppc: add section for device information in linker script
Date: Wed, 11 Sep 2024 12:04:41 +0200
Message-ID: <395dd494ad09b315e5e383aa41f8dad4548ba613.1726048521.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726048521.git.oleksii.kurochko@gmail.com>
References: <cover.1726048521.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new `.dev.info` section in the PPC linker script to
handle device-specific information.
This section is aligned to `POINTER_ALIGN`, with `_sdevice` and `_edevice`
marking the start and end of the section, respectively.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/ppc/xen.lds.S | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 38cd857187..c087827d28 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -161,6 +161,13 @@ SECTIONS
         __bss_end = .;
     } :text
 
+    . = ALIGN(POINTER_ALIGN);
+    .dev.info : {
+      _sdevice = .;
+      *(.dev.info)
+      _edevice = .;
+    } :text
+
     _end = . ;
 
     /* Section for the device tree blob (if any). */
-- 
2.46.0


