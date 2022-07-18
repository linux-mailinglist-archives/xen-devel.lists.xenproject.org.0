Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C305784C5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 16:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369834.601371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRNN-00061T-BO; Mon, 18 Jul 2022 14:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369834.601371; Mon, 18 Jul 2022 14:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRNN-0005zd-7e; Mon, 18 Jul 2022 14:05:33 +0000
Received: by outflank-mailman (input) for mailman id 369834;
 Mon, 18 Jul 2022 14:05:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdCD=XX=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oDRNL-0005zX-Ma
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 14:05:31 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae746b73-06a2-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 16:05:30 +0200 (CEST)
Received: by mail-qt1-x834.google.com with SMTP id x11so3090634qts.13
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jul 2022 07:05:30 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:aca3:a6c1:f806:b8ba])
 by smtp.gmail.com with ESMTPSA id
 dt18-20020a05620a479200b006b5cb0c512asm10480339qkb.101.2022.07.18.07.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 07:05:28 -0700 (PDT)
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
X-Inumbo-ID: ae746b73-06a2-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3uIetIDCX/BBS2dAp1PK0jCfKYau2HdeGwq2NiKk4mQ=;
        b=WEQfEitbA1anWI3hfbQYvtrzWIlGKUQBXV0Y6pJcdoOY9C5p7gKoS5D9BBoqC6jwxG
         2rCZw5QW2Gx3s70dnFOeWN7tTFkWZKm30PU4cddEfarutZCrW+zBm87jSAQqNsWgt9Lv
         G8coarjuw9/35b64vf1tzLeCDIfjYKZUDOgQT+58mBQ5wY7Y2vdkm06A9Q5Wv7NhlFWy
         alW8F2AsjoxI3BHT9SCiKk4N7ixbJZqllisShLD+cihTMSo1kZUm8wdcfnZYsb8RL1Jg
         0Z2OjL4PHt0c7XA2d5qz7h+kXfpBtDBqBr1Kx9aCva6gF/TFcZ9d4O1mUVTUK+4ehXh1
         4V4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3uIetIDCX/BBS2dAp1PK0jCfKYau2HdeGwq2NiKk4mQ=;
        b=AhUhfzsjXUNuQZQUKbljVwwh8Ecv/QAjSQVpMI+3Liv7ai3A6csgxrOLQP/sdC1mAq
         NKicGtgCbjpMKMsjeM0B9Iall6au046B+X3qo1fkNgdiTwwVHddkZNg+H5IIGzscjQyf
         oIAH4PKVjDxVvUM+n5bJ/+Bfw3x7Qqq93uzkd8ZDSoOPHLDxP47AKmRaFpByL2ESQVvN
         5kMSm8A6nQrFAH1Hcvdom98cu4Ik3Twu6sCAC/UAtwlEJbnj1dEyOEbKWLru0MIvpY9Q
         incQvNqV/ybOodMEIWpukr/H0GiZ89+QKdZekoykYbKWQHdJDTqngN42DaA22Jwmkyca
         E+eg==
X-Gm-Message-State: AJIora+4e441R2VLMK9qSBCVDlr4ouYdTdbqQCUUFWwPymH4pQ0BF+0/
	HHx1f6po8UczuGSrcyFPkk/iYFxdAPE=
X-Google-Smtp-Source: AGRyM1u4mUvJYIHgt7FNp6tDVtuY3ag17Hjd/OCGL3gozOGmaxWXZ6jS0OR73YV83yDLC5tkKKS8bw==
X-Received: by 2002:a05:622a:d5:b0:31e:eb65:e832 with SMTP id p21-20020a05622a00d500b0031eeb65e832mr5291264qtw.92.1658153129303;
        Mon, 18 Jul 2022 07:05:29 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86: Add MMIO Stale Data arch_caps to hardware domain
Date: Mon, 18 Jul 2022 10:05:17 -0400
Message-Id: <20220718140517.14771-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let the hardware domain know about the hardware it is running on.  This
allows a linux Dom0 to know that it has the appropriate microcode via
FB_CLEAR.  /sys/devices/system/cpu/vulnerabilities/mmio_stale_data
changes from:
"Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state
unknown"
to:
"Mitigation: Clear CPU buffers; SMT Host state unknown"

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Should calculate_host_policy()'s arch_caps mask also be updated?  They
are not identical today, but I'm don't know this code to understand why
they differ.

 xen/arch/x86/msr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index c2c0025e3a..f1c36d423f 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -163,7 +163,9 @@ int init_domain_msr_policy(struct domain *d)
 
         mp->arch_caps.raw = val &
             (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
-             ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_TAA_NO);
+             ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_TAA_NO |
+             ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO | ARCH_CAPS_PSDP_NO |
+             ARCH_CAPS_FB_CLEAR);
     }
 
     d->arch.msr = mp;
-- 
2.36.1


