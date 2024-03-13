Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A7B87AA06
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:06:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692518.1079752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBp-0007k1-G7; Wed, 13 Mar 2024 15:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692518.1079752; Wed, 13 Mar 2024 15:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBp-0007i6-BY; Wed, 13 Mar 2024 15:06:45 +0000
Received: by outflank-mailman (input) for mailman id 692518;
 Wed, 13 Mar 2024 15:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwto=KT=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkQBo-0007E2-HQ
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:06:44 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cbb0028-e14b-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 16:06:42 +0100 (CET)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-690ca2d2c5bso24721776d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:06:42 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a0ccb8a000000b0068fba49ae81sm4786811qvk.57.2024.03.13.08.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:06:40 -0700 (PDT)
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
X-Inumbo-ID: 4cbb0028-e14b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710342401; x=1710947201; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzi7gexZvWQMljijVlDNbWhNKDms1QxVcPrC/wEDf/o=;
        b=gsWUT/FF4FT6Ape+kidsf/9F6+xWleVUxMvN/8JxfiNidnrjfKqKy4ylBmHC0VWI/9
         4JLy/g+Tu0vprr09BW9ZuGDeVSVXsXjxyLVm2sgPnnuQPVWutLpsJ8rvEWg5F9LFJN03
         VxL4nV+NtVEVaqiyqTq79OuwgN35Skb74iDBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342401; x=1710947201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzi7gexZvWQMljijVlDNbWhNKDms1QxVcPrC/wEDf/o=;
        b=BdXcQeNxWCtNot8q7RqyCHO3pDZuAjnC5dy/Zj6aQbAfKerPecbQxfabBvjyyL9fcK
         hlHiqEJ3qX5fC+WMq24a4C67xlo8X4nxgjC/s5cuOKgbd3UFVPPXsm2gVoak72robC77
         20DBAi1VHilYvzEg8a9/Fo71aPJHD+piyUZWcBqbjrowLfQ77w8fMt6Mq/VWHuGYrcbT
         Hu0XZBo4F6hYTu+GWYLf84MRgf42C1Xm+h31RlDC/h8RZEKM1TNTJXW2nRSWMVu8AqoZ
         MGE+DNTTQnH4tt8gLYiMEhSdL5jJ5sERn/ELrnCFcladAwf6+ipAr9x08wKsZWM17f3A
         HpJg==
X-Gm-Message-State: AOJu0YynjNJ2udcjijZ8QBENL+eD6hqDaj3hqXaDNr5Yx6FDQH7jwX+x
	iRTrI+GM0xoCtbPGA3muzgBA8afM2Qw4iep5Lhp8AluwW7Zzm7iblRw+u1mbCeNraXuwUIViCZJ
	XlOLN
X-Google-Smtp-Source: AGHT+IH9fmrW3gMuuJAfjFbZjjqE4vpclj5uYDw95WuKdz/9FlbDNxdI+xMFfZNCxETx42Aw/ybjQA==
X-Received: by 2002:a05:6214:9c7:b0:690:c863:f06d with SMTP id dp7-20020a05621409c700b00690c863f06dmr68485qvb.40.1710342401639;
        Wed, 13 Mar 2024 08:06:41 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 2/7] multiboot2: Allow 64-bit entry tags
Date: Wed, 13 Mar 2024 15:07:43 +0000
Message-ID: <20240313150748.791236-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313150748.791236-1-ross.lagerwall@citrix.com>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Binaries may be built with entry points above 4G. While bootloaders may
relocate them below 4G, it should be possible for the binary to specify
those entry points. Therefore, extend the multiboot2 protocol such that
64 bit addresses are allowed for entry points. The extension is done in
a backwards-compatible way.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 doc/multiboot.texi | 32 +++++++++++++++++++-------------
 doc/multiboot2.h   |  6 +++++-
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/doc/multiboot.texi b/doc/multiboot.texi
index d12719c744eb..049afab53c1f 100644
--- a/doc/multiboot.texi
+++ b/doc/multiboot.texi
@@ -522,12 +522,12 @@ header.
 
 @example
 @group
-        +-------------------+
-u16     | type = 3          |
-u16     | flags             |
-u32     | size              |
-u32     | entry_addr        |
-        +-------------------+
+          +-------------------+
+u16       | type = 3          |
+u16       | flags             |
+u32       | size              |
+u32 / u64 | entry_addr        |
+          +-------------------+
 @end group
 @end example
 
@@ -538,7 +538,10 @@ The meaning of each is as follows:
 
 @item entry_addr
 The physical address to which the boot loader should jump in order to
-start running the operating system.
+start running the operating system. @samp{entry_addr} may be specified
+either as a @samp{u32} or @samp{u64}. The bootloader should use the
+header size to determine the size of @samp{entry_addr}.
+
 @end table
 
 @subsection EFI i386 entry address tag of Multiboot2 header
@@ -573,12 +576,12 @@ tag of Multiboot2 header are ignored.
 
 @example
 @group
-        +-------------------+
-u16     | type = 9          |
-u16     | flags             |
-u32     | size              |
-u32     | entry_addr        |
-        +-------------------+
+          +-------------------+
+u16       | type = 9          |
+u16       | flags             |
+u32       | size              |
+u32 / u64 | entry_addr        |
+          +-------------------+
 @end group
 @end example
 
@@ -594,6 +597,9 @@ is as follows:
 @item entry_addr
 The physical address to which the boot loader should jump in order to
 start running EFI amd64 compatible operating system code.
+@samp{entry_addr} may be specified either as a @samp{u32} or @samp{u64}.
+The bootloader should use the header size to determine the size of
+@samp{entry_addr}.
 @end table
 
 This tag is taken into account only on EFI amd64 platforms
diff --git a/doc/multiboot2.h b/doc/multiboot2.h
index d4cae05706e4..a994a7b28b02 100644
--- a/doc/multiboot2.h
+++ b/doc/multiboot2.h
@@ -141,7 +141,11 @@ struct multiboot_header_tag_entry_address
   multiboot_uint16_t type;
   multiboot_uint16_t flags;
   multiboot_uint32_t size;
-  multiboot_uint32_t entry_addr;
+  union
+  {
+    multiboot_uint32_t entry_addr32;
+    multiboot_uint64_t entry_addr64;
+  };
 };
 
 struct multiboot_header_tag_console_flags
-- 
2.43.0


