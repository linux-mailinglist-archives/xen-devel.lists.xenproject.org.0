Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED1241D445
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:14:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199409.353496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGc-0007Hk-Tp; Thu, 30 Sep 2021 07:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199409.353496; Thu, 30 Sep 2021 07:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGc-0007FC-Os; Thu, 30 Sep 2021 07:14:06 +0000
Received: by outflank-mailman (input) for mailman id 199409;
 Thu, 30 Sep 2021 07:14:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqGb-0004B3-AJ
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:14:05 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1ae476d-7a57-4cb3-97fd-038cc0246998;
 Thu, 30 Sep 2021 07:13:35 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x27so21169465lfa.9
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:13:35 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id y3sm267835lfh.132.2021.09.30.00.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:13:34 -0700 (PDT)
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
X-Inumbo-ID: d1ae476d-7a57-4cb3-97fd-038cc0246998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kD50gSwDk757eJ2CQu1b9/IhYMvfHenQQYtu99uRv54=;
        b=FiQ0pvnKAQPmcXJwpGM/6RO4ozSTrcDZxYX1z5919gATo4P3P1EFGVZYDPBys8gdiE
         EWLY95k4AM5D6CpQHdaw0QMd+PUlp9+pj3TGfpPgcv3Fdo4y0lXHyg9DnV7qBTSW/x0f
         3CiMwVJdQzHtxQHHeK8jtEVxEgrj5/RXegApxZfc84UlAgVWWL0hMhQyChFGUV5kmMtv
         pHM8xSFrotLYTq6YLyeQZlhn/CQ4ZZYL7mT3fHXBG8zi7HXBMSFPTeG5fzzXgGjc7hWL
         +xZmGUDnB9Le0mvIndlJEF7UOLeu0JCciIxHox1KZcmELzt5L1xesbt5SvTT7viC259m
         1B8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kD50gSwDk757eJ2CQu1b9/IhYMvfHenQQYtu99uRv54=;
        b=26TCNL0p5uhGx75DlxgKlk243S35sGayyy+AiUx74dgHWA19puozOPcsOVv/zdOoLZ
         /kby0Gaqc3gCMVINhc68gmHQNmWh3veGJjEekiWWSTaANooo+6a4oRJHCZVLkLgGAsDZ
         EZpSWKMWdAuybBZTrVjQ6yRFN28q+itNNEt5gX+eHnCMsjrBv8PhqD/NgN+QaQRB2htv
         aXfn9E532CpeWFmOqVIXARQzjlQJ2OlFhI+/DSoxjpBS2nbuTpS6WMBZ1UVqgh8KWRDH
         bH90mGVS7p3hMyZuJMXEMqqTCDmLj0E8COqyta5kMG4LIi8ZXyZ8XzCX7p/tvUthuXQ4
         9hjw==
X-Gm-Message-State: AOAM5333rBkZFn+TsgfoqJ4cv61IWBoDDlbsunaoXIFMchPqN6S1rGuA
	Ah0jHcH20FPSMVgf9dXlGfLhTCeueoE=
X-Google-Smtp-Source: ABdhPJxK2IG4yCGDAvt+yiuT3W0VTju+UvV6mAq2t5rLimiqArg9MYluOZtC5rhtEqDjKIwfSmFz+Q==
X-Received: by 2002:a2e:7311:: with SMTP id o17mr4344687ljc.488.1632986014658;
        Thu, 30 Sep 2021 00:13:34 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 07/11] libxl: Allow removing PCI devices for all types of domains
Date: Thu, 30 Sep 2021 10:13:22 +0300
Message-Id: <20210930071326.857390-8-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930071326.857390-1-andr2000@gmail.com>
References: <20210930071326.857390-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

The PCI device remove path may now be used by PVH on ARM, so the
assert is no longer valid.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/libxl_pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 1a1c2630803b..59f3686fc85e 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1947,8 +1947,6 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
             goto out_fail;
         }
     } else {
-        assert(type == LIBXL_DOMAIN_TYPE_PV);
-
         char *sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->domain,
                                      pci->bus, pci->dev, pci->func);
         FILE *f = fopen(sysfs_path, "r");
-- 
2.25.1


