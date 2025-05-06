Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E37AACB82
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:52:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977618.1364587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWS-0005Q0-C1; Tue, 06 May 2025 16:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977618.1364587; Tue, 06 May 2025 16:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWS-0005Ml-6z; Tue, 06 May 2025 16:52:00 +0000
Received: by outflank-mailman (input) for mailman id 977618;
 Tue, 06 May 2025 16:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWR-0005Fd-Fh
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:51:59 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c1f9490-2a9a-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 18:51:57 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac2dfdf3c38so1077865766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:51:57 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:51:55 -0700 (PDT)
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
X-Inumbo-ID: 6c1f9490-2a9a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550317; x=1747155117; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZZenJUioRQGH1T51btvwJarRZwAntnsDHS9Af8zNvk=;
        b=QoN7NUss06UJf7jtNa+HLw9MFZ0uOdEh52HSsSzfF7cVZVlqJGz5srDUOG3lX+cT2Y
         SHIxBgKZHL18zH5B+JUR7lRyNZkqswo1nxLim3WEyQu34rkDSVCjcf3TWffcgmLpSLs1
         +S9VeUIp47b1OF2bDLIk8LKKQpjUZsEw/47rd2Y9zlNSKuj3DGMJGD0Ul4K9HdDlgCKW
         VIZl2JoYzSfoz9SPrcxiF5r2+naEjEyLyG4jA32P7Zhq1OOn9BY4OImWMSHgLZTHM0x7
         i2vXV+OpQk/RwlBZrr5Fw4fdhgYsAHepk348Rw8EqWf8nXBWCiX2hBQZOQmob8/Ayh4G
         W9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550317; x=1747155117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZZenJUioRQGH1T51btvwJarRZwAntnsDHS9Af8zNvk=;
        b=Fj0g8m2jcRAfqBGQ+99a3XjkSNGl5kS1LNd57g3tBKXOeQEs07vSQntJFJdDTdV7yb
         zVI2DnCyz6GzFsTl7MTbd5xTz2w2n8O5ed8x06WG0Nkdq0KOxaCwu+xDy/oDNnDVfDa9
         jXlOCfCjUN0hIEgtw+seil5h4tPfumxwlepyye9sj3fhGJH6EFydEm+azXFZ+0VBYKr6
         /93Pq6qWdH/ncMYQ9thCqbNl1SigMBSWtzDgWBvNuAnFkG2IEp0t3uFywzfTw2Vqq8Oo
         J1/HdYbMnPrE6pkFtkvhp6ZifC0B67rAQvakC1ChKD1aiR6SYGCTfQ2W7BWeY1/EGSvz
         9YOg==
X-Gm-Message-State: AOJu0Yy6X5sXuekzjAQ8nSiU7Z116s+VZD6rursmFfDyfCiLyY3fYZg6
	vcrdM+/yTwdcI+WvYq0Xx75KwsJOKTBiYrDDP3XMPQs0togHlLQQo5VE2A==
X-Gm-Gg: ASbGnct5C0y6j1+jNg7w6pw02tUrdAW0G1l/uEIM7YAcStXq/3sqrBR1FgXUAKYVMXs
	C2easMw6FvISpJQRqv2nxkaXWjEMtMoOwVDA0uBrRwMa2gEGVN38UNDS+UZkB/4T9Z45xiy2WZ6
	sWh9vN8BNOSkeGZVMIv96cleY8NeO6GiNg+CvA7KtPg24zOHW9I41c1iw6EdHFgItNeOeAvECRJ
	iibcWkZzqgLFYTJv7QPrvHWFULKq2xrF8IOhLz0G/PxwsutmickG8JODP9hgmWW6UkBpgYXBg5H
	JsWd0QXKl12a9Saf+YgGDUfxp+ikmFfQ3CYFYmClGwE9/tVCEormIsaPTKD06TBmwltDyU5xpy8
	O7PX8gJD3GBDw91kR29bv
X-Google-Smtp-Source: AGHT+IFaSJSNfOEaKtEIxlpAAZoDwVMB3HMLE+EanhY+am3QF4vq/jtENtfjZtIqTKyA8XLs2tXZLQ==
X-Received: by 2002:a17:907:3e23:b0:ace:bead:5ee1 with SMTP id a640c23a62f3a-ad1e8dbc871mr15117066b.42.1746550316402;
        Tue, 06 May 2025 09:51:56 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 01/16] xen/riscv: initialize bitmap to zero in riscv_fill_hwcap_from_isa_string()
Date: Tue,  6 May 2025 18:51:31 +0200
Message-ID: <21efdebac3d1c9797420a8c81fbbd6a06ecc9121.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The this_isa bitmap should be explicitly initialized to zero to avoid
false positives when detecting supported ISA extensions. Without proper
zero-initialization, the bitmap may retain non-zero values from
uninitialized memory, causing Xen to incorrectly assume that certain
extensions are supported.

This change ensures reliable detection of ISA capabilities.

Fixes: 0c2f717eae ("xen/riscv: identify specific ISA supported by cpu")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - new patch.
---
 xen/arch/riscv/cpufeature.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 5aafab0f49..3246a03624 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -405,6 +405,8 @@ static void __init riscv_fill_hwcap_from_isa_string(void)
         const char *isa;
         unsigned long cpuid;
 
+        bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
+
         if ( !dt_device_type_is_equal(cpu, "cpu") )
             continue;
 
-- 
2.49.0


