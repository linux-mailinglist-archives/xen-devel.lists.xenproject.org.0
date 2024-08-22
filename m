Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0051795C145
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 01:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782005.1191503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtD-0005n2-Jh; Thu, 22 Aug 2024 23:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782005.1191503; Thu, 22 Aug 2024 23:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtD-0005lB-Ga; Thu, 22 Aug 2024 23:06:47 +0000
Received: by outflank-mailman (input) for mailman id 782005;
 Thu, 22 Aug 2024 23:06:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gAWf=PV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shGtB-00052v-Ke
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 23:06:45 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32d8ce17-60db-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 01:06:44 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a86859e2fc0so173830866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 16:06:44 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f21ff19sm174676866b.39.2024.08.22.16.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 16:06:41 -0700 (PDT)
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
X-Inumbo-ID: 32d8ce17-60db-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724368003; x=1724972803; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpnZe/6Rj0UVvPnf3275lXIauGqfUzo8Cf5z0ZU/Amw=;
        b=UwyaKJRH3kF5sHar/blpSxBxoVNxI/Rkn2BFwDCychf+aFhnx/gn93XE6H1koH6MWN
         jjro5GCzGAHmhMLdQkDhP9aY0Uz+XL4JFLI35vU6SfzA24va9rwNAHkZoEck2kwXmjEF
         QYnbiL0MKWwUdtd1ZprAdKt7ss9dT5HKiRA5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724368003; x=1724972803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpnZe/6Rj0UVvPnf3275lXIauGqfUzo8Cf5z0ZU/Amw=;
        b=gLe6sPkY66BagCVL4SSZlewQ1KSoBUauQwZCkeN0/gwFSTAFYKYPhZi5MkWozhWmDJ
         nh7CLAxoY0n8TxJ+gE/D1jl6QuaOkrJJDXaUGHHVhUQANSzLiMyRXLPj2amcupMWMK++
         qgxlZM5qegMVWAzY0Chn0cJtJPqytEty9pGzWgpVQ7cOEUA6UI5kLODvXjHoJDQmBAQl
         t5N2V151X79kgePoDhP9Dtyznd4QgJxc+c3Y+hWnxDwiukn06cg0fGFMFOnYm+hbSB12
         KXJi3hrVhHy5PPKmmGakrFDHwTGgHFzY9oo88rLgt6qCLAfT5meq2QR0dDS6f3JiWWRx
         e7iQ==
X-Gm-Message-State: AOJu0Yx3Tl7BIKq6xZnaieqHH8tlTGUlHrUfBep4xkFWDYaT+21SZrAs
	T27pMQaE+VEppPe13neT7/ee+dBBx14d4cVpIxtWKTUAipFce4iDn5rtJsVqwqgnnpO3aohrJl5
	9
X-Google-Smtp-Source: AGHT+IH6ftjYtMlhJLqOnuqIi9pKaUpCeM5Mae1UDb83A9+Z2/FTPNORDiie+hP4NqFf7A9vDzPXAg==
X-Received: by 2002:a17:907:940a:b0:a86:9f56:21e6 with SMTP id a640c23a62f3a-a86a53005e7mr14271566b.33.1724368002530;
        Thu, 22 Aug 2024 16:06:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 3/9] xen/bitops: Convert 'hweight(x) > 1' to new multiple_bits_set()
Date: Fri, 23 Aug 2024 00:06:29 +0100
Message-Id: <20240822230635.954557-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822230635.954557-1-andrew.cooper3@citrix.com>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
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
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

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


