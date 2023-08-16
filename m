Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E29877DEC0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584482.915297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDon-0002Ww-1X; Wed, 16 Aug 2023 10:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584482.915297; Wed, 16 Aug 2023 10:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDom-0002UI-U5; Wed, 16 Aug 2023 10:32:00 +0000
Received: by outflank-mailman (input) for mailman id 584482;
 Wed, 16 Aug 2023 10:31:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdu-0003RA-0Y
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:46 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d2fb5df-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:41 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-319e93a1594so550765f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:41 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:39 -0700 (PDT)
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
X-Inumbo-ID: 8d2fb5df-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181240; x=1692786040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upqQ3OmhoJ093rgDW+Yu4iVDwCfRMeswFRO8V/M3+4I=;
        b=XihWmi525ELmqThCX8L0XMuwiuuV4UheKiZSyJIqv2/anpp6hXSYO5HQv6jJc3j7mj
         GRYhTdJsX4jf0+jTFe23nGPAz8sqZpgsqgX33DefWO5jMWuppC4jETF+xV20/6QrLmcW
         p5PQ/L9gEu1u8LHXTyJCWjfFCv/n0oMOi7YNmPdj/3Vz//rYlwsREihW6vfPZGUhW50D
         E+YYpmvH6WEaCduld7xU3rKkStU9zua0QMrVYQXdkV7Ze2znIhnMZoztq2AMgQBV6zvi
         3cOI36nfiFKWXWqOsIt3LeIRpNN7JAeZMCy2emMa0cU4z8Q/fESOYh49k7qtHVkr7J51
         riuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181240; x=1692786040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upqQ3OmhoJ093rgDW+Yu4iVDwCfRMeswFRO8V/M3+4I=;
        b=jaVILhrlp8SjmLSTY2kOTK1Gib+v73pBZ4WZBaomVT97zOyiukSEyWX2i+bKL/DaII
         vkVg3iou54KhgMPFd0b6lTZcTUTw+KU/TKuyWI1UTgqe6N1cyzzwGseoxgXWCYbae3mJ
         3rey9xBIrmtYjaSsycIzt7KSEv9Umb5A749yh2S74f1xttZTc/lolr0wFU7PxRKnnQHQ
         erwL84RTwuhyf4rFjWdhcu+de+1SaOjYlrXMb58CebQ/PnY9djIFSGg5CvnB+LTdP68w
         dAxq//pv9MC3HQq8aUwBQ/Dvuh3E1eeN1WAVKWJLFqnnzYuMl8BRfhr5e3Yy0lx3h3Rr
         SNog==
X-Gm-Message-State: AOJu0Yxbb584PYf0wNkfDXVwUsBWQn2DzTtAKNZaN0AiG3om4Xb844sU
	0JmN5D+17jmeh/9wullfrJlWjGeKLm7/gBS9
X-Google-Smtp-Source: AGHT+IHp+5iVvOJlXz121VTJNFJZR2qPXdwENfWS23Vvq/WEW51AoJUlrkH6ARz7FXOcnxZO3rm1og==
X-Received: by 2002:adf:f3ce:0:b0:319:8333:9052 with SMTP id g14-20020adff3ce000000b0031983339052mr1067303wrp.26.1692181240412;
        Wed, 16 Aug 2023 03:20:40 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 31/57] xen/riscv: define bug frame tables in xen.lds.S
Date: Wed, 16 Aug 2023 13:19:43 +0300
Message-ID: <fdbb8432abffd922d541612f578c986109b29340.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/xen.lds.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 9064852173..aa42d3d17b 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -40,6 +40,16 @@ SECTIONS
     . = ALIGN(PAGE_SIZE);
     .rodata : {
         _srodata = .;          /* Read-only data */
+        /* Bug frames table */
+        __start_bug_frames = .;
+        *(.bug_frames.0)
+        __stop_bug_frames_0 = .;
+        *(.bug_frames.1)
+        __stop_bug_frames_1 = .;
+        *(.bug_frames.2)
+        __stop_bug_frames_2 = .;
+        *(.bug_frames.3)
+        __stop_bug_frames_3 = .;
         *(.rodata)
         *(.rodata.*)
         *(.data.rel.ro)
-- 
2.41.0


