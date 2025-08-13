Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56540B249E7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 14:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079923.1440593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umB1O-00082J-Dz; Wed, 13 Aug 2025 12:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079923.1440593; Wed, 13 Aug 2025 12:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umB1O-00080M-BQ; Wed, 13 Aug 2025 12:56:02 +0000
Received: by outflank-mailman (input) for mailman id 1079923;
 Wed, 13 Aug 2025 12:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zV9=2Z=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1umB1N-00080G-8X
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 12:56:01 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9035b03-7844-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 14:55:54 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b77b8750acso673830f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 05:55:54 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b8e1cb7deesm37836413f8f.2.2025.08.13.05.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 05:55:53 -0700 (PDT)
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
X-Inumbo-ID: d9035b03-7844-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755089753; x=1755694553; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+sjcl4dQ1y8QGVxBP6VaR9ofBSfqLa/U+YpFLIfWOTs=;
        b=Grq9aA/EAuytaUQHvLMK3kl3D2CtJTO5igfkhU518IEygE7Yo3s6AQJ6JU7mjQs3hc
         pNASzTHeAZp16UKlX9a7Cvoj7MBf4BD9pZx/P5ZRaMw6i7CI9QkBAXJaT6RIEepPWr8x
         zHB22fl/BnQfIHFkP9JqEFJu1GBtk/w2Oit2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755089753; x=1755694553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+sjcl4dQ1y8QGVxBP6VaR9ofBSfqLa/U+YpFLIfWOTs=;
        b=S2Byl1InD13T2FDCuyAPcnpl5rcFH6kZaOjZy/Z1Eu90pHoLxk5IeALSV3g7JfgF2Q
         Ts7S2KOKcRoL9exgn+3Ao2keGAByWfv4j5CUPKrrB/YckIxSbmn4CbU4n0RpWBq/l++8
         6XklgCApQqSOn6sSRHme1J43HAct56HlcirG8kyET+O50LCwe3ODSjsUpusjhfpOyXTZ
         x8qstRkoEsnDk43cSsRQp6oQuxRDMwgeE3E2JVS5Uxqi73KpADM+npkbEL8GIK36yEsM
         TiI58B46ZjHcm7xReQrTs97C/c4NCIOfzWfn6cCJne/zoyaIFn4v0PryrG6Uf3jpjsDD
         Cp8g==
X-Gm-Message-State: AOJu0Yx71dJ/n8dDoOqpRLi9nbnArwI630qCBHDvJoTWas/jWPIuuux7
	JHUDUaUn1+21FUaoyExHuqhQ5xOuossy79v8lJLuPJk7y+l1BtdYdLKYVE4+RWXj1nSHZaTVOa9
	Eaoyg
X-Gm-Gg: ASbGncuPI17y40BBlHthM1X9QEyIgMw1EKdNdBol5XQ7DxTK7K4ZTDL4wybOM+Zi+cE
	hyuD2FJOFzCXgNSx2n/6KAi7ZpJHlf8nQNb+qeEmVT/G7HODsgurRPTrL1Dx7BlmZoWUNraenxv
	CZh9FEYEGuxL0oJ+Gk2wB49A9mT3+Waenet267ZLX7KQJdtF6utpxYqRqIbw5otq3J1oslg11ck
	ICeuabFyDne96jVNC9W8yBmaUXlqzwRirrHW/9OdL+43T5G8NOzjXYKUGpjzY6cXgNKerWpXb2L
	AydYXtxGnhOsbsVA/6T4hG29wkakadN3xBiGpKvaIdUIQwOgE8UGVw4XJBiM/WX+W1WDKe4BcxC
	4/zh4+U5eAopsWMOfxfGHHbb6il453G2gUXKVuy4V13MiL0uvpC9CkihuLZOGFkZkVJjFSmuvX3
	VQ
X-Google-Smtp-Source: AGHT+IFJvnppNTRTpfjdY+vJ/JCMcM50qOUu+caksaSihSyCwww+XOf/DCHnj9VpXg5sKn07/R+ZUg==
X-Received: by 2002:a05:6000:26d3:b0:3b7:8aa2:9fcb with SMTP id ffacd0b85a97d-3b918c76ba8mr1978386f8f.14.1755089753506;
        Wed, 13 Aug 2025 05:55:53 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] pdx: cast PAGE_SIZE value ahead of shifting
Date: Wed, 13 Aug 2025 14:55:38 +0200
Message-ID: <20250813125538.78174-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Coverity complains that:

277    ma_va_bottom_mask   = (PAGE_SIZE << bottom_shift) - 1;
 In expression 0x1000 << bottom_shift, left shifting by more than 31 bits
 has undefined behavior. The shift amount, bottom_shift, is as much as 63.

Cast PAGE_SIZE to paddr_t so it has the right width.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Coverity ID: 1662707
Fixes: bac2000063ba ('x86-64: reduce range spanned by 1:1 mapping and frame table indexes')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/pdx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 7e070ff962e8..5f54dd18f90d 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -288,7 +288,7 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
 
     pfn_pdx_hole_shift  = hole_shift;
     pfn_pdx_bottom_mask = (1UL << bottom_shift) - 1;
-    ma_va_bottom_mask   = (PAGE_SIZE << bottom_shift) - 1;
+    ma_va_bottom_mask   = ((paddr_t)PAGE_SIZE << bottom_shift) - 1;
     pfn_hole_mask       = ((1UL << hole_shift) - 1) << bottom_shift;
     pfn_top_mask        = ~(pfn_pdx_bottom_mask | pfn_hole_mask);
     ma_top_mask         = pfn_top_mask << PAGE_SHIFT;
-- 
2.49.0


