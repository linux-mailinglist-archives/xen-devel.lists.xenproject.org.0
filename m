Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9933894BEBC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:46:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774206.1184727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3TH-0007QQ-Ni; Thu, 08 Aug 2024 13:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774206.1184727; Thu, 08 Aug 2024 13:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3TH-0007Nx-KR; Thu, 08 Aug 2024 13:46:27 +0000
Received: by outflank-mailman (input) for mailman id 774206;
 Thu, 08 Aug 2024 13:46:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc3Py-0003nA-Nl
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:43:02 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 210833b2-558c-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 15:43:01 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ef248ab2aeso14004031fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:43:01 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecb551sm741537166b.223.2024.08.08.06.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 06:42:59 -0700 (PDT)
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
X-Inumbo-ID: 210833b2-558c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723124580; x=1723729380; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6jJmilCAYKj/QJkIbHrN87ZkSwCG5OPRTk65J0LtEY=;
        b=J92yXKdUgPmIiKBHw1e98X5vquPKThAE2VnIeF6rg7YeajBix5Jlg3yxi3afBEXdyu
         s4z3lZ+podWwJ8c3wgyg4hw8Nrgf2ZXD2kTvoa1+codHw7D+mWCtWLR442vOqX3TJLU0
         XrznsB7k7JTM4y+ZytzPUt5+jziTQAqNGw0ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124580; x=1723729380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6jJmilCAYKj/QJkIbHrN87ZkSwCG5OPRTk65J0LtEY=;
        b=GpqVhj39HwMd36rMCatDEu+89GBDyoLrQfEYBINRPGjJm6Cm7rBFKQFuzKMK9ZWOnr
         qjJp/ZFaEsO8bczCLAL1a+9NSZJobcL+tnbzFSQ4z95lyTw7hI6Xp+82xhXTxzh2w3sa
         lrOdPt6pAYsdzvRuCTj6MDEWKelihm0LRIK0feered2E/ZiwS3OCmgRGtQPNC5oWAcs/
         6OOCunFlE3gZsY7gXvf3q577Vzb76/a0hiixNSh6zt39Cy/a+8gqV6U7nYDc4fpixK+A
         BEastFptbz5nJl79DF1P9vHbQnf2Z5rjkQYPFT/izUy/szuqJRrv0wwOnZq+ggFe2kPO
         EqlA==
X-Gm-Message-State: AOJu0YzuXGgO3jmpZZz7MfYGXJlqM/Kw21veZ43N0MKzHFHmfr30gwXF
	TDfJDw5ThOWozkDjP7LKDYUF2mNpYO6wUfFsCE3ff+PPcqmKA93gL0CoHW3QZJsKGcJeYqqYkZ5
	m
X-Google-Smtp-Source: AGHT+IFAXzgZL2cAgDALpEN6211JBmUy1AR6RqCr32r8YqyiC74Mdv2qvVDmSS6e3wxq8C8G2MgVvA==
X-Received: by 2002:a2e:a583:0:b0:2ef:2dbe:7455 with SMTP id 38308e7fff4ca-2f19de1b687mr21530961fa.1.1723124580109;
        Thu, 08 Aug 2024 06:43:00 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 04/10] xen/x86: Add supporting code for uploading LAPIC contexts during domain create
Date: Thu,  8 Aug 2024 14:42:44 +0100
Message-ID: <20240808134251.29995-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
References: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If toolstack were to upload LAPIC contexts as part of domain creation it
would encounter a problem were the architectural state does not reflect
the APIC ID in the hidden state. This patch ensures updates to the
hidden state trigger an update in the architectural registers so the
APIC ID in both is consistent.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
We could also let toolstack synthesise architectural registers, but
that would be adding logic on how architectural state operates to
software that really shouldn't care. I could be persuaded to do it the
other way, but I think it's going to be messier.

v5:
  * No change
---
 xen/arch/x86/hvm/vlapic.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 0e0699fc8279..3fa839087fe0 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1620,7 +1620,27 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
 
     s->loaded.hw = 1;
     if ( s->loaded.regs )
+    {
+        /*
+         * We already processed architectural regs in lapic_load_regs(), so
+         * this must be a migration. Fix up inconsistencies from any older Xen.
+         */
         lapic_load_fixup(s);
+    }
+    else
+    {
+        /*
+         * We haven't seen architectural regs so this could be a migration or a
+         * plain domain create. In the domain create case it's fine to modify
+         * the architectural state to align it to the APIC ID that was just
+         * uploaded and in the migrate case it doesn't matter because the
+         * architectural state will be replaced by the LAPIC_REGS ctx later on.
+         */
+        if ( vlapic_x2apic_mode(s) )
+            set_x2apic_id(s);
+        else
+            vlapic_set_reg(s, APIC_ID, SET_xAPIC_ID(s->hw.x2apic_id));
+    }
 
     hvm_update_vlapic_mode(v);
 
-- 
2.45.2


