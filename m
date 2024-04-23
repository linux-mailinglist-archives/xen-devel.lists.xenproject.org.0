Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFBF8AE7AC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 15:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710601.1109922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFxi-0002WI-6s; Tue, 23 Apr 2024 13:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710601.1109922; Tue, 23 Apr 2024 13:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFxi-0002Tl-1x; Tue, 23 Apr 2024 13:13:30 +0000
Received: by outflank-mailman (input) for mailman id 710601;
 Tue, 23 Apr 2024 13:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nc7B=L4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzFxg-0002Bv-L1
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 13:13:28 +0000
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [2001:4860:4864:20::32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4515543e-0173-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 15:13:27 +0200 (CEST)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-23319017c4cso3589291fac.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 06:13:27 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 wl20-20020a05620a57d400b0078ec846066fsm5232607qkn.7.2024.04.23.06.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 06:13:24 -0700 (PDT)
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
X-Inumbo-ID: 4515543e-0173-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713878005; x=1714482805; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltxaBFTJztn56Gj0rvozRmGOtEvpUWdcCGzbpKGl1aA=;
        b=U5ELi145Z1UiFRwVOAxeZOOJKZnpHqSdUteUZ0h/D5mFtDhHW4dv2k1xY8Z/ALuKVQ
         zA1/0pgZMiMRbhMwZZSJz047aL90qUB5qaisf9VPs59lu7vGKNo1RGInQJ8vF7E1Vykn
         zqPfuKl23zQJDy21W9O4KpxQP/hHG2fWltBMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713878005; x=1714482805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltxaBFTJztn56Gj0rvozRmGOtEvpUWdcCGzbpKGl1aA=;
        b=TpVlxLHAMAE8XBjH3LMXtPcS1+niv38Cq4IuwrOb4pIeZ8pSMQp8dAfEQWjDBbsrnx
         INauZB2ROumOWcNlwtQwSvj7j0oAd7BcEqWw5ojU2n8wZ1stYyeqU4CuoTN6RP23fNAK
         WwmkmZ1SLkzfnxpGqH1t9ymv/xFRQLVO1Mt6IDsrGAFbs6LAQliwFzrpwTZw/szs4hG/
         tOTGo+8JK72yV5wbAE5swcvJwbAHzCP9K/xftCP/Qj0FdbUAFRQp6LoOPRYlmbVcq/D8
         epw3ZwSn3ZlrQo38ibbPbwdmwWNmpzTk1F7Cag1hXa9xpCQRZJga0wL0VpxfsmnmyLhX
         5v3A==
X-Gm-Message-State: AOJu0YxrGZSPDH/RPFm1uoq2yTrEXbkcZCiog9krecbEVz85gaxGZg+8
	otkcSfDI8v9D02M68pHxc3HYGYxwfYpxrdLxmyKvueTl93MfyAhFX5ylzld3dUM2zNmMgOBeXPh
	x
X-Google-Smtp-Source: AGHT+IGzgYuYJsC+Pa5n306mOLAuD9o831fD7pohs4qVzhEmBwNtlnur1k4ygK0/dzHUTAI7xP9zBQ==
X-Received: by 2002:a05:6870:4309:b0:22e:9125:eade with SMTP id w9-20020a056870430900b0022e9125eademr16010630oah.44.1713878005051;
        Tue, 23 Apr 2024 06:13:25 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v3 4/4] x86/livepatch: perform sanity checks on the payload exception table contents
Date: Tue, 23 Apr 2024 15:12:49 +0200
Message-ID: <20240423131249.29825-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423131249.29825-1-roger.pau@citrix.com>
References: <20240423131249.29825-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ensure the entries of a payload exception table only apply to text regions in
the payload itself.  Since the payload exception table needs to be loaded and
active even before a patch is applied (because hooks might already rely on it),
make sure the exception table (if any) only contains fixups for the payload
text section.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/arch/x86/extable.c             | 18 ++++++++++++++++++
 xen/arch/x86/include/asm/uaccess.h |  4 ++++
 xen/common/livepatch.c             |  9 +++++++++
 3 files changed, 31 insertions(+)

diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 8415cd1fa249..9e91e8234e71 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -228,3 +228,21 @@ unsigned long asmlinkage search_pre_exception_table(struct cpu_user_regs *regs)
     }
     return fixup;
 }
+
+#ifdef CONFIG_LIVEPATCH
+bool extable_is_between_bounds(const struct exception_table_entry *ex_start,
+                               const struct exception_table_entry *ex_end,
+                               const void *start, const void *end)
+{
+    for ( ; ex_start < ex_end; ex_start++ )
+    {
+        const void *addr = (void *)ex_addr(ex_start);
+        const void *cont = (void *)ex_cont(ex_start);
+
+        if ( addr < start || addr >= end || cont < start || cont >= end )
+            return false;
+    }
+
+    return true;
+}
+#endif
diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 48b684c19d44..0dad61e21a9c 100644
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -426,5 +426,9 @@ extern unsigned long search_exception_table(const struct cpu_user_regs *regs,
 extern void sort_exception_tables(void);
 extern void sort_exception_table(struct exception_table_entry *start,
                                  const struct exception_table_entry *stop);
+extern bool extable_is_between_bounds(
+    const struct exception_table_entry *ex_start,
+    const struct exception_table_entry *ex_end,
+    const void *start, const void *end);
 
 #endif /* __X86_UACCESS_H__ */
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 36cf4bee8b8a..67b6815d87ac 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -912,6 +912,15 @@ static int prepare_payload(struct payload *payload,
         s = sec->load_addr;
         e = sec->load_addr + sec->sec->sh_size;
 
+        if ( !extable_is_between_bounds(s, e, payload->text_addr,
+                payload->text_addr + payload->text_size) )
+        {
+            printk(XENLOG_ERR LIVEPATCH
+                   "%s: Invalid exception table with out of bounds entries\n",
+                   elf->name);
+            return -EINVAL;
+        }
+
         sort_exception_table(s ,e);
 
         region->ex = s;
-- 
2.44.0


