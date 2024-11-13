Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC54A9C6B82
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 10:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835152.1250991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9iO-0008Cj-Ns; Wed, 13 Nov 2024 09:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835152.1250991; Wed, 13 Nov 2024 09:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9iO-0008AL-JS; Wed, 13 Nov 2024 09:31:08 +0000
Received: by outflank-mailman (input) for mailman id 835152;
 Wed, 13 Nov 2024 09:31:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gr6F=SI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tB9iM-0007YE-9p
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 09:31:06 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 006b0a28-a1a2-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 10:31:03 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9aa8895facso1222392366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 01:31:03 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03bb7530sm6929630a12.43.2024.11.13.01.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 01:31:01 -0800 (PST)
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
X-Inumbo-ID: 006b0a28-a1a2-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAwNmIwYTI4LWExYTItMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDkwMjYzLjcyMjMxMywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731490263; x=1732095063; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs7n1P5X7Jke+I4bmzjJ2iKQwDiqHhXQ1kiL+k6H1ts=;
        b=hnIKhJA9/EYKcsWU7HD0b2ZPs4dAp2vOi/1L8KgZToZ3dDMmrU2mIEIjCusPnFmo+Z
         w0PO4PWyvahpmY3pwB/UQfTO7Wdpq4OGAVikMZhY3pvhamKfz0/8MEBbr/mse3jWXyCw
         FV596PZayhvMvfyyRXAePHO5snWFDWIjTFw+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731490263; x=1732095063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs7n1P5X7Jke+I4bmzjJ2iKQwDiqHhXQ1kiL+k6H1ts=;
        b=hAhivLCkRiWDVe+wKJ3EDCNrNNVkfoOHGL9atw9/B26yI9y6VOPGy1sL3axbChTUzK
         B3Y6woKxwqaVJXeVwWsE0h9m85jFxi4v7kgjeKJN3Up5rdCgGf0lTYoywat+tH2qbAhw
         sihvfUYg4q+hbcruIpzqHAbnPv41cKdC2MvTnPHsbVPqs+GG8HO34/y47wB8Nnu+XZUO
         WlfN9Ic+qxtTrrUozQT9Lf1eVMiv7HZsysXSEkGM4TW8EqlEYnzs0kVsSxK87GuWEBgq
         uJktAsmzYyRd/my3LS+t1SPLuWVrTVIBWexkAyHueBnonPBD8BsETv2QtnQFgYX1Kbg8
         eQsQ==
X-Gm-Message-State: AOJu0YySM+SHRcwMPnxjSo6e3JghzIKgk0WLuJ6BvlCt4tWmBPNhesJv
	60HtkXoMRTHm41RcZbP0eASGykV42YzNrrxwm+HszzcJ4Rp89ZIdlzqSU1yrcDC+L44nsuk7Cji
	/
X-Google-Smtp-Source: AGHT+IGF8u7M6B5/UBHjGhmB4aekj0WVqm3/KJd6Nrn1prSwc8n5Tj1nm9shu46HJCAPnxDeM9Rocw==
X-Received: by 2002:a17:907:7f1f:b0:a99:f4be:7a6a with SMTP id a640c23a62f3a-a9eeffdc630mr2031668866b.47.1731490262648;
        Wed, 13 Nov 2024 01:31:02 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH 1/2] x86/trampoline: Document how the trampoline is laid out
Date: Wed, 13 Nov 2024 09:30:57 +0000
Message-Id: <20241113093058.1562447-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
References: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is, to the best of my knowledge, accurate.  I am providing no comment on
how sane I believe it to be.

At the time of writing, the sizes of the regions are:

          offset  size
  AP:     0x0000  0x00b0
  S3:     0x00b0  0x0140
  Boot:   0x01f0  0x1780
  Heap:   0x1970  0xe690
  Stack:  0xf000  0x1000

and wakeup_stack overlays boot_edd_info.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/include/asm/trampoline.h | 55 ++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
index 8c1e0b48c2c9..d801bea400dc 100644
--- a/xen/arch/x86/include/asm/trampoline.h
+++ b/xen/arch/x86/include/asm/trampoline.h
@@ -37,12 +37,63 @@
  * manually as part of placement.
  */
 
+/*
+ * Layout of the trampoline.  Logical areas, in ascending order:
+ *
+ * 1) AP boot:
+ *
+ *    The INIT-SIPI-SIPI entrypoint.  This logic is stack-less so the identity
+ *    mapping (which must be executable) can at least be Read Only.
+ *
+ * 2) S3 resume:
+ *
+ *    The S3 wakeup logic may need to interact with the BIOS, so needs a
+ *    stack.  The stack pointer is set to trampoline_phys + 4k and clobbers an
+ *    undefined part of the the boot trampoline.  The stack is only used with
+ *    paging disabled.
+ *
+ * 3) Boot trampoline:
+ *
+ *    This region houses various data used by the AP/S3 paths too.  The boot
+ *    trampoline collects data from the BIOS (E820/EDD/EDID/etc), so needs a
+ *    stack.  The stack pointer is set to trampoline_phys + 64k and has 4k
+ *    space reserved.
+ *
+ * 4) Heap space:
+ *
+ *    The first 1k of heap space is statically allocated for VESA information.
+ *
+ *    The remainder of the heap is used by reloc(), logic which is otherwise
+ *    outside of the trampoline, to collect the bootloader metadata (cmdline,
+ *    module list, etc).  It does so with a bump allocator starting from the
+ *    end of the heap and allocating backwards.
+ *
+ * 5) Boot stack:
+ *
+ *    4k of space is reserved for the boot stack, at trampoline_phys + 64k.
+ *
+ * Therefore, when placed, it looks somewhat like this:
+ *
+ *    +--- trampoline_phys
+ *    v
+ *    |<-------------------------------64K------------------------------->|
+ *    |<-----4K----->|                                         |<---4K--->|
+ *    +----+----+----+-+---------------------------------------+----------+
+ *    | AP | S3 | Boot | Heap                                  |    Stack |
+ *    +----+----+------+---------------------------------------+----------+
+ *    ^           <~~^ ^                                    <~~^       <~~^
+ *    |              | +- trampoline_end[]                     |          |
+ *    |              +--- S3 Stack          reloc() allocator -+          |
+ *    +------------------ trampoline_start[]       Boot Stack ------------+
+ */
+
 #include <xen/compiler.h>
 #include <xen/types.h>
 
 /*
- * Start and end of the trampoline section, as linked into Xen.  It is within
- * the .init section and reclaimed after boot.
+ * Start and end of the trampoline section, as linked into Xen.  This covers
+ * the AP, S3 and Boot regions, but not the heap or stack.  It is within the
+ * .init section and reclaimed after boot.
  */
 /* SAF-0-safe */
 extern char trampoline_start[], trampoline_end[];

base-commit: 38febce5b35a7a4391906499b2046f01ec0129ca
-- 
2.39.5


