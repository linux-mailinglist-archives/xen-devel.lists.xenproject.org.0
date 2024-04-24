Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6588B0428
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 10:21:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711243.1111080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXrq-0003HE-JD; Wed, 24 Apr 2024 08:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711243.1111080; Wed, 24 Apr 2024 08:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXrq-0003Ax-DB; Wed, 24 Apr 2024 08:20:38 +0000
Received: by outflank-mailman (input) for mailman id 711243;
 Wed, 24 Apr 2024 08:20:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RmhA=L5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzXrp-00036k-Hb
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 08:20:37 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8591801c-0213-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 10:20:34 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-78efd533a00so444353885a.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 01:20:34 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 l12-20020a0ce08c000000b0069b5acd4645sm5871886qvk.82.2024.04.24.01.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 01:20:33 -0700 (PDT)
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
X-Inumbo-ID: 8591801c-0213-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713946833; x=1714551633; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lFgzIk6mZ1hK8DHBScfuOqV/62To3zJaq3BcFXOAmo=;
        b=Gg0cs7AgbI9J5FdGPB/670nH2Unc5NtTUnUUbPVZL+b2Rwz0EpEum4a5jGjBPUHImF
         +29Dp7GT2WuSLY0gCvZ8eHpPsGtOwBrQK4fbX9IlaTZq1lZw5bXpMtXSrWYyl3oNuOCh
         E0UlR4is8+RPonVlnHEh+r15alJ+0uW/xu9U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713946833; x=1714551633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lFgzIk6mZ1hK8DHBScfuOqV/62To3zJaq3BcFXOAmo=;
        b=cLFeA6xZO7bqU8Xd01aDlex4IVV7A+QYF9IVOBNHQPcpg32LUQB4hHS57Xpk2wCslv
         RZejmxsAq9nyaE5KuGhTbCvp8l0PUEonRQ2uSRvFyXTZIeVZnSYrdJBLe26bIikXiDrt
         t9ZCAqJpgHyv3RnoG+UmLB3GuEqIMLMga/q2k4f5lQ0g+Iw7UQUYCSKQ7qj08dzBSeNb
         87qxsyzzPFAGPo28B50tVLvaArP1XOFStrqPQRg7PAhOGBrHhd/+F0X5yZ821ngRU5Vy
         IkOKgyn148x10ZSqXTZ7QY8Edv5muxrw8x3ZU5hJISFvp3oWNDIEnLC9Ic29V1UjsvoZ
         hc5Q==
X-Gm-Message-State: AOJu0YzTD32DKynn1/5d47oPoAfWVpqj4MSuC9qdbiPtCMnW8qdgEv4D
	xiUSowmFH2y464vPFTfsfNghu/V2VCqva2RzzK38X55M0MbmZzMk4hv9aY9JdORtFXdAYueD53x
	q
X-Google-Smtp-Source: AGHT+IGAQiFVzxoC2tanv9/dm+qDX0AQlAsVwIh40thEXLwFBuMgBMHWXGSFx11D10jHFM8QNjFSuw==
X-Received: by 2002:a0c:ee65:0:b0:6a0:9770:39c2 with SMTP id n5-20020a0cee65000000b006a0977039c2mr471589qvs.54.1713946833378;
        Wed, 24 Apr 2024 01:20:33 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v4 4/4] x86/livepatch: perform sanity checks on the payload exception table contents
Date: Wed, 24 Apr 2024 10:19:57 +0200
Message-ID: <20240424081957.34326-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424081957.34326-1-roger.pau@citrix.com>
References: <20240424081957.34326-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ensure the entries of a payload exception table only apply to text regions in
the payload itself.  Since the payload exception table needs to be loaded and
active even before a patch is applied (because hooks might already rely on it),
make sure the exception table (if any) only contains fixups for the payload
text section.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Rename to extable_in_bounds().
 - Use _p() instead of casting to void *.

Changes since v2:
 - New in this version.
---
 xen/arch/x86/extable.c             | 18 ++++++++++++++++++
 xen/arch/x86/include/asm/uaccess.h |  3 +++
 xen/common/livepatch.c             |  9 +++++++++
 3 files changed, 30 insertions(+)

diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 8415cd1fa249..2be090b92df8 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -228,3 +228,21 @@ unsigned long asmlinkage search_pre_exception_table(struct cpu_user_regs *regs)
     }
     return fixup;
 }
+
+#ifdef CONFIG_LIVEPATCH
+bool extable_in_bounds(const struct exception_table_entry *ex_start,
+                       const struct exception_table_entry *ex_end,
+                       const void *start, const void *end)
+{
+    for ( ; ex_start < ex_end; ex_start++ )
+    {
+        const void *addr = _p(ex_addr(ex_start));
+        const void *cont = _p(ex_cont(ex_start));
+
+        if ( addr < start || addr >= end || cont < start || cont >= end )
+            return false;
+    }
+
+    return true;
+}
+#endif
diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 48b684c19d44..4995edfdd8db 100644
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -426,5 +426,8 @@ extern unsigned long search_exception_table(const struct cpu_user_regs *regs,
 extern void sort_exception_tables(void);
 extern void sort_exception_table(struct exception_table_entry *start,
                                  const struct exception_table_entry *stop);
+extern bool extable_in_bounds(const struct exception_table_entry *ex_start,
+                              const struct exception_table_entry *ex_end,
+                              const void *start, const void *end);
 
 #endif /* __X86_UACCESS_H__ */
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 1afde0281402..4702c06902a9 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -912,6 +912,15 @@ static int prepare_payload(struct payload *payload,
         s = sec->load_addr;
         e = sec->load_addr + sec->sec->sh_size;
 
+        if ( !extable_in_bounds(s, e, payload->text_addr,
+                                payload->text_addr + payload->text_size) )
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


