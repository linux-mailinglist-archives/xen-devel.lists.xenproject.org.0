Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD782AD3813
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:06:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010799.1389119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfz-0000PN-AQ; Tue, 10 Jun 2025 13:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010799.1389119; Tue, 10 Jun 2025 13:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfy-00007P-Oh; Tue, 10 Jun 2025 13:06:02 +0000
Received: by outflank-mailman (input) for mailman id 1010799;
 Tue, 10 Jun 2025 13:05:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfu-0004iH-Ue
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:58 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a644dc88-45fb-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:05:57 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad89c32a7b5so876016066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:57 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:56 -0700 (PDT)
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
X-Inumbo-ID: a644dc88-45fb-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560757; x=1750165557; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAO1HvfCg38B6ugq8JOzW8h4WZl3XzGZna0ImJ4d1TY=;
        b=fBxc0i1wS9brnVIhIAvDXazFzIUXzfh93Nd2CBGTZ/5zDbtKF3QdjtraieLH4LmdqV
         4dA0AoP2U5kXuP+Tz6fterU5QOiAmZf+L/jwxCZ7jC0IzzFFJy8vfCofS2qvejLANteK
         RA9DU7/zz8tZquuy3fgMZcR2AO5zUSbmJ0a95Ye3SwCLFREp9ltUHyXKwcRQdlzOIuSy
         dLQCCP0a68Y/FKGBHsq7rSCfu8RKx/LpE136mhEm4slMHp5Qb3Um8sy20dj1PZnQNqaZ
         rhP59g2eRS00M1/ewawTFFzU8C/MdcTjo4BMbOUajs91XqVFcPkqEsH8eOtlIZUG0ogi
         Rcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560757; x=1750165557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAO1HvfCg38B6ugq8JOzW8h4WZl3XzGZna0ImJ4d1TY=;
        b=qQbTqYUskgMsZ+kcMPacmSALjPf4hQwfNmA9QS3X15Tt9i9gu6l5CaDYbP/dHGshWH
         Z+PDHnx2Ig5OQz9nmaAFgfppgA1fWLNEAtR6Ntcle81Bb3tYS/MNUv41WcAMzK1xl/Wi
         1w6r5uZkOErRjzG/FDWzJiKsy99jjkNEUb6kgd0U+X9W7CG52udZFRuD49wizEebttPM
         2wYpNaif5l7o7+n/IZowc4v0OkDLo+FFUr+VhicI6ZJJkYEpjCooln6Q4stzxQxyVtUY
         TDa+W694Zaerdl4gEtqtVG6dZVr/MSQ5/hAoRLISYz2huZqxtElmlkOPfasPyH2AZXQC
         rkuQ==
X-Gm-Message-State: AOJu0YzxVmUnM4OVdu3ks/OKwmvi1xuRS9TjY+Te9iOaH0h1pt8+m3Zf
	Emn9LLCzv+hEGVFaRmZ7laY4pq3T48NdWoxR2sur9yARHyPqdOCeTkHODMxzsg==
X-Gm-Gg: ASbGnctVScqG3Eh8ToxlRphiWuq8vq4tRMM9zzaeFTUnLwVr1FVgSNQ0nZ66grqnLHH
	B3LQxaOho6XYBJHZ2PSEpMQ1nIPT38jMHWVoftlOlA38ggXkX3JD7cGH7naN2s1x3SJpTkTIo/c
	nC+MfdrPs+6RmSnqNGaOEiv5kgo91i4/Q0znDX+SDeHYSUdA1+MdRC8VJuDsbHv4BZPKjgxX3ni
	VUdfisBmKNnMpnPOFPVwer/F9XZVF0DSOJaT+gpDpWK5h3S8DUlJCAsKhqjpFG9+p1r6e8sZJun
	QtcJtNXESSBZEauhUOUlKOY1bQgfY6M4UPpFIM8sYCk886U/eNLGv9JYS7M/bC0PwZkkD2KvazD
	zFJdwRnNsuD1TWhMAiQtVmnR2rey6Q3Wv39Vch+c=
X-Google-Smtp-Source: AGHT+IH4jCCiEUNIHRyARWXyMcMwfkq8+JiAqUWpBRX5B6mdVZuFz6Pi1kIjhQ7UNLLrFtiggx+b2Q==
X-Received: by 2002:a17:906:fe08:b0:ade:4304:6b7d with SMTP id a640c23a62f3a-ade7acfab2bmr229932666b.49.1749560756791;
        Tue, 10 Jun 2025 06:05:56 -0700 (PDT)
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
Subject: [PATCH v2 15/17] xen/riscv: Implement superpage splitting for p2m mappings
Date: Tue, 10 Jun 2025 15:05:30 +0200
Message-ID: <7cdd3272f2eba32dfa00be4fd72da6921eac243d.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for down large memory mappings ("superpages") in the RISC-V
p2m mapping so that smaller, more precise mappings ("finer-grained entries")
can be inserted into lower levels of the page table hierarchy.

