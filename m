Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJQXEU1QsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE2125547C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250384.1547857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a4-0001ec-2D; Tue, 10 Mar 2026 17:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250384.1547857; Tue, 10 Mar 2026 17:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a3-0001da-Vd; Tue, 10 Mar 2026 17:09:15 +0000
Received: by outflank-mailman (input) for mailman id 1250384;
 Tue, 10 Mar 2026 17:09:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00a2-0001QA-0m
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:14 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db5603bb-1ca3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 18:09:11 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso107421775e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:11 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:10 -0700 (PDT)
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
X-Inumbo-ID: db5603bb-1ca3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162550; x=1773767350; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMLvC7RrPAqRfMztOqd3dBSpw1saOMdIpsVoEROSJU4=;
        b=fTY59slMZv+YgNJ0FI+XhCaJfoa2S8SsRq5ufCKrVciZ1ayTcRMxFydVtUMQK3cDk4
         GVI4OBGmfoGE7Uw568eY9pv7ru7N4GbWKBdTIh0RU67QXgSgKrhhYrFEi59TQvHZQ5qU
         kbj3FHyIkM3LXSmQYE5xn5neJ97FMVt8UTGnIG+Sf2MiZGsYVT2Zqu7eAsFKUCqSAPER
         MVAH5lG3EXGjU5jWrbJ24hk/348KRwlNoxnywua3ajmzgZbShzek/n7hddDKl9t9FsJe
         z/VUr5WcckW46OSPM/BhqqHW/XwtoSSKRVWdTix7+jugf/XwFg5PZqsohyD4+keF2jvq
         gAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162550; x=1773767350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mMLvC7RrPAqRfMztOqd3dBSpw1saOMdIpsVoEROSJU4=;
        b=X5IvfySpgqBN4Bcns1LKvve2WiPKCF9H79Lw3OAWkewzhxjcOChK6ik+qctMhyu6U1
         01aGvYoXL7oQoTSNeRRe3dHUg+DppnSV42OQeJ4JCNleIS8yPmOg/qUNWAUy9bIIJa0h
         uK+VDO53RsZlgaoPwumsNNJ9cPj3xjqQ034QZBn5sudlJo+9OzTcf12Gay02euBTcSZC
         ohVi/kIOp+WJMDVx6yNQ8uC96Jme/eIQUZPXiEMCuRpdPVgKRI/E5aQWDCfdIxoHd0Zp
         wHJkzPCX2pE7T4gzLl472XgiPzVt9ZyJ4XAWctbOlJT7LXvOSzMTtQbXJALOh6epEdku
         fr4A==
X-Gm-Message-State: AOJu0YxI/BLDISg+ecHO8vKnjkV/07dkpcQAjiSJdjLdPvxIXIcxCvju
	Q9wWq0aM9uVpWkT/AJHjsijF/ZuLFeXzus/924oTnM0oA5lva/Mwh23U3yjvAl+e
X-Gm-Gg: ATEYQzxmAPrDseGS1jvJFtrBjH9XFcJ/1NJAM/B1EnjsLdvyN0ECZMxgbxAjHsK3ZyS
	zM108ncVv4Lszs1bjU9TdClFul9P6fLx9+BUj1Lcbu4cNwYgtz4iPDf9FILpuyf6I7nmKBXSJe8
	16PaxmL2s1GkivT5CjYMQBgvXh1wcsXm6sAOFYjxDWtMdWeFQSKp3QfASjckhR5tDtJznNFcv9r
	2/zy6au2O811TWl88Pk2rbuUShwGod5Athzx7Rd/sswtsO/E3NlYsdAIaG4XK0R+g8H06P+kJgK
	uN3uiAb+7xCljqILueWT+qGZSbkXjvukJFpZ6eqJ8kthsB+UE12xVgpTJhoeaHGW/eJzvz2P6Iu
	9iZKPqJIv1sFtou/DTkqKFtdJFqI5O55rqN6/Lwb8o6wA1zdUBLRkRxkBFQpvOn5GLInCDRAi0+
	4lsfeVFm1jIz1XkBp9k2Ex9NUFibw+d77pp0ySq/7AN3b3Emjk2U07KUbQp172afeifg==
X-Received: by 2002:a05:600c:8b6d:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-485364e9569mr156488245e9.16.1773162550327;
        Tue, 10 Mar 2026 10:09:10 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
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
Subject: [PATCH v1 01/27] xen/riscv: Implement ARCH_PAGING_MEMPOOL
Date: Tue, 10 Mar 2026 18:08:34 +0100
Message-ID: <887d914aa0ddb1884c19c9567d4633ecaf810066.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EDE2125547C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

The p2m_freelist is used to allocate pages for the P2M, but to initialize
this list, domain_p2m_set_allocation() might be called.
This function is invoked in construct_domU() within the common Dom0less
code, and providing an implementation of domain_p2m_set_allocation() when
CONFIG_ARCH_PAGING_MEMPOOL=y is appropriate for RISC-V.

Additionally, implement arch_{set,get}_paging_mempool_size().
They are not used directly for now, but are required to support the
XEN_DOMCTL_{get,set}_paging_mempool_size() hypercalls.

Remove 'struct paging_domain' from RISC-V's 'struct arch_domain' when
the field is not required.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Kconfig              |  1 +
 xen/arch/riscv/Makefile             |  2 +-
 xen/arch/riscv/include/asm/domain.h |  2 ++
 xen/arch/riscv/p2m.c                | 31 +++++++++++++++++++++++++++++
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 12b337365f1f..091510380949 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -1,5 +1,6 @@
 config RISCV
 	def_bool y
+	select ARCH_PAGING_MEMPOOL
 	select DOMAIN_BUILD_HELPERS
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 48957104e0b5..b1514f1514a2 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -10,7 +10,7 @@ obj-y += irq.o
 obj-y += kernel.o
 obj-y += mm.o
 obj-y += p2m.o
-obj-y += paging.o
+obj-$(CONFIG_ARCH_PAGING_MEMPOOL) += paging.o
 obj-y += pt.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 6c48bf13111d..0caacf92b5a2 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -92,7 +92,9 @@ struct arch_domain {
     /* Virtual MMU */
     struct p2m_domain p2m;
 
+#ifdef CONFIG_ARCH_PAGING_MEMPOOL
     struct paging_domain paging;
+#endif
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index fba93bce24d9..886e06196ba2 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1568,3 +1568,34 @@ struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
 
     return page;
 }
+
+#ifdef CONFIG_ARCH_PAGING_MEMPOOL
+
+int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
+{
+    unsigned long pages = PFN_DOWN(size);
+    bool preempted = false;
+    int rc;
+
+    if ( (size & ~PAGE_MASK) || /* Non page-sized request? */
+         pages != PFN_DOWN(size) ) /* 32-bit overflow? */
+        return -EINVAL;
+
+    spin_lock(&d->arch.paging.lock);
+    rc = p2m_set_allocation(d, pages, &preempted);
+    spin_unlock(&d->arch.paging.lock);
+
+    ASSERT(preempted == (rc == -ERESTART));
+
+    return rc;
+}
+
+/* Return the size of the pool, in bytes. */
+int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
+{
+    *size = (uint64_t)ACCESS_ONCE(d->arch.paging.total_pages) << PAGE_SHIFT;
+
+    return 0;
+}
+
+#endif /* CONFIG_ARCH_PAGING_MEMPOOL */
-- 
2.53.0


