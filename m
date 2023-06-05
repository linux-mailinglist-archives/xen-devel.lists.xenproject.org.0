Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5FE722912
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 16:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543741.848979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6BQu-0005jD-D0; Mon, 05 Jun 2023 14:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543741.848979; Mon, 05 Jun 2023 14:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6BQu-0005hW-9K; Mon, 05 Jun 2023 14:43:44 +0000
Received: by outflank-mailman (input) for mailman id 543741;
 Mon, 05 Jun 2023 14:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6BQs-0005DU-Ft
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 14:43:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bf5652d-03af-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 16:43:40 +0200 (CEST)
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
X-Inumbo-ID: 5bf5652d-03af-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685976220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TqlnqsCULSQSOWgQEboaiyXvqCorlsa/KM/6ZxmZms0=;
  b=IxzM6j9UCUbQ5G6EA/pf3lpLcdpiu8whnoUNUXQavFQIrMHU2MiYbOrc
   2CHDmERt3cACWAyQY7n7a/i48TsgkbSrqMHpHPEDLm0kuq4fAW11ghrFu
   jH9kYs1d5wpQOxPOlOa5JsKC9daPIGRCzPBBbfDvKNB9fi1UX94k2+xVc
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111652724
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:bq1a6aBlqIyCPxVW/6Djw5YqxClBgxIJ4kV8jS/XYbTApD12hWNTx
 msdWTyAPP6LazOnKY1wPN7k9xxVu5fUx9JiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A4gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw8OIqAF1As
 r8hFzkwUj+mrtyTkJW7Y7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XTG5gPwRzEz
 o7A10a+GzI8KdCe8CaczEuzt7DNnSXfRKtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHr7m9WX+bsLCOoluaOzURLGIETT8JS00C+daLiL80ihXDX9NyCpmfh9f+GSzz6
 z2SpS14jLIW5eYB2r+n51nBj3Spr4LQUw8uzgzNWySu6QYRTIyoYZfu9lnY6f9GIIuDZl2Au
 nEenI6Z9u9mMH2WvHXTGqNXRujvvqvbdmSG2jaDAqXN6Ryn/yOiQY4XowhBLXpVHeMtRxq5R
 0/67FY5CIBoAFOmaqp+YoSUAssszLT9GdmNas04fuaicbAqKlbZoXgGiVq4mjm0zRNyyf1X1
 YKzK57EMJoMNUhwINNarc852KRj+C0xzHi7qXvTn0X+iur2iJJ4pN443LqyggIRtvjsTOb9q
 Yw32y62J/J3DoXDjtH/q9J7ELzzBSFT6WrKg8JWbPWfBQFtBXssDfTcqZt4Jdw4zvwOy7eUo
 C7jMqO99LYYrSeeQThml1g5MO+/NXqBhSxT0dMQ0aaAhCF4PNfHAFY3fJorZ7g3nNGPPtYtJ
 8Tpj/6oW6wVIhyeomR1UHUIhNA6HPhdrV7UbnXNjflWV8IIejElDfe9IlO2pHhWUnvu3Sb8y
 pX5vj7mrVM4b1wKJK7rhDiHljtdYVB1dDpOYnb1
IronPort-HdrOrdr: A9a23:tIaBOqieQGqNgu18zrpnzRCRKXBQXgoji2hC6mlwRA09TyX+rb
 HUoB17726NtN91YhpLpTnuAsS9qAznlaKdjbN/AV7aZniFhILKFvAa0WKB+Vzd8nbFh4tgPM
 5bGsBD4bbLY2SS4/yX3OCzKadC/PC3tICun/rXyH1gJDsaDZ2JkmpCe2Gm+0RNNXN7LKt8Lp
 aa+455pzLIQwVyUviG
X-Talos-CUID: 9a23:/MXP9Wwm+0vjbTbL9VFqBgUeHp0kTnOaj07vKnKEJkNAdpjFbl+5rfY=
X-Talos-MUID: 9a23:3fdArwlZQuE8i5UbS79ddnpAc95LxbmiCXkRiKs/pPjbNyx2Hyu02WE=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="111652724"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH 1/2] x86: Introduce arch_domain_teardown()
Date: Mon, 5 Jun 2023 15:43:30 +0100
Message-ID: <20230605144331.1819452-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230605144331.1819452-1-andrew.cooper3@citrix.com>
References: <20230605144331.1819452-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Plumb it into domain_teardown().  Provide arch_val in the teardown
continuation information for use by arch_domain_teardown().

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/domain.c    | 5 +++++
 xen/arch/x86/domain.c    | 5 +++++
 xen/common/domain.c      | 6 ++++++
 xen/include/xen/domain.h | 1 +
 xen/include/xen/sched.h  | 1 +
 5 files changed, 18 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index d8ef6501ff8e..b3981d70a442 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -750,6 +750,11 @@ int arch_domain_create(struct domain *d,
     return rc;
 }
 
+int arch_domain_teardown(struct domain *d)
+{
+    return 0;
+}
+
 void arch_domain_destroy(struct domain *d)
 {
     /* IOMMU page table is shared with P2M, always call
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 39c215316546..5f66c2ae33d7 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -888,6 +888,11 @@ int arch_domain_create(struct domain *d,
     return rc;
 }
 
+int arch_domain_teardown(struct domain *d)
+{
+    return 0;
+}
+
 void arch_domain_destroy(struct domain *d)
 {
     if ( is_hvm_domain(d) )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6a440590fe2a..b0d850e3595b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -416,6 +416,7 @@ static int domain_teardown(struct domain *d)
             PROG_none,
             PROG_gnttab_mappings,
             PROG_vcpu_teardown,
+            PROG_arch_teardown,
             PROG_done,
         };
 
@@ -436,6 +437,11 @@ static int domain_teardown(struct domain *d)
                 return rc;
         }
 
+    PROGRESS(arch_teardown):
+        rc = arch_domain_teardown(d);
+        if ( rc )
+            return rc;
+
     PROGRESS(done):
         break;
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 26f9c4f6dd5b..c3348c90748f 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -80,6 +80,7 @@ int arch_domain_create(struct domain *d,
                        struct xen_domctl_createdomain *config,
                        unsigned int flags);
 
+int arch_domain_teardown(struct domain *d);
 void arch_domain_destroy(struct domain *d);
 
 void arch_domain_shutdown(struct domain *d);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 85242a73d374..854f3e32c00e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -589,6 +589,7 @@ struct domain
      */
     struct {
         unsigned int val;
+        unsigned int arch_val;
         struct vcpu *vcpu;
     } teardown;
 
-- 
2.30.2


