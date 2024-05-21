Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C87068CB2AC
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 19:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727008.1131416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9T5h-0005IG-L3; Tue, 21 May 2024 17:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727008.1131416; Tue, 21 May 2024 17:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9T5h-0005FF-Hz; Tue, 21 May 2024 17:15:57 +0000
Received: by outflank-mailman (input) for mailman id 727008;
 Tue, 21 May 2024 17:15:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ryb1=MY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s9T5f-0004kx-Uk
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 17:15:55 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c750c4e0-1795-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 19:15:53 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a59c448b44aso881811266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 10:15:53 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01a2esm1633701766b.185.2024.05.21.10.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 10:15:52 -0700 (PDT)
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
X-Inumbo-ID: c750c4e0-1795-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716311753; x=1716916553; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8g3u7OwfcnXYNWIVYdAYd5uW4iG/kfNNCLqG31h0UaY=;
        b=PCzXBupEebowze8u8FKDQAZ+qFh8tZu/VBT/gzTXbYgV2o6CFoGH9VHtcSYFKa20xR
         69FGQ5GaXyGGIrvwnVOsBV6UsW6+jgtXeJzR0YL7VzL9Y6tGRFpiz8hYhmmJuekGhkxo
         YPBUmiqYZW78QruSlsVg8rFxYEX5ve1+nKmyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311753; x=1716916553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8g3u7OwfcnXYNWIVYdAYd5uW4iG/kfNNCLqG31h0UaY=;
        b=HkLcpULQo9Vyl+6PQsIHCKZ6I2Inv5MdP93nUIOCbGPL4vcAc2hvwf83Dp3LiqS3Sg
         PC1i3ei/HGglgI3HGekWJtYIVJU6hkSv5jSNHWI+t35qPUE2Hm/Xo+m4njrd/6P26bjQ
         1FYh6oNeLpWY5AgFLnc09bd3OKjgKxHa/C7MJqBVEAgZC5GmlRu6q79MPdrUz/3PrUcI
         sKX2K+7uVJR4zyNzRqycwH4rl+zJDivmWdg+nrnXcC3n2AlbUZbvJT84lEYO8oMlQP5A
         bECjc93Ath2lUK1xcTfYxH1EfK+eSQ06dDtKwsdN/CeRJ+Rp8Nlw07N4mpgj5pw8Kcck
         o4hg==
X-Gm-Message-State: AOJu0YzYCTABFnkVevP3YUEEGnrQxQdYe0w7BF5v38XHKNM2Opyg03/C
	mI2QDxFRB7tU1mPs1zOWzi1D5jbd+5nZ33EBBItGTAOHu8akwYK/Hrv1Gbu2+xh7vw0/6YNieZr
	DbUw=
X-Google-Smtp-Source: AGHT+IHi8WUDniYaK0qJBVO/ZXZhtE6ocfJ6wJ8+lH9JrASZvQuMyMVqddjClPEi+/rLDz+2zDlgVw==
X-Received: by 2002:a17:906:d935:b0:a59:d243:945 with SMTP id a640c23a62f3a-a5a2d66a888mr1940746666b.57.1716311752774;
        Tue, 21 May 2024 10:15:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 3/3] xen/x86: Address two misc MISRA 17.7 violations
Date: Tue, 21 May 2024 18:15:46 +0100
Message-Id: <20240521171546.3650664-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521171546.3650664-1-andrew.cooper3@citrix.com>
References: <20240521171546.3650664-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Neither text_poke() nor watchdog_setup() have return value consulted.  Switch
them to being void.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/x86/alternative.c | 4 ++--
 xen/arch/x86/nmi.c         | 5 ++---
 xen/include/xen/watchdog.h | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 2e7ba6e0b833..7824053c9d33 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -155,10 +155,10 @@ void init_or_livepatch add_nops(void *insns, unsigned int len)
  * "noinline" to cause control flow change and thus invalidate I$ and
  * cause refetch after modification.
  */
-static void *init_or_livepatch noinline
+static void init_or_livepatch noinline
 text_poke(void *addr, const void *opcode, size_t len)
 {
-    return memcpy(addr, opcode, len);
+    memcpy(addr, opcode, len);
 }
 
 extern void *const __initdata_cf_clobber_start[];
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index f6329cb0270e..9793fa23168d 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -464,12 +464,12 @@ bool watchdog_enabled(void)
     return !atomic_read(&watchdog_disable_count);
 }
 
-int __init watchdog_setup(void)
+void __init watchdog_setup(void)
 {
     unsigned int cpu;
 
     /*
-     * Activate periodic heartbeats. We cannot do this earlier during 
+     * Activate periodic heartbeats. We cannot do this earlier during
      * setup because the timer infrastructure is not available.
      */
     for_each_online_cpu ( cpu )
@@ -477,7 +477,6 @@ int __init watchdog_setup(void)
     register_cpu_notifier(&cpu_nmi_nfb);
 
     watchdog_enable();
-    return 0;
 }
 
 /* Returns false if this was not a watchdog NMI, true otherwise */
diff --git a/xen/include/xen/watchdog.h b/xen/include/xen/watchdog.h
index 434fcbdd2b11..40c21bca823f 100644
--- a/xen/include/xen/watchdog.h
+++ b/xen/include/xen/watchdog.h
@@ -10,7 +10,7 @@
 #include <xen/types.h>
 
 /* Try to set up a watchdog. */
-int watchdog_setup(void);
+void watchdog_setup(void);
 
 /* Enable the watchdog. */
 void watchdog_enable(void);
-- 
2.30.2


