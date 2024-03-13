Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC03787AA08
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:07:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692520.1079773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBv-0008Kr-2b; Wed, 13 Mar 2024 15:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692520.1079773; Wed, 13 Mar 2024 15:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBu-0008I9-Sj; Wed, 13 Mar 2024 15:06:50 +0000
Received: by outflank-mailman (input) for mailman id 692520;
 Wed, 13 Mar 2024 15:06:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwto=KT=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkQBs-0007DJ-Nd
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:06:48 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fe8adc5-e14b-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 16:06:48 +0100 (CET)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-68f571be9ddso53971826d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:06:48 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a0ccb8a000000b0068fba49ae81sm4786811qvk.57.2024.03.13.08.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:06:46 -0700 (PDT)
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
X-Inumbo-ID: 4fe8adc5-e14b-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710342407; x=1710947207; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpYcDsI+M6briD4qjQYG+D2zD6DLXgwh1H3IqVNt/RM=;
        b=BigxsrG+Ozj/kCSgpXM618RVYXFnWY37FCTmX1rXMFaDaS9Gm6AcZelBo9XkcLeAoa
         OVo3ypZCETcE72FJj1Js7GIGEOzDeRxREu17g1ETpOAu/nfKJqc97cXRmIozwglJJpAL
         dgKvMoZGJuaHZ07hgn0Swjbk6X3yV47bZGAhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342407; x=1710947207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpYcDsI+M6briD4qjQYG+D2zD6DLXgwh1H3IqVNt/RM=;
        b=VIlr6mgxi1bC8ieDt658BXXQc4AmO6CEtof3yUl8ADexNKdgW1pq49aSznyfz18xa7
         i6rtsh0lRqvTstxjd906XLLSR0BvoYgTA5q7rQW7WGW1yuXj13ncavMZ50S0b1JQGcbi
         KUrSTkzmQDbF/j2Ypwb3Ddpg6CUtXfwBAJ+BT0IEEpMH5ZNeGwSQSDLvVMYbvK4WVvoc
         LX8+1nwS1MS8kU8Ep8nfyCyOrsDc2ZdyJB9CGHBOcTQy7Qu+lvKiDxZB4R5XTsujKv7f
         dycSbAiogRMGfG8AqcRGdUHfg2X3/g/lRtcce1HjcQKyYvbOwRs9GkWKFg1ac0QHpyji
         bg+Q==
X-Gm-Message-State: AOJu0Ywp5fWlXTtcoliZse0YW2z3vf4bYBW1Sq+YiuqUku82cL/daqHb
	go83p/b1YSjZQx9lo9Sf2cmE0XdbopLqciGXlb8AcS5yTZhQukmNDLrvMjSVaw==
X-Google-Smtp-Source: AGHT+IFKcbExg32xHCfDC0TqWfQFSuyDOMhILY/iB+QL677shqOJeZILRaYMT4dW0UohQCma6B2uYQ==
X-Received: by 2002:ad4:4bad:0:b0:690:cb91:80d9 with SMTP id i13-20020ad44bad000000b00690cb9180d9mr90900qvw.48.1710342407050;
        Wed, 13 Mar 2024 08:06:47 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 5/7] multiboot2: Add support for 64-bit entry addresses
Date: Wed, 13 Mar 2024 15:07:46 +0000
Message-ID: <20240313150748.791236-6-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313150748.791236-1-ross.lagerwall@citrix.com>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for entry addresses that may be either 32 bits or 64 bits in
size. This may be necessary if the binary is built with an entry address
above 4G.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 grub-core/loader/multiboot_mbi2.c | 10 ++++++++--
 include/multiboot2.h              |  6 +++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/grub-core/loader/multiboot_mbi2.c b/grub-core/loader/multiboot_mbi2.c
index 3ec96e2f29b9..c268aa614284 100644
--- a/grub-core/loader/multiboot_mbi2.c
+++ b/grub-core/loader/multiboot_mbi2.c
@@ -205,13 +205,19 @@ grub_multiboot2_load (grub_file_t file, const char *filename)
 
       case MULTIBOOT_HEADER_TAG_ENTRY_ADDRESS:
 	entry_specified = 1;
-	entry = ((struct multiboot_header_tag_entry_address *) tag)->entry_addr;
+	if ((tag->size - sizeof(struct multiboot_header_tag)) == sizeof(multiboot_uint64_t))
+	  entry = ((struct multiboot_header_tag_entry_address *) tag)->entry_addr64;
+	else
+	  entry = ((struct multiboot_header_tag_entry_address *) tag)->entry_addr32;
 	break;
 
       case MULTIBOOT_HEADER_TAG_ENTRY_ADDRESS_EFI64:
 #if defined (GRUB_MACHINE_EFI) && defined (__x86_64__)
 	efi_entry_specified = 1;
-	efi_entry = ((struct multiboot_header_tag_entry_address *) tag)->entry_addr;
+	if ((tag->size - sizeof(struct multiboot_header_tag)) == sizeof(multiboot_uint64_t))
+	  efi_entry = ((struct multiboot_header_tag_entry_address *) tag)->entry_addr64;
+	else
+	  efi_entry = ((struct multiboot_header_tag_entry_address *) tag)->entry_addr32;
 #endif
 	break;
 
diff --git a/include/multiboot2.h b/include/multiboot2.h
index f4377bf7b394..e4798bfef937 100644
--- a/include/multiboot2.h
+++ b/include/multiboot2.h
@@ -140,7 +140,11 @@ struct multiboot_header_tag_entry_address
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


