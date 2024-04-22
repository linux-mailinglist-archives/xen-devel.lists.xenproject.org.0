Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3515F8AC9DD
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 11:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709845.1108857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryqLb-0001ts-Vl; Mon, 22 Apr 2024 09:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709845.1108857; Mon, 22 Apr 2024 09:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryqLb-0001oP-SV; Mon, 22 Apr 2024 09:52:27 +0000
Received: by outflank-mailman (input) for mailman id 709845;
 Mon, 22 Apr 2024 09:52:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ds6W=L3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ryqLa-0001iC-9G
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 09:52:26 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04eefaef-008e-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 11:52:24 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-419fc79e4dcso8530035e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 02:52:24 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 bg5-20020a05600c3c8500b00419f419236fsm7698672wmb.41.2024.04.22.02.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 02:52:23 -0700 (PDT)
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
X-Inumbo-ID: 04eefaef-008e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713779543; x=1714384343; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhEkgYuK+r1ELgYSSGiiXM5uV0+14tGLsKjiIz9KioU=;
        b=F41F2J3iof6EXvjDF+0UzOXTHYl7FpT7EhG5XWHppig56gNL9Xs5z40tvkgLgc3uAs
         63MGvGGLnGqC4//B2Vyus0ry4HIx/q/ZWv8+MX39setTaUW6k6WkL2nj8uJnI9TAJg3u
         YLR+UUj5hgPWYq1WQph2ydmIN9JZke90erwAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713779543; x=1714384343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhEkgYuK+r1ELgYSSGiiXM5uV0+14tGLsKjiIz9KioU=;
        b=v8W1g6WuwK+6d+cOIjHlIdwWD1847ToT0+fyvzoOXkdEOsB4RK3ME4EyVdJf+RR6vN
         Ow5Jahvw4sRlVL+//9HoLU1HyV7wS7rIXFawV3a62rfCAeeytFU/M2Z4G6yH9ZGOqy7t
         MZjjXQsX4WISbhw6B8sRMDu31mFi5ri6wVsOBb5wU1gvYXLQDGiUa/mEDtF8JyMrJcqB
         3lLSiKJSJ5m5gURaY4oGPiDP9Fut1UgGVAw325oFjQuHwR9RfWeMEke5fVDpCL90v2Ld
         Ghi5qyfhdGMxG8uy2MbCeGlVBq4TcCdTvrYGLeg0o/RmJ3pSWafAr/8i0M4K1E3zc1/X
         CBtA==
X-Gm-Message-State: AOJu0YzPus8ZDbDkQjGz6zUReT6Ixi0eQ1x7AqNpyEa85pERA0qlbo0Z
	76ThtYQuBdz8fxAJTbfhv0tEdXrbSzLJFfM4u3gav6WuWZ4r49JyFObYNcijGD2gbXmtkcRitkf
	P
X-Google-Smtp-Source: AGHT+IGY/uyF9bFwXpOVTURJt4E4Mj/8mD9HBd5Tk1KUZCIxt2bebkwvsxsbZYzpWzki2upMTKOqhg==
X-Received: by 2002:a05:600c:4fd2:b0:418:969b:cb46 with SMTP id o18-20020a05600c4fd200b00418969bcb46mr6539040wmq.28.1713779543245;
        Mon, 22 Apr 2024 02:52:23 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/2] x86/video: add boot_video_info offset generation to asm-offsets
Date: Mon, 22 Apr 2024 11:52:15 +0200
Message-ID: <20240422095216.20211-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240422095216.20211-1-roger.pau@citrix.com>
References: <20240422095216.20211-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently the offsets into the boot_video_info struct are manually encoded in
video.S, which is fragile.  Generate them in asm-offsets.c and switch the
current code to use those instead.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
 - Style changes.
 - Calculate remaining BVI size without referencing specific fields.
---
 xen/arch/x86/boot/video.S         | 83 ++++++++++++-------------------
 xen/arch/x86/x86_64/asm-offsets.c | 26 ++++++++++
 2 files changed, 58 insertions(+), 51 deletions(-)

diff --git a/xen/arch/x86/boot/video.S b/xen/arch/x86/boot/video.S
index 0ae04f270f8c..f78906878a16 100644
--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -26,32 +26,13 @@
 /* Force 400 scan lines for standard modes (hack to fix bad BIOS behaviour */
 #undef CONFIG_VIDEO_400_HACK
 
