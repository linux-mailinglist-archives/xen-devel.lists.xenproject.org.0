Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0668902B9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698955.1091259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprP8-0001p8-SC; Thu, 28 Mar 2024 15:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698955.1091259; Thu, 28 Mar 2024 15:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprP8-0001nP-PA; Thu, 28 Mar 2024 15:10:58 +0000
Received: by outflank-mailman (input) for mailman id 698955;
 Thu, 28 Mar 2024 15:10:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyVg=LC=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rprP6-0001mV-Tm
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:10:56 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fbebd18-ed15-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:10:55 +0100 (CET)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-43182c2457bso5988011cf.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:10:55 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 cr7-20020a05622a428700b004313f54aaa9sm696300qtb.5.2024.03.28.08.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 08:10:54 -0700 (PDT)
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
X-Inumbo-ID: 5fbebd18-ed15-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711638654; x=1712243454; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eq3AT7pXj0vQG5qtRB/nBOWtX8ZshbTnUcp8uTcSupQ=;
        b=hwGu4NMop3eNMtbtnLK9ILrbEElqX41Jnx2wkFsiWenb3v09KJEDiqbC6qpBXbPy+G
         GuMFTyrsIoXDoOmh2uGz1rbtW+gnvH3lXsuc3uTrXXxVi5VWm5W97VssreunDlY/Cw+4
         AKyWbheTlj7I5ZCKxdixf8bzobiMg3BP/PSy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638654; x=1712243454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eq3AT7pXj0vQG5qtRB/nBOWtX8ZshbTnUcp8uTcSupQ=;
        b=OhLs+FEGLHMRSP/0IwROqe6bmVhjFbCgvdM2NJD2Aken7/ky8IQbqyYiwWuC5EnLnn
         xnf83oFec+ZWPeK6M7Prfh+q8sdNbOnlYOltfjdHhOqPtxht3b/ud2xrWHTyv5rC3cs0
         mil15YW7ypmP5CmpHQ2udQogwIU5v/8ZYgmg91UVT5KSuc1wzx0fAwzEbd6a6WFyqyUX
         9BJ1YbOJe+mqJ6hQwuaPs+MzvGkCbDOkS8AnsZ/RHXuR0yUbZ0kRBfKbyoZHrnu0irBI
         5GYcZDsU6bygG+NJKJ9axvWLrCrv73A1rGtM0mP/KWE+d1Wu0zYSRFh7N2Y2aVe2yTcT
         jgQQ==
X-Gm-Message-State: AOJu0Yxzyb7+wEpwzuT4EfnZRmIeqia8R5ihNycDXaQodZx54NuJhdcf
	n+y/jdGDlENYS5oSfDOlGunIIOFzTMnkBhAKR/HWwOD96scAeLWgAvl/yhgB6w==
X-Google-Smtp-Source: AGHT+IFRiKrVvRemL8kfvC3qN4N8Lcc7JSK3BFibtolaMcbVYPlf+yQnlL6cYNo2NBNzseeKPq4+1w==
X-Received: by 2002:a05:622a:194:b0:432:b960:b10 with SMTP id s20-20020a05622a019400b00432b9600b10mr1205534qtw.60.1711638654610;
        Thu, 28 Mar 2024 08:10:54 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Daniel Kiper <dkiper@net-space.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 1/3] multiboot2: Add support for the PE binary type
Date: Thu, 28 Mar 2024 15:13:00 +0000
Message-ID: <20240328151302.1451158-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328151302.1451158-1-ross.lagerwall@citrix.com>
References: <20240328151302.1451158-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, multiboot2-compatible bootloaders can load ELF binaries and
a.out binaries. The presence of the address header tag determines
how the bootloader tries to interpret the binary (a.out if the address
tag is present else ELF).

In addition to the existing address and ELF load types, specify that
boot loaders may optionally support PE binaries as well. This new type
is a useful addition since PE binaries can be signed and verified (i.e.
used with Secure Boot). Boot loaders can distinguish between ELF and PE
binaries using magic numbers since it is not possible for a binary to be
both an ELF and PE binary at the same time.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 doc/multiboot.texi | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/doc/multiboot.texi b/doc/multiboot.texi
index df8a0d056e76..d26c35b54cd4 100644
--- a/doc/multiboot.texi
+++ b/doc/multiboot.texi
@@ -510,12 +510,15 @@ assumes that no bss segment is present.
 @end table
 
 Note: This information does not need to be provided if the kernel image
-is in @sc{elf} format, but it must be provided if the image is in a.out
-format or in some other format. When the address tag is present it must
-be used in order to load the image, regardless of whether an @sc{elf}
-header is also present. Compliant boot loaders must be able to load
-images that are either in @sc{elf} format or contain the address tag
-embedded in the Multiboot2 header.
+is in @sc{elf} or @sc{PE} format, but it must be provided if the image
+is in a.out format or in some other format. When the address tag is
+present it must be used in order to load the image, regardless of
+whether an @sc{elf} or @sc{PE} header is also present. Compliant boot
+loaders must be able to load images that are either in @sc{elf} format
+or contain the address tag embedded in the Multiboot2 header. Compliant
+boot loaders may optionally support loading images in @sc{PE} format.
+When the address tag is not present, the boot loader should use magic
+numbers to identify the type of the image to determine how to load it.
 
 @subsection The entry address tag of Multiboot2 header
 
@@ -565,7 +568,7 @@ start running EFI i386 compatible operating system code.
 
 This tag is taken into account only on EFI i386 platforms
 when Multiboot2 image header contains EFI boot services tag.
-Then entry point specified in ELF header and the entry address
+Then entry point specified in ELF or PE header and the entry address
 tag of Multiboot2 header are ignored.
 
 @subsection EFI amd64 entry address tag of Multiboot2 header
@@ -597,7 +600,7 @@ start running EFI amd64 compatible operating system code.
 
 This tag is taken into account only on EFI amd64 platforms
 when Multiboot2 image header contains EFI boot services tag.
-Then entry point specified in ELF header and the entry address
+Then entry point specified in ELF or PE header and the entry address
 tag of Multiboot2 header are ignored.
 
 @node Console header tags
-- 
2.43.0


