Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2367673A783
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 19:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553877.864723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOKB-0007pP-Iu; Thu, 22 Jun 2023 17:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553877.864723; Thu, 22 Jun 2023 17:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOKB-0007ln-FI; Thu, 22 Jun 2023 17:42:27 +0000
Received: by outflank-mailman (input) for mailman id 553877;
 Thu, 22 Jun 2023 17:42:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOAB=CK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qCOK9-00072r-4H
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 17:42:25 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 250604f9-1124-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 19:42:23 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-31126037f41so7379176f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 10:42:23 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d604b000000b003078681a1e8sm7558457wrt.54.2023.06.22.10.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 10:42:22 -0700 (PDT)
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
X-Inumbo-ID: 250604f9-1124-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687455743; x=1690047743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LNsA2w9ErAkBoPmov4U1B0QvIw8uiBvWTPri0FhVLM=;
        b=i9iA6dRVXGlVaGw4SaNnFY7ooA5452fS6LuHINqjsCCMv7b9ql4rMufk+WEMBxWXzq
         Umj2ovz14D29AVsTPjjHka9Q8aBM7CA6Alzy7MZBNxQ1ddeFCvVU9A+I+yRkknvkgArE
         CSftLzEr5GAduJGk1x2eQIoRlA50B0+6fK4zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687455743; x=1690047743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LNsA2w9ErAkBoPmov4U1B0QvIw8uiBvWTPri0FhVLM=;
        b=WpCuexH7pJmMl7zveVeiGQHeVMiW9CBCa1JU2avevvtBMajTVcBC0mWMpQd7MqLnhM
         ZPpYeY4B7t0/QxEww0aUxhz+Kuon4KYTmnMCtqhTelVEzXE1rv5OHuLJyCEYmQTQvH7K
         Lr6GErh3Y8+b9NJzPD9S5mh877FOIFVG9oQacePt5biEkfcFLnkocWw3AX30F3aB3/0P
         mHdWj+pUQ/u/iZQPZKxV/AVfXSwyrTMCQBo2fijfKVUE6b/YRfvl9+hYD30SAOhXKINf
         MBC/lxlQ8bPna1aHaYpQ1zfrCc7wvj0rxQ4wBf4ObviNAQFUmpVibAIycl4yIB/O307w
         i2MA==
X-Gm-Message-State: AC+VfDwPP302Fx5e1seRMt6ntY5DpV7HT2+/9YJQ8MyyLqamlEM0SC8J
	qAQpI+zQSiLwCSTDXjDFowEJB8qDv6A/fJID55g=
X-Google-Smtp-Source: ACHHUZ7UxxzMAJqHkUgWyrNLFe8n5YbKMbGP2CC4PyfQ1cPEn6Tf/UILGswDi1dlNN0Lgi+6jEc9lA==
X-Received: by 2002:adf:cf05:0:b0:310:fe5e:894a with SMTP id o5-20020adfcf05000000b00310fe5e894amr15916308wrj.6.1687455742701;
        Thu, 22 Jun 2023 10:42:22 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 2/4] x86/microcode: Ignore microcode loading interface for revision = -1
Date: Thu, 22 Jun 2023 18:42:17 +0100
Message-Id: <20230622174219.8871-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622174219.8871-1-alejandro.vallejo@cloud.com>
References: <20230622174219.8871-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hypervisors report ~0 as the microcode revision to mean "don't issue
microcode updates". Ignore the microcode loading interface in that case.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v4:
  * Stop piggybacking on the existing early exit
---
 xen/arch/x86/cpu/microcode/core.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index bec8b55db2..e67d143c97 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -867,10 +867,21 @@ int __init early_microcode_init(unsigned long *module_map,
         return -ENODEV;
     }
 
-    microcode_grab_module(module_map, mbi);
-
     ucode_ops.collect_cpu_info();
 
+    /*
+     * Some hypervisors deliberately report a microcode revision of -1 to
+     * mean that they will not accept microcode updates. We take the hint
+     * and ignore the microcode interface in that case.
+     */
+    if ( this_cpu(cpu_sig).rev == ~0 ) {
+        printk(XENLOG_WARNING "Microcode loading disabled\n");
+        ucode_ops.apply_microcode = NULL;
+        return -ENODEV;
+    }
+
+    microcode_grab_module(module_map, mbi);
+
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
-- 
2.34.1