-/* Positions of various video parameters passed to the kernel */
-/* (see also include/linux/tty.h) */
-#define PARAM_CURSOR_POS        0x00
-#define PARAM_VIDEO_MODE        0x02
-#define PARAM_VIDEO_COLS        0x03
-#define PARAM_VIDEO_LINES       0x04
-#define PARAM_HAVE_VGA          0x05
-#define PARAM_FONT_POINTS       0x06
-#define PARAM_CAPABILITIES      0x08
-#define PARAM_LFB_LINELENGTH    0x0c
-#define PARAM_LFB_WIDTH         0x0e
-#define PARAM_LFB_HEIGHT        0x10
-#define PARAM_LFB_DEPTH         0x12
-#define PARAM_LFB_BASE          0x14
-#define PARAM_LFB_SIZE          0x18
-#define PARAM_LFB_COLORS        0x1c
-#define PARAM_VESAPM_SEG        0x24
-#define PARAM_VESAPM_OFF        0x26
-#define PARAM_VESA_ATTRIB       0x28
 #define _param(param) bootsym(boot_vid_info)+(param)
 
 video:  xorw    %ax, %ax
         movw    %ax, %gs        # GS is zero
         cld
         call    basic_detect    # Basic adapter type testing (EGA/VGA/MDA/CGA)
-        cmpb    $0,_param(PARAM_HAVE_VGA)
+        cmpb    $0, _param(BVI_have_vga)
         je      1f                # Bail if there's no VGA
         movw    bootsym(boot_vid_mode), %ax     # User selected video mode
         cmpw    $ASK_VGA, %ax                   # Bring up the menu
@@ -69,7 +50,7 @@ vid1:   call    store_edid
 
 # Detect if we have CGA, MDA, EGA or VGA and pass it to the kernel.
 basic_detect:
-        movb    $0, _param(PARAM_HAVE_VGA)
+        movb    $0, _param(BVI_have_vga)
         movb    $0x12, %ah                      # Check EGA/VGA
         movb    $0x10, %bl
         int     $0x10
@@ -79,7 +60,7 @@ basic_detect:
         int     $0x10
         cmpb    $0x1a, %al                      # 1a means VGA...
         jne     basret                          # anything else is EGA.
-        incb    _param(PARAM_HAVE_VGA)          # We've detected a VGA
+        incb    _param(BVI_have_vga)            # We've detected a VGA
 basret: ret
 
 # Store the video mode parameters for later usage by the kernel.
@@ -92,57 +73,57 @@ mode_params:
         movb    $0x03, %ah                      # Read cursor position
         xorb    %bh, %bh
         int     $0x10
-        movw    %dx, _param(PARAM_CURSOR_POS)
+        movw    %dx, _param(BVI_cursor_pos)
         movb    $0x0f, %ah                      # Read page/mode/width
         int     $0x10
-        movw    %ax, _param(PARAM_VIDEO_MODE)   # Video mode and screen width
+        movw    %ax, _param(BVI_video_mode)     # Video mode and screen width
         movw    %gs:(0x485), %ax                # Font size
-        movw    %ax, _param(PARAM_FONT_POINTS)  # (valid only on EGA/VGA)
+        movw    %ax, _param(BVI_font_points)    # (valid only on EGA/VGA)
         movw    bootsym(force_size), %ax        # Forced size?
         orw     %ax, %ax
         jz      mopar1
 
-        movb    %ah, _param(PARAM_VIDEO_COLS)
-        movb    %al, _param(PARAM_VIDEO_LINES)
+        movb    %ah, _param(BVI_video_cols)
+        movb    %al, _param(BVI_video_lines)
         ret
 
 mopar1: movb    %gs:(0x484), %al                # On EGA/VGA, use the EGA+ BIOS
         incb    %al                             # location of max lines.
-mopar2: movb    %al, _param(PARAM_VIDEO_LINES)
+mopar2: movb    %al, _param(BVI_video_lines)
         ret
 
 # Fetching of VESA frame buffer parameters
 mopar_gr:
         movw    $vesa_mode_info, %di
-        movb    $0x23, _param(PARAM_HAVE_VGA)
+        movb    $0x23, _param(BVI_have_vga)
         movw    16(%di), %ax
-        movw    %ax, _param(PARAM_LFB_LINELENGTH)
+        movw    %ax, _param(BVI_lfb_linelength)
         movw    18(%di), %ax
-        movw    %ax, _param(PARAM_LFB_WIDTH)
+        movw    %ax, _param(BVI_lfb_width)
         movw    20(%di), %ax
-        movw    %ax, _param(PARAM_LFB_HEIGHT)
+        movw    %ax, _param(BVI_lfb_height)
         movzbw  25(%di), %ax
-        movw    %ax, _param(PARAM_LFB_DEPTH)
+        movw    %ax, _param(BVI_lfb_depth)
         movl    40(%di), %eax
-        movl    %eax, _param(PARAM_LFB_BASE)
+        movl    %eax, _param(BVI_lfb_base)
         movl    31(%di), %eax
-        movl    %eax, _param(PARAM_LFB_COLORS)
+        movl    %eax, _param(BVI_lfb_colors)
         movl    35(%di), %eax
-        movl    %eax, _param(PARAM_LFB_COLORS+4)
+        movl    %eax, _param(BVI_lfb_colors+4)
         movw    0(%di), %ax
-        movw    %ax, _param(PARAM_VESA_ATTRIB)
+        movw    %ax, _param(BVI_vesa_attrib)
 
 # get video mem size
         movw    $vesa_glob_info, %di
         movzwl  18(%di), %eax
