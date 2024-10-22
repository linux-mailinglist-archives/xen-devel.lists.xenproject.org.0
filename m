Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EC19AB3E8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 18:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824263.1238370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Hgz-00030g-4O; Tue, 22 Oct 2024 16:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824263.1238370; Tue, 22 Oct 2024 16:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Hgz-0002xW-1V; Tue, 22 Oct 2024 16:25:09 +0000
Received: by outflank-mailman (input) for mailman id 824263;
 Tue, 22 Oct 2024 16:25:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjUh=RS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3Hgx-0002xQ-56
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 16:25:07 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31ada791-9092-11ef-99a3-01e77a169b0f;
 Tue, 22 Oct 2024 18:25:04 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9932aa108cso867056566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 09:25:04 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912f6520sm361919966b.73.2024.10.22.09.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 09:25:02 -0700 (PDT)
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
X-Inumbo-ID: 31ada791-9092-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729614303; x=1730219103; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c2GqfTiYEITsKI2G8oNRKcJ3hgTFn5qErcVqjd9xvQU=;
        b=flGwP1EwYypKwcQwRSyNgDey+HM9DK03BKkW7lD3GpbMoeSTXnW2wD4gh9ZffbuaoF
         u0pA/FdmikAEf+eXUG+laMjo0sLwWWV2CISQ1JBAaS3XSORybS9PVlItBiJp7pKBpVO/
         SsB/d93MqmuUVDFo3IgAHg4mEY5a2C6VpQ/rM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729614303; x=1730219103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2GqfTiYEITsKI2G8oNRKcJ3hgTFn5qErcVqjd9xvQU=;
        b=FJmJhD4YSE/UtoGp+niZqp/DqAVfxe3lbKyxKH0/ToL04XuktKlqyVoxX+1t3q8q6E
         nnobjBjSl1r6JTTw33SwyWqd/3aeRuA/yEp9FiYJWzre//HioSarxjIBw3fh8sBhl4IV
         VZuA67Bv58Ly5vwDgwiBkAZvW4NLc1vWcxkjy9KEnbogsNduH3WCMHRYRQMt5r4VKDCF
         zZA8m6yAxSGY0KoERVRAyIXxK6p9UcvfbtiR2Qp7BSo/W7PJfKbjQtgjRZTGrt0E5SGA
         W51nglS3OrHbkAgMgqOrMYBWcplO6g1Nv0uo8Nf1LtZfkZ8Fs1u2K7MRCCoQIuClnBRI
         Ihcw==
X-Gm-Message-State: AOJu0YwuFyEKUAQa96W3JGz57KaUyqVj07UTsPxssCyminF3v/Hhhs9Z
	nKTQPz5ZMTUcirrol911MS7LD41xM7lqG4B9+hZmvRO5Rn78DsCgxP2jA3XlHBeSBAsYEnuyxGm
	H
X-Google-Smtp-Source: AGHT+IHksscOUJc5PefEfajL9dLUsn1H1OiC7NmneMuYfRFsy/NQCBLMFTCiHfF4aY/m7e1HoVnc1A==
X-Received: by 2002:a17:907:6092:b0:a9a:3e33:8d9e with SMTP id a640c23a62f3a-a9aace72be3mr316261966b.28.1729614303488;
        Tue, 22 Oct 2024 09:25:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] tools/pvhsim: Inherit the tools debug= setting
Date: Tue, 22 Oct 2024 17:25:00 +0100
Message-Id: <20241022162500.121276-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, builds of pvshim are non-debug, because of pvshim_defconfig.
However, this means that Gitlab CI testing is less effective than it wants to
be.

Include Rules.mk, and feed the tools-wide debug= setting.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

I don't particualrly like this, because while it ends up getting the
appropriate choice of CONFIG_DEBUG, all other symbols with a default dependent
on CONFIG_DEBUG get their non-debug form.
---
 tools/firmware/xen-dir/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/firmware/xen-dir/Makefile b/tools/firmware/xen-dir/Makefile
index 6f5e208ab413..e19916f76722 100644
--- a/tools/firmware/xen-dir/Makefile
+++ b/tools/firmware/xen-dir/Makefile
@@ -1,4 +1,5 @@
 XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
 
 all: xen-shim
 
@@ -75,6 +76,8 @@ $(D): linkfarm.stamp
 
 $(D)/xen/.config: $(D)
 	$(MAKE) -C $(@D) KBUILD_DEFCONFIG=pvshim_defconfig defconfig
+	echo "CONFIG_DEBUG=$(if $(debug),y,n)" >> $@
+	$(MAKE) -C $(@D) olddefconfig
 
 xen-shim: $(D)/xen/.config
 	$(MAKE) -C $(<D) build
-- 
2.39.5


