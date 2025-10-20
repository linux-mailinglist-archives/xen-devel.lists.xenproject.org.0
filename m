Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B32BF1828
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 15:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146291.1478770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApnz-0000p0-HD; Mon, 20 Oct 2025 13:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146291.1478770; Mon, 20 Oct 2025 13:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApnz-0000my-DA; Mon, 20 Oct 2025 13:20:07 +0000
Received: by outflank-mailman (input) for mailman id 1146291;
 Mon, 20 Oct 2025 13:20:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoK0=45=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vApnx-0007gg-Aj
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 13:20:05 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d75b6b2-adb7-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 15:20:04 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso4394940f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 06:20:04 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c65sm15267835f8f.15.2025.10.20.06.20.02
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
X-Inumbo-ID: 7d75b6b2-adb7-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760966404; x=1761571204; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiMBgNSpV6Z/AQuEKw3FQ4WzlNp/3uFz69n7J0JInTY=;
        b=QJN7loJ7PmgaxCuuwvcAYIuFXC3XXrCdVm10nNt5MhH27fpjdEZAJRH72PfzCyPgV3
         dTZSQRL5FJcZHAtRNyuxn5R99rS2qQjmZ1dE5s5JLUA0MjCvtRVgHsM1kxJXw9CB5Soh
         1F0PAfWG9iEOcGGvFgRIOakz9asEjmekmLZ3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760966404; x=1761571204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiMBgNSpV6Z/AQuEKw3FQ4WzlNp/3uFz69n7J0JInTY=;
        b=BvPovgGbtyRUVfXT3Fl58hiuDX+DqQcTYz5NbylMHCqqDV7DiRjDKx7V4yQu0mgLmO
         RAAM0JN9sStkGArglXf9JmxBzuGsoqe7aIxpfo0UMue7rdJe6iQuTf3CHw9Rhi7JLB3B
         zBF0yXXwMMkXlq9Tx9ElGTqt4aNwcMd7YViCgQRLNjAQQDE7hQZk74ArFD0JcBVqzA+z
         Hg0OBTOiPsuDyTdYnTPIgO7vlFWSIBsequ/VQvnPd7+CvzQSgI0N7TO4uv8BFhM2QZk5
         B/llFrzeCa0YPQE42aIkBjuTFq1nXXrnQ1MFzDZVJX1Pdta+8f6oVEM4Q3fJzvEJmj6a
         Kp4w==
X-Gm-Message-State: AOJu0Yx4D//57yw6UNhzP+cqY8fXRP8Cb6UQB+0944cSDUYXS0kxEaKs
	x5rT7il3eRbPMAjHoFv8rpT7n078YuM4Px4tMFZ5mMUR1iWLvTXlaGUakR0t4aBRiG0AkbK7N+3
	AJAkig4fwWA==
X-Gm-Gg: ASbGncvLRmoa8ZYn2VlNXyqb8JBmweiP/DgSD84d4eD+mtPsXEOxLao6A8PSiy3PsPQ
	9eOdudaFZJ6LokWOZwtK6eAKtE/rbcDwBioYhw6KHpRDBePCbyxl92Gx0Mr8lFB0KhP7G7YhyL9
	xwiD1FWorb1xk0k37z1K4wGAj1pvZPN9tdxdjghrUFLHSFxcNJWLpB+ESo/NtuGSxP17hqP1U1j
	lAN7Zh7jI81RudokJ4/khCIjx7okKJb15yy8YEHsi7UnP3/0qJwjIyDOz4gnZqIIBhrEIqRrh0d
	cB+OCdpbamYMQkODLF4pAYRDAyRGQfGTMXnkpNQFmnGpw+dFBvY7r8X9yuA2M0y8JoFW7lynsqE
	7qbjRSU2fHXdR7TghicyFbJb5s57voMBodb+JERiL494CiWA22+nDZqYWh929lLy1NR98gXXC4s
	Yy3i0WWhijD6OsC9Tlp8ngO9vfMEWx9mf5//trEnXp3VnylEBKBC85tZxPdMON0w==
