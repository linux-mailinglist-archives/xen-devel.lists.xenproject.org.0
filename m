Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914EDCB9EAD
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 23:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185895.1507824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBV8-0004DF-Pl; Fri, 12 Dec 2025 22:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185895.1507824; Fri, 12 Dec 2025 22:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBV8-0004Ax-N2; Fri, 12 Dec 2025 22:20:38 +0000
Received: by outflank-mailman (input) for mailman id 1185895;
 Fri, 12 Dec 2025 22:20:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vUBV8-0004Ar-80
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 22:20:38 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8a54e1b-d7a8-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 23:20:37 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso13726785e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 14:20:37 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fb38a977esm6314350f8f.12.2025.12.12.14.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 14:20:35 -0800 (PST)
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
X-Inumbo-ID: c8a54e1b-d7a8-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765578036; x=1766182836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3V4XDxkbSr0Ri1dePMHKcN9nqU1osBYWUXVUX5x7JY=;
        b=VwqSdAFF8r/XsSv8x9La1UigKqTwKVtAo3RBoX4XUkYLZXEAnq1WW4I0pkSsBxQbEP
         GivZDn12ktjteTtu2goG4l0eTYwcrfOtYivn2cRhzcPWxg1DOCR8i9jfALjRneNDRz5X
         9MhdWVzNskhzdd50xZrNoqbeIU+3/HCct1O5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765578036; x=1766182836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F3V4XDxkbSr0Ri1dePMHKcN9nqU1osBYWUXVUX5x7JY=;
        b=d8DlOjfOgOJWu27OsHGSqNRt57rbWh31zZUEOO8GJ/kSfI5VY8RBGK3kxztN5p6XN5
         2JYlns8rNB8gg9H46cjfI5G4553bj8aNUo/Pt0m89P3OYjL4z9o/zgR/LJnNBi0EMvsD
         1RpEF5QYa+rh7Mbgl1GMOFjlKNorZbbiqgxPXniNObI7bG1X5c1ENgBJVJlcIk511aDt
         Q+DnrTqnjspL2K0+4/8jGK6sb9CBnObu7d++q4zqCiGws/j9eUKZUaWdfyHttNeGtvAi
         iLPBnnv3+QnMg6R581XDNEsiwX/xOQBTZznIZ8tnMo3krCF0Mrqtxdo66wWTOkFygA/l
         En0Q==
X-Gm-Message-State: AOJu0YyMGQImAAtpera07aVmEQzq8QZtNyfJrL1xZw7OWu9d/rE5AlOE
	s6hpurugg4ylshyGeQOO9VMGt8ECZLLaDx5O479kgz/tUo9elnLXvzKIpWUx/GSc4W40njxbVlB
	JD4VL
X-Gm-Gg: AY/fxX4iN4aeKGM8Y2Z5S0b90SPUf0Qshxg7u2eTzZR20DMWk6IDokd+lsslA7ifyiP
	M7Ba9nort8ziK0mavVKelOfKonWOpMiA9d9Pwk8DemT6aWkRWCExGFEbif1BYw8falw8fpw2bsA
	lm39RARdYoDPa3jn66T2cYrVfAhOpMJbHVnOGaNlT0WJ0Y2V3LjoEneHwW9+3ayrun5SnoOwCu2
	bvBYotrkzcJsMzhR161lPkS+3QRs4cQ5BnQ86Aws5PyHKkW/mUWwZGkw0SM61ljYvIUp88ZCCLH
	xhdr/PqaxZEEwHLYgwERcJ/eYQNvNOSgW33Pm2ogfifVS/wg2gCsOA+KaH3En1sRmxBcFccLq7M
	ceqGot1rm/0UzxKc7EawpYYM/qIeyDFXJSW0M2jofBdjYyttP+0It24Wie9F3H49ccV43CM5stB
	49voY4NXzQv7m+h9ZA056HfLD6rW2apta8e6BrV4tweAtsKXeT8RPqQjlzwjy6Bw==
X-Google-Smtp-Source: AGHT+IGy3sxQvwG5V1weoi6H6NHr3oODD+Ye2meubDsh3LN/IRVDmCJMkKKdO37X3muwaN49CuEqjw==
X-Received: by 2002:a05:6000:2f81:b0:42b:3062:c647 with SMTP id ffacd0b85a97d-42fb44b7718mr3433452f8f.21.1765578036153;
        Fri, 12 Dec 2025 14:20:36 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 2/5] x86/pv: Change type of do_update_descriptor()'s desc parameter
Date: Fri, 12 Dec 2025 22:20:29 +0000
Message-Id: <20251212222032.2640580-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
References: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The automatically generated hypercall dispatch logic looks like:

    case __HYPERVISOR_update_descriptor: \
        ret = do_update_descriptor((uint64_t)(a1), (seg_desc_t)(a2)); \
        break; \

but seg_desc_t is a union and Eclair considers this to be a violation of MISRA
Rule 1.1.  There's also a Rule 8.3 violation for the parameter name mismatch.

Instead of playing games trying to change seg_desc_t to be a struct, or to
alter the AWK generator to know that seg_desc_t is magic and needs braces
rather than brackets, just switch the type to be a plain uint64_t.

The size is fixed by the x86 architecture, so it is never going to change.
This even lets us simplify compat_update_descriptor() a little.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/pv/descriptor-tables.c | 10 ++++------
 xen/include/hypercall-defs.c        |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index 26f7d18b11b5..8a32b9ae5ced 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -179,11 +179,8 @@ int compat_set_gdt(
 int compat_update_descriptor(
     uint32_t pa_lo, uint32_t pa_hi, uint32_t desc_lo, uint32_t desc_hi)
 {
-    seg_desc_t d;
-
-    d.raw = ((uint64_t)desc_hi << 32) | desc_lo;
-
-    return do_update_descriptor(pa_lo | ((uint64_t)pa_hi << 32), d);
+    return do_update_descriptor(pa_lo | ((uint64_t)pa_hi << 32),
+                                desc_lo | ((uint64_t)desc_hi << 32));
 }
 
 #endif /* CONFIG_PV32 */
@@ -288,9 +285,10 @@ int validate_segdesc_page(struct page_info *page)
     return i == 512 ? 0 : -EINVAL;
 }
 
-long do_update_descriptor(uint64_t gaddr, seg_desc_t d)
+long do_update_descriptor(uint64_t gaddr, uint64_t desc)
 {
     struct domain *currd = current->domain;
+    seg_desc_t d = { .raw = desc };
     gfn_t gfn = gaddr_to_gfn(gaddr);
     mfn_t mfn;
     seg_desc_t *entry;
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index cef08eeec1b8..5782cdfd1496 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -184,7 +184,7 @@ mca(xen_mc_t *u_xen_mc)
 set_trap_table(const_trap_info_t *traps)
 set_gdt(xen_ulong_t *frame_list, unsigned int entries)
 set_callbacks(unsigned long event_address, unsigned long failsafe_address, unsigned long syscall_address)
-update_descriptor(uint64_t gaddr, seg_desc_t desc)
+update_descriptor(uint64_t gaddr, uint64_t desc)
 update_va_mapping(unsigned long va, uint64_t val64, unsigned long flags)
 update_va_mapping_otherdomain(unsigned long va, uint64_t val64, unsigned long flags, domid_t domid)
 #endif
-- 
2.39.5


