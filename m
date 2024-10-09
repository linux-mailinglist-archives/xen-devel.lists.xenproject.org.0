Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245E9961CD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 10:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813817.1226863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRgn-0004Ji-1y; Wed, 09 Oct 2024 08:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813817.1226863; Wed, 09 Oct 2024 08:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRgm-0004Ey-Uz; Wed, 09 Oct 2024 08:04:56 +0000
Received: by outflank-mailman (input) for mailman id 813817;
 Wed, 09 Oct 2024 08:04:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BLvJ=RF=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1syRgl-0004Bs-Uk
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 08:04:55 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b70b213-8615-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 10:04:55 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9963e47b69so336250566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 01:04:55 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e7856bfsm624370366b.138.2024.10.09.01.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:04:53 -0700 (PDT)
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
X-Inumbo-ID: 2b70b213-8615-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728461094; x=1729065894; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMIjAU+YIO03QyWyw7i/qsCmTQl0yrUu7IwcuHEs86A=;
        b=gF+YdP+ByTWde6h2+Cpl897B2pdYeiX3sw6hCrW+IqlQcqbVtzds/PYUUQLw0FdAvi
         Ztk0LSqsBNC0Xip0uYxOTdJo5TVVf0uQq8nIADVtkCqjVNDJqSTTJy9sSDChA9tl0S12
         xtKjfZ21q4uUlWN3nn9zjEzk4sKFmdPfE/ZlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728461094; x=1729065894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMIjAU+YIO03QyWyw7i/qsCmTQl0yrUu7IwcuHEs86A=;
        b=vKmX0j7K6abxaT542qJ7Ihs0KelyIbNczY1Ih+njdmEh+xefdtjrOsuHX6cC175sfC
         jMFV1Q/uP5Jfog7tB+sZQanpWfhLk7GfTfpQP5M9jLdwPG+w7Rf5p65fJZjcFhSBcyBE
         NuG3ZzlhUAmT2AupSTyZqywt+O0sw/7dhtOuaIEcL8QxVN49eMXqVt+MNm+O78fLSb5j
         lfwFH3m2cs3LszSFF0B6ludvjRQGuTsMi8WppEgEdgHv7jmYKTNl8sT2hb9q7zOSehWK
         b3RtRq595g/Vnc2An1R7+ln+Pge36SZDe76eTiSGCBKaQOlLUX6vj5vDML4lgW4lgkJe
         rY3A==
X-Gm-Message-State: AOJu0YwswGghoMhjmZLuAPMribOjvQ5pYBNQi8twryqjWYKBiFCLWtf5
	RDWr9CNR1Lxw/mVgp5AQTZNs9vN1Kl/gmDmtMchWeXXUJNRvl5X2xW2MIdBAJ+sSvMDJ8D5bg7O
	0
X-Google-Smtp-Source: AGHT+IHY/4HSnocNINSbzXwMxEsBwQ/IAetbhgaq1csph/ear1T8oQGeEa94SzP6aQPH9rduYiy2Vg==
X-Received: by 2002:a17:907:2d8b:b0:a99:577b:b9f0 with SMTP id a640c23a62f3a-a998d1e2d05mr127260366b.30.1728461094467;
        Wed, 09 Oct 2024 01:04:54 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v8 1/2] x86/boot: Align mbi2.c stack to 16 bytes
Date: Wed,  9 Oct 2024 09:04:38 +0100
Message-Id: <20241009080439.2411730-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009080439.2411730-1-frediano.ziglio@cloud.com>
References: <20241009080439.2411730-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Doing previous testing with an Adler Lake Intel machine the following
patch (improving MBI structure checking) started to fail.
Excluding it makes the tests succeed however there was not apparent
reason (looking at the code) for the failure.
So I instrumented code to output the structure and tested code with
this extracted data with and without the following patch and results
were the same.
Compiled assembly code from lab was also fine beside not keeping
the 16-byte alignment for the stack.
Turning on stack alignment solve the problem on Adler Lake machine.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/efi/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 7e2b5c07de..c2cad86856 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -11,6 +11,8 @@ $(obj)/boot.init.o: $(obj)/buildid.o
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
 $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-boundary)
 
+$(obj)/mbi2.o: CFLAGS_stack_boundary := $(cflags-stack-boundary)
+
 obj-y := common-stub.o stub.o
 obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
 obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
-- 
2.34.1


