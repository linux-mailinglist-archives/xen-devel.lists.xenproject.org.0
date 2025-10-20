Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDECBF1831
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 15:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146290.1478761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApny-0000Sd-6u; Mon, 20 Oct 2025 13:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146290.1478761; Mon, 20 Oct 2025 13:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApny-0000LA-0n; Mon, 20 Oct 2025 13:20:06 +0000
Received: by outflank-mailman (input) for mailman id 1146290;
 Mon, 20 Oct 2025 13:20:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoK0=45=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vApnw-0007gg-Af
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 13:20:04 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cd5eb4d-adb7-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 15:20:03 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso3095128f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 06:20:03 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c65sm15267835f8f.15.2025.10.20.06.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 06:20:02 -0700 (PDT)
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
X-Inumbo-ID: 7cd5eb4d-adb7-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760966403; x=1761571203; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeBO6Pv9prlvTRwuZU49UrWO/g3oMFaQ1LhxvNL2gBU=;
        b=JCx4pfdwZTklG1nV4tY140Ezy7iRgqXIQvo4/n68vLPqz3DSbzkUVNrR3r1NYVRuxm
         LYoKRdWH2XwWL0OHz9v6NziItdQ8dXnGioL96pvR8c11RKPu3NLbStXE1pp8EUaxh4G5
         pYTs5FbrxJL0U1ELuJDYNEd0F+RVCGpePdb3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760966403; x=1761571203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeBO6Pv9prlvTRwuZU49UrWO/g3oMFaQ1LhxvNL2gBU=;
        b=kOLO8Ag49DcpXMHJjPEqkojMAlwzgiR4FVayQsMGk5aPbPYZeH/A+vTV0icFyBADqj
         DeXG0W3pLz61aB9ovurRHh2KxbagI/UeLSXrXbjuE3VmLuLJiAtC9kRQZnfy16ruFelO
         5dI96rHVRmqMMAI2CrIOSLHBwae5OvTDAi2REgiKCrHWmQ53lkXQsEmIEYtAgnkPWa7S
         YlC9U3Zw9PZgY9TqNYnfcYNWp9rLLARK5RIv9NoqavPV5mRWgtRycKqrXg/1WWKSea74
         OIBIVMQWuga1uhYf+GDD6FaViWB7Bgb2gb+A1+0RFBn4dwaJp4H2brUugSP84xy/DdG5
         k/pw==
X-Gm-Message-State: AOJu0Yxlg8+c7l4WbIXk6RawUtBM6/IX0TCWC7VNKrEQJi80H2xfNEDR
	lRtRJ+a4I+5twD7AbQAUwCqGqrP/5KPfpaeRz6yavFmcAUFMkuoUtR7VFH8AdiC+DVk7neU01jp
	QPq84j5z2Xm6N
X-Gm-Gg: ASbGncsios4qcxbveR5rfgx0XQ3KamZPty1Z+x72FV6yxfv/tqOJh8z3jEezg3Dj57R
	/sAVlIq4cnVCzT7WkbyGZjkhX0tLGbcZIsCKwR5zi/UBbjqRMMq+XAjozF/Yz0PXRAxghcW4GFj
	a3ynnhAhn33/9VTzXmjZ3iwx5AngXPCMu/Ouwl/ponI/gNQ8QJsREMtsDMOxa9BkBx4Q3y9lGbg
	KPpN3pDOgYP10UzgtR+VvriZrzcbYRvY5T4tDuSWV7MRjCOuokoPmQ0ugu+K8nNklcMZzh/vDQS
	VnQItUs/9vq7y0bdM8U9PHpP2r0ZVilK9thEK9IlRQyxgOUWfOPhomGlollaE21eBSS1C9bQ5mR
	h/o+PrZQSRLfA982tFFKfWtYMP2jqnlRjB4ZGnQpgcfUUmgC/jfhvMi78mxhZR/iwRbM5qYqpno
	pY2SUsFchlHCs0bEjylHjNg5w6NAIckMiKxghsqCtRCSaZX68gp+Oee4+xBURz5KDpWuyMZnC9
X-Google-Smtp-Source: AGHT+IER6ICzkL2n8lei/6i4csotkzlCDa/kIlpUSGfsF3aRvPi4qahkAO0j7r/zmP4iNSUNmJjvPQ==
X-Received: by 2002:a05:6000:2308:b0:426:da92:d39d with SMTP id ffacd0b85a97d-42704beea3fmr9649737f8f.24.1760966402605;
        Mon, 20 Oct 2025 06:20:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/5] x86/ucode: Refine TLB flush fix for AMD Fam17h CPUs
Date: Mon, 20 Oct 2025 14:19:53 +0100
Message-Id: <20251020131955.2928261-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In the time since Xen discovered this, Linux stubled on it too and AMD
produced a narrower fix, limited to Fam17h CPUs only.  To my knowledge,
there's no erratum or other public statement from AMD on the matter.

Adjust Xen to match the narrower fix.

Link: https://lore.kernel.org/lkml/ZyulbYuvrkshfsd2@antipodes/T/#u
Fixes: f19a199281a2 ("x86/AMD: flush TLB after ucode update")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

There is a difference in memory clobber with the invlpg() wrapper.
apply_microcode() specifically does not want a memory clobber, whereas
flush_area_local() doesn't need it as far as I can tell (there's nothing
unsafe to move across this instruction).
---
 xen/arch/x86/cpu/microcode/amd.c    | 14 +++++++++++---
 xen/arch/x86/flushtlb.c             |  3 +--
 xen/arch/x86/include/asm/flushtlb.h |  5 +++++
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 59332da2b827..7ff702c06caf 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -306,10 +306,18 @@ static int cf_check apply_microcode(const struct microcode_patch *patch,
     sig->rev = rev;
 
     /*
-     * Some processors leave the ucode blob mapping as UC after the update.
-     * Flush the mapping to regain normal cacheability.
+     * Family 0x17 processors leave the mapping of the ucode as UC after the
+     * update.  Flush the mapping to regain normal cacheability.
+     *
+     * We do not know the granularity of mapping, and at 3200 bytes in size
+     * there is a good chance of crossing a 4k page boundary.  Shoot-down the
+     * start and end just to be safe.
      */
-    flush_area_local(patch, FLUSH_TLB_GLOBAL | FLUSH_ORDER(0));
+    if ( boot_cpu_data.family == 0x17 )
+    {
+        invlpg(patch);
+        invlpg((const void *)patch + F17H_MPB_MAX_SIZE - 1);
+    }
 
     /* check current patch id and patch's id for match */
     if ( hw_err || (rev != patch->patch_id) )
diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 94b2a30e8d30..09e676c151fa 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -222,8 +222,7 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
                 }
             }
             else
-                asm volatile ( "invlpg %0"
-                               : : "m" (*(const char *)(va)) : "memory" );
+                invlpg(va);
         }
         else
             do_tlb_flush();
diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index 019d886f2b80..37bc203652b3 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -98,6 +98,11 @@ static inline unsigned long read_cr3(void)
     return cr3;
 }
 
+static inline void invlpg(const void *p)
+{
+    asm volatile ( "invlpg %0" :: "m" (*(const char *)p) );
+}
+
 /* Write pagetable base and implicitly tick the tlbflush clock. */
 void switch_cr3_cr4(unsigned long cr3, unsigned long cr4);
 
-- 
2.39.5


