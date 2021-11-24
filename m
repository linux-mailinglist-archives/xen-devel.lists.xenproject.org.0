Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AA145B60C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 09:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230146.397908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC5-0006xY-CQ; Wed, 24 Nov 2021 07:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230146.397908; Wed, 24 Nov 2021 07:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC5-0006u7-6g; Wed, 24 Nov 2021 07:59:53 +0000
Received: by outflank-mailman (input) for mailman id 230146;
 Wed, 24 Nov 2021 07:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CYi7=QL=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mpnC2-0006a3-Qy
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 07:59:50 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fabd428-4cfc-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 08:59:50 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id c32so4982497lfv.4
 for <xen-devel@lists.xenproject.org>; Tue, 23 Nov 2021 23:59:49 -0800 (PST)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i24sm1750358ljm.135.2021.11.23.23.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 23:59:49 -0800 (PST)
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
X-Inumbo-ID: 7fabd428-4cfc-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NtLazSat9apxux+5yyxbOkPmv89tR4XWYJTOoTreBMc=;
        b=MbPbydd08IszozKtXB23iEi80MXIftRDzIuvnQIitsp27FmVYxqB1d+gnQDZePIqLE
         FIgXdx/u1BXkOHDbLQUol2vYaerLrB56zRhlsyBQXdOHuRV/I5KgEjFfM9M2KFzyoH7A
         as6pVIjYNBcEkQ5jYHjFqdEXHZjt9kR+WD4PLSd6KIm/bYYIIfJOVyCiaFe04slbFTOj
         asCWuOS0KLjiQ9cUpD8dEpnuMJh/dQzxyha7JJ/PaYFEjE0/s7Vx8uM0c/PDsIIfZbOy
         1mIwuRWh4KZo1dA3NqXczSQYCSGfbYGcMv6EF0+BZAlphnT5XAX91UyUmCqWyQMa5S3p
         CgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NtLazSat9apxux+5yyxbOkPmv89tR4XWYJTOoTreBMc=;
        b=LvY9f09Y0MiplaIq5rxOZ3q2smcpkkYMvTgPiuuFs8dboY5TyRjDhz3d0+Ixd3v9oH
         zuzWydWw11oEXZxjA2fGv5L5t/McUYBlEtfKPiohbV1CaDzqaFt3NBYPga5/C8Aouk4z
         sSlJiO2k6WJtZTUQOK79cUHjXQ31483CunzRojOLNmh+TfTMljDBZwC4UFxxnOAtq9G4
         sbZt2LcIV8gZ8NwdoVLamqKfZN+8bIrMkbIoWOhY/5vlf8EQ5ee6TKLELpIRsuFz5UWE
         MB16S5XZbz1YI+lcqj4Gh7Wnrp31WnXfFU+Hfo+7EIHi7TFLR1sXIcWW1R5xQLMbJSzW
         3Mcw==
X-Gm-Message-State: AOAM530OuLuyOtWsr2wZ8046xVSpjoshe/NSPyyMtqo/z2H45HlN6waG
	J2HGv5KDtyfLjOdQn3Ns0rHScOmmK4kOxg==
X-Google-Smtp-Source: ABdhPJxJvBRGULlAB79krxpx2pd/sSPt0RtA66daRKicCVK9MHazHG557XsZg0SUYIuzBhUCn/HNGw==
X-Received: by 2002:a05:6512:ac9:: with SMTP id n9mr12022679lfu.59.1637740789446;
        Tue, 23 Nov 2021 23:59:49 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v7 4/7] xen/arm: account IO handler for emulated PCI host bridge
Date: Wed, 24 Nov 2021 09:59:39 +0200
Message-Id: <20211124075942.2645445-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124075942.2645445-1-andr2000@gmail.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment, we always allocate an extra 16 slots for IO handlers
(see MAX_IO_HANDLER). So while adding an IO trap handler for the emulated
PCI host bridge we are not breaking anything, but we have a latent bug
as the maximum number of IOs may be exceeded.
Fix this by explicitly telling that we have an additional IO handler, so it is
accounted.

Fixes: d59168dc05a5 ("xen/arm: Enable the existing x86 virtual PCI support for ARM")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
New in v7
---
 xen/arch/arm/vpci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index ccd998d8dba2..8e801f275879 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -126,7 +126,8 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
         return ret < 0 ? 0 : ret;
     }
 
-    return 0;
+    /* For a single emulated host bridge's configuration space. */
+    return 1;
 }
 
 /*
-- 
2.25.1