To implement that the following is done:
- Introduce p2m_split_superpage(): Recursively shatters a superpage into
  smaller page table entries down to the target level, preserving original
  permissions and attributes.
- __p2m_set_entry() updated to invoke superpage splitting when inserting
  entries at lower levels within a superpage-mapped region.

This implementation is based on the ARM code, with modifications to the part
that follows the BBM (break-before-make) approach. Unlike ARM, RISC-V does
not require BBM, so there is no need to invalidate the PTE and flush the
TLB before updating it with the newly created, split page table.
Additionally, the page table walk logic has been adjusted, as ARM uses the
opposite walk order compared to RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
   functionality" which was splitted to smaller.
 - Update the commit above the cycle which creates new page table as
   RISC-V travserse page tables in an opposite to ARM order.
 - RISC-V doesn't require BBM so there is no needed for invalidating
   and TLB flushing before updating PTE.
---
 xen/arch/riscv/p2m.c | 102 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 87dd636b80..79c4473f1f 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -743,6 +743,77 @@ static void p2m_free_entry(struct p2m_domain *p2m,
     p2m_free_page(p2m->domain, pg);
 }
 
+static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
+                                unsigned int level, unsigned int target,
+                                const unsigned int *offsets)
+{
+    struct page_info *page;
+    unsigned int i;
+    pte_t pte, *table;
+    bool rv = true;
+
+    /* Convenience aliases */
+    mfn_t mfn = pte_get_mfn(*entry);
+    unsigned int next_level = level - 1;
+    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
+
+    /*
+     * This should only be called with target != level and the entry is
+     * a superpage.
+     */
+    ASSERT(level > target);
+    ASSERT(p2me_is_superpage(p2m, *entry, level));
+
+    page = p2m_alloc_page(p2m->domain);
+    if ( !page )
+        return false;
+
+    page_list_add(page, &p2m->pages);
+    table = __map_domain_page(page);
+
+    /*
+     * We are either splitting a second level 1G page into 512 first level
+     * 2M pages, or a first level 2M page into 512 zero level 4K pages.
+     */
+    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
+    {
+        pte_t *new_entry = table + i;
+
+        /*
+         * Use the content of the superpage entry and override
+         * the necessary fields. So the correct permission are kept.
+         */
+        pte = *entry;
+        pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
+
+        write_pte(new_entry, pte);
+    }
+
+    /*
+     * Shatter superpage in the page to the level we want to make the
+     * changes.
+     * This is done outside the loop to avoid checking the offset to
+     * know whether the entry should be shattered for every entry.
+     */
+    if ( next_level != target )
+        rv = p2m_split_superpage(p2m, table + offsets[next_level],
+                                 level - 1, target, offsets);
+
+    /* TODO: why it is necessary to have clean here? Not somewhere in the caller */
+    if ( p2m->clean_pte )
+        clean_dcache_va_range(table, PAGE_SIZE);
+
+    unmap_domain_page(table);
+
+    /*
+     * Even if we failed, we should install the newly allocated PTE
+     * entry. The caller will be in charge to free the sub-tree.
+     */
+    p2m_write_pte(entry, page_to_p2m_table(p2m, page), p2m->clean_pte);
+
+    return rv;
+}
+
 /*
  * Insert an entry in the p2m. This should be called with a mapping
  * equal to a page/superpage.
@@ -806,7 +877,36 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
      */
     if ( level > target )
     {
-        panic("Shattering isn't implemented\n");
+        /* We need to split the original page. */
+        pte_t split_pte = *entry;
+
+        ASSERT(p2me_is_superpage(p2m, *entry, level));
+
+        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
+        {
+            /* Free the allocated sub-tree */
+            p2m_free_entry(p2m, split_pte, level);
+
+            rc = -ENOMEM;
+            goto out;
+        }
+
+        p2m_write_pte(entry, split_pte, p2m->clean_pte);
+
+        /* Then move to the level we want to make real changes */
+        for ( ; level < target; level++ )
+        {
+            rc = p2m_next_level(p2m, true, level, &table, offsets[level]);
+
+            /*
+             * The entry should be found and either be a table
+             * or a superpage if level 0 is not targeted
+             */
+            ASSERT(rc == GUEST_TABLE_NORMAL ||
+                   (rc == GUEST_TABLE_SUPER_PAGE && target > 0));
+        }
+
+        entry = table + offsets[level];
     }
 
     /*
-- 
2.49.0


