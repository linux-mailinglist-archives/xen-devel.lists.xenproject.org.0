Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JgVsDQifPmoLJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6996CEA1A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=calD2OC8;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346283.1604822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8li-0002wN-9s; Fri, 26 Jun 2026 15:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346283.1604822; Fri, 26 Jun 2026 15:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lh-0002st-MH; Fri, 26 Jun 2026 15:47:01 +0000
Received: by outflank-mailman (input) for mailman id 1346283;
 Fri, 26 Jun 2026 15:46:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lf-0002OG-CH
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8le-004aSr-Ol
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef2-bab6-0a2a0a5309dd-0a2a450adae0-4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:58 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ee9-e40e-0a2a450a0019-d155d0b2c5b3-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:50 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-399f5e574b0so11917671fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:50 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:48 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782488809; x=1783093609; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vafZ9uu7Ib7QiNOrz7YTpkLsKCJIlHqsiKN2O4f/BLQ=;
        b=calD2OC8OdHT11rJ9Cx/qNGPR/AGUhNU+AHcsgtvuRpuBKlO/F4FKWq0yOXgcSoTeb
         v9/lDantYYVeyEFPnuzJtY8KfCC+Otr/GT4fRhHXqpzCoFYhlDTIbdeg5uvatowevYpm
         Ay1SewrW7qmy9hvhTSisEZVo/P9uOissTv1dVzjtE5KuvY/wpT+P4fzKxvmYUkXeRlDq
         gD8A+MjK0RfzOAaNOEyBrjC5mJPQ++/B43QyR6DHlNWUtnSnygturbaZA2Ab8Crq/Kme
         6zsHPfU0acpxjPqT63TH4jsZshUH4kSXpWczd3XNB487sjFKtGE6bvUsPGYosHSrmzfq
         I/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488809; x=1783093609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vafZ9uu7Ib7QiNOrz7YTpkLsKCJIlHqsiKN2O4f/BLQ=;
        b=VRpUSGesWhIwCaeUd5SVHRnE6r//glppk28wPGl7853iIv0kqaRX6JihEOJHW8lGOf
         Jm1kDzuZt2b7TNlJ80UWF2SrKL9np+riX7gVkyuXW4gvwJNQnsDTZe4/JfesH46OmIG/
         9tLEOwOPHj89JlJaFhyOAgON2LWnI1jcwh6bYDrsRZYuGtUUmBBoVacXhuXOKmoDeX99
         7szvfCnVRnbVWObTXUq2Xhl5z2+M0qr+Xpzfm8nwpwVFW0TRd1eF0i5xrNcOlArG121u
         ybJ4Hm9qrGg7dVBvdQd3GQPh946+ncVSSkpRM8YR/XJ7cFkSOtWsncLORDTfnvU3Tv5k
         P7Ug==
X-Gm-Message-State: AOJu0YwRw7LAX88Sqxw83mwOCPI+8whc2bRTnS9JTNEhEdT+6PwfZew5
	VBLBsbLUzt2Psz5M5BNruo23j6zX++W//E/S3TULUoowsMsYzZbgnxnPOC6aLg==
X-Gm-Gg: AfdE7ckVYjiNtw9D5na8zPUM6I6l1ZAj5sV94j4dbAyJbj1mxdEkHNaLDBNmTqCsI43
	11LzPu221lOjaTjywzaVDGwI7xYn1ri+TDX4HM0YRdzR6drl5z7j0NsFUXl+fnco1I1g0hSTdx0
	/kO8wDSSqPDlg45sBCU85gr1yrDX751m3IPdkFzpQbZSSFBcvuZKYpqpIcHWvDtkdjlDHCKiP8d
	fpfSnt5pa2KGkvmFuRld+UgCmZgKMmKuAxvGy98FH+k+RXY3ep/4iRNuQsOI8hvRpeau7G5MqmP
	goqdSxrqf6WdvkYW0d+K8LE4YQgqEMOsWfMpFmh6ynpiKPtDySI3/ZTFH4Dp5N1HwTJ/OEYN6ZA
	vkMNEk2dj6olZ28UmCV6udN5ErBvOgvqNVCWNIF7H9wX94AdCG+T6Z2j9zyH1zowKg5vjnKdS7j
	O85DZlrCBi1L2oOaUeviglsloDyOZmpDJOnq4CIVi/oYmo15P/6yf3eJeqgxEpvn+BXWt7
X-Received: by 2002:a05:6512:1410:b0:5ad:5620:ba65 with SMTP id 2adb3069b0e04-5aea2066328mr2280843e87.50.1782488809430;
        Fri, 26 Jun 2026 08:46:49 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 05/25] xen/riscv: Implement ARCH_PAGING_MEMPOOL
Date: Fri, 26 Jun 2026 17:46:14 +0200
Message-ID: <b074856a461dc17df6c14f9f481e0c8cd3edc3e4.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1782488810-3D470DDE-BAD961D0/10/73395122804
X-purgate-type: spam
X-purgate-size: 2630
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA6996CEA1A

The p2m_freelist is used to allocate pages for the P2M. To initialize
this list, domain_p2m_set_allocation() may be called from construct_domU()
in the common Dom0less code, so RISC-V provides an implementation and
enables CONFIG_ARCH_PAGING_MEMPOOL unconditionally.

Additionally, implement arch_{set,get}_paging_mempool_size(). They are
not directly used yet, but are required to support the
XEN_DOMCTL_{get,set}_paging_mempool_size hypercalls.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - Drop stray blank space in arch_get_paging_mempool_size().
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Turn on CONFIG_ARCH_PAGING_MEMPOOL=y unconditionally and drop all ifdef-s
   related to this config.
 - Optimize check inside arch_set_paging_mempool_size which verify size
   argument.
 - Use pfn_to_paddr() inside arch_get_paging_mempool_size() instead of open
   coding the stuff.
 - Drop ASSERT() from arch_set_paging_mempool_size() as it is impossible to
   have here preempted = true and rc != -ERESTART.
---
---
 xen/arch/riscv/Kconfig |  1 +
 xen/arch/riscv/p2m.c   | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 41426c205292..48520588fe40 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -1,5 +1,6 @@
 config RISCV
 	def_bool y
+	select ARCH_PAGING_MEMPOOL
 	select DOMAIN_BUILD_HELPERS
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 566266e3e78f..1cea86512c8c 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1600,3 +1600,27 @@ struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
 
     return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
 }
+
+int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
+{
+    unsigned long pages = PFN_DOWN(size);
+    int rc;
+
+    /* Non page-sized request or 32-bit overflow? */
+    if ( pfn_to_paddr(pages) != size )
+        return -EINVAL;
+
+    spin_lock(&d->arch.paging.lock);
+    rc = p2m_set_allocation(d, pages, true);
+    spin_unlock(&d->arch.paging.lock);
+
+    return rc;
+}
+
+/* Return the size of the pool, in bytes. */
+int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
+{
+    *size = pfn_to_paddr(ACCESS_ONCE(d->arch.paging.total_pages));
+
+    return 0;
+}
-- 
2.54.0


