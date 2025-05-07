Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB180AAE199
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 15:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978588.1365335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCfEi-0003WA-U9; Wed, 07 May 2025 13:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978588.1365335; Wed, 07 May 2025 13:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCfEi-0003U7-RO; Wed, 07 May 2025 13:55:00 +0000
Received: by outflank-mailman (input) for mailman id 978588;
 Wed, 07 May 2025 13:54:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBJs=XX=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uCfEh-0003U1-4V
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 13:54:59 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc8e9fe6-2b4a-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 15:54:57 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so1140700966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 06:54:57 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad18914736asm909458966b.7.2025.05.07.06.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:54:56 -0700 (PDT)
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
X-Inumbo-ID: dc8e9fe6-2b4a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746626097; x=1747230897; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SwaPZyAnjoHYhBUmn95ZOFgAJvghEGtWVGqurf6VpnQ=;
        b=dGDZ+9/ibanT6I0GB1rWg0HGBe0tAJcYAbLLv6ZLGdCViesfY6SwAULcgPKIY0IhOG
         hxVauNSDRjUJTcs4fSTrMU61lyzmaG0dhoqgM1QC84QGNYvLTtMKUXRPy9bvEkHEXlas
         RYIrQV0vxOmhWPuPdeekQkIkTNNEUYJQmpl64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626097; x=1747230897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwaPZyAnjoHYhBUmn95ZOFgAJvghEGtWVGqurf6VpnQ=;
        b=TXETJ9XyQbFicYArVms3xKlTFPE74zNmiqWzcD3rEWIqy8MGZWEMUj7w73x7FybdWC
         0CLUDgCM1JljLKAl2vC3jH7L2ma+7KuEGEMdx1MP7/rNmptTXETuFn6Lzd3bHfLiPUQO
         N7UZptU7TS4Ec3fOEvfVb42vJH0p20+lVc+wOS3bXzAWhA9ui1Ct2WGeCepl0FnQuAdP
         z5pV5EpGTLHru0iqya08dIbCtgcdPDjUEuHVQ6q4kg9Jvtv8FtqtWYvRuLeseu/IsEUz
         5aHqbCGfyp/+nybkBbGYA4S99TngtqokWr+tdGO4Lw8KbSjVkx7TjSRWdO7JSvUomslM
         Db+Q==
X-Gm-Message-State: AOJu0YzJcTaz9IkFn3tlEY/tZFqWwyg+8Pm6x/fNVMwUb8ie0d/50Xqq
	+eXY9b+Y7tKCXnw1wx/mNGcGCnrc/QNM+82wE/xg2bJy7RsmvPhL7P4p/8ZSPxPO7J9R37NLVYQ
	i3nA=
X-Gm-Gg: ASbGnctppx932rOCUNPRXaKbjCx/YKNRLA1g+JmHo+1mHHCXr/6EhmmPxTmPpTv7kLa
	YfyZtFrYNmeeJqsNOV5fSnYn9s7QJpcGsib0vX8VeGpDKgZmmahM2RZInFmfxoWQNOLE5MCXgde
	4AOKyYh91zG0PiSl/AMy1EDCo8+gM4wiLGQHhrXs1FOfBRGgyI07h6DKH/ybyaCZJ1LLkmv7O+N
	5gHtW6DjWXVdqJdsUVYyzq4aG9ndE44WQXMcLgh7fJ3Nc99IEn+Ef7PWeqTHFHZE3jfguEhFLwg
	ou6FRAvfI9L7Rs4Va4HkikNs5OCjIM3yhRP28KV+2V7Jx79y97L7deXFH3dWJYGC
X-Google-Smtp-Source: AGHT+IHDsgfC6imVRFvS4ReHyEKErElDxS8xVHXZ8ZsY1xjnidVV2nHOUSsZtm0lAKPiUg9gADDY7A==
X-Received: by 2002:a17:907:d507:b0:acb:39bb:f880 with SMTP id a640c23a62f3a-ad1e8d2c8cfmr379747666b.54.1746626097045;
        Wed, 07 May 2025 06:54:57 -0700 (PDT)
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: dpsmith@apertussolutions.com,
	marmarek@invisiblethingslab.com,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v3] sbat: Add SBAT section to the Xen EFI binary
Date: Wed,  7 May 2025 13:54:42 +0000
Message-ID: <20250507135442.3439237-1-gerald.elder-vass@cloud.com>
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
index 24dfecfad184..75aa35870a9a 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -6,11 +6,17 @@ cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
 $(obj)/%.o: $(src)/%.ihex FORCE
 	$(call if_changed,objcopy_o_ihex)
 
+$(obj)/sbat.o: OBJCOPYFLAGS := -I binary -O elf64-x86-64 --rename-section .data=.sbat,readonly,data,contents
+$(obj)/sbat.o: $(src)/sbat.sbat FORCE
+	$(call if_changed,objcopy)
+
 $(obj)/boot.init.o: $(obj)/buildid.o
 
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
 $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-boundary)
 
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
index 9a1dfe1b340a..e6405941e1b7 100644
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

