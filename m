Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMRvBqr2/WlilQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08104F7F4B
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303735.1577002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQZ-000507-LC; Fri, 08 May 2026 14:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303735.1577002; Fri, 08 May 2026 14:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQZ-0004vn-Hg; Fri, 08 May 2026 14:43:43 +0000
Received: by outflank-mailman (input) for mailman id 1303735;
 Fri, 08 May 2026 14:43:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQY-0004oR-Hu
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQW-00Epe9-Cr
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:41 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf689-5cb7-0a2a0a5109dd-0a2a4506c6fc-20
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:41 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf69d-7371-0a2a45060019-d155da32a9cc-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:41 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ba3115fe0d5so575680866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:41 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251421; x=1778856221; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxTnfnHWZBjnSzhjEou4ZV1OWnhheJt3wsjWOC72ais=;
        b=RhJm641UWtuGann51h4kJ3uT4z3jXh1UqWzcGqqTEKvBAXsCC3Lz1/KxELUTBXSpye
         qRRrwBzcCxDH2A6njzXfFAkERN4Yry9O2mikcP4qMYC0Ydc+w4EDiuIKx7+wdSYQqrX+
         fcX9TP50NmFYFkhYOmdHof92NLddIHwBzN0lMcvUtwC6RjiQ33PtZr3AggCCooUmHhEx
         iw6Ud0lh6b2zAvwuitaF3CMzpFeKvH5kC4DYu573jhooqf//Q6r2TOU3qe0zirayOOYQ
         5uMVQUAfxeY/WxMHqV13WhXWlD7y2yGz+XnllXJVa5/ITv1Q4tRWCfIXCiMH0aBh0vsG
         75Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251421; x=1778856221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xxTnfnHWZBjnSzhjEou4ZV1OWnhheJt3wsjWOC72ais=;
        b=Rf3pn25Hv84THK4UADrlBF0LgOgPcBnU8dIVceLl6xK5mGrG62wuoQfzxuYXLsclZR
         GEz6LQTuNcQ6i6CMCG556Hln5pjJNS+GnzwEUxIK3tM4Mr7saAhPFUPkZvJZSauCbxvp
         yv8uk7jeA7FD5o0sLMRlRyAoQjMIPhnJA3IaAw00oXdPvxZCaRS2S9AoDxp8bbv+q5DK
         7MP8CYy7AR0dsmd29CXMaU7uNK6IdrFCuhSG8piTrFI70A65332CVm/1EXmj2n+CwOTZ
         IV9tzi+DViBvE89y7Q7hPYdtgmq26+N+mvu0xToN29q9zq8V4I916BD5fQVdRsSGb7Xn
         puuw==
X-Gm-Message-State: AOJu0Yy2zdZF1XCLD0C0kwoamnxCQeA3wTwVkxdJo8ndtAt7DjmoQofW
	yP2mJ4lEmhnrhuSGCQ/8oC0Cte9AUug8NaKdVSxbO8X3kDB3KSjeBJiHYkwLQg==
X-Gm-Gg: AeBDietQOkL+Rjz4ATyNuD5dtJGD8YQ12BbEd7uUIH4+SiJKUoPYqTsS4rcmqAXU30m
	WOmj8AmcevbmEOIXxGV2dY62vyAFsOowznvpUn3RTkh7f/6sNoadjPJb+w3eG7LruDmjz/Hzc1e
	nTDLgUub2YG4ZEX8WRpJrn//6GU8MZfYdRXhHBjDOlsv64tMW+Z+OzvhpcPvCJk+vJRURyGwTL+
	GMD/+OJ/JYBBCg+YDY1gobjYllk8QrOyhJ+AAiqSzKSccxoSdzdTDhSa65m4q9DozteHx3/R+cK
	LQtncBbd5e9YHb/Ejziwm13dGb/NFxRnjuSBoD/zlkEOwJN+fkt5y8Tdfful52LFNX0bXnxC4B3
	dOrm4NKHncf2SSk+yvrIToU6vGFx8+eBOlA5T2Er7Qhyk1+wE6xiXpUJcItzcwH/XiSGgfwJ7zz
	70KJcUc9ac34318sj575L9aTDSiiSGJCUqAJomQyosHV0rqPz0EJvQWe8NyFU3u0H9ig==
X-Received: by 2002:a17:906:4792:b0:bc6:bb4b:1726 with SMTP id a640c23a62f3a-bc85d6b8d73mr452039566b.22.1778251421005;
        Fri, 08 May 2026 07:43:41 -0700 (PDT)
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
Subject: [PATCH v2 02/26] xen/riscv: Implement ARCH_PAGING_MEMPOOL
Date: Fri,  8 May 2026 16:43:04 +0200
Message-ID: <97f20cc49563fdf01775a649e562e302bd0fa886.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1778251421-8576FD75-37C5910D/10/73395122804
X-purgate-type: spam
X-purgate-size: 2399
X-Rspamd-Queue-Id: C08104F7F4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

The p2m_freelist is used to allocate pages for the P2M. To initialize
this list, domain_p2m_set_allocation() may be called from construct_domU()
in the common Dom0less code, so RISC-V provides an implementation and
enables CONFIG_ARCH_PAGING_MEMPOOL unconditionally.

Additionally, implement arch_{set,get}_paging_mempool_size(). They are
not directly used yet, but are required to support the
XEN_DOMCTL_{get,set}_paging_mempool_size hypercalls.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index 41d6d3d5e699..bed997bd9d5a 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1606,3 +1606,27 @@ struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
 
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
+    *size =  pfn_to_paddr(ACCESS_ONCE(d->arch.paging.total_pages));
+
+    return 0;
+}
-- 
2.54.0


