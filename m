Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HRDAEX2CMmqq1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC15698EF6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bFkz+Xex;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340084.1601107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHX-0001JN-Mq; Wed, 17 Jun 2026 11:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340084.1601107; Wed, 17 Jun 2026 11:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHX-0001GS-Gi; Wed, 17 Jun 2026 11:18:07 +0000
Received: by outflank-mailman (input) for mailman id 1340084;
 Wed, 17 Jun 2026 11:18:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHU-0000hV-Bg
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHT-000VG3-Nu
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32826a-e002-0a2a0a5209dd-0a2a45019d20-4
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:03 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32826b-c1f2-0a2a45010019-d155802cad85-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:03 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso42557245e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:03 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695083; x=1782299883; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDfvaNHpw1BQg5jjuhW87imUpQEckVBlvr8onRcps9M=;
        b=bFkz+XexqtDH+3Lr09WlDTqcAn9HYCgX8k+7wVTdAibXe6CTQPnZ8xnrYx+le99oyf
         lEYrAbVccx+/qv4rhGFaNu2ambX1xoZHnz2ho976d1CVodbSCAiBUcy4W3ypBQMoQCtP
         Yr1zAiXBdbyjw2MKlfSxvSqxjIxhdcEwYCgVk+BZCj4hu0m9GMVzpGKCZjrZmPLvx+cx
         XHd4WNs5TlWKRBQ8TFyN1bXgvNdu2gTrIZjnW050HNQ3CMU37LvvxeQn3fm+336wqKDK
         k+IY2Y+Ck2o6Au1B7wKzb4ysflrKZbwE3BKZTke3I88gr4g0fZ9AA9ga2gz5VNNAtpNj
         6szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695083; x=1782299883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lDfvaNHpw1BQg5jjuhW87imUpQEckVBlvr8onRcps9M=;
        b=BVtCyhKgwF5HF4Bo4J+UevLKhH/O7FSQN75od0mWC8C7C5juXawB1de1d6If/dJ1H/
         b6QBDy1GJvRCGyT6YEU2ZMnjCszmq0RF7qKGqoasBN68yepfMj+MRrQ6or+LYVvqaGnd
         IU/daM0jZsaGf7DhQ71r8aBxQbZWKLBVdnNXizNvoUHYme7tuz6l+fYzMcHtelTjsQoS
         Gt0gyzv7Q8WubdTOeG0zcEaqTNITmq+fmydLNwMxpdDvr8gdxnX5E/7KsQYWl7TMmgLH
         kLDYhGr5ZwzJ1Hk8waYlqcSdI7LztbamMiTZ9z6NOpxI3CGmJ2uuQLEEcv1Hp19Ekh/U
         AZ0A==
X-Gm-Message-State: AOJu0YzrW2h8vp6n4yD0hWt8sW75aX2DzAbyQLJtRT0bbVIahCFv3vke
	TkwsLx5w7RzBQqAdyk2EUY20/c/P6rZz17po+iMBwikJu756OibqmgNa8oNDVg==
X-Gm-Gg: Acq92OFWa6eqheenhO0rLIxWvd/6nirZPtDxPNwToAWnUrBN6dAcc0OtoR8xBVu4TAs
	LRipbAdOjLdbGGyXCy1EDBxpxgQG/ByGURrrWVu39Wjx5pej+dO36JJ0Eqqoyw2YvS4Muhe/Q8V
	8x0kC5/MwoEX3qQT8UzTfanu6A5U7+gSmnqrGBNd89fygNTQYq4H//Rt3h82JAvk0q99SzuTf3M
	Og1muAKxkt/IuorwZJef0II0uNc4yUZBl3DgGcjs0NeN30iPg0IWIYN4+KuqtzLqxs9lvY+xbo3
	rXyZk3KLqNaCntuEe46/hukUh9d6IXlBonRRfXVq9S+l4/uHIVb16fpKW1y64VTb5mtxxmF9olq
	QReuyzG23hHoGq+vFMzDwoJBruOE0DlDielLVFDFqbAXmYnVAYEL9kV3sgmkXJtECcZeJiUvXv0
	91ehHuv93IsXQppe2kt9m22KK8PQNaQQu+xPwgLrBJFTSMNrqLk1LMk8SryOsx7EFCH72b
X-Received: by 2002:a05:600c:8189:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-492333dd136mr60429345e9.27.1781695082923;
        Wed, 17 Jun 2026 04:18:02 -0700 (PDT)
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
Subject: [PATCH v3 03/23] xen/riscv: Implement ARCH_PAGING_MEMPOOL
Date: Wed, 17 Jun 2026 13:17:31 +0200
Message-ID: <6bed3de34d98c47d99235dc062cb9fd4b0e4158f.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781695083-ACC53FF4-CAD7E588/10/73395122804
X-purgate-type: spam
X-purgate-size: 2575
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 9BC15698EF6

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
index 41d6d3d5e699..9bf80d38979f 100644
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
+    *size = pfn_to_paddr(ACCESS_ONCE(d->arch.paging.total_pages));
+
+    return 0;
+}
-- 
2.54.0


