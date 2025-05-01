Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA671AA5D89
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 13:03:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974057.1362015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uARgW-000450-3N; Thu, 01 May 2025 11:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974057.1362015; Thu, 01 May 2025 11:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uARgW-00043T-0b; Thu, 01 May 2025 11:02:32 +0000
Received: by outflank-mailman (input) for mailman id 974057;
 Thu, 01 May 2025 10:49:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUqK=XR=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uARU2-0001h1-Lx
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 10:49:38 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9916abb-2679-11f0-9eb4-5ba50f476ded;
 Thu, 01 May 2025 12:49:37 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5edc07c777eso1092443a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 03:49:37 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad0da55b3d4sm22400566b.153.2025.05.01.03.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 03:49:35 -0700 (PDT)
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
X-Inumbo-ID: f9916abb-2679-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746096576; x=1746701376; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iicefiwaxi+sdxCzITJJy6lYLk+i0arTwggOQzyC0hY=;
        b=c0fp9NZM3vD1SC6fNvdKbnDhfRO2ocaU+UXepgTDeiiCREHCR7nFXLsMCLDToM9mc6
         ye+pOKv/7Zuvs+9QTwlBXc6U8QhAtbBVSivaLOOvPRj7i4BnxWSnoA0DVyZIRjecJKHm
         yoENqxtCTD5FQNVwAL0rag/1Xthtzwz67PsG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746096576; x=1746701376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iicefiwaxi+sdxCzITJJy6lYLk+i0arTwggOQzyC0hY=;
        b=P8vInEUObGQ08cbWzrEoRMFBakvGJ8Y6AMFJQ3vu5dSQDEoyr6GuEdkrwZdv5NfKtm
         nF4MsVj4je26A6vRYoa0nogAdeh8orHgwa3pQpYpDtDeL2WquK9LhXL792yzs/LCZ3Ds
         FO2FVfXflyVn7ylngBhP+SrESh0ML/KKXN7+Q/CCRzAe7BpEgDQ11yxPr7J8USeLd5aw
         /RlaKpnYD2fl7yxsvu8ki+Cnlc8CAMfrJH1YFTowVaEv83KTpp+PpnMHr6ItSuM58Klz
         6HM8euJ3fQ4r4K6ogaog8Z/kKgvMS1f5iTpx69ei76t6EGkpKrGqlKauKGCFNgToR5LZ
         4NPQ==
X-Gm-Message-State: AOJu0YwOfDanS1iEM09ihXo6e++0s1lDuD1ozmVy80FhQrCupDr2FMS4
	MZd4SF0SNHpcNCcOe2H+oEvSjgDLMuS34r9Nq98HHcEtd7cu7u74/3kSW6zn404xiKJ6eNoonsJ
	YVQeXkA==
X-Gm-Gg: ASbGncvIOm8jQu/cdgoKPe/qmGd797CWBPZePkSLIataAVsBdoO7bvsTB6x5rbQ8XQN
	b0v151fW4k1JMfbkBNUcyQBL1jS1fWwfntukrlOliNkjQeCGoBtrj0WprNIpXCjJ4ejU6/O4F+Y
	t4jy46qYaqAysYw1H5zcyjb+44fzIl9NVRu9FazzGSnEk5LsVAPu/zgCqxGCD0VTx86E//Gr2fL
	K7AoJculwTl7U9IL8TM4NMsAN5A8AqCDxDwBPEO3HI6pFNec8D467HUaM4U8DfiLnqhR2NaEy+q
	P7b5NjLpsmttIDckIryt0/Xbojoqo8yBRYlwHjhCzOqGQXXsKIkR1rQGJ8AONm2S
X-Google-Smtp-Source: AGHT+IGGoug9Jx7TD9+t+RTEh2Le1hOkmF0XmVFVSlgfL/fu8Uno4oAzSCoT3j1lOoKTC/LV0umoXg==
X-Received: by 2002:a17:907:6e93:b0:ac7:150b:57b2 with SMTP id a640c23a62f3a-acedc70a042mr544267866b.41.1746096576117;
        Thu, 01 May 2025 03:49:36 -0700 (PDT)
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] sbat: Add SBAT section to the xen binary
Date: Thu,  1 May 2025 10:49:25 +0000
Message-ID: <20250501104925.228351-1-gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SBAT section provides a way for the binary to declare a generation
id for its upstream source and any vendor changes applied. A compatible
loader can then revoke vulnerable binaries by generation, using the
binary's declared generation id(s) to determine if it is safe to load.

More information about SBAT is available here:
https://github.com/rhboot/shim/blob/main/SBAT.md

Vendors should append a custom line onto sbat.csv(.in) with their vendor
specific sbat data.

Populate the SBAT section in the Xen binary by using the information
in xen/arch/x86/sbat.csv.in

Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Tested-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index d902fb7accd9..6db7475c2c23 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -74,6 +74,7 @@ obj-$(CONFIG_TBOOT) += tboot.o
 obj-y += hpet.o
 obj-y += vm_event.o
 obj-y += xstate.o
+obj-y += sbat_data.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
@@ -277,6 +278,12 @@ $(obj)/efi.lds: AFLAGS-y += -DEFI
 $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
+$(obj)/sbat.csv: $(src)/sbat.csv.in
+	sed "s/@@VERSION@@/${XEN_FULLVERSION}/" $< > $@
+
+$(obj)/sbat_data.o: $(obj)/sbat.csv
+	$(OBJCOPY) -I binary -O elf64-x86-64 --rename-section .data=.sbat,readonly,data,contents $< $@
+
 clean-files := \
     include/asm/asm-macros.* \
     $(objtree)/.xen-syms.[0-9]* \
diff --git a/xen/arch/x86/sbat.csv.in b/xen/arch/x86/sbat.csv.in
new file mode 100644
index 000000000000..7cdc33dbd998
--- /dev/null
+++ b/xen/arch/x86/sbat.csv.in
@@ -0,0 +1,2 @@
+sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
+xen,1,Linux Foundation,xen,@@VERSION@@,https://xenproject.org/
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

