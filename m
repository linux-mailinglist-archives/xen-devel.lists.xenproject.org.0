Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AA34B5172
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:18:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272042.466832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEm-0002hb-Cq; Mon, 14 Feb 2022 13:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272042.466832; Mon, 14 Feb 2022 13:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEm-0002ek-7P; Mon, 14 Feb 2022 13:17:52 +0000
Received: by outflank-mailman (input) for mailman id 272042;
 Mon, 14 Feb 2022 13:17:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3R-0008IH-Dn
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id def9e9d4-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:06:08 +0100 (CET)
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
X-Inumbo-ID: def9e9d4-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843968;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=mFvh8LG+XymZDQVBuCKArEEiktD2ZTkwHy0DqtzmEhk=;
  b=UVWEpIzyDoSzng5L+mIBPrePXtxu3PZoDGyrO7HPubasTzzHBkH9usbg
   l2ROrPT/QGEULeEok9JXh2gV2oGdrSA/L/LFGpctrS9jNf+h4ItUPRs/m
   vDEEHRxnEJbV8q0NcKb9dvCsUe2HQiaiDolLhvRYQ0JQNAHfytVw86jHX
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yT49laUGTy2FPkWCwaShby2MY0ToeoCCIQuyMvF44JSS9XAcDhMs+yZ8VRkS3Nd7NZucpcdiSL
 9vVdx6JPWeSgo8fPAuRrmIpklv/7kNnySqAD0r2v9+2rnpscPqc5fp104/qdqF8x6LqDjxauGt
 3Yw934Z8mDX3QmhBb4mopnokFI97vzquXHup/uP7TJwrJvntHF1Zveo48WhygRHUGBsfzhdGIC
 ipXkTj8xkPTsC/XyGfW+8o2n9gZlhzbDrCSg4gbCYYz8EHAg5cvs6fPdIg/mGMycIwcukHPOqU
 QwsTLaleUhH87CQRGznchgbT
X-SBRS: 5.1
X-MesageID: 64149443
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xRFYU6AF6B/3ghVW/zfkw5YqxClBgxIJ4kV8jS/XYbTApDt2gmRVz
 DBOWW+EPf6NZGHyKot0PdzkoBkBv8OGx95kQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970E47wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/ij+2gux3x
 Oh0q6PgWC0KFILStMYhekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGgG5s15wSRp4yY
 eJeeSNjfhLnSiEVAUw6M64Eg+KxhlzwJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqRavTnxH2hHthITfvhq6As0Ab7KnEv5AM+VFGEvMW/hnOHRe0PO
 mY30AUwgYoO3Rn+JjXiZCGQrHmBtx8aftNfFewm9Q2AopbpDxal6nssFWAYNoF/3CMibXlzj
 wLSwYu1bdB6mODNERqgGqGoQSRe0MT/BUsLfmc6QAQM+LEPS6lj30uUHr6P/ENY5+AZ+A0cI
 RjX9kDSZJ1J1KbnMplXGnid3VqRSmDhFFJd2+kudjvNAvlFTICkfZe0zlPQ8OxNKo2UJnHY4
 iRYxJjOsb1WVMrX/MBofAnqNOv3j8tpzRWG2QI/d3Xf32jFF4GfkXB4v2gleRYB3jcscj71e
 k7D0T69F7cIVEZGmZRfOtrrY+xzlPCIPY28Cpj8M4ofCrAsJVTv1Hw/OiatM5XFzRFEfVcXY
 szAL65BzB8yVMxa8dZBb7lBgOF7nnhknQs+h/nTlnya7FZXX1bNIZ9tDbdERrpRAHqsrFqH/
 tBBGdGNzhkDAuTybjOOqdwYLEwQLGh9Dpfz8pQFeumGKwtgOWcgF/6Onu9xJ907x/xYxrXS4
 3Wwek5E016j13fJHhqHNyJ4Y7T1UJch8X9iZX4wPUyl0mQIaJq06PtNbIM+eLQqrbQxzfN9Q
 /QfVd+HB/BDFmbO9zgHNMGvp41+bhW7wwmJOnP9MjQ4epdhQS3P+8PlIVSzpHVfUHLvuJJn8
 bO61w7dTZ4SfChYDZ7bOKC10le8nXkBg+YuDUHGFcZeJRf3+49wJi2v0vJue5MQKQ/Ozyex3
 hqNBUtKvvHEpoI4/YWbha2AqIv1QeJyElADQjve5LeycyLb4nCi0clLV+PRJWLRU2b9+aODY
 +RJzq6jbK1bzQgS64csQax2ya8e5sf0o+4IxwtpK3zHclC3B+4yOXKBx8RO6vVAy7IxVdFag
 a5TFg224Ym0Bf4=
