Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0B898BC4D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 14:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808070.1219890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9F-0003bP-7J; Tue, 01 Oct 2024 12:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808070.1219890; Tue, 01 Oct 2024 12:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9F-0003TD-2s; Tue, 01 Oct 2024 12:38:37 +0000
Received: by outflank-mailman (input) for mailman id 808070;
 Tue, 01 Oct 2024 12:38:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrgx=Q5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1svc9D-0002vk-2Y
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 12:38:35 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12413986-7ff2-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 14:38:33 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c88b5c375fso4186274a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 05:38:33 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.166.251.127])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248ac03sm6132630a12.70.2024.10.01.05.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 05:38:32 -0700 (PDT)
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
X-Inumbo-ID: 12413986-7ff2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727786313; x=1728391113; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfxQ3gahpFHXiNK/v5LJIeKG4M7IQS/lIxTTHFsFmsQ=;
        b=WJP0XnI7o5Hq4PzXexDYaOXAjpeaJRb9nQlSR/vBUiyVjj2Ep7iB8NYG/7M0zkihB9
         K4eNxacHOQ1CfvD9Odha4U9D5Q4P4kagHCDDn+u5fGm6NpMUPpr92fnjbRYNCC6zjD9C
         LfVBNfBnOJXKhFtrk516cZDbM7WAe9f5L9gTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786313; x=1728391113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfxQ3gahpFHXiNK/v5LJIeKG4M7IQS/lIxTTHFsFmsQ=;
        b=Aso8bWHj947CPHtwYIkNOZpXwYJ6IcQlK85+GpDxT3WOFM6HpqYadMDBpCVJIkzMnU
         vZRcTf3QQ7uiFdHkdRKW+Dhqj0/1O+AHUN9QIjsIOZuQ2ZDuUIjsmvAUi8k9AfbGvv1z
         fc+jfTcfhtKMKIenJfbAFCzV/8BguvwD3a/OirbW3s/o4kABOIY4hlXmBBSA09+tWvxc
         bYqVJ0VpIZBylhx7ZxZoyXQc3BI7gdMO4ch/Ufd4LQ+VsDMyA6TuEwHIcuyWKeTf2nwT
         +1JKgRmLcTpDXkT7tdpcF9Sp1fLSRWnFSjaOt6griUdc0iU9EmzL2G5LD9OukHPrW5Tp
         gc/g==
X-Gm-Message-State: AOJu0YxZCGfcXlylURgyAhidVIU9xN3Oo4ldDak4ALaOc/iyzDKFxCpf
	A67KuDR72rQ1azfLDMAYsMG3IFHE6SBFmzse+hW2PB74XyTWOvQ79Vxgpcok//03RLw9HT70cX6
	u078=
X-Google-Smtp-Source: AGHT+IHYv9UQ1NH0BPBBzMwPwVzMJinEFh4rgxIxc5jc8prduA3Nll6k7VEnn7OBCAcZK3PkJF/3yA==
X-Received: by 2002:a05:6402:2812:b0:5c8:8538:b770 with SMTP id 4fb4d7f45d1cf-5c88538bbbfmr13313247a12.8.1727786312880;
        Tue, 01 Oct 2024 05:38:32 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 04/11] xen/x86: Add supporting code for uploading LAPIC contexts during domain create
Date: Tue,  1 Oct 2024 13:38:00 +0100
Message-ID: <20241001123807.605-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241001123807.605-1-alejandro.vallejo@cloud.com>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If toolstack were to upload LAPIC contexts as part of domain creation it
would encounter a problem were the architectural state does not reflect
the APIC ID in the hidden state. This patch ensures updates to the
hidden state trigger an update in the architectural registers so the
APIC ID in both is consistent.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/hvm/vlapic.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 02570f9dd63a..a8183c3023da 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1640,7 +1640,27 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
 
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
2.46.0


