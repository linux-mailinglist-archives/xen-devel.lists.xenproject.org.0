Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07706CB3C2C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 19:30:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183170.1505990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOxK-0005wa-TQ; Wed, 10 Dec 2025 18:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183170.1505990; Wed, 10 Dec 2025 18:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOxK-0005oR-PM; Wed, 10 Dec 2025 18:30:30 +0000
Received: by outflank-mailman (input) for mailman id 1183170;
 Wed, 10 Dec 2025 18:30:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=unxu=6Q=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vTOxJ-0004ng-E8
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 18:30:29 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d569813-d5f6-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 19:30:28 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47a80d4a065so638245e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 10:30:28 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a886affb4sm1696105e9.3.2025.12.10.10.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 10:30:27 -0800 (PST)
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
X-Inumbo-ID: 4d569813-d5f6-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765391428; x=1765996228; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NS1EndFYbpf3vAxuQ4QceAjOVlxSaNZnyI0peaJbSIU=;
        b=dyq2ATgaxwe7QbZherysmV565u7KHN01w4CystAmvsH6Qg3zWBOnZdOz5w6Vqf2QX7
         YpnAwOJmJ2XixqzBaOWKLqDKSDCCla69OckNtdDsxJKNnKIPdrz3zDIxojy78bPDn8Wp
         Dh8hY+1KfkJlOhrFGfiCz5rTH/8zSTpB1kfbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765391428; x=1765996228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NS1EndFYbpf3vAxuQ4QceAjOVlxSaNZnyI0peaJbSIU=;
        b=oIYWTkKaP0SoUdqOTQp74a5xYMAJryNmxb8zz0WZYLt++NfjkPEYry1idnl2Reos4X
         iWMDgC62TEfaX/BJVnY+6dDiAWBMlndB3gn6B26aYOVMbIkuBNIOzeqUe9YWGIvYKYgP
         Dv3/33zqimRDZGR8y8fQgTNCW0/MenCWH0r6ybtNFf88zBXZgS7NoRTXPtucJMTg6b/W
         /7v8r7Rc069DeDOfE0exzXmHsrNPFW+WjOoo1uW18jUJqbzuIzcAThieFaF25Hiz19+r
         6HWeqpD7T1xQb8qticoZ3OJeHVTNrvupFwV2xitFqhXXXmMXYLaqM7pvItKr2t0Qs4P1
         VXhw==
X-Gm-Message-State: AOJu0Yz+nXxNXeDXE8ox6SWBhSgRYjMsoBD5J/j/cP+3tcyAtQTrhEqz
	3hc51pSaIQO8m2McNHvhYBCsUOmEqPGTDqVRwOIZOvTsQRCQlglTMwtTcehH93ab61FWPt1Gcoy
	45i7o
X-Gm-Gg: ASbGncuQJ+X7DDiEYmmnVD2gpKCjc7BEDGBwVtEJYoKkVdWQ/Fj6kVoWeBQhAkHJW29
	tzw/sDMLQbTYS4v6r4VzePbRWcYdYqwW47dTr5jp/PDiY7HwHdR5lbe9dLYABOWwgU1cuWiD4UX
	CDL5V7LGXjHhvGdi+4vkpDOD4cAxezDzuXn9gmUz4rOz/Tu468sGzX5bnDzBrPov53KBjGlpBX2
	CxWrPSdGe/GX3xciCPbiJqcZAHQCwzvRKhdILUSmNOishQ9/hPPgHvQIl0Ls0zjfc3pU8dltMRj
	TEcFv5xg/u/AcUlpihY7K1e2GnP+VV2aKE+V6N7ahY2QRIDLlzcMPMRNUXm41za06itFlsnXi+G
	48UZO+gzBQ2UGB9aiQqQqpOMbU1GTViZU3AzG/Xzx3z8TwvUo2X8jfGXssxitZINmpDG7d/AujZ
	r3BM195Ov3zCXlUegsIn6f5CWyEJjis9GoVGlXnhrodoMx6hkYUlg34xfbsHNh6oLxpkUr6QvT
