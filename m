Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F88728F714
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:45:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7581.20001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6Nk-0005dr-HD; Thu, 15 Oct 2020 16:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7581.20001; Thu, 15 Oct 2020 16:45:36 +0000
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
	id 1kT6Nk-0005d3-9j; Thu, 15 Oct 2020 16:45:36 +0000
Received: by outflank-mailman (input) for mailman id 7581;
 Thu, 15 Oct 2020 16:45:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6Nj-0004yr-6K
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:35 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0db6749-9135-4c9b-88f8-d16a1f677e15;
 Thu, 15 Oct 2020 16:45:01 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l28so4333489lfp.10
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:01 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:45:00 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6Nj-0004yr-6K
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:35 +0000
X-Inumbo-ID: f0db6749-9135-4c9b-88f8-d16a1f677e15
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f0db6749-9135-4c9b-88f8-d16a1f677e15;
	Thu, 15 Oct 2020 16:45:01 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l28so4333489lfp.10
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GUyEC+XSJJjDXTlfW49njL99iLeUHfZbzIxxr16Dn/Y=;
        b=mGoG7bqbIqXobTIQXqflKsraIQMcw+xybhJBtBKRipIqp3JjfVkDdIdquNTLmsFEVZ
         OX7u4ex9p0jTYLC4iZ1dTN7NgvLksWZR3DoBBM2MS3A6CptFuxxUYA9RhCRBjYxMXwfo
         v8pO7kvRRtFMBXlAZMbP11BSkHUqwSRX6US2QxneON1YAErbn3cnh1RYsd1tIPZ0+0C0
         WTO8Czv4/4UJWW5GnBoUY7lqQpE1+6kcXjzzkpI+Uyy6epzfihSiEdceNv/1cjcvkCJx
         eM865/w6oHdfye86xH7U9BQGcwQbWex5/uI4qLPcmaWY02CoWWyBnPykIV3sbHcGLOcm
         KAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GUyEC+XSJJjDXTlfW49njL99iLeUHfZbzIxxr16Dn/Y=;
        b=foaohpTpSBzBnXrPF28ohgmSe93DKY/K76ijTC9HERpA2av1yQ2QrXOSlkWSXO6fVc
         /qGr1L0lHKcuOQ/WaFHjeSFscXsg+eR84Rhlq+JLamqcheUFh0rLq1t/bBmqcMgiX3lR
         6EtkZ+R0ywV7jsD+4TPM7WZcyhsiuL54NgyA2xNszxIi2g7JVgK63CaQAVDfhqRCteb9
         aaC+YBd2hXEFwuq7OTe9m1+8JaoIBc6WxdiPSBsVSQWI1OCHQ5pz81HY/ZGGWkPyJK2v
         HiPyONfwIsf2Dm1h/WPJsieYwAdlaC6kex7AppecwKuv9nKunxY2z9HOfhNO1wb97PaK
         wfOQ==
X-Gm-Message-State: AOAM530cRK511+X21Im7w53uZ+LbANA87MD2KjiATL0HRqbJxm+2JtUP
	u631liKjmQm63ULCN79k9ufndZP/VIg/4Q==
X-Google-Smtp-Source: ABdhPJyX/2+Gjm52GKB7Dk0uJInSKiMEMavXGp73CqcZgSiu2tAFiQgTMx5j4mJ6uUtSSLFeXPC4Bw==
X-Received: by 2002:a05:6512:dc:: with SMTP id c28mr1254916lfp.369.1602780300572;
        Thu, 15 Oct 2020 09:45:00 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:45:00 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V2 08/23] xen/ioreq: Introduce ioreq_params to abstract accesses to arch.hvm.params
Date: Thu, 15 Oct 2020 19:44:19 +0300
Message-Id: <1602780274-29141-9-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

We don't want to move HVM params field out of *arch.hvm* in this particular
case as although it stores a few IOREQ params, it is not a (completely)
IOREQ stuff and is specific to the architecture. Instead, abstract
accesses by the proposed macro.

This is a follow up action to reduce layering violation in the common code.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V1 -> V2:
   - new patch
---
 xen/common/ioreq.c               | 4 ++--
 xen/include/asm-x86/hvm/domain.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 7f91bc2..a07f1d7 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -223,7 +223,7 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct ioreq_server *s)
     for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
     {
         if ( !test_and_clear_bit(i, &d->ioreq_gfn.legacy_mask) )
-            return _gfn(d->arch.hvm.params[i]);
+            return _gfn(ioreq_params(d, i));
     }
 
     return INVALID_GFN;
@@ -255,7 +255,7 @@ static bool hvm_free_legacy_ioreq_gfn(struct ioreq_server *s,
 
     for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
     {
-        if ( gfn_eq(gfn, _gfn(d->arch.hvm.params[i])) )
+        if ( gfn_eq(gfn, _gfn(ioreq_params(d, i))) )
              break;
     }
     if ( i > HVM_PARAM_BUFIOREQ_PFN )
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 5d60737..c3af339 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -63,6 +63,8 @@ struct hvm_pi_ops {
     void (*vcpu_block)(struct vcpu *);
 };
 
+#define ioreq_params(d, i) ((d)->arch.hvm.params[i])
+
 struct hvm_domain {
     /* Cached CF8 for guest PCI config cycles */
     uint32_t                pci_cf8;
-- 
2.7.4


