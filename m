Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7D6A170DD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 17:55:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875029.1285390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZv3F-0006QZ-EY; Mon, 20 Jan 2025 16:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875029.1285390; Mon, 20 Jan 2025 16:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZv3F-0006On-B5; Mon, 20 Jan 2025 16:55:01 +0000
Received: by outflank-mailman (input) for mailman id 875029;
 Mon, 20 Jan 2025 16:54:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xfr=UM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tZv3D-0005fM-4Z
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 16:54:59 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 478ffdb4-d74f-11ef-99a4-01e77a169b0f;
 Mon, 20 Jan 2025 17:54:57 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3003c0c43c0so50073791fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2025 08:54:57 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a35aec4sm16581501fa.56.2025.01.20.08.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 08:54:56 -0800 (PST)
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
X-Inumbo-ID: 478ffdb4-d74f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737392097; x=1737996897; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKyZpIY7f8FG3QEkOJcyw71ibKhausbsni6UpIbgyKc=;
        b=AU+DWBbSlZyR+59P4cd4Kl82WOplfekxfVnXeZHtTKsNooQTeQmh/ShlQbI+mNc03S
         kIcwl28JbWoHaa8DrdjC0yKCqBT1hvoVAwVfN7AAdBMxgTYeeF246haaBxHl1GpoJYE7
         BNvSZE2hCw1ge7NSLbJdFpO++OXN3p9AJ9e66uyldMzpWUyeP6WFigz10aBoPJyihdBO
         FN2ODuptdIyD+aUyuwcU8scoB+0Tat/B0bD+0LNafIXSN8MphpFDx0QId3tQdqytT7nZ
         6J8cNeUwHmTj2JObavgig6WRJH5jYHRKnHFYyef5LalOTsEuDLktB0xmhqs8glOPPg/X
         ZH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737392097; x=1737996897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKyZpIY7f8FG3QEkOJcyw71ibKhausbsni6UpIbgyKc=;
        b=LnI1FWux9JLTpaRblI9GcbZOm4NvtV6apfOuqKhUl/TSVpO3MTSxl6lQQ7hMJBpm2N
         Zy7IZ/v3RupwIGbVmQlhwF1i/xm5oIFPUurC93/dOXTia8KxAPlLpGsgxfLyuMMnudUx
         RY1+86P9IXc5asIT9i2ql5W7sl8x5ndQOsS2bYjP4vU+MkRmmgmXQhHsDgwlQ4Rzobnc
         e+AC0uOx4Xc6a/1WGKr95Wf/O2ZtgFOO20AJGp1B74Ig7FANHfwO5KkcvzVydEE59mgl
         teeqxFKz3Z6W7DfTzTizFbIIzaYt0V/crvPMtNE8I4w+HjE8chJwANTEyvKKR2tQyuby
         TcnA==
X-Gm-Message-State: AOJu0YxX4vYQbo9qJ6v7xDz0IwT606Vbly+QX7G0Jg6+vJe7D8eYiYOW
	5cAKJQG9TSRUqBXQ/F9uOWVscGRi3vqnwTThtPWlPn+KY17xD22sodhnQg==
X-Gm-Gg: ASbGnctT5JrLnY8wubiQzLC6SthtEa4KdIbPP/RAvRM5fGJArw5Sl5V0AmRUjEiH00y
	hQEOKnABom6fz+h9SRq6pjhp+OPzESEn0YkuMwffGMMYK5RvuULh3zIR9Z5n2+LLBfO/7LwLbNf
	uY09RzeLKETDnHskhQZXXpBQ9WpAq8q8X3g8kmmhHdR/0QOUxgHQTUxUx/e9Qqr7weODzE7NfGV
	XEuzHmL45ISOmzLN4Rf82Wh4Sh87425TIBQ2wFHZZr0Q9lG24CY+9hJoYg/aqBr2tLKINw=
X-Google-Smtp-Source: AGHT+IH/viGUbRyRw/B7XR/62gU1OPKwbDr47PSryCh5/zBWHLDg91Hg7oKnyLuGqHaJ/yivTGWjHQ==
X-Received: by 2002:a05:651c:b27:b0:2ff:c86b:5b4f with SMTP id 38308e7fff4ca-3072ca9c953mr52322211fa.21.1737392096663;
        Mon, 20 Jan 2025 08:54:56 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 3/3] xen/riscv: update mfn calculation in pt_mapping_level()
Date: Mon, 20 Jan 2025 17:54:49 +0100
Message-ID: <a4a970490471035bf49a97257b400da23091fb9a.1737391102.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1737391102.git.oleksii.kurochko@gmail.com>
References: <cover.1737391102.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When pt_update() is called with arguments (..., INVALID_MFN, ..., 0 or 1),
it indicates that a mapping is being destroyed/modifyed.

`mfn` should be set properly in cases when modifying/destroying a  mapping
to ensure the correct page table `level` is returned. In the  case of
`mfn` == INVALID_MFN, the `mask` will take into account only `vfn` and could
accidentally return an incorrect level.
For example,  if `vfn` is page table level 1 aligned, but it was mapped as
page table level 0, then without the check below it will return `level` = 1
because only `vfn`, which is page table level 1 aligned, is taken into
account when `mfn` == INVALID_MFN.

To address this issue, during the destruction/modification of a mapping,
physical address is calculated for provided `va`. This ensures that the
appropriate mask is generated, resulting in the correct calculation of
the level.

Fixes: c2f1ded524 ("xen/riscv: page table handling")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/pt.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index 865d60d1af..c8bc6f7e37 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -346,9 +346,33 @@ static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
         return level;
 
     /*
-     * Don't take into account the MFN when removing mapping (i.e
-     * MFN_INVALID) to calculate the correct target order.
+     * `mfn` should be set properly in cases when modifying/destroying a
+     * mapping to ensure the correct page table `level` is received. In the
+     * case of `mfn` == INVALID_MFN, the `mask` will take into account only
+     * `vfn` and could accidentally return an incorrect level. For example,
+     * if `vfn` is page table level 1 aligned, but it was mapped as page table
+     * level 0, then without the check below it will return `level` = 1
+     * because only `vfn`, which is page table level 1 aligned, is taken into
+     * account when `mfn` == INVALID_MFN.
      *
+     * POPULATE shouldn't be considered as `va` hasn't been mapped yet.
+     */
+    if ( mfn_eq(mfn, INVALID_MFN) && !(flags & PTE_POPULATE) )
+    {
+        vaddr_t va = vfn << PAGE_SHIFT;
+        paddr_t pa;
+        unsigned long xen_virt_end = (XEN_VIRT_START + XEN_VIRT_SIZE - 1);
+
+        if ( ((va >= DIRECTMAP_VIRT_START) && (va <= DIRECTMAP_VIRT_END)) ||
+             ((va >= XEN_VIRT_START) && (va <= xen_virt_end)) )
+            pa = virt_to_maddr(va);
+        else
+            pa = pt_walk(va);
+
+        mfn = _mfn(paddr_to_pfn(pa));
+    }
+
+    /*
      * `vfn` and `mfn` must be both superpage aligned.
      * They are or-ed together and then checked against the size of
      * each level.
-- 
2.48.1


