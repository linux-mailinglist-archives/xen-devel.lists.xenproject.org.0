Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EB37F71D0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640464.998762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tdg-0004zW-IM; Fri, 24 Nov 2023 10:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640464.998762; Fri, 24 Nov 2023 10:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tdg-0004tK-Ag; Fri, 24 Nov 2023 10:42:24 +0000
Received: by outflank-mailman (input) for mailman id 640464;
 Fri, 24 Nov 2023 10:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTA-0006hy-29
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:32 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a21746d4-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:31 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5441ba3e53cso2377807a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:31 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:29 -0800 (PST)
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
X-Inumbo-ID: a21746d4-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821891; x=1701426691; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g46lHJ7PRqE3nFRQ+w0xzRl9exprWHTs3esTtz5L1/0=;
        b=HsaZBaiwrs7je5l6p9wHrCDsSi1SY600mk/tyvnN7BTgnMdPmQ9ui5jTmMc5zr30tl
         PRuoMJkosfALUJVloYR3ZdaBMJIO5SvyERdtq/S7ibpD6NcijDs1+WqctcNYSjf9EY0L
         Ka5bd/JINF8xjRc1wIQydLPce3nLPsC/Mno5cJykJwm7kAysq1XDdvc3NaGGL3XtDk7n
         T59dv9vfTeDxia14V1Gi0f0K6+00E8ehYBRTk86SeR1dYGguzz2EfkEd25qlZu2UtHGn
         IrB43UpURMpA4impF1xI566lHGoNLjTUXdxlBntIzB9wlLjPS3mknsoFmKgdhs2dI4Kj
         nWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821891; x=1701426691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g46lHJ7PRqE3nFRQ+w0xzRl9exprWHTs3esTtz5L1/0=;
        b=EwBU9JgX5J2fmWwdzcsvooT6bhefaxO+87pkeOrcFTQv0HI4yiGCCwRYariqzxLXZk
         21gtVBSUFoWyi3ce6TKIl9BjQowCVztAXmqneWSctmVNGlR6o/4jjb8V/XlTdP85nvG9
         suy0yYq2DQeJxfGUpFq+hLgICNIPMjoP1YjUnpTvgydGvPuDKKySFmfgjS8d5Lwv2kMC
         t8uUQjsyraAx8GKTDFYsIBAk2YD5/H0t1Pmoqu5xrZ6Dxyg60s6hYyOY3kVnSNeRJYOY
         jv9Z9RaYyMUpE6/bIn7aQes7Zbpy0iFgbQOEiYHECgoTzz8wGuZYV9k1iPl3F+RpzXsr
         zb1A==
X-Gm-Message-State: AOJu0YzIS3qrIxhIhFnq4nYoM1KBN1bMg4/EWSVbIliCnPC4wtbBqEGW
	5WT8XmMOANqaPCaznaXYfwvscCq91coykw==
X-Google-Smtp-Source: AGHT+IHcF0xnuTStuX9bhkih2i4OrTX4GattfTh71KvbLIVpeU4XPuVGgMZp0qLodbyOdvyiiqnLlQ==
X-Received: by 2002:a17:906:b35a:b0:a04:c622:af8c with SMTP id cd26-20020a170906b35a00b00a04c622af8cmr1690124ejb.22.1700821890786;
        Fri, 24 Nov 2023 02:31:30 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 20/39] xen/riscv: define bug frame tables in xen.lds.S
Date: Fri, 24 Nov 2023 12:30:40 +0200
Message-ID: <2d9a1d2847be15e025121694ead80bee27c5ed97.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/xen.lds.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 3fa7db3bf9..a10e0ad87c 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -45,6 +45,16 @@ SECTIONS
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
2.42.0


