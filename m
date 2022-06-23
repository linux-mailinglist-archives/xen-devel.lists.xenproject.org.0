Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851FE5574BB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 10:02:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354542.581695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Hn2-0000kc-Uf; Thu, 23 Jun 2022 08:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354542.581695; Thu, 23 Jun 2022 08:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Hn2-0000ip-Rl; Thu, 23 Jun 2022 08:02:12 +0000
Received: by outflank-mailman (input) for mailman id 354542;
 Thu, 23 Jun 2022 08:02:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4Hn1-0000ij-HY
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 08:02:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c88f39c3-f2ca-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 10:02:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 238D021C09;
 Thu, 23 Jun 2022 08:02:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8ED613AB2;
 Thu, 23 Jun 2022 08:02:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d+PjMgEetGJLdgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Jun 2022 08:02:09 +0000
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
X-Inumbo-ID: c88f39c3-f2ca-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655971330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2NL1pFdeH5hHxZALWQiBRVNMsb2ulVlRd+lsPDspO4g=;
	b=f6zlMDwd1pShidmnntxIfjGU8VdW1yi/n02tx8+x51PWWaF9IOszu/vPypii10BPY9Vv60
	Pw0FaKWQH559qE2ogYUXPRibZC7G0fNNMABiPmaD1F5VRFg1U5OM0426ByYwiHH5mUt/i3
	tFYAhXMbVMK6ToEdJxvtnqHcUKWxh4g=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen: consider alloc-only segments when loading PV dom0 kernel
Date: Thu, 23 Jun 2022 10:02:08 +0200
Message-Id: <20220623080208.2214-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When loading the dom0 kernel for PV mode, the first free usable memory
location after the kernel needs to take segments into account, which
have only the ALLOC flag set, but are not specified to be loaded in
the program headers of the ELF file.

This is e.g. a problem for Linux kernels from 5.19 onwards, as those
can have a final NOLOAD section at the end, which must not be used by
e.g. the start_info structure or the initial page tables allocated by
the hypervisor.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/libelf/libelf-loader.c | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/xen/common/libelf/libelf-loader.c b/xen/common/libelf/libelf-loader.c
index 629cc0d3e6..4b0e3ced55 100644
--- a/xen/common/libelf/libelf-loader.c
+++ b/xen/common/libelf/libelf-loader.c
@@ -467,7 +467,9 @@ do {                                                                \
 void elf_parse_binary(struct elf_binary *elf)
 {
     ELF_HANDLE_DECL(elf_phdr) phdr;
+    ELF_HANDLE_DECL(elf_shdr) shdr;
     uint64_t low = -1, high = 0, paddr, memsz;
+    uint64_t vlow = -1, vhigh = 0, vaddr, voff;
     unsigned i, count;
 
     count = elf_phdr_count(elf);
@@ -480,6 +482,7 @@ void elf_parse_binary(struct elf_binary *elf)
         if ( !elf_phdr_is_loadable(elf, phdr) )
             continue;
         paddr = elf_uval(elf, phdr, p_paddr);
+        vaddr = elf_uval(elf, phdr, p_vaddr);
         memsz = elf_uval(elf, phdr, p_memsz);
         elf_msg(elf, "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 "\n",
                 paddr, memsz);
@@ -487,7 +490,37 @@ void elf_parse_binary(struct elf_binary *elf)
             low = paddr;
         if ( high < paddr + memsz )
             high = paddr + memsz;
+        if ( vlow > vaddr )
+            vlow = vaddr;
+        if ( vhigh < vaddr + memsz )
+            vhigh = vaddr + memsz;
     }
+
+    voff = vhigh - high;
+
+    count = elf_shdr_count(elf);
+    for ( i = 0; i < count; i++ )
+    {
+        shdr = elf_shdr_by_index(elf, i);
+        if ( !elf_access_ok(elf, ELF_HANDLE_PTRVAL(shdr), 1) )
+            /* input has an insane section header count field */
+            break;
+        if ( !(elf_uval(elf, shdr, sh_flags) & SHF_ALLOC) )
+            continue;
+        vaddr = elf_uval(elf, shdr, sh_addr);
+        memsz = elf_uval(elf, shdr, sh_size);
+        if ( vlow > vaddr )
+        {
+            vlow = vaddr;
+            low = vaddr - voff;
+        }
+        if ( vhigh < vaddr + memsz )
+        {
+            vhigh = vaddr + memsz;
+            high = vaddr + memsz - voff;
+        }
+    }
+
     elf->pstart = low;
     elf->pend = high;
     elf_msg(elf, "ELF: memory: %#" PRIx64 " -> %#" PRIx64 "\n",
-- 
2.35.3