IronPort-HdrOrdr: A9a23:L+G3FKo5CUa6ZuEaM7ntZhsaV5opeYIsimQD101hICG8cqSj+f
 xG/c5rrCMc5wxwZJhNo7y90ey7MBbhHP1OkO8s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpM
 BdmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149443"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 54/70] x86/dpci: CFI hardening
Date: Mon, 14 Feb 2022 12:51:11 +0000
Message-ID: <20220214125127.17985-55-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hvm/hvm.c                | 4 ++--
 xen/drivers/passthrough/vtd/x86/hvm.c | 4 ++--
 xen/drivers/passthrough/x86/hvm.c     | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4cf313a0ad0a..cdd1529014f2 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -474,8 +474,8 @@ void hvm_migrate_pirq(struct hvm_pirq_dpci *pirq_dpci, const struct vcpu *v)
     }
 }
 
-static int migrate_pirq(struct domain *d, struct hvm_pirq_dpci *pirq_dpci,
-                        void *arg)
+static int cf_check migrate_pirq(
+    struct domain *d, struct hvm_pirq_dpci *pirq_dpci, void *arg)
 {
     hvm_migrate_pirq(pirq_dpci, arg);
 
diff --git a/xen/drivers/passthrough/vtd/x86/hvm.c b/xen/drivers/passthrough/vtd/x86/hvm.c
index b531fe907a94..132d252d1cca 100644
--- a/xen/drivers/passthrough/vtd/x86/hvm.c
+++ b/xen/drivers/passthrough/vtd/x86/hvm.c
@@ -21,8 +21,8 @@
 #include <xen/irq.h>
 #include <xen/sched.h>
 
-static int _hvm_dpci_isairq_eoi(struct domain *d,
-                                struct hvm_pirq_dpci *pirq_dpci, void *arg)
+static int cf_check _hvm_dpci_isairq_eoi(
+    struct domain *d, struct hvm_pirq_dpci *pirq_dpci, void *arg)
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
     unsigned int isairq = (long)arg;
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 0e3c0f6aeed3..0f94203af817 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -777,8 +777,8 @@ static void __msi_pirq_eoi(struct hvm_pirq_dpci *pirq_dpci)
     }
 }
 
-static int _hvm_dpci_msi_eoi(struct domain *d,
-                             struct hvm_pirq_dpci *pirq_dpci, void *arg)
+static int cf_check _hvm_dpci_msi_eoi(
+    struct domain *d, struct hvm_pirq_dpci *pirq_dpci, void *arg)
 {
     int vector = (long)arg;
 
@@ -947,8 +947,8 @@ void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi)
     spin_unlock(&d->event_lock);
 }
 
-static int pci_clean_dpci_irq(struct domain *d,
-                              struct hvm_pirq_dpci *pirq_dpci, void *arg)
+static int cf_check pci_clean_dpci_irq(
+    struct domain *d, struct hvm_pirq_dpci *pirq_dpci, void *arg)
 {
     struct dev_intx_gsi_link *digl, *tmp;
 
-- 
2.11.0


