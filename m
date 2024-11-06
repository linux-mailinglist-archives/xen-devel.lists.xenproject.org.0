Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6687C9BEF37
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 14:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831025.1246181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gFB-0002EW-OI; Wed, 06 Nov 2024 13:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831025.1246181; Wed, 06 Nov 2024 13:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gFB-0002CO-LP; Wed, 06 Nov 2024 13:38:45 +0000
Received: by outflank-mailman (input) for mailman id 831025;
 Wed, 06 Nov 2024 13:38:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nbp=SB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8gFA-00015Z-Gv
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 13:38:44 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 700c2d7b-9c44-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 14:38:42 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso1066922166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 05:38:42 -0800 (PST)
Received: from fziglio-desktop.lan (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6ae615sm21785875e9.8.2024.11.06.05.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 05:06:33 -0800 (PST)
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
X-Inumbo-ID: 700c2d7b-9c44-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcwMGMyZDdiLTljNDQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTAwMzIyLjQ5MzQ1Nywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730900322; x=1731505122; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNXAAQEeft4M3yHeAl+E+8ZpS3tKf0AXKURNXRVDvkI=;
        b=G9/wro57tjy1YNw9AEn5pnVIqz0EXLVPQ+FMEhiRYWriOYP6yfrVDyNyXD7nbZ27yz
         hLBHYDs83cdBhkcEw8c8lAVAjY5jehY4VC4ELdOPMzuvvzOwh3BOd2U7h8KbaI9+EUAr
         1utJOZepDYFTt44YgLrwmU1mQxtyVoypvBLv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900322; x=1731505122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNXAAQEeft4M3yHeAl+E+8ZpS3tKf0AXKURNXRVDvkI=;
        b=vsn4LOgznxhBzUVTv0nheeWLhVt6JcET1lm7yB3BYTiscrpoa3bHlv0qF4s53fT055
         NexXQfdfoAZkpGznrtUEzgLMu+aHNkE6mdUChRBU+BO0OZQ9W2t5sFMaBxDtKJf73Uai
         VZ2viJHUKeS/RmqQG5GQo0UCwZoVKvDV1CQPM1JKk0R6QIglcaJH92SHNuWEodarlsJQ
         ENVEGa77Eng7d0bCQd+yGSxzhyw+npS2taqyx86Bide2Zb3MhcB5LceMjoMyjIZzpGJD
         bDFnci+XlW+MDP/xZxtFnYexmVvdZLyUVjzq1x4Lm8T4azxsI4tAg1K6hGiXpgrWYc+d
         GjKA==
X-Gm-Message-State: AOJu0Ywk8yLBok+KK1GDE3VIMG5APW/7+9oRj/23uS7kvkesl+a903A5
	wyxjoAMVpQ/EmIJUJSZcUgH/GXaQTjGo6HIhCXxFrN5jVikSufdeh/zbr0tQyBNDhLik24kQcly
	XSq4=
X-Google-Smtp-Source: AGHT+IHtwN3ieirDaOOPhRyRU6kaYSf9448q2ZSYS/K6+6OC8xNmi7RTqs+tpo0NOe79hlbipOhFxQ==
X-Received: by 2002:ac2:4a83:0:b0:533:44e7:1b2a with SMTP id 2adb3069b0e04-53d6bb3fad8mr6374380e87.40.1730898393970;
        Wed, 06 Nov 2024 05:06:33 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 3/3] x86/boot: Explicitly list .{sym,shstr,str}tab in build32.lds.S
Date: Wed,  6 Nov 2024 13:06:20 +0000
Message-Id: <20241106130620.1928109-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106130620.1928109-1-frediano.ziglio@cloud.com>
References: <20241106130620.1928109-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, building with LLVM's LLD fails:

    ld -melf_i386_fbsd  --orphan-handling=error -N -T ...
    ld: error: <internal>:(.symtab) is being placed in '.symtab'
    ld: error: <internal>:(.shstrtab) is being placed in '.shstrtab'
    ld: error: <internal>:(.strtab) is being placed in '.strtab'
    gmake[11]: *** [arch/x86/boot/Makefile:69:
arch/x86/boot/built-in-32.base.bin] Error 1

This is a consequence of --orphan-handling, and it appears that Binutils
doesn't diagnose some orphaned sections even explicitly asked to do so.

List the sections explicitly.

Fixes: aa9045e77130 ('x86/boot: Rework how 32bit C is linked/included for early boot')
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/build32.lds.S | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index 9b29f0184f..1e59732edd 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -66,6 +66,15 @@ SECTIONS
        *(.comment.*)
        *(.note.*)
   }
+  .shstrtab : {
+       *(.shstrtab)
+  }
+  .strtab : {
+       *(.strtab)
+  }
+  .symtab : {
+       *(.symtab)
+  }
   /* Dynamic linkage sections.  Collected simply so we can check they're empty. */
   .got : {
         *(.got)
-- 
2.34.1


