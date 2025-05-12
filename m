Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB773AB3512
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981219.1367619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQZc-0007qn-OA; Mon, 12 May 2025 10:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981219.1367619; Mon, 12 May 2025 10:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQZc-0007om-LI; Mon, 12 May 2025 10:39:52 +0000
Received: by outflank-mailman (input) for mailman id 981219;
 Mon, 12 May 2025 10:39:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCfZ=X4=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uEQZa-0007nL-VC
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:39:51 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6df410e2-2f1d-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 12:39:49 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad216a5a59cso454971566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:39:49 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2192c83d9sm601141866b.28.2025.05.12.03.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 03:39:48 -0700 (PDT)
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
X-Inumbo-ID: 6df410e2-2f1d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747046389; x=1747651189; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AZc5LtYl4BmVK65ksI2W32npsbKVS6L8xz5bNRK6Omk=;
        b=IWlb/5HzTTm4r74s1AozhIFAH1UW8h+PieIKI9+LT6m35C6k1gIuM2wHrM2DUqPS1+
         mhvJ87JGa/93ptj1e0dCIODUxYwhEJwBB4SO0/0UM3f2M/mF7rgndZK6SJzdrM73O5EI
         ezfnE1dy/+LuaInleXwSPGqpD9Ski0/ntI1Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747046389; x=1747651189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZc5LtYl4BmVK65ksI2W32npsbKVS6L8xz5bNRK6Omk=;
        b=YfSFO5j3qK5zcgv45KM3TjyqM9ytNzgZAJ+wJ2FXQaTAeViekRxlunB5h4SNKk/cR6
         BQKAJ2Gj5IsFgiBu2dYLOJ12EKc9EY5kuotuBhSygF5ObAjpMmHjpVbPX6Pbo+DoS8kc
         W8ChUZBJXb4PqWH17ordhX0A/Ft60sCBbcwd5XDF+pABD4ubCxxjEwytbvEv1aXeW96l
         nn2esG3aRfasiyJZ2fsFec72tReiZ57aR5N1mzJzkWk0eFCTX4zD17ecaTnsak87sh0y
         9KKAR+G0KkvUxeYOdj3xomWKSF2jfrCpN1ZbDBDqrGewpYawIHQXdSG5ZY951oNyHyav
         sJGQ==
X-Gm-Message-State: AOJu0YwqKI6ob+21v65QBTD+q4XGP/wej0xxI8G8+wKHd091Cm63Krez
	T+rNGuBxw1d6gb6gjvDwrNQxwSJKV3TG98r7yhX5vtxVtN9v/ElCEEQkwg+TAt8E8ofeN9aWVlE
	d2rc=
X-Gm-Gg: ASbGncu4lWytiMWB97pkBrx3+rIilNHBDJoRN/siHIIQYCQkznyO2sJAUkPjMSkrFJn
	YHgQJLZmkEWkQtJg5MFkQfO1F3OyxBHRHaY24iYGSgegLjttgWkEeecSiTk3NP1fMtE+S5SFSm2
	p9dbsAVa/bxwxJeevhbKHcNEDkp4ZdlSFbN3U3tFNsAgE3sMkVdCuHLldE+E2SR0zoCVNgIoM3f
	/KVfHBMweixrzQ4VMDHwmPwx6yMqosLLZpZr/b2HeSzSQHmSRfGR0DHDRFvKLmsgfADEU8CHiUA
	BtknyljyvaDT8cyQO2GM9W/opmHyRmFtMAZ5oOKDnurgdF3GIH0u4tJXjQIYqt670Jpjt058ORQ
	=
X-Google-Smtp-Source: AGHT+IFAcKScBC4Mu4IhxE7Rdt/G3/sCgNspG9WxLbqThubtdn86RX25W42OY5W1GcTtjuZCBNiYsQ==
X-Received: by 2002:a17:907:2da1:b0:ad2:3f21:a0a1 with SMTP id a640c23a62f3a-ad23f21b350mr530556466b.37.1747046388608;
        Mon, 12 May 2025 03:39:48 -0700 (PDT)
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: marmarek@invisiblethingslab.com,
	dpsmith@apertussolutions.com,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v4] sbat: Add SBAT section to the Xen EFI binary
Date: Mon, 12 May 2025 10:39:42 +0000
Message-ID: <20250512103942.173136-1-gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SBAT is a revocation scheme for UEFI SecureBoot, and is mandated by Microsoft
for signing.

The SBAT section provides a way for the binary to declare a generation
id for its upstream source and any vendor changes applied. A compatible
loader can then revoke vulnerable binaries by generation, using the
binary's declared generation id(s) to determine if it is safe to load.

More information about SBAT is available here:
https://github.com/rhboot/shim/blob/main/SBAT.md

Vendors should append a custom line onto sbat.csv(.in) with their vendor
specific sbat data.

Populate the SBAT section in the Xen binary by using the information
in xen/arch/xs86/efi/sbat.sbat

Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Tested-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
---
Changed since v3:
 * Rebased patch onto 'staging' branch
 * Included an empty .note.GNU-stack section to sbat.o to fix linker warning
 * Discard .sbat section from ELF (non-EFI) build

Changed since v2:
 * Moved sbat files and rules to arch/x86/efi
 * Updated sbat rule to reuse existing objcopy command

Changed since v1:
 * Updated commit message to explain why SBAT is needed
 * Renamed sbat_data.o rule to sbat.o
 * Moved sbat.o rule into alphabetical order
 * Removed xen specific entry from sbat.csv (and rule for auto filling version)
   - The alternative of adding a "customise me" line would result in more
     overhead for anyone else building Xen, regardless of UEFI SecureBoot usage

diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index c6678652fc98..530a76dc4f42 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -6,11 +6,19 @@ cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
 $(obj)/%.o: $(src)/%.ihex FORCE
 	$(call if_changed,objcopy_o_ihex)
 
+$(obj)/sbat.o: OBJCOPYFLAGS := -I binary -O elf64-x86-64 \
+	--rename-section .data=.sbat,readonly,data,contents \
+	--add-section .note.GNU-stack=/dev/null
+$(obj)/sbat.o: $(src)/sbat.sbat FORCE
+	$(call if_changed,objcopy)
+
 $(obj)/boot.init.o: $(obj)/buildid.o
 
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
 $(addprefix $(obj)/,$(EFIOBJ-y) mbi2.init.o): CFLAGS_stack_boundary := $(cflags-stack-boundary)
 
+EFIOBJ-y += sbat.o
+
 obj-y := common-stub.o stub.o
 obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
 obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
diff --git a/xen/arch/x86/efi/sbat.sbat b/xen/arch/x86/efi/sbat.sbat
new file mode 100644
index 000000000000..1f262b5f038b
--- /dev/null
+++ b/xen/arch/x86/efi/sbat.sbat
@@ -0,0 +1 @@
+sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 53bafc98a536..a9240fa51a5e 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -343,6 +343,8 @@ SECTIONS
     *(.reloc)
     __base_relocs_end = .;
   }
+
+  .sbat (NOLOAD) : { *(.sbat) }
 #elif defined(XEN_BUILD_EFI)
   /*
    * Due to the way EFI support is currently implemented, these two symbols
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 793d0e11450c..725ecae11893 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -99,7 +99,8 @@
        *(.comment.*) \
        *(.note.*)
 #else
-#define DISCARD_EFI_SECTIONS
+#define DISCARD_EFI_SECTIONS \
+       *(.sbat)
 #endif
 
 /* Sections to be discarded. */

