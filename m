Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABD19C85A1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 10:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836112.1252012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVpw-0004eS-1u; Thu, 14 Nov 2024 09:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836112.1252012; Thu, 14 Nov 2024 09:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVpv-0004bu-Ua; Thu, 14 Nov 2024 09:08:23 +0000
Received: by outflank-mailman (input) for mailman id 836112;
 Thu, 14 Nov 2024 09:08:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TDs=SJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBVpu-0003tk-Sv
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 09:08:22 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdcb9904-a267-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 10:08:19 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa20c733e92so46059066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 01:08:19 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046ea8sm38491166b.169.2024.11.14.01.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 01:08:16 -0800 (PST)
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
X-Inumbo-ID: fdcb9904-a267-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZkY2I5OTA0LWEyNjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTc1Mjk5LjY3NTcyOCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731575298; x=1732180098; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgFck1QSX+DGBvLH2KMed7bPHmM2CfMPurcUyYk6r4Y=;
        b=vzvinA1wTTdh3j9arAF0+e6rU0/x8kIFIdcyT6X63ZF2fhWcBVLnHgv/+zOpc0/Iam
         bBfGAit6WratVlmW1MiwZll8qTXcfwgiTfbVIS0D/Uj3MNg6kN3lAJGxQAoRTagXIaZp
         LTKsAgLsAeM2KMcEZp4yIbDGDHi2ikranLwR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731575298; x=1732180098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgFck1QSX+DGBvLH2KMed7bPHmM2CfMPurcUyYk6r4Y=;
        b=e6j+XqcH1IJqSOmCzT65IQqlJgnhyiEmLdCFnoXFg+FTLySIKmbP+DMGmZto4VwDev
         oxVoBFWWN05xaKTLmjG+OAtO8dT0fP0UVn1Z+HPFpvLfBTjkMi0J7Sbt6+o6QsSc7qRp
         wY2PnZZgAsagfhHWqYTAto+m+bg4NvHPNQbi0Tq4G5ZezuL/WeYUqQq3uaUgr+WohAxR
         u1soxUGAV5wX/pm4ATH6PeBE+OIPQQMAAZMY4KmIO/LzPjcPN65pQqxjrVUIGBjWiuMG
         b6aRnN4GD+ZGpXn7QHZ9H5O3Hc2YZmFTyCUOuvJnURbDADoYfD6peCnqOHi7mAcV4tWm
         h0Bw==
X-Gm-Message-State: AOJu0YweVkJo+dVKd1tMgQJu2NJRC3Mvre45wlfEnTLacBobRoB08rDr
	SvQLtndBBQByJk+WAr/5UeoBauHmSy2xMc7+xkgLIaMXchZ5uNON5IgvNloKcnlrU94RflPa3nl
	H
X-Google-Smtp-Source: AGHT+IGZHkJEdE1B32ImTc9NSeQumCnYUCr+A7iFP2bccfMOo0dXV25Wp/aOvAqzwA8rvVDqrOeMIQ==
X-Received: by 2002:a17:907:a44:b0:a9a:a5c:e23b with SMTP id a640c23a62f3a-aa1f813e608mr578789166b.58.1731575297951;
        Thu, 14 Nov 2024 01:08:17 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v2 3/4] x86/trampoline: Document how the trampoline is laid out
Date: Thu, 14 Nov 2024 09:08:09 +0000
Message-Id: <20241114090810.1961175-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
References: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is, to the best of my knowledge, accurate.  I am providing no comment on
how sane I believe it to be.

At the time of writing, the sizes of the regions are:

          offset  size
  AP:     0x0000  0x00b0
  S3:     0x00b0  0x0229
  Boot:   0x02d9  0x1697
  Heap:   0x1970  0xe690
  Stack:  0xf000  0x1000

and wakeup_stack overlays boot_edd_info.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>

v2:
 * Rebase over the introduction of trampoline_perm_end
 * Fix the description of the boot stack position
---
 xen/arch/x86/include/asm/trampoline.h | 57 ++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
index 8c1e0b48c2c9..559111d2ccfc 100644
--- a/xen/arch/x86/include/asm/trampoline.h
+++ b/xen/arch/x86/include/asm/trampoline.h
@@ -37,12 +37,65 @@
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
+ *    arbitrary part of the the boot trampoline.  The stack is only used with
+ *    paging disabled.
+ *
+ * 3) Boot trampoline:
+ *
+ *    The boot trampoline collects data from the BIOS (E820/EDD/EDID/etc), so
+ *    needs a stack.  The stack pointer is set to trampoline_phys + 64k, is 4k
+ *    in size, and only used with paging disabled.
+ *
+ * 4) Heap space:
+ *
+ *    The first 1k of heap space is statically allocated scratch space for
+ *    VESA information.
+ *
+ *    The remainder of the heap is used by reloc(), logic which is otherwise
+ *    outside of the trampoline, to collect the bootloader metadata (cmdline,
+ *    module list, etc).  It does so with a bump allocator starting from the
+ *    end of the heap and allocating backwards.
+ *
+ * 5) Boot stack:
+ *
+ *    The boot stack is 4k in size at the end of the trampoline, taking the
+ *    total trampoline size to 64k.
+ *
+ * Therefore, when placed, it looks somewhat like this:
+ *
+ *    +--- trampoline_phys
+ *    v
+ *    |<-------------------------------64K------------------------------->|
+ *    |<-----4K----->|                                         |<---4K--->|
+ *    +-------+------+-+---------------------------------------+----------+
+ *    | AP+S3 |  Boot  | Heap                                  |    Stack |
+ *    +-------+------+-+---------------------------------------+----------+
+ *    ^       ^   <~~^ ^                                    <~~^       <~~^
+ *    |       |      | +- trampoline_end[]                     |          |
+ *    |       |      +--- wakeup_stack      reloc() allocator -+          |
+ *    |       +---------- trampoline_perm_end      Boot Stack ------------+
+ *    +------------------ trampoline_start[]
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
-- 
2.39.5


