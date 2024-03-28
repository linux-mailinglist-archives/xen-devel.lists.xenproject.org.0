Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF258890328
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:35:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698987.1091330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprmz-0000wg-Ex; Thu, 28 Mar 2024 15:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698987.1091330; Thu, 28 Mar 2024 15:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprmz-0000u4-B5; Thu, 28 Mar 2024 15:35:37 +0000
Received: by outflank-mailman (input) for mailman id 698987;
 Thu, 28 Mar 2024 15:35:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idZb=LC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rprmy-0000su-31
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:35:36 +0000
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [2607:f8b0:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0c6321a-ed18-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:35:34 +0100 (CET)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6e6e0867be8so490371a34.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:35:34 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 j3-20020a05620a410300b00789e92b525csm605779qko.81.2024.03.28.08.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 08:35:31 -0700 (PDT)
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
X-Inumbo-ID: d0c6321a-ed18-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711640132; x=1712244932; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok3adXAgDSAh339+9o5qHtGfoLHVal0xgIbEcVkBKgg=;
        b=ZXQ9+l5lK6yILz9qX7JR35nfo8+BombfAkM9f6jfASsANPM8kAHXsGIjoA8cb2tMAC
         6u4/oPNkQOAIZc9H39LJLGJSXmHYrdvAZsbvEW8xohHLBGXe+JPhkvFpiFDcHPxNTbfL
         KQfcpnNA9xegb5bLEVbo/L1rnmUZygbqhsmks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711640132; x=1712244932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ok3adXAgDSAh339+9o5qHtGfoLHVal0xgIbEcVkBKgg=;
        b=hmWJbaLUCApOnJoKF/nG27O9bmPlYk49vtIHjcHgqGDI8MsO3bO0cwmNsuxIJ+GhXU
         557aLemVI/DLPzJ3z0kGD0zMyfcZdIUHNpU/TOYpQ/ZwyUSYcQ5UNZCbb93wvZt6M0ky
         XDIIw86FvlYkMzb8Hhn2sd6JxQW0R2JLVFo5Q3E3QAYqN0eXuo6SaEHpgtohrAjk0K0m
         3z4hR+G62jLuXq9qK3Ek2M73GpVj/JuvEA4XhmF8/R8wtpmo/j/KQ7ZRErgtBWhPbIZa
         BaMfvJ6ofG7BJGh1j2wvltd9kjuhV0h07gSGmsj4DVGjiIiKuHPWWLq1CE0RKoPfoAzh
         rNPg==
X-Gm-Message-State: AOJu0Yyoc8Hkt34LN08okq57HhT4SFxzKq3ljaXW7551i2fu6Qk/NDwJ
	+GNPPhkxe0Zans3833Lk4U1J2lJlq2rDgEqcg2l6B+dC9JJLQ5tiglsPgB/BrvCyU+7ExphDuLd
	6
X-Google-Smtp-Source: AGHT+IE4mKt7qY733wceOwB9nBMrNCdpeHB4OqOhJh1ZxBn56HB+vEsBVGDeyl+SpLWUv9Rky/7FAA==
X-Received: by 2002:a05:6830:438b:b0:6e6:c217:3b28 with SMTP id s11-20020a056830438b00b006e6c2173b28mr4357228otv.20.1711640132053;
        Thu, 28 Mar 2024 08:35:32 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/2] x86/video: do not assume a video mode to be unconditionally present
Date: Thu, 28 Mar 2024 16:35:23 +0100
Message-ID: <20240328153523.4155-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240328153523.4155-1-roger.pau@citrix.com>
References: <20240328153523.4155-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's no reason to assume VGA text mode 3 to be unconditionally available.
With the addition of booting Xen itself in PVH mode there's a boot path that
explicitly short-circuits all the real-mode logic, including the VGA detection.

Leave the default user selected mode as text mode 3 in boot_vid_mode, but do
not populate boot_vid_info with any default settings.  It will either be
populated by the real-mode video detection code, or left zeroed in case
real-mode code is skipped.

Note that only PVH skips the real-mode portion of the boot trampoline,
otherwise the only way to skip it is to set `no-real-mode` on the command line,
and the description for the option already notes that VGA would be disabled as
a result of skipping real-mode bootstrap.

This fixes Xen incorrectly reporting:

(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16

When booted as a PVH guest.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/boot/video.S | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/arch/x86/boot/video.S b/xen/arch/x86/boot/video.S
index a4b25a3b34d1..a51de04a024e 100644
--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -994,12 +994,7 @@ name_bann:      .asciz  "Video adapter: "
 force_size:     .word   0       # Use this size instead of the one in BIOS vars
 
 GLOBAL(boot_vid_info)
-        .byte   0, 0    /* orig_x, orig_y */
-        .byte   3       /* text mode 3    */
-        .byte   80, 25  /* 80x25          */
-        .byte   1       /* isVGA          */
-        .word   16      /* 8x16 font      */
-        .space  BVI_size - BVI_capabilities
+        .space  BVI_size
 GLOBAL(boot_edid_info)
         .fill   128,1,0x13
 GLOBAL(boot_edid_caps)
-- 
2.44.0


