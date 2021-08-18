Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8176F3F0CC9
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 22:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168318.307341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCM-0008Cq-7j; Wed, 18 Aug 2021 20:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168318.307341; Wed, 18 Aug 2021 20:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCM-0008AF-3S; Wed, 18 Aug 2021 20:30:06 +0000
Received: by outflank-mailman (input) for mailman id 168318;
 Wed, 18 Aug 2021 20:30:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydNC=NJ=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mGSCK-000714-NK
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 20:30:04 +0000
Received: from mail-pj1-x102f.google.com (unknown [2607:f8b0:4864:20::102f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c334995-aa2b-41b0-b629-96c1f8662ac2;
 Wed, 18 Aug 2021 20:29:53 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id nt11so3443944pjb.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Aug 2021 13:29:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id h25sm663775pfo.68.2021.08.18.13.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:29:51 -0700 (PDT)
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
X-Inumbo-ID: 5c334995-aa2b-41b0-b629-96c1f8662ac2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6A7J2MNGpc3g2fahO1l/wGJcP/R6g3oAioBf+kBOMlo=;
        b=TIaHwSm0XnhYahj8GaB1Xwb09vEeyiF8cMGpgaPI5pCENrwZv15NKVYeS5yrbfe/g3
         pao03g4UH6b01s6p3XCAduhPgjhXecwCQ3SkRjP+EeOFcYcRpNdQ/Pkfx74DNotveVYI
         szrEhUvnEHkFp6ws+5fO92c3b2JBsw3lRKtbjqEzvU3/jWHzpMKgJ/F+S4+H/Dm2nJoH
         P86R1ZvNKCv/qs2JmTx+DyXcPU0k2QEDueq3oKkCz061UHHKBSYirO669Qwng+zYAksI
         l2fRks4b5UWuYQXHOqHCnenQC1/tETW82eDTBbU3nS7D4iZnhQHsbwaZTO5kLL0uZhFT
         QONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=6A7J2MNGpc3g2fahO1l/wGJcP/R6g3oAioBf+kBOMlo=;
        b=ekw2aHuqY5jFhrzzgjz8c2eu9leAT8p1+sX9HCh9j32zsPPi4Hr62XtQkO4Kue9OAO
         vYwiW2maNu0eBCDR1I1GlaFhx8ZXohM5/XZaIGa08RCBXPpA45X/HXDOTrulCbb2xRFt
         d6KBaCrBGfYcItMBV98QabMP7gFB1I7sloLxNHEzDLwqFjrEN3bnE4Lr3NrJyYKS6k95
         v2+Phe0kWLOovA/kqKWDQMHbabG4E22pKnPefaLAoo231r3o+FsmNidsEuJWuRxtCqXI
         oj8js0h8itVn5QklQEq1KMwhDUnXD0hHW8u9ctpixAxo2NmmSa7mH6EyHMHVrVP/0g3v
         diuw==
X-Gm-Message-State: AOAM530r16Vo9cftkSx2+ufRZ359Lp/rVGDiQICoBC7fH0t4Z/IaEC/a
	dyfzu7bJapFubvMVqPsbDpOdLoK4QQ/C/mqF
X-Google-Smtp-Source: ABdhPJzwVN4slvHZh/0lxPIPp6llJx7b+APPSfqEQ/liaQQZ3i+8umorV432PQ3DU6l7BbvSO70Zmg==
X-Received: by 2002:a17:902:da8f:b0:12d:a688:83b7 with SMTP id j15-20020a170902da8f00b0012da68883b7mr8688450plx.56.1629318591638;
        Wed, 18 Aug 2021 13:29:51 -0700 (PDT)
Sender: Bobby Eshleman <bobbyeshleman@gmail.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v3 4/6] x86/gdbsx: expand dbg_rw_mem() inline
Date: Wed, 18 Aug 2021 13:29:05 -0700
Message-Id: <7833b4a327212ff0fc816d17f91fa09291d6afc2.1629315873.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629315873.git.bobby.eshleman@gmail.com>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because dbg_rw_mem() has only a single call site, this commit
expands it inline.
---
 xen/arch/x86/gdbsx.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/gdbsx.c b/xen/arch/x86/gdbsx.c
index adea0f017b..4cb8e042f9 100644
--- a/xen/arch/x86/gdbsx.c
+++ b/xen/arch/x86/gdbsx.c
@@ -151,33 +151,23 @@ static unsigned int dbg_rw_guest_mem(struct domain *dp, unsigned long addr,
     return len;
 }
 
-/*
- * addr is guest addr
- * buf is debugger buffer.
- * if toaddr, then addr = buf (write to addr), else buf = addr (rd from guest)
- * pgd3: value of init_mm.pgd[3] in guest. see above.
- * Returns: number of bytes remaining to be copied.
- */
-static unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
-                        unsigned int len, domid_t domid, bool toaddr,
-                        uint64_t pgd3)
+int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *iop)
 {
     struct domain *d = rcu_lock_domain_by_id(domid);
 
-    if ( d )
+    if ( d && !d->is_dying )
     {
-        if ( !d->is_dying )
-            len = dbg_rw_guest_mem(d, gva, buf, len, toaddr, pgd3);
-        rcu_unlock_domain(d);
+        iop->remain = dbg_rw_guest_mem(
+                d, iop->gva, guest_handle_from_ptr(iop->uva, void),
+                iop->len, domid, iop->pgd3val);
+    }
+    else
+    {
+        iop->remain = iop->len;
     }
 
-    return len;
-}
-
-int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *iop)
-{
-    iop->remain = dbg_rw_mem(iop->gva, guest_handle_from_ptr(iop->uva, void),
-                             iop->len, domid, iop->gwr, iop->pgd3val);
+    if ( d )
+        rcu_unlock_domain(d);
 
     return iop->remain ? -EFAULT : 0;
 }
-- 
2.32.0


