Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783DB9BE5D2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 12:42:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830783.1245887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eQK-0008DE-Dj; Wed, 06 Nov 2024 11:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830783.1245887; Wed, 06 Nov 2024 11:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eQK-00088h-AA; Wed, 06 Nov 2024 11:42:08 +0000
Received: by outflank-mailman (input) for mailman id 830783;
 Wed, 06 Nov 2024 11:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nbp=SB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8eQJ-0007RL-Cx
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 11:42:07 +0000
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [2a00:1450:4864:20::142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 233e1cce-9c34-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 12:42:01 +0100 (CET)
Received: by mail-lf1-x142.google.com with SMTP id
 2adb3069b0e04-539eb97f26aso4528658e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 03:42:01 -0800 (PST)
Received: from fziglio-desktop.lan (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e7465sm18840783f8f.53.2024.11.06.03.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 03:42:00 -0800 (PST)
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
X-Inumbo-ID: 233e1cce-9c34-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxNDIiLCJoZWxvIjoibWFpbC1sZjEteDE0Mi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIzM2UxY2NlLTljMzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODkzMzIxLjY2NzQ1Miwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730893321; x=1731498121; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clpuiLr6+GNq2EjFM/kTGl+9a7wk5TUx5RlFDo/t/qA=;
        b=S8RFwYTv6+qDv01uYf98yOGhM3RWhiCImmUBnurmkGJnH6YrBaFEwJ5RuqZyhBqv/M
         llATVarc3EK78eHGjV42RRlhc//qyBp2g6fCCnWtaNLhowxd8XUeeY5lDSOlsGuw+lvq
         Ox1cMForHfT5nYyB1GFGzkSASC+YP4zay8aBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730893321; x=1731498121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clpuiLr6+GNq2EjFM/kTGl+9a7wk5TUx5RlFDo/t/qA=;
        b=TwobDD6Q0M6YR0ZuQfrP9IdwOe/APh9To364j8i04RRkeDggsbrNocH6FJS6guJZx5
         0gNqPYdBrftvvrYMeplRhiqSxPQrq6lrvIGqfEDqUZMur6MpS/cj19NI0Hm6igAQZeAY
         08jRuuYXkL5S0dZ8oEUqMStwnaAF8bA2lYHPmSNyvYa2tkdYPi0motHtqaHNIDjNkvRX
         NcK7Dn8ZWWoc+SdnpqeRvI1RCKde5PtVryWjTw3xFN96N0QUTizaunV9OPXH3HMkhFxE
         Gsft3P22isKV3JQWrSSExDS9jydrHDDArnK+7oczQwmXdGsQtjwq+NxC503QqJIrLlDc
         zDlA==
X-Gm-Message-State: AOJu0Yy+SebDuVDZmD85aQpJcfPH0iBmPtWqZNNPykZvn9eWxgoyqaW+
	AiLpCs5J1TRVyZE3wCmWF7lQuNrXucbLYMLg9PqU9khK39eNFGh/OZN2x7HGJSncpwUpvl1H6vG
	76EpOeQ==
X-Google-Smtp-Source: AGHT+IGPktNd6V7yTFf7xSW6d54nFXzj0fIqfdwBNhvEnopSInn+Z50KIVoIvRfqeiQ3GamMp0m1Ng==
X-Received: by 2002:a05:6512:3408:b0:539:f8cb:f5e3 with SMTP id 2adb3069b0e04-53b7ed18520mr14053903e87.48.1730893320764;
        Wed, 06 Nov 2024 03:42:00 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/3] x86/boot: Fix intermediate file names to generate 32 bit code
Date: Wed,  6 Nov 2024 11:41:48 +0000
Message-Id: <20241106114150.1432512-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106114150.1432512-1-frediano.ziglio@cloud.com>
References: <20241106114150.1432512-1-frediano.ziglio@cloud.com>
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
--
Anthony was right, it was the opposite
---
 xen/arch/x86/boot/Makefile      | 7 ++++---
 xen/arch/x86/boot/build32.lds.S | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index e102bd8c70..777b4befeb 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -44,7 +44,8 @@ text_gap := 0x010200
 text_diff := 0x408020
 
 $(obj)/build32.base.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff)
-$(obj)/build32.offset.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff) -DFINAL
+$(obj)/build32.offset.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff) \
+                                       -DAPPLY_OFFSET
 $(obj)/build32.base.lds $(obj)/build32.offset.lds: $(src)/build32.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
@@ -75,10 +76,10 @@ cmd_combine = \
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


