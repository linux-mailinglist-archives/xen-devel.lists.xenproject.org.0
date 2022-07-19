Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA1757A59C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370798.602690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFa-0006Tv-QZ; Tue, 19 Jul 2022 17:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370798.602690; Tue, 19 Jul 2022 17:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFa-0006Na-Mi; Tue, 19 Jul 2022 17:43:14 +0000
Received: by outflank-mailman (input) for mailman id 370798;
 Tue, 19 Jul 2022 17:43:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6sG=XY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oDrFZ-00065X-Dp
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:43:13 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 417dca07-078a-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 19:43:10 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id oy13so28511195ejb.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 10:43:10 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 wj18-20020a170907051200b0072af92fa086sm6903268ejb.32.2022.07.19.10.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:43:09 -0700 (PDT)
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
X-Inumbo-ID: 417dca07-078a-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tJNTg1Q/tJV0tMcGJ0EnKDCjisTQ8wg7Qbj1vC+6DIM=;
        b=JEBiRzNq8/rEVpY4Y1nCW+0agQpHA0wUkr+t5hIdFIBb9KlxybaeCAObAKObfaxV3K
         CQGvoMUAmYrEUj3Eo5BAlMm1g65MjO/b36aDofazXPb03Hc5ijiHyONtsOlEpRBj4/er
         xcYSLyjKsWm0shAZcoBRcEqb5sc+v0kcXmAbYRKjZp3+UHsV0gdOu3PdjgnxTitpfzNP
         DjrYSzpoJ9VALSlYMFm34nRMLO6WouZsnBSwdr7FySAwxXbgE7S3F8kdxceX3eXQqcFI
         nEjlv7B/84y37y1us2gVDx7znmZ12i3QplCweCTbqFsZ1oQVv6O2e+PEGBgWc3i01oIH
         jh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tJNTg1Q/tJV0tMcGJ0EnKDCjisTQ8wg7Qbj1vC+6DIM=;
        b=hkSmE4kEyYL4XlwGrA97/Jv1+J66P9kGtdW2sVKjxH+xJ5A9eC46mAjlS/Pb6E2/0S
         7roUbGRO4TraCLiPV/UHV2lD25tMq21UoVUHZaE+IzmPr54F9apOa5uE7DNZ60LabTr4
         ds614Tc+SFUixeJ1RHVG7pUPvDTm7ZB21sauu8tDziB2TbY5IyHGxMb0JNWTkSa+lo6F
         LJpS0iN/fiPldQm0Cz4DNyJSeR8Jq6kG4N0un3Und6beurNjb0VURkKUJQTCZ5VPeb89
         rnqLimbmkUqg9mpuEEIe+j7e5/QBlsgWW5zPPHGng1CQjM4P0xxGHT33ar59D23F5hJt
         9f8g==
X-Gm-Message-State: AJIora90aSc2p84Ckb4X6lT0YwbYHjKCXSyM6s+td/HpraVPN6rM49z/
	tFAK47PMZTWuLI8WVxEGdZETEJ1W1/6IFw==
X-Google-Smtp-Source: AGRyM1sWKSEJ1JhwSXANfNs9LH6TodgS9OnuY5ABFJc+y4wgMeLWpJHFKORNVHHvQJvIQj35lX12ow==
X-Received: by 2002:a17:907:168d:b0:72b:5b67:83e6 with SMTP id hc13-20020a170907168d00b0072b5b6783e6mr32078995ejc.709.1658252589631;
        Tue, 19 Jul 2022 10:43:09 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH V7 01/11] xen/pci: arm: add stub for is_memory_hole
Date: Tue, 19 Jul 2022 20:42:43 +0300
Message-Id: <20220719174253.541965-2-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719174253.541965-1-olekstysh@gmail.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add a stub for is_memory_hole which is required for PCI passthrough
on Arm.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
OT: It looks like the discussion got stuck. As I understand this
patch is not immediately needed in the context of current series
as PCI passthrough is not enabled on Arm at the moment. So the patch
could be added later on, but it is needed to allow PCI passthrough
to be built on Arm for those who want to test it.

Copy here some context provided by Julien:

Here a summary of the discussion (+ some my follow-up thoughts):

is_memory_hole() was recently introduced on x86 (see commit 75cc460a1b8c
"xen/pci: detect when BARs are not suitably positioned") to check
whether the BAR are positioned outside of a valid memory range. This was
introduced to work-around quirky firmware.

In theory, this could also happen on Arm. In practice, this may not
happen but it sounds better to sanity check that the BAR contains
"valid" I/O range.

On x86, this is implemented by checking the region is not described is
in the e820. IIUC, on Arm, the BARs have to be positioned in pre-defined
ranges. So I think it would be possible to implement is_memory_hole() by
going through the list of hostbridges and check the ranges.

But first, I'd like to confirm my understanding with Rahul, and others.

If we were going to go this route, I would also rename the function to
be better match what it is doing (i.e. it checks the BAR is correctly
placed). As a potentially optimization/hardening for Arm, we could pass
the hostbridge so we don't have to walk all of them.
---
 xen/arch/arm/mm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 009b8cd9ef..bb34b97eb5 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1708,6 +1708,12 @@ unsigned long get_upper_mfn_bound(void)
     return max_page - 1;
 }
 
+bool is_memory_hole(mfn_t start, mfn_t end)
+{
+    /* TODO: this needs to be properly implemented. */
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


