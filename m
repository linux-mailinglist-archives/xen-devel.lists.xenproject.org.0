Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D5191875A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749272.1157339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVn-0006of-Pg; Wed, 26 Jun 2024 16:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749272.1157339; Wed, 26 Jun 2024 16:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVn-0006me-Ja; Wed, 26 Jun 2024 16:28:47 +0000
Received: by outflank-mailman (input) for mailman id 749272;
 Wed, 26 Jun 2024 16:28:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m54e=N4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMVVm-0006MH-1a
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:28:46 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 285ce77d-33d9-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 18:28:45 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a724958f118so528867766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 09:28:45 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7291af7912sm42791866b.128.2024.06.26.09.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:28:43 -0700 (PDT)
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
X-Inumbo-ID: 285ce77d-33d9-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719419324; x=1720024124; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a3HTs1RURAZACbO2vkeTxBlKVMK+XtuHSHuPekrrv4=;
        b=CWY+Wdpkl3adtLlArY/ou46B99HHBRsvU7yepzw6vBuYTR/oTMAj+oFEwHOh/lxzTI
         p5JqWBckbfBvHLluhhYeb7F0RtM+HM93gg1GsfFuRtkwGUxfFGHsSEucT2hxw1HEQ5pz
         g41Rg837atHIRNmUurXPFflpgixrXqMAYJTYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719419324; x=1720024124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+a3HTs1RURAZACbO2vkeTxBlKVMK+XtuHSHuPekrrv4=;
        b=FM7qh2VPGzFhJ6P5ZTPjkf2CHAEUzl5+kCzP0GROQNmhk7ymR74jL0Ng/ivOJB8JPM
         kGvQyfu5cOeSIUZ4hxxTo4WUJ11avlwIqHBSq4fJk1LdhWQFkCIvechGY/F3JUEEq4az
         I8VCj+7voujMf7A920Nsj1bgas63+6rlSPtKS94b3/KlK1fe90ZRgKv6EByMiqscy3JV
         4bzbX+o6uB207uX99sfF1bjKOhXJAWQHrb9hDnA8PMNNVdxdqKGatbemMRhllpKa6Y0o
         d8Oc1sCF44ve2H7eX1dGOOTu6X9K8oppD0S1SEAsv/UljFPcV0rept4fP9myDmomNPPm
         1mzg==
X-Gm-Message-State: AOJu0Yxzjt+nex8hKcnaQpcaE1Et1mqKmX2ex0vslYC5KvYzVJ8Tu4T6
	AWGkJXIFqeab6XS+5v2S+Blx3vO2azNjk0PuV4Z5omnab6cDaMy4Z3ji74u6QapRurtTRIJPMt9
	OtsI=
X-Google-Smtp-Source: AGHT+IH358YZg6Ktj95b4hw3RChALxCQdzhV/QFgoEwYMEa0PDV0+0MqjNTKrlGlEzuXG5+dAy4sWg==
X-Received: by 2002:a17:907:c308:b0:a72:603f:1ea2 with SMTP id a640c23a62f3a-a72603f2118mr814836066b.62.1719419324394;
        Wed, 26 Jun 2024 09:28:44 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 05/10] xen/x86: Add supporting code for uploading LAPIC contexts during domain create
Date: Wed, 26 Jun 2024 17:28:32 +0100
Message-Id: <ae0143bb190dd13171edbed947335a6bc19abe4b.1719416329.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719416329.git.alejandro.vallejo@cloud.com>
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is a precondition for a later patch in which toolstack uses HVM
contexts to upload LAPIC data to a newly constructed domain.

If toolstack were to upload LAPIC contexts as part of domain creation as-is it
would encounter a problem were the architectural state does not reflect the APIC
ID in the hidden state. This patch ensures updates to the hidden state trigger
an update in the architectural registers so the APIC ID in both is consistent.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4:
    * New patch
---
 xen/arch/x86/hvm/vlapic.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index b57e39d1c6dd..ebcf74711a13 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1622,7 +1622,27 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
 
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
2.34.1


