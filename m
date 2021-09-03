Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BD83FFC35
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177892.323657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4lA-0005KW-DX; Fri, 03 Sep 2021 08:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177892.323657; Fri, 03 Sep 2021 08:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4lA-0005HM-8b; Fri, 03 Sep 2021 08:41:16 +0000
Received: by outflank-mailman (input) for mailman id 177892;
 Fri, 03 Sep 2021 08:41:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM4es-0006kQ-EK
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:34:46 +0000
Received: from mail-ej1-x631.google.com (unknown [2a00:1450:4864:20::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d926dc1-80ff-4ebb-a723-1fd24234f40a;
 Fri, 03 Sep 2021 08:34:02 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id lc21so10503499ejc.7
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 01:34:02 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id i7sm2311932ejx.73.2021.09.03.01.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:34:01 -0700 (PDT)
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
X-Inumbo-ID: 1d926dc1-80ff-4ebb-a723-1fd24234f40a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xy7BJSB6xaM30OyXxkPFQIY2JXEW71Y3R+/OfIHEOBE=;
        b=pnUw4Mlz8wE01ctr0MxVIgMnhwLnYDb2XDSr3Mz0utU10pdqiieFvIuxCCByexKtyf
         B06Oyzl54Te+zID2si0YkZIjwWSmkUavw3mR3hfVyzP1prT4JWTQ2NTIK4x6xtbcRpqc
         KxtBQtIPNwv9OGv7Awvjre3ntebXcDrWFI2SG529YegtLTDoGtS7s1bc/D2jQxUVo3N7
         BdhYDhJHI86NLX1Mc5Y1L3MlkT/LPFTYKEkS5Mb0pAz3/VB/Hn65DqjDFmLtvlvBfV5r
         z6WPuzwT0gYxxiczN3UQkXeeK6u22iH64pxd2K8aSWXJ8LKEUvYiJdgFvuoa8TTDahw0
         xKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xy7BJSB6xaM30OyXxkPFQIY2JXEW71Y3R+/OfIHEOBE=;
        b=Tb8crlNetyA6rFLsr9BPepDhb+mT9n9jfsUBW8A0hc7C/6FqN8EkpaSUFDLxZx5Bm0
         EFyPIyQ/FBKiqjBTGdcEYbw27nAms0HXXuw4ith3GQIZT8uX8g1CEoOKpjrOVvimfx5H
         VFMdHmp7LNZHQUWt6F++n7mtvjQ/iZ8tJxutQaf0Kz6YLSq1dX3aT0TA8EMRT1vHN9rG
         0SszP9zXs6zXvrFAGNX6T38VwiduYKf+EWML+ycm9J+wssNO5DKunxRWtf/kP9F0INQM
         XVNDV/9u0aMfmHpyMCkGGxpYEBsyY5xUaq+gFNREXGgYvoPUo+WA5dUXo5WPfPCrtixp
         oKOw==
X-Gm-Message-State: AOAM5308j4Iig0X44JLaWCBB9ZOGEhuPoZvkJFtBcA9wOI/JQwhpGQ33
	8s99qzGcnqNjJqAC3WcSHIWGHWQ1amo=
X-Google-Smtp-Source: ABdhPJyJcdfQj9c9044SVO6J1UJQYGNr5fMQWFYrfhn9ETnMa9xx30aD81J57K8Jf8DgGximyczXvQ==
X-Received: by 2002:a17:907:2174:: with SMTP id rl20mr2987996ejb.199.1630658041886;
        Fri, 03 Sep 2021 01:34:01 -0700 (PDT)
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
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 11/11] xen/arm: Process pending vPCI map/unmap operations
Date: Fri,  3 Sep 2021 11:33:47 +0300
Message-Id: <20210903083347.131786-12-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903083347.131786-1-andr2000@gmail.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

vPCI may map and unmap PCI device memory (BARs) being passed through which
may take a lot of time. For this those operations may be deferred to be
performed later, so that they can be safely preempted.
Run the corresponding vPCI code while switching a vCPU.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/traps.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 219ab3c3fbde..1571fb8afd03 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -34,6 +34,7 @@
 #include <xen/symbols.h>
 #include <xen/version.h>
 #include <xen/virtual_region.h>
+#include <xen/vpci.h>
 
 #include <public/sched.h>
 #include <public/xen.h>
@@ -2304,6 +2305,11 @@ static bool check_for_vcpu_work(void)
     }
 #endif
 
+    local_irq_enable();
+    if ( has_vpci(v->domain) && vpci_process_pending(v) )
+        raise_softirq(SCHEDULE_SOFTIRQ);
+    local_irq_disable();
+
     if ( likely(!v->arch.need_flush_to_ram) )
         return false;
 
-- 
2.25.1