-        movl    %eax, _param(PARAM_LFB_SIZE)
+        movl    %eax, _param(BVI_lfb_size)
 
 # store mode capabilities
         movl    10(%di), %eax
-        movl    %eax, _param(PARAM_CAPABILITIES)
+        movl    %eax, _param(BVI_capabilities)
 
 # switching the DAC to 8-bit is for <= 8 bpp only
-        cmpw    $8, _param(PARAM_LFB_DEPTH)
+        cmpw    $8, _param(BVI_lfb_depth)
         jg      dac_done
 
 # get DAC switching capability
@@ -160,16 +141,16 @@ mopar_gr:
 dac_set:
 # set color size to DAC size
         movzbw  bootsym(dac_size), %ax
-        movb    %al, _param(PARAM_LFB_COLORS+0)
-        movb    %al, _param(PARAM_LFB_COLORS+2)
-        movb    %al, _param(PARAM_LFB_COLORS+4)
-        movb    %al, _param(PARAM_LFB_COLORS+6)
+        movb    %al, _param(BVI_lfb_colors + 0)
+        movb    %al, _param(BVI_lfb_colors + 2)
+        movb    %al, _param(BVI_lfb_colors + 4)
+        movb    %al, _param(BVI_lfb_colors + 6)
 
 # set color offsets to 0
-        movb    %ah, _param(PARAM_LFB_COLORS+1)
-        movb    %ah, _param(PARAM_LFB_COLORS+3)
-        movb    %ah, _param(PARAM_LFB_COLORS+5)
-        movb    %ah, _param(PARAM_LFB_COLORS+7)
+        movb    %ah, _param(BVI_lfb_colors + 1)
+        movb    %ah, _param(BVI_lfb_colors + 3)
+        movb    %ah, _param(BVI_lfb_colors + 5)
+        movb    %ah, _param(BVI_lfb_colors + 7)
 
 dac_done:
 # get protected mode interface information
@@ -180,8 +161,8 @@ dac_done:
         cmp     $0x004f, %ax
         jnz     no_pm
 
-        movw    %es, _param(PARAM_VESAPM_SEG)
-        movw    %di, _param(PARAM_VESAPM_OFF)
+        movw    %es, _param(BVI_vesapm_seg)
+        movw    %di, _param(BVI_vesapm_off)
 
 no_pm:  pushw   %ds
         popw    %es
@@ -1018,7 +999,7 @@ GLOBAL(boot_vid_info)
         .byte   80, 25  /* 80x25          */
         .byte   1       /* isVGA          */
         .word   16      /* 8x16 font      */
-        .fill   0x28,1,0
+        .space  BVI_size - (. - boot_vid_info)
 GLOBAL(boot_edid_info)
         .fill   128,1,0x13
 GLOBAL(boot_edid_caps)
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 3fe21c21b95c..630bdc39451d 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -16,6 +16,10 @@
 #include <xen/multiboot.h>
 #include <xen/multiboot2.h>
 
+#ifdef CONFIG_VIDEO
+# include "../boot/video.h"
+#endif
+
 #define DEFINE(_sym, _val)                                                 \
     asm volatile ( "\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\""\
                    :: "i" (_val) )
@@ -208,4 +212,26 @@ void __dummy__(void)
 
     OFFSET(DOMAIN_vm_assist, struct domain, vm_assist);
     BLANK();
+
+#ifdef CONFIG_VIDEO
+    OFFSET(BVI_cursor_pos,      struct boot_video_info, orig_x);
+    OFFSET(BVI_video_mode,      struct boot_video_info, orig_video_mode);
+    OFFSET(BVI_video_cols,      struct boot_video_info, orig_video_cols);
+    OFFSET(BVI_video_lines,     struct boot_video_info, orig_video_lines);
+    OFFSET(BVI_have_vga,        struct boot_video_info, orig_video_isVGA);
+    OFFSET(BVI_font_points,     struct boot_video_info, orig_video_points);
+    OFFSET(BVI_capabilities,    struct boot_video_info, capabilities);
+    OFFSET(BVI_lfb_linelength,  struct boot_video_info, lfb_linelength);
+    OFFSET(BVI_lfb_width,       struct boot_video_info, lfb_width);
+    OFFSET(BVI_lfb_height,      struct boot_video_info, lfb_height);
+    OFFSET(BVI_lfb_depth,       struct boot_video_info, lfb_depth);
+    OFFSET(BVI_lfb_base,        struct boot_video_info, lfb_base);
+    OFFSET(BVI_lfb_size,        struct boot_video_info, lfb_size);
+    OFFSET(BVI_lfb_colors,      struct boot_video_info, colors);
+    OFFSET(BVI_vesapm_seg,      struct boot_video_info, vesapm.seg);
+    OFFSET(BVI_vesapm_off,      struct boot_video_info, vesapm.off);
+    OFFSET(BVI_vesa_attrib,     struct boot_video_info, vesa_attrib);
+    DEFINE(BVI_size,            sizeof(struct boot_video_info));
+    BLANK();
+#endif /* CONFIG_VIDEO */
 }
-- 
2.44.0


