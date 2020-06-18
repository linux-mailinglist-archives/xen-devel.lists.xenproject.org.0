Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F051FF929
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 18:24:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlxK8-0005t3-IX; Thu, 18 Jun 2020 16:23:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nSvJ=77=cert.pl=hubert.jasudowicz@srs-us1.protection.inumbo.net>)
 id 1jlxK7-0005sy-7f
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 16:23:31 +0000
X-Inumbo-ID: 0b74dd34-b180-11ea-babb-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b74dd34-b180-11ea-babb-12813bfff9fa;
 Thu, 18 Jun 2020 16:23:30 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 08509A31E1;
 Thu, 18 Jun 2020 18:23:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id F2373A1E22;
 Thu, 18 Jun 2020 18:23:27 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id t_SUwrxZQpDC; Thu, 18 Jun 2020 18:23:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 8D2BCA31E1;
 Thu, 18 Jun 2020 18:23:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ykPHM6-kYoqo; Thu, 18 Jun 2020 18:23:27 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 6BE59A1E22;
 Thu, 18 Jun 2020 18:23:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 5BF4D20981;
 Thu, 18 Jun 2020 18:22:57 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bHSnnSqrvzd7; Thu, 18 Jun 2020 18:22:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id EDE8821698;
 Thu, 18 Jun 2020 18:22:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4TBmn3T2BaKb; Thu, 18 Jun 2020 18:22:51 +0200 (CEST)
Received: from arnold.localdomain (unknown [195.187.238.48])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 7D5EF20981;
 Thu, 18 Jun 2020 18:22:51 +0200 (CEST)
From: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] x86/cpuid: Expose number of vCPUs in CPUID.1.EBX
Date: Thu, 18 Jun 2020 18:22:33 +0200
Message-Id: <f9c2583332d83fe76c3d98e215c76b7b111650e3.1592496443.git.hubert.jasudowicz@cert.pl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When running under KVM (or presumably other hypervisors) we enable
the CPUID.1.EDX.HTT flag, thus indicating validity of CPUID.1.EBX[23:16]
- maximum number of logical processors which the guest reads as 0.

Although this method of topology detection is considered legacy,
Windows falls back to it when CPUID.0BH.EBX is 0.

CPUID.1.EBX[23:16] being equal to 0, triggers memory corruption in
ntoskrnl.exe as Windows assumes that number of logical processors would
be at least 1. Memory corruption manifests itself while mapping
framebuffer for early graphical subsystem, causing BSOD.

This patch fixes running nested Windows (tested on 7 and 10) with KVM as
L0 hypervisor, by setting the value to maximum number of vCPUs in domain.

Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
---
 xen/arch/x86/cpuid.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index ee11087626..bf38398ef3 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -811,10 +811,12 @@ void guest_cpuid(const struct vcpu *v, uint32_t lea=
f,
=20
     case 0x1:
         /* TODO: Rework topology logic. */
-        res->b &=3D 0x00ffffffu;
+        res->b &=3D 0x0000ffffu;
         if ( is_hvm_domain(d) )
             res->b |=3D (v->vcpu_id * 2) << 24;
=20
+        res->b |=3D (d->max_vcpus & 0xff) << 16;
+
         /* TODO: Rework vPMU control in terms of toolstack choices. */
         if ( vpmu_available(v) &&
              vpmu_is_set(vcpu_vpmu(v), VPMU_CPU_HAS_DS) )
--=20
2.27.0


