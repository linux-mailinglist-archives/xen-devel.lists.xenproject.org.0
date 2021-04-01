Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 776CE35129E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104230.199114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtt3-0004d5-6w; Thu, 01 Apr 2021 09:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104230.199114; Thu, 01 Apr 2021 09:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtt3-0004cc-2f; Thu, 01 Apr 2021 09:45:13 +0000
Received: by outflank-mailman (input) for mailman id 104230;
 Thu, 01 Apr 2021 09:45:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRtt1-0004cP-P5
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:45:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdc01e63-a97f-4d35-a452-27dddd54c2a6;
 Thu, 01 Apr 2021 09:45:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25BD5AEC2;
 Thu,  1 Apr 2021 09:45:10 +0000 (UTC)
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
X-Inumbo-ID: fdc01e63-a97f-4d35-a452-27dddd54c2a6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617270310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zGF5/no4yyDySevuLNlCcruxFje6e6BtvrRRyJsweIc=;
	b=QUl1VmTsvmGOtkCxbMHlKH6XDNRr9b7AwnLSaHzocfueemup8rnq/nu2jKjyszFeQrYutJ
	SNbJT0+x7uqF1oj9w54L+o8q/r+E8kMivj2Flaicqsdws1y3n5zm31BM/OcOUyyxXZN7j3
	lkLiPaFKQGTkXhj/dR9EGEPor/nN7T8=
Subject: [PATCH 3/8] x86/EFI: program headers are an ELF concept
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Message-ID: <017478f9-76d2-4dc4-de93-b662c4552968@suse.com>
Date: Thu, 1 Apr 2021 11:45:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While they apparently do no harm when building xen.efi, their use is
potentially misleading. Conditionalize their use to be for just the ELF
binary we produce.

No change to the resulting binaries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -34,13 +34,19 @@ OUTPUT_FORMAT(FORMAT, FORMAT, FORMAT)
 
 OUTPUT_ARCH(i386:x86-64)
 
+#ifndef EFI
 PHDRS
 {
   text PT_LOAD ;
-#if (defined(BUILD_ID) || defined (CONFIG_PVH_GUEST)) && !defined(EFI)
+#if defined(BUILD_ID) || defined(CONFIG_PVH_GUEST)
   note PT_NOTE ;
 #endif
 }
+#define PHDR(x) :x
+#else
+#define PHDR(x)
+#endif
+
 SECTIONS
 {
 #if !defined(EFI)
@@ -83,7 +89,7 @@ SECTIONS
        *(.text.kexec)
        *(.gnu.warning)
        _etext = .;             /* End of text section */
-  } :text = 0x9090
+  } PHDR(text) = 0x9090
 
   . = ALIGN(SECTION_ALIGN);
   __2M_text_end = .;
@@ -134,7 +140,7 @@ SECTIONS
        *(SORT(.data.vpci.*))
        __end_vpci_array = .;
 #endif
-  } :text
+  } PHDR(text)
 
 #if defined(CONFIG_PVH_GUEST) && !defined(EFI)
   DECL_SECTION(.note.Xen) {
@@ -160,7 +166,7 @@ SECTIONS
        __note_gnu_build_id_start = .;
        *(.buildid)
        __note_gnu_build_id_end = .;
-  } :text
+  }
 #endif
 #endif
 
@@ -260,7 +266,7 @@ SECTIONS
        *(SORT(.data.vpci.*))
        __end_vpci_array = .;
 #endif
-  } :text
+  } PHDR(text)
 
   . = ALIGN(SECTION_ALIGN);
   __init_end = .;
@@ -281,7 +287,7 @@ SECTIONS
        *(.data.paramhypfs)
        __paramhypfs_end = .;
 #endif
-  } :text
+  } PHDR(text)
 
   DECL_SECTION(.data) {
        *(.data.page_aligned)
@@ -289,7 +295,7 @@ SECTIONS
        *(.data.rel)
        *(.data.rel.*)
        CONSTRUCTORS
-  } :text
+  } PHDR(text)
 
   DECL_SECTION(.bss) {
        __bss_start = .;
@@ -306,7 +312,7 @@ SECTIONS
        *(.bss)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
-  } :text
+  } PHDR(text)
   _end = . ;
 
   . = ALIGN(SECTION_ALIGN);
@@ -316,12 +322,12 @@ SECTIONS
   . = ALIGN(4);
   DECL_SECTION(.reloc) {
     *(.reloc)
-  } :text
+  }
   /* Trick the linker into setting the image size to exactly 16Mb. */
   . = ALIGN(__section_alignment__);
   DECL_SECTION(.pad) {
     . = ALIGN(MB(16));
-  } :text
+  }
 #endif
 
 #ifndef XEN_BUILD_EFI


