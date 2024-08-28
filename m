Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F603963461
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 00:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785169.1194625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlq-0007XM-Qm; Wed, 28 Aug 2024 22:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785169.1194625; Wed, 28 Aug 2024 22:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlq-0007Tu-Iv; Wed, 28 Aug 2024 22:04:06 +0000
Received: by outflank-mailman (input) for mailman id 785169;
 Wed, 28 Aug 2024 22:04:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjQlp-0006E8-4G
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 22:04:05 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fe06872-6589-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 00:04:03 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso10803030a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 15:04:03 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2d2esm2695898a12.16.2024.08.28.15.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 15:04:00 -0700 (PDT)
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
X-Inumbo-ID: 6fe06872-6589-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724882642; x=1725487442; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXiFJWRq4x5FPe198sZU9vAtmoQscirnVku7zrIp0cM=;
        b=AbMiCzaNw0J+7PjWB8aCJV6Pn2eztdFDTL0VPEFHeN5cmMrJEsdc+h5hCo9J3j1rOU
         IvAtx2Pfn3/TcNM53PABbHTCqlZ6FI0KTNFO7RO2claYanfwzYz2HGPR0rSKWImmuayU
         QyfOQ09YXX9fM6QMEj65IUOlKjD9mRABasOcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882642; x=1725487442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXiFJWRq4x5FPe198sZU9vAtmoQscirnVku7zrIp0cM=;
        b=UcOnKcIAAbA0kM7V+zt05kWYQozjxCHv+lZzliJlSHHAWFfVdb/ZFrF63YS9Ecsjwg
         C1v4FJ2naCpG311WdEn3qrE1kRErfFZTqaa8q6LZnHUWisZm+LrIswq+oqKwF2t5DMMO
         SZMGl922841IXMJuqAXAb8iOvyqsgc4ZfMv/wSJVdg50Qw2kk8ZysaIsj/AnpL8Uq6BQ
         UQXg4cH9/PeR0UUmhIVeA9a/vrlo6WWWkMUPnGcC4rTOYxCeOoCVjwLCw5GlWECaUVdL
         yNkCUULjPt7wMgJlkquYwdidMd0tELav56BCX+E4v7KqvnFeqPP1MvPogyJahzfeJ6u3
         450w==
X-Gm-Message-State: AOJu0YwaG8sQ8wbbucrUDitjyK9A3vGdTs6ed8llZYU6BiRsTvpU4Gkf
	jwQoz1dBu7Cx5EMrqsUHr5Fny2uDOpkhlNhqpLTxc3jSh8/smI7ugECp59pigKG+ny5x+Zgoskj
	f
X-Google-Smtp-Source: AGHT+IEvBWczXJywqu93GhfTA0hun1Xm5VwCqG1AFE2wyPe5kLOh7xiV1ipXRad4bLf+4WSvk1yCJw==
X-Received: by 2002:a05:6402:40c4:b0:5be:fbce:939e with SMTP id 4fb4d7f45d1cf-5c21ec5b94dmr882236a12.0.1724882641403;
        Wed, 28 Aug 2024 15:04:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 05/11] xen/bitops: Convert 'hweight(x) > 1' to new multiple_bits_set()
Date: Wed, 28 Aug 2024 23:03:45 +0100
Message-Id: <20240828220351.2686408-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Using hweight() is an especially expensive way of determining simply if
multiple bits are set in a value.  Worse, 4 of the 10 hweight() calls in Xen
are of this form.

Switch to the new multiple_bits_set() helper.  This is far more efficient than
the longhand hweight() algorithm and, owing to its simplicity, likely more
efficient than even a dedicated instruction on a superscalar processor.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

For future work, do related work for bitmap_weight() so cpumask_weight() in
particular can stop being used for so many 0/1 special cases.

On x86, the code reduction speaks for itself:

  add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-240 (-240)
  Function                                     old     new   delta
  vlapic_ipi                                   722     650     -72
  numa_emulation                               577     497     -80
  do_xenpmu_op                                1665    1577     -88

That's an aweful lot of wasted calculation for the same answer.

I can't find a way of enabling CONFIG_NUMA on ARM (yet?) so right now there's
no change in any other architecture.  However, a synthetic helper shows the
following on ARM32:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-128 (-128)
  Function                                     old     new   delta
  test_mbs                                     176      48    -128

and on ARM64:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-44 (-44)
  Function                                     old     new   delta
  test_mbs                                      60      16     -44

PPC64 has POPCNTD in a default build of Xen and by chance both algorithms
compile to the same number of instructions.

RISC-V doesn't have hweight() wired up yet at all.
---
 xen/arch/x86/cpu/vpmu.c   |  2 +-
 xen/arch/x86/hvm/vlapic.c | 10 ++++++----
 xen/common/numa.c         |  2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index b2ba9994129b..a5bb1689c7d5 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -673,7 +673,7 @@ long do_xenpmu_op(
     {
         if ( (pmu_params.val &
               ~(XENPMU_MODE_SELF | XENPMU_MODE_HV | XENPMU_MODE_ALL)) ||
-             (hweight64(pmu_params.val) > 1) )
+             multiple_bits_set(pmu_params.val) )
             return -EINVAL;
 
         /* 32-bit dom0 can only sample itself. */
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 2ec95942713e..4a3e21a65f9d 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -467,12 +467,14 @@ static bool is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
         return short_hand != APIC_DEST_SELF;
 
     if ( vlapic_x2apic_mode(vlapic) )
-        return dest_mode ? hweight16(dest) > 1 : dest == 0xffffffffU;
+        return dest_mode ? multiple_bits_set((uint16_t)dest)
+                         : dest == 0xffffffffU;
 
     if ( dest_mode )
-        return hweight8(dest &
-                        GET_xAPIC_DEST_FIELD(vlapic_get_reg(vlapic,
-                                                            APIC_DFR))) > 1;
+    {
+        dest &= GET_xAPIC_DEST_FIELD(vlapic_get_reg(vlapic, APIC_DFR));
+        return multiple_bits_set((uint8_t)dest);
+    }
 
     return dest == 0xff;
 }
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 28a09766fabc..ce3991929ce5 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -546,7 +546,7 @@ static int __init numa_emulation(unsigned long start_pfn,
     uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
 
     /* Kludge needed for the hash function */
-    if ( hweight64(sz) > 1 )
+    if ( multiple_bits_set(sz) )
     {
         uint64_t x = 1;
 
-- 
2.39.2


