Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E02628E356
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 17:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6778.17843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSiky-000766-Af; Wed, 14 Oct 2020 15:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6778.17843; Wed, 14 Oct 2020 15:32:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSiky-00075h-7C; Wed, 14 Oct 2020 15:32:00 +0000
Received: by outflank-mailman (input) for mailman id 6778;
 Wed, 14 Oct 2020 15:31:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kSikw-00075c-NH
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:31:58 +0000
Received: from mail-il1-x143.google.com (unknown [2607:f8b0:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d3a6679-e39a-4e85-96f0-af1d0d789080;
 Wed, 14 Oct 2020 15:31:57 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id y16so5653887ila.7
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 08:31:57 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 141sm3542028ile.28.2020.10.14.08.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 08:31:55 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kSikw-00075c-NH
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:31:58 +0000
X-Inumbo-ID: 5d3a6679-e39a-4e85-96f0-af1d0d789080
Received: from mail-il1-x143.google.com (unknown [2607:f8b0:4864:20::143])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5d3a6679-e39a-4e85-96f0-af1d0d789080;
	Wed, 14 Oct 2020 15:31:57 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id y16so5653887ila.7
        for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 08:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A231TBZ2Ivah9yjc9zzpIQqITm/85+M+9V1kUfCUUSo=;
        b=BFnSVUGuztDOl1NOlhPYRd20LtlvlhDxHd3bdOQP4eNv/E5yzhhbp9x8MAUBuO2dCh
         4nmXEm1SkeaPwANH0C5hex8WjEOTXZrjgwY0DkwoQCFa6GoMS7qMuyBJz2AhWY3rMEoy
         V4DxZmE8g6K3wJxLNczxJDgB2KklQNASAchny4fVNLPamBZz1/7rCSFM+lAH9/XgMK81
         lZLlELRXAZLy0B6mXHDIFKszFiLHsDE6YS5L4XaLxpGXoJ/Cx2k5qczBD2aACMh2nxSz
         2nZ8eBkYlxLg9eZhYc/Exf4diSL0Y0j38zNQ1W3uq/SK2UzKNtiRda0zzpTCo4ugVhvP
         0FbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A231TBZ2Ivah9yjc9zzpIQqITm/85+M+9V1kUfCUUSo=;
        b=j9zVFrHAOmjZ23YrF+5oHak20WF7gtFe461dY6E+t/vLQ0HwcclmOx/etr/dkL1WyJ
         kTXR7Uqhldl9ynW9CtQENIvPvcJiz/dZaQiZvuuxoP2AMEu/CkY8kCoB3IVSh0l0a2DX
         YHZ4a6CjDFhz74yLKx/jfVYZdyBhm+wceZnMfMGnpZIJfJ7TR/SQMFiwcog9jrvAzCog
         ve+ZZfN8OcH2thPkbCC76b1ettAfxZaYXaGGBALYrMMJlrSc/81qUsXmL+8hzOUQHIP1
         Id07KIAGgaFrpL4nfWLsuyYMlcZFF9FJq0axt4dRQnBWrdjFID36svcXMG/vQzT3xUnl
         jHkg==
X-Gm-Message-State: AOAM533hx57jDbHL7v/UYoyZYmHuDvJElrynkQIh8vm1uQMDcuvkE6lo
	D9RIpEvqtc+HlhHipNhtbVJfdcsw5I8=
X-Google-Smtp-Source: ABdhPJzsp9g+E+vLo8j/uENquVupd52HoH9TyanLD0kh6vg7z+YchUEKn1xkMdzWqAgQd2M9qiJf8w==
X-Received: by 2002:a92:c88e:: with SMTP id w14mr4005759ilo.185.1602689516859;
        Wed, 14 Oct 2020 08:31:56 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
        by smtp.gmail.com with ESMTPSA id 141sm3542028ile.28.2020.10.14.08.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 08:31:55 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
Date: Wed, 14 Oct 2020 11:31:50 -0400
Message-Id: <20201014153150.83875-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux kernels only have an ENTRY elfnote when built with CONFIG_PV.  A
kernel build CONFIG_PVH=y CONFIG_PV=n lacks the note.  In this case,
virt_entry will be UNSET_ADDR, overwritten by the ELF header e_entry,
and fail the check against the virt address range.

Change the code to only check virt_entry against the virtual address
range if it was set upon entry to the function.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

---
Maybe the overwriting of virt_entry could be removed, but I don't know
if there would be unintended consequences where (old?) kernels don't
have an elfnote, but do have an in-range e_entry?  The failing kernel I
just looked at has an e_entry of 0x1000000.

Oh, it looks like Mini-OS doesn't set the entry ELFNOTE and relies on
e_entry (of 0) to pass these checks.

---
 xen/common/libelf/libelf-dominfo.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index 508f08db42..1ecf35166b 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -416,6 +416,7 @@ static elf_errorstatus elf_xen_note_check(struct elf_binary *elf,
 static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
                                    struct elf_dom_parms *parms)
 {
+    bool check_virt_entry = true;
     uint64_t virt_offset;
 
     if ( (parms->elf_paddr_offset != UNSET_ADDR) &&
@@ -456,8 +457,10 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
     parms->virt_kstart = elf->pstart + virt_offset;
     parms->virt_kend   = elf->pend   + virt_offset;
 
-    if ( parms->virt_entry == UNSET_ADDR )
+    if ( parms->virt_entry == UNSET_ADDR ) {
         parms->virt_entry = elf_uval(elf, elf->ehdr, e_entry);
+        check_virt_entry = false;
+    }
 
     if ( parms->bsd_symtab )
     {
@@ -476,11 +479,17 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
     elf_msg(elf, "    p2m_base         = 0x%" PRIx64 "\n", parms->p2m_base);
 
     if ( (parms->virt_kstart > parms->virt_kend) ||
-         (parms->virt_entry < parms->virt_kstart) ||
-         (parms->virt_entry > parms->virt_kend) ||
          (parms->virt_base > parms->virt_kstart) )
     {
-        elf_err(elf, "ERROR: ELF start or entries are out of bounds\n");
+        elf_err(elf, "ERROR: ELF start is out of bounds\n");
+        return -1;
+    }
+
+    if ( check_virt_entry &&
+         ( (parms->virt_entry < parms->virt_kstart) ||
+           (parms->virt_entry > parms->virt_kend) ) )
+    {
+        elf_err(elf, "ERROR: ELF entry is out of bounds\n");
         return -1;
     }
 
-- 
2.26.2


