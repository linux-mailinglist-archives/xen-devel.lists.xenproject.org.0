Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885106A1EA8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:37:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501218.772869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVa8h-0000RX-22; Fri, 24 Feb 2023 15:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501218.772869; Fri, 24 Feb 2023 15:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVa8g-0000PQ-VX; Fri, 24 Feb 2023 15:37:38 +0000
Received: by outflank-mailman (input) for mailman id 501218;
 Fri, 24 Feb 2023 15:37:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVa8f-0000PI-Ia
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:37:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2848d582-b459-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 16:37:35 +0100 (CET)
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
X-Inumbo-ID: 2848d582-b459-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677253055;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PtAwsUY/Fwt8xIERNpc2GH/6MwL3Unj3xN1X4Ttps6k=;
  b=WOJDa/TObEgn20S0hINervLWlNtXA7PYY122el0ZaPYE3fPAMbRDx8ij
   kiPDflzwP/5Yo1K6IdmCNmA1ppYiN2NfQTjcyVPYIvqcYEAbypzCIO6Wz
   yoRNRsKdkKD89/lh4/+cUF1WbjvFMh0YlgkYQ8mSV+Pr29XYYgpIYGYrU
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100852897
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:whRN5a/Os8hFZoyLythbDrUDHn6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 zcbXm6BaKnfYGChKI92aI7np0hTu8PdytNjHgFkrS08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6oX5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklr9
 eEYFi0iPiq4lsSWm7yQSvJyl94aeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0Mxh7I+
 ziWrjuR7hcyc+WT7QGC/26Xlsjqknr/eZ4iGJrn36s/6LGU7jNKU0BHPbehmtGikVK3Ud9bL
 00S+wItoLI0+UjtScPyNzWzqWSIuRM0UNNKH+o3rgqKz8L85geSBmEACDlbetEinMYzSXoh0
 Vrht9rtBCdzubyPD3yH/7GfrCiaJiQea2QFYEcsXQYDptXuvow3phbOVcp4Vr64iMXvHjP9y
 CzMqzIx750UicMIzKS6u1PamTWnppvOZgEw7wTTGGmi62tRb4mjYYuq5VHF7O1oI4OQT13Ht
 38B8+CU6+oEHJyWlCiARewLNL6s7veBdjbbhDZS84IJrmr3vST5JMYJvW84fR0yWioZRdP3S
 GrTpANv+bADBkC7S48sbamxENo715G1QLwJScvoRtZJZ5FwciqO8ydveVOc0gjRraQ8rU0sE
 czFKJjxVB72HYwilWPrHLlFjdfH0whknQvuqYbHIwNLOFZ0TFqcUv87PVSHdYjVB4vU8VyOo
 76z2yZnoiizsdESgAGNrOb/znhQdxDX4KwaTOQGHtNv2iI8RAkc5wb5mNvNgbBNkaVPjfvv9
 XqgQEJew1eXrSSZdlrTNS85N+6+DccXQZcH0csEZwvA5pTeSdz3sPd3m2UfINHLC9CPPdYrF
 qJYKq1s89xESyjd+iR1UHUOhNUKSfhfvirXZ3DNSGFmL/Zdq/nhpoeMkv3HqHNfUUJadKIW/
 9Wd6+8sacBTF1Q6VJaKOa3HIpHYlSF1pd+elnDgerF7EHgAOqAwQ8Atppfb+/0xFCg=
IronPort-HdrOrdr: A9a23:m5LA5auuSpMoUVZvrDAmdK9/7skCw4Mji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H9BEGBKUmskaKdkrNhQotKPTOW9FdASbsC0WKM+UyZJ8STzJ8+6U
 4kSdkCNDSSNyk0sS+Z2njCLz9I+rDum8rE5Za8854ud3ARV0gK1XYfNu/vKDwOeOAwP+teKH
 Pz3LsjmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlal9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4kow3TX+0aVjbZaKv+/VQMO0aSSAZER4Z
 3xSiIbTodOArXqDyaISFXWqk/dOX0VmgHfIBej8AreSIrCNWsH4w4rv/MDTvMfgHBQ5O2UmZ
 g7rF5wu/dsfGP9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQho+bo7bWvHAbocYa
 FTJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8liIjtYEit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJOmOPJlbsEr0BJhv22tTKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arEsGK1I0jyGG6fIx8Z0Wb9ihz3ekMhlSnfsuYDcSqciFar/ed
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="100852897"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Anthony PERARD <anthony.perard@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] CI: Simplify RISCV smoke testing
Date: Fri, 24 Feb 2023 15:37:21 +0000
Message-ID: <20230224153721.2623760-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use a single fairly generic string as the "all done" message to look for,
which avoids the need to patch qemu-smoke-riscv64.sh each time a new feature
is added.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Connor Davis <connojdavis@gmail.com>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>

I considered "All set up and nowhere to go" but it's probably a little niche.
---
 automation/scripts/qemu-smoke-riscv64.sh | 2 +-
 xen/arch/riscv/setup.c                   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index e0f06360bc43..4008191302f9 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -16,5 +16,5 @@ qemu-system-riscv64 \
     |& tee smoke.serial
 
 set -e
-(grep -q "Hello from C env" smoke.serial) || exit 1
+(grep -q "All set up" smoke.serial) || exit 1
 exit 0
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index d09ffe1454a4..1c87899e8e90 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -11,6 +11,7 @@ void __init noreturn start_xen(void)
 {
     early_printk("Hello from C env\n");
 
+    early_printk("All set up\n");
     for ( ;; )
         asm volatile ("wfi");
 
-- 
2.30.2


