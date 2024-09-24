Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C319849E0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803178.1213664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cb-0007S8-Bv; Tue, 24 Sep 2024 16:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803178.1213664; Tue, 24 Sep 2024 16:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cb-0007QB-51; Tue, 24 Sep 2024 16:42:41 +0000
Received: by outflank-mailman (input) for mailman id 803178;
 Tue, 24 Sep 2024 16:42:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vi3U=QW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1st8ca-0006ag-07
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:42:40 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02c28587-7a94-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 18:42:39 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c5bca59416so3606022a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:42:39 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4972f8sm925880a12.36.2024.09.24.09.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:42:38 -0700 (PDT)
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
X-Inumbo-ID: 02c28587-7a94-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727196158; x=1727800958; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEBtAEoVJ9n0AWPFgewaJw3+Rl2x63pa8iRhlsFUppk=;
        b=KVArqidZW45mkD5gXw/d0YMpuKlpMUYsv4gXM/kK0G4QQSnwVOOF3BAwP7wXG4yXSl
         xN0TFg9OiHuuKOk5H1nmasKNdeL/cj2pnj1Hn0E6vbE2dyVBJlvK3HuXECstIGkMD1Np
         zaHuHn3RTmD0S02cq9dPUef6rCGEWK3g4/+xRVZtKQmFIw58SSKXzxtgtt3FmSeURPxb
         gFXN0ahRLUn1GZAf4YQ03vikyN5SYnbcNjliN1V1VDpfTBcaeVrvjm7RisvcwDR4UmAl
         6sWr39zoBUMaQvVRaLvzNRwn8Xd01U1uzy1K4FaNobSgVxci4pZpYlFAcB0r4PLtiwnS
         BqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727196158; x=1727800958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEBtAEoVJ9n0AWPFgewaJw3+Rl2x63pa8iRhlsFUppk=;
        b=TZh5zS8F7JYcK27uZaG2Vo23bWmH3h8APiSpX4yIP9rVPiZkGjtzhroMHpcW2zjrNx
         SknR3B6xOawjB8K2JlVTGgu8Cu8k9O5p3GEyglrW8M0fb3+mFTQLokVO46fR8t2N845J
         oMdkaa5Dmx78zmETyiwzBjScOyUavItc4CF+LDiM9jYDaTyFD4YuOVMhcvt/KAVO1Mmg
         vOlKQZ0orvTL63ajoiBysY0VOYPpk26zfxKecfmmXodDX3hPZQlfRHkgXotmiWaAsNNP
         AotztHNtlUTSXAyPqrCwuHgzJtBPzGrkXy6K4wQCm9f3rowJf42sXBmIRX7TkfF/NMch
         d+yg==
X-Gm-Message-State: AOJu0YyCAU+L4HkiOCR0Ztq4oRfFQqO3GF8xI/LtIKF57NoNNLuHC1va
	ZDb18G6kz6McwGO1sGDLjGa40xWd7RiYt2YuSwhGWPOItKaYpuw/xnKIBg==
X-Google-Smtp-Source: AGHT+IE50acNkkZzGnkJoi3X+n3OKQo+CNNfAI/OySokfx+N1vfxAX8tjTD6pjjz16nSny9OK3nZww==
X-Received: by 2002:a05:6402:274a:b0:5c5:c5fb:57d5 with SMTP id 4fb4d7f45d1cf-5c5c5fb5846mr4065993a12.33.1727196158394;
        Tue, 24 Sep 2024 09:42:38 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/5] xen: define ACPI and DT device info sections macros
Date: Tue, 24 Sep 2024 18:42:30 +0200
Message-ID: <7521839bd265e0520fc448adf50361d18dfe53df.1727193766.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727193766.git.oleksii.kurochko@gmail.com>
References: <cover.1727193766.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce macros to define device information sections based on
the configuration of ACPI or device tree support. These sections
are required for common code of device initialization and getting
an information about a device.

These macros are expected to be used across different
architectures (Arm, PPC, RISC-V), so they are moved to
the common xen/xen.lds.h, based on their original definition
in Arm.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V2:
  - drop SEC* at the end of ACPI AND DT device info
    section mancros.
  - refactor ADEV_INFO and DT_DEV_INFO macros.
---
 xen/include/xen/xen.lds.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index a17810bb28..b85c5e6576 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -114,6 +114,11 @@
 
 /* List of constructs other than *_SECTIONS in alphabetical order. */
 
+#define ADEV_INFO     \
+      _asdevice = .;  \
+      *(.adev.info)   \
+      _aedevice = .;
+
 #define BUGFRAMES                               \
     __start_bug_frames_0 = .;                   \
     *(.bug_frames.0)                            \
@@ -131,6 +136,11 @@
     *(.bug_frames.3)                            \
     __stop_bug_frames_3 = .;
 
+#define DT_DEV_INFO \
+      _sdevice = .; \
+      *(.dev.info)  \
+      _edevice = .;
+
 #ifdef CONFIG_HYPFS
 #define HYPFS_PARAM              \
        . = ALIGN(POINTER_ALIGN); \
-- 
2.46.1


