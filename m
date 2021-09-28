Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C5541B858
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 22:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198418.351936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJkt-0005vN-Vy; Tue, 28 Sep 2021 20:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198418.351936; Tue, 28 Sep 2021 20:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJkt-0005s9-RS; Tue, 28 Sep 2021 20:31:11 +0000
Received: by outflank-mailman (input) for mailman id 198418;
 Tue, 28 Sep 2021 20:31:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sVw8=OS=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mVJks-0004O5-8v
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 20:31:10 +0000
Received: from mail-pf1-x42b.google.com (unknown [2607:f8b0:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78580ae5-8e8d-4452-b28d-b3fc6525a363;
 Tue, 28 Sep 2021 20:30:54 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id n23so15363pfv.4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 13:30:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::5])
 by smtp.gmail.com with ESMTPSA id p15sm44201pfn.31.2021.09.28.13.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 13:30:53 -0700 (PDT)
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
X-Inumbo-ID: 78580ae5-8e8d-4452-b28d-b3fc6525a363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l4OVntz5YtvdVmlmtqYpHPgYE8ss+lH0o06oBOChZro=;
        b=q8F07rbAtlARTMyYiUPOm4yjeaBuF2S8aiD0hqdDsNYCRCZVqvGispWehmLcZxVwVl
         AsBpzR8uUaYwyaUqYDCWEupSDoj19lYbk4IX1Z55FLLzbXLjfi3eNTl+RIMQ/3cmSn/k
         HRbnbHHsXxFrtUREZRcFIO58VxwQC5tnT6TneKpocP8rVM451qHDvrTG2Zl+On5zBMpb
         cRWF5o2o+qw3H/ZNgtGDIZOwXOs0MOYQLFpawLWi0HNbHQhyikWtekMlLoi25EDmT9iy
         5hFIt0LxoumBW4XJoqjG5NiQt7b6Rn66usK/E5vQ4s9+mZGUL0E/tda4FAWlNflo6Y69
         YUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=l4OVntz5YtvdVmlmtqYpHPgYE8ss+lH0o06oBOChZro=;
        b=IgaBcWmhA/eLS378Xr72vvqF0M2ZGm2r7s6DcMBP/cnMFSnI8ee7QUXs0njIbWxhIJ
         NQmzol5cDGX1ONZNE3ndyIrHwX6AIhgaEpSCWtuNctmZvf3gUaLtgkvHgfONLV587uqj
         aq9T0YDmA074PkXubZBPNR3wnLIE6FJtH1JYBLNhmKdPXTwsPzv0iywnre+0KDq1FKAa
         TgftaMhloqKCt790PB+lY+BqeNRtAYuo5z4hnjrWQpLGb/YEuEZdwGsqA9za4G46/1WJ
         jZPQ7eqZnQkMAsB3xEcIB2ltO5CjnXEIhVSV+kRautvkvz5dCxyp54iDU0sZx7F57U3u
         he6Q==
X-Gm-Message-State: AOAM532WuBH5C9OOVCVN5zJkt0NGm4kw9xLZk5JLFzmXavwLzidrtURo
	5P/2Ev7vAywGtcxQOi9mtj1lsj2LFH7DxCxs
X-Google-Smtp-Source: ABdhPJzKTkAV1Mkw5cnVcJddv8t7cBFdUB0I737XGLV/GUex1rPODiz9G01QHQf0VBWiE0Wt3nqEjg==
X-Received: by 2002:a63:24a:: with SMTP id 71mr6307537pgc.285.1632861053496;
        Tue, 28 Sep 2021 13:30:53 -0700 (PDT)
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
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v4 4/6] x86/gdbsx: expand dbg_rw_mem() inline
Date: Tue, 28 Sep 2021 13:30:27 -0700
Message-Id: <472215cdfa754634f8070386bb3122bf3e3cedc1.1632860589.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1632860589.git.bobby.eshleman@gmail.com>
References: <cover.1632860589.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because dbg_rw_mem() has only a single call site, this commit
expands it inline.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
Changes in v4:
- Add DCO

 xen/arch/x86/gdbsx.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/gdbsx.c b/xen/arch/x86/gdbsx.c
index adea0f017b..9c8827c6c4 100644
--- a/xen/arch/x86/gdbsx.c
+++ b/xen/arch/x86/gdbsx.c
@@ -151,33 +151,21 @@ static unsigned int dbg_rw_guest_mem(struct domain *dp, unsigned long addr,
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
     }
+    else
+        iop->remain = iop->len;
 
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


