Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D2CA77BC8
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934184.1335984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbPN-0006YD-09; Tue, 01 Apr 2025 13:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934184.1335984; Tue, 01 Apr 2025 13:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbPM-0006TW-SM; Tue, 01 Apr 2025 13:12:00 +0000
Received: by outflank-mailman (input) for mailman id 934184;
 Tue, 01 Apr 2025 13:11:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbMf-0000Od-KR
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:09:13 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f3c5ade-0efa-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 15:09:08 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac2bdea5a38so907883266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:09:08 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac719223e4dsm763101066b.24.2025.04.01.06.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:09:07 -0700 (PDT)
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
X-Inumbo-ID: 7f3c5ade-0efa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743512947; x=1744117747; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LTQkhLhC9QAjpitQrbO7ny5f+6pVlhp14370Lqax5o=;
        b=t/Ui8srvOTYkPt3TB9gdcPzITc1WARf0mT4nefjh/e3Eoli69wcAxNIngVMCqiDtQa
         ORzg4Afr8dPi8omud4jaGXG2uZNXuFNfZHOLuFXkpzTVol8an2R2MQrd1hvknPoeXivs
         s0kVlhSaD5Lh/EUAFOEnkimpgLD/tHNft/dn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512947; x=1744117747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LTQkhLhC9QAjpitQrbO7ny5f+6pVlhp14370Lqax5o=;
        b=vt3uJi3o5fDoRyZyqpjOBg1wbmOtzY7LMaitmWXBjoML+30Cn48JzXIxjakwe88T0/
         WR4CKwC3z2be2dsqWhu8QV9KHj8KJNA6MwS8J7aqImu+tXj6C7OISiIbten7J+ZrwwHN
         dt3C2SMmL29zruOXBaD5EzBmP83RgcRsAJ4jJjbpAkPlzq+fFU0fqeDCoD/YYs/fNJsT
         YlFCOnNIC19j6FY4s26+B/CIvQW/a2tpv1CwCXC6cB9c3tW9R7GGYy0BtAwqbobzjpVQ
         J+/ClvKvkF7b6Zb/r0RhmL/PcARMbZOJbEFKwsqxF/RZ5VsGjFckVYyruNC//1B3Hx8c
         CmXg==
X-Gm-Message-State: AOJu0YwjvgSUuvvaGpnOxNVdU9MGhTk2PiRwIHm/JgOFpp+hVjpjGIG9
	ztcpu+eBk6g7JkwV62NL5e9AjTAq0v/JuiizeJuTdvrpvGxGJUXk8cnBg8h0YsDxHHA1Tb5tUGS
	X
X-Gm-Gg: ASbGncsAA8xddCIUju/A+HdGlY5P4BqAxVCijOKkDp2zlYgsMxYyNhyfB53t6bRar6Q
	NczaO6caqr4KpzFyNKGwa+wuljojoDamt0fJiS+milsMVTYznPqcPeN8BmPSa4YQTTieRBQ2wN/
	TCri/B0iB0Cn+MtLGd0Apgp2AGDtmZ+Y95m7QyoP3BAKHP3TG4tUypas35+GFNl1GvdyWahgg+Q
	TxrO0gjqZoBY3Q29hxs+AAIgwkOO9q4kVtKod+k5kVcheb8Dvjdirmb9vwKd6MYCKnt5rCUdrlp
	XaSLaYA5ve/J9pWFMh3FD5Kzhg/Biu5YUFSN9Qd3ymsWBy2SCw==
X-Google-Smtp-Source: AGHT+IG1AIAtLq4CiN9qMplBG9p/hjmatcs3t1KrHTBJAC7KcEg/Oo4Z4AuluQw1FWKNeNMhFndeBg==
X-Received: by 2002:a17:907:97c2:b0:abf:63fa:43d4 with SMTP id a640c23a62f3a-ac738bbe89bmr1018652166b.44.1743512947558;
        Tue, 01 Apr 2025 06:09:07 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 10/11] x86/efi: do not merge all .init sections
Date: Tue,  1 Apr 2025 15:08:39 +0200
Message-ID: <20250401130840.72119-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401130840.72119-1-roger.pau@citrix.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As a result of having no relocations against text sections, there's no need
for a single .init section that's read-write-execute, as .init.text is no
longer modified.

Remove the bodge and fallback to the layout used by ELF images with an
.init.text and .init.data section.

The resulting PE sections are:

Sections:
Idx Name          Size      VMA               LMA               File off  Algn
  0 .text         00193f6b  ffff82d040200000  ffff82d040200000  00000480  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .rodata       0008a010  ffff82d040400000  ffff82d040400000  00194400  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  2 .buildid      00000035  ffff82d04048a010  ffff82d04048a010  0021e420  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init.text    00049e70  ffff82d040600000  ffff82d040600000  0021e460  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  4 .init.data    000560a8  ffff82d040800000  ffff82d040800000  002682e0  2**2
                  CONTENTS, ALLOC, LOAD, DATA
[...]

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Align .init.text.
 - Clarify commit message.
---
 xen/arch/x86/xen.lds.S | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 1191bf4e2ddd..852aa135a76c 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -201,11 +201,7 @@ SECTIONS
   __2M_init_start = .;         /* Start of 2M superpages, mapped RWX (boot only). */
   . = ALIGN(PAGE_SIZE);             /* Init code and data */
   __init_begin = .;
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-  DECL_SECTION(.init) {
-#else
   DECL_SECTION(.init.text) {
-#endif
        _sinittext = .;
        *(.init.text)
        *(.text.startup)
@@ -218,12 +214,15 @@ SECTIONS
         */
        *(.altinstr_replacement)
 
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-       . = ALIGN(SMP_CACHE_BYTES);
-#else
   } PHDR(text)
-  DECL_SECTION(.init.data) {
+#ifdef EFI
+  /*
+   * Align to prevent the data section from re-using the tail of an RX mapping
+   * from the previous text section.
+   */
+  . = ALIGN(SECTION_ALIGN);
 #endif
+  DECL_SECTION(.init.data) {
        *(.init.bss.stack_aligned)
 
        . = ALIGN(POINTER_ALIGN);
-- 
2.48.1


