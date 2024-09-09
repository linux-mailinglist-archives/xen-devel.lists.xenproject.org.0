Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD09497161C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794287.1203107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncBL-0007tG-A5; Mon, 09 Sep 2024 11:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794287.1203107; Mon, 09 Sep 2024 11:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncBL-0007ri-6l; Mon, 09 Sep 2024 11:03:43 +0000
Received: by outflank-mailman (input) for mailman id 794287;
 Mon, 09 Sep 2024 11:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sncBJ-0007rV-Vz
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:03:42 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b88493f-6e9b-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 13:03:40 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso2736349e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:03:40 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ce96a7sm324623966b.158.2024.09.09.04.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 04:03:38 -0700 (PDT)
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
X-Inumbo-ID: 2b88493f-6e9b-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725879819; x=1726484619; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IDoPRe5pKMPzPxX6feYXl4w8ZQX1Ods64y/fBaEdyn4=;
        b=ZE9gjVFRwtBEfywbrtyGs8JuQARZP7/gkcyCTGMGEGcNEjIj1ZPCzfpnG2Ain5wjq4
         0ly10FBX13xfHg5phH+DKpwU0lbF8eUErVpea7k8f6Dyz4OTnd53ItFXTG0FtEpLCtyQ
         FE4vpZaRhakw1+78kJ1by/j5HngWYHmmCstCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879819; x=1726484619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDoPRe5pKMPzPxX6feYXl4w8ZQX1Ods64y/fBaEdyn4=;
        b=EmK+v6xGFsNuNBbdvm/nAoTrywuvvP4srJ0ClaD4keK3VRxhw5NvwC5n+EmjvfAIUy
         zEroz6m7c6Zt5ih78FsreNJXagjwWoaJJvMYiYUkge5Nplz/IgNwmdG9bIeOPj6YYTLF
         0qZJOE75R3tgJeGdDcFe9qn3czJRgKBE1k252iUQihzqkv8KnRWVu0Ns1g3umMh6viaR
         HYFWYuM6WhOnSZK9ajadSiqf7BN4YOsSTCBDL6bLgwd23qZ1tYQvZVYUOvKLU4UHu7AS
         oZXG2wTldiWWcVNtPG/Nh+otEoUmGmQNfJPVjv78+5jRjFFEAXNdKXcnKocIaziy8qLC
         49dQ==
X-Gm-Message-State: AOJu0YwPXDI6DOVis7PEDHo0p8ZjbSPB3rCiK3EmHUum5Q+JEqHpQin2
	bTmTF+GXTt9H2wY6cuo3QpmBDLH7WAzCJ1TY/mDN2xlIqV7gmxKCbBWelS1795gwBuasAoEkXpf
	C
X-Google-Smtp-Source: AGHT+IHuw5VcMR2hvPT/qHePYFS5X3vGfSTCwWSpUdrqi3x/pAlxTgD53K6fYjSXD6vzNpi5hnzgUA==
X-Received: by 2002:a05:6512:3c98:b0:530:abec:9a1b with SMTP id 2adb3069b0e04-536587aabdcmr7934679e87.13.1725879819138;
        Mon, 09 Sep 2024 04:03:39 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH v3 1/2] x86/boot: Optimise 32 bit C source code
Date: Mon,  9 Sep 2024 12:03:28 +0100
Message-Id: <20240909110329.84512-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The various filters are removing all optimisations.
No need to have all optimisations turned off.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
Changes since v2:
- combine filter calls together;
- added additional patch.

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 8f5bbff0cc..dfe3cb7034 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -15,7 +15,7 @@ CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
 CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS))
-CFLAGS_x86_32 += $(filter -I%,$(XEN_CFLAGS))
+CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS))
 
 # override for 32bit binaries
 $(head-bin-objs): CFLAGS_stack_boundary :=
-- 
2.34.1


