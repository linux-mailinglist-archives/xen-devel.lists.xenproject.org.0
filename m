Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A67C9BEE2D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 14:16:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830944.1246067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ft2-0000fu-8W; Wed, 06 Nov 2024 13:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830944.1246067; Wed, 06 Nov 2024 13:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ft2-0000cf-4C; Wed, 06 Nov 2024 13:15:52 +0000
Received: by outflank-mailman (input) for mailman id 830944;
 Wed, 06 Nov 2024 13:15:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nbp=SB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8ft0-0000Zv-L1
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 13:15:50 +0000
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [2a00:1450:4864:20::144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1f913a9-9c3f-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 14:13:24 +0100 (CET)
Received: by mail-lf1-x144.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso7697688e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 05:07:48 -0800 (PST)
Received: from fziglio-desktop.lan (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6ae615sm21785875e9.8.2024.11.06.05.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 05:06:31 -0800 (PST)
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
X-Inumbo-ID: f1f913a9-9c3f-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxNDQiLCJoZWxvIjoibWFpbC1sZjEteDE0NC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYxZjkxM2E5LTljM2YtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk4ODkzLjk5NDcwNSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730898392; x=1731503192; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0Wmxp+X0d8KRimyktl9WakzvrvZ8qqvwU0jRtgqs7s=;
        b=iByM5UnDJ4sti2aMDQsDEnWdgCmhJ0p2wLPpO63qw3yuCXIm+wczCKr8G1jW3jAnra
         r734FesZqX/iYHWsueMvua3xjOO9aJaaQ0W3R3xNFCNmhwKHvwSFikQEcBNeds367iXO
         oG4HKjpmUo30melzN6MakglQYbTRgZFkblCeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730898392; x=1731503192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0Wmxp+X0d8KRimyktl9WakzvrvZ8qqvwU0jRtgqs7s=;
        b=Cm6EEKYW2uOlOK5Jl6DikENLtGEVRPhSWm+acsYIqGHKD17dxw2bRpDS8FnY62famj
         6i4mZmCBVR1h70lxec6UyMONgjWoSsRUw0RFbIFC0hl6P77n0Y6+z9M4qNM3yyVuyntb
         z1hzKg4bBxr1ZnayaqVwoWCs3QwQ2rMZgvaVQ8DYdt3V1Rdd0jYuM0VV+gz0nSd4ZtkT
         xw2D9csF1nLrpgMeXLtWUfBSwyfEvkWS2XIw83+QNUvmpUSoISZcG9gJqCaNm5vpijw+
         fFKfUwOj2j7nxcy7bbmbdrl01d/2GSV8m+ktou6ZF++Aadp7yYbkZGZSLepgiralQTq5
         lFEA==
X-Gm-Message-State: AOJu0YwgpA6g/0E/vMoLA36ycWWhztFNjuj3VNmPgreacmPC0zQs2HXi
	VC13Rj96L8+vA70VEI6CqAqt17B7SM3aHayWZgWz/XbDsTlIf5DpAOewQxnVroVy9rOlo+vF3eK
	iyiuCEw==
X-Google-Smtp-Source: AGHT+IF6Fqam+2yIIUN2Q0MVd8Q6BiDLRSGvBIEl/NP7+yLY0PieDzwN/Iw020fIhLIerZptg99bRQ==
X-Received: by 2002:a05:6512:23a9:b0:539:f619:b459 with SMTP id 2adb3069b0e04-53b348cb0e0mr19364854e87.17.1730898392026;
        Wed, 06 Nov 2024 05:06:32 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/3] x86/boot: Fix intermediate file names to generate 32 bit code
Date: Wed,  6 Nov 2024 13:06:18 +0000
Message-Id: <20241106130620.1928109-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106130620.1928109-1-frediano.ziglio@cloud.com>
References: <20241106130620.1928109-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "base" and "offset" definition were inverted, "base" file
should be the files without offsets applied while "offset" should
have the offsets applied.
Also update an old usage of "final" to "apply offset" to make
more clear and consistent (in former commit messages the "final"
term was used instead of "offset").

Fixes: aa9045e77130 ('x86/boot: Rework how 32bit C is linked/included for early boot')
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Anthony was right, it was the opposite
---
 xen/arch/x86/boot/Makefile      | 6 +++---
 xen/arch/x86/boot/build32.lds.S | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index e102bd8c70..5f832c5896 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -44,7 +44,7 @@ text_gap := 0x010200
 text_diff := 0x408020
 
 $(obj)/build32.base.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff)
-$(obj)/build32.offset.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff) -DFINAL
+$(obj)/build32.offset.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff) -DAPPLY_OFFSET
 $(obj)/build32.base.lds $(obj)/build32.offset.lds: $(src)/build32.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
@@ -75,10 +75,10 @@ cmd_combine = \
     $(PYTHON) $(srctree)/tools/combine_two_binaries.py \
               --gap       $(text_gap) \
               --text-diff $(text_diff) \
-              --script    $(obj)/build32.offset.lds \
+              --script    $(obj)/build32.base.lds \
               --bin1      $(obj)/built-in-32.base.bin \
               --bin2      $(obj)/built-in-32.offset.bin \
-              --map       $(obj)/built-in-32.offset.map \
+              --map       $(obj)/built-in-32.base.map \
               --exports   cmdline_parse_early,reloc,reloc_trampoline32 \
               --output    $@
 
diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index f20fc18977..9b29f0184f 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -15,7 +15,7 @@
  * with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifdef FINAL
+#ifndef APPLY_OFFSET
 # undef GAP
 # define GAP 0
 # define MULT 0
-- 
2.34.1


