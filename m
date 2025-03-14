Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E07A60E07
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 10:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914284.1320061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt1nL-0004A2-KL; Fri, 14 Mar 2025 09:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914284.1320061; Fri, 14 Mar 2025 09:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt1nL-00047h-HE; Fri, 14 Mar 2025 09:57:35 +0000
Received: by outflank-mailman (input) for mailman id 914284;
 Fri, 14 Mar 2025 09:57:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt1nK-00047b-Ew
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 09:57:34 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bea6074a-00ba-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 10:57:31 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so17766165e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 02:57:31 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6e92sm5108014f8f.38.2025.03.14.02.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 02:57:30 -0700 (PDT)
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
X-Inumbo-ID: bea6074a-00ba-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741946250; x=1742551050; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUmfmqChrgiLTxRF5w17zUU7tfVqb6HdmNfep5qNfhQ=;
        b=HRmlmSHV05MNRKP0H0+ZFsa1LQPGpKarJ8ENl7a2Iaty315K0gfDJu7ScBfe//vZSW
         4KGV2bhcK0vKnzXpLyMJ28rm9sJxuZEztguuUMiJp501YniUut+Da17QdODkQrNoC+yA
         kZvcvAqlcW0GE7A8HRjGri1U//AiQQnpeYA9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946250; x=1742551050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUmfmqChrgiLTxRF5w17zUU7tfVqb6HdmNfep5qNfhQ=;
        b=ZHVgWJvqndthhklleMO0JJ+D/E21HDhLmLu/3A0EiBxdLGAtkti8iTtY3tQmxO7lXV
         MUnAEEZVY4qP7CTpvQLrGpaJhZyfVc/9mui23eTmB3ySXyEpurcUZ6v8Jn26VdgcaSN4
         Mc+m7p33FaPeAzZLq0h7Hmg4M8996zPRwDawQL59TuZdyV+hIlH2vgBzZAdGNRBBpZ/m
         N206yqsrLCiG5fKFmqfqkF0u/5ptWb4p/A2jBoy3E1DWGK1sr2+LWad8mbB6p22LijYy
         ZcedEwSSTdmEyi6NmIE3Nqjxdj/VpsuMIY6S/mE/6hDBAyDOlI0REbDjVl9ZhvEOj3Bc
         Vvkw==
X-Gm-Message-State: AOJu0Yyyv5DmxVD+ZsjKdiUCe79WXJh4wHGdKiJ8Qz+NApFjm6EkiYwv
	+sy25IMcaOPbhQyuoo1ub1pSC+Te0oZ69aieOEXsTNArYK13t5hAym0pra5K4H+1tirk3DVMTHy
	I
X-Gm-Gg: ASbGncsg+J47JkL4lUFne4u/+fHKErezMKD1IXttHMN6Yg7YQNnHsMfiln4IR8z01ZW
	upQSG2pp01u+ZtS8eQV16+ojnvZGduzo0vWTN1vKWc41fV2gOeJSbKMElhjYEtsgcG0kJ/BPgPJ
	j7ColTzzpsrNLmK+eDQliYAO4aRDod8W2FJBAFkdk20xfF5+/gbmSZQsvOscaV/Lan5Gm7VWBfz
	Yc9h+mp0+ZvVXQ5+uK1L3nQ/s7dSzAibw2mWNoZfceB+HaKcZWZOi3eYB1DFbQLOz2YGuaZ/YtV
	LNj8V9yattZRkRC1tWve6W8/McyqcclYfyljv4cGgX2s0Uy3JefuyA1NFQBSbYLIxeU6smnUD7Y
	m9e4YQq95PbiLydjfgAGScMnN
X-Google-Smtp-Source: AGHT+IFEXrftt5KY8jWbuFllzODSaZjSJ7BE13v1n5WbapZQA5KAnnL5l8ETRpQ3uWS5049YhTNwBg==
X-Received: by 2002:a05:6000:2c1:b0:391:2c67:7983 with SMTP id ffacd0b85a97d-3971ee4428bmr2616151f8f.39.1741946250407;
        Fri, 14 Mar 2025 02:57:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] VT-d: Adjust diagnostics in set_msi_source_id()
Date: Fri, 14 Mar 2025 09:55:23 +0000
Message-Id: <20250314095523.4096604-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use %pd, and state what the unknown is.  As it's an enum, it's a signed type.

Also drop one piece of trailing whitespace.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/vtd/intremap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 81394ef45299..9272a2511398 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -485,15 +485,15 @@ static int set_msi_source_id(const struct pci_dev *pdev,
         else
         {
             dprintk(XENLOG_WARNING VTDPREFIX,
-                    "d%d: no upstream bridge for %pp\n",
-                    pdev->domain->domain_id, &pdev->sbdf);
+                    "%pd: no upstream bridge for %pp\n",
+                    pdev->domain, &pdev->sbdf);
             return -ENXIO;
         }
         break;
 
     default:
-        dprintk(XENLOG_WARNING VTDPREFIX, "d%d: unknown(%u): %pp\n",
-                pdev->domain->domain_id, pdev->type, &pdev->sbdf);
+        dprintk(XENLOG_WARNING VTDPREFIX, "%pd: %pp unknown device type %d\n",
+                pdev->domain, &pdev->sbdf, pdev->type);
         return -EOPNOTSUPP;
     }
 
@@ -751,7 +751,7 @@ void disable_intremap(struct vtd_iommu *iommu)
                   !(sts & DMA_GSTS_IRES), sts);
 
     /* If we are disabling Interrupt Remapping, make sure we dont stay in
-     * Extended Interrupt Mode, as this is unaffected by the Interrupt 
+     * Extended Interrupt Mode, as this is unaffected by the Interrupt
      * Remapping flag in each DMAR Global Control Register.
      * Specifically, local apics in xapic mode do not like interrupts delivered
      * in x2apic mode.  Any code turning interrupt remapping back on will set
-- 
2.39.5


