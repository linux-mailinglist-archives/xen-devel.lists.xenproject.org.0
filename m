Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9425507143
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 17:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308247.523907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpO6-00051v-87; Tue, 19 Apr 2022 15:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308247.523907; Tue, 19 Apr 2022 15:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpO6-0004zD-4o; Tue, 19 Apr 2022 15:03:30 +0000
Received: by outflank-mailman (input) for mailman id 308247;
 Tue, 19 Apr 2022 15:03:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nWVz=U5=gmail.com=d.vrabel.98@srs-se1.protection.inumbo.net>)
 id 1ngpO4-0004z7-AU
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 15:03:28 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dddc03be-bff1-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 17:03:27 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id b19so22809394wrh.11
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 08:03:27 -0700 (PDT)
Received: from pear.davidvrabel.org.uk (pear.davidvrabel.org.uk.
 [82.70.146.41]) by smtp.googlemail.com with ESMTPSA id
 b5-20020adfd1c5000000b0020a7954a974sm12215010wrd.34.2022.04.19.08.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 08:03:26 -0700 (PDT)
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
X-Inumbo-ID: dddc03be-bff1-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ClOMvzXUkEMDZ0b8UX4E1pNgQWl3nMR7i1rQInvtkA=;
        b=l4Vm7kfYuqYnkN+yNN1YEBG+gVk2Z2v5+UD+QlI2xxQYbg04DbKA8rG/wA3Zf1V7Dl
         HP0At6uk4b3bKNgA0k2yZHrxUMSKWi+Ms8Wh9e+C6Dq6N1kB0ZNgAX/AVvyrpaXPfoHD
         WAlwHZhJb1wKy4b3WZjSob2GNfYvey6V014O/pWjFB82aue+oTVQC4xE7zPmrn03I0HB
         XmC+VrrCAHCWi2RvOWDaacq37aiW0se6nh5HXpt0+uTtyodg2GAB+O7D6RMAqfHe2QfP
         hfC2J7CHnTItmHk6wsx0pbWEySVDB2Gp+QD4QVloYsR3W6EXiJv2xtc0JS8NDDULR2bZ
         Wfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=5ClOMvzXUkEMDZ0b8UX4E1pNgQWl3nMR7i1rQInvtkA=;
        b=Y86LvhmuSnT4kV4sqMso8HuLcYl6m87x+9eqQlVbeBQYzDpgCzMqHjK6Rodm9LtOH+
         uMbIQCj1JZItfvDWOBgIgGUOW2tRJ/x7JrDp5CvcZj3mBMTcTp50XBlSWbE0E5BXtWZm
         PuZKHIRQzLCPv3Igu6FuFEesEDlfPNwx+MECSOgGdnXHDwv9aByN0QF3eQc7fe3iqadW
         OFlkKt67UTazUkeWRgNJ05+fGc5DcU54fbCmAZ/UUikd9xcXDIIGU+4mIKEy3uZSYD7e
         ru+hieaqzuE/oU2SHioGvglmmK46VOtjKi/d5opNoMDi3jnv9CU7Jmm83bQDNsCHF1if
         u61g==
X-Gm-Message-State: AOAM530kGmo88Jcm9Cm8uWc7Gsz0+pF0KuP/v5DHXvhxKtNKvnEtrl/7
	1z+fjOCRaozrdzYGP/mQsoQhoTq3iotouw==
X-Google-Smtp-Source: ABdhPJxKiy/MO4DHrk2AtR3HqnzpF0BXjLoj/y89IrNGazTUrbnRVgCpjbztsfjfDcxs9EzcDpVbVA==
X-Received: by 2002:adf:ba8f:0:b0:1e9:4afb:179b with SMTP id p15-20020adfba8f000000b001e94afb179bmr12257122wrg.57.1650380606754;
        Tue, 19 Apr 2022 08:03:26 -0700 (PDT)
Sender: David Vrabel <d.vrabel.98@gmail.com>
From: David Vrabel <dvrabel@cantab.net>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	David Vrabel <dvrabel@amazon.co.uk>
Subject: [PATCH v1] x86/mm: avoid inadvertently degrading a TLB flush to local only
Date: Tue, 19 Apr 2022 16:03:20 +0100
Message-Id: <20220419150320.64783-1-dvrabel@cantab.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Vrabel <dvrabel@amazon.co.uk>

If the direct map is incorrectly modified with interrupts disabled,
the required TLB flushes are degraded to flushing the local CPU only.

This could lead to very hard to diagnose problems as different CPUs will
end up with different views of memory. Although, no such issues have yet
been identified.

Change the check in the flush_area() macro to look at system_state
instead. This defers the switch from local to all later in the boot
(see xen/arch/x86/setup.c:__start_xen()). This is fine because
additional PCPUs are not brought up until after the system state is
SYS_STATE_smp_boot.

Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
---
 xen/arch/x86/mm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index c271e383b5..72dbce43b1 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5071,11 +5071,10 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
 #define lNf_to_l1f(f) (((f) & _PAGE_PRESENT) ? ((f) & ~_PAGE_PSE) : (f))
 
 /*
- * map_pages_to_xen() can be called with interrupts disabled during
- * early bootstrap. In this case it is safe to use flush_area_local()
- * and avoid locking because only the local CPU is online.
+ * map_pages_to_xen() can be called early in boot before any other
+ * CPUs are online. Use flush_area_local() in this case.
  */
-#define flush_area(v,f) (!local_irq_is_enabled() ?              \
+#define flush_area(v,f) (system_state < SYS_STATE_smp_boot ?    \
                          flush_area_local((const void *)v, f) : \
                          flush_area_all((const void *)v, f))
 
-- 
2.30.2


