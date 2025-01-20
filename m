Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B64A170DC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 17:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875027.1285370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZv3B-0005vd-RR; Mon, 20 Jan 2025 16:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875027.1285370; Mon, 20 Jan 2025 16:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZv3B-0005tP-Oo; Mon, 20 Jan 2025 16:54:57 +0000
Received: by outflank-mailman (input) for mailman id 875027;
 Mon, 20 Jan 2025 16:54:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xfr=UM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tZv3A-0005fS-LH
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 16:54:56 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 466665e7-d74f-11ef-a0e4-8be0dac302b0;
 Mon, 20 Jan 2025 17:54:55 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-30219437e63so57884471fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2025 08:54:55 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a35aec4sm16581501fa.56.2025.01.20.08.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 08:54:54 -0800 (PST)
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
X-Inumbo-ID: 466665e7-d74f-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737392095; x=1737996895; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAci7/y9aPonTonAxMRXFGNKbw9P1cakqYuBwvG636Q=;
        b=Yx9aellsnkuED7G5txVPAKyxUjdWwSBSaeF06qlWva4/2lnAFmigc/FlGtYvBOxyHw
         9XMJZoRJ2d/JsfVACxOxrucZ1oCIwNremymLKUrzSMVpaJlPbh8aWO/BNmhcdRHc65Uk
         94PNC+kkq+h1SjPPG9/7dPHDVXGa4+EsEcES9B0Pqr/6BzAoiWrpxcGxORVjksDqy0kp
         qYeo5/oxLlCm1j9Yb9NAupKhYY2KKiZTD8u+4g7ICdr9g3KS8W0M03+OdvbUmJKCc+2u
         UdHsm40wFyinIt05zVK+iDuh2/Spv61Y/gIRdHhJq9Lr28JmF44c5TydfIlAo7voeKoH
         Vj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737392095; x=1737996895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAci7/y9aPonTonAxMRXFGNKbw9P1cakqYuBwvG636Q=;
        b=YK920muqcRi+GRta8R6NAEFvATV4WyYzLEuMO6IgzNtnODP1pGxl/rFkTbePMlaiJQ
         SIQ2w9OZGzFW6s1pRwVzlrthBAD29YOcG1QnTXdCMwIFVQokJV6CfX/0LEtV0fn+NOHV
         aTTKreWI0LD9Jg/U/qA0A4fg6QvoWUKGUewfwxhmLbwzN3+b2nFYCxy9L8c2zsImfcAk
         AeCJOsynAnk8O2eIvqgAR420OkW9ipgcopnpaB4aF31hL4ZBPSBCCl1t0JjGXGTE2RN2
         m96SPEGjkW28ytvNA1Lnvw0SgA/VUj3VCpiNABQiXt3pAZ8+/KuZp8oVnuVZxlo3UEfY
         2RFA==
X-Gm-Message-State: AOJu0Yyuct7Qdt5Otv3rcK+cDv0wMqTTRRNPMPfSeX8jbYm9PmSSCuKv
	nEACggM0sNkZ4eIDUWqRE+3Ksg7VMeDomdxF4LAO35JK/mn/XSfkeyamCw==
X-Gm-Gg: ASbGnct1zBqavo2E7AyfxhA4jTf7Hk8h0nTXqr7c2BAQQPtMlVXecZZkHOl7/npVVSr
	opMLMw7uEhKM5zdAQG5gVwfEF8G/o0OKZvHLcxHENJ6mMEu6TjnXW195QKwmyxboGR7q9TzO1Se
	T3FYxzux/ivISa0eokJyOdCXAtTMXb2CIzEpgVea5iBI6rHMq0HbxWZAVspZJsAOS4e9rQsvsFQ
	hKAY5w7tMjLjEU39bnsZkSkM3sQ4ToNiIAmR4EiIQe0bRsVvNMIVNN378+GfNbAxeJkNis=
X-Google-Smtp-Source: AGHT+IFz5Cwm7/8fr/VJmijwGV+DRnd1DmMRxxqBYFi+G0+4wzYO6HCvGfCX2bJrTTWWBIyVVv0Mqw==
X-Received: by 2002:a2e:a912:0:b0:306:d69:904b with SMTP id 38308e7fff4ca-3072d11346dmr48975511fa.8.1737392094574;
        Mon, 20 Jan 2025 08:54:54 -0800 (PST)
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
Subject: [PATCH v1 1/3] xen/riscv: implement software page table walking
Date: Mon, 20 Jan 2025 17:54:47 +0100
Message-ID: <00dfc71569bc9971b53e29b36a80e9e020ac61ac.1737391102.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1737391102.git.oleksii.kurochko@gmail.com>
References: <cover.1737391102.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V doesn't have hardware feature to ask MMU to translate
virtual address to physical address ( like Arm has, for example ),
so software page table walking in implemented.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/mm.h |  2 ++
 xen/arch/riscv/pt.c             | 56 +++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 292aa48fc1..d46018c132 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -15,6 +15,8 @@
 
 extern vaddr_t directmap_virt_start;
 
+paddr_t pt_walk(vaddr_t va);
+
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
 
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index a703e0f1bd..865d60d1af 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -274,6 +274,62 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
     return rc;
 }
 
+paddr_t pt_walk(vaddr_t va)
+{
+    const mfn_t root = get_root_page();
+    /*
+     * In pt_walk() only XEN_TALE_MAP_NONE and XEN_TABLE_SUPER_PAGE are
+     * handled ( as they are only possible for page table walking ), so
+     * initialize `ret` with "impossible" XEN_TABLE_MAP_NOMEM.
+    */
+    int ret = XEN_TABLE_MAP_NOMEM;
+    unsigned int level = HYP_PT_ROOT_LEVEL;
+    paddr_t pa = 0;
+    pte_t *table;
+
+    DECLARE_OFFSETS(offsets, va);
+
+    table = map_table(root);
+
+    /*
+     * Find `pa` of an entry which corresponds to `va` by iterating for each
+     * page level and checking if the entry points to a next page table or
+     * to a page.
+     *
+     * Two cases are possible:
+     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was find;
+     *   (Despite of the name) XEN_TABLE_SUPER_PAGE covers 4k mapping too.
+     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
+     *   mapped.
+     */
+    while ( (ret != XEN_TABLE_MAP_NONE) && (ret != XEN_TABLE_SUPER_PAGE) )
+    {
+        /*
+         * This case shouldn't really occur as it will mean that for table
+         * level 0 a pointer to next page table has been written, but at
+         * level 0 it could be only a pointer to 4k page.
+         */
+        ASSERT(level <= HYP_PT_ROOT_LEVEL);
+
+        ret = pt_next_level(false, &table, offsets[level]);
+        level--;
+    }
+
+    if ( ret == XEN_TABLE_MAP_NONE )
+        dprintk(XENLOG_WARNING, "Is va(%#lx) really mapped?\n", va);
+    else if ( ret == XEN_TABLE_SUPER_PAGE )
+        pa = pte_to_paddr(*(table + offsets[level + 1]));
+
+    /*
+     * There is no need for unmap_table() after each pt_next_level() call as
+     * pt_next_level() will do unmap_table() for the previous table before
+     * returning next level table.
+     */
+    unmap_table(table);
+
+    return pa;
+}
+
 /* Return the level where mapping should be done */
 static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
                             unsigned int flags)
-- 
2.48.1