X-Google-Smtp-Source: AGHT+IHD0K0/goDBgvQ0eFH4wZgG9dS6dBkYuhuXnCJuEuZJfSb+0YcfcBuj17vO+utCkeybtuqlLQ==
X-Received: by 2002:a05:600c:c48e:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-47a8384857cmr31691765e9.32.1765391427782;
        Wed, 10 Dec 2025 10:30:27 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 5/5] x86: Fix missing brackets in macros
Date: Wed, 10 Dec 2025 18:30:19 +0000
Message-Id: <20251210183019.2241560-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the wider testing, some more violations have been spotted.  This
addresses violations of Rule 20.7 which requires macro parameters to be
bracketed.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/mm/shadow/multi.c     | 2 +-
 xen/arch/x86/mm/shadow/private.h   | 6 +++---
 xen/drivers/passthrough/vtd/dmar.h | 2 +-
 xen/include/xen/kexec.h            | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 03be61e225c0..36ee6554b4c4 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -781,7 +781,7 @@ do {                                                                    \
         (_sl1e) = _sp + _i;                                             \
         if ( shadow_l1e_get_flags(*(_sl1e)) & _PAGE_PRESENT )           \
             {_code}                                                     \
-        if ( _done ) break;                                             \
+        if ( (_done) ) break;                                           \
         increment_ptr_to_guest_entry(_gl1p);                            \
     }                                                                   \
     unmap_domain_page(_sp);                                             \
diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index cef9dbef2e77..93834ec55c42 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -636,9 +636,9 @@ prev_pinned_shadow(struct page_info *page,
 }
 
 #define foreach_pinned_shadow(dom, pos, tmp)                    \
-    for ( pos = prev_pinned_shadow(NULL, (dom));                \
-          pos ? (tmp = prev_pinned_shadow(pos, (dom)), 1) : 0;  \
-          pos = tmp )
+    for ( (pos) = prev_pinned_shadow(NULL, dom);                \
+          (pos) ? (tmp = prev_pinned_shadow(pos, dom), 1) : 0;  \
+          (pos) = tmp )
 
 /*
  * Pin a shadow page: take an extra refcount, set the pin bit,
diff --git a/xen/drivers/passthrough/vtd/dmar.h b/xen/drivers/passthrough/vtd/dmar.h
index 0ff4f365351f..11590f71a828 100644
--- a/xen/drivers/passthrough/vtd/dmar.h
+++ b/xen/drivers/passthrough/vtd/dmar.h
@@ -124,7 +124,7 @@ struct acpi_atsr_unit *acpi_find_matched_atsr_unit(const struct pci_dev *);
 do {                                                \
     s_time_t start_time = NOW();                    \
     while (1) {                                     \
-        sts = op(iommu->reg, offset);               \
+        sts = op((iommu)->reg, offset);             \
         if ( cond )                                 \
             break;                                  \
         if ( NOW() > start_time + DMAR_OPERATION_TIMEOUT ) {    \
diff --git a/xen/include/xen/kexec.h b/xen/include/xen/kexec.h
index e66eb6a8e593..5dd288d1a50e 100644
--- a/xen/include/xen/kexec.h
+++ b/xen/include/xen/kexec.h
@@ -66,9 +66,9 @@ void vmcoreinfo_append_str(const char *fmt, ...)
 #define VMCOREINFO_PAGESIZE(value) \
        vmcoreinfo_append_str("PAGESIZE=%ld\n", value)
 #define VMCOREINFO_SYMBOL(name) \
-       vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #name, (unsigned long)&name)
+       vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #name, (unsigned long)&(name))
 #define VMCOREINFO_SYMBOL_ALIAS(alias, name) \
-       vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #alias, (unsigned long)&name)
+       vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #alias, (unsigned long)&(name))
 #define VMCOREINFO_STRUCT_SIZE(name) \
        vmcoreinfo_append_str("SIZE(%s)=%zu\n", #name, sizeof(struct name))
 #define VMCOREINFO_OFFSET(name, field) \
-- 
2.39.5