X-Google-Smtp-Source: AGHT+IH3MbQNWKdt1hTlmBLRBjbMqSexQnDeS9k5yRzFvZq0vyl2IymUVAu6WK/5tEVjbQgkznVQTQ==
X-Received: by 2002:a05:6000:1ac5:b0:3ee:141a:ede5 with SMTP id ffacd0b85a97d-42704dc6d3cmr7956436f8f.57.1760966403591;
        Mon, 20 Oct 2025 06:20:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/5] x86/ucode: Cross check the minimum revision
Date: Mon, 20 Oct 2025 14:19:54 +0100
Message-Id: <20251020131955.2928261-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For Zen3-5 microcode blobs signed with the updated signature scheme, the
checksum field has been reused to be a min_revision field, referring to the
microcode revision which fixed Entrysign (SB-7033, CVE-2024-36347).

Cross-check this when trying to load microcode, but allow --force to override
it.  If the signature scheme is genuinely different, a #GP will occur.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 48 +++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 7ff702c06caf..30bddc89da0a 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -42,7 +42,10 @@ struct microcode_patch {
     uint8_t  mc_patch_data_id[2];
     uint8_t  mc_patch_data_len;
     uint8_t  init_flag;
-    uint32_t mc_patch_data_checksum;
+    union {
+        uint32_t checksum; /* Fam12h and earlier */
+        uint32_t min_rev;  /* Zen3-5, post Entrysign */
+    };
     uint32_t nb_dev_id;
     uint32_t sb_dev_id;
     uint16_t processor_rev_id;
@@ -270,6 +273,41 @@ static int cf_check amd_compare(
     return compare_revisions(old->patch_id, new->patch_id);
 }
 
+/*
+ * Check whether this patch has a minimum revision given, and whether the
+ * condition is satisfied.
+ *
+ * In linux-firmware, blobs signed with the updated signature algorithm have
+ * reused the checksum field as a min-revision field.  From public archives,
+ * the checksum field appears to have been unused since Fam12h.
+ *
+ * Returns false if there is a min revision given, and it suggests that that
+ * the patch cannot be loaded on the current system.  True otherwise.
+ */
+static bool check_min_rev(const struct microcode_patch *patch)
+{
+    ASSERT(microcode_fits_cpu(patch));
+
+    if ( patch->processor_rev_id < 0xa000 || /* pre Zen3? */
+         patch->min_rev == 0 )               /* No min rev specified */
+        return true;
+
+    /*
+     * Sanity check, as this is a reused field.  If this is a true
+     * min_revision field, it will differ only in the bottom byte from the
+     * patch_id.  Otherwise, it's probably a checksum.
+     */
+    if ( (patch->patch_id ^ patch->min_rev) & ~0xff )
+    {
+        printk(XENLOG_WARNING
+               "microcode: patch %#x has unexpected min_rev %#x\n",
+               patch->patch_id, patch->min_rev);
+        return true;
+    }
+
+    return this_cpu(cpu_sig).rev >= patch->min_rev;
+}
+
 static int cf_check apply_microcode(const struct microcode_patch *patch,
                                     unsigned int flags)
 {
@@ -299,6 +337,14 @@ static int cf_check apply_microcode(const struct microcode_patch *patch,
         return -ENXIO;
     }
 
+    if ( !ucode_force && !check_min_rev(patch) )
+    {
+        printk(XENLOG_ERR
+               "microcode: CPU%u current rev %#x below patch min_rev %#x\n",
+               cpu, sig->rev, patch->min_rev);
+        return -ENXIO;
+    }
+
     hw_err = wrmsr_safe(MSR_AMD_PATCHLOADER, (unsigned long)patch);
 
     /* get patch id after patching */
-- 
2.39.5


