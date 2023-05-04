Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E162D6F733C
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530038.825264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueng-0006Gd-En; Thu, 04 May 2023 19:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530038.825264; Thu, 04 May 2023 19:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueng-0006CW-BN; Thu, 04 May 2023 19:39:36 +0000
Received: by outflank-mailman (input) for mailman id 530038;
 Thu, 04 May 2023 19:39:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puenf-00069l-6I
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:39:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6293b883-eab3-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 21:39:31 +0200 (CEST)
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
X-Inumbo-ID: 6293b883-eab3-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683229173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kA0CoCvs9w9UnA8Cp8g4Yf97SdqOL/znbdWvnuGRE/s=;
  b=GnQ7M7m/PYMymFfO92HSaHE497UtluP5svWs9DlZzqe7Qz4/NVEZ7yFc
   SNOwy88h+tzBRKikEIvgkNjKm9UEk0eIk7+2rXO97u1XLaT3gqEQF36Fo
   bYC46F7kTGjUkJYhBvFbdGT99CB0NmFLcm6u4YIde+YxlJuoau2r/cfvb
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107931606
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6OvrB6+gnEOK1t08d7VHDrUD0H6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2QdD2+COPzcZmShc9p+PY3n9k9SupGDz4MwHgVl+yw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKgX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkTs
 thJBmEQXyqv3fOTwLyxYfZRvN0aeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxhnJ/
 TuYpzqR7hcyK5/HmAS1rC6WgLXQvgb0Q9o/G+aB+as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0ZjZLO7RkskfXkPOSulvHQDFeFVatdeDKqudrAhh7+
 A6UrunFXy1KsLOfYm2gzK6t+Gba1TcuEYMSWcMVZVJbs4K7+dtj0U2nosVLS/Ds0ICscd3k6
 3XT9XVl2e1O5SIe///jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTns5LEhAz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Au2skehswY55fJlcFh
 XPuVf55vscPbBNGk4cuC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6wc2aXmbJhzqFuBF1wckC1
 WKzLZ7E4YAyVf42k1Jbho41jdcW+8zJ7TmOHs6mlU78ieX2ibz8Ye5tDWZip9sRtMusyDg5O
 f4GXydW432ziNHDXxQ=
IronPort-HdrOrdr: A9a23:n00BHKOCaufrE8BcThWjsMiBIKoaSvp037BL7TEVdfUxSKGlfq
 +V88jzuSWbtN9pYgBFpTnYAtjmfZq+z+8W3WByB9uftWDd0QPDEGgF1+rfKlXbcBEWndQttp
 uIHZIfNDUlZWIK9PoT/2GDYqkdKMjuytHPuQ/Bp00dNT2CYZsQkzuQV26gYzZLrBEvP+tCKH
 KGjvA32gadRQ==
X-Talos-CUID: 9a23:+Jhv3GwLDU6bHbvpqSYMBgVJXeR0XCzA/U38eV6dCWhjY6Koc0aprfY=
X-Talos-MUID: 9a23:gY02lgpSBOzTJi5FAIAezy4hbJZW0/ryMkZXjrYjtNLcGCMrAjjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,250,1677560400"; 
   d="scan'208";a="107931606"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 6/6] DO NOT APPLY: Example breakage
Date: Thu, 4 May 2023 20:39:24 +0100
Message-ID: <20230504193924.3305496-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Prior to disentangling X86_NR_FEAT from FEATURESET_NR_ENTRIES, GCC 12
correctly notices:

  lib/x86/cpuid.c: In function 'x86_cpu_policy_to_featureset':
  lib/x86/cpuid.c:82:7: error: array subscript 16 is outside array bounds of 'uint32_t[16]' {aka 'unsigned int[16]'} [-Werror=array-bounds=]
     82 |     fs[FEATURESET_7a2]       = p->feat._7a2;
        |     ~~^~~~~~~~~~~~~~~~
  lib/x86/cpuid.c:64:42: note: at offset 64 into object 'fs' of size [0, 64]

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/include/xen/lib/x86/cpu-policy.h   | 6 +++++-
 xen/include/xen/lib/x86/cpuid-consts.h | 2 ++
 xen/lib/x86/cpuid.c                    | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 01431de056c8..164b3f4aac13 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -192,7 +192,11 @@ struct cpu_policy
             };
 
             /* Subleaf 2. */
-            uint32_t /* a */:32, /* b */:32, /* c */:32;
+            union {
+                uint32_t _7a2;
+                struct { DECL_BITFIELD(7a2); };
+            };
+            uint32_t /* b */:32, /* c */:32;
             union {
                 uint32_t _7d2;
                 struct { DECL_BITFIELD(7d2); };
diff --git a/xen/include/xen/lib/x86/cpuid-consts.h b/xen/include/xen/lib/x86/cpuid-consts.h
index 9fe931b8e31f..5dd9727fec79 100644
--- a/xen/include/xen/lib/x86/cpuid-consts.h
+++ b/xen/include/xen/lib/x86/cpuid-consts.h
@@ -20,8 +20,10 @@
 #define FEATURESET_7d2   13 /* 0x00000007:2.edx    */
 #define FEATURESET_7c1   14 /* 0x00000007:1.ecx    */
 #define FEATURESET_7d1   15 /* 0x00000007:1.edx    */
+#define FEATURESET_7a2   16
 
 #define X86_NR_FEAT (FEATURESET_7d1 + 1)
+//#define X86_NR_FEAT (FEATURESET_7a2 + 1)
 
 #endif /* !XEN_LIB_X86_CONSTS_H */
 
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 76f26e92af8d..90bc82a18c30 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -79,6 +79,7 @@ void x86_cpu_policy_to_featureset(
     fs[FEATURESET_7d2]       = p->feat._7d2;
     fs[FEATURESET_7c1]       = p->feat._7c1;
     fs[FEATURESET_7d1]       = p->feat._7d1;
+    fs[FEATURESET_7a2]       = p->feat._7a2;
 }
 
 void x86_cpu_featureset_to_policy(
@@ -100,6 +101,7 @@ void x86_cpu_featureset_to_policy(
     p->feat._7d2             = fs[FEATURESET_7d2];
     p->feat._7c1             = fs[FEATURESET_7c1];
     p->feat._7d1             = fs[FEATURESET_7d1];
+    p->feat._7a2             = fs[FEATURESET_7a2];
 }
 
 void x86_cpu_policy_recalc_synth(struct cpu_policy *p)
-- 
2.30.2


