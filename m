Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 179B7C11A7F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 23:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151823.1482387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVWg-0001eN-FL; Mon, 27 Oct 2025 22:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151823.1482387; Mon, 27 Oct 2025 22:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVWg-0001aw-Bw; Mon, 27 Oct 2025 22:17:18 +0000
Received: by outflank-mailman (input) for mailman id 1151823;
 Mon, 27 Oct 2025 22:17:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuhB=5E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vDVWe-0001Ic-9j
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 22:17:16 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afef5a8b-b382-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 23:17:12 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so24869555e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 15:17:12 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475de57b156sm148785595e9.13.2025.10.27.15.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 15:17:11 -0700 (PDT)
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
X-Inumbo-ID: afef5a8b-b382-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1761603432; x=1762208232; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPm17Di3amUuRs7iaGe/NVQW8x+O/P1o19S+UioYfX4=;
        b=YPwluO88tbplUvDbaVvksuQo9tWa45DeX2bNtRXjXQpOURAJXwg6ms9io3jPlXNgpc
         1mKgVyJs1io66cBtQXG710TCJZCLaxrcp3z8yi8XbKEZxSCT/s6K98MpCrAEcoZ62+Lf
         DuC5KfiQoXa0qhvsZjcyaHTXZ2YiJ8pdmWPdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603432; x=1762208232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPm17Di3amUuRs7iaGe/NVQW8x+O/P1o19S+UioYfX4=;
        b=iezyh/hOw5C8SqEac8WHnypzIkagchbJgT5dG5AMD5zaZQD10MN449dc4HhJU1rkm7
         XgP/teE2ofnNlDDmSOnMUnhoqNsz3SFniQ3qU35ndC+T0e8lFnRKNFCCCtYw9pOxCMuf
         DB759KOFK6EmPYqplqvOwuQoQ1gAXe8eV+QM6hDXht2CMrVVE+SKXlDrWQ0DAww6ohQH
         mu1jZzo2hwNC6db7kOMUyOEQVlYI4CoGKidovjgnjSW7UGaVJEGRXDyWKRDbKXg6cG1w
         83rfCkubzeES3lXxpvhe9BRpACXQuEDPbHd8nmXqrU+6WpjPomz+Ppw2a8gqW8lnPeAU
         k0Qw==
X-Gm-Message-State: AOJu0YzuuMbf1WeqZySpvYHDAC5jep8yp7q8hHSgIBL6eSH/lWnjNiUx
	vTnuDokjut0X31WKR6qG5adxneYdyFBq7GP2Ogn+pKX0H7Ms/BP9BV2VTrFEqARi/HdeW6jnOPi
	3cZR9Ti1W4w==
X-Gm-Gg: ASbGncu/BF4eksZeRPnc+J/bOpg5dBpc0Q8cCP7fSRLo2YZzVKhz019XrTWRjCNmp/2
	q/7J0lGZQAqogEWxN+fEz0vdw1RDDYk7vHMxvCpyvVtJldVkMBhKMx0d5KDKR0kl2Qtv8JFMWK0
	UANOjh/MhNaMzADEG2Zp1ifcFtCEOEB+K4E3scxyji+tQkIOTrv4GtkuqEe+0lMPvZnD2k+Ogse
	O8iBgXZqrZWNRthiLLHhCUMZ5oEe/uQruCfF6ALLQzyCLTvO+UMjK9HzoX7bnJbskH57R9COzub
	GarX+bnhITGQsCPg1kQjC4M7dkToLpK6SR+RGXKB5rVPWgWHFFoyfbbcfyNNXYn2lsFxe1GtDIe
	VY8t9zjqQlf7fD2760ndF4wrCAneDTK8s5hgL4zuLQkZuFqyxGd7Xe/rLt/bcw4AoFb+v9sROeW
	5KBanaB2mfvR7eupuMXTjbTb+Bq0VSPHB8ujOQMEvLL6bS+p8kHbqXMYQ9EuRNIQ==
X-Google-Smtp-Source: AGHT+IGyGGwCvSA4pNerPIhK4CDh5ZKSm26JQnco8GOmtCPBU7D7ZzSoNfYoZcvIvLPZwMT7r050TA==
X-Received: by 2002:a05:600d:8354:b0:471:1717:421 with SMTP id 5b1f17b1804b1-47717e523e5mr7630105e9.19.1761603432062;
        Mon, 27 Oct 2025 15:17:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/5] x86/ucode: Cross check the minimum revision
Date: Mon, 27 Oct 2025 22:17:00 +0000
Message-Id: <20251027221702.3362552-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
References: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For Zen3-5 microcode blobs signed with the updated signature scheme, the
checksum field has been reused to be a min_revision field, referring to the
microcode revision which fixed Entrysign (SB-7033, CVE-2024-36347).

Cross-check this when trying to load microcode, but allow --force to override
it.  If the signature scheme is genuinely different, a #GP will occur.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Tweak comment
---
 xen/arch/x86/cpu/microcode/amd.c | 49 +++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 457810182480..ba03401c24c5 100644
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
@@ -270,6 +273,42 @@ static int cf_check amd_compare(
     return compare_revisions(old->patch_id, new->patch_id);
 }
 
+/*
+ * Check whether this patch has a minimum revision given, and whether the
+ * condition is satisfied.
+ *
+ * In linux-firmware for CPUs suffering from the Entrysign vulnerability,
+ * ucodes signed with the updated signature algorithm have reused the checksum
+ * field as a min-revision field.  From public archives, the checksum field
+ * appears to have been unused since Fam12h.
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
@@ -299,6 +338,14 @@ static int cf_check apply_microcode(const struct microcode_patch *patch,
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


