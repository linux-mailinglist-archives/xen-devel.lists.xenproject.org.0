Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FB899C426
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 10:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818520.1231837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Gpo-0000AY-WE; Mon, 14 Oct 2024 08:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818520.1231837; Mon, 14 Oct 2024 08:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Gpo-000076-T6; Mon, 14 Oct 2024 08:53:48 +0000
Received: by outflank-mailman (input) for mailman id 818520;
 Mon, 14 Oct 2024 08:53:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qGCd=RK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t0Gpn-00086D-Ev
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 08:53:47 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1c56b41-8a09-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 10:53:45 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a156513a1so63005766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 01:53:45 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80f2446sm551817766b.206.2024.10.14.01.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 01:53:43 -0700 (PDT)
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
X-Inumbo-ID: d1c56b41-8a09-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728896024; x=1729500824; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktEbN5Mta6+B/qu1SQOa+3juoPGypkurj1Nhhhu5ghA=;
        b=Jv2+rt37jOMGVvGxyvVG0X665Z6fNROEoeVuG1xQh7sBi02Lze6CFH16U4XR1spFFw
         HUD7bVVs7CegHmDQsjxpK96by0dHxzFi9J7T6LB2DefIN/noHlRXZ++d0yhphfNW+m/2
         dU3E01KRsciNMZ1ARwTkRCgww2eTPtitmovC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896024; x=1729500824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktEbN5Mta6+B/qu1SQOa+3juoPGypkurj1Nhhhu5ghA=;
        b=mlcnRrSNpkU31jXXIp2rbkxqD/jQKsi51N7qT4wYSPqTlanrEawQROGCoxzyiyPtw6
         h2RaWILp6lBt68VX5fWK1S6Ng9K7rUmtE5iZ3bb1Vj/QHLigzsSKqkXo/zkDaS3BY1T8
         aCyQ42fUtOzolNT8iV5xWarHTjhT7Batc7L4bHuR1KP+ZJ2J44CnKmmEMDKHsqP4sSbS
         pSYpbXOTaAcy4WDpEG+xojCQiU62hyvmwzGE1A/rrBSWHXHn572KbYVAExAdegro+sJC
         qifNO3Y8OxA9PyBC3hSVQFLGd6W10/HeHvww1j/ZDPdDMizPAvxPX24weCIvuzRnnDBq
         BjaQ==
X-Gm-Message-State: AOJu0YzF2YTHXoGPyArEtwlBPO4lgdspaCNDcrePUOUlf5nZqBZNAj/R
	hvgG/Lr1Ggo42glmpHaInO2zWpg4qHwfwznHQUHZeEZTof8Fr80uYQCdJFeZF7WmU9EAM0OT95n
	X
X-Google-Smtp-Source: AGHT+IFEapbh2BjXX94GQenUWVcxXEC7ASsbiIPQtMGGSW4YUH3/bf6ShK4H3b+R4msB2bQ2SawLyQ==
X-Received: by 2002:a17:907:3fa5:b0:a99:45c5:339 with SMTP id a640c23a62f3a-a99b93c8d07mr856330466b.32.1728896024368;
        Mon, 14 Oct 2024 01:53:44 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 1/6] x86/boot: Prep work for 32bit object changes
Date: Mon, 14 Oct 2024 09:53:27 +0100
Message-Id: <20241014085332.3254546-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Broken out of the subsequent patch for clarity.

 * Rename head-bin-objs to obj32
 * Use a .32.o suffix to distinguish these objects
 * Factor out $(LD32)

No functional change.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/arch/x86/boot/Makefile | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index ff0f965876..1199291d2b 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,15 +1,16 @@
 obj-bin-y += head.o
 
-head-bin-objs := cmdline.o reloc.o
+obj32 := cmdline.32.o
+obj32 += reloc.32.o
 
-nocov-y   += $(head-bin-objs)
-noubsan-y += $(head-bin-objs)
-targets   += $(head-bin-objs)
+nocov-y   += $(obj32)
+noubsan-y += $(obj32)
+targets   += $(obj32)
 
-head-bin-objs := $(addprefix $(obj)/,$(head-bin-objs))
+obj32 := $(addprefix $(obj)/,$(obj32))
 
 $(obj)/head.o: AFLAGS-y += -Wa$(comma)-I$(obj)
-$(obj)/head.o: $(head-bin-objs:.o=.bin)
+$(obj)/head.o: $(obj32:.32.o=.bin)
 
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
@@ -18,16 +19,20 @@ CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS
 CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
 
 # override for 32bit binaries
-$(head-bin-objs): CFLAGS_stack_boundary :=
-$(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
+$(obj32): CFLAGS_stack_boundary :=
+$(obj32): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
+
+$(obj)/%.32.o: $(src)/%.c FORCE
+	$(call if_changed_rule,cc_o_c)
 
 LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
 LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
+LD32 := $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
 
 %.bin: %.lnk
 	$(OBJCOPY) -j .text -O binary $< $@
 
-%.lnk: %.o $(src)/build32.lds
-	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
+%.lnk: %.32.o $(src)/build32.lds
+	$(LD32) -N -T $(filter %.lds,$^) -o $@ $<
 
 clean-files := *.lnk *.bin
-- 
2.34.1


