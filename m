Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 354B07EA1AB
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 18:06:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631849.985565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2aOG-0006hf-Vm; Mon, 13 Nov 2023 17:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631849.985565; Mon, 13 Nov 2023 17:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2aOG-0006g0-Sw; Mon, 13 Nov 2023 17:06:24 +0000
Received: by outflank-mailman (input) for mailman id 631849;
 Mon, 13 Nov 2023 17:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7nXK=G2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r2aOF-0006fu-LA
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 17:06:23 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7d490ba-8246-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 18:06:21 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-408382da7f0so38905355e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 09:06:21 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a5d43c9000000b0032da022855fsm5805800wrr.111.2023.11.13.09.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 09:06:20 -0800 (PST)
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
X-Inumbo-ID: f7d490ba-8246-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699895181; x=1700499981; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMT7c/uiWiQZVRU+b+wZHF6Grzvo4YDAcSgfc5P5jVA=;
        b=a/tkkyxf1zD7/nmQyn6AI2Tx+NuRRWX1MLJ7TnNGOECNoguRQHnIeojqHUi60ijzRI
         mCK1OJAYPNdB79AxN7v8VzuVyZ0De8IiwgWInYri+jHP84BBuZhMHfDI3wbq8pAkbIbx
         UPJEffc5BaFTMpxZjhLHOQS5FesOmDiBFDKNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699895181; x=1700499981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMT7c/uiWiQZVRU+b+wZHF6Grzvo4YDAcSgfc5P5jVA=;
        b=VPPQk7VlTL6aCbyhQPt9mCE44JffQ6QP3WqhVSX5zlnXXEAVHsS06h1HnG4NjMqSuh
         tW9FJzIPHGpG9lv05A4qASX6Idj4eZ2Iuj0cO+u1bdpwJOLvF77dysJ964Vly+Fwyy8J
         jYK3uxHvWYLXq6iL9T1Z5Hv+m1jjC2pG0M3Fbp/oZRCNPQx0AZPUh6rHC2dmUR5+JA38
         Gq3n27bJY8CjhyLtzagqff1NgHaTA4mCn6KJ90sHv5nz6mtO5WxKV6hjF9hg/a5gMIPI
         ZtRJU65tComF0Ofcz67SSg3lqfi56csXV9XZoIENHBfNAYYgmGmK6oDqeG91/wKNRZnx
         KhXA==
X-Gm-Message-State: AOJu0YyEenpGu7wqgrq6IqnKIZI7DhkgzT0LtLZ716PzPnrubMFeBqim
	PwDupbunjafZxkMvBTfyCQUmRaC6O5/h0BUKkYY=
X-Google-Smtp-Source: AGHT+IEUIFDEjZ8xQCJ/lIc+4at+vBm1KT5Dn4H7fIPW60l+G2YIYq35bQOe1UO53pimBlWDq1pbow==
X-Received: by 2002:a05:6000:186a:b0:32f:811f:5046 with SMTP id d10-20020a056000186a00b0032f811f5046mr4992740wri.11.1699895180712;
        Mon, 13 Nov 2023 09:06:20 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/x86: On x2APIC mode, derive LDR from APIC_ID
Date: Mon, 13 Nov 2023 16:50:23 +0000
Message-Id: <20231113165023.5824-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
registers are derivable from each other through a fixed formula.

Xen uses that formula, but applies it to vCPU IDs (which are sequential)
rather than x2APIC_IDs (which are not, at the moment). As I understand it,
this is an attempt to tightly pack vCPUs into clusters so each cluster has
16 vCPUs rather than 8, but this is problematic for OSs that might read the
x2APIC_ID and internally derive LDR (or the other way around)

This patch fixes the implementation so we follow the rules in the x2APIC
spec(s).

While in the neighborhood, replace the u32 type with the standard uint32_t

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/hvm/vlapic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index c7ce82d064..5a74e84445 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1063,10 +1063,10 @@ static const struct hvm_mmio_ops vlapic_mmio_ops = {
 
 static void set_x2apic_id(struct vlapic *vlapic)
 {
-    u32 id = vlapic_vcpu(vlapic)->vcpu_id;
-    u32 ldr = ((id & ~0xf) << 12) | (1 << (id & 0xf));
+    uint32_t id = vlapic_vcpu(vlapic)->vcpu_id * 2;
+    uint32_t ldr = ((id & ~0xf) << 12) | (1 << (id & 0xf));
 
-    vlapic_set_reg(vlapic, APIC_ID, id * 2);
+    vlapic_set_reg(vlapic, APIC_ID, id);
     vlapic_set_reg(vlapic, APIC_LDR, ldr);
 }
 
-- 
2.34.1


