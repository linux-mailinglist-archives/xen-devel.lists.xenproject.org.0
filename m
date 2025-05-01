Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66773AA5E58
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 14:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974109.1362056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uASx2-0008Im-Eb; Thu, 01 May 2025 12:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974109.1362056; Thu, 01 May 2025 12:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uASx2-0008GZ-BO; Thu, 01 May 2025 12:23:40 +0000
Received: by outflank-mailman (input) for mailman id 974109;
 Thu, 01 May 2025 12:23:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUqK=XR=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uASx0-0008GT-Mq
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 12:23:38 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bd24329-2687-11f0-9eb4-5ba50f476ded;
 Thu, 01 May 2025 14:23:38 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ac25520a289so145579866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 05:23:38 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad0da51681asm33401366b.105.2025.05.01.05.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 05:23:36 -0700 (PDT)
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
X-Inumbo-ID: 1bd24329-2687-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746102217; x=1746707017; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/PqX/nwwI08euGI8uJVy+/V+w3ULiNbLKDIxnxdS24=;
        b=WDILSqImnr4j7gmJTZ89wQGxekU/L5Z3JasKdKX8lrp3QdZOu18QYiagrYmohndB9v
         ztxGOTZgsBkacEEaSi0TsT1X4lWoD/mWU7WD6plt2DxtBMjqdj/+o7nlZ0GaszKr8Ngj
         Y/fPxTBjGNHROfsueTxwGnYvjBlt7QnPqGwQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746102217; x=1746707017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/PqX/nwwI08euGI8uJVy+/V+w3ULiNbLKDIxnxdS24=;
        b=ewQvuMpZ+NfrEflB8cy4CvwpExpw2hMLWNcdX2XQqMP+ZHWzkqqgeg19x6cQ3/Fhd8
         ybb0yacK5KOqK684n1Ad981W1sdG4Qmaleap9+L5Xqf3PCd3wbk5ca5RoKhZuuqtN3Ap
         cuYK6xznl/uFZYV4MOHa7YpbDMPXr4z9t+jficiOa7tnmQ7jZi9OzDDzJt1ACHfPHHWG
         77gLXNmjePn/nrHETogqINSZBnMifYQ2Da0kO5TNvXxmzle3nJHTmW2hBKFJoCqH7Y5B
         vMZmffoz4JRKOxkaFAUZCK/EjJm3HlqB1lThjjnxr8YPS1FWK/4G17lb29kHYIe0Lbow
         6DXA==
X-Gm-Message-State: AOJu0YzKFj8KR2qOd3rGBGTxCaRiNZ8sr3lSChj+6oB6Gix/9uF6D+sH
	AO+d0iy7x5+CIKD5u7djFs3BSBCzt3itDJbGlpktsRD/ATY9PYQ5uEf47OWn1SkjJo4+6A0bpwO
	YwzI=
X-Gm-Gg: ASbGncu8zXYKSykaft5ZPLQn3yPj6JGIqe3CKndfsW25O2guQ+cLsZVW6WzKaBt7Fq9
	W8yRgBlDj3MxhqH4aMmObHbhjgew5bIj7fRenAwK7TAmgf5Mupo+iXX5zHjgbh/vm/rvsRoDRo6
	qYC0xyd0eR50+RkP7+oUtnaGz6Ew1BMFGItmkDZz/9xuMLHIsGKwHJYGZami8Bpz8KjxBFFl9At
	eg30dJ+K7OZbeSg/8e+1XB/wAxVZBaYDZG6kvQ3Orfojs5OBxrNj1DGvpOzMDgyKa0MOxGg0/cd
	PNk3KPoSO1EeFP36+6r5JBnOt+1saBDIH/o6zQbIRlJLTeNWEGi+YB+DhfcwP45p
X-Google-Smtp-Source: AGHT+IGt1lh2PjmnZHhjKw7j3jKh8mY0cZW9WiCl6UNuO+iXLXk/ZRrjx0QUdHGwzSkNHQXupvsHgA==
X-Received: by 2002:a17:907:2da4:b0:ac7:1350:e878 with SMTP id a640c23a62f3a-acefbfe3165mr226433566b.46.1746102217040;
        Thu, 01 May 2025 05:23:37 -0700 (PDT)
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2] sbat: Add SBAT section to the Xen EFI binary
Date: Thu,  1 May 2025 12:23:22 +0000
Message-ID: <20250501122322.230599-1-gerald.elder-vass@cloud.com>
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
in xen/arch/x86/sbat.csv

Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Tested-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
---
Changed since v1:
 * Updated commit message to explain why SBAT is needed
 * Renamed sbat_data.o rule to sbat.o
 * Moved sbat.o rule into alphabetical order
 * Removed xen specific entry from sbat.csv (and rule for auto filling version)
   - The alternative of adding a "customise me" line would result in more
     overhead for anyone else building Xen, regardless of UEFI SecureBoot usage

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index d902fb7accd9..8fc5c69111d5 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -58,6 +58,7 @@ obj-y += percpu.o
 obj-y += physdev.o
 obj-$(CONFIG_COMPAT) += x86_64/physdev.o
 obj-y += psr.o
+obj-y += sbat.o
 obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
@@ -277,6 +278,9 @@ $(obj)/efi.lds: AFLAGS-y += -DEFI
 $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
+$(obj)/sbat.o: $(src)/sbat.csv
+	$(OBJCOPY) -I binary -O elf64-x86-64 --rename-section .data=.sbat,readonly,data,contents $< $@
+
 clean-files := \
     include/asm/asm-macros.* \
     $(objtree)/.xen-syms.[0-9]* \
diff --git a/xen/arch/x86/sbat.csv b/xen/arch/x86/sbat.csv
new file mode 100644
index 000000000000..1f262b5f038b
--- /dev/null
+++ b/xen/arch/x86/sbat.csv
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
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index a17810bb286f..756f97d48183 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -92,7 +92,8 @@
        *(.comment.*) \
        *(.note.*)
 #else
-#define DISCARD_EFI_SECTIONS
+#define DISCARD_EFI_SECTIONS \
+       *(.sbat)
 #endif
 
 /* Sections to be discarded. */

