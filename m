Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8B2C11A74
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 23:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151822.1482385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVWg-0001bE-AZ; Mon, 27 Oct 2025 22:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151822.1482385; Mon, 27 Oct 2025 22:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVWg-0001Yh-3z; Mon, 27 Oct 2025 22:17:18 +0000
Received: by outflank-mailman (input) for mailman id 1151822;
 Mon, 27 Oct 2025 22:17:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuhB=5E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vDVWe-0001Ic-2t
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 22:17:16 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af63349d-b382-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 23:17:12 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-475dd559b0bso35682225e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 15:17:12 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475de57b156sm148785595e9.13.2025.10.27.15.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 15:17:09 -0700 (PDT)
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
X-Inumbo-ID: af63349d-b382-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1761603431; x=1762208231; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNz4mTVPNtxMeu9h+MQKuVgbkjzrYqhNFMRtL45ybUE=;
        b=EzZ/IplBfs+S06Mcxkm8CUNukif5XjUgmqpqCSIbR6KM64uiejbV3iONDGp7ZE4al/
         Kf/Z2NsOZKqnQ22AimdezH2EcyMj7xETKZmf3D4GRy2dFRXka6hU/ITrWBZI0HofeJsz
         4hdohd3qU/3kJldB+0TvMKuN0ySWoCTkrGYbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603431; x=1762208231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNz4mTVPNtxMeu9h+MQKuVgbkjzrYqhNFMRtL45ybUE=;
        b=gUSISlBB64r66R2amGAvilWptJV7AsOHTkpo8P1qsiovqDdRlE2gNqbP7CHcC0/BZx
         SnmoD0K8FNkz+rtXTwLdMgUukuKTGDMhO2SS7jPg5h+wzUbjRb2ukCmul4d7XB1SZCVl
         coJjaJ80w5qX59qg6sZkXHwhZ9+N6EXqNKpkzMzW/jTbeTMw2cByiewDP20awJ3poPHr
         uvXtCT4Wy/kksmfArHABO0jSdWc+wFfD/Y+64o3abv51RoR4LvVyGEGBFVGJ2Gn+EaUT
         0aepmG0oeZ8RShwzV6iOAgVN+ajwdz4IbxrixT2axiBEIhKYmSrJ06Aad5RgmuWi/g9R
         8OYg==
X-Gm-Message-State: AOJu0Ywq72Abyp1M1TdEvKiSiccH32roWWo1VnCXdUGmKtZFQIv77FWC
	uuJIkSRrRuVJdirlz9HNMtxtftMqb6/G1JSoi/BHfOGjDR3xjMTwHCe4hXvgTqhH48x0UXvJy1O
	GBI1dJS4/QHm5
X-Gm-Gg: ASbGncvOBZv+09wi8HOh18uxvSua7RbkNeNWDjSaAR2taspIpq/a/4Y/ksSX+B8whZd
	A2cPpy0TEpWx63pradUMmPeHvEC4fp9GrSZaZ9Lrvyj5o3RTVgALXKh0Na4Pyky3G4LatI5aS0A
	7siJhePefiQ3H9amXeV8pP9oJ7+eO8wp8XBPXUIBnpAEUfhxwHQftO5o4wFTm0kgFBoclYWCByo
	Hw124vvpADDIRFe5S4ewd8K9bUsSaAhpv/2GTaeQYSeJCragZIryIOhsHJPArbJE3+fJiFb//fW
	H9Ftehi+1aPFibrI13etWX5k1fxGYgQzdQRsxKO0eGEdFgFQQ/ed6WYlnQOlZtwAFhqfUrAdKPi
	IXgCQoGoWNEYrOFTt6TEh73Zel+C57asjjVoAWGt/O9jeeGxFt9vLtm6DueD+yLWbOZbMriftYl
	gxJN+KPjXN4veT7qQ/VrtrJlP5jBaPOKhEDwJFdh8P1Gv9dhUSzS6kQZU/lc82+g==
X-Google-Smtp-Source: AGHT+IH/DIdh+PJiHb4lt6fnHrJVdN/PpWd9oX/VV/PE/2u9n1h5QgzTgy0tK90sNVA1XPAvyp5BfA==
X-Received: by 2002:a05:600c:46d1:b0:471:115e:624b with SMTP id 5b1f17b1804b1-47717e0aa7fmr10080035e9.17.1761603431129;
        Mon, 27 Oct 2025 15:17:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/5] x86/ucode: Refine TLB flush fix for AMD Fam17h CPUs
Date: Mon, 27 Oct 2025 22:16:59 +0000
Message-Id: <20251027221702.3362552-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
References: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Keep memory clobber.
---
 xen/arch/x86/cpu/microcode/amd.c    | 14 +++++++++++---
 xen/arch/x86/flushtlb.c             |  3 +--
 xen/arch/x86/include/asm/flushtlb.h |  5 +++++
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 59332da2b827..457810182480 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -306,10 +306,18 @@ static int cf_check apply_microcode(const struct microcode_patch *patch,
     sig->rev = rev;
 
     /*
-     * Some processors leave the ucode blob mapping as UC after the update.
-     * Flush the mapping to regain normal cacheability.
+     * Fam17h processors leave the mapping of the ucode as UC after the
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
index 019d886f2b80..7bcbca2b7f31 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -98,6 +98,11 @@ static inline unsigned long read_cr3(void)
     return cr3;
 }
 
+static inline void invlpg(const void *p)
+{
+    asm volatile ( "invlpg %0" :: "m" (*(const char *)p) : "memory" );
+}
+
 /* Write pagetable base and implicitly tick the tlbflush clock. */
 void switch_cr3_cr4(unsigned long cr3, unsigned long cr4);
 
-- 
2.39.5


