Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48F9170E2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 21:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748027.1155610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVq-0000zv-MO; Tue, 25 Jun 2024 19:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748027.1155610; Tue, 25 Jun 2024 19:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVq-0000vB-Dq; Tue, 25 Jun 2024 19:07:30 +0000
Received: by outflank-mailman (input) for mailman id 748027;
 Tue, 25 Jun 2024 19:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vmrN=N3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMBVo-00008w-O0
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 19:07:28 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a229ede-3326-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 21:07:28 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57d07f07a27so6758519a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 12:07:28 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a725d7b190fsm180434766b.50.2024.06.25.12.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 12:07:26 -0700 (PDT)
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
X-Inumbo-ID: 2a229ede-3326-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719342447; x=1719947247; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fy0Ve82OeeZoLYNkYstdewJQpe9Npq/P9dEBPwXzBhw=;
        b=GKx6sqQ7t+Feqy/jhMpBsGnVSZXS2svgsxl36T2F3tr/R9XUveQFDZFIYiYk6dHc/E
         9u4TueOLdLnM3JCmVnsoZJXpU+ZNYrDDGDVn19dAZcujvcRgRHujQ7BTOExFFXVHc2Fz
         Y1dktfqhQAC5Zki8BxfMFYTM+F6WLW4qWfMNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719342447; x=1719947247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fy0Ve82OeeZoLYNkYstdewJQpe9Npq/P9dEBPwXzBhw=;
        b=whrnoK4KC1HmmOdMQNICN0KzC3YUFUoP2noi+bl+FMt1+IDSFhbZlUGFMJXPrOJEoH
         IvndQaiQxYRz4HA6e/mMUD/l1tvgiMX8CESyVhOEAOUBCwXsTEkfMUEDRlCAlFx/Ecyv
         0mdLG1EMiToo1jQ3bnP3vZ1eoEFNBQLrrZ/QdQxGEmdvULHlAVYIkF2K1+KwUCT917cz
         T35KfuUmJ6WErgzEzJRqWETKbW4Hvz/fTOENRPLZxRWPmyHpFN6xpHj82bVlJXmP1xvF
         8OEy8zgTazpiNlyxuO/8JN7CAhFnyeEvSJz6bRc0n7JZzDe9O6QiDBPTRRh8JwwszYMn
         CsUw==
X-Gm-Message-State: AOJu0Yyp+fXgGRERcPF3ICWSEk23rSYVFyg48z2tAajpEhGHFORT4YCK
	IXyFK/n2XioLnjUwz1wWL55YIJni0GigicvIcR1BHDlhmHP1gvhLGkOA/Vj1AYaDtOhsj80zBzB
	aQBU=
X-Google-Smtp-Source: AGHT+IFtdpbsqg8qlXa1oBwhSkY9AFdg41EFbjwtjMAZJsCOUe08bxR94vYnzxzecRZqHGxMo1Bgew==
X-Received: by 2002:a17:907:c78e:b0:a72:4b31:13b5 with SMTP id a640c23a62f3a-a727f855270mr120272966b.54.1719342447117;
        Tue, 25 Jun 2024 12:07:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 5/6] ARM/vgic: Use for_each_set_bit() in vgic_set_irqs_pending()
Date: Tue, 25 Jun 2024 20:07:18 +0100
Message-Id: <20240625190719.788643-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625190719.788643-1-andrew.cooper3@citrix.com>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... which is better optimised for scalar values, rather than using the
arbitrary-sized bitmap helpers.

For ARM32:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-16 (-16)
  Function                                     old     new   delta
  vgic_set_irqs_pending                        284     268     -16

including removing calls to _find_{first,next}_bit_le(), and two stack-spilled
words too.

For ARM64:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-40 (-40)
  Function                                     old     new   delta
  vgic_set_irqs_pending                        268     228     -40

including removing three calls to find_next_bit().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

TODO: These were debug builds, and I need to redo the analysis with release
builds.  Also extend to the other examples.
---
 xen/arch/arm/vgic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 57519e834d78..c060676aee78 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -421,15 +421,13 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
 
 void vgic_set_irqs_pending(struct vcpu *v, uint32_t r, unsigned int rank)
 {
-    const unsigned long mask = r;
-    unsigned int i;
     /* The first rank is always per-vCPU */
     bool private = rank == 0;
 
     /* LPIs will never be set pending via this function */
     ASSERT(!is_lpi(32 * rank + 31));
 
-    bitmap_for_each( i, &mask, 32 )
+    for_each_set_bit ( i, r )
     {
         unsigned int irq = i + 32 * rank;
 
-- 
2.39.2


