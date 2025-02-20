Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ADBA3E2D8
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 18:44:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894060.1302929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAb7-0005wn-NO; Thu, 20 Feb 2025 17:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894060.1302929; Thu, 20 Feb 2025 17:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAb7-0005s2-Gn; Thu, 20 Feb 2025 17:44:29 +0000
Received: by outflank-mailman (input) for mailman id 894060;
 Thu, 20 Feb 2025 17:44:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tlAb5-000469-0i
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 17:44:27 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53564bd3-efb2-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 18:44:25 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-3076262bfc6so12663321fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 09:44:25 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54619e7bc2esm1600904e87.244.2025.02.20.09.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 09:44:23 -0800 (PST)
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
X-Inumbo-ID: 53564bd3-efb2-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740073464; x=1740678264; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oI63t7vbkRwo0ryN869PS74UDKf8jwfaKSN0DbSDcU=;
        b=OdFC7kKfKcInsdkvKYjfOqSnEcK/VyyzH0tb+/MqI/Demrx6xRoOSzr3GFctVrd3SF
         UdESIny59O1dPGQOEBSYLHZ/rucHUa2xMxSCkAqLdz3PzHydm7EkhgSZEUVh7MU4QYUX
         6WgnVwhNzJ1yWIbfseAZbjYADgHb2uedUX4LSo7K1NnNwnz2pNlx8syPmA+rVf5djcaJ
         mJiGVq1CL8yexXvmNiDwAWxvI1X9PicKiDoEpxTuxS+DPCAE/TRg914ldpIya/eacYqL
         IWNFzNPFOQdGxLQrivnXaog6khXTlo9kQdTAnJit1PNtU1O85iPUF+UGeW+QTTUe5qdt
         Wtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740073464; x=1740678264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oI63t7vbkRwo0ryN869PS74UDKf8jwfaKSN0DbSDcU=;
        b=KVfrvTypX7NrwisawZSmFUtQF5uDeY3MiP+/IcbLnCBEHYvUgV/e/5zGqVucTEdkBK
         kV5NvKhD4T6osWHoOrHADMVFeBte6WSZvlwyf0zH73KU4B0c6e4V6PTXQvGJHQfLgO6p
         Dbllni8YQutgIdjKsY5HkC5U/39mcH2Txryac6ZMw09lbKXKSt6B02GCTUq1e3SQqKAc
         w1lWLC520i8m9YJQY0Jkgs+dO7jtsLpEbE9YKnjkNgo2yDADSO6tAKsv3MIyUISLCgEe
         FhI7ytMqoQemqiYaQiYwArDDQAeTDbO7gBfdv5baL5RTVt0KqsrxMxzjBFTKVRW4DpJ5
         afDQ==
X-Gm-Message-State: AOJu0YxOjhhnZL//obFqSeTPXJlFYagt6KAee/M4FBdztMRgWiNfA5gT
	pvVKehwsUPawTgfG04W57W2UXvCG8To8PvYk21gfltZhAUIpSjynX0dTjA==
X-Gm-Gg: ASbGnct8ntL7gTTbCGY32Cb/sfQO6836j9L/p80bj8iMszVDtWgOjV3+yL77YXhSag9
	WlFsZBHPEgRAopTsNzKEFgrmqolXS64QPSkNl75JJgpvt3qq6Q+KOFPI0579WnfFBjxLK2cGdSQ
	CG22hVlOEA8kSItwhXSYfwywGqzOn90Tj3vkRjMvyzh+9QasTyzdHY6bCSvr5ajvZt7Oz6ufnVB
	u/Guubffjg4rm8ntFXrrGlmjF65ApzerJCysDXJst8EHdviqbd8arbOg1So6V7+RKpHeueJJK6x
	q/TnQbEluyR+CN8t
X-Google-Smtp-Source: AGHT+IHEN1afJNGPcuaEcHW03kiyYnkf2QitDJDDrra5wQfbQj1NrrwZGolqHQ0KCCuK5YxH9AE/eg==
X-Received: by 2002:a05:6512:1105:b0:545:764:2f8d with SMTP id 2adb3069b0e04-5452fe938c6mr9565418e87.44.1740073463994;
        Thu, 20 Feb 2025 09:44:23 -0800 (PST)
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
Subject: [PATCH for 4.21 v7 2/4] xen/riscv: drop CONFIG_RISCV_ISA_RV64G
Date: Thu, 20 Feb 2025 18:44:13 +0100
Message-ID: <c48d287edf04f6960a16ad763e09b790bc1bc89b.1740071755.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740071755.git.oleksii.kurochko@gmail.com>
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=all
Content-Transfer-Encoding: 8bit

'G' stands for "imafd_zicsr_zifencei".

Extensions 'f' and 'd' aren't really needed for Xen, and allowing floating
point registers to be used can lead to crashes.

Extensions 'i', 'm', 'a', 'zicsr', and 'zifencei' are necessary for the
operation of Xen, which is why they are used explicitly (unconditionally)
in -march.

Drop "Base ISA" choice from riscv/Kconfig as it is always empty.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - For better readability use += instead of := for riscv-march-* in arch.mk.
 - Drop spaces from riscv-march-y by usage of subst macros.
 - Drop "Base ISA" choice as it is empty now.
 - Update the commit message.
---
Changes in V6:
 - new patch.
---
 xen/arch/riscv/Kconfig | 18 ------------------
 xen/arch/riscv/arch.mk |  8 +++++---
 2 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index fa95cd0a42..d882e0a059 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -23,24 +23,6 @@ endmenu
 
 menu "ISA Selection"
 
-choice
-	prompt "Base ISA"
-	default RISCV_ISA_RV64G if RISCV_64
-	help
-	  This selects the base ISA extensions that Xen will target.
-
-config RISCV_ISA_RV64G
-	bool "RV64G"
-	help
-	  Use the RV64I base ISA, plus
-	  "M" for multiply/divide,
-	  "A" for atomic instructions,
-	  “F”/"D" for  {single/double}-precision floating-point instructions,
-	  "Zicsr" for control and status register access,
-	  "Zifencei" for instruction-fetch fence.
-
-endchoice
-
 config RISCV_ISA_C
 	bool "Compressed extension"
 	default y
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 17827c302c..3034da76cb 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -6,10 +6,12 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
 riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
 
-riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
-riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
+riscv-march-$(CONFIG_RISCV_64) := rv64
+riscv-march-y += ima
+riscv-march-$(CONFIG_RISCV_ISA_C) += c
+riscv-march-y += _zicsr_zifencei
 
-riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
+riscv-generic-flags := $(riscv-abi-y) -march=$(subst $(space),,$(riscv-march-y))
 
 # check-extension: Check whether extenstion is supported by a compiler and
 #                  an assembler.
-- 
2.48.1


